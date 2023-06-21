Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE277390D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 22:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjFUUdv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 16:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjFUUdu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 16:33:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697B4EA
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 13:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687379582;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QiNuKgT2NeXOg5vJXpZnDkdkmlVyi9ytQ3mK8FSLR4A=;
        b=MeONj4zRmH6qYVLwVzOFZe7SYaSM8geLQdsrOY6pSHmG74AmFU+wSYPumKHAm5MeIn4qhN
        RayPHlNBuhQ+OSsVcW1yONjY7sdhpR8s4dPfAFvWAcpFdBbt7vBFw8xh9+r/0AXbYO66Co
        2hCzWfvmXXbp5WgW9ayC23i80rNudhs=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-n29PIaHgOKiIUIZ1jiRR0g-1; Wed, 21 Jun 2023 16:33:01 -0400
X-MC-Unique: n29PIaHgOKiIUIZ1jiRR0g-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6b46e5b7f6eso3731752a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 13:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687379580; x=1689971580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiNuKgT2NeXOg5vJXpZnDkdkmlVyi9ytQ3mK8FSLR4A=;
        b=HSSLkGbBnuXvA8D2jQgLIJNZhJC8/5oj4Mibz6s8DKguqHPHon4n3CAAdwGPRlX5Gv
         hP9VMYmQ52ZG6yG1i5VkFyvJPoe6JtHSXGEkN6SqhCXMqKssxrWC/kHgmPFI3p3Np+yc
         YobXibUXgsXvQU7ISmEFZpTL7iWprnwwnc15G4YkXiJRL+ysZG4mfvPQYXyzfXvkHPdd
         Jsid0fD+LE2qVg7CeSp8R9NNltFFPq7mEgJui/nr5XuBhvM6AFc4qiqZClkJL/JnUytF
         tQ9wtBeMhwWsm+rzjnRvoJLGy1gdr0dws20lBq1yoyo897V2giQ7EUGndJGsWz6b0ef3
         TVQA==
X-Gm-Message-State: AC+VfDxJo8Mo268/eENtcLI9rC5egOaxp9ehdm+Cl3u1FOuML4LDr6I1
        bBaQo9uG4IQcVPXfulOOQI941qk3aPWeY46HjZlSvbT9sCY9iA6qtWXCErAD3iL8l7EIkJ10ft6
        PVTMjpsr5uBXwSZQ4SeIj9ydVZw==
X-Received: by 2002:a9d:7d14:0:b0:6b5:84a3:7c76 with SMTP id v20-20020a9d7d14000000b006b584a37c76mr8776003otn.10.1687379580398;
        Wed, 21 Jun 2023 13:33:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6/QyxagZeJ6jvP7m3OfLMB8yOol/oPhXV6yt+xub0keV+EViMbbd47xd/ZrIkMhk7WImGh3w==
X-Received: by 2002:a9d:7d14:0:b0:6b5:84a3:7c76 with SMTP id v20-20020a9d7d14000000b006b584a37c76mr8775988otn.10.1687379580141;
        Wed, 21 Jun 2023 13:33:00 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::f])
        by smtp.gmail.com with ESMTPSA id n8-20020a0568301e8800b006b46b136155sm2279847otr.23.2023.06.21.13.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 13:32:59 -0700 (PDT)
Date:   Wed, 21 Jun 2023 15:32:57 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 2/2] phy: qcom-snps-femto-v2: add system sleep PM ops
Message-ID: <20230621203257.tvcubvn3xitzgnt5@halaney-x13s>
References: <20230605184455.34832-1-athierry@redhat.com>
 <20230605184455.34832-3-athierry@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605184455.34832-3-athierry@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 05, 2023 at 02:44:54PM -0400, Adrien Thierry wrote:
> Add the system sleep suspend and resume callbacks, reusing the same code
> as the runtime suspend and resume callbacks.

It would be nice (imo) to reference the downstream driver you used as a
reference if you spin a v3.

> 
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
> I'm still a bit confused as to what the difference is between
> suspend/resume PM ops and the struct usb_phy set_suspend() callback.
> Please tell me if I should be populating the latter instead.

My understanding is usb_phy is a legacy thing, and that the generic phys
are the way to go (which this is).

Looking at dwc3 for example, you can see it uses:

	phy_power_off(dwc->usb3_generic_phy);
	phy_power_off(dwc->usb2_generic_phy);

	usb_phy_set_suspend(dwc->usb3_phy, 1);
	usb_phy_set_suspend(dwc->usb2_phy, 1);

so it handles both the generic phy (like this) and the usb_phy.
This driver doesn't implement the power_off callback, but phy_power_off
is also pm_runtime aware, so calling phy_power_off in a controller still
achieves similar behavior (although I'm following right
phy_init/phy_exit also are pm_runtime aware, so I think it would be at
that point that the ops get called).

This all assumes a user enables pm_runtime in sysfs for this driver.

> 
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index ce1d2f8b568a..378a5029f61e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -179,7 +179,7 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>  	readl_relaxed(base + offset);
>  }
>  
> -static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> +static int qcom_snps_hsphy_do_suspend(struct qcom_snps_hsphy *hsphy)
>  {
>  	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY\n");
>  
> @@ -199,7 +199,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>  	return 0;
>  }
>  
> -static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> +static int qcom_snps_hsphy_do_resume(struct qcom_snps_hsphy *hsphy)
>  {
>  	int ret;
>  
> @@ -214,25 +214,25 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>  	return 0;
>  }
>  
> -static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
> +static int __maybe_unused qcom_snps_hsphy_suspend(struct device *dev)
>  {
>  	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
>  
>  	if (!hsphy->phy_initialized)
>  		return 0;
>  
> -	qcom_snps_hsphy_suspend(hsphy);
> +	qcom_snps_hsphy_do_suspend(hsphy);

Deserves its own patch, but can you return qcom_snps_hsphy_do_suspend/resume
as part of your clean up in this series?

>  	return 0;
>  }
>  
> -static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
> +static int __maybe_unused qcom_snps_hsphy_resume(struct device *dev)
>  {
>  	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
>  
>  	if (!hsphy->phy_initialized)
>  		return 0;
>  
> -	qcom_snps_hsphy_resume(hsphy);
> +	qcom_snps_hsphy_do_resume(hsphy);
>  	return 0;
>  }
>  
> @@ -518,8 +518,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
>  MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
>  
>  static const struct dev_pm_ops qcom_snps_hsphy_pm_ops = {
> -	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_runtime_suspend,
> -			   qcom_snps_hsphy_runtime_resume, NULL)
> +	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_suspend,
> +			   qcom_snps_hsphy_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(qcom_snps_hsphy_suspend,
> +				qcom_snps_hsphy_resume)
>  };
>  
>  static void qcom_snps_hsphy_override_param_update_val(
> -- 
> 2.40.1
> 

