Return-Path: <linux-arm-msm+bounces-75222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CABBA1E8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 01:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CE663BCE31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C8E2EC0BC;
	Thu, 25 Sep 2025 23:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aGbwZ7eQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2182EB5BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 23:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758841408; cv=none; b=jE3fh5ZmoIHxmxvlkMV69VuAE3kR5vMKLfQxA1C1AMdTzJYXnZmrg6EnHwXgBDd9ulZbGCcEiFhDN1eh9xkLSBlftziil90pAnY8nY16x4+ROq4sY9hB7mPBneVjSbmV1vTEhWbr1X5sHrg0hkSveAC+hCRp0j/SZ95OVMdHYeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758841408; c=relaxed/simple;
	bh=Re6vJcgbqIa0a2Z8s/dyJr+80qdfjB5ADuATqHo7/iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o1KW/6wjirDWzhyYhY9ir6z/Npwp9aUu9DIy+/t2yQgRCdktpguov2joqIB5ooTr4lpWmWGZmWd9PZ8qmfgxSJTG9fF3ev4HK8h1JXqjw5x2iQ/7f04srT9e+iTUDY5KzOXg3n5AnWbYPjUY0j7tofHrPVCEtnvbPtV9x8d8NAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aGbwZ7eQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIQL5C022790
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 23:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfzKhTLo4L9EzNBCoQA/Ic/EtRob2BTZ1wUdjds434Q=; b=aGbwZ7eQaktzZUWg
	TtevFKgN97y9vQBzP88J7XVt/wMNzOmew8z97fNrK1c5Kh2V3DhUBDjDi1g2VtPR
	8S1/M8Mz4j/Aubuz5cnHf7znpl2VPnxpIto7IyLMvnz8L+zZKHFm3Bf552x1nkme
	QE5/wnQACNH4COg6qdHBk1bv+A2TT7IilVu+WTNsIxRaoJiatdxhwx+iRP/ynafO
	XY3VlPlhJNPTTILXWRujMJOaTM9uiv7PoSzfa/69EeO8IxIazJwE+bIxOj9jvcWE
	10mhHmmmvp47afkRDWXwUtV7QjOQNxbQXd0/4P6XN+0bE+hciNoUtr7n1ovtHVt/
	EVSN3g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrmyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 23:03:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2697410e7f9so33909675ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 16:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758841406; x=1759446206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WfzKhTLo4L9EzNBCoQA/Ic/EtRob2BTZ1wUdjds434Q=;
        b=ReouZ+5IbubGlzyAv9AOswT7Vymz5eSPaVMPajN2/WOczMbaZiUjIEUciy/QLWxmtX
         vil9XORqB9HG8+FDd64RmFGR38MqLozeol6rzWEkAKHLVrudkUo1KlhmVEQtuq5tHXgA
         K75ppeSQlDyTtXlFPRTMkIa63XIJofSFMlMwpggZGnUHQGOvLVgrprmGR0dNZX0sDZIw
         07cVgsYU7biRWa938eCajOJImDHKm6eXKQROOp7gcGnISe3EmwMiBcTNd16ZA4Z3uOyX
         BCNkopl6CmOa/HrDjG4EVD4dd8SJ9ZVnVL1TzeopOLPfuoDDrZo91sMR//x6C2ntqH3F
         0YXQ==
X-Gm-Message-State: AOJu0Yzafnhi0ovF44cs/OWcfJvUojKagoA0g7M4uR9Mij0tilRIGvZw
	+cX4j6yRao1FpMVmPVHTKQSd8ktPIXJc4VnvOLYwSVvptzRqFHu2PtTuHvKH4PiS6boVsqclC7r
	jQgMhcBhpfyYc4XHCaz/v8sM5kbyuKjTe2+KUZeie0Hi+zjoLVqqMtVR03GCt7FT+1CVC
X-Gm-Gg: ASbGncu2NlLaPirZ3beTvuwghbl1ciHYNfyAIoalVbauo6X9CmsT2i8SuOF+m5pVkg2
	yoBQ8s6J29uWgHnqoZHZv+6Au7XbpSdpAsTtnWCbO68OXneUxXytsKfmUzibVdn4VbTJCjYeAeV
	96K+02SW7W9l5A3IDSOVzGUKNnv6AZMmhvsDOnLs51N0TAX2OSriuH6+hfmQTZAtaGdduAPBzwE
	NjTYvMPtaKmVmFcPA1dvFaWWGLKRX7hkHzoWwlE82SU2jmBYaQZ/ct4h1TrDL+rikaiwd+a3eUl
	Gzz6Qn2Y2m8RoCHZ2vTHPBd6dtjW424FdY3GDYc2nyzRbU2ejG6QAsOMAtdSBiLeWUAez17ixpP
	MUMRn5lw=
X-Received: by 2002:a17:903:2ac7:b0:24b:270e:56c7 with SMTP id d9443c01a7336-27ed49c771emr61707245ad.7.1758841405499;
        Thu, 25 Sep 2025 16:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHOJqmjzO+AnKfT1eW43G4SzpCox+5vXEEMV2sxZr+rbaIyUa/gbfX30AzcLSCvAvNAzb4yA==
X-Received: by 2002:a17:903:2ac7:b0:24b:270e:56c7 with SMTP id d9443c01a7336-27ed49c771emr61706895ad.7.1758841405047;
        Thu, 25 Sep 2025 16:03:25 -0700 (PDT)
Received: from [10.73.53.199] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ad1d45sm35260175ad.141.2025.09.25.16.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 16:03:24 -0700 (PDT)
Message-ID: <297ee4ab-73f3-60d5-8e16-8830135603f1@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 16:03:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
 <bc866f21-9b41-43dc-b450-59a25d547b88@oss.qualcomm.com>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <bc866f21-9b41-43dc-b450-59a25d547b88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y4Ho3MxB4F_zL1mRixyVDjh-PalN-TjM
X-Proofpoint-ORIG-GUID: y4Ho3MxB4F_zL1mRixyVDjh-PalN-TjM
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d5ca3e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=R8zOBIxM2Q8kPqU31PkA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXzkWOZFdp3rTh
 rQrlH/DX/B+BqVJNdGfCeipvUBM/J6jh5TwNME3S6XdmBAhOR3v4mC8J2Jytgp+XJqBD4p6eV2a
 w3Asws9pTQE8A25K3za30gr1r1d553UgzLJADSykKmRt1jAhPPwNxZZoX8WljmS6Gza2JmMa12L
 C/IbeTYf/Meh9GS606CjQSN2mw1cC2ekvAvVmfCxn5JvAX1ycZono6/pd7r9jfWRYDN2Pvb2ACh
 7PAjClXfXuVYyVlNxmpIUzRYZe8zQD194mRu+jwoym+ZJKRNVeER+8/L9ee5pT550zscegNyhjy
 LLu5TS9Zu9pf2tos1bOikQ5bDiJxyZTDY8YeIHxPl1+aONNB/nne/ZOJL9ElRHDMKjleo6X2F70
 bkiPQ4Zbv396E5Lqc0QpbQxqek9KJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/25/2025 3:43 AM, Konrad Dybcio wrote:
> On 9/25/25 4:28 AM, Wesley Cheng wrote:
>> For SuperSpeed USB to work properly, there is a set of HW settings that
>> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
>> these settings follow the latest settings mentioned in the HW programming
>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
>> new ways to define certain registers, such as the replacement of TXA/RXA
>> and TXB/RXB register sets.  This was replaced with the LALB register set.
> 
> [...]
> 
>> +	/* override hardware control for reset of qmp phy */
>> +	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE])
>> +		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
> 
> Clearing this field is going to prevent the PHY from ever going offline
> 
> The HPG says this should only be necessary for keeping the phy active
> during MX retention (and the listed usecases are USB4 wakeup clock
> generation via a respective _USB4 register and/or USB3 autonomous mode
> operation), both of which are currently unsupported.
> 
> Are you sure it's necessary / desired?
> 

Hi Konrad,

At least on the PHY HSR, its mentioned as required, and if I remember 
correctly, if this wasn't done, I'd see QMP PHY init timeout.

Thanks
Wesley Cheng

