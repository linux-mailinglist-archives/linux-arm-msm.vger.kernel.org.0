Return-Path: <linux-arm-msm+bounces-115551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cQy3LwM+RGrGrAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 00:06:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3575C6E848A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 00:06:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NVfAp5uW;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XgFcbP49;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115551-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115551-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A2CC30237EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 22:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853F92F8EB8;
	Tue, 30 Jun 2026 22:06:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47474233958
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 22:06:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857216; cv=none; b=IsLhS4oIHSRezWpJ4SNp9M8/r8fgD3DJM5m1OjQMvVjz4GcS32POMRKFi8cIOmNxseHBoGesXO0YJGWGTukDqI9O15uDaF+E2cx1UMNxt2trj2L2gJJOKaeIqIFnOgJhuPXrXg5IMrStrLrFzx593ZT7LfbCvQYPqLDtQh2+nBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857216; c=relaxed/simple;
	bh=bPmjS8U0NxIg7cECCTKQu1iO+TVTB/Gcx7a2B9qaX6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oI4vV2ei2AUR8yH4AoQCWXkSmKdyrvlMp4RldsJf2ZDdDBjW646DqYoG7af4iNbWFQRUblmnZdvU43h3ClqzbZmK6becqLj4xbgSNg2q1GJkQ5cQCfHmddcub6jEQSOwFgW3OFA9gIjnQ7FmeLJuHWfR836WmpRSNAYx5htUPds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVfAp5uW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgFcbP49; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDWVe2942511
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 22:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hXqSMDX8gPxyQepEcBnPOLAsLWVqKDMmaibnp6SQmw=; b=NVfAp5uWKm3FKrG+
	BwdDgAEvVOmKSGAyK6eeME0IE2UuLSOt+vy/wzpMEr2YyD6DMNxmIvWDmhpHOA9/
	cS6o9Z4HfC7mEZAY3ts22ZKf84vkBFVuMu9uwOndxb5uvrl2hmc+i5toe0I93qdj
	oi7cpn+JCpRTRLFsG/x0h1zx527XlzAaVyImOtyqHE6cojqPWUXc2Ig5ThODqLCg
	ggoEEUAr9WZ35p9ot4CCHH+HrYcH+gKqaxSLwQNvmF6fmyzvzALVaqMgfn3mdG75
	monWbHNnMpKf70b5OI2BqFynhwL8IofyihftKBKs0Uwqi2/52JK7cTHGu0chINTE
	+bLM6g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j99h4k7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 22:06:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c42d96713so3633050eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 15:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782857214; x=1783462014; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6hXqSMDX8gPxyQepEcBnPOLAsLWVqKDMmaibnp6SQmw=;
        b=XgFcbP49v1v16npv/6vySs6BG14lmKiQ6mNXNendZS7B4ZGa8SXYTOpcDlUfMsmg40
         kj1XciE60QKxFZFuzXO34WcmrxOMw6/d7+XX0MS9BCBN1gWN1m7GhCVnQJDf8M4Iss4o
         Rlczw0GnLKmEqG3J2f9raCFCyeLJdz+ihB/QtIdJmBt9lkGHyBtEIn+/xjR0DqSvTuJO
         aoeqqJqVnC16iv21V4y4ifhAZR7jEfdTaP7h80k0lOdPQ2uNqW06qjLgRY6o970VciIp
         nEmAKb3dEovOC6M44gmkiCn/P6sDRNAUhu7fSGJj3SryBV8F23ntwBcMn9UJGPOmbj1/
         ZaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857214; x=1783462014;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6hXqSMDX8gPxyQepEcBnPOLAsLWVqKDMmaibnp6SQmw=;
        b=LpqCdHDUel/cc4nSVHGnqd1X8ZPOLlnUJKfUwn9Wuo9s96S05ecIviahqR/i0crFbm
         e7FGlkFvT12E0Y4Ux9wClw88jCfhu7fon2CTKJg43WE0tH17LeGBe0SedXMCOUZKwNXw
         OzCK/mcDwGkoWOzwskRvGdxu1DcBhkv+jCxnQN94veg6CVQEDTYzd9tMYc0RCtISi4zC
         Wy63CbLEw+SuesrrmgD6772w1rM1cKM7UD79DzqbOxvbxduZdwM3h058UnHX1wHbVxir
         S0Ip47xYOmmamECOYTSsH6nq6sX2SdG4XM7NJLHhkVCllapFHyVCV8gi186dZGG3MqbY
         5VWA==
X-Forwarded-Encrypted: i=1; AHgh+RoM2rfb881DdBZrfD4DcggU/GzNBnynCwzizRDm88i02IbcRM2zmob6IMS5A47xOj/cavRKGKClmdG2jqmc@vger.kernel.org
X-Gm-Message-State: AOJu0YxCFGnkNyEtQJQsrNEisEPXp2NDaB3E4G5h9AeO6VCWegLGmn3/
	RrGiQTMbSd0ANfysp17GYTXgOhWvWgkgq/bmyJcvaSj4J5CQrX5wPXgSnwaPxQDB6eXaz61fLqb
	yTmQDR2XYrWm8zs2I9kLXlYqPiyvVEU8rlXeJbCLH5dpY7LaqMEwdPw7iosQRGtoqEm65
X-Gm-Gg: AfdE7ckyU1JTWWsuyUSYCotwkCCCyUAVHTP0/mAD2jyVJNMF8Sb8Fup3JNj0YS1KtXE
	bG3JUoE8VZb8CZ5KyG2jUEHCh7O6ASSkZYAnkHkZVrii6b7NAY0pktYDmVqk905tOlkKP6FUils
	EjELh0tJgdWTpJvIt1Uc/QBseC1gNxj7q0obkgFhurnODC4UuIXVy3VlhnVwV/dn4rqlzDTxmzq
	EybLvmCiK0qiHQUURHwy7Cg4uexV38R0HyNx+QqYegmoQvYWwoUGBxLVJh/xxm9IgGaiYazpIua
	j5uytRkwUx9y3C+Ts9tF43l+nDiDIF6xNnAjffJn3HTP5ugniJZni0nLH5+nkTAbb5RIMIrKT0o
	mI7hzDfPH7+rZhH5OfMP1AH6u2loNYTtz225qvO1a
X-Received: by 2002:a05:7300:5b9f:b0:30c:6a50:3805 with SMTP id 5a478bee46e88-30ee1410f6bmr4257884eec.28.1782857213758;
        Tue, 30 Jun 2026 15:06:53 -0700 (PDT)
X-Received: by 2002:a05:7300:5b9f:b0:30c:6a50:3805 with SMTP id 5a478bee46e88-30ee1410f6bmr4257862eec.28.1782857213133;
        Tue, 30 Jun 2026 15:06:53 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2fc21casm11521276eec.10.2026.06.30.15.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 15:06:52 -0700 (PDT)
Date: Wed, 1 Jul 2026 03:36:47 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <x7bfmqz3xq3sglwypqg5qyegb5mh3yaqvqv4dsitjtbemslj3s@dokc74swe26l>
References: <20260420-read-rpmh-v3-v4-0-70c152e6c958@oss.qualcomm.com>
 <20260420-read-rpmh-v3-v4-3-70c152e6c958@oss.qualcomm.com>
 <66f59c2f-f759-44b4-9639-d8845581ae9b@sirena.org.uk>
 <20260428213331.mwnybqlnognnrpfw@hu-kamalw-hyd.qualcomm.com>
 <afE_iAU9xdIzHA9x@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afE_iAU9xdIzHA9x@sirena.co.uk>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIxNSBTYWx0ZWRfX72WtaM0+Fbne
 lGwnlHDzz9wkjUFIcm27sUylTTQiZkvY+CWlU9sTJCKY8P9nTqfQ8PRnX+mXrPtZE5fwhtog3x/
 DSzz8Qkvj3cHpgcyfvKUq7LoNTR4VTk=
X-Proofpoint-ORIG-GUID: yZ1X-7173kl4wBbqo_1avyOz0zN-zkq0
X-Proofpoint-GUID: yZ1X-7173kl4wBbqo_1avyOz0zN-zkq0
X-Authority-Analysis: v=2.4 cv=bNcm5v+Z c=1 sm=1 tr=0 ts=6a443dfe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ZI4zn0xu3ubYp9hJVHMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIxNSBTYWx0ZWRfX+DW0xsKquxnb
 prwIOSUKnMD3Q8ZlOHmcQZVVmK6ux2mDn4ggxB2+H99Y+AG4TyMN+rw/6xzp8YyXsrmhZAUgp8D
 V1iqGJSxBAybshbeVhghVYJvqpxsIvP0ZhKnUYWbFrN+3YIHk/yUIFCupVQBHS06aRhTPa3Ki0y
 yZiXCRoXNpqKnEm3AkFmjuKpijYG2Lzu6TybxxAD22ilLDBzOX07gAwvGPXWJbZRuzUdM2aMODJ
 RPJDAHk2H2njanQNPAK7eMWmc2ZuwhnAQnyh/ABAHRI5v3qbm6wRSyqHETl0zn/f6AetYTwM7o9
 l6MDAh7HbO7xpPuxAwqZ13lTrRaSNkh1yXQuuopceQIPjheoQV/0+Ixw/HTpwChnn5EYRgzsDDF
 mFm4IpopNunhu5AW0UWUFKt73TeTgOt/2XDXjK/GV1y2r6HwyqURN0oN6Gqb8qcbX9warDyAJfo
 DcZBCZ26IvA1JazLnow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300215
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115551-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:lgirdwood@gmail.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3575C6E848A

On Wed, Apr 29, 2026 at 08:15:20AM +0900, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 03:03:31AM +0530, Kamal Wadhwa wrote:
> 
> > To elaborate, till now for all chipsets using RPMH regulator driver, the boot
> > time voltage setting would always be overwritten by `min-microvolts` by the
> > framework. However, i found during the development of this patch that on some
> > chipsets like SM8550, SM8660 etc for one or two rails there exists some
> > misalignments between the bootloader voltage setting and the APPS side min/max
> > voltage limits(subset of RPMH firmware min/max) where the voltage value is
> > set lower or higher from the bootloader side compared to the DT min/max, which
> > caused the regulator registeration failure and all the sibling regulators under
> > the same pmic will also fail to register, even though issue was with only one
> > regulator.
> 
> Why would this cause registration failures?  Bringing the voltage in
> line with the constraints is a perfectly normal and fairly widely used
> operation.

(Very sorry for coming back late on this)
I looked up for some examples of the regulator probe failures i faced during
development of this patch.

It seems that regulator registration failures happen after adding the read
support ONLY if both of the conditions below are true for any regulator.

	1. The [min or max]-microvolts values defined in the device tree didn’t
	   exactly match with any of the  selector voltages supported by the
  	   regulator.
	2. On top of this, if the initial value read is out-of-range of the
	   DT min,max limit.

eg-

For board file(s) /arch/arm64/boot/dts/qcom/sm8550-*.dts, I found
that the voltage set during the boot stage for `vreg_l6n_3p3`
was 3312mV, which didn't match with the max-microvolts of `3304mV`
(which is the max enforced from RPMH firmware) and when i added this new
patch the  regulator registration for L6N failed, and caused the probe to
fail.

Note - This we had fixed by reducing the regulator min-microvolts to 3200mV.

But since these error is getting unmasked only if we added get_voltage_sel()
support, so wanted to check if its ok to print these as errors, and do not
report voltage values out of [min, max] range and avoid the regulator
registration failures?

pleae note that, currently if one regulator registration fails, driver
will not register any other regulator and probe will exit with failure.

Debugging such issues will be simplified if we can know where the mismatch
happened with the error logs, and not have to do repeat testing multiple
times to fix (one-by-one) the firmware side mismatch between the boot and
rpmh firmware voltage values.

Regards,
Kamal

