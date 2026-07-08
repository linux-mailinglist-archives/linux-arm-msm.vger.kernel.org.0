Return-Path: <linux-arm-msm+bounces-117576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C+vmEZAjTmqyDwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:16:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5272425C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 12:16:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KVkjqRco;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HfkMJBiv;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117576-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117576-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20BDC30376A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 10:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FD2038C2DE;
	Wed,  8 Jul 2026 10:06:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151D238C2D4
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 10:06:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505208; cv=none; b=g63Wh4sb1tOFDi9LAxIfIoF00pBVAcdHvRP4sN/CHjj877KA8HaLTzB9rPe1gpX0U2Zogas5z9dmoGqA3NR2U1YQvI4FsNaBO7IWGbnEsvnoQPv6O0XMXYZYxolmsdo2VXGqDoKYWJuf1u95UcorJ1d6MlgV167SHSXTh8z1DIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505208; c=relaxed/simple;
	bh=EoXA71ibmjqOvkjzzpn8D9oPOeu2IQ1QWWUCUKERV9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PTywFVWwjumzFTDJ5OCYfBwBLIaf3apBDrfsit0fD64i3LzdGdIHUzg4r8GCn2aY5C234/ZoBsR8GRHTvar2AE5SNUT0tK+qqMjXkdfqx2OmF1rpup8stmMQ0gZAoUl+IxBuFyMRmP2/Z5o24a8zmhVji/cMCDFzHKM9znpJ7e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVkjqRco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HfkMJBiv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668896qp2258471
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 10:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RKyVHN/hTdPLVDp/F78lAoGgPhhbNMc9fh34edmUY8g=; b=KVkjqRco+xZ5SIER
	XguwaPQhCE7knmso+6amahyT25hzdC6R4Ei4ojBOrvDSt5ElGa5+5RBTdL8GQnE8
	M8prhmMyVJaesmiAwzXv8eS3OKJVA3o6U1/KG6r/eVyITIbuoR2Cwh8QBapVx8M8
	tgHGudz8IiapIFDSf3FWkGGWWHw+JRG2ouNOF6Mp6FmaZ7XUxAChgQyAzvC1jaay
	Y9xNZIyl8ChxrVg8fbGyHkreHsewTLf1xACEJMoeZF+/QJQ43lCLLqYPMCTF/9s3
	qkkq1WAhmFe4elYmvZ9bkmLKIQVDo0bVgiGhAZATT1/DH+sjlvQ7dh6YzYpB/J5K
	o3Tdfg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw9uy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 10:06:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso11058165ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 03:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783505204; x=1784110004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RKyVHN/hTdPLVDp/F78lAoGgPhhbNMc9fh34edmUY8g=;
        b=HfkMJBivbQYs4ALMNdt1SqhVM/WDZuqeKDguyGwtuMDg4EmoB2pD6ybbTI9RaKVxxk
         /8Ne8K6V9YGAAy7oeNt6yeBc4x2amB36PVrd2QUbVLX7j+PGtjep6lB2lcwp5n6VAGnr
         n4WBX+vuoe+5mqn+9+QMoUcTSm2XjIiD1UDPO904VAWQhEffX/aH3/ubtYxobjO6WDhR
         vXXgaFsWC+hQ7oEUWfo5WZtVh0XqbEwrxdE5EcXSSsZAGtpntBtWi8Y9VFq+McZdjUwI
         oF/EkbS1CBz9WgE+/L4K9wBIukSkc/PSRtsc8stLmXV9Dy+vauSbfBgXY4MNS7bCr7+1
         AnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783505204; x=1784110004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKyVHN/hTdPLVDp/F78lAoGgPhhbNMc9fh34edmUY8g=;
        b=cOfweurEL/jtJHAnGK8hvdpddDDLfL8fItt8M/jwD1MEd1BnXNcfe1BPjRdsN3McoV
         Uvz6dVVgmpEf/phYTTOkqqZ0U5M8PxtwjZll+mQxaBDBs3bpKt+FZDmweilDCkH15GqN
         c6mvnvOPzgb1EquYKHYqG8/S32YoLgQvNTKrPf/LDpLDeCgdphY6etjNsl9glQpI+Gic
         QMEus5AsfsNnJ9heBdDt01rwCjmOcarwciePxQcrkJAOid/SiN4nxrPaPZcD0xQBeSJW
         J7Bfj9CeckZhieguroZ/ualiHZYJfOu8HAtraxJUdACI5Try1Ul6/XpX/o9miqDjVtrX
         +Zxw==
X-Forwarded-Encrypted: i=1; AHgh+RppzoSd0an8pn3fvQU5hdtI1V/Nn9DMo8+IrBYn2FHFRkJp2mAspyaakl5OjSr/H1tTHuKrvPxD2VJ/VakE@vger.kernel.org
X-Gm-Message-State: AOJu0YzqZCIGnu1W2exZz5/FeAxbZewDjser6dUYQAmj4e9wNqFBRFCi
	q4+Y3+g5tX57TLZgMgYG7qkmnyE76H85vs2UHIHUPun2E3qIMtib/YyEQKRVWf92biAfH+JdoGB
	ONm7K5DiCaFxn2FA+EfP88Psu7t/5K5wgRglZ0uMgAepWIguCyH3uiTQXQZOU3u7a8cYP
X-Gm-Gg: AfdE7ckLjORwHzCCiAXCdhQDYoxs+YjzsvLhnIhOb/GHx00BpYOadP970ethe+oC/JE
	W+T6VLw+IPuX7ojCaXlRDFNY+Hfg9Mhbx9FvgsY2TTA2rUbGuNsT3UBc3oSW001W6kGabRT4Ysc
	3Y/VAAL9FnN7HrVp51q5AoSvMP0nG4Lxbh6zttfEU5hYIIUb78QphHx7fqMK7iRGYmjpkUywUWd
	/K6AQbrozjGfmqCqbS+A90Hhj00APhtOckVYoJ43X95lP1YL/tLGD6NH5ayYa0sLw4vj8JIs1zi
	kKLXUmOmBSNfy1xaYfSA/Dj1BUoT1JH9ypea7h1qgfJatJWMGxFdGUK5IJj2rNwduixGBhvpD8g
	MeZrQt38KkKw99n7rUoIJ7xBwxSalYfcD4nt9bwLR3F/p
X-Received: by 2002:a17:902:daca:b0:2ca:c4a5:84bb with SMTP id d9443c01a7336-2ccea3a737fmr19597815ad.38.1783505203764;
        Wed, 08 Jul 2026 03:06:43 -0700 (PDT)
X-Received: by 2002:a17:902:daca:b0:2ca:c4a5:84bb with SMTP id d9443c01a7336-2ccea3a737fmr19597365ad.38.1783505203310;
        Wed, 08 Jul 2026 03:06:43 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm25704505ad.31.2026.07.08.03.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 03:06:42 -0700 (PDT)
Message-ID: <7bf2e909-211b-47d5-9c95-fb1ebf917dc9@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:36:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] spi: qcom-geni: add GENI SE registers trace event on
 error paths
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Steven Rostedt
 <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260706-add-tracepoints-for-se-reg-dump-v1-0-48bd08e28cf2@oss.qualcomm.com>
 <20260706-add-tracepoints-for-se-reg-dump-v1-2-48bd08e28cf2@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260706-add-tracepoints-for-se-reg-dump-v1-2-48bd08e28cf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jXy9I_S9XPEb2Rqeie4mv5sW3klgcL0Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NyBTYWx0ZWRfXz+3kL13Szcm5
 Sb8hER/YzREByibcr+yVgQNfprA0z6hxNHoIeJdqqUZaIRE06bztS10IJEtqrlFlCtuKt3crfbr
 Pj5wusJxdPYVH6qIvC1O1mgP6HwC8/o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NyBTYWx0ZWRfX+h+gR9PmLbJq
 V8nriFRkpbaoAh/WnrvWPscaFmPl39ls2/rxag2SpvLSFkso+E56AiH067NUvBBva3DW0Mgg1xH
 K2l1k4J1K7WErPCbDHIR5Yy8YgCagEsyFbXEe93W3fXy0r4mIB+s46IsrbpfqdRfj45qMqzRsMn
 Z4FTLbcNsrrMenK1jxnI1h133W2oX3EzzlpYjv0WxgGt49BoyO9i3F47FYMeyKD4gROqiF9qCSq
 +Gqb0v1ypc6Rq9GMhL+/U6sHw8IwA9K/OhqMKs6Ta6q0FrFbZEQu4eCLyJXgegBjmXrys02sqrY
 b5PrhvMxA2UQGNk8mXATBoCZGngFIgNvhSvf2NYTUmL5LpEY1MnjG6YJa/pg46swEBMb6qS/5NA
 Udu4C46kK2DRbCikM1TOWJJs+ZpTLLDF7+JxOyLLqavIXhiAnxq2aaFbO+kr7Orp9jAEog0zo9J
 CZoqmNouFBT1o0k9bSw==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e2134 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wRhyhPH_MPSplg4SnB4A:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jXy9I_S9XPEb2Rqeie4mv5sW3klgcL0Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117576-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71F5272425C



On 7/6/2026 4:38 PM, Praveen Talari wrote:
> The GENI SPI driver reports various transfer failures such as command
> timeouts, DMA reset timeouts, DMA transaction errors, and unexpected
> interrupt conditions. However, diagnosing the root cause of these
> failures is difficult as the hardware state is not captured when the
> error occurs.
> 
> Add trace_geni_se_regs() calls at critical SPI error handling paths to
> automatically capture GENI serial engine debug registers when failures
> are detected. This includes:
> 
> - M_CMD abort/cancel timeout
> - DMA TX/RX FSM reset timeout
> - DMA transaction failures and pending residue conditions
> - Unexpected interrupt error status
> - Premature transfer completion with pending TX/RX data
> 
> Dumping the SE debug registers at the time of failure provides
> additional hardware context and significantly improves post-mortem
> analysis of SPI transfer issues without affecting normal operation.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/spi/spi-geni-qcom.c | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
> 

Acked-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

