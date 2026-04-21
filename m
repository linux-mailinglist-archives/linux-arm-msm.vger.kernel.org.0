Return-Path: <linux-arm-msm+bounces-103915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE+5AolL52lW6QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:03:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BAA439477
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8592330164C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686333A8738;
	Tue, 21 Apr 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oQinYadd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gg4GoBqE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F008338A739
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776765825; cv=none; b=DTB5xgePxrALut6jwwHNTlgFzqY3qA1qglczJdt1mFdXIrqd5w9CKKWbQML6OlGx+fIwCa0lXo2Gu+bti3mHp5enNM0ErrrXmpQglNSt4owyROuLWnSI4wR8JM30n9bAw0Glb8Ww56GxlSBj6+rq+ZE0YhkHGkS2EXe4fdk4x8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776765825; c=relaxed/simple;
	bh=fUoxY+osAZD3kce95kAP6oBIib9fL/J8fl6XUc8AkO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9sRe/y2o74dM46N/GPQdWagS8dDe2tz+eE+DZN1bkgFBGHG8syYY1UuSYUQ5pcRyk1eWbi4ewUwsUKsht7KzEgcYUDUpuAb2T9oPg/bFKpT/cO0qBeAdDI+kQwmkAhqggosb7eCCtI+f6a2IcPeQI9eDZlgBCR1pFLsl854tOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oQinYadd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gg4GoBqE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L8dq552755689
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lsBGUUumBzahguNfhdaERVA35xazIx6Q5OSh6tsxb84=; b=oQinYadd4rkxwUmd
	XWTTOtGmXCjbCAW7OKbU3H6PSL29CVypC3IChafirLUkdzfQuj16GTbgh576GN4/
	w31KHH6WQ+g6nZ5bWUNVpdHGkyfhU/PA2KuRsnh7rc6PnJRkXkqacty04PD+3iXO
	LxRnltAtSWKjQk9JSuu4hXEAHniZMFST0tvtk0pMzqiUaAQwHfWMllHZxyTy8EqO
	esyWMgRA92nHb9YMqqzFVg8TysmucnzA6QVqu3GhsHwNn65q7bj+pCvdhVKh/fKd
	MCCewVw7prLFMBUrTwyEdnnJDb0+IGy3YTlNgz6q16j/79X2i+ubn1dwXkvekwLT
	A7J1DA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xmw11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:03:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faec938fcso3542001cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776765822; x=1777370622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsBGUUumBzahguNfhdaERVA35xazIx6Q5OSh6tsxb84=;
        b=gg4GoBqE9nB1FnO1bY7gXq758ovoI+cOtb1kEfsv6J2NPutym4rxJi5ngxzSJD2diT
         EUogi0vu6NIox7fmjDRC48RlrhhX92ls1jIWgN3b5bCnHqpqsLsa0O25FTaEEdXArnyW
         Djtwk+2lteaVJwLPy5GyqJXiQYiPfTM86lI5ebQyfD/JroIIH+mtXoda9XvBuz8ppSV9
         DNZx1hhP+FeO1PZnP0lETGPPDhL3Tach2fvh9Mz8D8AGZvnxdHIFZ330UZiiKFnMDf3B
         rbbnsh+Ot0sMxZncCEVcUa9rQi0cI4kwPcaN/vhHf7B0mENU8fA+05mNSxLGlzmVohiX
         Lv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776765822; x=1777370622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsBGUUumBzahguNfhdaERVA35xazIx6Q5OSh6tsxb84=;
        b=qAzcdMwTEQ8HvBA2hRhiO9x9EUdZe+uLLUklAqkUXLD+IoFVIX4yGE8wX/1cImgEK2
         jWBKJ8e1pE970VScIlTRH20NHxs3c8fFQIXpQo1JKBFEh2uHM/LcLRRurPExrXdRFXqg
         tgKZelqeHYurwYlYfOLL8gd8JC3hCT4FcVWlJOHFinJonUJMD7nY6JqycSZUZPGVqy6A
         yn3hVs7X0HYLnfNUeiALs6BKOqgLBXzslZPEC3ovO7ZWZl1merzTOt/r+4n0zg4mykM/
         Lccmol4qt1Ozib5Y2743MQ0J9/zT1QZNHkQXOpwV/4rqkfPhP+qNMDWDfpjc2kSme0wg
         WNcw==
X-Gm-Message-State: AOJu0Yxd/kqlUlz/6XhHTjVlBvnJDv8Am7W9889Rsnjag2PpB43ubh87
	D4vVf6k0i6gxYsDBXgxaehCcAv+rZsWvNg+Z905IsgElWTn7ZbUlcJuUFkIeBVeYp2jwYHlmLdV
	VjDnYncwrgWHxDoTkekV47w3/hOKf/3iRfKM2EET8b1ZbAH67mgi7X22239hm3UJQFBu/
X-Gm-Gg: AeBDieua+7coD6rCk019JR2M4750MSbmR/vkRuViWvvHN59cettzrZHdDo21KupqfGm
	PNtgUhja2jHezf63xl+HY93LUtG2cTgaxNwP8EQFuQn7bo7mP0lFgSY7N7MBRvxO7F7bnPTWu0p
	8Azp2ThnNWNfPZLmkVTAlcoTZTH55VDVWCK78C93Q1a7uQUSBOZUIX/3k+ndzQlE2mY9YoNdUpb
	y47oE8q0nFmZ1yPeKX0k578dXQjAjANq9Jy2hvYaLValWr9/VcJeK0WeZ4mwi7faog74OS/MRhk
	3eVzg4CSpmFSibz0+KW/Z5V/RnMb2t8yX+4nuJSV01bei/5ZbGwyqua+17/FtCFeQW3EYUOkSow
	EFyvAZr5ORnpUodZxBFO+egzw7scaUSsQX7XN7D99D6ZLtrtDBlK1VG8YKvove7/15itwyyvQii
	SsT0LtKkrEcZlOnQ==
X-Received: by 2002:a05:622a:44c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-50fa53b0cbcmr44662211cf.2.1776765822198;
        Tue, 21 Apr 2026 03:03:42 -0700 (PDT)
X-Received: by 2002:a05:622a:44c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-50fa53b0cbcmr44661851cf.2.1776765821742;
        Tue, 21 Apr 2026 03:03:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c480e18esm2586174a12.10.2026.04.21.03.03.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 03:03:40 -0700 (PDT)
Message-ID: <46a322f5-db18-49cb-afb4-ec1a5bf23717@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:03:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] dt-bindings: extcon: qcom,pm8941-misc: Add PM8921
 compatible
To: contact@alex-min.fr, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Guru Das Srinagesh
 <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        iommu@lists.linux.dev
References: <20260421-mainline-send-v1-sending-v1-0-bcb0857724de@alex-min.fr>
 <20260421-mainline-send-v1-sending-v1-2-bcb0857724de@alex-min.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260421-mainline-send-v1-sending-v1-2-bcb0857724de@alex-min.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA5OCBTYWx0ZWRfX9pBuW8U1ikjx
 yZNz1DndK6lpsWRSXsp1GAHYSVxN+wkp6nMyWIx+dztnfHSA6RYQnQQNMKE0ARDkdAS4pkQEihM
 xY43pXUabBNJZQVFqwaBp7YpC9qsWMs96xipxKoFBbuyEVkGdqWwxoK6P9AlXagDU949b1/tDC2
 +j4uwndx0EW4ZJF/7ob0C/HTtgp0Cd1V5e2WEEhEjvrFm66wdNzYE2KKDz8cdBfEoh/Dp3Kqnxk
 eKS2j5KM0aLnuzp8xtu5IfykVjl/Krc501UihilqEn3fWD/tmpbdpHe+uQaur1drhsYI4HYbSFE
 Rv8v5tFZh4K//yJHEmRoL215Xp3D+1yz59GlAze3DifeyE/N8Pv/QN0Oe0FOmHoC4XAqar81N15
 6sNQqcOqg0+ss8YW+fTs2nKLATwiLI9eqmMDpxgqiGPV+lkJjltKheISic11ekBuGc3rVn/Q4fr
 C/fx3buNNWBqr4GAtdA==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e74b7f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=-ROfvrG1s7MAeRIb7yAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: j61vJvzStDarLHb98A5zuPNuNDKIoPFJ
X-Proofpoint-GUID: j61vJvzStDarLHb98A5zuPNuNDKIoPFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210098
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103915-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,alex-min.fr:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MAILSPIKE_FAIL(0.00)[2600:3c09:e001:a7::12fc:5321:query timed out];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 97BAA439477
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/21/26 11:45 AM, Alexandre MINETTE via B4 Relay wrote:
> From: Alexandre MINETTE <contact@alex-min.fr>
> 
> PM8921 exposes USB ID state through the same interrupt-based logic as
> PM8941, so it can use the same Qualcomm PMIC misc extcon binding.
> 
> Unlike PM8941, PM8921 does not need a register resource for this use
> case, so allow qcom,pm8921-misc without requiring reg.

That suggests this block doesn't really exist on the PM8921.. I
can't find any information that would suggest otherwise.

Perhaps what you're looking for is "linux,extcon-usb-gpio" or
"usb-b-connector"?

Konrad

