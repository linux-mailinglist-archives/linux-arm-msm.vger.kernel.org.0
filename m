Return-Path: <linux-arm-msm+bounces-104459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OQBBNBc62lGLwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:06:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C7345E2D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 14:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D72C5300620F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A3A3C1416;
	Fri, 24 Apr 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7bGmKFO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eCPgdlsk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185C73BADBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777032388; cv=none; b=fNrtUX4tFidAId4+IGV6fh8FtgBrMwVbkjf27owCWeD8QD0yloLFH5yKrTKTT5dahIM713cANSljfwCagIiaysHL1ymA7pyGXPp8bLB9IBa5jpN6QoDt48CZ/uqNaJMS9mmf+aFdDMmtSkCmEDzZQ+xt5iFSM+sgwExewoz9yM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777032388; c=relaxed/simple;
	bh=W2xoUC03QWrRjKJ20HM+A818QAHm4I94KAJJYAgTQ1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADF+yvxfx1A4R+bAioj9xa2irE248Z15bW8k/JkI6Cg/WhzrYuXX3GdAHCAaHtoi1cNQLQ+s66b8P03889we2yjbCIndkUrlfVU7onwZ/GjK/4cYpyHpy7Y8U76soh3wtY7O8keVI07LDRarmY2+uOiLmb8rB0m6iyxJvt/Qp3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G7bGmKFO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eCPgdlsk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OAEtGe2447131
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dI1QOSxEriABwJ5SPtLm2KbtT+ofNHypYOaGRXg758=; b=G7bGmKFOhD4L9//c
	JP0bGqhgJxAbm5ouB8Sjs6fi5DnDxCPrMYiZSMK6hnQBpZHWOt7x7HnrSttVppnu
	GiZKsU64aZqjjer4om3R2A7L7out7yhKttKy+cjrq2Op256KGqoO2jj6ZrfhRLFh
	gfx+vQpMMgPrPtkxkOgXCjeROONG2t39ubkTfuTa0O6o/ZfkkPHV/KBx+9+rMS1m
	9NYmE4/9Bd/emLrEP+7FJjalXkMxL8FMP+DkbYddU4vIitwpip1EXFq4QNm2HsBc
	1bDLmP8QigEuTnfqbPwF80+vSUlOiFoKKUcLEj3U1R3hnu4m2ZXlbFQhhXl4I/pu
	U2sr5Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr6kprj1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 12:06:26 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-61060ad8deeso430010137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777032385; x=1777637185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dI1QOSxEriABwJ5SPtLm2KbtT+ofNHypYOaGRXg758=;
        b=eCPgdlskSTYdQQ2eIIOW4CY7LFbt8VzgVb6L0eq07s+Kov94S3xWNN0qmhjRGrgKYM
         K4mBKr8SidHYAGj789MWjIN8mELvTXV6tl7DYnL352TF1lUlEcAaWNOTQy7dNbbeUZLK
         nr/+ADOyRqHNYI6DAHE643k1+VjeVgkJcEKH8Kt43UVEreNem1kQN5J+Hxk3QzwsGUZr
         aomM0H4zNKFadc+T23K8qC+GjwHKrmnOOyiV7uavDhjC8Ji5ICokDDrQ98bV+3OoG246
         w1FCTbJW2q/2UerL9Y8XBaTLpJMWgbkFgCVGTYGFiea+IwZsGV6uRgYV0tFhGsGM4+Z5
         vjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777032385; x=1777637185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dI1QOSxEriABwJ5SPtLm2KbtT+ofNHypYOaGRXg758=;
        b=JiYmYzbUyiGQy8CZg00A6V88/AYB+vFckkjyGc7Yl3caSaNNfQ7bN865iB4hpwSjw4
         l7xRRVHa3RWXgMWRFfxfNqQa7m74WJ8jc1ragzhv+ujfzWT2pRd/CZSgY0UGtxBAWAUq
         uBJ+nv3Z2NUF6KQVD+CyRnVRGU98O6AS5HqpJ9aXhdoMOEMoCpfz8ruKfIEumy/zGKsr
         9XNCOJkmqYtVpb2kCSK1EB8APBi6dH7viL7HRIkgRigj4gEKyQVJ2etHRscyEyevSgBC
         3dhJn8ynzPx4Lr3+7v0gm+qoH3ubWKkv/dtAfdGBiI3cCqFBe5OvynqR7h25WUAt6nr5
         bJKg==
X-Gm-Message-State: AOJu0YzLYPuUt8Kay5b05Yr6mk4RVTCqd6NJeVzgHqudvyYi1dMdQdN7
	0//gDN9jl9voHeaNkn+quiLg4OQ6KZTWOmOBEiAoEbWodgbQQp7g97VUVkwFtP6Jji7omB6yACY
	81ikBZ//ruGtO1SWe0A/ixYwyMaiLnRn1XsF494WoDlYXOsamgVGrY5q68cZh3ednUQGp
X-Gm-Gg: AeBDieu6LMoPTdp3LPgVqFkYZCCrqjVx8MhHsNfqxG+Yq0f81FpNFBmUrySqWdfkTzv
	dXMZleV2PO9Fe7WMmAzQzSmApIvUAPj2ZRhP58WZIJl+acZY1kI/JBgPqpRubY5LKm87rFuuWHV
	Dez6CdoqDIBOPVKw35aFd0EAysT0ApDgqMlpzGjJN9vniL0muh4Tythh6LUUd1FqbYYlEn3d8ZY
	JNc3nAp9ClFZ/ijvAZsGos8DiWyrGGbTbOgj6GTRmcNMrbAam7Hcwj3BtIExf8QR3vusU8v6pYf
	MP+hLqXnOYJriuiGTtKH6hpWur8ybO0aiHE2xuKvQSRUBbskuAFzdBe93YSFTQK4+nXBDxxU4P0
	vD3amgmPT+MsMarA7EjRLkAU6DveMT0zH9hPI6isbgtkfrIbcxemg5kXE4pj3QXKqqqibkt+cYU
	46oAE9MPod63jvFA==
X-Received: by 2002:a05:6102:c4c:b0:610:6eb8:3f8d with SMTP id ada2fe7eead31-616f1845d61mr6165999137.0.1777032385430;
        Fri, 24 Apr 2026 05:06:25 -0700 (PDT)
X-Received: by 2002:a05:6102:c4c:b0:610:6eb8:3f8d with SMTP id ada2fe7eead31-616f1845d61mr6165972137.0.1777032384909;
        Fri, 24 Apr 2026 05:06:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451cd8205sm783125266b.24.2026.04.24.05.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:06:24 -0700 (PDT)
Message-ID: <c2bc018e-22ce-4cbf-8ba6-b42ce92d034b@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:06:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] arm64: dts: qcom: Add AYN Thor
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260408-ayn-qcs8550-v5-0-c90abeb7a152@gmail.com>
 <20260408-ayn-qcs8550-v5-6-c90abeb7a152@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-ayn-qcs8550-v5-6-c90abeb7a152@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cdDiaHDM c=1 sm=1 tr=0 ts=69eb5cc2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=I5Wf6Tv452McHZCWETcA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: IvwFLoQcrKhQNvxIk3etO-IigsC_GGXf
X-Proofpoint-ORIG-GUID: IvwFLoQcrKhQNvxIk3etO-IigsC_GGXf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNiBTYWx0ZWRfX/OX48OuSQDAc
 DL4rA828gIOVdJnZ4FP5S18LSxKiSVj4Q0ospf3vNH+W3aPUOgzYhu9+9JcGjaNiq/yhxZIDDo5
 tr3X9COBB6qyw3sux8crWf33SoyLvO2xLMIAViPzZATEjnSVYG/8g97CjdZeRqnYIt+doaIUQQw
 dkRxXXJNNRG0VhSkJt1yV9H47COu6veprtC06QFcLBJCz5RP8K2af1WRm0zS4CZcyf1KkUgEqm+
 PTEZ8HlTJgygcWzzbQDIHRFLm2FjiVQUD1HmpZmraHc4rU7dSnVCLBw6RTux8GMu+zOAKDUQs7Z
 yq2j7HsYFeUSX4qWm23Fhuye7usm8C9kgLDRO7tna1sdz8S4J4picqDkEnrnXHp3rKL6BQ3qa60
 qLZR+FqItmT/FXuBAeN+Xmvp5IK7aLwtaP9EAEj6sJ7q3ELsP1811gYloLoUHIy/k0/9R1wQ4sf
 lyWTorfxd4LQ90d88jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240116
X-Rspamd-Queue-Id: 01C7345E2D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-104459-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/8/26 9:41 PM, Aaron Kling via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> The AYN Thor is a high-performance Android-based handheld gaming console
> powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring dual
> AMOLED touchscreens.
> 
> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

