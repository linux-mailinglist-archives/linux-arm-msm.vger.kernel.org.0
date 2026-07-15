Return-Path: <linux-arm-msm+bounces-119199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Jz/xNsVaV2okKQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:02:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2903A75CBEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:02:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VvTj6ZxL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bct9StRt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119199-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119199-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CC24300CE55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 10:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1B643B4BA;
	Wed, 15 Jul 2026 10:01:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846E543A7F1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:01:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109709; cv=none; b=AEgv4j7r10DGPby2OEYkPX9UTwyXg79XVPfP5y0OAh0MJ0JHygQffw3E9C7ZWq7kfq/0L7O8cgzmOePhbTrTW1sXEJLtBYBvqjtT5hkpYCZZ0Uv3yb7Y4NcPg/YE60rgxVoSnQ6BVQDPZtbuYqObUK6dwUQBTFoMZT6/wrdUjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109709; c=relaxed/simple;
	bh=AfDAVyIx8PFZb8l11WOaABbsnQJG25qMN5s9V/rOcj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uS/SWL91TfLRHoDpimAHPKXUU4ydW5/yHh+DfJNYce6Jo48M8DhfL05vUHBg1QAduokgE2Xq6B4zDm0eEnyl4hJf4hXRfmojUjUVCGJDJRqle7NRs4fJOfKDWKlUx7SqHy+jJHLU8rhzfQyxUh9C/WzsWQ2bRN9be1A1xtWvWJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VvTj6ZxL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bct9StRt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F6hITO2795799
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nya6knkl+qeFOg/i2S2B47J4rUf7nEg54Ct33JkgDGw=; b=VvTj6ZxL1QXEdkNr
	qrJaak489W4uS7N0qDDJAIMdPBdHIbPzt4jO8YMuJSo6qsx7aJLKmTVSgpGC3hG4
	VX73joe98woNysxEHdo+E8WUazb/xeM0l78ZjJJZXHRYBIm9B97gpZ6xwY64UpVI
	fHTqS/anvJtU5yNZyVa1MIftmTvX8MkO2RmjAnFJmM8bhW1Pb353Kc0VGwzdZs/d
	AW8J5aHHPkj/yKk3hBzAiZ6L+xXmfF4qR1R7Dfo3c9FSYIAH5dB9ocATq+aZhIyU
	fZS06NKtJSP2m0PoJHGVlIz0BWGVpakOqCSJ3tvgPlNtbfYsWuIa1a9nwmVrHzIx
	JiYPNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56h8qs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 10:01:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4ecd1ae4so87736585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784109707; x=1784714507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nya6knkl+qeFOg/i2S2B47J4rUf7nEg54Ct33JkgDGw=;
        b=bct9StRtZKgNCUW1PM0XbLEiXcqSNNtIFUkDTa55QOwCM5FWGdoV/oT1UHPaDayUcf
         DGkbEsYQ+EY6rmXIUUwElGoXg8/Hf8LdG4kR8aUE0Bhwm3mGAhgj6T7JCBAZFYpjQIAo
         fb96WWQFuKMy6UnfwKAZirYBURfc4v0/8e5S6DQr9T7V3ucKeJRRKxOJDyFbxaVxFHIS
         dYBjimcLOOQFEG4N3N6q6FNIesgk4hzwYoGfVr0HsEXagmTf8NGRgNii/nonhSPel4Jr
         zRuTapPKpevgrGchMfgXPNPnojlh7YefKCPHuZMcHPlwIf4H5c/I7MrBQnT9HSSETnc0
         8qCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109707; x=1784714507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nya6knkl+qeFOg/i2S2B47J4rUf7nEg54Ct33JkgDGw=;
        b=bSJ2l/VCPCb0smwurwWU/TuDGUqo8P6XnHkb+oe5ZPo5Dw+6jIcHMSh3pjcFaCFOTd
         O+FpFSbQcfXgi2tFIZZ54L1y5Oor7pgT9JjQF/Jyx3pex2sfylYHtJt+TDXQb+wBkVJ1
         cQinGRp5f/Zue9oKfAn/Y48nk7rR+6B6SV34QdnHz3DV1UsYIBMdyhGjBHVTWPwP7jQ0
         Oky+0H7Y3gVWojcnyYC3YL/3gF1ywoYHZ9s6Hr2imBjymZPcUGlZoHEWX4vn54iUsRC6
         sla4LCcSnfH0skYNba5R29FEoCBRi+TmGv6rxgHmXsHGIambjTYn+AUQ260RgGsZGXxi
         E8LQ==
X-Gm-Message-State: AOJu0YwjBHp6a2HCOUvINFR3J8NdMPUDzC66+OfJtd9O/ESxFqhYOjtw
	ByE+fxCKquOGNDYE4a8laeO6jSGCEEu+pk+x4jvq3xKOexKXUd+fe9dSgXy25O8u5o2eYPZaWzx
	GjCkvibrLqVxzz54EiLDYwLW9ZHtSP1BUMTb+I6y5gk1n4dB7xvnyUm1Qupl0pR/jR74rq+5ERK
	nj
X-Gm-Gg: AfdE7cmTqlMp1NxHvCy6hkCnuAkOfRxRTeDwRon+OaZqtBKC7rnYd6SlY4Y/fbBfUPI
	Ja/Xa8SoKIBCFait101mWo06LvOxytx94u61LqbENfsIQGHLM/UeGAZHe1p9IJO+QMP0Jvobadm
	Cx+bqh/2knMmdfJC6rh+ZHFC8kfercbUrBdL4pkPMWMAaxWsT2lBLVXwJBg3cWuDYODuMW7qb7J
	q12FN2RhCBDzKJh5bg9o097g8ebfeuXh1SgwNr11hrq8a5+SkAcPSITwMNgraZ2fgy55Deif1TH
	C+s4NiXqfwdPrekl7sE+r+JsO5SV7uT0puVAp7CTqnoJEz2NYwheljc3uPgZg+6aXNP1vi5LkPq
	V9cBRNSj7I6Mn/4neAVkNr/5meOIeBJinF5M=
X-Received: by 2002:a05:620a:268a:b0:920:798b:e28e with SMTP id af79cd13be357-92ef2bfd3a9mr1358879385a.3.1784109706766;
        Wed, 15 Jul 2026 03:01:46 -0700 (PDT)
X-Received: by 2002:a05:620a:268a:b0:920:798b:e28e with SMTP id af79cd13be357-92ef2bfd3a9mr1358876685a.3.1784109706289;
        Wed, 15 Jul 2026 03:01:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15e353d2f8sm901767866b.34.2026.07.15.03.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:01:45 -0700 (PDT)
Message-ID: <df914537-52b1-4968-b65c-cdad1115a661@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:01:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfX8Qs3JNY+EjFq
 M08F++hBr6YHt5ixmlCy9sslqnbk00KEzCx+MX0lboypcyhSHdwnx0uDWXFhb5i1ihcwgV9HE32
 sW4lnxn42BQ+YKmt/jLc11TG0D0REZY=
X-Proofpoint-ORIG-GUID: prdv78gEk6d5I9cJRTKMlTw23brB_zvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5NyBTYWx0ZWRfX33phJboZPlaH
 GeHEfr4ETvx79RlzncaOB4PTQxK79kZxY9+EDLbFJ/4mVVogDtbgxb0epa+JNxzSSTUhI3gzP3q
 +ehNLLf2GqHfdG5D6eNB5JOfQuvPeZgozC/thd/hy+iXg3YNatILp+5ezyYR2UoMaKfxANrUAHY
 XW87mSMwTxZ8c/BLblQXTv1cyIQKMJveQGci6CCpZ5o0QPh2GTLGkSuuFDUYFxnXUGmPdUjFLga
 POchRT+T3Q1NUrjpWBbcWFrYsQ92lRjKt6J0GPc2VJKc+MBhY1wz8/bKVCiTmqhnjMgv+M0g+Dq
 W9d6/p+p0qenEPk1MJtZbKhFosRXvEVkeIABLJ8vlV0ljsK1WGBaYjHY3TfOFdURCI7MOp6Ll8Q
 UZ2NilwhocRveACXoz06c+sirul/NgIIBCCCQ5KJMJBDsavUii87d3yzNY7VZPvxiADhTYuoRns
 97BZY1aRvkyVTu45Xwg==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a575a8b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Xtb9r-GaOZ-y0FHQUKYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: prdv78gEk6d5I9cJRTKMlTw23brB_zvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119199-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:sneh.mankad@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:maz@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 2903A75CBEC

On 7/13/26 12:25 PM, Sneh Mankad wrote:
> Do not mark MPM device as power domain since it leads to idle-states init
> failure because of probe dependencies.
> 
> CPU cluster power domain node is kept disabled and hence CPU cluster will
> never power collapse. Do not register MPM under it in this case.

This is only the case on the RB1. How about we fix the issue instead?

Konrad

