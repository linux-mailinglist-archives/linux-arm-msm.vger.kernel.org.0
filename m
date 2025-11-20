Return-Path: <linux-arm-msm+bounces-82651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C6BC7353D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 5346828FEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4338F30E839;
	Thu, 20 Nov 2025 09:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cw+UqZJC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUp0SCjM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8E30F537
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632612; cv=none; b=Yqfvo+BFmJwoBHiCMHE+vu4Ol5Ms46aB0vDav+5RUtsTfpglThjqu7DGoOjmt0+fP/5xGy3NpiyrmbTk4rvKT2bOgJnJg4eEbawK0zCjrkPTkFeh7+yqxYVjVXskKQrc2/V2u9iAPdQNrgq7uqtPDrvmIjGAppzMoNkLjVii+t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632612; c=relaxed/simple;
	bh=dYQiH+2A/ObcqUe1z38rEra1ddiQe7dNN/KIjKWyewo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SM1lyujRTxC3ddK8c7g1zsiteyg0XTNp2iF29i4k6FfgmeRKmG9gKAto2o0pOXrpw0aRn4nHwPP/DxNYw+lY3x8vE1Geb2dLOWXzrQfJZtCQDSkFv+0YwT8Fe5ZcNF3dVJm/4OLnV/5EXDKNG2PFQ/WGp6FZv3hOHV+o5njjMlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cw+UqZJC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUp0SCjM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4pRnE3543746
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRPZWHGBPBxyuY6zaAiDYNG5oa18ExuZZpnv9szRLLQ=; b=Cw+UqZJCNsnBt1Zl
	QNbfmckNYUbx4cRRpsq4ISA6Jt092B1RDHSSgAt8QFsjfV4l3tczXECPsvC/5WPx
	I5xMA3lDThsXBtE3/Wuv6/iIr4DMg7MeVpimQA6/4Iyw7EN5E6AUg7jcIgSa2NvU
	800gpZTPMm6q1jbBCgBXS/y6QJ0H/eZqR9np+teeUY/2K6TG5jJM4Nk2MPZXcG7+
	9xFmPhaovdTH/SBq5K0XGXU1rK2F2Ws8pYfLQRCh4NN2a3/wShfIPTTkRU9WPO7r
	QVt9CuQPvtqcChlcLMW588nrggNNDtqZxnCjsVvaIfd6mFKpTSyGqRe9Rerw7bEO
	hbSsTg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahh8t2we8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:56:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee07f794fcso2702781cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 01:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763632606; x=1764237406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRPZWHGBPBxyuY6zaAiDYNG5oa18ExuZZpnv9szRLLQ=;
        b=BUp0SCjMM4daxqu4qlNVTK17BRuLCQwrZVhmkf2sO3M2WtJTzHXy61+GNRRkEEl4U9
         ZxlgZ4hLTNSfQuFxZ+QRV1lE87HgnHRFBnT+EBCqH2WFqC6PaIfZQrH6y9pDNwZ2t+Yz
         0wMyOcRMdKhiautFBI/jmVeXTKTYiGIKzbZ5I/vJVUfCmnIpPKSvDC7dvCJyWD2QuFh2
         hczjnIlT0Q7kauCuDaPXFNKRQ/Zq8firu1FNfExR2QEwxnLwR5iLK7jd98U9fx645D65
         u5Dhf+MWWKp1E8XMLlKKMkpp0tPZLbvjGECELiTcsPgxZzjaTQaOS5oyXzfPcBJrHw/R
         khbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763632606; x=1764237406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRPZWHGBPBxyuY6zaAiDYNG5oa18ExuZZpnv9szRLLQ=;
        b=FtewuVndYlRuvxwi2t/SCRRB9riNgmoHjoE5YU+tMF/eH6G/xAfozU3oAa0QvYMAFx
         EN2Yvlgi+ajwvKUs7wNkw+j8f0Bf85WrYcqvGfokf5SpnOrFM8rQp3hCv78ikQA1xxGI
         pHfT39x1g9KVk7/90bCaHGvPaz9cnfOfxdduL7hxrswkIOlQV6JySwdD6q19GlvzSdK3
         tGSZ6Zs2gzJFlwxW13GQ20AUO8BEhicLFh9mb4R86IKn38t+QGGQNXA+4GsvTRVCyU1h
         ydRm7txxaExedtbx1dgZeBF6bk9IwSvpRx84kgU5dMfQ2FhZe6L3Eq2hhU7RP3Qa+8v3
         jOyA==
X-Forwarded-Encrypted: i=1; AJvYcCUhfu8+Kx8gZESEAvrBlXnbfTiP3/U2SaC+xj1ewxIfYoROCKS1xkz+VVdGv9ZePrcEQli2pjP3sHJ2DLtx@vger.kernel.org
X-Gm-Message-State: AOJu0YxuH43UEbeKdZU9lRiLVwwcOQ0DxWN3M7aKnHBnt94O1gu2os8C
	85vrgWvfx5rhLRQeX61ma414T2mPINkod2JT9dv53Gp+IvS3Vc388naQPe0KFTHa5V28ESaoQFA
	YRtD4Te4OWVniOiXvqKoIOVKStyO5friUdRvTKqDW2aDki6v475an/fj7D8eJ4tkcPEUA
X-Gm-Gg: ASbGncs18zgym+l8swG9yWxwDR9l00QEtR8OLD5O5+4WZDP1D9B52DKvT46s+4LhzkZ
	AyLxFe17Y5VSDCRSLn/NjmJ4Q1IvFMzjvk7AzxNDMn9ehi3MTrXGy9SCoDMYnFN5A8TZCR2yZ/W
	PcK+Eqj+U43Mg2Wm3krTn72WJPRjjB+6SJRfNyUmA+LUYzPbaBqC2D3Roq0B3ixl0RW8wpY12PP
	GQ93tRqmituC3m4DxAZe33U4wO/biSOhPS95ycBQ+cJ6uqXNJQomfdexwy4OV/2iCQVLkwoSpTJ
	XyFlJfsmlUG4wRuMUcthmG82fKOADu6rl6ln1YSEvhyoKIGvP00SHMrbYfP73Igvn13eHWftiKi
	PWq4DQUOWcBxXiztiyogOsPr28hln6Nn27+9k76m7F9CtRvtLy8OGjN1OjwKokaC4GPA=
X-Received: by 2002:a05:622a:606:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4ee4d3d9577mr9046121cf.5.1763632605809;
        Thu, 20 Nov 2025 01:56:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvX5tt7Qoa7/1Nd3zshKb3HAhHIfws6mxUCD1woH2NH2kWlspMcanmSVKJFvTHbTJGYjt4Sg==
X-Received: by 2002:a05:622a:606:b0:4ee:2bff:2d5b with SMTP id d75a77b69052e-4ee4d3d9577mr9045891cf.5.1763632605320;
        Thu, 20 Nov 2025 01:56:45 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d50328sm174027666b.20.2025.11.20.01.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:56:44 -0800 (PST)
Message-ID: <e099d1d4-7e8e-4212-a324-5e790ba7559a@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:56:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: qcom-ethqos: add rgmii
 set/clear functions
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
 <b720570b-6576-41d7-a803-3d5524b685e4@oss.qualcomm.com>
 <aR7jZ4KkKE9nTsMh@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aR7jZ4KkKE9nTsMh@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F59at6hN c=1 sm=1 tr=0 ts=691ee5de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=ZmNGhu4S8FOEUr0570YA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: Nj88Kyt4KifxxM5fjcjyMRsq9xhlMk8o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA2MCBTYWx0ZWRfX3tTFr5wGYYSv
 I3rk/ZmtUm9hz5vMmMed8Hrpzw3l8hFmc6MO9QzvbnyiTGvLNVyyXIuxvNxoCVHOr8/w1xfyIKT
 NLP2MpAf+luIAnjCpribuZAch7cDR/ISL2RB/j64N6J7YodsExNoC1iEUUAVh1jJlzn5WaXO5q8
 BEmsulqMc8jjfeqZeEAtD88+hcQghHmy6lq3aKAxmQZmm26XLZ58CFeB7brw+pFGB01HOFdIvg/
 gRSfPlq+d6OKpbMM7caNsXaDsPVaIWwQwN9pGH3Pef7PYrsj5eP26ctfsmEJKIwbzPHkOJfEwl7
 ZN+C8JeOotcBls9KA93piUXp/SH89mqoXt5i2+pXyU5K+Jbm+m8/O/F8vUcTepTleOB2xchPgab
 +YWa3zjAgUUon4t33rpdRgYA+i1N+Q==
X-Proofpoint-ORIG-GUID: Nj88Kyt4KifxxM5fjcjyMRsq9xhlMk8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200060

On 11/20/25 10:46 AM, Russell King (Oracle) wrote:
> On Thu, Nov 20, 2025 at 10:42:04AM +0100, Konrad Dybcio wrote:
>> On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
>>> The driver has a lot of bit manipulation of the RGMII registers. Add
>>> a pair of helpers to set bits and clear bits, converting the various
>>> calls to rgmii_updatel() as appropriate.
>>>
>>> Most of the change was done via this sed script:
>>>
>>> /rgmii_updatel/ {
>>> 	N
>>> 	/,$/N
>>> 	/mask, / ! {
>>> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
>>> 		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
>>> 		s|^\s+$||
>>> 	}
>>> }
>>>
>>> and then formatting tweaked where necessary.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>> ---
>>>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 187 +++++++++---------
>>>  1 file changed, 89 insertions(+), 98 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> index ae3cf163005b..cdaf02471d3a 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
>>> @@ -137,6 +137,18 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
>>>  	rgmii_writel(ethqos, temp, offset);
>>>  }
>>>  
>>> +static void rgmii_setmask(struct qcom_ethqos *ethqos, u32 mask,
>>> +			  unsigned int offset)
>>> +{
>>> +	rgmii_updatel(ethqos, mask, mask, offset);
>>> +}
>>
>> It's almost unbelieveable there's no set/clr/rmw generics for
>> readl and friends
> 
> Consider what that would mean - such operations can not be atomic, but
> users would likely not realise, which means we get a load of new
> potential bugs. Not having these means that driver authors get to
> code this up, and because they realise they have to do separate read
> and write operations, it's more obvious that there may be races.

Right, I don't think that would show up a lot in practice, but the 1
case it did would be exhaustively painful to debug

Konrad

