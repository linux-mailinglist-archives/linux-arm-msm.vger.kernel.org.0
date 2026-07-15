Return-Path: <linux-arm-msm+bounces-119224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IEB7EFx1V2oVOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:56:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D585675DD39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:56:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AIchG1+l;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="P/c3CprI";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119224-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119224-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B87233048922
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFED44B663;
	Wed, 15 Jul 2026 11:51:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51AC448CFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:51:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116296; cv=none; b=AoVJQMx5i5JRstl1nfL5MlxH2lGmjT5EvIV5CdiLP6Q+QehIysOH04jxmtJ3wTwgX031B75vUUvpImPy7xxUvfc/ghKfQaAGU4px6KJ3lBxnChY1X7YedEC5zhKzelry+b2teqCfbk2RkNMpdIoG3fg6ap/jSdJKM6DhTx5bGdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116296; c=relaxed/simple;
	bh=OO5h6kdUaYOo/76RpTZOa10D0aqNOOeEePpZ5Tq+Ags=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ip8xvNZDSj4kBnb9ywRLNJ7GegTA7PedYqQizt0//lNHIfyFABv59yL46SpUCQ0PxFJlqU8Ed9WkGQSZu0GVf7DTuZHWN8JUXxD+KYrPsYp6yw63QjbGGiAntqmLuVR1Z9cPMeSvK4K7ZVUtyZevx/4KnktpqHZH+wdFYAS9r5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIchG1+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/c3CprI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcps63628763
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/O58R15+yMO+3Tox5KTYki3Bk20n5qZWQb7RwYSIcQ=; b=AIchG1+lfKBwK0L+
	XefWd7c6x8iWNaoXJPR3JNzBoOkr1r3B+8aWCrYFIHaH13hEd2c3QlFATjlfabLP
	oHT/VApgWiGApcUeuTBSuUxSE61gT2qRRJfXtA31Tx2NLSoUy8Zt4gj17ogWfESq
	cZu1gI606v/AZzpSKLrF7vMNuBiXD+rUFOUICK4v++0XldM1MbEtmoyaNBQnv55z
	YuzXNEN6ih4gOFDuja2vIKdx+ngcnPgRgxHy03e397mpmZ/CY9EEgANF0nXNmlls
	sPcCiqK4PVFuxNHj9BqcCLlh7Uc6Vgyr/p3PW2kYD+v9uyTyrLYptKwODdHR4g+M
	T2MKXg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9kugy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 11:51:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38db4fa2e25so7488031a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 04:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784116293; x=1784721093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/O58R15+yMO+3Tox5KTYki3Bk20n5qZWQb7RwYSIcQ=;
        b=P/c3CprICE1p+vkd+yyS5kwaq30x+igI171DbRIkGWA8Asu4y6BfGX5mumv0qkp/dz
         /HQax4B/Ydou+XjbZ9rYuqC2L1br3sP9OrTFcejnldxQIk6pR9tye+93aHaJBKCuC08p
         pKWAUbwCdIfZqtK7zBtT7dBc+tE/5JKXL+1l4eTjAbls28VdslJnpjCZqtqW/rOyE3xE
         Z9BAq0BrAchqwo/6kSXz3VhAZdSkT7j1uZS3QC1xnBkXjPcG9Fu3r+XT0RZuF8geEnR+
         FMBqefVbqofEU+bdfHbTUoALPMRnLoKkLrgK9yS4PudGEyKKkHsP1XDDvhSWhaeGwB7G
         9ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784116293; x=1784721093;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/O58R15+yMO+3Tox5KTYki3Bk20n5qZWQb7RwYSIcQ=;
        b=nPZeLc1tByi3xKwpMb4JCsX9t0AqlZJrlIJ07JcaZIy54IpL7QwkBiBtnhauSIormp
         Q/td5zj5GAoNBBqbgcYFGncIkffDFuwnFBWJAjTfQu1ImI43/h39TXie2NngNN17EEUg
         zJioFXao1VgeVxfxAgwEUOTnidP3cFGTKAZKlnmmb5bq/IHCmKZt9CbNmrmfzVSnIyB0
         J9FWZi7mhkYPO/NUNjmqSC6xXKYtgQdGA+1514/Ztnoao5whvNgAydWiu/TeaU7BEp8u
         z2l1dGHxQchXUK3NtHHRY2T5tsa+l+Cu5K83y4NRrqMZv8+wrS/lG4hZj9tisLUv/P/b
         ZxpA==
X-Gm-Message-State: AOJu0YyGSTnSo+5Ww6e97L55+TOi3He8HszbE9b7tw+VbCCppvfxL4dT
	4ZGmuxbvpD435wBIIZoN+BHzP0LRSJ6AJYHH7/CmXg4hYqlOcvrYH2PBpyzbaKJKt2c0VJmxQ6H
	wEjI6f4mYgGJvXhLF0s2AQbU64aBKFDThj8ds6lrmSKUr13YtPQP6QXXud46MngIfhcGF
X-Gm-Gg: AfdE7cmzskyMKDEZYADE6KFVMpRNDRtvjYeqjGRqh1M1HohFGgOVNoHRWV3723g9JZF
	nl4SlJLL05M0fobN3AG+0tH0bCnKN2o2YqeZy0RXZgSJ9oEx7TvxXVpOZ12Df3Q/FYSjn9aMrqP
	bteGhq9Eb/ySHYPzXWgaF9WXsgE30aBNG+eSQG8APsIQNv1yjHnC4oE3971z1ne94fHjoDdXCH6
	VDTXNn/6IZBcP0L//XCNDeygyT4znJ6XX9LQs00QJ0pK2109TZLD9eRoDwFmtn/eEoN91wJO94V
	6sORLnup0k6YoJVeSN83ocdRrE0xkPWvZgRgC9xPYvfxa+3ZEhJZDw6VeSH7Kavka8hLfVAH3Ff
	G3tl/WJTnK1ROIv2Bpk4Wq+DsaZFDJ7ucc8XpipqO
X-Received: by 2002:a17:90b:4cc4:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38e1afe7da3mr6232676a91.34.1784116292818;
        Wed, 15 Jul 2026 04:51:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc4:b0:389:8f6c:4d58 with SMTP id 98e67ed59e1d1-38e1afe7da3mr6232651a91.34.1784116292391;
        Wed, 15 Jul 2026 04:51:32 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6ec32bsm614380eec.29.2026.07.15.04.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 04:51:31 -0700 (PDT)
Message-ID: <4dbb3683-52cf-4fdc-8b7b-86577f32f548@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 17:21:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
 <20260713-shikra-dt-changes-v3-2-15102fca9570@oss.qualcomm.com>
 <8b8b6ac1-d699-4ddd-8d86-9c26ee45efac@oss.qualcomm.com>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <8b8b6ac1-d699-4ddd-8d86-9c26ee45efac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a577445 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UlPZsjrVhAJa1NhkB2QA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: mm4PJNBKUS4Ej6MllJ3gxjGRaUEX7EUI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfXzj7/GyzwonfZ
 97pkIq7MpRD4ujg6a6f+hTzOGq2/ScJ+TVBasAgdZTlEX/FhCMk43bMKA1wf61XAFdHyEU1FZQE
 Dd/TJVlOFgEQjck8F/y9XZ0OyM0toGQ=
X-Proofpoint-GUID: mm4PJNBKUS4Ej6MllJ3gxjGRaUEX7EUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDExNyBTYWx0ZWRfX4EJtmtdrCm5c
 ODbCvZPff9zxKCiu8V6k3JD5fOlaKCoz7bGS5UHENshZsDSTupQK7HYSbCcd1WGnB+g3tsOv1fM
 4tGmsZyJ8eW5jh1lcMGYgxb8cg1DNJvEMu+pslDnGfkLjOBKAtqIBkmhWqDNVR1w40Og36aWpLC
 AA1HGCVSD2LoQapK7/vkwChtgIM55WZs81FBQMltUPcZUUTLNeDXpQ5FdFUSZF54RHRH1vcO6VY
 Ox0sXKWE1A/m6tM7NUWjMtG5uvb2DnSUkuv3ZLgSh5p5Esado1XkhrEcF+gC5eqv/2h4lOteq+a
 sieDlwwoirshKDE/2tDKWvFCxbDyKKvaLY0siUK02zHlXDNDIlzCVtMSYgASSHLCW7A0OlfiAz8
 Fm/gYUVwocBlsMi8IN+/wrkmsaBBp3A5OLAjHNkHS2sTm6lSEibNlpj6u71CJqaDLeJ25erH/dv
 C/EKVEMTQDy9ks7ubfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150117
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119224-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arpit.saini@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D585675DD39

Hi Konrad, Dmitry

On 7/13/2026 5:43 PM, Konrad Dybcio wrote:
> On 7/13/26 12:26 PM, Nabige Aala wrote:
>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>
>> Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
>> board and add the DLC0697 MIPI DSI display panel node.
>>
>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +	panel_bl_en: panel-bl-en-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +		output-high;
>> +	};
>> +
>> +	panel_bl_en_suspend: panel-bl-en-suspend-state {
>> +		pins = "gpio91";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-pull-down;
>> +		output-low;
>> +	};
> 
> No change from v2. Dmitry suggested the panel driver must be updated 
> to handle this.
> 

Addressed here 
https://lore.kernel.org/all/4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com/
Please have a look.
Thanks
Arpit
> Konrad


