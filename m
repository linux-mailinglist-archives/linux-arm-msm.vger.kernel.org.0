Return-Path: <linux-arm-msm+bounces-81131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE4C48D6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B3724F1BFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A295330BB95;
	Mon, 10 Nov 2025 18:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PL1AEmln";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FQu4JQnI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF8F2DC76C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800596; cv=none; b=XtEYmK7J5OOIQtyPSQ0lCZ0QuoKWd4ytmis+j2x7CbDusF9QkhlKP4T55+hjepGlRO1MpGCRMm3C3rHFFUa4o3U8DsS3WEjElvJrM5EJNSZ4paYbEJ+Us8JBK3GhHjO+EPZltbJ6CcNF9sL6X43L7oJ9RZfFoAWhRjKYjdU5ciA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800596; c=relaxed/simple;
	bh=5KsqV0q3bBOU5rsRiux1gNTW1pdgiIi69GXvdpcIg2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXNY3hNJECJJA+tPQQIUwUgRZU4fbPMcK0KpvGhpUhkzU8xOY50LNSUndJThMbEm7WuZ9S4zFaJXwILLUbWoPea5xdsJLOICHsVTcRKC6kDD/6ylZzzzbvg2KpT4T+I827az9P6nBhfOI6/g43Pcgyz2yEvJoveiCS6VWUyn7vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PL1AEmln; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FQu4JQnI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAH3fcg4166773
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 18:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O0m4SsGXFjn2QrveGO9bZZGQsmQpk9SLlkT4+HpNpjY=; b=PL1AEmln8Wp5xl7w
	if42V9d8kC2vO7KoDJ8J7Zziit+76YgVx6P4OGUTF5++Avt5HSX8vh+zX0RZUvST
	j1dialVZPYE8Ips1+6OIaaQimcYMg2Rn4/K568KCdb9SbqHr32ryC0wvm2u4zxYs
	g9xlzv4+LcBTGoUQHp2W2lIH0nh8gqt0+vUZJu17tSShwNIDii8PR5J/nrj6wGVm
	OzREJZiylPjgoeRGEdO15OJOUvoJuYFFqK/rfV93oA6LGJpq4UvqZU0W0Kqpp0hK
	vuyDnH+32MhvEqVv/cJMVpHn4smdPUT6TLB8MQL9pKkMIze7h4234INZE0m9diIZ
	4+WCEA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abm4a09ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 18:49:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3437f0760daso4680184a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762800593; x=1763405393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O0m4SsGXFjn2QrveGO9bZZGQsmQpk9SLlkT4+HpNpjY=;
        b=FQu4JQnIc9X6NepP1SbernDV8nPvFm6zn4itCBbxYZig6pcqZ6TSuCO+mMElYrO7NG
         fbsqM/Qy11Yg5bms/K3Ned8UOj5TTrvYpic58a4vf5XuM2rTe6xTy4gmHTM79xpR44jV
         pxyPmkRuDLN5T8+2c4ufBmnkq1Jh+GhUYOd6S1r+NiDlTes7aM1p34a5M4dcek0wUA6R
         qExZRp+OKj7yNAB6NoU8eW5krfWN6tb1x3s1+ENokaWnLlRzwO++eMI0C31kEVRB/M44
         R3uok/VdP8N0anTeX7BQ4sSMxkdAu3wrxH7bvW/bAypLG8G842c1IlUlb5GJAGMZK0sj
         Ciqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762800593; x=1763405393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O0m4SsGXFjn2QrveGO9bZZGQsmQpk9SLlkT4+HpNpjY=;
        b=SaWi97DS4W9uZk7aDmI9Hzd5uvzL6C//q71vT9FAP20HEoy5BBJB1sFhnKZClGcj5C
         qpbRgUGmfyDZmdfqcIFDuz/r8Z28ICrUYjd8zs6SeK/cWL7VSLYhEZeYgZqdNE5Uq/AK
         t/dhwXhQbD3rWwZCspiaKB4ba1JpaL2xUMcr3MB5aEKzbIikkDhff/KaweBEKucYYeit
         K+HJqSs98Cb+A2S0sSvryOhI6i1vT9iPeBd3zxyGZADT2lHZEMpU9nA4QlvbF6BGtGRt
         HhTFATJGtkX8bLSlxmvkSQtIZaF4wgk9Mp5Kgmf6ANMnAVfz/AQFFGY+Pxe6nPQtLUPV
         F8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVekcJz02waLOkOPMMk+5wSPLaCd6aURxFa24N9U5joTVvfICNZ8oKdQ4Em1v50qlYc5VpI2EaYaQ6YQocl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Msm2Rv4hyYrjFGZjAS0dt0sxSxLd0Y/aZZbpN5sonkkvRZWG
	7L6C8I/OCLWKN9SYE3mmozA3t5GG0zZDPa7gtyWRt+EkwX3GKcY1EtK7tJmad+eVkzexFDjwao/
	Hh08+1g8jrM/pwmMt43F2n7fYb25ZVSyGEtMseUNHq/XnuBbvi7NHorOw6hnrkXaXhejd
X-Gm-Gg: ASbGncsuoazw0P7xeteXQpb5KCEXbHN4C/OBOY+agP5AOXGVk3bCGq0C5EV14lUD5FN
	i3MQbtmzDo7RciUxMNMjt2gbtpSa7A5LDYu5d3G9n3lKNEiH65RoX+SUmVVpBrrxLEuyUE8eWI8
	dvogTUpG5qDGuSd4+9TJdm6xszdZcZH9tdmCluqLbrg1Ers+1OyaVKaZXINbhUfUxRr+StCS3sr
	0tCIumXh5k2M+BXVaqEjEsPruBH7gRbuknvWeuPmYmHG6P8KmDPyC4ev7iFChc7YRBH8y3Prnqd
	xRcLKZ6XmrQCcENG+zUXAO7JRNHzwKImsc6Bo+iF4cEYAjWR3V+xpyjuBUJgfqFIYMISkbId95N
	1nL8mCOsBqJHoHKK6rlpL0FDBx9w4LbYrOy9GKFLbjoKD82zjeTPO
X-Received: by 2002:a17:90b:3904:b0:340:ec6f:5adb with SMTP id 98e67ed59e1d1-3436cb7beb3mr11459418a91.3.1762800592652;
        Mon, 10 Nov 2025 10:49:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEly7/dDtyVvwZoxb1UUG2yBv46sYHnPdx6WiV4Ldjd9d3p/YphCmNqkTgC3gIcVgA7m3+7tw==
X-Received: by 2002:a17:90b:3904:b0:340:ec6f:5adb with SMTP id 98e67ed59e1d1-3436cb7beb3mr11459389a91.3.1762800592166;
        Mon, 10 Nov 2025 10:49:52 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f8e750c1sm13402258a12.1.2025.11.10.10.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 10:49:51 -0800 (PST)
Message-ID: <507160ca-a3ba-4705-984b-ef94a56e3b8f@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 11:49:49 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Separate DBC_STATE_* definition list
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
 <20251110035952.25778-3-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-3-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HDX8zkPkZncZnB9ma0jwvtN1HkevFZvU
X-Authority-Analysis: v=2.4 cv=G6kR0tk5 c=1 sm=1 tr=0 ts=691233d1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=yxMg_K-rWnv8iLjOS7QA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-ORIG-GUID: HDX8zkPkZncZnB9ma0jwvtN1HkevFZvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE1OSBTYWx0ZWRfXyKAgxSNwiQ6w
 7h1tYtB2goQEYR+z7N05fD3mq+4lUWSACPpwmjhgIjJ9LXgbB23r59zT9ssQY1uAeLXe3n6LZzo
 s4M/naRkMDvF4BIlZ8VljtwL/OZifwnZ8u7IC+2fep7tGPM/+AjlCvmDnNGRobI1kWo9tXpuVY5
 1uU9Xg6Z2bk1qL4wtF567V8Pur3XGnYyx3uNHSJLOwcnzfVRGGF1RQ3UOy1V1g4iX1/HrQp6/4w
 JhxILwUMwXx65PSRa9CZXIC/OeqeDPD0LM82b4iu+XQWmUfYRVfJbQCaTVe6RwXWvDCeIeQwGag
 A0CrUQydejiuTQfLMmCbsMZ9oQtO0SB2uBLh8xNL0iQzl/eqNO0cqFviO+evFf7wVcjCqR+3FU5
 /qJEGo+mmVGRrtl22ls+W/vONRHZqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100159

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:
> 
> Documentation/accel/qaic/aic100.rst:502: ERROR: Unexpected indentation. [docutils]
> Documentation/accel/qaic/aic100.rst:504: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> 
> Fix these by separating DBC_STATE_* definition list from preceding
> paragraph.
> 
> Fixes: 9675093acea04c ("accel/qaic: Implement basic SSR handling")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

