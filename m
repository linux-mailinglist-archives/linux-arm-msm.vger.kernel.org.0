Return-Path: <linux-arm-msm+bounces-86184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DD8CD55C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92004300E958
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F09030DEC6;
	Mon, 22 Dec 2025 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I35pNHTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLpr3V9A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA412FFDCC
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396601; cv=none; b=TcKeFwGcfVjEP06qGtqViptyIeOLd1MhD9zL+/voFTmdOoLYhlblo2tRxO0+sxmaqTNvbIXXIFHAdrXHNBm/u3LPZWoon8Mq7dZTdu27BABREojk19PPFK85Vfm/qA2bD0uHnTDcaJ9Ym0zjtHVOXlxGCYzHsuzrNS2jePzmsTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396601; c=relaxed/simple;
	bh=NMPjZC1pzFOgyyiJEdVZB0AiQfYXNSt1cX6MqSMGtY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6YB/KcTdMzhFM4yx7pJcrh6q5ZPFmxcl47vtXUCZ+370UUlHToPfADF9t/0qImLk6zycb8K10vk+5RcLF+NmtowPy3cRU+9tOmgAbwvVYh4qYeMyiGPHCkee/KZAo8dHrcSbUcZyqGv2D6LoFwdqKW0IQI1tEMchx/oZ3ggsWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I35pNHTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLpr3V9A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM713IN3072609
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRN6yIHvb50RD5cHSXOJLx9V5J7+ESE2+V0TzNobP3c=; b=I35pNHTaCZ6XR6ek
	dfjSeGeIc2StDqkVojbLeB3W4YxYCFh7fa2iHjy+GAN5Fare3ZKH5LaF/VJc3GN6
	3XjrJGoBGNjd/Iu1CmCbiLzKm7cB6FLnxjMXs3JgjkYp7e2WqJS7b7Ib7mxOm1WN
	4yrZUYjOzgyXrV3ABtdh1cs45YEMyati9JpR7f97t4d7OD3QxW311LrD3KnkIUjb
	QOOSQKqq5RTtVoM1U9d0/xgrDzOdAWDaUch2+LIgWP29wTLn6H+utJExjEkq6zIY
	wovzZNH8WwBOade04GqHZ+i+ki9HldPG5tuz2aRDYXluii8QgtleC3x0LNkoRJRh
	cb1VHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru4hc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:43:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f1e17aa706so20722371cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766396598; x=1767001398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRN6yIHvb50RD5cHSXOJLx9V5J7+ESE2+V0TzNobP3c=;
        b=jLpr3V9AifaphCa3LfgLxIo5HbjoHpHIFopRIRQC+O4qDxhZ9twNbYxlJKyKl3lrP0
         Kq2skcJR21K05rwVmLwp26RYi9uhEt6ahvATH+h+6ys/pV//VckvBn+opq9Vx3mp68T0
         8THQOBXDG7zlYVqcGRfiKtB4brLfn36yKu+Sy8UKZXZULx1MBO2jGLY3jBMfNcK5+cmn
         zUbrmmrso8li1zPiPPZaEbf7Cj5MYr+JFJc5TRYVFydrfi1E75YiVYXn8Cx/vIsKC2qk
         0bkVY6ex5sKldvDT715lLNRY/bZGOh6siR8bRKiR3YxzMPlotcbUYtx6HmurDX6MWjZc
         7CBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396598; x=1767001398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRN6yIHvb50RD5cHSXOJLx9V5J7+ESE2+V0TzNobP3c=;
        b=U2oLRHqJrxav1OA/4vxPj9DCsC4NqT5bUkaBdgeK95zJORUN/ezNXZ2bhvY3g93hCz
         r3hVGYOHdeKxlXtll511aiRfSh/0+GQeokal3JB4G1xtwJUcIdi7E+J4ka6pNLmNKiFk
         oJQBnCikukLoEQDYCTBUxZ4iP1xEH1yYhfswmCExk3TaGRq9c2sAw8XK08Bj/Wff2bdI
         8OSUXD1pe8vh8yA56cJsQ2RJH/di6gIThX2kFsAm3uBhVEhEa40KnExdiVw0p1uC7hTY
         g2wX8/T9dL4UiEvEpPSZOb2DKpsA24uHjFNca78K2NXvfe6mC7P8l2o50kWf6qoUdd3a
         A+kA==
X-Forwarded-Encrypted: i=1; AJvYcCUFwIJf/dxgVsNMUOPetD0tJcqQLpUzhQZOy0EqngAwA5Kd0VlkcA4PaLO3EZGU/vOEpvdUNWmSyKKz4JgE@vger.kernel.org
X-Gm-Message-State: AOJu0YycHAVdDYvLJvO/pmAqTzkAQnxg2r6vq5TUb5tX55gFl7BX1rxv
	NDmyOZG31ahyUfmaJ0XTO0CtRkQdtNTc9CVR8v/F5L4OtI/okjXPv+lAugdirkIfmGEpR55bCHK
	8LdriK651GrrXgqeHldK4oKow0o48ctJUzEHph3WInB7nlkIRcJOuhxsXAMSFSiAnfqJE
X-Gm-Gg: AY/fxX7A3zkIyCmpIeOYPa5pQUd7IAOyClrcXJRayYGqj56uyQk8m2v49kytnWPz54j
	zANYyzLTLyAFVhwgRRFGqF/RLs8NAsDDhliG5FWNAjbF6I2HwA761qwOtD/qXBUSHeaVWgwgpbr
	Z10cHJuSSqreO4Fm9tmBnyLmf3D1t4YVKPWxbmgjvhrJp16F844iuo0CAw7apjUXqdwtJEJHUIs
	wvkTw8LzDudaJhf+BdU9xrgKK4WuLUam2k8RunK05zGjurz33MEe/BssdFz08OLG+mBF/tvh1To
	LEr+FPpQ18OuJ2AKi505rSjpeVr7wNYYPkmho7okoJjRfGw7S7/SgrJwZimOBb8kusCqkfG4RWK
	/CJjnQ9mSVqlmGkJwRSYRYbrYdRtDsq7carb4iHKVEqBXzAA1BFnoYs0I2OfPiRRfRQ==
X-Received: by 2002:ac8:7c49:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4f4abde36bemr115663931cf.10.1766396598099;
        Mon, 22 Dec 2025 01:43:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWEjq6Tt4UdxaYQznLhDZd0HwoWnAEDuVsJfSlwF5bhgr6WXMGypxWePXMaLpyymFWQ8ptQw==
X-Received: by 2002:ac8:7c49:0:b0:4ed:b409:ca27 with SMTP id d75a77b69052e-4f4abde36bemr115663781cf.10.1766396597726;
        Mon, 22 Dec 2025 01:43:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c0esm9803980a12.20.2025.12.22.01.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:43:17 -0800 (PST)
Message-ID: <1b40552e-b292-4207-b7eb-9f50e37fd7e4@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:43:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: devices: Add Qualcomm SCM storage driver
To: Junhao Xie <bigfoot@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
 <b14c51a0-7e87-4eb2-ae52-caf90f1bf545@oss.qualcomm.com>
 <4AB2F6CA8EF1ED90+cd685c52-a4c2-492d-9445-b081d4d857f7@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4AB2F6CA8EF1ED90+cd685c52-a4c2-492d-9445-b081d4d857f7@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4NyBTYWx0ZWRfX9oO/52b+8jBm
 /5f4IJPDsBxtfvpHdV7CmGLnD2TPDomHIZxNzmpqaroiMAhqSsgC25cI25lewNdrxff4+w4SM9h
 DN3u4ZATnhlL7H93nrutSLfo8SHNeehOI/Pa5/MjzGW3rDU5MskO4hBcaAlG9+AueDm99J4gGPu
 XTpvcWSlSNWlpqxej++Sf9edJSvSzX1tlWbykdl38Bw6u3wz0Lt0Xk8tEfLkyKt2+2ghcixQXAe
 hHo1A7LSLIcPDGDYtUJT3QQX9QKeXD8T9Y4XZBUoiyUizRvvMs0QVhWMg+G6/wAM2XmL3npWqpb
 /pFeUdjl+zrqN5fmGGas5s3DjYNUaQ/0kc51Qjvasp9vO+kds5L/eFdHW5SQfblZyHwiIvcbvEC
 2Rq2UTmdSOSHs/3dEXjdOh4lp82qL8DCaVc74gRPKdumORjkv1X4iPN+NG0JNMLpftne2nHQcLm
 jC6hhgirsb1AkFw7uUg==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=694912b7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ksxQWNrZAAAA:8 a=pYEcKcru8prnKPtxzWcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: bCQToAjeTKxdtDg33jKGTFpFdw3IuSlb
X-Proofpoint-GUID: bCQToAjeTKxdtDg33jKGTFpFdw3IuSlb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220087

On 12/19/25 6:12 PM, Junhao Xie wrote:
> On 2025/12/19 20:05, Konrad Dybcio wrote:
>> On 12/18/25 7:02 PM, Junhao Xie wrote:
>>> Add MTD driver for accessing storage devices managed by Qualcomm's
>>> TrustZone firmware. On some platforms, BIOS/firmware storage (typically
>>> SPI NOR flash) is not directly accessible from the non-secure world and
>>> all operations must go through SCM (Secure Channel Manager) calls.
>>>
>>> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
>>> Tested-by: Xilin Wu <sophon@radxa.com>
>>> ---

[...]

>>> +	host->buffer_size = SZ_256K;
>> Should this just be = host->info->page_size?
> 
> The value of page_size is smaller than what we want for
> buffering SCM transfers. The buffer is intended for batching
> larger operations, so a larger fixed size is used here.
> 
> struct qcom_scm_storage_info:
>   total_blocks = 8192
>   block_size = 4096
>   page_size = 256
>   num_physical = 0
>   manufacturer_id = 0
>   serial_num = 1663215
>   fw_version = 
>   memory_type = NOR

I don't see how the big buffer is any useful TBF - you read into this
buffer before outputting to *buf and copy data from *buf into the
host_buffer instead of writing straight from the former. If anything,
that's an unnecessary copy.

Konrad

