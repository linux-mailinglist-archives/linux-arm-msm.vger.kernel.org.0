Return-Path: <linux-arm-msm+bounces-105087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNd7Ej8q8WnTeAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 23:44:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CAD48C624
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 23:44:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1DDA73065A55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 21:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4913C6606;
	Tue, 28 Apr 2026 21:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="odwSN430";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZD3uzTz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0CC3B52FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777412622; cv=none; b=mY0WVriIvxe96clXXwRMYev0OLbG8+e8LI8WPEIsV5cYIYHZ6Dd6+GEwqrXHZ1NI9LZKNPKzLb6+VzfsR1Q9eEgc5k4E3UJ8J8pkdyVv0uhu/hK4dCMzXJOl0Ep/Gemog5+IiHpWqHxGQuWAWJ0Dh94WNO4JukLHjrUrSk83jvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777412622; c=relaxed/simple;
	bh=7/CUJnEWOPR7pSRSxia2dGFhO3WsFu7RsSGosgpdpCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QPSiJFoysnMw598TdXtwT4VCGVwlFosfLpkuepadkfydsc5TPcN1kB0rmp2pap+lWd5ZvzAgRG/XiNWs5/weufk7vPplp7AMzQs6xE4kF+6IROojtVYu4Hj2G3viw1dBJ9r0e2mrOIzvrh+UCmLP+zgttHE9iXMR2RkggP/bU8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=odwSN430; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZD3uzTz9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsZcD4070700
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FtBo9Xi2atJTWa9QzCnHBCs6
	e/jBGzEmlSQy2fRKipM=; b=odwSN430JS8fFZTbbYHehPGUYf5P01CUVwa7ILlO
	50MvI2iKDRZJjYS8oSfnNTKeq3rpkmd0IMDoy9nonzhA1uDENHW1wuDwyGCMAYnp
	6EtLIJjJMFOeIGWfBljh2ojPhgHo7kn4ALZwtBKi7nfDj5UL79L9LtJlLoUH4pHC
	NSjjASERgwlEKI++hpnwyEtwJ4H9k99NI+Rd+3/utDRK4TjjcqqLw1NacRfhkuZ9
	U90ZEPQBxEZRmWJGbwN+T2n7fSFj7NRUA/aEpdx8mXrm1bUydlHWMYvW6Fqa/LjS
	id+bFnzPfs6UZ5Ai8CmuL8DAGoCGLjKQPvnfLDYzUICtCA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjjk9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 21:43:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f817c3240so127785111cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 14:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777412620; x=1778017420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FtBo9Xi2atJTWa9QzCnHBCs6e/jBGzEmlSQy2fRKipM=;
        b=ZD3uzTz9odZMQTGt7NpY4QkaqnvhsICZtQS7kxisgh6bFFLuUvPqU5zWuzIGYwlupa
         +VRgKID//vqmBHr+ERoOG/H0fUFIPpKx1DQOtEV0/2qUS7huM89X4Rm9FgBBpW7O/BsR
         Yq4X/C9150wVo9wHNAj2iVABKeCF7aoEuvkhsoGxzXzMMcVGE9+VRbxXYSF8aFui5xqd
         SXPDrHyx44hnf4iNxPmwLU0RleSAZQOjRy8C0x760mUm8qG/yRS93ZGJeNKYAflUq9zS
         GJm9JTUva2J4I5AUg4lHLoi4pQsrwst/zlGESxnpXhNJezLFalvwKbu/fePfR0WxnPHR
         Ra0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777412620; x=1778017420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtBo9Xi2atJTWa9QzCnHBCs6e/jBGzEmlSQy2fRKipM=;
        b=BB2LNz/gYpRBHKyUZa5lhGe8F3zx3ZNmU9kTLgGtJUclHVp/CbhOSM32CrAGY35yAD
         t/V4dXg8kN3IJmhaE4mEPNQbq0dOD+gNRQYl8CacpgqHE+/sL6se46Auc4ZTfNvlHah7
         eux0UYwkg8VU2enw6eZblKXbGHlqc4HZj4S/vdcBIpXpaAm/g9R868OET/0yDI6AAOaR
         eJ/vT8dsv4jkO70vDX2OFl2jht6ixAs9Hgj7MbENx8ZL/1NXryqOc8/lLDknpHrEovfw
         TmSxj1nBnnOnSD6hZlPIvmt5XjKFUGMrfFyq1bqC9iKtu5NOVGfYiFC8RzhohNleyBdm
         cs5w==
X-Forwarded-Encrypted: i=1; AFNElJ9KHYqBBrw9wmdA6h5TC403N9rB/sAP7fOq6yqsgRmb+IMMtvBl+3UlI8JUCtw7LMhc6qxt5icZYvDGO7Al@vger.kernel.org
X-Gm-Message-State: AOJu0YxDikfjTqhTJ+RZLCY0mbIgpLTwGhps2WI7CGvt2JY8I3W+9XIc
	Qbo6GBqn0n9OwKG5tPFpYkAuJzSe4q0o7KVJYbaVnAr4ndWG0eTzjk/6vKfjgN3rvoo3OEct65M
	KLmP8JSeKnwn6DG5CiMrfUH5MC5C2FfwbSTBPCatC25Vrgv8oc52+EJg7Ku9f/Ih4kTYN2SJFUJ
	ex
X-Gm-Gg: AeBDievGDGZXjLG5VMVxldZN7xwdQS4MZZ7qWqf0yizhbeMIy4p7hXFkLhdZM6/AvSD
	Cx/lHwwUBDSoxaXVEUuszdMaCy9BPABogozYwgGai+fuhU4G5//R2ztC5HIsOajk4d+fVObUC6W
	RTttIsiN9W87ZKAynSRDVBArDgrzvGxIhAB+OoORC+ljPhaUTuP49W70kzbwyBNbmU+yAaq97BP
	F5c3CQnx+wTNU+/uGv9gxiJqqOQguDbjL9Qk1aCnztIw9KZBSqsW0z1nIrn11lvTR5wE1lf71AI
	T4+B1hy6jyxU21OxgD5hMmqfTwk5HszoxcPoa8brXoEOOQgzh7NFjLTevJ8Hum+hYX1GdHFgxFF
	s5cbQFPP681LbLh+VFE07Egx56YrNsJOirMrMVyS8jezaLNK7RXyoVraahEZsaA/imIjZNvdVMF
	gMN3PE+HojNRVk2zbm7TW9YX66IM33t9Ial15ESX/ZorhDbQ==
X-Received: by 2002:a05:622a:58cf:b0:50d:9f02:86c7 with SMTP id d75a77b69052e-51018970b12mr22176191cf.13.1777412619665;
        Tue, 28 Apr 2026 14:43:39 -0700 (PDT)
X-Received: by 2002:a05:622a:58cf:b0:50d:9f02:86c7 with SMTP id d75a77b69052e-51018970b12mr22175761cf.13.1777412619204;
        Tue, 28 Apr 2026 14:43:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a6f4d71sm51235e87.26.2026.04.28.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 14:43:38 -0700 (PDT)
Date: Wed, 29 Apr 2026 00:43:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI
 cluster idle
Message-ID: <iy7wetiel2b4vvksfjxxrnflb4jzcs3vrubtiiim3fe3aqtj25@7nz3kak3gvda>
References: <20260428-c630-fix-idle-v1-1-29d0da326eb3@oss.qualcomm.com>
 <dl35jhcdlclpxssnhqbvu6ae4hf6oyqh4rmavul4helgxwrijl@jbqtgv3sva4f>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dl35jhcdlclpxssnhqbvu6ae4hf6oyqh4rmavul4helgxwrijl@jbqtgv3sva4f>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDIxMyBTYWx0ZWRfX6AzAr5RM+zby
 0hQRw+q4xE0ow46YW0ElkwR3mu+4L97PbsqEBj5Jl91wJ3hJRzTGaKIslHavPqseFWKCcu50Io+
 iN/PMsQnlnoi1V+b/zvGui8U0/gtM9TpJ4eAXnJG0t/DNNJvcOFYHtMCa2ZNa/kHjAE2NFLK3iR
 6Nf/FV5E040zYrfLJ1qhGAipNv4Rurp8aZGHiZfbEZfO9z3srOc+dZSGQaxV40iJXi700WsjycO
 AsEVdeL6sc6VtHsMEKtr+2b5gEkKA1h/7k5m5eIeQhu0B8SAnLml2fEBPDeDBDd3WZsihMd3RWo
 5k9/KvcOMnlwljAZIdtmZ7Qr46bPt7L/0KsdpiNBEYSpCebdIu6xb/R8z5at1uOJF1ddMfrYplK
 OUN+bUx1ug0SVciTyNwwBWMHTbbTM4QCo89+zu9auH67NEj4R7GPFMYmOvUkHbnohe7xIc9ypwn
 MohCWZ/oKoc4UfDM6qw==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f12a0c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=seaX-kzRb6LWWMeLc1kA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 6wyeDYKSHhZWgh1yh1JG7V5QNj9Er5cO
X-Proofpoint-ORIG-GUID: 6wyeDYKSHhZWgh1yh1JG7V5QNj9Er5cO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280213
X-Rspamd-Queue-Id: 90CAD48C624
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105087-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 11:38:30PM +0300, Abel Vesa wrote:
> On 26-04-28 22:36:49, Dmitry Baryshkov wrote:
> > With the default PSCI suspend value for cluster idle state Lenovo Yoga
> > C630 isn't stable enough. For example it might reset if display device
> > isn't probed early enough. Drop one of the bits from the PSCI suspend
> > value to make C630 work in stable way.
> 
> Now I'm curious how you got to this new value.

Good pointer. Let me send a more obvious change (which I probably should
have checked first).

> 
> > 
> > Fixes: a1ade6cac5a2 ("arm64: dts: qcom: sdm845: Switch PSCI cpu idle states from PC to OSI")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Anyway:
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
With best wishes
Dmitry

