Return-Path: <linux-arm-msm+bounces-114883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +B07KxMtQmpq1QkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:30:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 434146D7829
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:30:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E1G0dVSP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j7WdfBLA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114883-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114883-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E4C6300F452
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64A93F2106;
	Mon, 29 Jun 2026 08:30:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9653B3F166F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:30:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721807; cv=none; b=H2ndXGqgJry59Hu7hlrrAHS6NZ7vYMZN79+yIbXtQvBpysC5xKcg14d+t15OjHeiy2/HBvwUjrsW7mQC87LM0VjUwpa5IeqqZUf2N+w+bPD/FGkqbti0O+0N2ueMktREqsLHgsu7qKOsGWxClzZ4Seevjv5FH00+hcPTqFmb2y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721807; c=relaxed/simple;
	bh=D2MekIVdjxuVjVCs+BZYpnHPIsXNxfXk4QVxou+Zt9o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJZDY1UW1MDwvXVd533jR2r1NCuR7UdkwxLapmjdV9Fxh1dTfmhUMA3u9QlGtADwQr2+PJp3VBCk/3Bf4ggX5UKt+d/JtbpdfV2NZo6xiQ7pnZBxsI8Z7Zyztn3Wsf1+Ya5yImI198fIP4IAPl3pHMSoHDy4p2fmELtmjS6URyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E1G0dVSP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7WdfBLA; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rSDj2124846
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DgjW8ZL4lRrhVK+OqRbfP3tne1ypBU/sYPdCUfm2n38=; b=E1G0dVSPnSGNVJoz
	7zvsooXKU2XSxZxLDuELJtJhHfb33QR2QmEX0IAyaY3Xu+8bQZ7ynPuoRhxyt4cL
	D6Uu7ihHnM41Ea/eBstSQcp9a+KJg0AA7idZB++tkUanQPgy+D0KXMAd+SfC0O6A
	dksmw0gjonaduJzEGBDQBr6aQUnGecF9sBfkRbCPXkIJFmhkEDBmStTusokS2fIF
	0FoDUYf1afLK2rETiyvwXgoWkNeXovaNUg8RvnJpemjAlELFqO8DOadkodqfFrDV
	u3EAFFNz9ucMd9j/XhgyRXaCpBYPLynZSLKo1zJIovA2j4GZ/PQ78iLiKlecX5Yq
	2wiaQg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27335hwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:30:05 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73966c839bfso9708137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782721805; x=1783326605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgjW8ZL4lRrhVK+OqRbfP3tne1ypBU/sYPdCUfm2n38=;
        b=j7WdfBLAymEV49XTLVDjFJe8CB1GEg2zBgTPSC02F0GTABbYbZt2VasFLKS+wT+nd4
         T/jYpmUma1gyo3XOinpZhlXlsiSXA8pH0ZxXJD5ah0pQuW20o302n1byIVMZ/j0d/HpK
         tNOgkAJUOvvNF4vXd6XPDaxNhcBTGs7L0x8HMwMDiLDtdZQTquKIMc+M9wub0WLasm5B
         Y2g83jBxRFWNuYfIYu2eBfasghsf5vQjAK3xJM98OG92FflddMYI3gj9jw1HB3j3J4pT
         JNf0JaxXi7qSSE0vJ31RelI4O0jlfRnZvty+aAsUW6HoNGdRT/Tyr8wp5IvuJG0LLOoT
         MKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721805; x=1783326605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgjW8ZL4lRrhVK+OqRbfP3tne1ypBU/sYPdCUfm2n38=;
        b=ScSNTeTJb0+EGPeKaH3MvcuXPq9/ixyD7dkHmzdOM3dl5s67ItXU8MYIzb/fExSc84
         jWCn+ZpzXJej5KX51n2/C2yCAOSFjM5sQtg34M8q/IgABjjYyHy/U2iKYNO58is2dp9e
         6L4CUBGQAZQo8uHGU+8a2gAppsMCK10JZB25x0rj9BVBo3eCD7UTbOTILA3yTUptOfrb
         /K1PFZC7xWAZf0fgmW8H43zG3D4coM6JVsAoTfmMICKz3KZgT1IVsYD/3z+DkPQuF/mE
         OdPQjq2WsEuOT57fgE0gmGGORXu2dUNZIbnKUWhXJG7PRtM9lQfIpAFNZZGkJmHc7j1l
         bEvQ==
X-Gm-Message-State: AOJu0YxaGKOyuQ16qk6fuwd9zTEoMc0HUa1MHClDNbZcn1zsg7aD058R
	nqCOHro44ZaSCfYyK1M7ptyTbmQfS+40wjwqdbJxKBcQ9e4zfwNSLarG0hniJVdC4g5QZnwXQ3m
	LCEVMSZKzHPgShiZxfAn+JZHbBhyOsMh8wL/xqtTUXlBlhauNhEjusfS6DE4lJPezgHiK
X-Gm-Gg: AfdE7ck7BT6ZkOCaV6aapobO7fA/u+9GtFaia/Oi+pns8Eiz2LHtXrpg3ueJ6wsE3gD
	kI1vbEXMcL4BKgRTUcHHRB/aa6XIWye9CsOnvg3sikLDR0E1aRw0vso5WTnJmRYX5z1HVO6Zlgp
	UJNVySJbSJsADIh0EGCFQof+oH8Ima5v+SM01+rjmkvqUGlsT2j1PAPnxqOYBoWDLIpkFS/ON+L
	mNpvaO5HtM6CgNESj370M+pYCDqqeH1oWUhqine7n9ZpbCi9WKghplHD6KtMqT+b8XHMi1/RTPr
	oBprRzVUyvYfqQ+O7DEpMeNWNbDvt/RzkrJ0tV6GbepmuB62mMkFzFX0o/whecyTJ4WTtr19teN
	a00nYXfX1Beav9IGNgw0KhodiYN3cSWwVAmI=
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr2285281137.1.1782721804972;
        Mon, 29 Jun 2026 01:30:04 -0700 (PDT)
X-Received: by 2002:a05:6102:440f:b0:633:3bf6:977c with SMTP id ada2fe7eead31-73433e2e7a8mr2285276137.1.1782721804606;
        Mon, 29 Jun 2026 01:30:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3aece6dsm6526300a12.12.2026.06.29.01.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 01:30:03 -0700 (PDT)
Message-ID: <b7365b1f-6592-49c4-8230-ecd2811b4716@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:30:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
 <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-apss-clk-v1-2-8c92fe118ce4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a422d0d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2WSQ0cfqpqpHfD7yDKYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: EzYDHM11HvkaBlLNdNZIwh9cUCcIb4C9
X-Proofpoint-ORIG-GUID: EzYDHM11HvkaBlLNdNZIwh9cUCcIb4C9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NyBTYWx0ZWRfX3/s50Ab2VimI
 5fhoKf7f1NhtGIZCdT9Im3vI1vIRt7nD72X/nV11EZn6jauwxNvF6/P2IXzRr0Q2D0996AzHFRc
 MwfnukMe7U9TgG/6hlEsJOT3ry45Yyu7NYt6xfUx8HcsdyfKySHKBukKZ5JsKaUCPCux7ob9hLi
 vWBOdKO7LJRmp4Ui706i2NzTuY+l56oeAx/Ez/dglZeDw5yBP4dWBfTRECbRlf9hHrqQWpsi3wY
 lPYRCu3Ur48vu2yexqRD+iEN6S1XPADBeBkfacGSXiAogCI1/SjxQ1b/mRYfWDIzjCH/rn+aG8Q
 dCurKzaMkt30F8oSz+t1NUABe1rnh3+To5Jm9zGoOSd52j0aZH7/y9iirHS50PPZzR2GQgzTX4C
 e336JhbxQePC8dfSswbNkbh1L+Ftq/JlZngpiZ7klyTmFqRjwH4Yw+J65avrfjN5NuVbtGTfF5a
 XJAwbh/Zv62qZYwRzsA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NyBTYWx0ZWRfX3Wsq1EsmQ1g/
 kYQ3lL01H6vHKyMvxu7Cg9BppG6nZxfIPvgg2yrCgf6smiCDABwraH3yHCN5w8/p8nOZHrpIJET
 AfYJawWkTOWQOQrDc6fdIUwJraC+RpA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114883-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 434146D7829

On 6/29/26 6:38 AM, Varadarajan Narayanan wrote:
> The Application Processor Subsystem on the IPQ5210 platform sources
> its clock from the Huayra PLL. Add the configuration data necessary
> to set it up.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

