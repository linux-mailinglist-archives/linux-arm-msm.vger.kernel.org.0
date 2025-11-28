Return-Path: <linux-arm-msm+bounces-83675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C717EC907EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 02:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66E443AB2D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 01:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD012367D3;
	Fri, 28 Nov 2025 01:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBa0k/qp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X0J/sGeS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988BB231A21
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 01:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764293033; cv=none; b=rDCRQf1KdnegL6T0deeDYO91eONjjy537PAtkhHJ0myN7RN7U5RBXqfZRnBwDdUrMWeeU25aSE4xWlhDTxF0pP73iZaVZif3YnyA4TWOg4wnAh2odusDV5w7w/FVlOleHcGT1a+spzBkiwWGQrAMKkG9Mir+IaSswAVDEpjDGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764293033; c=relaxed/simple;
	bh=twye+QfZfag+vrI6y9Ba/tCvcSTVc9+22WmlIgKqKus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4HCbxPWak+eCa67XRkROO0BflcTxUCxhaN6xj2WiK/dL3R8qGbaEibE6XT/rlXT50YayYe4RIiiZb8KjYJlC+BaUZFg2RlOwpmZCSkO9k7CSky0YcwpOcHSbN5AjBz0IWFeChrzboQpvgRnCUuytvFdhKrBRYLFBx0JzpY+pi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBa0k/qp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X0J/sGeS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ARA3vF8849004
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 01:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hmL3vwovlViVN4dHQxn3Hd/nWl03hFC5pYBgveIdCCo=; b=XBa0k/qpaBHIz6ZQ
	eU/h56DT1IW0bmr//DCSeqBY8m0lNK+EwxPG0OXbhpT1oiWI4b5gQcOaV0YuLXTf
	BMvU9vUwNfL8SPqBtQMP2+wydBqjQ3rrN4hxRNE+fl5qjo51yN7yxz1OwXBITudA
	ZzLLDfawO9AqzYJRGs5OscgOVQidz7chFLNx+qx3ID1twK8Izs/SnsPgb9l4UZED
	FK9/fofpcqz1tfANB3sXdqfdP9b4WSedk4rJ2dkl9RV8cjVyyMcZeoqL8HCxr1JZ
	IPf4x7wP6hy4r8yHe8xp3bm0e+ZaS2mYYB61dFE1SpskaFLX/ZmF7+qeZfQA7cV/
	tRPr+Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apmjd9rb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 01:23:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-bddf8a4dd94so807306a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 17:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764293029; x=1764897829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmL3vwovlViVN4dHQxn3Hd/nWl03hFC5pYBgveIdCCo=;
        b=X0J/sGeSLc3A08ujR3GqJaH3bMRRWozcGPDX9zToF6mM7luf6IUwV+MX9YACiKMEgi
         yp77Da82XhM+xur6adRE0YfwTLOAboEMNP0vUawGpR/21dSWJTMDrbhiSuk+I+wzLXOY
         kLvW5CKQSptg+mbhyCYqZBb3rchsBzwYF09YH1cYRcmRJsqr5iGQpkk5bvSIIdJL/JZK
         OphbWwot7a0lHcXI5Vy+rph7W927/jlhl8WJjMZ/Otoa6YuFEYVdGyt379+EuODjAI1f
         dz3gXhKLCIY8nDsfxo3pu36DzcsPgqEfCI5YZcGuD3SLGZ7unooabAhHwSazTjNLg55r
         elKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764293029; x=1764897829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmL3vwovlViVN4dHQxn3Hd/nWl03hFC5pYBgveIdCCo=;
        b=DOzh/uzbBWD5aToQ73p0wq/+OTTk9OeiHqiGdP96bPd/LIkw0gsIOX7nipNtSDIM4k
         ucB9Bg6DB8NSUKsaiwZUwjlzCT4meUMjt/hcDMY5USfldizUQ36uDhpoCRUbn0T1YUgk
         +d+wjJ5eUQiQK/PLbOYlvEvDtwUva1XwJrkNKa810tdZ7DV/gsaK6Le9v5HuaZ+4rfqB
         3zF8N1h41rLOzKR7i7BC45+GwxWagWkorileH6Sf1aINwtCXJMnzTjIW9RTRLumKEYtn
         okP3SFvc0+AnK2x+KpZZFx4ajpbN9dRdFQyadSTk1eIGpDONygLW1sNX+SS/ITXbmZtj
         JLgQ==
X-Gm-Message-State: AOJu0YyuQ7nsG+ThQ7xeqbqPWePTTHfEcojgOnUMZlj+fJx9pQWN/NCR
	qr4ENfWbNbBm3DJPPBPN03qj1zGHQIhJYuzZ312JwHCo679ykpflNCh26ZTGIjE8xTyA9jE3mHu
	5cjrIuhaVzzpFcUHVqrr8NlInzwN0KYFWRUnuPQ2foN6VPKyfPn3Ui4BZ17GIOeSx1uAe
X-Gm-Gg: ASbGnctsxTkhU1lt6sM+qabGYOAA0gbFqxN8kP077sBosjNY5SAuRftJSZzvKpYVYYa
	ANrvDQkg6jQ7tQXymgIpKxDOLS2YexcFDBCNRRuPV3e0KsMVAiflilLNlAt+gPDlUXWsCAiOH+m
	XfnuL6yHGsvkZJpZyguIQxIo0W9Inf38mVvJpLGzgUBHOI5CvBhjTx5G+jOU7p2DIkUI6b4WqKj
	L5+rWiAR7JDY3BUyKI222VamM+PMuh//cJ0DGEJ58xSEwAx4RZ+hZ1MI5o2JXnHWDoPZOfMpzWm
	AjK6R+Q2A/CsE28y591bVpGXI1pE/c/BVH1KR0hDALoe7/w3MIBLn+GJ5AmCtXiDeVlHnL0htvn
	XQzvA3d8h3b4NZYBOwHA+bvJf2FNqMYmFdB5XWz7j
X-Received: by 2002:a05:6a20:6a22:b0:34f:66ca:60aa with SMTP id adf61e73a8af0-3614f227c6fmr28454513637.6.1764293028550;
        Thu, 27 Nov 2025 17:23:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE80IC/YEJViYv4MFVsWPrpBzM1Jex8EPRNgjGxgM5Kx1YW9b9R/gvWzX8LoEqRy9KjlbayCQ==
X-Received: by 2002:a05:6a20:6a22:b0:34f:66ca:60aa with SMTP id adf61e73a8af0-3614f227c6fmr28454482637.6.1764293027993;
        Thu, 27 Nov 2025 17:23:47 -0800 (PST)
Received: from [192.168.1.57] ([98.148.145.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e6e6df9sm3051423b3a.39.2025.11.27.17.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 17:23:47 -0800 (PST)
Message-ID: <d60891a1-a2d8-4b36-8640-4159126a292c@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 17:23:33 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] media: qcom: camss: csid: Add support for CSID
 1080
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251120-add-support-for-camss-on-kaanapali-v7-0-de27f9a67ce6@oss.qualcomm.com>
 <20251120-add-support-for-camss-on-kaanapali-v7-4-de27f9a67ce6@oss.qualcomm.com>
 <e4069c09-2344-4ffb-a81a-baebc3ba847d@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <e4069c09-2344-4ffb-a81a-baebc3ba847d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CM4nSbyFIZj_-N_knBl4Oq9rdny2wq4L
X-Proofpoint-ORIG-GUID: CM4nSbyFIZj_-N_knBl4Oq9rdny2wq4L
X-Authority-Analysis: v=2.4 cv=OPcqHCaB c=1 sm=1 tr=0 ts=6928f9a5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=BiHMn5M11h/vNwziJwzFrg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=igV8PjgcDtVxzz73bK0A:9
 a=4Q4zU7iZy6iiv8wZ:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDAwOCBTYWx0ZWRfX0iumLLc+FxTN
 ByW57iRdgvqgBFebNxnj37N/Dt+M61JwCceksYa70gx7KOKvmmLpQzVUjh7PSmYcE3grO7cwtck
 Gv3kYAkBQuKICq2Q/INvCwx1jpLuo+p2RUyUH2BDtGv7/F0aT3cHdrBDihyM/vkmLJLig0NQ9mZ
 d88nQe+2TQtQomMsZFuH70QdAdXu38wBXwGmCAji5ChwK5WPQ7U7YQyijQTX8rqZMBBjm4tP49y
 UBUY3poRZsuT9Fgs8o6+b9F2/ptiZ7mQV2flKDW6cfjeqUBvlHiGZY5L/vHJm+f56oXmrwNKXDx
 O3yWhNqTvA1whTRkaUZKbkyz+xcAIh2G1sKXHgO3wuSM0fAnPzgBrF8M03vyj3stio8rkuxrMIK
 /mMcj9D6Z0KtSZu2SJADatozicpvgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511280008


On 11/27/2025 2:13 AM, Bryan O'Donoghue wrote:
> On 21/11/2025 04:43, Hangxiang Ma wrote:
>> Add more detailed resource information for CSID devices along with the
>> driver for CSID 1080 that is responsible for CSID register
>> configuration, module reset and IRQ handling for BUF_DONE events. And
>> aggregate a common definition 'CSI2_RX_CFG0_PHY_SEL_BASE_IDX' into csid
>> header file.
>>
>> In this CSID version, RUP and AUP update values are split into two
>> registers along with a SET register. Accordingly, enhance the CSID
>> interface to accommodate both the legacy combined reg_update and the
>> split RUP and AUP updates.
>>
>> Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>   .../media/platform/qcom/camss/camss-csid-1080.c    | 377 
>> +++++++++++++++++++++
>>   drivers/media/platform/qcom/camss/camss-csid-680.c |   1 -
>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |   1 -
>>   drivers/media/platform/qcom/camss/camss-csid.h     |  11 +-
>>   drivers/media/platform/qcom/camss/camss.c          |  80 +++++
>>   6 files changed, 468 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/Makefile 
>> b/drivers/media/platform/qcom/camss/Makefile
>> index 23960d02877d..3a7ed4f5a004 100644
>> --- a/drivers/media/platform/qcom/camss/Makefile
>> +++ b/drivers/media/platform/qcom/camss/Makefile
>> @@ -8,6 +8,7 @@ qcom-camss-objs += \
>>           camss-csid-4-7.o \
>>           camss-csid-340.o \
>>           camss-csid-680.o \
>> +        camss-csid-1080.o \
>>           camss-csid-gen2.o \
>>           camss-csid-gen3.o \
>>           camss-csiphy-2ph-1-0.o \
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c 
>> b/drivers/media/platform/qcom/camss/camss-csid-1080.c
>> new file mode 100644
>> index 000000000000..c5a866f25d5b
>> --- /dev/null
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
>> @@ -0,0 +1,377 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * camss-csid-1080.c
>> + *
>> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +#include <linux/completion.h>
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +
>> +#include "camss.h"
>> +#include "camss-csid.h"
>> +#include "camss-csid-gen3.h"
>> +
>> +/* Reset and Command Registers */
>> +#define CSID_RST_CFG                0x108
>> +#define        RST_MODE                BIT(0)
>> +#define        RST_LOCATION                BIT(4)
>> +
>> +/* Reset and Command Registers */
>> +#define CSID_RST_CMD                0x10C
>> +#define        SELECT_HW_RST                BIT(0)
>> +#define        SELECT_IRQ_RST                BIT(2)
>> +#define CSID_IRQ_CMD                0x110
>> +#define        IRQ_CMD_CLEAR                BIT(0)
>> +
>> +/* Register Update Commands, RUP/AUP */
>> +#define CSID_RUP_CMD                0x114
>> +#define CSID_AUP_CMD                0x118
>> +#define        CSID_RUP_AUP_RDI(rdi)            (BIT(8) << (rdi))
>> +#define CSID_RUP_AUP_CMD            0x11C
>> +#define        RUP_SET                    BIT(0)
>> +#define        MUP                    BIT(4)
>> +
>> +/* Top level interrupt registers */
>> +#define CSID_TOP_IRQ_STATUS            0x180
>> +#define CSID_TOP_IRQ_MASK            0x184
>> +#define CSID_TOP_IRQ_CLEAR            0x188
>> +#define        INFO_RST_DONE                BIT(0)
>> +#define        CSI2_RX_IRQ_STATUS            BIT(2)
>> +#define        BUF_DONE_IRQ_STATUS            BIT(3)
>> +
>> +/* Buffer done interrupt registers */
>> +#define CSID_BUF_DONE_IRQ_STATUS        0x1A0
>> +#define        BUF_DONE_IRQ_STATUS_RDI_OFFSET        16
>> +#define CSID_BUF_DONE_IRQ_MASK            0x1A4
>> +#define CSID_BUF_DONE_IRQ_CLEAR            0x1A8
>> +#define CSID_BUF_DONE_IRQ_SET            0x1AC
>> +
>> +/* CSI2 RX interrupt registers */
>> +#define CSID_CSI2_RX_IRQ_STATUS            0x1B0
>> +#define CSID_CSI2_RX_IRQ_MASK            0x1B4
>> +#define CSID_CSI2_RX_IRQ_CLEAR            0x1B8
>> +#define CSID_CSI2_RX_IRQ_SET            0x1BC
>> +
>> +/* CSI2 RX Configuration */
>> +#define CSID_CSI2_RX_CFG0            0x880
>> +#define        CSI2_RX_CFG0_NUM_ACTIVE_LANES        0
>> +#define        CSI2_RX_CFG0_DL0_INPUT_SEL        4
>> +#define        CSI2_RX_CFG0_PHY_NUM_SEL        20
>> +#define CSID_CSI2_RX_CFG1            0x884
>> +#define        CSI2_RX_CFG1_ECC_CORRECTION_EN        BIT(0)
>> +#define        CSI2_RX_CFG1_VC_MODE            BIT(2)
>> +
>> +#define MSM_CSID_MAX_SRC_STREAMS_1080 (csid_is_lite(csid) ? 4 : 5)
>> +
>> +/* RDI Configuration */
>> +#define CSID_RDI_CFG0(rdi) \
>> +    ((csid_is_lite(csid) ? 0x3080 : 0x5480) + 0x200 * (rdi))
>> +#define        RDI_CFG0_RETIME_BS            BIT(5)
>> +#define        RDI_CFG0_TIMESTAMP_EN            BIT(6)
>> +#define        RDI_CFG0_TIMESTAMP_STB_SEL        BIT(8)
>> +#define        RDI_CFG0_DECODE_FORMAT            12
>> +#define        RDI_CFG0_DT                16
>> +#define        RDI_CFG0_VC                22
>> +#define        RDI_CFG0_EN                BIT(31)
>> +
>> +/* RDI Control and Configuration */
>> +#define CSID_RDI_CTRL(rdi) \
>> +    ((csid_is_lite(csid) ? 0x3088 : 0x5488) + 0x200 * (rdi))
>> +#define        RDI_CTRL_START_CMD            BIT(0)
>> +
>> +#define CSID_RDI_CFG1(rdi) \
>> +    ((csid_is_lite(csid) ? 0x3094 : 0x5494) + 0x200 * (rdi))
>> +#define        RDI_CFG1_DROP_H_EN            BIT(5)
>> +#define        RDI_CFG1_DROP_V_EN            BIT(6)
>> +#define        RDI_CFG1_CROP_H_EN            BIT(7)
>> +#define        RDI_CFG1_CROP_V_EN            BIT(8)
>> +#define        RDI_CFG1_PACKING_FORMAT_MIPI        BIT(15)
>> +
>> +/* RDI Pixel Store Configuration */
>> +#define CSID_RDI_PIX_STORE_CFG0(rdi)        (0x5498 + 0x200 * (rdi))
>> +#define        RDI_PIX_STORE_CFG0_EN            BIT(0)
>> +#define        RDI_PIX_STORE_CFG0_MIN_HBI        1
>> +
>> +/* RDI IRQ Status in wrapper */
>> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)        (0x224 + (0x10 * (rdi)))
>> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)            (0x228 + (0x10 * 
>> (rdi)))
>> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)        (0x22C + (0x10 * (rdi)))
>> +#define        INFO_RUP_DONE                BIT(23)
>> +
>> +static void __csid_aup_rup_trigger(struct csid_device *csid)
>> +{
>> +    /* trigger SET in combined register */
>> +    writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
>> +}
>> +
>> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
>> +{
>> +    /* Hardware clears the registers upon consuming the settings */
>> +    csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
>> +    csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
>> +}
>> +
>> +static void __csid_aup_update(struct csid_device *csid, int port_id)
>> +{
>> +    csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
>> +    writel(csid->aup_update, csid->base + CSID_AUP_CMD);
>> +
>> +    __csid_aup_rup_trigger(csid);
>> +}
>> +
>> +static void __csid_reg_update(struct csid_device *csid, int port_id)
>> +{
>> +    csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
>> +    writel(csid->rup_update, csid->base + CSID_RUP_CMD);
>> +
>> +    __csid_aup_rup_trigger(csid);
>> +}
>> +
>> +static void __csid_configure_rx(struct csid_device *csid,
>> +                struct csid_phy_config *phy)
>> +{
>> +    int val;
>> +
>> +    val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>> +    val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>> +    val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
>> +           << CSI2_RX_CFG0_PHY_NUM_SEL;
>> +    writel(val, csid->base + CSID_CSI2_RX_CFG0);
>> +
>> +    val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
>> +    writel(val, csid->base + CSID_CSI2_RX_CFG1);
>> +}
>> +
>> +static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
>> +{
>> +    int val;
>> +
>> +    if (vc > 3) {
>> +        val = readl(csid->base + CSID_CSI2_RX_CFG1);
>> +        val |= CSI2_RX_CFG1_VC_MODE;
>> +        writel(val, csid->base + CSID_CSI2_RX_CFG1);
>> +    }
>> +}
>> +
>> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 
>> rdi)
>> +{
>> +    int val = 0;
>> +
>> +    if (enable)
>> +        val = RDI_CTRL_START_CMD;
>> +
>> +    writel(val, csid->base + CSID_RDI_CTRL(rdi));
>> +}
>> +
>> +static void __csid_configure_rdi_pix_store(struct csid_device *csid, 
>> u8 rdi)
>> +{
>> +    u32 val;
>> +
>> +    /* Configure pixel store to allow absorption of hblanking or 
>> idle time.
>> +     * This helps with horizontal crop and prevents line buffer 
>> conflicts.
>> +     * Reset state is 0x8 which has MIN_HBI=4, we keep the default 
>> MIN_HBI
>> +     * and just enable the pixel store functionality.
>> +     */
>> +    val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
>> +    writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
>> +}
>> +
>> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 
>> enable, u8 vc)
>> +{
>> +    u32 val;
>> +    u8 lane_cnt = csid->phy.lane_cnt;
>> +
>> +    /* Source pads matching RDI channels on hardware.
>> +     * E.g. Pad 1 -> RDI0, Pad 2 -> RDI1, etc.
>> +     */
>> +    struct v4l2_mbus_framefmt *input_format = 
>> &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
>> +    const struct csid_format_info *format = 
>> csid_get_fmt_entry(csid->res->formats->formats,
>> + csid->res->formats->nformats,
>> +                                   input_format->code);
>> +
>> +    if (!lane_cnt)
>> +        lane_cnt = 4;
>> +
>> +    val = RDI_CFG0_TIMESTAMP_EN;
>> +    val |= RDI_CFG0_TIMESTAMP_STB_SEL;
>> +    val |= RDI_CFG0_RETIME_BS;
>> +
>> +    /* note: for non-RDI path, this should be format->decode_format */
>> +    val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
>> +    val |= vc << RDI_CFG0_VC;
>> +    val |= format->data_type << RDI_CFG0_DT;
>> +    writel(val, csid->base + CSID_RDI_CFG0(vc));
>> +
>> +    val = RDI_CFG1_PACKING_FORMAT_MIPI;
>> +    writel(val, csid->base + CSID_RDI_CFG1(vc));
>> +
>> +    /* Configure pixel store using dedicated register in 1080 */
>> +    if (!csid_is_lite(csid))
>> +        __csid_configure_rdi_pix_store(csid, vc);
>> +
>> +    val = 0;
>> +    writel(val, csid->base + CSID_RDI_CTRL(vc));
>> +
>> +    val = readl(csid->base + CSID_RDI_CFG0(vc));
>> +
>> +    if (enable)
>> +        val |= RDI_CFG0_EN;
>> +
>> +    writel(val, csid->base + CSID_RDI_CFG0(vc));
>> +}
>> +
>> +static void csid_configure_stream_1080(struct csid_device *csid, u8 
>> enable)
>> +{
>> +    u8 i;
>> +    u8 vc;
>> +
>> +    __csid_configure_rx(csid, &csid->phy);
>> +
>> +    for (vc = 0; vc < MSM_CSID_MAX_SRC_STREAMS_1080; vc++) {
>> +        if (csid->phy.en_vc & BIT(vc)) {
>> +            __csid_configure_rdi_stream(csid, enable, vc);
>> +            __csid_configure_rx_vc(csid, vc);
>> +
>> +            for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++)
>> +                __csid_aup_update(csid, vc);
>> +
>> +            __csid_reg_update(csid, vc);
>> +
>> +            __csid_ctrl_rdi(csid, enable, vc);
>> +        }
>> +    }
>> +}
>> +
>> +static int csid_configure_testgen_pattern_1080(struct csid_device 
>> *csid,
>> +                           s32 val)
>> +{
>> +    return 0;
>> +}
>> +
>> +static void csid_subdev_reg_update_1080(struct csid_device *csid, 
>> int port_id,
>> +                    bool clear)
>> +{
>> +    if (clear)
>> +        __csid_aup_rup_clear(csid, port_id);
>> +    else
>> +        __csid_aup_update(csid, port_id);
>> +}
>> +
>> +/**
>> + * csid_isr - CSID module interrupt service routine
>> + * @irq: Interrupt line
>> + * @dev: CSID device
>> + *
>> + * Return IRQ_HANDLED on success
>> + */
>> +static irqreturn_t csid_isr_1080(int irq, void *dev)
>> +{
>> +    struct csid_device *csid = dev;
>> +    u32 val, buf_done_val;
>> +    u8 reset_done;
>> +    int i;
>> +
>> +    val = readl(csid->base + CSID_TOP_IRQ_STATUS);
>> +    writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
>> +
>> +    reset_done = val & INFO_RST_DONE;
>> +
>> +    buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
>> +    writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>> +
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>> +            writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>> +
>> +            if (val & INFO_RUP_DONE)
>> +                csid_subdev_reg_update_1080(csid, i, true);
>> +
>> +            if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
>> +                camss_buf_done(csid->camss, csid->id, i);
>> +        }
>> +    }
>> +
>> +    val = IRQ_CMD_CLEAR;
>> +    writel(val, csid->base + CSID_IRQ_CMD);
>> +
>> +    if (reset_done)
>> +        complete(&csid->reset_complete);
>> +
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +/**
>> + * csid_reset - Trigger reset on CSID module and wait to complete
>> + * @csid: CSID device
>> + *
>> + * Return 0 on success or a negative error code otherwise
>> + */
>> +static int csid_reset_1080(struct csid_device *csid)
>> +{
>> +    unsigned long time;
>> +    u32 val;
>> +    int i;
>> +
>> +    reinit_completion(&csid->reset_complete);
>> +
>> +    val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
>> +    writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
>> +    writel(val, csid->base + CSID_TOP_IRQ_MASK);
>> +
>> +    val = 0;
>> +    for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_1080; i++) {
>> +        if (csid->phy.en_vc & BIT(i)) {
>> +            /*
>> +             * Only need to clear buf done IRQ status here,
>> +             * RUP done IRQ status will be cleared once isr
>> +             * strobe generated by CSID_RST_CMD
>> +             */
>> +            val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
>> +        }
>> +    }
>> +    writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>> +    writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
>> +
>> +    /* Clear all IRQ status with CLEAR bits set */
>> +    val = IRQ_CMD_CLEAR;
>> +    writel(val, csid->base + CSID_IRQ_CMD);
>> +
>> +    val = RST_LOCATION | RST_MODE;
>> +    writel(val, csid->base + CSID_RST_CFG);
>> +
>> +    val = SELECT_HW_RST | SELECT_IRQ_RST;
>> +    writel(val, csid->base + CSID_RST_CMD);
>> +
>> +    time = wait_for_completion_timeout(&csid->reset_complete,
>> + msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
>> +
>> +    if (!time) {
>> +        dev_err(csid->camss->dev, "CSID reset timeout\n");
>> +        return -EIO;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void csid_subdev_init_1080(struct csid_device *csid)
>> +{
>> +    csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
>> +}
>> +
>> +const struct csid_hw_ops csid_ops_1080 = {
>> +    .configure_stream = csid_configure_stream_1080,
>> +    .configure_testgen_pattern = csid_configure_testgen_pattern_1080,
>> +    .hw_version = csid_hw_version,
>> +    .isr = csid_isr_1080,
>> +    .reset = csid_reset_1080,
>> +    .src_pad_code = csid_src_pad_code,
>> +    .subdev_init = csid_subdev_init_1080,
>> +    .reg_update = csid_subdev_reg_update_1080,
>> +};
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c 
>> b/drivers/media/platform/qcom/camss/camss-csid-680.c
>> index 3ad3a174bcfb..86134a23cd4e 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
>> @@ -101,7 +101,6 @@
>>   #define        CSI2_RX_CFG0_DL2_INPUT_SEL            12
>>   #define        CSI2_RX_CFG0_DL3_INPUT_SEL            16
>>   #define        CSI2_RX_CFG0_PHY_NUM_SEL            20
>> -#define        CSI2_RX_CFG0_PHY_SEL_BASE_IDX            1
>>   #define        CSI2_RX_CFG0_PHY_TYPE_SEL            24
>>     #define CSID_CSI2_RX_CFG1                    0x204
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c 
>> b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> index 664245cf6eb0..f09b5575572a 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
>> @@ -103,7 +103,6 @@
>>   #define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi) (csid_is_lite(csid) && 
>> IS_CSID_690(csid) ?\
>>                               (0x34C + 0x100 * (rdi)) :\
>>                               (0x54C + 0x100 * (rdi)))
>> -#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX    1
>>     static void __csid_configure_rx(struct csid_device *csid,
>>                   struct csid_phy_config *phy, int vc)
>> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h 
>> b/drivers/media/platform/qcom/camss/camss-csid.h
>> index aedc96ed84b2..6c214b487003 100644
>> --- a/drivers/media/platform/qcom/camss/camss-csid.h
>> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
>> @@ -27,6 +27,8 @@
>>   /* CSID hardware can demultiplex up to 4 outputs */
>>   #define MSM_CSID_MAX_SRC_STREAMS    4
>>   +/* CSIPHY to hardware PHY selector mapping */
>> +#define CSI2_RX_CFG0_PHY_SEL_BASE_IDX 1
>>   #define CSID_RESET_TIMEOUT_MS 500
>>     enum csid_testgen_mode {
>> @@ -154,7 +156,13 @@ struct csid_device {
>>       void __iomem *base;
>>       u32 irq;
>>       char irq_name[30];
>> -    u32 reg_update;
>> +    union {
>> +        u32 reg_update;
>> +        struct {
>> +            u32 rup_update;
>> +            u32 aup_update;
>> +        };
>> +    };
>>       struct camss_clock *clock;
>>       int nclocks;
>>       struct regulator_bulk_data *supplies;
>> @@ -215,6 +223,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
>>   extern const struct csid_hw_ops csid_ops_4_7;
>>   extern const struct csid_hw_ops csid_ops_340;
>>   extern const struct csid_hw_ops csid_ops_680;
>> +extern const struct csid_hw_ops csid_ops_1080;
>>   extern const struct csid_hw_ops csid_ops_gen2;
>>   extern const struct csid_hw_ops csid_ops_gen3;
>>   diff --git a/drivers/media/platform/qcom/camss/camss.c 
>> b/drivers/media/platform/qcom/camss/camss.c
>> index b12e79e40e97..30e58aeea310 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -139,6 +139,84 @@ static const struct camss_subdev_resources 
>> csiphy_res_kaanapali[] = {
>>       },
>>   };
>>   +static const struct camss_subdev_resources csid_res_kaanapali[] = {
>> +    /* CSID0 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid0" },
>> +        .interrupt = { "csid0" },
>> +        .csid = {
>> +            .is_lite = false,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1080,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID1 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid1" },
>> +        .interrupt = { "csid1" },
>> +        .csid = {
>> +            .is_lite = false,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1080,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID2 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid2" },
>> +        .interrupt = { "csid2" },
>> +        .csid = {
>> +            .is_lite = false,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1080,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID_LITE0 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid_lite0" },
>> +        .interrupt = { "csid_lite0" },
>> +        .csid = {
>> +            .is_lite = true,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1080,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    },
>> +    /* CSID_LITE1 */
>> +    {
>> +        .regulators = {},
>> +        .clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
>> +        .clock_rate = { { 400000000, 480000000 },
>> +                { 400000000, 480000000 } },
>> +        .reg = { "csid_lite1" },
>> +        .interrupt = { "csid_lite1" },
>> +        .csid = {
>> +            .is_lite = true,
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1080,
>> +            .formats = &csid_formats_gen2
>> +        }
>> +    }
>> +};
>> +
>>   static const struct resources_icc icc_res_kaanapali[] = {
>>       {
>>           .name = "ahb",
>> @@ -4414,9 +4492,11 @@ static const struct camss_resources 
>> kaanapali_resources = {
>>       .version = CAMSS_KAANAPALI,
>>       .pd_name = "top",
>>       .csiphy_res = csiphy_res_kaanapali,
>> +    .csid_res = csid_res_kaanapali,
>>       .icc_res = icc_res_kaanapali,
>>       .icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
>>       .csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
>> +    .csid_num = ARRAY_SIZE(csid_res_kaanapali),
>>   };
>>     static const struct camss_resources msm8916_resources = {
>>
>
> Should this be "gen4" instead of 1080 also ?

Hi Bryan, we don't intend to reuse this driver for SM8750 as the offsets 
and some SWI are different. If you advise, to keep it consistent between 
VFE and CSID with in KNP, we can rename this to gen4 but keeping 1080 
may identify the HW version more clearly? Please let us know your 
thoughts and we will update accordingly. Thanks.

>
> ---
> bod
>

