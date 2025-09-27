Return-Path: <linux-arm-msm+bounces-75354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FB5BA56AD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 02:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70C6A3BF6C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 00:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870831C6FE8;
	Sat, 27 Sep 2025 00:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dcB57Lvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55901C2DB2
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 00:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758932781; cv=none; b=ZLrYC1W96LPNkr9BOVFrmlXZMf89EenQXiedmWqTr96U6w7vRYTWfXZoNyXLSMwVKgiP4vr1ivJc2SbQLQR1+iMIHIeefh6EnSHpINk7eZ/Ev93pDDq+Qxmk5dzpPLNA/LLi7Wcv5KKARtaYPdNsaoWuvVXia8eHI4BHOQJ54Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758932781; c=relaxed/simple;
	bh=Ie1+3dOmzn6F/oLn0yks7AubPDSI2bOKAARyt9PpkzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAiW3wh3o5JMRGgH+oR/dMsWO6cGPZmAI5U+PRjJC6e+siTq0pkx6FSQXePQ3rPcgglDO6KboHfLmIZHqYny6Ogde2/RJWZibZ1SAwOzqt7xupBJoYhVpa8CS4wAoq42AXjwvzXefL1eFjGSn4vJ47YoOd9p561nLgvSxVhQaAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dcB57Lvf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEWwFS031565
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 00:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RcvHuJWCbk3BM+dDfbEeuaA/xZMstL+kCgs1ypKPlgs=; b=dcB57Lvfe3uZsrIs
	nDRj+QPZE3erPi5hptVnoU8pG7SZFqJVkcAvGtQzj1ZqiOstWvV2gxaptDPlRIfs
	XFKJlibWgim3QDRKeM1BYxWvgwsLzqFlVvKwCtUk3U1UQ/ELRdQ1DQd9O+he97OR
	PObWWdi57Ro6HRSH9iPXq4WZnmhDATWgbMURlyxS/465f3+365NrHzCVWJ1iG2//
	PfaJdY5OkXCncWTAWbk/khzN5PFAAGnwZ8KPSvH727AnsVijD/Euwg1Q5hxOtc9a
	ZuNF4DYRFl1vaSzgO2pJpgFoP1JgCamrCKmXH/+I/g//5n00mm06eE6zWPXNS6xU
	utxBrQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tcfsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 00:26:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-269af520712so33527885ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 17:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758932777; x=1759537577;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RcvHuJWCbk3BM+dDfbEeuaA/xZMstL+kCgs1ypKPlgs=;
        b=FwYnUinyPXeiWvq5JmzW7NsCRDr0Lb209TyVzaWFvkvUU/gIa0uGtSeCY1VxrWtKZT
         Uxwnhob3x+1hF9Ot91RYj/8qWXRrqJNaGHF5SHlrec4+/7Xs5Bx+WO/cHDE6IhEDb6om
         Bcjueonr5MjXufDD6FldYgRDl12Et6sJ09fQVsY6vf50IydvXa1G31TQiy23iNL1bx44
         pVw6prWQK4XLXi0q50TdcR5HAPEI1lkI15PtejJKJFfhX3zFfekfffteWIC2ycxJ9LB/
         UCpGOwr5cPhQdFEwZ/O6y3W1r1wU6ElpKqdpamgUqlXCOzYKpADgLO3rmSdRCaD+O3HZ
         jy0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4lwBTfVBeNnWRUv4xOqgzDKjrp6e1VxGXCJ0X9u1k7u1D9Y3cBCJJc4sU3bHr+xcaWTHGIpQlwZGNxgij@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAs4/yjj3AiIwGEyY9o2He9eeeEQMjYqsXt2X+q15Q98rkybo
	F4D2OgOh17VFyzdxLrourii+J820cof8+u5LbQ6HuqJYAZKldw1ynA/jVdJXr1TYsFD9vN5Tvbf
	Xvvt0A4o/uEi6iCZXTUaTZ1AGkATXi5JIqSbreuko/mAsES7klt/YmlU/8IRgmkxGZWG8
X-Gm-Gg: ASbGncsNQUaMNkvVoAkgAj+4IbVrWQC4Y4Wd32xMV8g74j0NitHzNO6h7B6yh/VW2TP
	qBAMNiDVsKEH3mHpXLk7mSpY4l1v3O/5yGxctXDiLY7s7TAhmp0zI+ix3EoRZv5Zfm58aDRiYBZ
	+rO2iYWpq5e+4U16hjPXywn+j1GVakV0AqVJkLR1+soQsm2VgAJBDZ1txU1nL7+sHov6QQ26wAR
	t2Fvzxes31pDO8Ap7tJTV14aTjzKFQM1z2KZCM12q8jOP/aNH/r6eQvOBuvcgmUy58xoQX5nUH3
	XD/5UUg22OqnEts38oVkczuvK8vqA6VeZgHA3CdmBj0Tb/v1JmstCVhh8Mo6ndGydX9Db/bzIU8
	FY/z5zzI=
X-Received: by 2002:a17:902:db02:b0:25d:d848:1cca with SMTP id d9443c01a7336-27ed4a9210cmr101101315ad.35.1758932777143;
        Fri, 26 Sep 2025 17:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl/VvGzXBiAsVCQPQ5JSyszwVAPZ3CE+4Pj60nC2J+bmZi/TFe45otM20FRy6jWafZOYKjuQ==
X-Received: by 2002:a17:902:db02:b0:25d:d848:1cca with SMTP id d9443c01a7336-27ed4a9210cmr101100975ad.35.1758932776652;
        Fri, 26 Sep 2025 17:26:16 -0700 (PDT)
Received: from [10.73.53.199] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3acfsm66321885ad.20.2025.09.26.17.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 17:26:15 -0700 (PDT)
Message-ID: <89375a6d-782f-8b89-bf16-1d13b7a525ed@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 17:26:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 07/10] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
 <20250925022850.4133013-8-wesley.cheng@oss.qualcomm.com>
 <oecyjwj7ouufjbiq2fpvlhhuaof5agm22fdsruf3ppayiu4kkm@wvi4no53x64y>
 <5e9e2824-923c-1328-dd7a-a8b496c44a70@oss.qualcomm.com>
 <exe3i3lgeor6bdokdqzu2nlenlbtjgv6c3swek3phirsinjnhp@tb5x5lkf2i26>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <exe3i3lgeor6bdokdqzu2nlenlbtjgv6c3swek3phirsinjnhp@tb5x5lkf2i26>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HXfGyfQwwfPlgVh6B5h273nRCXHDZt88
X-Proofpoint-GUID: HXfGyfQwwfPlgVh6B5h273nRCXHDZt88
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d72f2a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sM_2IyiB1HmcMQZSuvwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+9GbSKpsUint
 LnSuUHlBb9FXDyw5fYnQgTiSBhtcbpW7aYGEMbJsZBiUVjR8w3BD6tnIEYVwM4raqQu6qLoVawV
 aIoiZIj9ADs05NDcBpqlyJ8vrj+V8C2QZFdssDFKWTeA27P6Vnzml/LhU0+lXL1ku9FHa3wVcv1
 2z6uo35PIcGxYIU17YDbCFxNN8d9QNiHKCX1YNVxoSvunXvwaZNtXIKqn6yo5mdf2OKhZ5YSOgZ
 QxHeo0feMbUPc/flxUQVsJzL5PvpJ6DuJqva0y9Nd5lmCGWNze0fxqKLo9VkblWwdRaYxinlZkT
 QIVoUlHd11wpp10/ARp5PA3ixN1kv3ewzHE3ZwtLCKcm/fa1FgwkLZ3V041frkjiSBgDJlJpi5D
 tAEXmtYVsSghCIaLntc7dy29RI92IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171



On 9/25/2025 7:11 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 05:14:30PM -0700, Wesley Cheng wrote:
>>
>>
>> On 9/24/2025 7:54 PM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 24, 2025 at 07:28:47PM -0700, Wesley Cheng wrote:
>>>> For SuperSpeed USB to work properly, there is a set of HW settings that
>>>> need to be programmed into the USB blocks within the QMP PHY.  Ensure that
>>>> these settings follow the latest settings mentioned in the HW programming
>>>> guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
>>>> new ways to define certain registers, such as the replacement of TXA/RXA
>>>> and TXB/RXB register sets.  This was replaced with the LALB register set.
>>>>
>>>> There are also some PHY init updates to modify the PCS MISC register space.
>>>> Without these, the QMP PHY PLL locking fails.
>>>>
>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>> ---
>>>>    drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 311 +++++++++++++++++++++-
>>>>    drivers/phy/qualcomm/phy-qcom-qmp.h       |   4 +
>>>>    2 files changed, 314 insertions(+), 1 deletion(-)
>>>>
>>>> +
>>>> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_misc_tbl[] = {
>>>> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1, 0x01),
>>>
>>> Why is this V4 all of sudden?
>>>
>>
>> Hi Dmitry,
>>
>> Will fix..
>>
>>>> +};
>>>> +
>>>> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_tbl[] = {
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG1, 0xc4),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG2, 0x89),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG3, 0x20),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_LOCK_DETECT_CONFIG6, 0x13),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_REFGEN_REQ_CONFIG1, 0x21),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_SIGDET_LVL, 0x55),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_L, 0xe7),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RCVR_DTCT_DLY_P1U2_H, 0x03),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_RSYNC_TIME, 0xa4),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_RX_CONFIG, 0x0a),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_TSYNC_DLY_TIME, 0x04),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG1, 0xd4),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_ALIGN_DETECT_CONFIG2, 0x30),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_PCS_TX_RX_CONFIG, 0x0c),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG1, 0x4b),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_USB43_PCS_EQ_CONFIG5, 0x10),
>>>> +};
>>>> +
>>>> +static const struct qmp_phy_init_tbl glymur_usb43dp_pcs_usb_tbl[] = {
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_LFPS_DET_HIGH_COUNT_VAL, 0xf8),
>>>> +	QMP_PHY_INIT_CFG(QPHY_V8_PCS_USB_RXEQTRAINING_DFE_TIME_S2, 0x07),
>>>> +};
>>>> +
>>>> @@ -1667,6 +1899,12 @@ static struct qmp_regulator_data qmp_phy_vreg_l[] = {
>>>>    	{ .name = "vdda-pll", .enable_load = 36000 },
>>>>    };
>>>> +static struct qmp_regulator_data qmp_phy_vreg_refgen[] = {
>>>> +	{ .name = "vdda-phy", .enable_load = 21800 },
>>>> +	{ .name = "vdda-pll", .enable_load = 36000 },
>>>> +	{ .name = "refgen", .enable_load = 936 },
>>>
>>> Is this a meaningful value?
>>>
>>
>> I need to adjust this value.  I just want the load for the regulators to be
>> in HPM, and after taking a look, looks like based on the rpmh regulator
>> table, I need to be voting 35000.
> 
> Please provide a value from the platform data rather than just the HPM
> boundary.
> 

OK, I referenced our power grid for the correct Ipeak for that 
particular regulator.  Will update this number accordingly.

Thanks
Wesley Cheng

>>
>> Thanks
>> Wesley Cheng
>>
>>>> +};
>>>> +
>>>>    static const u8 qmp_dp_v3_pre_emphasis_hbr3_hbr2[4][4] = {
>>>>    	{ 0x00, 0x0c, 0x15, 0x1a },
>>>>    	{ 0x02, 0x0e, 0x16, 0xff },
>>>
> 

