Return-Path: <linux-arm-msm+bounces-80765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFB8C3FBE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 12:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E48624E054C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 11:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C52429B799;
	Fri,  7 Nov 2025 11:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbhMlNg6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiW8DJN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9400259C92
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762515282; cv=none; b=dDnZHWKQERpf86xOeic/cGxf0esY5/EU2+VnsjEtJ/y5JiTX9QAbYMp7nGTuPKyy9vT4jol18yuIc8+vpLKv0FNVLSfsYk/q74wIZf+RSy2TPr+wSP2aSMq8sLfol8CPolyA59m2RClmj5VXuEfINuRSpcgFYvXlG4qtV/qVe6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762515282; c=relaxed/simple;
	bh=DzX6zG53hv2kHHowOZ2dLhM5tvxoiava9KZ5+Tv0Ouo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNIcANcl6OSTuxTgfiSRysgec5GW+w5TEvTRQT3hl+yktZB9QxFqY4nBfNZ85fE5p7lBAGWAmBg2ZyGGD4L6LTN/6KYGk747D3wSTGghLE6+3t6RvltiMof/P4DqrfTDXS6tcnMBOjGWyotYThu5LiOhqSppC62QJso169W1fes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbhMlNg6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiW8DJN4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7ArltL1864376
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 11:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiFlhUG339a0VfWabSoqEEVYWNHYCJ3zv2+BmKWjfS8=; b=mbhMlNg6a8Eh/Eg4
	jC25f3ERL8KtItYqJP1T4SCPF5sO0yqkdB/xxI28Sow7f+paVZT8IcxO6q5WKQco
	/QkkvXrNM/3Q3kWcCFtMNkq4grI8mKUGYV+bm4ugCTP2g8OQoXj8wj5BxmO5GoVj
	HZ7k/6AECNCJ4h1xe4jlr2ulZQiI+U558tWmsPc1MgRZycHjGyxW5DjZ7RNYU/dj
	YF8HL/C0CwjXjsbF36F5CLW6bgeQhOuajLrj4XgY7n1W5bzVRPTba0mryeYs9Is5
	thz4vL1lu64xgwoyOettJbFuvWqG9u+hsQ5Kj8r1U3MZb4GtRTCqRERfMt5xuC8E
	ay1pzQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a98ta1bbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 11:34:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed861df509so1859911cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 03:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762515279; x=1763120079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiFlhUG339a0VfWabSoqEEVYWNHYCJ3zv2+BmKWjfS8=;
        b=LiW8DJN4opCVlkTHF1XTfs1ZXmHEXF4VWKYXGG0aU71mBqkHjLSaVZn5/Ft79uAuOK
         M4fCMEixaqT4zkeR+r2zCeq1ILhSyFxh9rORySZdmHHXag/ZhDGsem/0R/sHOe5ARxAN
         wCco9ofokb8yrdNC8Q9GJC/g7Ds6FD/1WwnKxAwJ0Z6TV9Fm+CzlGwFtdeqUMRYoTvd0
         ycHk8hA1nNgXOyvkcAOFmbP+YE4nRj0v2zADo9vG+gf5kiVNfS/G+Pojmd2tS1dQktNf
         VzCKZof1c/QSUqra4jL7J9Aocn4ZwlS1RrgYc3rLaHD1FIwWL/n+7UbCkiUAOptnx8KT
         l+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762515279; x=1763120079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiFlhUG339a0VfWabSoqEEVYWNHYCJ3zv2+BmKWjfS8=;
        b=QCOBh3nFjUbL4WXbzR3obArSV8eOm1M6rjYVE6771hlCQJtRLH5jCGIc9/J9fws+zS
         3UE+3pqXdt6t6ht9XucfsZux8fqPS2XOfTpKkGKJ3YK84TxhvEbigR5+54fbkUrbqgJi
         IHa00rVIvZ51fMGQIYXbt+na7y9tdYza9UQ9ZHL0y5lb08o1ZaKbJAHhixRXqBo8Vwjd
         0Ks9RyoM1JzKWpp1NSWazz82ug63x1hYwzLQ8JQna+fX3PmshlMZ0yjnd2b5ltxMSxx2
         6Lcuno9eq/LgUPuUYpXlQ9jZe5+rOWeRs+IfYWkQtImQPu5hYY9GJMofH7p74bz5mjVb
         i7cA==
X-Forwarded-Encrypted: i=1; AJvYcCXppw4yBSG0x18bJUv45UZVPEgnkBQsuzdI9o1Lvijo6hgQxQ0xk2muQB1PxRqQ3hBKnPEuoCyvDPVjg0kY@vger.kernel.org
X-Gm-Message-State: AOJu0YxJJKBobSat1FAw7m6BvLFXJSslheuahFUWFBRw6Ova83PeH+Zh
	gMDMahwFDqQ4yCtuiKh70LivpSS7nPMldXYS5sj6+g2hP4ZEkt4hsUc/ufgyPBsa8rRSxE5TrZG
	eSN1WK4zFNcPQPSDoU4PWmWkerf5TcOngoaPZMSWajCoclgifQOa0ydawhwHnGbfWbigT
X-Gm-Gg: ASbGncs2PFXOITCTZU6zGP5y5pFOhUw1RN2ALRFxak28FleVR1zyyFFIWzqfFDXAnNO
	fLRYf5QPESuM7KrspNeifgwRzHHDYuJMb8JqDdeXMlbwUWeA0bT7YzQyU1bYLRC4IBGDWE1JyZF
	Odj70B8kNitUJ524YdfXYkJ6Hiz1XtzjLPrYT6bbSW+RhsKGyL6C2iQPwbcRqnskyJLik73NxGD
	+aPSXUAzCbZp1esIbAvr1xMCYieK9Z0QtMXMFmPf8/dDZj8tU2gG1SaQ13fMhZA2lC8ZZjvyklG
	SFL9yP4ZiMaEF6CVKeV5vXwHlgUfBOiAd/Z0G8dwJCoZ0shiJiMJPEU0yNPHPNeZaMJEyqWi6Vs
	qbYlmkUKFuPxE2lwPjsXKTy3ycxyEHXxkhi69iyka8tjxVgz5QmNxATJN
X-Received: by 2002:ac8:588f:0:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4ed949427a0mr23309301cf.3.1762515278918;
        Fri, 07 Nov 2025 03:34:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+LAqOyus8ryKtljdjGtTT8tpekQXhHgSlDk1UkXksjpY7RbYCRhZLRuzIlyV/Mr61stF/eQ==
X-Received: by 2002:ac8:588f:0:b0:4b5:e4dc:1ee5 with SMTP id d75a77b69052e-4ed949427a0mr23308921cf.3.1762515278322;
        Fri, 07 Nov 2025 03:34:38 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbc95e4sm223260366b.12.2025.11.07.03.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:34:36 -0800 (PST)
Message-ID: <a80d25e3-9178-441c-8b09-3f69b703484d@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 12:34:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
 <aQNXTscqFcucETEW@shell.armlinux.org.uk>
 <bb2865b6-6c17-49e4-b18f-b9baad771830@oss.qualcomm.com>
 <aQNwoC6aMPMMk4M1@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aQNwoC6aMPMMk4M1@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5NCBTYWx0ZWRfX0xjCWoGQkIW+
 WfjB5SlyCm6GdbtD2ztJwCmNys3Jm3Kr18TdEays8Rruv9OX7dnlmsmeoOSoqZDIox2kQK1N74E
 pbVFvzXZsJF5J+Yx1gSXiARHKuX/CJNYax7bp89PjMNga5szZdcFuzLbzZUG0xPPOF4Gb3waaqA
 VZ4vEZw6u18Vz1bAU8Qf49cf7+1Ev009h49TXq0fSYQ/FT7Dedh0dOGHxM6jLLsLDYGcbxbg/cC
 7KBBtMS9v7X5cm358c3AVjGgFvNR0CTu0AzMt/IWB8AqGsCPq+7ez5YzR1FnBbBu7zYUGK6Gq+g
 5bpr8e5RbG2TP1Kln7o13x360QWR9RIU3KeDH+Skf/MhEolaDTdwlMTMS3QRR8pdnl/sNYxn40G
 ejKdtuGHtbvaQux2V9kNBBI1TTtjiQ==
X-Proofpoint-ORIG-GUID: aUNs6pV7quSgad2bavOC-7-L2e0JSRMU
X-Proofpoint-GUID: aUNs6pV7quSgad2bavOC-7-L2e0JSRMU
X-Authority-Analysis: v=2.4 cv=G9IR0tk5 c=1 sm=1 tr=0 ts=690dd94f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=H4ebBzf8g92K_wxokogA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070094

On 10/30/25 3:05 PM, Russell King (Oracle) wrote:
> On Thu, Oct 30, 2025 at 02:08:41PM +0100, Konrad Dybcio wrote:
>> On 10/30/25 1:17 PM, Russell King (Oracle) wrote:
>>> Konrad, Ayaan,
>>>
>>> Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
>>> and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?
>>>
>>> Specifically:
>>> - why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
>>>   speeds, but never be cleared for any other speed?
>>
>> BIT(16) - "enable to transmit delayed clock in RGMII 100/10 ID Mode"
> 
> I guess that means that changing this bit is not relevant for the SGMII
> path, and thus can be removed:
> 
>         switch (speed) {
>         case SPEED_2500:
> -               rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_IO_MACRO_CONFIG2);
>                 ethqos_set_serdes_speed(ethqos, SPEED_2500);
>                 ethqos_pcs_set_inband(priv, false);
>                 break;
>         case SPEED_1000:
> -               rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> -                             RGMII_IO_MACRO_CONFIG2);
>                 ethqos_set_serdes_speed(ethqos, SPEED_1000);
>                 ethqos_pcs_set_inband(priv, true);
> 
>>> - why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
>>>   for 10M, but never set to any other value for other speeds?
>>
>> [18:10] - In short, it configures a divider. The expected value is 0x13
>> for 10 Mbps / RMII mode
> 
> This gets confusing. Is the "/" meaning "10Mbps in RMII mode" or "10Mbps
> or RMII mode".
> 
>> which seems to have been problematic given:
>>
>> https://lore.kernel.org/all/20231212092208.22393-1-quic_snehshah@quicinc.com/
>>
>> But it didn't say what hardware had this issue.. whether it concerns a
>> specific SoC or all of them..
>>
>> A programming guide mentions the new 0x31 value for 10 Mbps in a
>> SoC-common paragraph so I suppose it's indeed better-er.. Perhaps issues
>> could arise if you switch back to a faster mode?
> 
> Could the 0x13 be a typo? Its suspicious that the two values are 0x13
> vs 0x31. 0x13 = 19 vs 0x31 = 49. 0x31 makes more sense than 19.
> 
> The platform glue is required to supply clk_rx_i to the dwmac's MAC
> receive path, deriving it from the 125MHz SGMII rx link clock divided
> by 1, 5 or 50. Normally, this would be done by hardware signals output
> from the dwmac.
> 
> This suggests that the value programmed is one less than the actual
> divisor.
> 
> There's two possibilities why this value needs to be programmed:
> 
> 1. the hardware doesn't divide the SGMII rx link clock according to
> the hardware signals output from the dwmac, and needs the divisor to
> be manually programmed. This would require the divisor to also be
> programmed to 4 for 100M (but the driver doesn't do this.)
> 
> 2. the hardware selects the clk_rx_i depending on the hardware
> signals, and while 1G and 100M use a fixed divisor of 1 and 5, the
> 10M divisor needs to be manually programmed.
> 
> Any ideas what's really going on here?

The computer says:

RGMII ID mode - speed == 10 ? 0x13 : dontcare?
RMII Bypass ID mode - - speed == (10 || 100) ? 0x13 : dontcare?
(*the 100 above says "default" but that's again 0x13)

RMII mode (100 Mbps) - default (0x13)
RMII mode (10 MBps) - 0x13

SGMII mode - speed == 10 ? 0x31 : 0x13

Make of that what you will, I would *guess* there may be something like
2. going on

Konrad

