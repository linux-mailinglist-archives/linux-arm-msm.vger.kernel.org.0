Return-Path: <linux-arm-msm+bounces-21949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE808FEE27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 16:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3BEA1F22AFE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 14:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7101990C8;
	Thu,  6 Jun 2024 14:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krbfiljV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA1B197523
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717683596; cv=none; b=JVnwxeCPK/b4DDSJwjIvenM0aNsWwW35e1+T21ZpZ72pJebekmEzo3zOsv9C04aLM3UZR5xHzcaOhnbRlsqMoUYciDIlGht7VUf8oTD+mxAseXDWvrLleCmN0gkqQEUDkU5XazdhFY5LhGVYEZtUFysfpakIa7Lg7YMNNZMgtlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717683596; c=relaxed/simple;
	bh=inbxow1jvIujmbpq76lxYmPp5pHmNjrrCPtpGYojC60=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L8BJCdAXDNhR5HDtFZ76DP/1Bih2+EQK2H0azOk5+3s4Tpya3hm0hZPFqXQIEhNEiQkDX0u+c3HXo1o/HmQnn1HNiYZzsHh8yZ5f7x5fIvwjy3EG9K0HjiKaomiQy6BhCB4ze+pUFoR9+cDmMjGH6tDEtaOZWcd8RtbKZJr7Kmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=krbfiljV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35e5604abdcso1384022f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717683593; x=1718288393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36iJiWPjD6SuqWw0fPcJGiqZW0CSrSFa1RF7xICeHVs=;
        b=krbfiljVqEswoQiNPozan3bAJvOTEsRQ81sEqcSZpazTHedzG+b/dBd5RGJGPjJBP0
         kfVSALynXWtM8ZG4wDeBMBdjKOF3xj4u8d2CybkcpjMeUR8ybv1xS+zhfubwY9Csg2Zm
         lC4mQbfHdnGqKc2PCb9lRySe9WMD6bX7iC8PJd7QihekEZPEWOy4j1X0xVpig5nxwD03
         wAgqlY5E2JcU1TQIxCHddLghbv+RfjRTHFNSE8tJHHdzafO6g0tdC3NWyjyQksz004mI
         OT3X/sujsP2EhxYXE85bE3eDqEVKjQltyI1VD/kKDGjeCzDtpDKf6vEJiB+N44ADCbGd
         Fp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717683593; x=1718288393;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=36iJiWPjD6SuqWw0fPcJGiqZW0CSrSFa1RF7xICeHVs=;
        b=FU8SskuGS7YBucIb4e5XRbIKmWOLsmrhQxOjfuzRZon+KX4BHshQoPFa3LDGETubGI
         xHMfcNPKP3Cg5aktEfCZZmOQiTjkN1YsQTEfWNDbdZ7SPd7OdC9JJaXcekJMAbGHVbqh
         EW6aRjEksitXr75hTPI9pfv84gqtUiwedmFhtH0fUhR5cBW+sFsH2vgTjmcyysfCE2Rb
         ZY/KtiMgTTYf78QXukYm4uSEAESW41DxwOOxQ6WsPnOgw7KZpgdRhGvUkx3U5EEOtBR7
         xHQwiJ7lPkuXDW2k0jLreoAHNjQPsU4sJ/44/uqFOG2Dqw3uaskfD2rlHVWu0i1KY66H
         KA9w==
X-Forwarded-Encrypted: i=1; AJvYcCVVoIWcICC6S7Bv2WuBu6OhgxpKTEpjs/XDenTKB1tCIPeGA4SSr5lL0dJT2wmwI9+wBj8+ZoIA6WrwuWQ3yk4zjZpbTv3gQxZtrSRdNw==
X-Gm-Message-State: AOJu0Yz6bSK/UdRfGAJFrSn5QHNjGudQuXWlkzeJ08YRz5A6i+KDxH2a
	yjjXxl2lQIHtoaTrFxU0P2crRzEFGzZwm7Zhl5iF+Wu0FtKn10bTfi5pc3bH27d7trY9pHQfsbi
	a
X-Google-Smtp-Source: AGHT+IHH4QeBm1WgAvOZdSJ5CLoMFu8LRgw4cTXRi0ooO8Q3Ak2T7S1SjZMKgar96ypnBMCR0zMUOw==
X-Received: by 2002:a5d:6d8f:0:b0:34c:7ed4:55a with SMTP id ffacd0b85a97d-35ef0ddb092mr3388718f8f.33.1717683592559;
        Thu, 06 Jun 2024 07:19:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6d66:dc6b:6c6b:f7aa? ([2a01:e0a:982:cbb0:6d66:dc6b:6c6b:f7aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c7dafsm23719935e9.35.2024.06.06.07.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 07:19:52 -0700 (PDT)
Message-ID: <168caaed-b43c-4663-b35e-c010b58b310a@linaro.org>
Date: Thu, 6 Jun 2024 16:19:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/7] phy: qcom: qmp-combo: register a typec mux to
 change the QPHY_MODE
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
 <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-4-a03e68d7b8fc@linaro.org>
 <qgitwducxmox6vac6v3pmjxgrbizd2tk2fgxds4pjqinr2cefd@lbsrbit4xsdi>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <qgitwducxmox6vac6v3pmjxgrbizd2tk2fgxds4pjqinr2cefd@lbsrbit4xsdi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/05/2024 10:57, Dmitry Baryshkov wrote:
> On Mon, May 27, 2024 at 10:42:36AM +0200, Neil Armstrong wrote:
>> Register a typec mux in order to change the PHY mode on the Type-C
>> mux events depending on the mode and the svid when in Altmode setup.
>>
>> The DisplayPort phy should be left enabled if is still powered on
>> by the DRM DisplayPort controller, so bail out until the DisplayPort
>> PHY is not powered off.
>>
>> The Type-C Mode/SVID only changes on plug/unplug, and USB SAFE states
>> will be set in between of USB-Only, Combo and DisplayPort Only so
>> this will leave enough time to the DRM DisplayPort controller to
>> turn of the DisplayPort PHY.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 123 ++++++++++++++++++++++++++++--
>>   1 file changed, 118 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index 788e4c05eaf2..b55ab08d44c2 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/reset.h>
>>   #include <linux/slab.h>
>>   #include <linux/usb/typec.h>
>> +#include <linux/usb/typec_dp.h>
>>   #include <linux/usb/typec_mux.h>
>>   
>>   #include <drm/bridge/aux-bridge.h>
>> @@ -1527,6 +1528,10 @@ struct qmp_combo {
>>   
>>   	struct typec_switch_dev *sw;
>>   	enum typec_orientation orientation;
>> +
>> +	struct typec_mux_dev *mux;
>> +	unsigned long mux_mode;
>> +	unsigned int svid;
>>   };
>>   
>>   static void qmp_v3_dp_aux_init(struct qmp_combo *qmp);
>> @@ -3353,17 +3358,112 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
>>   	return 0;
>>   }
>>   
>> -static void qmp_combo_typec_unregister(void *data)
>> +static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
>> +{
>> +	struct qmp_combo *qmp = typec_mux_get_drvdata(mux);
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	enum qphy_mode new_mode;
>> +	unsigned int svid;
>> +
>> +	if (state->mode == qmp->mode)
>> +		return 0;
>> +
>> +	mutex_lock(&qmp->phy_mutex);
>> +
>> +	if (state->alt)
>> +		svid = state->alt->svid;
>> +	else
>> +		svid = 0; // No SVID
>> +
>> +	if (svid == USB_TYPEC_DP_SID) {
>> +		switch (state->mode) {
>> +		/* DP Only */
>> +		case TYPEC_DP_STATE_C:
>> +		case TYPEC_DP_STATE_E:
>> +			new_mode = QPHY_MODE_DP_ONLY;
>> +			break;
>> +
>> +		/* DP + USB */
>> +		case TYPEC_DP_STATE_D:
>> +		case TYPEC_DP_STATE_F:
>> +
>> +		/* Safe fallback...*/
>> +		default:
>> +			new_mode = QPHY_MODE_COMBO;
>> +			break;
>> +		}
>> +	} else {
>> +		/* Only switch to USB_ONLY when we know we only have USB3 */
>> +		if (qmp->mux_mode == TYPEC_MODE_USB3)
>> +			new_mode = QPHY_MODE_USB_ONLY;
>> +		else
>> +			new_mode = QPHY_MODE_COMBO;
>> +	}
>> +
>> +	if (new_mode == qmp->init_mode) {
>> +		dev_dbg(qmp->dev, "typec_mux_set: same phy mode, bail out\n");
>> +		qmp->mode = state->mode;
>> +		goto out;
>> +	}
>> +
>> +	if (qmp->init_mode != QPHY_MODE_USB_ONLY && qmp->dp_powered_on) {
>> +		dev_dbg(qmp->dev, "typec_mux_set: DP is still powered on, delaying switch\n");
>> +		goto out;
>> +	}
>> +
>> +	dev_dbg(qmp->dev, "typec_mux_set: switching from phy mode %d to %d\n",
>> +		qmp->init_mode, new_mode);
>> +
>> +	qmp->mux_mode = state->mode;
>> +	qmp->init_mode = new_mode;
>> +
>> +	if (qmp->init_count) {
>> +		if (qmp->usb_init_count)
>> +			qmp_combo_usb_power_off(qmp->usb_phy);
>> +		if (qmp->dp_init_count)
>> +			writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
>> +		qmp_combo_com_exit(qmp, true);
>> +
>> +		/* Now everything's powered down, power up the right PHYs */
>> +
>> +		qmp_combo_com_init(qmp, true);
>> +		if (qmp->init_mode == QPHY_MODE_DP_ONLY && qmp->usb_init_count) {
>> +			qmp->usb_init_count--;
> 
> Can we move this clause next to actually powering USB part off?
> 
>> +		} else if (qmp->init_mode != QPHY_MODE_DP_ONLY) {
>> +			qmp_combo_usb_power_on(qmp->usb_phy);
>> +			if (!qmp->usb_init_count)
>> +				qmp->usb_init_count++;
>> +		}
>> +		if (qmp->init_mode != QPHY_MODE_USB_ONLY && qmp->dp_init_count)
>> +			cfg->dp_aux_init(qmp);
> 
> Does dp_init_count reflect the actual necessity to bring up the DP part
> up? Maybe we can unify the code between this function and
> qmp_combo_typec_switch_set()? I don't like that it is unobvious whether
> these two functions will results in the same state or not depending on
> the order in which they are being called.

Yep, I'll try to use a common function, so any switch/mux call would use
the same process, and I can probably simplify it.

Thanks,
Neil

> 
>> +	}
>> +
>> +out:
>> +	mutex_unlock(&qmp->phy_mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static void qmp_combo_typec_switch_unregister(void *data)
>>   {
>>   	struct qmp_combo *qmp = data;
>>   
>>   	typec_switch_unregister(qmp->sw);
>>   }
>>   
>> -static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
>> +static void qmp_combo_typec_mux_unregister(void *data)
>> +{
>> +	struct qmp_combo *qmp = data;
>> +
>> +	typec_mux_unregister(qmp->mux);
>> +}
>> +
>> +static int qmp_combo_typec_register(struct qmp_combo *qmp)
>>   {
>>   	struct typec_switch_desc sw_desc = {};
>> +	struct typec_mux_desc mux_desc = { };
>>   	struct device *dev = qmp->dev;
>> +	int ret;
>>   
>>   	sw_desc.drvdata = qmp;
>>   	sw_desc.fwnode = dev->fwnode;
>> @@ -3374,10 +3474,23 @@ static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
>>   		return PTR_ERR(qmp->sw);
>>   	}
>>   
>> -	return devm_add_action_or_reset(dev, qmp_combo_typec_unregister, qmp);
>> +	ret = devm_add_action_or_reset(dev, qmp_combo_typec_switch_unregister, qmp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mux_desc.drvdata = qmp;
>> +	mux_desc.fwnode = dev->fwnode;
>> +	mux_desc.set = qmp_combo_typec_mux_set;
>> +	qmp->mux = typec_mux_register(dev, &mux_desc);
>> +	if (IS_ERR(qmp->mux)) {
>> +		dev_err(dev, "Unable to register typec mux: %pe\n", qmp->mux);
>> +		return PTR_ERR(qmp->mux);
>> +	}
>> +
>> +	return devm_add_action_or_reset(dev, qmp_combo_typec_mux_unregister, qmp);
>>   }
>>   #else
>> -static int qmp_combo_typec_switch_register(struct qmp_combo *qmp)
>> +static int qmp_combo_typec_register(struct qmp_combo *qmp)
>>   {
>>   	return 0;
>>   }
>> @@ -3609,7 +3722,7 @@ static int qmp_combo_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_node_put;
>>   
>> -	ret = qmp_combo_typec_switch_register(qmp);
>> +	ret = qmp_combo_typec_register(qmp);
>>   	if (ret)
>>   		goto err_node_put;
>>   
>>
>> -- 
>> 2.34.1
>>
> 


