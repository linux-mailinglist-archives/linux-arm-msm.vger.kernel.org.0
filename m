Return-Path: <linux-arm-msm+bounces-109036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFVLDunzDmq+DgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:00:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6B75A466B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4B653028B41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649213C9EE9;
	Thu, 21 May 2026 12:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7ZINqLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A583C5857
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364824; cv=none; b=cbxmFMSYGV/xJQ3P9HtkZm2QWyu8+H8v6xLlFkD+IMjGzxGM6yGHEQwvi48JsVbNAWjzIH/Z7TTBm9e7TBl6kXJdwyB8vRVp+bmZeAAGRTUwRg74i6+iAh+T98W7oJSxMu0JjrDtTFbkpx/DgpxWY29FcoccyvWUjIORDE4zdWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364824; c=relaxed/simple;
	bh=SHgxTl7i8ZJcoJsANiAFTcbeJAToHEACN55Qh8i2i6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaeWkWWqmMSZRA1XSZSlZN0LjJk8WpiSNHA6kkzlpIACYIHCpP7BtqjGIigW9TWiM4uVlFLD+pIzZmxSUE2+Qhy8ZQWTH21aqVIax7NMSbcR80n0R3jfX90lTLVA8IFahXk59LC8UUFfw+ScFXyZWuj2ZqjskKxWw6Cv7oTgE6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7ZINqLK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso2081485e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779364819; x=1779969619; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CyUjlgC7rWY0SffOj02D7tXJ5nKvMClnXbMF17mpGVU=;
        b=d7ZINqLKcsoJJl4EjKgsrg18vH31GFXr1KmhFECK6tWPNn40mMStdVdxg4Ke+RphC3
         q3h5ftgS1phZ+UHdRp7zcRAoi37uphimrxE2NUZDJ+jrmbMWt0ta1+yaSC3EPye/HwIK
         cGsUSq1NBHUiR8FOSJfITsU4iVJrmcBQyqd5EstJ4eNojhUBGKkcyDDk0gUaMFFM42LD
         QnAJkfKL1RXRq14Bw5qNJY/z8tM7XSE8/tpgb3+s5PJHlqlXwKlcyD7FhuvQ44/qGX/u
         U6kRVuvAAFp5WC5TNnJd+mdrit8Zavv63GzfURsnUvAR6rb5jDkuvX+3AekW6wcos8q2
         YBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364819; x=1779969619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CyUjlgC7rWY0SffOj02D7tXJ5nKvMClnXbMF17mpGVU=;
        b=jHWXVGUhRq6NioXBXpN5lACTprzKKWvcIQeD7CyhxmtgYA/0OAVB1eclU4EQM5GFoI
         /dd16CyMx7KK5emFKcv0SGDm+mRUANYV24AK3nvURAFEH/ryOsD6R8LK0+lJ/DKFCHJo
         l6gSEWEpVk92Y6OS1IMsgB4SyGZJi1awqzEd3jRht+iAGau+SvQwgiZ3bNMnxvOkaxbA
         Lyhx/5eEzE8HooRmyi/Vq7f79Y21cgrF51phd789wocyPVRcaauKtI75xSdmB/FP1FqZ
         tfbQvtIhcd8PBZy9YPRL7QwK7mQtDCAMxgQLeN2p1+w9F5vHo13eeilY9ayhPjGfWWob
         gBLA==
X-Forwarded-Encrypted: i=1; AFNElJ+VLxtyv79yt+uHg65k3OqdiIBeYp+8LljMucQX+eABkMC1BELAwo4NSDaJroxI4dLex6DNRPWEQYVmucXv@vger.kernel.org
X-Gm-Message-State: AOJu0YwjM2JAwkrkIobGaPAJcottsSWtN3olGm6dmHJzmwr+1G3zXQ7p
	t7KfNMWy1PrPlvCtsQrqg048XrtwPZmTkLVHSDPmeIE+2d0/v4hA3xZRNI5Swkj51Wo=
X-Gm-Gg: Acq92OFUpBWY/O7dRGuKjJw3ctVJc9cpT+uZggI4ZYK/YHxIF9L4Ja1BuFbYGosENvE
	dBsDbnUIgF2+lMCj3zI5wNb2skmdyYI94LQmOYv4VVkXPhXkwVWmC+16PwL2v58p3ImfSoLxIBk
	E0dnkfWULoqsB+Hgk2AH30qmGWlv5/7Du8WI1K/fGeUKLhREz5u0ZusUXx5Jj2itUzcLAiqCzjF
	l7k6TjMpUyYwv+yPoQWFFpTC5EDq+9ZiCVRe3Y6nl9ikbUZjbENuhZzU2xIgMcgX6MY0HDPKNHR
	VQtAyXdUI+vVq5nPyn01enD8E3jv2pWtDmXXhoWaudNI70EJgw+hGDCwAU7Mh0zaqG8ii97AuPW
	aKrSfrbiAM80onEkNhQdkIn+oodMXC2legnQAL0fofrDBbqCtOv99rD0pcH3Mo50qOJlhEXVldY
	cuTnc0UDY95JiREx0yZYkOgV613WHP+Kee7LeFi2haooni
X-Received: by 2002:a05:600c:4fc7:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-490360ddce0mr34321265e9.27.1779364819051;
        Thu, 21 May 2026 05:00:19 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7dd9e6sm2386503f8f.16.2026.05.21.05.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:00:18 -0700 (PDT)
Message-ID: <5cb46913-9aa5-4a12-b18f-5eccb6ca861b@linaro.org>
Date: Thu, 21 May 2026 13:00:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-combo: track whether the cached
 typec_mux mode was committed to hardware
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, val@packett.cool, laurentiu.tudor1@dell.com,
 alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-3-mike.scott@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260521010935.1333494-3-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-109036-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 9B6B75A466B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 02:09, Michael Scott wrote:
> qmp_combo_typec_mux_set() updates qmp->qmpphy_mode (the cached state)
> unconditionally, but only reprograms hardware when qmp->init_count is
> non-zero. If pmic_glink_altmode (or any other typec_mux consumer)
> calls into the PHY before DWC3 has performed phy_init() -- a real
> ordering observed during testing of USB-C role-switch enablement on
> Snapdragon X (X1E80100) -- the cache transitions away from the
> probe default QMPPHY_MODE_USB3DP but the hardware is never touched.
> 
> Subsequent calls (for example on partner detach, where TYPEC_STATE_SAFE
> also resolves to QMPPHY_MODE_USB3_ONLY in the !DP-SVID branch) then
> match the cached mode and the function bails out early with:
> 
>    qcom-qmp-combo-phy faXX000.phy: typec_mux_set: same qmpphy mode, bail out
> 
> leaving the lane mux in whatever configuration it powered up in. On
> the Dell Latitude 7455 this manifests as the SS lanes being left in
> the default state when the first altmode notification arrives during
> DWC3 probe, with the function bailing out on every subsequent attach.
> 
> Track separately whether the cached mode has actually been committed
> to hardware. The bail-out optimization is only safe when the cache
> truly reflects the hardware:
> 
>    - qmp_combo_typec_mux_set(): bail only when the cached mode matches
>      and was committed; clear the committed flag whenever the cache is
>      updated, set it again after a successful reprogram inside the
>      init_count-guarded block.
> 
>    - qmp_combo_com_init(): set the committed flag at the end of a
>      successful init, since com_init() programs registers from the
>      cached qmpphy_mode.
> 
> No behavioural change on platforms where typec_mux_set never fires
> before phy_init -- committed remains true through normal operation.
> 
> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 25 +++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 0db200292642..e28bc1cc7a78 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2295,6 +2295,7 @@ struct qmp_combo {
>   	struct mutex phy_mutex;
>   	int init_count;
>   	enum qmpphy_mode qmpphy_mode;
> +	bool qmpphy_mode_committed;
>   
>   	struct phy *usb_phy;
>   	enum phy_mode phy_mode;
> @@ -3754,6 +3755,9 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>   	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>   			SW_PWRDN);
>   
> +	/* com_init() just programmed registers from qmp->qmpphy_mode. */
> +	qmp->qmpphy_mode_committed = true;
> +
>   	return 0;
>   
>   err_disable_clocks:
> @@ -4509,9 +4513,22 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
>   		new_mode = QMPPHY_MODE_USB3_ONLY;
>   	}
>   
> +	/*
> +	 * Fast-path bail only when the cached mode is also known to be
> +	 * committed to hardware. The cache may be ahead of the hardware
> +	 * if a typec_mux_set arrived while the PHY had not yet been
> +	 * initialised (init_count == 0); in that case the cache update
> +	 * below was the only thing that ran, and we still need to drive
> +	 * the registers when the PHY does come up.
> +	 */
>   	if (new_mode == qmp->qmpphy_mode) {
> -		dev_dbg(qmp->dev, "typec_mux_set: same qmpphy mode, bail out\n");
> -		return 0;
> +		if (qmp->qmpphy_mode_committed) {
> +			dev_dbg(qmp->dev,
> +				"typec_mux_set: same qmpphy mode (committed), bail out\n");
> +			return 0;
> +		}
> +		dev_dbg(qmp->dev,
> +			"typec_mux_set: same qmpphy mode but uncommitted; reprogramming\n");
>   	}
>   
>   	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
> @@ -4523,6 +4540,7 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
>   		qmp->qmpphy_mode, new_mode);
>   
>   	qmp->qmpphy_mode = new_mode;
> +	qmp->qmpphy_mode_committed = false;
>   
>   	if (qmp->init_count) {
>   		if (qmp->usb_init_count)
> @@ -4551,6 +4569,9 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
>   			if (qmp->dp_init_count)
>   				cfg->dp_aux_init(qmp);
>   		}
> +
> +		/* Reprogram complete; cache now reflects hardware. */
> +		qmp->qmpphy_mode_committed = true;
>   	}
>   
>   	return 0;

Can we not make the commit to hardware atomic from the perspective of 
the caller ?

i.e. use a workqueue and a completion timeout when setting ?

---
bod

