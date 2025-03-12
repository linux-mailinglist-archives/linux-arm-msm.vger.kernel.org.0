Return-Path: <linux-arm-msm+bounces-51170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 716FEA5E18F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 17:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E77DE3B3387
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 16:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA561DFF7;
	Wed, 12 Mar 2025 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E5TmNG+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCAD1C5D4B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741795963; cv=none; b=DOt3VGvJ6ZjVPZ8FG43blsWFy4uqamFmQlhL+RDvtgbcED7qsimWGQK20EkZ99GCnDGUvZoUlyPgKgeZKTT4Llp3Gj8LdDE7mSIu6Akt1KSphMJvB7T5tyMhSAH5sh2iBB8nVZjlY6QQRncJDIsB+aQywKsVe4IRO9QPmPLvLA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741795963; c=relaxed/simple;
	bh=6hd7rxQEJBRWkVWtNZOc6NGDa0MS+r/N/ofCsnrZ8og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EL4M3DkLLFlMGIJi8OeW2Cd2fpsLq2JF7KW1lA6ibdUhjS2hSU193I1djYwDPBlh7sbAt84UnZFjZ0TPj1sz5moqX5NKhqJ6XW3q3MZB44hNmhx11XaPIuYgaIEJ2QO8BUzHv09TBu7pHmx+uKuG8GhDMu/kBC1F8mhanBN9B/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E5TmNG+C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C9mtxT012316
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 16:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5/1RpKzdOYchhjQaev+P+46NhEzCeI0XyMwDm3zJ9dY=; b=E5TmNG+C6u2U1FYE
	+CQ4/JBMxaC6/1/IOuySdpXR7Fovbga8ccSb734PFH6QFPCEZzDGC3GC713ZzDX4
	USIKR4tVqNaUypum7kLfdLsqIoUJS1UWdm1DhFRwqiJeiNNgD2EYIwmYorTnfOc5
	h2E9lVNkkxsI94lg8WBXQVjjTbd9HnLlrzhntl99fmIBWtZ7y4Az5qUioCf/1Kyo
	JJ5VSbNQgnw7bMElp/e7crO+FIqKgthgOu3D+SMAaewWTivYLe6HXifRhlxpkpvR
	Xpq+gcdptdXcX13Q14wZNKaS//AxiEFUDp6CadDqWryPMlAjfkcuHUHugx03cvq/
	UIYGag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nk0mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 16:12:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso69810a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 09:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741795958; x=1742400758;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/1RpKzdOYchhjQaev+P+46NhEzCeI0XyMwDm3zJ9dY=;
        b=GJ5gYlm5vAZYntWv498HdrXNnj4XDN/9drs24r494/D6noTWMct2sXVvmtdTnQEoD5
         j32JvgkayaHiic2sTWmQKL+gDRMOZZ7Ry+iwjKe0cWL7ZawI+KyfK5CpeYSkcXP56ShE
         uhWz+7d2uqVs170z5YgLnWjEzomnV45xtX0HgoH+RyK9AXT7UdIOHChV+VxGulU5WupQ
         ksxL8MrMoL51juDzfYSCks/hvGMGULkjCgjTeDAOrwTBSLHQn8toT+0uTPmrm8HrGuNC
         sHvjswPwhZ6hT8twKHOFDLm3J0erGOmyqhmA3CxAl7w/z/FZ+kBuZL2aHzQQf7ZIMeQe
         XQSw==
X-Forwarded-Encrypted: i=1; AJvYcCWOY7806U4dV1IK/Yy+bI+rxBHy75DLojxUI+MA3BSvwSD4dGcIPHZV+uhwAChEAAOGdq7N6ZAqZ53/fPn1@vger.kernel.org
X-Gm-Message-State: AOJu0YykkENfCEQVWn4qVBrqK+8Zi1rvXi0445IoGBGDJYokVu9bMYaK
	RY5XWB8m3dJXqQxzrf60PLbnw66WRgCwhHh1SlhwbQW0SN5WVcwLnnwiC5pXY3j70f+lAMHVjEZ
	8tKqZt95j81h0oiYNoZsrcCKS3yjRUG215aXSaPKNCVMwwfcELvPy3pswHOpayPOF
X-Gm-Gg: ASbGnctxC07tc+TUGlBVRINixA4IJu++DwWpbSocecbfqePUbRwufSDNkjeS7e/slhd
	04qyj4PyDfrd3MlQh9YktL3X44GopMtH+2tcKRl2aXe9/pIc6jwGl49JZVo3XQ8hGAjTOT+Vz74
	xkhDqTR9hFJwq2H6S/r7AIYG9h7o7ao0cC0acD53me7IWbCz6NYup/R+Lb9p6FnuGAFO4M/Sjsw
	miq7mWexi1Xlp6GYc0U47h5ON/MCMvptB2zF1+jom/kKm3gAs14do1ORl91/3W0lFlD89bjUO5d
	e7F1r2QZfXDIhKhJ1r0HJVWkYPWL8AMyPr1NDMTdwJu19YeHfRos9CsC6Q==
X-Received: by 2002:a17:90b:38cd:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2ff7ce8e5dfmr33019608a91.11.1741795958669;
        Wed, 12 Mar 2025 09:12:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsJrVBVvsHyhb69yiGojX9yNVwRl1fqH3O7J84B34D/C7flq2CKu0AwOv2Jv9wq0SwKWnDCQ==
X-Received: by 2002:a17:90b:38cd:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2ff7ce8e5dfmr33019572a91.11.1741795958249;
        Wed, 12 Mar 2025 09:12:38 -0700 (PDT)
Received: from [192.168.29.17] ([49.37.215.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301190bbd78sm1984931a91.39.2025.03.12.09.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 09:12:37 -0700 (PDT)
Message-ID: <282f1470-bab7-4f1c-8ffd-a6037736489d@oss.qualcomm.com>
Date: Wed, 12 Mar 2025 21:42:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: ipq5424: add reserved memory region
 for bootloader
Content-Language: en-US
To: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20250312094948.3376126-1-quic_mmanikan@quicinc.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250312094948.3376126-1-quic_mmanikan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M6hNKzws c=1 sm=1 tr=0 ts=67d1b277 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=d+lWxUpqeNYAcJEdQAshKg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9vFMFxKz7TJhonvdC4kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JpDytnSDOcXHJnSbA0UZM1nf-ymUr7Mp
X-Proofpoint-GUID: JpDytnSDOcXHJnSbA0UZM1nf-ymUr7Mp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxlogscore=496 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503120111

On 3/12/2025 3:19 PM, Manikanta Mylavarapu wrote:
> In IPQ5424, the bootloader collects the system RAM contents upon a crash
> for post-morterm analysis. If we don't reserve the memory region used by
> the bootloader, linux will consume it. Upon the next boot after a crash,
> the bootloader will be loaded in the same region, which could lead to the
> loss of some data. sometimes, we may miss out critical information.
> Therefore, let's reserve the region used by the bootloader.
>
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Reviewed-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com>

