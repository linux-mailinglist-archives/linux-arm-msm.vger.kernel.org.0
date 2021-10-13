Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEE042CE22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 00:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhJMWdX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 18:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231605AbhJMWc7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 18:32:59 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09736C061774
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:30:48 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id j8so1360656ila.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 15:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mJEJy/XKVebTRWEFhBoUg5hB4iE5guJPNjW3VycdfDo=;
        b=MtfXplLE9NejlrA1yvIgArZaULnf+RQYYlFukjeatq1vavuDnXV0fcuhbFKSF0qFyC
         AVMTJdUu7awhuqgymvt/4uyNsQ19WizGC5A486MBteq4joEKEyYo2YgeGmqSumVMm18V
         ODz2hKQ0T4zIoqwWmdY2K9x0tTia4PQHCMx+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mJEJy/XKVebTRWEFhBoUg5hB4iE5guJPNjW3VycdfDo=;
        b=lJAhmjdK9JKgyFEhsP81xLoAW+YIqAetsGEhBeVcE925/meoJW5hiHmiHl4kP+fa1+
         gYl1a+spe0bbKZSmxywNGYWSl6fKy67h0GzFk6PQx3JLwwqRJri8hsKlTi+BYYRYHiy/
         opR+CAqwM2gex+d9b2ObjgOWK1BbYUhiEqaDtr8c+5tvbZtUsF6/du4jpAo/2VHB3HR3
         iGPk/i+pHwdIKBLduEVq6FTMZCg20C9v9/z1wgam8XTlmUso2QRjjViCJYduZBDQxJIN
         rJFcg8llDlnmYnmZACDWZlUq78uuirSu08HxJktthatAwhGYZMGMcpXEa3wX3CT4B3c4
         YS9Q==
X-Gm-Message-State: AOAM530agO5UsnT8BHZbcLpCxT3PRraI65FgZ0i5Srk7xxWgonfIIdG6
        JdDgegDL/iGfJgg0NvWL+aWaLQqstDcuJg==
X-Google-Smtp-Source: ABdhPJzt/WfIQZR9SQDV6ZzR5solQYRio+9ujxFX38bouv/FX+1Bb/SvpjxT3g0EU8He8jM1Q3EUCw==
X-Received: by 2002:a05:6e02:1d17:: with SMTP id i23mr1302609ila.205.1634164247052;
        Wed, 13 Oct 2021 15:30:47 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id l20sm372166ioh.34.2021.10.13.15.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Oct 2021 15:30:46 -0700 (PDT)
Subject: Re: [RFC PATCH 15/17] net: ipa: Add IPA v2.6L initialization sequence
 support
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, elder@kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
References: <20210920030811.57273-1-sireeshkodali1@gmail.com>
 <20210920030811.57273-16-sireeshkodali1@gmail.com>
From:   Alex Elder <elder@ieee.org>
Message-ID: <d7073ebb-03cd-bf2e-52fd-27cafe525a01@ieee.org>
Date:   Wed, 13 Oct 2021 17:30:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210920030811.57273-16-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/19/21 10:08 PM, Sireesh Kodali wrote:
> The biggest changes are:
> 
> - Make SMP2P functions no-operation
> - Make resource init no-operation
> - Skip firmware loading
> - Add reset sequence

The only comments I have are not very major, so I'll wait
for a later review to suggest that sort of fine tuning.

					-Alex

> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>   drivers/net/ipa/ipa_main.c     | 19 ++++++++++++++++---
>   drivers/net/ipa/ipa_resource.c |  3 +++
>   drivers/net/ipa/ipa_smp2p.c    | 11 +++++++++--
>   3 files changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index ea6c4347f2c6..b437fbf95edf 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -355,12 +355,22 @@ static void ipa_hardware_config(struct ipa *ipa, const struct ipa_data *data)
>   	u32 granularity;
>   	u32 val;
>   
> +	if (ipa->version <= IPA_VERSION_2_6L) {
> +		iowrite32(1, ipa->reg_virt + IPA_REG_COMP_SW_RESET_OFFSET);
> +		iowrite32(0, ipa->reg_virt + IPA_REG_COMP_SW_RESET_OFFSET);
> +
> +		iowrite32(1, ipa->reg_virt + ipa_reg_comp_cfg_offset(ipa->version));
> +	}
> +
>   	/* IPA v4.5+ has no backward compatibility register */
> -	if (version < IPA_VERSION_4_5) {
> +	if (version >= IPA_VERSION_2_5 && version < IPA_VERSION_4_5) {
>   		val = data->backward_compat;
>   		iowrite32(val, ipa->reg_virt + ipa_reg_bcr_offset(ipa->version));
>   	}
>   
> +	if (ipa->version <= IPA_VERSION_2_6L)
> +		return;
> +
>   	/* Implement some hardware workarounds */
>   	if (version >= IPA_VERSION_4_0 && version < IPA_VERSION_4_5) {
>   		/* Disable PA mask to allow HOLB drop */
> @@ -412,7 +422,8 @@ static void ipa_hardware_config(struct ipa *ipa, const struct ipa_data *data)
>   static void ipa_hardware_deconfig(struct ipa *ipa)
>   {
>   	/* Mostly we just leave things as we set them. */
> -	ipa_hardware_dcd_deconfig(ipa);
> +	if (ipa->version > IPA_VERSION_2_6L)
> +		ipa_hardware_dcd_deconfig(ipa);
>   }
>   
>   /**
> @@ -765,8 +776,10 @@ static int ipa_probe(struct platform_device *pdev)
>   
>   	/* Otherwise we need to load the firmware and have Trust Zone validate
>   	 * and install it.  If that succeeds we can proceed with setup.
> +	 * But on IPA v2.6L we don't need to do firmware loading :D
>   	 */
> -	ret = ipa_firmware_load(dev);
> +	if (ipa->version > IPA_VERSION_2_6L)
> +		ret = ipa_firmware_load(dev);
>   	if (ret)
>   		goto err_deconfig;
>   
> diff --git a/drivers/net/ipa/ipa_resource.c b/drivers/net/ipa/ipa_resource.c
> index e3da95d69409..36a72324d828 100644
> --- a/drivers/net/ipa/ipa_resource.c
> +++ b/drivers/net/ipa/ipa_resource.c
> @@ -162,6 +162,9 @@ int ipa_resource_config(struct ipa *ipa, const struct ipa_resource_data *data)
>   {
>   	u32 i;
>   
> +	if (ipa->version <= IPA_VERSION_2_6L)
> +		return 0;
> +
>   	if (!ipa_resource_limits_valid(ipa, data))
>   		return -EINVAL;
>   
> diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
> index df7639c39d71..fa4a9f1c196a 100644
> --- a/drivers/net/ipa/ipa_smp2p.c
> +++ b/drivers/net/ipa/ipa_smp2p.c
> @@ -233,6 +233,10 @@ int ipa_smp2p_init(struct ipa *ipa, bool modem_init)
>   	u32 valid_bit;
>   	int ret;
>   
> +	/* With IPA v2.6L and earlier SMP2P interrupts are used */
> +	if (ipa->version <= IPA_VERSION_2_6L)
> +		return 0;
> +
>   	valid_state = qcom_smem_state_get(dev, "ipa-clock-enabled-valid",
>   					  &valid_bit);
>   	if (IS_ERR(valid_state))
> @@ -302,6 +306,9 @@ void ipa_smp2p_exit(struct ipa *ipa)
>   {
>   	struct ipa_smp2p *smp2p = ipa->smp2p;
>   
> +	if (!smp2p)
> +		return;
> +
>   	if (smp2p->setup_ready_irq)
>   		ipa_smp2p_irq_exit(smp2p, smp2p->setup_ready_irq);
>   	ipa_smp2p_panic_notifier_unregister(smp2p);
> @@ -317,7 +324,7 @@ void ipa_smp2p_disable(struct ipa *ipa)
>   {
>   	struct ipa_smp2p *smp2p = ipa->smp2p;
>   
> -	if (!smp2p->setup_ready_irq)
> +	if (!smp2p || !smp2p->setup_ready_irq)
>   		return;
>   
>   	mutex_lock(&smp2p->mutex);
> @@ -333,7 +340,7 @@ void ipa_smp2p_notify_reset(struct ipa *ipa)
>   	struct ipa_smp2p *smp2p = ipa->smp2p;
>   	u32 mask;
>   
> -	if (!smp2p->notified)
> +	if (!smp2p || !smp2p->notified)
>   		return;
>   
>   	ipa_smp2p_power_release(ipa);
> 

