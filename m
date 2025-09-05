Return-Path: <linux-arm-msm+bounces-72169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A34B44B34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 03:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC2A6585A39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 01:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A789F1F0E50;
	Fri,  5 Sep 2025 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aI1gbfVm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B81E8342
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 01:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757035197; cv=none; b=WBwGn4T5MKpn3pBelCkZKnciyRyDj7eb6gn9zNhsEdm4ATAqCZOJGq2Jia57PS8Mmsp0GXMPRClTq6f1YAj8/bt0oXkCtPC1tYU/pniI5BFrq4rgH0V+ufotFGNyNbZjaA8JCpJpEaR0itiZHzX39wp+PLOUS9suzwWdN23QyOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757035197; c=relaxed/simple;
	bh=SPMEcY2kDMDcOkU3YM32ifT6JYq/BizXHmHM52QkltI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOS9lKvaYIqfXdpsfE2YwkXI8bFeOqsLZN5uIIfDPJwqxbXY+mb+h+iPW4chJQeaTjgt6CEAHvaM7QXzK9OfvqYSf7oO/ILC8DQm9Z7mZBlDVDzigOFHtfPGJaYaCMMpTMVmsCJ5W/ZFE2B7PcGwcJB80U7YHE4sqWHMd6mQrMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aI1gbfVm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IJDn9013622
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 01:19:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VNEYBWEWlXLwjtgy49W5gP23TQRvq9e3lj0aC3IZqHQ=; b=aI1gbfVmoKc/Gylu
	RIrUED54WIOkqqsp3wRXgPTSh5bS00HFjd5gr6qDogrJIUb8pI28vJYcnDdFgPEY
	NbJP3pGgtIQmzTS9NsvvWr3kMrEH3Zk4peFufXv26/hFULXBSUUqYZBBQUm0obP3
	WvLGyQ5d1O5SIKnOOVbc8sj+eDxyXY4UhzPIbtS3mHwqARKyZvZVB7SxJXbyUajP
	h/D9WLzVlIDRHe61Ac6eFCjRLbDpHntPv6qlYWRrdyedvmcWvu3IZip048bNO0rG
	ABH42ZYaPkGtF2EMhEgvZZqAmmPiKl3FyhcyhSo1qexS4kuZO9F+R4a5zQdyCVWv
	M7Jqfg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyda51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 01:19:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3234811cab3so1900491a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 18:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757035191; x=1757639991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNEYBWEWlXLwjtgy49W5gP23TQRvq9e3lj0aC3IZqHQ=;
        b=WO+RO+YcH1WUbMiy6h9A3wQ6RRZiGM62198uc8oT94RIDpAa78uQeqMsuvYkeZ75AG
         HaxXahJIvM5zkoibjVSeTTjdaRodMdNOM9JCu0eCXLo2IVV4gYa5FWyf9foVP1MkPpso
         ujVVTmXx4UrfAR549MqiH5Qng6Rvtvr9e/wF7GMtHQjRr0fsdRtDL/Y7mN1asK5dPSnq
         IG2i4A1Mkg8vZdHyEyc7rkIrzBvUietxQOo21/HiO5N5SJoy33YomCnM3r2jg2hvQP36
         WhJsEIwS/ez41TznA1JNRl/0rsK0aoJlW1ghGTNRKEBXYZSGr+aMmP6kNL5Kgw+zw4Rc
         Lc3g==
X-Forwarded-Encrypted: i=1; AJvYcCXCJ9S/PhjmJfMXX1au0IbLz6fSQwY1sggdTQI0+9D7eHakg+YbNPoB3/RWFWY6cbD2qrgiG+3hLZYlhYol@vger.kernel.org
X-Gm-Message-State: AOJu0YwcZClud/iOatk5p60BBp+dixWncTD3X6TQx8j7KhD9zvGwothn
	jFKozo1giYgDSxhOMhj98cTSOBjrnVezN+BlpRbzzZSZxsvifGZbOXEj2w3tVs98lAqgtyXd4r4
	/vO+QZnz3Gtb1DvN4yn/sIhzIjgjpNiH9nRb8zS5FM3BVbe9Yz+we7GX4EKCFkFl2uJZ4
X-Gm-Gg: ASbGncujvOj1/R5CiAz0p4Cu5vwVfl2qGqamtyKHVXdJE/EzvYkFQSwc3Cur4dt9jfL
	abPWnChsAfvkQzhS8nNBXZYeNt2ILpjaOTdLGk6AelIf9VLdBU6pmb3ZGvL7LPyShbFhj70pGsu
	He37N0scfw6wHloKloRLPyadhJ6ZVI1gY0iSXZ8cEC9g+hslL/9AoHRLx1wIGgl6GoetomZDpoX
	TNQkfYIyGZGjkc5jo1GSW9Udl7YS+cLJcE4tr11rg5bMaAY2X/0Df3IINz/cXIGn50g/iH2hUu+
	QiVz4o3KzwyqfjeZfdMNa6pZOLPuZX0a4Lo32ivGaKRUEKKhWb1x6EmK+JcZ+Gx7p1Gs0AYmFMn
	EhY/G0jOw6UA70SHRXub40rg4P78Ho/UJ
X-Received: by 2002:a17:90b:2782:b0:32b:bac7:5a41 with SMTP id 98e67ed59e1d1-32bbac75a84mr2838349a91.37.1757035191075;
        Thu, 04 Sep 2025 18:19:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXd5Cjdl3Ro9wdntvWhxID9yfxphXvSndLq4UDHA71bD9sJubBRxncTTikTpAe34VSTnPMUQ==
X-Received: by 2002:a17:90b:2782:b0:32b:bac7:5a41 with SMTP id 98e67ed59e1d1-32bbac75a84mr2838297a91.37.1757035190465;
        Thu, 04 Sep 2025 18:19:50 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm26971003a91.16.2025.09.04.18.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 18:19:49 -0700 (PDT)
Message-ID: <76d12f47-bdb0-404a-9371-788e116c3474@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 09:19:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/8] power: supply: qcom_battmgr: Add charge control
 support
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250826-qcom_battmgr_update-v3-0-74ea410ef146@oss.qualcomm.com>
 <20250826-qcom_battmgr_update-v3-7-74ea410ef146@oss.qualcomm.com>
 <f6372ebb-c237-4409-b3a9-8f458be85034@linaro.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <f6372ebb-c237-4409-b3a9-8f458be85034@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68ba3ab8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=enrrldOF_p-Js0IFzaQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: OXB-obkBdo4uECfhtj3rPppUbG9WZUQe
X-Proofpoint-ORIG-GUID: OXB-obkBdo4uECfhtj3rPppUbG9WZUQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXy3DOu0V4LDJq
 PDMEMJUEGMeOT7GqrLQsTCN18nLcNigh4u1pvnvkwaAj2FRx/Rksso/NeAQEitA+mSCYgTllFDi
 w6yz4QC6hUETDnJkZQWCoeaIoPdcmPSX5zWU/S64PqqTFwJhUFjDfjX4tWOjx6t+U3xKXAL5zG+
 frN3gsgPHFf5Wjg5kuS/ev/MMp80DU/33VzFTcsLGoRgxTQJ0uT69R/UVlBkMcj2DBHZ+62UL+W
 lEjhY/97S+ohI/GHnc5xrDR24uZM94U1llSguJGus9BbAytxZMEy76oCwBMIpmzczJFgV3lea8q
 aLST6TomHtQyxYkiVEsWfzKI2vmuoNC6yO7iZNMMWzH+RiCFDvxwgQwrb+gCJr+VQWNFBGUYXGd
 ToQx4Q/e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101


On 9/3/2025 4:29 PM, Neil Armstrong wrote:
> On 26/08/2025 09:18, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> Add charge control support for SM8550 and X1E80100. It's supported
>> with below two power supply properties:
>>
>> charge_control_end_threshold: The battery SoC (State of Charge)
>> threshold at which the charging should be terminated.
>>
>> charge_control_start_threshold: The battery SoC threshold at
>> which the charging should be resumed.
>>
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/power/supply/qcom_battmgr.c | 290 
>> +++++++++++++++++++++++++++++++++++-
>>   1 file changed, 283 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/power/supply/qcom_battmgr.c 
>> b/drivers/power/supply/qcom_battmgr.c
>> index 
>> 174d3f83ac2b070bb90c21a498686e91cc629ebe..23c68eb942f1b213f634e31a45420b3e113e2764 
>> 100644
>> --- a/drivers/power/supply/qcom_battmgr.c
>> +++ b/drivers/power/supply/qcom_battmgr.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/auxiliary_bus.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>> +#include <linux/nvmem-consumer.h>
>>   #include <linux/of_device.h>
>>   #include <linux/power_supply.h>
>>   #include <linux/property.h>
>> @@ -68,6 +69,9 @@ enum qcom_battmgr_variant {
>>   #define BATT_RESISTANCE            21
>>   #define BATT_POWER_NOW            22
>>   #define BATT_POWER_AVG            23
>> +#define BATT_CHG_CTRL_EN        24
>> +#define BATT_CHG_CTRL_START_THR        25
>> +#define BATT_CHG_CTRL_END_THR        26
>>     #define BATTMGR_USB_PROPERTY_GET    0x32
>>   #define BATTMGR_USB_PROPERTY_SET    0x33
>> @@ -92,6 +96,13 @@ enum qcom_battmgr_variant {
>>   #define WLS_TYPE            5
>>   #define WLS_BOOST_EN            6
>>   +#define BATTMGR_CHG_CTRL_LIMIT_EN    0x48
>> +#define CHARGE_CTRL_START_THR_MIN    50
>> +#define CHARGE_CTRL_START_THR_MAX    95
>> +#define CHARGE_CTRL_END_THR_MIN        55
>> +#define CHARGE_CTRL_END_THR_MAX        100
>> +#define CHARGE_CTRL_DELTA_SOC        5
>> +
>>   struct qcom_battmgr_enable_request {
>>       struct pmic_glink_hdr hdr;
>>       __le32 battery_id;
>> @@ -126,6 +137,13 @@ struct qcom_battmgr_discharge_time_request {
>>       __le32 reserved;
>>   };
>>   +struct qcom_battmgr_charge_ctrl_request {
>> +    struct pmic_glink_hdr hdr;
>> +    __le32 enable;
>> +    __le32 target_soc;
>> +    __le32 delta_soc;
>> +};
>> +
>>   struct qcom_battmgr_message {
>>       struct pmic_glink_hdr hdr;
>>       union {
>> @@ -238,6 +256,8 @@ struct qcom_battmgr_info {
>>       unsigned int capacity_warning;
>>       unsigned int cycle_count;
>>       unsigned int charge_count;
>> +    unsigned int charge_ctrl_start;
>> +    unsigned int charge_ctrl_end;
>>       char model_number[BATTMGR_STRING_LEN];
>>       char serial_number[BATTMGR_STRING_LEN];
>>       char oem_info[BATTMGR_STRING_LEN];
>> @@ -426,6 +446,8 @@ static const u8 sm8350_bat_prop_map[] = {
>>       [POWER_SUPPLY_PROP_INTERNAL_RESISTANCE] = BATT_RESISTANCE,
>>       [POWER_SUPPLY_PROP_STATE_OF_HEALTH] = BATT_SOH,
>>       [POWER_SUPPLY_PROP_POWER_NOW] = BATT_POWER_NOW,
>> +    [POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD] = 
>> BATT_CHG_CTRL_START_THR,
>> +    [POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] = 
>> BATT_CHG_CTRL_END_THR,
>>   };
>>     static int qcom_battmgr_bat_sm8350_update(struct qcom_battmgr 
>> *battmgr,
>> @@ -496,7 +518,8 @@ static int qcom_battmgr_bat_get_property(struct 
>> power_supply *psy,
>>       if (!battmgr->service_up)
>>           return -EAGAIN;
>>   -    if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>> +        battmgr->variant == QCOM_BATTMGR_X1E80100)
>>           ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);
>>       else
>>           ret = qcom_battmgr_bat_sm8350_update(battmgr, psp);
>> @@ -601,6 +624,12 @@ static int qcom_battmgr_bat_get_property(struct 
>> power_supply *psy,
>>       case POWER_SUPPLY_PROP_TIME_TO_FULL_AVG:
>>           val->intval = battmgr->status.charge_time;
>>           break;
>> +    case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
>> +        val->intval = battmgr->info.charge_ctrl_start;
>> +        break;
>> +    case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>> +        val->intval = battmgr->info.charge_ctrl_end;
>> +        break;
>>       case POWER_SUPPLY_PROP_MANUFACTURE_YEAR:
>>           val->intval = battmgr->info.year;
>>           break;
>> @@ -626,6 +655,149 @@ static int qcom_battmgr_bat_get_property(struct 
>> power_supply *psy,
>>       return 0;
>>   }
>>   +static int qcom_battmgr_set_charge_control(struct qcom_battmgr 
>> *battmgr,
>> +                       u32 target_soc, u32 delta_soc)
>> +{
>> +    struct qcom_battmgr_charge_ctrl_request request = {
>> +        .hdr.owner = cpu_to_le32(PMIC_GLINK_OWNER_BATTMGR),
>> +        .hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP),
>> +        .hdr.opcode = cpu_to_le32(BATTMGR_CHG_CTRL_LIMIT_EN),
>> +        .enable = cpu_to_le32(1),
>> +        .target_soc = cpu_to_le32(target_soc),
>> +        .delta_soc = cpu_to_le32(delta_soc),
>> +    };
>> +
>> +    return qcom_battmgr_request(battmgr, &request, sizeof(request));
>> +}
>> +
>> +static int qcom_battmgr_set_charge_start_threshold(struct 
>> qcom_battmgr *battmgr, int start_soc)
>> +{
>> +    u32 target_soc, delta_soc;
>> +    int ret;
>> +
>> +    if (start_soc < CHARGE_CTRL_START_THR_MIN ||
>> +        start_soc > CHARGE_CTRL_START_THR_MAX) {
>> +        dev_err(battmgr->dev, "charge control start threshold exceed 
>> range: [%u - %u]\n",
>> +            CHARGE_CTRL_START_THR_MIN, CHARGE_CTRL_START_THR_MAX);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /*
>> +     * If the new start threshold is larger than the old end threshold,
>> +     * move the end threshold one step (DELTA_SOC) after the new start
>> +     * threshold.
>> +     */
>> +    if (start_soc > battmgr->info.charge_ctrl_end) {
>> +        target_soc = start_soc + CHARGE_CTRL_DELTA_SOC;
>> +        target_soc = min_t(u32, target_soc, CHARGE_CTRL_END_THR_MAX);
>> +        delta_soc = target_soc - start_soc;
>> +        delta_soc = min_t(u32, delta_soc, CHARGE_CTRL_DELTA_SOC);
>> +    } else {
>> +        target_soc =  battmgr->info.charge_ctrl_end;
>> +        delta_soc = battmgr->info.charge_ctrl_end - start_soc;
>> +    }
>> +
>> +    mutex_lock(&battmgr->lock);
>> +    ret = qcom_battmgr_set_charge_control(battmgr, target_soc, 
>> delta_soc);
>> +    mutex_unlock(&battmgr->lock);
>> +    if (!ret) {
>> +        battmgr->info.charge_ctrl_start = start_soc;
>> +        battmgr->info.charge_ctrl_end = target_soc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr 
>> *battmgr, int end_soc)
>> +{
>> +    u32 delta_soc = CHARGE_CTRL_DELTA_SOC;
>> +    int ret;
>> +
>> +    if (end_soc < CHARGE_CTRL_END_THR_MIN ||
>> +        end_soc > CHARGE_CTRL_END_THR_MAX) {
>> +        dev_err(battmgr->dev, "charge control end threshold exceed 
>> range: [%u - %u]\n",
>> +            CHARGE_CTRL_END_THR_MIN, CHARGE_CTRL_END_THR_MAX);
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (battmgr->info.charge_ctrl_start && end_soc > 
>> battmgr->info.charge_ctrl_start)
>> +        delta_soc = end_soc - battmgr->info.charge_ctrl_start;
>> +
>> +    mutex_lock(&battmgr->lock);
>> +    ret = qcom_battmgr_set_charge_control(battmgr, end_soc, delta_soc);
>> +    mutex_unlock(&battmgr->lock);
>> +    if (!ret) {
>> +        battmgr->info.charge_ctrl_start = end_soc - delta_soc;
>> +        battmgr->info.charge_ctrl_end = end_soc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int qcom_battmgr_charge_control_thresholds_init(struct 
>> qcom_battmgr *battmgr)
>> +{
>> +    int ret;
>> +    u8 en, end_soc, start_soc, delta_soc;
>> +
>> +    ret = nvmem_cell_read_u8(battmgr->dev->parent, 
>> "charge_limit_en", &en);
>> +    if (!ret && en != 0) {
>> +        ret = nvmem_cell_read_u8(battmgr->dev->parent, 
>> "charge_limit_end", &end_soc);
>> +        if (ret < 0)
>> +            return ret;
>> +
>> +        ret = nvmem_cell_read_u8(battmgr->dev->parent, 
>> "charge_limit_delta", &delta_soc);
>> +        if (ret < 0)
>> +            return ret;
>> +
>> +        if (delta_soc >= end_soc)
>> +            return -EINVAL;
>> +
>> +        start_soc = end_soc - delta_soc;
>> +        end_soc = clamp(end_soc, CHARGE_CTRL_END_THR_MIN, 
>> CHARGE_CTRL_END_THR_MAX);
>> +        start_soc = clamp(start_soc, CHARGE_CTRL_START_THR_MIN, 
>> CHARGE_CTRL_START_THR_MAX);
>> +
>> +        battmgr->info.charge_ctrl_start = start_soc;
>> +        battmgr->info.charge_ctrl_end = end_soc;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int qcom_battmgr_bat_is_writeable(struct power_supply *psy,
>> +                     enum power_supply_property psp)
>> +{
>> +    switch (psp) {
>> +    case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
>> +    case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>> +        return 1;
>> +    default:
>> +        return 0;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int qcom_battmgr_bat_set_property(struct power_supply *psy,
>> +                     enum power_supply_property psp,
>> +                     const union power_supply_propval *pval)
>> +{
>> +    struct qcom_battmgr *battmgr = power_supply_get_drvdata(psy);
>> +
>> +    if (!battmgr->service_up)
>> +        return -EAGAIN;
>> +
>> +    switch (psp) {
>> +    case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
>> +        return qcom_battmgr_set_charge_start_threshold(battmgr, 
>> pval->intval);
>> +    case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
>> +        return qcom_battmgr_set_charge_end_threshold(battmgr, 
>> pval->intval);
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static const enum power_supply_property sc8280xp_bat_props[] = {
>>       POWER_SUPPLY_PROP_STATUS,
>>       POWER_SUPPLY_PROP_PRESENT,
>> @@ -659,6 +831,43 @@ static const struct power_supply_desc 
>> sc8280xp_bat_psy_desc = {
>>       .get_property = qcom_battmgr_bat_get_property,
>>   };
>>   +static const enum power_supply_property x1e80100_bat_props[] = {
>> +    POWER_SUPPLY_PROP_STATUS,
>> +    POWER_SUPPLY_PROP_PRESENT,
>> +    POWER_SUPPLY_PROP_TECHNOLOGY,
>> +    POWER_SUPPLY_PROP_CYCLE_COUNT,
>> +    POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN,
>> +    POWER_SUPPLY_PROP_VOLTAGE_NOW,
>> +    POWER_SUPPLY_PROP_POWER_NOW,
>> +    POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
>> +    POWER_SUPPLY_PROP_CHARGE_FULL,
>> +    POWER_SUPPLY_PROP_CHARGE_EMPTY,
>> +    POWER_SUPPLY_PROP_CHARGE_NOW,
>> +    POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN,
>> +    POWER_SUPPLY_PROP_ENERGY_FULL,
>> +    POWER_SUPPLY_PROP_ENERGY_EMPTY,
>> +    POWER_SUPPLY_PROP_ENERGY_NOW,
>> +    POWER_SUPPLY_PROP_TEMP,
>> +    POWER_SUPPLY_PROP_MANUFACTURE_YEAR,
>> +    POWER_SUPPLY_PROP_MANUFACTURE_MONTH,
>> +    POWER_SUPPLY_PROP_MANUFACTURE_DAY,
>> +    POWER_SUPPLY_PROP_MODEL_NAME,
>> +    POWER_SUPPLY_PROP_MANUFACTURER,
>> +    POWER_SUPPLY_PROP_SERIAL_NUMBER,
>> +    POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD,
>> +    POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>
> Is it expected to _not_ have POWER_SUPPLY_PROP_STATE_OF_HEALTH & 
> POWER_SUPPLY_PROP_INTERNAL_RESISTANCE here ?
>
> Neil

No, X1E80100 platform doesn't have battery resistance/SOH information 
exported in battery management firmware


>
>> +};
>> +
>> +static const struct power_supply_desc x1e80100_bat_psy_desc = {
>> +    .name = "qcom-battmgr-bat",
>> +    .type = POWER_SUPPLY_TYPE_BATTERY,
>> +    .properties = x1e80100_bat_props,
>> +    .num_properties = ARRAY_SIZE(x1e80100_bat_props),
>> +    .get_property = qcom_battmgr_bat_get_property,
>> +    .set_property = qcom_battmgr_bat_set_property,
>> +    .property_is_writeable = qcom_battmgr_bat_is_writeable,
>> +};
>> +
>>   static const enum power_supply_property sm8350_bat_props[] = {
>>       POWER_SUPPLY_PROP_STATUS,
>>       POWER_SUPPLY_PROP_HEALTH,
>> @@ -691,6 +900,42 @@ static const struct power_supply_desc 
>> sm8350_bat_psy_desc = {
>>       .get_property = qcom_battmgr_bat_get_property,
>>   };
>>   +static const enum power_supply_property sm8550_bat_props[] = {
>> +    POWER_SUPPLY_PROP_STATUS,
>> +    POWER_SUPPLY_PROP_HEALTH,
>> +    POWER_SUPPLY_PROP_PRESENT,
>> +    POWER_SUPPLY_PROP_CHARGE_TYPE,
>> +    POWER_SUPPLY_PROP_CAPACITY,
>> +    POWER_SUPPLY_PROP_VOLTAGE_OCV,
>> +    POWER_SUPPLY_PROP_VOLTAGE_NOW,
>> +    POWER_SUPPLY_PROP_VOLTAGE_MAX,
>> +    POWER_SUPPLY_PROP_CURRENT_NOW,
>> +    POWER_SUPPLY_PROP_TEMP,
>> +    POWER_SUPPLY_PROP_TECHNOLOGY,
>> +    POWER_SUPPLY_PROP_CHARGE_COUNTER,
>> +    POWER_SUPPLY_PROP_CYCLE_COUNT,
>> +    POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
>> +    POWER_SUPPLY_PROP_CHARGE_FULL,
>> +    POWER_SUPPLY_PROP_MODEL_NAME,
>> +    POWER_SUPPLY_PROP_TIME_TO_FULL_AVG,
>> +    POWER_SUPPLY_PROP_TIME_TO_EMPTY_AVG,
>> +    POWER_SUPPLY_PROP_INTERNAL_RESISTANCE,
>> +    POWER_SUPPLY_PROP_STATE_OF_HEALTH,
>> +    POWER_SUPPLY_PROP_POWER_NOW,
>> +    POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD,
>> +    POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
>> +};
>> +
>> +static const struct power_supply_desc sm8550_bat_psy_desc = {
>> +    .name = "qcom-battmgr-bat",
>> +    .type = POWER_SUPPLY_TYPE_BATTERY,
>> +    .properties = sm8550_bat_props,
>> +    .num_properties = ARRAY_SIZE(sm8550_bat_props),
>> +    .get_property = qcom_battmgr_bat_get_property,
>> +    .set_property = qcom_battmgr_bat_set_property,
>> +    .property_is_writeable = qcom_battmgr_bat_is_writeable,
>> +};
>> +
>>   static int qcom_battmgr_ac_get_property(struct power_supply *psy,
>>                       enum power_supply_property psp,
>>                       union power_supply_propval *val)
>> @@ -766,7 +1011,8 @@ static int qcom_battmgr_usb_get_property(struct 
>> power_supply *psy,
>>       if (!battmgr->service_up)
>>           return -EAGAIN;
>>   -    if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>> +        battmgr->variant == QCOM_BATTMGR_X1E80100)
>>           ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);
>>       else
>>           ret = qcom_battmgr_usb_sm8350_update(battmgr, psp);
>> @@ -888,7 +1134,8 @@ static int qcom_battmgr_wls_get_property(struct 
>> power_supply *psy,
>>       if (!battmgr->service_up)
>>           return -EAGAIN;
>>   -    if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>> +        battmgr->variant == QCOM_BATTMGR_X1E80100)
>>           ret = qcom_battmgr_bat_sc8280xp_update(battmgr, psp);
>>       else
>>           ret = qcom_battmgr_wls_sm8350_update(battmgr, psp);
>> @@ -1085,6 +1332,9 @@ static void 
>> qcom_battmgr_sc8280xp_callback(struct qcom_battmgr *battmgr,
>>       case BATTMGR_BAT_CHARGE_TIME:
>>           battmgr->status.charge_time = le32_to_cpu(resp->time);
>>           break;
>> +    case BATTMGR_CHG_CTRL_LIMIT_EN:
>> +        battmgr->error = 0;
>> +        break;
>>       default:
>>           dev_warn(battmgr->dev, "unknown message %#x\n", opcode);
>>           break;
>> @@ -1198,6 +1448,12 @@ static void 
>> qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>>           case BATT_POWER_NOW:
>>               battmgr->status.power_now = 
>> le32_to_cpu(resp->intval.value);
>>               break;
>> +        case BATT_CHG_CTRL_START_THR:
>> +            battmgr->info.charge_ctrl_start = 
>> le32_to_cpu(resp->intval.value);
>> +            break;
>> +        case BATT_CHG_CTRL_END_THR:
>> +            battmgr->info.charge_ctrl_end = 
>> le32_to_cpu(resp->intval.value);
>> +            break;
>>           default:
>>               dev_warn(battmgr->dev, "unknown property %#x\n", 
>> property);
>>               break;
>> @@ -1280,6 +1536,7 @@ static void qcom_battmgr_sm8350_callback(struct 
>> qcom_battmgr *battmgr,
>>           }
>>           break;
>>       case BATTMGR_REQUEST_NOTIFICATION:
>> +    case BATTMGR_CHG_CTRL_LIMIT_EN:
>>           battmgr->error = 0;
>>           break;
>>       default:
>> @@ -1299,7 +1556,8 @@ static void qcom_battmgr_callback(const void 
>> *data, size_t len, void *priv)
>>         if (opcode == BATTMGR_NOTIFICATION)
>>           qcom_battmgr_notification(battmgr, data, len);
>> -    else if (battmgr->variant == QCOM_BATTMGR_SC8280XP)
>> +    else if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>> +         battmgr->variant == QCOM_BATTMGR_X1E80100)
>>           qcom_battmgr_sc8280xp_callback(battmgr, data, len);
>>       else
>>           qcom_battmgr_sm8350_callback(battmgr, data, len);
>> @@ -1346,11 +1604,13 @@ static char *qcom_battmgr_battery[] = { 
>> "battery" };
>>   static int qcom_battmgr_probe(struct auxiliary_device *adev,
>>                     const struct auxiliary_device_id *id)
>>   {
>> +    const struct power_supply_desc *psy_desc;
>>       struct power_supply_config psy_cfg_supply = {};
>>       struct power_supply_config psy_cfg = {};
>>       const struct of_device_id *match;
>>       struct qcom_battmgr *battmgr;
>>       struct device *dev = &adev->dev;
>> +    int ret;
>>         battmgr = devm_kzalloc(dev, sizeof(*battmgr), GFP_KERNEL);
>>       if (!battmgr)
>> @@ -1376,8 +1636,19 @@ static int qcom_battmgr_probe(struct 
>> auxiliary_device *adev,
>>       else
>>           battmgr->variant = QCOM_BATTMGR_SM8350;
>>   -    if (battmgr->variant == QCOM_BATTMGR_SC8280XP) {
>> -        battmgr->bat_psy = devm_power_supply_register(dev, 
>> &sc8280xp_bat_psy_desc, &psy_cfg);
>> +    ret = qcom_battmgr_charge_control_thresholds_init(battmgr);
>> +    if (ret < 0)
>> +        return dev_err_probe(dev, ret,
>> +                     "failed to init battery charge control 
>> thresholds\n");
>> +
>> +    if (battmgr->variant == QCOM_BATTMGR_SC8280XP ||
>> +        battmgr->variant == QCOM_BATTMGR_X1E80100) {
>> +        if (battmgr->variant == QCOM_BATTMGR_X1E80100)
>> +            psy_desc = &x1e80100_bat_psy_desc;
>> +        else
>> +            psy_desc = &sc8280xp_bat_psy_desc;
>> +
>> +        battmgr->bat_psy = devm_power_supply_register(dev, psy_desc, 
>> &psy_cfg);
>>           if (IS_ERR(battmgr->bat_psy))
>>               return dev_err_probe(dev, PTR_ERR(battmgr->bat_psy),
>>                            "failed to register battery power supply\n");
>> @@ -1397,7 +1668,12 @@ static int qcom_battmgr_probe(struct 
>> auxiliary_device *adev,
>>               return dev_err_probe(dev, PTR_ERR(battmgr->wls_psy),
>>                            "failed to register wireless charing power 
>> supply\n");
>>       } else {
>> -        battmgr->bat_psy = devm_power_supply_register(dev, 
>> &sm8350_bat_psy_desc, &psy_cfg);
>> +        if (battmgr->variant == QCOM_BATTMGR_SM8550)
>> +            psy_desc = &sm8550_bat_psy_desc;
>> +        else
>> +            psy_desc = &sm8350_bat_psy_desc;
>> +
>> +        battmgr->bat_psy = devm_power_supply_register(dev, psy_desc, 
>> &psy_cfg);
>>           if (IS_ERR(battmgr->bat_psy))
>>               return dev_err_probe(dev, PTR_ERR(battmgr->bat_psy),
>>                            "failed to register battery power supply\n");
>>
>

