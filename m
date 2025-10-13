Return-Path: <linux-arm-msm+bounces-77058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 644BABD6BA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 01:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4586D4E100C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 23:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786DA1E5B9A;
	Mon, 13 Oct 2025 23:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAcypO4V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2222C027C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760397771; cv=none; b=gQzKJz1LGSYdEEL41/5DDonKZUGWPrkWVUkteTFHHMunUyfngfnEmBSeVA2+okd7lrGO/DTMaLV0eJubBtQmFw164adjkSGYnvK44x48ISgTUNljfWxbKxalwo7st24nEUztjm3Ec9Q95E/EDaoRoFQiQdQkDVT8ZO8O8Xe7kFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760397771; c=relaxed/simple;
	bh=IOCXRJ/hDZp3b+qA/EY6qXLbI8DAZsu9C5BmjBjorVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjfFOuJYi8pwTPOyX2LWQTlxZbxz2FuUU1eOhPEyAA9B543bBXD9GaXo1IeMeL5nCUQWNmBfxQmSxge45wh6BlRoXLQPIVIAedflavS5DcMt4wSXdh/Le9yoAWRuTLLAH3TYW0nxx74wThJYaU7j8s7B/08xyqKEblo1ksT+3Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAcypO4V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDBui008126
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ifhsVFsbJ/327iShGQMRKqlAPxmX4MkOGJ6f1VNO4Js=; b=JAcypO4VGHQJkgFx
	IWsTsN/Rx7MTqYuVO2i4CS1x6IocZGd4nNlUsRX3O18CcByfPb31q/fWSx7qHIah
	+poYC3O6e/GEgZNZ3I8pDWjiJk4E5vL3Iu+99H9xmQcyQ6JrP2MfqfUS8znCUCXz
	AhBfiFQwBpUxyKM2Y0rFDEwcxlXG8HKtm84iPvIf+fMOiqrgn+qx8VAhpyT9bFal
	KigJvudEjhP3ZRyAb6+ZBKSMIbDrckjjg83zc7976xcSKGM/btnleEPPn0hoJMO7
	3lcbMVPtgqD+t8MS6t1y6cndZSMUnw+ETBg7OMKTBubob7RCpoyjq1vYymBS9Lod
	Pcyzmw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt39kr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:22:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2e60221fso13268457b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760397767; x=1761002567;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ifhsVFsbJ/327iShGQMRKqlAPxmX4MkOGJ6f1VNO4Js=;
        b=CuirmJNVngPmEC9BVRvCBOPx9I7ThuC3Fr1/fqPWPT0RTqhzoFgDT2BFTGdKp/c7Cc
         rSGHXJssEzFQ7syiMpCOuRnyc7dmaKac2J+qX8EITAhBfgxz38En5kVGcYtey1aw28Hg
         wshuJeVYr49I3dTs1SZt0BBr6F0GxQ/RKjEEyaMv28JjfhN0gTwoJLM+8jreXNaG8oeZ
         1uDHBWC5nmIjXaAoBClpVBo2objwMVLxlBTlYMlOi9MIprcdkOPzLXRaJ3FjDATL1M75
         BKm1bB6s2hGIVoUBzvS3NegFdAO6MHihqPUDv2ojpUqEH6OWYTJASUpYgyv0J+xBlArc
         eI8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAbk3FTr2PTdawjEo6AHYHfcnY/lAyItWVGdFPw1RsPZP7hTg8lg3RMmX46gkFsEvTqpo5EahwCUcz4W6C@vger.kernel.org
X-Gm-Message-State: AOJu0YxlzPhR6TTDxh18B8riPdoY49o4nafc2EL9c5S6V45rc0N/zr3W
	4UEmUNYEqmG/MGg9588mVZyzliWeZILMQoZ5kvTUVQoN7gdevh7jFUaSZGymKmySg9HvyoRjpxY
	IQoEkG87xv6iylNoY3wQKQaqevgwZAyvK2i25skmZWBsQzm8IMMWe73dm7QoXLvLgxCxB
X-Gm-Gg: ASbGncvUJMejQbw/gxEDiHAECYhH4MKX+vcG5KHM2bnaOJt6uaG1ue7pYBJ+Jy8yxwA
	B12NQ0v/isDay+8FeGz7DTwfI27yqmsmEi4qAD9GS2+yZgD5Q3wIQA+PPLYl/z5Af3t8VNd53EB
	0PyyFmgAywIc5xgMj2OGZ6gkk7AO7OoqGA148Pol2Cf+pkrXfvH/KpTMt3ecEARBVC4VHBoUaf7
	cQvcGlQPrZtrGwo6G4pT18UzOr8VMbLSfwsHXE/MJvQjVm4WKgn3Cj13oFI6p3dW8CYn4xEK74e
	I7CU1rzdQrz7qTh+zD3eWFCeH4eFmN80OYzQiyWogSc/P27/3sXZ2pgcLFi6LHPzV9VUJ+KNNmU
	AC8wKhA0papDLMu5McFy4SflUxG8=
X-Received: by 2002:a05:6a00:1a8d:b0:781:b23:6b7e with SMTP id d2e1a72fcca58-79386e50a16mr29364083b3a.15.1760397767240;
        Mon, 13 Oct 2025 16:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQxZCypHkqwpji+LttTougxbangSFkk7NOFVax7EIjgiUXhLFr491MRWYQ0gk5W6RIFZ0l3g==
X-Received: by 2002:a05:6a00:1a8d:b0:781:b23:6b7e with SMTP id d2e1a72fcca58-79386e50a16mr29364061b3a.15.1760397766817;
        Mon, 13 Oct 2025 16:22:46 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb1e50dsm12914303b3a.33.2025.10.13.16.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 16:22:46 -0700 (PDT)
Message-ID: <404c9bf6-e4a2-429c-9b36-4bc300fa3cae@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:22:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Use overflow check function instead of
 division
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xKo3hJeHnf9kG00VaLNhLXIBs2KMdEdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX4tD1VCW3QpKG
 0J+f4xKFlNJU6gRwl4Q7O+6RGY+wAeTz67TOFj8/DuD21jUbNbxV9LCZz6vEAbPlBBRT9DeWGeC
 xPEwzPyctZEhmej/gG2St9dVzNtXp/6F7+Xvov2aFcC2oWOO4r11XEt8XTevLoNlIP7U1cVwjH/
 BBAx1xjmSX5/U77e1oVmbeTOk3oh755caig9CH8ng6xOFNgYZcvZ0khetxWAfKmtz1j9uP3MgxR
 AB0TCKxkvx/SzkcxlaFXbhDNCGoMTAo9oyBpIWz1zMY/McuNNkEqhUrsjzih+646gOYxGPGOyCJ
 HgOWnEK6J3NjjCx432mTSOOrNPXZsiuSpvUwPjP7nCXuLYJxBFTbjUyGxb+5P9143InIE6WKOJL
 6kLqhxAE2vcJ2S4JURw4A8BY9KG9cQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ed89c8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5CQhQK5fGE5c9LPSzNkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xKo3hJeHnf9kG00VaLNhLXIBs2KMdEdt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/7/2025 10:42 AM, Youssef Samir wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> Division is an expensive operation. Overflow check functions exist
> already. Use existing overflow check functions rather than dividing to
> check for overflow.
> 
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

