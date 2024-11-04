Return-Path: <linux-arm-msm+bounces-36948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A04A69BB718
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 15:06:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26D001F21759
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 14:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32D1144D21;
	Mon,  4 Nov 2024 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKfJfpDD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2345813C9DE
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729197; cv=none; b=SIGFxuY1m78cwxfkiKN8dRpKPswzCxxDdvlaatbWIXTa5vmic24rOZyIpVq+XzPx0ELSIA2PwdHaaq4vnfWg5xgtp+a7QVdwG0eVmelGExk8qnvT0xzAojYcH512gKhd7AICh+tbuzx9cwyXMUHWCxrunKCY8qBam9Qau00VksE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729197; c=relaxed/simple;
	bh=boLrYQ9e50YIzisfXirgfR9tZGcXWIEEhT8FxZQYTz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InMgCL/YRoRE/TnUUAHgHz/F4Jun49TjLYhsNNOv6vGFlmjecKo4CKEE3D1K94TPH0yAbfI859fNFSHNmjl/zeFPnumi8iuZmt0x4sMhC1tb4fe0x/0Ip0EFYJ3VRFxURBgzB9YhgvBmNziu7UzmvLmweo1KXtYqv6AtTHuNsI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKfJfpDD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Bw6tS016007
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 14:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJUr+78OsAjR1XkAqPodG3wXnB3Itpx7Wgqz/RR6KeU=; b=WKfJfpDDPTvb8Bkl
	9rpgsFi4VTGHxnKZ+WHe4uZKxFHdcZW4ovAHE6N8v4btl1kmyRGiBqwY+MH8Zuc1
	9jIk67u6y/0Nknfu93ZzaWU2/TFiyYGfagsLg8Vw83nU1fiDYge0xLwv/rsDIBwX
	tGLebyFSbcs/JPhfQVUwA60hrKnPaxAc81aCnR6ijtDlBjlOfWlcjaYIi7jmJq+V
	2zJUf2i9fNvGtXaWL+8IkI2l2muEjsykMzUXe7z7SCqhW91onhWLFyYbD79ryF/G
	VmTMWaMzaiZ8gntvd4Pcwe+DAPKsWoyKudij3cVBiliRRHPjbTV3d/96+fQ/H4fX
	gagcaA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ndc6vetp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 14:06:34 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5eb75d21d3eso348502eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 06:06:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730729194; x=1731333994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJUr+78OsAjR1XkAqPodG3wXnB3Itpx7Wgqz/RR6KeU=;
        b=EzgITJOUOXG8cntpvUuIgn766RDXiGAeBVdq3caQy6ar5N3qZG878fHhElq/BRBXTs
         lcNvM2b8Cjx2q0qLLHGsuDe/wnmzotVCAuCq03YoOcMZ5v8UJlHbQp91y7FDHbdQlMYV
         SrEv/miAzZcBzZNtXe5o2F758VfijQJhSB41wMHEOKfKDeuU38I/7GdqiCHfj158K6zO
         dnLwn6yRPuU2wjbKqQxqyBJBb1rwo4RiLPtJROpYhcPN9g53UvlKza9bZgAMuPqlxCtb
         Q9zQG/QjthsTAaT8pD1hKQz02U+gjdpCHL7GsHAsrbUSFC/6/4vG+EJTATT3NIRatmtx
         PBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5kz1U8j2m79rAmDCTqrVSSYXKY1eH+UkIuev6ec2Wk0I3d5u2s8A0w5MoHOVWb3JZbuBGsBCy4twQaiQe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5t51Hrb2jVLS9x6VIwjImXkt9KPrPFFCiR0h2wiBnAHTNTV4N
	4adwHwoJ1ssSW6E7xCTPNNRG4B/Hk57PTUjHe9lnW3kD8o3ZkLfX99y0KEeVBGpVYvsk4pM/l4Q
	GTpenc19Q0tccwOxyhml6RD0jAyK7aqPHCjPj9kzn5VEExXeS12Ufzwtf4Z66wiIc
X-Received: by 2002:a05:6808:1811:b0:3e5:f9a6:ff5 with SMTP id 5614622812f47-3e638248adamr8268465b6e.2.1730729194023;
        Mon, 04 Nov 2024 06:06:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3glwYPgrrn3bLA20SfuRtohDBCQZR/xk2xWQCdWoU3C+XBiGNvqk7NsOLh+xpn27lknn8Tg==
X-Received: by 2002:a05:6808:1811:b0:3e5:f9a6:ff5 with SMTP id 5614622812f47-3e638248adamr8268451b6e.2.1730729193733;
        Mon, 04 Nov 2024 06:06:33 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c6150sm551280266b.81.2024.11.04.06.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:06:32 -0800 (PST)
Message-ID: <c6f8ff2e-bcc1-480a-9ca6-0b55991c099e@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 15:06:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: x1e80100: Describe TLMM pins for
 SDC2
To: Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241022-x1e80100-qcp-sdhc-v3-0-46c401e32cbf@linaro.org>
 <20241022-x1e80100-qcp-sdhc-v3-2-46c401e32cbf@linaro.org>
 <a282021f-5e61-480c-84c4-272049e28244@oss.qualcomm.com>
 <Zx9P+HQMOkJsJGcj@linaro.org>
 <327507d8-2dc7-4645-ac3d-d68ff31a84dd@oss.qualcomm.com>
 <ZyS50DFLhHVlnRtd@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ZyS50DFLhHVlnRtd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0oRTFEtjFVDjsYGJSfuxSv9D1OBJC1WP
X-Proofpoint-GUID: 0oRTFEtjFVDjsYGJSfuxSv9D1OBJC1WP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=984 adultscore=0 clxscore=1015 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040123

On 1.11.2024 12:21 PM, Abel Vesa wrote:
> On 24-10-28 14:10:54, Konrad Dybcio wrote:
>> On 28.10.2024 9:48 AM, Abel Vesa wrote:
>>> On 24-10-25 20:34:19, Konrad Dybcio wrote:
>>>> On 22.10.2024 12:46 PM, Abel Vesa wrote:
>>>>> Describe the SDC2 default and sleep state pins configuration
>>>>> in TLMM. Do this in SoC dtsi file since they will be shared
>>>>> across multiple boards.
>>>>>
>>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>>> ---
>>>>
>>>> Not very useful on its own but okay..
>>>
>>> Fair enough. For some reason, I'm not able to get sdc4 pinconf
>>> to work.
>>
>> Any chance you tried to define 'sdc4_cmd' etc.? This one seems to have
>> sdc4 pins on gpio127..=132
> 
> Yes.
> 
> But since the sdc4 pins can have other functions and since there is no
> device that uses them (yet). Shouldn't we just skip describing the sdc4
> pinconf entirely as that should be done on a per-board basis?

By that argument, why describe the controller in the first place :|

The possible pins are predefined and physically wired up inside the soc

Konrad

