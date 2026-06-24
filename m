Return-Path: <linux-arm-msm+bounces-114428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7y+gLYlXPGq4mwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 00:17:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 504DE6C1B51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 00:17:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HezL6rWZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UolSCkNa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114428-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114428-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7486E305CA3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 22:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617F632A3FE;
	Wed, 24 Jun 2026 22:16:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B413242D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 22:16:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782339409; cv=none; b=pfjqPigP/qSzGdFRs4TZorRRuAcPCUcoi4akI4OpRq6a6QRJQHCNl0kLSbM+PM7kIspSPfQ8W7VOzoeRzpHjkP6dvH4VDlhiuSpuUkyXtAoJVcdoCdtrIv9U8xBIJTLa0gk1G84raIPZ46ljLNmG+txjr0BpF9qm8BTxtN0/Tsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782339409; c=relaxed/simple;
	bh=3ZY9NmvCRi89LvyUAPLGxHHPt6f5rWr3GMrM+su+Osc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hyc+DRDJPV/3PiN81dFnP+Qdge2sS0YJ+AmAsjZC2fgJ0LJc7lirtx4dtm1UKaKwKbMya2XlNx8Kz9x01wQIeRuF9uPu8HqDM+TZUdjsIY8Ujt7DFbYWKAXlUw54eE00mebT4KOjdnt0aY2R7tcdqMj5tItF24j8uMonU7aNAdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HezL6rWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UolSCkNa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OLrIvj196379
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 22:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W9RmnNz+MWuT0a4Pzk3YY3c8
	e9tUr4RYQGfaW05AlWc=; b=HezL6rWZZYiHalnSnwOELO70gEf8qHv4kQE2mQi8
	5NP0OupDLTK9p942M6gs25fjZHWx+8ki0cvkyuWukCvzPCCg/e4Lie4S2YzYk3MZ
	EVlchSfBsu40ieDMsXOrAinuem4uU7tOx470a48HxL57vdHpQHRSA0JVcg+8fZNF
	7fR0Ef056e/CYgrWSQMmbrhBEk4waMCRS99WF4pFgujJjri2lh5gvy7CXBiDj/x5
	G4MQ0aV1qPNhGqDysyrHq6D/RcouLKFIRNg0fuNHpqHML4wWkMOpQ+gaKn64LJRt
	QMA+ciY6d706RvedPfqxbLWW2IJteci0W5l33o5UX9Mv8g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq3cs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 22:16:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c03c1dda3so457062eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 15:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782339406; x=1782944206; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9RmnNz+MWuT0a4Pzk3YY3c8e9tUr4RYQGfaW05AlWc=;
        b=UolSCkNagZYlwMwF6HgnvGTY9OCJJplaiKQPeeSpjrlySjq30DaHxu4D0kD1kHeGTR
         97cVrA1Qx51ZePsinL8HTKzVdPewUAXAnPFD9HaOslA3ibyU9F2Sz+cHbMgWw4hn0pPY
         NVPgQfRHz8sTvAQ+T1TH2woDm0I3Rmh+ee9xaLjI0hp4/1QxGgtlXmYrUsawXVQXFCL5
         ZuFdkIttRCM48VqQ4d2y9DvxJpV0alOOcreO95qeHjjP6kHaHWmdPyOgj8YSmkDZkb4T
         HYlyqKoPn64nEpXHayzA5/cZhZuOJEUICFZDBwnD//IcmfcK3QJq7VbzqRCqyYtNdwX7
         ZVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782339406; x=1782944206;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9RmnNz+MWuT0a4Pzk3YY3c8e9tUr4RYQGfaW05AlWc=;
        b=ENrfre1RkaW5VnjTptA+gbKSesXTyEuVAdxpeBYFG9L2plk1fdAllF2slbJkCAmp4+
         +zDUCmNJhywrbG+uZ5mB0IEtvG6/S//FpHqxWukN15gWAcUA+xtQ5d+cj7H1E20wFYdm
         flG/J/I2auNML0Emuqp4DKLYNPUdVW45O9pi+urMmtG5mi6srpRY66ekfNtVaL6GwoTd
         Z64ynaro0S1kQ7fX6uVAJ4FkHLPjwzhZbtYXL3xJHKJNh6lf6Czri4ntDdURlik2anws
         ju3BlpQGH2ctDQD0BoB/cWOf99Ij4wRFBA/MipuQ79oqtLBzXKshGzu4lbyC+ml610jL
         gSIg==
X-Forwarded-Encrypted: i=1; AHgh+RqMBXqAoKO6+Oyc+3/aUGKjC6B4tpVxXpOf2lHjEo/OoT7xCy2J+yHJnafbHFP3c/ycccGTqjTMxwrX3B2K@vger.kernel.org
X-Gm-Message-State: AOJu0YwXfFoMxlJZJm9AaZINOzWOV0QxM23ss8tzj3rKMU89SlgUu2ZI
	SGPURk6QtQzHtCGwPGUXaBxOJW4xnM6ma9uMd2K0mbELiiqyC1pOrRp3DjbvJsM5oLSeUXEtonp
	Zrdp45CoDyJ8CmHCdf1O33KLa0RMeTsM8afQn4f4GleHg1vwyFHfd0Brf+gAQtl8QSO8I
X-Gm-Gg: AfdE7cn3RJYgE7hqqxEjOSDNJyflbDnFquD2vVtStGEv/ltyJ3Crk3+OTVLchvhXEKc
	wtSIm7iObf4LQ199jX5bs4Ujms3pVmrWujzE3B3SK2Ck5B89AzF0PEkE8854gUdAGpVzGQV6UJm
	R9Fm/dUTnxigUCLZPs2tYia2QPWQcH05fEyb0rsgW6CKBOt0oy0gWlAtWD1xwQybZkmBrIc5I4e
	ihFOGSieYts9/LOaPJ67WDpYnaCtOi/jof7eDSQNdyFdNIfc9rfhQ+4OaLqzrYRtldBm6DlwcdM
	ehe01FAWstwF29nPUMEBcisMtbXZgoEVXgmS2xFtFBxpcDCZ2y6K4GvYMWoTpIl0W/WXSc72W/B
	rE8k1CUy6fA8xor3S/woPG28G/Kpuws2Lf1Ao9TPd
X-Received: by 2002:a05:7300:1895:b0:30c:5f53:f38b with SMTP id 5a478bee46e88-30c84b86801mr82903eec.9.1782339405643;
        Wed, 24 Jun 2026 15:16:45 -0700 (PDT)
X-Received: by 2002:a05:7300:1895:b0:30c:5f53:f38b with SMTP id 5a478bee46e88-30c84b86801mr82863eec.9.1782339405110;
        Wed, 24 Jun 2026 15:16:45 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4ca208sm1949748eec.3.2026.06.24.15.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 15:16:44 -0700 (PDT)
Date: Thu, 25 Jun 2026 03:46:37 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Saikiran <bjsaikiran@gmail.com>, broonie@kernel.org,
        monish.chunara@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        lgirdwood@gmail.com, andersson@kernel.org, konrad.dybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
Message-ID: <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE4NiBTYWx0ZWRfX/zojrKWugPGN
 1ZpfhH4bcRs4B3YVu0wUZIKoSHiCVDr+yX4A/4nwjxT3xLRzfzCy7vvOdGhC40GTKE9lS+ziMFv
 Y5SIvXDu0B+w6F7eJDgpas3cEq+vVeE=
X-Proofpoint-GUID: ejWD3ZFV1PLO3rhWLX-NAxsiBN3CsF2m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE4NiBTYWx0ZWRfX/PMPkXvweMi/
 KB5c7PFUWFHFDuVoEX+Y5Y0fVxpgSp8DTYJoStQOAsY9KI7EhyPEgS18Rjff+jBeisk7wDCBG9r
 dx6EZnpkUXMVmsNpEEEajBtcZMffQWPN4RMUIUMgiAFXTQLYHXgpBbKQLnEtE0DbC5BoB5xx5rQ
 aJaEdv6uLg/AZr3vwCGOlIFRe6VqZN2Nyk0Fi2R+xyBF1/vG2+ubbCToVuEXRa7qQkna7xyhXRu
 no+wHYTc4Ojeoi1x2ahHiDj42+Ak5FnTbseDzCjh0YTP1Es5KJfRJDTT0vdKsaK/JX+xPkRZQad
 pd4LY1zLjwL2DHPz63eraVtF9yLXK/GuXvmCOFqfvCMXVvJpRleouhECksLGE34tkb5WC9fDWea
 JhkllE1+/Snb6DNrDbTbXWx+Y4T+/A==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3c574e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=axg2tsYLhavgZJfYiDEA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: ejWD3ZFV1PLO3rhWLX-NAxsiBN3CsF2m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114428-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:bjsaikiran@gmail.com,m:broonie@kernel.org,m:monish.chunara@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:lgirdwood@gmail.com,m:andersson@kernel.org,m:konrad.dybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ddox6mw3uhmy:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamal.wadhwa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 504DE6C1B51

On Tue, Jun 16, 2026 at 01:48:50PM +0200, Konrad Dybcio wrote:
> On 5/15/26 1:16 PM, Kamal Wadhwa wrote:
> > On Wed, Jan 28, 2026 at 12:32:09AM +0530, Saikiran wrote:
> >> This series adds support for the standard `regulator-off-on-delay-us`
> >> property to the Qualcomm RPMh regulator driver and updates the
> >> corresponding Device Tree bindings.
> >>
> >> Motivation:
> >> On the Lenovo Yoga Slim 7x (Snapdragon X Elite), the camera regulators
> >> (LDO1, LDO3, LDO7) have large bulk capacitors and rely on passive discharge.
> >> When these regulators are disabled, the voltage decays very slowly. If
> >> re-enabled too quickly, the sensor experiences a brownout and fails to
> >> initialize.
> >>
> >> Verification:
> >> I verified that the core `drivers/regulator/of_regulator.c` does not
> >> currently parse `regulator-off-on-delay-us` in `of_get_regulation_constraints()`.
> >> Therefore, the driver must parse this property explicitly and populate
> >> `rdesc->off_on_delay` so the regulator core can enforce the constraint.
> >>
> >> Changes in v3:
> >> - Added Patch 1/2: Update DT bindings to allow `regulator-off-on-delay-us`
> >>   for `qcom,rpmh-regulator` (Requested by Mark Brown).
> >> - Updated Patch 2/2: Refined commit message to explicitly mention the
> >>   passive discharge and bulk capacitor mechanism on the Yoga Slim 7x
> >>   (Requested by Mark Brown).
> >>
> >> Changes in v2:
> >> - Moved the motivation/context from the cover letter into the commit
> >>   message of the driver patch.
> >>
> >> Saikiran (2):
> >>   dt-bindings: regulator: qcom,rpmh: Allow regulator-off-on-delay-us
> >>   regulator: qcom-rpmh: Add support for regulator-off-on-delay-us
> > 
> > Hi Mark, Bjorn, Konrad and all,
> > 
> > We have another UFS issue on QCS8300 RB4 EVK, where it seems this patch is
> > helping.
> > 
> > Issue is seen 2/10 reboots and it happens in the UFS probe defer path:
> > 
> > 1. UFS probe takes regulator handle for VCC(vreg_l8a) of UFS host controller.
> > 2. UFS probe enables the regulator
> > 3. UFS probe defers (due to some other dependency un-related to regulator)
> > 4. UFS regulator disabled on probe exit
> > 5. UFS re-attempts probe and re-enables the regulator
> > 6. UFS init sequence runs -> UFS NOP OUT command failed (no shell) 
> > 
> > Issue Log:
> > 
> > [    6.583836] ufshcd-qcom 1d84000.ufs: ufshcd_verify_dev_init: NOP OUT failed -11
> > [    6.592780] ufshcd-qcom 1d84000.ufs: ufshcd_async_scan failed: -11
> > 
> > NOTE
> > - Issue is not seen in first probe attempt, because UFS regulators are left ON
> >   from bootloader, which gives enough time between rail turn ON and UFS init
> >   sequence start.  However in issue case, it seems re-probe is happening too
> >   fast, which causes init sequence to fail and UFS brownouts (similar to camera
> >   sensor case)
> > 
> > - Also, we compared this board with other RBxx EVK boards for UFS rail, it
> >   seems that this board has more caps on the VCC regulator, as the board is
> >   designed to have both EMMC and UFS, and we have DT option to pick one of them.
> > 
> >   So for EMMC those extra caps were added and they are impacting rampup on VCC.
> > 
> > Since this is not entirely a UFS part issue, but a board design constraint, it
> > seems better if we handle this in the regulator side itself, as adding it in the
> > UFS driver may not be acceptable from UFS reviewers.
> > 
> > Please share your opinion, if this seems to be good reason to accept this patch?
> 
> Is that board in production already, or is that something that can be fixed?

yes, it cannot be fixed in HW, as the board is already in production.

> 
> Konrad

