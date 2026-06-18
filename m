Return-Path: <linux-arm-msm+bounces-113689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y/hrDbl3M2qkCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 06:44:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B2A69D868
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 06:44:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cbiO7uKu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="NW/VVPgT";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113689-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113689-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D21593037BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 04:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E5935C19D;
	Thu, 18 Jun 2026 04:44:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683142D0C7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:44:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781757871; cv=none; b=nxgCyCNS/KvvqiFsw1xyz7EtcOWORs7oZtiCfuB+hFQjE1MRvXqC7YaSy9WE5chLvNgHeodqf7V943u3M6B9p8avBvNQuvFsTd+AVAgFC4pyFRVbKX6vIhbSg+/9Mq4HeMdSrn0CaWvZMZV3OnpINnKItCVtHfOGn2K4QlSRg5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781757871; c=relaxed/simple;
	bh=e2X3uLyEyJwxM5HjZMv7HNmigKfP2gEwrUoXrdaESkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5xCoNFjHvO9GX0MRWr5rMPHGPlVTIaJxetuvUc/MJzQKn3ZnFj5/SwP4j3+JGs5RUbMr6B3REDC77UkO2NEF69ieAv+zkisESu3wdClVzvOU7NHhGXwCD2Va6/LSG1fiT9Vq9CUGU2nfhBm4wrVvmWmFZGV0HkxwEppnfxSIXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbiO7uKu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NW/VVPgT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HJbQrs3515470
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TTyZtbn6rwu4RjX2VYmmyUvR
	qm9Y3D608YZqL4TcQDg=; b=cbiO7uKuI7iG/4dvMRCT91ZpwfANL9HtWo5FsymJ
	DUza1/WQRp58RU6yBxST6QoirvbOcYMJTrfE+FacjmOOVUxpFwwJ+eTX7ZxFeTwl
	kp/p2hIyxglfjXQE3Ovg2r0y+KTvDOmlKLxrcOS61mzepZWMMfV0fQyv7AWJgF0p
	BX6orKnRo+c9m2hp3mgVabTBGxm8oSJi08DJc/0jGK+eifPnCufXM5sUvfftKPIM
	MbRibK1wSQrleVouV+/yPW41hKxRlSMVl2zkG/QngLtjet33ZrrQI0H245ctn3Uq
	cm/tvqvP4nFQ8K+/UJ0yAQVldMs0185nQiHQzzR8RkC32w==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc1jq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:44:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1394c3ee7f2so3137605c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 21:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781757868; x=1782362668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TTyZtbn6rwu4RjX2VYmmyUvRqm9Y3D608YZqL4TcQDg=;
        b=NW/VVPgTR+eL045c1omPCxGWh4PgadN/OyzVyULba+szg0Stpxn5l2qmZtyLLrF6/w
         m2FkylvRYSRK42V7u7ux3GF8T33FyVcfT/Wp6fNGLTWadh4uMMJIQVrolpFFtc2lssX4
         87cKqtUnYE3PVS0PWA+P+Wt5+JyrkG5lo2MoA/9aBBAvXfhjduh/p2ubGDa84WjJwGX1
         Jh6VJn43Ob5ibr6LLGkSLhbdF1u73T4ZJSKFvgl4r2Y4qomWAcM7U6120ydmdm5kP3mz
         RedjFQbvExGy3psHQPSNdmZ/FSY/zubdmfOdK/3wIwF/zSU82jqGcyGifqlN7Bb5KvsD
         4i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781757868; x=1782362668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTyZtbn6rwu4RjX2VYmmyUvRqm9Y3D608YZqL4TcQDg=;
        b=kJW9AqKSGkMSS91lXi7lxNaKmtLn4ajT7PfrgLvUe0ykv/4YJ6pWeOZswTWWYmQxNv
         7NJNpY8K+I2+su8xPtlDYGZOvKmiTxFCR0LthMv2xUGPh0Zep1QfYPyjGjXoCWseJ6ec
         KCScDG0XXkACul8iExziVuQnRC7VzbL4Sxb/jeC7piPAOXlxHESpxFAQlWiaR9plcCn8
         nzBbtcQqHTHygRFcVGxGnshZeQwrL+kBBY3a57fkOOmP6QeoG1JONsN5IU7d9RlDCzfC
         wEY6L/7dh9b8XN/BpDloeXkg5INYiSmGjXO/7LOiybSBPwZvXFc0tQKbwHjHEU6ukw1f
         koeg==
X-Forwarded-Encrypted: i=1; AFNElJ+xPfXDBMnmBG8TTgZwqqlbWw4f7axXWkABlZShldFO0yyxup4JtNH0YKoKsXqWnR65G6C0YHlJ5Hh8o6KN@vger.kernel.org
X-Gm-Message-State: AOJu0YzELStkY5uZT/T1G2SdO6Gj7/aaJwHrG2Y+bm2zblwFT1rBmav2
	sOz2Zrbfb/clNxSyzYewN8wMkWAMtP7kGpepvyYqGQ2f0lJ57UbBCwVc5/9Vo8opqQRwSW60LQm
	nQYfrx5yDhukQ7pjaLrVgbMoUGzPItccA7/waZJmI4AsYpyzYkQPOi/NNTxiG2K/EGRVf
X-Gm-Gg: Acq92OEEkHzlYe+l40wV77Qrg24/WxrrNsGbNRVaaojtWTO8o7gGYO1DlDoc5qpcitP
	aohi+IS+MyNT3f8W9xak14s2Q2r6gwjCq++PLsfXt4+A9X/llrDDIVhBscUeUGx0FIrNxsqCSEP
	EH0RZFkWJ0HwTfDVh3+EGaz2TdEikaw9pSvbV259D8q02LjUNSuLvF4TqYnZSG+GW44IMNMj3uz
	A9xbWupg/sK8+DGb6Pqhg8h+fptQPwjFbkmplt4Wk1yzWi9Jd1zKsPFQTIbvuNvkr6A5ixbWpy+
	jlLXOxOC1cEWzDibJlxspDS+ioJYEgueR4Nh+eg61xKYgT4yokh8DdEY610LOHkJ0zy+YES1aqO
	vCuqF+yqjQLfkEq1rtp317tjcx/ZgSpBWFr6wkMaLXvzG3Y9pi0tNQxllBYdOx+4Vd+s=
X-Received: by 2002:a05:7022:493:b0:138:2a54:f6d9 with SMTP id a92af1059eb24-13997c79011mr1185375c88.25.1781757868347;
        Wed, 17 Jun 2026 21:44:28 -0700 (PDT)
X-Received: by 2002:a05:7022:493:b0:138:2a54:f6d9 with SMTP id a92af1059eb24-13997c79011mr1185341c88.25.1781757867797;
        Wed, 17 Jun 2026 21:44:27 -0700 (PDT)
Received: from hu-mattleun-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd23401ecsm4461963eec.25.2026.06.17.21.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 21:44:27 -0700 (PDT)
Date: Wed, 17 Jun 2026 21:44:25 -0700
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: qcom: Document the Hawi PCIe
 Controller
Message-ID: <ajN3qfWV75SqNzgo@hu-mattleun-lv.qualcomm.com>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
 <20260529-hawi-pcie-v2-1-de87c6cc230c@oss.qualcomm.com>
 <2tenqkmwcr2gshtjwh44pvban4gtlzcgrm3iibkfrs4zh6vphb@h5losfunylr6>
 <aiteRU8cWykuhlVO@hu-mattleun-lv.qualcomm.com>
 <m2kwzigrz4fbdedzr2bj2auqtvafj6qstbplghssato4d6tdnd@ftug3clgxmd6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2kwzigrz4fbdedzr2bj2auqtvafj6qstbplghssato4d6tdnd@ftug3clgxmd6>
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a3377ad cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8dstwiPKDIhgTtwZBQUA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: tco-azE-AZEcVdz5KxO3LsQX08P5Tyxh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA0MCBTYWx0ZWRfX+ZpjsPSCWgWO
 1PHYUUbkkf25mMRPci/Cgi1X00PJHXNQoXh1qlwEr4vFqZ3Xsrrae7VqmciTCpGGPrKhhT2dPE9
 xLaEIu5zig0sb6U6OdSry+I0Y5yKNUk=
X-Proofpoint-ORIG-GUID: tco-azE-AZEcVdz5KxO3LsQX08P5Tyxh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA0MCBTYWx0ZWRfX8mOn+FbqeoRr
 zsP95dKyNaJQzskkiMKXnVhBzH2zfsvdkjuFzSDZi+eQRfaxgcCe9pWaxWZfm2n+ux5XkYxMddr
 E/nOCp0yJbBGC81p6ddtBFJpNxcbqTeZtLA6MacUIfmjWXrX0htXwl2ZjoxbukBTVniNt9LxaMv
 BeMY7zEgPjhU+sfL+cCWlo5kqFxsmB7O1rtsxnWb0p/5gaoXKZzZaGVfMEIth0D6wxGYdjNgc+M
 TNap/+w9rMukZ3h0MPjpbAwXG4ew5zOkq3XDnmSUYfHMNIg9OF3CcKJFw41MGKOUO5cK2DvSsz2
 /CPPYrD5MhACs9wLvfan+v6GXSugKzVYWNVZgp7JHa1GDDk5aKfJdZZxdIJZoc2TJYEra5ws30W
 Nfa+e4Ik5eiV3uHETGiSGu7vT3QukH3zI1GRyHDwy8t4E8T0LNxp2ZaW9esZKJpRrI1iyvlVHGO
 h7ZdNOLIOpnL7obA3rA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113689-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bhelgaas@google.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8B2A69D868

On Fri, Jun 12, 2026 at 09:22:10AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 06:17:57PM -0700, Matthew Leung wrote:
> > On Sun, Jun 07, 2026 at 11:01:10PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, May 29, 2026 at 01:10:08AM +0000, Matthew Leung wrote:
> > > > Add a dedicated schema for the PCIe controllers found on the Hawi
> > > > platform.
> > > > 
> > > > Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
> > > > ---
> > > >  .../devicetree/bindings/pci/qcom,hawi-pcie.yaml    | 204 +++++++++++++++++++++
> > > >  1 file changed, 204 insertions(+)
> > > > 
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/qcom,hawi-gcc.h>
> > > > +    #include <dt-bindings/gpio/gpio.h>
> > > > +    #include <dt-bindings/interconnect/qcom,icc.h>
> > > > +    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
> > > 
> > > Stop referencing clocks and interconnect header files. Replace used nocs
> > > with ephemeral values.
> > > 
> > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +
> > > > +    soc {
> > > > +        #address-cells = <2>;
> > > > +        #size-cells = <2>;
> > > 
> > > Not looking around should be a sin. Take a look at other Qualcomm PCIe
> > > bindings. Compare them to yours. Then fix yours to follow.
> > > 
> > > Hint: the extra soc node is useless. This is just an example, so use the
> > > default, 1 cells for address and size.
> > 
> > Thank you for the feedback. This new binding follows the examples set in
> > the qcom,pcie-sm8x50 bindings and retains the same formatting (extra soc
> > node and header references).
> 
> Hmm, interesting. Then I'm a sinner :-)
> 
> I looked at msm8996, but I didn't notice that the rest of the files use
> the soc node (and match what you've sent). Please excuse me.

It's all good! :)

> 
> > 
> > I understand the example can be simplified with your suggestions but
> > want additional confirmation that these will be the convention for new
> > bindings going forward.
> 
> At least, let's keep it for now. The other comment stands. To remove
> dependencies please use ephemeral nodes instead of depending on DT
> bindings from other subsystems.

Agree. Will update in next version.

> 
> > 
> > > 
> > > > +
> > > > +        pcie@1c00000 {
> > > > +            compatible = "qcom,hawi-pcie";
> > > > +            reg = <0 0x01c00000 0 0x3000>,
> > > > +                  <0 0x40000000 0 0xf1d>,
> > > > +                  <0 0x40000f20 0 0xa8>,
> > > > +                  <0 0x40001000 0 0x1000>,
> > > > +                  <0 0x40100000 0 0x100000>;
> > > > +            reg-names = "parf", "dbi", "elbi", "atu", "config";
> > > > +            ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> > > > +                     <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x3d00000>;
> > > > +
> > > > +            bus-range = <0x00 0xff>;
> > > > +            device_type = "pci";
> > > > +            linux,pci-domain = <0>;
> > > > +            num-lanes = <2>;
> > > > +
> > > > +            #address-cells = <3>;
> > > > +            #size-cells = <2>;
> > > > +
> > > > +            clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> > > 
> > > <&gcc_pcie_0_aux_clk>, etc.
> > > 
> > > > +                     <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
> > > > +                     <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
> > > > +                     <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
> > > > +                     <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
> > > > +                     <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
> > > > +                     <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

