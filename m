Return-Path: <linux-arm-msm+bounces-119265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ofRXByKNV2oLWwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:37:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC4375EC09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:37:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RDLiRBv+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FZWwiW7M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119265-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119265-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C44F0304A91D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F00D246768;
	Wed, 15 Jul 2026 13:32:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0FA270552
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:32:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122358; cv=none; b=ZNucHk6yMXcD/jLEW810fryqY9tuN9XkUjq+dz1bdAak89kM6wZdl+Mj6FFnRLBtswHbirjBoo443B9vfCqKsjBue1RtdgIiwrw2bBxiGp0zBZkFndBswf32Pv9cICUlRbjMQZf78Ucb9JQtiw3LiqaC0mh4nKcFEfkI8VM0jIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122358; c=relaxed/simple;
	bh=B5EAiHhIw2D460y9Gnuwzyi+cBebaIxhhASpI7YdnNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q8j/F5m9QKBb/GU2fz1L7VMXe5OL2Zw8jQa2iD7OhEFo+UJ8z1lXoaTPze/mcDrg+gT2XHt+St018Hp4I+FVQpGtr9EOgam50QTbMG7H5wBzjTrle6aXziJPAaRcMgaE4JBTmWr5y7CJTNlLVa0s3D6NvJq18gVcamXYMKmv06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RDLiRBv+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZWwiW7M; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdG2W3579547
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKsgbVf9LkH3xtK0DQxDUDFutBkil+OfdglqS1bQ1us=; b=RDLiRBv+5nqi/APX
	sfigrVjwvJrhvTb8LZVq9bbCrPDRDXDtEnU7mKts+x5LM8y7jf/Hz05MoIYjoHF2
	D6Jc3Y1B+5gaGPzElG6NsX0TiNd36PsukEaTSP0A/b74MvMlrwTS3//GL00RcfKc
	NFMOVSafmVFJdpCwPKUH23+6RlgP5OpTeQbbHMKrBKpVLLaFjqt51EHBkTZEMgzt
	DvHIoHfKblTt6DFyA6Kvnq+jmx1xhMS6ytyTr5dDPbPpHjEnDK+rOvKy9ecROxx6
	fyIX63KWa4wXDHlaytU+LlJy7nshK4iub6M4ubUYZIPOyzoYKiyLyUE7kt8+VO72
	4pYXUw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk331ce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:32:35 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bf259655cbso385978e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122355; x=1784727155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKsgbVf9LkH3xtK0DQxDUDFutBkil+OfdglqS1bQ1us=;
        b=FZWwiW7Mnf2rMQXVE9/Ler37zoemYf+AJJH6/cdYw0Tcwax03+ipMACUPjCC4zmalf
         Pgh9vdMR03fAyVs9oc9UCAP485pccepu2D8qnrqqp6B9I0JNJW2pAMHRFRvE0333hD0L
         5d3pLlwv+8HRUVcf5G8GrmXNfIwePSHES35BIb2Vz2dV7spccZMQE36hN4Fdb+y35uSf
         UyOXiFX2T2kRCJ8nJCI5jBuKhRF6eY3C6PgdZODSK3pBHy8JZTJfq6P6vWmXbsFZxwsJ
         k8FpObx988iJf84UocBxArX2UWRT83S9WIKOtlgoCK9Hn2NHc9H0GVSSdbs9imPJxHXS
         6FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122355; x=1784727155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKsgbVf9LkH3xtK0DQxDUDFutBkil+OfdglqS1bQ1us=;
        b=iLZeA8S25VGBp1ZMygiNgmjVCzdRP2kqyOTmdsPR/xL93pTVg0TyB6KB0d72WBxFoK
         O/nFdLuteY/oP97NrRvBNP4F+3W5vrQicAaZ9xfwI4xDxSnVceCfrqOyIQeIZWGsziMX
         eOqV+r7kCPe27I232U3uJvMWaeJ4hP8fstBrIkqr5xEoKA3rqoEXtkivK777bAQMJPvS
         C7yZti1W9g2ai58N7SEUNhkjg2zJ8ZcTHnHm4Hn/+ErntIvekhr05YbMt+mO1FlVMma0
         OtUr7vjOIsjXWoxyDaDgL8eT3AIpDA2WXxXaP3nQOX9Bzt929YR4oG0JdqKwbCc/9tQ9
         sNLQ==
X-Gm-Message-State: AOJu0YzMotUX6V4M+9Zkxi/RcmrKk1a1vDBnm3KdjYFuqtqcpWgcvi+B
	g+TmI1RwT+wLWG8pqQ8SwOnFtK868M4ifj7lN1aMRwWDCwVgbQySFjPgvuz7/Mutf8jpE5+kUMn
	VudEteQyL5UyriaJ6A6mmxdIMCZfhiiu4fEmvfhIDEjXYHIuI2IQeYqZAhCzDOSm0IPwc
X-Gm-Gg: AfdE7cl4P9MjCizO7OoxQcRZQxgfBYma6xiCsmV1MEOusl8N4V+ryBnAzZ9Xdcpvn8g
	2DpuuXr1M5km1AuGdGd+qS21GbqbNS95xC628Y+v1gviD7ypFarCWfbZOYOE70n2e8GzNjexCBN
	quFKmpnvekateahGKbFBo+oOFblTqQtZ8hlejefiPpQKomRUJ4bU/B5JJ0K+q1DSZyzwo7Xsovl
	papldJ7LGp5POoVQzRPtyMmqRXcbR9AWOZT9VlyXORHZRbxd/WuL3fxjIQdvSVSrU7kpTyBadiF
	5oTH32dTH/hwZ8rhYAKnAzBNZAoetn9mbKTHXJpi/B7ADtD7QOmGwHA/yumJ4rT82sMSbmKGA52
	j2lBZpF7giW6p+S/PWMNbiEChlf5MuHVVJQQ=
X-Received: by 2002:a05:6102:26d5:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-74533dd8e48mr3933348137.3.1784122355122;
        Wed, 15 Jul 2026 06:32:35 -0700 (PDT)
X-Received: by 2002:a05:6102:26d5:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-74533dd8e48mr3933339137.3.1784122354623;
        Wed, 15 Jul 2026 06:32:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687318a72sm26803366b.30.2026.07.15.06.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:32:33 -0700 (PDT)
Message-ID: <40464948-1cba-4384-880b-e23862b3cc4a@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 15:32:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] purwa: Drop the Hamoa PDC workaround from purwa
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a578bf3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=-oYVUopcx5EyTNeoV0YA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qZ0EPbMWpCzrv88ID_dNiXejRaHVaeKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX49xX/KOV2jhw
 X1nqDW1tZlStH3ObHcASiiOJsUsHlH84ZEKUiR8FNRXnL8vqfQLsEQE59GGBWoe4rhRDcc2zgKH
 4bGQ7kIKJsLt3gHFeXnLvDIuh55+rMxQZwfwGjTLyfOU3gGf8edrCbOnGo/UziQEALyR4/NGHQ5
 t3AQfV75uBx7zUdWWBtsvyj1pmpkOOqLPd7MC8by5SONeyq9+RPVg9wsaaD07YUC4v/djUFWjuK
 NQPqFesiAU896uLXHPxg+C+RBgE7xBZ4zs8TowZtqklmply+yw0OM0mUvvgZYEUB7hEjPGGUtUx
 qcziRKLECAw5zREUVOB2ZLJBDnYXGDeRKjEHGky3OGhx+3k4EadagYU5S/SqFH0/9As8Er4fMiW
 Eq+CnhI9XF6jMomf7qWo3SiNhYUgu58bZ1r3nbk7NkI0OeLICa9MWcoSMAff96lUaa5BiIU93Su
 wRSWm/RVaL9I7K8PuyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNCBTYWx0ZWRfX0mxz/q/1pWEm
 HbwlF8HbPqOCgtX+wXOECiEPZPKdwSckcPaNIJjGlFAKeduxMk6/0K9rEa+fp30DAYVkSao88vo
 YV2gktCaB1VROjYUeznKhYBlEh1Q0NA=
X-Proofpoint-GUID: qZ0EPbMWpCzrv88ID_dNiXejRaHVaeKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119265-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AC4375EC09
X-Rspamd-Action: no action

On 7/15/26 3:21 PM, Maulik Shah wrote:
> Purwa shares the Hamoa PDC compatible. Hamoa had the software workaround
> added due to hardware register bug mentioned in commit [1] which used
> Hamoa/X1E80100 compatible to apply the workaround.
> 
> As the hardware bug mentioned in [1] is fixed on purwa silicon add purwa
> compatible to avoid applying workaround meant for hamoa.
> 
> Patch 1 and 2 are not dependent while Patch 3 of the series was dependent
> on [2] patches which are also already pulled in linux-next.
> 
> [1] https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org/
> [2] https://lore.kernel.org/linux-arm-msm/CAMRc=MeU0QuRozMscv02M59+a66S05Jm18CyvNE-qSYrY=S7hQ@mail.gmail.com/
> 
> ---

[...]

> Maulik Shah (3):
>       dt-bindings: interrupt-controller: qcom,pdc: Document Purwa PDC
>       arm64: dts: qcom: purwa: Drop the Hamoa workaround for PDC
>       irqchip/qcom-pdc: Add puwra compatible for PDC secondary mode

If applied in this order, we'll have a regression

Konrad

