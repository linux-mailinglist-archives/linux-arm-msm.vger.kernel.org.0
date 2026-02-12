Return-Path: <linux-arm-msm+bounces-92641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEGGIhxKjWn/0gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 04:33:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF23C12A31F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 04:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72C993095E5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 03:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EB4238166;
	Thu, 12 Feb 2026 03:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpVS+eQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HcuM4HQ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F4F4C92
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770867214; cv=none; b=D6KoO+Hnikobnta0yEQq9zXltO/3ueD3JqgmrXV17LGyYExTHl0kHrQpRQO4Lps9dLACs1Ns6PpjVxXZVhxzsLK4c85C43DsI4maanCFlpBXBQOcpjh0BiJyD6tLEB8WTZjK/BHsm+GfSklgPthOz7shphBcSGVxRElbgELEcNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770867214; c=relaxed/simple;
	bh=yGo4F8z1y9cJ3qla3Ww3qvpO6wbf4LVOUe4MreMik94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8YHb7MNRg4jW3iGdCxR38x/XFmKQmjGJCl0csxPwdVhcXIZjqSZzsmtPVhatfkcjBAHFsgEOS8BEQpVlL4YFllFcVNejiQ0aV1TVkFWcmbAAZFPd4v69Hhnk3UbNHSHTtNr4DyDmkSNAWcBbqnp6WdX/o3O4DcqYIUVP8p5v8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpVS+eQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HcuM4HQ7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3RiVi3143791
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3R0yxSAR65Tm1hoBjrDO/b6e
	wY8CnTHJrU2fD2DsNqU=; b=mpVS+eQNS38JNi8UrmgtQrskhdtYcV8Xjs1tH+7t
	+UPeg7R519KXsGTVHMWbEQJIvvA6MSdm5HJG4AsQNmbcWfqdva3etCMuc0mswjKh
	uzTtmQSOFQIrwtBx0lgw3RGLoiUufm9KGuKlW6f+iQ7EO1LP4A/vEOKeyh26oUXp
	2qw7Sap8PRj3wAiG3N+Mn4IlGMTy9yvXPRmRPwC7UCCewSQPgSOM5HOdA+MG0/Wy
	UX3sYVyZ3e7/1yWr0bA6oWKzQnXMZDIqfheW/KR6MBkD2ocl1BWX7LkLsRsG2BGn
	hc6yRiA1/OmGFjdexUnTYQFL8o006GLWM/rNSK69CcJq0Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c93snghkg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:33:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba87c0e198so2072180eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 19:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770867211; x=1771472011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3R0yxSAR65Tm1hoBjrDO/b6ewY8CnTHJrU2fD2DsNqU=;
        b=HcuM4HQ7UXHUDHsEJ7jGe+yEFybXM0n/jXVZLymN+1JEJrQzCzQwms0RrB4MbKQmiU
         b/AOHo0/e2rNdekFYhZcNpMH9Wp+agTcpY/XnAmPgRuTAcc/Rery1yaW9HR7RvVD7Z7S
         saNVPNPFjY8Dzlsu39Kdwb4e1IYntmRuDl5i8QkxNzvVhDVkgsXJh+r67Qpb+alPHeNN
         qCwJo3U1e1eKjPocRXIIzWbGUQx/mXuSIyaoHWKVDa5PWYkktNKy6g3gfIo10dodmy2w
         DqUML9vOwRaHRE/c0IxbgLBEoPWp7NhnLUsmSLdVZ1EWT0EwDvggXpFrVEhTwQeV0p1R
         42nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770867211; x=1771472011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3R0yxSAR65Tm1hoBjrDO/b6ewY8CnTHJrU2fD2DsNqU=;
        b=J26nEYYJYOLfKtc7+XtqPuVCx3pRIHVuSP2RBX6Tlfs79ovI/Yp5U7/4NceY6Y1GRG
         dQwipWkOp0I8hH7nbLQ01JoCYP2Ws0XOmLcgZhIdKtWIl8EtgCCMa0CzafoUKGZn1Q9l
         4WfSOdT+h2QJ7BjaQPq6xb9PUQMia9YkBUBYFQQI75v8kjfteLXoA4omVEb4YyEbC+fO
         HAjUfg9MuwZqYScXICnHIi64hXaI/8So8+nqibjq7ggznaQEk6yCGs7BcAXCADntNakm
         fng71zz9liF9pDjzlQCgQkRmD29D4AynX3rGLv43Xv8PQNX06Yq5Js4Ix55fiyJxIwlw
         yafA==
X-Forwarded-Encrypted: i=1; AJvYcCVqazAgIW7h1l3EuT9FfssR6Pnr6UMd/BIT7ZjzEgoyqdR9AUVhtp/6yWK+5/m0Oc/yu6Ec6pRlUTuQxFNu@vger.kernel.org
X-Gm-Message-State: AOJu0YzI4c2LawI0fnIgLvxG5xDK9Fl+39CJ5qezirc/ikSzKCkPys5O
	eXyZRNFRRVPnJcXpMWOcljwVcdMC0p8rV776llY9Ab967XyYx0N1Z4XHx9w3B9toYhgeGsKpDb7
	Ck71OuxjUoXnGQUkK0GIkVoHQVFxx7f0638cdjOGXK48OqDeGjiRbdrp6c9inXo95/SMG
X-Gm-Gg: AZuq6aIwtU0X5jsIA1vb2oA2J+/M/8Pm03rmYQnaF8TXFftfavS0gvQ86srtQq61l/x
	gmwCaDM1g8Ax4J4u6p8PGDSQGeD/nPRZIXVDpyBFjsnH7Avm7sZSbeJ4MeaI5snRPcGjTL7ZaJ9
	Ki/7TRi87HKveZVhqmT16PZ1lmfTZOXG7mLJ5jf5aZWsuNxq4vqnlYX3CUY7JMz67AXI5dlWNe9
	VPU75kBq+I4A6u9Eb3lB9Xd0F7NrJ4W6eXgwyUQasVmtR721kGZFkqtLi77dnH9w+ebhU7QQkN8
	iEQWFRXUga2CrGvLib/tgaV847rRDa5LkoQr4KKOcLkzHBztncgMuFgfJv67gInsnPEEkM4uY1B
	cNs8mTKMpxDYUa9XVGJwEhIdmkO+ziPhUrq3IMIYiU4hV57mhqLQqOuRU81t9LZ4/y++0
X-Received: by 2002:a05:7301:4449:b0:2ba:6d87:cf68 with SMTP id 5a478bee46e88-2baa7f964f1mr703093eec.16.1770867211266;
        Wed, 11 Feb 2026 19:33:31 -0800 (PST)
X-Received: by 2002:a05:7301:4449:b0:2ba:6d87:cf68 with SMTP id 5a478bee46e88-2baa7f964f1mr703079eec.16.1770867210716;
        Wed, 11 Feb 2026 19:33:30 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dbe127dsm2550861eec.11.2026.02.11.19.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 19:33:30 -0800 (PST)
Date: Wed, 11 Feb 2026 19:33:28 -0800
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: qcom: qmp-pcie: Add vdda-refgen supplies for
 Glymur
Message-ID: <aY1KCLDDoQtLJ4F1@hu-qianyu-lv.qualcomm.com>
References: <20260208-refgen-v1-0-87ca84fd78b3@oss.qualcomm.com>
 <20260208-refgen-v1-2-87ca84fd78b3@oss.qualcomm.com>
 <jvitdcolh4naqjdahaajlzdctcmp3sy5odiheeqacps6pcbg5t@zx3jliileazg>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jvitdcolh4naqjdahaajlzdctcmp3sy5odiheeqacps6pcbg5t@zx3jliileazg>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDAyMyBTYWx0ZWRfX6awlf3Me6RMK
 hvuR+5tNcRau/JSbWtR4axS6/A8aOQ+2LGrCU86U0V65Gmn/brJJ9w6Ly3qjKKjKzEFA7ha2c7C
 +eh8Ns+XhcgRz58UwDPzX9HqlVdBlp5do12ia1D1lNmfy8A6zswJZVxLguvTaswepNCRwGVU769
 yLdv28mFaZr9u9UX0wKaBmEFETuHq0+fwHSzvk7Epcj4YWlGDRPtHuT07+QBnrD05fof3T2D/bA
 XzgBSQ5lKvNOGCQdcZzti7nOyOvFhxlrHFMamMybf8+qkZrXy7xasRSUiJiIfP1RQf/9cUV1+K0
 Tg/zUFXiRitwFUUux+gscPnLLbTtFSwT1blz7pXUmR+8SFVMNaBOWu/jAnn8ihjUuX3fyex8PIO
 P9FWHLYxbWLQXQQVZpodn3WdN9Y9tzMYmo/mETwFJ4yQk2DlBCoWulpDk6ECGK055ub7pzsASDG
 NCyF0P9/aH1xsA9r7mA==
X-Proofpoint-ORIG-GUID: LYZx3huCTqJcEWnBdukq0RhUE7H9O8Od
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=698d4a0c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=1f11xt899pylJ4gGFeQA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: LYZx3huCTqJcEWnBdukq0RhUE7H9O8Od
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_01,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120023
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92641-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-qianyu-lv.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF23C12A31F
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 03:15:24PM +0200, Dmitry Baryshkov wrote:
> On Sun, Feb 08, 2026 at 08:49:40PM -0800, Qiang Yu wrote:
> > The refgen providing reference voltage for PCIe QMP PHY on Glymur requires
> > two power supplies independent from the PHY's core and qref rails. Add
> > support for vdda-refgen0p9 and vdda-refgen1p2 supplies with a dedicated
> > glymur_qmp_phy_vreg_l list.
> > 
> > Update both Gen5x4 and Gen4x2 configurations to use the new supply list.
> 
> I'd ask for the DTSI patch too...
>
I will post dtsi patch after we get agreement on how to descibe refgen in
dt-bindings.

- Qiang Yu
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry

