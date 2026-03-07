Return-Path: <linux-arm-msm+bounces-95961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNZXAvcMrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:33:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BC322B6FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28720302C5EE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092902D3225;
	Sat,  7 Mar 2026 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqNsDGGc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yv4vBFO8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B1D2EB87B
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883178; cv=none; b=hHgcD/L1gRqOc3LI3/d0DJeyOeOlvh1toxxc/0UALVESCxY+Mh4mEsLiXeTPFS5DCVozjrhBPYMPbABmfoCHbNIAQYfpy3rhY5dUFf3IB1mG9JufdZjYHmVBa7o0VFiKb9CFGTIqChiz6gAFDjdU0k+yLwfllQf2G2+ygv2kWX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883178; c=relaxed/simple;
	bh=Nn17an7cYm3KED3wz+02ulz9u4NnKrVr2XcMhf9gkkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvkHN77Slyb40PAUUsTw2Oh+GxiDs8F8A/lFixER+qr3NzOYQ+sRjnCZ7MHOCBdfEW9cfjZKeFioptm7ASrRIws/J+jIDuu5rpgBXHYbmOFZ9+62BJkSeimMwZ/vNFC6WHklFjxc4SEDW9lj177/Oip6m6EFx8AVfD5+sQ3krDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqNsDGGc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yv4vBFO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276qspu2485259
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I2VOPV/BgLJDUYzBjPUtxeMBpqtqz5jROmcmOwd7878=; b=YqNsDGGcyx+hmzuT
	/ZfgxcE2CBrQvFjfDaJcq81M5aD3tW2vJPQAPDv7jFDIN6UNdhEEh3t5oWdb4mca
	jJZHiSJ0TN1k6ln5KJDmrzwkSYww/wZHUBjNiIDUjcEu3x8KBYnEhGEfYrTMrUQI
	9I8JSbyVsAx5TJQ2D6b1p8xfV5ZXa4mIhZqh/6Jtty8fpmbtpclWB/zCdL3v3QGG
	PUB+9GBPCva9UrJ0hCnXa/m3OcdqA+IEzuqhNv6Q+znpOpNiMt1eRmisAFUw/cpF
	F0bcObqHlov4GFk++LhbT2U6BTvYCWkzTzFxNjsORGTKzNthwq/8/07sVPa2ku2O
	jHmlhg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc838pbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:32:57 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3598ab49242so4682883a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883176; x=1773487976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2VOPV/BgLJDUYzBjPUtxeMBpqtqz5jROmcmOwd7878=;
        b=Yv4vBFO8KHFtMBnlw2p3rA+1miyNssWMTXDwHhX6Jsdkqy1UmtiHc5hlBz4l2g/tHZ
         b9SMdJr3yvjOeamH8RR/GnmhZHhYoSBMFd/gcRMU0rqwMsZbaQS5MFMrRu2vupo9jngj
         obFdRQy66hZwUKOxyBum8tt6SByi6nk35dR3a+iOYPSyPdpNdbYR0/bbYJIqsnmbYv2B
         OktoYEr+KhfPtqvUUEpqN1O/Rot5dsCnKvbH3AZc+VnOlLu7Bqr2RPGLSbtceWKvP3gW
         hneY7cajrpt+xCIJ/ydOTNqAthYzH/7TgBv92dhfmBaYwMe+6Kkex++PJHv55SOZAhnR
         6d4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883176; x=1773487976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2VOPV/BgLJDUYzBjPUtxeMBpqtqz5jROmcmOwd7878=;
        b=MteIL0CAkZgbHAKZIfFUh0EwXotpfX+lzpq8hNh1bDW2fTpfjmrqRwq2q46ec4Iuti
         OG0pQWG+Sxjhqllt/7z/haNgagBo1rhXw48HMs29fNNNFTsNzS+s7NXttrXUoqu4UvYg
         wTfy8Csfmp+OQRUkyr/WxHHgNbWzaQVEyIJ6mtVO1Z9q5NTfMf/Hg5CZqfDeRLYOAuK+
         WtwE8jx6a+2xbhk2gz6xvXYfgXjTJ8NlB7Dfgfy6KgBCoocUIl6Tz7tu5+y1ofL9tqw2
         vRUl7/amhp/OMle/fcgVKwam7jTtBfF+guIXG+tDIbrAdZ7uNX0HHTQUIAtMjfUIIULl
         WzFA==
X-Forwarded-Encrypted: i=1; AJvYcCXUb39mSm+WF9O1TW7885bXOQS0ld0dhP7Nv7P4EY+2EG4nSd2PZ0FJ2eGFW/X1hMUYZItdQmM0oz7qEZyl@vger.kernel.org
X-Gm-Message-State: AOJu0YymKGNJbFuDngsP2gmojd8CdSN3U2x2HltbCFLk6hDH3ZCdCR0R
	+UsIuD1WfeCZJsj/iqWbn5ux6o8QEsCjyrQKDazR2rVRekYYP5muZhRCX3MsINsT+M2adPub7Wz
	whTjIOVzLcC5++48+HDmG9o1b6Ywi7SGqBCzbvxB0IQj+w5fOCMoQJVOomd5Wi3jfMv6lUu+hiD
	sN
X-Gm-Gg: ATEYQzzsCZUCaB/7mjRvY1CDkIEBrmPX1sNpsL9twG87TJ05XxWrUwCwIMbaxUJeJzb
	dRckfgcs1FzC3js89QnmhQCws8wrsSp+scz+90nDgTbKR5mi1p2P8/gDNsqWdjr6GhWPz/Y0cYn
	KB2AAdoF0XkgGn9TtBD5cOyYiK5AW4xmEkNiTv71qFWpR+CoqPjxAdBbqAroFDpOa3fc+YdAJ1O
	RzPdgCcKnPKKkqlox/AA8TfR1U3bP7MXZiZBDqcch4mMNcaNZ02PnP3Iv5m+rHiRiH3uN+WLAxx
	OQwRV7RsUXQV4VNhgzH7CvcQUOc7Kvm1ZbZYTvupBtPjdzjjks7SOaWXHKyIBEdCEHDu2klXzUM
	EIW4nsysqRn4IltoafHTotDVs2sBu58yxFTO7gOQFHhzPcpATDl9Ydd8=
X-Received: by 2002:a17:90b:1e4a:b0:354:56fc:b721 with SMTP id 98e67ed59e1d1-359be2554ebmr5102512a91.8.1772883175702;
        Sat, 07 Mar 2026 03:32:55 -0800 (PST)
X-Received: by 2002:a17:90b:1e4a:b0:354:56fc:b721 with SMTP id 98e67ed59e1d1-359be2554ebmr5102488a91.8.1772883175193;
        Sat, 07 Mar 2026 03:32:55 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c005db95sm6161555a91.6.2026.03.07.03.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:32:54 -0800 (PST)
Message-ID: <79e7bf11-4063-42f7-b3c7-789b75622cb3@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:02:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/12] drivers: soc: qcom: Support to load saved DDR
 training data in Sahara.
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-12-kishore.batta@oss.qualcomm.com>
 <j5om75sck65rlh7bz62ojyvkqalvo4dv22kucqbwmvtgxk3lkf@xuylfq55ev67>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <j5om75sck65rlh7bz62ojyvkqalvo4dv22kucqbwmvtgxk3lkf@xuylfq55ev67>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R9UO2NRX c=1 sm=1 tr=0 ts=69ac0ce9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dCiB3eoBnD34cbmOBfwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwOCBTYWx0ZWRfX2telgnsQHyAV
 cySjtOXMisUWmyWMTszQS6kKspGBl/mBaJqwb8pOUuyYC7YYNstQW5sBejlPB2h83yFDnkO6L+B
 EcHVf72crqb6OuvfmuINXOZbk6c+LsBtZflQ4Q5EIgQ8hf1rXRhStWoCBDt+0KJ+hDAfBnCUO5m
 ARjBpRxIo+gm6cpnA47+WM3oaZs5qVzL4YFDjalnHsK02gBisvSKzPferccB06kf2+13p4zoqwI
 nvnq6vYegshTjmPwp8MRL1GUHGmCbQjha/mlsYvBnSXlxx4OBZyRh7ZaLbv445rt49tQQEmcX+b
 VUKsVl6QpBRzexTq2PLpOvjER1xWLU7spnflKCMi+f7CUYmHEL/5A/f8VEhrllok84/3tu/g77y
 oaKZoBUdB6vC6q3G+ZrCqNS7aW3qZwKSD7rPGuU4M3ORb4ZQUaMxv/LvCChjGfj4pR+MpBlgA6M
 0MVNzq1ytUmOwi8kD0g==
X-Proofpoint-ORIG-GUID: oosCHb6-258CiVXNXcI8iFn1ZPzulDlx
X-Proofpoint-GUID: oosCHb6-258CiVXNXcI8iFn1ZPzulDlx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070108
X-Rspamd-Queue-Id: 12BC322B6FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95961-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.952];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/26/2025 7:46 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:25PM +0530, Kishore Batta wrote:
>> Load the saved DDR training data during subsequent bootups. The image ID 34
>> is for DDR training data image. During subsequent bootups, the Sahara
>> driver needs to load the training data file associated with the serial
>> number instead of the default file present in the image table. If the
>> serial number-specific file is not present in the firmware directory,
>> it indicates the first bootup of the device, and training data gets
>> generated.
> As with your other commit messages, you start by stating what the patch
> does and they you add layer after layer with explanation on top of that.
>
> Rewrite this one as well to clearly describe what problem the patch is
> trying to solve, why the firmware loader is invoked here and what
> expectations this has on user space.
ACK. In v2, all the commit messages and patches are rewritten by first 
stating the problem description and then the technical explanation of 
the change.
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/sahara/sahara.c | 71 +++++++++++++++++++++++++++-----
>>   1 file changed, 60 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
>> index 3887cdcfe256..28e52a9974a1 100644
>> --- a/drivers/soc/qcom/sahara/sahara.c
>> +++ b/drivers/soc/qcom/sahara/sahara.c
>> @@ -68,6 +68,7 @@
>>   #define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
>>   #define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
>>   #define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
>> +#define SAHARA_DDR_TRAINING_IMG_ID	34
>>   
>>   struct sahara_dev_trng_data {
>>   	void *trng_data;
>> @@ -213,6 +214,8 @@ struct sahara_context {
>>   	enum sahara_mode		current_mode;
>>   	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
>>   	u64				bytes_copied;
>> +	u32				serial_num;
>> +	char				*fw_folder_name;
> Both of these are assigned and used solely within that one block below,
> and they are 12 bytes. Can they not be put on the stack?
ACK.
>>   };
>>   
>>   struct sahara_dev_driver_data {
>> @@ -270,6 +273,7 @@ static ssize_t ddr_training_read(struct file *filp, struct kobject *kobj,
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	int ret;
>> +	char *fw_path;
> Reverse xmas-tree please.
ACK.
>>   
>>   	if (image_id == context->active_image_id)
>>   		return 0;
>> @@ -286,19 +290,64 @@ static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   	}
>>   
>>   	/*
>> -	 * This image might be optional. The device may continue without it.
>> -	 * Only the device knows. Suppress error messages that could suggest an
>> -	 * a problem when we were actually able to continue.
>> +	 * Image ID 34 corresponds to DDR training data. On subsequent
>> +	 * bootups, the sahara driver may need to load the training data file
>> +	 * associated with device's serial number instead of the default file
>> +	 * listed in the image table.
>> +	 *
>> +	 * If the serial number specific file is not found in the firmware
>> +	 * directory, it likely indicates the device is booting for the first
>> +	 * time, and new training data will be generated.
>>   	 */
> This comment only relates to the first block below. How about moving it
> into the block to make that clear - and to keep symmetry with the other
> comment that you moved into the its block?
ACK.
>> -	ret = firmware_request_nowarn(&context->firmware,
>> -				      context->image_table[image_id],
>> -				      &context->mhi_dev->dev);
>> -	if (ret) {
>> -		dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>> -			image_id, context->image_table[image_id], ret);
>> -		return ret;
>> -	}
>> +	if (image_id == SAHARA_DDR_TRAINING_IMG_ID) {
>> +		context->serial_num = context->mhi_dev->mhi_cntrl->serial_number;
>> +		context->fw_folder_name =
>> +			sahara_get_fw_folder_name(context->mhi_dev->mhi_cntrl->name);
> Use a local variable for "name" to shorted the line, such that you don't
> need to wrap it weirdly.
ACK. Removed sahara_get_fw_folder_name in v2 as its not required.
>> +		if (!context->fw_folder_name)
>> +			return -EINVAL;
>> +
>> +		fw_path = devm_kasprintf(&context->mhi_dev->dev, GFP_KERNEL,
> fw_path is used for 3 lines, but you're keeping this allocation for an
> undefined amount of time.
>
> Regards,
> Bjorn
ACK. Freed it properly in v2, after usage.
>
>> +					 "qcom/%s/mdmddr_0x%x.mbn",
>> +					 context->fw_folder_name,
>> +					 context->serial_num);
>> +
>> +		if (!fw_path)
>> +			return -ENOMEM;
>> +
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      fw_path,
>> +					      &context->mhi_dev->dev);
>> +
>> +		/*
>> +		 * If there is failure to load serial number specific file, load
>> +		 * the default file from image table
>> +		 */
>> +		if (ret) {
>> +			ret = firmware_request_nowarn(&context->firmware,
>> +						      context->image_table[image_id],
>> +						      &context->mhi_dev->dev);
>> +			if (ret) {
>> +				dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>> +					image_id, context->image_table[image_id], ret);
>> +			}
>> +			return ret;
>> +		}
>> +	} else {
>> +		/*
>> +		 * This image might be optional. The device may continue without it.
>> +		 * Only the device knows. Suppress error messages that could suggest an
>> +		 * a problem when we were actually able to continue.
>> +		 */
>> +		ret = firmware_request_nowarn(&context->firmware,
>> +					      context->image_table[image_id],
>> +					      &context->mhi_dev->dev);
>> +		if (ret) {
>> +			dev_dbg(&context->mhi_dev->dev, "request for image id %d / file %s failed %d\n",
>> +				image_id, context->image_table[image_id], ret);
>>   
>> +			return ret;
>> +		}
>> +	}
>>   	context->active_image_id = image_id;
>>   
>>   	return 0;
>> -- 
>> 2.34.1
>>

