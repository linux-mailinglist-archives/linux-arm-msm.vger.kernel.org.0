Return-Path: <linux-arm-msm+bounces-111271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b8oHHfPnIWraQQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111271-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 23:02:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D13643833
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 23:02:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jif3TTHi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=V8F3FheN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111271-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111271-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45F2F3018D73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 21:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A66F3914E1;
	Thu,  4 Jun 2026 21:02:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A80734D3B0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 21:02:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780606939; cv=none; b=PUgsITbW78kc4B/VB0w2ZTB3enllMv1sQwugT/0bEzo0sTrpW2H1nckQFFlB52y+aMq940sQ8cLb9HU5FXHiT18+6gdcy3LXaMZ7yGK/dMzcz25meFdXJCknazGESslW8i/2Wd37DQXezKxfwnVT8biNfXu4dPE5mePxzoH2Rlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780606939; c=relaxed/simple;
	bh=1Mnqpms2o44uk1778jDhw/oChgvu+1zcxrO/eA7pYOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I37njbFXHLG5TO1lfaH6VO/i4o9IY3csTRJeRjs0kmrMiDrfQfR4yLHDYrSUat66g4kTHkRWsLJWXzb6737Xo8D+/IU8ylcCVLcZ0oq+iepHuYYivp9HLjPsXv8rCQyP2zlwBY5LoxdNpJ1a4SzAZBOMPSAYFTGy4sKjvAEsWlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jif3TTHi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8F3FheN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654Ek7sQ1132390
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 21:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+J7VoHerHsoGih65b4TQk9xRPzpJ4VqqpsrxtPUKxA0=; b=Jif3TTHiDkOjim6C
	07P+SqvzsVQVBbWcP95eX+1XNv6SqrO9qO6eygasz/h3pI3Oh7mxD80Rb3ezLBOs
	2XDNoWPcAe+eVZpjOachA2VNnImA6jMFXDW9gsBNOmnsmH37ezZBttGePAxsu3IH
	f5EId//qQgc6gaG4LhwIMhkIXVHTVIemPwNOCkjw5Mr7rOovtlMIAVteDZFdIt5Q
	sXPdDgLsljvjgSE8+C73bjWKB9CB+5AvtVwEKlo/UnkV6x/SxL4MUwdP689oAof4
	hQ7DMpn/oEAFLGtvkqM5FJ1XmN0TwqnZql4e0dDozal16uCQs+cPAhyP9o/QxyuJ
	HNhLCw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wsk84c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 21:02:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304ec73b015so2463913eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780606936; x=1781211736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+J7VoHerHsoGih65b4TQk9xRPzpJ4VqqpsrxtPUKxA0=;
        b=V8F3FheN9yh8Vmw9YDXFLVofwd+R8vgVRIaHxXs36PWcH7WZsDwVWpnJeIADdjUtMe
         aVzDAQs1AaMRf29JhpCMbA74J5nGIWJkTVwB/eesakDSzw5FJT2Kd8/rOX3fqQK5SIw6
         jJI6JhaaOC6n+NjFpGuDZgY6Q1Y1UwW7ETLLu5F/+HZQlpxzlyRtIJTHCDazrk1iDink
         Pw2nU2+V5RXwzZ0QgF6NHGz3WFp9fuuXRTN/jPG/VAonp5kI3BJLrTbAekcmkdJZLYqS
         ORU5HpoG297doWOAXJ/I1msSQ7R+OnLr9p/UPt6ryJaUqenwYG+aWvF9VCMSjSvET8w7
         8kbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780606936; x=1781211736;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+J7VoHerHsoGih65b4TQk9xRPzpJ4VqqpsrxtPUKxA0=;
        b=ZMjRnxoeOTGTC7+1Ph8jQ5oWhBRj1+i/mg5ACmiirYj34qbwIOXxPGLeNQpOwIbxuo
         zpBer7J7TikEQHGnhXrVMdEXw9XY9sumvNddEPXH3FAU9qIIdOYqdJujtF/avBkpJrAP
         7N5I6mKWohDJi/s9Lci+pkho14IL9V/OT1hE+eyKsQpnH7bdiyhQevdW5l6oiBamYfuH
         bbvfQisNcVU0fBH8fBzIereCAtC3eV8duXf5ACW8ytlEZQ0E8pJY1gZyEo0JzNbar3ic
         dbPXvO9lVtw2YnG+TdAjbs8i3UkceGWNjC+ovfexq8voVXM93PD1WoOtXWbp14hv+0t7
         H1yQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FpkquZMX40Q22HJ/pcD1b4wPDs4S99mQSM3Z7fB2lM1Nb9RctKZg6bl9HqqEN/IK69aqm4GmRw2SOY4Dm@vger.kernel.org
X-Gm-Message-State: AOJu0YzBpLwz7bwFbh3urTwsQcnQYk6hjGkYw0wRyXOYW6sN0cBKW51p
	JeIdJlOc7fGyeHrpTBk3fcwoNS5ok0iGN+70CHlkTCprIBbzNYKY5ipJdOEX5pGjZsN7AOQg/ve
	EVpNTe6jfXs+mIRP6gDjrWm7IV6ZvO4RUH0N4xYCp6MRTOOh7VMNeuYYL3mLFd8LuwNqv
X-Gm-Gg: Acq92OHSx709cwwggkJfosSr4DzHRMSHrWfTJmh6uKP1LegodrWUsGcEBSDh3MeKDE0
	MDVwLjxyAiA8jepRLRvL701foY5jaH8//LKWkOUszFBnItOcC1GUyuTkmepxzFqHFdM1r7czeWk
	cZpOGnIPyGFOhzuyfFUmD/kR5jF8xOrb9klqeZVOOyJhy3bGVXwwi/BSL5myBKwY2swcciK63dM
	t5wuu5mypX73AfRoXvAIRnfQC3pk+tnqdYVptdM5HaMVBSbBksJ1FUMz+VjwzXoKYvY4ZXCAW0K
	dOkR1OhCEwWj4uteH7+gbU4p3zDOOGHmKaZYjhvASWQ3jkmbPh+GsoHkoTaMgVAT3ZTkKZvOSz9
	2z+9f8tYUCWJaqUxIHIQo+JdJqrfN00ixSSMzJJhcAoWxnRcvwQpcJ9sHo4xRjSKtSU3FtEkcNE
	X/YsjzlxyOeZwgDWdY6k+KlXkQ
X-Received: by 2002:a05:7301:9bc5:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-3077b47c994mr232155eec.17.1780606935981;
        Thu, 04 Jun 2026 14:02:15 -0700 (PDT)
X-Received: by 2002:a05:7301:9bc5:b0:2e7:c701:aa85 with SMTP id 5a478bee46e88-3077b47c994mr232121eec.17.1780606935447;
        Thu, 04 Jun 2026 14:02:15 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df349d8sm5820083eec.22.2026.06.04.14.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 14:02:14 -0700 (PDT)
Message-ID: <9d3728cf-bf4b-4ba0-8c71-831d908072a9@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 14:02:13 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/1] remoteproc: qcom: Add NOTIFY_FATAL event type to
 SSR subdevice
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com,
        quic_viswanat@quicinc.com, quic_mojha@quicinc.com
References: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240820060943.277260-1-quic_gokulsri@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 75Av8FIZEO6qK6TBMeZR0nSOoDuQFS2-
X-Proofpoint-ORIG-GUID: 75Av8FIZEO6qK6TBMeZR0nSOoDuQFS2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIwNiBTYWx0ZWRfX/vQbK9Q1fZYK
 ojOc7O3KJlEDkoyTxFcve/ldYE6IOedBVoh6EHZ/WvG1Xa2xseheOTSXtDdKth+gMRLngb9K+fo
 TrcgvH/AISJsYUBDzQeTm3fOAFdaRmYctrmLFY+Bz9zGyxmaAvgKfQrp1rTSsB0a34Jhyecb6Q+
 om9ZDnNz5PVMP4VYFJcxpKbKu/JiiCo6vKZdp0yBLENJ7/UL0AldOZxhygC/DpKTna0VPLW7u3q
 ODoCBnmUEjffWySQiN3K1rI4j0JmcZ69Qqsv1FZed0HlFohopFcdvUAuPeRbydvzihv1gYdDbAM
 6jsgYEEfXjoMhMvWIZnW5tAveFhhdMeqjT2I92aKhyRCuZ2cJinsXNOSxCv8G/4PGIHoJiijlWS
 ybIXBAeclIIxtMJrJtoHonPI9Lt3sGtdm0fMB01M8s1OgvrpS6/5ZZMoSiqb5MtR1pLTIRMVo+1
 80kDI/ocuzfyuGM4fFg==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a21e7d9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=Be1Yk5Ofpn9B-WBGvlcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040206
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-111271-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:quic_gokulsri@quicinc.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:quic_varada@quicinc.com,m:quic_srichara@quicinc.com,m:quic_viswanat@quicinc.com,m:quic_mojha@quicinc.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69D13643833

On 8/19/2024 11:09 PM, Gokul Sriram Palanisamy wrote:
> From: Vignesh Viswanathan <quic_viswanat@quicinc.com>
> 
> Currently the SSR subdevice notifies the client driver on crash of the
> rproc from the recovery workqueue using the BEFORE_SHUTDOWN event.
> However, the client driver might be interested to know that the device
> has crashed immediately to pause any further transactions with the
> rproc. This calls for an event to be sent to the driver in the IRQ
> context as soon as the rproc crashes.
> 
> Add NOTIFY_FATAL event to SSR subdevice to atomically notify rproc has

Almost 2 years later and I'm finally seeing the ath12k patch in internal
review that uses this.

I was confused when the ath12k code didn't actually have any references to
"NOTIFY_FATAL" and then I got a build error due to a missing
QCOM_SSR_NOTIFY_CRASH.

So all instance of NOTIFY_FATAL in the subject and commit text should be
changed to NOTIFY_CRASH.

And as was noted by Dmitry, this patch should be packaged with the ath12k
patch when it leaves internal review.


