Return-Path: <linux-arm-msm+bounces-95953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDs5Cn4MrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:31:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB1E22B6B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5BCE301111F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4476F2D3225;
	Sat,  7 Mar 2026 11:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J0lyrcXn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J4APqsKh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA0E29B233
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883067; cv=none; b=VuSZ+IugDNu4d+0Bttto9R9rGlkT7H9/3GVhZ9zk0gRh14XH15ctrdMyJiWB4VOXh0Wu6K1hwrxN7nuvrYIY07oEQsXw86AtGD6q98r3E623T6rCxEqMdqEMkvZMo2iHtLshavsBaRCi6/veDJCAhn2gs2V+Jo8XlzK6qesh8n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883067; c=relaxed/simple;
	bh=dw4NguK4z1kZct7/GNW5OzdJPNuHhVffj46S0FKXwfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCWGrU2DQ7D0weTIzbKUjev1EVFJPdczRn8c6DQTQQei5MRHxfF5SdK0+JTjVNsYTfU9c2wLn1E40yZrjhw7ksnFjVAv5LXYb5esNGLEDrdLo54RQ9TYo3LI4BbZnNGSlmzJm2fhr1TE6Fs0s52vOwCCEBchRBOcVCeZVIv49pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J0lyrcXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J4APqsKh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276s0LT2404971
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aObxS31+CMCRCq85OubM28T+YZ4utlQn84Huz04kQHM=; b=J0lyrcXnCCipYI7P
	6Wl5j+tJoUgHe4zi80dkGUVzinkl1OmPrsUZhTNaANnQeKZWHSwz3ROgOY1honii
	SQMd26T04kau3aiU/+rh451l3dKwRCP485773EoVVJ81hIiJ7KVbKf50x7uiBcVH
	UCFwznqzq4Uo4XzHZrMEwX3AvEivYAI1fEhLuvczRuPxi1Lw6fC3VG7pKbSYSqtd
	SUNau5Q3T7e8loC6BIsEyHPZjqGDIx6Gt739HeL+P6nHPsPD3CKSRfqJyLyJYjo/
	5cqzIbhNWMYh0OvWPaF2lCW+O7jKiKN82XSu3ua2k3V3i/G1n2j1prbguhB6NCnF
	3gjlog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qes0yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:31:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4e20a414so346950365ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883064; x=1773487864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aObxS31+CMCRCq85OubM28T+YZ4utlQn84Huz04kQHM=;
        b=J4APqsKhOXnoCpXHBQbVDMINOr35b7LwJOJNyG7j8JcYwKBm+8rokeNBlN2O9SuIDO
         NDUcQRlCUHOFTRy1jVtEy00WJaC2685tbrWzH1K9IMaaF06pAYC6zqZiiJN3bhRoPjQ3
         nVp9da3YFrgq/GZYUMTkqV7yHqiuUsucaFtm7nLLQbKjlS2QIp+2+Ve2FPfKv9+AuwF+
         y8R2xMkphNnKgb+h46rwPhI9nAHpiQn6nJ7Jp+3PBjeInkqyOHVOJ8dIO5364PCcuKoJ
         GcMD3iZyDzIBKJyfEsKeLkugSVAqYklAbB779LcFZx8ftSGgbRL5Oz9JbbjcvTCZzfLG
         hRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883064; x=1773487864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aObxS31+CMCRCq85OubM28T+YZ4utlQn84Huz04kQHM=;
        b=SckZefb/Keb7ROe4bydpvC/h1XQwM+Q/mU4aDnwJZHtY452WYgei6UJlkmNScaafx5
         rK4XUBm+pmcF9cwPZyLjErU0nIwRzlX+hNdDra3ua7bpVrOMx7GEwB+ECdvNrEtefUkv
         MUjSI3JzLBMCssTWZod5mXNtTY0q85SrAVVuqRxZkj/FF53UlOS56MMoqcsVRnbEgscF
         wHuvDLpcpZlRgO+kiHA4xQ+ogwu2BgHGn5A1c0bguJfATZ3FftfQXuKDVy3LWPD5nwch
         YTXLxHeioM4KXvvZAIetM8FNG5Yw8hTvzkqlw2T8JkYHQULwkpkpmZERZ/A4eJoB4NN5
         X4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzjyfPmzFA+3Esj3Z747OPOXZSeI8gpoBQ1+YImziPNUcJDdH9QI520mS+u2dxGj6CdNIpDYO8rY0jKH5B@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv3Fh+UZqC7D+9x+H1xc8dJfal4PZSDeu4sM9mwDIYAkgC/JIM
	8GFsAIqr8Yh2oEueBeZl4tfVl8+NZkdeMa45lveIzL1Jk+eO8SY9nHZHjUeEbLnPZFa3SphIw4I
	DN0NBx2/j9JlFiNVgqrWDcdRdIXmxUuAaYpqyjzXFqec5Aal2WTupRecTTzvNnmqAGK2Z
X-Gm-Gg: ATEYQzxf2+h3Ogk2S8ok4JeL61ciM64z3bQoqu4+S6WBuq45Vv7cxXArmn25gUzItme
	a+WrEAlBemPNEBwrwD0HEpLO6Wh4uZkoeGDzZDozSVNtDGHyXhrv8noIm8r16qQZjJBAq4LwtJZ
	jN7iu18Skg0b5Zi+Dy0ZfdSGAeMF6mKqR1x3C6zTdT8FcHgbmuxb9iPBNWUkYv6dgbd40pFgy+p
	RUzhAFvoXf4Mriu2hOQqJy3HaNFqhrCK+7OiDv7F/aPqB/hBk/xJQFHetE5enCdwpfJmZFM1uug
	6zQGssmWvcm7zTvP1L5acUcTbPTF89l/w+QcVwjzHTWVE2VYS76PpurTsFB6IlLTSOjCVQfJ/kd
	GpR8RBKUsoTI0x14eZ7p3ezQXN3QDXqUG0HMEqL5xpCTEv4ZDgoQa8U8=
X-Received: by 2002:a17:903:380f:b0:2ae:4f2b:9263 with SMTP id d9443c01a7336-2ae82451675mr57528395ad.40.1772883064116;
        Sat, 07 Mar 2026 03:31:04 -0800 (PST)
X-Received: by 2002:a17:903:380f:b0:2ae:4f2b:9263 with SMTP id d9443c01a7336-2ae82451675mr57528195ad.40.1772883063648;
        Sat, 07 Mar 2026 03:31:03 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8cfb0sm66030525ad.67.2026.03.07.03.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:31:03 -0800 (PST)
Message-ID: <84e67d29-532f-4e47-a888-aef3a553b67b@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:00:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/12] drivers: accel : Move AIC specific image tables
 to mhi_controller.c file
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-3-kishore.batta@oss.qualcomm.com>
 <b57hqn6vnej6uab43cppt2fj4ugsg5ifornc7puajaxipetu2e@nigbpn2f7k7c>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <b57hqn6vnej6uab43cppt2fj4ugsg5ifornc7puajaxipetu2e@nigbpn2f7k7c>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DEe515PqaVxz5g30-0rf4V95sXqtc-q7
X-Proofpoint-GUID: DEe515PqaVxz5g30-0rf4V95sXqtc-q7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfX14KrrDtF7sHm
 CwU0HvDRRcJ2FZqawWEQEzQ1jh42/2A7q3FhG3dXhz/zDY01HX4lqHuvT3ZDyXj2TrhD+Ue3iL5
 Eg4xyu/qjDwe/w+na1DPast43UIjSRlglzTvmDsujc8Gu3+7YsQO9PW8SxsrW5W5se6ltsoGbTB
 0YcQnmwFwEFQvgwXiYlvDh4xiSjFzT2D69PH1hTUxntN4dpRpnd3pZx2Sy8yPD0s0ZQh8PobxV6
 bFnPyKAnuN0EpprZvB8kwfoWeQi3BFoTR3ioq6Kmwj1jRDNd9r4m+VTddxB/AK7e1DbrFqN10Gz
 pSYOG3MDa9OLUTPAyOFqYZ0oQWiuEeiUT/y00k426PqbgGWZy0sHaTgUcaBTGDZOgjBUWL98PsG
 oqJoTAno/trCuksH2mDxG+CBLeJprW2jJaDv06B/UqVT23Acymi4yUO2+SBakil4VEoNGu5P4Ud
 Q3lAyjaMapMrFxCcImw==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ac0c78 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vj0EZtmO60hHu1s2-1AA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070106
X-Rspamd-Queue-Id: 6EB1E22B6B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95953-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/26/2025 2:38 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:16PM +0530, Kishore Batta wrote:
>
> "git log --oneline -- drivers/accel/qaic/sahara.c" says that subject
> prefix should be "accel/qaic: "
>
>> Move the AIC-specific image tables from the Sahara driver to the AIC
>> specific controller file. This change prevents the Sahara driver from
>> being tagged to a specific Qualcomm device, making it easier to add
>> support for new devices with their own image tables.
> I don't have any concerns with moving the firmware mapping out of the
> sahara driver, but the implementation already supports two different
> devices...so it's not "tagged to a specific device".
>
> Also, while at it, please start your commit message with a problem
> statement and finish it with the technical description of the change
> you're doing.
Apologies for the delayed response. It took some time to sort out the 
issue with kernel_boot.elf image. Acknowledged. In v2, I'm no longer 
claiming the driver is tagged to a single device. Instead, the 
motivation is that the implementation lived under QAIC even though its 
an MHI protocol driver used by multiple devices. The driver will now be 
moved to drivers/bus/mhi and structured as a reusable MHI protocol 
driver. In v2, all commit messages are rewritten to begin with the 
problem being solved and then describe the technical approach/changes.
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/accel/qaic/mhi_controller.c | 43 +++++++++++++++++++++++++++++
>>   drivers/accel/qaic/sahara.c         | 43 ++---------------------------
>>   drivers/accel/qaic/sahara.h         |  7 +++++
>>   3 files changed, 52 insertions(+), 41 deletions(-)
>>
>> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
>> index 13a14c6c6168..5cc7994f4809 100644
>> --- a/drivers/accel/qaic/mhi_controller.c
>> +++ b/drivers/accel/qaic/mhi_controller.c
>> @@ -790,6 +790,49 @@ static struct mhi_controller_config mhi_cntrl_configs[] = {
>>   	},
>>   };
>>   
>> +const char * const aic100_image_table[] = {
>> +	[1]  = "qcom/aic100/fw1.bin",
>> +	[2]  = "qcom/aic100/fw2.bin",
>> +	[4]  = "qcom/aic100/fw4.bin",
>> +	[5]  = "qcom/aic100/fw5.bin",
>> +	[6]  = "qcom/aic100/fw6.bin",
>> +	[8]  = "qcom/aic100/fw8.bin",
>> +	[9]  = "qcom/aic100/fw9.bin",
>> +	[10] = "qcom/aic100/fw10.bin",
>> +};
>> +
>> +const size_t aic100_image_table_size = ARRAY_SIZE(aic100_image_table);
>> +
>> +const char * const aic200_image_table[] = {
>> +	[5]  = "qcom/aic200/uefi.elf",
>> +	[12] = "qcom/aic200/aic200-nsp.bin",
>> +	[23] = "qcom/aic200/aop.mbn",
>> +	[32] = "qcom/aic200/tz.mbn",
>> +	[33] = "qcom/aic200/hypvm.mbn",
>> +	[39] = "qcom/aic200/aic200_abl.elf",
>> +	[40] = "qcom/aic200/apdp.mbn",
>> +	[41] = "qcom/aic200/devcfg.mbn",
>> +	[42] = "qcom/aic200/sec.elf",
>> +	[43] = "qcom/aic200/aic200-hlos.elf",
>> +	[49] = "qcom/aic200/shrm.elf",
>> +	[50] = "qcom/aic200/cpucp.elf",
>> +	[51] = "qcom/aic200/aop_devcfg.mbn",
>> +	[57] = "qcom/aic200/cpucp_dtbs.elf",
>> +	[62] = "qcom/aic200/uefi_dtbs.elf",
>> +	[63] = "qcom/aic200/xbl_ac_config.mbn",
>> +	[64] = "qcom/aic200/tz_ac_config.mbn",
>> +	[65] = "qcom/aic200/hyp_ac_config.mbn",
>> +	[66] = "qcom/aic200/pdp.elf",
>> +	[67] = "qcom/aic200/pdp_cdb.elf",
>> +	[68] = "qcom/aic200/sdi.mbn",
>> +	[69] = "qcom/aic200/dcd.mbn",
>> +	[73] = "qcom/aic200/gearvm.mbn",
>> +	[74] = "qcom/aic200/sti.bin",
>> +	[75] = "qcom/aic200/pvs.bin",
>> +};
>> +
>> +const size_t aic200_image_table_size = ARRAY_SIZE(aic200_image_table);
>> +
>>   static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
>>   {
>>   	u32 tmp;
>> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
>> index 3ebcc1f7ff58..cf8f8b585223 100644
>> --- a/drivers/accel/qaic/sahara.c
>> +++ b/drivers/accel/qaic/sahara.c
>> @@ -177,45 +177,6 @@ struct sahara_context {
>>   	bool				is_mem_dump_mode;
>>   };
>>   
>> -static const char * const aic100_image_table[] = {
>> -	[1]  = "qcom/aic100/fw1.bin",
>> -	[2]  = "qcom/aic100/fw2.bin",
>> -	[4]  = "qcom/aic100/fw4.bin",
>> -	[5]  = "qcom/aic100/fw5.bin",
>> -	[6]  = "qcom/aic100/fw6.bin",
>> -	[8]  = "qcom/aic100/fw8.bin",
>> -	[9]  = "qcom/aic100/fw9.bin",
>> -	[10] = "qcom/aic100/fw10.bin",
>> -};
>> -
>> -static const char * const aic200_image_table[] = {
>> -	[5]  = "qcom/aic200/uefi.elf",
>> -	[12] = "qcom/aic200/aic200-nsp.bin",
>> -	[23] = "qcom/aic200/aop.mbn",
>> -	[32] = "qcom/aic200/tz.mbn",
>> -	[33] = "qcom/aic200/hypvm.mbn",
>> -	[39] = "qcom/aic200/aic200_abl.elf",
>> -	[40] = "qcom/aic200/apdp.mbn",
>> -	[41] = "qcom/aic200/devcfg.mbn",
>> -	[42] = "qcom/aic200/sec.elf",
>> -	[43] = "qcom/aic200/aic200-hlos.elf",
>> -	[49] = "qcom/aic200/shrm.elf",
>> -	[50] = "qcom/aic200/cpucp.elf",
>> -	[51] = "qcom/aic200/aop_devcfg.mbn",
>> -	[57] = "qcom/aic200/cpucp_dtbs.elf",
>> -	[62] = "qcom/aic200/uefi_dtbs.elf",
>> -	[63] = "qcom/aic200/xbl_ac_config.mbn",
>> -	[64] = "qcom/aic200/tz_ac_config.mbn",
>> -	[65] = "qcom/aic200/hyp_ac_config.mbn",
>> -	[66] = "qcom/aic200/pdp.elf",
>> -	[67] = "qcom/aic200/pdp_cdb.elf",
>> -	[68] = "qcom/aic200/sdi.mbn",
>> -	[69] = "qcom/aic200/dcd.mbn",
>> -	[73] = "qcom/aic200/gearvm.mbn",
>> -	[74] = "qcom/aic200/sti.bin",
>> -	[75] = "qcom/aic200/pvs.bin",
>> -};
>> -
>>   static int sahara_find_image(struct sahara_context *context, u32 image_id)
>>   {
>>   	int ret;
>> @@ -779,10 +740,10 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   
>>   	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
>>   		context->image_table = aic200_image_table;
>> -		context->table_size = ARRAY_SIZE(aic200_image_table);
>> +		context->table_size = aic200_image_table_size;
>>   	} else {
>>   		context->image_table = aic100_image_table;
>> -		context->table_size = ARRAY_SIZE(aic100_image_table);
>> +		context->table_size = aic100_image_table_size;
>>   	}
>>   
>>   	context->active_image_id = SAHARA_IMAGE_ID_NONE;
>> diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
>> index 640208acc0d1..d7fd447ca85b 100644
>> --- a/drivers/accel/qaic/sahara.h
>> +++ b/drivers/accel/qaic/sahara.h
>> @@ -7,4 +7,11 @@
>>   
>>   int sahara_register(void);
>>   void sahara_unregister(void);
>> +
>> +extern const char * const aic200_image_table[];
>> +extern const size_t aic200_image_table_size;
>> +
>> +extern const char * const aic100_image_table[];
>> +extern const size_t aic100_image_table_size;
> Making sahara.c reference these arrays through extern declarations is
> pretty ugly, and in patch 4 you're forgetting to add the "static"
> keyword to the image_tables...
>
> How about introducing patch 3 first, with special handling for AIC[12]00
> and then squash this with what is now patch 4 to make the move in one
> go?
Fixed in v2 by removing extern based cross file linkage entirely. 
Firmware image tables are now defined in the Sahara driver and selected 
via a probe-time variant table, so there are no externs and all tables 
remain static.
>
> Still need a statement in one of these commit messages to why you don't
> just add qdu_image_table[] to sahara.c...
>
> Regards,
> Bjorn
The QDU100 image table is now part of the Sahara driver and selected via 
the SAHARA channel match using the probe time variant mechanism. This 
avoids a separate QDU client driver and any registration API.
>> +
>>   #endif /* __SAHARA_H__ */
>> -- 
>> 2.34.1
>>

