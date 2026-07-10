Return-Path: <linux-arm-msm+bounces-118281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id j2OnKITsUGos8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:58:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE573AFBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 14:58:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dCtHakIN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e6JvVs0K;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118281-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118281-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D5C03072932
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 12:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FE1428842;
	Fri, 10 Jul 2026 12:50:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCFD41227D
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:50:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687850; cv=none; b=VcrOVmZvOzdNx81Apkxu65KoiCEPlDVBmuzAB46G0Gz+whevYTR1fpOWYA1r8E10VH69w/anYoBJwddN4p/opYntOVKAySirF4OamVnfWuw0/TYgt/hpxzpkWPOSD16fN5eB0QO/0u/EhBdRZHzzkZGOiKOeyNgpd5RZ0ixprTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687850; c=relaxed/simple;
	bh=jjlisgy5CZ0XmabLmFHM3h/gF1yjVY5iGsCD6/lUfTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNT3aJ7glWyJKq5kyyJnfNRd3sRm9Qy+pgboGGJVGa60XbX1uqGE93wUpts6A56PvkGA10WIk8RJiOAta6m46rZt22AuC/yNXJAyjTZZxneuRIQZFfC/JIwN/AO0yh5SqPNSwL2ipAsUOAqrGI4c2k28LRP0aa3Ea8qeccgO/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCtHakIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6JvVs0K; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAnHxo619652
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkeLrC14RFHiuztxCY6h9Dad6rLuO8ti38xOpJ4QhoI=; b=dCtHakINXNv+QL5q
	OdUyf4n0w1Jl84nAb8idoB6pPlY1RxPNyVlgOl5Ey697B8SUnaN/+sbf8Uz+c1nn
	VRFvT2J3qNuOwgT0dOC0GeuqgXlPQVcOwpTVaxCQPXWKjKnW52nqmgytdQrrcI3z
	9SSa+XgqMoo+uORUPNSVKpqOM98kSLTy6SAE/aRqHDEhHPJr9JjRipjUl9ILs/xD
	8xEs4G19qJlf5hIjsXAAePd919tfq/JYJBswZ06OJLtbaQ+A2YyysCn/aYpaWBjr
	FRUPQCcrG6Cwgokl3/VPJStF/IS3dD9+q7iMGlzfX8kke0h74Fo9di+ljlLpqOcu
	kkCvFw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fay3e0ec9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 12:50:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c9d953b71so1634681cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783687848; x=1784292648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hkeLrC14RFHiuztxCY6h9Dad6rLuO8ti38xOpJ4QhoI=;
        b=e6JvVs0Ktafo8QNczkAk0djUU01DnYWLzGfnY00//HB52eCOLrn9+5c/ynbWz778bM
         cVjHCREowLq0m9f+WPp2XdTFZWc+PKzbspoOYisBGj/ZKviy2BqAUt3Tx49Wx3RNDfES
         7a48lKOhj45ldP3CYtKCuPPFVkkGYUOzyyi5LtAMnXGn2TwYIVJXTZgN8m9IQlXHNdzp
         WW96AnznY5wTvQFV1bYvMa5Wr4JkINVlbcU7Gta6flwuqRAQ44WnUtMrjClLTOE9zzu9
         zPxxtNyWDNcw8suMEPbog3n9ueLmW6LtRUtblr94IQTikjhlbu/YK6jXu4bmKNRMu1k8
         6SDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687848; x=1784292648;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hkeLrC14RFHiuztxCY6h9Dad6rLuO8ti38xOpJ4QhoI=;
        b=jNSfhpjMHvYHUWoy7f5VAcSZlKPWcDeOUqWOGzZB6npGStnmqwtX2k+q63T1rwPsEz
         po+Pp4O+LfeOsiEKlKlGlq7L2Wrs98TuMvn0IwgGJPwibxr/32/GJCOZLcRuGrSX0Gol
         ZWfKDaZ5l00tbQft62crgjiU443edSPlVRrKX7g/K99DWj00MiA7p4NT4tp/4hjtbfTG
         kSb34STqJ4AD/LfoUemxxe9/fJWh2oHiuLKlbelRGnhboEv6itwOwavmR1AzhV5PpNkc
         m4uIFEFL11+WqBWbW94+Mfkgqgc25MNzmLSQSHhRhMVyQ/gxk8N3zM418hs0WpDAruZy
         xR8w==
X-Gm-Message-State: AOJu0YwIcaxcIfMBOxBeXrRG26iZRiIin4EhVh1fgvFwwV55V4NzC1Bd
	2B8RHQyt3stujsib3LmrfhiYWd/NTR24VIvTQMkFgygB/JjRyLSIwdpm9fTvZREngAAdeXcWjF5
	08gaA6G+RkOcv369x2+zX5TUDkRf6vJE3uVGX7tpu2ol0zCSvGFwqJGeeutaR//LE3imb
X-Gm-Gg: AfdE7cmqtbtOqN9iy9A/l3U2qrZxFTSSko4zJvnjbRvR/ni/GvEVU7pk8LPVAfg4ceU
	hm41T4JmNgGeTilfSzvFsgQ4Bz3YmEwLUPtXfIyx2jCvV36c1hmrBepCkZMR7ARHdVxS41MxiiK
	/D3bCTMPlVf0zOMfsPjiJSnOZ9CZMuMmRwLli06KiYAzWMYjqqC7bs7X/7mnKe2mfzgPCaFPXBY
	WWNqEP8Piv650MjJfKjM1/SlYyXtCsagpgFsePCXe9uhwtnj9XLjGfgBNabjLk6Q3LObDP0dB4w
	tetbZ88uUHGVv9VHBW3W9WJ6+Xq8XeRJNix0VZjggQkxAaA2gGvq9+FcRFo0rcMMln4VUUXGK8N
	K3hv9NMP4NNBx5oV83I5mr3Nf+7DnJvUdfdg=
X-Received: by 2002:a05:622a:14d2:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c9684680fmr69782751cf.10.1783687847982;
        Fri, 10 Jul 2026 05:50:47 -0700 (PDT)
X-Received: by 2002:a05:622a:14d2:b0:51c:9fa:bc2e with SMTP id d75a77b69052e-51c9684680fmr69782461cf.10.1783687847628;
        Fri, 10 Jul 2026 05:50:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15adb30f98sm644150566b.55.2026.07.10.05.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:50:46 -0700 (PDT)
Message-ID: <c410d69b-121b-48ac-8a98-edbc25a562aa@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:50:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine
To: Umang Chheda <umang.chheda@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260626111301.3479559-1-umang.chheda@oss.qualcomm.com>
 <20260626111301.3479559-4-umang.chheda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626111301.3479559-4-umang.chheda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX/SE/63mGgxHW
 RzHybV6v2k5bbKKHj4FrlK7D8nc63YLDOkApGedBTXjexYivAlw1dfgVlh5qgZXRdneO+jrFheZ
 09I7ObNjQ/BlqjnEl7foMgKvEUVMnos=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyNiBTYWx0ZWRfX+ueGniOqlIKE
 ltRsF7I5TTThbP7kEfe+MIXdzC9LsAyy+IhZ+3m756daQaKtlU3LAbH//GA07DljoYoLQRephsg
 g88wbcXqa8mLY4ejtWg7FnMd/3LsFpFABhcG5CTF0H5ffT12TtIQZLsxfl7VB6TOXkU5ObchDww
 syTeeCpaoL/zrEPmkKKg1fcxudEfqgo4uM/ydk8KxZKtVAGCUrUOHAu/c++nVjfxZ0ihdEcu+zZ
 m9ST5wWy9bDmLCh4LPzrj3+gdcobQ561+jZ38zn0ko0AVB8KtUevUsrb2snj3JLtA53OBqK5gZ/
 jF40VsvAuGhxDU58fypDaCTk4XfBbpjHFr5+7U/tnYo1HqtnFp5wgKXI3//fRURTq/vXOsblgUT
 zU33BNYkrglSSCEWAay+UTUjMvoKZSDDMDX3tTCF7Pocv5Zl06uZEX27ZedxMCdqBth/U3PhY9C
 anYQzXqVSjHlrWTgIoQ==
X-Proofpoint-GUID: YF5dwv1q07-HaGIpAdx62FXeBDztsUYB
X-Authority-Analysis: v=2.4 cv=HqpG3UTS c=1 sm=1 tr=0 ts=6a50eaa8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Esvlqrxgz7qNtk26sMYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: YF5dwv1q07-HaGIpAdx62FXeBDztsUYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118281-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:umang.chheda@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohd.anwar@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9AE573AFBA

On 6/26/26 1:13 PM, Umang Chheda wrote:
> monaco-ac-evk board supports monaco-evk-ifp-mezzanine attach.
> 
> Add combined DTB for the same by merging monaco-ac-evk.dtb with
> monaco-evk-ifp-mezzanine overlay.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---

I'd just squash it with patch 2 but this is ok too

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

