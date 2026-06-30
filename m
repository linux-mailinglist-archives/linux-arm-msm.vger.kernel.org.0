Return-Path: <linux-arm-msm+bounces-115424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +YH1CvO6Q2r7fwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:47:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E0B6E4650
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:47:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DdPBPXF5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115424-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115424-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51EAC307BE2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1493FBEC1;
	Tue, 30 Jun 2026 12:42:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597A62F3C1F;
	Tue, 30 Jun 2026 12:42:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782823353; cv=none; b=TzoVZyb3PWTxl6hdPMo/kbs2ckvGHN1v+qOPrvw12vGwPZcg08mrUOJaIQDsQ/FdzmHcsEQClq/8euHOd1l0FbEgXJ7q/6JYpkJvqggPK3gUJzR2UCjxs3N9f+aoGoafRWg5mY43sLE/dk8NCk0Sub1Vs6jLutdaD4gXAnFV+4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782823353; c=relaxed/simple;
	bh=gp5bTxd6r+a1Z4S6aiNQaJ1V8jbHgPofAH2QrGYvM+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BPPZLBlrrZ0OPyZPi4MyTpeuduE46ngPFhoYuOGCE6wx8ETrmFrtHzGA2GzsE5qdoJ7CnEZ7Vx1K7ZPtbURED1lFD4mwMwnExKGu93iOSpO82UPoIziJinWNNCcBo1eNi9MfAfxMwGIrlv/pc5e8byOdmkdl+hVszY2V0lP0yIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdPBPXF5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nDaS1590648;
	Tue, 30 Jun 2026 12:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbEcFUqCI1I444S5LBnGuYIz870doEZNoKmsbA97ESI=; b=DdPBPXF5AvbAgGKb
	EpiD6aE6k2ZvjV/IC8rSOMWqsbm1w1wCMYTBk7NQTip1D/D/KxeKAZ8XTEN6ktSB
	PMPaPCzZtmUwImvl2NHfrSdu5vuikzHdTj897xwXlj8oCQmgzGRjZ32aPQp0oo5U
	CQrnv0MyzGYmfXEEICws04QEV/TVE4vumkiQ4bqUuZwOGvvOl2a5N69vTxot/xj+
	O0zOohRPaP87JYf+98PQ2h5wn7bJqnxSOEAW4huWhW301GpENj9dGsmB+oOs1XLy
	Jd5vzdapuYr2koQt+eB9sxTlugUmawwSf7TT0/7P6BB0kuF4dv10ENBkq3W2Wl6h
	Tl8MaA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3jk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 12:42:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65UCgLPE001898;
	Tue, 30 Jun 2026 12:42:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kjpv3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 12:42:21 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65UCgLAI001892;
	Tue, 30 Jun 2026 12:42:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-kotarake-hyd.qualcomm.com [10.213.97.140])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65UCgLRl001885
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 12:42:21 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2389607)
	id 5C304B22; Tue, 30 Jun 2026 18:12:20 +0530 (+0530)
Date: Tue, 30 Jun 2026 18:12:20 +0530
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        sashiko-reviews@lists.linux.dev,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>, robh@kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
        vkoul@kernel.org, olteanv@gmail.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Shikra CQM SoM platform
Message-ID: <20260630124220.4lja4zshpf66kwj3@hu-kotarake-hyd.qualcomm.com>
References: <20260513042836.073F9C2BCB7@smtp.kernel.org>
 <t2sw6owdxy5iyodjqsldbw6bfaqnezhgvc4hhylxuyrrbjkjto@iwf4dr5nmot3>
 <20260513142936.kauwa3czigfs7qs5@hu-kotarake-hyd.qualcomm.com>
 <0ac665bb-1a21-4077-aa9e-97162f7f4784@oss.qualcomm.com>
 <20260514103918.cs5m5kcxcrcgukvx@hu-kamalw-hyd.qualcomm.com>
 <obdxony34ckfbtsqj66siszw44sgieskcye5hg66ulkisctpwl@fyqczpze5tnw>
 <20260518114927.edxbzvklqatlntv2@hu-kamalw-hyd.qualcomm.com>
 <CAO9ioeVMieo8HtpRw+n4ZU9uV-_RQM061q5XfAA1Dtk2fnp4+g@mail.gmail.com>
 <bvankzuazswuigrm7hvyjqigzfaru5o43wi3zvyphgme2pgqwz@pyspqky3u6cn>
 <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5idu4ljmcvcvzqsr5g73h2roxzs36l6xxc5ju6ovc5aitt3gx4@wmfqueyf2rj6>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX8IVfUzrVn4AQ
 qoPQpdsjPBZ+4BZlXCLYgWDD2ROie62+NUXqPMvATMV+laUf/nIvCYNAVJPaWtkYuHTJ2Snlyl8
 fAqrn05ZYKEtERnKsVNDPl91rSngGbE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX070g4lEWipdr
 jU8odaZLQ+mfTFtrEQPC2hbuVZO8M6TinFYig63N59FnHYQM6tRPHK/PK6BW8kE1jjmfDG9IhAJ
 jMYtXehwq4WHZoUfbnEAaNQQxsS6+wGzmcJ0CqGQzBq9ZddHGygUhpx6P4R+xkPO1yCsylbYOXS
 rVaJglf9kheKK6DVnQkn6m0hwSsLe7tOn7z9GkoRuA9eTjC6HM6PI4A00tOwxCrM5hAKZDrK7cv
 1P3XE+AxGK0r7lXOLxtEPEKjfvZ/u5NWrPAvbJqc5MAfZefud3kvV3Z66JSX1BlVKTfyIAjLAty
 i3TXbDYBYSrqVZIIqAhPSu/fVginwHl6AAUSttv91oKIwd+LJ+4OiXvkJrzK0R+tHhh5HpelOVf
 zB1ojrJ040qPig3T/8GXHI0WP0aQZGrnVar/tjMy6ZSZAXOocgJhmfcIJ0vw8DjTu0GP45PsOvm
 zyCi8JsdRzDAzJDKdEg==
X-Proofpoint-ORIG-GUID: Ntk5LAX5Wt_02VD-9YJ-vtQGQhhQ3i0W
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43b9b2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=EUfvLHg3fUMcTtBup20A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Ntk5LAX5Wt_02VD-9YJ-vtQGQhhQ3i0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115424-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:sashiko-reviews@lists.linux.dev,m:komal.bajaj@oss.qualcomm.com,m:robh@kernel.org,m:linux-phy@lists.infradead.org,m:neil.armstrong@linaro.org,m:vkoul@kernel.org,m:olteanv@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.linux.dev,kernel.org,lists.infradead.org,linaro.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-kotarake-hyd.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:from_mime];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1E0B6E4650

On Sun, Jun 28, 2026 at 03:33:23PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 25, 2026 at 09:11:19PM +0530, Kamal Wadhwa wrote:
> > On Wed, Jun 17, 2026 at 03:48:14PM +0300, Dmitry Baryshkov wrote:
> > > On Mon, 18 May 2026 at 14:49, Kamal Wadhwa
> > > <kamal.wadhwa@oss.qualcomm.com> wrote:
> > > >
> > > > On Sun, May 17, 2026 at 08:18:15PM +0300, Dmitry Baryshkov wrote:
> > > > > On Thu, May 14, 2026 at 04:09:18PM +0530, Kamal Wadhwa wrote:
> > > > > > On Wed, May 13, 2026 at 06:14:20PM +0300, Dmitry Baryshkov wrote:
> > > > > > > On 13/05/2026 17:29, Rakesh Kota wrote:
> > > > > > > > On Wed, May 13, 2026 at 03:01:47PM +0300, Dmitry Baryshkov wrote:
> > > > > > > > > On Wed, May 13, 2026 at 04:28:35AM +0000, sashiko-bot@kernel.org wrote:
> > > > > > > > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > > > > > > > - [High] The PMIC regulator definitions omit their required input supply dependencies (e.g., `vdd_s2-supply`, `vdd_l3-supply`), breaking the power hierarchy.
> > > > > > > > > > - [Medium] The device tree inaccurately hardcodes the `compatible` string to a different PMIC model (`qcom,rpm-pm2250-regulators`) instead of explicitly identifying the actual hardware (PM4125).
> > > > > > > > > > --
> > > > > > > > > > > +
> > > > > > > > > > > +         pm4125_s2: s2 {
> > > > > > > > > > > +                 regulator-min-microvolt = <1000000>;
> > > > > > > > > > > +                 regulator-max-microvolt = <1200000>;
> > > > > > > > > > > +         };
> > > > > > > > > >
> > > > > > > > > > Do these regulators need to explicitly define their input supply dependencies
> > > > > > > > > > such as vdd_s2-supply?
> > > > > > > > > >
> > > > > > > > > > Without these properties, the regulator framework might be unaware that the
> > > > > > > > > > PMIC regulators draw power from upstream supplies.
> > > > > > > > > >
> > > > > > > > > > If the kernel dynamically manages the upstream supply and its reference count
> > > > > > > > > > drops to zero, could it be disabled, causing an unexpected power loss for
> > > > > > > > > > downstream components?
> > > > > > > > >
> > > > > > > > > And this is a correct comment. Please provide missing supplies.
> > > > > > > > >
> > > > > > > > As per the Qualcomm system design, the parent-child supply relationship
> > > > > > > > is managed by the RPM firmware, not the Linux regulator framework. The
> > > > > > > > RPM ensures the parent supply is never disabled until all subsystem
> > > > > > > > votes are cleared.
> > > > > > >
> > > > > > > How is this different from other, previous platforms?
> > > > > >
> > > > > > This is not different. In the previous platforms too this is taken care from the
> > > > > > RPM/RPMH firmware side, the only case where we may need explicit vote to parent
> > > > > > is for non-rpmh/rpm regulator rails (like i2c based regulator pm8008), which
> > > > > > may have a RPM/RPMH regulator as a parent.
> > > > > >
> > > > > > Even on those previous targets the parent rail of all RPM/RPMH regulators are
> > > > > > internally voted by RPM/RPMH FW at proper voltage with required headroom
> > > > > > calculated based on the active child rails. This was done for all the
> > > > > > subsystems (including APPS) regulators.
> > > > > >
> > > > > > So no explicit handling from the APPS is required for parent supply.
> > > > >
> > > > > You are explaining the driver behaviour. But the question is about the
> > > > > hardware description. If there is no difference, please add necessary
> > > > > supplies back.
> > > >
> > > > I understand your concern about descibing the parent-child relation in the
> > > > devicetree, and given that we have been almost always followed this for all
> > > > the previous targets, it will expected of us to add them.
> > > 
> > > Yes.
> > > 
> > > >
> > > > However, we want to avoid the unnecessary access to the parent from APPS.
> > > 
> > > Why? What is the reason? Do we want to do the same for all the
> > > platforms? Only for Shikra? Something else?
> > > 
> > > > At the moment, I do not see a way to avoid that, if we add the parent
> > > > regulators.
> > > 
> > > That depend on the answer to the previous question. In the end, we can
> > > make the driver ignore the parents by removing them from the regulator
> > > desc.
> > 
> > Ok, this seems like a good suggestion, so you mean its ok if we define the
> > regulator desc's supply column with NULL? And only keep that in the DT?
> > 
> > you mean like this?
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/regulator/qcom-rpmh-regulator.c?h=v7.1#n1453
> > 
> > (please let me know if i got that right. thanks)
> 
> Yes. Don't forget to explain in the commit message, why you are doing
> so.

Currently, Agatti uses the same PMIC, so we cannot set the driver
supply name reference to NULL. Since it's an older target,
we'll need to run a regression before making any driver-level changes.

Additionally, the child-to-parent regulator ganging differs between
Shikra and Agatti:

 - On Agatti, l3 regulator is ganged with vdd_l13_l14_l15_l16
 - On Shikra, l3 is ganged with vdd_l2_l3

Since vdd_l2_l3 is not present as a supply name in the driver, it will
be skipped by the driver and would only serve as a representational
reference in the DT.

We have two options to consider:

Option 1: Skip adding the child/parent relationship for Shikra for now,
since the DT bindings are not enforcing it. (Ref:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml?h=v7.1)

Option 2: Go ahead and add the Shikra-specific ganging in DT now. Since
the supply name (vdd_l2_l3) does not match what the driver expects
(Agatti's mapping), it will be gracefully skipped by the driver — making
it safe to add for documentation/representation purposes without any
functional impact.

So,Please share your thoughts on above options ?

Thanks
Rakesh kota

