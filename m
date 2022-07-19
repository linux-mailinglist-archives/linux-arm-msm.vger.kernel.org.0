Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E35157A854
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 22:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239627AbiGSUgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 16:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239841AbiGSUgN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 16:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 244D94F64D
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658262969;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=takPyX+c7DxSDI8v9MKZPYo25db1qJMbIDQOmjpNFXE=;
        b=GHwjq48i5iVoXmV8sVWnh9AYYehNpuvUzENSJK7tU99CWR4HGELWoz4sjrsV7qSO+kan0s
        qTQtp92I74wXMedoYFFeACcyx8gqqN83ecBcwhqey+AhhXsUQr95KLvP89kxr0J/E3fOB2
        lKCZFsuEW+LohxJdSdGHgt5mdNvlhy4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-rRXBG4lhMQ2_qJ6Z_-bo2w-1; Tue, 19 Jul 2022 16:36:07 -0400
X-MC-Unique: rRXBG4lhMQ2_qJ6Z_-bo2w-1
Received: by mail-qt1-f197.google.com with SMTP id bq10-20020a05622a1c0a00b0031ef98498a4so2461034qtb.19
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:36:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=takPyX+c7DxSDI8v9MKZPYo25db1qJMbIDQOmjpNFXE=;
        b=5EJvayeTgOnbMhPYUTsO8/tw5mKjajx2dO/jPYqjr3NZaDyLOjXL7tcAkUhB34RsE9
         0V9GBwUdJUfs/Ee20qurvAKRX+X6Is7T1E7qikq1uVpDW4x2Rnw3RIDvnWE2T/mWTeif
         l+BbfYK3mxYRVFkNZ+tY64yO9+2IPEEuGRk4iVtyy2d2qJAyc7jpJDJysk2L/msXa60z
         cmiSF7xzP/tLXJyiaPjsZ/WetRJlDRQQGtv05HjZrFr6JjVi/ZOVoApOb9mQ/Pmo0B+k
         ybqO4vWDbvEhzedERXPR1TCPYUlZs8pCjUBnZJZpYa8NX4/LEbZycQUstmdD4kIyDuTD
         Wl2w==
X-Gm-Message-State: AJIora8HdS996Pw63c9l4sN42OAuqwYjohTknZpiFwhDxtMqWn3k/aeb
        kXLZv1iJSYxsHKl7sr/E0ixDGqXg3e/ckPs4WpPY31yhvp1s0yyOIKq3hCehLg9GHE5O0ZWMNSP
        SMgRCC2nw2yTCOsYm+EOR6rDZuA==
X-Received: by 2002:a37:ccb:0:b0:6b5:e1ad:75b9 with SMTP id 194-20020a370ccb000000b006b5e1ad75b9mr9931092qkm.601.1658262967067;
        Tue, 19 Jul 2022 13:36:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tAzt2tTk4tcnbDcqODkuX1qe3mjaBF2On6EHRapv2Dkf+sudVlRQyXpLaaNySdqvHYRb1c+w==
X-Received: by 2002:a37:ccb:0:b0:6b5:e1ad:75b9 with SMTP id 194-20020a370ccb000000b006b5e1ad75b9mr9931079qkm.601.1658262966858;
        Tue, 19 Jul 2022 13:36:06 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a25cd00b006af20edff0csm15339630qko.58.2022.07.19.13.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 13:36:06 -0700 (PDT)
Date:   Tue, 19 Jul 2022 15:36:03 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i2c: qcom-geni: Use the correct return value
Message-ID: <20220719203603.o7bdp4vionxvcy2z@halaneylaptop>
References: <20220717035027.2135106-1-bjorn.andersson@linaro.org>
 <20220717035027.2135106-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717035027.2135106-2-bjorn.andersson@linaro.org>
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 16, 2022 at 08:50:25PM -0700, Bjorn Andersson wrote:
> The introduction of GPI support moved things around and instead of
> returning the result from geni_i2c_xfer() the number of messages in the
> request was returned, ignoring the actual result. Fix this.
> 
> Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 6ac402ea58fb..3bec7c782824 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -688,7 +688,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>  	pm_runtime_put_autosuspend(gi2c->se.dev);
>  	gi2c->cur = NULL;
>  	gi2c->err = 0;
> -	return num;
> +	return ret;
>  }
>  
>  static u32 geni_i2c_func(struct i2c_adapter *adap)
> -- 
> 2.35.1
> 

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

