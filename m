Return-Path: <linux-arm-msm+bounces-107026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BePDwqiAmp2vAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:44:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DEC51969A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 05:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46CCA301E1C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6C73093D3;
	Tue, 12 May 2026 03:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PTQXsWZR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GT03sZ8P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF58224AF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557445; cv=none; b=VFRbl54fpwfRENYGN2Z4Q+O0kOOQ2UUW2/b16iYxwD+2YLg/LQguPntSjJl4B3SFGVJIY8X+niBe72XJyPqpVsNrFPj7697YhlQ2SPVvVkkvK6uzTZDFCqNMxDskR8WR34lsIaFemVv+EvFi2OrULB27wzAH+n5pDMrZUDYMF/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557445; c=relaxed/simple;
	bh=MZELVoEOl5tOHByAEwm/jpAsnRa0DkCTxp6FA71Z8IM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KySrYh5tepr9C3UKVGGCMw2qb0kfs3PY6n8zMb7/trAQ0uSQi787LVpVFwpmMaPl0s7NWjzEPoH9vhNlqwx/8Xcglo/uTae7N48THgvYTmwKON8g3a9i/K00wiOzQrRvD6JYXUQ5qfIvQEuoSyWxMMJ7lAOzbTJ5j/2aD9k6PF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PTQXsWZR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GT03sZ8P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK7Kon2187915
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5MzAPHv45P56jS617vj7sEIThlNMPest0Xa3Ik6/Stg=; b=PTQXsWZRN7ZthNlH
	RmowvZOdSRBaNPPdCii1AfYT6pWZ4qTBBSiVziIZaCeXcIn2oS1nmz8KhX9OLyp/
	w1GLefI/dBVtCYOt3+UGePQYqQqo8nWSibDKbeZrwWNGBNfO3BTNYMsF7ZzxxQP2
	nBIwtCxny6t+ylNX1heNluqGXtKlelEGL9+8888hGhfxvnNYZyRlvDLhwZ8kgdyo
	/YX972Ad132+pJ1bwMGR9Ts7IDp8NUJhhzElDpTR0LTO+yd8tNGqhFb5ViGC9c0Z
	Mg5kIh79PrXn0TaP3YEFuv+FunxFAwi5/LGrhTPyuff+Kny70TfUfCQAlTL5KfPO
	ERihWA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv29aas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:44:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fded513994so5382681eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 20:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778557441; x=1779162241; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5MzAPHv45P56jS617vj7sEIThlNMPest0Xa3Ik6/Stg=;
        b=GT03sZ8Pp7W6iFRjLa9YzV5Lu/NdQ8MKluVpTb8Cazzm3J1sRaogGxshj1GurzcYf+
         ydSvzn37eTsW0POzKk/tQqvDjPkqB91Sgz6lX/dcUw1JRDH4KII50ilvIhEvczLrCrow
         W6V0SQTsY7Yxh/PNkqRtTH38dtd+JJIiaFFpr+2shbDWG9bmazqEf5H+v49UdPSkdB5L
         k8UvWbR1s2+6QFYKO3qhr/f4H3jKfpFl2vc09KpGPdvoeHuGvmU+8845jPAwXAQx3eVn
         ZpPZyYg3TW7VbELTCho4+5navYrVoAy1WXv3GgK9mNYJDckzIabVHyOuVXeqlCNqHhmz
         GdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557441; x=1779162241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MzAPHv45P56jS617vj7sEIThlNMPest0Xa3Ik6/Stg=;
        b=jy75gft1hs4du/j+QVNNVZe0rnQRhedgCy0cngzqluqRSqgPs7oSsz78XzeV634wV8
         pehF+CYv0JLccn4IyLPY8Qbtbele1gFVZSaCPN667oJ11yrM0FCDjMwsILI//VahgEk9
         yni9GMM++eyob6PbkQg5bQBxhPVOMFVXA7W5rwRbtMbsfCyJRqx2xu6+m2en/rxozYU5
         KbQc18Fc0MMqSy89HZFEaZURNapBWEozLavVF0jv4o58iLkzjLwfQFNL7UBl8b2xIahw
         ChJUjTBqGqTbzhaV61SiFUZ2mQbdCurlLVtS5+X68miBzUe35P26WJXbFgYOJ+m0uiG/
         rjxw==
X-Forwarded-Encrypted: i=1; AFNElJ+NrsL1YJ8j5l5atzTO0PzBw4UlalzJHisxeEN3SZ3EElTG/OtBsRkd3g/QAtIaJHQb9YNW366REiBjJJVh@vger.kernel.org
X-Gm-Message-State: AOJu0YzIuzZe49p1GhXw2Zdv1q9kaCGQj0vjrj7+GxrC83NMvY+wiITB
	i5IIqL1a43xgY+5Dow33ZKujcuWfhIvzk71aG9nJnUWzrn5vs5CPvfBF13yGNsls5p2sNdkA3l9
	/qB57U3PhgYVLKSwQAyUFC0xhY5tDhzW81uYyQgjIXAfdgJYEcKkkxw03y9IIBDYhtJ1i
X-Gm-Gg: Acq92OFrvJAdkketFX6ycaU2q+r63xIkJGAE5I2jPNYmjmPsAsHImGrVsTDIo0yYDmz
	lKvVDSEmMaie154rvfBWS1S1iwXBkW7vw4dogLFLUuaj0CDw0M3zBHRJrai1kzt6ps7AWwUmUwQ
	BpaeuKfmMOMrK7HJJwDK4zCVIyFRhU6JsJMMtqnDddZxfv4H6EeWWQvAq07wctZFR25Oq6PJzmQ
	ED1Rp6BPbjjYTGIYD4FwNxIOsBUmiQcUHeShMDAeQ4PzbFjyhBa91yy0EkmfePH0sJa172oIvuc
	vyTlAWYammIOmzfgnD7xOMelZB26u35RlwnE5GUMSMtWM0jaVFIIdrza2Y8aNVoIlkrY/lT1h6m
	z6CCnN8AnFUMvvA49INiB2ObX8E2LjQDe135cYv+RMwKfUEVIWoPK
X-Received: by 2002:a05:7300:3b08:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2f54d15fe7amr12704125eec.25.1778557440912;
        Mon, 11 May 2026 20:44:00 -0700 (PDT)
X-Received: by 2002:a05:7300:3b08:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2f54d15fe7amr12704099eec.25.1778557440351;
        Mon, 11 May 2026 20:44:00 -0700 (PDT)
Received: from [10.92.208.73] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm15873980eec.11.2026.05.11.20.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 20:43:59 -0700 (PDT)
Message-ID: <4c8318a2-2e2c-40f2-882d-8748f1bbb303@oss.qualcomm.com>
Date: Tue, 12 May 2026 09:13:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        MukeshKumarSavaliyamukesh.savaliya@oss.qualcomm.com,
        AniketRandiveaniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
 <afvkiT50ZUEXZ-YO@sirena.co.uk>
 <e4651363-7c1c-4ae0-a97b-b64841424c83@oss.qualcomm.com>
 <afxJmZ9MkP5eJkQC@sirena.co.uk>
 <59e36f20-891d-4a58-8cc4-6822d03daa23@oss.qualcomm.com>
 <af3spostNgoRU0Vv@sirena.co.uk>
 <4d90b061-95ab-40d4-83d2-13425e992d4d@oss.qualcomm.com>
 <agB8AgF3qVqDw60Z@sirena.co.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <agB8AgF3qVqDw60Z@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Fnw_cxRusHYZB9dJJUTukrIn1vjVEwTN
X-Authority-Analysis: v=2.4 cv=CeM4Irrl c=1 sm=1 tr=0 ts=6a02a202 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=BLhwAGxgQewik7T9gzMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzMSBTYWx0ZWRfXzZiK/jP8LzB7
 xFH6xpVg0xweDScKUJBhUoQBiElH8+QMbuVpkZSbz7yGhPP7z0AYsbZ5ezyKDnIwBYDO4YHFlLn
 LyVslj+yM0tR/3YEny8KQRiLSXpmoM9IjxYYy7VD4rsX7ectI3aQ8/4kSmAAHQ1mEV6DnXv+VSc
 6vCv4qYYe11d8IXs+NA7MKIWKsS/YcfvzdzziU9SQpKrMgjWU75I+dGseE2lPs2ImLYa0tfncAq
 frddngJKsez/j9acvcDrYS5IssyfVxm0aQdnT0n43xL4qy/Sju/QFlDnJLAkPWPB3lLvPe5YjLs
 qh9NLh6cgvva8j9yzCMSmZwSd+YznIxtIAcC2Zn8zWYbAngRvRDux633s5T5P1bbqDxj5StmtTS
 DV12EgIhmW/nP6qwsz7EtrjhkVvTd8FpdXmcHLY9nujk1+I4xHqMFu6dbPtl5e/OxyYSYzOFKwa
 ff6Rs3afZBFeotYc/TA==
X-Proofpoint-GUID: Fnw_cxRusHYZB9dJJUTukrIn1vjVEwTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120031
X-Rspamd-Queue-Id: 52DEC51969A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-107026-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Mark,

On 10-05-2026 18:07, Mark Brown wrote:
> On Sat, May 09, 2026 at 07:37:26AM +0530, Praveen Talari wrote:
>
>> Could you also please review the changes made in spi.c ?
>> I would appreciate any feedback or suggestions you may have.
> Please just sumbmit normal patches instead of sending partial patches in
> reply to another thread unless something is really unclear.
>
>> @@ -1658,6 +1658,11 @@ static int spi_transfer_one_message(struct
>> spi_controller *ctlr,
>>
>>                  trace_spi_transfer_stop(msg, xfer);
>>
>> +               if (spi_valid_txbuf(msg, xfer))
>> +                       trace_spi_tx_data(msg->spi, xfer->tx_buf,
>> xfer->len);
>> +               if (spi_valid_rxbuf(msg, xfer))
>> +                       trace_spi_rx_data(msg->spi, xfer->rx_buf,
>> xfer->len);
> It feels like it'd be more helpful to log the transmit data before we do
> the send.
I can see that TX/RX data tracepoints are already present in the core 
layer, so I will drop the TX/RX data tracepoints from this series. I 
will update the patch set accordingly.

trace log from spi.c:

spi_transfer_start: spi16.0 00000000631b0da2 len=16 
tx=[d8-07-1f-c4-b3-b3-07-d6-a8-7b-33-6f-7b-bb-ae-9b] 
rx=[d8-07-1f-c4-b3-b3-07-d6-a8-7b-33-6f-7b-bb-ae-9b

Thanks,

Praveen Talari


