Return-Path: <linux-arm-msm+bounces-73623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81278B58BFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 04:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2995332081E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 02:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F58E25743D;
	Tue, 16 Sep 2025 02:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pax8MzK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD9D24A067
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 02:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757990419; cv=none; b=B1kiufaTDgJARTGTk1dFqS28zrMjZ4oQBnwrQ8vKG/v6F1Xa/Ia4Ark5eRu3FExYAeO7SMa4gGfNED4ArCBOtu4PTQ4PyJTu8TUFk0hXq5B5MqxROIxSkfTf2tQOSEy7+5eaXjzY09UYhi0NMc4ivSfmipuoiCNrAARXxnfLjZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757990419; c=relaxed/simple;
	bh=sw3T+Yf7rRxGoEHikzqSJtqsISrkBdzL4ry7W6NjCME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PK7i7z2lfmcOF+QRMqiWwRb1HnT4ukIMdfMK1gpIOlkb4nNTU9eaYS0kH7wX0E2BKMWmm3nN8fRSPAR8PEhLqtBtgIm6mzl7/VZfRtslDMNS7Uo7manCvwuHS8ijXOZhun5mkPdgoguzyogTtjgB+Y2D9pTsJFQJG4k3wO24mZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pax8MzK9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FF2o0i005878
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 02:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALKBbxJKWhBYDEwvuuS6efzqtoWF3Q6y4KRex8tFebc=; b=Pax8MzK9tDYbi4Wi
	Ua6hvVsXPpOHAhwBypsMIc9+z4o6lY/oYAjB83+3hbB+EwhrKjBydKQAtUqlD/M8
	eVsqnkaGkJzDxO+RjNwvZLqBHAj6rkTSL2N7BF4N3MNpXPvWGKl+z+kmmgOSP2RK
	99dQKfqF/K+g7XKOMTUe+kxakNT6FGXjMoqlsMgu9iLXOvyoqtY7/uMZ88IZKoM/
	uKlha3oiUB6s19t7AWs457xcN5xpTZfKY2MI9xbAFDyEylwNgYhILNcCuNnHQkNd
	opNG3nl8dWny9qc48KNuQeoGhTTfqThLp8b3exkw1BvCmq3mEe2/Ui3/Jv0rc25T
	NnbHdw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951snpvm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 02:40:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24458274406so95275695ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 19:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757990410; x=1758595210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALKBbxJKWhBYDEwvuuS6efzqtoWF3Q6y4KRex8tFebc=;
        b=XiNDABYmnUjBZ19uSviMRy2cGFKDSEyztgKgjyv8ZUQFOar2w8DwRTrtGflGfOxBQj
         OfL3biUB4UgkNPN1Iphv7GIIar+lrZcSMOzHvefc6Vt/Hc6ZWBeuMPcwQdHOt67hKUgB
         oajmIKhHc5SAxYKd7Te8kjGYIurZzHBEbv99eN3EtYAOW89uBvPZYaLuTJsoyZqD3DIk
         +1evZwTAF3dL4Qv0Yjt2vkI6XjbAbNpBT4l5Hhk4U7k5DfQWx+FttS03IwELkORH7lT/
         mO1UZ7her6A5FZcHKOhBKO52E0sR0qan2yNQ5z48dtCbGx+5y2sKa05HFTBF83aSrSs+
         XhnA==
X-Forwarded-Encrypted: i=1; AJvYcCV9JmoZcJcxR6KglhgXsgP8izo8TDzpmFfP0ovbSLcXQVYKfZloAw4fCQIGAvEjF18s+s2MIhjZ8sNVF1be@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0NpAqFpAZqKs3iurr7hNR/lCwCHlob9MiOugDYYXaUGBUiOCE
	r4Oa/nWjOkCV7KfbWIWitOYBZ9KHYjQHQLR4RTpllzkg1wit2WuvBcEX/Vzb88B5AxYfzebxMeF
	7p7CSFXJdzktKh5Beca1iTl6XjN5UImgT3Enylg9EcVdlxeXXZOWxUQwqY4N/XO0xEnQX
X-Gm-Gg: ASbGnctWZn1rli5DLcpv/di2pF3wtqvx7hL48f5msGbtMF4afvj8cZYSTmNaLmzy6zH
	zgRdRoG4ftsJt7OtrlJxhxwG014MBECoDSr0LI5rIBg14Ruvk9mh0ioj2PTevr8eGuQ8Qcm9/8c
	/co7XoIwKYmbnxiAvo+U5nSh0w9t6U7uPIR/6nkhkQvHdybePJYhhuikfaAWazhTWBAe9QKO+Bs
	0JlbvqGVudjQOwKAlpORHL1KUijvGw17QJmi2eN6JfEXdfvwG0oK3WvpauyapFYY81hTshGEaIa
	ZtT4+kWjde7IAXPqUiyeBqCJFWyfwA96uLYePncXt9RZhu/JKLnuZeD2TwhqArHT/Ei4EcEURQw
	9EkD00CvnzQysZJgzcYdugxHbg/yCbYqGhg==
X-Received: by 2002:a17:903:1aa3:b0:246:2b29:71c7 with SMTP id d9443c01a7336-25d2607a10amr176506715ad.25.1757990409818;
        Mon, 15 Sep 2025 19:40:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHutrm0VahgASYcAGOWnnFZbZG2dQel55GBh/Zu5/ngeQI/Oxmg11OWKXNdJCX6YG0DD91+/A==
X-Received: by 2002:a17:903:1aa3:b0:246:2b29:71c7 with SMTP id d9443c01a7336-25d2607a10amr176506265ad.25.1757990409367;
        Mon, 15 Sep 2025 19:40:09 -0700 (PDT)
Received: from [10.133.33.240] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25e2fb546f9sm109794985ad.127.2025.09.15.19.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 19:40:08 -0700 (PDT)
Message-ID: <c5e3ac07-e91e-4c9f-9256-497991b75200@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 10:40:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] power: supply: qcom_battmgr: update compats for
 SM8550 and X1E80100
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250915-qcom_battmgr_update-v4-0-6f6464a41afe@oss.qualcomm.com>
 <20250915-qcom_battmgr_update-v4-5-6f6464a41afe@oss.qualcomm.com>
 <f3s2srlmvuj7wmh4rndffmbfrzylbuq4rsu7pqqrnqa5fgsmch@t5f4dgmqtgys>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <f3s2srlmvuj7wmh4rndffmbfrzylbuq4rsu7pqqrnqa5fgsmch@t5f4dgmqtgys>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JO87s9Kb c=1 sm=1 tr=0 ts=68c8ce11 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=lkjHs5G_WC6zgKVeVEUA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -Gb5v8H6QVrDxwNf013KlQ62XcW_o498
X-Proofpoint-GUID: -Gb5v8H6QVrDxwNf013KlQ62XcW_o498
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MCBTYWx0ZWRfXw3qfmtX2ZKmi
 Yo9+A/NSqz9qBan3AGWwUkxyVwt0xbGPWRsyyfeeMPNOv8Udsakb28UfzKIiKusoxzSjaQnALwJ
 MlcsM5ufD0Os5ExDT4r0FBZVizjFK5cB9FbYTIwDbZX9zG6FjtHoMFRuLy93ddNh3a+nXuyaeb8
 0S5aCcN4+CVSysXG4bym4l3QlA0mlYiXpjk74PIYdcIUvJ41KYSG+gFDovaM33YpCGPb8BWkDwg
 C5yMOvdFbQiMx7BvL/Enl/hXEwp2BMJ+2BbL0czOFMhybYWjcneqizI+OQm3sFAiCL3gezNxaKs
 Bnhce+8ffYnWkCWypxe1MGjaYUCSKBMFpQNSt29xNAbKIzEB4WtaFN4+5J42n8Omzry0oyaPilB
 9Wx1GCTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130040


On 9/15/2025 6:19 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 04:49:57PM +0800, Fenglin Wu via B4 Relay wrote:
>> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>>
>> Add variant definitions for SM8550 and X1E80100 platforms. Add a compat
>> for SM8550 and update match data for X1E80100 specifically so that they
>> could be handled differently in supporting charge control functionality.
> Why?
Is the question about why this was submitted as a separate patch, or 
about the need for the change itself? The reason for the change is 
explained in the commit text. As for submitting it separately, that was 
done to address Bryan's comments to split out the compats changes. 
Anyway, I will address the further comments from Stephen to make the 
change bisectable.
>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
>> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
>> ---
>>   drivers/power/supply/qcom_battmgr.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
>> index 008e241e3eac3574a78459a2256e006e48c9f508..174d3f83ac2b070bb90c21a498686e91cc629ebe 100644
>> --- a/drivers/power/supply/qcom_battmgr.c
>> +++ b/drivers/power/supply/qcom_battmgr.c
>> @@ -19,8 +19,10 @@
>>   #define BATTMGR_STRING_LEN	128
>>   
>>   enum qcom_battmgr_variant {
>> -	QCOM_BATTMGR_SM8350,
>>   	QCOM_BATTMGR_SC8280XP,
>> +	QCOM_BATTMGR_SM8350,
>> +	QCOM_BATTMGR_SM8550,
>> +	QCOM_BATTMGR_X1E80100,
>>   };
>>   
>>   #define BATTMGR_BAT_STATUS		0x1
>> @@ -1333,7 +1335,8 @@ static void qcom_battmgr_pdr_notify(void *priv, int state)
>>   static const struct of_device_id qcom_battmgr_of_variants[] = {
>>   	{ .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>>   	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>> -	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_SC8280XP },
>> +	{ .compatible = "qcom,sm8550-pmic-glink", .data = (void *)QCOM_BATTMGR_SM8550 },
>> +	{ .compatible = "qcom,x1e80100-pmic-glink", .data = (void *)QCOM_BATTMGR_X1E80100 },
>>   	/* Unmatched devices falls back to QCOM_BATTMGR_SM8350 */
>>   	{}
>>   };
>>
>> -- 
>> 2.34.1
>>
>>

