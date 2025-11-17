Return-Path: <linux-arm-msm+bounces-82100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BBCC6444C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:06:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29D914EE32E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 146C133032A;
	Mon, 17 Nov 2025 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzHpu3F1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4BxdNRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EE0330321
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384094; cv=none; b=MxeS8dJFntGnyTNoFmjDjFppKh9h0nXEwV/BfOohWc2VudL7K068jHh8Gf5WeqVZKkMpJ8u2gDVQbyJ+txizmk8kLky+drv0/Ikt6vUNU2c6Ueq1M7lAqD8vdxRh/NOxNTVahdBRhHNFAxwwQpKIPKyeWysfPg24Sj7mgVvg8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384094; c=relaxed/simple;
	bh=kBXNd75eYkZCTjXIdgv5n267Hu1R3ZFDXntdmyuG6T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S40YYQnHP0I5aDiA+H09D1ROv8vnyvAFYbVpZZ9cxkGcq45pVeRYKca95AjeOGtXhUha/wS1tjF3/4Uzjj59aXDgZ6F2iBuXBdblI7VojUqXLE30vUaSh0/Mn618EQB26k8oFoVaUWTr8lVCbqxhHDOXP5I7kdc+N1UikWyw6iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzHpu3F1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4BxdNRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAprus3920966
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kBXNd75eYkZCTjXIdgv5n267Hu1R3ZFDXntdmyuG6T0=; b=RzHpu3F1xo0ebUxz
	YyW+a4CHMkEnHjVrYkkKMnkdFCpOVVk+Ij44b6PWIe0cBmNLNNb6MbxDC94Vy/6e
	Nid+qVSW25lVGbptoHlVJNs2mNWWRMf+aZGNB9x3rLBUcFc2Uc7baFpKUr06C8Uh
	8TjoDRS5oz4cMD8SBMguVpesVaVuIZu0Q/EsjOlgXP3Ff04AYopzPEM/0F05ek84
	5+rJjPb0k9jGQUpApNZDOtZoPbwOeBf/K3X1Mb3xBNq6CNp/GP5vJrfOvROmdp8U
	jUX89QdE4Ny8+3JMg2COJaZkgJjQo9N8i60UjUmpb+QKOwD5w59FEB/l7Wzmx2aJ
	KAY7qg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2ay8b0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:54:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee05927208so6470261cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763384090; x=1763988890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kBXNd75eYkZCTjXIdgv5n267Hu1R3ZFDXntdmyuG6T0=;
        b=G4BxdNRWjRTm9Y59jQxkRlks/pKq6/vS3Y9VCtXJPXbgaO82FuxGANod61YrbjaBNV
         2Bqgm++z2SgD2LpVlLH13uIOqEF8pmskIvlNxbZJRKevmhZGQAfpRFjHxS/d/uGhP3B2
         AeHPDGHzJ7MYwRq3c2kC6CwL5JE4qbcDSHuFjTYz9lO7EIl+YSWKY/RUfORr+FaIm1eI
         GLUGW+Zv0sABnjapG0Q3+AX8/akZXLzk7YMsWfw49OR6VjCLqKebh73bHvchg6mxR2wJ
         y8Ut2EXT0ICV7Qd97167csAEsrFY2wxxDeYr2IJk6/CnTr/F5lp896BxADQiFqBjb8JK
         QeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384090; x=1763988890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBXNd75eYkZCTjXIdgv5n267Hu1R3ZFDXntdmyuG6T0=;
        b=OL5wn/UFnWoxDXIZvQwSPOxCsI351KxJM7/wvn1+7QXkjyuIukvOG88fs3mWEUQ/Yz
         h7REmwKqsmP+Di01Z2f9xRgtLiO0HqgSVDpCATH+xJV8moLg/KPTCu/ZucL3K7KzHnAP
         14/qpyaZdYdEbJ0tgYVXQwn4RfUk9bDjogiLa61/WGIW3mkm3Dd9+2H2tDgEhGgKD7Ow
         hPvT1J9ErtVlMtvTmV1vAylqclHSvM0RhOh9QeSvAs5ylsFrc0cv5G32LkXuc0XHRn3a
         VQWf8gU9keLNFfGCvPtsymLsLi7oMpqF/IGNtG8h56YGtT6OauIfY6y4LvBiRJyLfW3N
         kVBQ==
X-Gm-Message-State: AOJu0YzTWb05yx5m/VE2U2LQpL5qBF/RYQVFfMyDSool+/HXDA1HEC41
	IpCKHFFjX+fVay2n12KxXnScM456GRR6jAa/yq4/L/QQ8Z5LsZjAu1Bh20SCJ0YSLKt58YlvjAA
	1u+ApZWVys//Z1FRCUcDf2DZv3ljV+6YHq0HKrnTkRcy7UiMt1dYPi4nVUYFifkwOR0BZ
X-Gm-Gg: ASbGncs7WrZK4tN3NGBurbIwMyma/C3eBeqWateTPKNgpkZx7vwSc3Qnb7JUQVhMYol
	HuuI1HyxV7oDfWQoU1oux8zithMROW04hLANqBWzUWsQgy2Re2w9nggXNVEUUQxV+RNN9q5k4zu
	wI+jICFw/rENDRJ//b4VXR8HXM0gz3KzpPjYk4JooA397GCVekeis8pYZKuii+dSflCdwubIpKg
	wjUgw8iT5UMsflcGsjSFbUX9EsnMGbNyAyfFR9DIVRGrmyiMZhMOAfmn7w/0BEv5NVPBwO/a8i4
	VC7k05/yuzPttjdEwlzJYpHKyDnCDwv/vuqxPeY5DigX7YnAhAXjeTPAWNgbSQybHo52P+TTKkg
	EYzQyxPcBdlIbcLna05WXDpeDjpJAXe9805xE/hWXGC7qw7kePa1mAKOO
X-Received: by 2002:ac8:5fce:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4edf36eeebemr120343791cf.8.1763384090339;
        Mon, 17 Nov 2025 04:54:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjqmfKkBFqL6Etv5sHVLE/6tCFwHqgdZk3cJaN1Sku5aib1YY1UTiw9W7VnIi8RSeWy0oj8g==
X-Received: by 2002:ac8:5fce:0:b0:4ed:6e12:f576 with SMTP id d75a77b69052e-4edf36eeebemr120343491cf.8.1763384089956;
        Mon, 17 Nov 2025 04:54:49 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm1062147266b.71.2025.11.17.04.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:54:49 -0800 (PST)
Message-ID: <f9ed0efb-33a0-481d-9d12-20f0bcaf1d62@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:54:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8937: add reset for display
 subsystem
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251116-mdss-resets-msm8917-msm8937-v1-0-08051386779b@mainlining.org>
 <20251116-mdss-resets-msm8917-msm8937-v1-4-08051386779b@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251116-mdss-resets-msm8917-msm8937-v1-4-08051386779b@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dL2rWeZb c=1 sm=1 tr=0 ts=691b1b1b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=G8-SSAS-OYPV6Zknk1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: purQpLOJcVMRLmEXEN8bFDzrf_0DUnah
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwOSBTYWx0ZWRfX8OAxRMxxul+4
 aKLhP6PgJH8yFN9kyz/uH0UG5394X6hI4fueS0xBU5caPIC0l+5LhD3DMvH85RNSiyViclMRelR
 rA/vtPSqORFNKyrIHLRvfsiN5v2aFissTmpxjURpWSMYb/XVWnHeoeB6lv+1gbRMbx2XDNQbKL9
 Y0r9XMeVJK8QAhf4A9+jCiNTiEHXT6TC4CCO56d9GOC7sN7VsJhTNhVoq10bWwOCyWRMtiy54D+
 n8K+SPENyzC8UdBXaPru+u5IS6etc1V0NrL+FddVMlqzCxv246a5OPmNTghP+ddoMoyCmIonjOl
 FkeIcsjHKqQgm4ct8vlQ0ACOKzEJArnfykzfbt24qLBkib9hpVfgJ2sPe4CwKiHpg1+27XUD5Dr
 C2DfvtCsObwD3BCbfCX7QlL+ymQMIQ==
X-Proofpoint-ORIG-GUID: purQpLOJcVMRLmEXEN8bFDzrf_0DUnah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170109

On 11/16/25 11:10 PM, Barnabás Czémán wrote:
> Add reset for display subsystem, make sure it gets
> properly reset.

This sounds a little funny (and wrapped very early - usually 72c is
the norm)

> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

in any case

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

