Return-Path: <linux-arm-msm+bounces-95958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIKZEc0MrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:32:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7C722B6DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:32:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59A4230063BF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D733834B1AB;
	Sat,  7 Mar 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBGGPPMm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GN2XCmjG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430A3491D3
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883146; cv=none; b=TVybjIMTpdzBFAXTk8Ea29FhSzuTOM7Qnteg7bvISbTkUfh9ApAu9gC1+467/M1dDW4N+IKQTO+vfISZ6At6cgrk5OkJ/t7EuPuUzf2KM149aMq77D+sa0EkVW+x7+YYpS98oig5Xj672p5QM2U+kxQU8Vhef6N+Z4McrTAasDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883146; c=relaxed/simple;
	bh=bJjV9XDdJGN8yzVyQuk15gl3c63yjmbXXily0A1d0HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDPMh/EcYo2HyEsnnQG0H4/ICdejuDkqZIDB0br5tM2QozUa365uL93PO0jKyD0k7F6dr8pDZNkjmo+OReCNJ0pLK5AETtSfa8tNwAURxFB6/DIYH8brWy9z7xEbRTVKNdEFmP6gUAs5wCWao4xrBiA99ICe2E8FA6DuRpQvXQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBGGPPMm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GN2XCmjG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6277sDk0401207
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ePMzfBCig1wNup2IVR+JGCP6VVQHMEN6kVULyL716V0=; b=gBGGPPMmz7F+2ikS
	3WNlF4O9/znJqt0Xoa9rFFqQEFiSw3HMa1Dg+Pj+KSJIYSoqlR4op9IXJwf1C7Ql
	QF6yn875qpMDn79RJ5QNVCTqtqvWzSTHZOOGEszFwLVFUIvVA0wodTudwOJZpGAV
	2b+3yt3FMFG/lGhVmXgvHe5jC4S87RLrVlaeQ/8V8qfD3Wo47SAMp7iiC93xUjNg
	KhS2Abayj9qkJrNplWmpsX4lSxjeZmzqW5eLoScX05RP05ssQOXAw5QTQW6LoTK+
	g3Vkm6Lkb/OUCJ5qTjF+nxdGYCUsScHkHu84APPrJ3TydKGxuQBfueccxrjGQfIy
	SrlhOA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcse0kpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:32:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3595485abbbso8821515a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883144; x=1773487944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePMzfBCig1wNup2IVR+JGCP6VVQHMEN6kVULyL716V0=;
        b=GN2XCmjGvRjMx/tuL6CHMdzWu1Qq5t+6gYHHrzPKNPEhXTod6O6O+MTiA/MaSaeyH7
         KUXCDpZTgxIVkdmJKWna/2VE5darrKN2qE4nTNQSO0/mznDstXA5ZR82ItJrRJkR/rvs
         PpqCupkeBuHpimPRchIUU1IAB8Ck/IjtYyD7ZSELwmxZRDvxebY8t1PSvkysrusep+Jx
         tZVhkXdZuQUm+MU/CLy1gX35ADNMCdoEMIfdB+qpCQJCKe+yUb6yzFQO5koVYKddYZRQ
         QpJscnt1BsKY1K3WqA69tHlrMxUkohx9nYV2UGBV0nHBfqsYeq3/aWnk6BYQijXBHeSc
         AuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883144; x=1773487944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePMzfBCig1wNup2IVR+JGCP6VVQHMEN6kVULyL716V0=;
        b=FkEqZmVi0pza+TLz50XOewRsiebrlb6ACJ80Qzy4jr7XnpEiihUBdXy8ayrxEJTfkq
         vzNCcNTbiwlKCNNBN9gbgs2I4dPWlUhDPyuXzBPNKyIJ3yvvceVTftSgWn2Xob1tePp1
         /zCZZj7hk8/JxIKf0vwtF1xVGLhD2ovzqixsgJwLil0x0/75FKFHz7nuH+paXF7V14GD
         E15aiUuvMaV2BxmsQ/KBIs8UXhFY9L6saRJ1QOWQXFrKcCaGyDMxtikp4ibYRPvxaN3O
         MV4EhqA+CSueUunOE4zwazoV8BwQ1Bw80Qf1ZB08Blie5uYaTvCh6pGQBxnOmaGkNp9N
         fAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK3p3j+/RFroFs1z+xzz2bKxsd3gtv+Gxm/viqo36CjwW4sJxNhkA3NZq9k1VrPpZ3kHE2mqvzqLPBWhEK@vger.kernel.org
X-Gm-Message-State: AOJu0YwFZZreekwAN1MSEkRTCuGa67pyzSHeRteCd9m5bUBY8UCSIudS
	LoM2YiApkgOvSs+52UdpfF2APlcAPVO4oVVtNg8NgbRwULgHCV+r86BSscP786K/ZWo4OSvCE3i
	cOU/mIQ1tyBN4ZG01bYGdfO15vNbvw63x7IXRvkwVabieLNShxupIkuFe2GI1H502nRkn
X-Gm-Gg: ATEYQzxj/M59jUVQi16Z/EH+ZDS2esmIQnZx38c0V7pKewKZbTsl0o8C4S4zhKFMFTS
	lL94t50FKFNi0HjoyBF0cx9s6A72aZRFcSkZrwSFW6+tEy63G2oE+GPGw58LSjNU541Lbd5GQmo
	cbdiRcrG7m3zuYzLDji4dTF0aLrHlQmGxCQP/ki+78bhhsnizYoEgHab5N0shq7DW1ORujstdO4
	kFrRHzvE5WX2ezI0LKK1XIaClqKBUi3mBTtx76QHS3ACUkaH3E4MZYughIIYAkF9t/L85u5wdNJ
	JHsuVJArVz4fHBxOokfxM3xuCugQf9vEs235eK8c8ma8Qpvai2Ss1/9VwZwjoQID8FdU/P6OeAI
	NZiqvhDmdNtmzsO2aVbEDDHXovraA0qI190pAfmU9YZlPaVK1hEL16ms=
X-Received: by 2002:a17:90b:3a4b:b0:359:7fe6:7e5 with SMTP id 98e67ed59e1d1-359be30aee2mr3931977a91.24.1772883139260;
        Sat, 07 Mar 2026 03:32:19 -0800 (PST)
X-Received: by 2002:a17:90b:3a4b:b0:359:7fe6:7e5 with SMTP id 98e67ed59e1d1-359be30aee2mr3931965a91.24.1772883138800;
        Sat, 07 Mar 2026 03:32:18 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c005e1b2sm6336772a91.5.2026.03.07.03.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:32:18 -0800 (PST)
Message-ID: <c0f2b148-454e-42fb-92de-98f42b5c37a2@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:02:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/12] drivers: soc: qcom: Remove is_mem_dump_mode
 variable.
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-10-kishore.batta@oss.qualcomm.com>
 <zdcatkxo4p5yxy6jvibkhlb6tsg4ebodd54yt4mjmfb7a64745@6qrth45c547p>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <zdcatkxo4p5yxy6jvibkhlb6tsg4ebodd54yt4mjmfb7a64745@6qrth45c547p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IdqKmGqa c=1 sm=1 tr=0 ts=69ac0cc8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_2EHhybczFBH_e9krmwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: K_o2Y0-bdKeTwhLW3kEeS7W48R6i2KZc
X-Proofpoint-ORIG-GUID: K_o2Y0-bdKeTwhLW3kEeS7W48R6i2KZc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfX/aNlffhmFglv
 t73TY+7lbHXjZqnc0TR3UxHqEcLMj6fzc8pAZosJL9sHBdtz9JaQnrI804tZ8mXj1zT9JxDyLVq
 qK4RNnbBXICWBJr06Dzdg9pm5jroqxjqMIdib1tqnh1/Omvrlw2Pnb0yzIDRFrrh6c4tFSgsxAu
 Zb9J64MNMnsSCAioFzp4XoYljpprBjmbRvNPbt4EJGCD7LVoz+B3Y9kh85No7/8nxxo7uFHW39B
 jvOeM5dUszKmjh3rZSWsfWGKAQI8LV7WuqqFzvcAmIamcjRK2ff8UjbtlCLgC7Pm8oicsrOUB3G
 XzVzE8UPd5wJNtcopHvLj5r6polx2wVE2/SXbS2qiOAaAi0+3xZRrZwR2NwDev7xE1HzPtp0qoz
 qmHDc85CO4VlGk3w32YCPPLyaL1dCEIvoCdor8xWdmZ7YwWqwcwjg8Cpt5oU6uN8fZVyoy2qW8O
 ei2rasFzvgUGngPF4ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1011 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070106
X-Rspamd-Queue-Id: 9C7C722B6DC
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
	TAGGED_FROM(0.00)[bounces-95958-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.949];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/26/2025 4:29 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:23PM +0530, Kishore Batta wrote:
>> Sahara driver now has "sahara_mode" enum defined. So, the variable
>> "is_mem_dump_mode" is redundant. The mode of sahara is set to
>> SAHARA_MODE_MEM_DUMP wherever required.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/sahara/sahara.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
>> index 84327af48569..81d9b40d0f92 100644
>> --- a/drivers/soc/qcom/sahara/sahara.c
>> +++ b/drivers/soc/qcom/sahara/sahara.c
>> @@ -193,7 +193,6 @@ struct sahara_context {
>>   	u64				dump_image_offset;
>>   	void				*mem_dump_freespace;
>>   	u64				dump_images_left;
>> -	bool				is_mem_dump_mode;
>>   	enum sahara_mode		current_mode;
>>   };
>>   
>> @@ -302,7 +301,6 @@ static void sahara_send_reset(struct sahara_context *context)
>>   	sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
>>   	sdev = sahara_data->sdev;
>>   
>> -	context->is_mem_dump_mode = false;
>>   	context->current_mode = SAHARA_MODE_NONE;
>>   	sdev->receiving_trng_data = false;
>>   
>> @@ -515,7 +513,7 @@ static void sahara_memory_debug64(struct sahara_context *context)
>>   	 * of the dump are that we can consume.
>>   	 */
>>   
>> -	context->is_mem_dump_mode = true;
>> +	context->current_mode = SAHARA_MODE_MEM_DUMP;
>>   
>>   	/*
>>   	 * Assume that the table is smaller than our MTU so that we can read it
>> @@ -971,7 +969,7 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>   
>>   	if (!mhi_result->transaction_status) {
>>   		context->rx_size = mhi_result->bytes_xferd;
>> -		if (context->is_mem_dump_mode)
>> +		if (context->current_mode == SAHARA_MODE_MEM_DUMP)
> So for a moment you had two different ways to keep track of the
> "mem_dump" state. If you reorder your patches to first replace
> is_mem_dump_mode with the enum based mechanism and then add the
> additional state this would be cleaner.
>
> Regards,
> Bjorn
ACK. I have removed the current_mode enum in v2 as it looks redundant.
>>   			schedule_work(&context->dump_work);
>>   		else
>>   			schedule_work(&context->fw_work);
>> -- 
>> 2.34.1
>>

