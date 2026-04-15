Return-Path: <linux-arm-msm+bounces-103293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEmNES9/32mcUQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 14:06:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E77214041D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 14:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 528B83019447
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 12:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468E1367F58;
	Wed, 15 Apr 2026 12:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oohwY2Bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUYdNmgn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A957C343216
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776254763; cv=none; b=Zv/WzgJ8hWopAFltgksAKLOvWa9OWUL8kyGUIWEZtMN+oXrkDZPh8RPCZgeTFY09DX67qvauuZYCuGe9MTqCHAflr5ZeswKhO/kC4qoLNrPT9DlrBO1sqi75KqhFt04SfjbJqbX7GryDEpto6vgo8trV/lch+/fFlze7aUHvRjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776254763; c=relaxed/simple;
	bh=aS8vxSG2wGvbVUmsEsetZsJFgLkAtcc9AR7I2Ayxtdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fy8mHgtFkFk1SzKaxmioh6dycF42sLPjDOBS1qp6NW/mm/g+fwdQ+AsjRZWUTb/j9g3GI4fZocX7YEsm2lq8xOFwy9K2CiTNAOV6FL1eKrA8zZGYrwF7vQohxD2Ut8WbpcO8dZGLkNjQec6mX5iKzXq5Oi7OCKq0J3nr8LP+kow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oohwY2Bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUYdNmgn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63FBF29W3059058
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 12:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FVJC/jKElBXxUXb1flX4jdFwAfQ/NVixqAkpOCme1f4=; b=oohwY2BhKXqMNzot
	rx0/qZ7S0wCiHYbDA2jVDStCp5wOjv0wgfOnz2QxQyCTyMR2WONUYv4WgV7vSg7/
	HKYiI83AfxLki23s99ZqARIj0nqbcNyCJZprB36+TWTN6njEfo83yKdpzXsY3D6g
	SqP2UYKpjqtYnIrhFG/x6YFuz7y2dGi6p3FvBsnM1PDbCDwm68wB6ECD181UsLbJ
	FfUfCOGIcAT+ZYbPNvtGXWtsLDG4gnCQMyu8xXdLEN4RntLYDThHwjNaqUkTi0s4
	twJAEr3myYwvJaSA6/1qpcVsR3R3mAcSH/Arew3MtQh7dbR6IEohgY9yMZq1UbvS
	9BjwUg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtepu4n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 12:05:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954b9b5da7so21728906d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 05:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776254759; x=1776859559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FVJC/jKElBXxUXb1flX4jdFwAfQ/NVixqAkpOCme1f4=;
        b=WUYdNmgnU6ATTauNpYl94EIyvxBL4kxbPsUl7z/ewTWdhXETIxFWQMKdSDlkn+wrXo
         IJBtkork4v19QQKOEgAET3qjeIbItwOczz33HNrwnazaBMKPxxHMb7BsSeFuUNrX9V3E
         63KQhCpk6qBZ0vIODawdz+0Rnd/WpoqElFNQMyXnG+fXejJ4LIFRoXTkxCvkyOYzX8P4
         UCscjYiQKgoJyTy0KUUDKC8g8IG0bDkLoT3CQun/QY1tqDXXXpsnQ2mHu8e0/NAlPYNH
         EY095Mkxxg0ynhGTa5iW9/N2oKKj7fICPe04mqv6cZRuyoZtBtHRylxqRwUX3UiE3QZ4
         iIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776254759; x=1776859559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVJC/jKElBXxUXb1flX4jdFwAfQ/NVixqAkpOCme1f4=;
        b=lVtM9Ir4pdeDOpOuJkoXNSmiLhPU7L47qj9gBwuMlkr/93GT0q8t0NiPr2rW3mU/iu
         6D4wY5c0TTYLbNBzbW3r4eTiwMSKy4Fx+m8YQZsdw5fT6vmxN/uXr+wxmyQ1brBBBmNy
         md9G2Sn9xOapMJlL3fZr8LnfNGio4k/1DL6TAyIbUHrynumzRfvlHaYerMY7GPD7RwKy
         +t1V14OG89Ovnj8Cm947TZLOuLsYvnq81Xs3Q9zjedZ6FWMQWvi/txSDOOcIgrFAax2X
         5vLajNXKgUfkarw8xVfXEBI29O0+Sfwm1wUh1RpG2tEvOyVCjvTeR15LHJp1GwsW9OoT
         NCIQ==
X-Gm-Message-State: AOJu0YwcO0nx+cNCKN+TgJDfo6r2dX+oEQGQ1i9tkx1FvHvGbMmof0Cn
	Bc95kou4pquJF+anrRnJlJhr3XLFaduswaZwrmXJBek7FBiC6NMEq1qge8ii0TAFqCIWewBlBUl
	qljA/dGSfk9RYCY2xBpZMyJBRFOSy2ZHEHKRicT8Yr6pzVtkxOqaLxmpWY9G2kD6SrzN3
X-Gm-Gg: AeBDies7EKvyj3ancf2kbQUTpaemDlrln9rcADw42Yc+0iKqg6mwJxsS0ZOm90fXuuo
	2PY6R8MbxIQibw62AyZv6RNts1OU8lMA82gUnLgM6dajDHHuY+Tu+rrVUOU3kD7AW/N5KG4/uIG
	+CYxqIlF0SXeWT0jQTCBe7VwWWP7QaMKEuO8wL9Nkx9hX8J2NUcPjjHKRPER6oQobQt5fc5Eq5H
	CtrMe4yTOXVLiQR/SIbc8MppMsgMS+WUY7P3tlNKbzuLGowPIK0lezRXh0KGWQOV9xlXzdDGQWW
	TJfIGYy0NTRlF3Lvn15F1L58qjemCVDqn9jBjuolpWQm0IsoMEu9bfBnTsHcsDdkbg3VAfTe5Nb
	9PDfkNK7Z7CcN/yldjBI4Ol3fJINr0UgPgdG53fv6AED/k347TVoBFlkjnmnTWCAT5pvSQK3yxg
	XGfQkznxAMYgskAA==
X-Received: by 2002:a05:6214:d03:b0:8ac:af77:c583 with SMTP id 6a1803df08f44-8ae6a900747mr24215126d6.4.1776254758792;
        Wed, 15 Apr 2026 05:05:58 -0700 (PDT)
X-Received: by 2002:a05:6214:d03:b0:8ac:af77:c583 with SMTP id 6a1803df08f44-8ae6a900747mr24214816d6.4.1776254758360;
        Wed, 15 Apr 2026 05:05:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba173930174sm51117266b.18.2026.04.15.05.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 05:05:57 -0700 (PDT)
Message-ID: <d407e341-e54f-4b1e-9000-3e12eb2faafc@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 14:05:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT
 properly
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -Sz9aoVYw98BbzK26M38uu93xih84SWl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDExMiBTYWx0ZWRfX3jmyn90daOQp
 KGoNXTQ7C8AmarCJrzek1GKiz1/r0G2PjlQEsAn9zQ9O0Owmc7Xq9gLhWrcsaYVnNYnU8wphilW
 Gjdzyl5lao4qkFp3JxCFHTynEyBNyZcN5qlgXUDAxB3FEQZtCYVaYlaw5Gtr6tpor8Tns9yw5hl
 KHc4RDxYLmDjs7dMMr9sl8Be3UD3yDCwdG8xXPhHBn9H9jz+TUQQoWy6eHGUnHh3bUNS0cwTT6W
 mA61qiipsgM1H6yPK9paLftli/2bT2bndt+S9tbxq/LlSAX3Bhkuv8o9+sS/Di72kDWDdX44Kcj
 YBoKSPUInaiG1ldPOdFcWFe3x/n8f1aSTiBZ29ak/7u+p7t5FXBHTHN6uj+i/bJC3F1/RyOiJ1K
 VIJqpmmREjqZEVPJHwT1WYI/sIiJ/ZtCGgvUvwfw30mpqnia8NRBw2Rt/+XdlZxL3hSkHnP3F8D
 fV3uYdSNGADZ7O9rR/Q==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69df7f27 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=i1Qc4F9nIsNgxiQxDngA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: -Sz9aoVYw98BbzK26M38uu93xih84SWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ixit.cz:email,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103293-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E77214041D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/15/26 1:56 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

