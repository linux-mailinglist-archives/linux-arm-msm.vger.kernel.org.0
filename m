Return-Path: <linux-arm-msm+bounces-75642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7048BAF9D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8055A189C774
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7F227F75F;
	Wed,  1 Oct 2025 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l2DiGUIq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4E0270553
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307272; cv=none; b=t9aEQ3JufjzLVm3DfJmGQftI6+Wk62XdgaZooGViKRVT3JIIJ3pQA8ziKRH/6qVtMMMJud5XXmYuNnPKWms/Ph+MckZ2jJd9PApUUOezvTzBUhNuA1X+FQTova4ubZ/3XTk2HvSEvrJNCPXYWUilYrRqWMSD7KzMFujiJEOVTIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307272; c=relaxed/simple;
	bh=eKDxOd/8infgGPrJNe1yhZvRW2gOa80XvT8nyZkZHoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGavl60Zf/uZXzBAQ0ZiTeqkyVihjvx2Ba1F9sn4jzmEx+LhDLnB88YGzeuJnk8Q2+d5tDubhpDBw2B11uYDdPdDSy2kHbNCRJ2YXbuMkTuHMNqNeSYVfWMO++zjYoRjMN8mgvkyAa3XpYe+ArgwrQRaSEOanAmuKBMku8Y9Z3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l2DiGUIq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917Ki5m020571
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 08:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRte5Fe52kG9pSHQFH/MbokFPbtdU+9oG1CqeyDC+9w=; b=l2DiGUIqY7SdY4wo
	uRnMahgndNelhmGeIXksnIzQmSDntX7sHyvleBhZkcvSWA9BAXdFfCxHIifmB5sn
	rAeKldqI43SZ81O8+sIiIxs2AF+rMzPkTMNnZqq7DwZaCwFvJT6U1x4GOqlX+frG
	wjrqeW5biyAYO+FBPNdbx8VQayJLiJ0Dne5J0WYm0L0V7xaI517n2sPAe5/il6LH
	n9YrpZxgkTtTkeAm16s54jNBj0kgDU79xIm2WHDC62kqKzRSbVcVlpMj37eb/UT1
	xym7Vtdt2bP3BNhbFGABKLnvPfHS6G3fshEKjbnp4pjH0n3gQGbKAQRzgqxbr+IP
	TiVJAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49gyu185bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:27:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e231785cc3so7112431cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307269; x=1759912069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sRte5Fe52kG9pSHQFH/MbokFPbtdU+9oG1CqeyDC+9w=;
        b=v8lHFtiv5IEXwp9HP8lmCa4pAqE0k8viC2xK4XF8wimUrMAYlA3wMdYKSenHG+ZURm
         8osDJEZNJxYqLVM7xr2KnuHyZ4lu2CKhTYo1nn1TqzujfFSDWV45UpFm7smyGKnAnEfu
         dnhfVqPF/gm58a8sxvWrat74plL+a0QOP7PKHsodAt6bEKTujodgyuNb2RLfo/P9GGZJ
         0o8xgxtuHAFT+KyjxLpyj+PIzngnX7cEnDe79LrsWBw8n4viSNDcm1KVdNdAip37XZj1
         9qmaDIwQICOj2Ola4O9Kov/yjCE0XoYrlyFIPFl/cHrEQl6/kew9amtn7a9NtUUKBL/H
         JdFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcOwlUyliUhoUt1k2TDYTVjfVJdTBZot65tdcUUVF0aMZy+sjAibassL/lysPp0N5e08It1dSV/OimmX4l@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmhhIrKECJ80YjDPT21N/K/smm38MLmHR0SA0Q/nwOsq1Rxqc
	0xFq0G5D4AO8PbQy2zP8MKNJObeu+34nX19dlJLLcEJ82jU5R8mWgacD8h+UVJfm6CnVB7iCYgW
	Zpg21wif8TcvEj67TB7ALmHoxmJEpfDWQK4H5a4cTMHwWjd45xQrWTLROKp2fCYDxE0Yz
X-Gm-Gg: ASbGncsrR4Sc6E0Jh7WSWQdl2/3YX6M/raKE6Zk3L4xH7HQMsteCj+J51c1qK/iuHpK
	+zDKb0bzvqLFGsCBB43x+iaGiWvEH9QLm+c0TRnABtRqtrdLYjHlBUJrKdcH/IosYeBv0HnBX6V
	dbXvIw61u8cx46CPquMPkvM6WxK1L3olKFamGDB8rTUtjH6kczI5ooPn3t9yIekZg5KNzPzGRYV
	EEfwmNskIsX5hNTf3lKFUey9sstMqYZtil873FUPEc73SApSnWRa3I35bhxb0GNCIeYZRV4AIGj
	bfXFIM+o+yu/vyvk261IKS5wb4fvsn61ax7I9TOT5WzzcTIQmAktGa8IUMbP1rfzqLjXoUco4jR
	ZBWCf2BrDQX3dYZiWz4FwwD79GGo=
X-Received: by 2002:ac8:5e0b:0:b0:4d9:ac87:1bdc with SMTP id d75a77b69052e-4e41c547752mr22283491cf.6.1759307269188;
        Wed, 01 Oct 2025 01:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGazXCpf23PMH4PrA3/BHdRst7lhfzNEub7Fo50BJ0w2oAO8PQN8uTngF/EvP3RGSn97sQEKQ==
X-Received: by 2002:ac8:5e0b:0:b0:4d9:ac87:1bdc with SMTP id d75a77b69052e-4e41c547752mr22283201cf.6.1759307268641;
        Wed, 01 Oct 2025 01:27:48 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3b4271dea9sm831995666b.88.2025.10.01.01.27.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:27:48 -0700 (PDT)
Message-ID: <7b1286e5-f685-43f9-a5ea-c82a3ea8a1c6@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:27:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: qcm6490-shift-otter: Add missing
 reserved-memory
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-3-7fe66f653900@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-otter-further-bringup-v1-3-7fe66f653900@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RfGdyltv c=1 sm=1 tr=0 ts=68dce606 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7Ovdx5uLAAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=Q9X1YL7jsAXwpJAzmCoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TQZWkJv5rNK5-PaLMsrg:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: PrbJCIxh-F7pjbZ9bm7aj-WFegwgZCmW
X-Proofpoint-GUID: PrbJCIxh-F7pjbZ9bm7aj-WFegwgZCmW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA1OCBTYWx0ZWRfX4nIYIHXIDgun
 oH1x1Rneksf1doe5OSpYOTvcQc60b+acj1kA5gTPt53dUltaT+drdxFrYNDTE8yU31o4//YufDP
 ZyaiHNc7EvGTvxRJ70isuNSYe8rVwpMr2O9AXW7Kq7yyvQBbii+KiRjB5Le6lkNGc9iAla2sUp3
 Fvcm079pPliUpFQkQowRHa376tfYKskPAB7roYQEXeaYQXX9Mh1WR9BUB+0KJLGWeGQxh0mdfS0
 S22SJdmtSmoj/JKfyrDHK9vC8xFWGt+g2jcM2POn7MyqZa9tkHtjoiXx0AlYqg8sCmjTMMPzxP0
 494yi4AILhMpM9YXXyA7cgmug1kzN7LsF0cR32mWGYmpA4/Ihxs7uHvX1ofhyNEeFUJDz2Vzy8L
 wTAbJYdKx+o3tN1R1/E30ESoWYnWWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510010058

On 9/30/25 4:32 PM, Luca Weiss wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> It seems we also need to reserve a region of 81 MiB called "removed_mem"
> otherwise we can easily hit memory errors with higher RAM usage.
> 
> Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

