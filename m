Return-Path: <linux-arm-msm+bounces-103373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MODGHhy54GmIlAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:25:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28240CE36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BBB953030D4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 10:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C06239F178;
	Thu, 16 Apr 2026 10:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdMP/48b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oqj/1ttn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FA939E6FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776334942; cv=none; b=aBprgZw6OInsSTZ2+04hPNtXCLv08PA3ttuKI1A77JXBx7usJyywMan09NhLaLjlTQn4/WfpK6M02HyIrGbyv9Hi52+aH2GxA8NKkgytDryPTT9IdC94sEwSt4+pXYO81DAZYssQnhVK4PUgrYfsXOSz+cdB3nxqo7Ju8a2OXHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776334942; c=relaxed/simple;
	bh=iCB7897HV/XIy0aWQaoLcOKCxNFHQxcW6skNabD13Qc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDMjajq5++GtCZde/HTW3srj1pr3utsNYS+PrEoGqXQqX7Nufh6asWYpt3bv+Wl6D5nlI2qBjs+KKyTq+Cwsjep/KlkFfXsx9/hORfRHzBryXJQT/rTP/xcYHGyf51UIbpRIImO6dGbot1Zh7ZCHn2P4X/cR4d0z3f/fdFzkxR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdMP/48b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oqj/1ttn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G9ccr91553253
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=; b=WdMP/48bQKMP2x+8
	8eUedH25TxjVsykzU98QoP1WGR4sxeIZynkQwNvv2MLOCPD3Y7IaVPAAzh/wV7/X
	TvL2fIlnGua/QeSvrTjJem8vimNEPSZQPShCKx95PQ6PcOiZifvYbjmmVq0ca+1+
	K7bwzFL448J7Ln/0wMkOQCSUD645ZHH4x1prgXTs/SI5XYLaOmbTrx7xnr8ukQqz
	ZiumqK5wPsBEGAa6rft0P2jcr6rfGWiHLP+BjWOveJayWTHTi71lD3kuuk6ww5EG
	yyIqeGaAjgzmjRnEKWNdAUg+FdPyg9WY7d1bSa30NnIKkBNxqQDT40yfss13gdy1
	916yxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djrsn98kf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 10:22:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso68649711cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776334938; x=1776939738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=;
        b=Oqj/1ttnvOazDZJjYPf3H9WXF5vA4QSCxaXRXhyWMVcAhyAmiHzhCmSlqCIW6sT9m0
         JVHRl+bX8Qa7ubBbCBofSffZTAgbzbyRjEvyz71W/PDPOSo3QH9DjbJK8ht3wYFFAWcP
         ZETi7M9ZuBX4nKmA04M5N3336f2/uP5HT58SiK054bt0oOomtUrisVaxlFWAKvCDGmwi
         EnpIKsYPUpdlJm8c5Zp5CKTwHgs6saanzgCeguzJc5BYw2+kFuUNy7yU7hqZiDXer9hQ
         E2+XN4UDEjSZNYrXa9A6UGhZhYJeGKBvqIl96wVxGZMOWXFhzrrZwtunO9X7sKzqQwnw
         H7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776334938; x=1776939738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3qEjPRcJQn6pYg7bXpBVgJVjRdVFl779OcCItfqfT8=;
        b=qHkiv3UF/mKtEc2kKTFgYMPycBLedqRN+MH47NCT2Xf6ZM+h2k7UIkwyFh0zeFBX7t
         TbuElzvvlOoKAHxJXDOEBjS1PWLrOW2VOzM63JP9v7fbxZFBl60WDFPMs5Fer4lVGLFX
         n1rGG85ycYuG8+wR6fS66mqknsKEKGuxvoDdpDK+9pmzlbLXDHydOf9Sv3AC2kBomSnT
         NSIicczfvSZ6wfy4wEm1itzuEQS2+Mndx2qD34UJ/dolMDk3sS4hFOyL1lPybbChrnbe
         6WfhGL+upmWoxUyWXnOKjHllJc3KXS2ppulyZHB4pjRejJX+itB9Z7xgv1RRV15JjXM7
         jncw==
X-Forwarded-Encrypted: i=1; AFNElJ+txRQqrANOCI6uf9oD3X+6vruvDZlS68YUtXR9kPC1jVmDIMLU4zB+xLOVEFO2WEKAqGjDu+JCRwJJzLGi@vger.kernel.org
X-Gm-Message-State: AOJu0YxTDNdv4KUAutlAnj5Wpk4v3/h0uwFmVCzg+w75H579hy4hGxvm
	mkKksj2vLSgW+Gt30V6A/OWqOLCx3+YF2jWcz/ZztqR22eAmG+MaT28efpz9QBGD0o4Dk+kAMsS
	lsCWewR/+H6fcNqagvinj502JqMeRuUwP3BPtAPjvcvckPSeLOPxNRhHtGpYqWaaIH1/U
X-Gm-Gg: AeBDieuachv4Pv0dpNL12H+tE0j3atfVnFKkYx92hPgdV1Em3EH0nH1nhTen6/nbGjQ
	9AreyDB1J9iyw0aM5Ikrwv0JZPPw4GOPr2oC97VX0J9zabDv/CXYkJbhlLHbGttEEBmpLZHUxsT
	jYMDVOAxIqqApNmuJKR3fkS+Est6EtfBogwkxbNw/q8k+Z3dG40VsXJYhxtlRP2qzG9XwOvQbk9
	lEABv9UjzWXLvgtMzeHwSK/z4pW1TXlpwARohmcwSl3uifBZEO1vEE6nM0fPL4MdTju5iVqhJmQ
	dPccY5E7PXdwybvRoGIvUZCjwNjfPmmocOY+UbvlpFqL/4si8b3ti8V6EeG4V37xGilY8u2iOGP
	EdWOvCYksf5VIZX2OiSH6ZPcl/g748eMmLSov4OUrn734GS9+WScaWu0Z48aMn823WI7O6emO4n
	ChWrfOCzXpg5kvWg==
X-Received: by 2002:a05:622a:59ca:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e28f1781emr15688221cf.2.1776334938497;
        Thu, 16 Apr 2026 03:22:18 -0700 (PDT)
X-Received: by 2002:a05:622a:59ca:b0:509:2b5a:808 with SMTP id d75a77b69052e-50e28f1781emr15687971cf.2.1776334938080;
        Thu, 16 Apr 2026 03:22:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba24865492asm96293566b.24.2026.04.16.03.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 03:22:17 -0700 (PDT)
Message-ID: <eaee286a-9bff-40ce-b9cd-5f8923736087@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 12:22:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: du0qWl5WpnPxEwMpzfwVfO7gIioE9BiQ
X-Proofpoint-GUID: du0qWl5WpnPxEwMpzfwVfO7gIioE9BiQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDA5NyBTYWx0ZWRfX3PBGPX/xnoCu
 6jp6bEqCMJn7OqiBgxcT71ZvfjQWQ76ypBwNC6l97h12wtFw7PERrAqh3/+Z4Xp0Ag5kxnOpGbz
 812B+WBWDUgUYAe4/EMgWLe2BsGCUjO6xjscu/BPt5ehBg/GU8/Je1+NKkrB7qb9t7GC/ebqGCf
 /639QncMIMJzOXLqioZMI9wQWtPSyapnNspFT51VOL24vhXptG6rAtbvnZ8ySncnFdGUOcBGyHE
 Xs4X2SkY17b808a7XTG68mOir7b2QWA00la83TIFm9ajx80d/WqtkdkBWtN4NBGmAdHoa6M3JRN
 pX2zSum10lFm/aAMfKgS9AgeJ1va7jL3RQ1gvrHzBe3k82Iupbcg64oVX519Gx3pyuM1lI9lghX
 7eLSO7oTbW0gonuN7e6yEUSNFso6X65KaR6BgdM4CUve88hwb8DNwUO0thWdJJ3icx7LO+XVbon
 IKDipKqNBjGfZ6EkHwA==
X-Authority-Analysis: v=2.4 cv=EojiaycA c=1 sm=1 tr=0 ts=69e0b85b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=uEvfv33MuhQ9VhGiz4IA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160097
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103373-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,fairphone.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F28240CE36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/16/26 2:17 PM, Luca Weiss wrote:
> This GDSC requires an interconnect path to be enabled, otherwise the
> GDSC will be stuck on 'off' and can't be enabled.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

