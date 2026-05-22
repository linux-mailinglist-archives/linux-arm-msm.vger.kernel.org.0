Return-Path: <linux-arm-msm+bounces-109181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JHKGWr7D2qCSAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:44:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BE45AFA23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67BFD300EC5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6711A360EC2;
	Fri, 22 May 2026 06:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eihtN+XC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1133382EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432292; cv=none; b=DEmqUUsTT2ch7FXDKXBq42QZW7Mt44EYwxchqWg4+Xp/O4jwlyspCJ5rwVHUN5j91ppW6SFgXZ8xttghVi4GcTMMZ9AFANb7gPDiqzQD0MLKbPRjmreFOgYnOrcA6kMVSes0bl/5zlZHWQ8gEYbWFVAY4hNxtj3wf39lmlXQSHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432292; c=relaxed/simple;
	bh=YlxlLOkHFi3oFizfrqzDHonhmv+/OQU5qqoMhf/FIQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/x+vpt1Tn2cl/a217Mi6yC0e/8Kc1+KJJKo/5Ux6o2Rp23NE1Yu1y+BGyT5L54WZnYu96HJI8ijuCQjNk+SNL4Lu4bB4KKGweoB8M6BqCgfOxsBzq9BkzvJ59DJd2chmulT9JsenRkRAP9Y+tOBoDQuj4gRBKZxrIkJhRRvhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eihtN+XC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4903fd19957so8374005e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 23:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779432289; x=1780037089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYQd1NpG4Phq0nb70yqYM1eItmr7QKZZscpcBlKX1kE=;
        b=eihtN+XCwT0vZtRB0RXfvWXvfX9Vjkm4bXEvu0D0o7sOCTz/Fixf9uJKdHb48Ohn2N
         yFW2aYIMVJ7K8v1NHJoZplOzyILI7cHfby+1NDK5jOPj/8x7lPmfXVuu7ECTzXBgcuk+
         TuxoMdw270nY7HK4gjc/8MOj9eDdl2AEDzvjpJue28ksVXxCEsIypD68YwglRvmJNcN+
         MaIZSm2RWxvkv5I4g2YoUjDxlZ7K1kWix1rLphteAVHgiywBNYFn/7M+FQiVJVEKypm0
         KnFlgru55yUSfKoBP+pKjSIsAmBmaID87kHpt6MFGAQI2AcQgJT0TfVHqYkjUmQ4EAy1
         +iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779432289; x=1780037089;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYQd1NpG4Phq0nb70yqYM1eItmr7QKZZscpcBlKX1kE=;
        b=NHdElwBaP9udCopj1cJHDQPbkeP7k/0+2nmKFxfgN3jw6glChI5/+LXatm/lpTdvDw
         by6z/7hUsSoQwlBe8a+PvydcmD7PKgDDuf6amrWtYni+MjK47aJ4B2mpecAiNWfUMAGQ
         LEDFN1PpaO5HefTu7bacsb0UWw/X9dJD3TIMYgEobeHh37KPdseu3RL5CiJDq2g5dlFU
         6JMbfWYc0cSThwzGP7U6pB+Hak6/Ana30P1kG/bGSe9ljRlGF/grgaO952VRRySmx8XO
         0MbA6wSW26iTgPiDXBJwgfLSYaUrW28qL+ay+IAjfDdAaS6EqyE2BBf1wpnAu4t7zjeM
         sJLQ==
X-Forwarded-Encrypted: i=1; AFNElJ91SfoJsiR8GXAALXT6ioeHG15gy4LqLfcv3KnS2I8Is+CxjhwSWKgJZvAqpSBDs7Nm7kTIqYB2k4kRQBj0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Lf0LnQg1cEEACVb/JWu5+vC2Rg/7VSIATADH4lZjiJzrjbg5
	XzdOsnsDO/YSiU+WGKPjPnensBsEWB4D90gCFxZNyMO6n0r0R4A4oopq35CQz9EE/Nw=
X-Gm-Gg: Acq92OGOy+LNLCM0Gghlmaf/HbI93B5JsovmnlRyf8uOqr8RVwwDMIXymEGU7Zz2Q5V
	jVBc6WdatSPy7dq9CQ8H5d8u/0x4PE2rrRYpCG3TkDEbTnuZB1Ju/w1w81MkasKfhlLtg6wX3tk
	EQRzgWlZmN4q3vOrCQdu+X4Q3x3I/ChFiBJSTy7d5tCsFZZbXMCOHqvAON8WXTBWcZdtbxwLbjV
	AjWlDD5pI2WC2327BGkWgb0gS0OGkzA2jKzA45TRP2fZi/achIOvXKhzfkxUzoqQDuTX1pRaTWr
	WaB6CP6uFL2Z3WDtqevVj4pFatJ5QO9TqdvArwR3r4wNqqUhy3FF+XGBrAp8XGl4skg4I//RX8A
	mCxO4psDpk3vyGgUxgZ+jEr0DtIjiv86lPC1DjBI1rcpWueOrL8tEFoateuGfov6EFc16nflcTI
	QtF514Op6GUQKjeXokvDP12PS+4KIHoVUEx2SYt209iliPXCG9ukH5NtUI4fZfC5AbF408C9JCH
	kddnoDuJrr16MAyIQ==
X-Received: by 2002:a05:600c:4f0b:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-490426a479fmr24824925e9.15.1779432289279;
        Thu, 21 May 2026 23:44:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:192b:8d21:b456:cb51? ([2a01:e0a:106d:1080:192b:8d21:b456:cb51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454e38d6sm21819665e9.7.2026.05.21.23.44.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 23:44:48 -0700 (PDT)
Message-ID: <340451f1-f397-4eb9-b6ff-8c6ae1bcefcb@linaro.org>
Date: Fri, 22 May 2026 08:44:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 USB3 SuperSpeed
To: Graham O'Connor <graham.oconnor@gmail.com>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260522060645.4399-1-graham.oconnor@gmail.com>
 <20260522060645.4399-7-graham.oconnor@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260522060645.4399-7-graham.oconnor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109181-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:replyto,linaro.org:mid,linaro.org:dkim,0.0.0.0:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 73BE45AFA23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 08:06, Graham O'Connor wrote:
> Enable the USB3-A port by configuring the USB HSPHY with required
> regulator supplies and the QMP combo PHY with correct lane assignments
> for this fixed USB-A connector.
> 
> The QMP combo PHY shares lanes between DisplayPort and USB3 SuperSpeed.
> Configure port@0 with two endpoints: endpoint@0 for DP output (lanes
> 0-1) connected to the HDMI bridge, and endpoint@1 for USB3 SS output
> (lanes 2-3). Remove the orientation-switch property as this is a fixed
> USB-A connector with no orientation switching.
> 
> Add a usb-a-connector node wiring the HS and SS paths to the DWC3
> controller and QMP PHY respectively. Set dr_mode to host as this is
> a fixed host-only USB-A port.
> 
> Tested on Radxa Dragon Q6A (QCS6490) with USB3 SuperSpeed confirmed
> via lsusb showing 5000M link speed.
> 
> Signed-off-by: Graham O'Connor <graham.oconnor@gmail.com>
> ---
>   .../dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 71 +++++++++++++++++++
>   1 file changed, 71 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index e8ad6e666..c16c3664e 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -1198,3 +1198,74 @@ &mdss_edp {
>   &mdss_edp_phy {
>   	status = "disabled";
>   };
> +
> +&usb_1_hsphy {
> +	vdda-pll-supply = <&vreg_l10c_0p88>;
> +	vdda18-supply = <&vreg_l1c_1p8>;
> +	vdda33-supply = <&vreg_l2b_3p072>;
> +	status = "okay";
> +};
> +
> +&usb_1_qmpphy {
> +	vdda-phy-supply = <&vreg_l6b_1p2>;
> +	vdda-pll-supply = <&vreg_l1b_0p912>;
> +	/delete-property/ orientation-switch;
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/delete-node/ endpoint;
> +
> +			/* DP output - connected to hdmi-bridge */
> +			usb_dp_qmpphy_out_dp: endpoint@0 {
> +				reg = <0>;
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&hdmi_bridge_in>;
> +			};

Previous patch needs this change to work, please squash.

Neil

> +
> +			/* USB3 SS output */
> +			usb_dp_qmpphy_out_usb: endpoint@1 {
> +				reg = <1>;
> +				data-lanes = <2 3>;
> +				remote-endpoint = <&usb3_con_ss_in>;
> +			};
> +		};
> +	};
> +};
> +
> +/ {
> +	usb3_con: connector {
> +		compatible = "usb-a-connector";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				usb3_con_hs_in: endpoint {
> +					remote-endpoint = <&usb_1_dwc3_hs>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				usb3_con_ss_in: endpoint {
> +					remote-endpoint = <&usb_dp_qmpphy_out_usb>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&usb3_con_hs_in>;
> +};
> +
> +&usb_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +};


