Return-Path: <linux-arm-msm+bounces-96491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPT0DCWlr2k8bQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:59:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4C42455A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 05:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98B9A3029C15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 04:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA3C3CD8C8;
	Tue, 10 Mar 2026 04:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="au0E1wlE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIUHeBjG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D533CE488
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773118732; cv=none; b=C3I1uRprDXpjJklbXUsqVyyVZpX48rrkfMbIbzwmGzBAP4YiLUxveMftKH5HYp6rM7mGHKezIpv67UHmqj7zGI6MHeKj6EmpYqyDHSFaZGB2AjmPJnZNDhYCHSBh00vvjFyZnZyouXjCkYmsApx9m/mngP4sZtE6sLR1N7EHNPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773118732; c=relaxed/simple;
	bh=g0VZcYkbEAoWjtbUfvundH5SdWzH2JHEQ59U8vBvDZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l80w55+LacVR05jhJffVyhXhp/pLAt/T79WD88dS8LRFkmKQFgsyeJRw+DdtcR70KPuZDZSpOpgpkfYUMwrpqw0C98eZmGEeIq1hEdbCS+NUhy47V33xSY+jjyp53rBCA2T/SkH84k7bj/wJrmQ7sQefpoPzdwZcBLaZdrnXEKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=au0E1wlE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIUHeBjG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A2EAn0246492
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7KaqtWnt34N8j8zZfzYvdmLElwwnGFgxLWqzJwr4k4=; b=au0E1wlEt6JubJ/l
	gRCo4Xd0JlFd2dcDfmkv+hOan6KiiiyryTPY0HFPETTnNDb2hKVlTJBhTYC46hyr
	2OJ88vlqhobLIX+t+ZwG7DMorzkUeOVD9F+VFdw0wfHurtpLMSGDpqqXTtEfw3LQ
	JsKa3bRQc+tX99etqm5dwUhQTRC+Sfv4gT1M+WPdQKeMIB4FgZ+YuW4zZBM1+Zgl
	n4Un6iRz0NduSktxqRT/OxDGwwK07dVWT/tVmUhODCj9o4ar/mVfVr3r9Ja0fOxW
	XBJd1oIiIEascQS3udyjPCnoGEFXi5xI1p2g3PKPHs0zc2R0JNPWHOjJhpQaD36D
	YQH33w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct8800ufc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:58:50 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7387c70046so2608842a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 21:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773118730; x=1773723530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7KaqtWnt34N8j8zZfzYvdmLElwwnGFgxLWqzJwr4k4=;
        b=DIUHeBjGq+Nm0MaQFZEiSyPujQM+UjnArh8B58Mrtqc3zpniqaIIINPzAUNDTeT/9y
         RVOIOeDn5ytnhzzrhFnjtLuKZGl48SljDpAAgODbaVurWu3x2hCbLEaxayybq4sgRPoX
         eExwA11QmU4JdJpJBR7kTrmYjCAveHwp6LhdpIytqHWitRBiOSfWYxNCQUsUk9vmP2So
         QVoKQWPfAkVqO3K5e2UJXNvniW2hH1yilAsAm6KWbQW/XJ/wVxJyudgV5KndfUEvq/7E
         tlkZUx+b6HqWRSLnJ7DKtZV1gHEOS+WO5CmqrdtDtYL21J/1lY7YRpmj83Vs+J6atk4J
         cIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773118730; x=1773723530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7KaqtWnt34N8j8zZfzYvdmLElwwnGFgxLWqzJwr4k4=;
        b=NVv+Yv79XKKycM/uKxdUD/ERVR1AQhG0AYnANpdJEKBTohC4A83uhYZ5STc1VxjI4z
         9Mm6RvOP6LlhObC8b/JnIayjGp7C1BSPMMwm5LgJcVd9A3EgOZmNuNtepC6sxfhGqX/a
         ydovsFCoJPyaZrGGcl9+oT46PoQQFdbA5OQ2bracT4xbDDUK3RgMbM7yrW6dWLTfeJJ2
         kUDopOJxkyc8EiogKTEPP8Pq/ULzQFFVNS0SY7vWsVrSZG+5qyCJGXVgIWLfHxKZFH+j
         EOJudR9V78u3JfVf9+eL6tF/sZQ8tLviOilcV01bAu8dp8V+dkGiUDJX00HlDegbfo2N
         jOhg==
X-Forwarded-Encrypted: i=1; AJvYcCXMPAhzbMK6nSvGRLpO9xAG9DioYnfK33vQVte7H8ILk5tyf8fNGHNpeTptbBMP7omvR1aE2oU/GGFiKIZv@vger.kernel.org
X-Gm-Message-State: AOJu0YxKDhgTlgYWNwL4uhfHNbeSkTuxwy6XPcKqW08QPk8bDbHdnOR/
	HBKLRVvV3ykKWrQ9FVgUgUG6wH/Rs9okRN1cVSiCGhxGVSmrRwr55IHU9MPVRcJVR8n0ZuWLBkX
	vNkevOA5D+zr3I0DI40ddxg70307c4sjoILRmCctQ1CYwlG6zeXH8gqixx696A5PIfyJF
X-Gm-Gg: ATEYQzyjWDy0r5vxAawAeplr6u6BSaLBM+kvd3VyBxuLI9QuJK+YYz40zTYsdWpiU4E
	tLhI1hQSGIiGAk3hxzcIdq1eKvBwNkGGCTb6H1L8CP/iWrjG+qfMrLPZ25FOxlyswaLkcwryaCO
	Evm8YnfP3clygpoeoMUccTpo6XcjK/RK6ZELAe/NYeC39D+84GgkRCKWddYJ0smUQze7GWngIfU
	M+XOmUCn8uZmaCeBAMWe6CpqkMRJyyZ3lPdmMkYiycr6FVjlA5c8Qucj7M+a0XQvQ0ebsto5aTy
	xpoPCC/vW/rUJKRks3xDIg6ssmhRGOnvzSSvAQj8l1kZkBUlpjHSVJQFMcBaFPLSstWrj3lZjSG
	Q8HLxOqQUqD9QjixIsy+aoljsPv4cyBFf/ckkUviYISfIsSQBBUQ=
X-Received: by 2002:a05:6a21:6da7:b0:398:7853:70ea with SMTP id adf61e73a8af0-39878537178mr8865381637.15.1773118729768;
        Mon, 09 Mar 2026 21:58:49 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da7:b0:398:7853:70ea with SMTP id adf61e73a8af0-39878537178mr8865359637.15.1773118729137;
        Mon, 09 Mar 2026 21:58:49 -0700 (PDT)
Received: from [172.20.10.3] ([106.216.228.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739dfbf4fesm10791464a12.0.2026.03.09.21.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 21:58:48 -0700 (PDT)
Message-ID: <5a60f6fd-8cd6-4936-beaf-492dfbfa5b26@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:28:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
 <aa6M2QSXW72xqYiB@linaro.org>
 <96f8738f-9baa-4528-8bc6-6ce20030e391@oss.qualcomm.com>
 <805525cb-ef53-4bdd-a73b-6fe7513228ce@oss.qualcomm.com>
 <aa61HZOuz42C_R7X@linaro.org>
 <395f0607-7d6e-40fe-90b3-a7b49a6b7eea@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <395f0607-7d6e-40fe-90b3-a7b49a6b7eea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDAzOSBTYWx0ZWRfX84gm6okDFhT6
 jf6PvQARy2Xlk6QI2fvSOF0GMiFaZLCqrX/FVmMs+gnVL0ixSAuCox9U3QbTUkhrmQ/mFRAveX5
 JAdEM+EhnZYFUwIUhAIfb5DB3FAVD1d1RtjVfxb7yVP21q2aNaH9EqfaqZAZ2UIaPragr5d1Je2
 svlFyDk8Srp7iWUGMH+nvAvg41ztzdzvssheYtBLroHR2BRx1TV6Z0w7RvdWU8D+JHzC+6oQkGO
 G5gXfJsj+kblf3Q33MSNCrdytSs2GxH6AJ+x40cf82mFRYOBgTKEexM6KAPEd2y7nHKGdeOcl+n
 ggUCKQycKSEjgJGfwM8nSW6s/yJsQgEWjtBkWM0MwYXNcIeOcNto4VOthLJ4WjxiWIbOQ8S/cK1
 m+JrEmLZH8FLJ8l/D8tTMp50qGm+7Cdm+ehzkV+rmyyIhdOg5sa4H7yf/lMPlO0GBwKA0EE4Uw3
 0hlIT26+C3cX2o9Bgeg==
X-Proofpoint-GUID: AsGkh5W2NXCMJvovMsHoxrF_CKfm7uZB
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69afa50a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=8nKWbjjLc7jCNgWBIcU1Yw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Xd731h-ufghucUnmbRMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: AsGkh5W2NXCMJvovMsHoxrF_CKfm7uZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100039
X-Rspamd-Queue-Id: BE4C42455A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,linux.intel.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-96491-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 3/9/2026 5:40 PM, Konrad Dybcio wrote:
> On 3/9/26 12:55 PM, Stephan Gerhold wrote:
>> On Mon, Mar 09, 2026 at 12:47:33PM +0100, Konrad Dybcio wrote:
>>> On 3/9/26 11:04 AM, Sibi Sankar wrote:
>>>> On 3/9/2026 2:33 PM, Stephan Gerhold wrote:
>>>>> On Mon, Mar 09, 2026 at 05:06:43AM +0530, Sibi Sankar wrote:
>>>>>> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
>>>>>> reference boards. It handles fan control, temperature sensors, access
>>>>>> to EC state changes and supports reporting suspend entry/exit to the
>>>>>> EC.
>>>>>>
>>>>>> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>>>> ---
>>>>>>    MAINTAINERS                            |   7 +
>>>>>>    drivers/platform/arm64/Kconfig         |  12 +
>>>>>>    drivers/platform/arm64/Makefile        |   1 +
>>>>>>    drivers/platform/arm64/qcom-hamoa-ec.c | 462 +++++++++++++++++++++++++
>>>>>>    4 files changed, 482 insertions(+)
>>>>>>    create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c
>>>>>>
>>>>>> [...]
>>>>>> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..83aa869fad8f
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
>>>>>> @@ -0,0 +1,462 @@
>>>>>> [...]
>>>>>> +/*
>>>>>> + * Fan Debug control command:
>>>>>> + *
>>>>>> + * Command Payload:
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | Offset    | Name        | Description                    |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x00    | Command    | Fan control command                |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x01    | Fan ID    | 0x1 : Fan 1                    |
>>>>>> + * |        |        | 0x2 : Fan 2                    |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x02    | Byte count = 4| Size of data to set fan speed            |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x03    | Mode        | Bit 0: Debug Mode On/Off (0 - OFF, 1 - ON )    |
>>>>>> + * |        |        | Bit 1: Fan On/Off (0 - Off, 1 - ON)        |
>>>>>> + * |        |        | Bit 2: Debug Type (0 - RPM, 1 - PWM)        |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x04 (LSB)    | Speed in RPM    | RPM value, if mode selected is RPM        |
>>>>>> + * | 0x05    |        |                        |
>>>>>> + * ------------------------------------------------------------------------------
>>>>>> + * | 0x06    | Speed in PWM    | PWM value, if mode selected is PWM (0 - 255)    |
>>>>>> + * ______________________________________________________________________________
>>>>>> + *
>>>>>> + */
>>>>>> +static int qcom_ec_fan_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
>>>>>> +{
>>>>>> +    struct qcom_ec_cooling_dev *ec_cdev = cdev->devdata;
>>>>>> +    struct device *dev = ec_cdev->parent_dev;
>>>>>> +    struct i2c_client *client = to_i2c_client(dev);
>>>>>> +
>>>>>> +    u8 request[6] = { ec_cdev->fan_id, EC_FAN_SPEED_DATA_SIZE,
>>>>>> +              EC_FAN_DEBUG_MODE_ON | EC_FAN_ON | EC_FAN_DEBUG_TYPE_PWM,
>>>>>> +              0, 0, state };
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = i2c_smbus_write_i2c_block_data(client, EC_FAN_DBG_CONTROL_CMD,
>>>>>> +                         sizeof(request), request);
>>>>> I think it's nice to provide users a way to override the fan speed, but
>>>>> is this really the main interface of the EC that we want to use for
>>>>> influencing the fan speed?
>>>>>
>>>>> As the name of the command suggests, this is a debug command that
>>>>> essentially overrides the internal fan control algorithm of the EC. If
>>>>> you use this to turn the fan off and then Linux hangs, I would expect
>>>>> that the fan stays off until the device will eventually overheat.
>>>>>
>>>>> I think it would be more reliable if:
>>>>>
>>>>>    (1) The default mode of operation does not make use of the "debug mode"
>>>>>        command and instead sends the internal SoC temperatures to the EC
>>>>>        to help optimize the fan control. (This is what Windows does on
>>>>>        Hamoa, not sure if this is still needed on Glymur?)
>>>> That's true, Glymur already has a way to access average SoC
>>>> temperature and even on Hamoa it can still be functional without
>>>> SoC temperature i.e. with thermistors it has access to.
>>>>
>>>> The aim of the series is to expose fans as a cooling device so
>>>> that linux has a way of fan control independent to the algorithm
>>>> running on the EC.
>>> I suppose the main question here is "what happens if i set the fan to zero
>>> and put the laptop in my backpack"
>>>
>>> The driver for M-series Macs for example, 785205fd8139 ("hwmon: Add Apple
>>> Silicon SMC hwmon driver") hides that behind a cmdline param, since they
>>> have no certainty. I would *assume* that if the CPU hits thermal junction
>>> temperatures, our boards will reset, but we should be able to get a definitive
>>> answer here.
>>>
>> The CPUs should automatically throttle when reaching high temperatures
>> and Linux should also do this for the GPU. So the chance of reaching a
>> overtemperature state should be low as long as Linux correctly
>> functions. The biggest risk would be probably if Linux hangs, the
>> watchdog doesn't trigger and the machine is stuck in some state.
>>
>> As for the hardware shutdown temperature, see commit 03f2b8eed73
>> ("arm64: dts: qcom: x1e80100: Apply consistent critical thermal
>> shutdown"):
>>
>>   "The firmware configures the TSENS controller with a maximum
>>    temperature of 120°C. When reaching that temperature, the hardware
>>    automatically triggers a reset of the entire platform."
>>
>> The question is if you really want your device to hit 120°C. :-)
> And whether the firmware running on *your* laptop actually configures
> these limits.. I would imagine that to be the case for Windows products
> where the TZ comes straight from qcom, but I think someone in some thread
> mentioned LMH is not properly configured on Chrome/TFA.
>
> In any case, let's see if we can establish what/whether the EC does in
> that case


The "debug mode" which is used to control fan is paused during the
following conditions:

1) When the EC receives EC_MODERN_STANDY_CMD enter cmd
2) When SoC enters deep sleep fan pwm is turned off
3) When external processors like soccp put fan constraints on the EC

So when you do set the fan to 0 and put it in your backpack :P
It would enter suspend, the EC would take back fan control.
i.e. the LUT based flow that it follows by default. That would
imply it would be the same behavior as seen on Windows?

Either way I still think we all are in agreement here. This series just
exposes fan control knobs to the kernel and doesn't set any fan
speed by default. The LUT based EC fan control would still be the
default, the patches to improve this are in-flight i.e. ways to send
avg SoC temp, update LUT and select available profiles. With all
of these in place EC would be in good shape in the Qualcomm
reference devices.

>
> Konrad

