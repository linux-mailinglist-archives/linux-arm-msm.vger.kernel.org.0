Return-Path: <linux-arm-msm+bounces-56444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E63B3AA69E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 06:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A20C1BA5BF6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 04:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8CB1A5B8B;
	Fri,  2 May 2025 04:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lD93qQm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE25189513
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 04:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746160933; cv=none; b=hU8xNmG4RCQ9qtaj7Ff2qqnqxF8HEyye5G++8sOAGUksDBw76TOfM4qK7Zkb1iBw79fu4X5bN69aNe/i3LwQCKccP2FGKf8kRuFGxwjrH219En/kb5QIdLO2PkBQeQJBxoTyTbF8GnDuFlkoMzz1ZmiCC6/iAgRbbNR3mXeDkQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746160933; c=relaxed/simple;
	bh=AS5GCwcO4Mg8AL75Z9J2FHBKkN5+JSl/LX+VBO7oJqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Krb6jFlUmBlMGdijcO9rCSjYTjp5levExNvqvgv9aVApKVhjwr8ejFponGIo/CMSV3jG0SRXGUin4K1qrbkKjPjx4/sWM4ZimwXY4oIzjpyf12PeiOE0RJUKs+I6W4laccyWiBxtCGEYa2nw3SLHC0r4UW4rBr88vlAJVtIXeU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lD93qQm0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421MwEm015050
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 04:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7j5UxYN6C9Dd6qHXGE97a7YLEYkg4By51iUOqA+ylAQ=; b=lD93qQm0lfGtQu2b
	Qol+d3LR4qo4+nRMOn5UzV0/SgDWNud83Pb+Tb1RKqYAJjqowwungs3q4s2MUfb6
	7PXzNa05DwwAk2Rj1KaQsViGT+LbFMTslw56wXt5S4ADZssd0iVNijqc72MCH2l6
	30Ndlv6aAvcHhBga9oSw6ybxw3mAwHQpEIpS1CiwVdJO29HkpbWoihIBbqjIwyKC
	UBZ30zVcfnRHVBUtSNVVIBEI6fDQvOe3F6REV3Q6NwDIuRC03LCduxDPZfxwG8Cu
	n1Int1HTfaIThrO4uv7x/l7f9t2By+WhIdTJpAy3ufJ9pyI+4lyiGiJNNFzybgLG
	wm+Kow==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uay5ve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 04:42:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736c1ea954fso979614b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 May 2025 21:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746160929; x=1746765729;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7j5UxYN6C9Dd6qHXGE97a7YLEYkg4By51iUOqA+ylAQ=;
        b=KpnrpBBqpmxEzTpPdTkaHMLg7EhdiUEgFebze139snyhqmRU0rCOoBwxqPRJfW4uj1
         aZESFab/KDL3dr0fhnboGEMciBjrnrH2TY502ktkJ9F8A1Be0Znj0/Iap2qqqRwkMJTi
         o05IGbJTTnnPCriKCLkhqpzliWWehHPFtQXMRKZaztmHM5TQ7ZVueclaoyDAV9PFvLHN
         +BJkguPxCn2d8Nwd7PtRvNAyWRtwBT7367A62hdLK2Srq/ijBW8IMn8DpCNOTSKLRFtv
         uoiFLmzEw0KZ26k2GOhOeX9kp7ExChXvEITGo8s891wZRoMqFCpOeWyPg5kKF26Epbpu
         d6fQ==
X-Gm-Message-State: AOJu0Yw1iNjZ4L1kBQ6MSCD2osMAID5rqTkBZwK5+50oIetW9RYylhvC
	Ww38NHSPiAy4L+JakJvlIcQwsCN1dWjhtFm1CpNyISahGXcH1t/W84euApMlNsdH6Dmj5usrWyP
	ejuM8Ni1c/CyzGrdxfBO7oDyF+C+g0n0oLN8lSWDFUK2RcZ7gK85vpPgphFp20zTc
X-Gm-Gg: ASbGncuRI0q6FrndEDYGqoHRUdbNyZNtAm+60YMtwrDiRJMqocMw5In+HJZQJ+Y2YP9
	O5+ebqrduZgKoOiOFbDHMQNepeEZa7IwllhyecIKfi7WZty0wCwIsQHJoPGaNegfrXt8CbEFJRE
	pp1qxdNoKvB+BgAIDeI+eGajo24xW5OuTCvQe4Tjg7tPykWpaQ9zOYYUdrIqYgAF36ZMdhbgAv2
	4ypuKCdsBYLA5lvrAti0bSPARRuO91Qrk8AeYuwYRjAFezBK808uW+naruavhwi0lDBnf+uYM8K
	cXt2uasRVIVoydyvjzGbUtQCJVF+Nb9BAepfXQidvvxrdTGBAacA
X-Received: by 2002:a05:6a00:4294:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-74058b23ef3mr1866206b3a.21.1746160928689;
        Thu, 01 May 2025 21:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBQrj67WLhBG3Hq96DBg+5Opa1dABnH/Q1s+TspcF/KflEqOJ5Mrv0bnI/pESCH+hoqmXB/g==
X-Received: by 2002:a05:6a00:4294:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-74058b23ef3mr1866183b3a.21.1746160928305;
        Thu, 01 May 2025 21:42:08 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059021483sm590790b3a.93.2025.05.01.21.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 21:42:07 -0700 (PDT)
Message-ID: <09579b2c-f312-4c8a-b57a-b240204cd733@oss.qualcomm.com>
Date: Fri, 2 May 2025 10:12:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Bryan O'Donoghue <bod.linux@nxsw.ie>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-5-c65bba312914@oss.qualcomm.com>
 <ebd4790b-e7aa-45b1-b7d7-9d1b331ee842@nxsw.ie>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <ebd4790b-e7aa-45b1-b7d7-9d1b331ee842@nxsw.ie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: phBoN5oTwTDdwBNpkx-72q1b5Exzd5iD
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=68144d22 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Amq28VNnWxlBxfWyqssA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: phBoN5oTwTDdwBNpkx-72q1b5Exzd5iD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAzMyBTYWx0ZWRfX8/ap9lP9gzys nmlwITzIx4955n+DDr71QQuwRGppF4PxB1eLYCYwmvbcUdMqxje+7OrDL4CEevJ1S7VFYYfzQuc lKoDUdnInUvh3lQeZ5v2ycQz+shCzcVEps8x9dEZdQFYKjAxMsfMA6gzpaHOs+jtlmSQkdMe/ZK
 Y8L21JQk5+NcCbU96Qa0TbEy6gyUnCjJ8ts1PCvbbD6OjyBAfWJswrSuMavM3werS0swkeQY/8i 27oSUgErqI4hIxlZEPTIZQNAnh52lJ9GNEy/woU2/tv2QTB2nHKqhsp9JnpVlqtu9uSzYE1mgJC ujkjssdb4vlWwWYcxaTJ4jULy1HUzXVpLBPgrDrKkGVEHKfEFF+6qormispYce7yyWVrd7RBzOe
 GdcSARqqv/QAyFE924OV0NaGLXKjqd/SQwSYf7Cd1xXP9vSZ9dNHbd4d4KtHyC569Q4ZsR+Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020033


On 5/1/2025 5:31 AM, Bryan O'Donoghue wrote:
> On 16/04/2025 09:29, Kathiravan Thirumoorthy wrote:
>> When the system boots up after a watchdog reset, the EXPIRED_STATUS bit
>> in the WDT_STS register is cleared. To identify if the system was restarted
>> due to WDT expiry, bootloaders update the information in the IMEM region.
>> Update the driver to read the restart reason from IMEM and populate the
>> bootstatus accordingly.
> Which bootloaders ?
>
> Do you mean bootrom or one of the subsequent phase bootloaders ?


It is updated by the XBL. I shall mention it explicitly.


>
> Please be specific about which bootloader populates this data i.e. if I
> switch my bootloader to u-boot do I loose the added flag ?
>
>> For backward compatibility, keep the EXPIRED_STATUS bit check. Add a new
>> function qcom_wdt_get_restart_reason() to read the restart reason from
>> IMEM.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> What I'd really love to see here is an example of reading out the data
> from sysfs.
>
> How do I as a user/consumer of this new functionality parse the new data
> it provides ?
>
> Ideally do this in the commit log and recommend doing it in the cover
> letter to, as people don't always read both when commenting on patches.


Sure, will mention the sysfs path and its output in the commit log and 
cover letter.


>
>> ---
>> Changes in v2:
>> 	- Use the syscon API to access the IMEM region
>> 	- Handle the error cases returned by qcom_wdt_get_restart_reason
>> 	- Define device specific data to retrieve the IMEM compatible,
>> 	  offset and the value for non secure WDT, which allows to
>> 	  extend the support for other SoCs
>> ---
>>    drivers/watchdog/qcom-wdt.c | 47 +++++++++++++++++++++++++++++++++++++++++++--
>>    1 file changed, 45 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
>> index 006f9c61aa64fd2b4ee9db493aeb54c8fafac818..94ba9ec9907a19854cd45a94f8da17d6e6eb33bc 100644
>> --- a/drivers/watchdog/qcom-wdt.c
>> +++ b/drivers/watchdog/qcom-wdt.c
>> @@ -7,9 +7,11 @@
>>    #include <linux/interrupt.h>
>>    #include <linux/io.h>
>>    #include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>>    #include <linux/module.h>
>>    #include <linux/of.h>
>>    #include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>>    #include <linux/watchdog.h>
>>
>>    enum wdt_reg {
>> @@ -39,6 +41,9 @@ static const u32 reg_offset_data_kpss[] = {
>>    };
>>
>>    struct qcom_wdt_match_data {
>> +	const char *compatible;
>> +	unsigned int restart_reason_offset;
>> +	unsigned int non_secure_wdt_val;
>>    	const u32 *offset;
>>    	bool pretimeout;
>>    	u32 max_tick_count;
>> @@ -175,6 +180,15 @@ static const struct watchdog_info qcom_wdt_pt_info = {
>>    	.identity	= KBUILD_MODNAME,
>>    };
>>
>> +static const struct qcom_wdt_match_data match_data_ipq5424 = {
>> +	.compatible = "qcom,ipq5424-imem",
>> +	.restart_reason_offset = 0x7b0,
>> +	.non_secure_wdt_val = 0x5,
>> +	.offset = reg_offset_data_kpss,
>> +	.pretimeout = true,
>> +	.max_tick_count = 0xFFFFFU,
>> +};
>> +
> You should separate the addition of your compatibles and their
> descriptor tables from generic functional extensions.
>
> i.e. add the compat string and the above table in a subsequent patch.


Got it. Will split the patch into 2.


>
>>    static const struct qcom_wdt_match_data match_data_apcs_tmr = {
>>    	.offset = reg_offset_data_apcs_tmr,
>>    	.pretimeout = false,
>> @@ -187,6 +201,29 @@ static const struct qcom_wdt_match_data match_data_kpss = {
>>    	.max_tick_count = 0xFFFFFU,
>>    };
>>
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>> +					const struct qcom_wdt_match_data *data)
>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->compatible);
>> +	if (IS_ERR(imem))
>> +		return PTR_ERR(imem);
>> +
>> +	ret = regmap_read(imem, data->restart_reason_offset, &val);
>> +	if (ret) {
>> +		dev_err(wdt->wdd.parent, "failed to read the restart reason info\n");
>> +		return ret;
>> +	}
>> +
>> +	if (val == data->non_secure_wdt_val)
>> +		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +
>> +	return 0;
>> +}
>> +
>>    static int qcom_wdt_probe(struct platform_device *pdev)
>>    {
>>    	struct device *dev = &pdev->dev;
>> @@ -267,8 +304,13 @@ static int qcom_wdt_probe(struct platform_device *pdev)
>>    	wdt->wdd.parent = dev;
>>    	wdt->layout = data->offset;
>>
>> -	if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> -		wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +	ret = qcom_wdt_get_restart_reason(wdt, data);
>> +	if (ret == -ENODEV) {
>> +		if (readl(wdt_addr(wdt, WDT_STS)) & 1)
>> +			wdt->wdd.bootstatus = WDIOF_CARDRESET;
>> +	} else if (ret) {
>> +		return ret;
>> +	}
>>
>>    	/*
>>    	 * If 'timeout-sec' unspecified in devicetree, assume a 30 second
>> @@ -322,6 +364,7 @@ static const struct dev_pm_ops qcom_wdt_pm_ops = {
>>    };
>>
>>    static const struct of_device_id qcom_wdt_of_table[] = {
>> +	{ .compatible = "qcom,apss-wdt-ipq5424", .data = &match_data_ipq5424 },
>>    	{ .compatible = "qcom,kpss-timer", .data = &match_data_apcs_tmr },
>>    	{ .compatible = "qcom,scss-timer", .data = &match_data_apcs_tmr },
>>    	{ .compatible = "qcom,kpss-wdt", .data = &match_data_kpss },
>>
>> --
>> 2.34.1
>>
>>

