Return-Path: <linux-arm-msm+bounces-55601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 932A6A9C493
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 12:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A159C1BA0F17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 10:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A5221D3DB;
	Fri, 25 Apr 2025 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHr6CR02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3311EA7CA
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575393; cv=none; b=rgiiiTgouD2bTcis4PDyvsCFmeTXTM5RtkF3D3qSY16p36c+f3AEjGMR8gYQPzBErN2WRDO5fmrmb1eG9V+clDk3fkjxnRB4/Fa1/qiA+i3i9L2+QNC3tgFjHchVZzLprkf7Z73dTd8v441WuUWHpeuFs11bc8JOwpbLgGHJocY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575393; c=relaxed/simple;
	bh=hB+2f7cIMDCHKraGO8B6NafAbyaYw9oXEvgBcH3MmLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dfw4736C7Npxl9VyGxub4po3J0G8wV5hAuXtpwT0w0gcrMgEaaK5QOZHwLvYC/TJqY9sB/uyYvhLR7GmxLtmfAnR9qfReXekYyuaQ0fF3IqGQlMHNA0nVjU3wPsbYbny7HGFyzZ8UC+gKEhgKCUltDU2K1YZgO2QxLKhnkMgGzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHr6CR02; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TDUZ025215
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8QKagrcFhKv9KYvsAXHi4oyalQy8U3D+I/qLNKwZTE=; b=WHr6CR02/5TJ081u
	ikBTbROJtBYz3qiKeh/3BKqGKrhzLDKuyhWwSXhcxhVHbI+5tHttz4xAtFVYob2G
	5o7UyRySkqgLtEBC0v+Gjr5s/HwHfL1K3/6L96TMB7wzT/MIq5Eb3Xd7ZPPjeYMw
	NxgtMRx//TkB153VudTacJPaABRj4K6Tfbf61csNEKGkHzQ75h+VdFdQE4YIVky+
	lnArkawa2LTL9H6Y2IOwSdEk760Yv7HUW5IWsYWx1D+2IfUdsBjquXUdGNjvnF4p
	WV/Wq1mrBVl+6tZwYbUVelXjR9YhkwJETh2+6Ak9AJHtYfqg8pW9vWO8sPmCewOj
	LJBUUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3rh63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 10:03:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-476786e50d9so3473811cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 03:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575390; x=1746180190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8QKagrcFhKv9KYvsAXHi4oyalQy8U3D+I/qLNKwZTE=;
        b=Wxy8SPkgc9T9bUTJ2KCX0UEgnFOBNiYeLF3rKgTiTChMuzhFoNuxhXwP8eGE5QK/rP
         YhN6sA5n7qKQCYSKViiMYQ6UZhyDqYslhMkj5nIg6dJ3tKMYgr/Ic7DVvLqQIU2G5jF2
         B9jHEGPJMCRUwSzgcoMBKu+DdaiGhsjG1a9cBV5OlPy2n0P/Qmv7N+xmDHyfdgxKGOBc
         E9SZ/Ry2X7/jYbtrYt0rHJ1qMFeKztxGK8JSaKask4FoIjRh/c2AEoxBLIvz/AoWvg4p
         1YDKHpj8hPc0p/gv9A+PJHd9SO3v8zBQnhWAJhR9fkkY9D/7WVGZO6emxw3g1uV23JAs
         GJbw==
X-Forwarded-Encrypted: i=1; AJvYcCV8XPT2PYatbP965ipsW3w8eLgTmbFLtS/yUX7/iaicXWxECCsRTrVk4adrAPLC+R5qtmRcEq5a8TtB+4wq@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ8Ry3GK1dwLi3GD+w4NgtRn0OI9DiwLEzlX1YrP4EIPjqCRCl
	GYYCm0RKggknc8u+zV4C0brQX5DbfPEO/4fgweV4dOxhik5QRLGIDniZUBh++9OBru+VccOKjTQ
	bDK9bRb+D87VGPiGJFD3ZbeDOiE35KNGCN6zGIZ1WJ6AACDjrGQ5r7KqQGz+tcXj1
X-Gm-Gg: ASbGnctsSISaQfEH3ION6pOulC7SJKJMn+pqzxPafyQHt1aAk4l2V1LzPA91mHcRfpY
	8OuqYXUZSfsCndz9vZvUNLe5kX4NLmKuIjDD+xKqfepD+beEtM59WIPRurdkvMwSqddDP2PWFTa
	UBH8F5TwikaTwsqe6bCgPWDb3r0U6vR0b6oZkkOImYI+J44t0hTkH5SXCcn+KUB0tm8IS7vuwny
	yZgi3h71rhB+OEKXM7uh1+0Ss7PZT0a1bWKWF7hpUJfgjB9o4p2h8s84HET6Wfk7oGPgXS+MtHo
	UXEfQtFZ6cBXsZJou0bY0sNAh+3UO46gHSJ6uGzsHB+HIlqDoUOSQFdfvfxABrNh
X-Received: by 2002:a05:622a:14c:b0:475:1c59:1748 with SMTP id d75a77b69052e-4801e4ef65bmr9252681cf.11.1745575390676;
        Fri, 25 Apr 2025 03:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGym4C8wwZXnGdD0USz55aLh0SXbKBJJtzFo8Orhuhz+NevN4tmg5LbGw7KIIl83OOjojsuOQ==
X-Received: by 2002:a05:622a:14c:b0:475:1c59:1748 with SMTP id d75a77b69052e-4801e4ef65bmr9252401cf.11.1745575390337;
        Fri, 25 Apr 2025 03:03:10 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e69efsm111315166b.46.2025.04.25.03.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:03:09 -0700 (PDT)
Message-ID: <e82eda3b-b27f-4584-ad23-562ca4b22847@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:03:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply
 for PCIe PHYs
To: Johan Hovold <johan@kernel.org>, Wenbin Yao <quic_wenbyao@quicinc.com>
Cc: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
 <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aAtbFQIQMJO-BYe_@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ft8jtT8JJ1Z0jC6fePXIL-wKPFowZ9In
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MyBTYWx0ZWRfXzgMnt1cL9RXs LGmzsnFIBiSBgZfHsNPg8HQ5abzWptvEaUcP+CgphiXQeMvFIEjR85ercDv+/0xa/bcwbONf7JO KQ1v/WJ64awTJNhYNsLaKZvXGwVPHGejKWIdvKtQ7TuSng3dHjHpBunDPOWV4eXZ7SdFwpi2xNt
 KupFI2oaXRWOcMdYAwO8RRuwf1sxu/4l5EyjITQ4Dz66FvnvBJiNTZBhrgfyU7XDsq/MxKGwEPN savM7ZsSB/c13EPX2HPpduLwNShGIwY108re8b8YG+gRWeHGGybpsfiuiP/TPiNrDOYPFwyb1ZR /Dfqu+FBYyw2WycM76lwSj67UbtVarC8cVA+Q8lcO9Q7Ai6/Y29B35RCULL8LZVmeFChSGFDqEz
 r+z5lNBJ55cTftXydGrAZywrKQAPLJs8jWLesH23I9GmJwlJDjbmV3I6f3aFfXu+j2zYvM0H
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680b5ddf cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=YoAw9hKFp1W1AvAWU5AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ft8jtT8JJ1Z0jC6fePXIL-wKPFowZ9In
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250073

On 4/25/25 11:51 AM, Johan Hovold wrote:
> On Fri, Apr 25, 2025 at 05:29:55PM +0800, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
>> missing in the current PHY device tree node. The PCIe port can still
>> function because the regulator L3J, which vdda-qref consumes, is voted by
>> other components.
>>
>> Since the device tree should accurately describe the hardware, add the
>> vdda-qref power supply explicitly in all PCIe PHY device nodes.
> 
> AFAIU the PHYs do not use this qref supply directly so it does not
> belong in the PHY node (but possibly in the tcsr node that provides the
> refclk).
> 
> Since commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> qref supplies") it also won't have any effect for pcie4 and pcie6.

QREF is a separate hw block distributing the reference clocks across
certain on-SoC peripherals

If its power goes out, I don't think much of the platform would be
functional anyway, so it's redundant here..

It doesn't have its own single register region and it's frankly
one-shot-configured way before Linux starts up, so there should be
no need of describing it at all.

Konrad

