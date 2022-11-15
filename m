Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446F362993A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 13:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbiKOMvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 07:51:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbiKOMv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 07:51:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93CB27DEB
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668516626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=l9DCj0kCx4cYGdqfJpXlu7fgvdW5ocqgYyNocj0wf4U=;
        b=J2fpWOKXSN/93iGqKMgdCxnB/UkO3iqwnc5ybnySr/5zqI+sWyW86TxasjT8xvqq6trcsb
        IhGundZ2/Jzeq+FTbVK04MwbomcUZepdJDaR8rZd2lgHcpVB2kK9WS4dGoVpj69UjlpJIt
        aB/4g+IletNKfPA3f2ahx+iUKd4hdKI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-WnLfaXvQMqS_JNmai6q8KA-1; Tue, 15 Nov 2022 07:50:24 -0500
X-MC-Unique: WnLfaXvQMqS_JNmai6q8KA-1
Received: by mail-qt1-f198.google.com with SMTP id ew11-20020a05622a514b00b003a524196d31so10078293qtb.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:50:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9DCj0kCx4cYGdqfJpXlu7fgvdW5ocqgYyNocj0wf4U=;
        b=EqR0UAGO7fGC90gzvsxODDu4I2D3TyYwdxhUR/YZe3PCseHi7y3wX6g4M6Ha8s27Nr
         WDIRS+HMqq5YKXgFFoFFGPLRogRIwKjMXoq+MD1DhzgjbQacr9prKTKQ16OjiakDxynX
         TC3L7OmnjVK8WawGbR49dasPVZ5MhZp/z0JAAI0wKwMmD3HQFHRtraYfJr1uWZY5v49a
         soGvluLoxqWXrjOV1FAjjmdtB8nJV3cUMNfX18XUdVgUOKvd8xQ5z4bRje2sK5xQS0Ns
         fcH9dBs6K6HdnpqYTnpvRh+oDCav0G9J+iMsCmNSemuEk0/jSLRTZ9uOPWvik4767IVn
         NIXg==
X-Gm-Message-State: ANoB5plpIqxhe3uUOBcDiJlO65Jk3chM56bL8gi7x56GyTXI1zon/H2o
        Ls4YLO6XILkJA05B0IARJkpFhAB9zldtEwj67zpTHwt6IBv3Gb9VZGchQgQfCTWZ1D6MKG8UmhZ
        eXqIiqydwMx4Lj59aan6IdP/2NQ==
X-Received: by 2002:a05:622a:198a:b0:3a4:fa82:c3b8 with SMTP id u10-20020a05622a198a00b003a4fa82c3b8mr16554529qtc.261.1668516624434;
        Tue, 15 Nov 2022 04:50:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf53dlb3gmpGIvub1w7SAuwsd2MfqfG78wQcAtKtesih8S4x8a5qEDhjUdFAnArbQGs8s3g3JQ==
X-Received: by 2002:a05:622a:198a:b0:3a4:fa82:c3b8 with SMTP id u10-20020a05622a198a00b003a4fa82c3b8mr16554509qtc.261.1668516624214;
        Tue, 15 Nov 2022 04:50:24 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id f21-20020a05620a409500b006fa4a81e895sm8411248qko.67.2022.11.15.04.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:50:23 -0800 (PST)
Date:   Tue, 15 Nov 2022 07:50:22 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     andersson@kernel.org, johan@kernel.org, sboyd@kernel.org,
        agross@kernel.org, mturquette@baylibre.com,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: gcc-sc8280xp: add cxo as parent for three
 ufs ref clks
Message-ID: <Y3OLDj6xzOVjvEdV@x1>
References: <20221115102217.6381-1-quic_shazhuss@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115102217.6381-1-quic_shazhuss@quicinc.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 15, 2022 at 03:52:17PM +0530, Shazad Hussain wrote:
> Added parent_data as CXO for three UFS reference clocks named,
> gcc_ufs_ref_clkref_clk, gcc_ufs_card_clkref_clk and
> gcc_ufs_1_card_clkref_clk.
> 
> Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
> Link: https://lore.kernel.org/lkml/Y2Tber39cHuOSR%2FW@hovoldconsulting.com/
> Signed-off-by: Shazad Hussain <quic_shazhuss@quicinc.com>

Put this Link beneath the --- since Bjorn will add one that's specific
to your patch when he adds it to his tree.

With that change:

Reviewed-by: Brian Masney <bmasney@redhat.com>

