Return-Path: <linux-arm-msm+bounces-115615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PPyfAtjVRGrE1goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:54:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 946646EB530
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 10:54:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OOzzgwHS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MWpnX7lF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115615-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115615-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B22C930A51C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 08:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711A83F20FF;
	Wed,  1 Jul 2026 08:51:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728A23F0A94
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 08:51:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895877; cv=none; b=O6rM4LreM61rEb/sY1D42p6bs7QnRGdj6qG7PT9qEMQ3f/kaR3RAVsAz15UF6ndGiO4uPt5e/ch7wrdEu8eQyKv4DIX6tHb8WAtLZRz+0G2IuuEQHCpwDzuTN0MhcmNMujgA2BiV9e4XLru2mh4W9bZOJA+NPXZVzw7WUW8UyH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895877; c=relaxed/simple;
	bh=aPE/zZRjQ0I/0gtY25dgbO3O2yxZYZWaVf1Bob8OoRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0I+wh48/MMnc89kPH3SRE+ZiCUyXIxBkC6uP05vg/h13Dj5iUG8VEnQU2lBjOeS6p7ANay67ifeGXr3MeK3YP09dNKi3b20CvqqAAyuEvWA0RB8RKOY164u9HExvA/5ebyRoT36O9xcnkiPbJi8xiS56ktQsfI7wAWHGZIa/dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OOzzgwHS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWpnX7lF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6618GEGa497047
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 08:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hCs8R90jU1FepMNJh+g8I1+w
	WaNV+J2sHz487ThAwxg=; b=OOzzgwHSnGJn5ijuchfrCOZs/eEJ+HWNXvmBO8K6
	CU/835l6Yw580/YJAITkQhhiiv2MAFhnsUNPlVbLiYRbIohXQsW8zCJevIqYQo/v
	YZg/RFfaDlTuStkc6wTg2pzj+pZu5fl5OVngXqpGcxjWKv1cCl/fJ36n9WaPdbdh
	mzNV40RCGlcRVVdkRfdcNeAhyRrD1io5HzzyD6u5qiZz/Kv26Jqkt9NooQC0tUK3
	SkxJkwF/VIp7RXHnxr16gRgaSsBSyFLvDPZ8Mu5K6ogcT7K8f75BdLf6F5ScRyoI
	wSlXyE82bRX4nuAZiFFdE7FsaqqIKF3nkXqbm772MACREw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktb7s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 08:51:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e55f0613cso40598985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782895874; x=1783500674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCs8R90jU1FepMNJh+g8I1+wWaNV+J2sHz487ThAwxg=;
        b=MWpnX7lFN1NaoojH/gjN/i10YGOk0lb+6PJvrRh6ttNNl5YwR92ArrOC+srATsMBFT
         lSHEJgOTlgYdJtd8GmNd/CCtIHGGOlJ6S29Jvrc8dcd1dpSoBBWh/Zag7I+b9HtizryA
         ASgM3j+Ns8Kg7qyJlnv3R2jH9udfEAZjautE9ym8fn2ZQ+Hi1tKU5OAkdiVG0Jn76H3b
         2PdvBhRulcqcM9NWL8FLuVe9Y6W4xxSGsdD9x5pbHl9uph1QTPZqVpOMGENSRBUOmAwp
         24dM/DOiNH04VDsA1b4v2yABXVocCDHFaz4Ekhixu1IdLOlPXT70bhvlfGCXG6Oj1Usv
         U4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782895874; x=1783500674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCs8R90jU1FepMNJh+g8I1+wWaNV+J2sHz487ThAwxg=;
        b=B+x307Rp2P3UlMHMEH4UhdWEVdKeXYf6Kepw1cNv4FZv7doi13GgcSI3iNxCEmvBCt
         fFnf94Z3ruIvSYzd+O+LFZ+yirritT7KHKdA7mATVxegLq8qy7PoQlNo7aBkZ+0dmltn
         +wdUH0leN4LKt+4OwOBnKuYBUJw42KF+Z1pPA1urY8JJkyHme128vE0XbZEezWeb6Cly
         tRonpsJgn1wV/xDUkdFcfhlGfv+1ns/PYmMRqV4e1BOj6d0AdYXdm0wOlKr422kJ7Pcz
         S0IecVS2gIzT/f13HvCvMl+5QgcxlSu3p0RFHkqO8MRTrW11yHKyBvNW0t8KgyTh87iR
         9fEg==
X-Forwarded-Encrypted: i=1; AFNElJ+K5c88+ZrSCn34ndyPVWXmNIhqTLMJchWP68tsPpUApTalGm5CFh4s6vVsoLW96n3Y/70WoD/twuLejk7d@vger.kernel.org
X-Gm-Message-State: AOJu0YxOVym4nYRavJaObuLdTdFJMV2B7JbMgF5FcLGvOeuY+jusz/kM
	OzqSh+slhrSn+ujrr1ceRb9GGPpH0TWJGVjuIru1049z6Tk+ATRNsIgJNuLGOJyR9QtuNSgmMp/
	fJuPVpx9RyofjG+ii6jx2lLbMi92jgbcSOWk8iSnYiOeAed1XQLikUqQz9z6AlW4zd5AL
X-Gm-Gg: AfdE7clTN/Mlvvj9eDloSaxthivYkz5A+jrtQc/9QjGxWNpP4yFKi8UZ/jiG2y7MW+q
	q4HHt/3eCFmD3KvRUms5D6Fdd02KR8DNWiAyU+XBG0zl+Rkwfmed2MX5zrzGtUDn9Tv/TG5j/2o
	gxtAOX4S7n85sRRb+3o7eU+SLgLB19G9lDld1ilrjYFN7f6KKt8JmYW+3spHsVMzDmcYlq9oXym
	JJM1AkCZfaAR0Y9zcXi7Qr8B6xjyI8ScWiSfGTKjENgs8XwkWR+ceolR4tH6fX6y2Z9YhlSlERL
	+HRcyllnC2QkfQsekgOLa7IuBxEBeXGS2nl2yrPw1OvOSIB7KoGVns8DXtpnzvnbBZdBv9a5V82
	RhBiD1MqCEvppKJylXfSTa/A1mpZi2TdVYkgD1/+6e7lrF3JPdn6J1ksxoTACV8Mc2hghvBprNA
	==
X-Received: by 2002:a05:620a:170c:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92e781d6ab1mr85644985a.13.1782895873672;
        Wed, 01 Jul 2026 01:51:13 -0700 (PDT)
X-Received: by 2002:a05:620a:170c:b0:92e:61f1:6b72 with SMTP id af79cd13be357-92e781d6ab1mr85642585a.13.1782895873213;
        Wed, 01 Jul 2026 01:51:13 -0700 (PDT)
Received: from YUANJIEY2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e621666dfsm518168585a.11.2026.07.01.01.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 01:51:12 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:51:05 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
Message-ID: <akTU-YQkms64qivB@YUANJIEY2.ap.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
 <20260630071022.3256-3-yuanjie.yang@oss.qualcomm.com>
 <20260701-uptight-piquant-raccoon-abceb4@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-uptight-piquant-raccoon-abceb4@quoll>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA5MCBTYWx0ZWRfX4rHMEYV3OYvG
 aNmdKzyNXVAEbsg0Bn6Dnah9Vs5ufxrrJs9IhKkrEmt8qqkPlW65+rV7tjXj8qdfLtvbWNXWtCN
 B9pPDNIrE3yfYAd1qo6OAhJeIjtIkxQ=
X-Proofpoint-GUID: FdkmeGn7ExI0oB4iXNGYFvjqdwhiTehe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA5MCBTYWx0ZWRfX4gBaaAqentq6
 DRZUn3yi5UX1tJxsp4NExizTP1SnOQ7PkJhO/3Qm9Vcb3Kt+9/ElIvfnGdWzax4aG4Et1WdHhCK
 AdnRk6/sqSz9gW00BMSuk647Nb356aTG1SGYR1MO2OmYYMFHp1T7TIHnzJAjMiX6h5pJmxDbyw2
 8uYW18IaIFvHETiVVvyN/hNuLkfvTiaRkWcLKdPgsqI0T1c4/3GvxIqfakL/oU74DzpnR6fxEFT
 LUZ5mNrNnJtVcGNnbqeqVyePKZQKyIs1YuMHU8Tb0Rstrf7krUvq3PJSthbW1KmBijtN5soDLN+
 T/lKZog72QUl98Brz9tZPLHmzATc188gzfkxdQes7JswzbbUC8EgqLE8c86oMtX7aMIsuVBFDyO
 10W7uqNo9hntbF3Q917hPrW9IWnl9HeCnyQmiDHYxYnQeCz0EzuYPzHYw1Z93zVAp79WzIPNNwq
 PZxZSlY2Zy3YDh7YhDw==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a44d502 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=km2eNhaI5psHTDfmU8sA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: FdkmeGn7ExI0oB4iXNGYFvjqdwhiTehe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-115615-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,YUANJIEY2.ap.qualcomm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yuanjie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 946646EB530

On Wed, Jul 01, 2026 at 09:29:34AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jun 30, 2026 at 03:10:12PM +0800, Yuanjie Yang wrote:
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  .../boot/dts/qcom/hamoa-iot-come-sip.dtsi     |   9 ++
> >  .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  38 ++++++
> >  arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 108 ++++++++++++++++++
> >  4 files changed, 156 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
> >  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
> >  create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 6f33c4e2f09c..549287e3eeba 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-come.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
> >  
> >  hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
> > diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
> > new file mode 100644
> > index 000000000000..935af96c2b85
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-come-sip.dtsi
> 
> What is the point of this file?

This SiP hardware is effectively the same as the SoM on the Hamoa EVK.
It's just called differently on a different board. I want to use this
file to include hamoa-iot-som.dtsi header to show this idea.

Thanks,
Yuanjie

> > @@ -0,0 +1,9 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include "hamoa-iot-som.dtsi"
> > +
> > +/ {
> > +};
> 
> It is completely empty.
> 
> Best regards,
> Krzysztof
> 

