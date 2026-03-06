Return-Path: <linux-arm-msm+bounces-95845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCekHAbpqmkTYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:47:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3D1223063
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 15:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1FC230254C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 14:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E8D3921EA;
	Fri,  6 Mar 2026 14:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w/Pi37k+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C11A3382FC
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808448; cv=none; b=WCXm778KCU88CgJU36Ttx/9al7JXdyGN8w9i8MCB4fjwENR0MFEZP0HBP/a8FhSUknsUF7OdnkwJWubC6+d8a5ltN1zsuJSM665L1NcCSTKTM5XwRrYZ53ts6musrr0+csFkdZTC9bO7HYsG/LjpJpBs2hwAGkBLri6lg1RDng0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808448; c=relaxed/simple;
	bh=lHU4p6O5PhOBjkv8UhxZJvcTBnLTNQoJwXygxMD73Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gp0XBDOmF1q54v3UAfXoCOTB3OtHGVcibUznu9WSgHeXtm+0EUmPcp425MRBBblXKj9WLooesAMrHe3v0AXvWxxKLW10WJ69pdkesfj5RduMnuAbly1jXY1Jt4c7/BTHozzdE3FPezbq76QjDBaR/37ZJploT16Z0OZspjn7rRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w/Pi37k+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4833115090dso96210955e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 06:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772808445; x=1773413245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3XCaVwMs6jiaEA7h2Q92YjViLmR/AitujSLMg3tv7Y=;
        b=w/Pi37k+lQ8Oe/kaerGniUKykC0AL1Uj+im10rsbJelKzKAjFRojhq6qGRKexFNuyd
         CWW9oI20jvVc6v90ON4aZCofOhVNo6RroyjUMfTlyL4sfRJinTov/ztVYSQvyyrn/zp1
         Kp2b2Gey2UJP2a0lGHMzLyLQhfo34ty08ldAEMwfWXaMu7fJrObnZp/ga9/ZyZuBjhmM
         DdRmDN/KCDICQkSQv1QD9Xu6VEuepHiPxKd25RkapZ49qFiYevhrLWewIFEJbDem3DAo
         d0KuqSC81VOB8O9Gi1hOyfkZYc18DzY13Mg14Ws/a7b2SPSOAEsBpxJa4FYBl3qdsh+J
         R2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772808445; x=1773413245;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3XCaVwMs6jiaEA7h2Q92YjViLmR/AitujSLMg3tv7Y=;
        b=sq26kJqcwAuHk9Llz+nW80g1J/pjueXFGDLZsgX2gQstfdMYmhObegCkopx1LkuzD5
         coVvooBJzzymyjwP1iD57G6PIjbq9T25ycK+wVm10MyF23k45t8VE+IwlIw+48he6uG1
         HBdHZHOksiTUVDus9sAOfq49TsVVmZ6qYP1Q8b9yVXYKIOdLdWPA59fgTlpe2nS8KUAM
         H4e4NVIIdGAqJO28FvgrUNLZ6FoZ0hTf1DXJ5uWSaNYzOjbbp29IAVwJfqw0LbUtjLfz
         clOxFopP51T2I6nawHzDcC0LPT+VdWE31MRuGbEXCy7H7sC/qQD4FKtbm0tkVCUGyWS8
         QhMw==
X-Gm-Message-State: AOJu0YxpLEJ8o8rR2sAd3pWST4Il47ozEsvEywVzrXGroIYdlfhR8Akx
	sv1IUd3UyGtRdFWNDMgDd8IDuqG+T55NsUqL6Jz3XtbCZjJBx5GLxRAxQw12ruz3m28=
X-Gm-Gg: ATEYQzzskisgWCLZdcfyeeN9+/T/khMXGZnzEdYfJCxO5qKtRELdoVQk59G93PYBJ+m
	LnBx2mhgiCOidjB0+a9ikl8UbaIgGNCvRtq9/4k1x2Cqsem22ck1YqGRYY7HuP/g3etfUXGJoNZ
	NS1+Sq2taTy09zcSZXsSnne766JYmk0UH/F6sIrB69kTswbAJ/exTqrriX93REXjWIMjr2Kn/Qq
	5lw7a+VbWxAD0jK3sMbcD1cE4W2fVgNRriuoCu9fPhfQ3+Q5sTgvgtHmRVDnldo/IiWZi09i56R
	S0YOEWep8SMI1Ud1EQDCBi9iCRaweKctFsnAV9EOAJVXGDm6vFEHfA+KQBB5X3+I3tUex018C9p
	TaKmT6tiACwmMxhFOl8UZL+WeVUFzObc2l4W/6vm1cW2e39WD1TFA/he6k2fppxco/M1U0Hq/iB
	/PAFTTCJh0xGmHSFFt7qZU9zvVMlToFuOoEhQWbJMMjp0nVIaKyIh0qMWGvgWujM1ltZ6+11UF0
	b54
X-Received: by 2002:a05:600c:3acf:b0:483:b505:9db4 with SMTP id 5b1f17b1804b1-48526978d8fmr37553345e9.31.1772808444635;
        Fri, 06 Mar 2026 06:47:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:cbfe:649:7f17:8b95? ([2a01:e0a:106d:1080:cbfe:649:7f17:8b95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a13sm116190505e9.11.2026.03.06.06.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 06:47:24 -0800 (PST)
Message-ID: <7fcbf142-f2c6-4b9e-bb63-befa553aceff@linaro.org>
Date: Fri, 6 Mar 2026 15:47:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Fix SVID=DP && unconnected
 edge case
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Jack Pham <jack.pham@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260306-topic-pgaltmode_fixup-v1-1-ec154b2d8e89@oss.qualcomm.com>
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
In-Reply-To: <20260306-topic-pgaltmode_fixup-v1-1-ec154b2d8e89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BC3D1223063
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95845-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:replyto,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/6/26 12:20, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The commit referenced in Fixes started evaluating the value of
> alt_port->mux_ctrl before checking the active SVID. This led to
> drm_aux_hpd_bridge_notify() no longer being called for the 'DP unplug'
> case.
> 
> Perhaps somewhat interestingly, the firmware sends a notification with
> SVID=DP, mux_ctrl=MUX_CTRL_STATE_NO_CONN and pin_assignment=0 on
> unplug. 'pin_assignment' was previously interpreted as a bitfield
> excerpt from the second byte of the DP pg_altmode payload (and stored
> as an u8).
> 
> That value is used in pmic_glink_altmode_sc8280xp_notify(), decremented
> by 1 (DPAM_HPD_A). Previously, this would result in an u8 underflow
> that would rollover to 0xff (which prior to the Fixes patch would have
> caused a pmic_glink_altmode_safe() and 'disconnected' bridge
> notification). That check was removed, without a replacement.
> 
> Resolve this issue by making sure the SID=DP && mux_ctrl=NO_CONN combo
> once again results in a HPD bridge notification.
> 
> Fixes: 0539c5a6fdef ("soc: qcom: pmic_glink_altmode: Consume TBT3/USB4 mode notifications")
> Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/soc/qcom/pmic_glink_altmode.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index d0afdcb96ee1..b496b88842a2 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -350,15 +350,17 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
>   
>   	typec_switch_set(alt_port->typec_switch, alt_port->orientation);
>   
> -	if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN) {
> -		pmic_glink_altmode_safe(altmode, alt_port);
> -	} else if (alt_port->svid == USB_TYPEC_TBT_SID) {
> +	if (alt_port->svid == USB_TYPEC_TBT_SID) {
>   		pmic_glink_altmode_enable_tbt(altmode, alt_port);
>   	} else if (alt_port->svid == USB_TYPEC_DP_SID) {
> -		pmic_glink_altmode_enable_dp(altmode, alt_port,
> -					     alt_port->mode,
> -					     alt_port->hpd_state,
> -					     alt_port->hpd_irq);
> +		if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN) {
> +			pmic_glink_altmode_safe(altmode, alt_port);
> +		} else {
> +			pmic_glink_altmode_enable_dp(altmode, alt_port,
> +						     alt_port->mode,
> +						     alt_port->hpd_state,
> +						     alt_port->hpd_irq);
> +		}
>   
>   		if (alt_port->hpd_state)
>   			conn_status = connector_status_connected;
> @@ -368,6 +370,8 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
>   		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
>   	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
>   		pmic_glink_altmode_enable_usb4(altmode, alt_port);
> +	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN) {
> +		pmic_glink_altmode_safe(altmode, alt_port);
>   	} else {
>   		pmic_glink_altmode_enable_usb(altmode, alt_port);
>   	}

This looks fishy, because you had:

if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN)
	pmic_glink_altmode_safe()
else (blah)
	...
else (alt_port->svid == USB_TYPEC_DP_SID)
	pmic_glink_altmode_enable_dp
else (blah)
	...
else (blah)
	...

So what's the difference with :


if (blah)
	...
else (alt_port->svid == USB_TYPEC_DP_SID) {
	if (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN)
		pmic_glink_altmode_safe()
	else
		pmic_glink_altmode_enable_dp
}
else (blah)
	...
else (blah)
	...
else (alt_port->mux_ctrl == MUX_CTRL_STATE_NO_CONN)
	pmic_glink_altmode_safe()


Before, if mux_ctrl was MUX_CTRL_STATE_NO_CONN, it would set to safe mode whatever the svid,
now it's either in the DP case or at the end.

I don't see the difference here, except if your desire is to ignore
the MUX_CTRL_STATE_NO_CONN for USB_TYPEC_TBT_SID and MUX_CTRL_STATE_TUNNELING.

But it doesn't match the commit message at all.

Neil

> 
> ---
> base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
> change-id: 20260306-topic-pgaltmode_fixup-6b488960e355
> 
> Best regards,


