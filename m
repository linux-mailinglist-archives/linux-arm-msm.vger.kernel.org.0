Return-Path: <linux-arm-msm+bounces-79007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 399B9C0FDE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 19:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AD5219A6C70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 18:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820D2310627;
	Mon, 27 Oct 2025 18:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lg+/QOYY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB01A2D6E64
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588816; cv=none; b=NbIrzvJW5COOHMiPvFusqyuMBoMbfF2E1pCd9seiEn0tFizjBASLWLzhHx3vk44lC/0C1Zstv1EROYeYtShC5iJzcC0ciY8iwQUV8dwb4QIJ6EMIjg93MzI89Xa6abn4YG/zS4b4cy43a6AFEFmSEmk6v98BGXQ+Vmp8di2vI9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588816; c=relaxed/simple;
	bh=zxGk1h01huWxa6FzZ1pcP/kLDzUsHGnoR1GDMxYJs9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8EDiuNc1iuPcSakga3Ji7g5AprqYYVzULijTl5TG1+7Pel63bkX5W5w14ZYPPG3lWLRwOfx6esBPze5j3blmElbfjjcve3qyCFlZbrfmwyysysK1Ljr8H43vzFUHtQ+IaZCGHURftnlr72iyxQaeOC+sLHNyy75/Skh5eEbidQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lg+/QOYY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RCTlDM2752101
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ko7xtFW+5pu3NdSbzBTPvaaqBJRyQJS4Sth4kjrm0Bc=; b=Lg+/QOYYW0/kbwjh
	ZIBxTQEdQgKw4Y8dQgAuEJC2xS2KHOCSq+fIgy/23g97tiS2Q0Epr7uYqq2Awrk2
	duqYHYkEy1pz33wqd4/gQmNZC/TBbiARZ/ymLmynrVKm8HByVYJC8kxTvyhQUQda
	aHKFTOBWgERdowZd+8HRHnwnXD9vyRtbKAeU5AfVmu/QMzGOy/PgShBqsRMicCJG
	KKmEYCv9t0o4qXawgb8YYLBJWzmF89+8Dksgf5shHR4LwIQFx8ILYSNQ+RKy7ivo
	+5Z22l8Oh31wqp9tXkmwFSKjfcap0KrnxbWN7ghyvih8cjbGoRF7uWAak7pppxY3
	LL6msw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28swh65p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 18:13:33 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290c9724deeso43461305ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 11:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588813; x=1762193613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ko7xtFW+5pu3NdSbzBTPvaaqBJRyQJS4Sth4kjrm0Bc=;
        b=ptAPQ4Z5dv96Ck/I+RShyFHJdpAsvuKnijBhrfjrtxqIMirhFvgN0V37MJ/SfC4T7B
         0BahLDegJ+03ghlyN3au/pAE0udrK9Jzq9Bw9HPWWMh9xiapQpx+cVRbitLUFWRcUVKO
         HO2BU608h86i47I2XtUUDzKiRAicTCvP6upKspIKawULrgFD9bRwMlB95NP/otLxv50U
         MA6clLR5xcZONcCHxA/c2oIc2ohYmM6Tf533DpjREvah0wLhWaeykYmsKCu9Ru0RLNei
         bphoahaVwdGzEWmFVIPPvcapBlJz25nmgCJ6xs3yRtEosNZwEfDP/4h67z+EnjQAsRvj
         oU6A==
X-Forwarded-Encrypted: i=1; AJvYcCVItDumwpwm4vAMUlAkwyF8QLPi+/ynrWd6X3XQwkn8rgFc9eEMSgcHraRIMyjHpg3RlY8OU0QbhBuMWIES@vger.kernel.org
X-Gm-Message-State: AOJu0YwH8ZNJuyP7KzvlWyWn59hTFBr5fHGXfxK9+hozAsSV3VWMTOLl
	aFTnO8B46eHtGDWRx69uTdHJwJk8+XZ3LcVuNjfPH19NMrfVSmAf/pEgj5AH/OoAjf3gKBrRcMk
	Lbw9FlBXNSuyqNt2E4X7nwQ3rMKeBmpvMGET0tLD0Kda63pYeWgQX4DKPJ7ALJbbqKY5F
X-Gm-Gg: ASbGncsX8dIANrM38eRcQS19tev5NHqTBfOpXYgMFWJ3wCsa+XKCjO0ZDoLx3tdm6iB
	p3tU3rfzskETyY4eHwQFLqKop3VkTwTHKtc3cIzsY4oQhEFJH9ZU/KETRXiklFtCI4lbPmlxsJ+
	R/BEoY3Okm8FwnqGb8EbHNKSTz21U0ctqEKGhSlSgfbzbLPxeEAZjoU+YLKj+Y6OdNoU33q4lgo
	fOc+XSt6e6gptPueg94QdOfPSnJ35rhaoxJFTqgz9JQYi+5Xv3ajqKzCzOwGsJI+rqYFdIjL+YZ
	JY1b7FUyxDxQ0d4WUzp9tpI2KfPUQyoVzm9u1JFttH03du0gezXbYocy33dCZ7wUXNZTc22itC0
	ZWdDcmPc/QnVK/sB0HcjuzQQerO0dKvWLom8yUxhE1iW1YrwZ4RHL
X-Received: by 2002:a17:903:32c9:b0:267:44e6:11b3 with SMTP id d9443c01a7336-294cb500981mr8751535ad.45.1761588812682;
        Mon, 27 Oct 2025 11:13:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBQV0mYg4+c3tpqKP9z33om+xk/9GUbHFLZ9sN5sNWQFbeJeCJmv0IvSmn4u6LKqxZJyDtZA==
X-Received: by 2002:a17:903:32c9:b0:267:44e6:11b3 with SMTP id d9443c01a7336-294cb500981mr8751075ad.45.1761588812192;
        Mon, 27 Oct 2025 11:13:32 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d4288asm91070335ad.84.2025.10.27.11.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 11:13:31 -0700 (PDT)
Message-ID: <84d952ce-560e-414c-a497-b8331e944539@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 12:13:30 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: rename constant for clarity
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251022141606.3740470-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: S5oPIRkpX6zIl-B74eGb1WXYgLWuw9JA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE2OSBTYWx0ZWRfX7SzGkXzCeT/l
 YrI+7sUhgVHJ+l8emUgIZxSqm8tK5skVCIEd4R7ln0dAE5C3whtWuAelPV5f02paln3H2u412v8
 pItkvSw7s0ruy7QItvg2UO1QgHz0bmIPc68a9OHNehKXfrONSGL2VgdoLzFe6hQ8gQXeyh6nmPR
 1GDuF74N7JLpDSCsiPRULNbtPwyai7ni+h3F5DKAHZa4lDSq7eDdhIjzAyh7qgjA+tGpz3Mh2Ss
 WmF1VWhH+KUlAS1SyBNcvaJxQeXuZ5UTduNWdAGXnze7zWs1nfPsPFX79Gt+2DxfU6+pa/CcKB9
 wmEUfUA911CwfR1ktJuKeck0G93rI2ivDFY3EIky+zxGyqUTckkuyfbma9K8Y/OibKIPI/S6UDh
 L2/nc4QnXe9zAzz/+WKSZKCC/DLDdA==
X-Proofpoint-GUID: S5oPIRkpX6zIl-B74eGb1WXYgLWuw9JA
X-Authority-Analysis: v=2.4 cv=fL40HJae c=1 sm=1 tr=0 ts=68ffb64d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f2z2pkWm2ht2ZSlzglkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270169

On 10/22/2025 8:16 AM, Youssef Samir wrote:
> From: Troy Hanson <thanson@qti.qualcomm.com>
> 
> QAIC_MANAGE_EXT_MSG_LENGTH is ambiguous and has been confused with
> QAIC_MANAGE_MAX_MSG_LENGTH. Rename it to clarify it's a wire length.
> 
> Signed-off-by: Troy Hanson <thanson@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

