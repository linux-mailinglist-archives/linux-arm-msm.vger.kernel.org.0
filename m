Return-Path: <linux-arm-msm+bounces-104323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMpDC9AN6mn4sgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:17:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF1451DBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 14:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99EBF3003BE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA493ECBCD;
	Thu, 23 Apr 2026 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9Q6vArf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/dARvtc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833A43EC2EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946569; cv=none; b=EQL8EYNmEknxGCJ5HC1xtMZ0a7UvtMIVJB3aWVejtL94GWyGOMUykS8AGl9zN1DQBXivlGZJnYlCALU7Exdc9wLoEIWuInKI1XXECPpYiWwgY01LRBscfqfb/tLiP7xbvYtKFzVCoQ2g1puRr9kQGJLXpL7IEZqbihPH+6jey+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946569; c=relaxed/simple;
	bh=fkHcFP3UxtP5rwJIeJcymGHyus2lHI1cTWXXknYm188=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfLRHjq4ij0jskvW90R2KmQrjnimpsUKSCdb/beN6teHlZtCAmmUu4XBypxL+lnb5EOuBE7N+/TE72oEXgXEP5ASjBtSCfcqPnVn1LeTZ3Ifw9SzDLI+3qWiyXR139rSUFvKdaxtICIgxqYJjelSGCN/mHlqoG/Tx2SzvMa/w/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9Q6vArf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/dARvtc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uFU13044112
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIiIo8b8NwQ80b/PpFWVE0Bh2pLtqhdJPtbNefpi9Zc=; b=L9Q6vArfrXfJulh2
	+KA7Zvr93qs0G1+JGWl485tXDu0fx1yRtSZ6xFAB2o+/qm90s1Df+QFgwA+i4HTm
	9DX9Q7PYnSGQwNzk708v1lkZBd+khrmfZbdWnxuLKToICrTzrnzCOCbD+idkttoc
	vytFCTZErENHGlt1Hbr93SLgIHFosEG6cgGPkVI5At+8XqZjLuYHNIPksVXwlRpo
	YBqloRK0kEWagyBmpYiZ090uJn2utMyR1eSVkbboXiq2S264R3kLgKgoMWqMtxhe
	vxRlbfhzPeVXhbJZmzY1siQgdGNZVsVTgZLXgkDIi/wS5egc5tDbzC+Ayv+GM0iS
	bCUEJg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh3tr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 12:16:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60feeae5dd3so308830137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 05:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776946562; x=1777551362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LIiIo8b8NwQ80b/PpFWVE0Bh2pLtqhdJPtbNefpi9Zc=;
        b=b/dARvtcHtIawWXN4S85ezl0BjIwlBGZFoR4LxdGWX2ioRICEli4Zac+OTrsRHHjtQ
         f25LMKws/wVdJvLK8C4emCjTLat8HY+GV4F0jQsH1hobu7ZlLaR3zT1EmdIkkXu2SkAn
         5hRNpTMBzFKAANk+0phgAofLQGn8l3FJ9pLFsQqmb4mQrTeVymoP+W0whvPfVID7En7Y
         uRkh0O4mWcgwQAatYfO03g+k5F5G7ZZYFzjXwC30onmkhdsktMVZHxxa/XXwQyu98meQ
         +zQqtY5fcS2ibzkQ0D98LkRawtH1wgm/pKVWuNaAETlwbwZ8X8F4DJFhivuGPtzxQP1Q
         HieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946562; x=1777551362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIiIo8b8NwQ80b/PpFWVE0Bh2pLtqhdJPtbNefpi9Zc=;
        b=AIRJCvQt+n0/TY5oJWXLipCeUguarbMolMgMpZnUl2E8Z7xHDGLpkZJO/UWzkxCVE/
         h6oxvozB2t/gg19T38kshzGi1kTyAZFFeo3Gwl5gVlQVb+CSGVr3xFYMjVC0ge0iCD1N
         XxKnkAsjdBqHBoevHLMd8hZyDxosHBjEPbYLi85R2KIO9QlPO4ufLPhu0zqVdHVnKRUD
         lYlWUo4wN89xa7wCHznnye4AispAFpPd732D3rXaifSSz7Xg27Qop2dxK/xFjuwCdcld
         xdDO2aLiyboMLK0Ra52a2Cgtc5R0SFD2ty24QS+hC1OrQAk1+6SSugOUBFLTnaoiGSBx
         cLjQ==
X-Gm-Message-State: AOJu0YzqfwuQXKNxuy+q8NStgFQ7VYgREdsap6VinG8fVCuNlGFfYrz9
	2VkZWghAAhNeqwjs2SWG1DwiIcuxL/5S0j7z7VMGuAVCXvgIRRkc8AP1UOpXlcZAEW+lD/gpUry
	sNBjgm2oYhuE/fa6r3IPh9ZWsO36fpMbnWDwmZJcaH96ofV9QamMfHkFCcDIKle+XfiWqSxnyf2
	y3
X-Gm-Gg: AeBDieucRHa8+HClZGEEypgBVaRioMlViAW4QJjCJyPcCglZJk46Pfrg9rAbdYWoprx
	Enmz373j/x7ZnS3yL5KCbqtsjHY5u9dQJzsRYpWJdJmvqMZkFMtUdaQWSSw7G24/VPf8Q3JYhj0
	4gwQzraZ3P7bxbvnrYHP8V05pu8jwLeJw+hhotJiBeY06kplzN9ndzWWcIn1bKbTp+2jvwobWGf
	AdLxhIGgxx1m8Jsm3iH+c/cR2o045MM4WlL2NB+6K3H/OVSUbAhxpKJHf0LqRDrnlYUdA0NivNe
	3xK8CF+EnCAQbFhCvJKw//9Vz8Vt2jrxwZ3ar2Kazq53LireL5KfsmxNf6Mk9/jdiIf5UwnmJEM
	jX5QM/PRdaXTIAmL7HS4bT+/K/cryoS6CO1Gjg33HX1meYEjzrMM1xpB3B1km5oo34uywQHoU2f
	sqqvE7osiMoC8k0w==
X-Received: by 2002:a05:6102:2409:b0:604:f07b:efbd with SMTP id ada2fe7eead31-616f464118dmr4446040137.2.1776946561678;
        Thu, 23 Apr 2026 05:16:01 -0700 (PDT)
X-Received: by 2002:a05:6102:2409:b0:604:f07b:efbd with SMTP id ada2fe7eead31-616f464118dmr4446022137.2.1776946561218;
        Thu, 23 Apr 2026 05:16:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046223sm653058566b.49.2026.04.23.05.15.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 05:16:00 -0700 (PDT)
Message-ID: <0f57e558-bd8c-486f-9abf-d4691d8c62e6@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:15:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Lijuan Gao <quic_lijuang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyMiBTYWx0ZWRfX7yhbau9PVQxi
 Kzk1uAaH0dhm9cTutL6NSYNLce7cDPyysuy5vjTho/6DrfA6+VdLequovEYOqmW+Sodr3lWMduk
 hDiPrCWgvJ0dStuif/SuoY8IhyF74AmInLfM8YnERTAWdASBlIhSHQiInmX0cs/NfHRWS9bs+XI
 CU5mm2FqAzhCK3V0BPa1+N73RHd0TKlubiaokktbtEGgou5/oDDoXY050BsLcRjy2Id1F3gTZ0Q
 HyWA9msSDbMqenaFGmnvvtOmIvEvHcZLmkCmirbUnN8KtsTjo6auGx9fX6em0Mt3Gxb933MI1V1
 faXl8OqhbfvBnUZEm+pIziKJFgXV7j0InErNgFYk/Fc5U5309xJXswttvxtOcXKRI0dduXF//v+
 xJeCIaz0jxfWDzOzffN1qT/5MRYl8WC48A1YfmO18EBrsw9QsphbsMAxYtP2zPyBeQIRLPLbf8f
 AgbI7TwrwOeLRVqU9OQ==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69ea0d82 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=zherij5Z7axzGqeR70oA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: s0gvwIwcaCRF5c4F570qwHMDdm-NzHes
X-Proofpoint-ORIG-GUID: s0gvwIwcaCRF5c4F570qwHMDdm-NzHes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230122
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104323-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31DF1451DBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 1:25 PM, Navya Malempati wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> PDC interrupts 122-125 were meant for ibi_i3c wakeup but qcs615 do not
> support i3c. GPIOs 39,51,88 and 89 are also connected to different PDC
> pin to support non-ibi wakeup. Update the wakeirq map to reflect same.
> 
> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platform")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

