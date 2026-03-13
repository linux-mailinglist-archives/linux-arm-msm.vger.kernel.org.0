Return-Path: <linux-arm-msm+bounces-97394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOK/EZjhs2ktcQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:06:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E03281126
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2B503046050
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3222135A3AE;
	Fri, 13 Mar 2026 10:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LclF2PTJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VeIyiljW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F938836B
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396090; cv=none; b=l3lfo44orn1D74HN7o2Lr19MZpFxRj6vV3s8+xS+dAE6yJV67O0vnKcaNn2wTOeqan+JFTnWwqen4f/mvPbRxm8d1dzgosLyKafy8UbUfy+PPK0zMNUbmdppEspFd1NzSyKNqPaMOz5TUf+Om8rB33BmMtrzBXhNo5VF74noDZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396090; c=relaxed/simple;
	bh=S7aXwcsmATfS0RvBPl9OaXee907q4vVJpmutHVoMFI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+9B+YuGk34a6nJ98EzMQxrNidODrIsGqowIl1cxdGFScx5/wB8CkR6vBOQ1452RGbL1eCEU7BaX6fwvuheqkcBDaH6+rrGJAftdr1jeTJnldb+ICFz/iNsKqUobmcw0bn1TDqcPQUxfbP/rkIxXI4awck75Wv4IZCb+37kLwFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LclF2PTJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VeIyiljW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tabK4140701
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bat1CIteF944V7E4NOXEcqYQ
	FCVrX/hrrlhDviWwGTA=; b=LclF2PTJxL78zCqAW65Pd06Xu6ZZceSVclW4yBmr
	9OslPTUk+NrMLeibQWBPdVri1p0mtdjbd6ydcjQtJ1dj83qqNypKrkPiXCumh9wQ
	FqSLfu9b6FwSyiaR3bzNSCymwLuXDW9xs9yc0BSZxkhvW0ICCkwbdh6XKL/Lbc1y
	pwfwwko62Znqm896NmGQgDFWYJLx4pxYP+Cv82OnjKejx0cMoQBhnH6Dvj/xbOZp
	Mbm6zGsOeDBLBCMGfU+NpbWlIL3ZZAPPlbIbI7Aqp1o4SE7tp35U2hNdSbSRSu9+
	CtwZoRAy0QGTD9+/G+HirMejYT/tA1kh2jP+GZFL0MzzUA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn293xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:01:27 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56af1be9095so23834569e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773396087; x=1774000887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bat1CIteF944V7E4NOXEcqYQFCVrX/hrrlhDviWwGTA=;
        b=VeIyiljW+lMsVJIk2yoOv0xsvRHw349tDzAcJn5bUlnkMmGI1WK7u5thxUm4AeCq4w
         6zDaoQIGGpDFwybF0ApFk+W7phr8SX+PBkcOrrX7vrvQpSiGgIllkMbwuX8bihHKC9iw
         fdO5EDGgKyd2gwK5wk/L/jCjb/0HCynpRew3w2SFo1nivMVPn2t9w/MqZIsuW4TDcMJb
         ua1fXiyMVePriBw2on7PV/XEuRa0D4IcsdPguyyidSZKru3iRJ3bFqhNiMt9An565wNh
         LAzvX3iheEbv2zkD8S5uhz+yxC1zZSxpeLZmD0RrT8xa4DBoe8lnoh4sefIoqyU+0Sjl
         UqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773396087; x=1774000887;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bat1CIteF944V7E4NOXEcqYQFCVrX/hrrlhDviWwGTA=;
        b=sWJ+0ZG5GInVEdEgXnFXrraL7CIr7KfSblmOTB4krzw7x5Mo+/31ilalCM0v0+Erl+
         hdupIyOVnJf9C3kTnys8m84bxrNVnCG3JIpuosyMKnvEUi6+fQ2jFHgfNX7NqJXOzgTG
         pqRAsZhEeDZ6zYM6cp7rABR2PZjW7qdRh1QWBIhS6Ezgkkb1oVdCkdQX5V4EmPgKN7lh
         VyaIoMCeb883cektV6Jd2dmGH702k1Kfp416yj9n5XhO652wGTKzHnmUuqt3kHI3Grw6
         dH+1TRVLpe9kfL8D5RUkjDGDlj1WJ6C10tm+66f2sboJB04eT5If43A0cUzFf+y+kqhD
         jeQA==
X-Forwarded-Encrypted: i=1; AJvYcCVG9uCyF4vHyCI8F/z7HI2xS9JAy5cxcjIz0ePaaUGBbgWSCmauFu0fZrPu8iy0pZqOjGrixY0xT/g3/GQK@vger.kernel.org
X-Gm-Message-State: AOJu0YwimXUGgP1FdxgLdPssMCr3N4Gj/gq3m9gLrc62wDv5I0gUcfCJ
	onS5S+9W34ZYJdNCsSUeBlHCMm6ddlkSgy1uZyR9dED0SZBwaSImEbVtDNK5ocpbnDVi2D/7QRu
	ssq3L3MfTmY7vtR1iwhzoJ3j+yrDpskjUGVxM6+2RuHBvChEEP7aIIyQkdx3N3GdLp7lD
X-Gm-Gg: ATEYQzysLVU8Xsz3zWzA2Mjftl+pWvBU84RqDMWGJb4TaabcKTWdYn7M5R1wMYzDpqj
	EKPfPHcL+FsvaFQ339I+HKATxxnkIykcSwo0/SpP+F9fKD79UZ6ZEgQBPf9M1Ti4N1Cmxjr/mNP
	vRi/ILpQX36EXETJ+aBz5y14roqE7VaF54ArVu3pBkwKRuEUgmQA2QVAmqAOq6UUvZno1EVU2ha
	VxKyXnaRB9q/NgHe89r1O0ca8XWRDFeYkYL/51dfekdg8dUEjigpq/P0pZUYDq7gVyxolOw+/zw
	G5xhuJHpgYvAQPScHRUrCFYgaypx+g3SXQpu61JVuHbuZQSu0haqWaoHCCv8XgwCN90gpKteDmR
	8ftB3bMo19bOMl6aXbjvoLaaquClUfprSuCiBYvTCESHhjCbS8NiEi7q24Rl0i/MgazpeER/it5
	CEJooddTxL9gyPtdak7VHvQin5Zw2a805bB1U=
X-Received: by 2002:a05:6122:8c12:b0:56a:ef5e:3991 with SMTP id 71dfb90a1353d-56b6289d3a4mr977857e0c.6.1773396086144;
        Fri, 13 Mar 2026 03:01:26 -0700 (PDT)
X-Received: by 2002:a05:6122:8c12:b0:56a:ef5e:3991 with SMTP id 71dfb90a1353d-56b6289d3a4mr977765e0c.6.1773396085416;
        Fri, 13 Mar 2026 03:01:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e2ecsm1429517e87.25.2026.03.13.03.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:01:24 -0700 (PDT)
Date: Fri, 13 Mar 2026 12:01:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Mahua SoC and CRD
Message-ID: <n2nf6kjuuizeweokhwqnqgasd2pupwyfkvrgereesw7jg2lfzp@hosaxzjyl77t>
References: <20260310054947.2114445-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260310054947.2114445-4-gopikrishna.garmidi@oss.qualcomm.com>
 <vznk4wbziuieoctzrqwbjm7xwdudsrj4afanl5lx67mmbar2rx@5msox6m4h2xn>
 <ca27e82a-beda-489d-979f-f99c778c97ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca27e82a-beda-489d-979f-f99c778c97ff@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: k5CeRkNM3Ej4pgpaTAos7p8EdxO85F9j
X-Proofpoint-GUID: k5CeRkNM3Ej4pgpaTAos7p8EdxO85F9j
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3e077 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SnbDjlwmeUv7jDr-Z4gA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3NSBTYWx0ZWRfX5vPt1uUehucV
 B1wlifrO+QpTYQKIlTFyIDrqrLoYyP1B9xm0VKocW82HeG/3nCWhIuFhZlFNn6TZpWveudyS7K3
 F4YbHQhQ8hCTEz91xy/JS14akRu5WX/XhFYQuo43mxKxWtGBVlrjGlvT/jDKUPDjchte18xSI+Q
 /zm0aLSNHFSXd8zZrtZN8/dSvcAJxikqiru9OTo91nCsBYG+1b0Lu3CqP268voHGrdO+n48hGH/
 cqrbZECvNGB7JhTwVLiYK0n76fil1iyTJ9fe7EqkwZXHGwMbpEao0Z0ecf6FB4++9pY7+MG42NT
 3WUkTFx8c8ak/v/3vbIGw64+70sAdlkvssfMVN3I+L+sTIUBrymg7haHbNEMgQHp5oPzRfcY0aa
 Y1+GsKG2ElM9Sluf7r3jFMrYwEE15SSVIPR3MjEUFmiB42eQrQDdyeiUCmNEbFX7PT5foy7u/f2
 b3J3pks8XOK1qr1UDdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130075
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97394-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C3E03281126
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:38:04PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Dmitry,
> 
> 
> On 3/12/2026 8:32 AM, Dmitry Baryshkov wrote:
> > On Mon, Mar 09, 2026 at 10:49:47PM -0700, Gopikrishna Garmidi wrote:
> > > Introduce support for the Mahua SoC and the CRD based on it. Some of
> > > the notable differences are the absent CPU cluster, interconnect, TLMM,
> > > thermal zones and adjusted PCIe west clocks. Everything else should
> > > work as-is.
> > > 
> > > Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> > > Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> > > Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > > Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > > Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > > Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/Makefile            |    1 +
> > >   arch/arm64/boot/dts/qcom/glymur.dtsi         |    2 +-
> > >   arch/arm64/boot/dts/qcom/mahua-crd.dts       |   21 +
> > >   arch/arm64/boot/dts/qcom/mahua.dtsi          | 1040 ++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |    2 +-
> > >   arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |    4 +-
> > >   6 files changed, 1066 insertions(+), 4 deletions(-)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
> > >   create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi
> > > 
> > > +
> > > +&tsens4 {
> > > +	#qcom,sensors = <13>;
> > 
> > This matches the value in glymur.dtsi
> 
> my bad, it is supposed to be 11 for mahua. It is taken care in below thermal
> zone list. Will update in next revision.

Good :-)

And now you see the importance of it being a patch rather than a
complete thermel zone drop. It is easy to review diff. 

> > 
> > > +};
> > > +
> > > +&tsens5 {
> > > +	#qcom,sensors = <15>;
> > 
> > This one is indeed different.
> > 
> > > +};
> > > +
> > > +/ {
> > > +	thermal_zones: thermal-zones {
> > 
> > You've completely rewritten thermal zones. Can we patch them instead?
> > The difference would be more obvious this way.
> 
> Out of the 69 sensors in Mahua, around 27 sensors show discrepancies when
> compared with Glymur. These differences are not limited to sensor ID updates
> alone; due to changes in sensor mapping, some nodes trip and cooling binding
> require node-level updates.
> Additionally, approximately 23 thermal zone sensor nodes need to be deleted
> individually, since Glymur has a total of 92 sensors.
> Considering this, would it be better to delete the entire set of thermal
> zones and reconfigure them specifically for Mahua to improve clarity and
> maintainability? I noticed that Purwa followed a similar approach.

I will take a look at Purwa, maybe submitting a fix.

> 
> Thanks,
> Manaf
> 
> > 
> > 
> 

-- 
With best wishes
Dmitry

