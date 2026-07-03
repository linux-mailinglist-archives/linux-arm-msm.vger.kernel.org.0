Return-Path: <linux-arm-msm+bounces-116296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5PNGOCCbR2pOcAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:21:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CB4701C66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:21:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WWxNFwEb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="a/Hn1KLg";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116296-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116296-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62224305E493
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC88E3C1411;
	Fri,  3 Jul 2026 11:15:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CE43C10B0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:15:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077342; cv=none; b=mZ9E2gCx6+BSFsu868GYtuBcpmBtl3H4AUF2WPCwrbkTKaKsMBIw7aFbobQqWLBrTun7w2e/iQbrCvnU/DbFtzUXBL/Awu80V+8ALEINbMEuA/W8LcI/suJOUYRVYSyz1zmISGcz6IKK7Rd+29Sq26ODTKKxs+ifjxllvTIwak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077342; c=relaxed/simple;
	bh=6+8anx7ZeT5eEobYXLCvVKBGOsuq8YLhumkfxh1cprQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZqEvA54CBo67FfD9MfyN3Th9o6Wk85McUnXbTR8qo92PbTxUYdxEjULksbvrkYg2kShJ6YTAoYrUg5kxEuYNFQ0s4oPZhEHjdnoTEm5fvRnxxwPSXbO2429yGTPBXM88+I+T6YGWYckyCqWwA23Z9sDBVapKIzWGUe2FCr5nSmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWxNFwEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/Hn1KLg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66368BjF3053832
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 11:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v3QJyHRa1NqPOMjsxEzu8DRdanlcPy1iog4etxanpVk=; b=WWxNFwEb9O/XHM4C
	yhDVARpN+BdzepOdiJ9CQU2qC9NLij6IyweYrQzebJzcrFU0hAuvzXCBe5UchY+C
	Eh5zutonWqUpIZjFbzDDMexQ0cCXPpgO7GgLuB45tXmHEwLhgn6Rst8h91WwJF8E
	vKpwwLohy9F8xTgO1s3U0TO/evtj40g7Zz1DGryd1E6aSdNtaFjlaP6sR7PZXp9G
	uYiFg6fYiP5GLb1ZGtEGA3PxmbRbvtr8AiOHpeNYEQ87T1o2j//mPONIyoAoFm4w
	IthyuRJR1Ym+i6bjaRd/pgrJtE0a71sU/Q1MT57l9h/drxfeYD7anOD2QnzcXGzE
	/yo4xg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f67j01447-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 11:15:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6b97afe7so14015185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077340; x=1783682140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v3QJyHRa1NqPOMjsxEzu8DRdanlcPy1iog4etxanpVk=;
        b=a/Hn1KLgBKM497kMUyCkC2XTRBQB088I6D9t9L8cULkz6MxH3HDXDg1VnUWYeXYdfB
         EmwIxsCy9ZXwuhJ5HbpNWmicrc8MEXaw+1pEVUoBx2hesabAOFAG/JVLTbYDsOIdHUAI
         oi54AdXRAT/23YDFte8xO4RNwdRt/Gh0V3lYebadQL1U8iLjB4XDbu937pDlyOD99B/i
         51KZ/3q1/rt2Fot7Y/rPLddDsxyeJW3sSJu8+3K4J83SWKwol+YeG2f6DzvmR7lrgy0i
         VwAh3Vahl5l4u+utE7qzq0/rKr7g08g3Sinc7l6uRHD9qq5Smc8hqpfIAfNJ/1AQqiTz
         P5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077340; x=1783682140;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3QJyHRa1NqPOMjsxEzu8DRdanlcPy1iog4etxanpVk=;
        b=i2zWc7p9BUrDupcFBA4kMF/SnKuu0xysKu2J9fUlVjU/MaCu1P313LcqJ7H41Xmzh8
         TPKn8LzDmSt3OPf+GzQFIC9V7ZE75CwxO7fD+gF1612/7qjUwgpWK8MuhQzWkoNdvLPI
         jsulH1Vecgfo+7AQhBTDliiGzDEoarWOi8N0YnHGt4xXTOCIL5mY+kMlsx4siJVd0kuF
         SpgMPzn4ljN1nXWycOr2FtdXHuIw7UMzbe8dTwKEpbFDLhvPsLS8EtMj8T5CbB+pLPdf
         5C3pyPL0SOectgiTslJyox6jwTCr0eDpVNzagkg04rRFrnvD4rUy+JM6SSWsMFZ/O8ir
         cGbg==
X-Gm-Message-State: AOJu0YwYg6wZWD41G1WT7TCoiJ0N7brj60ZbRKUIQGID8Sf0TPJ0/KkC
	VoiwdFpLfqdBDTnru9IRAiRLMDklqWU+Fu9c+ysbduaSEJXXJ5OFlIlMp0qt5FuIwkcV0/Zexj9
	m4HQ2qajICMT7+e0slN1VTfyRZYBA0XsojslhHepRRoCMvQEvPaD9YnpwBioiVamc9eS0
X-Gm-Gg: AfdE7ck9+iWv+h//mAquxU/wbYKKO1T57sSdYidS30KCF3zRKtjNlYvY5gQwTbYa56K
	NYedY6k6azgxAmPQ2ss4n2McXkgrwsxXBpx9x7SCcvfO6/5N7b5lwqrg7M0y4vAH07BvTtf5v2B
	iT7GBEqD4cpJK2LCAV92SYyNiQBXu5ybT/aYqOthm9rWWm3wgr2UieI1dIlShYs9mYhd25fgAXX
	hkqhN6Ln3/iuzPXaLLgV+oyVdaCc0hpfoML51LKa7fvCAqCrVL1E8HZdY2BuBe9E/7nvpc5JRa9
	aPa+rGoDlR2hqxXLpsdWHA+u1yXnJaCpLwqKLD4H81H13tM4ida6lid21nrCbb4ekOpzxOZNGL8
	1nrXBk+cXdPf/2V1vhCouRSgV3vhxFAn6jf8=
X-Received: by 2002:a05:620a:8391:b0:918:588c:d095 with SMTP id af79cd13be357-92e784f8db2mr829850385a.8.1783077339830;
        Fri, 03 Jul 2026 04:15:39 -0700 (PDT)
X-Received: by 2002:a05:620a:8391:b0:918:588c:d095 with SMTP id af79cd13be357-92e784f8db2mr829845285a.8.1783077339236;
        Fri, 03 Jul 2026 04:15:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f6e3dsm265198466b.62.2026.07.03.04.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 04:15:38 -0700 (PDT)
Message-ID: <342ad16a-8210-4dea-99c3-50700f830de4@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 13:15:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260703-ipq5018-bluetooth-v3-0-62da72818ab3@outlook.com>
 <20260703-ipq5018-bluetooth-v3-3-62da72818ab3@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260703-ipq5018-bluetooth-v3-3-62da72818ab3@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aQYPLAsgHMd4sSWM-RPSa0JLaPQ2R03G
X-Proofpoint-ORIG-GUID: aQYPLAsgHMd4sSWM-RPSa0JLaPQ2R03G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfXzqH59RGoF0D3
 gmW9JSJ0ivvUI4gi4fYHja3DZ52TNFhB1/6pz7myZrt5uuk4KDa26FlazEV1RKTAkhb154zdWG4
 Z7NVnR9N5dSGDHvuhnNsOgPB2UMSTkM=
X-Authority-Analysis: v=2.4 cv=Yuc/gYYX c=1 sm=1 tr=0 ts=6a4799dd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=EFz_iqN25vaghz0NCYEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwOSBTYWx0ZWRfX+xJ30SbIF4Nt
 3tBIGLRo6M377UFQcP1puboe42xAiIvOswkbcu6Xh/VH7g1DnL6ancLpuwAcyemNjnfXA5360sB
 V4ue3Ce+LWVhC3q9471V4wqdic/EiaTNJZfgTkepQR2yPWlJF2dBeARQCsuZkrg6meeUSfv8ytU
 NuNUezwFU1j6TXdwnEcyLD+XjvKueWuGUJy4mM0nRggnaHjEOvBlYEJo496dD+7SRo51j0Oeu6y
 2KqXe7V+UDigxepDY4G+Dxue+vxzu9m21OUO0jtuV6LcAB4X/G+U5gQRVxHN4x/nGu3cRZoYMYQ
 l+5m+O0VpfpkkPgGdC2xWgXl+B3C7glz+YbymRy98SaJ3nyqKrI7Pk7PgMrmk8CqQa0SVTTVinX
 N4QmvXTjkOQEYjX9LLgVrJZ5PPYbbtkDMSXKZqgMgG1NxGXrtSdKQzuv5t2DGSV0T4GjB8Bggg6
 3jysytcJPu3EseISA9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030109
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116296-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,outlook.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52CB4701C66

On 7/3/26 7:01 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
> modes which are required to be configured through a Secure Channel
> Manager (SCM) call to TrustZone. However, not all Trusted Execution
> Environment (QSEE) images support this call, so first check if the call
> is available.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

