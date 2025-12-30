Return-Path: <linux-arm-msm+bounces-86993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E40CE9F8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 15:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC0B23028D8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 14:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D03B63176EF;
	Tue, 30 Dec 2025 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dyzm3D3Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WEqPS7Pp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43113285041
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767106131; cv=none; b=kdPqmloUz8TGn/nq1K34n9oAI7CIqXuvIf9XyYQQH61zv4W/9KQrsEwlImUGzdlmDJN1DEuHqEjPQOjZKGsjCI1kmyFwvjI67RuPUbhq+81s8cctKGalmW1GnQa3Mg3fq9N9CtAP3kSMrGIgsiE4dHI7/B530x+nOxRb9H8uHEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767106131; c=relaxed/simple;
	bh=6LOjWVy/NPNI88qtUdXj+lwgimxloS5xr7qJYemQGgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DF8T0BgmWL3iwD22XB8pzGcoP8oATEh/DMWBccfT45/RCwwx7TB6M5ne48kdSxLuoTkuZ8ajfMntl+F2+sbmvvA+6qy0dDnFHHkl4xOgfWScQAPqRhLq7n/NRgSFzGJThMuaImYroelgUS6AHzLTurQDZ8J1LXd/NfldROBFIR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dyzm3D3Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WEqPS7Pp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUCtYPf714852
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44VcDkl37stqODWRuC2o4+G1/5u25FomI/9zY3CMzLY=; b=Dyzm3D3YP8nCHR4L
	/f7ElG5Z+6CqP4rUL8ETznvq/pm+esali8TB9TGpqtl2nWxhm0JtS859nA3/f3AK
	J1GKUFZfBnu9TCyYydErS03/9ok1ohHXGNUaNpDu2FUlznWJAO5aXqJbhBCBuNgs
	REWYdRWkv7+yDNPrHgTwXTsvAXk0DKxGLLbIF4t5weGAZzyWp2DaBd3GK4gKTLF9
	LVvDSIZsWey0+pOQHSJ6FvnJPBKk1RM1SsqDgfwnN/O32C3E3vdWMfoAP6R8VokY
	a0YqM6gnbLTx4loAId1UAAKylx+XFc3DPRuoyoY6ZRNH3uVx9a0frIcJAQKAcjZL
	is1Xkw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcf5yr8a9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 14:48:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88882c9b4d0so33689056d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 06:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767106127; x=1767710927; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=44VcDkl37stqODWRuC2o4+G1/5u25FomI/9zY3CMzLY=;
        b=WEqPS7PpxfKxGugoETMmGKCfRDB77reV2qSs6jTiPSp8kDhwKo3gU7WzI/qlvZYV6y
         BUWEnhF2DuAxd0MPkx1eqsdp7wpMRGeQ/exMF8t2lEn2ADM9CZlpr0fvyThKpYRjlsvu
         dlzOjBWeehyyKzM9cPjIeOJsutclpgZ/kU/Rz01Y679nr2pJSs9TaWtrmEADKAEqa/3S
         PZCxxO27cUH/b7L3pMA/mauq2hWTybGxmQLJKaj8FWCMz5v3d7qbOAFVolxE7M3hKU3+
         JWujRCXJkHU5RTlPYasxO3pRhPCaP1XZysyR1NJ9xmBf/CAlMfFlxX+Yjp3IoCSDP5bq
         clNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767106127; x=1767710927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44VcDkl37stqODWRuC2o4+G1/5u25FomI/9zY3CMzLY=;
        b=H2efXKuOzPAcHPmVORxGBne/7oHgzJhTx2qMHZG7MZe5kZ8/ljdNQvb3cxjlVXWzIh
         Y/B/LcEq96r54sQkeXl+pCfDPu5zO71didfmXZ4WQHxq0KW19DbIwCtF7ufNlZgxi7Nk
         9PqdMJY42ve19GSTr9+ibC77Yrh8ZVMNWKJ+HDNE6mD0CqIx6DExbLXmyip/vhkEJ3pO
         M2IXF2OXbJ5Vtgzm67DLfocbDK3ycoiGKxgzOot5zNnuu2CpxtgeTczRWRY+crTJlfRj
         3uxjwAEv+I+ja2ycLndIC4M4naK2YRO1zIHZgQFToZ2aQ+dReajSkLLd/kSQqM3mbSBh
         n9nQ==
X-Gm-Message-State: AOJu0Ywh9tnJSSZ52QW1CIln5Xca2WdcVNyjfVY/XoN3GOlgYGDodPkB
	UfOXKY82T/AFlW1L2kqPoPIe3Q3PIW3REJI3qEl7gPgUvNvvXmFZ8ibLTh/J7C5s9L9yLb2TbbF
	MPmJWkhUBIeC1rABzsgJTQYwjfxmOO+6oC4k6996lVZyX04nLmI+H3M4Qz0zAXrlqOGKS
X-Gm-Gg: AY/fxX75+gGWuhdfAygsTZdgojMnidSmVOl5XQ6sngIMXypvaAqwuQeErPdbavrkBCt
	uoCIAzWXQiDLs+YUxO+CCTYV/00BvNAkAP2bfSMfa1DvPveeXfYy0CCwRmv8qHQ18n8xveFtUph
	qu11n6t7KxgCRMDC2eFTiXLoUqUK3g9DsnEQcz15/ohyIlBXTo40QB+gGTKcpAFJDrSubNFiJ71
	EnVkANvhiNAarb11Fpi4P2/LDfhEX8j6YrQ1BlTXaEDqSeQslQ1PF0LkYQPaviRArYYq28L5kjB
	063xujIH2oGlABn0dClqN4vYHdQXMgjOB9Rwl8NUlqB3W/Rzy9bsm0gRvqJ/IDJ9TD5bmfjtrCA
	szoY7afiC9kzsoJOjolJ3R/Uqd+C+jIkMH1lLR9eLtPYIfv6TXq34yMJMY9zwP2UpMw==
X-Received: by 2002:a05:622a:28c:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f4d620461emr290527931cf.5.1767106127625;
        Tue, 30 Dec 2025 06:48:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGETdr4GMukqFdT/GtejrMwrFxGgAe6B9S4UMqWyY1J7OQLJou5GsmhrZL6GOraFaVZUbZK3Q==
X-Received: by 2002:a05:622a:28c:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f4d620461emr290527541cf.5.1767106127172;
        Tue, 30 Dec 2025 06:48:47 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80426fc164sm3500122966b.30.2025.12.30.06.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 06:48:46 -0800 (PST)
Message-ID: <2afaece5-d670-4ce6-93fd-de111219255a@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 15:48:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 4/4] arm64: dts: qcom: hamoa-iot-evk: Enable UFS
To: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com
References: <20251229060642.2807165-1-pradeep.pragallapati@oss.qualcomm.com>
 <20251229060642.2807165-5-pradeep.pragallapati@oss.qualcomm.com>
 <a33f5b15-d574-47c7-985d-f181c4784b98@oss.qualcomm.com>
 <a64f088b-8509-40cc-9f01-23c8b87a8f3c@oss.qualcomm.com>
 <80529f8d-8db0-4b3c-b79e-8d5a3004241e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <80529f8d-8db0-4b3c-b79e-8d5a3004241e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEzMiBTYWx0ZWRfXxXZQySwn1gbL
 RCEXwGXESTVze3x+WE+xQ/wZ0ewYjBvwYyw6aARTHSM5MPt0xiDE0g0lyAFqVjqMOjauOkNz1L2
 zeteAZugryHB67MztXeE4qWN1C7PtA/KYpGIZ5Pjmei96vSQ0TkdK9ZUK0oZ5iyGbnPEJu8132S
 vniWMsJMRWOuEmI0zS0QKgLnNsi53pe9XI/EhwnNuBxDNRXuRAmJj/oJKe7AMB6KRebj56L52Fu
 OF4cidCUqTDd0tj7HkUNcWUV23rq7Yw3q8spqIK5e6Nl46JiTrFnLbfB98kxLVXI/se9pKMBZcO
 u1G9bhKaSplVKB12KlaIEUDHtXt++2pWZx+55bE1TJ4Q2ts8qARyyYFgwXHq9jaemmAGTko8iku
 jLF3EjtG1LDAGd+f+sBzjr/fV2ijmJ65oP6gxzscLnsNa8diGG+fYLJb65tqvEUa6oABXzUf9lV
 IMOEMyZhUNZjqL5XKsA==
X-Proofpoint-ORIG-GUID: PT-dUbbZG0l1dwK1NIpa6UUjMfehPEN-
X-Authority-Analysis: v=2.4 cv=KvNAGGWN c=1 sm=1 tr=0 ts=6953e650 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=R_39l88JEWD-bIkMqAoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: PT-dUbbZG0l1dwK1NIpa6UUjMfehPEN-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300132

On 12/30/25 3:19 PM, Konrad Dybcio wrote:
> On 12/30/25 9:58 AM, Pradeep Pragallapati wrote:
>>
>> On 12/29/2025 5:47 PM, Konrad Dybcio wrote:
>>> On 12/29/25 7:06 AM, Pradeep P V K wrote:
>>>> Enable UFS for HAMOA-IOT-EVK board.
>>>>
>>>> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +&ufs_mem_hc {
>>>> +    reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
>>>> +
>>>> +    vcc-supply = <&vreg_l17b_2p5>;
>>>> +    vcc-max-microamp = <1300000>;
>>> I think they should both be 1.2 A peak
>>>
>>> Konrad
>> This (1.3 A) is as per Hamoa power grid, which is same as SM8550.
> 
> Please check again, I opened the power grid tab in the internal
> documentation source that shall remain nameless and it said 1200 mA
> for both regulators

My source indeed said 1.2 and Pradeep's source indeed said 1.3

Because we don't know the source of this disjoint information we
agreed to keep the higher value, especially since it was battle-tested

Konrad

