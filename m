Return-Path: <linux-arm-msm+bounces-87425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74498CF3B9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C23E13029203
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424A078F59;
	Mon,  5 Jan 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JFIbA0Z8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K9uPnCDq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3788632B
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767618202; cv=none; b=lBlbDH6a2gPuKzRJHWDzSqflvbrXFVTx3dXSRUo6BqjF8f/gq0fg9+81CTlb29UYzxk5gotBBnETX7LFL9YMD4ZCDXEEqPTqW3pyBnD7ZMmgZC7KiaPAq/jFhx43q+9xqMy/vGFqKGlmdAK/ozWDXZsxTBS7vNILHG/Uo01nRrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767618202; c=relaxed/simple;
	bh=K8XXCypZahygjvZcljNrcbXBZPvf0f1beu5HW3qaf7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CzhFxDYRbLqEbraBROxMSROMOgMG927VtWC+Mp04A5Y7PbVBRUA+0lAR9uKORcLR5hR825E0VB4WgAx+44PfJe4UC4laqR+vYxX9x6jbloeeNBLND+uQyzv+FlsCFqX/zQsTU64MXuCHLOXNuzjOg4pnAz8QLLhTEOzeHxuG+N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JFIbA0Z8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K9uPnCDq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058KAiE3867998
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K8XXCypZahygjvZcljNrcbXBZPvf0f1beu5HW3qaf7M=; b=JFIbA0Z8yrfS0M5C
	w6wUUG4JOMCRDI0GMSuosNjYo9dGeZGRxTS0aEG71buOSjxaOtdhUPiM36wzRWCg
	NIWtFyqlcncUxXSIts1hupF5af+w3PKfgWiTpmJKlb9jCv852i1bkSEjsIqTZVXp
	PpQACGdqZNmnpsffC9SIPSU79keTadNALPlM8RhKMvVTYoSdPfT5xkQSOspCaqQa
	QyLC6rMoqeIr7HjxbVS2VOAa40wJXaJcZhNvl7Gs2+fvoC6NuXhLB8e92YImE929
	XQcNZ0AjOXYKq7mn9W6wwJ1rPCHQoJajdO6zqp8E+SbDJlyk9hd37Ibg3hbLB6EL
	qe605A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bfyx0j0r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:03:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso14923666b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767618196; x=1768222996; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8XXCypZahygjvZcljNrcbXBZPvf0f1beu5HW3qaf7M=;
        b=K9uPnCDqoW/YAMUUX7afiGepBJvT7QV6xESGLvTqTng/MrWDXmNInti8DtVsY/mpJi
         ArRl6+E4wyMu75Zz8grIVs9P2C2yLHZ7xz3M67SDdHgO8jkJpwmC1408CxSSdiYFOO+f
         KpS5EMkeKVBa6GzFjVP4KIhgjYQ+XDqsoo1JDoYeOJXbonEO9nmsI5++faggYXMF+eoL
         dgiszwSBz2+7y3vjwRsdD4lJEO8L9MEfiHHYhTGBB12DztfSTop4fCbhYP+gWsSMBwdX
         NjPGKY8/KMOX6ll49/cECysquIK1ubVkFxIFfMbed/ms0lgTdXCHHPgeLHTRj4FmQg1I
         hx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767618196; x=1768222996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8XXCypZahygjvZcljNrcbXBZPvf0f1beu5HW3qaf7M=;
        b=l1rBgEA1Gy062kI2rBJHloHxRX55wZ7jHPAbsiWT9TVzYPiJDaQsGFagXIZJvrgXNJ
         xQdjfp4w2KEgxtgn4P0WTTAsrgkm3i49ne6ngql7uHR56pZNcYTfOocjfEAhgtd33EJC
         kztQMoP2L4KcJU8Pl6hAF3MkEqhFckXp/QvHMCYgV/fz0fbYL1UdMYlbEVfEclPJHGof
         ZEgaqzkfkSlBErVWMuavcuok76jH7+igC88i9FWfK2XCYvYd8rIqbrIf7twAmlO6Gw8w
         4VG/4CjDRkk8hh06pZNgF4Mejkp3pbeIIY1zbdx+U9rKtXHWMUURKAW4acbF5/vj11/K
         yMzQ==
X-Gm-Message-State: AOJu0YxNm5TyTL8fMAlXVSrPN0AvD63aC2xsC2IcYtFYab+YKTyE3Ono
	P8Cggs22TAsBl9eXSiM9uI4GuKdPM/uovyAJneujs5IA7SLQISX+bojuiPvy48QHY1ETL8r4j6q
	Unko5mQpzBhETBk7CkFnje50sFYI79EMZ6Nex7NoIGHhq0Y8om5gAVk0I3LQ1KisbIOTh
X-Gm-Gg: AY/fxX7o90iPSzZaIeTr6u7jiFCCH7Hl47Bj9m9WJj1cDIc92ClsPhrZ3qcnBRca46C
	10zD3pK7Pj2iAqPqDrqp+xlrisuXN+/94ZPh/zIHu8Be1C8bKkSn13OiaWhWiAd2H8xEINJTmJ3
	53muQ+vgm0B3x+P9lmgJDMtfeiSTUgZU4hRjtBxIjTdVVwRRtBtOwG9T35WxcGw4tGRpM54QHnJ
	XaMqqw21/x9bFA7dQirZKzenVvhbaECvzQjT2rSHUpPi9valFSrpcH4tBLcBDN5O/s75SHQ3os/
	AfwOLoifvITSJbApA1SJ3eR37HiXAzFyMlLg4hgSeaaR0MUURqttE/0uu9dXIy48bz4r+5RwT1g
	aBoSHbf+JLX/Rj84fbVeOKF5RT+7D6VKWNAauQTLTgvUgZQk2p+sg/WVInCMh1jYrebD6/zEx2R
	8A/4U5k0t/uNcH+LXzjWdVaHlu1l4=
X-Received: by 2002:a05:6a20:7f81:b0:35d:d477:a7e7 with SMTP id adf61e73a8af0-376a7afaafdmr41685093637.22.1767618195595;
        Mon, 05 Jan 2026 05:03:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCt2u1H6b/p8HAJaz2LAP8nPfkKGYmSdDDZ04YNA7I4gsNIfM80Os5irZQqYISM0yha+A8QA==
X-Received: by 2002:a05:6a20:7f81:b0:35d:d477:a7e7 with SMTP id adf61e73a8af0-376a7afaafdmr41685064637.22.1767618194911;
        Mon, 05 Jan 2026 05:03:14 -0800 (PST)
Received: from [10.190.201.90] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82bbesm458928945ad.35.2026.01.05.05.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 05:03:14 -0800 (PST)
Message-ID: <748af6ec-7e16-4109-831d-ae96bdea1b64@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 18:33:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: cache: qcom,llcc: Remove duplicate
 llcc7_base for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, conor@kernel.org, jonathan.cameron@huawei.com,
        robh@kernel.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org
References: <20260105122045.963277-1-pankaj.patil@oss.qualcomm.com>
 <0e580604-6624-4597-b2b3-8a6f7483bdef@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <0e580604-6624-4597-b2b3-8a6f7483bdef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZYFJbrl c=1 sm=1 tr=0 ts=695bb694 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0rWIKNNMpyo1PJrdglIA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNCBTYWx0ZWRfX4iA9Q+tHfsLE
 VwSu/1dO+/Tpu5dMiLALMJCEofNeALoO1cyqizlzgceRDJA/b2LGucehg7WFQjQMilYjpleZl/0
 rnnJwDZVqmTDaSbUxowEuDu2Jp19p9dX8aMUKX4AQ08JbcaiseggNCHtk6u/EPvM5qywTK5cl+q
 HcjQHl0daL3EAidQH1pdSvmkRemE025+ClbbTMTjLYWo5WyjpYEVkTllKd6Su698S6r6O+AGq9F
 uA1NhhG7iOkgPA+8gFfB5CyxvJPMyH/wz1pqq9Zquabosxs3TiBAejObcFzSpQLxiH4aW3sOGkI
 mHPXmegecD2hHsFLjLbLzg6mbxnkSI0VsGfSzGOAOlvpBZHldFMcUL4cf5p2ODtDqZXXxYrXoVI
 lR4+PLFw06Gyhb2f+GiqpSFcE+5jBpXoieOp2QrounlQDTkglq5uuRtN/klTetOTpM8GTsQIXT3
 VYVyuNYuCbs2kBI1OfA==
X-Proofpoint-GUID: bKH57S-V-Rli80IMSAzgFjiwR4fnP-Ys
X-Proofpoint-ORIG-GUID: bKH57S-V-Rli80IMSAzgFjiwR4fnP-Ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050114

On 1/5/2026 5:58 PM, Krzysztof Kozlowski wrote:
> On 05/01/2026 13:20, Pankaj Patil wrote:
>> Drop redundant llcc7_base entry from Glymur LLCC reg-items
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Missing fixes tag.
>
> Best regards,
> Krzysztof

Sent v2 with Fixes tag
https://lore.kernel.org/all/20260105130050.1062903-1-pankaj.patil@oss.qualcomm.com/


