Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA1776A07AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 12:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233183AbjBWLtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Feb 2023 06:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbjBWLtA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Feb 2023 06:49:00 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1CFA4616E
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 03:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677152896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0hd9dV+UdVIpy8dlJkRFhNqjTWUaHLmUV4zgNY9iUPE=;
        b=ZjUfHAzLNgjZO6m8s6maUjPyi3lfJ/dZ2vBmmEU8wn2GU38V1PaFTlWgPM2P57NlcOb/AY
        gVd9KD30y+DrLYp+3rvsPRjjdFl9VjDM7LQ6L+kVBiXFo+ahO2fkJsSKfEzhKX+710oit2
        IavGoEVd6EVf/vMnZf8V60i+9TnJRsM=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-478-EjFm9NgQPsK4FOYH0lutjg-1; Thu, 23 Feb 2023 06:48:15 -0500
X-MC-Unique: EjFm9NgQPsK4FOYH0lutjg-1
Received: by mail-il1-f200.google.com with SMTP id y2-20020a929502000000b0031707c6b348so219346ilh.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Feb 2023 03:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hd9dV+UdVIpy8dlJkRFhNqjTWUaHLmUV4zgNY9iUPE=;
        b=4d45gMH4VKsb4Pn9zhrXMdoKvDUOjlW5DYwCi5JUIvgjXW9iydB/4HngWAnqWeVnFk
         wc4FsVbu87nFMM/sMxsyBKqhml6KsTP3dHcIYFPZdeFeMpI8zO8E7XwDwyFwFanBCkvi
         mWR93bP/Xed7LKnv9NldY3WVqzu0CtM9k9Haavy3D++4mPuikvaj4wW49VXGjF9PzTja
         Zq9oSaJe5pO46NGM7YxvtMMpYDOHirsto/LJpdWat4okEElfQ7hClNrUv2X+pR65Psgr
         5CLgqttJJoH4YDnU5op3V5HeC0U+lwEyqSE+qPIPu42WVvc/yfxqew1l2JITHxLdQHpJ
         8dQg==
X-Gm-Message-State: AO0yUKUWCufdvR081mIfP9DqVhJ9iv9I3a0aXreUHvtIDHniXglHiOSF
        JznIdIdmsq7mt8KTX2pM1c8QJ9c4h/DzTb5w4IbHC/NaFqoVX/FIPkDpGYWxCke9WSSsTIYdTmk
        7vb5po5f/ZuYXsxWPFA33YfmE6A==
X-Received: by 2002:a05:6e02:b42:b0:310:e6a5:d7b1 with SMTP id f2-20020a056e020b4200b00310e6a5d7b1mr10484992ilu.15.1677152894802;
        Thu, 23 Feb 2023 03:48:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/+vAX2+nfbz1ymcBx68tMHE3V7jGVV1AQ0g/eIMMJrgsmlsT7/9gh8ILjsIKH75Vx183cQ9w==
X-Received: by 2002:a05:6e02:b42:b0:310:e6a5:d7b1 with SMTP id f2-20020a056e020b4200b00310e6a5d7b1mr10484976ilu.15.1677152894568;
        Thu, 23 Feb 2023 03:48:14 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id r10-20020a02c6ca000000b00363c4307bb2sm3299697jan.79.2023.02.23.03.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 03:48:13 -0800 (PST)
Date:   Thu, 23 Feb 2023 06:48:12 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] firmware: scm: Modify only the DLOAD bit in TCSR
 register for download mode
Message-ID: <Y/dSfKGK3JPPS+Cj@x1>
References: <1676990381-18184-1-git-send-email-quic_mojha@quicinc.com>
 <1676990381-18184-3-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1676990381-18184-3-git-send-email-quic_mojha@quicinc.com>
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

On Tue, Feb 21, 2023 at 08:09:39PM +0530, Mukesh Ojha wrote:
> CrashDump collection is based on the DLOAD bit of TCSR register.
> To retain other bits, we read the register and modify only the DLOAD bit as
> the other bits have their own significance.
> 
> Originally-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>  drivers/firmware/qcom_scm.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 51eb853..c376ba8 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -419,6 +419,7 @@ static void qcom_scm_set_download_mode(bool enable)
>  {
>  	bool avail;
>  	int ret = 0;
> +	u32 dload_addr_val;

Minor nit if you happen to need to send out a v2: put in reverse
Christmas tree order.

>  
>  	avail = __qcom_scm_is_call_available(__scm->dev,
>  					     QCOM_SCM_SVC_BOOT,
> @@ -426,8 +427,16 @@ static void qcom_scm_set_download_mode(bool enable)
>  	if (avail) {
>  		ret = __qcom_scm_set_dload_mode(__scm->dev, enable);
>  	} else if (__scm->dload_mode_addr) {
> -		ret = qcom_scm_io_writel(__scm->dload_mode_addr,
> -				enable ? QCOM_SCM_BOOT_SET_DLOAD_MODE : 0);
> +		ret = qcom_scm_io_readl(__scm->dload_mode_addr, &dload_addr_val);
> +		if (ret) {
> +			dev_err(__scm->dev,
> +				"failed to read dload mode address value: %d\n", ret);
> +			return;
> +		}
> +
> +		ret = qcom_scm_io_writel(__scm->dload_mode_addr, enable ?
> +				dload_addr_val | QCOM_SCM_BOOT_SET_DLOAD_MODE :
> +				dload_addr_val & ~(QCOM_SCM_BOOT_SET_DLOAD_MODE));

Should the dload_mode_addr variable be renamed to something else? I'm
not sure what else is in that register.

Brian

