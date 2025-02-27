Return-Path: <linux-arm-msm+bounces-49642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4F2A47813
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 09:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64F6E188A8F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 08:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1127E225A48;
	Thu, 27 Feb 2025 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GIG68AQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D741E225408
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740645680; cv=none; b=SM9mS+/bU1/RlaVnu+mBHLA2T9iaBAM+zXyvlio8TYawCy1ouur6s1MlmHxofdf7wtZ/2qBRyPwneuveXaWIZFXoCyIRnQHIdWXasKOSj2Eeg76h6ZMHs/mmdR8/Hh91diAAHbor17rza7n4klQBRflYcopiV8JqlSH/9Cb7oT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740645680; c=relaxed/simple;
	bh=89rC7kZbkcASQamwLRvrFvIU6AhSGfA4ExjQECq5WRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFiFTu2FV9uxgHEd1LsBP0hQWUeAtEj+pvKYk284Db1rZs8jQykXG9FVcOHAN4O0g9c7rrLG3tIck+SAhEJMmJQu439Y09IaHAoIlKXtaEJXqaBbsWqe2/wpUm0sId+Pg+bv65R2XBVO4ZChSv1mVM+By72XTACyNqKME0ODZD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GIG68AQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QKlXxj011865
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JOqNjJBAIhxG3FL4vnYhg40wLqyc2fHfkuSLoPNN8hs=; b=GIG68AQOcY+g3pQm
	5cyrNADXaEfweCFH3qppKTOkieS9Vlr6yXVGzAUN2c6+W1w8nLAGtxf++TozaQIN
	zw0QF6fqplpUx5Us1LF3J+4ZO65/BxHZEaUi+X9D4T3Voxql87s1llM6wTvLK997
	lgCYwjvWe/Uj3GxVI2FwwfarS+2W9nsJRM/euYpVqxPa0hn3EuV1fC37SXjzzWLL
	pU34mAPRu1hRzoSpeP4OzEd7sxXSkAiEGUphLwg11ZKZlExiKObUNjlff+FIU7JA
	0FUAMrlDvQ9SS+lPOrMKOQTAzeJI1//KVUQpm3cgbKP/U+ceYzBPgKpCZy4p2WyS
	70zt2w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prkcxk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:41:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e19bfc2025so1139806d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 00:41:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740645676; x=1741250476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOqNjJBAIhxG3FL4vnYhg40wLqyc2fHfkuSLoPNN8hs=;
        b=r4wWAlvz7B6JqhCiTbnziJbWLAOEAF3xj87DKuPAOBYmAKa/h/uF/cBN/yGPBQjRR+
         sqoeVBrtaMLDahqDQ9IlsqA35dcMF7tDrKQKg3hlTFkSpUE/JPQALGQ2oq9vBCgEzkOp
         DN4Qkr0UDhRhCCy39GO2XDDtiPTdi6c5JeeTRUhkStRijORa5BXTMyon3R/FFkn+H1Lv
         Oj2cVD/fnv1KyJb8eJndJDzSeZdiAdQwgoCQufO0rLVKTeeSmbBYlgyDwAX74Ux/PmCS
         cIBGt2xU9/i2Ef7CSOxYEGuNwb35bmgqI/4j53N4+Nl3yKiEyrw3ngbEMFJ3CjZ/Epx/
         w6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXJVsE1mAQkvc28vIyh0a0vEA83AHr3OjQrJgL3fIx2pu7ZO5SCdEixB1BNGV9LVqx6MEAgeHfbbUIoh33@vger.kernel.org
X-Gm-Message-State: AOJu0YyDf3tfIzGpSEKQWiRg/c7P1cyi3vliI/44OfFUPKj84bE1G86g
	/IzZ2Ur8QBrqKD/9ktK3ib55SyUBLTpikUOfSvgHR4PhnHIbPod/08sJb0hoD2/dQLwg6ohbBzS
	wGgHGxsBnUdMfbc0pc0II6Ni0VY05xdxoEGFXiCvwEHJi0a77chFnj63dFuqXtOiG
X-Gm-Gg: ASbGnct8KH7f0ApxCS76ffXAck5djSd/2n9kzvGRTTsag+96cVC5Py9KgUFoerpbh1t
	y3wf+PqV6QtVHU3O3Lt7sxh8puyjRmn8Lr1wrV2UTAAeCIEY0jVJGts3G/G4tJsVWiWcz+oaiIX
	lTEiOdXL20rpZ5vRmclbDACbR28qu4M722Fw2vfzugX7l9mTPQEb0GRUcxopYlAtYoZxEMlEnYM
	CNFuHLaH1Axf73b7V844ZvTXSg6QLZ6d+rqMUzZm87OlsB7YdzHP84Fksn7jRtst56y2BPTAG/U
	4wrvk8oMuj2+F9acmkyVIunVBmbE3ajzsP/2EtJ4qlolcOzUt+bxMk9q3Pez9EqI27iyP1A=
X-Received: by 2002:a05:6214:d69:b0:6d8:a723:6990 with SMTP id 6a1803df08f44-6e6ae98a192mr113618126d6.7.1740645675823;
        Thu, 27 Feb 2025 00:41:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxMysL475oAxX/iyIwsIBUj0mWgpzxJ4dLkME/PMjx+F7J/+BL0dq6r8TsPU4dwGG03mAHGA==
X-Received: by 2002:a05:6214:d69:b0:6d8:a723:6990 with SMTP id 6a1803df08f44-6e6ae98a192mr113618026d6.7.1740645675490;
        Thu, 27 Feb 2025 00:41:15 -0800 (PST)
Received: from [192.168.65.103] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c6ee4c9sm85831766b.97.2025.02.27.00.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 00:41:15 -0800 (PST)
Message-ID: <40a2b943-c681-4f91-ae40-9002440f8708@oss.qualcomm.com>
Date: Thu, 27 Feb 2025 09:41:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable
 external DP support
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
        abel.vesa@linaro.org
References: <20250226231436.16138-1-alex.vinarskis@gmail.com>
 <20250226231436.16138-2-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250226231436.16138-2-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J6I_nONjUp3zij4khC6lEQGgQ0G4Fl-U
X-Proofpoint-ORIG-GUID: J6I_nONjUp3zij4khC6lEQGgQ0G4Fl-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270065

On 27.02.2025 12:12 AM, Aleksandrs Vinarskis wrote:
> Particular laptops comes with two USB Type-C ports, both supporting DP
> alt mode. Enable output on both of them. Explicitly list supported
> frequencies including HBR3/8.1Gbps for all external DisplayPort(s).
> 
> Due to support missing in the USB/DisplayPort combo PHY driver,
> the external DisplayPort is limited to 2 lanes.
> 
> Derived from:
> arm64: dts: qcom: x1e80100-t14s: Add external DP support
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

