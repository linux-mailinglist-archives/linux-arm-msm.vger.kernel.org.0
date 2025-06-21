Return-Path: <linux-arm-msm+bounces-61940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2341AE292E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 15:31:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 548601789D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 13:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC95521171D;
	Sat, 21 Jun 2025 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwJe017W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E0F11CA9
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750512687; cv=none; b=tDTtyNBnL0kVSDzHJi3anAEWlY+ciHWw2ZsZ6Yqhdo+b7iLgwudWXMElwBKJrtpJhVfrJ2MoXwstHcp0rYfn4BAAxs/U1BTkh1mb9Vmn6Im28gS99KlAzdn4cU+pocDmhYxaSUELFp5eoVy+37uiA1nvQJwM3l02cyB0bDu08a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750512687; c=relaxed/simple;
	bh=745XbM+R293U6NPlApp30t2HMHXm/4v+Q8H+vE8yLsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQeWzJn5xIb50kW2wZgtR47AFm+t3lCIQe1eCxzuNxqPTh08UUZe26dySjHZ4n6Z+hrhozgxAWHddMCpgfLTyIEq1vp/hds8xEFymsUAJXMHHZs9Nq5bPWu42J4V/ltjNj3tD3o6cDxv/gHazETkQeLrI1dAwAy+RoSWYolPceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwJe017W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LDTcAV015626
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 13:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9imrZN8KkxLJw4ZcE6UYLM4xvLjHma6UdnfjLX804k=; b=NwJe017WtgcjFxiY
	FvI0KGvr8CIJ0WYscZffC+8JtmHCN3ATnnM83sZaOdVyEOHsBGTkB+GfKUf9z1ad
	NjOpRHKlsqrNTd0+Zo1rASOr1E4cmBUBO667y+tWFP4eDjS6f8PaBezGRDkQEeuN
	665QYRJhZmAbtdaiycPnSk+3uiQwCdrQHXneGsIqt8ZYPwuZNiLrL2k2jd31P1OM
	GxpWQ5sWL1DKvSdeXBApjYvd44oEfMw0uPEe9yQOvuJTA+LuPfNXXKtK443GfeIX
	69r7jNugbcIk/0z6a1XNwSsHG4NhM5BxtjAiRJKnqgTMFL0KeOo4i1oLmICQdbgj
	d5SOLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dm2mgqj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 13:31:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d21080c26fso72345685a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 06:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750512683; x=1751117483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9imrZN8KkxLJw4ZcE6UYLM4xvLjHma6UdnfjLX804k=;
        b=P0Qi3H0OoQBMdpG7bWVat9W6m8i6B0cLPB6LROxewFmejxfv2yronOcf4xsYkhLdSg
         alRi1cXavv3IW519NCqV9lQPMLtDx+gYJOAT3Owm5g2BtzliggkSWN0XICWS3s4aKnQY
         0DjqwxKECmMUBS0BJAe8EoVqXUjNvZ36xe+IUTA437jk4/3aXbChCTIuWRTu3iDnSoFr
         fAt7jbTLOHTyxgpACEeBvhDq++LiXuc3rp67g0JTi+5Ym1nN866QMbXapMKaaGB/S4EE
         AoYKP0KFkX5Blcg4aXVis4zk5Xc4gbVFAUWmJ+w9ahQKxayNTpem0w2F1okxl2LHwAmA
         1zww==
X-Gm-Message-State: AOJu0YwG9mfCN/cW4kbTIT0+V8hQ9iaWNqwtp0dj734z48i9Q6kslMyc
	u0HJ3ZroP9ZAxUN4XUpHG2GvPaUZ6YM93j1uD920DWKPocsuonc7gyKNXJHkP/Zak8Pu4In4U1e
	YvQECeVCUUnQWyDIfQK/aKk0ZztitscYC4y4fDufKRKTSgXB7bQvj9YsRyli/xYZS+/in
X-Gm-Gg: ASbGnctneIUBxuaWShQ01Zo/QEsKpEBxlQl0j3X89akwiqlRiY1KXWGcxyUCVL5Kk9+
	YbQEAvOVqky470B2AB3OJ2VHPh/616O64kPqB/b51PYYj52jYo6+V7uwkENWWAs1Pqw4CVRl/yW
	e2vumHgJfhB09QyBWacuNUgdeAkV30djPxflZIjP8oa/WYv3gIkNcUk80syYH/VJipIhIO081nA
	wn37/RWQv8d7W98uJnHjPt90OCecSUdc6yUq9/2kqwY5otT+lhZd03iUzwwsRk2v0kM346I5JzM
	8cBjzU7VEFq6HPhhhwEuUlIwrZiQ9REK9kV1z0Cnnp3n10A1SDvKhGKi1bTkR2xyV/Wml2G4WZ2
	JrdQ=
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr348327485a.6.1750512682904;
        Sat, 21 Jun 2025 06:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPnraGfBvL4P9bykA/yT+Cv+md6ula2ABkfuQgFa8vkKOqRNiJQoz/xtOasxclp10nTjMA/g==
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr348324585a.6.1750512682368;
        Sat, 21 Jun 2025 06:31:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7fc5csm371954366b.30.2025.06.21.06.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 06:31:21 -0700 (PDT)
Message-ID: <3e8700fe-7b02-4802-893e-2a297b7b5a58@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 15:31:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8974: Sort header includes
 alphabetically
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-3-0a2cb303c446@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-3-0a2cb303c446@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8DylIWxXsKiUE6-MUlNDlnx3F5OJAQeB
X-Proofpoint-ORIG-GUID: 8DylIWxXsKiUE6-MUlNDlnx3F5OJAQeB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA4MiBTYWx0ZWRfX+kKLP/HBuh7W
 UwvlfvEtSoGkPhAeaGaGK7d//BscwxM1Jt/JbUm1XYq/k+EroH58jXHSNj4He4mewxkNwJAqMTk
 zQE2fHK4PEuNOX2/AYTd7UBAeQOSS5A7Q5t9sDpHj9ql6vHmLklX749vNyE1da7kQN8c0waCxFE
 b5YOdhHtKsmKaL3GIfV8S3hft+bdnAZeAAm81DYeJk8++FbYmNqnPAvUNSKDrRnc+PLM2UGeXrP
 ejpM1BNbSDqCsYPQXyvdP02Tq+4SBz8SshPRXPlBMwin/H2YlZFp35qthhNxxdpuYXbGwJlV/WL
 lDKfp5GSbp6arLXjb4f1YVXmDA6SWs+uS20PKXtVT8rmvc34S8kqnwSRdNLC+Hk0+7J4QuDHHGe
 3//T5ZTelejZLnxVEgoAAx5NdpDJMKoUfkgISSaIF2YhaVsp6ZtGkEYi38yL1Bk2SnrWkKKD
X-Authority-Analysis: v=2.4 cv=Q93S452a c=1 sm=1 tr=0 ts=6856b42c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=CZQOM7k-GMDgjQxx0LUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=698 phishscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210082

On 6/21/25 3:19 PM, Luca Weiss wrote:
> Before adding more headers in a random order, let's sort the includes
> once so that's done.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

