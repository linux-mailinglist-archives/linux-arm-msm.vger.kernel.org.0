Return-Path: <linux-arm-msm+bounces-116439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9pALNSxRSGqvowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:17:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F4F70639C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:17:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Zpd1yJu/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bCypjqai;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116439-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116439-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDCFF30329B9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB21440855;
	Sat,  4 Jul 2026 00:17:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26F619F115
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:17:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124245; cv=none; b=V6jcPK8dWxQT+443MA99JvEs8p2VCFpIiQrrisfwz+ewSTpRkcjNKHZeTi75I4OuX0U2qEEhrdgM+nNIAnrLko6mr9DFI5MpkoaaPCmDdDLjyOpIm0Ts2OySQya7kBTk3z4Quw5PoVMUIRbXjLkEYjnmES2ebrVM4KBaESqOV6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124245; c=relaxed/simple;
	bh=9C5RJUSt8UVdMbRPJGWBOVXu5hZdn4wcQY2xt5fYMVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/y1Mf9Il5PKJQga/M8C1QO9LNYAd9b2Zi4BwSlEjBNGg2rFwsR14hpDC6PlupFJWmSIXfvXCBJ2UDZcKwJeqr5X/ChQk74L+T0Vl1bXzFmtgTPWd0YORlddqapP9tiaYjLWO/wze/HCidn0Jhj/hLmyFP1L+Lk65lm6XrQxerA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zpd1yJu/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bCypjqai; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPqRL1029609
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H1z754F1g7bGdP8+fIZCnGTO
	6+ITPOdx9vaa+Dfdatw=; b=Zpd1yJu/ZFq5Y53hjKfLmS55cLjQV6esll05S78T
	wZJ9VBczYGJoN6uCovB5MIl2bLlgBId+pU4azWepZ+5fX28azaBY/RCsfbFpTVuR
	sATEqhh9HR/cMMCWwiebJnPsPBwa6NknX6ks5sDPAlJLnitLQxaSZo/YngVIM0NH
	TrAIzwcGQhJ3lmugzWKUFNx9UZ7VXwJF6U+SUTk1m0uYoRJ/aQyEO6iN1kDujoRI
	DfJQ2OT8Zj84KT5maSVo3Zq5YE3oqPqmYNPbYbT/XB7PtGX8JSkgE4O/TvntkvQ+
	8BN3fjpb6mSzs9JnPRS89LT+tPOJ77YYSGAkYJLQrxhm5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qcm20j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:17:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d30035dso8928661cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124240; x=1783729040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1z754F1g7bGdP8+fIZCnGTO6+ITPOdx9vaa+Dfdatw=;
        b=bCypjqai3LEVeFW6OmxHaOXBtg0OyTpHiq+gdUkH2Vf1kQjDdqJpyV7nXHxJiRaVZX
         5xGtxElvXGfsx1Rc0sJL0wZgJuZ//m80am2FoCfCa81TzlguTXyOF9nQTwz/VBq6ivyP
         SIuZQ93dBy2Fy9DZr9LxSUIYJeqHC8TJXKZd8/kYGDc/DCTpcUodcgQV2bpVfB6nO5en
         9th7gHRM5ANyr6xNyXe3P74QLuNdFDnkcHz/OpGiwel6FpcHi3wyVjV5pIg+QJVe5JSN
         dlSDNX0Gzz1ATMVL9ThgNT4ZJVtVSXZa9IYibcHTXZZEbKWQewtjT7hbde/6vV47Raks
         u+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124240; x=1783729040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1z754F1g7bGdP8+fIZCnGTO6+ITPOdx9vaa+Dfdatw=;
        b=aFfsfWJg3ldI1Xy+kJW5Zrqn9vuB5ImrHMykC3S1krL/4/OwA0txu58/iL5/c7d6Os
         oq6HZKncZHKi4dpKExRDL3G/+NTQqT+Y313x2GkvkTIzSFYN42gM+PSklshYeVlRobIh
         Hx+lTtml/RhTZUCEwxXgHD10gIeD5UeA7ZQtVDKebXXEC0FaQNO5uRee5rGmwlIZ+u3X
         93W+YrJzL5bE3lKmX0Iz4Cm6iGswbwww8SX/C9VOxftqJqySQuj93DwFJGhTE1jPlJnw
         HYWgfzZDSNbLYSyc+EXd/x3OP3TmWNPZHRVgr505P39mNGBKxvZgWOML7mlk1mBkQocG
         CUrw==
X-Forwarded-Encrypted: i=1; AFNElJ/axj1egxeuj+G3pGv53zILG2TXZzfqIziz+hxRf7m/ho+HCAZPifocMuwgQEkjLMDL0stOOm4z6MPJVjCL@vger.kernel.org
X-Gm-Message-State: AOJu0YxY7Bxe8MwNuSravzRfVMNK2Gpwlg4QVb+iG6EPHKpYAQTIJoxv
	bdz1YDRAg3x5VJNCG56mDWxRTcYwgsxmslNJtMdcsBDIabpwVFDg+c8AvTXzFdZQnhnzwimosny
	Usxg6jtMagDd9d6JbigxGenXtDy+C1iAPw9ZuDTbKWNf60aegBMPNszZGAuGrlSeENWfE
X-Gm-Gg: AfdE7cmcxJuVvxXME+bE8xjK4C4IIUm8pBz5Lp/ByfYVy1vPKmLEq8c2kji59W3wB9x
	4D1NP1Ce4KwUv0p4KJiAClpKUpd4LRs3W8xrz+0Eenc9/e/0ScKDCPxU2hCVR1J9/k31KHhYwJW
	0GJxCyQTUSI/X7psIw07tTpbU/RwMHXxfEUJyoiIOx/nb7mEaupEjDca095jHxYNoHS12OJ3s5I
	Po4UMu3I13ClrhxR5SLHMkl/knWI9mKvoinNh1/Jmektx0IlShpSMUyiACRFZTdZBdl0k2IhQtF
	5ow1OSkdbN8QbLljsbgoUU7VrGSKGM+qbk8KGdt9WmArO7fPH799eelJQgWvw5/x0Z5Utp4DLWX
	bRw/pGuE5thMlgdSfZdPX+DytOSYSptlS1c1Sj/yP116mnj5hKeNEOxL+qLeAceQCDFIqGLvf4g
	Ib70AWv4vn3PIp+JFhsG5rVIUA
X-Received: by 2002:a05:622a:4c05:b0:51c:df0:1b34 with SMTP id d75a77b69052e-51c4c2c3da8mr25420791cf.33.1783124239798;
        Fri, 03 Jul 2026 17:17:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4c05:b0:51c:df0:1b34 with SMTP id d75a77b69052e-51c4c2c3da8mr25420201cf.33.1783124239238;
        Fri, 03 Jul 2026 17:17:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed1377052sm866292e87.21.2026.07.03.17.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:17:18 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:17:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/19] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
Message-ID: <2vcr3x46sx5d4aogdcw3k7bqwe7bf7i24d436eb6o6gdi3zwwj@3duglhhchfx2>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-7-cc13826d4d5a@oss.qualcomm.com>
X-Proofpoint-GUID: eRInuKoXzgUI2vNLqEIJXG6lLb4ylb29
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a485110 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=bvhocwI2OAlG0vE5sJUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: eRInuKoXzgUI2vNLqEIJXG6lLb4ylb29
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMCBTYWx0ZWRfX0YP8SsMHG+Nu
 Vt06e6RabP1TXdbVvEtB9f468r7YL80KwmFHH0VLHEaXOQA+7Vow3SthMDhUyxvAFl9bL1e8Nu5
 z82BmL65tkMlqMT32OXj2yo01PCTuHMUZ885mQHd/+OoKKKSFT0pokD+u6pzD3xJ0fKs6y0Tg/t
 zSZL1/Ili+UbJmXaq+DP3lJ9Y+OdDoLV17Pbh3XMUAmxXNoOcAZuPvQ6JDyKBTXGGmEwIwxEue+
 1CjY9rN9/f05Uel2Ricc8XZNds6SzC8Koy7asKZC4Irjv+inhu8iRq2Wm85kLB38AJ2EVPexpMb
 d2b+XIBV/Uph4X6K8TpdWUHETVNOHwhdsU0ik00wF+6Il/vCGPriDqDChis9XlGFXdwk1ZzOVo7
 NdwCHPZBM1bz7/jjm127uJ5bea91Y9gin+OifLHzYCqs5abPzDuwKOW45js3rS1i/N7FFUhRTer
 yu50ENKXmP/p2dFuWgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMCBTYWx0ZWRfXwbo1eAadgI23
 UQEmxVioMIddn7ceZliU25TDg+/tObmowM9eK8TpfRJAxQSOiPACwjtWllLjnxcW2BVy+v+Ez6K
 qv9WzbkyRX1KrIh2xj8BkHDDTz6UjI8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040000
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116439-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32F4F70639C

On Fri, Jul 03, 2026 at 12:01:29AM +0530, Imran Shaik wrote:
> Update the QCM2290 DISPCC driver to use the DT index based parent clock
> lookup to align with the latest convention.

Why? Missing the reason for a change.

> While updating the parent data,
> fix the MDSS MDP clock source parent to use gcc_disp_gpll0_div_clk_src
> instead of gcc_disp_gpll0_clk_src. This parent is currently unused by the
> frequency tables, but should be corrected to match the hardware clock plan.

This sounds like a fix. Please never mix the refactoring and meaningful
changes in the same patch. Also, I believe, Konrad suggested that the
change in invalid.

> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 36 ++++++++++++++++++++++++------------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 

-- 
With best wishes
Dmitry

