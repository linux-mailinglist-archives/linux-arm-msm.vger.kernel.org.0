Return-Path: <linux-arm-msm+bounces-113641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dd+2BmOdMmpR2wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:13:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FCF699FF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:13:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=PQq5qqaW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cgj30RjP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113641-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113641-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 735303082C38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775A5400DE2;
	Wed, 17 Jun 2026 13:12:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C491DF254
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:12:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781701970; cv=none; b=Q0wqDpxk/GMdQBsw0JqZK9UYHInbxlp72CiJUdqXrKdBjKtpV7gN5o1JX9z2ZbCQ3PmgCJRXpWjlPpQVoS3h9Js0EsSfvdOYR2FazOKtBGnxq6ymjJRMPEB64bj7mWS5JH/HXdw7lI83JsGaf/u3pnVisS7KOTo4TyoZABic9gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781701970; c=relaxed/simple;
	bh=/xYSuDuApVlDwRl5mUUmCd+M8zOhVp0QHXRqk2UrHUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5XlcnoCeR1V1+9OCNua3YW4pYFebkzEPOBXxhKUzZJMCRWqO7CSgGW7Sr7DBXqXwuFuY/vTVRcgiOOG77KCDvhXgMvLBLpo85sJnzJy2oBbNRsEMO/euUz6ju5WXJrT3Kwk1+WXYC1er14qPJCzLof5+a0sMzcwC7DYPOQub9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQq5qqaW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cgj30RjP; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Ulks1607945
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bl7Cu9/Rb8h2gN+c/vf6cviy2rxKrYizQzQi6ZcXv4Y=; b=PQq5qqaWT6gifv18
	migQ05k3hZ43x0ykGskbXeD80/VilkA8dDLPyv7Spo4U44PVGXoQXbs2/B8CWvn/
	5q+0ncb/PcTNGRgXLJKUlH1FngDJpQlabMIVrJKHcALj5nrn/WYb+fpabdhA31SX
	j8LV2vjWmNqIruTpxh6Ctub98JgA5xuS9KlJ1i5ml2s7x1aqL9ovpLFjVC2tXDWs
	QMAhXnrrWmraODZqRggj7XBJN1sEwlbg10USIKoJoIE92sU4azyJYByLVs8n/6pV
	f/fVmDLQp408A77TLMKIjSHbFQOrOr/xi72sSwWPf+AY+u2epAy1aAda7/GGHznk
	h86uAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef237nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 13:12:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915976b2dffso47279985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 06:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781701966; x=1782306766; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bl7Cu9/Rb8h2gN+c/vf6cviy2rxKrYizQzQi6ZcXv4Y=;
        b=cgj30RjPRCAYvKX192WDMTBbfd//Q3CGNMucT+zntmwUZwWESNd1j0FX64mfMwDqcx
         OImQwX8Ct8yk40kIRpHgUzF7bZQrBb4XwFEyUdwo49qX7fl5nBbBO9KNwSQ+icqWabra
         ottE11lK9/wqRnqarq/T37K8TL7SdoJH60V0YFA8tNTu9W6L4oeDo+2C7mlkpMIV4TcO
         jhT1Dgm3btJ20yULtqdvMQ5UGQCFK44XHtYISX6ns1wyi3q+UQy1Qqr7qNg20ah2t3Q0
         /Y72DBkmYA+FhgzbAoNDfiWHwIiBMLcHgCYGexwxtt2Tgchf9jYa4dx8IQt++N1YsLhN
         Au4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781701966; x=1782306766;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bl7Cu9/Rb8h2gN+c/vf6cviy2rxKrYizQzQi6ZcXv4Y=;
        b=AovwSJDUdAAQ/JQe3585QsV8mwgj3LLpcwJL7rVR6qHjRpR3PzYExeWJgK/F+xTWSK
         GDB1bfVV30Xge2ktstGyhtyxJDlbBb1QWVaiCOjbWEZJxW6PG+nkYpupnqNQGbTNkPBh
         OeCExOvjtnG6CRGiKGerGJ6SdIR1+oPE2ln6BccofsFaN1e9PfEJhF4Db7If5f99slTJ
         hFeYyebfcWn63uEMTQ0l3aMZh14yCSG9EU4fPXC7vBAtcoJIcjkNDqpCrwpE+SefJxz8
         sDw1FOsClF1hEOdBLcfuY2xXWEysHE2SE05eLbhdOE5cLxUcZMQq9UR22MjrLXC6q+tk
         toMA==
X-Gm-Message-State: AOJu0YzzTza/j1RsAg6P1ClotSp+QZOYgZb31nqNLHz6kdPkvKrxafYH
	N0DrNanGdAk/4+pibX7VDvRbzbOTKE3ozAGI3+XrPN39Y7OLr6UFE1QHTsj2iF4CSI3CW7/T7iE
	9zqR3FmiQSKr3dp33KWZecPlpCodW0QsKDzXWxm+g+sslsAXfI7+VVedt3V+3Gydq7UPB2gwNz3
	e6
X-Gm-Gg: Acq92OF6wI+ZwrOB32U0YwF0A55ClpD2Kfhkw6MT/ly0E2ycAu/ZrB10Up4mBfgYXrL
	hSZwPlzuHKO8DCUiHb7FjctpQZ1G6UZvAavnZ8pzqypVEty/szNuM5po3+PSACzTNLVo7XWXBwE
	gDYWbVLlFo3CEj/KYeLIpJok12Yu3L5aDLS87ayQkhn3XKSnkXOI3n7ly3VvjmDJBJjaThcXPFf
	EgD9vgN1i2TL3a2GXrhY8zOph3Kjho25yobOmHT7Tz/bmEmw4Ut9bnYxo5hmuh/vFhy6Y0BDinM
	oxVVEbon9WXaM9aWiQeqEL8wIVHI9IpoiIg/Ynuse7HJ4Jp5PckwPsJBxQxtbP6bWsrOIFSZIld
	86kKLE54QN0mxUDMSeziLNMC4nxjAghONPn0=
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr404161785a.6.1781701966265;
        Wed, 17 Jun 2026 06:12:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:913:b4b9:5ec8 with SMTP id af79cd13be357-91d8d5b2aacmr404157785a.6.1781701965809;
        Wed, 17 Jun 2026 06:12:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948fc99sm6573561a12.23.2026.06.17.06.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:12:45 -0700 (PDT)
Message-ID: <0fcfe7c3-ff54-4a72-9529-8f55d77814ef@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 15:12:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] irqchip/qcom-pdc: restructure version support
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
 <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-1-4d8e1504ea75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyNSBTYWx0ZWRfX5AwmiP3tEvIO
 tGlLlYjoAhecMziKlqNzmt0PlZzz+UbGP+VMGVUtZC1JwY1e+8BKJTWl9dBXc5nl7OHtiDpMO09
 a8p2tttZvA0/7OvOSCkqm7dnkWDseUc=
X-Proofpoint-ORIG-GUID: ooAWnVbAqZUGjjuAzCfpHTPvkqwqxf23
X-Proofpoint-GUID: ooAWnVbAqZUGjjuAzCfpHTPvkqwqxf23
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyNSBTYWx0ZWRfX8dZjLut+tniJ
 fM6YkiXPBLlmogrSxU2v2OTNSnC+3rqlDU/JYYn4n6DjjovIAm971LUF70iwNRjS5UaVRF3c2NT
 AY8tfqaNIoTgCFIZW7nXed1l1BM9+yT+AQvRxSRWEjLuSRFs2u3XXVV8QgpBu2+QROblz2pmvhY
 JfmZ8CYvCbSAiPAwW1Kx6vD4aYcrO4x6CCEAGRktqqn3Q4l3pMRSqEL8ZVmKmP+SQDDgwdggGGl
 OphEDU3qhIR+9vh10+BvwF6jvdshkSmY+4TDauhQm2S2Fw44PhI2Kv8wpwlhT/MYMYQ+Yj1I9oK
 9/meLsTXU1zqBp6yV5+45ZDvJ5f0yiqTBMa6mVZsdbLnz959hfFnxFSx0E+tV52X5HLYzVIuXwc
 pJeBhjHRaW54ORlP7wJOIAXIvzSAT9BKs069MQ2OCm/KUo6u5CQre4ZKsNHcxMVmgfpfCCmh11Q
 0VF63H2Xk9wc9HF2sWg==
X-Authority-Analysis: v=2.4 cv=acpRWxot c=1 sm=1 tr=0 ts=6a329d4f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=y--pFEGKUWMBhsBSRrIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113641-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 68FCF699FF1

On 6/16/26 11:25 AM, Maulik Shah wrote:
> PDC irqchip updates IRQ_ENABLE and IRQ_CFG and for three different
> versions v2.7, v3.0 and v3.2. These registers are organized in H/W
> as below on various SoCs.

[...]

> -	ret = pdc_setup_pin_mapping(node);
> +	ret = pdc_setup_pin_mapping(dev, node);

dev is enough, we can get the np in that function from dev->of_node

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

