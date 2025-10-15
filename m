Return-Path: <linux-arm-msm+bounces-77449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 392F6BDFB6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:43:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6F053E50B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38848338F23;
	Wed, 15 Oct 2025 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IIim8Kdm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A29C334397
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760546581; cv=none; b=r3+IzvBSLLpwy411KIn52ER5eNmFevTKHg0SzYF6eHO9pARgRImMccKB4koHYF8zhyGYY4tKcCtBNDQ/SuiqOKqOndfyGc6H/C36F9ZYA5Rfb+fbbqbPizPb+0VT6gHog1OLbn/b8cxnJo08OrbGC36HHTy4d+H3sTfHS1qtqGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760546581; c=relaxed/simple;
	bh=0PKOhkE5ruXQQehBQzj44u7x4lvljNvsNcUAS0/pO5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lQYKGgmaI+FE6uVPrCpPb3NNUryysKnYMao6L1geSMsFfoTq+5WM/BfIg5P+UrzWBAIMS28vic/WC/FDMR2n8O8KEaag69RtzLw3p+MzZaRkIYNc8OBToLiVrKXyvpSjDZWE5JLwqBtzdEpvYqNs8jwxP/mqaKxJbZIWRbfvOIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IIim8Kdm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAXBM3005092
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LEzxdlAxS/RwITda/z0WVM8kwSrYjWY6px5BqYgNLK0=; b=IIim8KdmETni9OAa
	cjwYEatr+vLcJZfGxQIHEP2CaNzzmsPsjn77Iczx+dUbLqi1Hj3QX21+ftJD77S9
	h83KFb/xE/NqyY9rU5olkJrlshhoubVBeH5FRvAlNqWTTRkc/jmq4b7FGjTIawIR
	9y6Lf62DEYddEZoXRBPRFyrCB1oxHeP7gHDJQ+8J35eIFqhDmwjg6KfYGfiHc9dU
	L/W+cW4/d5vvTvsKlhA5NpLPmUFaFPlaRJPcyzjZGniVwnrHO+coMH2zUzrDZncy
	69H4rf8u5QvVjOtiv/0Jco3MZkkVpC5FGWQ6YTrEw6FyVWQCkbgb9VnD8WCpAJbj
	LWuDqQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgdg53jd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 16:42:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5529da7771so8291757a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760546572; x=1761151372;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LEzxdlAxS/RwITda/z0WVM8kwSrYjWY6px5BqYgNLK0=;
        b=qVcN4+ReHQwTtRGkK8qXKx+BZAU31iPo5gJ3qJKUzW1C67u/k77hTdxByrGlzzUQVR
         +fASJ2B5qhROD+fmd3xyB3KN4LrGZ3IZhrz1gehH7lCZo0ovujiZzKq1/TGYLonWnCPR
         shiqsAK1mJWVmwDzxXswDIJ92FyCCT3BtDEH2LVw58bp+qSySgkNCYS6WA1NXXCKTFcK
         WNuHRfKzjdVLssBC/KYHjxT+363m7Vw8EvH7sJZ8REUH92uTjT5VMkM7iS9Kmy34cNif
         CqmtnVlSpbRNcCKRqQGh4qZZXGaqnxAnS377mFGN8Z9TMKZjZIxlz+YnWnKc0xlG0Ub+
         lSUg==
X-Forwarded-Encrypted: i=1; AJvYcCUkR/gM3KFm3B+RufRfgB4/k7YHy6btGFWej9ndyyI2Kiyd/ADeLipknJPQSNHcznvrzEW4pAinKsX/+BAo@vger.kernel.org
X-Gm-Message-State: AOJu0YyoM3VtANX5eBOY8pHjQa3JzVTIPr349lA01x7Rdi+GrRswfx2O
	j2BHK6xDyNaudDtgr5k588hGADxRpLQNpyV00mMUq2VeDeqinW2+wAiTiEREGm93Z0UyhF56Mbz
	hFjhc88dEDQHdj+kFYmmq3Rl/zhqw7oGZMiUA+RkVosbZw9tY769B4Rl9Hfwa1FuqA5Zm
X-Gm-Gg: ASbGncuzYehqk4771JwmqiREkRHtiTjgDKveToVHqQtYtNGvMQyRYcBXjfOd7jsNDtz
	mbll8gF4n17og6md/PU5yYLwYa/JnJSVD3OVNx+dgK7TIwrgvadpHmiLSGw5ZRwvVZCoBaf1ylf
	WA/eGiJ3cyZIEzNdr8ERmuiDHek6e0T2W6zp0h/obXmPA97f0FOMUjMZ9j+4a8sxOQLlrclB1Az
	9UhtQ99JFiD0KiiNNM+u0aZywht5Z+qBE2gsHHziMer00ARuyKi/YlCXIcK+qqGlP4j87GqOmJ+
	dMUhL/fsLotdZHvRQM7dVMy7lrC8cMAXL+yC7ZQ837lswUYqjqWd3N3ojTRKlUcR0DaTo/eOAXw
	GFZOlNRddxiyBNQ==
X-Received: by 2002:a17:903:252:b0:267:a231:34d0 with SMTP id d9443c01a7336-290272e3d1fmr332402395ad.42.1760546572101;
        Wed, 15 Oct 2025 09:42:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMxN/y9i71nWa9T8ob8P8XCIIJVDSqIHn+u82dVZURm7SQWjwoePzRekvvE3a4My3/jsLogw==
X-Received: by 2002:a17:903:252:b0:267:a231:34d0 with SMTP id d9443c01a7336-290272e3d1fmr332402195ad.42.1760546571621;
        Wed, 15 Oct 2025 09:42:51 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290993526dbsm1359975ad.40.2025.10.15.09.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 09:42:51 -0700 (PDT)
Message-ID: <caecdae6-8845-4292-b83f-7d98b17eb43f@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:42:49 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Replace user defined overflow check
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251015152239.167226-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNSBTYWx0ZWRfX9Pi6RBhD2i8F
 ARA5Gqcm2LhaWF/V2RoPpkNuNrdVyDpnOI15eAn8tUeDbW0EvVVp1T+uZIcRJ7fswm6KPNG8MjB
 r8u2mPJTbZeFdQG/6710240UXnDJSy4ycktg41NkWOVwHG5jGRnz5khAEIWTQut43PMXn482P/L
 INI8puIdWa9JznCWyP33bpUrYaVLMDterWmDB8R67zbHnQUKXI8zq3EBKbBjdZaDTK/ZFtXyFvy
 swp8ch5vYyOGpimGv907ZhBI3zEki422a3CaMFqgSpdOqA5GxPEfwTdciGsOVpjJLJMFdjJgy4P
 NhHqIuGC+23DmuAFxt1x/i2aAOuAAWAymrMX8gNWJBOXevBrr5yBgP6yd6gILwKVmyMAXVhGK4o
 dsPcDc/fI+Q0R2vbR2ohAuVAEbptZQ==
X-Proofpoint-GUID: ibRAzu0BX-0rLNCgakiNdQIFFhdlvuL5
X-Proofpoint-ORIG-GUID: ibRAzu0BX-0rLNCgakiNdQIFFhdlvuL5
X-Authority-Analysis: v=2.4 cv=J4ynLQnS c=1 sm=1 tr=0 ts=68efcf0d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=mm7m7b9bRd1GpXE27EgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110025

On 10/15/2025 9:22 AM, Youssef Samir wrote:
> From: Sourab Bera <quic_sourbera@quicinc.com>
> 
> Replace the current logic to check overflow, with the kernel-provided
> macro `check_mul_overflow` in the function __qaic_execute_bo_ioctl().
> 
> Signed-off-by: Sourab Bera <quic_sourbera@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

