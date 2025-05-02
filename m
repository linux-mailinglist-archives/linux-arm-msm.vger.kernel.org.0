Return-Path: <linux-arm-msm+bounces-56532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D704BAA76A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 18:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8088F4C7DAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 16:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67C125D544;
	Fri,  2 May 2025 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5azY2Vr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4205B25CC5D
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 16:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746201774; cv=none; b=rJrQbAhHcnIu6/UEY1ig3R0sPp77Se0S0pUSTfa4emZbf/d8oug63sSpPJYyt9r8WuVVPSV+LJ4YGD+76yyTPmXIGsVjExyIZ80Ok/OdMq8O36PGUiFp1BTLE7UMlFPRaoK8ye1mkeSpy/BJOWM0ni3nLK5zxnmMl8OEAXTwlPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746201774; c=relaxed/simple;
	bh=nt7pCl0xKFuZMbcsKuarhpz0f9X8gk1jA/yLJS6JUcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H3jmVNoU/Df0tiRJWleIg7Uhj3x3ilD/hmpIO2vqqh+5qyhM5T2RIsWqcDtfbQRcjmlEFshpH7K9DX3Y9WIRjeXH/XXmT4HQqvChBZWR+oMApHLeJj/4GvaBQzhNUz3tGq1AKGN65CvIGNhSYYxITTFJ4cdVUJ/HZf/zUNC9y3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5azY2Vr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542DdodZ009018
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 16:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1frcGzb8hC2GYxGmVc0gjbhl3/lGMlADlvPYUqYXl2s=; b=B5azY2VrKcqp2fDH
	NNgpg0OO9B5W60hqqzqsEwm63kQBYjYPSdS+o7RSFap1rpNms/7emM4fRpIuqACG
	K1vA/G/mavbFcnsWm+vPe2fW387ntQCIKnwZ1yRkXphMgqInW3t0O0eLC+7Z9cy7
	uKzxSMRF1ZAkMvuN1mL4C35QTScS20khcdabXIHw0UvUduo3FvG21uk3ax2earkR
	kx+QaMoSQFt9hgrdSBCCit3G7kahqOKWSzW0Jyp4OIcvi68ssphPqPq5Rl5GHjyW
	UnZ5b/hW9YvmYn8I+NROs9bxTZZT7P1vYjsW8nEasQ2oFfCjC/SJxEy9V81CpAoc
	TGERRQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubrufn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 16:02:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b1442e039eeso1407364a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 09:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746201770; x=1746806570;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1frcGzb8hC2GYxGmVc0gjbhl3/lGMlADlvPYUqYXl2s=;
        b=GE7SWu/4QOr1beXBuiN2PgsICJoEd06nN4xTuelNNcZu5thOxbVHJVr8dm8ZeNzJPB
         UNLQS1qSM8iaxbiRQ+vB+2CZlb4f18ZZ6FFWtMCL9FWikm63bnMAi3XFHgVc+URnwvkr
         K9Xz26nTHCvp0eKIJgc+h97JVH+zvTa+IgItxE7Cnfui9bzLpaiwjq2vgw+4fIaYmfuz
         PbAtZrMJs+2OO2azWXUL45wps87HXg+hkfb6AQPpoxGIyGZG4+0f5cYm7sk+tVYXdaAo
         0b/2lwoz8tuiWE/gdRsX6OTRCQu7GfkKSBIMOIPXwRNK3HKqkGLxJtjyohk/5oAcaWoc
         j8tA==
X-Gm-Message-State: AOJu0YwTUkf6PKrz9l8laO4Wzbuyvc+zZi3+YIRJAc9D1ThfZSZH/akS
	SviOpmtlWcCHE0kPsXIxLgNzYwzyC5UljZQPtGpj8GdGAtU7htqnYn4pI8GVF2x5wUX04QEZXuN
	Szu4aPHKTQXJrbnzvAf9sY4mWLAZUeMo1Fj/mXiLWv4p5wL0GbINxXfR7d8DvQTFP
X-Gm-Gg: ASbGncvJjs26Bhcw324YskqTpKNJOutCcUYeeQBhZX4b5uwPrbgGxDGFy8cQyqixIUr
	iHv2rsjCWSCf+ZNOQYwnshtMgOJOnCV1ruWdBVvlfKBm/M8jialgtJOzTpfwPsBswKdkDDskIbH
	3pv+RC96cUueLsckWnjNWJEn/OeBsgD/qAOgXzS24VR9s8MyeZlN+nvifujm1z06YRmmgItYmpd
	svR+XGOt3occFMMo35+M1epoLh9w7QTIswP8hzlB8XOgrWzU497ZUL1OGPNc7Xd/L0ZBPp/68ja
	XqGBNGhV/H/mDfHpfc3d0KkX19KbiTsH3v9Q9qMAhYim8P8jeGuB
X-Received: by 2002:a05:6a20:6f90:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-20cde952d6cmr4451430637.10.1746201770555;
        Fri, 02 May 2025 09:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+5DGedS7lQxaiS0zztOhBE3vSAm0Y8qu2C3qMH794u9G4iH73tZO1pQYXwyOinkWDLCtVwQ==
X-Received: by 2002:a05:6a20:6f90:b0:1f5:95a7:8159 with SMTP id adf61e73a8af0-20cde952d6cmr4451382637.10.1746201770057;
        Fri, 02 May 2025 09:02:50 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920e67sm952740a12.7.2025.05.02.09.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:02:49 -0700 (PDT)
Message-ID: <41f0eb29-931d-4aad-ab8a-1cc725e9d30a@oss.qualcomm.com>
Date: Fri, 2 May 2025 21:32:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <ac8837b8-3964-40ec-84a6-e25aa06dda39@kernel.org>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <ac8837b8-3964-40ec-84a6-e25aa06dda39@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 74NicHBiGG_eJ1_Q46_QT6bASAPbRC7z
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6814ecab cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KK8y6wEurEKhoEb90x8A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEyOCBTYWx0ZWRfX2yHd4idN6ujh YFypMaaX9PhrZDJzhzFUenepHAitvNst88IARoE/Q0fHHiG+OfTzYF0rC03bd4kA7MN7FlGfXRj 9bivGKoi7hNvRxSCQN16U6YQ+Gocms8J21CPt1HP97RT9JgE0Wv+d3eYgRfISwIRveRha0G2c9U
 yEp0q4s5a/8232qvzJfA7MN2QYNdCJ/RdeQzkSFPcVssyc9OYfMKE97jvG0Rda2nWnUssZKERU4 ULkSTTGo+qFZkgD767dgEevb6Fx015KiwcFBBj14eGcgX9SmhlkrJ9VS32GE0niXw9Nx4D4s5p+ ssYUyCbRLROg2ei8rNo539QeffbTgaZKkGqm9+pV6DWJfKq+ASzGZGUC/r+9mLdJ4eqelCc3mil
 gEVWQdofCoGm9VWkQtTpPNceUkBK/LX0BNbzTRKqfyDJxGePAyEUuxsxYUfppnxw3M6HzbxG
X-Proofpoint-ORIG-GUID: 74NicHBiGG_eJ1_Q46_QT6bASAPbRC7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=928
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020128


On 5/2/2025 7:03 PM, Krzysztof Kozlowski wrote:
> On 02/05/2025 15:17, Kathiravan Thirumoorthy wrote:
>>   
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>> +					const struct qcom_wdt_match_data *data)
>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
> And how are you handling proper probe ordering? Use phandles and define
> this as an ABI.


Sure, I will follow the Konrad's suggestion.


> Best regards,
> Krzysztof

