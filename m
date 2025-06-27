Return-Path: <linux-arm-msm+bounces-62721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 971AFAEAE56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 07:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1323562F96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 05:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A001DF75B;
	Fri, 27 Jun 2025 05:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8RdC4uU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9531DDC18
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751000875; cv=none; b=eyzHNexz/O9AA8RPMtukVGlflNEKy2UBxCCwRP1yyUDGsPfFUjFfqr7SRNk6/O0jfxlJ/ckIoIgQvRmy5egjyDWgXSa/ecFF2qQmPDmc29JMhpWwan/MfbbhtwX+iR50ozW/Oh8mHrTTE9VqCH1ixcOhcETv965Jh0G+W6Un4eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751000875; c=relaxed/simple;
	bh=lfx4w5PLHzZtl7g7tKnMoL691KQ07239Cuv6LeDipmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NuMJcoLgLFLmv8SqLJJFZRyi/JTi8OrpmtFrk/CrtB3/4rkNbe749QOXQl4zZuDb1QJ5Ly8WuS+I+eQ74bh9syxpZmScuTb/Yy9zoJxHUvFYQSimzcRQl7xG3aKERx3jFkS3W97/7ODPHow3Q0NWRl5VJg4ftw/YBIWUz4BEOT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8RdC4uU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4D28N028862
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FgNJiyaML1WffY5YxWh2k0JTtZoKYshdhU1UyOu/WNk=; b=N8RdC4uUoPcQYbEH
	RJ68G/R/v9vvefr/8tzEZueF4Y/33jrudWfm47/MnKeohnUCe7mG1xq1Wk01kydp
	wBYzZSYLJLKAuEro+dSotPR+zpsJV8cvQNFFRzmdrAyiSaErYw5KfPEWFcubzSuW
	2520ueZPaBRzOBY9ot8sT0yBuonp+DDPBseCjs1iBfsQwKvyaKG/ILr10QyboaCV
	mEhvbOnyzeSDtNdP7YoyNy7Ai5iO62K7D3OXL9WIUnOUUkZTv96WUKwKNIDcn+fg
	45R5b09nK3WokgEAGuerdrTXxO0FNMVCueBbv3WvSEtltQOnTE9Y6lGmRb4RfcTd
	ikmGeQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbg5hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 05:07:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235196dfc50so16937825ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 22:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000870; x=1751605670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FgNJiyaML1WffY5YxWh2k0JTtZoKYshdhU1UyOu/WNk=;
        b=Ibv4+r9jNUFag1LNreNOtJdGTV2v8Yit8nsik6GUqSuVcGgsJIU5ZW6mo2sY4QbuVA
         t9KF+JyVFZej7Hw2AThzkebmj53FJWgoNQxlvwkkwC+SOQlJ5f/ysqXDiRIvvOt+7nwt
         Mjcqchq6dE7q99lbhspfFWELWGuYCPa5f1v5mDhaK+fU6xqVcCueptOuCcXYD1u78nUx
         dk6+dwKbtj0VsUOYGrKc6gKEhf/gVvzgLS73I+dlvNJm0k6VxCTheJhq/g4t6KCiEFia
         m822j+Vg/8wqVHpIYADNSUqszrErnB77xs63KjFR7qYl+oq/A8w3e41aWBvnqBHyEMnK
         Uvsw==
X-Forwarded-Encrypted: i=1; AJvYcCV7ymm6oVeRB/T7/OlEg22OCOhH3wrjKqXrjJUo1x6oiLY2P79g1hg6fQBMbo7WbbVM0hKZJWV4Qak6VNba@vger.kernel.org
X-Gm-Message-State: AOJu0YxzgWpgLswXeLLsjbFjNzbtK6Nz82XECMl5eIUrkSW4hR3/rYSD
	Lj53/LjJ66tOFadrSqKqY5kVbEN9wo5qG50E+INUKkBA0biNxuOEBeA3d9sjsyfKy2ohATnCoN/
	5ONsXJb9qh51e9BsO62+YFWa/PPtsX28rj3EJfTlEcqdyGJZpxKN0+VMkji3gM1GOo6K2
X-Gm-Gg: ASbGnctMAP/XKW2GnZvmdG7K/SctK0Rm9ac0TzoF+OuLkhQL/mIztwzccZTnQhsgwZG
	NTQMbZ0SDYdWE9a2qR1Af4K31jyl6QWoe7H56XRbGvN2lwyQoI2W3KzuqxG2ckVuYKhXRqKL91X
	9AVTm7ObViku3rru5K8LACMSc5va3O8Ku6GN8hkZ4E505MzLVjgoL0h4S3Rbqs6vzdWx+Y9OEvB
	ah5nAzdm7Ye90nyvlNKTQfoH3LBQKiQzZNjOpa6stlPsixKI2aZsOHOG9vraS33nxtmKTZOdOex
	tO7151EI53MwbEo+pY70O8wYemBwenW4nxLDyvLXL0VQuZGkc6lTd+g=
X-Received: by 2002:a17:903:3503:b0:232:609:86c9 with SMTP id d9443c01a7336-238e9e1cbd9mr82900005ad.9.1751000870557;
        Thu, 26 Jun 2025 22:07:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmFFD1sc3TnhJFATkK52HnmEtQ7bQJi41dupwVvYX6GFgmLB8KypB/A+WO5bcGBxSpG+UStw==
X-Received: by 2002:a17:903:3503:b0:232:609:86c9 with SMTP id d9443c01a7336-238e9e1cbd9mr82899635ad.9.1751000870063;
        Thu, 26 Jun 2025 22:07:50 -0700 (PDT)
Received: from [192.168.0.105] ([49.205.254.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e21a7sm7230315ad.4.2025.06.26.22.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 22:07:49 -0700 (PDT)
Message-ID: <595e5d07-67d4-4352-81fb-0e5cc9ed0bc5@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 10:37:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: qcs615: add missing dt property in
 QUP SEs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20250626102826.3422984-1-viken.dadhaniya@oss.qualcomm.com>
 <x3cmdir4lotf3yekbu3tsmts6idsvwygrp35opszmgabhpvdda@nlwrs5qojcml>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <x3cmdir4lotf3yekbu3tsmts6idsvwygrp35opszmgabhpvdda@nlwrs5qojcml>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAzOCBTYWx0ZWRfXy17V8AYV3APD
 8LAFDjnQ9s2CSVU/KdkHD4neBtF1WKR8yGl1Ijoch0tMB6Rble7D5usWJzBqSU0KIHZpGxI3ahP
 XI44sVfKRnTuY9Ar377MPlOw9HX79XBadiKaYPsWq11dm+XH4cR/+S5qDzOzfenITTjVxME6qlS
 8fPkkn8vwCbZ4cJMtHQVj+c14xiuvyhnj7P+eFxdRbA8uFxWAVpYOGIgO5rZxvdvJXLoDfMPb1d
 Vcyuya8vmIuIjN12lhDIW8GAHtN7DtRftzDjjjtEH2CUOhHuO6qt+LXIzMsIpFaL4/ohmpMjVvR
 G9Thl8CE1t1ZdclkdiiEHshE8jpnkmN1wpGHcsE37L4dReg0mUJ/E9VOoXc+3qqxyH1GfpB8IXc
 HUJlNDD2UrUgP08LzCAyrE6mZ74MjF5SfrB93/LjCN2GUj8Wsx5uEQsQnucHWiOSnacnVR0w
X-Proofpoint-GUID: DIkPi4AdybGOj7uV17ImLS4EY7glElrO
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685e2728 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=gik7yjij9jROcwxpePOrKg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=uL1e5Wp_dwoLeR8WhnsA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: DIkPi4AdybGOj7uV17ImLS4EY7glElrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=639 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270038


On 6/26/2025 4:32 PM, Dmitry Baryshkov wrote:
> On Thu, Jun 26, 2025 at 03:58:26PM +0530, Viken Dadhaniya wrote:
>> Add the missing required-opps and operating-points-v2 properties to
>> several I2C, SPI, and UART nodes in the QUP SEs.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
> Missing Fixes tag(s)
Sure, will add in next patch.

