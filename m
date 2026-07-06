Return-Path: <linux-arm-msm+bounces-116688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yoUnBiBnS2pdQwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:28:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0EC70E17F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:28:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aLqFxMsm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N2srzBJJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116688-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116688-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 952BA300539D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 08:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45E93B47DC;
	Mon,  6 Jul 2026 08:26:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22883E0083
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 08:26:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326402; cv=none; b=eGjptFUxi35YGGR6zjXtrorO+hf5DAzOSVDCwZj2MBS6GuzIy0bDJ+rakZxPbSbowhaXcap1VrxEarWWmi4H6ulwwCx6q8bPzradc9YHA5yu5HLZ7CKOpNo8AwYVTqAlO+crpuYymC8TIh66tiHlTcL6TQhm0TCwQEaDEtcfpnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326402; c=relaxed/simple;
	bh=q6xzlUdJhdeWHsxcxJhdb/T+j46cN4S6xUjdguAx4RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bgLjg075yUCRPbQD/XIEhFxD3fRjN/yvGk72fneRZoCkR9uy0hNjxh7pGtXb9nd5hOaThK9I6FOp9d/hHlz5NUWYWtDeUiAv5HaSHdR32ijPN3yfnBhxLeV2uJXgjPoX9THQmvFHpBmORpfqS02pFtMj+snmsnc0kVM1SowiGZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aLqFxMsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2srzBJJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641WiU3615514
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 08:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WE58upno3pdYgnQ1v2R512+O2faWYaoox0dr47816c=; b=aLqFxMsmVw8fuSNd
	TurUKbe5hfBhmU3U5uKL1Z7qWw0Ll5APYvY1e6gfr4xGvuQUB1Q43qBgbgbVdcJQ
	qZKyNS+I3z2wpZ3Ly3J+J2O9iG8ZKwE0ANRiX37oGFCwc2Z0jY/HNg6B7GCDS+9w
	F0MRy1IpmfLOIkJmO5uFfuQl9Fv3hMPAFAiCMXTITU849NS61MWYYrNyoJbvdQlg
	UpcVm077qMNv7AZyXD0aExVB01ubwXZPZw/YrXRrX+kI79st1VaYROmOucA3hwKI
	mcIf/KrDdwF/h1qOgJRuByR60Pe508O+AqRgmpWHlTtmVkpcJar87Gc9dLm+pzfK
	1VaMng==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3d8y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:26:32 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e8e83314abso8155216d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 01:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783326391; x=1783931191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0WE58upno3pdYgnQ1v2R512+O2faWYaoox0dr47816c=;
        b=N2srzBJJ9KhRLYQq+xEUkJU+Egx2EtrjWu+FuUTFuo7Z6oW2ejkvcZdKNAEP61b2ny
         HRN8I4M65GJ2KX/6Fx7rg8ux8fyFfC/4NUhFhedP0NId7j1Y0zzEc6lvNypkLOV+snzk
         kC/w+hvVPWKTLRxuLqudmGeja2MeHM69Zq7V6zAGb8l31MiKBZlXiFDiTCaqz8IJE+bc
         nfQNRaPHHALDqngv1mQG/lLHvH7im4eyWifQOfXxkLfJEklzYVtVuQDLUEEMiosjEjmz
         A7hjtmvT/dTBv089u000oAybL8InyqWYwwM+z2/WSXZi7INib/1TD8QMdnrdTSC0OPrt
         4lqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783326391; x=1783931191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0WE58upno3pdYgnQ1v2R512+O2faWYaoox0dr47816c=;
        b=XRt7m1k9P+lg3CLreYK66A9ALA4LJSHLdDG1kBtLHXQSUCUdIYeSn2xIT5psYu1Kc3
         w5GkDT/9JBQmcvfoZKZAcBJPcmYAs5X0dNU2r0yKx7Zd5Gxf304dFo9EOyO9Sd4UvuQw
         /Lue2kOkUg10F4K6d+HlxTS5mnaXZGBWJUZgkTpXRV5dcjmyHgxsdyDQAvI/Mm6gJ1lM
         JmuL0bRVN/icWKjT/7vurjPjoMRxHnsiODjVfO9JJ4BcjZSdyjsmggiYuqPGhDKw2fEB
         h50r8Y0jxelY961cZv7I/eDqAG5RskiRfmm44MZu3M/mL8uglAoXVf9wlmQlvZzIXbMT
         LinQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQeSUm+FOs+faJ+xxRiJZfDP7s+bWzD4qfj+1idGHugtLgNg5mAxSh62YP0vt01SUhmz302+Ra8VT+UBA0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj0asI/ZgJR7uN3hbeHAwirBB97MS/fQ4e46pFSowHrzxHsvpq
	YQALIV6lEC4ftUKsYzmmKfoU8Lw6NEa3e1PeBwFUU5QjBPwzmuEyPhww05mHpb16ItSiwDNoHc6
	sGXDXr9GibPcwBrZg6bSWUvPP6GUciREHfQie6s/0HCNsqmLMrNgBb3VRq1PxhwcH3wNG
X-Gm-Gg: AfdE7cnTC8aopHgeiRi2UesTDZBN0FKRKR681+OSDpOWevYX/FDayWPykbgqqQLIT2V
	M/5pllrLmXbu+sIv/db9V4goQqu+bWY6zzkMTMrYWhxcP5ZvHRbU0vE2sQWbSZa55yRwh1Q+2WN
	GzYfCFY1GEd16xIyGk0QQ/OGI4ZVbkF/wpJWa1DaaVCq/qzuIIFpLdZqgxannVbhyZMlS59Kyo1
	yT4ZIbu/BD+2zzIZX3Jt2EtavfDR0QpV2DTebhqxjvGuA7fT0h/bE+vYIkTRRGtTTmtwM4ui2ra
	JxWDl4OH/RVVaJmhQ5xrz+BHunMZvJqqzN9SMbxEifA8+fc9lz0NRuaVFpmpNsxBHUAxId3vb8i
	SYfGL4SspqQuI8GQl8v468aRR7MloH1HJ7eo=
X-Received: by 2002:ad4:5c8d:0:b0:8ec:81e9:1382 with SMTP id 6a1803df08f44-8f74b0c2ad9mr92011686d6.3.1783326391114;
        Mon, 06 Jul 2026 01:26:31 -0700 (PDT)
X-Received: by 2002:ad4:5c8d:0:b0:8ec:81e9:1382 with SMTP id 6a1803df08f44-8f74b0c2ad9mr92011556d6.3.1783326390697;
        Mon, 06 Jul 2026 01:26:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9d1c7sm3532949a12.20.2026.07.06.01.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:26:29 -0700 (PDT)
Message-ID: <07a4998b-2199-4b22-bcaf-c5dee02c1c43@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:26:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: videocc-x1p42100: Constify
 qcom_cc_driver_data and list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260705171811.115542-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260705171811.115542-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705171811.115542-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX74JbHBghIeI5
 oyTYqS0/8Pf7zSmCflSBSe4/cn/JzTMvd3j68707dErxa24bC9DafgZ2U66nOiYB0cg4/gG7B5c
 oBNVdPTCrwhsluuMC7JxB8CMAnoYurU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MyBTYWx0ZWRfX8/2TBAl4BIlA
 gRO1wsiDa9O8uxstIuG3WgxN0LrLgw5Rn24rXpnxUMMjJfs3F8sN0xaywoKLW8nv1pxXfeRXWLu
 jQJdQFS+nQlYkoQF6Q1w5pFZi1muP9tt3mh++mFz//3MVMMQ4qDk3m9R6XFxI61M/1fPdepINj3
 z5psNlOvJtymr72tqA769D5rPhnX+VGKTP26q13BBX2UvgOuzVQOTx4PYLzr4sL1hREZSn6N8xU
 W5i1ZVN4QSpI2Mt0koi+IfZTC+XhSW2XRd0i6CM+0Z1Rsqus4jfcKzD3D59VdxzKTcd6G1+ZRyg
 DZNvKM7tOdAV1ESdDMD32Bv+NxIDBjXdr0JRKt7PwiPIcuYnArWdN8Mt/IyMue55Espl9t/KuNv
 TZGdxlq4ysOFGNzjdXG92jlFl3O+O5lUV795HQVgorFoQxxoBgRyPnIMWmJUSJbI+hMracQ/UhT
 JF2Q7sQR7zRvkWSMa/w==
X-Proofpoint-GUID: 8TcMaZs0cu4TMrHoLrIb-Nfx6q75u8YG
X-Proofpoint-ORIG-GUID: 8TcMaZs0cu4TMrHoLrIb-Nfx6q75u8YG
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b66b8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-x_MtF83Af9THDvFyf0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116688-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E0EC70E17F

On 7/5/26 7:18 PM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

