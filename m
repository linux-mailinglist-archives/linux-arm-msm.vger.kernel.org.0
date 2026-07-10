Return-Path: <linux-arm-msm+bounces-118128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dNNMAcxnUGpcyQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 05:32:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5F736FD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 05:32:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i2w2tnKg;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QMOKXoc1;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118128-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118128-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA6943025C6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 03:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B0C8248B;
	Fri, 10 Jul 2026 03:30:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA971335566
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 03:30:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783654234; cv=none; b=g9bIVq34PL3SJrswTpC1Ek9mPG1skJIA2qpZm2YLHL+TGLV+YgK9eQxlX6i5FcxIjTX/zNkOxEifjfV9mjJkUd0ZXSJKwR3Ni1LyVlMqjY7iLwOR1oV8OPmjGFDfMKnUJ59v9lISUIksgzLquN5tqlMzrxNBMNT2cYwobRvGEPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783654234; c=relaxed/simple;
	bh=Xq7d/FsWXftgTpuwlB9p6ZlGor24rvZyf5nAekp4QLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TKIUHz74uBGa6H8KwuSwjxith6iwGLYDQlFoDhdWg/38Xm/1pqrx5uPiUyTRBG/8G2w6MpoiwrIUNYPTKc127bVWWCdJbxH3Akx3OFUfk5q3fF1RSWEdk3InZ57bGnsJuCX6+DmUaZGhJkJoFyJbqWwLH7se1UDuAuNV0I21j88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2w2tnKg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QMOKXoc1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669KZKnF2917939
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 03:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VX8a8JResP8XCSCJbfEz2gGZ3th51SS7z/g4qLfLxKc=; b=i2w2tnKgEyl4Mlfj
	U8enrOZFpMvtR5iuVS8YP4x4kmO+Sf2rp5UA8hnuAS/yvqekipGk63VufHhquwMf
	oTTNAoHg9jt3t9wdranPm7MV+Ceh+DiSJspimHkFa6p2iWa5mAoMQhXzJ/aIKJlT
	XlvS7Bs/6J1acZ9ZxnvLGs04ADrP8jrD8HeJQ6GDuezV6P1vC18w1opLReMRJxfD
	i3dJJZVI1xVdfloS/ryqrc5r9zKADfUoXd4M7ZlQ9KDf3kwWFehgscLOqtZHniAR
	a9xtzfZGlvKhsTLnHUxyQv7GJ/SIUjq6E1Sotu/9RAMXRsRkiYgIsXukQWltO52h
	GJU/JA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajte14pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 03:30:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8484b9fb055so1298205b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 20:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783654231; x=1784259031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VX8a8JResP8XCSCJbfEz2gGZ3th51SS7z/g4qLfLxKc=;
        b=QMOKXoc1PcRIV9EtUqbJ1LS57RB+QjgS7ZvryWjlKochIlbJRMljyHT3DBMKp3sANU
         9TqKiYU8f0DCGhihTAtZq+E6rEv7uDVXY20ZudzV/iO1ruCrCTq9UdjOnqb1/GIZYzXy
         m87Zqq0HV8kYmirkZrNKVCXFVJjvkrsB2j5YTs71gmsmDIPhskrxrHxG4EPdUVCmg33W
         t4dc9HhPzIqx64QJWG6TR5G3z6gq7bPPYtY+rkZ31YLp5gTApCqi2IBonB4I8lnx3SAw
         NcD0tKcMj8N0MHAzN2uoSNn/OBc328OQhw6Fq43iuTHQXBszCsr4FHfPEEafeL3iI492
         VdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783654231; x=1784259031;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VX8a8JResP8XCSCJbfEz2gGZ3th51SS7z/g4qLfLxKc=;
        b=JYdYBU1PU+7xLtX7qupbWkqqqlhn4+CNfwTh2mrge90sct5YYfZToAd5v5kdG1tWAo
         TJLDHQpZmlCpsG3G8KY5bHFhQbBb+TxUNyTe2sEqFr9t5hkgg4cBUs472FmdFncjbUiq
         GOPJyBbIKUjpqj8YquUg1SJ8VLvHJcHeSBavN/K6+K+yJJ8XZXSIM+uqiiXBnrvQZCdo
         G4uMBYuJ7d7Ym6kw2qLh8JvVjTsX+O1CMcmYuUY4XPM/YRHSopcEtNQ8MseI/ynqx3Yn
         IrD1GJ5dnGurdSVDlXXwGyh38zGBxING41x0eSYmSxvKXkbqD6ivqdPQnYsBZrddNDa7
         +qYw==
X-Forwarded-Encrypted: i=1; AHgh+Rokilu7LFOj8Lge2g5zup8/gAkqV7GecaH1yN7XVnyHZO9yOFnL+JKc/FsaRq9apKOaVT/0qDPeDyDqCvJG@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx13w6YzuHOodn67sEDyB2H8FkMj1WvLmNYwhSn0DUEeoElUoX
	7a64FgK/dkqyIQuKPjhr+B/tMgnSDMNB0MFyjS91fvTR8bA7S0b2ifvsiumy0sHAL5vQtAkspRD
	JZW03RUb6mftvwyeykPgCi1FTCCL2bMoshPNRfrs7beYKBDRBynlY76p+2GtYsB9XP5bicTtw79
	ml
X-Gm-Gg: AfdE7clSHj+XyOWtCm74xOK5K2qEARzX5cxAHa92zhHrvhrs5hINfBQ6i0+RZ9+pVgh
	JUAn6CIZOHhCMZezXLsfKt9fclKTy0/yLfpK69X8UkN5jqh5u7yfkVe0y9Z5z4mJRPr9RR3kYUh
	D4Ux3SiIlpqVe1hlxLeL4NumF1s5McTLzV7iwAC/UQdq7dTSKixNpaqnUrUz12wQh3AewmkrlsF
	MvD2iqizUBd8BTne9Uafi77G+9c0nPYgf/zh1JS8uCP4qQncSrQqJFFXr9kt4tjUN9tPFLDIQ1C
	SmAkbHcLG5ryyydAB8ak04IP/68h7PZ7Y36eDCFIeUwDzZNUTbU7bhgKv/thbe18fupk+zsXTNC
	H2XFITz0WlzDkDfmlkfr46SJP8LcXojpe6GVAUCJe
X-Received: by 2002:a05:6a00:22d4:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-848788aecacmr543856b3a.18.1783654231443;
        Thu, 09 Jul 2026 20:30:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:22d4:b0:848:788a:e7f9 with SMTP id d2e1a72fcca58-848788aecacmr543829b3a.18.1783654231035;
        Thu, 09 Jul 2026 20:30:31 -0700 (PDT)
Received: from [10.204.79.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8483262a17dsm4980282b3a.4.2026.07.09.20.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 20:30:30 -0700 (PDT)
Message-ID: <1dcbc6e1-7b78-467f-b39d-eec4aecbf577@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 09:00:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: misc: qcom,fastrpc: Document Nord FastRPC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GuIKQF9jn2GRd0kdrGonEUnYxflVXA0j
X-Proofpoint-ORIG-GUID: GuIKQF9jn2GRd0kdrGonEUnYxflVXA0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyOSBTYWx0ZWRfX9ktZn3HbRlkH
 nB5Je0oj9c4wSrjVWlHkdCoO7tUGtjMRuBWEDyxKkBJZ4WbyQzN5G/HwFu72tOKtLJAnMjP+YDq
 VmtsTN3+aOhQ4sohilUbJ32jGjacKawMlVoQu795XwTs719OshAmCxzSXhlIvNUNC7M3+kr65N3
 1iqKOoK5xhTb2Q19Mp5oDWznYHHj3wQTzDxUqHrdhSPohtfzGFKMVJxX86k7jNltoLtEKz2m9Za
 SFtvI/+gdQ2OWbwzpHOPWOjch+ZOr4PibpNzvU6CTOJzG8msuBzLe0Uq7DdUvKe0y1tGlIJnVT7
 /rQA475o3IKmKFV30glowzd123PpLF8oBg+T0G36kmlx3Oohojl/9bnOUdYf5J+9spO7yS+mz2Q
 7N206yxUAbCjN4gvSaaiEzONUS0wyj3K137vdmQRwx45Zj4pkPDt3tMlnYm17ntEKZ7b3SlvjR2
 f04QrF0WvaF9D6c7JXw==
X-Authority-Analysis: v=2.4 cv=N7MZ0W9B c=1 sm=1 tr=0 ts=6a506758 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LFGRwP0lTeoBuEiPW_EA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyOSBTYWx0ZWRfXx4QQd6dVoC0S
 y+Yz8C/6+IrTq88Iqcs3q1mSbhSma+9rJHBMmWXYkXDiVIWtV9TWfZOUcPL+1yNdC85/aMhI3dl
 CcRPmqSOJwHhd9/1Wl2tq2ILBXCKNQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100029
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118128-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:srini@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 69B5F736FD4

On 09-07-2026 13:50, Shawn Guo wrote:
> Add compatible for Qualcomm Nord FastRPC which is compatible with
> Kaanapali FastRPC.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 2876fdd7c6e6..24fc0752c11a 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -26,6 +26,7 @@ properties:
>            - enum:
>                - qcom,glymur-fastrpc
>                - qcom,hawi-fastrpc
> +              - qcom,nord-fastrpc
>            - const: qcom,kaanapali-fastrpc
>  
>    label:
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>


