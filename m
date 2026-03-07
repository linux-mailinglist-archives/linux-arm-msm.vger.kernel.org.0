Return-Path: <linux-arm-msm+bounces-95959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOV4EtIMrGnUjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:32:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B0D22B6E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1533300679F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3697A2EB87B;
	Sat,  7 Mar 2026 11:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ckq/J418";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WdvTL3JL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71B31985D
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 11:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772883152; cv=none; b=kAUqdmavLwPgstDFqizSvPogitah7CPNY90v6Z+TuQyCZ1Z3BwOmVqsR/TrLUnF0KTLlDN99P7jvRpk/9XmaDrmI0AbrQL3+fyh9Ujs1dk0jb8igZIantPTR43BW4q5nT9bBcDp1r51YjANs0wGgBIzTrU0rxIDDckJPiH2HFJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772883152; c=relaxed/simple;
	bh=2/zO+rjddj5PhbYHog3MBQib2xfYTTIYCaP8OlteZnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t0bEiKt5uWw1rUpVwqpkEoVwF6/VqtQWLZFILuyetYc6ci9tUnMFz+QkNCx3x4z4dMORaFdafd+KquWefoGOVPytvqsUOyEhpifuPVd4BeGiFj/uHcgMFz+Ip6ALYIVKofbVwNp+3feW6MVlpqwOISXoZfVuSwdFqRd1eu0onzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ckq/J418; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdvTL3JL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6276rcOW2404327
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Mar 2026 11:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTmLbE92ZkfiIUHuRfFzgs8QU6aeE0ZZgXhWFbfKnOY=; b=ckq/J418Zw11qVPH
	ks6bPLbIJPXBWo2rkITYqLH4esVHUFmtR+Vm0wCeBV9hkkqcgWE/4drqrF84i6HC
	pjokeuYkRMHfzkAicn1hjbVXEVTvkwR5uKwvxVhXbdMCzj9uUomBo9lOQzXojmVu
	GJJgznX63jab55LkxuW/YcERppdXMx8tpOiBpxUSRL/AAUDOppvVXF4QTA9jl0qw
	st059JgFoi/bNJCgbrvUBS4BQewZ/wxhVBCabeGPQFuMKVpnz+EpGZE467Wrmzj/
	II6hwgKtCZLbB2x3hItofqQpB4TCljpnZcP12k+F6RVsX/InZSnuplM6w+v7/tiO
	HsTEvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9qes12m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 11:32:29 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso37124279a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Mar 2026 03:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772883149; x=1773487949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTmLbE92ZkfiIUHuRfFzgs8QU6aeE0ZZgXhWFbfKnOY=;
        b=WdvTL3JL4aqlBVzoxfTiuHCuxGIKBAcSmRXvXzMGB0cRvKbIWY9YyIIi9aOkXPtWel
         orRyyFIFtCmRGo8lNokbCERCThB7cLB8cUbLEuuGrWEswvXs+pPUTq33cREyPx21I2yw
         EQBBucvhJ1th8k2JWcHw7vwN4gqx3dX5/N7CzyRmIH+fa0yiRpaY9G+rTOj8+UB7h3Bk
         cOL9j/t8G6S7PCgiiHb/OchC3ST6xXZ/7hoD4KwyO5H6DVow0Ls16uA3RC2QvxprW4BA
         nyQAUD5c+sXrXiGnprio2iiNZhEtMSDr9h2Z7cHN/DcqldZU5uk8SIfL6H5RU7ngehaF
         3/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883149; x=1773487949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTmLbE92ZkfiIUHuRfFzgs8QU6aeE0ZZgXhWFbfKnOY=;
        b=DlxMIx3Om+Phsvna2blN1aMGMzHJCkarJhc1t/2TWSAJZh6ScYf6o8eF+w5DZMNL8z
         h8p/PMkKRpnJt6AYnk0RLMX5+8xizp8KeH604Dr5QqFAXqeuaKH3i62JT9Rz8WkMg29K
         S2ASLWhzegsoDqM0gB2GsI1Sm0j8jukdT+/aTpiosS1ciCoc0hhIDLJbAAQCus4H5Wf0
         Ehvx5pBg3j1y2M03zLQhDC7y3CmdRMitNVl5/F/X3wbCLaiTccEAI3JOdlMXNC9jrc7S
         HZyK/aX5WrayEwXp81kiPJ1tQpu0uNjznc77RFpnmA1JSIDpvG0D+ptzf9LLxGBckQLA
         hUsA==
X-Forwarded-Encrypted: i=1; AJvYcCVvm3zkfneaz4G975dxllu9hjJeDZU2rv4FJcWoI2AZ9Y7hAwC3vH/X9UbpDGzKom3v36Ab2RCW3WIaRi8W@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxf//lf+f1RzA83/2yyGrZLPvwezyfPATXCW0n0t29PbfsxYIY
	yBQeJ5gKLagLO06tFuKakfnlVG/rnKm4I9oz0CMadvO1ZuSozR2+QoSJ2wZZoC/bodO1kywAIlm
	p2pvUPvpXEgVwPfINCxT0QS3gOk1UC5L8ysqHAfTG69vekpkR4E+EVfW8pkSuosYjc8w7
X-Gm-Gg: ATEYQzzNnTg4ZzVBNvUA2pAbdqaj6S1y3J0S70yTMnRg3COn3eYrolZ6j4LU3Lhgnol
	SCfBSPwSkouFqMb0phgWP1Jz14wnkcqPbZSw9A/qZBa3eFnMrT6sZB7QZ3oGg/v7nycwa6aA0V4
	23LMM9frK5naX0bZDT0MquEc/fz7arwCAFrzXncZibe7ICehPlDYktFpgYBmmRL/hD84jdSo0TH
	DWSYurvT74534rkJ5L7VOcLlAgfn5zvLeNb0jIIV1Ano6cxfSfn0g3PE2RbS3rRyKi1H/Y3bQRu
	ng/411tG9YrOHNBt7nObEYZhpnb+/yX7FUj6TlMkXTUJVORjLVCJAR85jwPbLxu5iBZ0D/Wh6hH
	h7bmAYRLRMcBfUWeYhB7ClHNYdZF0rZJIFFdcDgVqWzqnhQspzPy/yF4=
X-Received: by 2002:a05:6a00:3cd6:b0:81f:5037:a318 with SMTP id d2e1a72fcca58-829a2dc3838mr5207403b3a.21.1772883149117;
        Sat, 07 Mar 2026 03:32:29 -0800 (PST)
X-Received: by 2002:a05:6a00:3cd6:b0:81f:5037:a318 with SMTP id d2e1a72fcca58-829a2dc3838mr5207384b3a.21.1772883148630;
        Sat, 07 Mar 2026 03:32:28 -0800 (PST)
Received: from [192.168.0.215] ([49.205.244.213])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636973sm5611243b3a.3.2026.03.07.03.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 03:32:28 -0800 (PST)
Message-ID: <8cad603a-32fb-436e-a555-6a8d37c3c6ab@oss.qualcomm.com>
Date: Sat, 7 Mar 2026 17:02:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/12] drivers: soc: qcom: Support for DDR training in
 Sahara.
To: Bjorn Andersson <andersson@kernel.org>
Cc: jeff.hugo@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com,
        konradybcio@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org
References: <20250825101926.2160554-1-kishore.batta@oss.qualcomm.com>
 <20250825101926.2160554-11-kishore.batta@oss.qualcomm.com>
 <mwbtmtj7dtarab2krchaolmltp7cd3kzw6v4plgfexailinm54@zfuvg3o4jdie>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <mwbtmtj7dtarab2krchaolmltp7cd3kzw6v4plgfexailinm54@zfuvg3o4jdie>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xVJPxHVYaLxynN264UPGxmddi1pOq9ql
X-Proofpoint-GUID: xVJPxHVYaLxynN264UPGxmddi1pOq9ql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA3MDEwNiBTYWx0ZWRfXz63nfz6AEwiR
 mVzVwoUsUIQhuRznKzdvq/rvAU5wxDmIa5qIkMgBxlZ+UuMaB+CUMFK3/3C92B5I+INIvh7D1ic
 0ZCfyezKrWlkFSWmAxBSCDt6FM91BRPxQZR1jY/hwk208TJGwGtzHZBf31SJ5nynQy4iHQsyQZd
 9Za8+RMb+cyA4XQjakRdIhNc6qX9ovlB1fBgIgzPCTnpI/3vFY1cEpV8zD+OG6WqTeABBCaqydZ
 ROcYZ1AllJcK1odTrTI1J+E6IAUBvx/iOTP83W7V6Mt50YOlduF1jAaiSpE7D22a9ceM56TjyLP
 qpW3ewBPWpeg3Fo2mnlyfN6eq00bkD6wt9oNlzS8l7kku3q5B9B2eNICQyYII5TpTvg95Diheo7
 oESAw2aXqT6EeGkHhPDzCH6X1QZEMngL94hUtDAgZ1VhIFtFn0z9hUG78G1cZrWX001yxj1lVLt
 dgpBvY/iMfXOqeZ14oA==
X-Authority-Analysis: v=2.4 cv=dcqNHHXe c=1 sm=1 tr=0 ts=69ac0ccd cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=KtsNJ/6bKgz7QsArn2OSsQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YkBV7iX3PuxwBoPda3IA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-07_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1011 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603070106
X-Rspamd-Queue-Id: E5B0D22B6E4
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
	TAGGED_FROM(0.00)[bounces-95959-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 8/26/2025 4:44 AM, Bjorn Andersson wrote:
> On Mon, Aug 25, 2025 at 03:49:24PM +0530, Kishore Batta wrote:
>> Support DDR training using Sahara command mode packets. Once the COMMAND
>> EXECUTE packet is sent to the device, it responds with a packet containing
>> the command ID. At this stage of boot, only the DDR training data command
>> (ID - 9) is supported by the device. The host sends the command execute
>> packet to execute command 9, and the device responds with the training
>> data. This data is the actual DDR training data attached to the device,
>> and its size is included in the response packet sent by the device.
>>
>> Based on the size of the training data, the host queues multiple buffers
>> to MHI to receive the data. This data is stored in a memory location
>> and made available to the sysfs node.
> As I write at the tail end of this patch, this is scattered over a whole
> bunch of patches now. The "made available to the sysfs node" only barely
> relates to the content of this patch, but to HEAD^^^.
ACK. Rewrote all the patches' commit message and subjects cleanly in v2.
>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/sahara/sahara.c | 197 +++++++++++++++++++++++++++++++
>>   1 file changed, 197 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/sahara/sahara.c b/drivers/soc/qcom/sahara/sahara.c
>> index 81d9b40d0f92..3887cdcfe256 100644
>> --- a/drivers/soc/qcom/sahara/sahara.c
>> +++ b/drivers/soc/qcom/sahara/sahara.c
>> @@ -60,8 +60,14 @@
>>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>>   #define SAHARA_MEM_READ64_LENGTH	0x18
>>   #define SAHARA_COMMAND_READY_LENGTH	0x8
>> +#define SAHARA_COMMAND_EXEC_RESP_LENGTH	0x10
>>   #define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
>> +#define SAHARA_COMMAND_EXEC_DATA_LENGTH	0xc
>> +#define SAHARA_SWITCH_MODE_LENGTH	0xc
>> +
>>   #define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
>> +#define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
>> +#define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
>>   
>>   struct sahara_dev_trng_data {
>>   	void *trng_data;
>> @@ -113,6 +119,16 @@ struct sahara_packet {
>>   		struct {
>>   			__le32 client_command;
>>   		} command_execute;
>> +		struct {
>> +			__le32 client_command;
>> +			__le32 response_length;
>> +		} command_execute_resp;
>> +		struct {
>> +			__le32 client_command;
>> +		} command_exec_data;
>> +		struct {
>> +			__le32 mode;
>> +		} mode_switch;
>>   	};
>>   };
>>   
>> @@ -178,6 +194,7 @@ struct sahara_context {
>>   	struct sahara_packet		*rx;
>>   	struct work_struct		fw_work;
>>   	struct work_struct		dump_work;
>> +	struct work_struct		cmd_work;
>>   	struct mhi_device		*mhi_dev;
>>   	const char * const		*image_table;
>>   	u32				table_size;
>> @@ -194,6 +211,8 @@ struct sahara_context {
>>   	void				*mem_dump_freespace;
>>   	u64				dump_images_left;
>>   	enum sahara_mode		current_mode;
>> +	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
>> +	u64				bytes_copied;
>>   };
>>   
>>   struct sahara_dev_driver_data {
>> @@ -555,6 +574,21 @@ static void sahara_command_execute(struct sahara_context *context, u32 client_co
>>   		dev_err(&context->mhi_dev->dev, "Unable to send command execute %d\n", ret);
>>   }
>>   
>> +static void sahara_switch_mode_to_img_tx(struct sahara_context *context)
>> +{
>> +	int ret;
>> +
>> +	context->tx[0]->cmd = cpu_to_le32(SAHARA_SWITCH_MODE_CMD);
>> +	context->tx[0]->length = cpu_to_le32(SAHARA_SWITCH_MODE_LENGTH);
>> +	context->tx[0]->mode_switch.mode = SAHARA_MODE_IMAGE_TX_PENDING;
>> +
>> +	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE, context->tx[0],
>> +			    SAHARA_SWITCH_MODE_LENGTH, MHI_EOT);
>> +
>> +	if (ret)
>> +		dev_err(&context->mhi_dev->dev, "Unable to send mode switch %d\n", ret);
>> +}
>> +
>>   static void sahara_command_ready(struct sahara_context *context)
>>   {
>>   	dev_dbg(&context->mhi_dev->dev,
>> @@ -580,6 +614,165 @@ static void sahara_command_ready(struct sahara_context *context)
>>   	 sahara_command_execute(context, SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST);
>>   }
>>   
>> +static void sahara_alloc_mem_training_data(struct sahara_context *context)
>> +{
>> +	struct sahara_dev_driver_data *sahara_data;
>> +	struct sahara_dev_trng_data *sdev;
>> +
>> +	sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
>> +	sdev = sahara_data->sdev;
>> +
>> +	sdev->trng_data = kzalloc(sdev->trng_data_sz, GFP_KERNEL);
>> +	if (!sdev->trng_data) {
>> +		sahara_send_reset(context);
>> +		return;
>> +	}
>> +
>> +	for (int i = 0; i < SAHARA_NUM_CMD_BUF; ++i) {
>> +		context->cmd_buff[i] = devm_kzalloc(&context->mhi_dev->dev,
>> +						    SAHARA_PACKET_MAX_SIZE,
>> +						    GFP_KERNEL);
> Don't use devm allocations at runtime. When is this freed? When is the
> sahara device reclaimed?
ACK. In v2, did not use devm allocations at runtime. Handled the 
lifetime of the memory properly.
>> +		if (!context->cmd_buff[i]) {
>> +			dev_err(&context->mhi_dev->dev,
>> +				"Failed to allocate cmd_buff[%d]\n", i);
>> +			sahara_send_reset(context);
>> +			/*
>> +			 * Mark unused entries as NULL to avoid accidental usage
>> +			 */
>> +			while (--i >= 0)
>> +				context->cmd_buff[i] = NULL;
>> +
>> +			return;
>> +		}
>> +	}
>> +}
>> +
>> +static void sahara_command_execute_resp(struct sahara_context *context)
>> +{
>> +	int ret;
>> +	int client_command;
>> +	int response_length;
>> +	struct sahara_dev_driver_data *sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
>> +	struct sahara_dev_trng_data *sdev = sahara_data->sdev;
>> +
>> +	dev_dbg(&context->mhi_dev->dev,
>> +		"Command execute resp received. Length: %d resp_length: %d\n",
>> +		le32_to_cpu(context->rx->length),
>> +		le32_to_cpu(context->rx->command_execute_resp.response_length));
>> +
>> +	if (le32_to_cpu(context->rx->length) != SAHARA_COMMAND_EXEC_RESP_LENGTH ||
>> +	    le32_to_cpu(context->rx->command_execute_resp.response_length < 0)) {
>> +		dev_err(&context->mhi_dev->dev,
>> +			"Malformed command execute resp packet - length %d\n",
>> +			le32_to_cpu(context->rx->length));
>> +
>> +		return;
>> +	}
>> +
>> +	client_command = le32_to_cpu(context->rx->command_execute_resp.client_command);
>> +	response_length = le32_to_cpu(context->rx->command_execute_resp.response_length);
>> +
>> +	if (client_command == SAHARA_EXEC_CMD_GET_TRAINING_DATA) {
>> +		sdev->trng_data_sz = response_length;
>> +		sahara_data->ddr_attr.size = response_length;
>> +		sdev->receiving_trng_data = true;
>> +
>> +		sahara_alloc_mem_training_data(context);
> If either allocation in sahara_alloc_mem_training_data() fails you will
> mhi_queue_buf NULL pointers below.
ACK.
>> +
>> +		/* Queue multiple buffers for receiving data */
>> +		u64 data_len = sdev->trng_data_sz;
>> +		u64 pkt_data_len;
>> +		int i;
>> +
>> +		for (i = 0; i < SAHARA_NUM_CMD_BUF && data_len; ++i) {
>> +			pkt_data_len = min(data_len, SAHARA_PACKET_MAX_SIZE);
>> +			ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE,
>> +					    context->cmd_buff[i], pkt_data_len,
>> +					    data_len <= pkt_data_len ? MHI_EOT : MHI_CHAIN);
>> +
>> +			if (ret) {
>> +				dev_err(&context->mhi_dev->dev,
>> +					"Unable to queue command buff %d\n", ret);
>> +				return;
>> +			}
>> +
>> +			data_len -= pkt_data_len;
>> +		}
>> +	}
>> +
>> +	context->tx[0]->cmd = cpu_to_le32(SAHARA_EXECUTE_DATA_CMD);
>> +	context->tx[0]->length = cpu_to_le32(SAHARA_COMMAND_EXEC_DATA_LENGTH);
>> +	context->tx[0]->command_exec_data.client_command =
>> +		cpu_to_le32(context->rx->command_execute_resp.client_command);
>> +
>> +	ret = mhi_queue_buf(context->mhi_dev, DMA_TO_DEVICE,
>> +			    context->tx[0], SAHARA_COMMAND_EXEC_DATA_LENGTH, MHI_EOT);
>> +
>> +	if (ret)
>> +		dev_err(&context->mhi_dev->dev,
>> +			"Unable to send command exec get data command %d\n", ret);
>> +}
>> +
>> +static void sahara_handle_training_data(struct sahara_context *context)
>> +{
>> +	u64 bytes_copied = context->bytes_copied;
>> +	u64 bytes_to_copy;
>> +	int i;
>> +	struct sahara_dev_driver_data *sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
>> +	struct sahara_dev_trng_data *sdev = sahara_data->sdev;
>> +
>> +	for (i = 0; i < SAHARA_NUM_CMD_BUF && bytes_copied < sdev->trng_data_sz; ++i) {
>> +		bytes_to_copy = min_t(size_t, SAHARA_PACKET_MAX_SIZE,
>> +				      sdev->trng_data_sz - bytes_copied);
>> +
>> +		/* Copy the received data into the training data buffer */
>> +		memcpy(sdev->trng_data + bytes_copied, context->cmd_buff[i], bytes_to_copy);
>> +
>> +		bytes_copied += bytes_to_copy;
>> +		context->bytes_copied = bytes_copied;
>> +	}
>> +
>> +	if (bytes_copied == sdev->trng_data_sz) {
>> +		/* Handle completion of data reception */
>> +		sahara_switch_mode_to_img_tx(context);
>> +		context->current_mode = SAHARA_MODE_FW_DOWNLOAD;
>> +		sdev->receiving_trng_data = false;
>> +	}
>> +}
>> +
>> +static void sahara_command_processing(struct work_struct *work)
>> +{
>> +	struct sahara_context *context = container_of(work, struct sahara_context, cmd_work);
>> +	int ret;
>> +	struct sahara_dev_driver_data *sahara_data = dev_get_drvdata(&context->mhi_dev->dev);
>> +	struct sahara_dev_trng_data *sdev = sahara_data->sdev;
>> +
>> +	if (sdev->receiving_trng_data) {
>> +		sahara_handle_training_data(context);
>> +	} else {
>> +		switch (le32_to_cpu(context->rx->cmd)) {
>> +		case SAHARA_EXECUTE_RESP_CMD:
>> +			sahara_command_execute_resp(context);
>> +			break;
>> +		case SAHARA_EXEC_CMD_GET_TRAINING_DATA:
>> +			sahara_command_execute(context, SAHARA_EXEC_CMD_GET_TRAINING_DATA);
>> +			break;
>> +		default:
>> +			dev_err(&context->mhi_dev->dev,
>> +				"Invalid client command 0x%x\n", le32_to_cpu(context->rx->cmd));
>> +			break;
>> +		}
>> +	}
>> +
>> +	/* Requeue buffer for receiving next command */
>> +	if (!sdev->receiving_trng_data) {
>> +		ret = mhi_queue_buf(context->mhi_dev, DMA_FROM_DEVICE, context->rx,
>> +				    SAHARA_PACKET_MAX_SIZE, MHI_EOT);
>> +		if (ret)
>> +			dev_err(&context->mhi_dev->dev, "Unable to requeue rx buf %d\n", ret);
>> +	}
>> +}
>> +
>>   static void sahara_processing(struct work_struct *work)
>>   {
>>   	struct sahara_context *context = container_of(work, struct sahara_context, fw_work);
>> @@ -906,6 +1099,7 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>>   	context->mhi_dev = mhi_dev;
>>   	INIT_WORK(&context->fw_work, sahara_processing);
>>   	INIT_WORK(&context->dump_work, sahara_dump_processing);
>> +	INIT_WORK(&context->cmd_work, sahara_command_processing);
>>   
>>   	/* Get the image table for a given device name */
>>   	context->image_table = sahara_get_image_table(mhi_dev->mhi_cntrl->name);
>> @@ -950,6 +1144,7 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
>>   
>>   	cancel_work_sync(&context->fw_work);
>>   	cancel_work_sync(&context->dump_work);
>> +	cancel_work_sync(&context->cmd_work);
>>   	vfree(context->mem_dump);
>>   	sahara_release_image(context);
>>   	mhi_unprepare_from_transfer(mhi_dev);
>> @@ -971,6 +1166,8 @@ static void sahara_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result
>>   		context->rx_size = mhi_result->bytes_xferd;
>>   		if (context->current_mode == SAHARA_MODE_MEM_DUMP)
>>   			schedule_work(&context->dump_work);
>> +		else if (context->current_mode == SAHARA_MODE_CMD)
>> +			schedule_work(&context->cmd_work);
> That means that you introduced the command mode work spread across three
> (four?) different patches, but the only way to reason about the addition
> is to read them all and think of them as one change.
>
> Please try to slice it differently - rather than introducing some piece
> of command mode and then another piece, which at each step is
> incomplete. This patch indicates that you get the list of commands and
> you can choose to call them or not. So why not implement the command
> list send, receive and handling in one patch - without calling any
> command. Then another patch that implements the DDR training command.
> Suddenly you have two (or more) patches that are coherent in themselves
> - not scattered across multiple commits.
>
> Regards,
> Bjorn
ACK. In v2, i have sliced the patches differently and ensured logical 
continuity.
>>   		else
>>   			schedule_work(&context->fw_work);
>>   	}
>> -- 
>> 2.34.1
>>

