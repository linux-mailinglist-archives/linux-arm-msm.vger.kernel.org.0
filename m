Return-Path: <linux-arm-msm+bounces-56226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E29BAAA48F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 12:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFC463AC8D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A08821B9F2;
	Wed, 30 Apr 2025 10:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNMaMoOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC51238C1B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009357; cv=none; b=XwQK2nk+ow97mRVZRijC+P7s3OJr36BgyHLXGSduuF/bmvrj8nBQihFPKGFHE7AJca8FooSpvn7CEqAX4ee2HQDHbkCq30EGGkFQAJE/yOBJJVrMasUFwCwDj2zJNr6BlphSibl4UZpD1Tt8BFwEjN5w+0X5n5XvhFO8OEOpnnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009357; c=relaxed/simple;
	bh=1qKBLvY/eYkZ4HkLzjSBXa9LYhTcMVE86RoGAwD58HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nKVbj0fRhtE4LJ9rE2QOkQDpzvyZCTED958b/5adCFqltAax4LcM2ID/ZcXazhCfIDs2PkauqPpwOLs6B3DN7svuhrLYZADzaazFnUcC4E3cBHMi/WGInhqStGhcJUGNx+0bRvFqXbbhOWdRrFT0iP7vOgWHDsUhh92/w9D4Sds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNMaMoOl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9AQYe032416
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIplIxVQFRQA47SBpjXsBem0pTeYTZkJKwbGOQPx6IU=; b=cNMaMoOl/c8zaL6m
	rn1oFgm/tjezYbC/HCG1fxpcelw3mcGn88nHmYfH+vy/URLy9N6Ehy0H/BZZREFg
	uW9dwI9dMDwAF1y3SCIllGJdIF7CJNAbP1wgk9a33lxw6B+VICxvLQnZWHEElABS
	9vDLmjy4oWxoJRW55eP9QqTpRAIHHGZXW/cwRI/2BSg47T+Q1Hoffk0ZeO3ZEb+8
	XJnn21T8aeLiQHBBoVSRWxZ4ZZ8Ou3pjtpIqql0Iby7ee7eukclBHJHQ5WaSoGeM
	tZAk79tGTrRV3IK9BjP20E5eMD1J05QzzVeUCUxWOnmG7KvW180Zkw4+twcE2eST
	VcPqbg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u29shk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 10:35:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476786e50d9so15498971cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 03:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009353; x=1746614153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIplIxVQFRQA47SBpjXsBem0pTeYTZkJKwbGOQPx6IU=;
        b=b6WCks3XQehR8EIE1tb91DnXnlWCsrHHaSIILWkdQ6a3ZbKg44HvNrOWtWBIcWCJTr
         t4aW6GnJNoYvNzZRrbbMQF6IsEAs0PxY0eO5mM8ESllXDxVbIz8cqWlNV1STpa0Mnf9w
         q+m32vmRPuTyROY/jtLQy1305qGGdEasIYSNFv8T4Z7YeIf0vn7T5zLxU4+YMB1vzqQj
         cCSgulTy5042bHEoyGd2WwIMDZ21CdQHgcXXh4ILHPjpFkpn3Cg8Zf4KyehuyI8ukN6U
         iIdjzQ4CtLa0RWfy/FYmxT4zX7AJg9lGwxP1IIyfAIHCSXAyLiUGGvbXUx1Ak4wPsJBX
         OsTg==
X-Forwarded-Encrypted: i=1; AJvYcCXCUYFqEjL7ulG6qVWBTtsfXqb8sDWOZRxbn5LprefBZshOYg/b5+/QcedkIQc06xIOru/j6Rlx+OELmnOA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5mxzUfClbZjuIov8hxV+M5Jt8YVzwLLiJxHW7+4TkkP/AGoa2
	l3zSAdFqTAhFeeoBE7ZLnhMLEmc3sYUIlsx5tefrH4yH+iX1UBPmsRtydKYihGTr53vqeDSmU9T
	sK4/2mE/jRXivrAT38KyIZVTUK39kq+yGf6rmJrtmuA4B8bbuGFXDwNs4AConOidI
X-Gm-Gg: ASbGncsNB1q1JPUZTxwZN5lOM85vesR4wtzFNlNEnH5L69lSqxEx6tEp1Vko8WLADsC
	QcM/+Qdl2faqqpn0XtCfbDGmvnOIAW2i4UaVG09ZwCZzknkNGkIGjhCH+silIyVPZoQ4o9Ex8yn
	ZcMn4hquhgyDXBXm2JhDjxbjoXQLpeWMdrVR5PVJY4MRiBKhXASJO8g4nW7ZKBMcTDNwNPUxhp8
	KkOOoqYMpLuPRbdYXS4tsygOzn6MoYC7oFjinZbGSOj95QhRac5u4UTzdx9OvzzxOTn2AzJepdt
	lYDRAVKtbhAYayVfZBDXCDLaC2le0uT3r3xz/sV7tpkWT+oowDFc/NPddN+zkR8F4uo=
X-Received: by 2002:ac8:7f06:0:b0:47a:e710:108 with SMTP id d75a77b69052e-489e1acfdf7mr10787351cf.0.1746009353555;
        Wed, 30 Apr 2025 03:35:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuxrdliL6vbr6r8aRJl/KXW/EJxjEm2uUrqhJUgG4WhRbhXeKv4jPjowBGXvbwoVE+GqkEwA==
X-Received: by 2002:ac8:7f06:0:b0:47a:e710:108 with SMTP id d75a77b69052e-489e1acfdf7mr10786971cf.0.1746009353120;
        Wed, 30 Apr 2025 03:35:53 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41a850sm905527566b.32.2025.04.30.03.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:35:52 -0700 (PDT)
Message-ID: <b39f9d2b-17d0-4619-b676-f476d17ffb6b@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:35:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
To: Abel Vesa <abel.vesa@linaro.org>, Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Srinivas Kandagatla <srini@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
 <wsdhqocld54ygjrnn6etydorcg6j6uko4ner2dawoomflvu3bp@tq5jbqcahip4>
 <aBHvwUAISo2JhYSz@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aBHvwUAISo2JhYSz@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2EExzba5dglenx3UjKBVuJ58aJoJLTEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3NSBTYWx0ZWRfXzX/rFAPvpcen YXxYsaomFhzxpl4SLSxufrLIVR6yBY6Kji18Px2W4O29PpEJJrQfJCWgGFSlEHeLVj2o5w5P4bN dG2RpTS11qMAiwAxz7QhT58F8tbUFHY4zZmQG0axlMHFP7VFjxjOi5EIgf91Jd9Dpm+vTviDc6x
 DM/g4x1hHTNybqrsMEO39pqTKNocVPjUP5fS5iJDLlo+A79woQaJBf9KidKBz7p54XnqRiJXB5y BUMfMdYlzh8Px/bxHv3815MTGHXAS3Rp0IZG5HVlmrbAmryaWJTk8I3mYvTmE07bIm/BeCze/fB g8Sff668c2xNPnbJak0grcgQyWt4RQXG4vAxsxOOrAeZyUFOegkJ9h/lYX8a6MPjY+eYOg8/EdG
 lQnhhwEhgtf5R0ATIyjBM0ekHE97S8SHnPz1UYPq3lmlwgD8cZLw8nUI6JpZWX3ykSa3RPjI
X-Authority-Analysis: v=2.4 cv=b5qy4sGx c=1 sm=1 tr=0 ts=6811fd0a cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ZJu6mct0EmN0ZqeJLYoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 2EExzba5dglenx3UjKBVuJ58aJoJLTEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300075

On 4/30/25 11:39 AM, Abel Vesa wrote:
> On 25-04-30 01:26:13, Sebastian Reichel wrote:
>> Hi,
>>
>> On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
>>> It all started with the support for CRD back when we had different
>>> compatibles for eDP and DP. Meanwhile, that has been sorted out and it
>>> is now figured out at runtime while using only the DP compatible.
>>>
>>> It's almost funny how this got copied over from CRD and spread to all
>>> X Elite platforms.
>>>
>>> TBH, the best reason to drop it ASAP is to make sure this doesn't spread
>>> beyond X Elite to newer platforms.
>>>
>>> Functionally nothing changes.
>>
>> Looking at the diff I wonder if this part should also be simplified:
>>
>> /delete-property/ #sound-dai-cells;
>>
>> This is done by all upstream X1E boards, so maybe just drop the
>> #sound-dai-cells directly in x1e80100.dtsi?
> 
> Yeah, I'm not sure about that.
> 
> Though the DP3 PHY is currently used as eDP, I think it could be used
> as DP. So I think it makes more sense to keep the DP3 controller as is
> in the SoC dtsi and delete the #sound-dai-cells property in each board
> specific dts. Don't know if it will ever be the case with this SoC, but
> maybe someone will use DP3 with the PHY configured as DP rather than
> eDP.
> 
> Not sure if I'm 100% right about this though.
> 
> Dmitry, Bjorn, do you think that is accurate enough?

I'd say just keep it everywhere, the physical capability of the
controller to send audio streams is there, but is left unused by
the specific eDP usecase (which is determined dynamically)

Konrad

