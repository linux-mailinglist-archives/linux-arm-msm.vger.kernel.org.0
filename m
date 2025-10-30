Return-Path: <linux-arm-msm+bounces-79687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2938C202AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 14:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 735494EA664
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 13:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2FF34D923;
	Thu, 30 Oct 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhNYdDbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rzf7128q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCF7337111
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761829729; cv=none; b=oeycm7tOGnA0rL0aNQ+oOmV5ZN+PcEawdAbXV+i9LEbG6KkFtU8kmnAh4j4e8eEvBAGMnRIASSlWYsvitP835iHBNWR1HCIUClx8BatvsXxQdr2blwFEmErmzDyc25j2ykzAWt0O9PgBsCia5aotK9vBjooyS+JGoWCD3oiD0Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761829729; c=relaxed/simple;
	bh=tAvKUtNyHnRRDZkwJQwRV8MtUavJ9kqeOFCmM/bad5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wj4Fj+N4L+fyUEnXw3OLUdaUzq5nHhxTKxNOupkhNn/3qDPQGHycm2w7isxauHwuLkg85ddNMldiwnmVwka64gmMil3DRbeqjAKifszwoqnvMSozaL+K82Kk+8PwlBjGPt+r98YrAvXEs5MeGzCupWbOHpPdJFuWN5pzjBB+62E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhNYdDbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rzf7128q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UB9A6W3810119
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 13:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smYwHmNh+57aWsOvyq4jjr8shuV36p0KhLpGubvmvxY=; b=bhNYdDblWuBJxjD2
	mL3qoZCyJ+T442aZtMFZeKLyjL1brsyd+kgrVcdTuCxi6kTz/mVm3sfgOWja9qsx
	bhXzmS/GuwcopzoczHF6ETNUOu5sYE0HSZNCYqdg6JLjTRUZIjvqREnmi2UgcanI
	QxWvkkKmvUe6MfTKYPNxKl0XYWPxxp2bxxJ0rrr9BBmg0ZB97cacltYlyhxYp4rD
	1pOkYutpydNYGIApCeJYOA0O9pd9eR33D+i3YbHN4coAmwp6wnR0gMPn3OfUjMv6
	1LkNxfeIMqj3XbLynfMP33wzuoVdUtrW224QpUZNJbCllU2eV5+gKXYuwaWiYGm3
	H4PsWg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a46vv89ms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 13:08:46 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5d9650fa510so11870137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 06:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761829725; x=1762434525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=smYwHmNh+57aWsOvyq4jjr8shuV36p0KhLpGubvmvxY=;
        b=Rzf7128qDjoZnPhL4W9nz/azxyDsCZR7AhCcpeFBQtOxUuNEzN0aPKw8IH8JRYIKXT
         jWqgTt3GOs7p5u1O/Iq4Aij+nB+C2ftPSmXIvW8GKfwP1zr3f+n9NJ2Ejfp988r+PLjS
         G5oEjB0iYcyhM93Q1VUcWcAlaxWNa0PnVlVsou2bEPXt2nkW/RGhg/mDq+xz5FXiq4L0
         98eM417JotHfxBrilFyXE2W9twpPc6t4LZXZ659zYP5Jwz4yAuT0RUnWVk3rbUlcLkMl
         3ek1byl+cXxJqk+YjxDM9cGFTNUK/Vkvp6BMe++PFXZqpTHbPzLRhk7ELbLnvhql2Qcr
         Rk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761829725; x=1762434525;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=smYwHmNh+57aWsOvyq4jjr8shuV36p0KhLpGubvmvxY=;
        b=Mr4EZzqvnTrELGuR1hz2AMaXgqqWQJNj2QNNZ5fwxNamSgjY4+RTGZ5nB4U+dHcQJJ
         rFhnunohOcCgzZ4wBPQSNJq+181U49SrpzULVx0nimp0NXKXBHN0WdnhoCxOZZQtHIq+
         mDl5yNvqhlMAqTYWPN73Hf6dQLYOVCAilbpAy+E6AOKeGjNec2bPULoYgZFw2Rfq73hH
         GgLD5JZs9ljlhI5cB6MPAJJX/mTIAPbaVbi5pRV21N3nj/iAjUNLF0IAQlOybSehjhkk
         8gdE9v7l4fbf+GvaUgwdOlolnBOvz8QZP/4C+0Izd0HDshKC6nQJHQqd4fwDJTK6ZE6W
         p/6g==
X-Forwarded-Encrypted: i=1; AJvYcCXlO14426Q96un6Pe/20eDl2nBfcmmt6UhNVYPkFlnrt4qrZ5cYNR6CTzOBojE9Vhe+rp/zV2qtdhAlz4Jb@vger.kernel.org
X-Gm-Message-State: AOJu0YyrPu5SY2nqsTI5iAY1g1W6Me0keV7C+lEOQvnkljBuObvKDQfn
	2YBmZWs8/4NuKx5CH3CFiHNsNdm9CU9EB9kqpm1b00U5vrCYOzkJ3F83w6JvW2Psdi2rAp5oCeW
	dER3884ZlXLLKqhCOvOT8k2kNlenRZRCoBeHWp85y+B7ikNBiyYWG6OtV+uiXgjQYSZ+C
X-Gm-Gg: ASbGnctwnYKr1TjAJ/9/r2Czu7X2o64RyUGONVTK7RsyIa6OwNDp+vI4eTj3yFRnJeA
	+ocI3knjtSHEWXh1BfHP5jiU0n2N/mNnyWJaugxDAKZuFTBxzspVx2+rARsmLBUyuUxQqL1CbZs
	W5EQWoFHCyH/tGlxeZbwwqfSBTiYhxuZagzmvGlBIzRlGVg3R8Wh/ytQmLKuNrhR4irY2iCT8s8
	G2cZtL08XxZSBwDcv5/2lFkf5ENw3/0jZRsxEPrrAGPoY08mhY4zfwsyFsCs48NCNR+viZWtaNF
	ahaPcna2/JYavVoXNAu+/+6iDBDyd9P+cze5xJig8IGe82SWk9A1i7PMvzGfJJ4FErWTVg3hM5+
	vkpXSs7Tcp2RwQsCRkK9ktpkWerZexc5R4N/e4a2ilN7uQ3apD4RuVTAF
X-Received: by 2002:a05:6102:9d0:b0:4e9:c913:2c9e with SMTP id ada2fe7eead31-5db905c1411mr1014172137.1.1761829725387;
        Thu, 30 Oct 2025 06:08:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG/lySLHsbpbMj0FnhN0zM4kCoK9rJ1GOXWXMrK4mIf1oCOtFJHCl0WzymOFvWrOCkEIsQmA==
X-Received: by 2002:a05:6102:9d0:b0:4e9:c913:2c9e with SMTP id ada2fe7eead31-5db905c1411mr1014159137.1.1761829724874;
        Thu, 30 Oct 2025 06:08:44 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef95e81sm14650483a12.21.2025.10.30.06.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 06:08:43 -0700 (PDT)
Message-ID: <bb2865b6-6c17-49e4-b18f-b9baad771830@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 14:08:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aQNXTscqFcucETEW@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xVh7I_aLdSdAcy4bQuV_QdXWWsVbbu_J
X-Authority-Analysis: v=2.4 cv=dK6rWeZb c=1 sm=1 tr=0 ts=6903635e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=lI0Jfkxq0giiNmayhAwA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xVh7I_aLdSdAcy4bQuV_QdXWWsVbbu_J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwNyBTYWx0ZWRfX2eLvQned4V8v
 cp34W9pR+02PiiVAE/h0hh50e3h4gndXDYH9ule2ll1X0ExH+MLr5jh7zKuJLoaydHuSwV3hCe5
 PG+ILwFgk+lYzvcN8FDbEjc7yKEegJAPGjJfdNMBPX/vi/acaATqO8w5f8EZ32gYpomOqLzzcos
 HfRMTTaNvjNN4ROauszFYXoPvl4LnRLg9XUQTN1GtC5r9hJvdd28r1LNLgWSbJBbV/s3X+0BZ9M
 u7bFoEDtJ5SZCuhf0JMqu6JbNw9fTm9l0SY6npEHHWzEMlZl3pLxldGNb5L1iUar5HFQcoLaj4i
 fzoY/fpqBhg4brgnxppymzc07/Dh9PZbiLu1TkUxE6jg5CR9g3+Z/EvGR3NkBE6PnL681L2Pjeg
 u8AX2xj0goEhkjiR/XcH6VYvKpdogw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300107

On 10/30/25 1:17 PM, Russell King (Oracle) wrote:
> Konrad, Ayaan,
> 
> Can you shed any light on the manipulation of the RGMII_IO_MACRO_CONFIG
> and RGMII_IO_MACRO_CONFIG2 registers in ethqos_configure_sgmii()?
> 
> Specifically:
> - why would RGMII_CONFIG2_RGMII_CLK_SEL_CFG be set for 2.5G and 1G
>   speeds, but never be cleared for any other speed?

BIT(16) - "enable to transmit delayed clock in RGMII 100/10 ID Mode"

> - why is RGMII_CONFIG_SGMII_CLK_DVDR set to SGMII_10M_RX_CLK_DVDR
>   for 10M, but never set to any other value for other speeds?

[18:10] - In short, it configures a divider. The expected value is 0x13
for 10 Mbps / RMII mode

which seems to have been problematic given:

https://lore.kernel.org/all/20231212092208.22393-1-quic_snehshah@quicinc.com/

But it didn't say what hardware had this issue.. whether it concerns a
specific SoC or all of them..

A programming guide mentions the new 0x31 value for 10 Mbps in a
SoC-common paragraph so I suppose it's indeed better-er.. Perhaps issues
could arise if you switch back to a faster mode?
> To me, this code looks very suspicious.
> 
> If you have time, please test with a connection capable of 1000BASE-T,
> 100BASE-TX and 10BASE-T, modifying the advertisement to make it
> negotiate each of these, and checking that packet transfer is still
> possible.

No HW with an ethernet port at hand, sorry

Konrad

