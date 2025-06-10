Return-Path: <linux-arm-msm+bounces-60770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C87CFAD359D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 14:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E16A1727F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9ADA28DF53;
	Tue, 10 Jun 2025 12:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="amO1V1gH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9E728DF35
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749557280; cv=none; b=DgZd84RIrQS2ev0WDNrL4S98murNTp21yv/U/jAWtEvcg+47BVIQkqHx8uEZ4umvfNSFq1TpfX7t5e+c6iOWQsPfWdU6c9BV8WbbZz7P/eIm8gmzo1BK7jx/gCwkAGMIDDLTxg3X3Pq6FWyytBMU/RTHSvoLs+CSZNqBDi9sJXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749557280; c=relaxed/simple;
	bh=vUJLUg5RBTPmEgB4pJpmvymOJoL5TBc9mgwnVnBaz0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jC5ue+Yaahp+uKb59+NIV8wRqKRE2Bxm8WxyK8UbSQfP7aPC05UfvpzeA0uf9zaE6jzgkC5+Wi6heoWAopAfs+LDNTZYN/vH+QXgvzZ6PzmZIiZYWqo0KHeMv2UGZzSZUt9Tr2HK1TW9eIlobRSS/SbFBVCdsblxw47rPO8KPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=amO1V1gH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AAD2rO010673
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fat5e0IB0SoYGIG/MkkVnFLpug9hfHZGf2qLnhATUsk=; b=amO1V1gH7PFHuoCg
	PIy261N1nNVAI06xgD6lL904AfXn2z8t98itSVilp3ZUAcLgd+4U8iBsvUWUWTRw
	vFrrq7Xs8k/p35IInSLr95jGmMqV8tLhlsy1pc9s+QlxlkoEU8R1TJyDyoypjKys
	N4WkjSoRjTEY1x939wiq7MmqoRTL1dd6Oq7vHLHmtt/N/rAy7vz+Tnp9CghF/sdI
	EAnLr+NYis2DZRmUTF8/vIWX70DYgdeO3YCv7R23Xr0ztmpXhXGDCEcrnDieeqlP
	LFzyqaigIeJMVVl/A+LCO/Onz4YieDZQp+fXgWSjnsCz91e0AbGd9JdtVTRwaDPc
	NM5Xxw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrh8an4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:07:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceec331273so110553585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 05:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557277; x=1750162077;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fat5e0IB0SoYGIG/MkkVnFLpug9hfHZGf2qLnhATUsk=;
        b=AM8Foa/y3UHkXvY98EWmHELV3g3AVl0WN8Wy4Iy6dEiSdg6AqXFFzlZGvGYjMZBk2n
         LrlvERzJa9gtDRm1zMOKP9WM0OsZERVpg3sJUS/2lRT+gZN5DXga0wkZ58L+xDUdvTFb
         5BZ44ycNMxhzkQnqsruHaCPTLncPdKf6WrRLbdjsSw5MOPSMsoYYgV1yL9cxTYNdzeZw
         Oe3SxQOFwPKG9TCR3mCOxEhVgKfn82y7AkrIlHiaXQlhmf7v0HZhcg6SS4t2mLj2IU1W
         rZOrE3m+Nc+fjRy16jxLekp6qWMu9O05F7i13D+jX9X2C0aA2a2v++boM6EDqmJ5c11S
         h4Qw==
X-Gm-Message-State: AOJu0YzxJatCvoY1VBkvnJI8D6QKd7krDZ5G1hSaRGxyqzmO8Kt6vNGj
	Tt5oarD5PXhWcMchauviH7+CSHcU2zSmUcXrh/dU0LxigdYshvdsvYc028Z7Wo2rX+zttND7oDU
	vU0jlr/TvMEeaC/XGG4G8nq5GLr2chztgDt/sWO6ywZclg0HppckeYbbgUbvVADHYUY2j
X-Gm-Gg: ASbGnctvPLY+eeB9pc0vbHxKgQ2DDItdiNdZ/Pmj4cCaAF+2GdnS4amjVNdin5CpgCW
	pEv7LDT1LjcAyjK81baBqpmDnswp0AlNxuWGTtzwmXtKHC4v2z7y3b4RbvHzLrgpvY2Dkrbp3g/
	eCD115VEvl5i7bRxKAOrKfXF5SuhbuopfoifWvBsABmaMll8Tnncuuwy0WzpW3TqvxBGORBfqZ+
	uORoM3wwTgkZiVmEVVTjamJXioo5v43rO0ChLmzeSC4EpnMWASwJwyWp6r/5nfN/unQP0GJZgDP
	RIHfk+PWUsVRaiHHBpDxOAf2jrvyfKJFOBEnKVjRuwrMBLcWTs5SU2r1eZmQsDv7Win0ojNcx3j
	Y
X-Received: by 2002:a05:620a:27c6:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7d2299a7832mr858807085a.12.1749557276907;
        Tue, 10 Jun 2025 05:07:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj+6dwkCJ6DlfdzxdyTh4b2DegATq5bsF0PNFjB/y/RVLucqtJq25z1WxISrL3LqrFBiMsyA==
X-Received: by 2002:a05:620a:27c6:b0:7c7:9d87:9e2 with SMTP id af79cd13be357-7d2299a7832mr858805285a.12.1749557276405;
        Tue, 10 Jun 2025 05:07:56 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55ccdsm704778066b.44.2025.06.10.05.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:07:55 -0700 (PDT)
Message-ID: <c404b9e7-c942-4e3f-8dc6-f834f84b3160@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 14:07:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/msm/adreno: Check for recognized GPU before
 bind
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
 <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250609182439.28432-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=6848201e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=X8FaSnKV0AetLU2DVmwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: hiSzGbG9xChvmljQS3aBn-zs6ZyEwJtr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA5NCBTYWx0ZWRfX/LtsgEODKI1z
 ee3RcSvDgsWHtmhr7n35CmdrHNfu2I8UVJd/pfMx5Hni37MJ2HBu/yBzl/h5g3Mgw5yoOXw/0qd
 IQTnz3o0vZN0B/7Qt7ncCjs6hQBN7cTyb0O+c7UEzE8GnsqVvRGrCefII+eqjqPw8IHEMH4Fw3F
 ioBLw+heTeWkWbvp5ygHBSZoCfl6zyTmLM2luR7Qw7imZWBpJarFl8W0CwHFcA4u+8CV+PQoL4E
 6JW+0or1xh0YHLDTl98Vzwsvojh//pBlDA2m3eOowwEl5WpBGgmI9OIJ5Cj0GdbUQBTQ8L/EKR0
 a1HdoXcDNPxhuVz+1mkF6hQbeLTni7GWPHAiYMywvEdcXh/DNMk2PUlO9ofXLElsIW1VGyBsPL6
 5YxhubCiVEwwFzjYPKpfEi7QcmWkVd0bQQj8m34yBylkSEaLN/DRmM5reY1wvoj0QQA9BrtD
X-Proofpoint-GUID: hiSzGbG9xChvmljQS3aBn-zs6ZyEwJtr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=774
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100094

On 6/9/25 8:24 PM, Rob Clark wrote:
> If we have a newer dtb than kernel, we could end up in a situation where
> the GPU device is present in the dtb, but not in the drivers device
> table.  We don't want this to prevent the display from probing.  So
> check that we recognize the GPU before adding the GPU component.
> 
> v2: use %pOF
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

