Return-Path: <linux-arm-msm+bounces-103615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN4kLbEd5Gl/RQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:11:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 966C4422AE1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66482300809C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 00:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7003517DE36;
	Sun, 19 Apr 2026 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2UMH0EA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xy9xJUkV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E567175A75
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776557483; cv=none; b=CVt71N95KNcKTRC2317vy5Q6ONZr7ikapeOYeQoSXRL6Ak8Ya49Xhto/qpvPJoF56O3xAQ9sObi/4vvRBoOiI2tjo0XizJH/YPX8Qimu6SmrY0YhGunDQBGI0H9LAXWerptKoSynz4Ose1Cr0sQ+XsmwT58iiqxuFyYLDXmvkZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776557483; c=relaxed/simple;
	bh=sgiIPT/yV5T+hAxx5JEB9ugXvAkAQLSN8uxYixhOCfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0egbQeDejbXebHKCcuWyJOv2XwRtVSbsc1JTvnxFt18aUHnnGXecVYmGPGgeuXz/E6UnxxUykB4pfyP+/UKlr0nUnLkK2oHsGRc2nQBrC7F0O2AXjKeal4a7EI76OzvNrbNMXDhj+at0vnJ+UhiX5W1l5OoVkle5IpZNFnWJjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2UMH0EA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xy9xJUkV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63INORn32780512
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ql2mVfEiRRYaW0U+oJQcl+vj
	348EApjA2RXMnxakUGk=; b=Y2UMH0EAWrq4WXzUnk5igtUMdh3KvGFo3rR7RyxC
	deIqximQ3A26mcU8YceMMXty2R+Cym3M1uv7Jkicl/LQd6wVEM+63V6uM/UjYL5l
	MNd+ik2iybrpo46ueiOpfkRFjafMso9pJrczqN4xhmcHq13vnj4XJGPMH0aSgNDS
	RhdAksORopgZO/JQLvApqGLXAHfWudrAA6nhL4ENUj0EatX3EBOjH8LGI9dU2SLU
	NPszDuAYkVFpoc7v9yl3Hnj2cMp4xNmE+2ETomWkkrrXNEhlBJXmcWmquFdkK+lN
	HKf+uRBFizbGrPGMTvaZD0kC6OvXu+iu1127pDZBJygaoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b71mk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:11:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e2592ea3bso22924101cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 17:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776557479; x=1777162279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ql2mVfEiRRYaW0U+oJQcl+vj348EApjA2RXMnxakUGk=;
        b=Xy9xJUkV/YgT5ba5AW7cDMcpr6P/DBM5XQgpkRf0bPesd7SV8UdS/8RTtdSXhFCGGm
         cqXSC4/fXBGyMw4uBZsmObeSEMXZs1PGTKoh1GhM4eXZt1NSjQV61TvMjZMdAaW9Ajei
         PVFyylwsCVthFZRJY4z0jDJ6adXiPwk2bKa54H50pRtO0EUObu0RlJRx825b8nXqloPz
         Fb1HqrGhudB3+gIeBVEZVLWQ+nc+xihEvQRDKVBa0MwMaWhErwWzIEy4hYJP6SZEXaHg
         iKpn/vGta8KShxDluVH9MGKQ6gisQAmUer08wCdAu+aOcY4lRBI3egUkU1SMKpoBeDsR
         un9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776557479; x=1777162279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ql2mVfEiRRYaW0U+oJQcl+vj348EApjA2RXMnxakUGk=;
        b=KmSTxmMR1RQeczqnzjRj2MJzQ3R0odLLpWIciM5QVhUkSCba/RcfKC56P0EPxWDGfC
         5xARImmQ2Kmf4BRFI5gHObSPFSjezU2ZyxkvJDlz3G/M8DRvHrcvuXeMSrEPFPcv0OwF
         FxIqNbMwMuTnNhLZjdIWTAlPzjQpMzUZ3T7JuahofEMvZv4AJr379MvOdiQO5lL70JKA
         wLL99t4gbsLmhTpWBrSdJ0uKP93/H9Gp0IRJu5lLaKawh9w+SbED8HAprx7wk6l3ome+
         US9MnJAC6MYlYXW4wjXKdvgzOOe4L9N83TR9Nulj0o7qyx9HMtIVXvozNNHznEXdoxvC
         rzyg==
X-Forwarded-Encrypted: i=1; AFNElJ98qzeZ+Q/OTItgDZHICbZur99fz0W8G0/1wTG4LALLyYPhhur04khLez91gC+EVofdPC7tQCkXKyoZ04F8@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZZfPUly2DVnu2jI7GniWoHwLTxqyKE8b83HZua8MhPMF1Vrp
	Xfszq9RgmrBs6/F36qmKBku04V18qIO9UAeSb3J07XRy+uJEUQKFKuWrIrFWGVDG2UX8YkD5Xv8
	1k56KUA1dmWtVDodJQ3zCJB5Fm6J0DLlT51KSwTQKy2aXsIiN43lr+usoTPH5qQ1jryxlEExpQu
	Fn
X-Gm-Gg: AeBDiev+jMyk/ST6n8rS2LxSGlwSIR56B4uWOvATdLktidk1gXJQwZNmigj6YjYcuaB
	QE4BuBRyQhUCSjmie6eG5aEzp2G8JCAleVq7AzjutOQI5+Q22Pzx6bddqs9fgSW6pU4qyO+/qCc
	tBSH1HSznzUOeHDCJlEucU7w5ARxlVWiDK07btzHMGS6E2L+9SOuJQ+AXB+Bt4+l2bBsZYM3pUK
	FnUz91szdMSlKtexiferfLxgmMANAPEGQK/qXsAQbxFS8xXlIenedZH7mbR2THVY7IxPqRew2P9
	UY+X+P3DqUZCSJwciMtixsyzqdyM8eJT2okzDVHBdmzIUO03bAnS9VMRMjUXJk/ipO3oJtRyKEF
	VjwF1qnFBiXOwCL27CKj4YgWNQonFkxZbnQfyHmzwWRN/6zU2DtqapfJo7/JvYe7Tj7pRu43+iU
	zLahk/wczHCmaXpTMzlV/7g8Y+KJH6UOX/8uZAzEBMCf/fSA==
X-Received: by 2002:a05:622a:1e13:b0:50d:97e8:939b with SMTP id d75a77b69052e-50e36bd4f1bmr122210771cf.36.1776557479358;
        Sat, 18 Apr 2026 17:11:19 -0700 (PDT)
X-Received: by 2002:a05:622a:1e13:b0:50d:97e8:939b with SMTP id d75a77b69052e-50e36bd4f1bmr122210571cf.36.1776557478938;
        Sat, 18 Apr 2026 17:11:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e1248sm1747814e87.38.2026.04.18.17.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 17:11:16 -0700 (PDT)
Date: Sun, 19 Apr 2026 03:11:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: eliza: Add IMEM node
Message-ID: <rrqhfxyelaiasxzwa44rgefmsmrp2u6uret3gjmpdx4okx4oh5@varb2zud5iot>
References: <20260415-eliza-imem-v1-0-4a90e8683799@pm.me>
 <20260415-eliza-imem-v1-2-4a90e8683799@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-eliza-imem-v1-2-4a90e8683799@pm.me>
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e41da8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=LQb-txNCcIPzF-pISk0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDAwMCBTYWx0ZWRfX5htntsR+dYt/
 aUUOKwTYtP9XIt0iC9fIwQ8zb6FtVsLwN3pgb4CqGz43OBgzRbmrTrU6NHEsVsg2TQuj4gYm69L
 Iu9uB8MwDN56MBA1pni2/35qMpFwoeE5o+rVPhw7MmSZVNXT2y4uWjiXL4ENUH3yFyHVmv8gF6X
 SLCUb71VlYFTOQUdpij92G1HykVgFqUFptqACmDdIes9SACEbUXji4vfsTcR1eh7wgFMpO0OHPX
 fsACU8MP6BwEVux1EdGzGWFDyxSRIJ0ImjBGjigTfzw8ZykYtVocTrqYyjmxHQ2rLiYqRq9EVGq
 9eLohfDYbEEHfnbFMo5cbE6KAhbdHBg4mhoLsgaKvKcTX6YpafprY6+RHaIgsuoGRO9+A/BfaDn
 HgYinOoSvmFviCTsAqwj9HBrHdUuF6AO3KKFLXSS2Le5TaiURBbK4kfHnx4jUUID55MxhjFwmEK
 VZKwcdu1yHqvVFOTSOA==
X-Proofpoint-GUID: GKwwkx3Ocb4R0uh7GJlpBjHYh5bn1Ikl
X-Proofpoint-ORIG-GUID: GKwwkx3Ocb4R0uh7GJlpBjHYh5bn1Ikl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190000
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103615-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pm.me:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 966C4422AE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 12:23:41AM +0000, Alexander Koskovich wrote:
> Add a node for the IMEM found on Eliza, which contains pil-reloc-info
> and the modem tables for IPA, among others.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

