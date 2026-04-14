Return-Path: <linux-arm-msm+bounces-103053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLAJOFPm3WnDkwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:01:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE493F6573
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EA813021B03
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 06:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51830344DB0;
	Tue, 14 Apr 2026 06:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELfYzCJT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iWniNTMZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067A5343D7B
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776149993; cv=none; b=iKJXwm05DLuj4AYetzptMtPlXijgBH862LJe23FJpFpse+0+dAPcA33UNTtdsboUWvRBNS5jFvQnBGiD/25WAve7oxE96hISo0MtLE0/SktYZShuJxTuWjLcd5bNQTMcCfdM/97hOuC96LZqK6wLsJnN44SBmzHBDL3SMc6OpwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776149993; c=relaxed/simple;
	bh=303Fg0QMxX4hjVtM65FCJzlhmS12ypPaA+fXGiFZlRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t48WWIJzquHmSIySh+HjQ6vIc5+2sTSi/3LL4SjNBjTtVJ74M5fzJVnQNTMBWC2Mb3PZdZTOeftEcof2s63G0lGqH2L51UXLZpqBz53O5k3wwwPdR0SenOKR4HKymgKA+kUxwbBk3JAM0KlZrctBUGB0OFuI4lBFUglzUYyq8LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELfYzCJT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iWniNTMZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6LiVK395284
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+DOLJvJH/mXgJijyVkCWA54N
	UI8M8RWmKWaTdokGLAc=; b=ELfYzCJTyV+18YYYYGT+25lFve0ZtJ0cI/8d8wSc
	elStASSs8tVW/JMxSd2PyRjyC3371xnva03qvfwVWd9SAch54kq5BTX0FJBuQ8h1
	d4WrV6Zh1blZZaCUI1NQXsR/BGmTtHuNoK5EG7/l2ntqo0I49uWKwLEoH44S03TJ
	3GIEQNFVc5q73x9Q3qZsfG7o0llFXMcww1KSeEUfOqttbq+t0ySo30VQQBR7yDIp
	GQNJC15Wx1qCBBdvnGCwgIz6dXGg5QC4zWTxE1bcaBs2x1raZR0+ScnPRqFsAlI5
	4fDRTY1tgi8SXp2NHAKASZioJkFxtVVwQMOdyfsSUHniSA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870sfv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 06:59:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2cc75e79b97so19573493eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 23:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776149990; x=1776754790; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+DOLJvJH/mXgJijyVkCWA54NUI8M8RWmKWaTdokGLAc=;
        b=iWniNTMZC5Q6XVCdrC+CiZ114jHR5+jiFUa0Br6yNXqtAsQ5qmYkb5HSvHF0mKFB6B
         OczarIiP5cdIOmnaXslko5Hy11ieaXXOaIuU+TyJdRjwA5+i05AEOioHXPhgIVOacVia
         Mz3uU3DLYuxF4qEsqZ0mO7TsxrNVnqyEabkws5IwxdDngCRF6FhYrlNFf0yY/ENeXe4G
         dK9VP+JPsVcxrXceFRk76LrA0BpXSWiv3wjxvzaC9+XLR18L+aGzNzqVEkOiDFbU66uK
         tmQqC0UFYoGymZtGkjJJ0p9nXonyQ7ZB9QT7u/41eCRX6a4iWj2ln4d0a3DqCo786AEY
         2iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776149990; x=1776754790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DOLJvJH/mXgJijyVkCWA54NUI8M8RWmKWaTdokGLAc=;
        b=KssyWLu67/G9+mKcKutysn+eC32TNqBwQpsL2pD5ZIFG/+oJkU0A2yKoi2YSdF0V2x
         KUtzWEZz4j6LL/+tI3aJtJvwbl3dAlgIdW2HUqyfOhGzvtsZJ6CqH0IOWnD+Mzxc2ova
         Fn3nJBSb9wIDdG0DuP+4+iJ9BFuni3wyF+fddLjRIzV7px6fPDbJQXvBB73uRRi027TI
         D10irQNvef7yxKMie+GT6ZcnuYxH9qr6DgJmW9a4UuXerD1CPw+MqLyCMD6L1KtUV7lT
         lQkDYph2JIiEMQXSJID46jwDebiqPA2XHsaKPK5G6dBhmcTxc6jFeOvD+VDfIgXIKwSv
         yHrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/cIexR/h8BACO55bjSGPKb+mUh2LzOdy7pqeBC0WDZhMX4XsJXaucEbmB3+Xk4GA4kKCINiTysKh7/bzU/@vger.kernel.org
X-Gm-Message-State: AOJu0YwI5YVXp6vmgQTBcvhi1sPduZ9E2wOjQcHpD0+F7H+7c3+GO7bb
	uga3lYLlshr9pM/RwgZDCZzwAR60y4kVAn5PjSolWH3eu8NKZ2uVU58qywigmyKpY3JrlOMVKP7
	Fk9Zu9c+Xt8g6SjjeqWeTByYcH4k75qbkYXo9RRmp6X1fHGWXHnnn8a0FurYn8flPuw9v
X-Gm-Gg: AeBDiet60eP1bcX/JghUutVmt6xb2/hCtuCJJM5z36RPOt+zge5WEXlpRbVZIregMk1
	2LNeBie1ULELRt/IV9bWCyucrIXEH7OABcsp31SDsDJ4bT0nfRT4zz0GZA559k+jJbnUNqc4wpx
	T+RT11d2kDDPhoiYy5obM/D5lbRfsOD8pZvl/RiHJWaosdD4+r+KqlQQv5B84zjF2wPQp4N54F9
	lJdzUTXwjjCqeef42T9ibx7ui9p7aSUzDyQB9lr27FDPoigkvc9rdfBYxF6ae/VhW9ou8Koi+ek
	A6Gx4XdkzAOXl5XbkH8i4pC+Xmbrwn+SozM1+NGsScSprThFmkO5wEzhAbWnfSqoFsc+dCRo8tY
	mo7db8meCDF6pj+fZlJcxEfw9osksL4ams8xYuosu5erBUDESicrcQACbRxyeNOPH
X-Received: by 2002:a05:7300:320a:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-2d5877a7b8fmr11003065eec.8.1776149989945;
        Mon, 13 Apr 2026 23:59:49 -0700 (PDT)
X-Received: by 2002:a05:7300:320a:b0:2c8:6361:ab2e with SMTP id 5a478bee46e88-2d5877a7b8fmr11003052eec.8.1776149989391;
        Mon, 13 Apr 2026 23:59:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d8dee27fccsm9050136eec.28.2026.04.13.23.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:59:49 -0700 (PDT)
Date: Tue, 14 Apr 2026 14:59:43 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Message-ID: <ad3l37AXKvzRrafU@QCOM-aGQu4IUr3Y>
References: <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
 <a1f8cdcb-fddb-43ca-adbd-07e36949eef2@kernel.org>
 <adzjYypJciYFLT6F@QCOM-aGQu4IUr3Y>
 <1c06bd0f-24ce-4ea2-a7a1-4c61827b4763@kernel.org>
 <adzrY4AijnKqXDrh@QCOM-aGQu4IUr3Y>
 <cc08a091-9f2d-48de-9284-2f0c68fd343a@kernel.org>
 <adz--4_2qAs7lkTu@QCOM-aGQu4IUr3Y>
 <d671229f-1c9f-470f-b1d1-7d015c0721e8@kernel.org>
 <ad2WsFuUjtcjZ1wU@QCOM-aGQu4IUr3Y>
 <27f57fd6-71cc-4f88-9d8f-6c6fc778008a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27f57fd6-71cc-4f88-9d8f-6c6fc778008a@kernel.org>
X-Proofpoint-ORIG-GUID: Xi3j51K0K45MelF1BG01a75UTphaiKkR
X-Proofpoint-GUID: Xi3j51K0K45MelF1BG01a75UTphaiKkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MyBTYWx0ZWRfX/TL0ptP3zcfM
 w+jYhUU967RcDIgMP70s8bNyjr2laf11657pVlK1czS4uCjAgbLvB76J6UOiUTylJtFnvGDQ/Nq
 dAugtutfKJBCYUaHpyH6IjY/scLY5p8tmOldCEn3ccH0hqTnhahkujUgS7xrKPg+s8ubL5mSmAT
 D7eg3nyk2HH68N7rPlW5hA4KjuY+Y9TetBZEGEpcC82v+zZ8lg67UYzqHdX/s8/SRMg1X/qyKIO
 K8khdJ6PdyHNwA4I1VkSmwMzIZDiJvlbznh9/04L6aCiIoSJuhmrcHdLbWVXZ8L+DZv2+SKTuMt
 fpKlA1nzCtssC3ccyYy6SfSkfGFCYJ6EmC6cxGiTQIyFKWi/XZjR1DIBuB+PBbAfkbIig0bTOvk
 UjHuAI8IYIpcnaFl7+oaDGE7QSNTwHly6mwuFvdGObSSjRuqKkYVYqxlRzDFb8fujfJ3rpjk4fq
 pUzWgN+ZLHB5dPfVTeA==
X-Authority-Analysis: v=2.4 cv=MK9QXsZl c=1 sm=1 tr=0 ts=69dde5e7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=9_fcD9zaCt7FvQwzOaIA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140063
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103053-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[get_maintainer.pl:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8DE493F6573
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 08:23:12AM +0200, Krzysztof Kozlowski wrote:
> On 14/04/2026 03:21, Shawn Guo wrote:
> > On Mon, Apr 13, 2026 at 06:08:49PM +0200, Krzysztof Kozlowski wrote:
> >> On 13/04/2026 16:34, Shawn Guo wrote:
> >>> In short, there will be Nord DTS using the binding coming, and I do not
> >>
> >> Maybe there will, maybe there will not.
> >>
> >>> think posting them at the same time should be a requirement.
> >>
> >> Well, it is a requirement as I explained previously, said that
> >> *multiple* times on the mailing list, documented expectations in
> >> mentioned/linked email threads.
> > 
> > To be honest, I can only read the following from mentioned email
> > threads.
> > 
> >  - Binding and DTS should be organized in separate series per subsystem
> >  - DTS should reference binding series by a lore link
> > 
> 
> The links told explicitly to organize series per subsystem/maintainer.
> Who is the subsystem here?

Rob Herring <robh@kernel.org> appears at the top of get_maintainer.pl
output, so I guess it's DT/Rob?

> > These are what I'm trying to do, and I'm not just posting DTS
> > simultaneously.  I do not really read the requirement of posting
> > binding and DTS using it simultaneously from the email threads.
> > 
> > Taking a step back, even if the requirement is mentioned in an email
> > thread like this one, I'm not sure it's the correct or well received
> > way to define a requirement.  And that might be why you had to keep
> > repeating yourself.
> > 
> >> It's also documented in submitting
> >> patches in DT (although not with that strong wording).
> > 
> > Either I'm blind or reading the wrong document.  I failed to find
> > the requirement of posting binding and DTS using it simultaneously
> > in Documentation/devicetree/bindings/submitting-patches.rst.  Could you
> > point it out explicitly?
> 
> Rule 8.

This one?

  8) If a documented compatible string is not yet matched by the
     driver, the documentation should also include a compatible
     string that is matched by the driver

Are we looking at the same version of the document?  How does that map
to the requirement of posting binding and DTS using it simultaneously we
are debating here?  I'm confused.

Shawn

