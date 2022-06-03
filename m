Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6D7353CC1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jun 2022 17:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245401AbiFCPPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 11:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245405AbiFCPO4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 11:14:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2B9F050479
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jun 2022 08:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654269295;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KSS+WlIjCzxfASZfHJ/pG+nFg5xuEcmHlF7DakY9wuE=;
        b=IsinTjFKocoU3Ir/OHyQ6Oh5fbnyNiUT0IrjR3r/vh1Ebm70qJu6KsVg0TvWQPMS9Y/zK8
        hJsYRXG6abjPlOC3unxoSCr6yIlrOjV5D0LyTky8Ot7cF65FJGxD3z4jnTu33d4WGJxKo9
        D/hmP8DLKDqZfiLyTGT0W6Gx+tT+sfY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-udclCPTmOHyiwukZovgjTQ-1; Fri, 03 Jun 2022 11:14:53 -0400
X-MC-Unique: udclCPTmOHyiwukZovgjTQ-1
Received: by mail-qk1-f200.google.com with SMTP id b1-20020a05620a118100b006a36dec1b16so6184379qkk.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jun 2022 08:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KSS+WlIjCzxfASZfHJ/pG+nFg5xuEcmHlF7DakY9wuE=;
        b=MZRRAbRjsgp2R+q22DLRO3ge7Al6KmuwbpDZd+9lAF8/HAQIcQI4iTr+4lwTFqpMHT
         JMzvzczC0I0lyQ+F54B5yK7dfZDpjqWels1N3yeCteyQjvQ296irRsE3wtAkSPmukKje
         weafv+RYELHPZ5UMRIAa/k9TlNj/4ij/S7tKCR9HMp9hZvwJRZzz5J9dOQB8MwjlGQQZ
         eCgkhkqdbeQOJ/jTmmzEvXK6sLn/ct8bhkaTCMwF2P3IGWFfMwt2TNpXD8KkoEm1Nske
         MwO0MM3rqVFGSlSWBrupcu2WZ03dlgg8vCNwMclurEotUzqIaB1jms2RQzWZawidOp3F
         5YmQ==
X-Gm-Message-State: AOAM533Do4/7j5T9q7KREpShIkElxNCAoj8ziYBEQ0fj1m+vo5drrrqG
        OloKcRhGX5onwJ0Ar3qRna63cOD6Quc9TRo/sdJs9qTfgx9UEK+rTF8XXQpa8scemgKvGmErkVX
        s6BCD37/ISlFKYzYT/C/1yy1aRg==
X-Received: by 2002:a05:620a:1445:b0:6a3:9f13:7f10 with SMTP id i5-20020a05620a144500b006a39f137f10mr6753074qkl.736.1654269293269;
        Fri, 03 Jun 2022 08:14:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYV+OzB2BFz+1kTFY3RgS+1hrEcN6pQQortBLwObPtwEpeMeMFxrV3fG5J5vUdP1DDnfWMew==
X-Received: by 2002:a05:620a:1445:b0:6a3:9f13:7f10 with SMTP id i5-20020a05620a144500b006a39f137f10mr6753042qkl.736.1654269292985;
        Fri, 03 Jun 2022 08:14:52 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id m28-20020a05620a215c00b006a03cbb1323sm5009016qkm.65.2022.06.03.08.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 08:14:52 -0700 (PDT)
Date:   Fri, 3 Jun 2022 11:14:51 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] iommu/qcom: Index contexts by asid number to allow
 asid 0
Message-ID: <Ypola4mBuQ6zDLcz@xps13>
References: <20220527212901.29268-1-konrad.dybcio@somainline.org>
 <20220527212901.29268-6-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220527212901.29268-6-konrad.dybcio@somainline.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 27, 2022 at 11:29:00PM +0200, Konrad Dybcio wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> This driver was indexing the contexts by asid-1, which is probably
> done under the assumption that the first ASID is always 1.
> 
> Unfortunately this is not entirely true: at least in the MSM8956
> and MSM8976 GPU IOMMU, the gpu_user context's ASID number is zero.
> To allow using an asid number of zero, stop indexing the contexts
> by asid-1 and rather index them by asid.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

msm8974 will need this as well.

Reviewed-by: Brian Masney <bmasney@redhat.com>

