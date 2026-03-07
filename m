Return-Path: <linux-arm-msm+bounces-95957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BBNGcAMrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:32:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE2C22B6D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76AD0300616E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232E92D3225;
	Sat,  7 Mar 2026 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzDxky71";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TjKMtsXu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D5C29B233
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883134; cv=none; b=eLsZgfD4dPlZYnuC0qy6x2NrLE+6SgiRa9QQd8hjb5+Gok+9q2gdtFwuUBzKo03YAXh4+E4QOGwV4uI0Oj1NDcJ0gvD/UQKYZE8fogBimu9hBEoZHx8cynqMoW3Qt0c+2H6HARkeW7UfK7459HLqoLDB9WnkOxdYu6K98OFf3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883134; c=relaxed/simple;
	bh=I8FbO23qRdTBbQ0FOX9TCGV+YFCJUZ1aM0aDDCojIDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcXIs5uU0FrWP/tWqzZAzpAAmLtWzmCJ75AsKv6PJOPbwivK3spVCbxr31IaG7eW1TGLNe8YWltC0Ge8Xv52yE31WX3wRY0MqMPSPQOpC414B8Y6PsWAv7afSJb4wrj0JzgPOn5C1R30qtp/11Rn96LoaiXbLucidiLP5uZ6kVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzDxky71; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TjKMtsXu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6277WC6F356375
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lzN6AQty/VHbP96sqU9u6yz/+X4vjbafNwG9S5h/pE8=; b=FzDxky713+DwfPDz
	buga1Z8JpQjgT8IMXp/jxkvxdw81zNMUoDkReT9dA90yPDH+UYptFII+KelBSoUV
	ce2GelPQLq0RO48fOMV6GB90KZ9eEqhp5LTmK8fBnxY9CgQrG3o3kcJMlj68qnwC
	qsPeihbm7nM2ipaJRRJGg+O5aEFZS62weXZKCLF75DI4WEnnvg50qwRAELstkytg
	fpmTVFXNgnpVwX2MS6HS+8BtftyZaEfcZrDYIGjtsUIkAJZVxX9tCxaQ477NTzGP
	vu+5uPEblKNcT1APQBG+B5rFRS37fr9NQrSIWPm5GqmY5BNzOJ35faLhdoiXTMZ8
	ZLP++g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crcse0kp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:32:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3598d4b19deso28165090a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883131; x=1773487931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lzN6AQty/VHbP96sqU9u6yz/+X4vjbafNwG9S5h/pE8=;
        b=TjKMtsXuyUiBX9T2BuVqjTWGg1f+5Zu+1f9/SP0olMDN8VKO2NMjKhaMEf71idN92H
         xFM6PtiB/5PoR8HTQrD/CkU+0V3Vbih0yzMWSjYllnfN58rbj3iZfrTyqObhTfg+W5fN
         P6XHAz/UlleA4SDK4aFkmGcHtHH4yYHvwoLQPXeyfYPQRKIl3AMPaC/dt93T5nfXZ2SI
         D8kXGARpI64sbX+eMXclOyat9akiHbvSFncrybMipikEqoOt6Hx9ELpxw7bknClBSOeF
         CNAPZVizZn8KeowJZGaeaeXDsQkQKIS21aFWZt4woEFlJlK3aD7NfYHEQ3Jr+CUXj8cf
         iJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883131; x=1773487931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzN6AQty/VHbP96sqU9u6yz/+X4vjbafNwG9S5h/pE8=;
        b=xOgQ6HsR/K5PH5/Gwr5gFbaokx9Cel/JbocdzYoVa+uoqnoGCHqoFKhYy6zWEBPRC2
         +wg1DuvO2I93sTQI0dFBbc7HjOV1zey3QA0NMVTIWiipbRGR3M7XSUhxCWwfBATmXyJt
         VYbUuKk6h+D9NbSVctOOEjgl9Np/C7Fgpla7ap384MiQvbeMXAiLlduakKAjBc/v7JxB
         3b+vrA6EY07XpgPaVFOkywVShIn/XqhR94xBeUHeVYX53p4B9CyXwYVK9yGlT/cMNZRm
         getU4AzyLE+c8zEIgE0BrWyEz05R75k/W521ioKN8Gm8c33ArGVZueV7KXB2ii3Ag+y9
         CZcA==
X-Forwarded-Encrypted: i=1; AJvYcCXWVuXAm/SVHIvc3Yuq6teHjpQh9uX6cOXkr9s7+eCmVhA8zi62w0Ej9ysDiCHaHMJdhvEjcdCaDDBxAcIo@vger.kernel.org
X-Gm-Message-State: AOJu0Yya2F9sbpQ7dD0udCQpOG/JCZo+21srEGqxpVcdeOO2nzx/dBhW
	dIQ4AFjoZoL423ESq1ioV1nipgJ2H9CNlzQNkUixRemZvDTWkTrSEvoSG5wDdW4Z8OTwpK8ZDCH
	wBG78bTmvSCsEL8qmkr72TUcvT+MgXDel78rQ83qhXVJZSzD1LQRus/SOt6TvFOsBZaMl
X-Gm-Gg: ATEYQzyaxHORyJErGw+X69NAiysTtew3DqNxffGM8LeImyumaoDFnZtMBVS9eBqxjaq
	8r+RqVvb365wPI8kFdQUntgsIP9u/tSg2AVXwLOaaV7ehKDqjyZEHVdIfyynjaq+DDKipf+r348
	3VM97OMNTmeZDgX1zcDMsxXpRIdjuBpR7G6myKSU4SUbf39Xw77rBf7Bh/35X9a78+TPz4Yi01F
	dDcWuf/z37EWYQfWuJJ+TbM4IcQKyuKXypyFLikcvJm+uHDi5AUgaM5zUDrNdacP1lKdGAFj8jE
	2H8jjwhPWu49DglB3OMomuNILGzt8nLP/7KSa+6p30HdUm7xXuPaDcoOWk3BivbYjSWU5wEIdgn
	DxszY7SCxZi0tR+RS1UhHoC64VR0tvD4Or7/6uMKt0hFbo9slKFpCooA=
X-Received: by 2002:a17:90b:57cf:b0:358:ee5f:9c04 with SMTP id 98e67ed59e1d1-359be38e449mr4966458a91.30.1772883131263;
        Sat, 07 Mar 2026 03:32:11 -0800 (PST)
X-Received: by 2002:a17:90b:57cf:b0:358:ee5f:9c04 with SMTP id 98e67ed59e1d1-359be38e449mr4966441a91.30.1772883130797;
        Sat, 07 Mar 2026 03:32:10 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c005e1b2sm6336772a91.5.2026.03.07.03.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:32:10 -0800 (PST)
Message-ID: <c87708e7-bf93-4321-bf15-4fe02cdeddd1@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:02:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/12] drivers: soc: qcom: Support Sahara command mode
 packets(READY and EXECUTE)
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-9-kishore.batta@oss.qualcomm.com>
 <nkgamfhw3rkddsuamfcvbdtbczjgb5enfsnoujy7ij57qcnfxe@7dp3n3xydsf2>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <nkgamfhw3rkddsuamfcvbdtbczjgb5enfsnoujy7ij57qcnfxe@7dp3n3xydsf2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IdqKmGqa c=1 sm=1 tr=0 ts=69ac0cbb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qHuSC3wpBsHjp3l81lsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: DUMk7fHRgI3vukPeNW86NxVU-RPiyN_P
X-Proofpoint-ORIG-GUID: DUMk7fHRgI3vukPeNW86NxVU-RPiyN_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfX7j/XemN06wyt
 AbuKRyzPWnWtXPsCQ2EJE6BZ9TNLvlhgL8jVKKJCNM1MaAQ7cEeiBhfsEk+qdFKqXxLZPBtYRvM
 D9OoUjqn2EoqIo6PPLFm64C5HDyp9C9vJFr7hy/hDurjGibYgUb55XtkaE4/cQCI5GHPkH+O3XL
 cxm4+hWMsf35CY2ZTvfO5a/ohQ2yc7p30dRPlXilzVg03ElJT0lyfLnM0Qhby3PRM30hbrIuM8v
 EhE2LjP781VoJ7ypSPTpKdz/9IAsb+PmujRUf6TbGBCRxCfPLiql7vdAXyQR/xzT56RpeMcy7iF
 FAW6hZNzLrAgXXXeyf7rv3HaUs6EVfCJ1MY7Q53hLpN/6aPSsgxZLFX6YRcYbvRtE4LF749ziTR
 I902GNhcOjOd+oMJucAeZ8+t/QbLSYFMPX3WevfkfwQJFDX54Kr5CEI8GSIeCgmHPRRj0qKQRXv
 X5JHIsN17026lQvMI6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070106
X-Rspamd-Queue-Id: BBE2C22B6D5
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
	TAGGED_FROM(0.00)[bounces-95957-lists,linux-arm-msm=lfdr.de];
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


On 8/26/2025 4:28 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:22PM +0530, Kishore Batta wrote:
>> During device boot, the device performs DDR training, and this training
>> data needs to be stored at the host end to improve subsequent boot times.
> As with the previous patch, I'd like to see this to be clarified. All
> devices? Some devices? The tail end of the sentence indicate that this
> is a performance improvement, is it?
>
> Describe when DDR training happens, how it relates to Sahara and what
> support a device that implements this needs from the host.
>
> Note also, that above and below text does not belong in the same
> paragraph, they are talking about different things.
>
>> The Sahara protocol specification indicates that DDR training data can
>> be stored at the host end using command mode packets. The device sends
>> the command mode packet to the host through the HELLO packet, and the
>> host changes its mode of operation accordingly.
>>
> Okay, so the HELLO packet contains the information about the mode...
>
>> Once the device determines that it needs to change the mode of operation
>> to command mode, it sends the command ready packet.
> ...but what does this then describe?
>
>> The host receives
>> the command ready packet and then sends command 8 to get the list of
>> commands supported by the device as per Sahara protocol specification.
>>
> And then what?
>
> Imagine that the reader doesn't know how the DDR training exchange over
> Sahara works when they start reading this, will they have developed that
> understanding when they get to the end of this text?
ACK. In v2, rewritten the commit message properly.
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/sahara/sahara.c | 91 +++++++++++++++++++++++++++++---
>>   1 file changed, 85 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
>> index df103473af3a..84327af48569 100644
>> --- a/drivers/soc/qcom/sahara/sahara.c
>> +++ b/drivers/soc/qcom/sahara/sahara.c
>> @@ -59,6 +59,9 @@
>>   #define SAHARA_RESET_LENGTH		0x8
>>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>>   #define SAHARA_MEM_READ64_LENGTH	0x18
>> +#define SAHARA_COMMAND_READY_LENGTH	0x8
>> +#define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
>> +#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
>>   
>>   struct sahara_dev_trng_data {
>>   	void *trng_data;
>> @@ -66,6 +69,13 @@ struct sahara_dev_trng_data {
>>   	bool receiving_trng_data;
>>   };
>>   
>> +enum sahara_mode {
>> +	SAHARA_MODE_NONE,
>> +	SAHARA_MODE_MEM_DUMP,
>> +	SAHARA_MODE_CMD,
>> +	SAHARA_MODE_FW_DOWNLOAD,
>> +};
>> +
>>   struct sahara_packet {
>>   	__le32 cmd;
>>   	__le32 length;
>> @@ -100,6 +110,9 @@ struct sahara_packet {
>>   			__le64 memory_address;
>>   			__le64 memory_length;
>>   		} memory_read64;
>> +		struct {
>> +			__le32 client_command;
>> +		} command_execute;
>>   	};
>>   };
>>   
>> @@ -181,6 +194,7 @@ struct sahara_context {
>>   	void				*mem_dump_freespace;
>>   	u64				dump_images_left;
>>   	bool				is_mem_dump_mode;
>> +	enum sahara_mode		current_mode;
>>   };
>>   
>>   struct sahara_dev_driver_data {
>> @@ -282,8 +296,15 @@ static void sahara_release_image(struct sahara_context *context)
>>   static void sahara_send_reset(struct sahara_context *context)
>>   {
>>   	int ret;
>> +	struct sahara_dev_driver_data *sahara_data;
>> +	struct sahara_dev_trng_data *sdev;
>> +
>> +	sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
>> +	sdev = sahara_data->sdev;
>>   
>>   	context->is_mem_dump_mode = false;
>> +	context->current_mode = SAHARA_MODE_NONE;
>> +	sdev->receiving_trng_data = false;
> This is never set to true. So yet another incomplete patch?
ACK. In v2, took care of having all assignments in single patch where 
its used.
>>   
>>   	context->tx[0]->cmd = cpu_to_le32(SAHARA_RESET_CMD);
>>   	context->tx[0]->length = cpu_to_le32(SAHARA_RESET_LENGTH);
>> @@ -297,6 +318,7 @@ static void sahara_send_reset(struct sahara_context *context)
>>   static void sahara_hello(struct sahara_context *context)
>>   {
>>   	int ret;
>> +	u32 mode;
>>   
>>   	dev_dbg(&context->mhi_dev->dev,
>>   		"HELLO cmd received. length:%d version:%d version_compat:%d max_length:%d mode:%d\n",
>> @@ -317,11 +339,17 @@ static void sahara_hello(struct sahara_context *context)
>>   		return;
>>   	}
>>   
>> -	if (le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_PENDING &&
>> -	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_IMAGE_TX_COMPLETE &&
>> -	    le32_to_cpu(context->rx->hello.mode) != SAHARA_MODE_MEMORY_DEBUG) {
>> +	mode = le32_to_cpu(context->rx->hello.mode);
>> +
>> +	switch (mode) {
>> +	case SAHARA_MODE_IMAGE_TX_PENDING:
>> +	case SAHARA_MODE_IMAGE_TX_COMPLETE:
>> +	case SAHARA_MODE_MEMORY_DEBUG:
>> +	case SAHARA_MODE_COMMAND:
> You're effectively adding one more condition to the if statement. One
> can argue if the if statement or the switch is the cleaner way to write
> that, but when you replace 4 lines and add 11 it's hard to see that all
> you did was add one more accepted mode.
ACK.
>> +		break;
>> +	default:
>>   		dev_err(&context->mhi_dev->dev, "Unsupported hello packet - mode %d\n",
>> -			le32_to_cpu(context->rx->hello.mode));
>> +			mode);
>>   		return;
>>   	}
>>   
>> @@ -514,6 +542,46 @@ static void sahara_memory_debug64(struct sahara_context *context)
>>   		dev_err(&context->mhi_dev->dev, "Unable to send read for dump table %d\n", ret);
>>   }
>>   
>> +static void sahara_command_execute(struct sahara_context *context, u32 client_command)
>> +{
>> +	int ret;
>> +
>> +	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_CMD);
>> +	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXECUTE_LENGTH);
>> +	context->tx[0]->command_execute.client_command = client_command;
>> +
>> +	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
>> +			    SAHARA_COMMAND_EXECUTE_LENGTH, MHI_EOT);
>> +
>> +	if (ret)
>> +		dev_err(&context->mhi_dev->dev, "Unable to send command execute %d\n", ret);
>> +}
>> +
>> +static void sahara_command_ready(struct sahara_context *context)
>> +{
>> +	dev_dbg(&context->mhi_dev->dev,
>> +		"Command ready cmd received. Length:%d\n",
>> +		le32_to_cpu(context->rx->length));
>> +
>> +	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_READY_LENGTH) {
>> +		dev_err(&context->mhi_dev->dev, "Malformed command ready packet - length %d\n",
>> +			le32_to_cpu(context->rx->length));
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * If the device sends the command ready packet, then its an indication
> "If the device sends" sounds conditional - but if you're here the device
> did send a command ready packet. And it's not an "indication", it really
> means that we're switching to command mode.
ACK.
>> +	 * to host that it needs to switch to command mode.
>> +	 */
>> +	context->current_mode = SAHARA_MODE_CMD;
>> +
>> +	/*
>> +	 * As per sahara spec, the host needs to send command ID 8 to get the
>> +	 * list of commands supported by the device.
>> +	 */
>> +	 sahara_command_execute(context, SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST);
> What will the device send next? Where is this handled? In the next^2
> patch?
ACK. Handled all the logic properly in v2 under a patch so that things 
are clean.
>> +}
>> +
>>   static void sahara_processing(struct work_struct *work)
>>   {
>>   	struct sahara_context *context = container_of(work, struct sahara_context, fw_work);
>> @@ -538,6 +606,9 @@ static void sahara_processing(struct work_struct *work)
>>   	case SAHARA_MEM_DEBUG64_CMD:
>>   		sahara_memory_debug64(context);
>>   		break;
>> +	case SAHARA_CMD_READY_CMD:
>> +		sahara_command_ready(context);
>> +		break;
>>   	default:
>>   		dev_err(&context->mhi_dev->dev, "Unknown command %d\n",
>>   			le32_to_cpu(context->rx->cmd));
>> @@ -873,7 +944,11 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   
>>   static void sahara_mhi_remove(struct mhi_device *mhi_dev)
>>   {
>> -	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
>> +	struct sahara_dev_driver_data *sahara_data;
>> +	struct sahara_context *context;
>> +
>> +	sahara_data = dev_get_drvdata(&mhi_dev->dev);
>> +	context = sahara_data->context;
>>   
>>   	cancel_work_sync(&context->fw_work);
>>   	cancel_work_sync(&context->dump_work);
>> @@ -888,7 +963,11 @@ static void sahara_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>   
>>   static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
>>   {
>> -	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
>> +	struct sahara_dev_driver_data *sahara_data;
>> +	struct sahara_context *context;
>> +
>> +	sahara_data = dev_get_drvdata(&mhi_dev->dev);
>> +	context = sahara_data->context;
> This was broken between the patches.
>
> Make sure you structure your patches such that:
> 1) One can reason about the whole thing that the patch introduces
> 2) Don't break the system inbetween any two patches - as this prevents
> the use of "git bisect"
>
> Regards,
> Bjorn
ACK.
>>   
>>   	if (!mhi_result->transaction_status) {
>>   		context->rx_size = mhi_result->bytes_xferd;
>> -- 
>> 2.34.1
>>

