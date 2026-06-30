Return-Path: <linux-arm-msm+bounces-115542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zEX3A4gjRGokpQoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 22:14:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765B6E7BD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 22:13:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ESIDl/GQ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=HHGLL+Lo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115542-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115542-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C0F0306D0DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 20:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFFF3E120E;
	Tue, 30 Jun 2026 20:13:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDAC3DE427
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 20:13:50 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782850432; cv=pass; b=QrWnTMSZkP7co6ySq76O3zwqfoSkasqF7nuZPhA/tJOWxVuJllxqpEDVWDuAVq1MQewO5fT5huexbS39ccJGL0CGf1bXYOHwbwH6iStALtlY5SD0APdyHQa6JjksZ0RpNLKsqTFAVxo8j/F0TCD9hKhVInweISrafvtHmb+2VvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782850432; c=relaxed/simple;
	bh=8XWfJ6AZS7OqH9L5OWrcIbFkTMgk5M1eAT90dgnAyjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dHZnoOf48aYf8CgZfuaKBbWaLI8SwP9gzIjkZnq3zK9kvkRbpaBkEBtztIrC03HhoViBa1+lAbjjQa1308NcjxolRw/cit/FkXaYKdv47Cyb4+sW6lKInov8h3Yt10iLoRP+j91UlUJGcx/EQG4Tex4b+m+662skFdpoUUja3SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESIDl/GQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHGLL+Lo; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDmQw2947188
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 20:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Br16D/RAGo5usqevehozZKrx/1lvyBeivnr5ZZqWWx0=; b=ESIDl/GQtCH4sWSV
	SOHM5DKxf2kIsu/WgQH5T/aF+MHWJek/blvQkwSD22xDHtM8zeNej7olRHlXb3nw
	T7Mzu4UMrE2J9abTQ40HfRJs5NKblaIB8Vpgm+M7mqzUAonDvkxd0GxEwh/umjb+
	V4y23VHYry1DQpU7OcOljoHheUwTUp8fjGPmviHED8XdZ8VDOxzr/Dq6SAdL1m2a
	16JoCI2MwA7lKJD9WHSrSjFT4jH+XAxfPzE2e/92Ia8cPFPYCb504HkGrgP8PJbz
	ze8TJmV0X7++L7z0g9XHWJll9VBeaLDtpnqv8n4seZ/Wof2741byoH4hGGlD7qnt
	DhSeig==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpu107-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 20:13:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef18406878so51662286d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 13:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782850429; cv=none;
        d=google.com; s=arc-20260327;
        b=fUebxoehJRU8Nevt3d83+4kXZRL/BpaWWiy2TTBys3pG2MDOaIsrCgeOzaF2Ov2aKk
         QHEoby3w3ImpQbaq3Rz/JNix/YpyNDaJtrqgtZposRXdWm7/SjD2GyyExinY0chB9LUa
         Vc9vJ5CXmJ0V8WgcqAqnaD4jmfua9ShVosEXvHg55bFGBtsax3V2Y4hve/6qso4rfqYO
         W/Bkh/DchqgGEsOsuraxiVCzmuYQf/RNWuMxg7YbvWcX8cR1A9ZzNc7HChhVGZSCRpgl
         azZrLvZu0VCTXkv+BW12Q5fU2Pq10WSivJuVvWJS8luaaXKrWuR//FRS96WLtcLV+lUz
         U2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Br16D/RAGo5usqevehozZKrx/1lvyBeivnr5ZZqWWx0=;
        fh=4iTucrQTTHpKs3rTLEHjFHuhXKj+AVifjUkwkVeRzLM=;
        b=rmkXHKuCgCOB1xPL+LtJIf+72Io5vXDgOXwrzPZiDjXT3XCpCnxl5DJRqCCQxGFYw/
         wV7Dax2bn8WcwRlzJdCGntcRxgZBeHGSVd2dh98GjRxtfP9V+bnK3MLaNPJJ2G7rqgeJ
         f64FjFCSjStirl+5bRB/EmTpBiS1g2TcABwQ/8GcvKl6YJphSusBngLMU01zB5WJlsEL
         VF9/XlSO+heA+3c7uiLgVwfBzRG8CttHKLYUxuqQSnB7Y8GPXQA0C4NkoP7ihgVyoaZI
         NodJr6u5jeD82z78x5qgT4ZKzEME3PHbFAW9gt2HwNK6oX/ImyINCGkkcF8D2rXrkKBU
         sIjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782850429; x=1783455229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Br16D/RAGo5usqevehozZKrx/1lvyBeivnr5ZZqWWx0=;
        b=HHGLL+LoURURRdt5s21JcC8xGqERPpvF7XzhKXukn1OhMsYYkGRkL4/aHKBd0wXxi1
         5XHBW0VtFzKv7ag0xRGex0o8rLlSZca+uCg2eRshlEFgOpoqL8YjdGjjZuixKUy3ZKa+
         CELp6cstbRpRgrlmXvIeu/n64emw9ZWBjGTTdCx3OwaSkt0WwQbuMtrEwVysw/Jj4Xn9
         Jtli3bq5yDS1OvaMqjdjqH+hFkJd27R/xiSLs+U1oPBaXcS2pvUhsrdb4kKDflvP5upp
         Z4mwxi/IhqnTHIzYFrkOmIebAH4m1oTo/MjOTFDpuK8XzmMHC1exUEiEECJsCjAq/Pqn
         HiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782850429; x=1783455229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Br16D/RAGo5usqevehozZKrx/1lvyBeivnr5ZZqWWx0=;
        b=IHRSKcYvzWUkHx6VmnwT0c1PTgQ2+2mCZzNxgnPfQ9EOXUkzn7txvEXjU0ym5oXvoZ
         KJLLpVVNx1Wh+9skjBtJQwYbjHa3e7ugGWIkWz/u6OtT3VraAeUVN4yc312nhKKgvU8Q
         cKtER2l9hjk4LbpaxMfedBCuVDjL9sG436IlmrdzIIKGLbUspHwF4jKvs+U3dna6TU30
         WTcxW2+ZmEl3etGolPZ4sBGu/2Sb2yfP8VqBJqm3buqUy33TZf1jubmKMXuCxvQvubN/
         1F6czGaJwNgv6c8gthrjylDOEDMZkhhBRNxgVWwTItNt1aCb5RU1X5ahobnMwgII4YG3
         m+Ig==
X-Forwarded-Encrypted: i=1; AHgh+RrGLOXzQaTV3zWUAJ5aFu2LeW3AbDJqsmRfm1EMwYtItEeGjIpQmY90QMps/V9VpiFY1ok5ZY2Jkl6pEhsG@vger.kernel.org
X-Gm-Message-State: AOJu0YwnKQKmUdujM0qrdR3a2gFp2+mzqI3dmZcq+Z5kDU1dxFuBzJxc
	JAPj5sEQXUg+9s3TrMfLJUzgH1jwdt2gn1FHS/Fq3df42Vo4zUPrTjQExlosune6+ssHafphO06
	cwYY+vA0tC1NoDc3rkR/Wp865weeny4HNUzbgKGIW6pNDIvI24qLLrJRCRhcXl11TZGayrFLnAq
	6YzwH5np7GGDLACoY4DwSkEDQKzVlCMXj4XeWFHqpNilQ=
X-Gm-Gg: AfdE7ckU+jMoHl8EIdI6UJ+PDzF8+uQx9z+X7j8jeuzF8Mso/LepAIAxEgr1eMaGn43
	UKH6fuM/PUz7EcoLUtMbCQxGedp3XUHiVSPKk0THjYFEXcdSek6NkzEo7/2yz5G4gGE7BOz6e9M
	HK9RfljZPMnplNmaIB9Pp6Db2ZLycjjyMtv20u7SwBjGb9qvePrs/VJOR8yz/BDDjHzQFYynBNR
	gXx1r3VDRiDvFROZOwCqWY05Jtt6IT6w6BXD0F6kxomKEgI5cpr0xv1Fa+YjxwpCXvBj8mK/RrA
	DerbdO20rSQ=
X-Received: by 2002:ad4:50d1:0:b0:8ef:a219:35e2 with SMTP id 6a1803df08f44-8f1b92488cemr58135136d6.3.1782850428667;
        Tue, 30 Jun 2026 13:13:48 -0700 (PDT)
X-Received: by 2002:ad4:50d1:0:b0:8ef:a219:35e2 with SMTP id
 6a1803df08f44-8f1b92488cemr58134646d6.3.1782850427954; Tue, 30 Jun 2026
 13:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260629214618.2523099-1-Frank.Li@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 22:13:36 +0200
X-Gm-Features: AVVi8CfzbLIbtv6dSw-7FsFdEOVU1ktw7OdKOnAZu0zxtAQiR_VtFyb4lJjXlDs
Message-ID: <CAFEp6-3FTSaxaZdHTjw8-tt50QKoVd+SiQHt0Mrw=c2p7vrA7A@mail.gmail.com>
Subject: Re: [PATCH 1/1] media: qcom: camss: Add Frank Li as reviewer
To: Frank.Li@oss.nxp.com
Cc: bod@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: RZgBZymyCqmSBA8qnEMYMy07IU7xyZHI
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a44237d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=ZJ8Py5Zph3aUlVnHwSUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE5NSBTYWx0ZWRfX4jIqbRfbGaLj
 nNdDUqLtgGxZP46AF+4yJMXhwqLf/6AbWpSbM7PDUuy/OI1hbaiICVB762bduMhHfdxjjGHk5np
 SUXIbQds88tQeiT8mEm/NmIer+w1uqDJfZh8fv7j6QT/6WPZ1aS+y7L7uQcGp9CC5zu9mzzZYfH
 FusXamTKkFPMQj6cbj3Rzl+omIwmwlvTByjkVNpRQOTR4hUnANyH0SEgTRnyaX7nn3JSEkvpSiX
 TOX3734atBFEEM5k+H9E26CQUEuZEskJ0CjQMXStnck10a8K6GqrVnEeCAgoC0+eoM1byQxWd7g
 LHWDXPJNwGS5g8FzBwab8PbdTNqKFkekgobfoOox/Jf25EdcbpdJx3VUOoyEmt4C3L+hoiawZvH
 lObXr1oibTzQV7osDIBJcHI28Bo8rRzjIt1LPCPDrWsROXNh4OVavjg24gdH3kFaoXjMe40S0WK
 3QTlkVXxpXyKESeqIGA==
X-Proofpoint-ORIG-GUID: RZgBZymyCqmSBA8qnEMYMy07IU7xyZHI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE5NSBTYWx0ZWRfXxipt/tlfW8uE
 NZm1YTZA5r0ORcenG5AMLfTvMsEAxszwPhu6IgU2r3kz9icPA+frPr57heu0pb2Awi7430NZUN2
 5At3V8HkEx1cw6c+3+y++A6VsbU3Ulc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115542-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Frank.Li@oss.nxp.com,m:bod@kernel.org,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5765B6E7BD5

On Mon, Jun 29, 2026 at 11:46=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> During the 2026 Media Summit in Nice, a discussion highlighted the lack o=
f
> cross-reviewing between maintainers and contributors from different
> subsystems. Laurent suggested encouraging collaboration between the NXP
> and Qualcomm media communities through cross-reviewing.
>
> Add Frank Li as a reviewer for the Qualcomm CAMSS driver to foster broade=
r
> review coverage and knowledge sharing across platforms.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34b8dff9bd69b..361a4f447277c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22114,6 +22114,7 @@ QUALCOMM CAMERA SUBSYSTEM DRIVER
>  M:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>  R:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>  R:     Loic Poulain <loic.poulain@oss.qualcomm.com>
> +R:     Frank Li <Frank.Li@kernel.org>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/admin-guide/media/qcom_camss.rst
> --
> 2.43.0
>
>

