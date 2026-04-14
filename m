Return-Path: <linux-arm-msm+bounces-103097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAEZCv0O3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:55:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF313F8493
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76B63301DCE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B974A3CA490;
	Tue, 14 Apr 2026 09:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHYpQyby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWT1pj9B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEC23C13F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160291; cv=none; b=YaccEm3mTkrjSBxzFrW6mIsUgY4I1N7gz5xRwHOXoykQfh9A9XW7pPm5gMvP0QXsLpNIXHJt0ROOufpyeYleUbHENah7fPmwdGwGd2Jae+AfzCMahrGKMu+tguf3Qq6JwmyiAwxv+8ugky76fNQvEObm2Rnd9IHVpJl/ZB8c1tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160291; c=relaxed/simple;
	bh=GjYSzpaBOY+tQSBP+F/2fNUDYZP16CuhUhfczyEWtsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBcmwZbwIgCXoHwErdgTNMxHcfeWnhTrgarWW9M2PIl2MXTL1RbO2sgMetomUFA5668NvOJCI5nf89M5TZ7jICH2IaASlr7R4xsPqf6HwhXMU+VLffCn2uOF3Jj9Vzvj2iLn9O9XbDBELy4Kf8Fb9G7Wl//3kWNd/+3wfWFfUf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHYpQyby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWT1pj9B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6RQYq2633299
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2Nqoj6YRG35dW9rwuMRPa4c0UNKE0+QLsU4feV7SfA=; b=YHYpQybyafBetHKj
	D+Rj6GEvCn5Aya/tQ7HJNdaVNIAN0UJ6pOCCzXHmeiV+1oediw9BlZ5tnrMw08rl
	tAu++N+534fsLXnodyfgs3+FkaSLGg20+T1E8UYwvanuKHrO1Z3fHRbYYPnMooKM
	cjsP6aPDdXLs6DPHlikThtlz5Rx831qx3w45IHL+Wosmc9LN7V03SdzbJl4qUPTx
	mjdcPK5WCzoN2c+0CZwockf+V82ZBx406+Hir/LlBe3vdA016u1LqgCk9pQHQYns
	2Smj5ZL9Z7UuEuKmnt5DxrvbFeXMN5N1L3F1l04wEhRLZUs6O8gTYHTKUwoZQzdH
	zvmd3w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86ca5me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:51:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cff2297253so149122285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160289; x=1776765089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2Nqoj6YRG35dW9rwuMRPa4c0UNKE0+QLsU4feV7SfA=;
        b=VWT1pj9BAy9NSOxP5h104dWFE/OYblOUd0fvFR1nGiqZdhklaKhDx3NPL/Ejyo7Tts
         XqKdfgI5vEBhVG7KOeHZxVcDTAyGVqV+cwQF3nrga5dSAegzVMtQWbMbRtHgnyN2w7lH
         3ABxjfoFW/19ENTjOvWUDJmCHxlPpBu68BFpvQoQttTTNLgNzunx/9QyFZLPgzN4sOOK
         fteatgVSOqJkXGFF0Kf/XRp8TmOTlLYDyrmkBCBdsXrhix8fpn5s+I2aC9e2jdf1xPpX
         lRER8sDwXCqHJIOOLP5oYTx1wOKEGqQAa8/0itif16yl/Jn+ISJuJ0zxBciZcVafD6G/
         Ap4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160289; x=1776765089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2Nqoj6YRG35dW9rwuMRPa4c0UNKE0+QLsU4feV7SfA=;
        b=URaJ8Ke7SDvZHrdacIRHA1jhBuZSj/MaCy7GMMq1HR1I6ukVvTZKtAk/s5/Uc/1J3H
         HUf73bruP427YPavCR0oTXpJLjrRu6VmXPEnpQt2lojqWDcfoccAtsyyX7t/MQJoXC/8
         nA4+13uhZIHhZ5grr5wrnnVYBzIuM39ATYra7lYdxBPJe87hkyfF+IGZvR+gR7CQcLu2
         Mj1GJZBceJU801scQtmfeOCaqYeXjLFZqwNurYhw0JbwS10C9w/Vtub83Fujto2CEvPV
         ZIu8BD8yHvGCEAfFSZyGHAHuRL4EXRBMK51LZAfVdMn4IDpIZb1ZjYbzfC3hsvPpwIW2
         kA5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8XwSdDiEXlP0YG3YItG36cn0z2noS/lId+LiiZNy7T2ITpFgYmCGYuoNFrW3mI0l3Suez3KY4JeIDGrtX1@vger.kernel.org
X-Gm-Message-State: AOJu0YwS+7/evigm8J9lvzrt55t4xoA5TfM6ZUwMQPHoz9Fw10s75RQO
	F3U+65Ivt60eTqxBPYDfXIcKOJtbeh1MoYtOtWhoE37MbI85pnUyQqEm/jZGpsLG0ZQTQBl9YB4
	fZt/qs8dN+mGPObWH98+kLqhqkaiI6cI9Mtjo2mNOPdPRIgH411tNpY2iNsd8hS4OaBnE
X-Gm-Gg: AeBDies/x4qVvbhfnFSPWVxDxnjgY5KZ7VMZLAuQCk0dfdLiu+6IkQF4V/BQcOPhhHM
	DJ9un4pB/LaA/qLgdcHQQX22NtXLUL5hY6PCUSaSXxSAJs4Ely5ZPV8BhpuuefT3wxVR+7U/vEh
	0FCZgGqdD1tcjqYgkMAfmYfYvctZqrzpl0QZFFNuqms4qzLfegJllZWZYOyLS8Pb3jut214prHf
	dsyZd1I+z7MaWDDuT4psdaaKsRJFPQvJpJbfBsFpTU32rsHyYi6LWwHNrZ/kasEHd7GgPIx1xiD
	zb9FkV56FRQJooikcO2p/AY1ojPXY9IYRo6e5bNs8H0BFW2n2TbFv3ypfKpFkTMNb1Cv3IISurE
	1UvVQ6wTl59eCJETGi/G4kcChdGK5xNfSiUb/W808XeHMvptNLNMLEMv7D6P0Ai5ZAHXQ7Q6XKl
	IDHHyo5AHTTQDBIg==
X-Received: by 2002:a05:6214:ac6:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8ac8629bcfemr194153336d6.5.1776160288788;
        Tue, 14 Apr 2026 02:51:28 -0700 (PDT)
X-Received: by 2002:a05:6214:ac6:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-8ac8629bcfemr194153016d6.5.1776160288365;
        Tue, 14 Apr 2026 02:51:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a78sm384964866b.50.2026.04.14.02.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:51:27 -0700 (PDT)
Message-ID: <d1834575-768e-4805-9e21-50a796690bda@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:51:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] media: iris: Add support to select core for dual
 core platforms
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-9-7d3d1cf57b16@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-glymur-v1-9-7d3d1cf57b16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wgDeoM68cRGhlVHTmsyu0_jYea_AbabY
X-Authority-Analysis: v=2.4 cv=RoH16imK c=1 sm=1 tr=0 ts=69de0e21 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LyQ9poKqOzz0K_9SBp8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX2iO278lxWPur
 7QsAaqyDEEowKrZyTwUl7npZ7HlQpTR6CXIrjA79JElnvpzs/ktCR1jGunfmTnFP8SQyl7iyK6A
 9KlJWLOyhuDsWuFS5l2v31XEjx75Af6oDy1ifE/xNhI1le83rzQVInpE6AC8WeI9jTPbYvFs57P
 Qx0E5r1EaLcMtriPvb+QhKtGKT1Qh+lTHcrvOGdLDR+P5ndoaZP8g8J47S7fSBym2D3L65OUIQ4
 COlKEER1U68Lt80ro2iKhFTGSqaiTVeQnem3OM43i5aINeHqTFuRFXA+yASeZcXhDRmRup0vT0I
 m61jnCJ1IPEB9J9S5Eq16GGJBAM0vbPYqOXz+HeUr05mCJ/oUvM9c1Vjc3dGswghViBFI3F/XA9
 41NvKCiwdDimsoEEtQtazYpsHFqRjEeAYjFmV+H8gUILIxlvXMS3UY911vf6L4NepwVTSY+8X4G
 /pJi4aCKZ4ZdgT/fEpA==
X-Proofpoint-GUID: wgDeoM68cRGhlVHTmsyu0_jYea_AbabY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103097-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9AF313F8493
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:00 AM, Vishnu Reddy wrote:
> Select the hardware core (vcodec) for a session, based on load when the
> platform supports dual vcodec cores. Assign the session to vcodec if its
> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
> the selected vcodec core to firmware using new HFI_PROP_CORE_ID property.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---

[...]

> +	if (core_mbpf[0] + new_mbpf <= max_core_mbpf)
> +		inst->core_id = BIT(0);
> +	else if (dual_core && core_mbpf[1] + new_mbpf <= max_core_mbpf)
> +		inst->core_id = BIT(1);

Let's store the core ID as an index and only wrap it in BIT() where
necessary to pass into the firmware

Konrad

