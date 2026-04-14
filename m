Return-Path: <linux-arm-msm+bounces-103134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPbdHpgs3mm1ogkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:01:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ED33F9BF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 14:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AAE6307EC91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3403E5ED8;
	Tue, 14 Apr 2026 11:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCkcZuQI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFUXdD+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4257D3D34AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167925; cv=none; b=jIhlp5/tiCmJk18DbcTuTfyKscO3O1JVmZ9/FaIPh5fpoijRGqmD0XtHKzewYLNDQaQu91sUEmo17owTjRtxu2BH/jNviT2PvAgJaW6fw4o9QZBHNGGNXmJExT090wv/aji5OvW9uquoHhL9TM3VWC/i3/qoM1aAxRWkB+tXlKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167925; c=relaxed/simple;
	bh=EEFObfF/Tpk7ryEqe5WG4MfQjoGFMoxAfSFegUKj280=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rG5qML99r8nWrZW+C9cfeENvPLAPm0sNx3aka73r0bYiDf0PjT3h+haWwRUy3FKjK6ck7o1TbTkrgFWm4U22HfYJcjc8Uk5NYhmhc2n1rJeBekxFq16HEMfWV3YdkxVdMLkFUlz25cGWNaK2rDfRCGlujdXZvPjV9Y7xIMSey1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCkcZuQI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFUXdD+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBWHW12386367
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDilR4M9sLaIrKdGwKTtDzaVfHUGw3MciLQMoFnkS/U=; b=PCkcZuQIsktbyp5q
	IRuvFaQR0gxX0Bl61kMFDGGSE19hkpxiE87+A0dGLE56bRs06akUveHADWL9zXQK
	P3Kr/G40BAmrHBx8xQGcxEAj9srSiMGecpOvqygF4+qDy/tvTvEnDyIqSNIiMFhv
	XQSnSqUH3CH+e+EPLbk4Jsqxf113i1yaYF3/shNEt0QtGXc305i5fA+s7EtsD19R
	ZsO9aGWBlI9cMUpc1ofkgLcO/kHxesmO8QlEmrtaqnxfFfAkICe7ytugp57SFhe/
	DcMif1Vn9FlGgVfeXaMoZHSgWs2uk4k+YtaKaWhjqBWtJ8Ean5GShqkLA9HSIgFD
	nAGm7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86w2k06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:58:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5073ed1ec6fso14523321cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 04:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776167922; x=1776772722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDilR4M9sLaIrKdGwKTtDzaVfHUGw3MciLQMoFnkS/U=;
        b=EFUXdD+vwrw76LFks3ofuP0zCTR8mIYHdbuvht7cESKbtwr2GowmV4eElhDuDWThF+
         K6ulpJ6v25YKTJg2nxpYHnwrN9HVn9rbwfnV58KLYfWRl87rJz9bzZZZntQBdv5Mv72O
         umqv0rxFS2advQV1QMrYIUgdmsPH5bD7v81pum0baoiX3uAclbO1OHjeOcDL6IHA8ClC
         Iwi51x0kcl5HCVuHgoDtDm1aFgUv07NnAoeRM1QgedSVxm7LZ9iqR6jAcGzrdlgBKWw7
         2GYYS9gc1Dt/b2P05WZwxBQyAT3KsGA63lviGswiP2aoUix8KMHVsnb/w4zvnyC7mrVj
         lCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167922; x=1776772722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDilR4M9sLaIrKdGwKTtDzaVfHUGw3MciLQMoFnkS/U=;
        b=Foo6qlHnhlvcT7PjG+2M6hZJllahohr4W5rBqhN/57MiVKRKtAisx7a2yy8dzhY3iB
         s2AWWlG6/9nfo0tFBU27ZnljmMBMDA9bZNIX0D+GPH4x11uDspKX7zBDjztz14l57H6A
         Ko6sKrgbO5LjtwDUUN1Bpf9/dh9yKECQp44LqVjo8zXX6jnBOqbPJtxK8qmGs8RLhI1D
         WM/YLyE/lKoLEjEP1Ewq8WA/j4oBvfQSPlV5e61GCJ+6faKTZd6nzQ+9HswF0wI1wHf3
         Tlx9JswTZklgIMmUrKOX9kWRw25dF3pi4dGN1xXlCiqkFl59N4Jioi7mlKfIRoYq4qMv
         so1g==
X-Gm-Message-State: AOJu0YwF6TsNW1JiiZX6ZzvNFqFVthjIs2+lsVsToxnTkw6B/BXuVC16
	HRlkWK1DDnGvumWvzJLp6uFPb5zY06WXSy7JB++5swtXiJbfLVsbourcp561PK7syNZksVMQ9BF
	8lJmJfO/r8GJj2Vc8SH2oOQ86b+DWlyR6cmZ6uz7zuuTHiTTAy5Y9RqD27t1R69RGtxVO
X-Gm-Gg: AeBDieu/BXhI7bRzGVQKVusCGClyonOI88FfLw/j0cJAUcbUQOhwHSXSR4ByOx+98nk
	bVqJRQ/D3CoZE+Q+JFMycsF7nwffi74r14fp9klpUBSxq7SNf5dH16uAjye7Pm+fGBg8wmyR2cU
	C80SFnwZWrbfmWNnItE+/crZxMV0EB52ZPgiAVqru+LDhY9V+/DUJoYWqjPnvPKFlFFPLG7j6+j
	eWHHxeU9p35LzRs8d9OXUd//eZP3pn5wMBk9qc6JxDy1OAqz8bEPeJZT5rwTDeL+P32io+xHrnD
	JZhoqYzhKFgcYf6LoDxDOL2J3CvOT/HmsfVnsKdX/gSBl/OR8GS93vblgpJDuj9nDG/m4ThGPCn
	M4QBHid/2kXmV/jCNECp+IZ6GG3wKH3SH0qVm0yln4QwXt1apL8liuI7//mrzXFSOxULwamY7uV
	z5hFzNgZq8Bud0rA==
X-Received: by 2002:a05:622a:44f:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50dd5b0ffcemr182739021cf.2.1776167922343;
        Tue, 14 Apr 2026 04:58:42 -0700 (PDT)
X-Received: by 2002:a05:622a:44f:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50dd5b0ffcemr182738731cf.2.1776167921894;
        Tue, 14 Apr 2026 04:58:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67205b178f9sm150130a12.29.2026.04.14.04.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 04:58:41 -0700 (PDT)
Message-ID: <19079a5e-655b-4099-8cf8-650e8d743e49@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:58:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: Enable secondary mi2s
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 71Cgb26PUKNpOdIWtUY3h_TIjGZb8EWr
X-Authority-Analysis: v=2.4 cv=HKfz0Itv c=1 sm=1 tr=0 ts=69de2bf3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=4xeVu9ZCkff-2oTzBxcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDExMiBTYWx0ZWRfXxfKeK6WBUUD0
 cVM9wLWbkehaEekrsFxguXKQYL7h0lrJIdveFQ3VZoMfLCpt+NEGQ6m2TAOcfqONilq/XRjVmoO
 c2YM3OxBw965WZYOlz7DiuPn3Ya3D0daej1KxaAahKiADVBbE/eKabzYvw7/63hUtIo0YQlKMJW
 PQsOlDDy3sBzL08WbAbE1AcSYyp+Rw6gLymM6JNFoh5K+V1/hBIXD4pOo4O7VTyEcGKRtaONOrR
 ezZ89T3OeTdOT/7zEMUceN+7yu8mwB9xABIttcIfWmw41Qsl577QYUDow431UEm49mOtcIVra3y
 z5wWgiJaqZxTZGztYTNaWi8SynQxTCVAF7xV6YAGU5sNqUspFJSqyFUwEH/vdPic8tj6fg4c/ed
 vkg09jyhguLEeS4mgqr+Pv0pKdXxjlWHBEQj3BoP31i7mxKGTcbHhZBa/YicuAfxeZtgLOlfL8b
 MaaXL8F3Nhtvtp81/Vg==
X-Proofpoint-GUID: 71Cgb26PUKNpOdIWtUY3h_TIjGZb8EWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103134-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73ED33F9BF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 11:19 AM, Kumar Anurag wrote:
> Enable secondary mi2s to support HDMI audio.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---

[...]

> +&mi2s1_data0 {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&mi2s1_mclk {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> +
> +&mi2s1_sclk {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> +
> +&mi2s1_ws {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;

For these pins in their "mission mode" function, do we expect these
pincfg settings to ever change (i.e. across boards, will the drive-strength/
bias/output properties differ?)

Konrad

