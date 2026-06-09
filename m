Return-Path: <linux-arm-msm+bounces-112151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wNU8MKMCKGrL7AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:10:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B3165FDFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 14:10:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mjl1JUb7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fzHC124u;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112151-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112151-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CC51308B718
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 12:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213AE40BCDA;
	Tue,  9 Jun 2026 12:06:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257E3FFAA8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 12:06:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006809; cv=none; b=eF7O5GiCMRfgppHNs9k1JWBaNNKwSeXKVFQTQtmY+UvaA3rX63u4CpZp64eQEjSwj+iOlr9YZdZpas5TJ7rVBSe7pZNgfL78R5qCIAqIfAYf8G6azU3uw1PBdDkRykPocihvhcRHiFcIjdyqxc4qvcmkKXhE3eMRa+CGSj7+bDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006809; c=relaxed/simple;
	bh=GYrQglqCkvMh/7QCT6j/Feex+tG7+uGK/6NcYppoReM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I/C7j7ozeCvHQ3ourWzFpi3FCnPFNQi5MYSKaoEZ2Wk+VYT8/fhVTTBgq5iXUhIDuy5EyRwG079va9WoBSIRLcIXD1TCg2Aa9nYwu2rZYi8ZgCYHG7suH3f/w85P4P8CqFUVTDY5G5C3dFEYzkrSS9s4Iv1N19CBCH8pjqaVjIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjl1JUb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzHC124u; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659BnHhM2559344
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 12:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrgTSnQ5pusr28eTiK6slUtsOUdsXM14expuobM4yjs=; b=mjl1JUb77yJ80ihb
	BQPs4y2lKxB92Xdk+TMsz2n/b/sg5e1NpR30pmuxTTpibb2+HpPOOhOJ4hYwRJDL
	C3U+2j7cvj01gzFg8wunnN6yaZrNU4gQhHBUyiMjPr+e367wueafSIk1LjeqUp4r
	bNHv8VBnfPcBKvlcBcbR3XvHyO6idmkGmvRakDBd5p0MnivJJ1IlgHWt8T1xVeAU
	nwznePQH03Ea1+/ao3zoe5uPxwoMwtDovl9y0DfKoOPA9rdJRtJ7Ri3l3jAz5xDO
	wOu5U5FagqXSUXPhXshLecyLHPftQEjIoT0WMqVM3lQlp8i/FFVMbDbhGnwDvtja
	h/SNgw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v0n4q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 12:06:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cf9fa331ddso292721137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781006806; x=1781611606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NrgTSnQ5pusr28eTiK6slUtsOUdsXM14expuobM4yjs=;
        b=fzHC124uy1qUs3XG4JGiAp0Joavnw3kjbsYHcH0IPI3/bEvdenSoLh5c/ZpIITa/l0
         P+kU3IYuIkuyH0uEnqEbiEGNpLcEbz1wmtjiyEYj5BeqvM8u2SXRw3CohYyfZKD/8MHA
         wS2N4g+f7eASuMvfDKjk7PvRrv1UkbIuoaoyarntmDnHuAoJGsysvuj6veLHUnrjU7Op
         aruiwB+PMOQWTJis9guk+aMs77tD+UOcaEqG/Hd72Oc7596MDy3XrLhFZax0mYkw5SKy
         CR0JRWODbMHmLBVGQ5NkOZDV/gQlABFpu2SS8ttEnVPLJwEldO5N7TFsD4rL8H9XXEnT
         nc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006806; x=1781611606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrgTSnQ5pusr28eTiK6slUtsOUdsXM14expuobM4yjs=;
        b=lOyqxlad3q9//0F/f8NnHUVndIaMDbOEUZtkyz5KA1E/3X9kocEnWUtG/VLHpTExea
         TCZ6Bz7dH4sgbpaa7kTyPYl8iA+o9KwwORixCBqE0yVmhrxRGip06FEuMhOZmf4kyJeC
         b2IMvNmTJppLMaTwoil7dhQ9tM/jGPUI/7oHUQX1CpoXzN+gUp+EzSUEvUUdM0SdnMAf
         feLL6//JDakYfly247qLPm5ZTfzSYy7Ux+tRwMbE1i9tKynkPPL4sDXrKYc/74MBV4z9
         rFuB+mpRafoU9ncmIzIQ0C3fJnlEFcn1bUvqgOynYTx0fsS0mzcA8Q14O3fR0RkP9T+h
         tBCw==
X-Forwarded-Encrypted: i=1; AFNElJ8XSBJCu9Tgmt4rRIs388RBLAyLPNKAqSrSiELYmP3UkiH4k89rxB/AHccGT4fYGiNDRhQI/fZflfV3qCfm@vger.kernel.org
X-Gm-Message-State: AOJu0YwU3wQEHWDKxqJEX9Avm8VZIwAwVvKZ12wRjwnQAUIJhWyb2h2Q
	hCtrxuhgIPaWcChwrjqACdgXp2M45NWUYfFylTU20izRuSRWjbSKlxSSFLubBNKIOtUyAlHRdNt
	die17Q2STB1RImBOHSCy86hJKcgQzfjMSqZfVeB78N+upr1U46dGNKCRHVsO3aea3PPCK
X-Gm-Gg: Acq92OH4xSt+xY+Y94KeE5k9kDCQqlkMXOfxZSvIPooYRQxsaVsCK16fujOukpHDsCY
	qlXosL8HEh5F2D5o9DVKnhx9Scka6Ts9il+EaScOe5GLX67d9Eu9VafhFb70JoFqCmKksXXXdEV
	A9Oc91EIDLPZHaJ1tVdX/cjsd7XIIkmY3cyS9D+956wjPfW9SpuX656KnRkBgpG1Qsxm3OPJ54a
	pG3EjrRTIQjWuiSWPUrK3hKTXCo5LWRfz3S1Cmz2ioyH7q8FUolW3F7D7gH88nuQ+ilTjSVEOSs
	X7H0y5tU7b8RGXkNQL2cYWXVrivK6xEjvTK9SWmlwdCG1nbDpc639Zt5X2l4rmPddt1dKuhQC/H
	QMkz4r0U1iV7bs3Z1cTbj1JGsPddRLWMpjUYVcIam2BG1K29wwpK2POrT
X-Received: by 2002:a05:6102:1487:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-6fef3c04af3mr3115211137.1.1781006804626;
        Tue, 09 Jun 2026 05:06:44 -0700 (PDT)
X-Received: by 2002:a05:6102:1487:b0:637:25ea:99c8 with SMTP id ada2fe7eead31-6fef3c04af3mr3115195137.1.1781006804175;
        Tue, 09 Jun 2026 05:06:44 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64c2f34asm8822920a12.4.2026.06.09.05.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 05:06:40 -0700 (PDT)
Message-ID: <081443d0-5194-4d4a-ba8d-a720d7f2e706@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 14:06:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: Add Microsoft Surface Pro 12in
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: andersson@kernel.org, bentiss@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jikos@kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh@kernel.org
References: <4ced3207-a132-4ec5-a0eb-79f75f5cb4bb@oss.qualcomm.com>
 <20260609110429.11427-1-harrison.vanderbyl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609110429.11427-1-harrison.vanderbyl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a2801d6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=yMhMjlubAAAA:8 a=lniaELAF3QKj_k3u044A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: sN0iFfuYz4NVOISV5t-gPI73gENeb1Pf
X-Proofpoint-GUID: sN0iFfuYz4NVOISV5t-gPI73gENeb1Pf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNCBTYWx0ZWRfXz+nfvfUUf/Bp
 5lVVJ9vIgf4MX3NHXD7nfBpBWlx9SA/WrkyLZc7PMACFWFBPtnzCY1o9gk1P9V59oQkDxsxev+B
 OToQTIYOxvcMJg7hsz7Q4hioms2+eTzYHU7xvJPTVf/0PDWclmwDgE0u0gT87zUnu9GM474WDYn
 Ob156xHVpoY4A54rQewrr0YNuf1UmFQrhMYbP7kdzpZVx2TqXapO4dWagNzCJbWkDWg46/iq9RL
 Qih4As+qvaUOAkETZfd1qdi/FRqgzzlm3EG3/l8EtyEHbVMAz92zPhC0p4I2azoZeEXa4hzQlh/
 lOdK5xEm6yA0NgQTPMTXq0NhslunRG6r85sH1QgcmGzvxrKmKeVABaqGm8xVwW8Gm3+mzqXnSa+
 wpgqwWFdIoEuw4H95dIIzB7Cxaa9fis93TVM4DQjfxmZAz+XFGCn2HdiS9wpfYka1oA8w1dvxBn
 J858Bd5C2prD3f1M+Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:harrison.vanderbyl@gmail.com,m:andersson@kernel.org,m:bentiss@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:jikos@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:harrisonvanderbyl@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-112151-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36B3165FDFE

On 6/9/26 1:04 PM, Harrison Vanderbyl wrote:
> On 6/9/26 11:30 AM, Konrad Dybcio wrote:
>> Because we'd put the subnodes for devices under the 'status' line (DTC
>> enforces that), please move the comment below as well
> 
> Will do,
> 
>> Or since it's @28, perhaps it's just nxp,nxp-nci-i2c and it could work
>> for you ootb?
> 
> Unfortunately for me, the device/antenna is not present on the consumer version,
> I was able to confirm this during a speaker replacement.

So perhaps "commercial devices only" refers to ""Surface Pro for Business
12-inch"" [1] which is presumably an actual separate SKU? 

I initially interpreted "commercial devices" as "not prototypes"


[1] https://cdn-dynmedia-1.microsoft.com/is/content/microsoftcorp/microsoft/mlsd/documents/presentations/en-us/surface/MSFT-echo-surface-pro-12-inch-snapdragon-techspecs-factsheet.pdf
> 
>> Please align the <s (or is it my mail client playing tricks on me?)
> 
> The alignment changes depending on what text editor I copy paste this section into.

This shouldn't be the case, so long as you set the kernel-standard tab
width to 8.

Konrad

