Return-Path: <linux-arm-msm+bounces-78373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF2BFD5B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 18:49:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F413F581A15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D823F299A87;
	Wed, 22 Oct 2025 16:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RU6FnU3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D0A25782D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761149846; cv=none; b=MJl9sNoUPCQvaKqBS+00WCYx4qBZtt8P7otKA0EsFSfofzaEU6O7CDCYDylY9lQD+f0dCrM3Sek28olKJiVj1vOj/UI4wuJxpWSFaS6k2R6HYBvuMBx6xItTRY8lyN3iMdVkWnvZVI8ekJ4Uz8248qwN/1Wj1bxwBYcTGp2vptQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761149846; c=relaxed/simple;
	bh=7909EFCZVzxjPNQLeS9dieFc1IzT7p+ZR9mSr68+ju8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1Fg127Nc5rc95h2xTCE1q+HyZqAAeEZd0TYI9Bp4233M3YBpfGfA5KItnTovUVVDduvMJb8/zPYGKvqH4BZO6dvTUY3/SyZ214Fjnragu8GeVQAxU7CO6SpxvYTSaYl4CKNfHZKR2TjEKnq45ZeW07kHnYEaocGG+RMh9zhtkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RU6FnU3d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MEojjo012327
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CwhMpbCUhSUmGYknZGW4l46K5hlan/s+wby4exYafxA=; b=RU6FnU3d59ZvzKpY
	4DWnKXkh60vGriy933P5bbDd3t5oawKxsINkKmYu1sGtQNbnW0PYqEHtST31r0fK
	gUM7LyrhC6GvzM6wLzysjviDIUZlMgVe9yfjfzDiPSQpuYuhpIPpKRwG9tSanioJ
	oGQ0QA3LLVrtM6Gq+xmRAW3i1sZyhH1IAt4H0esXqGeA5bOlQoeyHotT6a1o/JRm
	jdZ9K/xVyUq7Bmpf5nwyuuXJN1aGi/oqNLW/rnJ/g5noDpGw4LDhPBZxDoqqz3dc
	liTXYzRAXOHbjIGiVP1UifLkHk6a0+N7pP+2XT7Kj1gjxakM0reQocmXPcUfBwp9
	L9DiFw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0k5mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 16:17:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5872e3b04abso740684137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 09:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761149843; x=1761754643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CwhMpbCUhSUmGYknZGW4l46K5hlan/s+wby4exYafxA=;
        b=k/AE1/1fNPssNrtzcE5td/W+KuSgOgUcRex9KTYgBU1tX0UVgru/bIqL/4jAkKz+/D
         IYoWHJG+rQ3GtkOux27lvfXslpOhrZ5D3czB7Erjac/gPfWy56oTteF6bjSwSH4jqzvd
         VLgW1bq/1Ye2cbQlZW1jhH3oaYe8q8fJW4T9ljosOOf5j8mryYfIHZmzSssMYkWHSe4P
         M/nwlcHGM/b0WCNt4x24+hP68kK1Vbh6Kw0VCULaAILMMaoWEpRqyUwoIir//GkftTwX
         UGrziRokcsjbip4k8SqCNHGmFx/6MG3LJG6sSXupLpcnMXVPysPET2ZDS9qQ/nfs2do5
         yWTA==
X-Gm-Message-State: AOJu0YxItd1I6nIg4LoRbdxLP03SNpwx3Gv+xsLwMeBFm7IzIHBONEkr
	ChpBoFO9H9fFPcEiBoi00uC8eksIUcGYP6gCbm1nlQ7w036V34ENRrD3b+bqfDdCsPa6X/2QZrZ
	4IWUpUcftVPP019eQmJoV5UleIKV8eD86pPvl2pLzqS0+7NCPwuiDY7hyt0B+zML7lvax
X-Gm-Gg: ASbGncvxmz+gtdPjDG85UuGZUmEW+X+fOnDZg4drpL9/lg7tENsvF6Bx5eemUJQiX2e
	7a/UbzWobIuviw4AMV77zjS3gwGB+SQw2L/whh2nzl6/akMGGFb+CS84dGVIf2QWmx2Gg6e22fb
	UmBM/5tip/Yj1awEF49TqWV3fuz+n7QDicus3LMFErdX2M8D/Zv23ktk4eDIQK4BGhHAeJmnM/d
	uL4qkIwvsld0dq8IDv0YjCgFbMx1YvG60343QBDHG3OirJCb/2onm++IrGKW0Npdwm5BcxgFTnM
	2fOeV38Qxy3r3ziY2JebwSAroSfgYlF+P0zcOtQ6vbCLEhkaZBfojVc8jFJUIcI5mIt97Vz5DyO
	RHHhwWP6wozwH9IO2FzvBPepiQ1VZxGT10C74wqZkiFJX4153d75C55nY
X-Received: by 2002:a05:6122:5215:b0:556:9d50:7ea5 with SMTP id 71dfb90a1353d-5569d508084mr349216e0c.2.1761149843252;
        Wed, 22 Oct 2025 09:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXH8CkUOfdOZ/99j8RNVUBwBPGkhStJMi1yxgoQoY7YZCYd2Y1gb89wBcUB1rlBjWLIa0mGg==
X-Received: by 2002:a05:6122:5215:b0:556:9d50:7ea5 with SMTP id 71dfb90a1353d-5569d508084mr349212e0c.2.1761149842804;
        Wed, 22 Oct 2025 09:17:22 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d40790b88sm33202866b.25.2025.10.22.09.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 09:17:21 -0700 (PDT)
Message-ID: <13b8651d-c59f-4d3c-bdc6-9ce2b088cf48@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 18:17:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix shifted GPI DMA channels
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251013115506.103649-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251013115506.103649-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX3HWm29PlPm/l
 H579vDQCM7a6rsnsCiipOSmRP+awTgGnGKMDF8lISwHehOJS/jX98wGLchAqmSl2YbEyjSWezAk
 qB5/KSHDTHt46uHw5Uip7vhLueYfr83p7MC6qZBXWyjuSg4BgXP3lI78tVxZbXycJclDrL81LDJ
 xkNAe5oMZL/b4e5qa7ukQ4kSKPERUrSXTyVZQgrPkMEE9hmD9iEfTw5wOPnitixE6SIssi2/T+Y
 V829Ugu8e24D1thk5QAuIPPlggd1MrHC0dGzL/JPfY4iDC3FceLJqNi2PtXRLO3bl1++FAhIHJ9
 L2Dxvb54nMjX/oJimgE232eyuFoibaPv/CHzs0gwMkdNHDh+MaTTp5lJD4S0sRxZJmvUsqM+xQo
 s8PPC7PSXOERmrKrKu0OE9et5tjodw==
X-Proofpoint-ORIG-GUID: AWdClgY_V0xlGqnEm9oP6bHG7LOfFCX8
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f90394 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=inrnm_oqOa-xIY2ww0YA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: AWdClgY_V0xlGqnEm9oP6bHG7LOfFCX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On 10/13/25 1:55 PM, Pengyu Luo wrote:
> The GPI DMA channels in sc8280xp.dtsi are wrong. Let's fix it.
> 
> Origianl patch was rebased to the linux-next and formated to a new
> patch again later, then it got the GPI DMA channels in the new patch
> shifted.
> 
> Fixes: 71b12166a2be ("arm64: dts: qcom: sc8280xp: Describe GPI DMA controller nodes")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

Thanks for fixing it up

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

