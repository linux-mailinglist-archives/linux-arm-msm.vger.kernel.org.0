Return-Path: <linux-arm-msm+bounces-97703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DohAUhStWlGzQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 13:19:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE128D189
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 13:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30957300D4C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 12:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747D34F881;
	Sat, 14 Mar 2026 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irVB2IcG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OV/MULjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E6B34EEF8
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773490740; cv=none; b=akR0HHeULdoV5w6TpfNvBulTVs7jIhjkTmWPDbVXmBQZrzM5q1howIhFEX4tHcNjvwjD4Q8IbkU8K9sAWdXnelRPlGtSJTiK+4O4hB/QO17PGQI8/HrsDYoYs69MLcZrquku9viSmcJ0Nk+W0OdovEceZBjthi9Gv1Pi/Pulk2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773490740; c=relaxed/simple;
	bh=zTQ8rmRiJFeHbDAWNkCXMDVNf/h/IgvwL6Tr5pa1TLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWkaWt80BwYFWF4htgm8kBZDijbvpctuNJ1tw35CfFeN/HA4zifZopY35s+pR0BhUGJy9erdDhGoNCgn1QjLqs+kMgAtu0f8uT+E0G3XkmLlDiZ9wtgRjqe1kCnHcPuB6/6yD6YuuIZ2L5Q7MEhExk5UJwk9zO29BfQGtvb/jn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irVB2IcG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OV/MULjP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62E3nc9W2538493
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 12:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rjL0UUHtNTqtONAtn/OGRWnp
	lN9kMYG/3SiGmBzEtGk=; b=irVB2IcG3MtZ/if42m8TBemLjO9hx1+FGhNcAR5f
	YcM0KCzr5FgLdy768Eq//ULPCnmWn4Sjver3K5+LGbQJeiSGkgTM5tWypkRfmLLV
	BDpxJFzuK7WTUwHjAgrdpqmJrCNMQoNKXnpu906fL4nEG4f7XlSRZZsw0sGoQOln
	KiWf2Wv9ysAdxP4AFNoYg8z+XEl3hB9jZYavtAcwbZowbXBCgsx79Ur6Badlm1at
	cVHHSJtVIE0uyPj1zhTjPZytD6Ds1ue758UTqXhsGiEilmQ5r0YXmFG6t4egwzqb
	gY3XrLBbAAakN7nVTBKTOjFhxv6UCzPw9cw4Ek8L5KDL+g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03qgr71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 12:18:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be27d4e3e5so20110953eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 05:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773490734; x=1774095534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rjL0UUHtNTqtONAtn/OGRWnplN9kMYG/3SiGmBzEtGk=;
        b=OV/MULjPKii+bTGDVfnhZNOmFzh4ib5UwXOvaMPMJdP0l7LCiWGlW5oTwf6cH2/0id
         2zWTWwey0hJ2kRisRPm/gyRkoS6dGnWpDY2gGPLKqL8cD8aW5iH4MrE2K/D3IfWGoDUG
         GKKb5lrL3BQ+g//kLhANfcuaZZcbKRK5h7uRdfHH1Zu2IEeXgnq5YF8wTk95lZwuVCg+
         5csmtZ+PE3CmDuPzNPBJi8m8fLo1a+2Vjipi2MDd+HkOmqZf/NwlGrjJ2+wAtbipZKiR
         V9tnwwyTt70uz0XfjRioo9VUod+0qM7aGCfL15ZRPmtJ0SN5IQ+18pR486836oXxYi91
         40Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773490734; x=1774095534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjL0UUHtNTqtONAtn/OGRWnplN9kMYG/3SiGmBzEtGk=;
        b=Xnz7R2myo6vf4WCgBAvXFvCfRpQPO1I24supJZXqStuhVN78sYvpssnVpASSi8XdbQ
         7UgttQSDxSKA2OABtEt9yWwe+8ZhdOZRieTd0NyFFw9SJkiLyrN4ru0INAfOupe+fxHQ
         efi9tyj5VIEQzRTAeiS7JvsuqtjrMDYAZcLdAIL2tc0Yu2iVekwPew8FZTEpy6LRa6Uu
         sQFCpZPmMZ3djRdQXa1UIw6f4SRQVXIVUmmVhyMYDc90jo41Rw8FBDMr46xpk3kXB7HO
         n5sUN3Xz93x4p0NcaFo6FMxS/vM89mPTgATxANTL7nZGto0IWY8oftYrwgvVsgFMfXnN
         Dotg==
X-Forwarded-Encrypted: i=1; AJvYcCUR7sXgL6aDCyHZBZVvDvVUYZCMONzAhph0FDJZS/m1pPYgJhBDSYT2AdxL6iYfsT4WaX+OiE58yg6L0Lai@vger.kernel.org
X-Gm-Message-State: AOJu0YzkjHrqTBhUWHJ7OXWi08HCahIk96/olKub2nv8aKsAGgSBhkPs
	rQg8mvB31WGlBY+wBk+T770Ci3qVsdE4S31K/H2XzJaron9Ughd4gzpKd/0XW5dERHncr2my2Dz
	xXffoXJ+FtNJpvaX1Cz6HsNsrLMnkNQGKr8EDrNyIJ2ubzIl29oRYh4NsLTXjoCvoOvd3
X-Gm-Gg: ATEYQzyFneT2jZOdbAZ9/FfOR9/7xS53gvDe0eS+wZDe/xqfT9ZkacX84hqGpNxYiVt
	ZN5jOm+XBTWN7VMzF5mdj8hbUKNn3lL8o7vpstLgcTO/nL9OMTCZVRn1/14gcTLBfW4NsAGNNxw
	8uBaj0h+pnXVdsWPZbAB2oklbX5Yqtft93rSV+DFRiuKcrOEMEqnHOeLJ8d5sYJevuq9PUqlFrk
	Wp+5HmYAZsdHODsaqjwlF1ZZNr7TOmgftQEGBL5DmuGStbgFD9vSmobEuI1psHCavE5pDJ9Wf8s
	7pDMugE3bZooW6I906b9k4ea2KFyigMakj1tP/NvIXSGKc4RntGH0n/ihTWDGDoLajsP0yIwbG5
	iEtlc77dLdrPUj7xhukh3vRKuZJfFj5Ft2vKWnqcqUur1Hhj0Z22uXXGteyNZcfgw
X-Received: by 2002:a05:7301:19a9:b0:2be:8650:b0fc with SMTP id 5a478bee46e88-2bea53daafemr3320858eec.5.1773490734083;
        Sat, 14 Mar 2026 05:18:54 -0700 (PDT)
X-Received: by 2002:a05:7301:19a9:b0:2be:8650:b0fc with SMTP id 5a478bee46e88-2bea53daafemr3320843eec.5.1773490733556;
        Sat, 14 Mar 2026 05:18:53 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526d3csm6422176eec.18.2026.03.14.05.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 05:18:53 -0700 (PDT)
Date: Sat, 14 Mar 2026 20:18:47 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 4/6] phy: qcom-qmp-usbc: Rename QCS615 DP PHY variables
 and functions
Message-ID: <abVSJ2-mMFf-rsw1@QCOM-aGQu4IUr3Y>
References: <20260314051325.198137-1-shengchao.guo@oss.qualcomm.com>
 <20260314051325.198137-5-shengchao.guo@oss.qualcomm.com>
 <ckj6c2rute5bzachye3tl6hs3fgw7wtafoldsdutkszxjc2vsp@nplvcpzqzwfn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ckj6c2rute5bzachye3tl6hs3fgw7wtafoldsdutkszxjc2vsp@nplvcpzqzwfn>
X-Proofpoint-GUID: Z_mCvrTIEP44Dw95bSFbHzD8JccMSo9a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE0MDA5NSBTYWx0ZWRfXzjYLkJUzktIh
 wLi1ObwlrGxeelTp+7b/hy7pvXjdnc60Z993AcarwpKbLM+B4QR8UfDHgPwaU1YgLj00d85I/Gg
 h+xmvDGnu7x2W0fOm1XK9PplgE0wwXfFGJpcTM2qzndMldLRaNypIuD8eHxdTdRCP3rKwRVftjx
 ecz5TirpW7JZEAueuEUAPtdzql1EIS4CYbSyKHtYW9nPZU0xHkX8ni40uI2xq9sL14WeluVfXWB
 CjjHdBX1cOdBysjHuPn8yEkyUDs+DFORxEIs6m/WlR7oDysPzjGASGK1Va5Jw89GnodLeZDafUK
 k3dKIbwLpfePR46jxMSIqVU2rylggcXtTQ1EY65ZVWNzKOWSFlIeMzxx046uxSutuZkdKOgQGXO
 ZOeu2YUdorrbtA/jiDw8+WUJNTisdlZnwjwVGnt5jj9HdjKsqb2LRSoKXsb/GwuSUY5fgzM+g/a
 Fumx+RlwaI9Kj4/blFg==
X-Proofpoint-ORIG-GUID: Z_mCvrTIEP44Dw95bSFbHzD8JccMSo9a
X-Authority-Analysis: v=2.4 cv=ZbQQ98VA c=1 sm=1 tr=0 ts=69b5522f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UXx_BxqW5X7b_lvge-cA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-14_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603140095
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97703-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2DAE128D189
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 11:14:56AM +0200, Dmitry Baryshkov wrote:
> On Sat, Mar 14, 2026 at 01:13:23PM +0800, Shawn Guo wrote:
> > Commit 81791c45c8e0 ("phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config
> > and DP mode support") chose to name  QCS615 DP PHY variables/functions
> > with qmp_v2 prefix, by assuming that QMP PHY registers are versioned
> > as a whole.  However, the reality is that the registers are versioned
> > in sub-modules like QSERDES COM and QSERDES TXRX respectively, e.g.
> > QCS615 DP PHY has registers of QSERDES COM v2 and QSERDES TXRX v3.
> > Thus it may cause confusion that qmp_v2_xxx table and functions access
> > QSERDES TXRX v3 registers.
> > 
> > Rename QCS615 DP PHY variables and functions to be prefixed by qcs615
> > instead of qmp_v2.  This better aligns with how the driver names USB3 PHY
> > variables for QCM2290 etc.
> 
> Well... I'm a bit reluctant with this one. The driver needs to support
> DP programming on three platforms: qcs615/sm6150, sdm660 and msm8998. As
> far as I can see, most of the DP setup between SDM660 and QCS615 is
> common. 

In that case, could we just reuse QCS615 DP tables/functions for SDM660,
just like QCM2290 USB3 tables being reused for QCS615 and SDM660?

Shawn

