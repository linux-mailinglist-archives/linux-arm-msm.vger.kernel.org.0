Return-Path: <linux-arm-msm+bounces-100296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBVQMVF7xmmjKwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:42:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B4E3447C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 13:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1401E30565F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC0E34A3B1;
	Fri, 27 Mar 2026 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTWxhcWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axi5M25d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70663242D62
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774615349; cv=none; b=tdhzf6w/bOKmxDsSRgVnK3Bnjo/7hoRJori3ZSNTwE4IQSoraJAKizs8zEsnrULXUWtXNyopligKfN0oagz1k5Q0DBh2es7nzMzFOCSa55hdz+lsF91ZmL6agbOJXMN8FGgxWGxGnVrKc9NqhizETOxWvXsEzBVb1EZC6QV0SyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774615349; c=relaxed/simple;
	bh=dlfjRc0Wd3GRClcRoGZO0mrsd5beoDaj1RkEJFfpeac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHcfdmNuRbfNGvu+cJjy7eteJ8SSOhrEcQapA/QO3tqwEgc+H0RJfv8D5xPphKV3+N7oLM9jCiebXZkDcLxk6xk53LWwAAji9Im+QV5jBzbcpQAH+f1Rh4pAaFhnxgVPPO1dBgGUts+lvf/4FvdAmBjN2hcgQCg6NtL5rSv5TeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTWxhcWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axi5M25d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vq6u298575
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SjhMqj8Cj6Hfid/G3o3exTChsMlC04r95ixtaTjC0XA=; b=YTWxhcWuym6c5OU6
	AXQKPUmL8SJAYWbBfadtSbASx0U2G0KN/f5SeoduP8NjgsLxats/sRcXXJFNkrLW
	pK43xRTvIsoCme/ejNoN31oOc078U4GySZA+kljqBcYvDBAyf0euifBNww3bqK6K
	NmefnvwDsZV2Svrf71zVgKTlT/CvU5Gm8wnpFDmNb5sbx4toobOuebO1mAJ+JibG
	ziCNLp6FnTpsS9U5SvMkQlQaQN5d0bchLzdvBEyHht+9rQsk+yqvYOEN+6u6/eyx
	u0sAvrPJJZhJxtLgvHdZ2O2NXSQhBliyA7ntLdI0pWTb4sdB37RtYcBD8TzSkUXR
	/j62QQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8u32e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:42:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50943e69b08so6408551cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 05:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774615345; x=1775220145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjhMqj8Cj6Hfid/G3o3exTChsMlC04r95ixtaTjC0XA=;
        b=axi5M25dRuQ2Zh/AmiUYHX/yBT+q9UUCdA1Nd/dzLwLt0ktX06thFW4C0Fxpf+SVQR
         wrVXPD6Ri5jlkJ2YHJzmRflqFfwmOWro7pnd/cCdlIdzCboQ7HIDLLLipqGx3KNi2FDS
         wNoQ74/bGSbdqgul1ShSNfCohATg9vNHsfQ3Ja2kE5jR/K0dOW6L9qwQurFvj1c7x3KO
         wo2Bd0Z9HCvgQbSOsNg4LDl/CUzhxz8tJK83VLeyAN7ewvXDJKWmdMPJ7gN24gNqAJJN
         8Q7+3JucBrmZ6gXt/f6Cf37szX5QZ/jLlIV4nGNNkwaXMsWz0AUpvNESuppnHyfYjsw1
         Ln5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774615345; x=1775220145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjhMqj8Cj6Hfid/G3o3exTChsMlC04r95ixtaTjC0XA=;
        b=Z1eGVgPQRc2HNT9u/Jemnp65Rtxin4NGkUSw1Z8mWdRZrsZBHUyK85LpidTscfKOrf
         YM9X6uiSqsIACISMxa8kXgRbKWKel6QdvcVFppkxOWtAGmX6Cz/qZ3tlvek0ifJoYeI8
         aNqX65cIP6tXnJWYAR9/wAwuhwzD58pVWwU3xDwuEUmPD/ycgP7qxwL5u3KdQSM0M26q
         fqi9zLf4I/Xb6tIIXvujbcrueOM4Eb+aGZMRW1pljLq55RmWmHdiTSVi6Tm1KMbvQHgW
         d0sQ9tsv9Wpuur9cvMsAIllBw9FC5jny7HdjJ+DE1FXTCrc7r8PX481tCMpGA0QImPcU
         xuKQ==
X-Gm-Message-State: AOJu0YywKAw3QdWJ8WRHIOrqDLdOXl+4E7ymhVGLe9oX5W1jYcPA+gYU
	vQrSD3UQZ2PWHbd7cKipL/NKXLamIh3I0PKzlDEBaYaN/Rx/YXf5v1mfqgvKWXbAfKy/HiIve1+
	OkqrVlrD2bw1sAFmUrT2bTrcAJRGibuv0f7sxEYZ2Sjt9QBEJQ9GRfuslqwLjq1vZ7Sc0
X-Gm-Gg: ATEYQzwWAnJgaD+847pJfPmjAL2oZYFYI5L/3qfE5M0QpmpcobcUcZEB53I+HUPQI/v
	f41FQz+XQ5ynyxy3QDRHWP2SzbjJbDuYAHnXzcYZZOCCLATkgtIRRjXe2e1fT/bQcU2k3zsGMJF
	nrgs05AIp74WlJSg70oc/GDlRVChJCH5lLE+0EtnG8fKYBclH3hmtaSCk4u/mRxnMGZpLnT8iEx
	JuFYaARAtwHIEl5cJzMDDa7dKNFKz+h2tvKBdszogzD8ySzMDrnrEhJQPzTR3cwym72qBR/+h6E
	PiO02vvah40Tgy8fO8cyeKqB5zjDMrGfs5uxV0ZDQ+txeTUvL3sbW3vzh29oLvobIuIHuzpbG8E
	CXqV7pnkJavZcvqG42g6bsS5BKgwnKf1j8oVCZWW3R1gHOD59+rIQsSFGAvqdBV36wt+dFWW5wP
	3MZxk=
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24040371cf.1.1774615344769;
        Fri, 27 Mar 2026 05:42:24 -0700 (PDT)
X-Received: by 2002:ac8:5a11:0:b0:509:2a92:8088 with SMTP id d75a77b69052e-50ba382505bmr24039961cf.1.1774615344206;
        Fri, 27 Mar 2026 05:42:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6a58cb0sm2157013a12.25.2026.03.27.05.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 05:42:23 -0700 (PDT)
Message-ID: <2cdacc86-bbd7-4ded-ad8e-79d76a004b53@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 13:42:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document the Eliza
 Inter-Processor Communication Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-eliza-bindings-mailbox-ipcc-v1-1-3f1c89bdf72e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA4NiBTYWx0ZWRfX6e9LT6kY+kpE
 4Nap1jgCv8mQl51d7YfvXEhxKvOdGA1qvHDqlwuHZvWI12WEDKY+VYk96pi1YhJFCUUIxOI26bg
 pNET802yzdG0Cl5T3LTn5T0SRLHHoVPHOn1D1bEKI+d8PwX0S7LWx9XskttIdeVAynztBnCf/S3
 fKmfo167YidwyQihFtue61BoZy/cK8nTU7H+NvHb/s/lwBBMkbSdUbjMXG4Wq/vyV2PLVQWOqAt
 EvgM0YfJdrzIrv8McuofW2shHqaQ1m+1vNdxUpNllt6ekNiQZwvyuZNOOdNBGSc9jhbmGInF2Fb
 UVph8jC0tzJcKHSGmbQ2BMdmY91PYZekV49H9inFvc3jiijOiI50G5Xbbv2cwU2ngVrZ1ojUUuT
 hq9mgbc098uzNe0rKxCMR5gbd3OF0reLTmIMyEkSdT290dbT1Rt7Te/U5cmUba6fYRuINuH7akj
 R7V0tuE0g8X1pmbXVPw==
X-Proofpoint-ORIG-GUID: 27WFUAap0SL1whXhMShQdrf1_RWfo6yq
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c67b31 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KcAurydH1nRZE6at0WYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 27WFUAap0SL1whXhMShQdrf1_RWfo6yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-100296-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 38B4E3447C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:36 PM, Abel Vesa wrote:
> Document the Inter-Processor Communication Controller (IPCC) found in the
> Qualcomm Eliza SoC. It is used to route interrupts across various
> subsystems.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

