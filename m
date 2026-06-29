Return-Path: <linux-arm-msm+bounces-114985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G0/uNZJOQmoP4gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:53:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B67B6D912D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:53:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bGzGpZVp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VsPWPCtD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114985-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114985-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3A87302979B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219BE364021;
	Mon, 29 Jun 2026 10:52:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8D83624D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:52:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730323; cv=none; b=Aua3FWOBZ7IrxnnH5DkA5YvrBbIdxkQ9Fc2+idOMP6RfwM+Op/luZ7bBoXcSE+qjFz4GkOt/sPWpRiMrWdkm3/hjLyflmfAssOkOK6B92WuhFX+gDVk6ZrSMvMcisjaMFLRCoOt65FbHYTbWNpn/SMC6+RlV13mkSGt5Phg0lAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730323; c=relaxed/simple;
	bh=/yFq6cv4qDUqGkjvgniB56rgIVtjmTo/cD+e1+Lpb7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loKgrkqlNMNM6FlqeIG9toJn19yRmypjtNUEAdxDwArEEdo8JsLfgL/bo40s/izYJMUW/nI8oSR4ca2DP21me4jFRpGq6mMZi8JyAkSY4g9QWcBUJ3uN0aNx84e4cek/bkaGBw8u6T/bYUG4M/U6oKH36oDCzUsUtJf8sfirkkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGzGpZVp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsPWPCtD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATeK42648345
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kj+mCYqTD3MrXFTYCaumQ3xi+dZUnCc64AqDHiFZ5qs=; b=bGzGpZVppks/rbye
	8Evtcor0yVvrQtO4fU+3lzK+neZBBlllWAE1vjQRkpcBeqzHu4y0q2VOgNbAL4Vl
	/oHEvpKP1pC2CRMmVpM3V+iIFY/J/byoQsiZArSc59HnGl9gaQ5Uan7s0xiV8NgY
	ZJsjuPGSsIYdvpKUwyZw3ozAbiHEVH+8V9vhJB2eed2gHEFmltN8OPFPxdKHNc9S
	ExcPebUQFcXZM9yRyqGurrmXELN7FjEYp62OmXekDSXZ4LBGSqoZ+u5rccO6iBhI
	edYNOr7YlNGRwFZwPER5lH61NQnTA1k6N+y3Y9g6exWQtDlxDOTJcwYtLJu1YMzF
	xpcIjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgwqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:52:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92daa1a0f7eso60082185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730320; x=1783335120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kj+mCYqTD3MrXFTYCaumQ3xi+dZUnCc64AqDHiFZ5qs=;
        b=VsPWPCtDIyGAV4YyIlWu3twU9DbEiHD3X+hG/rxeCv7XIm2GbGLVgl7E5+3SmitMRD
         M4Prv6qmQb3m7ildd5QcHkdJ2cB4vHbjmXaJ8YWBtpkOWx2PX/kqb51bLfMpvrRTpbdv
         JzhrDpsLlsLo3q0WEvPOrulRHRCzbPBucrni5BrAUd/TOt8i2S35jW5tAUbPov6Sbo2n
         67SHQVRh8a1ssb7KHtyFgNwz2qBbtyB7FhGlXYPlGukQtOEiWx0Yv9jJMQh1gwwg+G+l
         XsAYTeL5tKTWARwxbelCVwHlb38DF+zCxf2DxhkiZDsuDjyDrd/LnF2ZtD0muydxanu6
         KTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730320; x=1783335120;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kj+mCYqTD3MrXFTYCaumQ3xi+dZUnCc64AqDHiFZ5qs=;
        b=Wg/WohWi+vHWlDF8mngm1jBgV0uJZPp63fZbrN0O44mpb9JRQRiHhNKEs9eiAiirUf
         FzHxR0qSLDSSYEqPbSJo7bEtNVoigRQuDLHXLKThpnGTJR47WRm0zQESA/Qv95biU5lt
         h6QHx3ykhyYhHdxCTvLKdLZr4LBmF6MAvgaJ0NU/zXvAwRnVu/tOdK9zyELXw5+rrviS
         M1ERv2eltDdc7RRDmQnLvDW2sERDzLUEQ72Y3g8hOhOOK1SbzTAMYTtMuUvQI9I+W9/J
         0xfku8iGHs2DaYRFI3+vek12M7FsXY6Z8xvApSVAK6L/4kKDrNE1n+m8uAXbLlXkgE+j
         p1tg==
X-Gm-Message-State: AOJu0Yz8rUflmdQGvm8U6QCdPV/prz9OY+WJ9/wP9vk97nBMt5iyu9W/
	9qONsuTZxXm5rQNunAP/P9AUVIPkOJsktioMGHZB+e9ZxoO55LDrGjsx+LOwFH5J0yASUbqVpDX
	9fOlI205x8/4lmjVrw7ZPY6RQQ/hzvAN7ttegtugw63779t3JCoBtaxu3v+dVd5wYHbVE
X-Gm-Gg: AfdE7ckS8d6btH4BaeXNLS14l5W4Y3A5AjrUZNZ9M4NOuUUMZrCsRe8MbZ+Om025qRR
	TC100aSz/304q+YSOEb+zAqNKxczkAWM/Dv6hi14b2RMjgxnKXv4ssGGxWy/vkVsJ74NBh3rTNX
	xoGzBaagE+0O3QbWCca3KjwbbdhxHOlvGrGTp8yM2a+XhZPg47gJAsg/NWEDFPGikT7R2QGdAAx
	yqZTiiYGopQ+ES4eIeA55V0R0Y1+QVxn+FVm4jauoTG2kee2TZsOcHwG/6qbyR4f+0BhVnzsXqz
	33FGwZWdAiiitx3h+6njjAC6bStCeSMCTtMNf/1/ht9bLlzUYvRbEFuYUIVss7szNSfCYWeDmVu
	ETfLsZTKS8pfA8FGL6eL6ilYBsmwDEE3Nf7M=
X-Received: by 2002:a05:620a:4493:b0:915:7d6a:4f99 with SMTP id af79cd13be357-9293c7e9bb9mr1395780285a.5.1782730320066;
        Mon, 29 Jun 2026 03:52:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4493:b0:915:7d6a:4f99 with SMTP id af79cd13be357-9293c7e9bb9mr1395776885a.5.1782730319428;
        Mon, 29 Jun 2026 03:51:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c126bcb08desm120592366b.51.2026.06.29.03.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:51:58 -0700 (PDT)
Message-ID: <8811c181-9caf-4797-8e17-52311702e292@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:51:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] phy: qcom: qmp-pcie: Add vdda-refgen supply
 support for Glymur
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-phy_refgen-v2-0-4d15983bf91d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h2JztFv3PqfWo7KyNeBkMwWJq1NE7GF0
X-Proofpoint-ORIG-GUID: h2JztFv3PqfWo7KyNeBkMwWJq1NE7GF0
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a424e50 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vCEpQpMPtrpGXR5ZkIYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX/bFyWOeDJ4C2
 Hcj/RHZ947hzkGw7VMdK4pWp7FsZDrkkG7xPNNborW48zH1GlQCXCcu6JPxQsr41/gnK6HS/0S9
 W+9TQZWmc5zFl+RUVgRhyyp+JCim2us=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX0ikdxKVhA2ME
 vY7lGu1Itf1bD+sv5O3ET+gMC/0yFSsrwOxcO3YDhRZnKagaJ2ZudoVyhzlAIWMDq3eD6OQoSU4
 18LIf4hsaskKEnXYOEt/XR7b5PJt1X51zSGWJQCwmhddu7cXVxQJTJX2yxGAnxZojnuWwjFhBJA
 b9YsuAG9RUeQjIPZixzF5czLokV8h8avJT3RGRYU2foVDzlX/14olX3HVW4fIbRAajBRjFnrDVT
 7V7q4zeZYDMLOTBTuYtyO2AUAc+yMjVxl93QI3lLlwCFKTBp48WyncDZwvLBid5BTof3GrrB+XD
 vy72NUNR3vrW1ZXR/LAvOGGAV/ZOexGqT8UcVHFNdrD7vlj7E4PyqaAsal9upDrI/anbs0G4eQf
 mGfL9vhKQYTRQ+8xiChEi8wlnm8HVZxuGK53p4226nUGkCM0r+CaMHnQ1WpswCTACupIEWhtoCk
 LRw1IQhBmgv7nllEh6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114985-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 3B67B6D912D

On 6/23/26 3:05 PM, Qiang Yu wrote:
> The PCIe QMP PHYs on Glymur require both refgen for stable reference
> voltage and qref for stable reference clock. The refgen requires two power
> supplies: vdda-refgen0p9 and vdda-refgen1p2.
> 
> can be extended in the future.
> 
> This series creates a Glymur-specific supply list including the refgen
> supplies and updates both Gen5x4 and Gen4x2 configurations to use it.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> 
> Changes in v2:
> - Add dts patch in this series.
> - Reword commit msg of dtbinding patch.
> - Link to v1: https://lore.kernel.org/all/20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com/ 
> 
> ---

Is this necessary (for Glymur) now that we correlated some of the
TCSR clocks with the right nodes?

Perhaps this would be necessary for Mahua since its clocks don't
require QREF (or we can lie about it and handle them there)?

Konrad

