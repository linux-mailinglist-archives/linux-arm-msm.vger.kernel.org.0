Return-Path: <linux-arm-msm+bounces-114250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +3kGKuyyOmr4EAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:23:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 922736B8B1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 18:23:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dHDXLMeU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XOz+mwFC;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114250-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114250-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75EC83010223
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4241930F815;
	Tue, 23 Jun 2026 16:23:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6C53043B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:23:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231782; cv=none; b=jtC48RUnZdYVwfI1iS6dx2LySqAHiUTzmHcW9Oj0xAHXyGRlbz1qn8CHbJaej9liNKIynL2A+KCdS+J86mrgDRO3gRo2xlNX9ptz+kzvMBRnBElO7dVWjKpyEg/eSoeFQYk0sdc04gPksgCqEEGhZGl5Tmsj4B5p0R5JkJxwo9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231782; c=relaxed/simple;
	bh=JHkYJm2LxbqzqrnkAL1v7BBOe47dtU+7DT/jd8f+7cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqZTY1ssdYB34woqEX0zjcoxCG7nuQCkhRoSk+Xs+WDXnUKMyT9V6H1d00OoFYqy/QGhDBmLJwUM9aXRWdjrFKIm7ypiqn7dLEw2BSzen3UEdDvKlP1sa7ycEzpj5I8jW4KLj883lKveP0BVJ8vzhxjm7MKL1kW2DJdtyevw+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dHDXLMeU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOz+mwFC; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXaon3752856
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AB74uSf38X6zKKffSeJ2Ws92VBlI34TKRe2pQl6iJ/k=; b=dHDXLMeU++hRSS9Y
	Qq3xKpP/p34OQhMVzl0SM/yVFJmFjv8+ZE62xUE7sM7u/vur4Otlq0YuwFeLua8Y
	Ge6st7+UaAhmCLOuwsc0svn/Ne4I7F7zmqK/iqLz3DetCcmrlkcsWmKvhDpsKEhY
	nu8ckHCCSZ+PZdoABjTacTe28BHrkkIxApeeJlbV5khm2KkV8f1rSOu+CsH6Q1R0
	jmXBcLYz/T0oI36SuyQyAVlvUyiKhqBV+hp1Mozyf6tHaBfOjA4dYa27LmETkPMZ
	Q5PEqLj9aNzTjtdOucjdMUMgjoE6Ix8GaCJcaMr6Abxq2ZKz77GOijaRkdP9+iZr
	aj+HEA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29j6mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 16:23:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37d4eff15b0so118587a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782231780; x=1782836580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AB74uSf38X6zKKffSeJ2Ws92VBlI34TKRe2pQl6iJ/k=;
        b=XOz+mwFCWlZz7pZ0N/zomlNzMEdtnk4kdUacZXa5N8wdi6inIK5hSViAHhZWtVkuae
         UFt+eBRKwIkPTn3p3taC7wES+sKvAVQjLmbjpgN8MSdJdBSjWo7hdkQuHV37Xe7TojGk
         N78o1YOowyKntd5aqFCXvug+BTTsSXQFocqt/44SeFawPDyg+9yjT3yVMe0NvG7sLwpg
         rVm8lpRRuwdacLMJx4wkSOltcf+MYx6Kl+AzZID19JQOgl0NPc+tzWGMUc/XBoT+IsW4
         QwKZrJTuEKN0c/jKzLndCPXWVH6MHpQeezBLZTL1WVrGXtDti7EYAb7pj+3n1AdNuJwT
         htxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231780; x=1782836580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AB74uSf38X6zKKffSeJ2Ws92VBlI34TKRe2pQl6iJ/k=;
        b=HYQMVG0BwnlbcO5zHPOMUFtLdUTX8v8W7D/yBTnzuVWlBcf0ZhY/GKbYeH2zByIvYK
         v0RSBMTQOYElWnwjlYXyiTsTBdltex9tKnwd2Ft9HfxD2Qh+as1ASXjpHn1egmqcmenX
         DjJB479mzGgs0lylXr+zTOwPJApUS6yfLEczblCdRSlCBGwwjrhVGzUhemtR6B2dXD21
         7QzPZ5avJM7ERE8BkpDGidqpVBmin6TFzLmPDf0ODBhgnKkYl2GRHcPrw46ltb5UcD2Z
         vAhEdvBWiDLJWKtIUzy20lEmRzAC16qnFqiPMYDNllVoEix68cYr1tfxHVobLdwjWAm3
         YviA==
X-Forwarded-Encrypted: i=1; AHgh+RrL9ZtaUig5QWKDcyNkbIuY5ACkMR0vnSIVhfQ0bczFFw14k5JsGBISLr0AIig9LyC2TpfmM2l+REEUMnyx@vger.kernel.org
X-Gm-Message-State: AOJu0YwM2Fb/+iXJS4YKlo42WqdZlpSXi7t/POMdRLLTatuCk+wBvuFv
	rpFTu8aBgsYknAQVUGQpi7rRCkp6Jp1wk9yGomJBoDIT5h7wkqu0UXVvckus+cy+rk4jLdTy7kJ
	vFXCMjCrq1+EGSCbYaGfp0dKXEW0vppor5+TDp6dxU0n/pd7GA+rsC8AHrtNpKNBhKM0T
X-Gm-Gg: AfdE7cmH8b+4VRzOJaakt+LVMwLZdlzA55V7/FV4VBthjCDYxDib9Db/5x82cIGq8Mt
	tVKFp9tvAB+/RLq4qPaprZCYHQ82A3CIZNW7rDuKNEBX6PT4k6k2gP5jD+aENWLyDvFJkT9BYWG
	atFxo0jQRJLnYKD60xvywITyvJ+L2Qddcztcm4Hvol+S7JBVi/QB3exUMxdMcfXEtprLE8Nk6cv
	l5n/cnBlU8ays9fyNdLx5ehewXclhfJDTjDOHhwNqMAq/6Bq5LjL3N1DdcnoQmgJi25Okk7edsb
	JwMQBiVWAtgTtE16Koc522Je63JZ0oEuS7T79ydsfV4H059z6Om4bnciu5igNXU2jm6Q0/TcgY0
	orH4TNjyP683tmFshl9dsIgVPgd/4sBYKeT2X1w==
X-Received: by 2002:a17:90b:3946:b0:368:f0d0:1ce8 with SMTP id 98e67ed59e1d1-37d16006570mr20771719a91.9.1782231779797;
        Tue, 23 Jun 2026 09:22:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3946:b0:368:f0d0:1ce8 with SMTP id 98e67ed59e1d1-37d16006570mr20771684a91.9.1782231779435;
        Tue, 23 Jun 2026 09:22:59 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.30.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4f2f098dsm10079009a91.13.2026.06.23.09.22.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 09:22:58 -0700 (PDT)
Message-ID: <b78c96dd-7037-40ea-865c-a4720dfd8deb@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 21:52:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-3-d6ede0352113@oss.qualcomm.com>
 <20260622-complex-dashing-gopher-9f43a3@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260622-complex-dashing-gopher-9f43a3@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3ab2e4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=q18lXC+Bm01JYF5cPAQq0g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VQuC0S_2QEiWgma_tusA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Qe9bf84r19zZIHQa6R9Dijd-st0wfI6j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzNCBTYWx0ZWRfX9pxTB5+g4cmB
 iKiCFC8C8uUE616LSgDw3/OIv8JqUTCkpjDK6/k9Vqtm67zbF0nP7QG/pP6h34PNgc1Kmt+Z7gc
 VDbFblqa6mumVFLA9ppOwYVIDy8BRk4=
X-Proofpoint-ORIG-GUID: Qe9bf84r19zZIHQa6R9Dijd-st0wfI6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzNCBTYWx0ZWRfXxX6xTbnU8on+
 PVpGjtpHPGbRbp5VSHpwApNmjYcHsj6qDHzKSoTBBJtRwrQBvPoa4vejAVG3uIpelxTMa+FSuBO
 efeg7SJ2EiSpbptdUYTZitpwJbleFJSuoNFaRgG3fU9TKZctiSkdcH4/ksV/O/ALNOms+4VUGMm
 o2kTow9mfsMplXctJ6muW0VxxJetEDJsvOuCylIqJ4KqyBB7I57Q/NvVZeDBK56sbsLNK/ylTpB
 5vruDwCFzvvVW9kqLBns1oaAVtEf/RrgjFq7OjCTBiOGWbmToVyhLIX0CikbfJNNrC9Q6blj4bm
 jHcH+KbCdiE/O5vxNiDVv8VIMrfBuwo2leIb35tbnA63V36fmD9KZjKzfGX+Pn/w4/d5EASdVaZ
 iqzpUiyLMNRXKro4CvjeeVbV1oh3ilhfaZ2f3hy+D+Qs3KFX5xz22mqtofa/6y7qcy1Ty2Arr7L
 E3C93n+kFESF4f7FEmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114250-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 922736B8B1D



On 6/22/2026 7:28 PM, Krzysztof Kozlowski wrote:

> I think this should be moved to its own header which will include the
> qcom,hawi-gcc.h. We already do it for
> include/dt-bindings/clock/qcom,sm8650-videocc.h.

Sure, Krzysztof let me take a look and update in the next patch.

-- 
Thanks,
Taniya Das


