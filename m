Return-Path: <linux-arm-msm+bounces-116256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UhU9H7WBR2oqZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:32:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D9700ABE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:32:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VHHhAUvO;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116256-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116256-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 352433038D32
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51F8331EB6;
	Fri,  3 Jul 2026 09:30:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D773B19B1;
	Fri,  3 Jul 2026 09:30:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071050; cv=none; b=cDhKKwJ3UIAL5UQURcZp+fTF3cQNN9DZlQtv/UWQyBkHmIfk+PxP13vUOQTLuMVddvIl/pzK1RibwhEUKco+5TT9KEw2e2U5HHws4mQSJqe9xY3yAmrpsjXKLcNecFNIh1GEXIXW3jdplLcCoZw/dgkWff3Og9JSSM+Q3jcVUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071050; c=relaxed/simple;
	bh=NQHTwQVxKIrakzWEpKeEM1SYUUSYpVwggw3gaJbnz1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzuUWapCyk+aMmV1AwG+J272YVe57LrfUv6kg/XfIxrimqOmzKoq80tkcNYL/nsmBmznRoKWtbMftdkBEGJPzVmrUMWEkyRDUFyAownKvQElmLgxErXOjLjK0RYP2T9juXUTb+1B1yLB36wMCW5kve2i6Ur9g9DIwvAu1g5z0vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHHhAUvO; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6636gvT63144217;
	Fri, 3 Jul 2026 09:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HtDt4B684Zll7dWZtPuSlsvE4KEtQd+E3gb0x3Hoads=; b=VHHhAUvOHcJbwk9S
	VdtNAZwpkTtOQZ1n8fsVa3vS4Omh2F+2LHwYi7A309d+nvDP56dZqmJALhwP0Cgy
	u5ShiCN6mXay/KNlcx8IIUygqXEu1ZoUjCCfgIq5q37Q1CZDfGcsnJHmzLci3T2C
	hcLSzDRIu5LGAAvmpQw91KT5yqgMZt4l5nfImJzCaRhLfMQ6vb3RWDiiQ36HPi1/
	iBEnVXSkCXY+r2d+d1uhWdUtVbs71WH2nM74q7PN1sAnl7QHB3g2l0oDVv+Wyrnc
	xyN7w+rIJAbfQnAESxqae7mawcwHue6er+CGil1c0N1rVeIv7wsDcdHW7aa9/NKq
	3BIO6A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682brm4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 09:30:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6639UaHB009558;
	Fri, 3 Jul 2026 09:30:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27km9y91-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 09:30:36 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6639JWPk027666;
	Fri, 3 Jul 2026 09:30:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 6639UaBY009530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 09:30:36 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 6421AB44; Fri,  3 Jul 2026 15:00:35 +0530 (+0530)
Date: Fri, 3 Jul 2026 15:00:35 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <20260703093035.q5xgljuigpt6zqt6@hu-kotarake-hyd.qualcomm.com>
References: <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
 <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
 <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
 <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
 <33c74e59-076a-4877-9e62-83a8ebbf2d54@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33c74e59-076a-4877-9e62-83a8ebbf2d54@oss.qualcomm.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5MCBTYWx0ZWRfX1RCRlVqMFoHs
 8DI2LoZaHoyPV4GgiqzyjFkkd8HeWPu6jWkCi+4l9pqLBycFxGKY5bUgpQksvIdHRoNuhbVsAkJ
 Cptv7EbOaEaBsqFUGjDy4jme9wW3SbfQoatOJrVQa5ILV0nl5U5CQvadP9Yb2dhKj0TlkfnJuiY
 BhIPyU6CJB6pU9IMPbbcXgwcRMsu9injecq7aZewJ0qfAGYsVbGCqAfAEELQERTEvJHlJwyV0zm
 4F6EBFb3164Vr9Rjf5PcDQWLK9+4rJQt0u3sbkci/Qwe6Bl8wVVGofuM0M/eEPxqzW4EoBUVea6
 UyAuosulVH6ti9PWBVxLmEYdsusIf/en+nuSnryaMyqiBiZMX9LabfxiBLBXrFA1lGy1EX0fzSi
 GumJNNoPCD98fGq5jGwO3Cv6hCdOPiA9gum35ZNxhX4LtfZ8v/O4Q+jnmHprcTg7nWvo10bBP+/
 0pWsSBWipI2ZRDcu+pA==
X-Proofpoint-ORIG-GUID: ez2J7FFhHf4E_2oBIynbM1_VHp0onUF9
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a478141 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=P18A6JamkcG4dG8q4dYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5MCBTYWx0ZWRfX2gcQ9+nr4+y7
 WlTS8wkDs3NV8mxo+ciHJ3HWf8+nDxIWl2ehuHjwi7EeuNEf2MVFD8J92MNloq+Cqb9KJGzasdl
 QOZJgmFcCE1OVwMu0FhFfluGSN7WRsQ=
X-Proofpoint-GUID: ez2J7FFhHf4E_2oBIynbM1_VHp0onUF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116256-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:komal.bajaj@oss.qualcomm.com,m:robh@kernel.org,m:linux-phy@lists.infradead.org,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:olteanv@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,hu-kotarake-hyd.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E4D9700ABE

On Tue, Jun 30, 2026 at 03:50:16PM +0200, Konrad Dybcio wrote:
> On 6/30/26 2:42 PM, Rakesh Kota wrote:
> > On Sun, Jun 28, 2026 at 03:33:23PM +0300, Dmitry Baryshkov wrote:
> >> On Thu, Jun 25, 2026 at 09:11:19PM +0530, Kamal Wadhwa wrote:
> >>> On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> >>>> On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> >>>> <kamal.wadhwa@oss.qualcomm.com> wrote:
> >>>>>
> >>>>> On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> >>>>>> On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> >>>>>>> On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> >>>>>>>> On 13/05/2026 17:29, Rakesh Kota wrote:
> >>>>>>>>> On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> >>>>>>>>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >>>>>>>>>>> - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> >>>>>>>>>>> - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> >>>>>>>>>>> --
> >>>>>>>>>>>> +
> >>>>>>>>>>>> +         pm4125_s2: s2 {
> >>>>>>>>>>>> +                 regulator-min-microvolt = <1000000>;
> >>>>>>>>>>>> +                 regulator-max-microvolt = <1200000>;
> >>>>>>>>>>>> +         };
> >>>>>>>>>>>
> >>>>>>>>>>> Do these regulators need to explicitly define their input supply dependencies
> >>>>>>>>>>> such as vdd_s2-supply?
> >>>>>>>>>>>
> >>>>>>>>>>> Without these properties, the regulator framework might be unaware that the
> >>>>>>>>>>> PMIC regulators draw power from upstream supplies.
> >>>>>>>>>>>
> >>>>>>>>>>> If the kernel dynamically manages the upstream supply and its reference count
> >>>>>>>>>>> drops to zero, could it be disabled, causing an unexpected power loss for
> >>>>>>>>>>> downstream components?
> >>>>>>>>>>
> >>>>>>>>>> And this is a correct comment. Please provide missing supplies.
> >>>>>>>>>>
> >>>>>>>>> As per the Qualcomm system design, the parent-child supply relationship
> >>>>>>>>> is managed by the RPM firmware, not the Linux regulator framework. The
> >>>>>>>>> RPM ensures the parent supply is never disabled until all subsystem
> >>>>>>>>> votes are cleared.
> >>>>>>>>
> >>>>>>>> How is this different from other, previous platforms?
> >>>>>>>
> >>>>>>> This is not different. In the previous platforms too this is taken care from the
> >>>>>>> RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> >>>>>>> is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> >>>>>>> may have a RPM/RPMH regulator as a parent.
> >>>>>>>
> >>>>>>> Even on those previous targets the parent rail of all RPM/RPMH regulators are
> >>>>>>> internally voted by RPM/RPMH FW at proper voltage with required headroom
> >>>>>>> calculated based on the active child rails. This was done for all the
> >>>>>>> subsystems (including APPS) regulators.
> >>>>>>>
> >>>>>>> So no explicit handling from the APPS is required for parent supply.
> >>>>>>
> >>>>>> You are explaining the driver behaviour. But the question is about the
> >>>>>> hardware description. If there is no difference, please add necessary
> >>>>>> supplies back.
> >>>>>
> >>>>> I understand your concern about descibing the parent-child relation in the
> >>>>> devicetree, and given that we have been almost always followed this for all
> >>>>> the previous targets, it will expected of us to add them.
> >>>>
> >>>> Yes.
> >>>>
> >>>>>
> >>>>> However, we want to avoid the unnecessary access to the parent from APPS.
> >>>>
> >>>> Why? What is the reason? Do we want to do the same for all the
> >>>> platforms? Only for Shikra? Something else?
> >>>>
> >>>>> At the moment, I do not see a way to avoid that, if we add the parent
> >>>>> regulators.
> >>>>
> >>>> That depend on the answer to the previous question. In the end, we can
> >>>> make the driver ignore the parents by removing them from the regulator
> >>>> desc.
> >>>
> >>> Ok, this seems like a good suggestion, so you mean its ok if we define the
> >>> regulator desc's supply column with NULL? And only keep that in the DT?
> >>>
> >>> you mean like this?
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453
> >>>
> >>> (please let me know if i got that right. thanks)
> >>
> >> Yes. Don't forget to explain in the commit message, why you are doing
> >> so.
> > 
> > Currently, Agatti uses the same PMIC, so we cannot set the driver
> > supply name reference to NULL. Since it's an older target,
> > we'll need to run a regression before making any driver-level changes.
> > 
> > Additionally, the child-to-parent regulator ganging differs between
> > Shikra and Agatti:
> > 
> >  - On Agatti, l3 regulator is ganged with vdd_l13_l14_l15_l16
> >  - On Shikra, l3 is ganged with vdd_l2_l3
> 
> Is it configurable on the PMIC level? I was under the impression the
> supply maps are fixed in hardware.  Is there a chance the agatti
> description is just wrong?

The supply ganging between child LDOs and parent supplies is not fixed
at the PMIC hardware level — it varies per platform based on system
design requirements. The same LDO can have a different parent supply on
different SoCs.

I have verified the Agatti parent-child supply mappings and they are
correct. The difference between Agatti and Shikra is a legitimate
platform-level design difference, not an error in the Agatti DT.

regards
Rakesh Kota


