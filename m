Return-Path: <linux-arm-msm+bounces-117803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qcWvByDCTmo9TgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 23:33:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA3372A8D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 23:33:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=uFgQeYeF;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117803-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117803-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C19E6301C419
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 21:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC943F6C21;
	Wed,  8 Jul 2026 21:33:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BA03E1CF4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 21:33:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546397; cv=none; b=hFw5B2PmbqLxKMFXtGFxtVsRiPv4hIT7HjUQrzart/Sy6IGcWH1z/WKeMB+2DyE3Nm/8lgPd388FfHt1sH3cTucaSBCdTzVpkQZiA3q79M5l7fNva3oCS0ATEcjY5h+h8M27VeynlEBZM056Qaq+fTbSAC4+QLkPgRyvpAlmv0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546397; c=relaxed/simple;
	bh=NXwOCg+eFKxCNu/u5zqiZjTXNblVDIV1fQBBNSYRkhE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=THJILDnR7a0PuT7LFKJX6OCJvPNSB9aU8nd/f+mS5ZE7bZawrrHCsUFgUrgw1d61dsWkda6OMwOyqKFZy/cJoSvhNFsD6xvhFWfwxjSg8WTeG20XPudLTSymlxBqgORcs1VtClwi01K1BkloE/APk2w4SWOa+IBvMKeO1iuwGoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uFgQeYeF; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b7612475so10409585e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783546394; x=1784151194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9rrOWcnkCxSDr8uiZZdnumYL6A9xsmstIl9Ie1VxD/4=;
        b=uFgQeYeFbmPZBYb1bJ3QhS0jVqOR21bi0MQnAXZEIOFUShghP23iCglmG8dYTllUnP
         SHKKWm09rf5Y5dKOZxhdDVM5KJTZEcwwS1Zf0GPbB00rz58eFoO79/L8I9kPTjUhaEXQ
         oOfDXa8kwBUUbZew0/YSuejrKFRl2K+MqMqqjw5pwGhdCCYMBCB0lDaoOiqbMGKZk/t4
         3oGKpfJI0v2CL09ulc+memKFK1MI64QE7KR5L832NIikWflehAwXZTu18HyGyjEZVbYn
         XKBXWqfFXJeoFQf+ilOCq4OK6I7z1MHY0YtiFQwZLbSVbkOgL7uwlH/3ske26uKiHn/m
         KQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783546394; x=1784151194;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rrOWcnkCxSDr8uiZZdnumYL6A9xsmstIl9Ie1VxD/4=;
        b=g6KeHIiVOoePs/I9z91d/wgbz8fHMc6U5V14uXuQ3Nhoe/VCl6F2dRPHuxqawWdkNf
         tDnndKTyZ/LYZE/1QwO6ojxnhWyEsFfBsFCQg1RkIWMNSbWF2LCGBDdh7wO+s3D+bA2P
         sOnsrVXgJUPGwYRZ9rNHxXuLR/0xDISnT3WdZ99ywm1J5FP3xCHMhaRoVHoQ/mizMUwh
         HNIPrprd8/RELamuOLa5TQqPYFS0xpnCEQFwsiiBcxsYTjGdidnYDn0jVIYwIFsqP7Cp
         aoBmFkWhYb8wcy3+TEgbmP59Nqwdp98ZV48Q4f+ayVHpWUZCGtVhiO420opqidaNFbHF
         7sRw==
X-Gm-Message-State: AOJu0YzRCecoTayON+yjEG4yW3ivDI+y+K+3ltGbLPmyO5cIbZFPorW3
	yHFq1gnhuFcsRSw204ASz5784nTZZTbZMGNat2BaSmpEtuf1SGSmGUkIfluRwAItPnEFkg3clSN
	K9dS0
X-Gm-Gg: AfdE7clLC0UF08+ftZ0GcoVas16p9E8dKNMV5J7GuVPFMAp4lG6OISrSBfD5CbqI/1t
	ujzJPTYGIpYPhi0WzmfB7r8ippvX1jTqRRb18VlOnKeUOOWRBLIpG5lxktIMx8hOSowDWa6vt0R
	k70W3/kaz8aSNYNrq191tR3lFvieppBGX16JYI2bOKATDEqdizfBrzKloWGjoJrnHu9XK7gB/Oo
	U746qLbxRsh/Zh0n0Id69EyN4rMYoKgnQ1Kz4YrCM+mE1ZazG+bsD02lkLCTcS2cYV65+wiegOZ
	zpskGCZcett8FLXZ92pHLPaFHO39F4/Sf9RL99SsZNEI+sQkEbTRZ0uZuP3Oz+h0Eo5meBsR/Z0
	XxhCBVASgQAOFnwrap5tPFAbbufkXg0eqs++MNYYldgKP2IBKBI5L476duZwIqRq0vZFYbouPp8
	B69I6dPgr0zf0ZcbwnTpNYu54cGHE=
X-Received: by 2002:a05:600c:4455:b0:493:bb0e:2832 with SMTP id 5b1f17b1804b1-493e687fb61mr40754675e9.37.1783546393918;
        Wed, 08 Jul 2026 14:33:13 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.204.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm46531519f8f.15.2026.07.08.14.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 14:33:13 -0700 (PDT)
Message-ID: <e1b25b3c-ff3a-48f6-92f6-a81f7df24e54@linaro.org>
Date: Wed, 8 Jul 2026 22:33:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/11] arm64: dts: qcom: Add x1e/Hamoa camera DTSI
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
 <178352261564.2235436.11540452339147753406.b4-ty@kernel.org>
 <5aa5487b-67ef-448f-8975-0c46ca1d3451@linaro.org>
Content-Language: en-US
In-Reply-To: <5aa5487b-67ef-448f-8975-0c46ca1d3451@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,oss.qualcomm.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-117803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vladimir.zapolskiy@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:alex.vinarskis@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CA3372A8D0

On 08/07/2026 22:11, Bryan O'Donoghue wrote:
> On 08/07/2026 15:56, Bjorn Andersson wrote:
>> Applied, thanks!
>>
>> [01/11] arm64: dts: qcom: x1e80100: Add CAMCC block definition
>>          commit: 6a3568f938c9ff2cb493f82dc595b4dc2760f517
>> [02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
>>          (no commit info)
>> [03/11] arm64: dts: qcom: x1e80100: Add CAMSS block definition
>>          (no commit info)
>> [04/11] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD pmic,id=m 
>> regulators
>>          (no commit info)
>> [05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB sensor on CSIPHY4
>>          (no commit info)
>> [06/11] arm64: dts: qcom: x1e80100-t14s: Add pm8010 camera PMIC with 
>> voltage levels for IR and RGB camera
>>          (no commit info)
>> [07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10 RGB sensor on 
>> CSIPHY4
>>          (no commit info)
>> [08/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add pm8010 
>> camera PMIC with voltage levels for IR and RGB camera
>>          (no commit info)
>> [09/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add l7b_2p8 
>> voltage regulator for RGB camera
>>          (no commit info)
>> [10/11] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add ov02c10 RGB 
>> sensor on CSIPHY4
>>          (no commit info)
>> [11/11] arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on 
>> CAMSS RGB sensor
>>          (no commit info)
>>
>> Best regards,
>> -- Bjorn Andersson <andersson@kernel.org>
> 
> Bjorn.
> 
> This is v3 from March. We are on v12. I don't think you meant to apply 
> this.
> 
> ---
> bod

For example: compatible = "qcom,x1e80100-csi2-phy"; is not a valid binding

Please revert.

---
bod


