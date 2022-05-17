Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2FC952A395
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 15:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343631AbiEQNhb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 09:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347934AbiEQNh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 09:37:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1BDFE1834F
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 06:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652794648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=15idN99f0kdy1ioNBNYU0BPsvygdxflQgwoERNJQ43Y=;
        b=ZURkhzQYPwzS53EUQPxo58NJbPDZOKTQg2Jm/fgTCi/7VymnV+foI02FdssIsCobNA2Aa0
        YEcMOqKup5YGF7uS0ktOSudacxmfQWmOgAHMTZHLGvsOA9ScLQHv/CP/v1HWOGLR2bw7GP
        cIYVcxAGHkdBuGaBwY02NcvDkngiXW8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-sFHMKri0MEW7wfe_SwsuWQ-1; Tue, 17 May 2022 09:37:26 -0400
X-MC-Unique: sFHMKri0MEW7wfe_SwsuWQ-1
Received: by mail-qk1-f199.google.com with SMTP id 17-20020a370511000000b0069fd3b67d95so13705875qkf.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 06:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=15idN99f0kdy1ioNBNYU0BPsvygdxflQgwoERNJQ43Y=;
        b=HcICHTd5RslPfMROidPK3isukYPzodgfXJVDfcAYma740zvEtu1ZRZhwIUgunPaWXY
         hqRmEfXB/ptl0thBg3ILBn88mhQbIo9YDT6K3YI55AYh3BBfV91jmmgDPNYA5EpisSAU
         R/ex+NkyuAdKMPj/qv0lLaikqYdF/Sidw5jEn8owlr7L4HfeAoaV0pRu8YrukrJw5VKl
         6TfnjPaLnuAezJlGK5DNlPTXJGkwUHWEC3GKShxC0tI0TVHLkxNYyf17HTjaFORIMh1b
         UhkWzgZl1RlNNZTkCXOnJxjDih2e6MhNHvjerQfRYkG660kT7VkbD0JKheYTzkH/PfX+
         iI/A==
X-Gm-Message-State: AOAM5327jYM/oaYk/gpYZKyTLVbFLBzDkk4Tpz6KQfH237O8GW4xeK2y
        EB+pNKE5LJIIDkKlyEeRcZhD6d6gYOrj/Wg6LSwaY66pbEWfSakXQPWUA7CYuoq4kIi0SdRWGbD
        4Vs9sTexwv+rnm7VHHqnh3lsLlw==
X-Received: by 2002:ad4:5767:0:b0:461:c1f6:ed22 with SMTP id r7-20020ad45767000000b00461c1f6ed22mr12896921qvx.95.1652794646298;
        Tue, 17 May 2022 06:37:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWEvTdc+kiU6iEuRRrusAk77g3OL8TxkCv+0zd1U2QhUvkif8YQ3Jge5KtB/ogqo4y8GtRnQ==
X-Received: by 2002:ad4:5767:0:b0:461:c1f6:ed22 with SMTP id r7-20020ad45767000000b00461c1f6ed22mr12896886qvx.95.1652794646070;
        Tue, 17 May 2022 06:37:26 -0700 (PDT)
Received: from xps13 (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id h13-20020ac846cd000000b002f39b99f6a3sm7397355qto.61.2022.05.17.06.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 06:37:25 -0700 (PDT)
Date:   Tue, 17 May 2022 09:37:25 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] soc: qcom: Fix the id of SA8540P SoC
Message-ID: <YoOlFezJvkGnui32@xps13>
References: <20220513175849.4335-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513175849.4335-1-quic_ppareek@quicinc.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 13, 2022 at 11:28:49PM +0530, Parikshit Pareek wrote:
> Change the id of SA8540P to its correct value, i.e., 461.
> 
> Fixes: 76ee15ae1b13 ("soc: qcom: socinfo: Add some more PMICs and SoCs")
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> Reviewed-by: Eric Chanudet <echanude@redhat.com>
> Tested-by: Eric Chanudet <echanude@redhat.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

