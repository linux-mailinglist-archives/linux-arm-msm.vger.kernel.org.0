Return-Path: <linux-arm-msm+bounces-54388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7DBA89A70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 12:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9BCB7AC661
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 10:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCF6289357;
	Tue, 15 Apr 2025 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNM0dWHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC39B2820C4
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713435; cv=none; b=EuuAZmgBvp2u1xrw1xXyd5EczHrXY1xq759Jjx4yt3uBmReaaSxSDM7N2frSntaeV3/G1HXmloX+SNdtAg/IdZDwP7HSkVH+3Q5nNZjnNoU8W5IRtMXtfuyZFoZfmQ8o0dGUG0pepIR+CJ8cqZhDqCYNNrQeuyeQCpadgPFN8PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713435; c=relaxed/simple;
	bh=+3lmL6oi2bASqh+SzBsmbskw2dAbEFAbMK1HUa1nNI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P+Vj2AdPUjsCubBLUKPDQjc1/oyALcD/kTRaRSTFSB8qk4YnO2MgjWZ1CqOwpyIvAXiAAolQBla2/e63e70fXchVWI8N7+I1OGg8kxqNuoHGIXMM9Kt5XlcQcyq1MUS1F0xGkoHJaXKCVpYlfdDtvQj0gs7T5tamCwOQc0ImnZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNM0dWHT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tCFT022965
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qYSG9EAZOKsDcJ830qpQK8lVa3VINumKE9Aa+BZiDg=; b=XNM0dWHTPrc+wN7d
	LZaZ2M6qX4bImCWk5GJh8adE7V87AJUyeFz4EwEJp48LqjywU88VHfokdyuLzl7n
	cdQJGZ23nmJpnN76hRZGVUY2Qh6dTw11p+dI11KlVWhM+R+VoD9rWDNjRblFYvve
	5NJUAyTBJ/bfrVeU/xbl0ew1f0GhoV6ZT7ft6xd3DQzSmOGhi7LFOL1irtx3+2PS
	kq42sRgaptaSDqQ0N+SCCCj08H+8p6FQbSa58eatznNauAXpexB9F2GkTvKtaC8D
	nXvl+jeqPqxTpWiUet2BYry+b+3X2txAbYx8c5TK5HmxYJ/fnAZfmXMLfuhxID5m
	mqTqag==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj97pff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 10:37:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb8a269a7so16715806d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Apr 2025 03:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713431; x=1745318231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qYSG9EAZOKsDcJ830qpQK8lVa3VINumKE9Aa+BZiDg=;
        b=KkINQHXTWLjBDjcaWOeea4BKxkaG4GEv66nkJwPQLuKQHxxbWFCL0rEc9+kUiJTZ9T
         s94SLQQkszmQKtvbPHc04AO42Np8c+Wo16Okdiqh4T/3xMLPPkyGxZKF53gkDj8lED5S
         aD6GFgtkkkhUTTi46Bdq5H+0IkL1yLC9+0xq4E0j7R/EZZAI/4jsvUMyyT2/QiEgXXYh
         KjEURH0Im5vvgDu+1y7/ef2Ae498Aig0TgdGUqA00m8bbGjbHFIgf4cH9QxtcLOOXNFB
         2lEZA5hdikQXGJAbdatKcIbzC/xkCQifdAxyZKOUqD89n/WFCbFIs+0y4TdmSJmucboK
         2tPA==
X-Gm-Message-State: AOJu0YxdAnxPCT3QcjU+w7BF+NQWimJVobRgc/2jbvBjZbt5immhS6vB
	YNBfofHeaV4xNkqyYcHXIjenOdq6GByAy/+lYHt3GUHSOMm5+SsHlIPUbvCwDNhgzuTKK/I0v1x
	mMxmPBvrUOWpwTZCQLRcxoZiqR1w/shajaYOzDJgkDWFi7/nGvyrlkG7ltPm+pq7Lh9CkEo5f
X-Gm-Gg: ASbGncud2LpUNwyBAz66k8D4ae2Hb8yF5wXDpSMAzCqYlyJkyrDqrNo0DmVofj1mQ0K
	pv8Euwv6nGlbUBqnkomWvw/rFUKeDnEa3rfpkti8FLQNNsH9vEYExnOgZIMMWdBKP+diNov520m
	d3NKXVLwtJMVVgbfgJNgKtaigENQl0Qw0dSqTYoJfLxG+Hy4xm+0ZcemSsTMl2icnNKbyjcPTjM
	IR/amgqufbsDVBVuVIBpYPsW+nM7YFhiv/+yuXtk0aP6/MjBXo7K5B8MLMqPflUQP4dLVWen8is
	oHcj4ehD6lRfYMHSMrOuazqgu/Jmizt75OknbJ9bSEK4ID+vGRkx+/B9e6wnWJHUXv4=
X-Received: by 2002:a05:620a:3197:b0:7c5:8f37:1eb2 with SMTP id af79cd13be357-7c7af113d7bmr802860385a.9.1744713431223;
        Tue, 15 Apr 2025 03:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8r7n72G0daVWxWBawKKMJy1SmTAH2H+0oI9U77ipAoFv9U+PBQ74nw/0I7ScuZs5wwwwN0g==
X-Received: by 2002:a05:620a:3197:b0:7c5:8f37:1eb2 with SMTP id af79cd13be357-7c7af113d7bmr802859385a.9.1744713430864;
        Tue, 15 Apr 2025 03:37:10 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb424fsm1054699366b.120.2025.04.15.03.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:37:10 -0700 (PDT)
Message-ID: <117692dc-ff65-4ccb-8eed-70f713daf67f@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:37:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] arm64: dts: qcom: sa8775p: mark MDP interconnects
 as ALWAYS on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-2-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-2-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2nQS8LfjH6xjDw1eUIoiJmC1kor41Ix9
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe36d8 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ugsCTDTZwSmivG4p0MgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 2nQS8LfjH6xjDw1eUIoiJmC1kor41Ix9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=689
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150074

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Change the tag for MDP interconnects to QCOM_ICC_TAG_ALWAYS, so that if
> CPUSS collapses, the display may stay on.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

