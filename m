Return-Path: <linux-arm-msm+bounces-77630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AF0BE5126
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 20:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0569D1A64D7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 18:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEA7235BE8;
	Thu, 16 Oct 2025 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYm4RAxv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A80231836
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 18:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760639834; cv=none; b=tuwTOlkhvek3Jj25Y8X19DBisEPcDC7ZbDaD6xz8gAF1rnJbzk9FZbnhOOJ/6Px65FbGcKjwFUFSkEKcJPtpNhJanbb0/N6iVKRDcFkBwUMYRZ3fM7lkh16cab9mTwXMn4oaceoDBaOUOIvcis1MkAQHJNBK32Wgzf6XmN7cPxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760639834; c=relaxed/simple;
	bh=OB5eSYWFZISVNnfXCEn0GDxedvGCMQF6SoJ+Ow7mZKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7DrjMqiWDBtk+Qz+unR6BiWG0YFmDQ5yJVqNFYtdVgO+46LlAWdGf+h3XF0cgUOjBBcPUJLddhIjDjNRmpF3xb6yIJoWV+YgrMc8wKU+eORvDBXqJFZlh7a8nKjIsU4d1WQL3ehcD2Ypi7f3qCYk7ThKV2zVj1ncWVgjYndFRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYm4RAxv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GBPYX3022317
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 18:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/Uh0mqL0LErWoe7liCsyTCPPXrnktV2gL3UQ900aTY=; b=dYm4RAxvOcNd8pKf
	wLZRQWzDYFESSAXoZVX+5lcwFmJb8ZOC5HQq3U6Lr2DL0+7l7FbQ7atF3fkU5mCn
	iTPEDGxWHJr9i3EJi2YpJxtnDTlGuZeWE8G37vo/OZoeC+uFGzsu+JurLfvAMEWI
	lsISHFnuy11JtNbGyzQhWZZ/LaK6+PKLelOq99T2oin12NUhgbMtxIbTHw74N0wC
	xPAf2OOgKVeSpaVA5Jjio6m5S53gJlnEu19uIEw9jQiwnMR708cSFCiP9aYGm4wK
	XKdy0AitUNOZjxIv2yKPan5hV3/nNvqRpYrSqctjnAN0JFmJCkviY251u9YfcdsS
	IfZpjw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpjqxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 18:37:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b56ae0c8226so691906a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 11:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760639830; x=1761244630;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/Uh0mqL0LErWoe7liCsyTCPPXrnktV2gL3UQ900aTY=;
        b=EFIgVUhwrvu5PEkdFzKOTBqgMLO/99fDDEhMo5gxD8n3I8wGoT6qA+o8vAMeZQbJXW
         INTFujdRLpx5scJ97zy+Q3Yko6CBd/pxzQmZ1V6pPXOvnI4J+/gSaTLWOTng2JZjVKZw
         Q/oicT15pZukFveCT8THZCYTl2v4ws66vV/28nTACtT9T09JoHj4cUtGNHFlv6pJm31l
         5qJM9ZM8B6MXBpseV8BRBWy8/onEci4EOQuVtyvfZY+OqQMON+5hnLHjnZEIbNkRMW60
         RNXtJ/YGt3TJ8pwAKTPJuWEVEy2uCa6SZ1Qqtc7+FwEXH98oFL1W1RAGT84q/hGd8N3j
         A/4g==
X-Forwarded-Encrypted: i=1; AJvYcCUb7Kqse9TuEi3X5jpWzQ6pZoXd2pC9nD58nDfuD0mXU4IvCwKA/bMPHXI07VQ8oFLaj9arFcyAULlPy/0m@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb4G4Kox3fK1NQCwbiaoJ4h7YpAfi7S4IScitkIQGqqZY2vPth
	y/fqciUnY3+IDTfTF//6qFRZ03edcyGXOyo7bi9RD8c4tBfZEUk22QryIK1I/2+sjxjJ7HUigQr
	3kkfe0+POCmJ+9R9c9iNnIZ73Sa8CK2vAgFwJWlKHP1XPf7iFgYlck9WUUi57DhtKbLGw
X-Gm-Gg: ASbGncuc48Fcf7unymj80xJEStoICjTiiW+tPRdavaB5rujcqYY405oH5xR1bCBUwDa
	ZcsD1Cux3eAbJAxCmFiK1CS0kOifcKLb4w46r0exf8j1y30EBA4gKCfrPfwRwMVbKdc3IsEsWTF
	2tfKxOyv5lUzBUb7qm6Z67bKJ+oKjDiVRHYLI2Sjgj6ZVpPAMQ7g1PUvQSxL/Sw0Fxtc2wFU8j5
	paWTj08RRbdV2+hK3AeTlHvNbYomOArTyV59CmhyrTL6ZPogVFMQmRAIP3oGYmpVWaNPozCLarx
	71IMLTtZleS4oYI231Y7XCiNSDQXogx7jZAUJYKLgbIrVj4RO27OW4CNRcGaEAcljHSEAKvzz+N
	ZNIMPKr9qU26AFVg5b5AWvjPw8oYVXsn24w==
X-Received: by 2002:a17:902:d584:b0:275:f156:965c with SMTP id d9443c01a7336-290cb65b61dmr10962955ad.52.1760639829646;
        Thu, 16 Oct 2025 11:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFopTCf5Sn+ugIQazeLjzMKZ4AaB+rCH/4DczDVKRWHWy44mdCx7hroKoHEE+1V8Q7zPobuqA==
X-Received: by 2002:a17:902:d584:b0:275:f156:965c with SMTP id d9443c01a7336-290cb65b61dmr10962635ad.52.1760639829227;
        Thu, 16 Oct 2025 11:37:09 -0700 (PDT)
Received: from [192.168.0.167] ([49.205.248.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-290c5c7d305sm11890295ad.70.2025.10.16.11.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 11:37:08 -0700 (PDT)
Message-ID: <c4c40efb-ceda-c13c-115f-a473af5e8fcb@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 00:07:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 5/8] media: iris: Move vpu register defines to common
 header file
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20250925-knp_video-v1-0-e323c0b3c0cd@oss.qualcomm.com>
 <20250925-knp_video-v1-5-e323c0b3c0cd@oss.qualcomm.com>
 <gbwjh4tqaoxq2ng7moytv5vtalxpajdid5capjfqzare6dmphz@cmnv4p2q4eov>
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <gbwjh4tqaoxq2ng7moytv5vtalxpajdid5capjfqzare6dmphz@cmnv4p2q4eov>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f13b56 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=LqmlnLjRnrQCSl2bsDkM0Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Da5OPgB5uXQvAvJx2EkA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfXxB3YNJ21i0Oa
 j9So5McFw+d4YAH95hDICR481lH/JjxnSVxokPSwj2Jrmb9AEmx4uQFuNqpIY3AOzoebnDanb0C
 WCBROlLC5dZkTFJ8PnUqKHdROAWRbtbVPemd55Myc88dM3XC8MZp4L0BIL6CfEn5mqNoWOOW4TJ
 HJwq7ElvZnX8NZJNcpEzobIEjr7KR4S/OxMmEgTlR+hOQVfyyo7tsSRA+gqvv6eDmzzvtD6UOlO
 KoZshj2bqaszEBM58cMIKygZWK0qB05WECHR/2DSWuifhjW0or8+e93unVDWo6Tbi94ErwpSmBz
 dL2HmfL3iD5Pqd6UP+gUJad81x2kqYlP+Jk/RX1HhwSLrYO5nSacqDoAwljThBiQNppqst9cbcb
 1NsV+O0HlYmGdnoQyIRLvz3TLJXDpw==
X-Proofpoint-ORIG-GUID: RRi0GOycYU34GaVMMNq3RkPY-zYXCadA
X-Proofpoint-GUID: RRi0GOycYU34GaVMMNq3RkPY-zYXCadA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017


On 10/16/2025 7:17 PM, Dmitry Baryshkov wrote:
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> index fe8a39e5e5a3fc68dc3a706ffdba07a5558163cf..6474f561c8dc29d1975bb44792595d86f16b6cff 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
>> @@ -9,9 +9,38 @@
>>  #define VCODEC_BASE_OFFS			0x00000000
>>  #define CPU_BASE_OFFS				0x000A0000
>>  #define WRAPPER_BASE_OFFS			0x000B0000
>> +#define AON_BASE_OFFS				0x000E0000
>> +#define WRAPPER_TZ_BASE_OFFS			0x000C0000
>> +#define AON_MVP_NOC_RESET			0x0001F000
>>  
>>  #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
>>  
>>  #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
>> +#define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
>> +#define AON_WRAPPER_MVP_NOC_LPI_CONTROL		(AON_BASE_OFFS)
>> +#define WRAPPER_DEBUG_BRIDGE_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x54)
>> +#define WRAPPER_DEBUG_BRIDGE_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x58)
>> +#define WRAPPER_IRIS_CPU_NOC_LPI_CONTROL	(WRAPPER_BASE_OFFS + 0x5C)
>> +#define WRAPPER_IRIS_CPU_NOC_LPI_STATUS		(WRAPPER_BASE_OFFS + 0x60)
>> +#define WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG		(WRAPPER_TZ_BASE_OFFS + 0x14)
>> +#define CPU_CS_AHB_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x160)
>> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
>> +#define AON_WRAPPER_MVP_NOC_RESET_REQ		(AON_MVP_NOC_RESET + 0x000)
>> +#define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
>> +#define VCODEC_SS_IDLE_STATUSN			(VCODEC_BASE_OFFS + 0x70)
>> +#define AON_WRAPPER_MVP_NOC_LPI_STATUS		(AON_BASE_OFFS + 0x4)
>> +#define WRAPPER_TZ_QNS4PDXFIFO_RESET		(WRAPPER_TZ_BASE_OFFS + 0x18)
> Registers here got totally unsorted (they were in the original source
> file). Seeing this makes me sad.
> 

Sure, i will be improving this part in v2.

>> +
>> +#define CORE_BRIDGE_SW_RESET			BIT(0)
>> +#define CORE_BRIDGE_HW_RESET_DISABLE		BIT(1)
>> +#define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
>> +#define MSK_CORE_POWER_ON			BIT(1)
>> +#define CTL_AXI_CLK_HALT			BIT(0)
>> +#define CTL_CLK_HALT				BIT(1)
>> +#define REQ_POWER_DOWN_PREP			BIT(0)
>> +#define RESET_HIGH				BIT(0)
>> +#define NOC_LPI_STATUS_DONE			BIT(0) /* Indicates the NOC handshake is complete */
>> +#define NOC_LPI_STATUS_DENY			BIT(1) /* Indicates the NOC handshake is denied */
>> +#define NOC_LPI_STATUS_ACTIVE			BIT(2) /* Indicates the NOC is active */
> Ugh. This mixed all the bits, loosing connection between the register
> and the corresponding bits. I'm going to pick up this patch into the
> sc7280 series and I will improve it there, keeping the link between
> registers and bit fields.
> 

Ok, not updating this part in the next revision of my series. Do you mean
something like

#define CORE_BRIDGE_SW_RESET_BIT0		BIT(0)
#define CORE_BRIDGE_HW_RESET_DISABLE_BIT1	BIT(1)

Regards,
Vikash

