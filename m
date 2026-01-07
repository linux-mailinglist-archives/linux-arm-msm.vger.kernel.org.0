Return-Path: <linux-arm-msm+bounces-87875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DED3CCFD8A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B758C305BD2A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6985A30F957;
	Wed,  7 Jan 2026 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="at9slPrB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNy7i86S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13F030BF6A
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767787563; cv=none; b=FRAjdWtrLO9sUM4aUDcnimM+8uMEO+Ppru5WlxEhF5RkSPGo2V9eHM2fOwNdm4fcoRrRnxYJDnfcKM6vV2evKP02Zlz+MXDmOfIcqva3A9Ufn0gEBo5iaaEadGU3udEKtemgwpUJdXZ1SEvPoCZRgquKwUHNWknZBiOGrD4bfKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767787563; c=relaxed/simple;
	bh=SK1HMlhRdiA20hHT3W7oXbo+85GakTtSzNWoBYWNyGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CyX7Tcnv4GU1jPJAKy9dT5RyMnEtRiZHpUKoxaq7gLYn8YoAWBzhKFz+9IDaxlPwzVvSzNSa75s3sWE/S/izlJ9omU+g3SD+6iSeM4nk7HjFUjsYoWkAMl/bDXP2zt/iiNlsBC8KPAs0OAKM5Ctifo36UjS89GD6McUr4ZUuIj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=at9slPrB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNy7i86S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60791VQP1979976
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 12:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jXpo5Dg7VBQka9vAkpK/fsgMzGFmUOfdUx5/PD+SJJw=; b=at9slPrB6UQC8Iyg
	yEkBgioEnmvWdbfCKfZ4YTh1l5f3OfCW7/9Q8PI/d/T6ETktHhYmHEXGkDM3kkyT
	8PeCCtbsQFIlMBlcc0eeEXbJL51Zvqt0Xhn7FBgzi9MhsgIxd/bjJHipsSdWf0nC
	xu/ts1X9A9Bogv1t2Yf815KjQrVu9dQFUoG/JZ5xKfs+PHN803zsHyANb35Sur/i
	BZoGWBPeVjQGhK7AaXQUSlQ5cPc97i7m99u00deEaYNsa6pssPSnDNdTdyAaxO0H
	wJ9JKKLl293kz8tAsvuCDNVBoj/QUa9D/waCaHyYGChdHdXJrBCGs3iFFXV6A5Ij
	lSCBrg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhdavhyh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 12:06:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f3564e2321so3986131cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 04:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767787560; x=1768392360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jXpo5Dg7VBQka9vAkpK/fsgMzGFmUOfdUx5/PD+SJJw=;
        b=fNy7i86SjSqaf6rTnrQ30SQv+FXov7+Rlh+gRAxGGJOPMxaCYmlZoTwblunQqCi3wq
         uf/+ezyG5gca9P7iXavKEFErahK8CwgLJmz4pYKUovUOU5FbYi0v5Y6vKtSNx1It1a+P
         Zc2dsUpBCRYQpClsVBOu8zgM+S2M6hcffUGAF+6m8dFEFA4/ZF8xagW1CBHioVF7pWgx
         2Dy1UkuKRrCig3+igX1ojgKXPfYf5egdxvLp7hqwicruAeLPuiIXYvkhHDQkjJ1cA/8p
         wnMTqCmb+6HIsN6CUDNy2WD7vZDe3jAVbX5SntD/UoNE5uGiWCDJv3DpJhv4W7eUD+II
         n67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767787560; x=1768392360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jXpo5Dg7VBQka9vAkpK/fsgMzGFmUOfdUx5/PD+SJJw=;
        b=AGqKIJdv5z2E1HAsorPqoGeMRoLvbEwmCYUWz64tfoZtioWFM72j0umLv3PcA56VFI
         eu8wuDuMJRZOsll8M9sd4mhtRaBEe4RHnObPFI1iewkCxxb+Vtdu0LQi9hAXGUgKaWJj
         X7Ryus3o3NFVdO1Ya/sq1waVdB4oF+a0/vW1r5klWkQ5OIvm9RTqGtLpr7x8KgdC7i+D
         7saB3U8ysgha0Jovl96yG4qpKa0obAhgU+cEJWEPNk8o68HN8Q3mSvWNRu46AscjJ8aU
         8NnUhn45lx6DFGfReqg71EJk/rJ+oHjP0juSyoPCJZCmeLRAwI/+kCHxezx5V9tYWOUL
         KtZA==
X-Forwarded-Encrypted: i=1; AJvYcCVtfqXfTkSi58tZyXbJggluuI7OWWfRFes53VfQHphuKI/JAJ9GDQEJOEAESqWlCRcg3C7uI+uWFVNQFMfM@vger.kernel.org
X-Gm-Message-State: AOJu0Yynl0WXmaXDrDiVzkvpv9nLqEeBJaYOzCnMO4wzU+aAl026w0M7
	NIjpJA1PE+N1yAwPFtvHdANrRdhJouGoGuAIZhCLWWHwFUBYo1G2QrcA/SVdmFyX7cbrFbPOEE4
	UKWrTWTu2U/zu1JR1eK/1LL8JDKWKcgoW1bkJ7SGwTM7RpNUIGutPpB9yYgR6QwRNM0Dy
X-Gm-Gg: AY/fxX6ooMn3jTik/Ns4y+hNjwemPnsSXB2OeEudfhVagM5x48+5kTS2Inf+hiQxNpN
	YYDEoeUdt5TVX9uIW1F3ryuvBd2lJK2pH4kB75iFWUUZALWu6N/cICO01RsJJUuG+4KfTgQ9+GA
	oR/iZ0uM7B44eQcqJXxXuVTi+XDbPsSG1sbSaSaKIgn6PoXS4BACnAOyk1qKDq997Q4+sQz7HoF
	FVvv8LpSihHUvMGa21Zr86cS+m2Dm6guX12C3NkeLV7v5y4Hpzvskyc5xQPl9ffDEPLZjRJ0X5c
	Gf90lGJ6psXQoFux39d5/KCMUWoPhyPxV94jpgTQw8NWAFnJr0w8V0QnHyWGhBWCjrvJdeYknqy
	QhqpPOHu85lMB1rzpeGfX1Muv38bSA7pc2HbWp8nOSQYIKCnn33CvUgyWJ+basG4sC0A=
X-Received: by 2002:a05:622a:143:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4ffb49f6dc1mr20250421cf.6.1767787559700;
        Wed, 07 Jan 2026 04:05:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTQzT9CN6wtGfm2PwlCCl6Gn/aZqv69AlP8pq+ElyIV23BjgSIJLrBUuo0uDBcmPXkR/JTIg==
X-Received: by 2002:a05:622a:143:b0:4ee:1c71:71e1 with SMTP id d75a77b69052e-4ffb49f6dc1mr20249971cf.6.1767787559186;
        Wed, 07 Jan 2026 04:05:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a27c8f3sm491325766b.16.2026.01.07.04.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:05:58 -0800 (PST)
Message-ID: <477fda29-7470-47dc-9325-c7226b77cd1e@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:05:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add UFS nodes
To: Luca Weiss <luca.weiss@fairphone.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260107-milos-ufs-v1-0-6982ab20d0ac@fairphone.com>
 <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260107-milos-ufs-v1-5-6982ab20d0ac@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5NCBTYWx0ZWRfX3U+Kvu5JgEk5
 sBbwtjW0F62MdUX6RIF2NHomBQydKJ9w7AreywtLgFMLx1UPtekQ/nYL+UsG0jmt59PFwuF70jD
 5LDg/JlKjXqlwqAiSLnRjCYKoVj+2FXfLaQteuonSdQ7LkAB6NmWisDWcUz8hw5/ytaw9fTsUaC
 n/6fWKC3dcZX0H8EDbVw4IG4G0462IAc85X/G4N71MAcu2RKqs0XkuFUZDjNIZk0RhmRHdjAEl2
 U1s2s0+k9QcpG7xIHj/MsFyNUN0nk6p9+fBuGR07CjcCUtofmlEzS4QGmqngwvoZx1Cu9ism3JV
 oVhRBlE3kbkqeds70eTFUi15ip9/YmvkG8E4NR7koGgQKrEJOTUDKlv04YHubfMO/31UXLqOpq3
 9p95cFPSdfQaieDKso5UqmX9YbXkxIvppiwJ54M4KbL/IkihnWyW3spUyLvb8jcNAr1o+j034HL
 X1oc9oj2h8PtK5ohQZg==
X-Proofpoint-ORIG-GUID: sAduzq5_ih-WlC-1JQy-WTEnt2-9UsPH
X-Authority-Analysis: v=2.4 cv=comWUl4i c=1 sm=1 tr=0 ts=695e4c28 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=dawVfQjAaf238kedN5IG:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: sAduzq5_ih-WlC-1JQy-WTEnt2-9UsPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070094

On 1/7/26 9:05 AM, Luca Weiss wrote:
> Add the nodes for the UFS PHY and UFS host controller, along with the
> ICE used for UFS.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


