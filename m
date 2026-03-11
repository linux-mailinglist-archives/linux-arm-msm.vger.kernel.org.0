Return-Path: <linux-arm-msm+bounces-97087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHt9Aqj0sWl7HQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:03:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 555ED26B0AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 00:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 115D3306C45D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 23:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88AB639B952;
	Wed, 11 Mar 2026 23:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9OGqbBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC4336DA1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 23:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270181; cv=none; b=Uc1SHVjq/z1dRAZy804no0ggvTBQOC4twfK4tjYjYbVBOjCKAPU68kyuNOY/r4wwYyIzP2a3y/Hhf3qtEKL8DZa6EJqUyxrH9lTwlE+elqinZD4LD9+h68dyT8fZHnIOoKbFSct0QAsf2uJw2+/OTxm0JhkhKDwoXJLmBmlTfT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270181; c=relaxed/simple;
	bh=59eQRVfCv7e/0LRpztdSuln1uytuOC9fin5p5Kd0jS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWKJpuq3TvvhS0Mp2YuwhV0PvES1Wd+q521ICf8Im+wmKhfpTT/WPxhrHRyt0BVZGhfilPq3UPS1sC9gopNsRlzKeYfmbMUDIaZn1qlZiruXbxUBDaFHqGD/FCJbYnTW4+h36ACg8Rqufaa6fWNGgnLvMJgINEOat0FiHpm/z08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9OGqbBR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso3147405e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 16:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773270178; x=1773874978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91rIWBbGs1aKNKxqJ3UCP9ypQZSnAgeYdy2D4RNVFZw=;
        b=b9OGqbBRPE7uEH1GUNkBDMbugsSiMBGMAMuyTBTMQFgQaeDmkEKbLVQ32y9Dw0sMFH
         CJkt0n348i4fu/HfNBsk7jBeH5NQn3x1lyWkT3pBfgtxYp37S7pxSB5cUTE4hB0ASJRc
         PBYOLbSO3KIfs/8869p03YcNJbo/jp1xI6KU7RmrL3TZEdBQCSk2Kj4b8jG7LNEaCwyC
         UzbQrjmoEUlmyZJCAS5lrHwAOnjh9gqMil4P+ATiItVq6vz4yXNsXkvZgEoFpGZb36rz
         qA93pXf2kO8Pmx/WlW+HG2ZbnxSGpd7CydTwrZnm1UJ+sPV07Zjdy5Dox5FmLzDEjJ6H
         9UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773270178; x=1773874978;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=91rIWBbGs1aKNKxqJ3UCP9ypQZSnAgeYdy2D4RNVFZw=;
        b=g2FSCCyBuLvvFxvpf7iKExiqQpBoISsvVeXj8US8uo+Pttz0ewwdD2a3QdFtkrb8tH
         WVCDq+k3PHhARBZ94Qhm/pFYDBbTaWPJ8Mk2sSe5Eb6gGgRdu+PiWrwJ1P4lktaDx+0w
         tJjU3hMSD3dJ+ZV4jZ5ELbENwgZQJbCvJveB32aR+SSvAacRRTyTjDWh8tgNtCwe5U2p
         21Nxg3KJiRaYUevAQl7PxE0mfMp+LvQq4TIlByTftBR5/E5iv1t9uBPlcHRkFi/SB1PN
         hv4VI+mrk2/+S/MC+315FvkMeLjo0dJDZWVzpLQshIGnBmAsE/0RJqd/OoXvIGjqdKIM
         WyEw==
X-Gm-Message-State: AOJu0Yxd+QCDPDTq74uy7EV8OPdFpnInGVBof3rAez/rMd8MH1nZfntz
	s32v12ch1pAq/9Og3Fy6rxabsTzIUGIoG7Hia+Bnqq5n4sLr6NtbYd/p0IWuBCqPm6Q=
X-Gm-Gg: ATEYQzzFVC5UYvCfBqmtErItziuA7UzOG52cMvojnfZQj6Ug7j3oKk3PfH+CbDT+UTx
	yNdkUKK2llRqTlS0rIuMrxnWCw8T5D5H92VPd1dSYjMQWoxWYOf+0q9jusSO5b4ifaxQLnGLKOU
	GV48F832IIhs6o9aRvLv59heiz9Xr/G6lxaNpJCSpANXrxja2abhjqh/OoELtmpzTrOXbOf7xaM
	zDQWGqK9/u1HwlKBn6zC8jHvsrmj2+Ew6gRlWRj8DSMHN7g9iMTsqxh60X00rJ5ttxA52Kn/ERX
	5jXniqHJ4A8ez8RnqVCOHZmCgfndc37Yt1yF4uFYFZjIXsWnjGdO+pQiqoxirmxfqJzNc0J3R8L
	zhLCp/phQusxw/sDYZ5hiCP6IAhKR/CDEVwiIYO8I44wVQQ6OApLIbSnk1Te0ysC5QhegudIXiY
	aO+ZA0xvjsvWUIvJmK6Q9sIlg1/WVgAfcKIw==
X-Received: by 2002:a05:600c:c4b7:b0:485:3ff1:d5c5 with SMTP id 5b1f17b1804b1-4854b0a5669mr69863415e9.7.1773270178526;
        Wed, 11 Mar 2026 16:02:58 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.88.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a30b4bbsm30704795e9.9.2026.03.11.16.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 16:02:57 -0700 (PDT)
Message-ID: <d6d859a3-4137-4fb8-8b04-40abc86f4e33@linaro.org>
Date: Wed, 11 Mar 2026 23:02:56 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: usb: qcom,pmic-typec: Document
 vbus-detect-gpios property
To: Alexander Koskovich <AKoskovich@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
 <20260308-qcom-typec-shared-vbus-v1-1-7d574b91052a@pm.me>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260308-qcom-typec-shared-vbus-v1-1-7d574b91052a@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97087-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 555ED26B0AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/03/2026 23:20, Alexander Koskovich wrote:
> +  vbus-detect-gpios:

Should this be plural ?

arch/arm64/boot/dts/qcom/apq8096-db820c.dts:		pinctrl-0 = 
<&usb2_vbus_det_gpio>;
arch/arm64/boot/dts/qcom/apq8096-db820c.dts:		pinctrl-0 = 
<&usb3_vbus_det_gpio>;
arch/arm64/boot/dts/qcom/apq8096-db820c.dts:	usb3_vbus_det_gpio: 
pm8996-gpio22-state {
arch/arm64/boot/dts/qcom/apq8096-db820c.dts:	usb2_vbus_det_gpio: 
pmi8996-gpio6-state {

Seems a minor point

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

