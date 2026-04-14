Return-Path: <linux-arm-msm+bounces-103101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Dy9Ie4Q3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:03:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A103F8607
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 12:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A73D730A9D0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9AA3C873B;
	Tue, 14 Apr 2026 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fINXBuae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+HmekYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B515A381AFE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160616; cv=none; b=dkj6iZeo3CJZBwrPtFbeVESRPXhfYZ3jOld0xUtrvwLXhHEMl1texsmn6/VoUtZ7jfJ+LvQ/qdIMqbjpF119cXqIJN2I43zI9/qmty7xuPfRlOUbRnYY0RRdBrwo5yLkafdoxzf0yK0IuZfFYv7QL89gvEj+XeQ1QWyNjBivHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160616; c=relaxed/simple;
	bh=QzX1eIfDuXozU4tY7IyaWnqDasvIQsq/MODmmHbhvQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4p8S+IBTLTmsxdqt8MKZnBjD/0DLUrDc1NK/thOzHq46auD1/iB5A2TMzEjTvZ4xm9+w5dB+QJ2cDeA5S8c2gTrhcAOCT3U3rBS14lcUMIV3+huaHEF6SgO/x0ho8JEuS78bQKyqxI2eo1svRQDHTkNEs6eVsS1BFWWSJLL2O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fINXBuae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+HmekYi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6PDHr395269
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLuqThd/6lPqEfYAxapAuHQDSrKifQv+h9EGQmRz6Ho=; b=fINXBuaeo4mpid8+
	3BEEhZKngQhbZtJ4j6jFm+Y9za7UY4yTTIHiDG5J5+2AA3AcWwkUI15Oypv0jkj+
	ZX7yYnuUBT9sYCJY4h1N/S3EIrRRTM/hDraGd04y8kJoC7epbbshIwRSvVNcCcOd
	5V07kyB3cEnkp0Sj4WYN1E+rUumAyPYduw+Y7Lhpl21uAdTwquf39Wu+f79t/IRu
	/czo33J2MZO9kVwApxm8NleZXnFxKTRQZaBfpdnNEhSFIqSA9UZ36wR+uU+QyzqV
	IGJSeCaF4dF+c/2GhCQo2Q5ptQMFXCo0o0k8hA+/oWGibJc98GB/xSyFJxpOhNgv
	ldpcCg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870t6qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:56:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76cb2dce57so3248237a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160613; x=1776765413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLuqThd/6lPqEfYAxapAuHQDSrKifQv+h9EGQmRz6Ho=;
        b=V+HmekYiMN0Se10C+fpZfIZf2M3fPGLTGmqdqWvT15QKTil45NX5/HQRuPD1x8xcA9
         pxGyV3vfIIKjY7n/t4k0YBUHENbT72A/9yeyMj05f2hTzp7qQKyL+/z/FaySXS05D/GB
         lG5Pg2UJXVuXOOejZa0+8LudLSZzIqJsjawCqbBH9T6jId2iflz4CFG69qViAqLrlbOP
         1+HP1PkBg+cH2l10SW3IYz8DP3OWV5lLHSIu7zrk4kbKpf/2UjpaDKryAOiIk/+ernWK
         wnQHFh1Mz1xZ5rgWnKcbRNOtVFVL3R1OsDDV8iE2ZNh2fFZIun1KHfs0XhyRRbjwMe5r
         rnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160613; x=1776765413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLuqThd/6lPqEfYAxapAuHQDSrKifQv+h9EGQmRz6Ho=;
        b=W2HK7GQBU5W1nNUmb0cNueULN6V5kiwcHlqT/VLccDLSAaKT6wApCQrjG2v6ryOSZd
         uvWlkCvw+P4UQ9G7lg2ZQ/aQOqTGjuuo6+y1hTmfizgrIrh88EGXv0PFr2c//kEsm2WD
         84CFPSTW9oQhL5gaCflxg/6lbJm6nUXIZxbSzvM2GDcGuw4iVk0vbxzaitUBT/DNl1dw
         ZHWfREEcYPQvzKv0vcFR5aLe7H+s0++B4esnUnDZRtZO/pbSI8mZfmjB3fZcFr3lkQGC
         KNSRR8xQPTWKkMymWvZp50wQ+mjWJvD9ia4AUzNi00OleCfjcPlypSSobXmS1GFquRBi
         Oohg==
X-Forwarded-Encrypted: i=1; AFNElJ86ECpoA5HJwZ+imIBKAgifCuV2q+QXq2/asbNRVyjs3WX6xSqxcPAvl/UlLS5H5FisnaUoiNcpoAyrHrQY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2la2ekMveEHz+loViudjRBASfY5vIeA7m5CJrb8D7FK9+tvtw
	zTfeIayLxVH5h50JOpSegnw/gLkBPMVDj+zIb/waGb7O9OkPb+F1Kz8ILgqkiNjk2snWJyFTo+4
	LkeSd8QeaQrot1Lh+1G2c/3++QQr/1wwmS1sZnh/LPtM59/O1Jfv6NuAR9489rJ4BDxd0
X-Gm-Gg: AeBDieuFWgqCBNK928ikh0XStizXaGGp2jhCbKI9z/+CYy3yK8dN/mg7ZOfwbU2QC49
	In9732cjc/OEgtmGv/pYTwb71F1IdVeKDolsX89a81JRTd8ia68UWGQjy0VIyaWIo5LnIWC07oQ
	PHL1+IudFuhL5B97Zr9nD+OxI4t0mJsT8o/kvNOKTrjfyZGrtOPXHvp+sIFRlH5GUIQ1coIeycl
	fD8u4bpkU5d31nbmbPXJJ9Dso/y+1vl2B5kbhkCiJuVMneez/j+1Tw+Rf7TP42DllvRT91V8eph
	bV/5/HMMcMMOr52joeHNMkC3PmwtkXlEcRKcb3xTg1SNDIvpMVkkNo/d9x34kVuJt0MCnGMYT3l
	wcUBpMbw2MjIeFauAZbCTUG7+e017f4sVVezglA/zNLJ40ILg7YnUhA==
X-Received: by 2002:a05:6a00:ad8d:b0:82f:316:3208 with SMTP id d2e1a72fcca58-82f0c35628bmr16502548b3a.29.1776160612645;
        Tue, 14 Apr 2026 02:56:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad8d:b0:82f:316:3208 with SMTP id d2e1a72fcca58-82f0c35628bmr16502526b3a.29.1776160612161;
        Tue, 14 Apr 2026 02:56:52 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee4bsm15060311b3a.2.2026.04.14.02.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:56:51 -0700 (PDT)
Message-ID: <8f620562-2e1e-4d61-a823-767fbe51828a@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:26:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] bus: mhi: Expose DDR training data via controller
 sysfs
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-8-47ad79308762@oss.qualcomm.com>
 <tbwahssgudfeacfj3wcg32yw5fkqorswees4gv4geypjmmdcyu@tv6qkuhyw23l>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <tbwahssgudfeacfj3wcg32yw5fkqorswees4gv4geypjmmdcyu@tv6qkuhyw23l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2OhtI6TQBkL4dwVHrbwiHWoG5j80tIDR
X-Proofpoint-GUID: 2OhtI6TQBkL4dwVHrbwiHWoG5j80tIDR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX3ObC7WrCVjLW
 jbIjj3sLo2p4744iuuuIwmHOAPZv9gkqfXEvS46UAWc0zUZNIt/myJlLXGvko+SrihlmZX+gobF
 Svaq2ZnANvnl+1YG3XRSBdXUdmHBWCvacP2+7rgl5BMrIHuO0qLdbWW0pOveFwj0Py0EIl84zuE
 /vkbuD0q7BUt4RkzHv3s+w0ro90BkVA5I/tHQykeK3a56u0xVa1rT4auUAaBS+g8px2dxzO2bL1
 b/0K+1/RDH3gEh56JzWn4PJb1QGMCxAbDW7Ur0L2SnpPYy5MqVWTT2LjFYDYvz8dWN9ZYPbbrR/
 3/QQD2iVdd7Rt9JmWohIvVHrLHMHXfq2izuISciaJ+FnV3OpqeLzAJwJxoPrli9GjChkypUI2vK
 /b6jaALSD74d9pdcS+7rqitwBz4PUDVlhiyHBdlN6pNzMehSarmJ8d1UpH14+E8JqGNIgUEWYPd
 1+4f9DzugYS3Y1LjWPw==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69de0f65 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7NWoxAv4aW94f8snxxYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140092
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-103101-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8A103F8607
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/13/2026 5:28 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:48PM +0530, Kishore Batta wrote:
>> DDR training data captured during Sahara command mode needs to be
>> accessible to userspace so it can be persisted and reused on subsequent
>> boots. Currently, the training data is stored internally in the driver
>> but has no external visibility once the sahara channel is torn down.
>>
> Maybe share some steps on how the userspace is expected to use this calibration
> data.
Sure. will update the commit message with the required details in the 
next version.
>> Expose the captured DDR training data via a read-only binary sysfs
>> attribute on the MHI controller device. The sysfs file is created under
>> the controller node, allowing userspace to read the training data even
>> after the sahara channel device has been removed.
>>
> So once the calibration data is read, how it can be used further?
The userspace will store the calibration data in 
"mdmddr_0x<serial_no>.mbn format. In the next boot, Sahara driver loads 
the real DDR calibration data and training data will be restored. No 
repeated DDR training is performed at target end.
>
>> The sysfs attribute reads directly from controller-scoped storage and
>> relies on device managed resources for cleanup when the controller
>> device is destroyed. No explicit sysfs removal is required, avoiding
>> lifetime dependencies on the Sahara channel device.
>>
> Missing ABI documentation.
>
> - Mani
Currently i have added in a separate patch(9/9). I will squash it with 
this patch in the next version.
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 69 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 69 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
>> index c88f1220199ac4373d3552167870c19a0d5f23b9..b7208738df10fc3c3895acd46873412818dc1730 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -415,6 +415,73 @@ static struct sahara_ctrl_trng_data *sahara_ctrl_trng_get(struct device *dev)
>>   	return ct;
>>   }
>>   
>> +static ssize_t ddr_training_data_read(struct file *filp, struct kobject *kobj,
>> +				      const struct bin_attribute *attr, char *buf,
>> +				      loff_t offset, size_t count)
>> +{
>> +	struct device *dev = kobj_to_dev(kobj);
>> +	struct sahara_ctrl_trng_data *ct;
>> +	size_t available;
>> +
>> +	ct = sahara_ctrl_trng_get(dev);
>> +	if (!ct)
>> +		return -ENODEV;
>> +
>> +	mutex_lock(&ct->lock);
>> +
>> +	/* No data yet or offset past end */
>> +	if (!ct->data || offset >= ct->size) {
>> +		mutex_unlock(&ct->lock);
>> +		return 0;
>> +	}
>> +
>> +	available = ct->size - offset;
>> +	count = min(count, available);
>> +	memcpy(buf, (u8 *)ct->data + offset, count);
>> +
>> +	mutex_unlock(&ct->lock);
>> +
>> +	return count;
>> +}
>> +
>> +static const struct bin_attribute ddr_training_data_attr = {
>> +	.attr = {
>> +		.name = "ddr_training_data",
>> +		.mode = 0444,
>> +	},
>> +	.read = ddr_training_data_read,
>> +};
>> +
>> +static void sahara_sysfs_devres_release(struct device *dev, void *res)
>> +{
>> +	device_remove_bin_file(dev, &ddr_training_data_attr);
>> +}
>> +
>> +static void sahara_sysfs_create(struct mhi_device *mhi_dev)
>> +{
>> +	struct device *dev = &mhi_dev->mhi_cntrl->mhi_dev->dev;
>> +	void *cookie;
>> +	int ret;
>> +
>> +	if (devres_find(dev, sahara_sysfs_devres_release, NULL, NULL))
>> +		return;
>> +
>> +	ret = device_create_bin_file(dev, &ddr_training_data_attr);
>> +	if (ret) {
>> +		dev_warn(&mhi_dev->dev,
>> +			 "Failed to create DDR training sysfs node (%d)\n", ret);
>> +		return;
>> +	}
>> +
>> +	cookie = devres_alloc(sahara_sysfs_devres_release, 1, GFP_KERNEL);
>> +	if (!cookie) {
>> +		device_remove_bin_file(dev, &ddr_training_data_attr);
>> +		return;
>> +	}
>> +
>> +	devres_add(dev, cookie);
>> +}
>> +
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	char *fw_path;
>> @@ -1272,6 +1339,8 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   		return ret;
>>   	}
>>   
>> +	sahara_sysfs_create(mhi_dev);
>> +
>>   	return 0;
>>   }
>>   
>>
>> -- 
>> 2.34.1
>>

