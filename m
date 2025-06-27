Return-Path: <linux-arm-msm+bounces-62866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AB4AEBF9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 21:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DD2F1C477B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725FB202C40;
	Fri, 27 Jun 2025 19:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4M1HOc9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A11E1E0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751051803; cv=none; b=OAdneQ1Hscmj7ZsdAl/Q5dk0djH4NWAOV6i+mEKUV7Cn+pUo6DKiR41ZeDGm2Ae4ltKXSXvoOcwn2FsQZwQpxthgGt85PSlUYj8YG1xgOoViPQIJG7wK103ABZIuPWNsDTkxK5uUxjZs3HI61R/mSK5dW3puENfvfeYVZxbo52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751051803; c=relaxed/simple;
	bh=RlRJcwm9a8JTqN3y1j1t/IjOBE0hIdzvwB5bYp7QhCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVjHppRZ1hXzjdi38tEJ5l4wUgRzY9kD8cAafK8fo1w92wjUbR8bsnKN+6tP7dV4clSzaBrPQ9a62vT57Xo2R+4K05bgJI7b43nQwJ6jJypDUsulpp+u+oPjD34/b1moae5FG53FgPCrNzXR5TB90JihKj9AcpEvqA8PNxNBxcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4M1HOc9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCoDrl011390
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 19:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXDux9ZnYbHSwb/EPmf9T5s+8Qzuw9drVvr9rBihY4A=; b=L4M1HOc9b/2x2L4a
	+Kfmi8fcqJuqKOysuPdlyWxBmGHnO5xdsPuEgI+5ngGlA6amu0F/hr3BMoLXsPPa
	MaQBjjh1LgoBZVuc+RGvFLuKdELgEKJ9nMFmqYPaVH5jiteICxBGOBLsSOtoZght
	aPccjghvyoE19gx4OCZ+veFSJR14i6/gygqNezlux9w2exNnCasvpR47eUOHEPcU
	OsY3L2fH48E4mSnFHSi300cfAZllZNxEI1X0xSxJQfbVgbSVPRm1+WXYAgXzzo0z
	eC4SgiN6/850RsvhRglkcf6XjCbdD6vmI0qVtRTpao9EWL1qwWc9V/z4THAnEbkh
	olaI3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgqrau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 19:16:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0979e6263so5737785a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 12:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751051799; x=1751656599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXDux9ZnYbHSwb/EPmf9T5s+8Qzuw9drVvr9rBihY4A=;
        b=d5MCOYCA10Wzf0Gp8bUjteso7zseMM1FpKECkQeiYWR2kLzbUhvwVmQ8OUdkaboY9u
         GqTN4w/w7+XLsE8T+V2hUafgU15R+uGFQYLyfvHnGNjR3hPLmiHlgKOyzrRcBLZAc8k/
         1IMkBfYGAiYVtQWlekiyUs3m8EQNHS2kcc2smXfd2x3zFPMOCUUbJeyGgKLUsoSAnmeT
         TKutmzWsl6rVP4uZq5LSKSU11Q1HlEAF/SXiwJBJ1GPcaXS+8c1d8haZorgrZNujra3U
         5+VNFV2nryAidoJlFKj/h4FEpMELdHkeQeInc2VDJ9SNIHYCDru98J6P9xyMmW/FOimw
         EpcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVumnTGoMFkZBcBrFdEVB4T1xdV50o4u74inL8C2vnNrhHhWh9hM+REChNmG689jdEpUUVGUAOxD1owFf0P@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6sVUnAtD+S6GC1w31XU4EjfRQT+sXvnq+sPFhrqWQxImQP21R
	wKfMS3zAui5jUDjh0TM/kFQTO9BT6MnLM1dVrP2gtxYxqgZRhR+t28me0IYHKmkCNMiWKbEqunz
	u/X+C6qTJt/djZRag/hy3n0Rg3WQb1FyitLkwufsZr3Qbb5J8PgjR7jglZZ58pPk/3CyxMgOd+n
	qF
X-Gm-Gg: ASbGncu45+fv0cynpcO6QL7sqB0XUHNbx2qUXKmQR3ABGfbDcbBBYs1y8dJJVWnYzlW
	MeLNAn1XXDSTd4pxxI2al12WULhV88CKjni5jHF/sqqFw+u2oyt3xVupMXSKZ4Gf9TEvCw+QkWn
	K/JoDMQLkiaLDd4/FfwPooJjrly5lstjJoRRezIxMcKSQD5tDVwTaWCkdSi3i2t4B0vUGgTorMk
	+fHhyl6GLzIBp3ri+uaKIbAAqFcXDZZmmV4UJVf2SjTo38EoviIPJ9GYXiHse63+dT5kUrxB/C4
	Hr2G80XcO0gqf//CsxzZCbt1lBdR5J2Sc3NWxEjZWaZJYqvv0H2mmp3WKS5dZHsjcRoYec2qts4
	GPUo=
X-Received: by 2002:a05:620a:2804:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d44c28cbefmr18542385a.12.1751051799008;
        Fri, 27 Jun 2025 12:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAzgVSK1bhvsi8IxU2dP1+yUtNotEs7vFGntymL185tGwfB4paX0PSqMYbH7ZA9B7nCA880w==
X-Received: by 2002:a05:620a:2804:b0:7d3:c69e:267 with SMTP id af79cd13be357-7d44c28cbefmr18539085a.12.1751051798284;
        Fri, 27 Jun 2025 12:16:38 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b0e6sm174318166b.20.2025.06.27.12.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 12:16:37 -0700 (PDT)
Message-ID: <c718dcde-21d8-47a2-9453-d98f0dd96f88@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 21:16:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: qcom,x1e80100-camss: correct
 description of vdd-csiphy-1p2-supply
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250627190021.139373-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627190021.139373-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oN_HgIGN7CpkmEWHuz2Dph-TPNeaQaUH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE1NiBTYWx0ZWRfXwNJmdK4tH4zN
 uDy3ADS+i6wGvx+1FHNwY5s53HT0cj0Oy+hu/73UClIVT1N166ybQvRif4Pln4Jf9dTsXZVvGpt
 wmEtefacqHJqYiHT+v9/R4zaQeSop3YE54vaNc8Apo3E+QEqwwMlLdXGUWCD0orJoTE2NJXWLCP
 EcrX3UMQIhGYiVu3OQZlBlK7u5wtgo1VfdhsCYrCUNXScOc8HZIvAF9t+psIsIdxTcTs5UdzOCp
 WezcxuuJ+qXJNZ5dfOOM9Aa/of8fgCyc/H9cbz0wxCg/BqnOY8meaVk+fTuq3/SkYWPr6eOk0wd
 B6CSLAVvhkbbV2SOD3LKZGlWQwSBcgcdhQ6N9+F3X/CiXHfWuxKLbblXzukPOTxANd33HdD80lN
 qrzjNqPcJ09lzVE13yTkrQR+rQflqmnUavrlaO6Uu9hZ2azUlZinjV//aQqlQ23lPoXcLBuw
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685eee18 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=GPXLWcMjtaZN7sqBiugA:9 a=QEXdDO2ut3YA:10 a=NXw8GaxpU7kA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: oN_HgIGN7CpkmEWHuz2Dph-TPNeaQaUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=848 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270156

On 6/27/25 9:00 PM, Vladimir Zapolskiy wrote:
> Correct the given description of vdd-csiphy-1p2-supply property,
> it shall indicate a 1.2V supply.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

