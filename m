Return-Path: <linux-arm-msm+bounces-49168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6664A41E20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 13:02:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F96117A487
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1243A248897;
	Mon, 24 Feb 2025 11:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DDTg2Vxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415F618F2EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740397612; cv=none; b=FSu6O2wpdkQxyjfwqz3jmQXPhXvcMZgUF9FdHL3wMUaxvZBbvs1uIbqJabXeBbu145IFvVDesXQwbT6AyWjyLBV89H8xR/o8T4NpcG+HAjRlOx2vGCTHBsUihqihp+STBJ9RtELRchevVy+HBNqQ7YkjPHrpz3wspq3LcfXH9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740397612; c=relaxed/simple;
	bh=XBF0vElKHwv9izTK+ZHX3O5WdWZ3wV+1ORfUCZnBmCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzVpTVnKEwrxjx3MWifQXsxviVQQJDbuK6qbkIAwZb2R+FLrAcm3yEwq8hIpJqwUAChqLFwSLuYPzN5q44lw7pkWzBekLqf3pQyteJ7TRGAmNdca0USFzAHE5zPix1eHUR4sCgVywH6ZI0foG5GXRNCFDscQ9rN5IRRtJt+uvq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DDTg2Vxl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9wfoT024033
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 11:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xa3GHQtmXXvUkIsS5ubfpH9d30YWI2ILON8s0tgJN8A=; b=DDTg2VxlH5n0g0p4
	EtdCiksujrsoUdTC21uB1k6cHMu0rB5cGagKQn9dknbgSWfaGpX6xBKTKfw2+D8Y
	Ichq3PMP8c+YiJvJOVdVmmuQtuisV0djPd3Bph7Qhel+oejA6qPBQQDtZLPsBlwy
	5CHISj7r5Wdmlue8a0itnCXCIVucqzJTekbYgq4ddu0E9hgMUAK3McwGSESqPyjC
	t1pRtesBp+EBQ7jEbsKYt/B54vwcj3XP05gPWJ2VfKYTKgyGNQrVsC1SjO8fHvj8
	EaMzxOM3J1hkPcrG6u3W/596tXyxa5CwRMu/aCy5m9Wa0P5tR0NJ/BGMPx2S9anp
	W3teAQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xnd7p1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 11:46:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-46e78a271d3so13321851cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 03:46:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740397608; x=1741002408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xa3GHQtmXXvUkIsS5ubfpH9d30YWI2ILON8s0tgJN8A=;
        b=JBO62+0BaXoBk8dG0jCWW/41LBVW2pOeSVzH+aEFd7keSbuKUawuceC/xWiRgZRy6t
         nB789wU4aFK13VTd7ckqQqvrabrzIzo7e3mnqFYKWz+nxG4EhExMT6aIafiDUqZv0aRY
         tidK35ukQc+JYX962QMFu3DEb6hjmv3c/nkltb60YQTeXiVfPKga0vHMBvn4XOS0HC+p
         vxUU/1+ad27HC12zaijGWnNYL0hVfXszT+DKrN8y4NAmihBXk1hw1JOa77vkVxNEAcFR
         eAC/OOOuWjKaj64Josgcs0q9nC27Rpl8Fw9JFsShySPcMFS2lcmbYO1GzgUcZ8ELMIP4
         bKrw==
X-Forwarded-Encrypted: i=1; AJvYcCXaa1gTK0QV8c/u9iZ6KDBtTDpLtcv0qm/SXQqFsHjPH1go/cy0Nn/U6DVct7H9FukBMO369HV+uphYfNoT@vger.kernel.org
X-Gm-Message-State: AOJu0YzBDb+ytX0dBrVN+SqNwLmXIffG8xX2YD1VqS//rsp5nTeVJdyx
	2qzBqEqpkPdfQG7k1+S6/LUuCcKuqEJTjYacDIA+r6CCbpIkNB8TBZr+WxojqiWjavG9CHG+iig
	c8czCnPFtkiTksadOMXFLtueroQLhQu48ID5BG2ZqDUYeNlydPGOdrbZN/eG+Gn0V
X-Gm-Gg: ASbGncsFK0rD3k+Nm0Lpz2LTY3sbUsAp6PknbDLy/0NIn2Zy9MC9ZPbf0AEUI0glRIr
	7wNQC5lgoimUSiZFO5VMvwsPL/abWq0goOAhszbCmZ0oLGo4Wvzhp+SpoWA2dDGeZy9XBGfi/mw
	YYVjkpXScRHzA8OWXvg9P9CKFxVKGlp/Mlejord9uNrffGxV7ifBJZMGGV8Qr/YzI30hoUVxmpH
	z66j55Y36SEcnZ9KjVAJ3JRZl1OPo6iUrJ/GLogHZtvtIILEiQWN3PwJAqiwpRXCDpLjIsozNx1
	uqsESbqamwPlgtI9q2Atlt2B9E35BbmylGxuIq4hfBb/Ni5ZWTvGnvWNRmqbR4V/KUvqhg==
X-Received: by 2002:a05:6214:5190:b0:6d8:967a:1a60 with SMTP id 6a1803df08f44-6e6ae7d9a09mr65659846d6.2.1740397608192;
        Mon, 24 Feb 2025 03:46:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+5WWCtb4qyPi6Hdk7FQSLpQ7/kRF6GbZ4urrGS273dUwCcdOpWH2AW2Megucz8XI5EO8lng==
X-Received: by 2002:a05:6214:5190:b0:6d8:967a:1a60 with SMTP id 6a1803df08f44-6e6ae7d9a09mr65659726d6.2.1740397607829;
        Mon, 24 Feb 2025 03:46:47 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abba9bd6e22sm1409071066b.121.2025.02.24.03.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 03:46:47 -0800 (PST)
Message-ID: <ea5de507-1252-4ff3-9b18-40981624afea@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 12:46:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        quic_devipriy@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250220102253.755116-1-quic_wenbyao@quicinc.com>
 <20250220102253.755116-3-quic_wenbyao@quicinc.com>
 <20250224073301.aqbw3gxjnupbejfy@thinkpad>
 <7ffb09cd-9c77-4407-9087-3e789cd8bf44@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7ffb09cd-9c77-4407-9087-3e789cd8bf44@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eAcAwVclKOqpueoDw_0faaRwDcQGW7S9
X-Proofpoint-GUID: eAcAwVclKOqpueoDw_0faaRwDcQGW7S9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_05,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240086

On 24.02.2025 9:46 AM, Wenbin Yao (Consultant) wrote:
> On 2/24/2025 3:33 PM, Manivannan Sadhasivam wrote:
>> On Thu, Feb 20, 2025 at 06:22:53PM +0800, Wenbin Yao wrote:
>>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>>
>>> Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
>>> whole PHY (hardware and register), no_csr reset only resets PHY hardware
>>> but retains register values, which means PHY setting can be skipped during
>>> PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
>>> after that.
>>>
>>> Hence, determine whether the PHY has been enabled in bootloader by
>>> verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
>>> available, skip BCR reset and PHY register setting to establish the PCIe
>>> link with bootloader - programmed PHY settings.
>>>
>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
>> Some nitpicks below.
>>
>>> ---

[...]

>>
>>> +     * In this way, no matter whether the PHY settings were initially
>>> +     * programmed by bootloader or PHY driver itself, we can reuse them
>> It is really possible to have bootloader not programming the init sequence for
>> no_csr reset platforms? The comment sounds like it is possible. But I heard the
>> opposite.
> 
> PCIe3 on X1E80100 QCP is disabled by default in UEFI. We need to enable it
> manually in UEFI shell if we want.

IIUC this will not be a concern going forward, and this is a special case

Konrad

