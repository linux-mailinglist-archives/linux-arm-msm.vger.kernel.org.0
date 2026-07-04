Return-Path: <linux-arm-msm+bounces-116450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g+PhMKlcSGrIpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 03:06:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7EE706547
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 03:06:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cUwE7JlM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KklYj1r8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116450-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116450-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29BC0302670E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 01:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13202221DB3;
	Sat,  4 Jul 2026 01:06:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2519E968
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 01:06:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783127204; cv=none; b=jDFjx9JJlbIkZB6PvRx9PIQ8RWjxt42LRQZ50XmjR/hzuk4iIrGtPz6vxFwaslDngCJWTdA3TafbovS1BGakfyEaLgcsnnQy1+vntn/Nf5V1My3GAooQyQ2eYZRk1Ahsh3CSBfXnywViYXoSyBkiY6rsqawwS+hS7BF4fY3hynk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783127204; c=relaxed/simple;
	bh=CgGGfOnGeJCcosTIEzTLAsX6Rit25oX4dcsnE2bSpDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbY+Z0YgHKsqXwYWg4uDEYbTD/qTlyB53kEX9/HmzmeeYsaNDAPb/3QIz5UcWtyrAWtPE8ehSXTN1bzyp2irI2e3o7DYmf+WV57tpVYsY59AeGRW57u8JFQdqoDqdWcK5mrjdqVbgacev/4WbnPW3hCqGEpyRg/rUvxbdr6/nKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cUwE7JlM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KklYj1r8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663NYV2M1255994
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 01:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M0/26JKvXxrfZ7B8av+gXdcx
	ng+phSMbjoiHrD0UAu8=; b=cUwE7JlMJS/uBUypStBzSy4UM/6dSEsVgKA2uppZ
	P/aVrpMl4NdUNHdzDAFLwG5iz+a/bQgUJmcKnoH8jOAn7WP3Nlk5uV85M7IK5qCV
	kwwngnIYBof4cJQMzspEzNiLSx4x48KlndoqchyyUSlObFa/1Ho/MJ8h9eftYM6H
	FPx2yNtmNvGFecjM7XUC9ygp9zFxGrSbg80s7wpoRK/7OEtRiEvVhXbEmp9RqE3v
	rKWR+oUMf6TqWiKCj9sZhSaB55xHE7bWsNTNDkb8n6BjDtx8knRmaYWjaJ7h/R4m
	X2caUZ4NxBxIDuFni7fH05rjGCopq/nqBb00AX98D8zErA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n4ey7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 01:06:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8952346bb9so890096a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 18:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783127200; x=1783732000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M0/26JKvXxrfZ7B8av+gXdcxng+phSMbjoiHrD0UAu8=;
        b=KklYj1r8Td3gTMkKpH2092X7egU6w6tTi+nXUNIzQFJ5eC0+/lCMBn2kbdrJDTCWuF
         NqY8NNfmvGq+RFwTf7tr7Rx9cmUL9/l1H0E/AqRgIoyrGXz8n1qWfFYEwVl7ke3Haewe
         1v5DFbeSzDYly/3H/7HHeKCRafRRZS3Gd+foKJgRV08dRO8V+357FAEI/RoOn+FWVCbj
         X17zjG53D3IFXrXtZFUTFBVnWFQYxPz+PrsqrscCaFAnirMuoF6oDB/hENt6RT7g8nl4
         69WmowAl0kxmsUTvjceB70tOq+q2r0Cy7MvqyB2lVoBfyqFQFf8lYZMFaFyVA671fxeF
         VbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783127200; x=1783732000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0/26JKvXxrfZ7B8av+gXdcxng+phSMbjoiHrD0UAu8=;
        b=E0D8ldyLlZIQeYSwOqQTWvKGrenbLp/WdaDixYxVxJKYxM0NHVnSVTEAvy7f/ft5v2
         OS2SFQBHqyOTQ8G2V/LJ3Lm7p1Xm8wosQNXkq2gSPOPJ3oiwwrltSP61T388yoQlI//n
         15MmGQM5oVngpL3z699rH6bjB8x5noVeu2dMwnUplieVp8xevdLhVaw20mNVDWitGVx2
         l9vOb37kZz5vkLlUL6YAOP928Y2tO54gge89V/4LgTulu6LP3QW7oPnRzvotYzvZH6Yi
         TYdSMzg0IzxI1affqyBXIwtLpMeHSOaC29+u9ZV1xqgUCoiUXtgjwaP38qE2Fh9B996U
         /lgA==
X-Forwarded-Encrypted: i=1; AHgh+RrdcXXru4jXLeOj5JYw+y3qM6sgbiutys1mRo8z0nLo2zDZlGxviECYwCq5jL7OELY4OeDw5At5BxgCSmLA@vger.kernel.org
X-Gm-Message-State: AOJu0YyxUmOezEw+hgpeNOtQ5S2ICwkJ09l8CEtGCeZu/eJj/LhcibgN
	Dc+7YMZSJxcIGP5x/g3r7xme0K47MQTs0zcbxc794ONpGwV1z4E8Hjw/DVoFoa6HJ01IE1uHnLp
	C8qEsm9U8YlMG6EpK5r/cH58fuf4M4tsK++tjG6k5nPRYYEv6N704pPA3Czjr6wKsSQTk
X-Gm-Gg: AfdE7clxTi9POuH9XshXcbPc2xd5h62I9MAA7SC+zz5s7iC2FV/Y0XJXbdKFpG4RbKt
	GkVPzM6HfymW2oNwCxfOwV4AZgx/2kNlgf7wbHNd/Avz49T2+uwcqBgTmJ8LOU7ghp7P6D7CO6K
	2cdxyAGxo+7s5EjWPuExWSNAN3DVg6CrWzalKIoa+ECOtepM+ttgX0WnoxMp7Lazzg4+FJLJI6Y
	Ip5+Al1nSN9VhX1zDwZP4X7RCEWSOZW86m2sZBd+Cxj+PSYN164xKiGdcsRwuz0bBQpPnsq+vNJ
	6Mij9hQedWXT/PYPL/PXLwQpYjBy2vwfEbsHQLAPQP/t5A04nWhfpowXd7wDUCpiMoN8qRHnYem
	+qnBNPawZ18A49sx3G043L6PAb/Ztp4FaEtPpX6AA7yMEyKEQRJfUqQ==
X-Received: by 2002:a17:903:3c4e:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2cbb9e33dd7mr13482315ad.21.1783127200520;
        Fri, 03 Jul 2026 18:06:40 -0700 (PDT)
X-Received: by 2002:a17:903:3c4e:b0:2ca:e3f:6a4a with SMTP id d9443c01a7336-2cbb9e33dd7mr13481975ad.21.1783127200052;
        Fri, 03 Jul 2026 18:06:40 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm30631987c88.12.2026.07.03.18.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 18:06:39 -0700 (PDT)
Date: Sat, 4 Jul 2026 09:06:33 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 2/5] arm64: dts: qcom: Add device tree for Nord
 SoC series
Message-ID: <akhcmRTFGri9d28X@QCOM-aGQu4IUr3Y>
References: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
 <20260526051300.1669201-3-shengchao.guo@oss.qualcomm.com>
 <1ca9b0e9-3eaf-4d1b-bc63-410f4ec7b14e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ca9b0e9-3eaf-4d1b-bc63-410f4ec7b14e@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwNyBTYWx0ZWRfX4ERkZhQpruiT
 F1G26MwJw/ZUcUYBGJpAsYJ5yVA+R/sVA+JmlhLtjfBVbK4wV4xp4UWOkvTSMVG1mxdFrK6hNhE
 zokNMd+lB+71OatIEkeSveEUAnd6xzI=
X-Proofpoint-ORIG-GUID: lClPzL61SRLbLGgNMRszaY1k5wpUnqBc
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a485ca1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IXP8gIWceGWApokFOlYA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: lClPzL61SRLbLGgNMRszaY1k5wpUnqBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwNyBTYWx0ZWRfXymI6TEKfkBhR
 oyhnWzA3ixF1sbw47hQ1Q+vCzN+En1/yPlqfnnTcy0e88N2WaaKMbReZzjbKSVIj1C7FLda1hE5
 heqNvc6sIzMCegswtOy88e/7WepPKQ7yIsPZQVxNn9xv9rmvyXTVhSmir8z7A3mSc+XDGWnhPsv
 xhlidt7xkIEgRCTIrfx1UPrPLz+o5lhRtgal1MFO4fV0FFygi5wJNjJzSY3GmlPnc7pTLWab8aP
 tU0mVPSyeZwlCcN7n///emtaCfsQdHqIOd8JtkP8jeFrYKPltHr6Dk3DO7DKyqBlu3OmuGqGAHR
 08lz4L1Ab0H7ctgvYYIx7M5HDHd4KGQUUx66tDOEYbelo4X1MlNcTs5dgDX6q7j+S37IPj5hnq+
 iNREGLwM/pRBHqs9UtJh+zrty/3Shr/yVRAD7/YHU5klGebHHa3uOCBEdMKZAME2ds0NQXKcUbP
 HqQ5Hg95DDqPe3gCUog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040007
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116450-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:deepti.jaggi@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA7EE706547

On Tue, Jun 16, 2026 at 12:58:38PM +0200, Konrad Dybcio wrote:
> On 5/26/26 7:12 AM, Shawn Guo wrote:
> > Add base device tree include (nord.dtsi) for the Nord SoC series
> > describing the core hardware components:
> > 
> >  - 18 Oryon (qcom,oryon-1-5) cores in three clusters, with PSCI-based
> >    power management and CPU/cluster idle states
> >  - ARM GICv3 interrupt controller with ITS
> >  - TLMM GPIO/pinctrl controller
> >  - 8 TSENS thermal sensors with thermal zones
> >  - 3 APPS SMMU-500 instances
> >  - 3 QUPv3 GENI SE QUP blocks
> >  - PDP SCMI channel and mailbox
> >  - Watchdog, TRNG and TCSR
> >  - Reserved memory, CMD-DB and firmware SCM
> >  - PSCI and architected timers
> > 
> > Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		pdc: interrupt-controller@b220000 {
> > +			compatible = "qcom,nord-pdc",
> > +				     "qcom,pdc";
> > +			reg = <0x0 0x0b220000 0x0 0x10000>;
> > +			qcom,pdc-ranges = <0 745 43>, <67 543 31>,
> > +					 <98 609 32>, <130 717 12>,
> > +					 <142 251 5>, <147 796 16>;
> 
> One triple per line would be neat

Indeed, I agree!

Shawn

