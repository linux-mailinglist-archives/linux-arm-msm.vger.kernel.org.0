Return-Path: <linux-arm-msm+bounces-102664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NOnYAdXH2GmkiAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:50:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B853D536B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:50:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 088B73004603
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B642734D911;
	Fri, 10 Apr 2026 09:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aehhj207";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X8caKVJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123E36E46E
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814608; cv=none; b=kefzfE+Prn2y5KWceosLXyrY9EqJJhckl/knPgeYp/oTwSDiXaFxhqWgRSOo9QLrEz7Y2tfeHHCBqAUBSrGG+l4G0E1eohegLBMtfAWjHnAkdAN/g8Nvf6d63owxLojX0bJ3VhXzKRMMxeEcH/aCdTUamtsh8enC9oZJ6rp7Axs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814608; c=relaxed/simple;
	bh=ZOgaDu9aSzEXnezkQHCnvYzmskKgQSZu2tXTceCtftA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iJXVe0yX2hFZoEtgVrTb0Dojm1BQmgm3YmSaZm9GQY+vd19qpj+gsm+J4pE6T71V48PhoBqeHYrUgd9es6ikaapT88FA5zOG2ZoZ38pBglgzxfbYwqB7TtlcsG1BMbAQ2ji6Lj1al6Vi5f1TtKr0AwuSb5SzLKiqaJZNjQ3XlGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aehhj207; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X8caKVJm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6DsoZ780153
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9qnOlbUXy+ARxkrRqY9Z2wy75lAeAnfzKPFDRUM6cA=; b=aehhj207mlGKbNEQ
	eSw+Bwtzs1ygwKBdQLErwlum3/RuiKbcajDeuVyiMZnGrUDuXhSpKZWvctkweZpu
	gTyl0Inp4MmB8rdNbi2xF4p3rn+WqdSBwP1Ndv8VG8hKKUSsVplGyJRYkkZV9yWU
	+ALFAdG+gjvJW9H8hYFmZl2g8ajSFsNMHxUb5E1lVWDea0208ZXTyMrz3u8Geilc
	jeFUmqNYD4NwK3qOMNoNtVF7UJOh6BNcSHr1gTACOzbEtmu7ahaJQ5oXnYtAto44
	EPn9zhDogvzI0HqnEGHPERoNGNtY7n6hNPkpCo3E+tLN9Q6i4rUUGjewtcpPj/1r
	w6a3FQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec8huyr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:50:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb485c686cso45909985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775814605; x=1776419405; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l9qnOlbUXy+ARxkrRqY9Z2wy75lAeAnfzKPFDRUM6cA=;
        b=X8caKVJmSumku+6FHEaxhttmwk2peMfuzTep/yzXZ9WXLVCDESmm3nDV/ZLdxSmcgr
         DoxLvMeDvw/APjrbaYlBtpjG2/l0aYUaRTFgsgchyKLW4VuBKmiHx56q93/ayDe1Z1Ei
         sVwJ9fjm4MCG6Ld41wHcmo8w0i4cJ+99qgHICd37DnDax6EbUsFba5kKdpEFHcTZ+IWG
         wTWFJf8PdPgJ0wsYyo+HqLSquzlVkUIkHjeB1ofpjyyAQRPyLlrICaqEDMXK5xah+ggl
         2/pU2hRIlgbI2PQ7DP7Lar+b9NXm22T2qkaNIrHIVXKSIdtW+H58N/dAIZq3byeJizU+
         EOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775814605; x=1776419405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9qnOlbUXy+ARxkrRqY9Z2wy75lAeAnfzKPFDRUM6cA=;
        b=b4d/kQXXwQcwL30XtlcZMN7CqJdObIuL29WtIDCzUC4cKGYYnYzUT1jD6OZGKelc2Q
         pd206mwPzbf8euQkoIviSg4wNX9G6a2Xs0Hiek0C7E2hE2VlU7w2HEfIRW5G40RbqeBf
         pKFqu9Cvs5M5VP4pLtIHzXQmGF+YWMir5aglecChgCBor2L+k+hyIlJmbmB1zRDjynMe
         TV3ziXb2Eh20CKi34Hw2gUo4jeH4xCa0ysAcoDvh5RDRnt9Mz8HjgY/t0TNSU7z2AQFt
         96ZVIF1QfQdTVoZDDgff6lQnig462uxxOkLzv8GfaZSaYQ3pmNpbGYVVhT6QbVZFk5s8
         PXWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6zD6wNiGXHae383XR6ug+wXRAY1AEsyjExt6779c1hD0ucf4ldx3f8oM2QXzU162YbsCBUkzT6scT4qRA@vger.kernel.org
X-Gm-Message-State: AOJu0YxqNxSGWzW9JcfnEvdmd49m+INeniwfJzJaJZuNXxOdQ7zr9tGh
	P/qsXCfv9kfxhxII1oeuUhKSNHj775vlDVmFyaqGOsJJRufbcS2CmpBl162fD5tYmOjDwTe3Kc6
	RZh3qEPpYUtt7c5yYYFY27CUWFk3SElQ2s4P8MIjulefZpXfrpEb/MUyEYsRcgGSz2xHG/Ix4fU
	jX
X-Gm-Gg: AeBDietYA3ToEbkxROw86KKUL/UDZ4JgVftYtao3MQuJmb64lsWbRMOG4jrRf5n8DlS
	piOnc8B73Z7J1Agx7p2fb8pe1lVwl6cAuOVrGI3yIPRLi3DZfLR3xIUpBB2p/eij6cTRCMha1MG
	oJZACXVWur8gDpsziSGRcPKk7dDsok/khHGztH1Y5qu9a2hiIPYuf34nwzELJ1ZbmobJQ6FL9XU
	6xQeesGLN+zqBLm+8qwMNYRJJjTD4FLbv6nGtHqUXpHuCVUi2BhYtacHu3LQQWtgKC4rdZ24X00
	OA4p/JDJeSbaJD3xpl0gMGdJZV19+7pu+liX0wUr0c81Hq8NQRBwIs/MyCeIcmoxXMLooRmehYQ
	S1umTp4FfBhRiXXNbuBF+uDoTrSSkp/heL6RGANXW4L/q6vAB3vRNSecsCjMXMwejssETWaf7Iv
	tmynY=
X-Received: by 2002:a05:620a:3189:b0:8cf:d68a:9aa2 with SMTP id af79cd13be357-8ddcf7ae077mr204705685a.6.1775814605431;
        Fri, 10 Apr 2026 02:50:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3189:b0:8cf:d68a:9aa2 with SMTP id af79cd13be357-8ddcf7ae077mr204703085a.6.1775814605023;
        Fri, 10 Apr 2026 02:50:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815d27sm408842a12.24.2026.04.10.02.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:50:03 -0700 (PDT)
Message-ID: <c078c340-0f74-42e5-a8f7-d92d5ecf33fe@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:49:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: x1e80100-microsoft-romulus: add
 PM8010 camera regulators
To: Oliver White <oliverjwhite07@gmail.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: bod@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260409083609.75341-1-oliverjwhite07@gmail.com>
 <20260409201717.108169-1-oliverjwhite07@gmail.com>
 <20260409201717.108169-2-oliverjwhite07@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260409201717.108169-2-oliverjwhite07@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PMM/P/qC c=1 sm=1 tr=0 ts=69d8c7ce cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=u7YyajWv_5wq9kkWYikA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wbHPI4JFBHCXfTIzo_9u7VFR6agr6iMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5MCBTYWx0ZWRfX1Pfr2CV/1OaR
 vmCkiw0G1eumaMVKi17uk+BY6Bbx8GxtGdXGjHjFHaLVkh7zPzfKug4tbpsNZ3gS0/YU0xHAtb5
 pPBcncNwFLgFWWXUfM4teXAA2raCelDOps8hAVdGVkrUz32hWC+/Tlo8RrXWk5B176PQcDMLoMu
 xlAWiV3kykL4W2Wi0V9AsuYUomFvTL96n3cde+jmYNN+9X/xbb2+UI0Dnqek/9fdjAlWryyBdef
 FCctUMTqmlSM4DdrvSxgLSKfAWPmIBDFmXVKsQ0loDx/XkqKDK8a66oGKTQbV/i/ZrgRSDwbBar
 Ih1EVb9aYRlZoLF3JCAXn9m1266eBfPRBKN0BnlEfiWgPXLsmSP8R2VVLTUCkQxZ7GIbn9wBmG5
 WB03P8G3Hre++DH6uIwy4psA0EhoUr7H6zLba8adosV1H5R1/CKwjLqq/kZLzC4QEjDVvhkVwT8
 5LAppC8fPjUMZCCtIYw==
X-Proofpoint-GUID: wbHPI4JFBHCXfTIzo_9u7VFR6agr6iMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102664-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9B853D536B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 10:17 PM, Oliver White wrote:
> Add the PM8010 regulator outputs used by the front-facing OV02C10
> camera module on Microsoft Romulus.
> 
> These rails provide the supplies referenced by the camera enablement patch.
> 
> Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
> ---

FWIW the regulator config is a little different, at least on my device
that reports (in device manager -> cameras -> details -> hardware IDs
or similar) to have

MSHW0470 FRONT_RGB (OV02...)
MSHW0472 FRONT_IR (ID SMO55F0, it's likely a STMicro VD55G0)

All voltages are flat, no ranges

LDO1 (RGB) 1.2 V
LDO2 (IR) 1.2 V
LDO3 (RGB) 1.8 V
LDO4 (IR) 1.8 V
LDO5 (RGB) 2.8 V
LDO6 (IR) 1.8 V

LDO7 remains unused, and would be only used with an IR sensor that's
MSHW0492 or MSHW0562

Konrad

