Return-Path: <linux-arm-msm+bounces-108418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Lg0Mr4lDGoIXQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:56:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB057AA16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 10:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E0273036E3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 08:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1273F074F;
	Tue, 19 May 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQHgc4Wp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c/ioRg+T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B9B3EFD3E
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180932; cv=none; b=qi22476OFHEjIz0DtNfglTMl/RgYg2mjZcKnBimsmfDT4Z3ZOxyql8y0pjiW5eUgtgiAKNN6yzH7teUZ8tWs3qcPMKKOtmOyE5YONSC7JaTqwt1dVYdUMvpotGIRyPE8UQDnQ8wXrr1EI29dLZqcj0YlrkoldPVYO1G38zhdwag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180932; c=relaxed/simple;
	bh=Pvg0y4IvYgyRyjgGSyPm0Vv3Ghs2hJveIaCUm/K4Qg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DKSoU9eQr06mR/zat2lV9+8DokgyUZ8FGrrNu6aF6jZ2VWKtiHKuPusw/ogFHsphDxBAJ584pfV7avQ5i/3IaYVfuJmBt+VN6QdIn81Tl4pVzYQkfvtwzdofWD6D36DafCozYFz2rSq6wHksi2PM0xUK/+vtgrOsCizUeU1xm/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQHgc4Wp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c/ioRg+T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J60Egn2438007
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LQ+0FnEJugjYxtjlpuNz1AMACB0wuPR4vp/JFTyrtdI=; b=TQHgc4Wpx28xJfm+
	nTuFt5EYDOkev0Rxiioh2PUjtKDIW8liibfSjiadElGJBgU/PUWFYxG5xT0iuTDY
	iH2zfeM4FDrfwhm4nHwhO8tJyPC1BdkiadNVp3mB919J0I+GOy7Y8aRAl5Cou+/w
	PtIIHcS8flFX7orG/S/qzdxsAhL/KGNBoYSepgklMJk6IM2jdJZ7KBztJ+K1HzAf
	wmolCJ1Zx9ctgAgA6EP+B6KEjYCXWEZSau0xNxGqjFWHnnvbd82/f4gGu+OJKEu3
	6Qg+f9iigDyhZr+BFRgY6mJ191wIddKgVSehNNz9bizLwNx/AIUK3qUn33Le/1FP
	Bl+Ulg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v451k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 08:55:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba15e384c7so22826265ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180929; x=1779785729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQ+0FnEJugjYxtjlpuNz1AMACB0wuPR4vp/JFTyrtdI=;
        b=c/ioRg+T4qMGG8EjcfxkWmI9ZM3HKGC6VCUZQSzb7cWSs6ZagDNTA+IyT6KxHwPrzO
         4BbYbHRyo5pZJN72hft1eabr+XGHJ6Nbet4WZ17dxrW+meHDAClbF8UHoCz051YpST1E
         ihY/+5sACPGWEVbexfKwRCDhmH5qRKLGBo5lSzBdJYfDfRzMST03T9JVuKWYtYTA5kBC
         zs6I+xtctQ9tyzs4JYfGwBRYvnRZkGircjts6/spdKnosroFDR+EURp0hS8lLfL5DWX2
         lIHoTNXf1SWFwdfolwcfJdvxX6pwxMkN/llpgOS9rUTBJeZmGvPHGG3kW+erbjAz6bQf
         fgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180929; x=1779785729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LQ+0FnEJugjYxtjlpuNz1AMACB0wuPR4vp/JFTyrtdI=;
        b=cUgJXIVVhijFnjHmuejvaaSwZ5f6h91ribBjoAWrz3nkYWA6GC2t5eO9Rq2i8ZJns6
         YT/2xDpMgH5TCcDpuSbxZsxDZsOkvT5zE8/JJhGX77kT3DY7s80UcKnFkR8fcLmRxjiU
         VLGh2uFDubFwSTZVmjQtkWXbxpTYvwsZ/Qhny2IQXcr0++RyskyUU4CXMIVLbn9rfDD6
         kenAyFI4mXUD7QorUr6pRaTwoYCEFmzCSZdxQmexQdONrSgAsjNSbfWJP6mmrRo2Cn55
         2M36HYIJzA4yaK9qH5Kx/0aXAY+bOaNsxWU/+teWEZhQxbKl9BH0zBBWORSMZqeaIl1u
         G4Zw==
X-Gm-Message-State: AOJu0Yy58zO3FAcsFQzZ7l8iSLQIXT8aeWCa7Xub6TBsHJVBEmGGfMFB
	zX7Z4ojbls5cKSq+sZhAUd+nj74yFb2tgB4y6vsFG4MFMgG2kLV8xwKrhSt75nY5k1o5AhkTtH2
	v7rdhG0oXVhiVMUDOhvd6BnP9Wpsd5POp0L2ovTTWcDtqm4UdtVP8434Vm06B25SnuzLuJl18GQ
	y/
X-Gm-Gg: Acq92OEsEkxmVZiUd14jiFR06Olz7BGQkVLtma2bas8aLwirbD82lWV42LZKKJQNSaD
	r+BNABHeiAxGhZ9yQpcOKIo9kNIeRzcieKUKIp9zy+Bf6ked1IllGtpaxRsFfwu6+px5iT1JrJY
	EbLclgUXgDAAEdX8JLPErkJh1GXokYKNro3bV+0QWhTxjNeJaul22C5OIakkd+GiFdiS4QdclCR
	CToaBPHmbqyeD17g7X+ADZ8DtZ9qlXA8oFMyS86K4SkADW3vHktM8UOB97zClYZwmAdU0kMW74W
	AJQ/PncSkMvVyuu0tBODS1xqHHBnmeDOB5ePzKhccaxe2TZXADdWxMJ+lssHE442Ltx0MvT3b+c
	Mp93L4+5jUYQeqamieE5lCg9/s3qPfdtgrlzbq1Msxweg9f+mSvvB4+iaKdJl0mg=
X-Received: by 2002:a17:902:9a94:b0:2b4:65f6:e24a with SMTP id d9443c01a7336-2bd7e7849a3mr126806845ad.4.1779180928745;
        Tue, 19 May 2026 01:55:28 -0700 (PDT)
X-Received: by 2002:a17:902:9a94:b0:2b4:65f6:e24a with SMTP id d9443c01a7336-2bd7e7849a3mr126806705ad.4.1779180928271;
        Tue, 19 May 2026 01:55:28 -0700 (PDT)
Received: from [10.92.176.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11d6easm193406485ad.72.2026.05.19.01.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:55:27 -0700 (PDT)
Message-ID: <e0a49e4f-08cc-4faa-a7c8-ee7ac14615f1@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:25:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: crypto: qcom-qce: Document the Shikra
 crypto engine
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org
References: <20260515-shikra_qcrypto-v1-0-80f07b345c29@oss.qualcomm.com>
 <20260515-shikra_qcrypto-v1-1-80f07b345c29@oss.qualcomm.com>
 <181abfec-a6f9-49d3-9428-21a169a94246@kernel.org>
 <f40798ef-e066-4814-a26c-729dcdb9f5b1@oss.qualcomm.com>
 <166e09b6-2fd7-450a-b7df-b59b961bdfe2@kernel.org>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <166e09b6-2fd7-450a-b7df-b59b961bdfe2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0c2582 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=-1BLe5um57GLRqdpntkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: G0tyWgDWOLDYwQNqrmcnmvQY-gQpqUug
X-Proofpoint-GUID: G0tyWgDWOLDYwQNqrmcnmvQY-gQpqUug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NyBTYWx0ZWRfX5wWa/4wueOtd
 cM+wUIpokcVFl6f9DxMHmKha0NhJkcV53MIaFpbb52wFLQ6gTQtUYsqdw9JF2pCzykWv6G7urzk
 dQ7nJNug61rbLiRb1dE56a+HJMpXIFzD564ddsyJqgR4YZolggiOr2lP5uGN4WA2vf/fbN1NQHN
 GqySewLXKj+WIWqxcYYUlMl3uiAPzhVWPVQrZddrysw8wOPuGDMYJXcU4CNnRIaJ9h6XfMOVLbP
 nM8EW45g0Sv+OpCP8+3Gl+ZgTPDDf2buRyNcJ3IsyJZh1v/LPxGkuF1238iZWVEVJiGGjX/bYd3
 RKdTY7IaYRNIksBKjnLu2mH29fwvmKE9N51cUOmyTBv4+We7BCIUQoFBExB7Lp5y65S0h9VPEK7
 BG61pjpmFoYYEXUD5o3uBMzwZuwky6llb9ZjH10cUAoIOrvaHZQpKZZgC1MZ1UpHRJR0A2XZfqk
 9ke/0xde5sK5qUzB8zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108418-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gondor.apana.org.au,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AAB057AA16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> No, about proper patch organizing into one paychset instead of sending 5
> different patchsets with oneliners. That's literally the last
> thread/feedback on internal Open source forum chat, so easy to find.

Sure!
I'll align all 3 ssg modules(ice-ufs/emmc, rng and crypto) in one
patchseries for shikra and send together for ease in review.
Will ensure to follow same pattern in upcoming submissions too.

One doubt, there are mostly dts and dt-bindings patches so i think it's
best to organise per module patches together in big patchseries.

Kindly suggest for alternate opinion.

-- 
Regards
Kuldeep


