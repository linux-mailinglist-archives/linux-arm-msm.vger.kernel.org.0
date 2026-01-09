Return-Path: <linux-arm-msm+bounces-88235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD77AD082ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56FD1306216D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:24:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3653B3590C6;
	Fri,  9 Jan 2026 09:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="psM0ANYx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjC7qyeb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F0C3590CB
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950656; cv=none; b=c1EiKYF4ZGQh08COrevlRqxvXB/UteuSmsF7tabgxcAv6DCMO/vB/DePafY495xkm5wnsVRlrvU39rrRaYHOxUegK+3iz2kOuOzQgiPnwz7tFIL8f0zNjxuADpsnIlyzd5eZBRVmpcKmF9/nnq/spf5IkxDTB+gASItuZhyrJQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950656; c=relaxed/simple;
	bh=nwvJY2/2FymKX2gBIAsj07D8Ic1TEuILNW6QQ8xh1/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNjFQMZFZMcbjMmaN9uDlZRWPCtbPfkdTe5yWoRzxOBN2EUU+w+JixTnY/GOW0s29p8f0cvWlbeXqes0/DIkts/caCjSgOZBnco5AzB1f+H7afdi8Qd32u5WsRYOs94THWJglz2PI14RBdmWVEgceaRwQTKuHwxSszmEF+dOcqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psM0ANYx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjC7qyeb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098NvNW3727469
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GSiyN1L5ZrAfufVLlKRfkcDEEnzthrbmB/NCIfyQoSk=; b=psM0ANYxJqiBV1Mn
	Z+2Q+Sl/iXHXGRL8NEwENy1FKwin3ABcQfxjOcYXSofDyOzxKqlUfPfDRRuw9Fl+
	wXgYQWjDceRFaNjOP3/nnOC4b8eSrjAPx/tP5jThajq/J/H4uVx51DHyFRZkYOlb
	cmeMeD+7UCdtXj8NBZOHBVv/QI7z0utkLsRf/8Mjik58WXB0lJgxoGMahku9iqut
	3Adv2c8WmlfQI/kmVJIzGZlzuvQVHpBKNs8JRpaq2e6XYVcRQPztL7L7vhxLFDUQ
	AzKJfMgLS30um0w61eZSs8xi8+vbMcdL1g06K4wL24aQ8hllPWr/Cw0cRGQ66gva
	+AnotQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkhfdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:24:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9fb4c55f0so75546985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950641; x=1768555441; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSiyN1L5ZrAfufVLlKRfkcDEEnzthrbmB/NCIfyQoSk=;
        b=RjC7qyebCRl/pVYTVG6Sq80DzmkxjUpqcsq78Z6LcnEIHIKfJOa53hV8xAn9PhzRk0
         Hpjfp7NPBNfDIQddZxXUdUKASI8T9z8WA5ffEjLyUF9ZqpyeLpgOnA7dJjCwH7ZcnWg1
         Czsw5TgzDrpV4zmTPrIgwFg6Bdw638uygF72gKTZCIZIxJEy0/ColCc4aeqbo9K3kaUK
         r4iYk4RaP5NYG9Qerl3gwTLz9TTUt9yMGpRX8aBD1Q6vTI1WffBwflHoT78c/F37tMx5
         QEQ+7pcqZ81qcV9555a9KB9e9Wq0HNcG7WmNFnRtBIWMAy3FN8AKBUBCCKYq0o1QykpN
         0DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950641; x=1768555441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSiyN1L5ZrAfufVLlKRfkcDEEnzthrbmB/NCIfyQoSk=;
        b=rv0Eoiv267QZDaJhshk0aHcsJbsDo7LPnPp9YjGZkXRdGuxyzY/nNu9LVecjBAHySJ
         Gkw2INsOu+bO1e9M4D8MWbELQJuULOVwDjCO39VwF07CDuqU12LpnNEE4E41dUH3heJA
         qG4XYoDP3WkxpQ7JwwBjTzOMhO2Zxqb5esV3jpSAgie94jHD7YpXHpcC/nyCl/nNYHfj
         70t3Katp32ey18YjTI60ZqH7WJhPXNsV3+Gy2NiRlBSOhbAVqDQGhdrI3xd3oAqGbVvo
         uOtpTN8GVomogLzB2bFPo5vkp1Hs/QjvNIrJlt3EPvw+RINqx5rfjn88yl2Xk3kJLC9e
         SfiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCpEr2AwDgKw0K+V3t1oJv2nDthNsAP2PxXFPgypakFUWL6pdYQuxtJIjLEatr6MTqQO5PJjOYGo/qrswY@vger.kernel.org
X-Gm-Message-State: AOJu0YzCilToxnNwcqPuay77YUJEcyXWEl2JcebPpo1yM3UfVbGCp1nH
	90j0/BOSpy4Sir8cESnZFjkeELOhTSYgq9fb+Yq/+mBD0urTsgkdLdLFnccfGq8t+AQpndAbu/g
	8fYz9ORqUlN/nMhNsLScajYPTZ+YCEATgjBmDrEVANnEYGdCniWiLcQWk3CXlMDqYBlErba5zGa
	+h
X-Gm-Gg: AY/fxX7OAeBqjZzJwuvBoM/bHAhOk4vTmbzFaWHvzX0IHOSfdxMNOVwTE+mClh+s9Mv
	WMFnu5GIJT6U5DGpH+mSkBX2IZyA6hdv+qNcvcHOPzCcrV+svRzpNB6fdDoyQjOQgw7VmK/QET/
	6SIdNOm95gSksUGSbsH2XFHJYGmM1oCVWPxYHdyqKbz+rkTRVlqPFbyOqlZaj91AFSqruDWI07c
	CwtF8YXFYJ4OzVGHDnjFPaPrlUf6wMguCVX2VuQj3TQ9XcuwGXmd/GerCKQGMj4EaDFkv+3dvuJ
	p9OIgG5YWjDpd7Q3HwOUxpHR4Sv8i3s5mWWlk0Sgqc3lhIrRfZU+iBBuBo1x3IA61bHdlxw7o+G
	u4AF4Z0Kp+UgeJn89vcOx1+YN89mCO2slbB+sv7aIc0s3TnSE2y2SGxq9PSNjXY/eK8A=
X-Received: by 2002:ac8:570f:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4ffb4acf414mr93014871cf.11.1767950641334;
        Fri, 09 Jan 2026 01:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQ+T0djSvS4SpF0OC7CDgdv5sGKxvtI7E+ky04MZ1kKA3Xaze8zjFMPWQqjbLZyT6W0TEnww==
X-Received: by 2002:ac8:570f:0:b0:4f0:299b:c785 with SMTP id d75a77b69052e-4ffb4acf414mr93014801cf.11.1767950640876;
        Fri, 09 Jan 2026 01:24:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a23433asm1065367066b.3.2026.01.09.01.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:23:59 -0800 (PST)
Message-ID: <22a39dac-39bd-4bbd-86eb-e7da8cf9c361@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:23:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add QRB2210 RB1 vision mezzanine/kit support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960c932 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gu6fZOg2AAAA:8 a=VwQbUJbxAAAA:8
 a=KgWQRcSM6EjKocOE5DAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=2RSlZUUhi9gRBrsHwhhZ:22
X-Proofpoint-GUID: p8tPtT06Bt6vwxU6LXGAA69kbhDGHnz2
X-Proofpoint-ORIG-GUID: p8tPtT06Bt6vwxU6LXGAA69kbhDGHnz2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX+WB46NnpBfe5
 HhvfVtTgUJI67S+TwjmppSq6dVlvwpEAizDMFhrcmBhDIbdwl0V7I4n2f+H6AJs6WYwc5Cm8Vjb
 F+wpzo4RWt/Hk57/J0aC4AuLdepvishwZbbvUCxXxTELESU39NnRa9HuZO2PQ4cr5HNsIa4BGmH
 mcrFcxWY65O/KpaOC36T88Xa56DhZq/0/TWj8RMDzzMg9qhcYnboid5LERO8EJMFjz+QcqYEwHs
 8IyIeV286MrVoHjnbXad4OKGzZ1uznCNhgU/fZX/0w7/hrc/zNID1guW+uhGb8QzBxjK0wlJL3K
 SAOfpjTCuxLL3v7VmY4nbhYidc9jcwRaWgTikm2AOIF1HLpt/uN2cH02OV54A5+4kyTwGkL9eAy
 EqEJDbqIRBd5elyB9DlhjILDu5H2HKUGLHzU+qiGeZ7IgCHVl1mDC3WRGL7gQnP8xtFie3nisPL
 YlS2hd25BTDxl3w1fLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090065

On 1/8/26 6:05 PM, Loic Poulain wrote:
> This series enables initial camera functionality on QRB2210 RB1 with
> Vision Mezzanine.It includes device tree updates for camera-related
> components and a fix for the OV9282 sensor driver.
> 
> - Adds pinctrl configuration for the four camera master clocks (mclks).
> - Adds the PM8008 camera PMIC node, which camera power management.
> - Introduces an overlay enabling the Vision Mezzanine board with OV9282
>   camera sensor support.
> 
> Changes in V4:
> * Revert to using active-high polarity for reset, as discussed here:
> https://marc.info/?l=devicetree&m=176711209404226

This isn't really a concern, more of a "FYI", but most people use lore.kernel.org
for web mail archive

Konrad

