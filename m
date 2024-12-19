Return-Path: <linux-arm-msm+bounces-42799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C89F7DCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 16:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22344170655
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 15:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585FD225A37;
	Thu, 19 Dec 2024 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="beiL9eXT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8425225A23
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621237; cv=none; b=onHycQiS2xPb1h75PQZ6TPX/Ere9qM/8xw+0w6d7poGDMetTGm0KkBMRh+0BJ//AUxnkkAQFCstJU10w7dPg+vWLlcUsKWTPG1jg64wiMzeAR7UEhhFTS1T6WDudtfM37VLrAbsxz2QyAvyfOxQQ89ZlvIAIwVKNRklCV5Vkh24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621237; c=relaxed/simple;
	bh=Ibr8qPMjlg3GtzyOwjhDNzKtC83QC8l0CBEiz057yes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y5bE/JxX2DIQx3v4dipvL/25gw5RryAP5Et1//K4RfXvJ1BhblTVYysFZAWrwUVEepmrc/bktlXHis1zkRkC5TuuNcRiYmiIoh+pAtmSNXUTpY++ORSbitznNE5hmIw1WicwktIskoruSF7oLSIiqVMs0RLeDDQFDaknaWQ8Y/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=beiL9eXT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJE6M4Q015107
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 15:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ibr8qPMjlg3GtzyOwjhDNzKtC83QC8l0CBEiz057yes=; b=beiL9eXTfw8HMcrQ
	eWhphKp0AtS+bFWfg8L5ZlHvyPfqUWUqLjl8sh6IlHH904MqGIZdVvr4nm1OTkPC
	FnyDvqagcR6M3OG/YwzsGbWk7Yepu35LM7af4TG2eOI+JrrB+RsdEzyKEGmXya3J
	5ciPHdVA2IVSwlBZxRE/MGCWCrg8coHDdnh7HHT0gut3Xgjv1KmqSJD2Ge0Nfx2B
	b96JXEys8RxSYAmCdi1w9Q9Ig8R7efyG90rLwELOK9bqw9ATseH+lKc7uaWtpzVF
	Srw8mHeSH37itiUqlktqC+ZrzdMnzGmv22/lg8J3VL4VOkMSsKSvzIE4NaCToJBC
	pF+mpg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mmxvr533-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 15:13:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d887d2f283so2318736d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:13:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734621233; x=1735226033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ibr8qPMjlg3GtzyOwjhDNzKtC83QC8l0CBEiz057yes=;
        b=WIZt8HtLQluU85fXVqMVnVytesXEZUYe+ZAPRf9uIQoyWJN1cHBT6srg5mg1ErIQge
         AEQK4Wxyg9XltprARvxHlj2+iWWuz3F93kkAXZw15iNN+gGUZWUrLdOUAAmaK+6ZKXGl
         AhRa90uDjIm6WYPlHbF2DowOIe+qDtqTwD8ZcRMu6P1rNIOMq22jYgshaZoV3X72Ujnt
         FMSsbMi0VU3J1OZPZhKWm5RTl0xRHuJ2JDBVnvl3ZGiynZi6rEmEpPOc9mf6m7W566on
         q9/Ise1bUd1XVUvkGhxpVpSex10DhQZ05hEa0KZoTixpfLfKd72O5uex+myY+IYxD4hi
         OP5w==
X-Forwarded-Encrypted: i=1; AJvYcCUZa5/aSW+X+5qKvSKqeYR6gF1cnz7SeQ1ShuSnj8sONAe+V+ncDJ77kwcN4dlcEKdORh0IdJ1wmtLU5F5h@vger.kernel.org
X-Gm-Message-State: AOJu0YzSdMQ9xiGi/Wfc0qjLPrefojoan7dMP34QAY+2knkXHaJBXnxs
	eLsDCWu67ud3cfivwkfMsNkXoPESH8JNUhL13tnv2kiJ0eBjCRhOkNkGmg5bePMGwWBIYinUjwj
	HT2pye9zYZz1TP6UZtdWtTpKc/UWoV4eovInsfvoQLpGRoRVPchpaUkorQzEb4cHX
X-Gm-Gg: ASbGncvkE7aybrh4WiIp2gkS4kW9g0a8zFXkXNir8svOBtB1RHO/b2iMDxXqGKaLMg4
	diIfoNrKaNlTPYrg5Drg0gc/JRPhI0Y5CfG7MZnPvBY3Opdr5J3ERq2/2AJiLQ5Jc0XGTPHKjq2
	LLyfkebFTHSpm2BSgeDsbUD0oLfAcXqz9eDiD/UOCRFa7Vd1j/QHSqBcr/stj/ze/hQR37U+3Dh
	LiG41Br4VzS4xSePtq0H2lhX0ct7N9teohcnd8ie3+jI3UU8Ip64XaxVor/bl7uTmH0UYifbVDP
	0XSNBTiAh4MXRWgkwGr/cIgNLPyuymZEbRc=
X-Received: by 2002:a05:620a:4141:b0:7af:cac7:5017 with SMTP id af79cd13be357-7b86372323fmr383527185a.4.1734621233641;
        Thu, 19 Dec 2024 07:13:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfu6esVWQ0ConGDER8nonSqLdGD0StFPOhuICpqOzvsERQj+euyE04T5hXTE0xGSRRS+HadA==
X-Received: by 2002:a05:620a:4141:b0:7af:cac7:5017 with SMTP id af79cd13be357-7b86372323fmr383525285a.4.1734621233276;
        Thu, 19 Dec 2024 07:13:53 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f080c1asm73554866b.205.2024.12.19.07.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 07:13:52 -0800 (PST)
Message-ID: <37e5ecd7-a1ed-4aca-9ad9-7d601a0f31c5@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 16:13:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid
 switch
To: Anthony Ruhier <aruhier@mailbox.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cae52ea6-e86a-4b86-af06-01a8a93d2ca0@mailbox.org>
 <CAO_MupKCUk-w4=-0yDWo4m9XC1-iEuF6YHYnYw4T0oF2aKFxvQ@mail.gmail.com>
 <1b163b6b-3c33-4361-94be-6b8a6d0febe8@mailbox.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1b163b6b-3c33-4361-94be-6b8a6d0febe8@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EPer8ucF-Kl4GmL9f7z0DY8esOCrkNwh
X-Proofpoint-GUID: EPer8ucF-Kl4GmL9f7z0DY8esOCrkNwh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=893 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412190122

On 19.12.2024 11:34 AM, Anthony Ruhier wrote:
> Thank you Maya!
> I'm sorry, I realized that the patch format is wrong due to a misconfiguration of my mail client. Tell me if I should send a v2 of this patch fixing it.

Git throws an error here when applying, please resend

Konrad



