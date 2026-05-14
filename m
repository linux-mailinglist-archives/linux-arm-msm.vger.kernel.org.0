Return-Path: <linux-arm-msm+bounces-107689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPUgHIwjBmpjfgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 21:33:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B42546661
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 21:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C95B30817D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 19:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723C03ABDA4;
	Thu, 14 May 2026 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTNSQahC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E7nlX9jm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9B422083
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787128; cv=none; b=Bp2/8akeqm44sO5pb6Al3vJmi+1pkCb5tLomZPiuYb/xkqTaocmhOL2gRBpEaFNA1FTuNh1at0r/+kYeBLkwMygpusOoDC+4tihtiU4Lv5H4qvYVOgKewGpDrBhD1gKJjVjVO2T/GKSeqz+1PJvkO2bD76CwCXj2GVi6nG7vN3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787128; c=relaxed/simple;
	bh=cy0s4uIYXW0ha/Gtf/j47OjTumSz+fHWFjZCUGlXhmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0jKYq/MqBnnQ1pALkYfm3S+LCFe7+Tg48S8YRxuqXKznB4VQ1H5I6BQhFO6z17thwVFzWsUgoalijnr2G0AZuL3iDkrNbBdIDxeJQh4lfKO4dIbap1aQrKa2DFXrnR9C9GWCjgyoV+BgXrzCnomXZmnZKYHJYodnSap6k2UjU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTNSQahC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E7nlX9jm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EIpf5H2676235
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 19:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DIW1PTso37FN3Q8DZ5BftMaC
	OZsdLplMWdxzm3zETHk=; b=QTNSQahCyjD4wJcPfVC2PAMWJQIm/1JQNZMz5Iil
	lfbpCp3zHdjP4BbBPZKRqq2kbCNuIOoV+M+yK5yy++uz4iabFuf3fmAV+XuHbJcp
	lPvh3QBaT/ooURKgBQ3JEZcCxt5a4dz2B1DkhtR/PlIrQ9YkMmeV6oVEOAuUDQX6
	akl/DwRDySJJVAkT9Kwc958KgW/1ZRwOUOqV93vAK7ek7NP09qto2gZHiPVJeH8+
	pmjh718UvnoyTYQHG/YhCvu/tHdqa7QIJMeyxYkFpwIBiFPAkstwZ+Qj3P3TiIaG
	aXoB4/tMvpOsp6SYdXL03h4rjrxjeXZU9l/rubysHn+yKg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vr4aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 19:32:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366015bca9bso129884a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 12:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778787126; x=1779391926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DIW1PTso37FN3Q8DZ5BftMaCOZsdLplMWdxzm3zETHk=;
        b=E7nlX9jmtwTK3Zh9RdpVEK2ed0FG9o+XhjQ+YOza4oomCHRCGSxhDL8Aon0ZApNK6p
         ePbLNxY+FzAQ3RXjgj3uiW1P1dffZGNyfZ42/9Z+uvniY5diSZUGCcsNXGbxZ+36n6mw
         avMnZuhtS6CRuzI2vnuh2fSG1Eeo/N7BJhqDYVa9hmqqQH7dktKkS8eyv9sJ3lZBiiR/
         kPKQuilg3Yf8aIt79C5ZDBUI+bJea7Qs9tkmSm+w9Tkv2lt8FBolZIgZPVOpsMNtCmR6
         jg8BVUIS2Rfxf2G3R/oy2PqDdbWhqVDyYtrlGcxpTmkDHjpGQt9V0G/OKTpn+FDGix5x
         vShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778787126; x=1779391926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIW1PTso37FN3Q8DZ5BftMaCOZsdLplMWdxzm3zETHk=;
        b=ILkFAcQwiuF054KDdrKLURo0W953KOCXx5GmKPDjiUK/7oobOJIVhhCf0rv/jEiBHI
         AfwR0SZwfHNXfBN6iOkXWGhNgFmn2un5Ie2U2LsYqAKrzuIiFEg/jriDJgnid8tukA2+
         xAHrEGVQ2QbIgKGX+nxg2+UZj6N6Bt78TKUnYm965hQ3N6njwQOhNEIYolMp4p9t3Uzd
         ewWCHrMIFBV43LFrlHwaxWa8lXyJsiER09Y7VMrhXAgHEtvtBo0dlMDwgYVR2S7gMN7k
         0s41IMxPnksvW0QgLOgTTmvDM+eYyc1X3HUFFcsTAPqXbW4dozlpa8OJBm6C6CUbCjOp
         tuHw==
X-Forwarded-Encrypted: i=1; AFNElJ+o1Z0dlhp8pD+BZlK+FNTi/8GQeEk9pWhoSL4NnTTOyxwqDJ4UbaW6AbH7BsDSgWoWAS35ccWgcIqPNHqm@vger.kernel.org
X-Gm-Message-State: AOJu0YyMb/f5TR0ZGStEz1ifJzHYB+zmBfIaa64w12ATNm0PGLNetfoq
	jXUz2W511kswqXlssRnFm6BDml/QLCn08nwKiR40O6xtPjpxzK6P5HiZ0hnvsIjX5jXCcQe3A2X
	XyBeK7s68PKs513UXGeBLaw4XsyWOhlos3/6vDkrivA+el3DepzeF6V9u47P1Yo8xWoy8
X-Gm-Gg: Acq92OHHudu/kNOD/+yMiIEX1ejD8CxVUyRSbSM3AQss/O3CMEXKxXre1nzYFapb9WZ
	S28HnC1/CEYsWFZjJm0KB+NozPBKKUKrS4xXp3Kw07yrmP8/gn4AdJiJiTkkwYUlDwG19dS8n6h
	1xCKy7sQ5FWdUsQAFlmlptfmAmCKFIo0sunujsQOq/OkGJG/BsSn/H63tbEBfZZe3COVfBSOOEj
	xteqvioYX5p5wmkc1XeYyf0W+dq2t1EggN9G0Y8yIuMEJrzaDk+BkXi70zqlZEKaqWos2VU7BP2
	4CK3xuM8ufdKCnSqkIjMeIrBLZJNleQlRp3NPcRrXxIdiQR+KsZ6pAgTFub5n3V7y5VjgEkdUsG
	VKdsHYvYO5lTwoE/lJK73yOxHiz5+FLdPx4ASwTawmKQDVZcYflz26HsXRzneBMl43JTRp4PVCB
	n3ng==
X-Received: by 2002:a17:90b:55d0:b0:368:2832:34fb with SMTP id 98e67ed59e1d1-36951494a98mr711115a91.10.1778787125544;
        Thu, 14 May 2026 12:32:05 -0700 (PDT)
X-Received: by 2002:a17:90b:55d0:b0:368:2832:34fb with SMTP id 98e67ed59e1d1-36951494a98mr711093a91.10.1778787125010;
        Thu, 14 May 2026 12:32:05 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692aa3ba3dsm1484806a91.8.2026.05.14.12.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:32:04 -0700 (PDT)
Date: Thu, 14 May 2026 12:32:01 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] PCI: qcom: Add PCIe support for upcoming Hawi SoC
Message-ID: <agYjMZX/cYijEBOm@hu-mattleun-lv.qualcomm.com>
References: <20260508-hawi-pcie-v1-0-0c910906f7e5@oss.qualcomm.com>
 <20260514172151.GA410819@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514172151.GA410819@bhelgaas>
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a062336 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1ED3lwF0aQ1bZmQ4pvcA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE5NSBTYWx0ZWRfX6Y3dvMq1pPOI
 E0710s5o1Uvhv2SlMXW9ZWjAaQKO5Em5Tnqm8tDWrv0ZwnSWHlyHYWlxQJuTY/0svMSMjLwUOLI
 7YZnn4vgv4w8AzeSuR34yUA1rpnhfgSj7M5KqGxygGpDktU1uZ/NARHVKWuEPHTRr3bb2lBNKpm
 gjuX8iN2SvebzTPzwOkvDtetHSP74n5lrTVv3grLRvFoLdATmI9aQnY139x/zjnw+uN5cVT3C7/
 AKUx/T4Aa6q15uUkB6KCugwJFr4GT3ljCqxg7kCt7l0r6kd2yUtECTH+5a3cIpdAhY3a5+kbi/O
 ZQ360gJpX/2PdE77g65wdNGdHEXxhETKHvpGk75iTwG3vIANIudwIxfRy6PDuzQUMkXK7kKrRBB
 J2TuSnThMe1kHVaWRLxeD8PyJkIuQtDksv5rRH/0qIftNjNTLwrxgiYjY8HtJiT/MqZoSsFHZYp
 mtVZyezbaDjpLPR/7Sg==
X-Proofpoint-ORIG-GUID: izik9RGy7LicNShG65G9vNT2EZm4TnBC
X-Proofpoint-GUID: izik9RGy7LicNShG65G9vNT2EZm4TnBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_05,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605140195
X-Rspamd-Queue-Id: C3B42546661
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107689-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 12:21:51PM -0500, Bjorn Helgaas wrote:
> On Fri, May 08, 2026 at 01:02:13AM +0000, Matthew Leung wrote:
> > This series adds PCIe support for the Qualcomm Hawi SoC. The Hawi
> > platform features two PCIe controllers: one capable of Gen3 x2 operation
> > and one capable of Gen4 x1 operation. The first patch adds the device
> > tree bindings documentation for the Hawi PCIe controller, and the second
> > patch adds driver support by enabling the Hawi compatible string in the
> > existing qcom PCIe driver.
> > 
> > This series depends on the following prerequisite series:
> > - [PATCH v3 0/7] clk: qcom: Add initial clock controllers for the
> >   upcoming Hawi SoC (Change-ID: 20260316-clk-hawi-1ad4cad36d6a:v3)
> > - [PATCH v4 0/2] interconnect: qcom: Add support for upcoming Hawi SoC
> >   (Change-ID: 20260311-icc-hawi-d6dc165f8935:v4)
> > 
> > These dependencies add necessary headers for running dt_binding_check
> > against the binding.
> 
> These apply cleanly to v7.1-rc1.  I suppose the dt_binding_check thing
> is the only real dependency?  Is there anything we need to do to
> enforce the dependency when these get merged upstream during the merge
> window?
> 

Yes, the dependencies are only needed for running dt_binding_check as
the example dts snippet would produce an error on the missing headers.
The patches should apply and build cleanly otherwise.

I thought this check could be a problem for merging so added the
dependencies for completeness. If the binding check isn't a concern, I
can drop the dependencies.

> > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > ---
> > Matthew Leung (2):
> >       dt-bindings: PCI: qcom: Document the Hawi PCIe Controller
> >       PCI: qcom: Add support for Hawi
> > 
> >  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 188 +++++++++++++++++++++
> >  drivers/pci/controller/dwc/pcie-qcom.c             |   1 +
> >  2 files changed, 189 insertions(+)
> > ---
> > base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
> > change-id: 20260506-hawi-pcie-f61435ca420c
> > prerequisite-change-id: 20260316-clk-hawi-1ad4cad36d6a:v3
> > prerequisite-patch-id: c4fbb0620d748d7f1ee675ade5167775bd31c8ac
> > prerequisite-patch-id: ae5e212518cc333a1a93564cabfc6abd128df664
> > prerequisite-patch-id: 3c3816e0d595589fc02383f10e48c83a61fdc9d1
> > prerequisite-patch-id: cbc13fb819d1c1ee77957393f0958f05db8db864
> > prerequisite-patch-id: 17e2c0cfbbea826fefa1c67d0f5dc2094ab73d76
> > prerequisite-patch-id: 150dc74750377f4558deab6b179632872bcbb71c
> > prerequisite-patch-id: 38fe0da5b18610aeb32c7154f9e50187ccaec6a4
> > prerequisite-change-id: 20260311-icc-hawi-d6dc165f8935:v4
> > prerequisite-patch-id: a1ff655f0b21d6259b158ad9f99a95bde31257e6
> > prerequisite-patch-id: db21b6b20451be8475129faece7ef4191d41273c
> 
> I don't know where any of these change-ids or patch-ids come from.

These were generated by b4 after adding the change-id metadata for the
dependencies.

They should refer to the change-ids of the respective patch series:
- https://lore.kernel.org/all/20260506-clk-hawi-v3-0-530b538679f1@oss.qualcomm.com/
- https://lore.kernel.org/all/20260506-icc-hawi-v4-0-35447fdc482b@oss.qualcomm.com/

