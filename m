Return-Path: <linux-arm-msm+bounces-61925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9D5AE287A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 12:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 930F017775A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 10:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847F51F3FF8;
	Sat, 21 Jun 2025 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a3Q/DNuB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B71E833C
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750500358; cv=none; b=O64c7lkIhNLNxtk9JuZhGR2/Shvx/T071AkEk6TzqKPyJCEFPlDZaH/d6RfTxrfrWFybc6tjDbi2F6cYMxNbssK4dDcHGSHOpEixgaLLY+78W6oZTd5KeHG4/O7YQPAoU2O2PIXF2a/pWGGHK87taBoTcOtZ2fcpg5JAViBarus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750500358; c=relaxed/simple;
	bh=Hn9VgER12ug63dZ6l8eYWyg1/ICuNU+YVIfUpFrL9jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwwefjfFX+cdWAZsIO5dTn3aG3PoTjc2Mh8KLz/YP8B/3Atc2o6zAaYwbG2kXZDOMFVByHWf0OXgB6MReJ2zDbEJ0dYssaUfHjle+czHfaw0Pr0aNYJYxKU8mMu7tvMHN4FdPfteyCAswIDYRjSTvmVZangC7IRMgjg3ITNCVEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a3Q/DNuB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L5ahp5028966
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qfJxwg+l2c3JiL0XNVJZZ9SeKhv9FqmZAUKpxuPv/eU=; b=a3Q/DNuBe4NsTALU
	eHxGolCXqh/dU4eUoh4AwLwlidtt23wVf3Xd3BhkhJP+Wx8zWRZ3UhNBKkG2Rx75
	WFS5MSQ/vdllx4LP7MfVYWCA5VhCX+3OFHs9mG2Iw8/xNmgquykjidWqbmcHm3tN
	hPKEtXyFDuLnP116OrV7a/3UMz2wPz80rO7By/s4uqtlu0tTX83iL02ECjSUZTFf
	6q0Ci+IkQbpsMT2sObNnq2d1Gf8QUCpIDYe+Ek3So2EaNBC35yiZO8PVnRvbF9+p
	hu/CrQt4LfSzFnKRhO2GyXZBOdKz7aX8+nR5fsund8QNut/Fuw5F/JPjgQnk04Dt
	/xY1gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpqtrb2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 10:05:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09a3b806aso53987185a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 03:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750500354; x=1751105154;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfJxwg+l2c3JiL0XNVJZZ9SeKhv9FqmZAUKpxuPv/eU=;
        b=gvK8Cwta0Ie3/niTvPmV7FrSA7Kj5AlEh9c9KF8Qv8DTbq7XI+5dqdcQi5zIqfptXd
         nVaENGUFx7M5oxMOyfSkzCKaL/7zM+qI5MHBfF7TQeLbSZ0cfJ18LtAMGCr8LD6puOh9
         4ldoZWEq4kEwicRLV0Jo2cEGtMBF8pxC1Am9A+GQTl9SYKmrbd6I13lHMdUO1jV7iUm1
         QzJOoIqfkdv3yUPtCfNxxzq0Lt70ptdI450yNpikK5xOAdglYysjxdZbnCl/G18pDOn1
         cFNLp8N0CGCTz+H+CNKB7ayJZPccyxS9gb/FoxcJyMY3zmw5j07Cdml4jM7PXcWInAwm
         4N7Q==
X-Gm-Message-State: AOJu0Yxdp0vpeIJOSdFm6xKih8EB8wMIE0jKqqWiOIYEVUqUlnhCwN8s
	UmJDZrv8yOMcSt90HPU866vPLUnpb7lL41Yuq0d3zQWwNhCvTCWtawutAC7ZcTH290kceK45V4z
	tgdLtsgadxBrO8EoQmv6nR2vfR9MjJL735uUf/AidyRB63Q69ITW5Q1Csmr3BBlfKkB7Tb2BdLo
	lU
X-Gm-Gg: ASbGnctrnOOS2XSgzCe0UiZ67ACzeY1LzhIFf2+1uhyOYeHJFRcoBXsM0pYFFDmsQ2A
	LBAS3xejf6H6SsfGfI7qcZEUj9UrtL6yFCqSzMROoBdhZ+6/+6b6hfBqDj1YQkLDmNunrMkUhZ0
	iQlCCQXswQ31tRDKaPB4bI3C1OecBsGI0v6ncjxnR5t9AOYg1fWgqKl8wTeR/pz7O6w5aEcq9yb
	uCmyjOIfP0dOSYW0/V1e+JpPoyJxwUq98Kg61aakN/JGNLeT4pYgsZf7RsUWNnDLnLzbPQaeWCD
	WkMNMtxbGaZEf/63k+zoY4yNBGog3ECSKYZEg94oGvVqkK68RQochIyzymP5Swf8vfN7DMKVnAA
	3KFA=
X-Received: by 2002:ac8:58c4:0:b0:4a7:64d1:1f63 with SMTP id d75a77b69052e-4a77a241458mr32278721cf.13.1750500354352;
        Sat, 21 Jun 2025 03:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5pgyeeYbXGzNX2jYyLlrGsQtTqE6d4IrhZZQuJtWfMycA7fDBUtRHDWtlBfsYFyqCgifoZw==
X-Received: by 2002:ac8:58c4:0:b0:4a7:64d1:1f63 with SMTP id d75a77b69052e-4a77a241458mr32278541cf.13.1750500353965;
        Sat, 21 Jun 2025 03:05:53 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6894sm334915966b.111.2025.06.21.03.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:05:53 -0700 (PDT)
Message-ID: <6e39f8a0-c4fd-42d4-91e9-48ca1d154c6c@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:05:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>
References: <20250618-hlte-touchkey-v2-1-2cf188b57e31@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618-hlte-touchkey-v2-1-2cf188b57e31@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA1OSBTYWx0ZWRfX6svUTjjs42rU
 YsVR1M7W/6qe6NTUAo5Bg3BNa7zlmm5sGRfSpDEJ0gy+1Ud8R/7q+VFtGUpo8TZQmr2GJblX/Qu
 9COfkvas7SLiG6lEfukBKaAB/h3Q4YmQtTy9Gas0Yd2iUw/2Upbghn/jAOfDjKxcECMSvu00VKx
 X4d4sLGFv6IP/4XIRa1LC+AKOtD8ZzbY1Vrl6W0bRHgeaeHRPOmubdmGjqZwCmOP+WRckI9PSGJ
 G/tb78rORPQdhZNVgPgIq01ZX9tk7OohjTI6woJ7++lFgiSYAQM82w6QANzb3nifmy35quVClG2
 2smeZVWfl1YxAbbBwYmXFp31bcHP5gZxGdUPdpgar8GYg5fVbs7pCGubq/0di1EwvETdL0kPsl5
 IidCg0ve3pljqo7QCb5sDBqquuY48MKxVeergkVCORS59GigvThceYiZco3fVVhRFnPc6L9x
X-Proofpoint-ORIG-GUID: 5ReQh9AZ29RTFBcGVM7x4y0v6wp1l5oL
X-Authority-Analysis: v=2.4 cv=cbPSrmDM c=1 sm=1 tr=0 ts=68568404 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=dlmhaOwlAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wwgquuRBh95SaqRAEc8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: 5ReQh9AZ29RTFBcGVM7x4y0v6wp1l5oL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210059

On 6/18/25 11:45 PM, Luca Weiss wrote:
> From: Adam Honse <calcprogrammer1@gmail.com>
> 
> Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).
> 
> Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> Changes in v2:
> - Fix schema validation failure, adjust i2c-gpio node name
> - Fix misplaced S-o-b (hopefully)
> - Link to v1: https://lore.kernel.org/r/20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

