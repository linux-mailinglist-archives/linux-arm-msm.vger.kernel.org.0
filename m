Return-Path: <linux-arm-msm+bounces-118432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cblYK4KwUWqUHQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 04:54:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A17400E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 04:54:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AaYX6Av8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TGxcB5cv;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118432-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118432-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFB1E302570B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 02:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234992E62B3;
	Sat, 11 Jul 2026 02:54:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92F72D6E66
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 02:54:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783738482; cv=none; b=fkwrGG4LGfhDJ/KaFiP1ZOQpjPdDU+MA90WcSyFg6vF8asawj6L5+/geLb/d012mytlKpC5fOYVzA3fAjqXi9ultKaHyJgP7PY1InoencMJl64pm98AWFCC+PxOPfBtce5rfuSGT2OAG1tqHd2/XZgLrMY3CR8GRF7TVTDMlFBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783738482; c=relaxed/simple;
	bh=e+5oTDlJE3JeVGw8kwraD9BnLZNaTeaClLqHopfsvpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anNBuxzdV8f/9w8PYPqcsC34zhse/c4I8v1LyZJzXeIh67bembdJy2UFugKlOdKyST+GkUiGS39UkuFYZsAq3Jo+lzqnyhtkhv7vb6lJhzhzIolUwo5tDjPG76/m5Mp9p44sqq+4JqT98DENnKtAIK8wBbTNpLYB9wCSdIgr+d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AaYX6Av8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TGxcB5cv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66B2Bnxw2615675
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 02:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J2+OHtFXDardG1nxZZRPnKNBAxjQeEXhfcwumgbzb4g=; b=AaYX6Av8yvYvaJ0j
	PjF9y9PlI6MKxkfvv3zTMKgG/+V8mJJpEBzjezQq02SAM7+g7rL95R3YSjAtcwXW
	Y9LyPpZnfKwqZS0YxQnRhJTLU9658HJtSZEFOJpIVDqv52c2ikA9lrOM+TtxhGA9
	vzzte+HVfSHMgC/wPuT1m+UjKuxLM0vE9EdURBbXE7/Vgo1RoXk7UT2ZVD2I4UdS
	c8nnOqv9bYFWA1FZIKgoGSM+O+KN603LBw8IMKW4743bphihfb1RC8iWIkjXtP5h
	mSiGu9h1p4Xncwq2YIWKlVr1clYG48HWEczuy1mYidpNmoPvs4yrAMVQHqBcNum9
	EEUDXw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbcu6r2aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 02:54:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so175390a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 19:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783738479; x=1784343279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2+OHtFXDardG1nxZZRPnKNBAxjQeEXhfcwumgbzb4g=;
        b=TGxcB5cv8addLJROzvfzgAp5IYoOvsmXj7vq9KvTyxWDPfEQRrVpDuXygWIQMtGVbR
         eZ1oKLgadAUjVsbq7jlqN33OvBGUwjP4uV/f0JBKHxE5L5wJexH8O43OpV9zktTR9L21
         JbibRlsTDzLaZoCHYXfm2cD2ILBdHWdDfh1mKV5XXOi/U9iKEMlqvifc/rNeRzh434nL
         8kS8D+8pJaCkwuYGdmfJSkDPmOa+N81WCLjhythXBVVI6WRmx047Xd6WADyqsd3MCWMs
         ty5dpNAcQORfIYhhF4soOlLjgnzIItnhBHQgV0vhLdpSgff34ctiiAAeK/A54fAI+iiD
         rsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783738479; x=1784343279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J2+OHtFXDardG1nxZZRPnKNBAxjQeEXhfcwumgbzb4g=;
        b=SsTsgQQLxwgwHrpGRQeVY1UsZnvi0tcAfiRlZrULzisfgc4VTpV46Fb49inxldzm1J
         /4iMgPCCSu4PtZHJuFb19687/sjDFN30T3QueUDlUXhJQwPlhajClwylzMxnXfO2zOMz
         mIfPTsZElYPLmhk7D8YdRyBgGbm/ZD9dMMDz7YmQMIp3pmywpLaV4vhhOI0oWRActd6j
         jeYnpm0/+fwzG5QdlO1Gasm3c+mHePNYx338SPVDsIjUs3Glu/fAAmBf0z9MxMA6CdMn
         is0tJqDtD/llh+DzU0EldYzPOU1heFKgdRsyIWzywdZMMReCpgz44fSh+D00H9vtLHZW
         b2xA==
X-Forwarded-Encrypted: i=1; AHgh+RpXmJ3qb/s0Qjoyx0s0pGPgV7PaOeRB0hx0Ghn+A1If5Stjo62GnTowcxAzs2+uWs7IMHHFSBqAMKlhdPWn@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo08EEP/MxAl0FmEe5x1ccB1yFemLm9iO6IOj+hrCSAfsK3758
	XWgSrbJaZdApJk59m7up5QITSrjUaHY1PddC9yiKh7PqDPyUPTzPntVgjUZfGBkRHy/5JxBxQA2
	neWTeo1P8xO1q4T6Ttd1Q2hJsTQKtcURFba4IIwqEGg67L3XRMqCGfGN0gPGwKIsPN8Wg
X-Gm-Gg: AfdE7cliWzVvZHMfLXT0U1SbMeQKP90qNZ0uKE1LjxinD35OS2tzISPQS5zzCBXoLMN
	2lbwBoPqQkGvg2+o8/36XV3thuFEJmDXYGzVvBlVaXrZNXA881C/CX6qauVupwJ9AJsMMQ1Ik60
	mZsNcO+DQ4a7MpmWNZM2dlZeiKK5HFQ9LkqjUPdmUeUtCYwj3jI0lwzZ82pYz7zIhO1gRJT/GFl
	KUphTgI/Z/21J6H/LmoDs3Oacdlh61yRMCfpK9S9pHjWcHOUqIftw1OL+wH289T7C7X7fheTQx5
	mymBBbc9RZ0B0L7SPet1Q7+s+eOiXLA34GDwcjkBHKB2cNsCD/jDO3SpgRODbUmxdzFzSbwvEzE
	q7UYBbvS8I0BQTcb8c1irui/B2I4omAxNcAKxqk/R2g==
X-Received: by 2002:a05:6a20:4304:b0:3a2:f75f:73ef with SMTP id adf61e73a8af0-3c110a65ba0mr1534088637.37.1783738478728;
        Fri, 10 Jul 2026 19:54:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:4304:b0:3a2:f75f:73ef with SMTP id adf61e73a8af0-3c110a65ba0mr1534062637.37.1783738478252;
        Fri, 10 Jul 2026 19:54:38 -0700 (PDT)
Received: from [192.168.0.4] ([49.204.105.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4b97661sm11787208eec.7.2026.07.10.19.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 19:54:37 -0700 (PDT)
Message-ID: <73df1c58-39a3-4f89-8674-43fb2dc36a06@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 08:24:33 +0530
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
X-Proofpoint-GUID: v936dcwrK8in491RWsStJE5R5euvvrfF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAyNSBTYWx0ZWRfX0oyQ62OAcI6l
 TB1igwq1o8JocksMGWm2oXRDNtqyHpAkHhjXiI58fb00qeFL8kW8HiI8No1C6aSExqTALqw6e7Y
 ElvKiUKkHGm00eqn4d0MiIBtA7maN7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAyNSBTYWx0ZWRfX/NTXwMkdWnCk
 tKNlqCYH13TJX+qoNzxyhC+FnVBKKAZVTkUqdKz2XJenwpNu2eP7mizfNN9icDL/CwfMJ7fyAkX
 8HIbenhRkGZyqCE0Ou2+ClvIEW2mJ4VtOkMQZGIX2iR85T3G8bJgDjgwirvIghQjzBdO037D7Sl
 teRy0XNqVRvnm5h9OsQKZSmUapOgmcXb7zEdmTqWIiNp6qcl/hp3RlBcQKNa0aL1FOxn98GCHev
 jcxba7szqPMjcmiKOnQWrZqUY4SRogYoy5B8NVdZoUso0GtpFWtfkI0QXeRwAnA3ebLebA1QpWF
 Z96B7qq97KkqtLC5daYPnYoVKotLqNNPwqc6H0atjd8hnd4YoDzmBjP+OA3fdEQsRE8HpMNecxX
 xHIPkKHeayirc4H7T5vjrj9raEwSMHCqEIZmnW1RlNJjOcovxRB+MRf7MUMzgXaL3+v1CiVtaa3
 tneIeX/eXzfxPq63jrA==
X-Authority-Analysis: v=2.4 cv=OfGoyBTY c=1 sm=1 tr=0 ts=6a51b06f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ua2K4HyBCek8nw/sr3ra2Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=o-iBtrM1MSidxli5CHcA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: v936dcwrK8in491RWsStJE5R5euvvrfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110025
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118432-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 519A17400E9

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
Yes, you are correct but

If this header in drivers/soc/qcom/qcom-geni-se.c, how it will be access 
trace API in other drivers like i2c, spi and uart?
>
>> @@ -986,10 +997,13 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>>   					writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
>>   					dev_err(mas->dev, "Premature done. tx_rem = %d bpw%d\n",
>>   						mas->tx_rem_bytes, mas->cur_bits_per_word);
>> +					trace_geni_se_regs(se);
> SE_GENI_TX_WATERMARK_REG is one of the registers in the tracepoint,
> perhaps trace before we write to clear it?
it will be captured in m_irq register so it is not required to capture.

Thanks,

Praveen talari

