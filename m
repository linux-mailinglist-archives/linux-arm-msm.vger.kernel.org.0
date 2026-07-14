Return-Path: <linux-arm-msm+bounces-119060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q7kgDwlXVmqj3gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:34:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B075679F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 17:34:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SSF8tryj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="WJBI5x/t";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119060-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119060-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37EB7303F999
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 15:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B908444716;
	Tue, 14 Jul 2026 15:34:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EA23B9D83
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:34:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043267; cv=none; b=nXMS0uu4GA6oQXZez0hXKRGI3piEfoYvhhH+vWyQKQ1Qnvbx+wvs82CjvWiEVXyXyvzRwk84j0Qr8siq7Ohg2Pex2C+Tdk9puJkXyobeh2t0M7x8dn2DIlUmSlhJ+eYiayje0s/Qv4YPit4IF7VYDktuMqM86cZJlHWyop8aw5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043267; c=relaxed/simple;
	bh=0r0JNOoHNbWlCuhfm9OucnKnlLuGPVOqCDsXMshhENo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToJI4A/Uf5+TFqSAqqBiubM+Ni42VRFI1sO/GTDwl9l/0+T7zrXBYsPU0TrzBMNC7PfEZkcrNW72QZ6iJSkfYwc3JFKNWErj0pv/Z61sOtYqzDYrhQoAsLnff4MqQLfIQidugoADhJ7sCxGYtAfnjZDMLyTTyux5rDWJOerOGlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SSF8tryj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJBI5x/t; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EEcWA2648491
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGpsLT9I5vT3mdvWKpIvDp+nCgXQYoSoxh3a19izebI=; b=SSF8tryjkwNsNHT9
	AvLvTW/kq2G9Nogm8hgny+FvxnXjygS8UdCUzfwVlVWV3gu2cGzV/pC/r+m8wJGR
	mtjs9qPoVpuWymGecs6xTTznOqaVUvr/cy5eSW3YOiyBlgccqnvHfk/wTDL8qhps
	C1oc/dIHdWOmZ2AOwZy1PBXUsIe1Ab6hFryzwkqJdZaRY1sZCmoop+lifHlXGyxn
	LqYhrm9a6aLTlaikQaohYeyQqxZqLyVf1y7o58A8eCg4Hlys9YYyb4zrtsagkDN7
	f3Isz3StRIg8bd3sGZMrlMvjTytMvs5LiTM5MRVMKGucesQMZd25Nd/bE5j9wPpj
	BOULKA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmkk0ycn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:34:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1052393a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784043264; x=1784648064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGpsLT9I5vT3mdvWKpIvDp+nCgXQYoSoxh3a19izebI=;
        b=WJBI5x/tAQ6XOaJncBQnDzLikSi/BQ8BVG1BnwCB+yY11v1rBccAPlHcucwVL8m2VS
         sAfbEtM5R0+XizcI6p7V2hyOOXvurje4ffesH9+R0Vtbql1YRyBlaPkZ2VocAA1vhZmU
         7ENWQUIuSQCAWyb+oXExXVeeHL3nbzSH5SOe9ozgS6XZwJoiOd4M78j49gRDyn96+HWT
         2HLgVra+DEth8kye2vOUrXMwTSzsOIwshGN1uA8m4w07J0WzQ7X4aDZPe7Mz5K0Amizq
         UvAprJjXobOzzaWTVwOHK+CFNs7zrDl+75vcm+/3TZvyYu/qyp9pT7XYul3L/eT5r8SA
         qqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784043264; x=1784648064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGpsLT9I5vT3mdvWKpIvDp+nCgXQYoSoxh3a19izebI=;
        b=R1rP9hXr9HCFMs5ujj2ptHMm/AQuIFwQ5l2FOzKl9frHJ0VLG4mTdefVVEOeKgvvpe
         rB6WGBkRf40OxNjnHqy/neGZqtpuj9HqfgAqMf8GFo/Sg/N6WYS8ZJTxYVO4836NcKcV
         noO+QlfFNeMkszGUCAJtxnixE2PXCiLW8UtzyKay95P2oSNR12LOrGVzWtQJDBcpcokr
         z9LqPUMHj7/txOQfnfiK3biSJDGo+V/22TBK4h24u58luCACsMlzi6t1Bzb3fkTvO2h5
         aeV5n/rGq+QfBebmk3FaxX8DmYDC+NfjJG9Ce962T1L/mi4ItenVA/36IechoAwfIm6Q
         s1gA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2P+YyvSUDkqAzN8pO6TTfItxt33nz4E/9lfoGi51knTI0eDIfkbrX/Eyok2Lr+YirSLUJPIszaa4p3Veg@vger.kernel.org
X-Gm-Message-State: AOJu0YwpiJ2OQT8xwH2kZVlYS9l5AQaeOP4EvIXg2AYIhIJJJMyOdD4P
	/bVp0/F5R0byxhsAK9BNOuW2v7zhQkX0h5RiwPP2yl7qSQoqZS7ik1nk1OshUzpWHUiFhcKGVwx
	ORcZH//V+cQDT6AqUmH8lXHwa/p4W4UKnlKs+KnxetcaZBUy6z4wg/YOBw1e5dwKwi27M
X-Gm-Gg: AfdE7ckTVozPxAxIvdcXw6Buz8q39p/hQpGGCE44nYkm1FxCuvAOKHbcz3Ol9dh3gA9
	tHDxQmgiLxm058YDSiFwJmWl/6EDs5IcPyADpOHg7aD6kg1LG8nwuNmoksYuTXAiqvBlUtp6ql3
	1m9Z/NQYjOmcRyUzYUIc4FnhEdzea2LTFI0LkBYR54MVVqSlkb6SHu/xwfk2mshwfRkbTsQUA3Q
	FcjxgUMYCXD6F42fY5CVBNftfcPqVoDID4tMK38x9FnCzkK+JSpI1U3I8hj3OgFs2Hkqc6q2Rz/
	QEowJUo1bUtBbfpAXAJOFTzCdatipS+pUiObQVrOAm40pRaZMt7O0Fo55LAnFpu6c7rrofSzL7i
	nLZr0HpGtxMWVpJ8GsBkvaKl6/MYVSRAYta5yILWF9A==
X-Received: by 2002:a05:6a21:b8d:b0:3c0:9c19:659a with SMTP id adf61e73a8af0-3c110b7b9f2mr15857531637.66.1784043264026;
        Tue, 14 Jul 2026 08:34:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:b8d:b0:3c0:9c19:659a with SMTP id adf61e73a8af0-3c110b7b9f2mr15857483637.66.1784043263511;
        Tue, 14 Jul 2026 08:34:23 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.105.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm98267315eec.14.2026.07.14.08.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 08:34:22 -0700 (PDT)
Message-ID: <ec43ecce-9029-4d52-b8e2-f634840eba11@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 21:04:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] spi: qcom-geni: add GENI SE registers trace event
 on error paths
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steven Rostedt
 <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260711-add-tracepoints-for-se-reg-dump-v2-0-ca1e9ba62359@oss.qualcomm.com>
 <20260711-add-tracepoints-for-se-reg-dump-v2-2-ca1e9ba62359@oss.qualcomm.com>
 <cc4797fa-6911-45a3-8775-69c2ef32a338@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <cc4797fa-6911-45a3-8775-69c2ef32a338@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jsmJDjYNINcQOVpoqO2_vSn-Dvyruw8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE2MiBTYWx0ZWRfX+q88RxWfBrQS
 FZ/4S7v7GiN/a3bV2RD2cqUQb19HSWY0tek82IeDSoiZy0wgt26+bOweiXI4U/s1cTLze+0Ll7y
 SCgiekju13JXrJHjusumJsNcL+Fre96VY0HhgcFV5ywvPWLQu/mHuyhenKahXNx+UYb9fG26M+V
 RvMVKKfFMjXBSyDrutiMA2MISSDDNl5xpBuzOuV3uSZhUxwEiuXTpt8M6VFeYOWXyr7j63Mcq1W
 LtxRmziLCnNHTPbXzKWb07GmEMTDIC3xplVSuxvJa4/+n8hXzMCpp69Q3nXdimmK/9a7Z6Sbuen
 pEb5OIPcGfN+PdO2eHPYHqrLF/DJou0QY8bmSL4Yyoy/Ki08/PYPyP6lJo9EZ4D5bAhlMfW0zS+
 K45Pg1Mj+5fMDBs4Iw8YAGkqsZhvEBd9cWFW2JFmQldo16SJyIEm0RW0HAs3UO8/MCpdc1qAHHb
 wRluqW0gqPxCyYF4p1A==
X-Authority-Analysis: v=2.4 cv=NszhtcdJ c=1 sm=1 tr=0 ts=6a565701 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ua2K4HyBCek8nw/sr3ra2Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=o-iBtrM1MSidxli5CHcA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: jsmJDjYNINcQOVpoqO2_vSn-Dvyruw8n
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE2MiBTYWx0ZWRfXzeCDQqZL+B1W
 UDs3S++nNPqxyd8bW7pNiLDoDSOg0xLXdEJ1BtQUMGj7zvUTcdq3vJxKMGp7ZA0pZiUwS3pvEiU
 zxANLD7Cv/0VWfMnN+zDHlUhixNacPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140162
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119060-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 996B075679F

Hi Mark,

On 11-07-2026 02:56, Mark Brown wrote:
> On Sat, Jul 11, 2026 at 12:18:42AM +0530, Praveen Talari wrote:
>
>> The GENI SPI driver reports various transfer failures such as command
>> timeouts, DMA reset timeouts, DMA transaction errors, and unexpected
>> interrupt conditions. However, diagnosing the root cause of these
>> failures is difficult as the hardware state is not captured when the
>> error occurs.
>> +#include <trace/events/qcom_geni_se.h>
> Should this be in rivers/soc/qcom/qcom-geni-se.c (and the first patch?)
> - that way if another driver starts using them we won't multiply define
> the tracepoints.
>
>> @@ -986,10 +997,13 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>>   					writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
>>   					dev_err(mas->dev, "Premature done. tx_rem = %d bpw%d\n",
>>   						mas->tx_rem_bytes, mas->cur_bits_per_word);
>> +					trace_geni_se_regs(se);
> SE_GENI_TX_WATERMARK_REG is one of the registers in the tracepoint,
> perhaps trace before we write to clear it?

I got you now.

Yes you are correct, its better trace before clearing it.
Will update in next patch.

Thanks,

Praveen Talari


