Return-Path: <linux-arm-msm+bounces-108293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBQXNTqLC2p1IwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 23:57:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C015742A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 23:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 062CA3041878
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112BF39DBEF;
	Mon, 18 May 2026 21:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNrFffrh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F362C390990
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 21:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141414; cv=none; b=XXpM/3SVxHEZJLkKmJgMjvBayn+IaWc96Z36Db0pYy9uoUPcvesD/0XkIKfTeyM7yEdyRP4BIXHavOqdFd7R1++gxh9J/kFbismFzZAvVGIcNC0SIbwjUKzOcuJhFdDZfL0Da5omKqEm+KvIZwHs8gdSQQdWgV9ZKxnQaA3whKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141414; c=relaxed/simple;
	bh=Izd+ajGb6hhShbhE86/HUzaqPbJZjDWmI8YZcDks5uU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3bJSJTRNdPftOxjUkirx0F+/FKBMKUPZskhAmV7Bx/ltHfVUK8uWonhJMMuCy8k1+b/T45IVgJnL8DLlFDqklPTBv3XZVTnpbDiJEZvQdEzeCxzYVzTolCPOyua2/Zln0cTOSLwtYe//6qpXoDeAaBcIeQ7+k/TUwVaJm7D69w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNrFffrh; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d75312379so2528031f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 14:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779141409; x=1779746209; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJv2EIPjGK3glu7utsDpkLohNn1a3Ary13YAALySZ3c=;
        b=yNrFffrhTQicJDkxQNZjHKD7cPqdOo1u2a043wNdE5j9BJmW2kpOahJJcZ8FBrHzfb
         qdB0KaCS5m4kBY7RDrUZOGgHMZrgqNZCU2LxEAT/mDKJ678HSqlzagaE576fZOPFlaeU
         K0XPQrXT/xxqFfzoaAkVnpaZkkCFbhJX6yXym7EMKORwLi8g4+QtEw/vPhh9mQt+CkK1
         nQ0T+eOaJaqUil+fYfu2Fcvmxeoq/I7B+xITtwZ6v3gW9btGQ5xnJcnn4kZ58bs8tYPY
         sBvvqoKY+A5w15z2ay2xpscwe2Jm1LTgJLluwJomAQvBCvVfcJ0rWGye7A2/t60uakKK
         SBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141409; x=1779746209;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJv2EIPjGK3glu7utsDpkLohNn1a3Ary13YAALySZ3c=;
        b=ewFPO8KKBZxK1uwqJMeQF7hgPm4D4+eBVSv7VeQR+dTKWy1VdeHVD4A5n1gHA2hD2m
         i7D7jiY1q5kjhEdEADm9g4lNXSHM9VnvhMp4mKVoM11rt76DWdtKCD/OpMv1f5OnMMt0
         Ti5h581OqNb05N0DUF6XCmW7LVBOyEUPQo/747g/AYqipQBwUSb6XoncmeiOb44khzcG
         MldzpOFP4Ltg3ta5HMAPSp2aRNSQr0V4ihD9c9M7vorD0cVp2Egf0gVxlqqQ5ge5EFbp
         nkT8IeLMHLLcRf+TqhclGnvfakMCy8FnuHY3CIqjjHomFDn4xKoScwwyi1Gzgy1pPy/6
         K8FQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wKs+/1F8zD1Q85iAawTa8iGZ77omjcQ94RtQ07VYYj+jkbFno/nJbpL6vVlKXUC8YSbbKOlQZbs8AFUzG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrie+cgNkSjOnjiw1pgCLC4+kFMuTYCnMoQ10dVQlqPSGB1vb6
	Ue0FoBIdX73/V1edEcc4QAVKdLK6ZD12yi8nzS/Exom7N5Uf0TxqLWVSHkiOMMeoswshufoRHU4
	5yhGvZEk=
X-Gm-Gg: Acq92OHkXdv6BqosxMSGYYszY9v8aKw6uXNO71q/eewK2i7F0uDkHLLHBG7M8QQlIdP
	RRD3d/tATB2IwpwwOs7ISKPezrRiqhvxubLxcDaOmmayyJa7GzRaY3Cyqjwdr3f0rkJT4Tisu9b
	wxCtiHhrhGi/7JH1focjVe1ZoqBxhMyEZlxNs1sf3BMrv2hdAdJKlmcd1OqDLf5szD0NASIud8f
	J8jGPf1tgu0gFPyHEmAQaqtiDJdy2ApXN7dRKOLzXUfZLu/Y5XfBnmZiVzZ38yHaSl9GpNSDolM
	paSFjLDa02U5x/cba8mHklIO9OkCpL8hfwzuti++H0EaXqnOppqFhK8PuCgNrVIPcbWS0iIO8KO
	t9GN/53ZU5a1hmQxN0BFdD/MOl2cNL2Cc6rh9Qz1u/NmaKvsG7bBa3EEYqOQWccRibWklwvPDrX
	XeQZD53gYwiVJuyMWTGbyJWW7MTE9kwGJ5
X-Received: by 2002:a05:6000:22c1:b0:43d:7606:5a47 with SMTP id ffacd0b85a97d-45e5b73a043mr28591671f8f.2.1779141409371;
        Mon, 18 May 2026 14:56:49 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768c4fsm40379314f8f.8.2026.05.18.14.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 14:56:48 -0700 (PDT)
Message-ID: <3170e034-5780-4b85-9d25-f55126f4a2cb@linaro.org>
Date: Mon, 18 May 2026 22:56:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: regulator: qcom,usb-vbus-regulator: add
 PMI8998
To: taygoth <taygoth@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
References: <cover.1779127507.git.taygoth@gmail.com>
 <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2a3c65bbfb85d944110b14b40ef375f238ca3932.1779127507.git.taygoth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108293-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 54C015742A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/05/2026 21:22, taygoth wrote:
> The Qualcomm PMI8998 PMIC integrates a USB OTG VBUS boost converter
> inside its SMB2 charger block at offset 0x1100. The OTG control
> register layout (CMD_OTG at +0x40, OTG_CURRENT_LIMIT_CFG at +0x52,
> OTG_CFG at +0x53) matches the PM8150B SMB5 block, so the existing
> qcom_usb_vbus-regulator driver can drive it without code changes via
> compatible cascade.
> 
> Verified by inspecting the downstream qpnp-smb2 driver and reading
> live register values on a OnePlus 6T (sdm845-oneplus-fajita) running
> mainline Linux.
> 
> Signed-off-by: taygoth <taygoth@gmail.com>
> ---
>   .../devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml   | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> index fcefc722ee2a..9e2e2c8f9539 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,usb-vbus-regulator.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,pm6150-vbus-reg
>                 - qcom,pm7250b-vbus-reg
>                 - qcom,pmi632-vbus-reg
> +              - qcom,pmi8998-vbus-reg
>             - const: qcom,pm8150b-vbus-reg
>   
>     reg:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

