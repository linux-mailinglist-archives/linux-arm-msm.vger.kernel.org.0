Return-Path: <linux-arm-msm+bounces-117005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F8RHF7ryS2o1dgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:23:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 331D071476A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:23:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ICNziEBh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bbVmyIHo;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117005-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117005-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9188630041E7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F86B436BFC;
	Mon,  6 Jul 2026 18:22:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7146433BC8
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:22:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362134; cv=none; b=GOeqIxcnm6kEDoDPPxk0i+ZR/yg5dKcXDzSuZk/4Ho8xpwHmUz+pqfzYo9b9oOC2BkRPh4IpST2EK+7ZUytk3pHnMDrtKu1SpG/YhLUMYQ9toItJaSb327v1b0MqHEC2Lc5gGkmO7WncctRLD+un8zfV+BqPJS/HuMPZcnPR8is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362134; c=relaxed/simple;
	bh=G6i4vAHulGxwm6vIPl6snnmm+f+WXIOUfdXb/1OUcY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmmWly+DY5+rTMXB9LDtL4RfMHzh3e3eMnvgwhdEsisO57gzGnhcRutgGSG1e1RRP4tIPTPccJyR53JBCT7i0O09hUg/kfyw74VKdF8DZjAKc093IJ3MQmQTZl+WjqWrWxrZj34tP2om5lQPzsqC4CsbaiuMElGNXh7YjIBa5NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICNziEBh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbVmyIHo; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF0fI825594
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v+oE012GSbNPmRWX2SIsV0+R
	GluI//ijk3Ve8PNTH7A=; b=ICNziEBhOwA3ThKdqAlrIYdxEyCtsuwQxSSe4066
	ghoWAku41y/5nokuhHf+oBQP/RpdRhK9lZZE/3sxGgXIw9LmaEnkyJTuY1jBcJ2S
	7VmAgRXMWxsEBAiJLi89Y3uXwkKh+c+LXabxO7jjUmp37skdEt0IR05a/1+2f+tT
	9NqScHRx77IWj03FrLHvBSe8YbOuQk5WzzHLQD4IrFGYPdcHzDcsGT2FxytZ+fZG
	vskpbEP2/yT6z+OmZt/beWQLRIMSlFcew3PRnKM60tMs3Pdgi8xmIox0820yQHlo
	B9NkXIubsaj2gfPpSc01mCbfRAnHJXR0w6DBjJOCrT55uw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8anwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:22:12 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-969289fca9dso732225241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783362131; x=1783966931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v+oE012GSbNPmRWX2SIsV0+RGluI//ijk3Ve8PNTH7A=;
        b=bbVmyIHoZovVb9UyVbPdNf9xqYt00Jz7AD04PJ3NqWqWo1qvh35VGga60/HXHk3wsU
         6rFlfrO5UBjsl8kA5UJ+cIZ4awVyoCVlVj0VniPFfqxfWxCHUb4eUR7JkKzCMzXPdlza
         MGQuTnEwVjsBX6GTUY+KmPQNkE2usRq8yOPHT8nM4yS60fJMe7eH72f2QaDVbHxg+Oe+
         ux3VWZRnSg1ylfDzOhV+lz318KG24m3LavHkWB1m5rPm6rR4H3l3HGJk+6an7ZC+0Lo2
         Hw6fstm1hqbDWhr9Nl/c+6z2xBQelazAR65uo4P9ftr7g31V+uX55a7o5JOqyIuWGkrh
         7/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362131; x=1783966931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+oE012GSbNPmRWX2SIsV0+RGluI//ijk3Ve8PNTH7A=;
        b=GqDnbvmRbURnqtoed3vGLu8NlBypC5tUNqmeezwG3+AhOTK4LwToTOheJ18app04SL
         AkFlWLLgdReqRTknwgZ9NAiRGuvyj7NHV13vI49KfTs1xhWiqNqZ1pBFqQiFTJf+lflt
         6oMwXxYicqRF63hODLuyx0k5pzpVz/w6zloAbdlWW/iiV2r2pNNFs4zuvTdbpE32KDY5
         zXRPYOuFL8YmQMGWl9iKRG/T1Kqlw6FFJA7RzGznXy4q4XIY5EesoDRGAgQDUut4+QIl
         BBdyPsj1IVMvOfpJB+toD49svElZiwu28ATe1C4S2WJSU/FcYTULhb0rhhMEW0365vde
         Le8w==
X-Forwarded-Encrypted: i=1; AHgh+RqsLV9+vOp9V/Sgv4Cmf+zIaevj1mAURWxBnX3gqYDlfTPqjN98Y/TdFMGQyyvfsO4nBwyGCspMLrqg3WqH@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo9oaZ1izotDddXbfChd7jfCSSb5PIhkTRvsVtEt4TGBidj/ct
	TubWrxmaR/8worwqPRZM7dlEpG+yMlOZAJ0MfeWCPvfWEjCtVPs/47yh7YjJWQFdjGl/lKZKdhi
	G8egcd256sXx6wVhj+XqexzFAfOwva4gF8sewulApfOHV8GXCPG+TjwMEJjI50jvlKaMD
X-Gm-Gg: AfdE7ckM9cSRZLjrOLtwQ79svlodzymkLei+o05nNTtB0P2Fn9n1uOEB0KNHIcS3/Md
	e2MxZl9/qcRxjzMG+V9boBVFEexljeyIeCLvtU1XfY4tptE3IqaAMXyG6HZ2hc8ubbRKZxVzJjE
	wYNWlXBkpSPrJeGwecrpDekg6RpnmfuUazmxgQ+OrYNcK2We4hB5DaLg5OcH37od++2ly+W/5U8
	4J762HYkU+o2Zm6jnET+HP8KHFtTqRoQ9EmaqRbLle6u/uc9FERrB+DpD7Br0Vb5lwFfFGtXIT7
	+PBUdFITopi6c9TeltptQfTmXB/eZzNmQ+rvPKl8XwTgl2qrjW8WG2ciGg1w9QDg8JDBanqnDc2
	f+m8aibCZ6amnGY1Q0AvjJIMJJrdZNizbanIpmG4Ez4IRV7w3EUmZHrwSHP5sEtlGDJr1MGrgsm
	3tFFCXy/NrLd9gMcojpRDPJfSC
X-Received: by 2002:a05:6122:4d07:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5be89537d9emr895710e0c.0.1783362131244;
        Mon, 06 Jul 2026 11:22:11 -0700 (PDT)
X-Received: by 2002:a05:6122:4d07:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5be89537d9emr895694e0c.0.1783362130681;
        Mon, 06 Jul 2026 11:22:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed136f8b0sm3065981e87.4.2026.07.06.11.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:22:08 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:22:06 +0300
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
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
Message-ID: <wgaujvwp45q4gfm76py2xbxobz5zc4hotnfxwldeysn7go6t6r@ufcuw7khhadg>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfXxB44P5ymovsX
 UkUbfYlFXE+ABd7mofQ1x/rqfIIX6A4j52udfGl3CkhP0ZrJmc5dg0qkBUdkA6Rtx/jzrTAga19
 MZUG7Mf7bnqHm51LkZEoblsSU5SrTDg=
X-Proofpoint-GUID: LvvOejVJBLCZ2eJRqrZEwgc5GVufYWN3
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bf254 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Rl_UxCnVGJdxiaxNqnMA:9
 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: LvvOejVJBLCZ2eJRqrZEwgc5GVufYWN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NSBTYWx0ZWRfX/u7XfU7DKM0j
 Ld/T81nDSlfAmUcPtAIvAk9594Ne8JUYcQOmYKpOKbB4mNTr2AOJJhyoqHglCM0iO2QiLwk6ZB4
 nPykD1e2ugVnqg5T1D0qcepJmrS/6KD9sLBDGTdD3y8pt8TMT+LjpmFgxzFaIFUAnRh5WVplTrE
 8sxQQu42NqKJ9ObntzGdMO2zN4/j5T2mBPXKH8Srssw2vvkgr5a0xqpGFvOezCMKQfyeVT3CGTE
 mNccIynNYwFNGZEnLx15DL1yhEr7yUjQOSl4TZMbgKpLC2FG4WrHKFgfLUBBCj3cto2vc6oNMD0
 bDRTIzUCONHCKlgT65xtl0333ZdLiANTUhRI8qoEC3j4lRMigotg50B12kj9KndMldEBCg9Lm9G
 VvkWHWyDMtQsHLCFti7knve7re73UGGZfCNd05S3NtNeom1ED0XErZ5jKgbZB1FfJyFEmJwfDUl
 aOqXvdQWR51La8IMEBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117005-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ufcuw7khhadg:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,proton.me:email,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 331D071476A

On Mon, Jun 22, 2026 at 08:54:22PM -0400, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Both of these changes allow the framebuffer to show upon boot and let
> the mdss driver take over afterwards.
> Before, none of these actions were possible. Only mdss takeover was
> possible, but screen had to be turned off first.
> 
> OLE configuration may have been a misinterpretation... that's not
> something that's done on the downstream driver.

As far as I can see, SM8475 uses lucid_ole for PLL0 / PLL1.
So, no, this part is correct.

> 
> Changing disp_cc_mdss_mdp_clk_src from clk_rcg2_shared_ops to
> clk_rcg2_shared_no_init_park_ops fixes this warning as well:
> 

-- 
With best wishes
Dmitry

