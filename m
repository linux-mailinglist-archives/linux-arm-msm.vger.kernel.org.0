Return-Path: <linux-arm-msm+bounces-118411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LTpTNpBeUWpUDQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 23:05:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA473E9C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 23:05:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pWjvz4Aj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FzhGNE0w;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118411-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118411-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE747300999D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 21:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C6D38E8CC;
	Fri, 10 Jul 2026 21:05:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C098314A98
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 21:05:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783717518; cv=none; b=HnXqXC2UMWdSmnwjOUPfeRl3e8onpY9A/s9VctjFU4Ig3zBS6DKvIcmYr9yDf1FmstpGYJZN2Jpd8dEipMcU8OA0yGe2YeF058p4V/0CBAPZ4/esh8mpo/H6zR2OFph2yLTrExYZGE0J0CPhCXnKKqk/CWdNMgCEIpAdjid/Kvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783717518; c=relaxed/simple;
	bh=gE1IFtkeWzkXOcvLqsQ73tJs7dYxitmjzZU0BgU6gO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYbr38Mbvt+uwQD/EO2Kn5g+k7i8WcQwfDmubFCHPHvbw5K3OxVVt5UgNt7iO9AMXlfO0HXLKS8Tsi6ouTEdHNPzz1BpcvMEsSmOYea0LU9kcLjPh0gj4Y+dfgKjEx6VSwH2/MAEoFf6Ozztk7CAR6BjfriMSl5RKctRChklFf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWjvz4Aj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FzhGNE0w; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AKDcFA1811767
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 21:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dwt5k3fowZ2mfZny5OMNxv60
	XAgWL+172QPd+A4v3vo=; b=pWjvz4AjL8pM7/cnTiV+0dQT+5TJHu0akfmT0AJ3
	YGhLah7sU6PYjCvmYqrjCdkvuaTCG77dfHTy1Gh+ufakdnRO139G0PhVFj5DNPSK
	wnGlTbhMcOFfJx+YF+q+sbq4Z+7GIHGMnTagP3Clx1zAFSAHu99Gl7m+eIDl3nSS
	DnOQAEJKsXu4CDQcJqFtYpKRDGgRMn1Xs6uSkf0TioZv0xCr9GSyyL8fQPNp9Lrp
	Bb3GLd0qVPW4XLWRdtt+u/Giq6fT9KFlxObe3F8RbKg16JcRmuCRLXq0H68xFtGQ
	0c64kn9GD4xuoAZ0snLlIAvMl6ErzLt7cTT0YiVbezjVeA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5faema-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 21:05:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7377e2f1a62so520964137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783717512; x=1784322312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dwt5k3fowZ2mfZny5OMNxv60XAgWL+172QPd+A4v3vo=;
        b=FzhGNE0w4cR9Oiv5jqCicu4IGXWVTStYH6uTznthNUFOQwMaMd4hKMpn1nuw+Up/bc
         rffzlz8D3FDWG7bqR5WK4UonZuIc/E+Lq1Jv28osw9VRgT5y46XEluZrLp3NJ3DsFjVr
         cjXqi9dewpy8G55FQL7Pog1ImuOJtPMe23w9JANNRafW1xFETnywnTGc7XFhCPYBwQsu
         RGY+U1WKuLedqtUOC6KtHBJISebHOFADa631YH5jTb3/DtpOvm5VJqVG4V5cgnflUi04
         w2C9F5xr1o+zUMe3uKetWC28RG9LyhEcW/eioak0ZogG18AnXJsOT39/yNyom+Zs5q7D
         e3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717512; x=1784322312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dwt5k3fowZ2mfZny5OMNxv60XAgWL+172QPd+A4v3vo=;
        b=Ou/LJ1YPqrQOgMmHsCAqdY3et+y5s9I/TGdjWXFgZz9mYkeETjteZ6mbnYZp3p5S0U
         YWZ7BhCRk6R6lX2RUtMHh3qFsuPyhzeMpAZJ9H/VutdPep2eSbgKPhvb9bv0RjsbxzH0
         SmPyDlO5N1Wr2VvF5Qr0XozNN+31eHUv1TCQ88xCvqSa39Q23ozcsjivmxQJErPRtfOi
         VOnbeLvm6pjX0CVO60RX+BqUha+SiwTcNZ3T5YCo7CzvVFnzuNuW0G98voH66q4Opjr3
         oYlwLBWp8K2Xmd1CK6fwhU/jpowYuMQs8vfsqCl6neav7JMbdztkD+byIjE0PC0yE+J3
         AcXA==
X-Forwarded-Encrypted: i=1; AHgh+Rrp1nxicXwkuC7N3xaN6bjYoDeKItjBDbFV65uSmQqGSy2be+Q9eswnHHSl0ZbU2P6mkqdqqktkBsYor2Fq@vger.kernel.org
X-Gm-Message-State: AOJu0YwydFGwM0BsXkfhvTHBtd8YbFMev+XD+pJtxCnXD/SJIGwimBod
	gmWFsdHT+KWaqfT9HGSfmOSE0U5TjDG26UmJ5ApSpliIcGdrARnd54xTNpXTPPirLEE5Y3z7S5h
	cr9ZuwGHLQU1bLdx9WxMNaD96ln1x7cwtdoVRaEm9dyStRobMw2Hdi2BLSVb279IJbn5e
X-Gm-Gg: AfdE7cl26+lqG4Yb7r7mjH1McP7vI70O0xJRuKJkbLW+GJgDtp6mUuwGswnaqrdgZw4
	sxo+YSIwyRTMdWX9OSc0aL6E8sSsgbauJ64uhZ2GczTEG2MQzT4K8ww2geYR4liYESVlcJLY3Rk
	5JlhV2ZBCz0jvaFnOPDw0q/j+RonSwefYYqnuXGkOvOetbDUTtO9DfLFQ/DIv9I5oJTn01Mu+/V
	vTbKrZFbsdKV2HTZJU9OszcjT2QJNca5uAa7TwC134h19ElHj0Vpwdb0QLzFMSqvTPOac5sm0B+
	UcP1GuwDcW9uKwNzkeAW0B1fxNgzIa3TvwHlAXapS2VOW05EfXxf0EtlTZ+4dKV3NmCeSLK+b8V
	wpkcwxbEmresUgFxKUl6adB/vblD26D9zlsInCB4HWjhIMg9A70kuzr+WyYjgEzPvtqeJUGLstB
	IxUQtwaSRWl5qx3UM+bY9yhevu
X-Received: by 2002:a05:6102:5e8f:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-74533b6fc30mr636282137.4.1783717507441;
        Fri, 10 Jul 2026 14:05:07 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8f:b0:737:4cac:52f8 with SMTP id ada2fe7eead31-74533b6fc30mr636268137.4.1783717506952;
        Fri, 10 Jul 2026 14:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab020asm883476e87.74.2026.07.10.14.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:05:04 -0700 (PDT)
Date: Sat, 11 Jul 2026 00:05:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: qcom: hamoa: Move Iris IOMMUs to
 sub nodes
Message-ID: <7ftlpnxwpiouioppnmnz7mba3vmswot6hgjlp5ffudjcxohlws@wztskqyolsaq>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-7-72bb62cb2dfd@oss.qualcomm.com>
 <3t76ahxtn6e7rhxzxtwhbgq26tdztgfow5kh6lxgtmtr7mucxh@dydqcmawo5g2>
 <ba676246-78d1-4144-8b8e-6d1bfd547011@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba676246-78d1-4144-8b8e-6d1bfd547011@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a515e8c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=EUspDBNiAAAA:8 a=dzjCRWAtPjgZTTrisiYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: tUs19NfG-yYUj09pH9D0s0ozJpHdDHpB
X-Proofpoint-GUID: tUs19NfG-yYUj09pH9D0s0ozJpHdDHpB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIxMCBTYWx0ZWRfX7XdtDP2oiZfE
 vOfsM/drzq4eM0Y44syda+Jl/BVx6R/aapilqahva/t+wcRrAvZlCW4lvwtM3ddb2Xa1FVndO1T
 ZSpUWHkG6Ey7uyzhfA2IbsbLe3azLlU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIxMCBTYWx0ZWRfX5fLRSxVOKeLx
 qXf+9MGd4UK7ktgc2h9G8zn3w7RoyST3EJ9HcCZNO1vLpziBf2a6TmvDz4ddzO10awsWv/Ahole
 2C+E53M5rYNKvbyd9K9dWBdQqjagsBXTtJR4her/nWYCpz0OgoykDKZwiwgPIST4r8Sd7nSrTyN
 1vVMEAKvNzpXp0Y/wgISKFbcdj38yFKf3PrpB4FhfuD8qQgsBpdGppQzANHzcHVwDqsYeArZIO5
 pjLPbMn16c0AMXV5xfeOqvyQwVXT0lWroqcNdbvN7FGyGfm4rYBrx7zfmqwvlLWMOFQpxIiXs77
 rBBacrQfRNJgark3QFKGQKfZLciCX3rrybwo7WqSj7vIWPonCGSrnFvK7Qj4EoG1HAKU1COOOak
 FEoQ3GDpemuFGmeTCl1pDnZC4ETtcvjwQtRJ8LWXtDPzbaVQ15Y+MydWxu1ZTOg0884yTe9zA8I
 6L+MfitTSCgphapacEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100210
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
	TAGGED_FROM(0.00)[bounces-118411-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71CA473E9C8

On Fri, Jul 10, 2026 at 11:35:45AM +0530, Vikash Garodia wrote:
> On 7/9/2026 6:33 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 09, 2026 at 06:05:53PM +0530, Vikash Garodia wrote:
> > > The Iris VPU has separate streams with different IOVA constraints. The
> > > non-pixel stream must be limited to the 0-600 MB IOVA range, while the
> > > pixel stream can use the full IOVA space.
> > > Using a single set of IOMMU entries for the Iris node does not describe
> > > these per-stream limits and can allow accesses outside the supported
> > > range, which may lead to device crashes. One such issue was reported at:
> > > https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> > > 
> > > Add non-pixel and pixel child nodes, move each stream ID to its
> > > corresponding child node, and add a reserved IOVA range for the
> > > non-pixel stream.
> > > 
> > > Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++--
> > >   1 file changed, 16 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > index 60f485a4892e062980d01f0b930af4b02f36513c..a2baa2c9f46dc19c3db11dc784358223a035475f 100644
> > > --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> > > @@ -657,6 +657,10 @@ smem_mem: smem@ffe00000 {
> > >   			hwlocks = <&tcsr_mutex 3>;
> > >   			no-map;
> > >   		};
> > > +
> > > +		iris_resv: reservation-iris {
> > > +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
> > > +		};
> > >   	};
> > >   	qup_opp_table_100mhz: opp-table-qup100mhz {
> > > @@ -5435,10 +5439,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > >   			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
> > >   			reset-names = "bus";
> > > -			iommus = <&apps_smmu 0x1940 0>,
> > > -				 <&apps_smmu 0x1947 0>;
> > >   			dma-coherent;
> > > +			#address-cells = <2>;
> > > +			#size-cells = <2>;
> > > +
> > >   			/*
> > >   			 * IRIS firmware is signed by vendors, only
> > >   			 * enable on boards where the proper signed firmware
> > > @@ -5446,6 +5451,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> > >   			 */
> > >   			status = "disabled";
> > > +			iris_non_pixel: non-pixel {
> > > +				iommus = <&apps_smmu 0x1940 0x0>;
> > > +				memory-region = <&iris_resv>;
> > > +			};
> > > +
> > > +			iris_pixel: pixel {
> > 
> > Unused label.
> 
> Kept it for consistency with others, it can be dropped though.

Consistency would be to have only the useful labels.

> > Also, shouldn't you specify the IOMMU region for this one
> > too?
> 
> There is no iova restriction for pixel domain, hence region is not needed
> there.

Ok. I was under impression that SIDs are generated based on the address.


-- 
With best wishes
Dmitry

