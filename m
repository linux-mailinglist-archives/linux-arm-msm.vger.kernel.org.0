Return-Path: <linux-arm-msm+bounces-76264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB8EBC29A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 22:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BA075350A55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 20:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637CE23D290;
	Tue,  7 Oct 2025 20:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tye7mnw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA11253944
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 20:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759867631; cv=none; b=aPOI3jMJHqYDS5Qm//WvwGNk3qQjJXl+QhNA0TxK7bmZnZxRTUMzabuaq4SZMyHW5eVsiEphHbPkUXwELL6aJPxDZVGgz1vIZL3RFWoTNSiVJpPstXK7kmtsiwtJN/awxzAXPqdVSCxUsz7EgeP9Iv9XDXK0pdxFm1KWtlNVaxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759867631; c=relaxed/simple;
	bh=fRzVQe9WZcXscB8VKDC2XsUjKb2qOe7EEKYWSzyCNqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TrFpQvaNp2dqezXt62zY8/8Kf7odAd0ddc5B7w9WNUDdQAQgmCQqhg0lC8P0GZn8y18oTDcNkffAiDTa3OgJG09L8ThMwt+DJ9TKPHgY8xGjnad66Jwf13Yl/fHHxAtkI/s3eVpH65kewMWzz7qzQt596qCCZVPZYqeum0kz7Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tye7mnw5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETFu2031825
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 20:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VzeQzWpNOk4pM+Ce37scgMPJfDyv5N9sHsZTpLdwn6Q=; b=Tye7mnw5v9F7khAd
	rz2FHGAsHsw9AEIufsuPeSlduWHo2hBHDh4L42cnQX/5NqJ4Li+2ZAJKsyFaGAT6
	pEfoeXNp8mu3kUUBP4ltD90v6VhNyBbRyGm/U82e+L59V/dc1Fkbmyfv/rxPqEXx
	TSmdfIg1c+gW+ZyOe4OOxPM6SSn7BD90VNRPhtN8SEivzO8nK64Lz63M8tM+8fFz
	CtM6xQG+jXkGq70EkrqNZLrNxGQOG87f+8sJHMcGbqNNv6c3LE7hLllSuEkSvuma
	uRdfjGgCSHE1SWATLhdcVaid+v2P8n64kdF097NvcQtym/Bry7tKGNjphtcgsT4E
	zoQU0w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk70g55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 20:07:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so3143139a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759867627; x=1760472427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VzeQzWpNOk4pM+Ce37scgMPJfDyv5N9sHsZTpLdwn6Q=;
        b=vSk50ssGhJqDrzjzx3DgyJ3dORgUPj4v0wlBJV0CfYQz3xSU1a/49kR8xbLFiL8gnz
         D2F8nlc4VLu4NnwoZ9L1pK1E0VD5fHoy3Uf3RJdPsUFlDksBfUKVmj19pK91nUEBYFBz
         x4x/QswG3I5iE2N3JHNkPT3RZYsUxUTTOr/8EwsTlXTFkIzS+JZqlTajUv8L0J4QRGce
         oJVmAUmjK5Fk8oEMwPt87wfibqvxpnVc8mcCaz1gFMGUyhxt+pyY4vsq3k8H6A36PT80
         V/smwCf21csF79XTE+LwOlcO4I5rXJyxK0PPehT5Sl07bSQl/HOkclXVnKaaWwK/k2RR
         +qTg==
X-Forwarded-Encrypted: i=1; AJvYcCUHQ0Sc9SmslQTyqAK1jmtXufWbhYmSw1DWjW6HSloO3jtSHhyM3YWAUHoxTZc08k3s7K+KcKlelGSnPTDF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4PfbkdRdHCa/udW0aD7RWwfhBgt/mbXQOYz3EcSvbOSfNRlj6
	GqUkaMeULNhXe6qDAQmaN6XkiVcuTdzDztPhQneV6Z9dy7zZo8p7hWvSfpQF0u8tpvHzjQV/Wp3
	rqZYtA7VFlb27DwQWfU3Nkz/6FSW6JpTTVYA2KmPFzuA91OfAXTXl/NEfN9utqhVy1Dok
X-Gm-Gg: ASbGncvBLNHUbWami5O6bwHbV4Ma0k1cWrd04NKz+eu+q+W/P/KOFmJL0gY9QgrWBlQ
	nK8MAZN/KBNNX4qH0xUAr10qr0iPuhnifOw+3ibkKifXJ1YZSK2EAYoK2649rMdLd8X0KaRLTV9
	lav7siFIbzQyRd4AijIWxmUTT0K1c4mMJkcwyie7sNzZN4sAJ8NWYxs3+/B0+OByeQlmCFq2VvZ
	6OYsuyqMkBvZEp6UZAVj2/zPLxinDEGkKyH0IQfGi5LJIGrcZnlKCWB/LsDjK/tBrjPmPFowLSX
	XK1L1FPVB8YDEzhkEnkR6D57uqhHQwPPatO8ry7f6Po7ta9eW/9V/cPXpYXcThjPk9oEaqjHaTa
	Wud1wt96xeMnyPaN3tGA=
X-Received: by 2002:a17:90b:1648:b0:32e:e18a:368c with SMTP id 98e67ed59e1d1-33b51106a8emr912516a91.7.1759867626727;
        Tue, 07 Oct 2025 13:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVeLQ0SE3NFV4kCQD8nEMTBG9ZKOa4prTYAa9bdXMfERqj5AfmrviI8Cfqrw0bRV0LIMhUWQ==
X-Received: by 2002:a17:90b:1648:b0:32e:e18a:368c with SMTP id 98e67ed59e1d1-33b51106a8emr912485a91.7.1759867626228;
        Tue, 07 Oct 2025 13:07:06 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b513ae7d9sm507129a91.24.2025.10.07.13.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 13:07:05 -0700 (PDT)
Message-ID: <cc095e89-36b1-4cfc-85bf-c391769ddae4@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 14:07:04 -0600
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
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007174218.469867-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX51kUX9paFcqp
 wwiIB6cQhBteLhkdTL6n5YaUUabqLWK38PgAYgMsFC5OCvhfkhDBoUhghlXgk0fAXM+nSvEatGv
 4OaxvD4Sg/3nK9lFra9pCqZX3lXN49ouesUeTuwO+xdMh/6IlxmGlalOjJmewIYLvqAtQ+vT5dB
 QnqE+Hr0w7sE3aHZgrnMxj3lfCS3AEQn+Up/VpiRskKwAM2vxWs05XCuJqTD6/r9OGshL0RIjC7
 MsuzLYfMiOPQdYPNXpjHSkHfW2VJdxW0v4QchUNKOazA36YOoy+WaP+Z0TbAIAQL63xT/NRnqjO
 Vw6rLUVHg4M+d+BTBbxIRn2r0aZsF1jngHpND0aFIMxAL1vG7UXuq3dZSsOv1laUZq3jaSVKeOt
 um8ohLyHqwx6KBWmhxpwPZVgzFNn8A==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e572ec cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5CQhQK5fGE5c9LPSzNkA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Wd8DImrN2t2IaXbJQ6WwnuUT5X-KBLO0
X-Proofpoint-ORIG-GUID: Wd8DImrN2t2IaXbJQ6WwnuUT5X-KBLO0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 10/7/2025 11:42 AM, Youssef Samir wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> Division is an expensive operation. Overflow check functions exist
> already. Use existing overflow check functions rather than dividing to
> check for overflow.
> 
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

