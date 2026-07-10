Return-Path: <linux-arm-msm+bounces-118256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MsvkKc3ZUGod6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:38:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 406CD73A550
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:38:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OKXnjau2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VoVzLQvy;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118256-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118256-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68B6630368DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4226841F7C0;
	Fri, 10 Jul 2026 11:37:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E6D4229BC
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:37:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683441; cv=none; b=CtsKQXYKnk34HSus3QRgskOTl9pfevZNWvoJ47kbHuLOM8oxhgG+rF4AOt/il753U1rch9xHytNrW5lRaCkNcCELZQ9eMa5yh6JY+rOI8fS3wxBMN5491TwHNq2UoFsCSuM6fYPF3NVzEsTD27Pl6FEXHiO9cxisbRGmLkNGv98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683441; c=relaxed/simple;
	bh=NKNAUXcwP6pv7fxKpjJQQinyKR34mhn8fdPE2GbAtZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rz8ws8R64c12oCzwHpXZpC1Bqa6E/OY+8rSwBE89SmP5ZKsAJ0MZbTUvK5fCqhEcz/k2DDv2DOM1ZuNPiqhf1E4jj3DKanaNP52AGdHvNBBl495HOXHA6IdTucdKcNpycMNbJ4a/fwZiEyqTuAqhvPb2q/xkSWf9BjiIL5jLNNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OKXnjau2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VoVzLQvy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAn8Pe429534
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xIbB/rIZz3qHMIAEcV7pGTL9ewpaG2D2x5j/gm5fM0=; b=OKXnjau2YedjSBp3
	UuX+xdunvyN7Qvws7U/u/5+TSIACGakQFqHDGUIu+e/xkHpRAZgJ80f7kb5tIEga
	15p6uek5i+x5hlkO/Xex5hRKuKJKLxxC6DmnnIJekJ43eQ3hYxn31wdoE2xeHFT9
	DVd2RNqbTKyGUy9ljCOJlHUEDzyfDg1W+7jJxp9Wqxp4StHXgBIqG3I6eM2YNeYe
	QLcbXqp0f2B/+SgjnQ3unxIN6GBsgHmi+otE2jeQKFRm/B1c2PSa/wsqKywtNWQb
	K9Trs5Q9ujaHRn4SibhTBJUsPfohwOWkuYeGWFPkBH7uMNh8CFdyxjegdLIJVIzp
	Wm7nzQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24v1qg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 11:37:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84870e7f498so1057915b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 04:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783683426; x=1784288226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7xIbB/rIZz3qHMIAEcV7pGTL9ewpaG2D2x5j/gm5fM0=;
        b=VoVzLQvyWMBAdSKdb+3QQZHDZBzWu/dd69RgDcnWF2fut0UX4GyZBYdBcmRH6ZynJ6
         YY9UgqseXwX9BFxPJc8Y0If/u9VJYiAIGeegXj0gMqrI7Q0Zh5gTqB4bNmdaNCdZGcPn
         hyZSMDCsHHV4Syw1PrR1gBJ8fd07JJXrKqxnGb4M30XWasnlstj/LgRQKOrGGHwjremU
         0170XxKRiFwJmIDaG2Hp4P104Y1s0TJc0tyZo//IEho+oFaXneLpF97Ve4zTukHZ3Pyr
         vFqaxgV9qZ2BUPsfrBwxmjC8UcZMmkjv320nhjEtcV8E1qB1eZY344j90hfIQvgKXuTc
         cSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783683426; x=1784288226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7xIbB/rIZz3qHMIAEcV7pGTL9ewpaG2D2x5j/gm5fM0=;
        b=UBBod7ik6dTvZmtluslfl5DdLcCkrACKdQs2Pf/QnC9L2oXGd8moSYBeJSABTWyZG1
         PiChEa6GTW+iR+K0oNKA0CfdeCmj3nsd34IX+rEEWAITZra5yyGIsnX9A+GH+kVKxK+H
         sLiyWhA7MD74/4+nrZWiadTIsox1BtNG7b5mw9cUaBzW4XQZrbP1Zf+tSKfr9HmSWXeA
         755s847QHTDdRwrwOPiMRL1K1yZinGvDAx0jns5HIjEFvXDdTmRqNjvqtfMbC3kx0gB2
         IMXN46H9DGTZ2b3r8FATFDUF8AcSz6MJ+Z20iYckA1uDc1l4+RElH1wsnGPrknMUfQQG
         QNtQ==
X-Gm-Message-State: AOJu0YwuMW6i314tBIBaLD9rEy0tuGDOWHcv+h7swk51xC1j78095TMz
	ZiH10bZHCt+iFNcQ0RX5zI1+Fc1rjXwsHjxbKM1A1bPskNFmaRG8ijK77tajkR8/mbs60YvtIJO
	u1lD5ZUQ2hthJDh9/A1dq4V/kPUjHJJkTlwCZjCbUr4EKQOYfsJA5Irtm7+isQ9aHPiz9
X-Gm-Gg: AfdE7cnD3OU7FXdeuE7KcFf59sOSPQ4BEekbaJ4ezmMsKHrRBPcSb+VO7YOYPqQPK1j
	PB0Tz5jwB6MHyYgqVlDw5D95JWF7RcmZYekHypauUSxr5yUj5L3m6zpeU6vwOQzZkR9C4TMdBgh
	XzA2AewDtmM7n6r7EFfjoV/pqCSpdDKVV3QNsc7bV/4B8cCJC/KgC7ZQ6eASYinNV4ze3gH1OrH
	QOCD3tl9aAqi4STYogK6cWiEaWSJC3AVhPmwZQi4w8dDqa0VjqOm1xj8Fefy5kFAdbd3NbGc1jU
	BY9/5IvnuqtMWKQQcthakK1FDD1GtkMnFf7CRez8V9vlPMp5wtMwlA2FqLJn8yD5KyeQB+I//CE
	rLodpWLSJOu3zf7GHhKrM4d+XlTLsaLi3COYeRHawo/O0
X-Received: by 2002:a05:6a00:1708:b0:848:79af:8b2a with SMTP id d2e1a72fcca58-84879af8f62mr1764498b3a.27.1783683425164;
        Fri, 10 Jul 2026 04:37:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:1708:b0:848:79af:8b2a with SMTP id d2e1a72fcca58-84879af8f62mr1764474b3a.27.1783683424646;
        Fri, 10 Jul 2026 04:37:04 -0700 (PDT)
Received: from [10.217.219.87] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84880a4abf1sm302906b3a.16.2026.07.10.04.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:37:04 -0700 (PDT)
Message-ID: <1ff522f6-88cb-428a-91c2-5f7f9fc9929d@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 17:06:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] i2c: qcom-geni: distinguish address-phase and
 data-phase NACK
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
References: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-0-1db178c695bb@oss.qualcomm.com>
 <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-3-1db178c695bb@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260709-fix_cancel_sequence_on_failure_for_i2c-v2-3-1db178c695bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0iHGtYI5gOZ8q2ZJq_TvMNfc2VU53OjF
X-Proofpoint-ORIG-GUID: 0iHGtYI5gOZ8q2ZJq_TvMNfc2VU53OjF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDExNCBTYWx0ZWRfX78toCN8Ob7Sc
 jONgGuAB7ujZT4+WKzFSboWoIxizkiC65s+bCtNeIe9uhb5WDYR0j7DnVByMdgIOQIfB5d3q1Je
 dtGRuYsq4jNFo4qum7j5Q7MuuJESKUo=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50d962 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QTIInl-oKmcOnA4cS_cA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDExNCBTYWx0ZWRfXxjVhKuf+zgt0
 IQ7puEfnVitOWME5VRTtBfhRwMZkaOU5+/EaP69HzpnuDNv36Xo/3dF2EUy0otL2ci8Rk/FEIuX
 NBwVXeYkpeCtA6tv3hPwkLpS3/ozCpQGWfsYf+kr+pDofgNcu9iZb1NsrfyWMcaj1ttAw+OLKEc
 ThheQPDj4EDSIidr4z4LfKfT15V09gAECLXYuWupVaemEtxrDacOK8Sjr3EjoAuP/5AJ9N8v4WX
 JhXgP0oUKuCLZtLOp/aJNWQh1lXU9JA/rcB0jLPUiGGf7e7OX9BoulEfeCVPJgzjQ5euf15H7Ky
 NfvdSpl+02VI7oM6i3we4wsm0+P1S4kTzrAMPeqiknK788PnV9EsrfJftIRK8zDlwE8fIyEk7Sy
 qg5lXLnqpWDo4JGB+Ln110khZz2m/7N1dXHHLhVOrRB2xZBmh1ssqbZSgBC54eniZL4SsLQ+LEe
 cNNNa/8VzY1/qxi9A9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118256-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:viken.dadhaniya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:naresh.maramaina@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 406CD73A550



On 7/9/2026 9:50 AM, Praveen Talari wrote:
> The M_GP_IRQ_1 interrupt signals a NACK condition, but does not
> distinguish whether it occurred during the address phase or the data
> phase.  The driver always attempted cancel and DMA FSM reset on any
> NACK, which is incorrect for an address NACK since the DMA engine was
> never armed and the hardware requires no recovery.
> 
> Add geni_i2c_check_addr_data_nack() to distinguish the two cases by
> reading SE_GENI_M_GP_LENGTH after the NACK event.  A zero value means
> the address phase was NACKed (ADDR_NACK) and no DMA recovery is needed.
> A non-zero value on a write transfer means a data byte was NACKed
> (DATA_NACK) and the normal cancel and DMA FSM reset path must run.
> 
> Co-developed-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++++++++++++---------
>   1 file changed, 20 insertions(+), 9 deletions(-)

[...]

>   #define I2C_AUTO_SUSPEND_DELAY	250
> @@ -143,7 +144,8 @@ struct geni_i2c_err_log {
>   
>   static const struct geni_i2c_err_log gi2c_log[] = {
>   	[GP_IRQ0] = {-EIO, "Unknown I2C err GP_IRQ0"},
> -	[NACK] = {-ENXIO, "NACK: slv unresponsive, check its power/reset-ln"},
> +	[ADDR_NACK] = {-ENXIO, "NACK: slv unresponsive, check its power/reset-ln"},
Now slv could be target device, follow latest convention.
> +	[DATA_NACK] = {-EIO, "Data NACK: device NACK before end of TX"},
Minor: Instead of before end of TX, could be simply TX transfer NACK ?
>   	[GP_IRQ2] = {-EIO, "Unknown I2C err GP IRQ2"},
>   	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unexpected start/stop"},
>   	[ARB_LOST] = {-EAGAIN, "Bus arbitration lost, clock line undriveable"},
> @@ -258,7 +260,8 @@ static void geni_i2c_err(struct geni_i2c_dev *gi2c, int err)
>   

[...]

