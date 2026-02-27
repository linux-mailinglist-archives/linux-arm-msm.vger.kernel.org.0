Return-Path: <linux-arm-msm+bounces-94434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ih1NHp5oWkUtgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:01:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A7E1B64EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0454D304565C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 11:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615B53E8C47;
	Fri, 27 Feb 2026 11:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKzhRSGc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJ6swG0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8CC3126DA
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772190064; cv=none; b=UjSAZ3P1/qwwKUErbF+369tdd9F0EipG0xunrnt/Yl25zh5aZWrhoSiVWR5r6avxaD4XSKgrKEQeQOtYEof3a/r504wztqdhSabow9S0d7w4sZZiDiYHN+2YB3H+L1A6FJ58UfsmGxG0i9biE6j3abeAXqc4TwyLywstbiQIzw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772190064; c=relaxed/simple;
	bh=nnX1dfVHGU3BUR2MYHa/QsBvwb2HUZkPfqijX40+JF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nIwqCe4S8BgaJkvJHrB0j5I6DbahIH0JmLmxjODpet3zdJvH7wcmGwxtT06UGkEr6PXnlO7Vjy0vpqvzMXLFTyOnaoqHTwCGBRGBbS2x3UpeQklL3Yesxobf2Y2H3scd/d73ZTICrTe7RwcCI/dRpeRSxaIhlfW0ZPBwzX/XPAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKzhRSGc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJ6swG0Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R4GZ272663266
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NCtcr010Ca6Gw1uJ4Xsw+K8f8kTmPEsbbllDwvyZmrw=; b=FKzhRSGcvDDkopHH
	BBa8VqbotoYuR/3p90F/b3+byUHjoXh4BGw21AU8JPOmXWbqF+7MWgv1xxWKf5ur
	XpRPVw2H0LeSjMqn1qESZSLUf0AWiYKXGaL91AS6W4FUksJZvms35/yWL4M6b7kg
	dFNNwYc0zvJKI3ytqU4kdqMdT9Kr12efj1GmEFnfeK/KJ2HWONLRzpSikrmadt88
	oi3eKW+WDgT5ECAbUcYXZAayCL5uhNgCks7MLJXbrvQpKlouvSTvzidIC4Xi9fHL
	pxagNrvrcS6YdjkJ4WqQIOvHxs7gwz0XPng9dHoQdtc0zvQoB2i/AFr5/pJtZ0Q1
	AmmcZg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck43r96v0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 11:01:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fdf3c935acso468694137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 03:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772190061; x=1772794861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCtcr010Ca6Gw1uJ4Xsw+K8f8kTmPEsbbllDwvyZmrw=;
        b=TJ6swG0ZIGC8AJqS1xthF6jV9+sa0j2jXGpCUN/Yx9kVRYgkkow1sFmdPmJ1o060u0
         ERH4EfI1/g53otPU9cvp4UOJxctxfxhltLgChzzo1NfdOSmxErxlcoH8OJEzaI61NdZq
         FXst5c874VaQTiR5rsbh4bQWmH74JRi+616fhdaeB4JRuWo0F4v/1Gq7/8iX5FsfsZ59
         ivcJFxD3KepfbOPH8YwDwDT/UIvafLy5PL+B13UTdidMA6ye8CXlSqtmoA9636sePMwX
         go3KhtgDaU7V8FUVcoZoPZUtzkPmDIfacJAFGYH0BMIKJm7w2lPbhYoTXeiVoKKiSlHo
         SPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772190061; x=1772794861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCtcr010Ca6Gw1uJ4Xsw+K8f8kTmPEsbbllDwvyZmrw=;
        b=p5i6NOt2AUU1VFZeA4pcLFgdXBrkzk/Fl9BKpOUvRxjevKsv6Cp5unNK6pNeix29Mt
         ajThVvYWXcVDuvHDFCEiJlrazCrd1CMpWwDCCnwRUkVT5cW29CP7u2i++dnwIK/3wcK0
         ItpHlhYZAqIpFrtXhtUGPs0mGqhquu08UQlSzpaB6+9d/lkCnG5tKgFDTx7Ahaz7N3oT
         Hz9I6EMk5kEUd8ys45GsaDgv3mF3+PzQgOjuett6hSa+woQ2LNUfEkjzxBQ70gK6dImJ
         PMm07apiB4OQ14SEMlBwezUHzJ+QYWSHPvhuzdEeykA5bcDg0kztu44iWL6hzrOXxmtN
         R14g==
X-Gm-Message-State: AOJu0YwlnNw5LUhn1bqxqQiDHEZVgoE8/0MAb8vjWqHSdmFjw0Uc6Iob
	vgMPBfT3Z+UuCBvJZ4ybPkQPzIhfJ3jDz6Ui32CB5ErcIaAqqisMXs3uzn/Lwr0D6BajnZCP81U
	i6+bru4Wk9dJSbaFf5yzIfMiw7ggwvs3pmzey+Z7VivPROVInS6Ze0k1xrXhvG+padpIU
X-Gm-Gg: ATEYQzya8Ng1lvDpW6T2av4lOq8hFYs9apXJfBnylSmhta4fNOWOMerwUEhNJWGBjP0
	8UiwvNegA4LNPqOvWy7dXPuhAjovf4rDdOy9reMH53gZpnWwNEG4vlj8LEo9KUJ7R8ktfTGie2g
	dRE/KoyqKGadSAvDm9ydA74P8z2/r/Fh9VRDRMLdD/tjZ2LOMM8wBpB6qmAc72f8VKV2nqd5uLF
	YWbLl3poMKnuTnXZvuRK6hn28cGhzOQfujNd0225fGy4T3mL54nxknV067FMLCJb9laj0lIK4BM
	dny8oKDuEwKDCDplpu6lVnh7lZ5nz4NgjkdWJiDNRSPLKVDLMmqUvXkCSGc5xG8u2cLCT5OhK0I
	RqoiMRzHpCTR9O2Gy9Y8ONoGPx+7+JBUwAqma659lAq0VcN+hF8YQVVzgKJtdFOdQEd9tu9H61t
	ng1uE=
X-Received: by 2002:a05:6102:160c:b0:5ff:2a5a:30ce with SMTP id ada2fe7eead31-5ff31f683a3mr617821137.0.1772190060430;
        Fri, 27 Feb 2026 03:01:00 -0800 (PST)
X-Received: by 2002:a05:6102:160c:b0:5ff:2a5a:30ce with SMTP id ada2fe7eead31-5ff31f683a3mr617807137.0.1772190059947;
        Fri, 27 Feb 2026 03:00:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd35f3esm1176612a12.1.2026.02.27.03.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 03:00:56 -0800 (PST)
Message-ID: <43a7c132-e8d9-4f6e-a0f1-93fd21eb647f@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 12:00:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] watchdog: qcom: add support to get the bootstatus
 from IMEM
To: Guenter Roeck <linux@roeck-us.net>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20260226-wdt_reset_reason-v8-0-011c3a8cb6ff@oss.qualcomm.com>
 <20260226-wdt_reset_reason-v8-4-011c3a8cb6ff@oss.qualcomm.com>
 <52bf19af-7cf3-4e20-89ad-813fad8aa9c1@roeck-us.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <52bf19af-7cf3-4e20-89ad-813fad8aa9c1@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v0IfDZiqwfypY9w04wxpZrxUMo2F0IVA
X-Proofpoint-GUID: v0IfDZiqwfypY9w04wxpZrxUMo2F0IVA
X-Authority-Analysis: v=2.4 cv=DOqCIiNb c=1 sm=1 tr=0 ts=69a1796e cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=x4KJXlwIBXNxyCGXZ3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5NiBTYWx0ZWRfXxnYrjPo8s7eO
 TcEBXBs0gFtTAnu3irjAdtpF+SEEtHRbmNymkaTZ4AcRL4VVcu4gtQNmFPPnbPIP2tWvadUyJFc
 PrPU9aIMxXk/z3aDKSt52MesJMX5e6C3UsjTpj7M224tmHyMiHHtia0m6OgxvWjdcm9YJNFt1oD
 s59c5chTMB7ZDwsPE6J+0sFgmM5FbM1AN2mWqHCHBxOELINJLHE9+SMA2iCz3Lpj6Ic6mGPdUPX
 3PB1detya7Rgb5//a3aQsZjeGm5Ut0K9TxP4VU61r13aUpj33P/3ZBZR+LWiYelJn1RFsHpdU6L
 JjPsgCctIU4CSFYbAHEwtgRmO4vIAMWYmHQ/ulsgNquN067tNQUr02YaOkC1hfZYY0DfWfLaWkB
 fk7NgyL245kWnducIvlR3FBt6iSP1aD34V/xOJB0i73KXq2yD3xchmvDa22tjYsXXa0eFeEehLz
 7Lj2DiueAiNDkiU/kmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94434-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RSPAMD_URIBL_FAIL(0.00)[oss.qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75A7E1B64EF
X-Rspamd-Action: no action

On 2/27/26 8:42 AM, Guenter Roeck wrote:
> On 2/26/26 08:59, Kathiravan Thirumoorthy wrote:
>> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
>> in the WDT_STS register is cleared. To identify if the system was
>> restarted due to WDT expiry, XBL update the information in the IMEM region.
>> Update the driver to read the restart reason from IMEM and populate the
>> bootstatus accordingly.
>>
>> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
>> as below:
>>
>> cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
>> 32
>>
>> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
>> function qcom_wdt_get_bootstatus() to read the restart reason from
>> IMEM.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v8:
>>     - Picked up the R-b tag
>>     - Updated the comment as suggested by Konrad
>> Changes in v7:
>>     - no changes
>> Changes in v6:
>>     - Reworked to get the restart reason code from SRAM region
>>
>> Changes in v5:
>>     - Use dev_err_probe instead of dev_err
>>
>> Changes in v4:
>>     - Kept only WDIOF_CARDRESET and dropped other codes
>>     - Renamed qcom_wdt_get_reason_reason() to
>>       qcom_wdt_get_bootstatus()
>>     - Moved the existing check inside qcom_wdt_get_bootstatus()
>>     - Dropped the device data and put all the details in the DT node
>>
>> Changes in v3:
>>     - Split the introduction of device data into separate patch
>>     - s/bootloaders/XBL - for clarity of which bootloader is
>>       involved
>>     - Mention the sysfs path on to extract this information
>>     - s/compatible/imem_compatible in the device data structure to
>>       avoid the confusion / better naming
>>
>> Changes in v2:
>>     - Use the syscon API to access the IMEM region
>>     - Handle the error cases returned by qcom_wdt_get_restart_reason
>>     - Define device specific data to retrieve the IMEM compatible,
>>       offset and the value for non secure WDT, which allows to
>>       extend the support for other SoCs
>> ---
>>   drivers/watchdog/qcom-wdt.c | 42 ++++++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 40 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
>> index dfaac5995c84c1f377023e6e62770c5548528a4c..bbf229a7b5840714b9429f4b092ec3f7a6a26961 100644
>> --- a/drivers/watchdog/qcom-wdt.c
>> +++ b/drivers/watchdog/qcom-wdt.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> +#include <linux/of_address.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/watchdog.h>
>>   @@ -42,6 +43,7 @@ struct qcom_wdt_match_data {
>>       const u32 *offset;
>>       bool pretimeout;
>>       u32 max_tick_count;
>> +    u32 wdt_reason_val;
>>   };
>>     struct qcom_wdt {
>> @@ -185,6 +187,7 @@ static const struct qcom_wdt_match_data match_data_ipq5424 = {
>>       .offset = reg_offset_data_kpss,
>>       .pretimeout = true,
>>       .max_tick_count = 0xFFFFFU,
>> +    .wdt_reason_val = 5,
>>   };
>>     static const struct qcom_wdt_match_data match_data_kpss = {
>> @@ -193,6 +196,40 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>>       .max_tick_count = 0xFFFFFU,
>>   };
>>   +static int qcom_wdt_get_bootstatus(struct device *dev, struct qcom_wdt *wdt,
>> +                   u32 val)
>> +{
>> +    struct device_node *imem;
>> +    struct resource res;
>> +    void __iomem *addr;
>> +    int ret;
>> +
>> +    imem = of_parse_phandle(dev->of_node, "sram", 0);
>> +    if (!imem) {
>> +        /* Read the EXPIRED_STATUS bit as a fallback */
>> +        if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> +            wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +
>> +        return 0;
>> +    }
>> +
>> +    ret = of_address_to_resource(imem, 0, &res);
>> +    of_node_put(imem);
>> +    if (ret)
>> +        return ret;
>> +
>> +    addr = ioremap(res.start, resource_size(&res));
>> +    if (!addr)
>> +        return -ENOMEM;
>> +
>> +    if (readl(addr) == val)
>> +        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +
>> +    iounmap(addr);
>> +
>> +    return 0;
>> +}
>> +
>>   static int qcom_wdt_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> @@ -273,8 +310,9 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>>       wdt->wdd.parent = dev;
>>       wdt->layout = data->offset;
>>   -    if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> -        wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +    ret = qcom_wdt_get_bootstatus(dev, wdt, data->wdt_reason_val);
>> +    if (ret)
>> +        return ret;
>>   
> 
> Why is reporting the boot status so important that the failure to read it
> results in refusing to instantiate the driver ? That warrants a detailed
> explanation, even more so since it is not backward compatible.

This only fails if the reference passed in the new 'sram' property is present,
but invalid

Konrad

