Return-Path: <linux-arm-msm+bounces-87785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B0CFC1CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 06:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A0E2301B2E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 05:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BFFA13AD26;
	Wed,  7 Jan 2026 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRs1+M3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbPXhX5m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFDA17993
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 05:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767765095; cv=none; b=Q9g1Fzr6YwviY+ZdkGxRuqI6pb/E99ZM9onVctDxtxW6dfOSS2h4ePdynnuxmFIlULJIaD0FFgPtuuqDEr+IeL5pn1HKyqXh9mVqqifRBNDFwJzumSW7tjMJjBxK7Dn0elVJqWk1fYugsoZRwnfEJlXD+oSjjiaqVo5LpqBDbZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767765095; c=relaxed/simple;
	bh=mGyvejjKrq72F3AM25T+UZZAwTgwXHsCXrkSI1uLPFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMB7nQ0TwdO6l5RcuUirAlte2q5uBs8/jEWQMtoyuB3lhu5KCYjsTQpSytHgTJK6L+x32af8rgY1fI8Vi42LITIrayI0cuZfuhf1thNQmPiJSLRA/5aSLhQaQNBtji5w7R9XT4gXDsKgTVBgvqzsNn7u+LslSBWmN3yQ8IngZzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRs1+M3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbPXhX5m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6071HLRB322772
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 05:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nXGAvmSu/51spOzf+pzhcIdBM7PSd+n1sojrUbHh2K4=; b=JRs1+M3/UVWnLr8b
	WfopmPPbqUBF+Pxv+f0rDN3yQ07ILsmzfb4+QosC5crcjBpjG9i2l5ZP9GxQ1eG8
	8qoTR/f3AJQt9qiZu2AkmQ0LItlk0qBsD2/vCLXtJAl/1b+LVons6C5GPigB8v5l
	8cbc0n18Alh2ZBbRj4yX6OoulUTWHO4Y1j+pmwUcU2K4ov0Iu4VqKceO0CnOgg6V
	kMUNSm6x3CeUzwZTB672RDNiMJOWQSHcpJTclfGjCUla8PGC1js+OJQmDJgZ6LHA
	g7/bvrApy2NdHStzXU2Y7CFenlXZgRcmegcEuk8RJ91khtrsBDLUAqqg8OYVmlCL
	bLqP1Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh4crjcsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 05:51:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c387d3eb6so1522307a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 21:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767765092; x=1768369892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXGAvmSu/51spOzf+pzhcIdBM7PSd+n1sojrUbHh2K4=;
        b=HbPXhX5mFpy1iiTtd5VAugYwrKMSC39FV0RC1ro4+lPctGbgJhnMtHM3abBEIG0kHZ
         A2tpjft0/nJOHRQdbyXJtnwodA/nLPSrbhuYD6cNY3QR1jydV6ofU12ewdDasjESj3r7
         OKOLpnh2KeleH27kkulua/GnHiP1MZa7FwkHsiOyHlfWBbM6A5j77WIBdeDG/8rEx1r3
         EfvuJL90ja1BoJ2DOmj9LELARqheGaFUBb4TL66I7ByTmCog2J5kHsEHeLVtIxxgBtKI
         EpRCKPS8HS2tYzjgtavewdoHp6fA/D5xyLlJiPKVw6ugS/74dmG/ggclKbyBX4qdXgtd
         sYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767765092; x=1768369892;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nXGAvmSu/51spOzf+pzhcIdBM7PSd+n1sojrUbHh2K4=;
        b=ihbOPUkuTKebGKlbYBOXzytpKLDkL4YhElhuZbdAgeRVjUeAL7Gf2rNpHU3sdSTv5l
         J/sPFX6gffTRHRoXN9wLYepdGkXMK37ajB7BWawqaajv0TdafOasnWPLEP/NZZBZAiTt
         qGqunVlVxDy+f7Tun4SFybgkIjLVn/V+qb+/7BTglmHJ0oF8frMGUaA/Q5OzVG1UxHrg
         YohgM/GdJMc6xgr/wKm99+CTOmVAWPtAjF3DQ6HFV0EP7q9cIuVZmyKaGg5d7AvysUpO
         0jYaKoPsUVFvsKcfkZv/7p/NrKHcjswgyZ3/RTYyUYzPo0M5sgikKiGHwkN60A+gWwRH
         01uw==
X-Forwarded-Encrypted: i=1; AJvYcCUlNygfIQf5e+pQiPXCV3bfDQTe+1Qkr8MOLgQ8uhvPqSq9Z2rY+hT94eIEihDKsnjth0dOwQmOtoirI4s1@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc9tayyZWjA+tBtOp4DaHLJenYh4vCIS9IBBtP7d9QpxgCCBPj
	ZL6BhZnPq8o94uiklhilmPjPHPBXoq5+C4OJHL7kuz5WuHUvV1ehT7m8AO9viVf447Sln2eC+rr
	OZvYlBUZStW0okwr1+xUJOIG8pQrGkqQ6TmiNvtOSOQXK0EkQgvg1PauQ50sWTBZTn6Aw
X-Gm-Gg: AY/fxX5SjArcN5c1MJ0sqA3JxeTMAW0N4csiMlZ0USneV8e6ZaNwvpzlbbl05q6uTvQ
	e7Ct+nZHGWrERrJhgw6dxEYuyd/LMt5vgWfQZvkZulszkEGhHEJ6ItlW7DjOOpe75n83kblC3gh
	gf2PuJF0/f+5KBDhYED2DqOOsC84IYkoZUVYChGptA/RCxD+GZAbZj2ZfIpwelpk1+Hln5Yz2Uq
	n2fzt4qfypKodi/mmIvTeNoBKZQkFD8bbqEz8xLA+Aiz4EWcbz2N12sF10tuw2Iscw8rR7a85IH
	Iovd+dpAaeMc8Uxh1TY6EOxPwtw/48AKfU3TAQsKT4ggNkI6YZphpEzlD13UYDc6IpQvh/9LhiZ
	pn3eXd/3denthLIwQA1b9PhtI1x/IobwcTzwDQaj0loN82siMzWs=
X-Received: by 2002:a17:90b:2251:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-34f68b65ff0mr1353222a91.13.1767765092339;
        Tue, 06 Jan 2026 21:51:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBvUZCcUtaBqJgxkFmXbuj2o5AZhvWJWylevjOCJsxj9FNVU2+6RvoqCZGDUaUXjdVhEEUNA==
X-Received: by 2002:a17:90b:2251:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-34f68b65ff0mr1353204a91.13.1767765091848;
        Tue, 06 Jan 2026 21:51:31 -0800 (PST)
Received: from [10.217.216.105] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b7b3e7fsm274007a91.2.2026.01.06.21.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 21:51:31 -0800 (PST)
Message-ID: <530af0fc-9574-4d6f-9469-f08300da1f74@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 11:21:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/4] Add UFS support for x1e80100 SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, vkoul@kernel.org,
        neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, martin.petersen@oracle.com,
        konradybcio@kernel.org, taniya.das@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        nitin.rawat@oss.qualcomm.com
References: <20260105144643.669344-1-pradeep.pragallapati@oss.qualcomm.com>
 <y7lm6zqgbhk4243diyotvox75tcmzhgbkypbkaskrtjcjbruwm@ar7kjmiyv2wr>
 <0689ae93-0684-4bf8-9bce-f9f32e56fe06@oss.qualcomm.com>
 <l67bnlyrrirb3rnz7izqpe4soqjuvkbi2xawit5w2wrcc74vdo@exo4mbpac244>
Content-Language: en-US
From: Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>
In-Reply-To: <l67bnlyrrirb3rnz7izqpe4soqjuvkbi2xawit5w2wrcc74vdo@exo4mbpac244>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9FwEOni c=1 sm=1 tr=0 ts=695df465 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wfhwzJ6r3g_IQgliFxoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: jEh-khwa09W6I8SmT4FUZFfcp4ZkRgsY
X-Proofpoint-GUID: jEh-khwa09W6I8SmT4FUZFfcp4ZkRgsY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0NSBTYWx0ZWRfXyUJnlAa6PGZe
 8JN2FdeeItcpuSSM8rx6JYpIzRkjn9glace4Syr2eTrhPN2/qNAyNCwWYqCuVeKPBRaBAv7gDBl
 47CmfMVSrnUJr1bTg+s5uLL4B467FPWcpHSFL0iJTMw61Li0taPQxtcV4ZF9tGa2Hmpnc78HF1y
 DTv1unc57Fr96VvftBmKZiJT6LaM5SKmsa9CIBOMw8CeRhxNTbkvVrrmVdDpcMG1W0iDJmYIO5p
 BB3vWk4/pJnQBllc+qj4J/5asXmauRZsHB8gNQZsbtpbjdbNNO73ZoL6FM+YUe9+7ozNn+Q8Sav
 1LGjIhjOD/v39VDw+Q+uf3iJkRTVqqa+Eu7aArbxWJmn20p5ELYpfysacN6ayUjIm8slOaL9dCo
 PUsw6oPTKpgnD0EJ4HTeIg2myNymVAxjlAXN768TWRlZWMsCEgAbvUjPB5ymzMMY/h52pDRNvN8
 Z2Uc3jA86o5BLhKj4ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070045



On 1/6/2026 10:11 PM, Bjorn Andersson wrote:
> On Tue, Jan 06, 2026 at 06:33:19PM +0530, Pradeep Pragallapati wrote:
>>
>>
>> On 1/6/2026 3:50 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jan 05, 2026 at 08:16:39PM +0530, Pradeep P V K wrote:
>>>> Add UFSPHY, UFSHC compatible binding names and UFS devicetree
>>>> enablement changes for Qualcomm x1e80100 SoC.
>>>>
>>>> Changes in V3:
>>>> - Update all dt-bindings commit messages with concise and informative
>>>>     statements [Krzysztof]
>>>> - keep the QMP UFS PHY order by last compatible in numerical ascending
>>>>     order [Krzysztof]
>>>> - Remove qcom,x1e80100-ufshc from select: enum: list of
>>>>     qcom,sc7180-ufshc.yaml file [Krzysztof]
>>>> - Update subject prefix for all dt-bindings [Krzysztof]
>>>> - Add RB-by for SoC dtsi [Konrad, Abel, Taniya]
>>>> - Add RB-by for board dts [Konrad]
>>>> - Link to V2:
>>>>     https://lore.kernel.org/all/20251231101951.1026163-1-pradeep.pragallapati@oss.qualcomm.com
>>>
>>> Where did the previous changelog go?
>> i missed to amend, i will update all changelog in my next patchset.
> 
> Please just adopt b4, go/upstream provides the documentation you need.
sure, i will adopt to b4 going forward.
> 
> Regards,
> Bjorn
> 
>>>
>>>>
>>>> ---
>>>> Pradeep P V K (4):
>>>>     dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY
>>>>       compatible
>>>>     dt-bindings: ufs: qcom,sc7180-ufshc: Add UFSHC compatible for x1e80100
>>>>     arm64: dts: qcom: hamoa: Add UFS nodes for x1e80100 SoC
>>>>     arm64: dts: qcom: hamoa-iot-evk: Enable UFS
>>>>
>>>>    .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   4 +
>>>>    .../bindings/ufs/qcom,sc7180-ufshc.yaml       |  37 +++---
>>>>    arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts    |  18 +++
>>>>    arch/arm64/boot/dts/qcom/hamoa.dtsi           | 123 +++++++++++++++++-
>>>>    4 files changed, 164 insertions(+), 18 deletions(-)
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>


