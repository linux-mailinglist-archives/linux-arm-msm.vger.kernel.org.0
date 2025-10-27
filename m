Return-Path: <linux-arm-msm+bounces-79003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6030C0FD5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 19:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF61A3BAD30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC49296BC5;
	Mon, 27 Oct 2025 18:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ab7jc/Ds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6DE17BA6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588168; cv=none; b=jxJERGlEsr+04f5ZMcgZN6pMoIxQ0/bojZO4nNRi/fOA8d3bwUiMvyR9A5d/aLwbwLolVL0XzE2DxkQOksXAu1cKzesZ+hUUYxFy6ErNwF0jw4jbxM5itoIEpCMTojwc5xivl9yhQmI+rCX7WXo1JGaNDJnemR9udQXQARu9tZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588168; c=relaxed/simple;
	bh=roPK6y+AEz8ujmSWtaxkBhARKjYe9HFgiTJyUq9DQ7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kJHV4ifAWchHRzNaSl2tdgE1eZhXMBTaUizEcpioAO3GpVz0LlaAWGhU97Jr2pXDRoduUrRX1yYK1z1Ioy1xJZRk1v5hOaLSy2/AROUVquP8MfXAnuAASRzWpQZhT+dCBZDK/4JCqbwgDnvI66jf7sH8FMlEGfboFv6cDB1ILgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ab7jc/Ds; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RBJjCN2546723
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1FI3SqA9pOfmjV8xLxPSvPGBQ4KBMzND0UQTvKL5Lk=; b=Ab7jc/DsEmquVDPV
	SvOH2MjBuf7UC6B56OYnD8gDunu/OWQ9xygALZPe3HxWqSIRMPTTMkMlr3ucQjEV
	WnUC28yHNDchxqrhUnY1Y6RJhg5ZDUAKaG10v/bl0Llq22MS/iH/Mrx5JWtVifhU
	C8WBNVQbUXsBUk+EKJFGDWcbnknX1VsONTQKcO05gT5HQPx7Av8Npk7yiCTmFNQ5
	xX9u5sxxR7gAeTALQLSkCeA7RVYZ/DItIRV2fJUESZTvilsXWOZtItVaLbKlh1BO
	mC+ZaxbIyAg3Zs7ACzlLoCEns4ru+jnZ17hHWqxglGvt9F4eZ622xMY+HQndcMik
	48QEhg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2had6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:02:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-294880e7ca4so84176855ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588165; x=1762192965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L1FI3SqA9pOfmjV8xLxPSvPGBQ4KBMzND0UQTvKL5Lk=;
        b=JrFInE1XzbH+oZLrHzJWndcCE3ek6tBsyKnPN1moHVUhcrAMvzp/U6/qsArdUy9GQX
         u1uI2nawuPqeYikYJlgr08FjCrLUvJnC0pzJZbD2Qy8mNhzlAZldf4quiuaYDddIydLc
         eq7GMDmaSC/n760PGpMWJUzslcFMNiGCDwKU4yVeHZuyxKSIqlQkKZ1lK4Hjd7DsgwYt
         UVfx365r1fxbnPXV6VnTMyX3xMDTxdo04Mw60g0H+gzMrWsgrRgjtKKDV2yG5kdKwFKG
         smvMS03k057FCZWmB7h6EXtEH8TIYb9SCdSreKHmKTYnlJpqCBVYPOr/R8N2sJ6pA3iJ
         ddYA==
X-Forwarded-Encrypted: i=1; AJvYcCUL4tCyyJC7c7xur36I9Eaf7f9kOAIhk3GD/qR56gZJ/8iOPOD03IpZe1whNrqsNu/khfg5dDnhlh+YDjV8@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLy9n+GkhHzz6IU1g8DsMs1i4eiQpVbIBnQwcbnHObKUkiccY
	NZxt/8dWeYwWq6ztBMrJS5rmH61iKkM3b1IDktLbIooK1PPjItpFYBNCgJmTQQ/3iKJywqFmt/k
	8/fudwAlr+pceQPpgWekrIEaUFMOcxk293Zu6phNzKQgN+ytHCZ7TU+jZlyFpdBpcWT4I
X-Gm-Gg: ASbGncum+LknN2TNWtIWPVhrpNxdmlbdwmGyH+mduNtXmqL0lxtsqXHFEFo1tdpujf9
	SguFvIAPGRo5OJvFqccvoJWCgUd3PSuTbWqcTEIxZ7HJZBLqGhblrzKa2oiaQ8Dkl8g3e6YnQCT
	4edqMDUGITlrdwOyiCFGpIPd7BsTE8RiZyKmNeqRfR9gAaErFy0WEY8YODuqmaKLGFUa9sWSDOY
	2Jj1sxdLFI8AKLHWXFD3q4iPFcBIJPTCQvdRy5491gogRdCkMnBu5cx1pDkogIBgrfvzK0Vn75U
	XC/stwCQtt6/8O73RDep8sj7hB9fGHiZhmFUwr0o9BmxOk8s18JGLZ8hY+Cdrtew3/yRPFpuYWi
	LGrCuEQw5rh9ypPy89F8Nz/fP4dOmgr/hy73kOhdPJ15FuhGBuf03
X-Received: by 2002:a17:902:d512:b0:290:a32b:909b with SMTP id d9443c01a7336-294cb66cf29mr7399425ad.44.1761588164574;
        Mon, 27 Oct 2025 11:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX/Fb/soGJ2BOE/l9HvCQ9vc8xa3WqaQ9fp0NImqtyDItfueYfmFOWwyouBl8LEIAw/dDtGQ==
X-Received: by 2002:a17:902:d512:b0:290:a32b:909b with SMTP id d9443c01a7336-294cb66cf29mr7399025ad.44.1761588163951;
        Mon, 27 Oct 2025 11:02:43 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3410sm90362025ad.8.2025.10.27.11.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 11:02:43 -0700 (PDT)
Message-ID: <7e2381d7-346d-4c0f-ac1c-742429e40a8f@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:02:42 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix comment
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hGEGlhajT5Rhoi93M7jZlIkkH16TufAj
X-Proofpoint-GUID: hGEGlhajT5Rhoi93M7jZlIkkH16TufAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2NyBTYWx0ZWRfXwxyIHOnM0EQI
 woAAs/57pMqFdEE5+bPDRqf9no6B+4eWiu3cW6ugFOu7uNue40q99GC7lgMkACcBzMJNwyh4bkr
 rs9zsAECdZ9o+LM1XuhxIX7iPf+MTXyjk08kKNaVlFDEEMGs3eu+djA4i1BVpIkU+Z7wNNupBQ7
 RBIfOVz0dxExtkL5iW2WGObf+4l7NdR9E2lJEQqfF9mLFXr96lrr66Biet29DvYitlbY8C6TCZr
 mnm/jbva2OwFMfucAAVzEUtj6y4BmEBcVzom6fgpJfGigFsvgWNT+Wzft8Sg6DWXj5cY0t+bOX4
 E+oYpQ4gjlSDVAqpV5SEqZJgvPzcsO5DY9ap2vx6+c1DDoMSPbj8KrIsRiOLTMrsDPMxWZGPPRa
 6sbQ6049klk52KiS2i7AFUlwPJnA/g==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=68ffb3c5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sS_EF5oJ7B5xURoN_h4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270167

On 10/22/2025 6:41 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Replace the word "Qranium" with "qaic" in the function parameter description.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

