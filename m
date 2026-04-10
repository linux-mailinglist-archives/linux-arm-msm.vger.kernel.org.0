Return-Path: <linux-arm-msm+bounces-102584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCYjMP+B2GlSeAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 06:52:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DED3D22DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 06:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91D4D3004639
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 04:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E6B32F759;
	Fri, 10 Apr 2026 04:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D9hg1dpD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpbGjdbN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1737BEAC7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775796733; cv=none; b=O7Xjj8TN3EYcoRdhA3j1Ki8EwAmHpQn09rEHtKb1hkXvjQ3wTe4Nmcz5/Wne8iCooOe+zgQO9ADiCuo/82ojnG9f7cixb4yC5ypB7jMi5ph92azCNW0md2cTfyAYKavn8AiCIxQZ8Ns5uJI0DLOo+5xzPV7/+A2SUlEWoHVjsPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775796733; c=relaxed/simple;
	bh=A4xzkCqH/qys1wiQXVa+BTNBsula2Pw5VETT0kvN/Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7pi5PWmgbBASItmux177Cu7m/aXsBBxDI/y7xENVmA+R/+5zSAZQTNzSfi7tr2lBILseG8jUoQpjNjy5n3gqe3MoiZFLSD3RhLJaoJrNkzazO3DyShbU+vMi8DaAEtni5GW5wDzuekBhzMY2r7R7dATFHGlmtFDcaBqOwAZz+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D9hg1dpD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpbGjdbN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KOMgL729047
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sXtgsNNAPnexGN5VQbjjHuHnybFIPEuuvuVsapqN8+s=; b=D9hg1dpD1HSj7X05
	/fvWjcGFZRmGzsHPTi2j3N7IkjrOcZh91vs/woXsQ1ay4+1oG3YCu0B1ALT/TBhT
	kk1hV50WbiMTMcb9LpZfd7APAC2XJH59dDQ+y8WMIrKsr+/nAjqIQcu5ureBwTpj
	VG3XbKrvO0x9dxcq/rbVJsRv2hp8qnL4laAJOMiCu/+zFEcyR2ANoOSqvxjQD+qC
	2SwmoIM59ejGUSlRYj7XjseBRjtEdWNcK3lXgjv1f1P/ZIuXhPjFgnZrn4+uwswS
	JuTBkmzhtsxKjbDdA9A8v3Bu0CVm9Ngbrn6ClUnurfx809ecVa1AbCbIiFnk5P8L
	fLapbw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dek4c94yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 04:52:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0c96f5d9aso15233155ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775796730; x=1776401530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXtgsNNAPnexGN5VQbjjHuHnybFIPEuuvuVsapqN8+s=;
        b=hpbGjdbNapghI5X0Eo1w9SqjBabHu6nhHoeufAXZmNC2OjqJCmhAhlC0Cbl9DhhLlg
         0EdOikVfmF2wFMZUvxBDRtofj/z/d+Ihd9deMMy9hCOGtZNCUnUKdQXcgrKrI9/iCSwX
         KuBmccTLoZSkaY7w08PQn6XLO40HITZJMk8iDkhiucqfM3zscnm7r5Q+DLTqozJqLNDE
         xM1S0f2iwyWWslS2SmmC51tvt6Z21Srw4k1aRDszOHTm3mCtXebOhttMajpbK/5A34Ay
         Pd6ScXZJmeNvG6SOws6ioRr6zDkI7jVpB3R1SpX/neHRTolQTW7JQfgeCAB18d8xMeW7
         MUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775796730; x=1776401530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXtgsNNAPnexGN5VQbjjHuHnybFIPEuuvuVsapqN8+s=;
        b=L9CKOZ8xJdlC3UaiUejpl01zipTM9zT0jN34l50q0pDHIB9VVD5HH0oTEi5R9ivUn2
         sWTyWQFlrk845uBfW7NwQDtMv2c/EmzSLcbSNuZHSSr9uxxiT96wU+ZnsF5zlE6I2866
         tFU1S6px9ljJZVu0rXq9afmcXR3FSyEVMV6ArjJDK/L1EVBq7RQvNCGMAkLiiitZjnbA
         yeqeHOprn6HWPSZjCnStm1xchxnQC6NU2Ciq4S8+d+MHumRs9S1EqXuRWFs6XKppUuSc
         F2PEXRcmp7/U+Ek20+vt1izNPHtmxiXXiV80mosBFjx3lN1DI9Q4jIijjGFDPKWkKKA+
         u40Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWGbhgcsSYsT2YJlcntBlxnAtnnGZWqoIQyrMwSVk9LdSCxN99n0QHx5jqsVfzEFfYEDZ+EI5M4UPTVCuX@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa9FcYKnDN18GB45MiL7MVz2D4Lx5WbT7tCa4LLz6B2jUw5gnW
	irVObaD14i2Eb4sRO3XTN0lKbe0O9kloEPakGrqHp+PIGbXiKGMFitau3zpQrciURwBhOE6edlS
	oudOTAzfm2viBQSa6NI+dGNw7sKbnrFXDCjNUSLAg1Nfjt0QHN1S1VVGCdkUisAEUwbFc
X-Gm-Gg: AeBDiesoTsclYOd7LW9YJl/GALwlvnBEntHLmpP/eCTo/T3Urm7WEMnXZ6EFwAt96yt
	RPcAz6jcd5Ei/bxyRSJJ2Wnj2f21deumscrgN+1u+uPRHYlKxOUIXndbr2gvOh+DS+h7/WDxpLD
	sqr+unvy5LG6SRO5HvrDndF5/cvtwaraItsJ3hXf7Vc+iPsqpqarilPtolUPs01CNklB7fuF/sr
	AYOLWVXhqsWqSyiNT+l/r0HD+Pkfilg2cFLox5irFPINy5Dlmraw5DsRwMfJrnKxjCKk20/2wqN
	6utqvRA4lP/GOp6usx+m27rnC0M9Mu4qGY7GiZ2Td3qifo8ZY9VX028V4gt3jsnB4SovMEL06mS
	XFrdhHHHzEiyeeDZVmFyg8paKftlh72qjteIMroDo06v4BGGS/EcWcg==
X-Received: by 2002:a17:903:1a43:b0:2b0:ccad:de1a with SMTP id d9443c01a7336-2b2d5a2c035mr18578065ad.30.1775796729986;
        Thu, 09 Apr 2026 21:52:09 -0700 (PDT)
X-Received: by 2002:a17:903:1a43:b0:2b0:ccad:de1a with SMTP id d9443c01a7336-2b2d5a2c035mr18577835ad.30.1775796729398;
        Thu, 09 Apr 2026 21:52:09 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f08d1bsm13220155ad.54.2026.04.09.21.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 21:52:09 -0700 (PDT)
Message-ID: <2dfa4af5-d3c4-41ac-9762-0a9101f436ee@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:22:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: camcc: Make Titan GDSC a power domain of
 clock controller
To: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
 <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
 <70042f4f-c4ef-4185-b0c6-397d27164a32@nxsw.ie>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <70042f4f-c4ef-4185-b0c6-397d27164a32@nxsw.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA0MiBTYWx0ZWRfXwXIzvI6kOg2/
 9NXBIDQeG0lHlNCHjGd5UNFxlmFjg54Exj+0mLMa0VrSRcNe1o5QbKLIN1kDeY2HhAh2cvxN2lt
 wAPeXRvV3S8jlOTsrCQKXKZu6Gaf3k1h2pC4Uu74oHNQoFDjsSbMpR0oxte/vkjMQRU6PO0XHLl
 tvXefafwhhO3X0HWjvOCiVglbu4kYrFzvTdWzKIMdwYiQXzEJVqrWLh6R7ecoqtVKVx5jAT+004
 F+xjfQiNqJJtdG8LYf1rMBUDQEi88zVE0ck1fHkaasNWdPKtuE5Q2H/xc8/jApkLBbWF0xL3t9y
 lP+Ra6h71xAOqtg6zvLzIC5p2cEtLU+FIclT/Utl+q0wWRuEbpUyjBMjAHTkpTpqDHbOs7rZOu/
 OJgmQgsIR968qwIOWWiFQVI4A+2op9PdPKEuWkkcCWrRGqD7fMS9UO7KevB3Fo1CtWGQwSCi/Ou
 vQZnlmyQDDwR0YStLeQ==
X-Proofpoint-ORIG-GUID: ik1YFdXBheyJX4jXLmwm4rXDof-cPxdS
X-Authority-Analysis: v=2.4 cv=fZmdDUQF c=1 sm=1 tr=0 ts=69d881fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=5Z1WaS1EQYwBqN5nsLcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ik1YFdXBheyJX4jXLmwm4rXDof-cPxdS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100042
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102584-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22DED3D22DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/10/2026 12:03 AM, Bryan O'Donoghue wrote:
> On 31/03/2026 15:01, Vladimir Zapolskiy wrote:
>> +	.cc_gdsc = &cam_cc_titan_top_gdsc,
> 
> So.
> 
> You can represent this in one of two ways.
> 
> - By making the GDSC a depends of the sensor
>    Obviously a PITA to keep doing.
> 
> - By making the link from CAMCC to the GDSC
>    The question is, is it valid for CAMCC or indeed
>    any clock controller to be both a provider and
>    a consumer of the same power-domain.
> 
> The other question I have is; in this setup you have
> does the GDSC you've made a link to switch on/off as
> it should ? Have you checked ?
> 
> I think you can make the argument both ways.
> 
> - The sensor should consume the PD provided by the
>    controller - like CAMSS and CCI does.
> 
> or
> 
> - Lets optimise the representation of the dependencies
>    so that the consumers don't need to know about it.
> 
> The self-referential nature of the change seems a bit odd to me but, at 
> the same time, I find the over-representation of power dependencies like 
> pointless spinning of wheels too...
> 
> ---
> bod
> 

Since sensor driver is a consumer of camcc clocks, the associated power‑domain
for those camcc clocks also must be voted from the sensor(consumer) side,
rather than by marking camcc device as a consumer of its own GDSC. This also
ensures all sensor dependencies are accurately captured in sensor DT node & voted
from sensor driver.

The approach in this series also doesn't work on chipsets where use_rpm is not
set for camcc or for split camcc as mentioned in cover letter. So if sensor
driver is common across the chipsets, it would still require to vote on titan
top PD on chipsets where camcc is split or use_rpm is not set, so it is better
to vote titan top PD from sensor driver only across all the chipsets.

Thanks,
Jagadeesh




