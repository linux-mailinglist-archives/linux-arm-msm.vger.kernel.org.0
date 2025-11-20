Return-Path: <linux-arm-msm+bounces-82648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D64C7345C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 10:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 39459357523
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 09:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9321B22D7B5;
	Thu, 20 Nov 2025 09:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkocuJ4Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TqMS2NMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40C028371
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631790; cv=none; b=dYGCbHRvbYrFAaBA9VoQUvh8q46PVhpzgpIqc7wTRveynA/Zdj5/JSMwkVuVs6+gI/th3f6oTDRqD9ywU+3aObRa8bSiSwFzL7RdMVnPM/Oa44E/wrXncb/vDiOPshckiqf+WMTuoD14oG+YgpwDQ71VcRsClRBu3sKWWm+MlCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631790; c=relaxed/simple;
	bh=A5PCemrFCzeN5dykRncX1mML7+uP7qyqc+kB3HxOA28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZFMn39bqD7nVnZLh8b/XSaAuPduHdIcI8yafmDS+tGIIt2GW1fACALNO3TH2MHMwGYnWVjce5wbA4q731/pnahNrnOyWqqWoBiNV1IRmUpx/L+kiaD9uqxEU/vjcK4HL52hnHGGrNnEHHR6OPe7QuctxwWEo97fTyKBY8vsXk+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkocuJ4Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TqMS2NMG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK7bCCX083211
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkyzTXeZYMSp/bdyDfMh+rWB60QOoYeXnsoTS3SL938=; b=hkocuJ4ZWK85qWo+
	s0wPA0FzDYrKQywcYqNCHNVP3nscP6gVXuSku7GtewMtk+eF7Hc48x6VAdZ1/TXf
	Jx/3kTd8tVU9FPktqjVMpK7NZEuHCmlP2vJXQ6/L8o9neG9ygrST9RAiVRMfTHjP
	Ch+Ru2t/9lfHZ4jJcxUj9Zq9im1rf2LoTUKZbL81T5nPc3DvH/kRR/NZOgfHcM8a
	s7kh3wOUI4TGLJmcmjOVPZ1bHdfuVTK7f/6bWAtwAj+5F5GcK/4wuEBeaJZfwvT1
	nH7TGTXYVoVsglJdF1V8sQXerroM5mKac9lUr9i8o7UUfRMKZx8vuVbaPa0QXYgt
	nFfNXQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahxrn8d2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 09:43:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87ff7511178so2110026d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763631787; x=1764236587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkyzTXeZYMSp/bdyDfMh+rWB60QOoYeXnsoTS3SL938=;
        b=TqMS2NMGvUrXzMEkRy9KU4Njg1aKjucaZvJpZ2IHaaCB2emHEZx045bFTzNJfZClH5
         zafToAURhLU4p25NqI4Kbr4SDfcd8vXz2OFAwNSxCSgTTyp57/2T8J7P/Yt6hpA2hfMp
         fVdmBK2tkf6p0S7wep4GGFGhiCntvgxwdcnMslCBrgge1gqQr1CHIx25d9QlH9ZWdNHc
         HhmyFV9kXCBtSN09ibshpKA+RKw9Ek+R13o3zM/53HC3N/77UjjdlGpVaUSU4uwUSket
         gjHEPCFKlgV6o/LEKy78LEabNa8iafL4zJXJ+6MZgW/TUUHjThPyWoKoDGN8M34qkZD5
         4k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631787; x=1764236587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkyzTXeZYMSp/bdyDfMh+rWB60QOoYeXnsoTS3SL938=;
        b=anDKOuU7b5Gr/5z0j3RtLoS+h4yAS1+PKYnNpi/nWNj6LwEaV/oryWsK593QH8wRiZ
         /mis3GWc6cZQJhzVLGTxMHlCMGK501iGTjZgUGaCWVuZCHwH3iMXqcYeDELbJPS/FkYA
         z1sBTCN97FqLEri3uRN3h+AZEN/nYX5gT4rix3J+REXuKo4WM6CK8Mi5GHEYr4VVxOJc
         1eCqKk9WTMLvPPIifSIYChWLp+vwcB5CH+/akhzbpMIyeCCQSeffRx9zuRv2es49G6jB
         7uA2uZPfEVyLYtshqwZvHiFB2eW2R1yvC8ZT0PO7TI8L8e9vsN+++SsPdz9FprghnSVV
         ZYcg==
X-Forwarded-Encrypted: i=1; AJvYcCXrUrQlNQCA4ob9sKZH5Azsb9jAJUs+MIdneF3HhUtG4A4YqOclxgo7wU77/D6XZnfDPnD51p4QEJb0kJ+d@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc44+5ED6HDLIdxb3m2C/B0JjezsypNJvjzpl18N7j6YReNsU0
	sYQKjlkzGEySW4nQlAPyWLAA9V3H6XxBkOhUJTtoomuEvWybQjrrcZ6RAGWOSvmZjdezxXLemxM
	6PJWrN9aEFg3kS5NuE4WQRuQQkxy4B1ImDAHH8eqJsz2MY0+o+UQh/PygB4SJRXawNojY
X-Gm-Gg: ASbGncuTewn0lP3bYbcoIhbqb3mIb3oUF5/5GnEechiexNsfY3K3nLcxD9Ni0Lfrnc6
	zvq1IXRKX30bcoTun9XmJJuu8VEGVmBnWRKF/CzzI9vhOkhM/nGNtbXgIzTQSr9g2xcbPYBNNJK
	SX+fADM2iCLMzo7EfiXFHp8293R+1lvahN7+dmXnPtQnzBNiSx1+QrOTzz3S3xGhqLsp8PSRqHG
	Qvwm+LaaiEENv54Xhxkd0f+ovKR8HjK0WxKicx2UhHyC+g+33KfJAHV66pFob1tRSKenPaVpRMK
	oBRt610UrPGpimkqi5qE5/FjHpYW+/6BwJb/XLMwDdSOMX7Z1W1j+fBfPOhsyjC9YA6er5pi0B7
	R2Zv6LdoHJqWyPYR4SyqaU9dE+BMu6W2Q9Gq5hjvvMoAlO4M7fvYhGgAW1DEKp25m20o=
X-Received: by 2002:a05:622a:1882:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ee4943ffe2mr24836131cf.2.1763631786964;
        Thu, 20 Nov 2025 01:43:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuygrM15eYuuL+Eseo+gEcRRrz8pankqv3+qIrqVyy6fDxxjo0USx1x43jtWRb6reybm1ooQ==
X-Received: by 2002:a05:622a:1882:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ee4943ffe2mr24835991cf.2.1763631786581;
        Thu, 20 Nov 2025 01:43:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43b1sm163235466b.38.2025.11.20.01.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:43:06 -0800 (PST)
Message-ID: <b8e5d6a8-c6bd-49bb-8308-a8b5c390897c@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:43:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: stmmac: qcom-ethqos: use
 read_poll_timeout_atomic()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSZ-0000000FMrW-0cEu@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vLgSZ-0000000FMrW-0cEu@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AXP999z6glAM6wmBJ5Wh-smoVxKCqdYo
X-Proofpoint-GUID: AXP999z6glAM6wmBJ5Wh-smoVxKCqdYo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1OCBTYWx0ZWRfX2sw4SAq1J7bs
 xBa2OGym85dgWWCdCokl39qMV70soODTFXtWiwo9LJCcWoh2qtX4m4scIQS7VlTjh64kgCRkL6E
 L1og0VOaM9gZeN3hfo51OkxR09nidXhQ2T0HxnRG37XrTQEHU/nyixYzXj21nlQ8aT00HpfovoJ
 j0YhwEwCtVgN/YPAftRoqHfPgzENPjNTfnAcjH3c9FARuVS+sQA8Kf6p3HSEnjVHbFuSsFlRm4/
 zjvOakYQY3oyCMgVlvnhLCPy+dDUCRXYsOGZRH3hcXq4Y7TbBBYV5npyiITDeDgcQSzbRh55G1c
 Wgtf97VR2NDfZztZNQgSw7Vt0OKTqaZwTMAfQT4x4lTkRvSCMUBFVy27J8W0BcanMA2rBQUr7vi
 pYXQwpLX6DT21VqrF2N+Ll476Rq6Qw==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=691ee2ab cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=OSBbO3HZz-0BpLb1nxYA:9 a=QEXdDO2ut3YA:10 a=THfFRngN91AA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200058

On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> Use read_poll_timeout_atomic() to poll the rgmii registers rather than
> open-coding the polling.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

