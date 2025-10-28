Return-Path: <linux-arm-msm+bounces-79303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868FC172B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 23:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9FEB1C2017D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 22:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99B426B0AE;
	Tue, 28 Oct 2025 22:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMyhG0ol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K50UTRzP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791C2DF714
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761689743; cv=none; b=FHVFmQ+WPpMIeaU57KnmIhbJVEGMgQv9asGdFPKA0G4D1wdnwVs9CBbH0fhuuQvaMu140fwtGkLXqe+29U1gt16CBAH3Y37IujpM6Qlm1CFQQyw9Csx6vfUTV8MJ1slokx29O0iyhjf5Of9qa279SyQ1KnsDSdGl/jBUq6IuuqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761689743; c=relaxed/simple;
	bh=lle28fA+/FsfsFiMjIFNUPMWMj2reJ/0jOe6OP2GZbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mgn4k4nY2sTU4ukGaZXk7QkljbJuCDn9gkLJ+PLgyJmUkrco+lBIP62GQvPiU0UdR0UZKnM5bfAU2XIVw4FhaLvZIc2I3Z8rT/dhWtQxvrOSA53JGj3FArEtnhUpu3ZzKxTPlhh5+Nvqc5mksWENmbM5rksIyMLtj8LMnlO8Gmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMyhG0ol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K50UTRzP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlc7U2525478
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PS6ekir5CeFEH7JucC+vlZ0WAP2bE+Fzy0K0FeebiUI=; b=PMyhG0olPjS96Jx/
	x2tXxTffEfyrPAnO0oNzytWtDYAx0v0+5tHJ0y7r6++HrJSO5Sod5KeXTf6ByR8S
	l2fNOaQszPaoMVZ3tGBhQ0kBfvPBr7JTmX9ThgL70FIIdFNYUCrSnUQ6NDeARUWm
	59P96FUCS6SFsZaKlpVzleUj2mqe1FqnXJ3DVJL2KUzQ1Nq2IIdNFxrXzP+mS2y7
	GTGcJho6RYvrcbiVshT2eEcpfJ+tIA04uNT4iQQRvn9cAsdyXglT18SLDvjy0jnF
	F9WmWX54vWbp/Fj+rp4QzQOWIb9wnVnrdEmjCH8qEme7h1CqijhiApqcpFOSdJ+u
	kUNrCw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3rb6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 22:15:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6cff817142so3731989a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 15:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761689737; x=1762294537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PS6ekir5CeFEH7JucC+vlZ0WAP2bE+Fzy0K0FeebiUI=;
        b=K50UTRzPLMOwDXSBxTwlrzSPD5XUzbiESIPTxhkUw7ytBp1yyheiAEawVnr/VfZL9C
         oTDYRE3lhmKOFuN9EcyYOXVAZ3tinRBX3c9LXRWOL7QGNPqsb2buPHx8IOwIi7ZVu2vd
         2TNnSA6KfqNDH2qw/5xLKQoJvgIlPI3k+C7yWuYrTtmf4J0dE2szej7MAtmqBBb5D+B7
         K4CUszMs9iS01y2Eqeet3ePFNc7lTnlly0VVS85QvxKW/VLZlU94pdVdiRfFhe+szFIx
         5B8vgWBKzfhl+Lcjk6MoX14O+4JNpBXaPyKdnuwccnhwfpwrev2FfWVuypJJFJCiNMHq
         rPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761689737; x=1762294537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PS6ekir5CeFEH7JucC+vlZ0WAP2bE+Fzy0K0FeebiUI=;
        b=WvJ/JmhF6I/wSFsOcUmCqTyCRvvrjJFEeemlCqBzC4Uhb5+cSc1f3WwJWW0guyyoSu
         XvxaDS3P+QdJpTYqtfgHUtPgWCPo5+6wioNI8NczrMqa39Sz/1X7feV32LRKq2eP56qb
         6p4uWIyhBRU2Rq71BuagpPTyZccAwtm67PQuEkvhd6kji0OjVJ/Z0BzIe/hB1U7JodUc
         4QXui64JeVfvLQM91NwN/U02GoWAwO2qgchqVsJTY5j8+9YDecW73mrggzt1SfCCCv8k
         DAYu39ruIpLSgzvp8NOTfIXfHOFrb6NpKhssZO+VhwKH0K3D1SUFlkKVuz6/HujpQYTw
         5ICA==
X-Forwarded-Encrypted: i=1; AJvYcCUwFST4Y2DqMuu4BlvcJgER9rcRPNpzJcii9ywAAUp7457ufrbWrBOAP7RPevQZK9mejfMQcPgVXgNYSjF0@vger.kernel.org
X-Gm-Message-State: AOJu0YyPbo4tI1Jw+VFomoYjmGwyAwez1N2aOzSEWvx10/gIelKfNYLT
	AZUbjVL1z6uDEmTv7LlNA00UbdBqLolG0mlYhjbywF+R3oJRB2nmMUIRhDwZ5m0nU7AwfCJdNkn
	9Ito8h+hhh/oPQX90yjKvXEibUpMTYzogHqv0Eqq2UU/c36C3LjE0qhEQOHV26NccOa3G
X-Gm-Gg: ASbGncuVqgEtKw1ir5E8E6GJl1dUcZr0rm3JeroWF6UGRtnqCylaZGLimX5Q+gqqGLi
	8jBTF9qHjBIZPo+zVngHDOI68OiFCJJBS7aVqULhKn9Ifxrdu/r5WiDucnpyjkxEhX5gT8E646I
	yA5DTtkyryZpZJZkXlLKJOAvwTvIhTGMG1UpJL0JRYFOefJRwtXcwKDyQwPMQCyfuzLodtE9q/2
	uJlHMq0Vs1H2ljD4nNUvgvegkPRPo7MSDPN148lY6Xibxrcef6ivA4XWDF1FlVWtOYHhZKeLPQV
	14OcO/m+GEE0dV177V4HRxSLvQdby8N8IuG+MYIFhzG2A+CDayK/RXsZ17zbmyskhXOVYgOasFS
	y9KqYc0qUQhn4kDlpbq6+WP1+1rjgIlOLichcIYZ+
X-Received: by 2002:a17:903:1a4e:b0:246:80b1:8c87 with SMTP id d9443c01a7336-294deef8844mr8457105ad.43.1761689736891;
        Tue, 28 Oct 2025 15:15:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJLEA9v/Mv48Jjv867SnWr65AkZTGjkRGkYR1Ak8CozEzyX9IDMyOTK3TzmbNEefmRul/yqw==
X-Received: by 2002:a17:903:1a4e:b0:246:80b1:8c87 with SMTP id d9443c01a7336-294deef8844mr8456645ad.43.1761689736213;
        Tue, 28 Oct 2025 15:15:36 -0700 (PDT)
Received: from [10.73.53.19] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7127afff91sm11487662a12.13.2025.10.28.15.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 15:15:35 -0700 (PDT)
Message-ID: <7ae01221-868e-d5dc-4297-8006a69e7a7c@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 15:15:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 6/8] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251024-glymur_usb-v6-0-471fa39ff857@oss.qualcomm.com>
 <20251024-glymur_usb-v6-6-471fa39ff857@oss.qualcomm.com>
 <ktjmbmfd37tm6ij3pqbrbhfounizz4znmqvearvh4spvuky6i6@pw5czztggbjm>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <ktjmbmfd37tm6ij3pqbrbhfounizz4znmqvearvh4spvuky6i6@pw5czztggbjm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6TyGCyAabF-GRxNqCCv361oEmOClrbD6
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=69014089 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wlTfea_xsf4MiaLh13MA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4NyBTYWx0ZWRfX3z349elAlnsa
 hJJtPuK5EXPX22a/z1nRqRcSBwnhAHMlskVt7uDL1hR29Gs8x6+Z/iOu8A0LTVALaV6pFAGJ9so
 kRzFd/YN4VnW3MkA1igqljydAN2ozmGnb8UkWD8wTt8UoKPG49oDBGKd6/KFrQPpHve3pXZ6SyE
 H0WTDD1pFzCkhKzRhYMIF/1kTcvC9AY1HFrDsSmGKAwVmrGTHfnURuQ7CwQrfT3hQTOnPhMOY8A
 WGrXO1QfCu2yRvE27J/nYEiOSDmEWne1lRe7Vzz7E+39l16bREvdvMspFbwzydxeS5v0XmM1DpM
 5Yj+763yXpFMfRFrChlV5fixBvkggyQCi2PRVjeqAeAjlJBf4IoyWHlqFwa/kerGm9s2lwchzdE
 89bhxvLd71KQsjUzWQkqOT8SCaO/nw==
X-Proofpoint-GUID: 6TyGCyAabF-GRxNqCCv361oEmOClrbD6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280187



On 10/27/2025 7:21 AM, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 05:47:44PM -0700, Wesley Cheng wrote:
>> For SuperSpeed USB to work properly, there is a set of HW settings that
>> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
>> these settings follow the latest settings mentioned in the HW programming
>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
>> new ways to define certain registers, such as the replacement of TXA/RXA
>> and TXB/RXB register sets.  This was replaced with the LALB register set.
>>
>> There are also some PHY init updates to modify the PCS MISC register space.
>> Without these, the QMP PHY PLL locking fails.
>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 288 ++++++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h     |  17 +
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h    |  12 +
>>   .../phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h    | 639 +++++++++++++++++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h   |  33 ++
>>   .../qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h   | 224 ++++++++
>>   drivers/phy/qualcomm/phy-qcom-qmp.h                |   2 +
>>   7 files changed, 1215 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> index 1caa1fb6a8c7..d1534ed7200b 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>> @@ -30,9 +30,11 @@
>>   
>>   #include "phy-qcom-qmp.h"
>>   #include "phy-qcom-qmp-pcs-aon-v6.h"
>> +#include "phy-qcom-qmp-pcs-aon-v8.h"
>>   #include "phy-qcom-qmp-pcs-misc-v3.h"
>>   #include "phy-qcom-qmp-pcs-misc-v4.h"
>>   #include "phy-qcom-qmp-pcs-misc-v5.h"
>> +#include "phy-qcom-qmp-pcs-misc-v8.h"
>>   #include "phy-qcom-qmp-pcs-usb-v4.h"
>>   #include "phy-qcom-qmp-pcs-usb-v5.h"
>>   #include "phy-qcom-qmp-pcs-usb-v6.h"
>> @@ -46,6 +48,8 @@
>>   #include "phy-qcom-qmp-dp-phy-v5.h"
>>   #include "phy-qcom-qmp-dp-phy-v6.h"
>>   
>> +#include "phy-qcom-qmp-usb43-pcs-v8.h"
>> +
>>   /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
>>   /* DP PHY soft reset */
>>   #define SW_DPPHY_RESET				BIT(0)
>> @@ -97,6 +101,7 @@ enum qphy_reg_layout {
>>   	QPHY_TX_HIGHZ_DRVR_EN,
>>   	QPHY_TX_TRANSCEIVER_BIAS_EN,
>>   
>> +	QPHY_AON_TOGGLE_ENABLE,
>>   	/* Keep last to ensure regs_layout arrays are properly initialized */
>>   	QPHY_LAYOUT_SIZE
>>   };
>> @@ -259,6 +264,236 @@ static const unsigned int qmp_v8_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
>>   	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V8_TX_TRANSCEIVER_BIAS_EN,
>>   };
>>   
>> +static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
>> +	[QPHY_SW_RESET]			= QPHY_V6_N4_PCS_SW_RESET,
>> +	[QPHY_START_CTRL]			= QPHY_V6_N4_PCS_START_CONTROL,
>> +	[QPHY_PCS_STATUS]			= QPHY_V6_N4_PCS_PCS_STATUS1,
>> +	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V6_N4_PCS_POWER_DOWN_CONTROL,
> 
> V8 PHY should not be using V6 register offsets.
> 
>> +
>> +	/* In PCS_USB */
>> +	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= QPHY_V6_PCS_USB3_AUTONOMOUS_MODE_CTRL,
>> +	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]	= QPHY_V6_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR,
>> +
>> +	[QPHY_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_USB3_AON_TOGGLE_ENABLE,
>> +
>> +	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V6_COM_RESETSM_CNTRL,
>> +	[QPHY_COM_C_READY_STATUS]		= QSERDES_V6_COM_C_READY_STATUS,
>> +	[QPHY_COM_CMN_STATUS]		= QSERDES_V6_COM_CMN_STATUS,
>> +	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V6_COM_PLL_BIAS_EN_CLK_BUFLR_EN,
>> +
>> +	[QPHY_DP_PHY_STATUS]		= QSERDES_V6_DP_PHY_STATUS,
>> +	[QPHY_DP_PHY_VCO_DIV]		= QSERDES_V6_DP_PHY_VCO_DIV,
>> +
>> +	[QPHY_TX_TX_POL_INV]		= QSERDES_V6_N4_TX_TX_POL_INV,
>> +	[QPHY_TX_TX_DRV_LVL]		= QSERDES_V6_N4_TX_TX_DRV_LVL,
>> +	[QPHY_TX_TX_EMP_POST1_LVL]		= QSERDES_V6_N4_TX_TX_EMP_POST1_LVL,
>> +	[QPHY_TX_HIGHZ_DRVR_EN]		= QSERDES_V6_N4_TX_HIGHZ_DRVR_EN,
>> +	[QPHY_TX_TRANSCEIVER_BIAS_EN]	= QSERDES_V6_N4_TX_TRANSCEIVER_BIAS_EN,
>> +};
>> +
>> @@ -2528,6 +2784,27 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
>>   	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
>>   };
>>   
>> +static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
>> +	.offsets		= &qmp_combo_usb43dp_offsets_v8,
>> +
>> +	.serdes_tbl		= glymur_usb43dp_serdes_tbl,
>> +	.serdes_tbl_num		= ARRAY_SIZE(glymur_usb43dp_serdes_tbl),
>> +	.tx_tbl			= glymur_usb43dp_lalb_tbl,
>> +	.tx_tbl_num		= ARRAY_SIZE(glymur_usb43dp_lalb_tbl),
>> +	.pcs_tbl		= glymur_usb43dp_pcs_tbl,
>> +	.pcs_tbl_num		= ARRAY_SIZE(glymur_usb43dp_pcs_tbl),
>> +	.pcs_usb_tbl		= glymur_usb43dp_pcs_usb_tbl,
>> +	.pcs_usb_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_usb_tbl),
>> +	.pcs_misc_tbl		= glymur_usb43dp_pcs_misc_tbl,
>> +	.pcs_misc_tbl_num	= ARRAY_SIZE(glymur_usb43dp_pcs_misc_tbl),
> 
> DP tables are missing.
> 

Hi Dmitry,

I think I discussed this with Abel on the previous patch revision.  At 
the moment I did not add support for DP, so we shouldn't add the tables, 
unless you think we should still have placeholder?

Thanks
Wesley Cheng

>> +
>> +	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
>> +	.reset_list		= msm8996_usb3phy_reset_l,
>> +	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
>> +	.vreg_list		= qmp_phy_vreg_refgen,
>> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_refgen),
>> +};
>> +
>>   static int qmp_combo_dp_serdes_init(struct qmp_combo *qmp)
>>   {
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> @@ -3024,6 +3301,7 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>>   {
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>   	void __iomem *com = qmp->com;
>> +	void __iomem *pcs_aon = qmp->pcs_aon;
>>   	int ret;
>>   	u32 val;
>>   
>> @@ -3059,6 +3337,10 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
>>   			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
>>   			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
>>   
>> +	/* override hardware control for reset of qmp phy */
>> +	if (pcs_aon && cfg->regs[QPHY_AON_TOGGLE_ENABLE])
>> +		qphy_clrbits(pcs_aon, cfg->regs[QPHY_AON_TOGGLE_ENABLE], 0x1);
>> +
>>   	/* Use software based port select and switch on typec orientation */
>>   	val = SW_PORTSELECT_MUX;
>>   	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
>> @@ -3236,6 +3518,8 @@ static int qmp_combo_usb_power_on(struct phy *phy)
>>   	qmp_configure_lane(qmp->dev, rx2, cfg->rx_tbl, cfg->rx_tbl_num, 2);
>>   
>>   	qmp_configure(qmp->dev, pcs, cfg->pcs_tbl, cfg->pcs_tbl_num);
>> +	qmp_configure(qmp->dev, qmp->pcs_misc, cfg->pcs_misc_tbl, cfg->pcs_misc_tbl_num);
>> +
> 
> Extra empty line.
> 
>>   
>>   	if (pcs_usb)
>>   		qmp_configure(qmp->dev, pcs_usb, cfg->pcs_usb_tbl,
> 

