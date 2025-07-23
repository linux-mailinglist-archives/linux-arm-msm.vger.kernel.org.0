Return-Path: <linux-arm-msm+bounces-66281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC7B0F193
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A9DA96034C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0B228D837;
	Wed, 23 Jul 2025 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2KZycmR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48DA289345
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753271301; cv=none; b=i+qkTkUxXbA5VOimfxAiScysaWwfbckXq9QsqIjcJfEr8n9Y8fdQptCsg2woPBQqDAIOxPOT+RReR0KzKSslsquZZ4XrfK89In0Fk35Xx8IMLE78z9vLQPKUauCbN9H3kv35DyI3v8xU1kyyPKdBtPUNnp4HTR7LTbJxi0r9Wrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753271301; c=relaxed/simple;
	bh=8yH7oFH2qYJ/03mUo911wdRMg26XEqz7hrSxPrVK0DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2JXoaODYGnXxOax0COonSF9VW53fQhjtnBLQtos8wp+9hDqkbuzOBos62EEqRm87m/gwotOfeVP9zQ9vQ2vrAf8mXHf4TCoAKxvZizO5q3nfCJD8W4xCDU6zno/dd4m2aWQ8z5xsD+nWFlWRNBdzAP8Zx7sT4+BT1ey9iH2iYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X2KZycmR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N90NgK030756
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSjiElhJLB1AgW9OvfAXOVswnnZr43VSgMiFw0vektg=; b=X2KZycmRvq2doU6Y
	0HJmsbLsX2nwMS2s+NxycamIaR00bbIXfGjWYYE3VcE0Z+NeTKyf5LlRA4yWwX/x
	m1VeDe17KOICbKKiHQCUyLNw9kOsFs6Aht6S+6EkhO5QWNQi3wB99uFRrH5D0f7l
	AhT35V6oTgKZtQ4V/cvCsUAIN/j/DcqgQUMB9qda2Pl00JVqd1Hsvz4j/tV+S9YS
	dRvZRDaZ2EivEYLEYLgtBu8G6VzFvfsVgd9p8F90x9IvgsxReLjtkzB5gFqPNQaB
	X+/x06hbDpb/Ob2mG2M3V8FOnxu4lXvcVfQwjJ6CGZ05LCLI4UcpR+KZyHrQsBKy
	4YFCOQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w3cx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:48:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3138e65efe2so6001635a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:48:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753271298; x=1753876098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSjiElhJLB1AgW9OvfAXOVswnnZr43VSgMiFw0vektg=;
        b=u0x1I1oAux60M+PJmGaf/Zouct7EohQjh61G2CP8UzSE2Hd3nYHycg4ZVc0joVdOrD
         6WK4L8EUymrUNoS3t7BbuUumFx5CvL5NmtVarnxas9F8ckSWlOb5PbVRKa63P/SyQYwQ
         chLj8m4NG0kD4zdQjR7PelUa7x0E0BZAUQmxB1ElaA/LYXGJ8r+uCrUVF1pUVMiOfQnv
         rcxprpB7KbRPPiVYGQvLRG2EZASAXbq2CJc2dJ8OxojtJOPVwzXfVehQ/TF09ROtL/OM
         k65d/5ED82jnkbUCAee/NmI9uSszo4CEnJqNvT8JukJO0byMsFZtIJEfX1PamgOavfQB
         rRXQ==
X-Gm-Message-State: AOJu0YyrJisCXWhJ29whg1rKrcjB+SCQgUa87WP64G4PkshLBd8pqiEu
	PF1LLwmn2+LAlgcLqYG/cXybsS9o2ztyolmVSIXX/UUOmkJBp9nsfcF5DLaCwPuFt+BUEnwL50I
	eTsWu0rHXiRZoTAf25unooGdn1Qp/AR+bb4OMQIzcukSR8gtzSynV7XWt0PSlNexuywGV
X-Gm-Gg: ASbGnctTZjqd/3aU4N4/OJOVoBcpBJmrDt9WxG3ZuK2xrbopJssPuO1qaanT4GbPns4
	I65WufGwiNXowIhcNMNONw62FkmtHsFSPgj3YtKu+KvJg60V7BvIvKywC08iw7+AEMqaBGKRGLB
	ufG+w1OMu1mGTORBztb4ON8ffrUocfjd4hV4ZG0ikgoDtoT9Ff4OrYz3dG5cuTwAN0ZqS+89wcL
	rEhH3iKDrFuM8FMMD7CaUdFqO0urLL0KEcRe30qNUX76kKSWL64l/milPSA87jUmJ79sehoFeCn
	dY1RApAKv3Grg3apnHq+evUIDB0tgChqlALsmVMX7FMe9egnFAU9CAGG7JdmtADQ5B3Jj5SSn0C
	rL3q5V2ivVnxAME8/3y9c30TQ5eQkypmU++TyRQCPbFxXgy78upc1Og==
X-Received: by 2002:a17:90b:35cc:b0:313:b78:dc14 with SMTP id 98e67ed59e1d1-31e50614581mr4506835a91.0.1753271297914;
        Wed, 23 Jul 2025 04:48:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyLPE/0loV3mylprlTbYmB9p942oBmpy9lW67S1iT63o2qjYTAxnay9GvJWV74rP0lBxpzIg==
X-Received: by 2002:a17:90b:35cc:b0:313:b78:dc14 with SMTP id 98e67ed59e1d1-31e50614581mr4506804a91.0.1753271297526;
        Wed, 23 Jul 2025 04:48:17 -0700 (PDT)
Received: from [10.190.201.48] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2ff87dcfsm8681671a12.51.2025.07.23.04.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 04:48:17 -0700 (PDT)
Message-ID: <790fd85b-fb24-4d44-bdb1-706c534d1da5@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 17:18:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_rjendra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723103644.4058213-1-pankaj.patil@oss.qualcomm.com>
 <20250723103644.4058213-2-pankaj.patil@oss.qualcomm.com>
 <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <70277682-94e7-4905-823d-25ae76f72ee2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=6880cc02 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ak1qS01y0rHKsXKK__AA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: iqE-uuPchYjH1XkP-89ls-i1YO20126S
X-Proofpoint-ORIG-GUID: iqE-uuPchYjH1XkP-89ls-i1YO20126S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDEwMCBTYWx0ZWRfX1BqFPVDjmnA4
 XYwKMDhJhTEG0C1swe96LTKqqvd6gx6huDZEH/F7B06toNT7InOrARrXMgfbJ7DLpBb782dLO42
 11wQ0ie8MTSrZmkf+4YiXWfZqxahJs4L5rmHBPNKrcxuHHqHcThTCD8ni3Eqk3jq0tTBVTlbZyb
 VQdejWJYQe+l0Pt7TykTaNQxBpj4q2LOVLA0uKreOQDMQmkwzEd1INf/EpmIM13Q4l/6xd6fqRp
 AelOoLynuMWS6hbuQ4vd57589xsxS4tbynSXP5nRdNzmF4hEf1ZvqRcm+W4Gy5nRs1VQg7tqafI
 G3IA/HfTQcUeEdu+1+p8W3r/cxJzAWgPDc4tFn4sxrgVAj/L2udUhQRB/GSGlVbhfP3Mu5YWhNK
 C01oDlmFzJiM9nvQz8j4MiDsGVLrbuAydtWiXsrchuDquBSrg82GmNp4ZG+/OOqsR00Lipt3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=878 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230100

On 7/23/2025 5:10 PM, Konrad Dybcio wrote:
> On 7/23/25 12:36 PM, Pankaj Patil wrote:
>> Add DeviceTree binding for Glymur SoC TLMM block
>>
>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>> ---
> [...]
>
>> +      function:
>> +        description:
>> +          Specify the alternative function to be configured for the specified
>> +          pins.
>> +        enum: [ gpio, RESOUT_GPIO_N, aoss_cti, asc_cci, atest_char, atest_usb,
> Any reason for           /\ to be uppercase?
>
> Konrad
>
glymur_functions enum members fetched from ipcat,
this does not exist for sm8750.

