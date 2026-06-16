Return-Path: <linux-arm-msm+bounces-113405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U84IFSVBMWoVfgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:27:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B800C68F4B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 14:27:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T0QS3h2t;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R2a+u5KO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113405-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113405-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 260C330146B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6358135CBD7;
	Tue, 16 Jun 2026 12:27:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DD6357D0F
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:27:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612834; cv=none; b=WCPcJesRpwIUbUVZc5VF+ITwovMjS54w2vDC8v/wqhaCBZTUhwE/LBu32+tFWjCQppmgl6oYFOuRsNJgwxF+d2aksdHHI6JpP3yw/Gy5/xY3UuBVPeWPBxhaF61733k32mVn32dLJawwBNlIcI5Q62QpWYJLsrmXuzjRBJcJidI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612834; c=relaxed/simple;
	bh=B8BCQM18rA1tnKhxMhvVZSxDnp4DEs0alQWE0FbxWYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o7Yn9XdTAydxLmHCbrXCmmjPBPiaUzDJkfmoL/fWGcuhV1/ritCGvs78zIlFV2arL9AtgLbFHitw4tM4iydrJKWmaGzjLudHoW7MUKgr6whtt36UE+EIHyvAl9CL+hTDAO5407Bc5VWe26sr+3Yuc8IoVPXU5joSbud8XkizcVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0QS3h2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R2a+u5KO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9JpG2914529
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bmbbYyR7uZKr7eHxk6XdJnTVLl1y284/iTbKusv3yoA=; b=T0QS3h2tjfDWK8sC
	MIHh0/v5JVIIQnsaua03VvjzRtjxHvDR/sxWcdzsPVe8PClbTQLYRAUHLV5WETGK
	Ui10kvEL0zJLKE/bFUp4mLeLrbopOYStogPdApS68V2efWr2dfnpsadoV0cLHDhs
	873QTdqeTzHSsWX3DQtalWuXsdOxurKqHUY1R6UEOn+vsYSeRapf/5nDEZDJ4ixA
	oky6CaV9JbU741BOZoFOMf/HG48K55Z5lTn27f7KJMjgSwAIbv1Ll3JSa5pR29mL
	UT4eEXg/pBOOXm67wKbIW5bXAHY9zhC5BRgjKPZUhYI+z8FHZSh6cqVhVT+BlFny
	m8eI1w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu1761epr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 12:27:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5177b12d7bbso10423251cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 05:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781612832; x=1782217632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bmbbYyR7uZKr7eHxk6XdJnTVLl1y284/iTbKusv3yoA=;
        b=R2a+u5KOFkSJb8dcFTS2Lmtmcay54ZUnwLXlbBQlk61+QroqMpR/Krw/RfN4TM3wEI
         sd9ic0NV1jWMCSG0vn6JHC49nl0an+qcOYOmD2g0YviGa1hSIPzLkXFgi74xyBsI1UKC
         oCgm573OAOGmq/0rJKdqVZ73dUf69LYDvqbLLmbLn1DVDFBZQdV2xv2M12YxKpJmUaAw
         VSL9+aPe9FNIt1sRzUoXgVpUfbrxF0NLtRvTvEx2++NCJircYoYrP5+kulEhc9sshX3x
         dsArZPPt0BykaNcixS53PkhGDnyyocUiNrgWl979qDXH9KbQDhf6veCvBQWKIc9OUISb
         APgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612832; x=1782217632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bmbbYyR7uZKr7eHxk6XdJnTVLl1y284/iTbKusv3yoA=;
        b=kEJUxhCRb9aMo8Eytv2rjB98mIa7gjPdl19UY87zrBRGVTktHP/wpaPBBuX2ZwusyJ
         MYmFGUtpZfWM3ObQwOUpMa7xXuiE3UR5aqwC8jFkAajLHX8NhFWo3wQ+6H93L8ykT60z
         MW9OcoIOTv9+yaWNyzX3N1rRojYI8UaVllJPPGHO6j7hz/i8aDWuncGlM+QjQtO3yyqb
         g1fbgSG1sTd5NkJjnDdYEL7n3V86ORuTqskO1khbANFyG+KpBAzHWE84zfcz3mEtzrSY
         np9XDBBebZextQVI0N3IBDki2AHyUnG8Z8TfzLUAxrAKG0/VlIOVfY4icPGZULEUTYaX
         JLEQ==
X-Gm-Message-State: AOJu0YzTAwwpgL69uMO4AkVZA5xBpH0tyRxAGWxd1tNxc8mJK/yKCRQL
	E3yD9LjUhi7LpkieMYVh4MJ4F+oORIeT5gnDBWrAMfonzRmh1xB1IITedNVpUrfheh2Q1sNepv1
	RyZxobwc7pitUke8IEQgAta/a658F5MJ8AiEQ4QVe2pbIj6bgjA6QeUC/SOmWhmmDSEU5
X-Gm-Gg: Acq92OGQoEEJOHjH+vTJPGgWVqqgKP0WAmZh/UdlxFLxTuEd4sbZ4mOXsB6qPS4RyGU
	JbNSzIe4U2XBF0Sd82k3l29lUzPKvzp2LZsA6Rc1J4rVzOzvizj1X99AuYDIuHjctnSF+ezkA01
	gFHGEZo59x9vL+PYk2fcLSgZ/h8J4v6YsorwwbuiaTf1QVN6ykYGPe5s+axDLePiDijMN84k5Uy
	YiQiV/AmfYz97vvArGhseAxtH2LO4SDrmYnpYb7N21O7N+lHWFKDCUjroWhESgX40d37cpykp+4
	NqtKeZHNBeal4HssC3uzYCbNE/8GGGG7/jovLnsw+jEPdQANS4xw1/hVT+CcvpprpH9HzA387az
	n7j/hToShGlN4fhohRV+qIX9psATmkULdoI86KYM/+TBAxQ==
X-Received: by 2002:a05:622a:148d:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-517fdc7df1cmr172113301cf.0.1781612831502;
        Tue, 16 Jun 2026 05:27:11 -0700 (PDT)
X-Received: by 2002:a05:622a:148d:b0:516:cae0:c6e9 with SMTP id d75a77b69052e-517fdc7df1cmr172112991cf.0.1781612831079;
        Tue, 16 Jun 2026 05:27:11 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420823sm643729366b.4.2026.06.16.05.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 05:27:10 -0700 (PDT)
Message-ID: <bc1d3c3b-b6ab-4070-a560-44adab4d877a@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:27:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
 <da2443f4-b80e-4ba5-8f83-4a4e893dd51b@oss.qualcomm.com>
 <8d9f78d2-d414-4ffb-bdf2-e2e7bda73aaf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8d9f78d2-d414-4ffb-bdf2-e2e7bda73aaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZqW8PQSUo8iYeQ5oHG7Qd8WKoJ90rg36
X-Proofpoint-ORIG-GUID: ZqW8PQSUo8iYeQ5oHG7Qd8WKoJ90rg36
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a314120 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sLTQJQ2odkIT5fSfO8wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNiBTYWx0ZWRfX8d/UoSTFCut7
 hkMXBHP3MJbe6gHylhtdJNPYK9txWQqoG7DYahCxaVREFBWVQDO+gD5SmncYo4qirVPbKPEYMxN
 geZrUevir8YztYk86E7vK5+FTvupNyA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNiBTYWx0ZWRfX3DF9ObFMdnFM
 51WNn/krPoSeOh56+Vh8xYjQKhu3WHzG11svU6DwHBViwg9xurUaSk4EiZj8alrsuv945sIenj2
 LzqjFBF4IbVK/VjaIjK5XdTEQp+raYYVRDUz+9UVKvk+PW/ZwvJwwwa5xCkBbsZnhwdajE+kDUz
 ZFKJR2PpZLD7RcuAyniedC87ZPWbFvLhBXlkcED+Ft6fBe2TnrqQ2fJPJkeav0vfuIbWgVjAZi8
 qz4f1DlJMRNgBqEE7c7PhN/XSQujEHLgE00S/cxHq3tnYETBTCCerJ19eHqjrs9cTSJ5JMSKuxN
 OZv3I+WOYiJp5G2TRM7OZYikvHpkd60JLOO4icL5khx092MQRYBPv9eNkdH12WmHN8ebZTxSXED
 598zkKqX4dmzZLbRf553PxdsyDpDhBZOdtMR/I4H3RLRtt5ppo39x14UCkc5x4o2JiqJFnW66/o
 5N2yUoNyzCkjTC+Vccg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113405-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vignesh.viswanathan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B800C68F4B4

On 5/26/26 9:38 AM, Vignesh Viswanathan wrote:
> 
> 
> On 5/20/2026 3:29 PM, Konrad Dybcio wrote:
>> On 5/19/26 9:05 PM, Vignesh Viswanathan wrote:
>>> Add documentation for the CDSP Power Management driver, which handles
>>> Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
>>> Power Mode (LPM) transitions via MPM handshake, and provides virtual
>>> regulators for the remoteproc driver to control CDSP power rails.
>>>
>>> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>> ---

[...]

>> MPM is a top-level peripheral, but this is a slice dedicated to the
>> CDSP so maybe it'd pass, but..
>>
>>> +                  <0x0 0x26018018 0x0 0x4>;
>>
>> This is a single random register within the CDSP's register space, so
>> we should definitely be able to describe this better..
> 
> Will document this more clearly in the next version.

By "describe" I meant "represent in DTS" - it may be that we need to expose
a syscon or something similar

Konrad

