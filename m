Return-Path: <linux-arm-msm+bounces-64598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63781B01D50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A54A1CA5287
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC172D23BA;
	Fri, 11 Jul 2025 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwVu9VcN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FDD2D0C9B
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752240258; cv=none; b=adTy+zJ4joea9KXEDkuEhPgbm/W66QsrfYVlNjRQCzjb3loIvgNIBT4GO5GyUdGFAC6DUN3+oKXtFD97jYGfb3+L3JGrU/6OV3thhOo2ZBJOhW1chzuSTkVbTDyKy+8Enph1FPx0lV/MfNN3tD63TLnpsu5lFK9C/MgxRYCMqwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752240258; c=relaxed/simple;
	bh=NgtS1EmWVgbZ5BD/qpQ9GcI7+8k3FMMexwP5SwX2F2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddD1g92mWVLCjube/n1aEiZdP/JIUxiKwQOCwRUIK5sMWTs+rTfKmffJs/Lhujdp4WtDD1LccABabUtjE332j3m+vfh49uX2YmneaLyDRXkDmrh4BzN9wB4u1zoyxZrHpvk6+340s1Zv9LWfZ3TqrHFqTf2WBe3Zhs3x2He02Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwVu9VcN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BAmQP6007998
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	odFc9lek1J9Ea4hIgZEE1rZ395qIdHOs4WawutfpGlg=; b=fwVu9VcNOoPddaFO
	oel4zOwEZewdvJXRr/UfBToAgDfYZeD+ADRyC82AurPs09ysjx5JcQKgaT4zueuZ
	IJQN0/ZUYso6TnSnbV42Hbb20C7+7hIDFz5BSagUwDo/ANjQETz8heqVGcdmkjZ9
	xzNReJ0OUPvPjyuNC+K1w2iQrW6vl46ePnT8hffZZrnIXPkzu4KBOrglePeOecy9
	/zKCiBrViajQSY8fD7rAU5BDptKWA3eDhcFXFwgbjj0CWsZ7KRwy4suc5LgispS/
	BZrC0VhOYYO/QIX/AHGwacIdDQssWvoq1g3H/tBZs06CNzDEKpMGstIKFrm5nlda
	WsmHyA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcg8p0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:24:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b34ca003f1cso1638952a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 06:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240255; x=1752845055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odFc9lek1J9Ea4hIgZEE1rZ395qIdHOs4WawutfpGlg=;
        b=qmLDqAzBi7El+ilPk+zgL+9EjwDwOuQ1qcTzS3/OUbxwyeEnvKd/hrTmiKfIsiTXEI
         fN9VM3THGMbXdfeSzn5OtJXTJkznG4VEZxmZIZMrkLGmc/ADunn+e9uOS7LlgtkbsqQ0
         csD6yvByANdzV2lojxTp5J4PPCp27h7jqCLwt1H/2y6lgE8iK4FPLuwa/UVYHVahGKB3
         oO7CtxpVD2uaTawzV0dZc86DjXYlPavhVwP+rMYXoC9pSfWy1uS5yhtMMssfVyzXZFcM
         mU9k0fiab1TZ9bZdTvYwj9ilVw7BxZOApaBNOQlqOMcWtIqV0jzLVkrhFTJuQt0kGHW0
         Ihbw==
X-Gm-Message-State: AOJu0Yxl7cogl4GVTWb89zTDs5YXmbgXrosq5fm0R50AbvV4+uOCDgR+
	k414JuHzdyeBdzRV5bwzr2GnZ62r8IiokPzzb3TrEQ1aGxJDoMg/XdIdeYrx3AtaxYdojVqETwf
	BOC6OfanawvLP29dL5YqF3yvNpMl/ZCBGW3s/VrkLf6VqhuGlxki2kYtHjwE8yCroy+fB
X-Gm-Gg: ASbGncsfWfm5JiY9T4am/FZ/mEgQwG2CMqLhlNxGfrCwggGk6k3OiNhfLbOSet4DScC
	nWTnxqBQoHuVEf+kx8ceV5hpsaxvwP5SRTwFxkctNsfYlIDhazO2rfcz2lBktEHjw7ATl1YPPBQ
	FJELrtdqvOa3FyGjyDpSPN+L+77DAAVfyQF2lvwHfSuzKJby6f2kOmYw6hxW3ODrYbLdJBVYZb3
	4K0Xk1VtIFOEn1oxrkcaV+NAkhIFKTDIthT6XFDzkUcWY8BNAkIEZ5mTkj2mGuDUr4/uyBlg9+F
	1eFhidyfqtPRZBM4Yrk5Lbj/s8KE3vD553T8HqItAnr6z7As6aOMyEJhqiE5pC3ZdzvZnvlsJDQ
	Xv/Gs9g==
X-Received: by 2002:a05:6a20:a108:b0:220:3ab2:b50e with SMTP id adf61e73a8af0-23134a6a353mr5181483637.6.1752240254891;
        Fri, 11 Jul 2025 06:24:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKWYvrPzPxNDVVUSkRUApsGUonmJeg+FJ5IoG2w0UGMLPWCkqP60kgeEq4SU/Otujs4RF0Ug==
X-Received: by 2002:a05:6a20:a108:b0:220:3ab2:b50e with SMTP id adf61e73a8af0-23134a6a353mr5181426637.6.1752240254306;
        Fri, 11 Jul 2025 06:24:14 -0700 (PDT)
Received: from [192.168.80.70] ([106.195.45.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe731effsm4594339a12.77.2025.07.11.06.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 06:24:13 -0700 (PDT)
Message-ID: <e5bb0197-70e4-4b4e-922f-baaaa2e514c7@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 18:54:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve APPSBL build
 details
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711-appsbl_crm_version-v1-1-48b49b1dfdcf@oss.qualcomm.com>
 <3cd5864e-e6cf-404f-94b5-b85866086d76@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <3cd5864e-e6cf-404f-94b5-b85866086d76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=68711080 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=0mVmtUiqVJf9Qam8E1VsLw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=oWeigVbhGAZlHacc1VQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: nBclIk_kT6TrqRSIvnjYnPuxgGKp9tKr
X-Proofpoint-GUID: nBclIk_kT6TrqRSIvnjYnPuxgGKp9tKr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA5NCBTYWx0ZWRfXyePu6P8cE055
 k+Qzft+5YMvhKTiCS3x5r0TVztIMmzB/Bxu/zgIsdioRd6Va9+Lr+33oeUmA3ifeZg6BJ0N8c20
 tGf7OJetgke+nMVUZVXlOT2jO3haG4WYkss0XBdrrN6WO5DC7WpIdbhbHZraJx/4cZgcn49OIjM
 NpK91EXThhIWBwdv5cXEFrODxdRQaHZQgAnOt9L5C5w2Y/BnX5p04LAifCoCLH4G/W7qx+KOn0w
 Ifboj9ulZsLZApmY5wLRaQ3w/lluDze+A1X0dbqVdHxo+siqDBBmUs9Nd53HvyxHa2Hvr06yI39
 mQPK+3+K4DUdPQMe87d0lFNfiEHkc6rT6Wj458I+a1Kf2Fr4/YJZOh+EHYaTSQSI5TiOpVio1rV
 91lKXODsO44zIAdPIwwW+CmcTH/F3I5ltzYdO1pOoQ4WaCc/vRdnrFPBfR5EI38k6rJM0tez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=529 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110094


On 7/11/2025 5:41 PM, Konrad Dybcio wrote:
> On 7/11/25 1:03 PM, Kathiravan Thirumoorthy wrote:
>> Add support to retrieve APPS (Application Processor Subsystem) Bootloader
>> image details from SMEM.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> Can we expand the driver with all the known IDs at once instead?

With respect to the IPQ SoCs only APPSBL image detail is missing, which 
this change address it

I can expand the list, but unfortunately don't have ways to validate 
them. I can check internally with folks to test it or even send an RTF. 
Till then, can this patch go independently?

>
> Konrad

