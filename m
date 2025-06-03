Return-Path: <linux-arm-msm+bounces-60091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE7CACC092
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 08:59:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C74016E9A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 06:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3B3268694;
	Tue,  3 Jun 2025 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G1b6teRp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B391F5858
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 06:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748933959; cv=none; b=T8cwxRqraf1Z1iR6ffa/QF63MXJdgKHGxtwBGhZkJNNQBRfarHww7ersdLRQi4t6S0+wJAs/jFY2QJo8UxiIaGwGYqPIRgwZzKQr5/A599gYlcPpg0m09AULGLL15PmdhTuFEPUWGelXUWevE43g1dPvgKodi795d0gQLrozgCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748933959; c=relaxed/simple;
	bh=yIl91cIODbcq6rOSVNz4VGeqdOw6XOvYiMSRWZsk0uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U4opbqG7xT50JAV0c1dYk+QFRJmKfbvgnc9wmyAjlVe5CyqJ4PQ35XHjZvKHkseGxdqtdApHwQc7UZ1tCm0cQAB4bDaGOjr1rc3+USK2O51cfnjcKfGrrvhO/KxI36Rt+nVbEkcy/TrOxZA2vyUx5bAO0/8Cja/+jCj9mvTr/Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G1b6teRp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJon0011691
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 06:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O88Sfa6gWtkGp5uiGxYhsgS/QzkSjFVA7I558x1JjIE=; b=G1b6teRpu84OEJhK
	W/VaIX6157DxmGKESVyCRWKNHxBN2l/F1tUpMIteOjmR4oLIH7nNjiwew6psKOzN
	bBcFcUDulVJbXpNzCw4A5YVPrArTD/ddqE6aDLl08PXG8gK0yyUzptN7CFGwtzeO
	foWkmS8EPPejJ0p0bHmYImfCj1OaZ4skpZ+LLlq32fGZhOFftHBgRM2/rINFMk0q
	I1Fm1EF0SZ3FOMx9eRU5aT1zpYNGMNCLLGLER2K5OyQS7EfybDqSdLyegWraSWfW
	DKsZ1QuydLSMQQCFdqJ/iFKOHWf6niZCLP1Qj6AWPq0w+EeCHSSYLqzTGZITo0LK
	GQnFHQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ssmab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 06:59:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-312f0d014a1so192466a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 23:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748933956; x=1749538756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O88Sfa6gWtkGp5uiGxYhsgS/QzkSjFVA7I558x1JjIE=;
        b=ZS3JRJoKrLZv9VTuIX0uJJ9glkV0l88zKSX5T7jtvr1e9GKGJhxFZslsP5S3TrAGkY
         Li1YUQo8NXiBWCREakr0rbzjR82LAFEuzBr+4v6MiKNrAb6yViK2ZytwiQHNXmbmo3AN
         Ejrmh8ynVMIf3gwK9IyEjJaW0jbva9eAWPs8QjzI7abLR7Ni7Usbuo1nBJxuPNxlGrvs
         6rj/ApbPz82vhPM9tXdJVXyFzAQgnyO06mktY9Jmnak9+zPKGRNEtFqDozhXYCQtiwcs
         qkwPzFqU5PqnDGFBVHyWQo5tTHiEdT2QC7sBROwwIEaxoKjPdV8UnRa+NasjqiI2o3me
         DE2w==
X-Forwarded-Encrypted: i=1; AJvYcCXnwL1tRCQkz4DLo6VtANqytM1J5bsMuZI5tVjLYwxDj0HyM1WhAPB4D8YE8Y6cAc3ClYyr231snHupzTL9@vger.kernel.org
X-Gm-Message-State: AOJu0YyG4MvK8ynPvRxyUA0nzsYxvyzH1vaLOF86kyVnu0i6PLFzdWvL
	ijCAD5jakHsMStX6F8V7sRt9YSdOL8/QWM8QPXDklegKYSqoyLqmJwOVYdpzxDegH0D6LyLimxK
	tUsODW4NUOtnf6TYgTM2ttnbim2VVCfZZn8rtOmJe6pvDxu8WpzTn8Q0cH7RJbezMCov8
X-Gm-Gg: ASbGnctHQz10VpWcm570pDvj3ZLUGB5VTy98BjGZyBGvig13frpx9ugOeBOLAjJFnc3
	zndCJ1HGvPlKzO2QmA08gDqPYNChTRPXR63erCLQSG/lVq1BmQJal2sLq5JQD18Xsfdi1pXtNuL
	JtGPoaj5HzP3HcHNLFlkH/xoJmEh2p2zOOFBay9JwkY+cJsqSi2G4ga9CyLaHqXVsn3VrMUoqfs
	1NZ95L3IRmIyuZcOOOtRiRADo2ZZ4iEjtycn5QLWtlgSl9XqLe4jW51mZDda1fk6DmkACsZTajF
	kbKI1YKh2Vv6phZc7AHxQ4M+0fK6lTkpkfIlT5HcYf4Z8Xep4hGYi3ESBIC6lYcf0HQZYdqaa+o
	t
X-Received: by 2002:a17:90b:1dd1:b0:312:1147:7b16 with SMTP id 98e67ed59e1d1-3127c75a1f6mr16567636a91.35.1748933956176;
        Mon, 02 Jun 2025 23:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/449gaCP9UeICVPOMl7ImevR8RyxYzaDJddV9j5cUxAmjFJ/jq43ySQCuFyd+RVw0vYtQrg==
X-Received: by 2002:a17:90b:1dd1:b0:312:1147:7b16 with SMTP id 98e67ed59e1d1-3127c75a1f6mr16567596a91.35.1748933955725;
        Mon, 02 Jun 2025 23:59:15 -0700 (PDT)
Received: from [10.133.33.127] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e2e5e77sm6640325a91.20.2025.06.02.23.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 23:59:15 -0700 (PDT)
Message-ID: <c4be4b97-6104-45e3-b555-6691e369c3a4@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 14:59:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] dt-bindings: soc: qcom: pmic-glink: Move X1E80100
 out of fallbacks
To: Krzysztof Kozlowski <krzk@kernel.org>, Sebastian Reichel
 <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-6-9e377193a656@oss.qualcomm.com>
 <4e093835-af3b-4a84-b42f-fa7d3a6f60a1@kernel.org>
 <14cba9ae-e3bb-46e8-a800-be5d979b2e06@oss.qualcomm.com>
 <b07200a2-4e7b-480e-a683-d116e7da8de8@kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <b07200a2-4e7b-480e-a683-d116e7da8de8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMizH5i+ c=1 sm=1 tr=0 ts=683e9d45 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dyB-bXEIEhcmCqCGgV4A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA1OSBTYWx0ZWRfX5cgvSGe60IAS
 0DwTEF0bx/dvFj2fJsNgTK8eWILlTvqgCelHKrBdxF5vP2qqIIwhJ1mUwMn8g+R/BcK/eXo3yKo
 lrkD9ExX/XirHWYzDnK+xqAlU/gd8qEcTogJJPVILodvL/x5TfgIM6xMa3EGiLA5j8hssT4RTp1
 RYf858mvmNmDtRyxjP72TbhBrahR0GfkFlihUM0JSyjpRPuHuirSnySNlayK2KIHd0oUZ6SEAWF
 jrT6CXmxM1nAsopBioDE5tQiT5lVt5DcxWyeIxIEe1LqwDk69UWdKXrBUHXSCScUl/7PScCDFeq
 U0DOc7kw6j8kKPf/G05/fdQL7Vy6gWzsBaEiIJqFGQhg91wmPgQVZSsFmlNL2R3v7OpIIYAPKEw
 tLZL5wI0oCf49IuM6LmJ8CfFjGoRph+icFA0MtLJQRzSU374IGjrIS2LRM4fkSWbXiLnizFm
X-Proofpoint-GUID: 3CBEByhA1tlCt2sKwytJNANIcNPIBbuD
X-Proofpoint-ORIG-GUID: 3CBEByhA1tlCt2sKwytJNANIcNPIBbuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxlogscore=893 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030059


On 6/3/2025 2:47 PM, Krzysztof Kozlowski wrote:
> On 03/06/2025 08:42, Fenglin Wu wrote:
>> On 6/2/2025 3:40 PM, Krzysztof Kozlowski wrote:
>>> On 30/05/2025 09:35, Fenglin Wu via B4 Relay wrote:
>>>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>>>
>>>> Move X1E80100 out of the fallbacks of SM8550 in pmic-glink support.
>>> Why?
>>>
>>> Do not describe what you do here, it's obvious. We see it from the diff.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>> Previously, in qcom_battmgr driver, x1e80100 was specified with a match
>> data the same as sc8280xp, also sm8550 was treated a fallback of sm8350
>> without the need of a match data.
>>
>> In ucsi_glink driver, sm8550 had a match data and x1e80100 was treated
>> as a fallback of sm8550. There was no issues to make x1e80100 as a
>> fallback of sm8550 from both qcom_battmgr and ucsi_glink driver perspective.
>>
>> In patch [5/8] in this series, in qcom_battmgr driver, it added charge
>> control functionality for sm8550 and x1e80100 differently hence
>> different match data was specified for them, and it makes x1e80100 ad
>> sm8550 incompatible and they need to be treated differently.
> So you break ABI and that's your problem to fix. You cannot make devices
> incompatible without good justification.

I would say x1e80100 and sm8550 are different and incompatible from a 
battery management firmware support perspective. The x1e80100 follows 
the sc8280xp as a compute platform, whereas the sm8550 follows the 
sm8350 as a mobile platform.

The difference between them was initially ignored because the sm8550 
could use everything that the sm8350 has, and no match data needed to be 
specified for it. However, now the sm8550 has new features that the 
sm8350 doesn't have, requiring us to treat it differently, thus the 
incompatibility was acknowledged.

>
> Best regards,
> Krzysztof

