Return-Path: <linux-arm-msm+bounces-83037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A01C7FE74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C1E12344CCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A08B261B96;
	Mon, 24 Nov 2025 10:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KG2wlsIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O2rxUjab"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61CF20125F
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980320; cv=none; b=U5ol5Lb4pKVzHhxES81vRdo8v7MpOrrJejehkg7AHEb1dJ4jWVH2KH5YjZDo5neShmpiQZVWutEpu7TFpZvwVL1Wt6wFJ8nj1cZuXO8V33K7oxsuNFHT2dv7mivC5voJvhYuPb6G5fd92RKmPRvCgs3UupUvc2I9XG1Bl6820B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980320; c=relaxed/simple;
	bh=vF+99ebNgbodzyWUGZQt78adMK8x96CiS/kZhTPfUfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtT6GNo0/TH0+qHqPmv5uBQNpvd/O89H5MZPMEctaSDOF/Gt/kLS4EUi/sle8it+Y1SbuFUdlQjijDb1vVlASClAPGTbmAuHjn7v4Ht43GWoJR/Plz9iO4SNWIx+pY3XUZoyeY9t7d4BZy/8uk+Wx8bm4a4kBrVI7x8+JKeD5nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KG2wlsIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O2rxUjab; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO83Kul2644308
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HG5j5Tg5pCke+Ka76jB3SOcWFfLSRkLz/WeVhtLnibo=; b=KG2wlsIf0QT9nS8t
	h3IATuh5XmnEWxe1vGOxh/J9Sg9XXj/gB8n6UXLY5MhnA4JMLqeM0+W0GoZLx0tu
	P+kefFopR9qVrttDsan3TjK3QC88gZ+LPvgqZid6ACAHoS+/GHIFfFLZqPadVsDk
	GtRwZHury5zKwLnKxgWcx/qX4Eon4YWOqo0WxhPr26b4sOCDJuhcyz3o7WlpXqGk
	UI23Us1KDZcKcshCEJss/U9x4K23cBJRRBe7mGGSP8DAnhZ7SRc2AC6na4yEZ9xq
	06AOvCzX4l8sUos9x8b8pLcRNs/kHXa6/NJKn9uwXXoak/mWW8HIQXmFL0+5Fmxj
	bUBX3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak691mnrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:31:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ede0bd2154so15460211cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763980317; x=1764585117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HG5j5Tg5pCke+Ka76jB3SOcWFfLSRkLz/WeVhtLnibo=;
        b=O2rxUjabVnjCAGngMVTH+ee0Uc6puyUApcwQWYqJffkiFSY97JxLKg4wwb+0ETLP0S
         nEgRdbtOiQXgbgTVZZ37QsrkiahvLy5Jd3UlxOGJNZrEgFs7yxEm2YCzf/U2TJRsx9Ly
         fdQ/l2r8jfYVajkDYDOpI9PoSSx7V7orMyg2BeRPWLHOBw+JjgF/3QzxYoiqU6fUQn+5
         RvpP63RApr71riUUFciUYBdZTDnbLHcPq0nrEsuZs6u/aD5R7XlxaWKDn+WRypyxhi3O
         GQa5VRUKqLrnnoUEgBWSBwkn6Q20UWWiEloQIOiuWnmbEDuxDykXpnLSfCZ0fJcxDnQ+
         /NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980317; x=1764585117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HG5j5Tg5pCke+Ka76jB3SOcWFfLSRkLz/WeVhtLnibo=;
        b=WYe8shOigY05F/epTzw+5eE/x63lSnXxbkToEammuXrq9q6F6mYwX2dVloAhRLrEuc
         2sG6IYpy9lcDjb5Jou05JjDnIjUcpP7aPWuJEE+f7ciz7GpOsPMEFC8dkP4rWwi+Oaeu
         j4o23ibIzAtm0M5bl6bnblDsGXUJcKdwrEdfXFnj3q0mhpIjsgT2tQL+P9f5L/2LHvks
         ERn/MU2GhsuHxa4+H9vpm3NnZAHM+hdM6djCyGuPTk1DQNm+SYYkLjFvT8spgPWiqz8F
         NLWIXhKZrlhtZ5B+aNzC4sEMWdq/t/W3bo3M8dwinKmHK3CF8171bVESIPJoyrZHHWQv
         Ov8w==
X-Gm-Message-State: AOJu0YyHN8BBfPpuwsFC1PxJf+jto81mBy0s811mtCdmJ5nPgYSeJn5b
	6pIY/hBBO2a6UiNp/i6LR0r5B217R46WD4PaMeSFVFkLJU0QtfD/ePRWMBS7crQCjF23LAbPj46
	sDRqmvd4XPFGCFKk8/acrp3QjD13PkT0sUcErNBOcelWvoLbKi68I/Ylv0yHNwtqFP6Dp
X-Gm-Gg: ASbGnctqjMNHaYVIeMELChgWpKcqiVOmWQ7SsH0r4ZnHErCxztXZe8ws2DANW7V9gN5
	kfjTWE8ldQWwRBKeBtfemE9Zb4zBxma7G61CE5ZB5JT2rcDSK7sgX7sQ4XSeP+T05d6CEh0uNwg
	Fn5ny4mMya6UZn7V2yjcSnq9/DXwdQ7HjhHbREllxyah6UBqz7YcNPb2w8ub/4eNJ9I1JkWqaAr
	JP/3/G9LWtlxREHX57Y9YcCsHxFLsjY4vwOoeFfMdcb7MheDt7bYa00/hpQmKLuC4XeJuEVH1jp
	KeWrNt90JmYv6pHGElQ/GJxCaTdwVGb8GgSYCDWVm3O5Wq7UeJaAb6SyIamxdGcDhLgiyAj2qVs
	93jKAGh6EYCJj8BcPZXDavtCQ2WH5byyazCJEMz59u+olbsFeyHjf8hqHtQIXJG5ZVF4=
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr115382861cf.2.1763980317005;
        Mon, 24 Nov 2025 02:31:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtt5neVVY+2Mtpc3Qp6jDILzNrh/ytlyxhMEtz/t4TIiH7ApPEzOABpUVHFBh6gdGC615ltA==
X-Received: by 2002:a05:622a:c3:b0:4ee:2580:9bc5 with SMTP id d75a77b69052e-4ee5883ae04mr115382641cf.2.1763980316523;
        Mon, 24 Nov 2025 02:31:56 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645364437b2sm11498837a12.25.2025.11.24.02.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:31:55 -0800 (PST)
Message-ID: <a6b824d8-9299-475f-bedf-c75d0912e538@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 11:31:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] ARM: dts: qcom: msm8960: expressatt: Add
 Accelerometer
To: guptarud@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
 <20251122-expressatt_nfc_accel_magn_light-v3-5-78d198632360@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251122-expressatt_nfc_accel_magn_light-v3-5-78d198632360@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Be3VE7t2 c=1 sm=1 tr=0 ts=6924341d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=HeSRM4ZExxmZ1UROd4UA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: kYHUzMQni5xSZvtB1FRSvb8vQY_ApfpQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MyBTYWx0ZWRfX+CKtzn0nptjT
 cr7YARPM9ud9ezN4BtP0kZboGrcAaLGlrXjhWAj7dD5QMqmaZo2q7j8zKac61eArT8bhMtZD6vJ
 feyEU+LwIfWQY5IEiYPlRjM1WM3DJuNFmcSEmtTs7L5Anb0znnklPQdkJFbSyRjXoIaBTpuCfRQ
 IxoXCE8IUIA0TmzlcU/K/+Hp0YmM/qHOc2yXssrwUNw04tcG1jzGG00F5mYeMWhb2cktzh4+6g0
 LA8h6vsMYfMywVryorjPihrRfhu6FHlqKRKGCnDno2B2QINV6UxSyRjND/JS/Ze+rPdf4uXLUXB
 OsnmWQ3lslXmcaFZnrxZfbxjAjXWbHisi9RSi0ckOG4q30LYRDl5mm/DiC0cK3C0bz8vuMt/GBN
 cF89d9EVSVXQTqw9GU4fKaAwmPO/tw==
X-Proofpoint-GUID: kYHUzMQni5xSZvtB1FRSvb8vQY_ApfpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511240093

On 11/23/25 7:44 AM, Rudraksha Gupta via B4 Relay wrote:
> From: Rudraksha Gupta <guptarud@gmail.com>
> 
> Add the Bosch Accelerometer.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---

I'm assuming this essentially means "the default settings (no
mount matrix) work out fine"

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

