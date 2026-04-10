Return-Path: <linux-arm-msm+bounces-102697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MOAwN4Ae2WnVmQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:00:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC773D9F6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3556E30761DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452AC3D9DD6;
	Fri, 10 Apr 2026 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRBK/Ymo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KV8LmXBV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0209A3D669B
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836496; cv=none; b=CuQgqUdf0f1srE8oeasa17SY6f1OOItdv+J0VbIyC64C4wDrgZhzFS015vcUgC6WJwjdqmJcuIi4R9f4bS/u0OYDjiJnFfzEI1Q92H9IsAJqqvqZjuvUwP61SLkXEabx6/7F7Ia0rYibPiKp4o8C8N9rtiBkEUDjKWmhIEBnBtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836496; c=relaxed/simple;
	bh=421QLG5F0cxhuiRS6RjHzyGtT2DLMH10xbU89iV7+kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ee44xU6SIk0kps8WFBkEdf68LEV8VlBjviPUseBZVLmnEiZv9Rbl66wCjp5wsDbh44aTA3GWyuP4gPyDEsnCoSqq5ZG/ZGOzLMupn+AGYQnLKZgal4xu//KFUpJaaFcmf327VSVN59oFwzIG9vty9dgfljoM+eTk48mI7NTvOrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRBK/Ymo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KV8LmXBV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA9i6L2047769
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AL6o08/Adt6zB9TULDXvrWh0
	g9UMbWvqtlIH88nJT5Q=; b=jRBK/Ymo6QKyvpRm/K2Wc3tDvnSxoHaxvfSh6WU3
	eobZVsvxF91/dg1fJ5b4PMjZYM6y4fv+6sSxWepljDhOmU+3klzoDuIZI/RLASUU
	PAa4r/bjicOQh/kuKqkgs4QykHt/A0aRuY1KnygkJizCc9TGItcgtbs9uko7Y+uL
	ff7ijegCCz3dLCnpTYCu9Sxot83MgnJ/QxuSGXkh05NWlbgZkMjad0I3T+ApfVm6
	mMirqfS6LDC3m6u+rRX8mVpQhAnHTZ5Gv4Z9alJ8kuRYi6/Hrr/dNJLno2FEYLKN
	Gt9YBHKdfyoBeLvMZSw2gYlgsr/6g12G6Y0EWkzvffjvGw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey77928v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 15:54:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bdd327d970so1266977eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775836493; x=1776441293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AL6o08/Adt6zB9TULDXvrWh0g9UMbWvqtlIH88nJT5Q=;
        b=KV8LmXBV23j4fb9dM/GDJwFjk81RGhr/pN3VG/oGicbD8N2VCV5bSoiLW87xporu5s
         +IRm+BxTz9gfKWM+agXp6wh5EBIwodi7jRtualU+71keMFCCM7M3Dp+665XUHFc14GbK
         ZyvO6h2prb+029XeNECvm3Zbj1ekM5yPtKweEDT2FichJ0vknu3H2KC4nPK8/rXI4/Nt
         bTPMIUgm/X4JrYBWfGfA+mrn7THv7LHgTobc2JKQSpR20sdE81z8PKdmc5IHdjCEEOIA
         m6atqqLor5PAL7+XcDBvK7Lw6E7XH0qXKwnD/6ulisgbBsoYey0TEiVB3+fjQ6l0xblG
         871Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775836493; x=1776441293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AL6o08/Adt6zB9TULDXvrWh0g9UMbWvqtlIH88nJT5Q=;
        b=s6Ao9qQK1NrmVhsOdcqb+PmikfQpNulhvzmkv1BacTSk9Dpj7b10eI34ksMsvD4rtq
         a3m9i7C5njreruD15A+jjYUSOFpQy9Qd/4J6kKXUsPGOLdFDDfxSD9CF5lZesm5/xBrb
         yCRVD6BkZ3P2905RoFIg2ksGi+XfWw0VZM/0vkFZmplzF8omw3XXxRXmuDmm2yvQJWRo
         u9XUUMDhPUBClqpV9bLbb/645+82Z9s++sZTM2VRAu/lMYVa3hBVoK6LjVMioIZ7Ebx2
         Oeb5y1ts9sA5ntgRZgWPjTXztaQiDWyZFHFDFAXWnDegT848QeowVOTOL1BKsYBkCcuQ
         SZCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzw+8tLNcod4DoeC7mQJE9DDuDeORMrg6/dCM2k/Yrf4dk3ouDpehSM6eR2iczRmLDU+tOxwKy0CjlEze3@vger.kernel.org
X-Gm-Message-State: AOJu0YxZbBYvH8qHJaaTUmCGIpkyWcxfzdujXW1CygNNsZSrZsfJ9zoj
	bL0DmsHG9IPfqSfCMdTaqu+ZGtZyXdMqyNh4TDj+DyWCwaLDnu+3Cnin90vE9FGAVd/1JbMuycL
	Sn2JQZvsSZumogqlMxJXjpm2Y+pe+iW60wKihwrwhZo130kMyNpe8Ro5QCURE5gimGHoaAA19x4
	cq
X-Gm-Gg: AeBDiesiajj/T6VDs9F/pkNF21u/N6F63NpxEPiVaHukkKOj7YK5/psOEQunqpHrq7f
	wd0AcwnY2g56vblaXLKzHi6/wwj+2piK0Q90FZWnCNnxH3bDMPWemTvafGloNnsscBC1Zlt/bnE
	kNJRt4vZsUChRhSalUqIPraDS/aN1XSvduyc8kFerJYxhcy/idlo7RRLomOygtV/01aoGhlB8u4
	Y6qmTKyS6GrwO1d7NiVFMrh1GWyg78r4IuFf596PJyL42HAwoamEpeSff80Y38yghwEZcy0BegU
	RNdfXGhSEu6o7GjQg+HEoxlVFOynH+ZIgD6UMR91hlMBJmRi9a8intuaKyQ0Jz0BQXRHK+lwmgM
	gMU66VlGAtl3euxkzsbYDT34ZqNdrj7osEDBB3I1FJJv9HcF9NHvjLZfyqGqQ8leznkyQk3sbm/
	M=
X-Received: by 2002:a05:7300:1904:b0:2c6:7896:e2b2 with SMTP id 5a478bee46e88-2d40fce76afmr3904882eec.13.1775836492699;
        Fri, 10 Apr 2026 08:54:52 -0700 (PDT)
X-Received: by 2002:a05:7300:1904:b0:2c6:7896:e2b2 with SMTP id 5a478bee46e88-2d40fce76afmr3904856eec.13.1775836492126;
        Fri, 10 Apr 2026 08:54:52 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562eb05fcsm4824636eec.28.2026.04.10.08.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:54:51 -0700 (PDT)
Date: Fri, 10 Apr 2026 08:54:50 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC
 bindings for Hawi
Message-ID: <adkdSnvSPe7yNt9I@hu-mdtipton-lv.qualcomm.com>
References: <20260409-clk-hawi-v2-0-c7a185389d9a@oss.qualcomm.com>
 <20260409-clk-hawi-v2-1-c7a185389d9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-clk-hawi-v2-1-c7a185389d9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: TE1p5oZsUUN4uiexp5CcvPZ_Igi1QD9S
X-Proofpoint-GUID: TE1p5oZsUUN4uiexp5CcvPZ_Igi1QD9S
X-Authority-Analysis: v=2.4 cv=VN/tWdPX c=1 sm=1 tr=0 ts=69d91d4e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=h0nsZIZg7VTWqUciHZQA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE0OSBTYWx0ZWRfXz5afpLPHgmnN
 db3JI4fyOZSKt1DTdkn29ku5TrcET80f/EArCR76dVOlqk7wzipW3UUJKGI6FjwY7LTbzYwyDhO
 Wp8u7nHvbQNTOHq38O/fgBBVC6pLwNkL0CNk/Lcm8CIFUSolkomxhgeOM7hB2KpoTY8CWQCGVH3
 oofTX6anxhcqRGW021UwVfTLkCgPlS336DPIhbDREXnGL9PHkxwBIifxNe4Xfc5IPfh93Az3G0b
 dm/foEnEJ2oVDiMRHBuJ6cT4kUZhW85VcqRSY8NvMDBbenpq/mRtqRjQrg6JohWKyt+G1R+NHSt
 +I6kk2QXKDh4U0ycp0+bwMNGE2xLiZqkGDGh4J+qD0OucrW70saqgrus4UePBNVDlQt9NsjSsc7
 qAoimha97Ft4mai0adAOdRLHjyjQiTHjMAcpFdyBFqW5BUgz3hVt/2Utdntjs1zgGWcn510yulZ
 iZecYOm9q1eNaQlgDvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100149
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102697-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mdtipton-lv.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5AC773D9F6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:51:35PM -0700, Vivek Aknurwar wrote:
> Update documentation for the RPMH clock controller on the
> Qualcomm Hawi SoC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  include/dt-bindings/clock/qcom,rpmh.h                    | 2 ++
>  2 files changed, 3 insertions(+)

Reviewed-by: Mike Tipton <mike.tipton@oss.qualcomm.com>

Thanks,
Mike

