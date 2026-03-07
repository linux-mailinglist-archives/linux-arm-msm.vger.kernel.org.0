Return-Path: <linux-arm-msm+bounces-95956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDN8BrMMrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:32:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3922B6CE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7A95430138BA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E223629B233;
	Sat,  7 Mar 2026 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3ukz+05";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzFeRbos"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A12D1339A4
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883120; cv=none; b=ol9MrMS+ZLNLu4zJBhGraZ33XyKwdQxQuWcXJClrKm678X+BRQIS4QN7PNcrSL20we9aRcCbVtntnVcnpuPCKYD76DO037Ib7NHJ3E6YbVbepLx7SmxpG9crAYDbVeSOOAfLMeCvXLo5LPS1e0iMgcFC3aU6lXixASxrErxpqBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883120; c=relaxed/simple;
	bh=W5qYQRIrocV+S/W70Kv5NTkkkXqqQmMxV052KmfPm68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8l/wrkiaEHyiDzYKyncbuEsk+AIpSU1grk7foHA0ZbDDxkxOPR/f/nBJqU6HjYIFr2wCElLhJN3JmSIs9KSsExktSA2TBPJyg+PkS3W9m/66JH1sfUzlkP7Ntxs3V+UKG572gr+MrZAAEWWUEvTi1AkFymeRKo3dJVQCv8VI7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3ukz+05; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzFeRbos; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276rWbh2454945
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8Y1mVslKFnmPFsOlBJckRzYi9sioOeJ7VsXu7tfSVc=; b=f3ukz+05AwNN8M9i
	wfXr25ILgmz+SpVd+oWogPLxlgb91OBn8JooQTsxxS4ISxnP5tKPvi7i906SIe8A
	XeYwuR5FyzE7dy1dimt2UTuC6sVwr02aICFZmzA+Ie7QIPvATcj+d/A7aN9h/EA1
	G6JRwTZ7W83VINIAGpDyJEUInYGitpz0LyCj9fyJwv2X5KNcawuAzDJpty7Q0OyN
	diUzTDeqNk5hiUno6VJHblWJHW1GxLOpNMpz2WrvTU0lcgkQJM80Czuz+d9twLQ3
	FkCBSmBX5gntaUwnJo3hMrnOlMLZAe1dhkJPP9DdEMmp7Pbr1IDHYtQ2qQlnmYDO
	4FylZQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcd88nfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:31:58 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8299c57642cso8920028b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883117; x=1773487917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8Y1mVslKFnmPFsOlBJckRzYi9sioOeJ7VsXu7tfSVc=;
        b=MzFeRboss1HWOWYc+CuGeY7JAah4ApLjGd5cA5TgQ9XkvTFD28INfAf8u2KiFsQFvu
         6pnh7q7vJ7VXSi+WkIYPULkTJ3aqV1Hum7h0GHqyuaicTFXv2e7WKQe0wRmCNuAXYwzT
         vV1rKpm4bEkSuf1HyxYh/xgwDctIdPYq0EjAXejD3gR6xRBqSrCX3KT5Sktm5Qnonno/
         J1Qe0HiXsoxr5hxpw8fSKi6zzjesGwzjAlXXAbNAI3k41CTKwYr0PdK80V2kPalayVZD
         5hLfFZRGTeSPCuOaaDULgoZBDPMo5D/UlkxtlQBrvzrR0ZjFInFSDQLJTukvMPpNLOPE
         7lag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883117; x=1773487917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8Y1mVslKFnmPFsOlBJckRzYi9sioOeJ7VsXu7tfSVc=;
        b=aUWGKNW9ggHKhq1JcBvEy1snD2/+nV20GL1ZxX9DCaCry1F917bRnrQtLFufKqakGk
         /c/18gNdf+pI5Qnv3ron1Bv3bK5wNdQIJoG4poOOWQqnmqeVu1nn4hXYElAOgylzO5H6
         huUf+rom6t8OGbT8jPdQRIT/CHLHrIJLwemVQZyy5/mU/lHBMU2hF8eN4B2+u6M0ykTI
         XtO/1VayA1fiz2DEaZbxrPGfrSGNlAHEJP5yfMAU1pnDidUI6DFVDv+/Q0kdwweyMt9L
         1p7HGbXHMdNctsJefBUVLEH3vek6VR64kaYHwGkGUD1EoCeWeKf/sR2KZeZiXUA8+doH
         EQoA==
X-Forwarded-Encrypted: i=1; AJvYcCWilagv8uSsA5Nw999H/VH8xSLbt+90e4jrBYhK1SoErVb8nvidpmkSi9siY+v2s73DSMimnEzegu84TdBH@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr2UMjBRc2ZTnO0QH03wvUZfgUD0tjvwsBlvM3M6MngUBHhDLv
	NcmE1ZZvAXkubscFkjjxPXgkuA3K4erm1JXrRPVDvy//BddKN5oMlLS4OSHRSDCMrTD70/yz1Ql
	bpCz0CcGF50Cof8TAcCMi5cTn9GeqtFLNp4rPtEoHUIanpnEnDtMNCEnbY3DU7krQX0yj
X-Gm-Gg: ATEYQzxx0v7eKf8h1tFRCKlS3aTCYfmhpEaPiKQGMq0x/zUujkk1ZsCmIiKnjOOHXDe
	U+IyPGbfYAwvc2Kg+s1+l5CV0Hazu7YCqUygNErQtBnNXKQL3tYWRWBsvG3bW7G/iDjUKNLPMuJ
	shgGsX3Aj9vb73+FMapT4ng1bY9C7PLllGjCrTi7TNquKPHGOD5XLwfZroI/G94NyfYj2boxDVJ
	K3OYsfDGAuM0Rv9pgvUwa7fSA3GW9l7G1Q6yVpYOGuMPwFbI9AYS5K+dMABPQX2mHXSn4khI7Sk
	Jp2LgonrpNTjxx9W0VsXMfs5C8zPgAuBG90vOydKK3mfA/JWbUbOfPNG9L5TfiWYpSUEaq2AFp7
	xk78b8V2K/VvN2u2aV62lSCQsQiLtdBJmHORejR2Tie4JXBjuafBMeHs=
X-Received: by 2002:a05:6a00:4c95:b0:823:b1f:893c with SMTP id d2e1a72fcca58-829a2f126f8mr4281244b3a.33.1772883117066;
        Sat, 07 Mar 2026 03:31:57 -0800 (PST)
X-Received: by 2002:a05:6a00:4c95:b0:823:b1f:893c with SMTP id d2e1a72fcca58-829a2f126f8mr4281233b3a.33.1772883116550;
        Sat, 07 Mar 2026 03:31:56 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a465c872sm5467852b3a.19.2026.03.07.03.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:31:56 -0800 (PST)
Message-ID: <95956aa5-7a6d-4841-9d9c-81d6138802ce@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:01:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/12] drivers: soc: qcom: Add sysfs support for DDR
 training data in Sahara.
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-8-kishore.batta@oss.qualcomm.com>
 <udlrclvrtmam3yfcof4mzwoyia54gbl7em7kabdfn5r42res5k@mbrild6mbahx>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <udlrclvrtmam3yfcof4mzwoyia54gbl7em7kabdfn5r42res5k@mbrild6mbahx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2D9wBRYdlfysTC-rNaIxdf7f-yD3tc47
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNSBTYWx0ZWRfXwxN9vI0TouWm
 jUnE7K4Rg8MAJXeyPnhijCQwkQm1NOV34e9OB3pL184/9CcKUfoV9cNrhAu7yH8FswSonMyPvJZ
 hJeJpl4cNf0zV//YgZntAszGZhIC5G144mU14rJwr1YswssqpJVQkgV4NlsDuOpvoH9lXVumUOV
 tvcTTFB4qJjCJgQ5vrrv1K/XH0qoH0Yvypo0MYbO5DSrN5QdJ+5GdnrALj3H5kktZnXKhVwvsQO
 RcWbz4GwgVkTnFzlWXPeO2kzushiibwvfSzePxcLJB+x+RBnPBeSzyJhCiwAUTQtqnkuUwMbRB2
 ptj4W0jn8zrsCTJaVhuo5gjVY9mDuXaBSTcDur4igoMIO4493MkD+NBBmujkHQXCpayV9zh2FZN
 N8AyLGyWPxjRVCzgv0d6LiBK7X4qmOy03PAO/2j7WPytNX5x/PmarSDceffaqcJVAEimfK6tP8V
 RcKzMa+UODbE/9b/hNA==
X-Authority-Analysis: v=2.4 cv=O/w0fR9W c=1 sm=1 tr=0 ts=69ac0cae cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=rT4DXIY4e1eAXfZkh5QA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 2D9wBRYdlfysTC-rNaIxdf7f-yD3tc47
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070105
X-Rspamd-Queue-Id: 88E3922B6CE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95956-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/26/2025 4:07 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:21PM +0530, Kishore Batta wrote:
>
> No "drivers: " prefix in subject please.
>
>> Add the Sahara training data structure and populate the DDR training data
>> sysfs node.
> Start with a problem description.
>
>> During device boot, the device performs DDR training and sends
>> the training data back to the host once complete.
> "The device"? All devices, some devices?
>
>> The host exposes this
>> data to userspace via the sysfs interface.
> I've read three sentences, you've given me breadcrumbs of what's going
> on...but you're forcing me to guess how these three things fit together
> and what you're trying to achieve...
>
>> The "ddr_training_data" sysfs
>> node will be present in the MHI controller node (e.g., mhi0, mhi1) along
>> with other existing sysfs nodes at /sys/bus/mhi/devices/mhi*/.
>>
>> When the host reboots, a userspace service is triggered via an udev rule to
>> read the training data from the sysfs entry.
> This describes one possible way to do that, but it's not the job of the
> kernel to dictate how this is implemented. You should describe the
> expected work to be performed by userspace, and you may suggest how
> that could be implemented.
>
>> The service then copies the
>> valid training data to the image firmware filesystem.
> This sentence doesn't make sense to a general Linux user, because
> there's no separate "image firmware filesystem".
>
>> This change includes
>> the structures added for DDR training data and embeds them in the
>> sahara_dev_driver_data structure. It also populates the sysfs attributes
>> for DDR training data.
> This half of the paragraph isn't directly related to the implementation
> of the user space service, so better split it out in a paragraph of its
> own.
>
ACK. Rewritten the commit message in v2.
>> Userspace service - https://github.com/qualcomm/csm-utils
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/sahara/sahara.c | 109 ++++++++++++++++++++++++++++++-
>>   1 file changed, 108 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
>> index b07f6bd0e19f..df103473af3a 100644
>> --- a/drivers/soc/qcom/sahara/sahara.c
>> +++ b/drivers/soc/qcom/sahara/sahara.c
>> @@ -60,6 +60,12 @@
>>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>>   #define SAHARA_MEM_READ64_LENGTH	0x18
>>   
>> +struct sahara_dev_trng_data {
> trng - "True Random Number Generator"?
Sorry for the confusion. I was referring to sahara device training data. 
In v2, I have used a different structure and naming conventions are 
properly used.
>> +	void *trng_data;
>> +	u64 trng_data_sz;
>> +	bool receiving_trng_data;
>> +};
>> +
>>   struct sahara_packet {
>>   	__le32 cmd;
>>   	__le32 length;
>> @@ -177,6 +183,58 @@ struct sahara_context {
>>   	bool				is_mem_dump_mode;
>>   };
>>   
>> +struct sahara_dev_driver_data {
>> +	struct bin_attribute ddr_attr;
>> +	struct sahara_dev_trng_data *sdev;
> "sdev" as an abbreviation for "sahara device training data"? I would
> have guessed it related tot he "sahara device driver data"...
>
> Why do you have two separate structs for these?
ACK. In v2, i have removed them.
>> +	struct sahara_context *context;
>> +};
>> +
>> +/* Exposes DDR training data via sysfs binary attribute for user-space access */
>> +static ssize_t ddr_training_read(struct file *filp, struct kobject *kobj,
>> +				 const struct bin_attribute *attr, char *buf,
>> +				 loff_t offset, size_t count)
>> +{
>> +	struct sahara_dev_driver_data *sahara_data;
>> +	struct sahara_dev_trng_data *sdev;
>> +	size_t data_size;
>> +
>> +	sahara_data = container_of(attr, struct sahara_dev_driver_data, ddr_attr);
>> +
>> +	if (!sahara_data)
>> +		return -EIO;
>> +
>> +	sdev = sahara_data->sdev;
>> +
>> +	if (!sdev || !sdev->trng_data)
> This isn't assigned anywhere...
ACK. In v2, i have rearranged the patches such that the changes are clean.
>> +		return -EIO;
>> +
>> +	data_size = attr->size;
>> +
>> +	if (data_size == 0)
>> +		return 0;
>> +
>> +	if (offset >= data_size)
>> +		return -EINVAL;
>> +
>> +	if (count > data_size - offset)
>> +		count = data_size - offset;
>> +
>> +	/* Copy the training data into the buffer */
>> +	memcpy(buf, (sdev->trng_data + offset), count);
>> +
>> +	/* Free memory after last read */
>> +	if (offset + count >= data_size) {
>> +		kfree(sdev->trng_data);
>> +		sdev->trng_data = NULL;
>> +		kfree(sdev);
> Allowing the data to be read only one time and then failing subsequent
> reads is going to be confusing to people. Imagine debugging this and
> depending on how fast you can hexdump the attribute you either break the
> userspace thing or you are unable to catch the data.
ACK.
>> +		sdev = NULL;
>> +		kfree(sahara_data);
> But you did device_create_bin_file() on &sahara_data->ddr_attr...what
> happens now?
ACK. Handled properly in v2.
>> +		sahara_data = NULL;
>> +	}
>> +
>> +	return count;
>> +}
>> +
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	int ret;
>> @@ -703,11 +761,42 @@ static void sahara_dump_processing(struct work_struct *work)
>>   	sahara_send_reset(context);
>>   }
>>   
>> +static int sahara_dev_populate_attribute(struct sahara_dev_driver_data *sahara_data)
>> +{
>> +	int ret;
>> +	struct sahara_context *context = sahara_data->context;
>> +
>> +	/* DDR training data attribute */
>> +	sahara_data->ddr_attr.attr.name = "ddr_training_data";
>> +	sahara_data->ddr_attr.attr.mode = 0444;
>> +	sahara_data->ddr_attr.read = ddr_training_read;
>> +
>> +	/* Size is populated during device bootup */
> Where? In some other patch?
Its during runtime of the device. Handled properly in v2 patchset so 
that the assignments are in single patch.
>
>> +	sahara_data->ddr_attr.size = 0;
>> +	sahara_data->ddr_attr.write = NULL;
>> +
>> +	/*
>> +	 * Remove any existing sysfs binary attribute to avoid stale entries
>> +	 * during warm boot or reinitialization. This ensures clean state before
>> +	 * re-creating the attribute.
> But why do you need to recreate it? What is the life cycle of this file
> and how does it conflict with the life cycle of the sahara MHI device?
ACK. Fixed properly in v2 by using controller scoped lifetime and device 
managed resources.
>> +	 */
>> +	device_remove_bin_file(&context->mhi_dev->mhi_cntrl->mhi_dev->dev,
>> +			       &sahara_data->ddr_attr);
>> +
>> +	/* Create the binary attribute */
>> +	ret = device_create_bin_file(&context->mhi_dev->mhi_cntrl->mhi_dev->dev,
>> +				     &sahara_data->ddr_attr);
>> +
>> +	return ret;
>> +}
>> +
>>   static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_id *id)
>>   {
>>   	struct sahara_context *context;
>>   	int ret;
>>   	int i;
>> +	struct sahara_dev_driver_data *sahara_data;
>> +	struct sahara_dev_trng_data *sdev;
> This had a nice reverse xmas tree feel to it...perhaps you can keep
> that?
ACK. Fixed in v2.
>
>>   
>>   	context = devm_kzalloc(&mhi_dev->dev, sizeof(*context), GFP_KERNEL);
>>   	if (!context)
>> @@ -717,6 +806,17 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   	if (!context->rx)
>>   		return -ENOMEM;
>>   
>> +	sahara_data = kzalloc(sizeof(*sahara_data), GFP_KERNEL);
> For the case where userspace doesn't read the DDR training data (e.g.
> because the particular device doesn't implement/need that), where is
> this freed?
ACK. Memory allocations and de-allocations are now properly handled in v2.
>> +	if (!sahara_data)
>> +		return -ENOMEM;
>> +
>> +	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
>> +	if (!sdev)
>> +		return -ENOMEM;
>> +
>> +	sahara_data->context = context;
>> +	sahara_data->sdev = sdev;
>> +
>>   	/*
>>   	 * AIC100 defines SAHARA_TRANSFER_MAX_SIZE as the largest value it
>>   	 * will request for READ_DATA. This is larger than
>> @@ -749,7 +849,14 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   		return -EINVAL;
>>   
>>   	context->active_image_id = SAHARA_IMAGE_ID_NONE;
>> -	dev_set_drvdata(&mhi_dev->dev, context);
>> +	dev_set_drvdata(&mhi_dev->dev, sahara_data);
> sahara_mhi_remove and sahara_mhi_dl_xfer_cb still assumes that drvdata
> is of type struct sahara_context.
>
> Regards,
> Bjorn
ACK. Fixed in v2.
>> +
>> +	ret = sahara_dev_populate_attribute(sahara_data);
>> +	if (ret) {
>> +		dev_err(&context->mhi_dev->dev,
>> +			"Failed to populate bin attribute: %d\n", ret);
>> +		return ret;
>> +	}
>>   
>>   	ret = mhi_prepare_for_transfer(mhi_dev);
>>   	if (ret)
>> -- 
>> 2.34.1
>>

