Return-Path: <linux-arm-msm+bounces-99124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EsLNtj1wGmvPAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:12:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E362EE21E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D22883005596
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749F7371891;
	Mon, 23 Mar 2026 08:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxo4pOzK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqWXS37+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B200367F4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253506; cv=none; b=sVZXs69IjxrR9a2sJoAcMumwKI/GSoZehTJS2/Q13qHHd8qJMUApxd+0dQm7GcJ1Enesx4X/+h4VZplQnrBpH3Vq5qhBLbyLQ2J+s+hyvZIDXCHnN/3tOW9xGGdFLYyEWejuNNUvx+io6BaRt2pDnds0xhfAchxApNumTuuQIZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253506; c=relaxed/simple;
	bh=Y9OoQrwcstdnUvwKNdRijn59yCMHixNCRixZsYASUEE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=rh0Gh66BWF9An7lRUaNQUJ7DbBVA0GuT13VNpAKQnR9C4Veu4V43kA/b2Br0ENX0L7QLZYgYNfDyZ2b+eDbqbVp00UgVNfjaTEYvV4dEjB939GpULNQXQCnML0iY8gBsYKrxStQKRtF9l0IEPu2ka4rOk9c2nWN4ANH7LEqQ8z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxo4pOzK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqWXS37+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tB582291169
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69LD8UTV/P5U6nK3Bpfv5vrY4AqBiogQY+sawTpNk0Q=; b=lxo4pOzKeMrJsdV2
	z1VvRx1WWXI/URUIePrBzVsw2UrXpYX5vNbF75gxV26JBKOAgRBTEIdgZ9UrqpD+
	jEZbSpXR7/L2Fa0t6PGDpGJwe7MIskj/d0/mvNu5pJ6Gh9Dt0D9NCsX0Gd5DPnP8
	pJgI1O1POPxWOZeirKn8iSIxHob0mIHe38icsq3CHslDKJsz1ynzC7DBu0sWhl46
	eoFsUZWzM3d+v+4BtmXfaxIozNfW/uUJ3fALvYN8/Z8lbTPefO9dEu+AbzTzzMo6
	AahZh+VlfwjZAJ9cKybbNUP1iZZwcJopLA1Zr7ioKhv+kDdmp/B8+sUKfR96jXEK
	rVqjtw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j701rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:11:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35b9333cbfbso2490563a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774253501; x=1774858301; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=69LD8UTV/P5U6nK3Bpfv5vrY4AqBiogQY+sawTpNk0Q=;
        b=gqWXS37+dw12JRCgldU3uF60B98PBCJeUALRDk65BnhDT+EsZsPqkW2u7OWw5BRcMP
         liIan3wk+Oysnpphn1/xebUVPR6Xkeii/6yUmTl9y9uS3KI3DHSJ0Kc9/6oruAhVodwF
         fNzHM6Iino6ggixefK8dItVmZ945onGtc0/MuLAsjx/MpAnLtX31UzIfm44cZmVleij6
         fc4dO1gtfKmJ5bR0jUREFYFSymbFvDuHpMsw/U4zIbEDWT7VcYUbnTqqtGd2aGKWg8Ur
         li/9oFTEiMnp1Q3UgSc2cOSZ5/P6Gx3Vwj6C73npPZmZwo8s6zW8NZdcaQp9lnWSrlTk
         N/Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253501; x=1774858301;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69LD8UTV/P5U6nK3Bpfv5vrY4AqBiogQY+sawTpNk0Q=;
        b=CRGScQSAXNjvwDEKPCXIy2Vz/mXSQEEk+0t3NAS9oHgAVAOSbGPI2y1a4eGz3MEJNt
         KIQXK4VZVnxMh6j/Co2PHlLcYbGvq9VDQfylhbAqymICqAJfztyPt+qFixDHsYjZ44na
         VGaQuFG/XjdTz6VE949E1S1bqxlnbQ/bxaG0fxYJL6eYRtR6v8XcIWNcehX4fUKU4ggp
         oX3QzoXw7fzbPslCoOJpQz0/HNvY7EcjSoq5X//HFg8EvaMH8kVDsg9K8aUyG86WIlVN
         XwqAQpP9AHp6Xff8V/Y5ZtrMgHubLmoiJ1RZPq6Vxp5TkvGcPE56qs9ZT2HX8VvpAin6
         tOUA==
X-Forwarded-Encrypted: i=1; AJvYcCXFmgWXf66PWmymO2yDGWk0Gj7ipCS27hCMUuLXvUITQMCerUe3elpq0YdwFPnXfMIa/l6h+a7J52nz8s3t@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ10/nrTwRV4I2K1mGxoNBx6LnTMF2k10zK0EHpJoo7PFOWBAv
	5wd93AV3+QhIbzUXWVcDjXBvdXTZ59EWSFT7WF+h7D5a2k+x7Aw2BGW2af88b7j3BLtj9Q9Uo1P
	93lYkfA35NRYa/5L+jN4DEhl/z6c0dHm1BJ5MvHDLzHdiqn8SXiq8tYd+1maHrgkPd4WwIltqu5
	OC
X-Gm-Gg: ATEYQzwEjby89PMMa2R25VGNhS+tf3+ulWuMyLR+jXthy1v+HMyaw2x0Byur3NFQ5L6
	HoNHWgNgGxAHHdqJ1JO5JkgFZnQW7cSa2p1Qa7guuJiNksy5TKBBYNGthQa6/AP2doR6fGqzJdx
	0tgHoG5fll9Y7SqYofKVB7lfjnMDrqDpMaLf/fQu0ultG0XnI7ZXisegAAcS0FanCScMRMsfUf7
	FuUmvzbGH9l1/gcxyPTU635QVGtEhKt8DEOzFh5iJUEVi8G9dilo/pnjhcky1efvHy9xl5GFBCQ
	3+DXG1DXbtJhVAEEJkF38tZM5gsrZ1KDWg2Hr9oL3TNQ82H/cr794yINpQLoo1IUllkbYnYs+7s
	C5HHi2oBygwzI7oY0h2PltnT//KweXLnTsCGqDW4qQeQ5//UXpSac1A==
X-Received: by 2002:a05:6300:210e:b0:394:5513:ce5 with SMTP id adf61e73a8af0-39bcec236aemr10407901637.51.1774253501263;
        Mon, 23 Mar 2026 01:11:41 -0700 (PDT)
X-Received: by 2002:a05:6300:210e:b0:394:5513:ce5 with SMTP id adf61e73a8af0-39bcec236aemr10407875637.51.1774253500781;
        Mon, 23 Mar 2026 01:11:40 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74443cc9edsm7119939a12.23.2026.03.23.01.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 01:11:40 -0700 (PDT)
Message-ID: <839d9dc8-30ef-a2ed-42a5-106923b4065a@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:41:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v8 11/11] media: qcom: iris: extract firmware description
 data
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260319-iris-platform-data-v8-0-55a9566ebf60@oss.qualcomm.com>
 <20260319-iris-platform-data-v8-11-55a9566ebf60@oss.qualcomm.com>
 <14610f07-52c2-465c-d407-fff1974429ea@oss.qualcomm.com>
In-Reply-To: <14610f07-52c2-465c-d407-fff1974429ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c0f5be cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=hbzS8gabZINpAvasuVNEhA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Gp_403MT8fa29MjLaSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: iBhsz_slL45nk0S5_EXtz7hI7PpYHkhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA2MiBTYWx0ZWRfX2dHYbqGuswMS
 d8nzoPMZ0druQ+gFoDXNcxGsOnpYWyoLSNdrs5O3ZDPcPl9H0tenP3D3ORAmBDfIiDAjWSGVt/A
 XTO09coQOJ6pPrLDiZS4nF/JYj7PsE1UMbsntYiFRbWvsET26XXQ22QxgbrKP8YL1SYZ+xwj49T
 MQPmGtyb95d3uxgISyNmqa563N/Lxfc5jiGq9iPUjsnX9NhCDtmAxjePFd04HfSAXaLhfBaICIU
 OBE7PauyTGrlayJLANrymW7g/DAcPMgi29H+cEdHnNj4H6wooj4u9okfzWSz5mHkn69IgD6EZdX
 SQV2FxMgZ5eGsjcdwUKEdzA1q0ljtNuFXCuRjrZw0n442JHBJwF+nN2UPZKvAuSDe5ovb55nAl+
 DeqxhRT73GkxOtBl4PIioTzAmYyIxS/p5jcjiTjSrGmh3zzppl02ECfpNz23RyNvNpKCgy64vkv
 RSFW3cHepHAFurWyq2g==
X-Proofpoint-GUID: iBhsz_slL45nk0S5_EXtz7hI7PpYHkhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230062
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99124-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 77E362EE21E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 12:50 PM, Dikshita Agarwal wrote:
> 
> 
> On 3/19/2026 11:29 AM, Dmitry Baryshkov wrote:
>> In preparation to adding support for several firmware revisions to be
>> used for a platform, extract the firmware description data. It
>> incorporates firmware name, HFI ops and buffer requirements of the
>> particular firmware build.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  drivers/media/platform/qcom/iris/iris_buffer.c     |  2 +-
>>  drivers/media/platform/qcom/iris/iris_core.h       |  1 +
>>  drivers/media/platform/qcom/iris/iris_firmware.c   |  2 +-
>>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  2 +-
>>  .../platform/qcom/iris/iris_platform_common.h      | 15 ++++----
>>  .../media/platform/qcom/iris/iris_platform_vpu2.c  | 20 +++++++----
>>  .../media/platform/qcom/iris/iris_platform_vpu3x.c | 41 +++++++++++++++-------
>>  drivers/media/platform/qcom/iris/iris_probe.c      |  3 +-
>>  8 files changed, 57 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index fbe136360aa1..ef7f6f931557 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -295,7 +295,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
>>  {
>>  	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>>  
>> -	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
>> +	buffers->size = inst->core->iris_firmware_desc->get_vpu_buffer_size(inst, buffer_type);
>>  	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>>  }
>>  
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
>> index e0ca245c8c63..7f36eb65dcbf 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -99,6 +99,7 @@ struct iris_core {
>>  	struct reset_control_bulk_data		*controller_resets;
>>  	const struct iris_platform_data		*iris_platform_data;
>>  	const struct iris_firmware_data		*iris_firmware_data;
>> +	const struct iris_firmware_desc		*iris_firmware_desc;
> 
> Missing documentation.
> 
>>  	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>>  	enum iris_core_state			state;
>>  	dma_addr_t				iface_q_table_daddr;
> 
> <snip>
> 
>> index dd87504c2e67..d36f0c0e785b 100644
>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>> @@ -251,7 +251,8 @@ static int iris_probe(struct platform_device *pdev)
>>  		return core->irq;
>>  
>>  	core->iris_platform_data = of_device_get_match_data(core->dev);
>> -	core->iris_firmware_data = core->iris_platform_data->firmware_data;
>> +	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> 
> How will iris_firmware_desc be selected once a SoC supports both Gen1 and
> Gen2 firmware?
> Today it’s fixed in platform_data, but eventually probe would need to
> choose between firmware_desc_gen1 / firmware_desc_gen2 based on the generation.

something like this would be okay?

if (core->iris_platform_data->firmware_desc_gen2)
  core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
else
  core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;

> 
> Thanks,
> Dikshita
>> +	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>>  
>>  	core->ubwc_cfg = qcom_ubwc_config_get_data();
>>  	if (IS_ERR(core->ubwc_cfg))
>>

