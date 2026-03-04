Return-Path: <linux-arm-msm+bounces-95289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBjcG40TqGnUngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:12:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 145D91FEC32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58E27304F01F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 11:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 710A937F8A3;
	Wed,  4 Mar 2026 11:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="je1u1I/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SljtjOOA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478CB3A4518
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622684; cv=none; b=D/GUms6pK2NNnWKXRWJ2oHvvh6bbjwfMqggKaWIW7hgBkkWRG+rWI9ivIB3RwxSKTFLRCWzh3MbaxS6V/XUpJqbgaUZ+FvYw65Cd8S8QvHDG7A+iNU0qdHv3TojEZHjzmXpdvJaSlrQyT5ya5LjCyKGAkWcpLjUwxHLBGkF+K78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622684; c=relaxed/simple;
	bh=JIuIKTH+GzYh8O8NqAoxb+Doi8Ewuu7b9VzXx/kXQ0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwsqsDE4SgYD6acrIe+QJbSV3PRfeJndUUuWEU08wpXmDubYd4ewzNS7FW4kEmRtEF5KoGrl+pJfSMETpeI7u2FnUAG18vZRDEoTxe9lg05f5D9xSuCgAOIOkIypB5Hwcgy2fUokD8so1PiCUmVHtmb0VPc3OY/yib1hVnJJdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=je1u1I/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SljtjOOA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SPrE152531
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 11:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhiCehhF6KyRk1DM1/ckSVrTa7WGu4u+Er1d5fBuqes=; b=je1u1I/1fY9eKfWw
	mXgbU5Np/+fDawyu9yI/dnCPWwQoU34RLV3BygwZoRjVlBstRQ1DKtLtvwJtw1K6
	FOylK+OdRIJA2eroWmB4I1ZP9sohZ11rvQCl0WYeHciAAiMeOgQTCWChl9kw04aR
	QgChgZ6p9pLp6JTHaCPOM2hJMxvt2dhdtfjWpBR6rjSm65Gbtt1e7DK1MjX88xP1
	djwAtOS0edvusk57FaXTWqf+6YiGAc4NZOJEmTigYbn13O7ogCwl/QTFZ5TPvQ6T
	ciRThTtn/sRnEf9XL9lJTOJpDc3W4lZzcmD8CKZfcn26BxxyxpnAVOvFIvrVqDWK
	zd7kPQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvkcrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:11:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70fadd9a3so1027985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772622682; x=1773227482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhiCehhF6KyRk1DM1/ckSVrTa7WGu4u+Er1d5fBuqes=;
        b=SljtjOOAK3SJlxEQHOu3mGKxcW0SubJ7UojKhmwueydDpqUIYHr3MgLnckBV46rZ3d
         JgKU8kqnsx7cB/EtURmjk9sFz7Vdnw3+jwxrKkTTcpNkR8n82/bpd5JYX9NWpdOEgY2e
         Ehq13KUdVVv0DHIFPv4nX6sJF2RDegupRhpM3taU1mPQyXCvYlooSVidfx9johd1c2aJ
         0aOgcVONxVqfcu2Coihwr8IfBCoLrnc6ZICF/dwcqBrvD/fsBH13QYGNOZgRMatpx8Y/
         7SwaN/I+terS+JCMc5UKPDweMo3HjgnDV6BkOKC7GVaPYhncH3PMSsMJKva2JxAqftzO
         crDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622682; x=1773227482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhiCehhF6KyRk1DM1/ckSVrTa7WGu4u+Er1d5fBuqes=;
        b=FWvSHGVzFX0qxf7n2V9G0CDW3B1hDnj6qp6zRxcRj8tQhuT3f4VvnHhk3Vtp0//tD7
         utPqXykE9EckXibMiGVlTlCaH0xlmFUrI3csTrGnKxQkMYgvYAamFhIpe7UKjAPHEBm6
         72UP3FMOfQ3OUa6BmYIwSJo/c6znwVXJTvFp7wB5Fm58mrH032kHec8EJKAQgsN48i+P
         sl1xCDmsYr82jxOL7cB5eFX2ugXJt6YqgNTmJMI/WKSEbdXSFrGLkeBGFdoj+XzCOpiI
         fkwxw0rTQ/Uf7OtuXLHlJFR0DCEJ6vYWj0H9rUOFmeVjHkiwiu09btW+koUpPAy68zJN
         vHLA==
X-Forwarded-Encrypted: i=1; AJvYcCXBsIxumPk1k/fLBzzBlixMh00NJq+KDtRRS1TjYBNcZXOhCIO0K0pW1rL3FR1HZOKhc4AA9kGF27iINh/X@vger.kernel.org
X-Gm-Message-State: AOJu0YyZZRNPp7jdqO+t82bRP0FdrQk9bqMrnSdja95gp4OKa51KeHjR
	JE8gaMZQozkfYge4owUyjS26leTHZPANcOH/HmnyR/RDsqRV8mruBMfqSTMOdRoJPYaQxr7Ai6h
	quq2RtOYYyAfwnlr/XCERdNyqbRmziprO73xgEVp5I4L0MpoWquyaK7qoXP3shEeSN7UTFbVn5/
	2S
X-Gm-Gg: ATEYQzw4MaRmTSNGzlxk/P2JgdH3OdIaEhjQLkVTnc79Im4mSRAg5ibdfVQWW3l04Ws
	7adPTtTIWmbKNnRSLiVKr8nvdcoxZ1z9Hfa5ZE/FZ6maBzkWGflhUBq2rXJwAgp/BS47XA8iFqt
	6FWvYS93pAIVQJqicOXHln/xJFPXsp4ljom1iV4HQpMPyXDtkF6aYynwfK6ANflBnGz84HmSBGA
	WRPVp+Zi4WHZ98kKDY5EEvt7Ro1fVdiN+l23DK8kHyz8b3ztPNB3Syzo74jh1LA2YBp/sYTmwuA
	bJxg3GBpVBt2rk8iUCzEfd/rbAQQHwNcH1aQ0YWE4Mr8q8oUsz190owowcGyWhCy5+WY2pPuYcT
	ACbFXg/TAOvLpGW+KwzKBUlAs8+9d3DmUY7FU+zt3lclnWqGd
X-Received: by 2002:a05:620a:1aa1:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cd5aef76a9mr181362485a.26.1772622681663;
        Wed, 04 Mar 2026 03:11:21 -0800 (PST)
X-Received: by 2002:a05:620a:1aa1:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cd5aef76a9mr181360085a.26.1772622681103;
        Wed, 04 Mar 2026 03:11:21 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4851ad25a17sm7990115e9.29.2026.03.04.03.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:11:20 -0800 (PST)
Message-ID: <263d4c1a-caa8-4870-b95b-fde7a11d2a6d@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 11:11:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] ASoC: qcom: qdapm-lpass-dai: correct the error
 message
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223180740.444311-12-srinivas.kandagatla@oss.qualcomm.com>
 <c6ceab84-899d-476a-b2d8-e57028cc91dd@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <c6ceab84-899d-476a-b2d8-e57028cc91dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4NyBTYWx0ZWRfXx5lB6Dvbmtod
 Nr+uQrYhw82TVoQn2pIlh925XAO9Vq5YWokqtRqslQ4moW4mE3K08vxILDs30PBdYYespOdZSLa
 1Has1uF2S0DhU6HYSYWy5qVyUaU+pKV25EuRN2if3zVQx67dsRee7SyyS98KbJ8dGp6EQoilEXD
 G38B4kQbUbPK+ZdBdmFsJoUet67d/cRt47HW4GlIdHDdSTV1rqdUfHBF5iFvkbRiSVqbsa+n2rO
 ZyG6nsvSLeYSJKooOWg6Thjm2mKHkNyfMcRUiAFS3f6F+6ANGg568boYy5UUIuNgTsxGAcXp4ja
 FtumMWxHIrkThZ9sjO3L6jAUj0ncCD0HH2AVQ7Kxot2TYy7fxW1kOD7l7NxRVOM2pS7um8gBhqg
 M4bVygkS7stWZLQm8xOTqXLxMxmop4rhC6q29KDEyRhL2mzBTJfQhT0KD0gju+hHGjeGe5JygQ5
 r6Vj858Y0/l8p2X94wA==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a8135a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=D-i4kdfbrcmCuYzmauAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: kbb-aKT2c-yibt0g9Q-YfytdAn_HBbvn
X-Proofpoint-ORIG-GUID: kbb-aKT2c-yibt0g9Q-YfytdAn_HBbvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040087
X-Rspamd-Queue-Id: 145D91FEC32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-95289-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/24/26 10:12 AM, Konrad Dybcio wrote:
> On 2/23/26 7:07 PM, Srinivas Kandagatla wrote:
>> Fix the error message to reflect the actual graph stop error
>> instead of graph close error.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> index f68d4b4974f3..fc246485e326 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> @@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
>>  		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
>>  		dai_data->is_port_started[dai->id] = false;
>>  		if (rc < 0)
>> -			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
>> +			dev_err(dai->dev, "fail to stop APM port (%d)\n", rc);
> 
> Might also make it "failed" while at it?
> 
Yep

--srini
> Konrad


