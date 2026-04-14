Return-Path: <linux-arm-msm+bounces-103099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKvKLlcP3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:56:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE113F84F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 393A630AFB03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B093A3E72;
	Tue, 14 Apr 2026 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHiqGMki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhqdnErl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D66537C926
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160325; cv=none; b=FuJv3bJ4zG8MwDnzB/lIzUW0fGXYbx1e3xaWTDY5GXzZRncC60xbfsiUJhe3YieVJbzHjESB1oIvXcOlLYtTo9yEaQJ7t0W1xLL+GQNiyW0vqCexz7f8KQ0nDK9ZsZva1vq3A0vBNuZuGHH4Bj8IrgGxAKo1FaW1g+9BjXMZ3SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160325; c=relaxed/simple;
	bh=I/Hd0vAKGMDZBsVaB8CR4NASLw78vH72UmpKGDKvXls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CChvynMfWV/l6pbeRDwD/MQAt4Hi1ROOxkViEEar0HdZyAOcBHQYB5Mw1IGyBFa0qG5WQlr2SJpDvBKQK2TI9JOXwZvrOd3EAVC01EjdLFsDCvvEOcO5HX5ODVkYU3juch26hfVj8VtgrtZGuOs53bX8j9Kq7x/AixhcoZHlqsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bHiqGMki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhqdnErl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6dLQi3424949
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MF4coyqO5NcC7m2HQ7/LzMIkAyMalp7SpzbxTYvrc4=; b=bHiqGMki65PNXwWu
	gXNn0tbZTg1G5l8GfGJ4Pkp0yMcVwCUwNSP7dR04q5O8C1WP7ckzIlJu2BdY/BvL
	LBycAzjEQXg8P+3DzmoMYlm1hB0iKBNIzylpkrssghagOmXAgPAS9k/Fbs/w9HJq
	DJGj3cxxlP1+T6Br5v/Yd9AGjM1/mdf/HYHjchx16byeoS5rtSy78fE1HsXzif+V
	ls0LGCwhg3kv21uXUt+2arqD5WPZ5Nyexw0WfRfpOB+kL27XfpYzaV2LZ2O0BBSq
	syUTun0532GqMH/rXLxEd75Pqckkq+7DDn4KwFl/XPgz2lMzX9CXs8N4ssRm4YhQ
	nCYIEw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87fa637-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:52:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f220f1dabso1668831b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160321; x=1776765121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4MF4coyqO5NcC7m2HQ7/LzMIkAyMalp7SpzbxTYvrc4=;
        b=AhqdnErl+XfNfsRjCv2c4qdohwqc7gmHP6zFuCBVs4Up7XGtHcmsllGrF+gLPjPsAy
         WpT2ZYmnWn1q2jLlyUfWQbROLl+wGcI4IY48Ch8DsiGSrBfYfTsuJ33DWsrnVqV8a3ur
         wcuv9uCx3fXGvy8zqEsvhONo13vBc3uDmn9pRsbfpYoHgUSxXWUMDchF5WeN97WGsopX
         CwEGazMgyrgLX1TZ21w/Al7MyJuxYyVa2UoXN4KN3DkHzPFm1o5zNpQSpowh1BwT6Lr5
         PTsztUJ5nRG9EDWzs/3o8s+49EqLlTfV8WIc2ukl1EioXiEs7qzBxUhQ3bztDJhv6SAg
         eB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160321; x=1776765121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MF4coyqO5NcC7m2HQ7/LzMIkAyMalp7SpzbxTYvrc4=;
        b=VOe8XwDsusAJ4qKCn1tnqm4RC15OuC/buVyGKHmGNTmViUEqZpvp35AHHZnbmS1qiz
         c3iQ9IO5w++XAr3wZE7k4zZurNoCQ0yOyMYVrn61ew2lUqVk3CuPq48POY+NRd9wOb5r
         Jz9MAQQCjHymKsJR/S0KMH49mpSPnEIBOfoX1YetfBCqJqDzsatPJ2nj65ujIHWLwuPX
         n2bIeYz+KFyBvZbFO05eayUpmvq4vuG23fJCQaCUR3GLFGU8Nhetvt75pnTzAFTdm+J8
         Gt4VU/xrjL219mf9Ot5Z5tiBdH5QDFfAnS6/F/90GQKJ3xJDjx1DR21Pgt0BzlmFpafd
         HBbw==
X-Forwarded-Encrypted: i=1; AFNElJ/U46gXbh1n2/qOkamPDeDPwgRctlQT0jSSB4QZWVEV5xAKdes0AKCU5nQjBwQ7TORpV9/4qtvhupQYgIay@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj+NvVvCpauF9HZeJaw1K1HyI/cqJD+xiW3S89gRD/jR6PQbJv
	6onrNKzZDmzgEmaJSh8k/SNK0K8zvXnw9syJz3AsxGFFAvSt6LYZPIRDPwmHAoqm/xgph12bdGa
	8JACA2uvoyVgF1CC6wNiuYk94GXcm2v5CHarcStVoFWIYE1hVNgtfmvs/pz1BOSTmBw5P
X-Gm-Gg: AeBDiesvN6VkUxJfcMfcT2k5tmXHAQNT1gBzZ4gViPK0ajTI8kq8tdpGm4lZADdz4Jp
	LvlCv6KNPc4IFiGqv82ZaUn6h8914bkiFXz8KWkUfRcHCB9+nUevnR/91XGzIPo6Z/0ZnAWTNyQ
	0IHgIDHrFMvMaehMX9NoMihhfkUnlCHrbj2IulDDXQcRsMLTXbDNng3x5fPdU4/pXyj521/+fVS
	YCrvQCFwcO1ktj+n+nAXJekT8dpiElktN/+uH6wUewYE7MK9InC1IXZjWIEnbYlW38sPBAjZ9QN
	6aetT1GVMETsiKX63t5nvfemd6mTJ98ALJs33xy7kotwyGA3EuvUVPYQAu8/X5H0M6JNbyaJWLM
	TyeL8i9MSLEZU80WFo8HaxO0s+4H1yR/u8u3wcMoOaiT1DPdShybCyw==
X-Received: by 2002:a05:6a00:2d85:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f0c303511mr17536292b3a.26.1776160321539;
        Tue, 14 Apr 2026 02:52:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d85:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f0c303511mr17536273b3a.26.1776160321051;
        Tue, 14 Apr 2026 02:52:01 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c330925sm15955528b3a.15.2026.04.14.02.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:52:00 -0700 (PDT)
Message-ID: <dbcea41f-cf98-4654-bb30-49308a5422db@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:21:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] bus: mhi: Add QDU100 variant and image_id firmware
 fallback
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, andersson@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-5-47ad79308762@oss.qualcomm.com>
 <5lfbhyzyyji6cuve3uzd26rfgnqotcupelppgehdj36dq7op6j@hn3jmhtqzntq>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <5lfbhyzyyji6cuve3uzd26rfgnqotcupelppgehdj36dq7op6j@hn3jmhtqzntq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX/8eoKKJIDbCm
 gN+IpJQn8avvqyJEGCaPFi2BBkBEt2LNCk/R/Wy4F+Tu5gJLYmdDxzuz2+JylBuqY4cQZ70Lkzn
 s+CjCO9W6kVu7I9GldDCw9wjkVDmloXGmT7mosCdOxAKFK48qhLERhocF7KI23vzcu0Ps7mTlly
 FI14zyqL44HpVLuhm2skkQm7S5gVRGBlDzOLd9XfjwuxHA7Ej9mqU3qmUozgcrqMzsScJyuY+FT
 epchrR4K6Nl8NJa7z+84srWJs6AWii9WwJTevYzGwmcYzQhZkFicgnzD8DsGKtHRSy56f95cyn/
 kbrvu2Y8AuEVbjXJX4U0DerDekc/P0vy6A988yDZLI0KG3MiBBu40i+1RyDnp2Lwy8JDtmDhoPw
 ZmYUH6Stkjn3EISCQA2iN1AQge25biXk2A6dg0uGJwgiWQHKXF72j8u1xb/TYEVLoylT+9eRniJ
 aKgbxz2XWL/wVEJabpw==
X-Authority-Analysis: v=2.4 cv=DaYnbPtW c=1 sm=1 tr=0 ts=69de0e42 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Io-4PmWlcMg8xS9VqXEA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Grp3gS4RLdQYsMZsHF6ljewB01RKu-be
X-Proofpoint-ORIG-GUID: Grp3gS4RLdQYsMZsHF6ljewB01RKu-be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092
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
	TAGGED_FROM(0.00)[bounces-103099-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 0CE113F84F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/13/2026 5:04 PM, Manivannan Sadhasivam wrote:
> On Thu, Mar 19, 2026 at 12:01:45PM +0530, Kishore Batta wrote:
>> The Sahara driver currently selects a firmware image table based on the
>> attached device, but it does not recognize QDU100 devices that expose the
>> protocol on the SAHARA MHI channel. As a result, the host cannot associate
>> QDU100 devices with the correct firmware namespace during image transfer.
>>
>> Extend the probe-time variant selection to match the SAHARA MHI channel
>> and associate it with the QDU100 firmware folder. Add an image_id based
>> firmware lookup fallback for cases where an image does not have an explicit
>> table entry. This allows required images to be provisioned by the platform
>> without requiring device specific client drivers or additional registration
>> mechanisms.
>>
>> This change only affects devices matched on the SAHARA channel and does not
>> change behavior for existing AIC100 and AIC200 devices.
>>
>> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
>> ---
>>   drivers/bus/mhi/sahara/sahara.c | 77 ++++++++++++++++++++++++++++++++++++++---
>>   1 file changed, 72 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
>> index 8f1c0d72066c0cf80c09d78bfc51df2e482133b9..4ea14c57774f51a778289d7409372a6ab21fea60 100644
>> --- a/drivers/bus/mhi/sahara/sahara.c
>> +++ b/drivers/bus/mhi/sahara/sahara.c
>> @@ -234,6 +234,36 @@ static const char * const aic200_image_table[] = {
>>   	[78] = "qcom/aic200/pvs.bin",
>>   };
>>   
>> +static const char * const qdu100_image_table[] = {
>> +	[5] = "qcom/qdu100/uefi.elf",
>> +	[8] = "qcom/qdu100/qdsp6sw.mbn",
>> +	[16] = "qcom/qdu100/efs1.bin",
>> +	[17] = "qcom/qdu100/efs2.bin",
>> +	[20] = "qcom/qdu100/efs3.bin",
>> +	[23] = "qcom/qdu100/aop.mbn",
>> +	[25] = "qcom/qdu100/tz.mbn",
>> +	[29] = "qcom/qdu100/zeros_1sector.bin",
>> +	[33] = "qcom/qdu100/hypvm.mbn",
>> +	[34] = "qcom/qdu100/mdmddr.mbn",
>> +	[36] = "qcom/qdu100/multi_image_qti.mbn",
>> +	[37] = "qcom/qdu100/multi_image.mbn",
>> +	[38] = "qcom/qdu100/xbl_config.elf",
>> +	[39] = "qcom/qdu100/abl_userdebug.elf",
>> +	[40] = "qcom/qdu100/zeros_1sector.bin",
>> +	[41] = "qcom/qdu100/devcfg.mbn",
>> +	[42] = "qcom/qdu100/zeros_1sector.bin",
>> +	[45] = "qcom/qdu100/tools_l.elf",
>> +	[46] = "qcom/qdu100/Quantum.elf",
>> +	[47] = "qcom/qdu100/quest.elf",
>> +	[48] = "qcom/qdu100/xbl_ramdump.elf",
>> +	[49] = "qcom/qdu100/shrm.elf",
>> +	[50] = "qcom/qdu100/cpucp.elf",
>> +	[51] = "qcom/qdu100/aop_devcfg.mbn",
>> +	[52] = "qcom/qdu100/fw_csm_gsi_3.0.elf",
>> +	[53] = "qcom/qdu100/qdsp6sw_dtbs.elf",
>> +	[54] = "qcom/qdu100/qupv3fw.elf",
>> +};
> Why the Sahara driver hardcodes these firmware names in the first place? Sahara
> is just a protocol to transfer these images to the device, so this driver
> shouldn't have any device specific info hardcoded. IMO, this should just act as
> a pure library. These firmware names should come from MHI controller drivers
> instead.
>
> - Mani

ACK. I will move these image tables to respective MHI controller drivers 
by implementing a registration mechanism.
>

