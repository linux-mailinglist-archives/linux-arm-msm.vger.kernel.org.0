Return-Path: <linux-arm-msm+bounces-61933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C42FAE28B6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 13:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDCDE17B293
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 11:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69A91E25F2;
	Sat, 21 Jun 2025 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVnfEMuP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FFC18B0F
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750503941; cv=none; b=cxnVaIhjxvuhFNDnIKbnveDBC2+XYQ3NAHqa9VBPtnh3gm5H4b/P94o1aDz/F9rgx9s4CUwxpLBN0cHCKurvcCt4Q5ndsPSvKw0mePc0SVJjxyySPLkLAGOXDZX1Y8Zrvi4L971xpxQ/8y1Kc1OXRsAtVcg9HfECMF0Y3IGVXJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750503941; c=relaxed/simple;
	bh=1Z6zEw+mZOPSEcs3lq8hEcv43J7vcMirXB/zQftXcPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z+LkBAnirR2SSpyJalik3usPaFHtPXDodma3n4oRCdgOTZW+Yk+bHIdi4fOU3WqH1+1HAlRP5ku18mwoGNfAijBvl5viNFgnofG2CvMFyUhe7buH+rBVb4YxwBuOfMXSuMCyaIdysfQegzG1LhrqTsrEb6yLhSXChVseOgKCxe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVnfEMuP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L4Fl7m005217
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:05:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZXB1PpY2F+oO4eun6xnjvuN7Pt+G5hZZsl3ci+crjeY=; b=mVnfEMuPdyLGuHoA
	kILuSg3gk3biD+dVOqrc3o+02/83aNxhBZAG46Tjcz0rq4CZopM250wi8x+FxALp
	B5sNmDcnhfGFhjgHLLj+dy1fTYBIjrcEnpK3f/DpYxG+m+ZkRcoaZnWpdNUm8Hui
	zTxk3TEYQpJm0OYhpzEy+ezXZasRUpQirygHPRXsc4r193vIGWY0Nin0E06ZzsMk
	KDT5T0tefcPzqj0hEUxEP8rORlSVW6gbmwkAbu/mKm/nmnRv146ObtAieTNM2ep8
	Twel9Qev+qmOktzAJ7SIyLIa9IEFvRIve6m5MZh+qFX+JahypDNq2ie878/Qwgl1
	NtMqXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dngk8g7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:05:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so72359985a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 04:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750503937; x=1751108737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXB1PpY2F+oO4eun6xnjvuN7Pt+G5hZZsl3ci+crjeY=;
        b=Z0pyjMLl233Si3UOAPT8wrX34iofRnRdAHAdMmmD8yzvQiKZ2qVQAPy27Vromrib+Z
         rxHotSrnhInk3eqftY/tRUcm5JVFgpT3pEWdkGyXlpdk53ox8DOhpsKyGCeOH5PXEz6F
         pvG8LN6IDe7PSFxzgE2gVDZaMpUuVytFwsLN7GQ8MIRLW5NtvEd4tebkeQ9++EuPxT70
         Br7udMnjcLgBk67uq9xMs+KdFFOwEDP7f9D7abku7gdBGEGcBAS6VZkaOdL8zz8HVmUo
         vG2ADvwzZlJF6Eq879z4uodX58pwKyXcpcGuCZ5jru08Z3l6NdSSZs9Tzxo6sOdTa5wG
         EkoA==
X-Forwarded-Encrypted: i=1; AJvYcCWk1Bg02Jjhuj7yCR7gpdebQ8etcadOX4eKq9hdlf0Tpf2nYOKpFTaM6j9A2pnzTs4v7faTvapcU92+FaQ4@vger.kernel.org
X-Gm-Message-State: AOJu0YysaJqqGbecSs+zMiFCr8C7WTHFwnbsHZMjnRfbIh5DqvxAZlBd
	hLlKBuzIuPEJbi7n0ssFE0+CFbfyuYEF+/SrGHysmyinb+u+c/IZM75/QSHRgKcFGd/iNu5vaF9
	pmCn1ETDM7VXws/h1m4inxj5xHdc7B+QWvRBOfgaYLQE1cMa9BtZHj2t7hjSdI51N13SS
X-Gm-Gg: ASbGncv8uhLInzQc11feJxifOrcso/TgB5Kdr/oh1grrt1fqz+XMVI2TxO+5M81Mnp/
	qi0WnQLOcxyYXM1ctJxjSbVjl22X0RDAIBX7qRJdSzP5HTH4jywlNu6W7vfui+2JfPrMX5+ADO0
	B03bm2ir/8dqJoGD3GUoun/ChfVM/A0djXGlyXOMCP/0sVPiuY5iO4pfcOkoEPh793AOy3YgCTT
	Mn7xQiOLO4WYkfE3rfvUBHjglsV9A9la+uw+4XVotQ82jA6hvEGQ4WVOK2JkMJ5m5yrAgVYehIQ
	8PJFqTCP8s4cp1VkmVJ1122L9lQ9rjfM9h/R4AJEOLY0NLfLGCH3xPN74DOI0psdnEbzdFJD++D
	hPQA=
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr327303485a.6.1750503937125;
        Sat, 21 Jun 2025 04:05:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHqOaBfvcVqUGoQF69dqHQtBc9kWD43zsEVDVJq6OnhZKAULdX2fWNm3oy3pXRp98yWUAaPw==
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr327302485a.6.1750503936671;
        Sat, 21 Jun 2025 04:05:36 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecb9b0sm346802466b.39.2025.06.21.04.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 04:05:35 -0700 (PDT)
Message-ID: <13471ca7-0e3c-444a-947b-51bce87396cb@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 13:05:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: rename bus clock to follow the
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602-sa8775p-fix-dts-v1-1-f9f6271b33a3@oss.qualcomm.com>
 <74f7053c-10d6-4aca-a87a-0ac7f55c2f1f@oss.qualcomm.com>
 <jvld427airqpexaiglxe5hbt2svidbqkg3kvc3ysrwmqquwmi7@kif7otpk24zh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jvld427airqpexaiglxe5hbt2svidbqkg3kvc3ysrwmqquwmi7@kif7otpk24zh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2NSBTYWx0ZWRfX+UTJj0r+OLNc
 GUbbFHF8Ca2wit/1CAU74UxXSE0HSGDfas/7fXzIaGu3e+Yor2CFP06p+1EM6Nk0UUS4mAsbdUl
 lfU9MykH11TpXb6ZT/CftuV+pefbBP+oM6QdDEC3p+KDk8c9baet6xAm8ejh5wC7DRfpm+aIak9
 bLOwsEdjrDZTT3Hoi0V3CZemiNYelAoNZ8m8/hlqWsRolzsQNUB34HcmE/0vxc6vRJGK1om48nJ
 A46P2tU0L6rJlqfSl1rIBUC6S6l/4SskM/Hi57pEznjnDOmBxPAilAh2YNpldB1uFxl7y9xlYpj
 7rhvjhuL9D4+NqAxiaP01BuavqoDuDN/01eglcV+MpdHyY9KQAZicXvergRY4UdhT3ZQp7IF9jd
 3MSq8IigkEpLHJ2rAiY0VWpNhxsfKisF99rN1kNz/Iti3tf5gAKY5O9qv8219p9NjB9e/ME0
X-Proofpoint-ORIG-GUID: -d6hKb9Bge3LURNmmaB5VfyWwSEY2j69
X-Proofpoint-GUID: -d6hKb9Bge3LURNmmaB5VfyWwSEY2j69
X-Authority-Analysis: v=2.4 cv=K+giHzWI c=1 sm=1 tr=0 ts=68569203 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HVaNLapQHXJw-jFKH6IA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=991
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210065

On 6/15/25 2:34 PM, Dmitry Baryshkov wrote:
> On Sat, Jun 14, 2025 at 10:10:59PM +0200, Konrad Dybcio wrote:
>> On 6/2/25 9:23 AM, Dmitry Baryshkov wrote:
>>> DT bindings for the DPU SA8775P declare the first clock to be "nrt_bus",
>>> not just "bus". Fix the DT file accordingly.
>>>
>>> Fixes: 2f39d2d46c73 ("arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> index 45f536633f6449e6ce6bb0109b5446968921f684..7eac6919b2992a3512df1e042af22d0cbad04853 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
>>> @@ -4122,7 +4122,7 @@ mdss0_mdp: display-controller@ae01000 {
>>>  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
>>>  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
>>>  					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
>>> -				clock-names = "bus",
>>> +				clock-names = "nrt_bus",
>>
>> Is it the "nrt" clock though, and not "rt"?
>>
>> There used to be a split for non-/real-time use cases, but
>> I have little idea about the specifics.
> 
> I think this matches the SM8550 / SM8650. SM8550 provides a good
> example, because it lists both "bus" and "nrt_bus" clocks:
> 
>                                 clocks = <&gcc GCC_DISP_AHB_CLK>,
>                                          <&gcc GCC_DISP_HF_AXI_CLK>,
> 					 [...]
>                                 clock-names = "bus",
>                                               "nrt_bus",
> 
> So, I think, let's fix the clock name here to follow the the schema and
> other pltforms.

if we don't know any better, let's just make the checker happy

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

