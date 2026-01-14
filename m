Return-Path: <linux-arm-msm+bounces-89063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C6DD210E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 20:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F7F730167B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 19:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C74434CFD3;
	Wed, 14 Jan 2026 19:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0Gh5tZ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TcP+RH90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3B13491C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 19:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419453; cv=none; b=UIazcSzb8A5Cwa8HUWhx+XRMvzBsOc3gyjHXThq9L4BldF95RXjyGXfwq+Dr8xyPtu+lvDoXneAlpUmM7kt+43QGc39Ln7Aam4WSTmM9j81NN1GJjiiysz2D1PwombJ2UC1rMmIKjkmLPAlWj/dOVS2gbx4YeYK3oANd3cYSdeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419453; c=relaxed/simple;
	bh=5Lzv2Tk+EhNRZEKuiNZ+9OXSRRTMXNhx1o9hOuqCbIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mystmyRDUitSMTREJfAUAgvMTKyMU/elxfYjSqV2tLj8T1Nh8AhrWn/GGIn7U9M24nOMZsTQ1EO9rnJpy9rprwNIiEcsXEP7Ke/Ct35W7HhwWRss0dpw/UsCnjbwacCM4rbrxzWwqJCaeY/qe62IqQ1pBwyFaJWjefhzsBQbFN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0Gh5tZ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TcP+RH90; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EHgx2Y3296690
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 19:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pzjToC7bxlPEMovlmHQv7V+w1bYZSj7+lrr8ySIusVo=; b=f0Gh5tZ32v/7Loh4
	vP7YHCRyPfdQRbp8S6AjYTwNrv4MN+oPtiJ9YaDZH/WygZJU3gQwZR6opHzaLpMd
	j9U/mTC1H2HxTOq+pLJ0gTdsBRQKaMwm7GOPpettMHGyyd8zA6IsdRNhTc8fKUhR
	mtj9R2t5h4/bIV2Q7cIBmMaV/WwcS/2IJc993ixeooJbJ6ylaO/Z1uEzKq13vbBI
	EnnXEw2T3lQQ583qzJuHqu8QghqpYHgRhVzvrWh9awwu4LeQSnQzmpF87fSCZi2K
	SFbzGjHCHFLcploNBZ1Lm/y/tLOs8qdQ4u2nyUdB6oU+V1gG/+/oGpemB4n7plY8
	vjwFEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp8t2t30b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 19:37:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52d3be24cso25992185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 11:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768419450; x=1769024250; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pzjToC7bxlPEMovlmHQv7V+w1bYZSj7+lrr8ySIusVo=;
        b=TcP+RH90z3xtJgdygsJrjU4YvAmDDXnFXrk/qFll/azQ31qoOZNLgSkT6lEchd1rvr
         1y/u/bWP48BYSQd/NB/s1x8i7XYjBlJRdnPwTjFtAxno8zrO3PISi1AgXf3sMw11Sxi9
         7zH0aBt2QrTYQSv2yAIIOIb7lMUbnxR4NdB2+f6Vx99tw/nQtqLWs3iiYBqtRh1p3IjL
         Z0OvGy2+nbqyNx5ivbGXG9u3Wax/Ree6V5s1KPCIRFzmyQH5Fy4pjf86YRFrdzeJdsQT
         61e+3PJtrGPaGVxWGpazwZFLX3kKv95uddcKp3Ugz7R+0U3xFZQDSjPZYStvfK92INgC
         A1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768419450; x=1769024250;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzjToC7bxlPEMovlmHQv7V+w1bYZSj7+lrr8ySIusVo=;
        b=lpTqBXg1YQpeLJ7ko9E+dwaTCH9fOk17XCgPaAPPrcXJl/ZzNsydjvRJHiOZIqPH2G
         M4ChiJx1+WHwKTEMXESya2rrRD58Fbo7/3vh/+TUeYtO6jjzLVVHGloGAF8iCZ+6b2C2
         8ldxIB4B1D7JV9mhM2FjWBkVWl0GbI+pKbJhgGhOyqipI8Upbbdi6HhANIuWrx5L33vy
         lCKEUFe6wD8DJvi2j7qAEEdmP5P7mMSTg4j3lcIxddPS+UW0CH1Q0f3W73R9+RhNt284
         eA5U/4t41Upu7s5tX6mhBypC6oz28eXSbUrCYzXqQ4vUx3cMd/eAhLQpTBjvWlUhidLF
         B61Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5hJs7feVcXfrSUIY/yOpY5kX6uV0oU2palBt13hj/CsU+JAuEHw4AtMypkj9fc+h6rowUyX5mJ5BLK2y8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0rWf+9JgxaAHsH4sHeNDe773lsCRA9wHoKr79Hday8Rpxsk37
	vsAdfICTTskdSXkMBi+4yWYJhc6x9b99Echov/Gd36SkirXgtzZs6LuX4WSlS07u/Dgv0qOoknY
	RbJaw9aZK8TC6mc1Xxwpa5snRKKA/uNSsCNrEMbhLEith7p9HqESf5eOxy0KUFdPXzkrG
X-Gm-Gg: AY/fxX7JRt3m39O/fEQ7/+ramlsmNKopuOQ9tmVDArF34oJBCdM8Ky+9erDV/+Fftpv
	M9Cu7nFlWFNtngNfndvkix3EIuDBSRrpL3Igss4OwKbeKr58W5P/OXLkF/fj9ye7HkC9plbRfqt
	NUQPwtTo5B9kEqgbLCOP5cNMeB06kPjFxH2aBRn5m3FjR/xx3f8A+Aswwwmcm//vBNTgA6W1ad2
	tuxq06s0tgMFi7Z9TS/DuBDXhZT2dGvRCCjnapDam121C/yTOdkhxgaaYZLUgd0IMj+Cm8PndHc
	dqUCw3PU+6KqLCIhAWX1mt76KEQrZQB1yOm2zS9bNkPX8SveS/dLX+VOwez1PKl+LnGVRjf+WBK
	+lt3Sm5A+JlLFJ32oMZeSn+cCLP2Lx9cvED/8pz9FNaWVlgo6yGL0Ms4B0ocxKhfUFDvxNiUxvv
	M+Apr/YhNwZt3xKcWm51L5ZgY=
X-Received: by 2002:a05:620a:1a83:b0:8c3:6f44:46c0 with SMTP id af79cd13be357-8c52fb32ae4mr509415385a.16.1768419449946;
        Wed, 14 Jan 2026 11:37:29 -0800 (PST)
X-Received: by 2002:a05:620a:1a83:b0:8c3:6f44:46c0 with SMTP id af79cd13be357-8c52fb32ae4mr509410985a.16.1768419449413;
        Wed, 14 Jan 2026 11:37:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8a9bddsm55420301fa.25.2026.01.14.11.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 11:37:27 -0800 (PST)
Date: Wed, 14 Jan 2026 21:37:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        trilok.soni@oss.qualcomm.com
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
Message-ID: <7jhqea42453esyx4sv3okowy7jrdcrd4sxjpm4t2snsyi3nfl4@ieja4c4q3jj5>
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
 <7ruiccdm7q5fg2pixmszr3fqvclvymdlkv4x4xbavkaeczrxgc@5l6usxqfi5fe>
 <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <619f20eb-77e4-4250-ba5e-78db741ebbef@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YPaSCBGx c=1 sm=1 tr=0 ts=6967f07a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1I45dW-D_eH1AIk6hwcA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2MiBTYWx0ZWRfXzQhlq4uhVGjl
 dhPJJAjqRv1MxyipVuNDRICHNiY1IkBNwCSazVVQ4XPdV3v59phoXqXT6SJBibVtfZVTC7JFzX7
 5SNN2wwiPjbFjXpxp6RLFsWRX0RaP35KTNEGK14x7sLzMpko9QRK3FXJk/+is+mH6VQEO2v4/Dr
 VbPGpA5aZdMsDGV+U80qzm+jZWsoVDHlPyqVeDJwRkVFttWTnRLnCV8CY1u7vSK6o+uFblJrrXS
 WhStoIgqj+B5Td2cZiZJyPvCiQV4KPuptrh39RCqYT9mr0VnNxaat7D0tZw4Duq+zcH1pab4Qg/
 gG34uCH+8pS5N1q+4KoHT8pTtTXM3DmLbPYY9i7R1WwlcgrCjqcfOdXiT6oAZxksV8IyBAIVIGt
 g8ai91yyuQKwi1kvDBb2e1bLfTPqhL2+e6jqauNHGaFkt4yt6VXfZRcw+6wEkWMsNhRqwBvO6CY
 z6vNxHVRuXKpJGnCEAQ==
X-Proofpoint-GUID: P1r6HxYORB8w8UN4p5uhIWV1dunn1sQt
X-Proofpoint-ORIG-GUID: P1r6HxYORB8w8UN4p5uhIWV1dunn1sQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140162

On Wed, Jan 14, 2026 at 10:04:21AM -0800, Satya Durga Srinivasu Prabhala wrote:
> Hello Dmitry,
> 
> On 1/13/2026 3:25 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 12, 2026 at 10:24:06PM -0800, Satya Durga Srinivasu Prabhala wrote:
> > > The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> > > SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> > > 
> > > On platforms where a vendor SoC driver already exposes widely-consumed
> > > attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> > > the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> > > of a vendor logical ID like "519") and breaks existing userspace consumers.
> > > 
> > > Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> > > prefer SMCCC over a vendor driver can explicitly enable it.
> > NAK, the userspace should not depend on the exact kernel configuration.
> > Consider working with distribution kernels, which would enable this
> > driver anyway.
> As I mentioned in the other replies, vendor interface exists before the
> standard
> interface and user space heavily relies on soc0 already. If not disabling
> the
> SMCCC SOC ID by default. I believe, we should  at-least have a way to make
> sure vendors can disable SMCCC SOC ID by some means or have vendor
> interface takes precedence.

Please correct me if I'm wrong, what do you observe? SMCCC device on
soc0 and qcom_socinfo at soc1?

In such a case the ABI file, Documentation/ABI/testing/sysfs-devices-soc clearly
defines that there might be several different SoC devices (identified by
different drivers, etc). If the userspace depends on qcom_socinfo device
being soc0, then the userspace is broken.

Last, but not least, the soc_id format is documented in the ABI
document. It is clearly allowed to have jep106 format in the soc_id. So,
I think, you have two options: disable SMCCC 1.2+ in the firmware or
adapt the userspace. You can't control e.g. the kernel that will be
running on your platform (it very well can be a standard distro kernel
from Debian, Ubuntu or Fedora, which obviously will have that driver
enabled).

> 
> Best,
> Satya
> > 
> > > This avoids unexpected format changes and keeps the generic SoC sysfs
> > > stable on systems that rely on vendor-specific identification.
> > > 
> > > [1]
> > > Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> > > 
> > > Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> > > ---
> > >   drivers/firmware/smccc/Kconfig | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 

-- 
With best wishes
Dmitry

