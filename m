Return-Path: <linux-arm-msm+bounces-46640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C421A249B9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 827D1163BFB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 15:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AEF1BD9C2;
	Sat,  1 Feb 2025 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+lNUpa/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405A046B5
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 15:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738423299; cv=none; b=hvFmxsuEzFv8gvBuncMUrNdGCGPkZSFSP9vhwbng3bbuPcpUhpRNuCLi1tEBjOVPWCZqzVexOl1new2HGXL54+w4BdPrZcqoWKKW9r88IcvM0rVwwyMCLJY4VbFgi5wCEz66PKKQnaA9rEQCKGk5GKO9QwweVxcymBWIH69ma6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738423299; c=relaxed/simple;
	bh=jwlgbM58gVPmYcQpvsJIy+oPufT9yeu6uuA3sKSpgfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=akbr6z1FkAY8iJXSj5wOJJTdjgiUlQ78oQOQc1WE+n1hgEL1H5YLDcFijMGADOUSKLnA/DeYVKzerUVYqU1+SzQ9dClNu19SnyjHb/EBuZCE3EnpCjsXLH0Or1wN7nVG1qehiGmCxBlupBa1KM7cYbfEaLXQW8kwwmGLM6ZVQkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+lNUpa/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5115AfO8013961
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Feb 2025 15:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OYn14RVc/FnUbOz6NZcw5IacFoIiXOj9waoegmQ0C2w=; b=j+lNUpa/HZ/qqHHN
	ej0VzMAKatRapM+8hvwowBusVtTTIWyL46Vxfc/XDTw1KflGu3yR/R1AkrKrzp0r
	XC8UHphMfSbmdfsvVX2wZXPWJZSXhwe8EVC2gwh5qwbTqebJ2C8gD72CqAeD7ylj
	lWw9OZhlDZ/AkaIx4yEOSqcKXyW9lWdVWhoCtkMVwtwyA8Adb1TQGq2Fzw1NZ9ub
	cNTzy4fgzzg31i5zfPr94zYCdefJ7Aj663DqwodpLItrgVHXbIj3trEApPX0qRld
	GNSZ8JtgZVUVqVUh6Vl6Xa+/pEQPHz1S7OsWAbTTFmmSHNhkQ3Oy4b4dgr+hpOSa
	r5G5Yg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd7xh27r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 15:21:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46e4842dbd0so8005501cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 07:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738423296; x=1739028096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYn14RVc/FnUbOz6NZcw5IacFoIiXOj9waoegmQ0C2w=;
        b=IfyYZTdisnJS1wVr+RIAImYaoeLXxXcSqitcFPjbAGIjad4kReM3nXkdrlMRbBpYz5
         NWCA3ZYgg/fAR1MsJEZ8cSHbkiQKd8buWvcCWZO33UrmjZV9Cc5jPRbHVzdOzYYiyIrt
         Z+TPlanHEqXqiSMErtLAwlYBLOSRGYcEcoxhGsEg9Qs1o4KtKda8+bd3KJeJ/U5qTm8W
         WN7LB2igflcMk04XRYuMlEhi4fTfIqSQLfg9DLgdfPQQgJhbBxhHSda5s9h5OqZ8qMab
         zkUX5LE80zItiqGQriLBSmucrNBmTPTPR/JEUeKCYxXChUifcVsyVLBIrCRg/ni7HIch
         Wb9g==
X-Forwarded-Encrypted: i=1; AJvYcCUweQ4SPqNM2W83arKfQsraYxBImYt/iFYEQMnDt2KUXg5gK6eI2LGByA/1rU5K4uJdfCYst+B6F+V+Gq+V@vger.kernel.org
X-Gm-Message-State: AOJu0YzsR0YvbCje8M6lc1621C/AvbV+p1jqpxbmTtsgiJBvwjhu+/99
	xXAGeh+HosPOqyEGFX7HaRnDJnwzi9ujm9oSRrITMEVOLkDFOaq9yeRbbHqWys2I+sYia2d/K+e
	jtlrPuUInCtV09jW8CBr+K2ZWCcCWwUjq6sy/9iSy2OxoXpYVKK2WjrEELA1W0d04
X-Gm-Gg: ASbGncsSDvp++MNi2fGOJpJTuiEMrxZA+D47OYWiZk1fHuOmZXUCFen8gqz2ndEaXrm
	g6Hf0TRjjdjJtwy2dSffHfrLQH3PZTcvfCh9G0OkgqU0bB3MvDtK8hXApn28aEmMqGKkT+RWWTS
	Hh1EymoSRAkjzBLXsffpWSD7+bE4D5ec7QsUP0iu/wsUtyCgQDJ4foyBiNWF+p+z5CKYSwUq8z+
	G0DxuGC+5zqy07KFvpToK3lfbzws2M2awJtGJqexQavxLteIBykr/xGtq1MBSYR3Hv6WuE2netP
	BKSZTEy3qx4ZkC05EwSVekNaf7nzM5kRi8U7fzS0YbmV0F6qVQjVQDLPynY=
X-Received: by 2002:a05:620a:1921:b0:7b6:6b55:887a with SMTP id af79cd13be357-7bffcce582emr868788785a.6.1738423296263;
        Sat, 01 Feb 2025 07:21:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEySoHd41wM76d7YXvZgBoCWYiEpndiihi7DUAJYjYG7YdkAiWAxYQXu8K6ao9XqT6ueBFG2w==
X-Received: by 2002:a05:620a:1921:b0:7b6:6b55:887a with SMTP id af79cd13be357-7bffcce582emr868786685a.6.1738423295862;
        Sat, 01 Feb 2025 07:21:35 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7044bd8dbsm220728666b.2.2025.02.01.07.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:21:35 -0800 (PST)
Message-ID: <ee608de8-ad3c-4cb4-994d-fc3cf930e29c@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:21:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: ipq5424-apss-clk: Add ipq5424
 apss clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sricharan R <quic_srichara@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250127093128.2611247-1-quic_srichara@quicinc.com>
 <20250127093128.2611247-2-quic_srichara@quicinc.com>
 <0c26af56-ed7a-4de8-ac47-7447298b87f0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0c26af56-ed7a-4de8-ac47-7447298b87f0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NIUUNL_9lLSzgA2-5T8tU-K9xSG95CCc
X-Proofpoint-GUID: NIUUNL_9lLSzgA2-5T8tU-K9xSG95CCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010133

On 28.01.2025 8:34 AM, Krzysztof Kozlowski wrote:
> On 27/01/2025 10:31, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> The CPU core in ipq5424 is clocked by a huayra PLL with RCG support.
>> The RCG and PLL have a separate register space from the GCC.
>> Also the L3 cache has a separate pll and needs to be scaled along
>> with the CPU.
>>
>> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Considering that there were multiple conflicting patches coming from
> Qualcomm around IPQ SoCs and that we are in the merge window, I will
> skip this patch.

I think you confused this with something else, I don't see any other IPQ
clock patches

Konrad

