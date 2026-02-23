Return-Path: <linux-arm-msm+bounces-93660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFGoGPAwnGkKAgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:50:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0422B17523C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 11:50:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B6C33019826
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD07356A3E;
	Mon, 23 Feb 2026 10:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lo4j5Sbh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7oV+ihM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F324E34D39B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843822; cv=none; b=Ohoi1yt2NrMTk52pZykB7sIfT47zdnNHCOEhVknNpX1CgUSNOmr6iGxC2tRlcdtCezWjmNjB2464KUXRT418TGso/Q/wZngamPFpnLJmFzRlvvCHhuDiLoldxvx1ktgodYnX5tUCQRsaz7ijEHiFzgkgExAN53f1P1DLVELFn6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843822; c=relaxed/simple;
	bh=dSP+9h330NFEIksoIga0TIptWItXAQHyk0hhGWOUznQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ2UsHTyznkTqNH0CDeK24bSL+UGgP7I8wLz1r3A3awomECvQYu8isV7L02qVXjAIcKKCKGQPqR6nF+FYAHvaHTPvJMktNY9LXep3d1PnS6lwOtLMjka8C37Tv03jfdTbqTiCPE+K9H8UcQ6J++sZX5R3eq47hKEZ6/CTrAULpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lo4j5Sbh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7oV+ihM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYBS7561293
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G6mqx+1LMT2Uz1tlKLAVBpKh
	BRzPdww9mSp6+0/ywwY=; b=lo4j5SbhuGugClzTcLyIvVLCd5A57MuSyQxDMyG8
	pbvyqY0IWTypYu1WZH/ILmgQZwlhK15pme+LBGqgijmlRWvIYIvwArSizuQbR/L8
	8kXSEuVAEjB+WqsD965HRiMoKydt6Qn6be76ztXJr1z3XgabQlYswe4JfnfBk2ak
	7pLJo/AhTCoSp81fqT6W+Z70D9/Nh01pFdivsPKQMsA8yZO4Xlx4Dq6J9b4YWych
	jGhxYGfKJlLeU/35aj6CwwbdsQGAnj76u0F6gWFNz3agSB9s3JQ25KQQtFa9JITx
	XIp9WePDc7u1hCTzDZBA4iOZw4kbRP+hfCS9DUcQwUniYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r81km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:50:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so600367585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 02:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771843819; x=1772448619; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6mqx+1LMT2Uz1tlKLAVBpKhBRzPdww9mSp6+0/ywwY=;
        b=f7oV+ihMPEFpW2HjArenZOQYlwQdF++KidGwTN3p3leCBOGOQIKsuyNj6EjNh2jZz+
         y3MQ0dk1ft8ZZw04P0mRHUB8JAl3Yc34DOkdTAWmIHOoolQ7Q2609ECEIMrwJo5fvjNL
         76P7FVnbTR8M5vkC2VOyDpJRmoT4ousElj1FBasDxLXjT+9LCfCNiaj0dPVyZ74Rl2+G
         IZ4gg0CkQKF/SXt1XWo6ELysJqwl1ZiAp7A/VDbW/G4b6gaHBZEkFoKvzdv/Fzzgp8vz
         j+uW7dPhClS+cn+kEA2PQyh/LaThBc05Bor4C6+ff9sSdEIwSv5tY1IXMfrY1JJrHW2h
         I/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771843819; x=1772448619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6mqx+1LMT2Uz1tlKLAVBpKhBRzPdww9mSp6+0/ywwY=;
        b=JP9+gViygBXzqLGyyvVvuuJen0CGasvUcPVilVP3hXTbET52ZUw43JmEjqV5b3+yqQ
         mrZKaepVOLt6Tbw7gD9/H/6iUgdWkvPIScAxQb3Hwx146O2T+UY128D3yVRYaj3fI+54
         QK+PeShd3ds9cvqZ1OaBCZ5wnMCLE3Cy7txXX1NUm9etnWjdhE32bKDiD+02dLRaoYIa
         Ul48bnmKka6nwjU6a9iIzZ1BSvJCiFbo8UlogpZiu0rRzeOh/C+TbCoAv6BDKHP8dKxb
         ZLcf8xWsG0aaqNrzYIyEUow5aoa8z/tVjdxohewcVlf1uV1a3Ez5N8Q5zO02kWkdkCTe
         K1MA==
X-Forwarded-Encrypted: i=1; AJvYcCXRqW+L44VeNmodGr2q77IQXJhPL6skLigKV9SGq3ge3mTvaOYPZea70p1YQgYZJDw007SEPCqTqM6qBZIu@vger.kernel.org
X-Gm-Message-State: AOJu0YzvCs7By4DJSBezHkhhLNAcAKS6W/rXaFkMnMevQuHsi8v6j3/q
	e58I+tNEMkqkJmXEYH7R32ioNm/koxK2IHXi1UUmiVeLjqxkcEJXhEpWEAwqevTT9FdRKvtSS98
	ytosiHq5spGmp6aaG+A6cHhwKG1+5WbPtVWEFs2CAHegWZHPAbOLPgT+yn4BjUMMwberj
X-Gm-Gg: AZuq6aJgAsBWea1pdq3DErMEgl0OvHVFMoi9W4j3G/8QuJolYtf0kFbeEpkm/d6VjCu
	3godmcaeBfMWjcpl012lpztZ87Dl2vWBWbTElG4Wl/cvkAUtEzeqKOkIb0necPOmLbZ0NVOCUHU
	sEJrATUbNYao+1baoC4bB8J4W1wNOjvW41qIZz325lTQwPTEXOmZ5qIKvmEEWw3MxBvWS7WwjNe
	C1hK4W2ue1N74CrB1USm7qhs/wM2WsCGAU6FHhE6PbA7ULc+UyxatoZr0vg/xJ3AGPdRZD1izjS
	fLy1jt9Ujjr0bbKrjs4fzG4jypUp7VLh6STzkPHad2KC0dq8jkIzDUhW2W5Ku5BIxKIAz7HF2Ef
	xuNC/c5fSGvWtP0b/efBIF6J8eS+fzRnfBuK9
X-Received: by 2002:a05:620a:3706:b0:8be:dd2c:a0fd with SMTP id af79cd13be357-8cb8ca66084mr968355385a.44.1771843819211;
        Mon, 23 Feb 2026 02:50:19 -0800 (PST)
X-Received: by 2002:a05:620a:3706:b0:8be:dd2c:a0fd with SMTP id af79cd13be357-8cb8ca66084mr968353085a.44.1771843818677;
        Mon, 23 Feb 2026 02:50:18 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00c18sm18076613f8f.14.2026.02.23.02.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:50:18 -0800 (PST)
Date: Mon, 23 Feb 2026 12:50:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] clk: qcom: Add support for Global clock
 controller on Eliza
Message-ID: <x5tb3e5dymi4akickj3ie4n5wnhwaruu3bby2f6wwjg6a5lav6@r7d3mpdjw5je>
References: <20260216-eliza-clocks-v3-0-8afc5a7e3a98@oss.qualcomm.com>
 <20260216-eliza-clocks-v3-5-8afc5a7e3a98@oss.qualcomm.com>
 <0f3fec98-4d58-4197-82e4-41480066d42b@oss.qualcomm.com>
 <cqx6t5tcshcqyof4aaeawa7gyocaokzyqjmyxgxis7xsfc4wwg@jeggol3ifwu7>
 <f3394308-ee08-45db-a0fb-569d1cdd7fca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3394308-ee08-45db-a0fb-569d1cdd7fca@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1bYwwxbCAMaemgkOHgAFr5aOAt0WHvxr
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699c30ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Wdn_pmPIT5SXTtawzMcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5MyBTYWx0ZWRfXxtlrkf6XSzaj
 JZNq3atW8hcY1JDCR2t+X+xv0pDPpvGXXDm0DpiZzhnms7YOjI9gEk1cIQlToP69eI0bYJ7Gddz
 3t75G5l0g1ne/HLIQJBpELSSeGvDlWQmu16E+Ur0do1FAdlBpb8psssGbv0xEMXtXr16MXwDw8Q
 kf0xMob8KpCG8bTzwUn5WwvWtiz189w4WfJ3jJ7B2WwTmGSsEzsiWo9CIqUpXrD5pr5NX8AgSmC
 hF/I1Lv1RVlLdX8TpwB3PxneIbsGTCoR12GW1B8VRjlQf5A7dDPUw3Om3++a1O4LAp5D7AjdvnN
 9maDN7xfP+0WEbh0V6J2IoODb/jiqr4RP6LhvVtmHzfkWO+qHiW2yUiCcGF/MEm1r1ma55JNZtz
 25nQRYsehonYZGmH3UkibfUjcbA54opmesd7qnizA/QqufnulUETj4cfmgWeOCyFrYlTobaMlAA
 058lLYSNbjgieOaEFZg==
X-Proofpoint-GUID: 1bYwwxbCAMaemgkOHgAFr5aOAt0WHvxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93660-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0422B17523C
X-Rspamd-Action: no action

On 26-02-17 10:26:26, Konrad Dybcio wrote:
> On 2/17/26 8:57 AM, Abel Vesa wrote:
> > On 26-02-16 16:57:24, Konrad Dybcio wrote:
> >> On 2/16/26 2:43 PM, Abel Vesa wrote:
> >>> From: Taniya Das <taniya.das@oss.qualcomm.com>
> >>>
> >>> Add support for Global clock controller for Eliza Qualcomm SoC.
> >>>
> >>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>> ---
> >>
> >> Do we need force_mem_on on UFS clocks?
> > 
> > Not sure yet as UFS isn't up.
> 
> FWIW downstream does that for this platform and it seems to be the
> case on most recent platforms too

Yep, UFS is up now and will be part of the base DT.

It seems we only need to force_mem_on GCC_UFS_PHY_ICE_CORE_CLK. 

Will add in v5.

