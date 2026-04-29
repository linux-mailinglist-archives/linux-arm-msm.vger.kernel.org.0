Return-Path: <linux-arm-msm+bounces-105265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDYrHHs98mlypAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:18:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B13304981BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 19:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBACE3014968
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B107410D12;
	Wed, 29 Apr 2026 17:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHIwhoSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZjQ5AjlX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E12835FF6E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482853; cv=none; b=sNS9cUvFZyYS4+wpW+QYtsZaeYUBzNZhQiPgOzRe3Rvv9qRwPE1+vv+MrX7/BTtpOg/IN4HWiFvPeyzKqZzgy2D9dXe5jyqZu9sMMpAvIW/lnjV8FQgi4ili+vlUuG4FcJT2/aOI9ATv3bsSkvOOLtL4rbGpyvvpcI5YpiIsf2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482853; c=relaxed/simple;
	bh=yCWIwBdLFpCGU43FLzu2Y1bJJRrVmCa3tAElrOPlN9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ccwhufNauiD8q+Ly3n/OJ21GkRVBvXRujKhQzSECTL36KLX8DJ05k99xjByKxKG5g9mKV41Y5PnELTI/gwRHREeZchtLHq58PThIrp/dPAlOprw3+gEQ9PhpMBT1lSa38tj6xTg0w7jjHNqssQvRXXIyraqv6jc6dBQqy4LackE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHIwhoSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZjQ5AjlX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TEQcTt1796400
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ox1tQ2IT52zVdwvRySjuAQATlpXh5Pf7h0A3Kb8d/tA=; b=gHIwhoSJZsIMDySl
	8u80TqiFp+8DMaSzZLEQpbpvOw6ANA08F+yXoPMU2+OQYbiZLEVT5iTIa31KmOlA
	1QdwuWMZkcqa11TgK4pJi2TXfSDuYjWCg8YOeQh86t80NpQ8y7jQjX7eNJ0CuBWs
	3OVbsNjDgpxgaDe3dCccfqnUVsOzzvYlBy+4A2in0l4oJCgfQaOG6yxV9WLDM5ka
	NLgGoyz4KyVQXXbha/v5leIn58Wp6315yQiYN36e66/7Hh+KQsWGDOJkU8qblHrT
	ODJ/WBO/YLagiww6JYIL5KgXt4R1DCTcSACDYWRMSwfnP5lkwJH2+0rgYDx4veCS
	UXg2bg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dukrp0q4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 17:14:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c76c2bb3149so21466a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 10:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777482851; x=1778087651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ox1tQ2IT52zVdwvRySjuAQATlpXh5Pf7h0A3Kb8d/tA=;
        b=ZjQ5AjlXny6k5gLHmpCYMXAy1XFQvaFPPjpj4eXN8YEIAVFPF+zftG9kzqmV+og4Ux
         ktb+pA52KrXfYteF+sufzswAXCaz/ZzJzqErQGS3qZaY/VB646y6Miob7bgQUBjCfGsV
         JIa6wTz7J7L6+3FCD/vVKBTYPm0yyKJS8flrBEUPf9X0TFhpbxW0ECfH/GlbRd6sY/4J
         isO4dLyFuXE7TRGEmIzIZSvelzyZDJ9xQoZLBMPMUfkk1q1dr+mi0vFU4hwKY0XEV58N
         xCRJH74mbuRe6GAu190b/T/TytqZYOCIpqCwM6wVg/THdXer3WVp1pPUAd9jWs8BLKWP
         Z6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482851; x=1778087651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ox1tQ2IT52zVdwvRySjuAQATlpXh5Pf7h0A3Kb8d/tA=;
        b=sG+udKyD3SrbxB1/mTOgPszLSKmzkDPva4kSf/jeU0fuorFN5vsIYX7dhE3mP8Y28O
         tY8Oiu9GbTYEqNxPtjIMzxtgoXQW3VTSnRAf2mrhCvEoW712OCzz5YJJ/FYMx6uX7aBA
         nzVcn5Ub8jtlHNdDUlk+YmaoNliR1iR42njVmmIWpJICqC2skyGXuRuoUT33j5qgqEU8
         3UxhFaiedSWGewBOoURytSbQ03AqU6HB4OJGBrQGOW8M7Is0rfl6onWeBJVgMsxbPo6v
         xzhavIhesiphsOqjZt0taxWLXQE5lwsPiZUn8FXw3Jbhuw8aHAjPMGZmwIN+wm6Cn5Q1
         px9w==
X-Forwarded-Encrypted: i=1; AFNElJ/DmxdrgbYErIqlQB6vz5hVexNVcSNT+QipYOERD8/X5mGfrjMAoU2dk9AcVHQkHbc+BiLMxaWsaycL1JRq@vger.kernel.org
X-Gm-Message-State: AOJu0YwjIVQelSRu9PrjERo5DOcRMMl2lxjBoFGKTOzroZOjy2xjv+gY
	Tcz/RG7nfvcGEBpMTysKV72a3U9RbKRDIkYgQOcTAsfEeuB0XJGeqw+82Yoa+7O97Zuo7A9icyu
	C3LFkCIxDoEDCWqM0av3G3Ut3B8SMuuux4On5LbovIFDoWKZcSlC3innPIvJyBpe8mv3o
X-Gm-Gg: AeBDiessgDPeL6I+LoGtK40MsKbaOVny96eLECBBz2mnq/QxRePYbfV5WkCSDYW/Lex
	N+v317JCvuJLHCZyUSpa6dhN/GynQznTQnLTxLf3+GaedyxTNmMWryw49DXpJv8BQteOwb91GQu
	a0zkZaJT9mZjdK+7VUAmumDICfayTBm1urqvPOnWJpFkKSR8llAurzI1XmQGODcZgb1lvmbY+L2
	/rPDn6kciBfl6DA1cmg50N4Whb7ZcIBa6TXq7mkgQTrzJTEqTAXQGU81lM3DFpp0YuF9CgHSz9D
	XVIwr1V+ZjX4sq8PrihXvSQaJjRvO7mF+FFFLX1U61u/7rkD3f+UkuffF54WBT6xTUtMkFTjkJZ
	MLvJlxLe3emtaq+A1QRLzUFw1M1RqO3dl0nBF74YtIn1hKBupdMYshfodX7Q=
X-Received: by 2002:a05:6a00:181b:b0:82f:7cb7:63c7 with SMTP id d2e1a72fcca58-834eb435577mr3395675b3a.11.1777482850678;
        Wed, 29 Apr 2026 10:14:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:181b:b0:82f:7cb7:63c7 with SMTP id d2e1a72fcca58-834eb435577mr3395651b3a.11.1777482850187;
        Wed, 29 Apr 2026 10:14:10 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.27.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed2fd07csm2709847b3a.0.2026.04.29.10.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 10:14:09 -0700 (PDT)
Message-ID: <295c6ec6-742c-4f34-81c7-5fa8865c0d5a@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 22:44:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: Constify qcom_cc_driver_data and list of
 critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260429170859.247165-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2pTfdpZg0BObfuwgUDhIkDYNeQSZzbcI
X-Proofpoint-GUID: 2pTfdpZg0BObfuwgUDhIkDYNeQSZzbcI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE3MyBTYWx0ZWRfX6WcYUAhd9xiZ
 ArieQTQwm82T7i7kdBbZ+ROXOSLzKYJmMu+jBF3g5KEnNVdJgNmDET00NXjNSVgJzXkQ0WeDhlE
 GWsQN+GlhL3fM5BaAZQVSxVDb1Enu/vli46eNzZawyNUZMLCQV8BnPIjewju5LVGAVjbKJbXE0q
 UZjTVwwa1JSdFwV4ZhHFCBlXfreQRUh5mrRmZEbd3eaT30tfRTg5f8YSi8uytHA4gLU4ZgZMX0o
 QhhXavJkm8W3tyYyJLyMsXAzHFs/xXay3P3qCfXrNPGSOtkRZat+OIVWPn2rx0Bz304SEBnKc14
 KWtlrLOPWZfLqmLccTtoJzvQZ1nGg4F/nysvQPOLN5s7Rk2gHgs+0V4CXTz9JCORzbNydHDgpPc
 Ur0BAaCekzyWrjs1p27guUTLreCbSnDynlcOAdk8yraTR4qbluwPpe6S4hIdB7Bilf/Bl+JYB1Q
 RDNcQHx15aNX/UPTGgg==
X-Authority-Analysis: v=2.4 cv=WoQb99fv c=1 sm=1 tr=0 ts=69f23c63 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=feNXzLEk/NYwcOu2G87RIg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-x_MtF83Af9THDvFyf0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290173
X-Rspamd-Queue-Id: B13304981BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105265-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/29/2026 10:39 PM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Constify also nw_gcc_nord_critical_cbcrs (Sashiko)
> 2. Add rb tag
> ---
>  drivers/clk/qcom/gcc-nord.c     | 2 +-
>  drivers/clk/qcom/gpucc-sm8750.c | 4 ++--
>  drivers/clk/qcom/negcc-nord.c   | 2 +-
>  drivers/clk/qcom/nwgcc-nord.c   | 4 ++--
>  drivers/clk/qcom/segcc-nord.c   | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


