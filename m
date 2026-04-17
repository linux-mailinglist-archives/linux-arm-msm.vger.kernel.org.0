Return-Path: <linux-arm-msm+bounces-103572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDWJF2q74mmA9gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:59:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 570EA41EF99
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 00:59:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11C7A301076D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 22:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD8F31B824;
	Fri, 17 Apr 2026 22:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ws9CoaGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MwuA/eqn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93B1FF7C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466787; cv=none; b=Y7PMAoPf1p1R427BQiF1uXFuZgOvrVByznIKbm77n+fjLvfJGmnNhegUNCHT0mSGfONbIWvvhVL6+sbrIHZE9GnSMCfXN0e7ZaD0Hb7L6l5vwHxqpo+KXKC9tj9XRcxNV8vZ/w8VFr+4gQOP3u9cxmoJehhlRnBCl5Zo6hgK3D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466787; c=relaxed/simple;
	bh=W2vu+wWa7FhEaWUczj7jhaQAaK3OuLl4TCLhYezaaBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxOAuIFCk1mgv8A+XrXZgHNS34+CNZYoIUpsstE4wCSLCTOU6BAqEvOmD2ynaiYM+QvsHlTYmOOWtLdlo82Kwf/rrj4WH9ox9ZouIxM3uvYFO9ZJrd/uB95IWXq6XUWUkqYM+7cMTp1YmJT2HHHDcJXidsWSI8DUYUMCNQ6Jg6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ws9CoaGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MwuA/eqn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG4Zcc455099
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L9PPIQqgp2Hc2zVsQ7GgXSx6
	q9OZ5+ngS6Jbh8Vl1wY=; b=Ws9CoaGAQl2VCSbB1SEKvMIWZEmZwTGQFzKR0zoo
	5EN1dM9C4j5u9xqdZ6Zy+tX68L2Fy5M+4DQq4td6DDlMqFV5CM5/kBDR0SEWvbSM
	5Vy31V6xFp3g5O4CKaOEBatjwKfzfZplo7tn2bNC2nz1Wu/KPe1xv8QIqUbgX4JL
	afCIYCxCrqqiV6sN5x5zI7/nCOMP8n0OkuWNKzdetn8oitjQQP3Iden/bbV7HQEO
	07x14YGGf6ANtShm12v2vJ/NJ0UQfjVe7KwKCdJ296g7zrWRluERj2fehdnWOrQC
	AanIDvoVXoo2KA3kf+SvqGfu5VbHWAa2Rd7YGT2GC7gILA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkg88u1rf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 22:59:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4031b86dso26655731cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776466784; x=1777071584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L9PPIQqgp2Hc2zVsQ7GgXSx6q9OZ5+ngS6Jbh8Vl1wY=;
        b=MwuA/eqnDj/w+MiCeLvUTpAsQZtCLWyfdc5+RURcFojxLJqosdqusyl3qKmwbJFV/F
         GzMEYs4tjyl7i/cpXnv5tMmU3FzliZGXFqeKTv89EIx9kxbV5HUbmhVR0TaMjm0EWyIv
         CBUdZIb9uZpaHgIHAWgMjcJ79s8sslOVKE5VO3E1QKAWYcY3SrBWcT6AUF/IHZJA076b
         pPhZbHtFF2d8E3Z6QAP3ZQuneIvLwt60axqqv1CS8Z/fg/xrsG4fVf/Il4dd1JGprKwj
         RNwh9SJ97zN4BtguNP9NmvHZTaRjMHdyVp/vmnufRPfXNX3kdfEHrXqURKocDKmGFcTp
         YAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776466784; x=1777071584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9PPIQqgp2Hc2zVsQ7GgXSx6q9OZ5+ngS6Jbh8Vl1wY=;
        b=l5htcCmx6A1s2iwiqRSBoR3vTd1jXtt0tPj07+c54BdxeOOVaGnBsIwoPfq3fTsnkb
         TFoFkMi1ouvVY+k5/FaY+iCAoUZ3b1Jue1/Q37kbYMKqbtFJ9RaNmM7urU7XgfSPXjzg
         JDw576K/EAqd/3UngloK5LGoPtBHML0Vn1XZDCfKXbtIuUbh3TZxZFIN2nc9CjCFrwod
         cwZvhYeVMvONv32s+byKn6gj4F5A7BclEsNilfLcYyCZ4hKxSn36wxXp30gKZRZ1PkwF
         /DK2TcHrH6jurmtwbfb2RML7IgOghgMNhjMacnH3O++8yUB4Yi+wbW7BEnzbu/fdNCz/
         d67A==
X-Forwarded-Encrypted: i=1; AFNElJ/BRXUEfishG/bmA/NAGtsQt+CKvwxxDhzyrml5LVhcNVvXiVhY+f8T2z6axjL39nJXkhxdoF1Sgce7YG2f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jZzsJ0F8HzQQgR0PuN2VovLTnnoHK7DWuMgf8J4zQG6t/OLa
	hm+IjaeBKJygZlQJWdlSnZJpifr6sVAcaWxJCsDBq/g0Bz9o9sKYLhJOwqPO+OHyWxi+JKJqtyX
	VxID1jmzTSBBzdqa5Bg/0WNcxmcO3/3vyXXNhWGXkxxhwD6gRDDK9/pfOegtMEaE0XA+i
X-Gm-Gg: AeBDieuxht4mopj7q4qSduQeHfmAOiaFCskNaceoZL2gnR0eto5ME0HOPM6Z7YfaeuC
	UTIZ4unrMfhNM53GkmFPffG7hRReVqr6HZk/8x5J/CDOxQwdJI7kJrDTfNjFHpG0FNLvCw2loD4
	VbBlgfrM7+bHADZUJuHpekU31VfqkA0aqp/QmOATaIVWvm1mYzy0C5B/i34jGFZ6nIRRJlu/WH+
	Lfj08ABQnxKyLbTX3SiO0L6a2ur611tFow0Kwc7lVCQAULxSKz2IXzCRuiV+euNVlm2shQ9HE57
	wCyKhdlu7/TmJg7f/fVcs/9Xi7EuhkL5KG3ZHNex4xyhcgTKxMvLopGNYYtXz3L0GQAJNDgfCd6
	WCQ+gtjU4ky1cXeJyTGKPJmneDLyxqlQrq4jl0SEUNC//qgrxKrr82DYdEqahsW4H3tSHnsC/1x
	aLL/L7YN+hRlhn7jvwqFgTmNy4maNeqXkT3LgTK6GVkdQFrg==
X-Received: by 2002:a05:622a:646:b0:50b:538e:93b1 with SMTP id d75a77b69052e-50e36b3a451mr72941851cf.5.1776466783852;
        Fri, 17 Apr 2026 15:59:43 -0700 (PDT)
X-Received: by 2002:a05:622a:646:b0:50b:538e:93b1 with SMTP id d75a77b69052e-50e36b3a451mr72941511cf.5.1776466783419;
        Fri, 17 Apr 2026 15:59:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e12ebsm776279e87.50.2026.04.17.15.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 15:59:41 -0700 (PDT)
Date: Sat, 18 Apr 2026 01:59:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm UFS and QMP UFS PHY
 drivers as built-in
Message-ID: <dvwh2fwi6xzskicjtr6e7ldzsgf7fsptep4t6p5qzzf274jorc@zo7hl565tu2y>
References: <20260417035509.1021860-1-shengchao.guo@oss.qualcomm.com>
 <898874b3-fb73-4a46-b440-6ea3377c2f2d@kernel.org>
 <aeHxPALfVd7SgtUj@QCOM-aGQu4IUr3Y.na.qualcomm.com>
 <c2d7588a-34c7-42de-b809-0733b03d331f@kernel.org>
 <aeINUiVreq7HFqf-@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeINUiVreq7HFqf-@QCOM-aGQu4IUr3Y>
X-Proofpoint-ORIG-GUID: HJgOcCtBj-d1_kEIpLih8ZUL_1DK92c2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMCBTYWx0ZWRfX/IA74T4wl2B4
 5yPm7m43wV9zGyr4LFJAPaIbL1nEYjVhVqfSfZllKrXxHlcz8X5Q6eWQr5snlJwYTGZ+0jWe6rB
 9ySAsDMxKHKktZQX7+vKhx7eKX8rnpKmu/EzeCAhHDoZVCWLrBunfMiKp3aHdBx1+y/eXorjPU0
 8QIMPz3TFvWqr/6PdrLbCpVRRI/u+A6bzfkgXR3Omh/JfQZas8b6/CqbsvfIceq5R1pO4PNIuI9
 6LKC/mqC/5f+w83Vygf95440HAncrxZO/CZvDrj7ZOy2umg8vYRELPYDCrCY6QP2GLoPEdDE++2
 IFs2s4ZFO/Iwoggc/YzIReheh2qn6nhSWzaxOg1FIRqg6u6lUhy/g4o+7g8X+N+l4+JZtq8X1Aw
 yxqT6LkvCqbrxNKAWxJPvnCK6g9uAk0HNqMolbG1kLduk7GUHM4CS7/ns5VHifpGlLi1aDa0h1+
 fTZaqfV+lpi3wiWpJnw==
X-Authority-Analysis: v=2.4 cv=X+Fi7mTe c=1 sm=1 tr=0 ts=69e2bb60 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=dmSXcwRf1r4PAAFJD9UA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: HJgOcCtBj-d1_kEIpLih8ZUL_1DK92c2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170230
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103572-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 570EA41EF99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 06:37:06PM +0800, Shawn Guo wrote:
> On Fri, Apr 17, 2026 at 10:44:20AM +0200, Krzysztof Kozlowski wrote:
> > On 17/04/2026 10:37, Shawn Guo wrote:
> > > On Fri, Apr 17, 2026 at 10:14:23AM +0200, Krzysztof Kozlowski wrote:
> > >> On 17/04/2026 05:55, Shawn Guo wrote:
> > >>> UFS is the primary storage for Linux rootfs across the breadth of
> > >>> Qualcomm development boards - Mobile, Automotive and IoT.  With
> > >>> Qualcomm UFS host controller driver (SCSI_UFS_QCOM) and the UFS PHY
> > >>> driver (PHY_QCOM_QMP_UFS) as modules, developers need an initramfs
> > >>
> > >> Yes, you always need initramfs and every developer has it.
> > >>
> > >>> to boot from UFS, which adds friction to daily development workflows.
> > >>
> > >> No friction, it's both standard, easy and all of Qualcomm and Linaro
> > >> developers have it solved long time ago.
> > > 
> > > I'm looking at a kernel regression by running git bisect, where kernel
> > > version string varies for every single boot.  How do you usually deal
> > > with it by using initramfs?
> > 
> > No difference from every other build and boot? I build kernel and the
> > same step I have initramfs with modules. Whether I bisect or build
> > kernel for normal boot is exactly the same.
> > 
> > The only difference is `git bisect good`.
> 
> So we have to rebuild initramfs for every single bisect.  But isn't
> built-in make it easier and faster for the whole bisect process?

No. Insted you package modules as a separate .cpio.gz archive,
concatenate it with the initramfs and boot the kernel.

> It's especially useful for tasks where we do not even need to make modules,
> like debugging built-in drivers.
> 
> > > If using initramfs is standard and easy, I wonder why Qualcomm QLI
> > > (meta-qcom) kernel has UFS drivers as built-in.
> > 
> > This I don't know. Distros do various things, but of course there might
> > be an argument I do not know (e.g. like it was why distros do not make
> > IPV6 a module).
> 
> We can consult internally, but saving use of initramfs could be part of
> it, I would guess.

Having the meta-qcom hat on:
- If we know that the kernel is going to be used on Qualcomm hardware,
  it makese sense to enable necessary drivers as built-in to save time,
  boot time and to ease overall integration.

- Having the general defconfig, it doesn't make sense to make users of
  all other platforms suffer and loose their memory by having
  Qualcomm-specific drivers loaded, if that's not an absolute
  requirement.

-- 
With best wishes
Dmitry

