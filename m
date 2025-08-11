Return-Path: <linux-arm-msm+bounces-68324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF09FB205B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE5807AC06C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790C6219A9B;
	Mon, 11 Aug 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqLnyDLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD302264C7
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908597; cv=none; b=Xrqe2SYVt1k4dIADu57ZWXR1Z6MucFmjh/NqVdvaC4NnNMUMYMFSa98znsk1NadZaX11dGrfuLzsunonI0cavYCUb8N8JLY0eP6s8R+al72ZbZ0kfOpDlOJoHgruPTTl8LXF6rpbghXakLJEuRhBxMo+RiudkM28ZXF3uCqWePE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908597; c=relaxed/simple;
	bh=wsPL+6gIeIwozdGOg2zkCWC1N7aKS9aXDDnDAwnCyWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gOmpJNxHm8Go8evrBnaCCNY4Qv9fw1gF6jS66CU/hNxJ1ecvl1TsffhqaIPTow4ZOI5Wg1bL51tgfTrBRmZvQbwuYZP7wLUKRGbmbFGSzzhLh8WBhdm/oAvdLCAWCl1b8Ao+kWALCgq0n+N/2ID3uxMogztKjEIoRmvRmmjMWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqLnyDLa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dB2u019150
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXMlWa5HL3QmwtlgJpH4Z3z739VIBK+LB8Zp4WNnwz4=; b=lqLnyDLaYQjLcnWe
	FyypZAxHsbY4Q+RIXBSk08vROgb/WoJJDdDYYBKV+dTXu15FHAOeG42gyO3EeRef
	LG1VDqLoyW9+8XY7J5WcpnLgA3VuKkNEFT59RbLxyB9jr+jiQCYpeX5bAMQkfuli
	5dxDBeKzSKOwut4SYvw9UC6K20AeEezUJz24KnnrDQDvS2t97Tfp445Yljp7vv4S
	MDNySFQXeij4UBGKwgCpJ9yptJdl2jigB5kEe+7dUsvDKdZDdN+eYPx8GhXGs4wz
	d4A1V1MKL20NR2VuKmGIskYLCX5w7C4cUtNc/Jn3qcPvGVckxPXEmeN/LaxSyDjs
	dYzR6w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv0tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:36:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e854f77629so5434085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908594; x=1755513394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXMlWa5HL3QmwtlgJpH4Z3z739VIBK+LB8Zp4WNnwz4=;
        b=vgCnSRHSZf7V7dx2eyJW0KxLeSTCwD2yVUe82me4LsHysJE4ZnbCfoxmFd9CcUPu7l
         wWKasYhMtlhggL5xuP67Mbs+Csjf3YOzt+d2bZ9Y0RI9uNaSvGF9m3CBGfO2Zz8PM+GO
         Ha0KDJPrAf6P+VAZQLJwSo89tXXAoTHgJ3dn12bR6yLi84QdjJx3F1nfugykkS1MozlG
         8uIKSyJu8cmOie6oIVRkTzFKSKIPfDGoaRgsQC0buaZZLG6BurN0+4O7gHl9VnsIX5KI
         rPoLkzFGYtty1IRkqz7qNsQISIYwCO0s0xw9IEIrKeIySnF3pLFtO4236aJwmeWr0AY0
         Nc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrhQXd+GErlssBOP7BixjMSMlS8t6WKt2uyEqKTd0rUCX/mEVu8hsETWdCkYtwlVvJpVqm/OFTyLDWhRvR@vger.kernel.org
X-Gm-Message-State: AOJu0YxqOGjHDyYs+d4nydXMj/+HDrzNk1Qj9ORvgW0dHJJxqHspf55J
	Ihi60HlTx9b5bhbO8lWtGMiUoNSoVr+xlIE6J9LCrh8aZs9ydRxxwjRBS6aV8DFv//2WyB0D1Vz
	piUrsuRz3ufck/PsIZ5gw8OVQbgFXtxqmzdUUawGwA5S3VDuKYUO1gCATh6QZVhl9S5Ix
X-Gm-Gg: ASbGnctzvrObyozxqbNgaHe5QkIkiSsy8GmmM+ClpW/9nEDzdBAdiJQlponVAt4sGvx
	o4luYE1vLRYvjd1d9WyCc5ZOLtHuPE46ovtcgsY+k5Jpa+j+mjhE5/zYFHa3JddIrKXlowz72+C
	eKNvGQ/Xz1RYDGHDRj+WAL64YO2oVuLtp9Iut0f2CFQkWEc7APk9Y4afK2qxd1tjq+lHq21m7iU
	KThHPAQyELJLN0hEQtn3VrPkG40tSRLsg7NCQIWl6T7IbCUlwK+1FLSmajrrqBgFVIRzszAnZwm
	yDlYW6aYif8lv8//MkI1XDpghHojcHhXJvOBOmclTTa58aNZE/avzIuJCopMlxIUYMEeqFiQ8RN
	gMybp4L5NW44Z9eF84A==
X-Received: by 2002:a05:622a:52:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b0becffb44mr51535741cf.8.1754908593885;
        Mon, 11 Aug 2025 03:36:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEofb0nG3bNmj1Nbdu+0B+tsQeV+xQK2a0YZ0/dVDJLm8BgaWfm52BhC7cv0p80m5kMtNIO5A==
X-Received: by 2002:a05:622a:52:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-4b0becffb44mr51535581cf.8.1754908593423;
        Mon, 11 Aug 2025 03:36:33 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af985e63730sm1174315166b.67.2025.08.11.03.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:36:32 -0700 (PDT)
Message-ID: <388af03e-a9b8-47dd-876d-104d9c549957@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:36:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: nand: qpic_common: use {cmd,data}_sgl_nitems for
 sg_init_table()
To: Gabor Juhos <j4g8y7@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250811-qpic_common-sgl-nitems-v1-1-a71b5ece54ab@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-qpic_common-sgl-nitems-v1-1-a71b5ece54ab@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899c7b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3CxiO8553sRBInyl-lUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Gpl3YySXMqBJiXruQm6XvwGDZ0z1HdFe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX4zhhBLC1RZ8I
 dcmnr/eHPr2TZGPM6gR97VD/5qDvcdNF1B87XxSUbyjiDnVrL/T6mbxfJIA7vJCbyn22ABJuHjC
 0sGc7LMIiGDzjo8t5Wxil9BfY7imrTWuNELOmvdhbDieWb/SSvB1iFOFMJQff6UH+JD6x1hVsGQ
 ytdXsYyxwz8BGinJpRzLfqYWeMTFVBzjMjpO9B5XtyrLUhXmbWQ9NJeCFWviNSinmFIgyBqudYd
 3OO/ry6ghf0y1oaDD896RQe6aeRTzPv/tg/puOd/J9S97BOR58zliDxK3i00fW5AIdJr4m8ufSX
 FPel8ETjE860WInfzOZ839HPwjx9cVE9F6UHurbq9gic4hK6LnMiWnCrL7pUOj4Rpe5gaRI8yKm
 +eiBpBYv
X-Proofpoint-GUID: Gpl3YySXMqBJiXruQm6XvwGDZ0z1HdFe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On 8/11/25 10:30 AM, Gabor Juhos wrote:
> Since commit ddaad4ad774d ("mtd: nand: qpic_common: prevent out of
> bounds access of BAM arrays"), the {cmd,data}_sgl_nitems members in
> the 'bam_transaction' structure are containing the number of elements
> in the cmd/data scatter-gather lists.
> 
> Change the qcom_clear_bam_transaction() function to use these numbers
> while reinitializing the sg lists instead of recomputing the number of
> elements to make it less error prone.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

