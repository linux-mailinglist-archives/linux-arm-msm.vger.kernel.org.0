Return-Path: <linux-arm-msm+bounces-101127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGDXAKgZzGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:59:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 740E53704CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6995B3025A43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530D53A16AE;
	Tue, 31 Mar 2026 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbSK3R5g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EAE390230
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983551; cv=none; b=cAKtVKbK2MQKDCvcPwQa37P50HQyC/ai8KAHXttNgbJ8ICStfVmqlFrMv8G2lw0VW51vHFMCNuY7bjtUYV86by97zzt7sM8fXj6QNqpNfSgLH3pt8LVT19pZnR7Fipx9y89NLuccEKThC82x2y0AJuyORQxzH2w7QLwbORYggUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983551; c=relaxed/simple;
	bh=l1cH7gYvlcc0lSooMVlOy/K8fFgRGPMUfDne5EcSqdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QmsSp8VT/XUCFk+aBr8pBDzGtLzT/FTaVG4b3z7j0qQYxNNbCfovivwHQcJuTQJs6D8qrbX8gUv3o9bgzpmdb4q3C4XIuuMhxq0yAoJaJRIlH/fBZcnUnIqzveX9cuWQ5d0bEVfAbByEihKiYu551WmQQPc2dDIjsB9rSk2HdwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbSK3R5g; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c15849aa2cso6473577eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774983549; x=1775588349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twlo6aN4ZIIizkV5asPjuWxWSEYhM+jPy1SPudDCUoI=;
        b=HbSK3R5gD9d/Fq2ihig09b77i+9HS2EDuIAtB+U7QbEwwvREO+5vbeOto0YPXenQsD
         nMQ552ktCFrjjBkTsYJQNVv40pCpTVcXXj/k+HXmwQ8M+NfousVDrRL/s9NGfVSZAvms
         cwjnvUr3p8zeG5aoQnTpLqYd2dPpIztW1Xmj9SivGNyQqo6g9qusl2Ehvu5JvkPRE5Yd
         VbuA9tGHT1wnnQK+HhLPLIEXxwUR2PXRYdqebEHE+u66oeQL0fp2+VCG3RrlbifcqkoM
         BDz72qV0Z+xNHa5zGSDeXyZZvv4sZC1TB7lHWCBAIT5+nUvz62oy8TA77PLR0AC3q0s8
         hsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774983549; x=1775588349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twlo6aN4ZIIizkV5asPjuWxWSEYhM+jPy1SPudDCUoI=;
        b=llsw+bpSQ+MNRhK2qB5WJksAn6pAm1bRb4lctESEZBksODyTNWuhcufEBmAlG9BXoh
         U2DO8THaVeCY1go2HqdSJ96c30iY3l+douLqIZfABSyEykYke+6PMgzOAC7WFp0yZ+Ky
         pn0BhjxzdqzruFqf0to1B4zcqop8QGpq6uyNUsap4yGkSNZxm31CRyh6aYWPUIqlyNP6
         r1VzPYog9blw5eGO4sjXscvA5kxaHba5kKdZwRDVhSk0FvVhHbafWgc4qO6KMIskaU39
         PVugFXV0zNe90tBc36AeHbI0LZ69mWXBpaSBInzQpKNff2sOQgj4fijX6AM/9aFdJjtm
         2Fog==
X-Forwarded-Encrypted: i=1; AJvYcCWtyafO5TAPkmZw/pD9Pca2kAVgXsCQlGtxDSe/FAMaJf8moSLFKnX92Gyz87lKHVREBJiF3TH+ZP1sE2W0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu1jTQPXMvmgbAGA/MONy1QBAKMtHOaPVXjb6jXE/fnGzfkdR/
	jwEafNaA/ErBbk8L9tVOGE18awxFJZTIQfs9kUMmmsw54gtgFoKYzpvE
X-Gm-Gg: ATEYQzz6TZqy6Q4WUcKT6lvEfhmZNq6HjwqynRjRSjc/41RWMiWyFQyVyaisYup1GV2
	ZHVjsQKv8FQl0alEQk2dJUd9Q5eAiXXPNZy5VUQzFpQIMmub6+xn/Kt4O80St35GwVe+l3kUD/P
	ZfN43+x6495dffg4Yx9VltnAtwNV3jDyqHLdRl6nI6AAzyEqFQ/irD/XBkmpHgCRBFAAx0jBoVN
	6xX9BcrSLsqDbRV2S0QMAg/WlrODUPbLvSpL0CcVqZsSUhf8bEaDCijVp3y/SmNlH23lK+nCKFT
	oFL3hMYH3DKO6sL4+1SeKqEZmul6q8+oM0beOMNo/M3EPzhOCv3FCFGI+lx9Y2513jA9MIj+SXx
	Tl3V0VV+39VticR3dglc31jtQKlBFXCc+GnKF3+O7q1NtuOAFMv2nbjWvkWQ7bI+Je42CIdJRwX
	y5/6kvj9mqbgykQyRCe8db6CtVmVqyON3DX7umwa5/a6bj7CcyzOO/SlXHiHJwPpN7djt2+C8cM
	3gdrw==
X-Received: by 2002:a05:7300:2213:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-2c93078fc9dmr270392eec.2.1774983548956;
        Tue, 31 Mar 2026 11:59:08 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b2c57sm11411406eec.16.2026.03.31.11.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:59:08 -0700 (PDT)
Message-ID: <3435895a-ffd9-4dd3-b21a-4466791183ca@gmail.com>
Date: Tue, 31 Mar 2026 11:59:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera
 flash
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260331-expressatt_camera_flash-v4-0-f1e99f474513@gmail.com>
 <20260331-expressatt_camera_flash-v4-3-f1e99f474513@gmail.com>
 <xh2un63wi3noruqm6gf2dhayad77kpubalxc4xarmsm6eznvla@g4w2yuxja3c2>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <xh2un63wi3noruqm6gf2dhayad77kpubalxc4xarmsm6eznvla@g4w2yuxja3c2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101127-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,ixit.cz,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 740E53704CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Dmitry,

>> +	vreg_flash: regulator-flash {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VREG_FLASH_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		gpio = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-0 = <&flash_led_unlock>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>> +	led-controller {
> It looks like the nodes are not sorted. Could you please make sure that
> they are sorted alphanumerically (if there is no node address)?

Thanks for your feedback! Could I request this comment/change be noted 
in 
https://lore.kernel.org/all/20260331-expressatt_fuel_guage-v1-1-23d1d8526b69@gmail.com/ 
instead? As this seems to be the only comment remaining, it will be 
easier for me to reorganize the DTS in the fuel gauge patch series 
rather than this one, as the fuel gauge patch series depends on this 
one. It also won't spam others in the mailing list who don't care about 
the reorganization of the DTS.


Thanks,

Rudraksha


