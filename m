Return-Path: <linux-arm-msm+bounces-77942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E33BEF617
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 07:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1B0E9348816
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 05:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11532D027E;
	Mon, 20 Oct 2025 05:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AwvQAiHN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BC62D0618
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760939968; cv=none; b=NxO6ccnr2OtwDJJYm7vLR0P9O049DyZN+4piKS+WX287/WELfBmh4S+mCZx0xYj4n9UYByrwjEmhch55TkWxFOpYDjjbCZpwY0/ieVwuiakdwyc8B+xLhw7vtsdHnk7ikvTqN17U5p48tGKD9I8d+UT+yLJHVpBAikwSpg5MnDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760939968; c=relaxed/simple;
	bh=DfgQhDV2FB+r3jXdeQjlELojhkZCzkVAxCp7ukCYBp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ae7xSSpgbWnzWT7fv8HQpJ+qoTd9p1mDFUCvEPYfDD/DGWBCIhlVrkxKgFcKJ/ExTvV0d3GJHf5MSZc/faISD+KbnLZUikE/Oy/+SVRdVMgJtHqrhzmQdpKnGp8Zyyk1VJJG998cCv50COHAtcka9Z0bUXzTtuDAlyj2k4fCnjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AwvQAiHN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JLGwTK024364
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nM+18YfZG3eJcSFCMfzYrqy29nlqANkrqIV1DISydfs=; b=AwvQAiHNZfptJ/sS
	i5WDMuP2gRVCoBZ68zEz05L2Ju3az2ItKHRmAT6DUhiNLKy8s8ozHmuBu8Kz9ULM
	eWNZgonQhV+lfmHKBPfDj5xeYC+GMPa0DpRsnba3F3U2YJQS2J6HRTvOb237+m72
	xQNCGieEZs+l5Bx58+CB37AkYupNbQLU0pB1yJ0kF9GTWwWs6QFjNEIdk8fxxG8s
	PSeBCIDMqhmWo8KbJx7ayULn/eurVcduffgVD5Rz/MeseGjoQT+7BCLsBtGMefND
	M7EPR0uxZd/Lh94X7BLvG8Sgw205tdyhip21CZYDrW9OrIItFDnAod1MQ5q6UpYJ
	8NvWHA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v0kfc0bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:59:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7811a602576so6267788b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 22:59:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760939965; x=1761544765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nM+18YfZG3eJcSFCMfzYrqy29nlqANkrqIV1DISydfs=;
        b=PKwQhXDCtYTgjhRNd7BNN7l65BvKo5fOPLl6oTR86AJM88UUhx2mpXzpJnWmga6DhP
         1L2KZUCoyNLKEFb+gckc3oDoBFfO+CkfF34a/+uABm66+kKMgh2b/h+WWOeCi9p5XxUN
         b65AQoSA/M1L0XefrTwXgJNhRePOARJ+O4lpAcZ7NKkQWQC62VyXIk9jwiRQ+ArwDisP
         xv+XAcZ+TdB8CkbEm74cojQUbuIKfZcLl52DqjckY6ah3HTjUEwmlScjrQrL470DTBMB
         LmfQoPXnH0KxubY/jZUE/hbLaSjSqcpP2+Tg/E/VJPMcS3KhzXrAshDr9Ky0VSsd1mPJ
         NT7w==
X-Forwarded-Encrypted: i=1; AJvYcCUYLBRncvM1cW2E5/YsImIhfkRo+TOMwcQe8PUbM1HUhNptgLwVSSUMgLIeTrS1OO8JR6QuFTjZv35IyzAR@vger.kernel.org
X-Gm-Message-State: AOJu0YwcuZi/LEh8gLsQOW4/oFYoND1irn6DtlfKUj1baEzVNga0/qsD
	5lcvax3PvL4hOh/pipEbLKgOxF5Wiee9FzqlTGQFFiY6nHeOy0OIcb2AY14gEuN1XeeuzWCq7ng
	TC+b9wShSl6iLLBOWZ+CBAGLLTf3UtIjgL2L72DesMILPnZVNU5DxzTXHPvHhDYZKEcim
X-Gm-Gg: ASbGncvQyFdhfoiM5D9OGQ9SCMou4GrCo0swqUys1FageOlGWulgqrral9HgiHrETVV
	K4qtQVZvdW21Vv3553yjDEGWc4du2p9/61uH026lihLRPqTKrVfXJwH9sXUS3h5Boj8pcgPI+3k
	tjUeqD+CMRkqt1l9LH85HAWCJPSKfCriouumJkf8f5eyXbrq3ouBo53mqt0UfMUVuOhgX8I3nHY
	c+5SAMqYiVqrYPjW5ZlYnpvIx9uv+R1++aivlWlHTgz0jRMfv0cejbamzgrSgtHzzyavNgdjpuH
	OfVo8HtxjqsCEU4OY9W4Q2gM/R9OTM9VhARb3TrVNfcVcNkmHm9uU07hiiXgq3mYogz3KfwW9wH
	EcNe7Z8eMu9DMSXzdYS46lD1QNhvGiszXJAGD2lJjPdiIFl6k80qPEz4G+0+yfTnTP0yh9Q==
X-Received: by 2002:a05:6a00:21c4:b0:772:45ee:9b9e with SMTP id d2e1a72fcca58-7a220aa8c36mr12648440b3a.9.1760939965338;
        Sun, 19 Oct 2025 22:59:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOnIQKmKM4/wBe+q3U4Vl91ebk6gizKnC7NhQP4NZOp+sNVTSvIrGb+vHkb3XE0F6V5ZNQSg==
X-Received: by 2002:a05:6a00:21c4:b0:772:45ee:9b9e with SMTP id d2e1a72fcca58-7a220aa8c36mr12648411b3a.9.1760939964922;
        Sun, 19 Oct 2025 22:59:24 -0700 (PDT)
Received: from [10.133.33.90] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff34ba6sm7240595b3a.18.2025.10.19.22.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 22:59:24 -0700 (PDT)
Message-ID: <bc9f58db-c0b2-4c97-8ae6-ee01a5bf49e7@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 13:59:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] media: qcom: camss: csid: Add support for CSID
 1080
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251014-add-support-for-camss-on-kaanapali-v2-0-f5745ba2dff9@oss.qualcomm.com>
 <20251014-add-support-for-camss-on-kaanapali-v2-5-f5745ba2dff9@oss.qualcomm.com>
 <f64bc46b-9c21-49a8-b5d8-3e21614b6695@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <f64bc46b-9c21-49a8-b5d8-3e21614b6695@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=E6LAZKdl c=1 sm=1 tr=0 ts=68f5cfbe cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=AXp2hmqOj5kKvFkYXygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: l-DwzwHSwbXC15G2LrtB5ZjjITenK7-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMiBTYWx0ZWRfXyYnPZa55C7df
 Gcf8N9AUkGhP7nVZgT+kM2lPdGf5UTpjYrDvtX8G8/oOLU1vKKsp+GqfT3Jp+hmW621NjfjFlXT
 WrYz3xxAYQhClDO063gVH1dNs44+4kWupMviD0LcZDCg4wWYZAyhbAmcPvESySXTySaIHafv9Y3
 HNyDDmwWUPnOAv/2ImtIddOBTBjUobIgCIfGdi3Audf87oNPWvTvRUhDIvgNd5hDG/AFMdezTv3
 MNhZ6Nvq6GwaIS+dQwlJqu+GquRzKjUhpwqaPaq78f0Zyb1Vwkak2SyGn7ymcODlgn/xCuG4yK3
 UrvAD02Z+Jedw3dnHeg6k0WlvMAS6Wjd8rHefaVnu/nVq/TngQVJewZkx+HYqU53L/PFEZ5nS6y
 N9409Gd4knOJarAeVpJHk8TgW3vE/A==
X-Proofpoint-GUID: l-DwzwHSwbXC15G2LrtB5ZjjITenK7-F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180002

On 10/16/2025 5:12 PM, Bryan O'Donoghue wrote:
> On 15/10/2025 03:56, Hangxiang Ma wrote:
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++)
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>> +            writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>> +
>> +            if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + 
>> i)) {
>> +                /*
>> +                 * buf done and RUP IRQ have been moved to CSID from 
>> VFE.
>> +                 * Once CSID received buf done, need notify VFE of this
>> +                 * event and trigger VFE to handle buf done process.
>> +                 */
>> +                camss_buf_done(csid->camss, csid->id, i);
>> +            }
>> +        }
>> +
> A multi-liner like this should be
> 
> for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>      /* etc */
> }
> 
> in fact csid_reset_1080() does the right thing, please replicate.
> 
Ack. Thanks.

---
Hangxiang

