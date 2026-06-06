Return-Path: <linux-arm-msm+bounces-111477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F5EwL9ICJGpB1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:21:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F63064D2C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 13:21:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pGDdeadf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=iJKAcUk+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111477-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111477-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 83AC8300B9F7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jun 2026 11:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CBB236607C;
	Sat,  6 Jun 2026 11:21:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29A23358AF
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jun 2026 11:21:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780744890; cv=none; b=nzzWPOOCVYQjYEBv3Y+ntE8yyT4UF6TG9n6xxW9dOdQBiuDOKo5lKi3tTqxl8nAkX08QMEOM6UmPrg9XViuhwh/owbrxC6bK0xgP/jJeAWcd4unuL4pXlKN5jlCt3l4dUktf32j7vPoBWyaVgSlN//4nr+ydDK2eTh13QMVmk/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780744890; c=relaxed/simple;
	bh=IO55ycN77ykj02j3o0MZ9btGWE/k+GO9wk67q5RYNTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXA1TNcT70seyOpleeCQymlIyaFnK5IqZOMd4uDZg0+KE+asAJNWtkKYgB2hZn2wu1owccRi7nHHGIGArAWNfPrwUXcH/pozMMFdMdhZrDfQC0jfDq7queK+1euQJFqfK11eKd8efBK8q1uUu/EdPCTyKMOwSph+eIq97kNnfi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGDdeadf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJKAcUk+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BGfWm1321992
	for <linux-arm-msm@vger.kernel.org>; Sat, 6 Jun 2026 11:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lQwX1eeP9EXpHD1YE+j4Cxtk
	sRuCZmaeuF5xe4VQvg4=; b=pGDdeadf8tZKguvtsL8M4G44PZ0dZjOIy7ao3kua
	+RnVqHDoN4IjClHLSzbb7tcW9YPVRH49CTnKqKk3pWGQWz/0snlqR6U7iFivX8RT
	l3cw+p+XXZjY18/9cnYCtv8BXkuNWok1IOe8UHj452NL9V1KcGJMGPrgFgQVuRxU
	IVI9k8IUlrEx8OzkAUYNidaBWdb1yKtX16gIKZbaXzMWmgQOqNRgPJsgOP2azE4n
	h2G8vuYXibEQ+DCme706p31LYTYngC4Vd7d/qDh5ilBI+BgBFG958LHueBw+D4Ii
	NPKTwQLw1Cp9LQY6/dw0fzgEa0HMTUdyihKl26ng1W6Mwg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj4s6c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 11:21:27 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-96395e5f46cso2924276241.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Jun 2026 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780744887; x=1781349687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQwX1eeP9EXpHD1YE+j4CxtksRuCZmaeuF5xe4VQvg4=;
        b=iJKAcUk+Gs9eJu9pQK7C9BvlDl1c5aOiUedFo14HAQPMF9xFYcLgjvJWLeLxXMldy1
         KChRbiJu1EU2a8BfzDALJs5av8fAFC3X+jJMNJCDfYwExpuv9JqwdRo/zx1uN2pS8g+4
         yct++w0P9tdQGdy46H9RVthDxOU2ps9JdgCN8XinVyuaQpu9Ni6FQGev2uAfKXVNo1ak
         Tb8xQrFrkVEZkF9kl48YG4LGgi4cwVuo+Vx4KkHIZze8kDTX8IvmkvhoSZV3nBQH3I7v
         21QkOZlqSk4vSEWpEuqngMy+QN0abaVO9V8tFCc7dkeAuKak/n8+UPSptumdojDO9g6S
         UFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780744887; x=1781349687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQwX1eeP9EXpHD1YE+j4CxtksRuCZmaeuF5xe4VQvg4=;
        b=dTZ6uMXFopp0SGLS30vPSHyXrrpNqpmk/nO29RCp1HfO4VhhOO5ZMXV23fC+qC3+4n
         X84RODuvTbNLKzwbFB0hbUMZ6tfYCyGsGOtbs/hWoX+h1fxvq4CJPCouVVDbgJNEzhgK
         cd7akDksrAqejQPkW+DkGD1YAxZz1HFTFD5PtVwDyEY+xH1DBe4XZmHcZ8wXlUREKIAg
         xjqkZEVmIA3SPFxtMvnZ5anlcJzL2FNeXUILzGWTtAktGDdd9rNDXAx3LEF3ENvx9BFT
         8MtSLorIeWrzZSLJnC/IvVhp0TL/PIBvx5NDgBfvExnesMYTlaPDBgiGb2AxsY2hWIRM
         fUHA==
X-Forwarded-Encrypted: i=1; AFNElJ/y8JjXEF4Ns3zVoQe5dyOcKb3Xmelu3x21StP8nVf9SmiI+et7QrJkCJsvczDw1CzA6/InPlsQQu4nrGKo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv5vRfJBC0BPJJoEQWGgGQYKRbfI2EoashN6ajaMQxzO7Iuu3r
	V+2TxDJxjM7MxFSd9b3Wp1qg9ydNp74ODmLxwO/4KjkIYHo6AJS6cCrkXH1kxSd9MnA4jpPJcEa
	BzF1z6WWxn2liYFAcOX107Qff+BP/WUV7tgJf87z2TkkdVpyYXQJzcwVD9hEzXfRTgeiD
X-Gm-Gg: Acq92OFrksBh88pgJDTTPV9++Jv9mUIlO/btxRb5Xu0z/UYNNwFGNrJlBYQu0rawE4x
	wBx+4BPxbv+13LZr7GVTkRC56ZluMG63hLEAuaElB6O/mdSv/7/9fWXZKtSahnKq+5YzoS95tdl
	bnqesXONZ2wv3H3MVlm9KDbk/JlKekHaZ3QEOsDqQr2JhCsxMd+etoxZYIatJuMTIDLPRWtRjV7
	KLdXVTRfBc5wK49Y8VV9/gWGb/d3XYMC+vA9GBA6g9piWL1wp8OUY4Qtc4uEVlOmWlby/qQ03fe
	Aabs3x4FizQ/NWfL5+gG2bEz1AFRxpUUFqLX2XJj8tOW5B/wEifojFCaClB3yc06YapoHL4d4I1
	U6hl/m9pE7yNp7PJBC8cLQXfrcbdx5eaXyFYJatvx4KlOEDQAf/Xr+L1Da27pfC8nV7N2pnV1t7
	BcIp+O/eonJo0oxE4UNvZYEd4wrcyNmClI4k6BHEXXJgxcsg==
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id ada2fe7eead31-6feed1adbffmr4574378137.4.1780744887160;
        Sat, 06 Jun 2026 04:21:27 -0700 (PDT)
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id ada2fe7eead31-6feed1adbffmr4574362137.4.1780744886783;
        Sat, 06 Jun 2026 04:21:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97ac1esm2400684e87.54.2026.06.06.04.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:21:24 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:21:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Oliver White <oliverjwhite07@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: document
 snps,reinit-phy-on-resume
Message-ID: <45e5pepjwfixymk26uodz3pqhe44n2duo5dp5aflajbh3xv2kl@3nhzdev6dxq6>
References: <20260601231236.20402-1-oliverjwhite07@gmail.com>
 <20260601231236.20402-2-oliverjwhite07@gmail.com>
 <20260605190638.GA4188454-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605190638.GA4188454-robh@kernel.org>
X-Proofpoint-ORIG-GUID: I1nxkNAmvOQDc09RRnU-lrYbBosE7csT
X-Proofpoint-GUID: I1nxkNAmvOQDc09RRnU-lrYbBosE7csT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExMSBTYWx0ZWRfX0TXJX3JSdyNk
 78h/d2qIMKrE1Kt+xAYu1sc6pDfSPmTXpi3k6cuIx1/bCnTXg/HH0cYVVqgG1qMpE/YKqGx1Op7
 REYi3FA5WR1ytw2KwLSkKD62XosaPvtm5H5mjb6M2hM0dcz9rs0vD6UE3HTEvt5iFN8AcDWUIEo
 8Ti9Vgv2zSp8IgnTG3TGyQYhpr9ZWknXyjAOEJjLnL59GKB4h3Mg/yKlidqj0XlecKXXetplT+h
 2uGNI0rIr0sEG8LuQWC7SFxVtFNwZDQ+CJ83ac+rJ77fcId+CyRrc4t65UEH2cZXm2yY3hevN+d
 FHO++Ynhk1tfBWs95Fpr6em13ww2/ErWJnMaJKywrNyH3SPmCDl1Fd104Hf0RIOWYq2/2m2qImU
 LQQ/5CbRJIbilZHAfLtMgNaIfoyqPqPIlC60pVZCzizEYx5km+5xEB6Tm05nRHggf0NFX9H4RoB
 NDpgMRMbGmpzWI/yQlg==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a2402b7 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=Zo7aC9OJPaZIPdUTQJkA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606060111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111477-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:oliverjwhite07@gmail.com,m:gregkh@linuxfoundation.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Thinh.Nguyen@synopsys.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:balbi@kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,synopsys.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,3nhzdev6dxq6:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F63064D2C6

On Fri, Jun 05, 2026 at 02:06:38PM -0500, Rob Herring wrote:
> On Tue, Jun 02, 2026 at 11:12:34AM +1200, Oliver White wrote:
> > Add the documentation for the 'snps,reinit-phy-on-resume' boolean
> > property. When set, the DWC3 core will perform a full phy_exit() +
> > phy_init() cycle on each USB2 PHY during the host-mode fast resume
> > path. This is needed on platforms where the USB2 PHY power domain
> > is gated during deep sleep even when device_may_wakeup is true.
> > 
> > Signed-off-by: Oliver White <oliverjwhite07@gmail.com>
> > ---
> >  .../devicetree/bindings/usb/snps,dwc3-common.yaml      | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > index 6c0b8b653824..d12f6ae81ab8 100644
> > --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> > @@ -212,6 +212,16 @@ properties:
> >        When set, run the SOF/ITP counter based on ref_clk.
> >      type: boolean
> >  
> > +  snps,reinit-phy-on-resume:
> > +    description:
> > +      When set, the DWC3 will re-initialize the USB2 PHYs during the
> > +      host-mode fast resume path (device_may_wakeup). Some platforms
> > +      cut PHY power during deep sleep even when USB wake is enabled,
> > +      and the standard PHY runtime PM resume is insufficient to restore
> > +      the PHY register state. This quirk forces a full phy_exit() +
> > +      phy_init() cycle on each USB2 PHY.
> > +    type: boolean
> 
> This should be implied from a platform specific compatible string.

Platform as in the "root node compatible"?

-- 
With best wishes
Dmitry

