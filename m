Return-Path: <linux-arm-msm+bounces-117064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zh0iGHlNTGpiiwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 02:51:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B707E716835
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 02:51:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eJTRIo88;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RCv0yccC;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117064-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117064-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B903303A253
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 00:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D792F746D;
	Tue,  7 Jul 2026 00:50:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF082E738F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 00:50:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783385442; cv=none; b=Xam6JEdYlBQIN3n+fXJSQZ+6DDVcja3Q5RClprjEDM5mNyDFby9WWcxSI4+7FcaeotJ5SEQEBtoiOKxWuQVy3K3/FPT9LW3l/a4syFGQxA9ZPHK/mHK6g7K+h/lXMgUKAc/EuQKr9itvJmwx82m5uzIGImt57dSoChCflXgc634=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783385442; c=relaxed/simple;
	bh=WHXqkGv1+op9/RSasjwk83MuEuNNutgpJOBEdXbkio8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuOaM/uVVgF9+iD3HwyJB1OqSsIVkdUO5IZqNOazp52uCeQQjFCe7V8vsf6WuFtGlLp1I3q1RHNoZ4BhvPJdS9xrZvUlWBc1I40VQXiZ5hRNRVnfik2yFwmLTJ7kdm/w24+k+O8djTNPWG01gdASiyROY6Fx8j3HtC49ouW+DuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJTRIo88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCv0yccC; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDv7G1566475
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 00:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kbaBHhic6gIIK0cxoTZmQQiR
	L9kgLJaSC+bKDRff9ZM=; b=eJTRIo88ZURLWQ5Lyl9WzJI/vCIsL6m0r6me8kbU
	E6GGdQxMA9C2sXJtRQxlLfHdSaxhVMho6axkjBVn/D/ok6EG1VXKL2iuAtAk5hdT
	8rVUBU7dMOL7PMyJCqzDhdveUpN3UDz1Jx6fVCpQo4AK77kQy1vhNGPuUkhS6oxR
	c1ijkLM58/VN0muS1ZQhuxyqEXvwudTJ6PJB0y+xIRGzR9YzCVwyNlQcntYYXr0X
	An0I1a372TVuEtU/Gw87JbHDk/YN6Xx4iW+amI+o3Lzox1waLgHqJYMvF2P0ZTyQ
	wOQ+jJQdcf0xOVOA1PJBnEbT6MepevICsboXtqDd0oLIdw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7m42g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:50:40 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9692bdab0c2so162161241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 17:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783385439; x=1783990239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kbaBHhic6gIIK0cxoTZmQQiRL9kgLJaSC+bKDRff9ZM=;
        b=RCv0yccChR2Ymy8WCqksChat3HWkRQFVXO/unKBCJhvHLz5+tyL9k8mI2/c8Ehyjc/
         LuWcKAqHIT5+tnQ4USdHCiBbnMryHChVatvcvC0ASgSgL+g8bxs7WUt9MIaeDVViIYs4
         Pse4ReN02sqHqeFYS5IzseOAsf+Gm1RcZrSMFdewykBVIx1EQpeAOnsKEVMSIz9RnC5v
         V1dsnwPp2qu0GzlaNopVbmQ7JaRk28VspR6ltIUUCkBQRjY7kzCMoW7wqCbuaN8Esp6N
         SOmySE8DJkp7sA0MNcRlIjdoPjo6H0FlwVxkLXm5+FLJe1XmJgcWUTcyyTAmh6Ipd8Vc
         9dOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783385439; x=1783990239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbaBHhic6gIIK0cxoTZmQQiRL9kgLJaSC+bKDRff9ZM=;
        b=fEMOrvGEA3uQXRatYCV/uwXQEfvO8EHq6jcVojvrwJl4dUJpN93u4LeCikLsOMJbDM
         QrHXfKkaIuKKaJI4f0sjGApDbR9FItjTfDmauj68jNVkDHpUHX7msSYAJ0UY9s3rMQbf
         dgMOgQGTtDlsmHBaBiK1/6Mla3t3acooCxbJdGxqNxwuZeH9aU66prjvuArF2RsKBOqD
         WIo4yAgXfCnjvAskqTxTwWfCt51gqD7n6qjWGBcWEaUmFDAksbtx5K4hFFh33Yo6tFI4
         shgUgqcY457HoV3fwXftMtx1HF9tcyoLzAxjziEb6YH+6Gv30P7n1pnENOdBGyXgovMB
         0qxw==
X-Forwarded-Encrypted: i=1; AHgh+RovNcpr+cR63GWXi+cIXYAcvnewy2RApDp7F09E6k9LIJoLfhltW9naT6yNPvLIXbmrnGDqkHPHecor7xfa@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6VEzu8A3mpvaOW6XQghTqEBA9e0FuJ8mrZA88IWaCeG5EJuKC
	cyykBwouRAMMiBxw5NLP9FZz0rsAlHEKtO2TVFGRZecsXQKw7NQ9Ub//GnTIo/m9MmYFdIAZ8pv
	E6uR0veRijSrlwMC3OUpmPsHQb70g3chhZrQ87FSEQdnVK2dcGxfiWjipWUzUMBv71bAM
X-Gm-Gg: AfdE7cnEaSOK6aa1SDteT89suxHdJPDzvM6hlIHvpvZ1MDsNmA1wR92vGaYEYCUChYC
	enZQt5E0Xt/0YrvDubScT7m3b+KXTbcb78zkAm4D/1YLN3AsM0MFJJBpYeouptOmYZnlMI/p76h
	maQBp+JzC5QKF2JgpIwqDQj7NsXRY+bBGVQD2dPE6u32Hzro+VCgo5mtv24tuqvek7lQiY4o5MB
	eaDlF2N0SX50/HeJzqXcYAgoHNV3t97o17ZhuD34SaYeGW70qUWGwAqii4/XiJ6WijkHRv+eXw4
	Em0pAJ4M6bWcFzXdPG52bXWLv6+Crf/dAIjxleC7E0jxZIpuLASAKn3qehsgMXVfuy3QangSiuC
	evCHQAMq/L6Y9ZIvI/3V/5UpqGfi/HYOuYydlEmvuRImP2Nd+cqpZ4+SuZQEy7Ubs1GdPt05gbY
	4Mxye7JtQ0uzQLHPheNZfjKPyL
X-Received: by 2002:a05:6102:3244:20b0:738:9c72:58ce with SMTP id ada2fe7eead31-744c238cfb9mr307050137.12.1783385439569;
        Mon, 06 Jul 2026 17:50:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3244:20b0:738:9c72:58ce with SMTP id ada2fe7eead31-744c238cfb9mr307026137.12.1783385439176;
        Mon, 06 Jul 2026 17:50:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13770a1sm3261848e87.20.2026.07.06.17.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 17:50:36 -0700 (PDT)
Date: Tue, 7 Jul 2026 03:50:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: esteuwu@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 6/8] phy: qcom: qmp-combo: Drop qmp_v4_calibrate_dp_phy
Message-ID: <jnfko7lrdlda6qqc3453c4kjmmh62e5vd5pcj2icbnvu737wi5@qttiawd4vjrc>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-6-37e2ee8df9da@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-qol-v1-6-37e2ee8df9da@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDAwNSBTYWx0ZWRfX4ylhaIrDvCDi
 7WsSDnqWPSGBr9JqpVV8Denw9v86BlqPPiZ8F6Whzm0rf+Uf3IUHivDr4x+HEWYmIUS0kDPy2P5
 B2GYPn64A5UIpLmgR6Earcmxf+G52epba2F2J8UOaB1CI88TcsJOSO6D0flhAurdeN52dyIUrVl
 XYR/nJVi36m3ArEteEljMl3f19dZvsC6fQ4Xo7cLBNHaOHqF5rtfbas2pZDgOauznfXwOypQIA5
 C+XY9qNpJTyUaex/HeY/kKpkouZT6xiBeusXloo2nT68revjdtFLRk6sMlDYvmCblu6aMcOUUng
 lOWZYjRyrbVp6N3a3kB9cvMTAa7hcD5CKAN8PuyaKUK2fReBesOkJJiZZySN99fSI3iFytqb7j5
 7HcR0mY2GliXYiwblpfkSHHKGN0ql/t/W7V7V9A+d+xN/zDODO4OMBEjvJpH2t+/+r9u8DVbj9+
 UCWp9lhziTUFz7f1Isg==
X-Proofpoint-ORIG-GUID: 4DHhwvu0xXwcUvZwHPdEdJxVes_PKkLL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDAwNSBTYWx0ZWRfX3FZ0dgntXqDI
 lqUYh7zGXCoEXnTtOljd0K1QJ4nkwHRMMgLzEUzFI+KwxVdHu7hdvswjSIBhDURFYnf8aPDsxbC
 ZY95Wp4AgXLMNyO5rbT3dx+FITJ5zI4=
X-Proofpoint-GUID: 4DHhwvu0xXwcUvZwHPdEdJxVes_PKkLL
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c4d60 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=0gM5omY_zckdEeGsnHYA:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070005
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
	TAGGED_FROM(0.00)[bounces-117064-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qttiawd4vjrc:mid];
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
X-Rspamd-Queue-Id: B707E716835

On Mon, Jun 22, 2026 at 08:54:27PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> There are no downstream device trees that specify five values in the
> qcom,aux-cfg1-settings array.
> Plus, after cross referencing both downstream device trees and entries
> which refer this function, only 0x13 is specified.
> Since 0x13 is written at initialization time, drop this function as a
> whole, and remove now unused variable assignations.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 31 -------------------------------
>  1 file changed, 31 deletions(-)
> 

Indeed, 10nm and 14nm PHYs used several AUX CFG1 values for calibration.
PHYs starting from 7nm don't use this calibration.

Fixes: aff188feb5e1 ("phy: qcom-qmp: add support for sm8250-usb3-dp phy")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

