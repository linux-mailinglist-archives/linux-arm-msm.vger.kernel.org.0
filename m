Return-Path: <linux-arm-msm+bounces-119025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6mu4CucpVmrf0QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:21:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BB18575476C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 14:21:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NP2+lx77;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XfH4gVHN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119025-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119025-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32C8D3006806
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97EE44683B;
	Tue, 14 Jul 2026 12:21:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D803D891F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:21:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031713; cv=none; b=SOd6hL8q8f0krfs1U8oWuXmyM1Ctgi5hWxEWWqMkvScX6Af5m9jV6PUJ8hJKodgEWQBdqyzyqch07HYe6Yl2QgTKlybSgqjfupIUUMzT9+/sS4BndqAA7wsSIbMW0Q29M582dwFnUE4OoA4gQxuHwBsqp8NGuM6rr7YMBd+PMIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031713; c=relaxed/simple;
	bh=blSGc8mpSJfii4N42Bv2ZHS+Y+To/QfElGIhr8fNnEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEdCa9PFHFepPnVyEF/oQBruh+281L/gTAOeSYxsgVcvA8nnE5TdEjkF2bih0eNwOb0SjgknV+61zHFJv48r/Bx9yZ1blm2dHSdficXuIDnx9td4OsaN6RZVpqS8xZuhGnxXbXOpHlMSqcU0zbatDg2zrrHGTpI10DwT8QYrPo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NP2+lx77; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfH4gVHN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBOBBK378780
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AaJWOsd5BnjyqC24eEwjOhih
	u+jMm50tNnjN6UTMWOk=; b=NP2+lx77TF+gnPxX5hILhZ914ChMD+KPaBl+iE3o
	pZ5QI6C3HOI2+Ab0ctmhxsEQgT/gIIjBztMKl/ZP98MQSq9avYPZSJSpPaGw3u7q
	XuU/XTzibRrj1saPv9klk0su5J5djM+9ImQ5Ri4fbjsQn5FuyyTtYkdz7X1eGrrE
	3pGzsJgCb3Asokg1umiS+nAk25LUtcscYtpqHY+J2z17ZP6vOGNJhNLja/3azd5W
	IjzNHeTdmbtVMcCDtmTqY7LGFbJnPZapTVj+gFyjJBSWMlYO3I6GoJl4A3gkoQ2B
	kRu/WFNczigNFKWLh3pAu4IQyYiIhv36X8mGCRVL98Rf9w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdbr4a5ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 12:21:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so6407948a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784031706; x=1784636506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AaJWOsd5BnjyqC24eEwjOhihu+jMm50tNnjN6UTMWOk=;
        b=XfH4gVHNt8HDRcQsTumyh9ghOgY50WqwxOHZmZEdwtJNy3CyMeVlSPRe5npWP8jzOq
         G7IcsjOT4mJwOdKqOFnnc58RGja2H6D6FHgiud4ayXhDqdAyuJjRKUp3n5Eb6NvTwsIn
         rZ700px0aMT76O7rCwOITKiFukC7FOCfUI/0j/7x6p0NdMtf5rm4hCOFQC4hzDp35ZcT
         sWaJZt2ayOd0HQAWRlK8mzPd6UawGAKVm0rJ6KvlpuwvT0ncIoNu/aTqIlP/h9pOfK+Z
         p8NC1KCzWzhHFQ1DdeLDC9vGWTNljwEe8RimRyXfy1Rm/GqtUKtO1RrUeJpp5coiyMUG
         oPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031706; x=1784636506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaJWOsd5BnjyqC24eEwjOhihu+jMm50tNnjN6UTMWOk=;
        b=FXAKusksU60bxG8owuetYfgG3liuFXHHbiz5Ps8PGRr5iM43a+R/y4PADtX1iEOMt8
         msqHUPQ6prSQ+ybFk0am26x0HicdzpmC7sBaXzRB1fCfXSAQRbMzJbiuMK2Ra8mE8yM8
         fhXlZqbRg6nnaaXqqcYth9G9165FUpnAenOXElELw6e6lsPEbq0SsQz3os2txa1bbg+C
         FF6TK/0S7ZGVVcBKTRhC8jE817zPXawQmTJ2zpSEj/FjEQ//xgsogqehJIU0iPvmKH4w
         9nSgJ/MCIHKvRvOVgzZx5ZW4E9ZMFYF3MRE48Yo6EPAffPrSzUcf6hW6htEcG7y7mzXE
         /4LA==
X-Forwarded-Encrypted: i=1; AHgh+Rpni6+5cxAFkWYJejVFK9cHpmmnBNKuG1wmrc83sH6vMd6+Ks0NxN9ECZyk/3N8IDdMzHqnG2XNI+OyffZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwPnSa3zM2yS9rfQ4XAzyyhYvm833q8Ui0ez08JhKeybQ3A24EW
	TS7jQEZ3wKduDv1sgj0RfAGDSvHjsrplBsrjRESW0XXAF47L8ozDGWgkD8d3AhtLv49vsIQcEvC
	08y8w25LFGm+2xtBGrsATwxmpNkGaOlL4Lj0lL8/oIn3mAn2uKRabqbXq5HFJs0QUlSvR
X-Gm-Gg: AfdE7cleHY8Sd2QzW49x7WLFBQgRU530iKT2W///le9eqZl/8p/oxTBuJvSFNqmcTZR
	VTH1aS84kqCYCI8czgZvoaOGxftCxwB07U/5ny8yVRiigflpIZ1IYCslFVu7khDSXcMVjaN5SfC
	kmIih7xahmUXKauDM4l9fVMIkcwgUGsSGnIjtaQFFZepEjGdTj/TZrM4TaB2/FJS0CvnLkd9u+B
	ekKu59IvHhdCBfEKjx2HeRcpbtvsVo/8d7L5lCEcO6kCEHC0P/NspSKQrwRlMMHyscvJThz8jNZ
	6XcGThXwsCIS5WI2KbOtRm/858TJYdbg05Gsvw2d/72MOVKVdh6YlgY8N3SleDRM0jw5AEhMar/
	IJHTuwahggw0ZkFlM9SbscSAFIU7bYJ67FAsiTV1YHpoROHGuBpT+WA==
X-Received: by 2002:a05:6a21:9f17:b0:3c0:9c19:65c4 with SMTP id adf61e73a8af0-3c110aaff03mr16582532637.76.1784031705644;
        Tue, 14 Jul 2026 05:21:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:9f17:b0:3c0:9c19:65c4 with SMTP id adf61e73a8af0-3c110aaff03mr16582483637.76.1784031705057;
        Tue, 14 Jul 2026 05:21:45 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm80463710eec.2.2026.07.14.05.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:21:44 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:21:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: Add device tree for IQ10 RRD
 board
Message-ID: <alYp00gq1akcx9SK@QCOM-aGQu4IUr3Y>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-8-shengchao.guo@oss.qualcomm.com>
 <alOuTNcCjaEkHn0e@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alOuTNcCjaEkHn0e@baldur>
X-Proofpoint-GUID: pBqaUdPPT_321Hjz_6zAOr-1AmnqOsmm
X-Proofpoint-ORIG-GUID: pBqaUdPPT_321Hjz_6zAOr-1AmnqOsmm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEyOCBTYWx0ZWRfX6udUgmGaPrLf
 zVTkpJvFi5+TdQMXD15Dfnipukc9Yg+nfasBzsvJbJukLQrI4vPq3SrqyytxSffPau0p/ODRjDJ
 rd8n5WbtXizDoo8VXW28kADkF9hO9hM36+YwfhanaR+OaopI+cQDUS97e2kSTNXqbgyfkb3t51t
 9tuV9Y3keCR/XbIkFad3IBVnHpsT7cww2ye0ZkFvECz3iYciyn2OsPhubnG16IepM3uMYje/WVP
 pKS6E+fgcfpv6AhuLxxRP2klt4eFDMagGeLfwYKAAI/DTm0+xXYS0nFSJk2z8IYUKguO8N5T45G
 I5XqdD3wIu5oaWK49hC14xKvUkr4Deww9ufbzc4aQzAKeNi+7Klou+RwgDKkKc3e9A0EP0LvYJS
 nbtMosIaDvw9GG9+wWQCRdqYTKPgIqS2nSYURl0dXuL3SdcA+oVHF//MYFdXFuU1UcXiKBeV+Fx
 ghgwtWZAvAnIMuf1AKw==
X-Authority-Analysis: v=2.4 cv=F5hnsKhN c=1 sm=1 tr=0 ts=6a5629da cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=7Am0Wwq9neIlElUaZukA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEyOCBTYWx0ZWRfX85F0pC7ShU83
 lY01uGatIegh4GWS6b1nXeyBf+2ckcoW0IxWVB567XadeN2oe7ViHaN/NjIHwZfloXcUmTogFdn
 5dSGjmY2rGviIqgA9Vd79rngHErBMTQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119025-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[QCOM-aGQu4IUr3Y:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB18575476C

On Sun, Jul 12, 2026 at 10:15:52AM -0500, Bjorn Andersson wrote:
> On Thu, Jul 09, 2026 at 09:20:13PM +0800, Shawn Guo wrote:
> > Add initial device tree for the Qualcomm IQ10 RRD board, which is built
> 
> I think this is the first time we see this new TLA, please provide its
> expansion as well.

Sure, will do.

> > on Nord Embedded variant. Enable the debug UART, UFS storage, PMICs,
> > I2C and SPI.
> > 
> > Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile     |   1 +
> >  arch/arm64/boot/dts/qcom/iq10-rrd.dts | 588 ++++++++++++++++++++++++++
> 
> I want all Nord-based boards prefixed with "nord-". I shouldn't have to
> open the file and look at the includes to figure out which family it
> relates to.

Ok, will do renames:

  sa8797p-ride.dts -> nord-ride.dts
  iq10-rrd.dts -> nord-rrd.dts

> >  2 files changed, 589 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/iq10-rrd.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 8e6ef4116146..75d29d602e77 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= iq10-rrd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/iq10-rrd.dts b/arch/arm64/boot/dts/qcom/iq10-rrd.dts
> > new file mode 100644
> > index 000000000000..39d254b49c14
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/iq10-rrd.dts
> > @@ -0,0 +1,588 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.
> 
> What?!

Sorry, will fix.

Shawn

