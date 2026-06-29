Return-Path: <linux-arm-msm+bounces-114818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eGqqJL31QWpJxAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:34:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F46D5DC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:34:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IZwSAWUs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YKS9vfnC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114818-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114818-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABD8B301378F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5A8333441;
	Mon, 29 Jun 2026 04:34:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC23BA3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:33:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707640; cv=none; b=BEiVtdrvtSWUcGbadpCC3SUSih8PRgccalOrmJudmoY/ZttN8jdOjBaaTUmso/oRllPVBY22nmMXwDxxWnS/JWpKqh0U3ZOatDl8crPp4wkvv/vPMxWBmnvCJ2/HUd96ak2SGZ3qX4IMOMsVWXco2CSXMU3jlGcgsATxQJGZ1Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707640; c=relaxed/simple;
	bh=6U7kt3WRYUewAYtsxfxhxMoy//KQUd+ej5BF1+8M214=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hc3JRAXfQHcgGSbBQahYxZYCzDeHQzj5I4r4BOs1KDuVnEJE0VYzJQ24eGA2sDyOj3n7eHDpEECh5kH8p0fZd+9vrTnDvE1CMnKDJ9+X2PgckPDfgUUJhiIW3Ygb9InnrdDqYPhWRZ+dXu8XF8JPwzjQr+Vd435M/LBa+JvvrOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZwSAWUs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKS9vfnC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHJ01719035
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CERH0yTwG1xBkHY67nIpH2ruyI72D2G8dS77s4oIjpc=; b=IZwSAWUs8j1ia4cr
	egfmpZKokmDKuRrMJlGQHu3oR//ZUg+xpS5rMo8W141ptPa9ytI3j5I0oQS2RtcK
	6q0kVz6NHe4WkqkWf2fBxLNGM3CilBRVbUeMd5qKMOOiqPfN3bls8YmiYwiJoz2K
	A07j/FZpkIgZiUdfEAPkqeImm+tVSsmUMeEUPFcurPm2fbwfpOfeEYUy3Gdml2D6
	JeqMm6h9eQllDuEHA355qn9dF+tJ/HRyctF9nLi4f8kcFSp07oUItkQjmz6hSN++
	edkWvJvoMG7LNCpGfdeCozC2ez61LptAffRZK6HWJ2v1Lgh+5+gHeQEvXwaf5mBC
	mU+nYg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27pf4ad6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:33:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c95b0e22aso10840027eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 21:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707636; x=1783312436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CERH0yTwG1xBkHY67nIpH2ruyI72D2G8dS77s4oIjpc=;
        b=YKS9vfnCEs30uGmdSW8BgmDqYZnJgmjERhJuTtyIdR+NTsVmXst9VuoDJF/ZlGvjUT
         xC/xPdFCvwXSJ46C4WH1ovPQW5nnXFI5RubN2ofhjE0DzaDnL2yqBJAnCYTJCJP1vp6V
         erl90Eao8l/7atQEyePeHfvT/l0DVk4k9ze6fEpDAbIixzCJ8gVzWUmLqC2i+I4BAfSr
         VkFsEfX0aR8e7N4yCUF9OywFMsWYDYHjJmXa/xPRmkFUqj1lhfgVyeKw5uQm6ZVOlWHd
         c4L3s+ZX2vyR4tILtUnvsb0ChY71mes2IxS73Ltu/V+4OEdFhQFfuvcMIhkeWSadXZiA
         36+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707636; x=1783312436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CERH0yTwG1xBkHY67nIpH2ruyI72D2G8dS77s4oIjpc=;
        b=cq20ukOM7ooYU2YO0m93x2Juxf7TFTef5a2196VH9KUjXUQY2zE5vZhyvakH66FqRs
         7bHIG8zNzAAN2XGSNXqDffOTfygvsyaIM3b6c72/6mMTEIxpVDHTvYusreX4KL7RQ324
         yQzbbUvs0HgDj/V+GbYL+r7FK/Hz+u0kRXj1H2Dl4H8tS2QvdqIjKiy1EBy6gQr4zUdz
         +LoJ9sH24OL05XEQUVO4Cv1yPcBpMFf0FavTDDrB9AzZyub+z6U9zLSx6XMZ8hBG+0t5
         o9hxYGP8lO65Pot32HTCniz5tKJ/da30h8hbceU4QVvDudqZ+rGu7eLiyzsgP5BSWNMa
         gcew==
X-Forwarded-Encrypted: i=1; AHgh+RryF81lBfxso/NduUNhwISgLPhXowgEX8oVn1vbDzhzCUI7o/fnUtm+joNgamsl5G4hhAra4uAVuO75hrDZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq9JsWidTaMHckvdXUXvAYSnW64V6/r2Cta60U71YjRxuV2u73
	bKmJ09W8OYSGSykbkvTYh/QH9DR92L2i5MERTWJg97yFIMOcqBqQhY2zIxJodsFvWRQ0myV+pNh
	Zhlv0sG7+nKMJDqcRijOyPjEkJGrRPMyHsNY/oS+as0kSKIesXRocbRqXdFC/AThPF4i0
X-Gm-Gg: AfdE7cnuXU5N4rfgG6R4M7UbNiP3WLreGR69/mlJmI6/1SU7na0nKITKbIC0hRAMv//
	2SQWS+r+EiLJ7fZUiRJTcmvY5Neh/nuNqmkkqK8QoiznwqaTbwpdtDgUtAqHpbpcGvLVsh2u6Dw
	XDD1iE0lEDM88q/pz8DX3iJl3X9J7xs7sL7KibnpJnbO4+uhrFElGkXkmkS7vYmsHUHV+oKXfYH
	FG9VKAHddGqZoWkZffSNCQYaJrSjSy+EMbWz33z4BMErKe6HULSkHFYG/wyy41V0ddsTQY0kSB/
	YNQWFUcv2yiRQ7Mpbe9Lhh+19WxMN1oO7PVM37BdT+7Wu87t6oOA77FbxrUKyfN+SuEWtnZBqES
	CTrxZkZklUHBfLNwsr0pwxd2xFy+lMBFicAGeSkmpijMjMJqXxQ==
X-Received: by 2002:a05:7301:6502:b0:30c:a9a:ee57 with SMTP id 5a478bee46e88-30c84c1c69emr14867692eec.15.1782707635767;
        Sun, 28 Jun 2026 21:33:55 -0700 (PDT)
X-Received: by 2002:a05:7301:6502:b0:30c:a9a:ee57 with SMTP id 5a478bee46e88-30c84c1c69emr14867666eec.15.1782707635157;
        Sun, 28 Jun 2026 21:33:55 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139eac62642sm22311683c88.10.2026.06.28.21.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:33:54 -0700 (PDT)
Message-ID: <d13f04d5-27e1-4ed6-acf0-eda9496535ec@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:03:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] soundwire: qcom: add EE-aware register layout and
 cpu selection
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <314beaa0-3dc4-4cba-a37f-c358532e90dd@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <314beaa0-3dc4-4cba-a37f-c358532e90dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNiBTYWx0ZWRfXxHTM9k+laldg
 aGA+oX45ehmlfnyI2hUX6Aee1qDDiQdnPqK4E6Lj9x8myu58QKaryIvS+DENG+r6rO+c/p8RanK
 PmNXNqRzyfebFt10M9x4bymyt3OpU4U=
X-Proofpoint-GUID: FDQL51WnWBIT8BOfceij--LIIJ0uZRkC
X-Proofpoint-ORIG-GUID: FDQL51WnWBIT8BOfceij--LIIJ0uZRkC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNiBTYWx0ZWRfX7YBvRFuhDJhL
 OzKgUdxmQ6+j0RBGPTwhrozYq1nu2vCVweKMv5ImNlE2+9SjX10Usbgrghkij8nCCMCoqFrp87W
 PgvT+Tj6HhNS3FVKnhHIEm4pqy3mRzvDgTHLX+jRc3AO+9ItZsYUvT0QEljH2/AWdzF6u4IIC0Q
 7giy/o3x5vBp9QqyJ9rzgjkRx0WIZOiQIAxA6ZD5b+gN5thg/Wk0wK2iV2blH6rex6Z3EDb0/rl
 goTr1OUKuipUwHZB5ot2hAcGUVMb5XaF/0oiAbzECTATEyca81+v3E4rv7xNfooxfrk3t8q43Ec
 EXOFvWau8wme0MaT3yjTQYt44QpOVIBAwY3r2uKq4oS1dwAkYlBxgY8d0le/PnXj1RdE5QMMb3H
 Jd4xUqZBVWTArhx1jL/1Mugb1y5A4AnHrkxFzMSJKEuhZapu1TQrcBYaabQn64ShQs+pQwCcp6a
 yZbKqER304S/GD0egKg==
X-Authority-Analysis: v=2.4 cv=R7Mz39RX c=1 sm=1 tr=0 ts=6a41f5b4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=URT9HZ16PL6rH1bhHOQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290036
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114818-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:quic_srivasam@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E49F46D5DC8



On 6/9/2026 2:23 PM, Srinivas Kandagatla wrote:
> 
> 
> On 6/8/26 6:53 PM, Mohammad Rafi Shaik wrote:
>> Some Qualcomm SoundWire masters expose interrupt, FIFO and status
>> registers in EE-specific register windows on v2.0 and newer hardware.
>>
>> Add support for selecting the SoundWire execution environment from DT
>> and use it to program the correct register window for the active EE.
> 
> So this is integration details, which can be derived dynamically based
> on version or compatible.
> 
Yes, agreed.

This can be configured dynamically based on the compatible string.

I will try to add SoC-specific compatible entries and configure the EE 
accordingly.

> 
>> The driver now reads the EE value from the new
>> qcom,swr-master-ee-val property, with qcom,ee as a fallback for
>> backward compatibility.
> 
>>
>> For v2.0+ hardware, the IRQ/FIFO/status register layout is adjusted by
> Which exact version, do we have minor or step values for this?
> 
>> the EE window stride so the driver programs the correct bank for the
>> selected EE. The interrupt enable path is also updated to always use
>> the selected EE window.
>>
>> This change allows SoundWire interrupt routing and register accesses to
>> work correctly on platforms where the master is not mapped to the
>> default EE1 window.
>>
>> In Shikra, the soundwire execution environment is set to 0 unlike other
>> Qualcomm boards.
>>
> 
> Can we get this integration details dynamically.
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   drivers/soundwire/qcom.c | 78 +++++++++++++++++++++++++++++++++-------
>>   1 file changed, 65 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 3d8f5a81e..f4b8ff77b 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -26,6 +26,7 @@
>>   #define SWRM_COMP_STATUS					0x014
>>   #define SWRM_LINK_MANAGER_EE					0x018
>>   #define SWRM_EE_CPU						1
>> +#define SWRM_MAX_EE						1
> 
> Can we not make the EE_CPU dynamic and everything should fall in place?
> isn't?
> 

yes right, I will implement dynamic configuration based on the 
compatible string.

> Is the register layout changed?
> 

Layout is same logically, but access differs per EE via stride-based 
windows.

>>   #define SWRM_FRM_GEN_ENABLED					BIT(0)
>>   #define SWRM_VERSION_1_3_0					0x01030000
>>   #define SWRM_VERSION_1_5_1					0x01050001
>> @@ -118,6 +119,7 @@
>>   #define SWRM_V2_0_CLK_CTRL					0x5060
>>   #define SWRM_V2_0_CLK_CTRL_CLK_START				BIT(0)
>>   #define SWRM_V2_0_LINK_STATUS					0x5064
>> +#define SWRM_V2_REG_EE_STRIDE					0x1000
>>   
>>   #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
>>   #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
>> @@ -202,6 +204,7 @@ struct qcom_swrm_ctrl {
>>   	struct mutex port_lock;
>>   	struct clk *hclk;
>>   	int irq;
>> +	u32 ee;
>>   	unsigned int version;
>>   	int wake_irq;
>>   	int num_din_ports;
>> @@ -222,6 +225,7 @@ struct qcom_swrm_ctrl {
>>   	u32 slave_status;
>>   	u32 wr_fifo_depth;
>>   	bool clock_stop_not_supported;
>> +	unsigned int reg_layout_local[SWRM_OFFSET_DP_SAMPLECTRL2_BANK + 1];
>>   };
>>   
>>   struct qcom_swrm_data {
>> @@ -328,6 +332,36 @@ static const struct qcom_swrm_data swrm_v3_0_data = {
>>   };
>>   #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>>   
>> +static void qcom_swrm_set_ee_register_layout(struct qcom_swrm_ctrl *ctrl,
>> +					     const struct qcom_swrm_data *data)
>> +{
>> +	int ee_offset;
>> +
>> +	memcpy(ctrl->reg_layout_local, data->reg_layout,
>> +	       sizeof(ctrl->reg_layout_local));
>> +	ctrl->reg_layout = ctrl->reg_layout_local;
>> +
>> +	if (ctrl->version < SWRM_VERSION_2_0_0)
>> +		return;
>> +
>> +	/*
>> +	 * Current register constants map EE1. For EE0, use the EE register
>> +	 * window stride to access status/IRQ/FIFO registers.
>> +	 */
>> +	ee_offset = ((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE;
>> +	if (!ee_offset)
>> +		return;
>> +
>> +	ctrl->reg_layout_local[SWRM_REG_FRAME_GEN_ENABLED] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_STATUS] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CLEAR] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CPU_EN] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_WR_CMD] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_CMD] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_STATUS] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] += ee_offset;
> 
> Why not make these registers take the ee value rather then doing this way?
> 

Will review and address in the next revision.

Thanks,
Rafi.

> 
>> +}
>> +
>>   static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>>   				  u32 *val)
>>   {
>> @@ -904,12 +938,13 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>>   
>>   	if (ctrl->version == SWRM_VERSION_1_7_0) {
>> -		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>>   		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
>> -				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
>> +				SWRM_MCP_BUS_CLK_START << ctrl->ee);
>>   	} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
>> -		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>> -		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
>> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>> +		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
>> +				((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE,
>>   				SWRM_V2_0_CLK_CTRL_CLK_START);
>>   	} else {
>>   		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>> @@ -935,11 +970,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>>   			0xFFFFFFFF);
>>   
>> -	/* enable CPU IRQs */
>> -	if (ctrl->mmio) {
>> -		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
>> -				SWRM_INTERRUPT_STATUS_RMSK);
>> -	}
>> +	/* enable CPU IRQs for the selected EE window */
>> +	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
>> +			SWRM_INTERRUPT_STATUS_RMSK);
>>   
>>   	/* Set IRQ to PULSE */
>>   	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
>> @@ -1545,7 +1578,22 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   		return -ENOMEM;
>>   
>>   	data = of_device_get_match_data(dev);
>> +	ctrl->ee = SWRM_EE_CPU;
>> +	ret = of_property_read_u32(dev->of_node, "qcom,swr-master-ee-val", &ctrl->ee);
>> +	if (ret)
>> +		ret = of_property_read_u32(dev->of_node, "qcom,ee", &ctrl->ee);
>> +	if (ret)
>> +		ctrl->ee = SWRM_EE_CPU;
>> +	if (ctrl->ee > SWRM_MAX_EE) {
>> +		dev_warn(dev, "invalid SoundWire EE %u, using EE%u\n",
>> +			 ctrl->ee, SWRM_EE_CPU);
>> +		ctrl->ee = SWRM_EE_CPU;
>> +	}
>>   	ctrl->max_reg = data->max_reg;
>> +	/*
>> +	 * Defer EE register window selection until HW version is known.
>> +	 * For v2.0+ the IRQ/FIFO window is EE-banked.
>> +	 */
>>   	ctrl->reg_layout = data->reg_layout;
>>   	ctrl->rows_index = sdw_find_row_index(data->default_rows);
>>   	ctrl->cols_index = sdw_find_col_index(data->default_cols);
>> @@ -1623,6 +1671,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	prop->default_row = data->default_rows;
>>   
>>   	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
>> +	qcom_swrm_set_ee_register_layout(ctrl, data);
>>   
>>   	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
>>   					qcom_swrm_irq_handler,
>> @@ -1733,16 +1782,19 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>>   		reset_control_reset(ctrl->audio_cgcr);
>>   
>>   		if (ctrl->version == SWRM_VERSION_1_7_0) {
>> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>>   			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
>> -					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
>> +					SWRM_MCP_BUS_CLK_START << ctrl->ee);
>>   		} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
>> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>> -			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
>> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>> +			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
>> +					((int)ctrl->ee - SWRM_EE_CPU) *
>> +					SWRM_V2_REG_EE_STRIDE,
>>   					SWRM_V2_0_CLK_CTRL_CLK_START);
>>   		} else {
>>   			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>>   		}
>> +
>>   		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>>   			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
>>   
> 


