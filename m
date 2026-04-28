Return-Path: <linux-arm-msm+bounces-104843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MhTKhAP8GnTNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 03:36:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD7447C71C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 03:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D17C83022FA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 01:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7BB1FDA61;
	Tue, 28 Apr 2026 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4CttKse";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NnjsHAik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89902D46C0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777340171; cv=none; b=dhiOUf5oGwM5Ywekz1Lte1C6yMUq8RaHzRk5tYqj3E0jSGTmG27hdEy1P1Z0KePSU1hWQg3MGsAthZ8devT4k2KselTEIiLRd4tQjsu9c+95ZqzbzLVM6MX2byddzk1EazymogTZTxWp5Dkvkx3tQW0y1kyg6NiMK6+oRjXHzhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777340171; c=relaxed/simple;
	bh=Y7gKuCFiPboEfKzDAf73jyDXFOaCi/weSrK7a2Kqvuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCcslpavdx8P6LLwd4knrbTdRTCKDxueBG/22Qaxb/x9s8bbs8C2PfDvOvLKf7vSHaM2fuq0dq6bqELZrU3XkI3AcDuwB0e7JPh2XJmQ7EC/DhwJXsw3YnLpF0YpmHeE/eZUy5jJm4Jt9b2M5gR6tOyI+Mc1AdxoNPP6VRxCqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4CttKse; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NnjsHAik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RIgORL2006190
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kmuhBpsDaaHpjbrFXXWCLn7R
	VHpczN9SgLXRDFkeWwo=; b=N4CttKse4inMTMby51Mb1YAxD5xM1/fxIfjRhTVS
	iZno8VmHFOlMbCQVh1lFOWhaqm8tk0pluCgK13BzDyGZClkCKtyv0rltkqzDyZkR
	qjQwIjNZrNoJi29dR8kNUzvlnxVh0cPFApFnQemBDdY9tpzBzrQdnm1zR1AlacZ6
	/X7nsFhOFQDSnyJA2Tbmv7JqW2jWRjSOsXmz6OwqBmH1XnCZf0te4Z+O4DeCC1bQ
	WJ5MFIvKNrGGEboTE2z/+4Ph7NHfZJlJVb7+1/JjlhKFZjUFksRcz9RdSgrHFAtb
	s+rG6IiM4pZjnE0mnUEMx/MWvExHx0UMr8BwqibLi/o7Lw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkjs79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 01:36:08 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ddd8ef5343so10796922eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777340168; x=1777944968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmuhBpsDaaHpjbrFXXWCLn7RVHpczN9SgLXRDFkeWwo=;
        b=NnjsHAikA33BjHVi8SDVvQZRfPNka2MksUhwl7i/uaoDTakGNsMKepk89BDzkjj5jZ
         AhK+rJF6OwUP+VThX9h+jz4Lrv3pADLzr33jzE3bhaaeIXxuIEzR8LqsxjMfNvPQBPee
         KbwE109pCmSCCwspXSTUftjRxJTKhTpiqWR7HtX6J4v+yAd7V3HN9JosFE4/E9BL9hQq
         UFVIAuH6c4H8Zs4uLVABkoNOL6kMmKNlLxpRW79N+8dDN9NnpgfDgxeqCo0WsfpKjed9
         gIIBvYDLcM6yjKkSV1iRnzAOjMNfM93vOP5VMxfOPp1FnHkaM7VdEFkXiXjueK8HcJZp
         cplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777340168; x=1777944968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmuhBpsDaaHpjbrFXXWCLn7RVHpczN9SgLXRDFkeWwo=;
        b=n5+zDQ6e4oR8CTZiwax5ndlzDg3U9GBJZOJCgvf/aal/tun/oEPlcg+OyddwaFugMx
         qBGXIni3Ll/nYWYvF3+U4FTOfDoH+jV+ZEMzNHt+DVK6kIi5z+yn3VJj8ekB5a7l7ayD
         O+HwMR/v9xyMMWnma9K+EcBmdvCBvlAOrKYediRrQjeTBr8Fk4XQ/uPzPufJ4w7bu8D9
         U1GteXn1q8hMXvE5nIaUXvPLJYBkE9kEiTxXnsgWkxSXQxY+dq9XusouhBBjjuyRMOmn
         mgmD8V6Ei45UgA198Nds2OLWbwxDnMVQyM8aANZD+xGJV2MUverj++Z110IaAi/GMQuI
         +M4g==
X-Forwarded-Encrypted: i=1; AFNElJ9CvsrUh+fbFDuJ2ulBPWRnaBcpT+dF6G4noItNcPbhR+G+fHVvzolXQO6DmxTBPlrlD7we8u3cUUAETipA@vger.kernel.org
X-Gm-Message-State: AOJu0YzrHy+VoxWCHDQgDafNOH8e//6DrOaNo5M8+aL34qiQA1/GFwIm
	k30eHhVMOYFNYxGeGv4uv+8K0+7XSSAzQRHQ6Xua/ASH1qKMHm4BbBT9Rd6El8G/DxSyJt43b40
	N8CXaTa2HamqO27qpTBhzj+De5rncKzEDtT6fFTsphNtySuql14juDLElI86nFL8T/nB3
X-Gm-Gg: AeBDietY1bd/hHk+KD2kbuWtbNXgglLsQaga8eMD0hh+XN30SsNjiKjz3cClSIaRFaQ
	CrTvlKLpRDfUwBpz7hxPP1MixmFzw+v061A1otBUfG+dKnLBo7/qkermJR0lGkh75wdhoTV17Go
	U96LxNzw632Tv9tgT0fidPHrPVXSUJhQDATIomD4Y6jgKNvIDmNDGcM/CrX3SxwDQ+WKZfdUre6
	ToEAZsZ9wAxoR0W7e1P4zy6CRavDspCCVkPcGOAJz0fswDlpyB+rPgCPrd4egPBCYfSB1n5urs8
	e0WuZ8Gl910CQLELVEJbBjAXIwlbN93z6hogn0l+hnUpPCMIHfGt3LHjugfeJTZqcYkFE8BuPsz
	9yDGO/81UN3rnlj4GUkRC115UclTdMVRIMBtTj8QcyVpUwxlk+QfqBcyHmwPAFpCzGd/E8lVjYK
	0=
X-Received: by 2002:a05:7300:3247:b0:2c4:ec89:bc7 with SMTP id 5a478bee46e88-2ed0a00248bmr597106eec.10.1777340167664;
        Mon, 27 Apr 2026 18:36:07 -0700 (PDT)
X-Received: by 2002:a05:7300:3247:b0:2c4:ec89:bc7 with SMTP id 5a478bee46e88-2ed0a00248bmr597080eec.10.1777340167102;
        Mon, 27 Apr 2026 18:36:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a106524sm1074873eec.23.2026.04.27.18.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 18:36:06 -0700 (PDT)
Date: Tue, 28 Apr 2026 09:36:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Nord ICE
Message-ID: <afAPACSt4JoLuYLn@QCOM-aGQu4IUr3Y>
References: <20260427010527.230473-1-shengchao.guo@oss.qualcomm.com>
 <f3e83bc2-36ef-4628-af1f-d9465eca72e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3e83bc2-36ef-4628-af1f-d9465eca72e3@oss.qualcomm.com>
X-Proofpoint-GUID: J98gOwXu0tjREkgaLPByNa_Q2zJHC1v9
X-Proofpoint-ORIG-GUID: J98gOwXu0tjREkgaLPByNa_Q2zJHC1v9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAxMyBTYWx0ZWRfX11dqWt+jMMmp
 Xp7mEGclWsZuPEuVddajQ7OPmIxTMxjxwUp9i38AP3TlBTgmS6+nc0cnozlTQo/fDR4Q3f4OnZ8
 ELRLHfmIBV+i1m4RDhxIHJY1wmYDRqofrnah2GSjASX8Q3wtm+4j2TjHrWcr+C/mdy6j/sKhrxH
 voaf4i5vo7friIcfkQ4vr23xoaxkwMIOo75Nm5DstjvPxjS4TQM8ifuLGfIR4bNSDmTqYsB+4ku
 GVjQ0w7Y20UH++jqU3qQRgvAwB6SF/cYJtA+5IyaxxPawH/klSqZV2eTRErSXz1p+eYYk6t3LWX
 1F8/WarY8AzBZm+o7FvO+HzNS2uij/mJ1WvRlRMSz5WVOa3N6++wJWmc1XCNwc92+CbJFe21doC
 HdaejB/tX6k+05L4hNn1IlFG3NTgmJgk+zKXJh/SQyc1+IhMx5Na+u3QpmWhRC/0oMubhy9BPof
 wTodCE5KOJcdulgM+Ew==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69f00f08 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KIcV2tIvfCGpu7CZsroA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280013
X-Rspamd-Queue-Id: 4FD7447C71C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104843-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, Apr 27, 2026 at 12:50:40PM +0530, Harshal Dev wrote:
> Hi Shawn,
> 
> On 4/27/2026 6:35 AM, Shawn Guo wrote:
> > Document Inline Crypto Engine (ICE) on Qualcomm Nord SoC which is
> > compatible with 'qcom,inline-crypto-engine'.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> > Changes in v2:
> >  - Improve commit log to make the compatibility explicit
> >  - Link to v1: https://lore.kernel.org/all/20260420073301.1250197-1-shengchao.guo@oss.qualcomm.com/
> > 
> >  .../devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml    | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > index 876bf90ed96e..9251db2b8fcd 100644
> > --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> > @@ -16,6 +16,7 @@ properties:
> >            - qcom,eliza-inline-crypto-engine
> >            - qcom,kaanapali-inline-crypto-engine
> >            - qcom,milos-inline-crypto-engine
> > +          - qcom,nord-inline-crypto-engine
> 
> Wanted to bring your attention to this patch we are hoping to send for 7.1 fixes window
> which mandates the iface clock and power-domain for ICE (from Eliza/Milos onwards) to avoid issues
> seen when these properties are missing:
> https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com/
> 
> While I won't ask you to adjust your patch immediately, if our patch is merged, would request you to
> update this binding to comply with the newly introduced ones such that the iface clock and power-domain
> are made mandatory for Nord as well.

Thanks for the heads-up, Harshal!  Sure, I will update after your series
hits linux-next.

Shawn

