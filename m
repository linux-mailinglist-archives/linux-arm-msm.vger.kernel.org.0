Return-Path: <linux-arm-msm+bounces-114773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dy7UFJYaQWoalAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:59:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F4E6D3D77
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:59:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LT97ryoO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JSXgMjUR;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114773-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114773-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2C77A3002F42
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 12:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76ECF30D3ED;
	Sun, 28 Jun 2026 12:58:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFF134404F
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:58:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782651536; cv=none; b=jQXUj211SIqRQEoRPVzku99YBdD7VEe4p+qcMmGU6pLyOLxjrnSGxU5HFgWli+c6XKBF/tulA3WmwTjEWuwTE6tl13Appbx+KQrnhVfONnU9NxT67BJuIIqaBv1YMr65LpvvknT2imAHGRzn4NBZoV1exAcziE+/rlmtSQqSpTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782651536; c=relaxed/simple;
	bh=0wOUkTrLcwn4XQX9qdju4rgz1U4rhWcBCbj7l6bhaDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZcm63B4Ld0DuocoOZETLmZMi1B487LarNlFL6nGjBYThL1rWxApzHEgOxksC+FenBLXLvoywSEk1qEraOJomlCCP2PidoP3rvrZk6szbkECmiUfGwKEApOlCtEhfcJSdLaooj992YtSUCZMXxPuxlmRXoTXXCK8LowLG+3RPhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LT97ryoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JSXgMjUR; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65S9QHS83607510
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gpQasczH1K35L73A9A20HnaT
	X0LYp8x8agLaBKFU2yE=; b=LT97ryoOUGkqXVKm9Alyl4GmE4yzdK/J2LcveUcG
	pDNCnxTxq1yVO+mekILJnJ7xT/rvkraeWYmg/PHs++rk7zFAgLA2QOXkTyPCWTGb
	U8d2dAaDqdh3GFN6Y+l70ApUn4dWGdjrJHQSLyE4AFCg1uIS6wFPBF6IZMrkF3FO
	wanKRisjQBpDg4TJ06UQIbXIOW4bfgEFS8g80hc1yKWVd+jmuf+18hhoQ1pbeGHd
	J135XechAbSLRvAuyIlH0MbSQsxkWTF6hgXULcOZsQl62+8TRROvTomqzqA4BSe7
	USBMOAH8KUMs9Nzee561+NmZ+SsJ0b+m805b8BEsqPJHJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cjukk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 12:58:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b0cfd4a7dso429043285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782651533; x=1783256333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpQasczH1K35L73A9A20HnaTX0LYp8x8agLaBKFU2yE=;
        b=JSXgMjUR7KCk8J1izPGA5MN9EM7OD67eil8Hbvpdd5uTbJHlyN2QWyBBLzOdd8KDPP
         jRTpiSlvOgi6hSf0x5gxaqOfmA6SwMa8x/WzfcNJu+bRiOB0zmpCA8uahk+RHgPXlIi5
         FFnc2L7iUEH22zftYEwleDPvsl8F73s9s+MgCd15Kq6V1aCKaAcy7ujSZlTxhQpqhYH4
         yQyS6goggX/N65J2DD7AC4M/A0CoDQjbosspt1Ytovt4PgYkG0Bu+zjSUvYeqi26hT8u
         ZZyVRaZU1L74U115Fbc/23O21cVg/HAmyT/FjtVZENizr9AgQogRCB6nM71aBjz0+Lei
         WtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782651533; x=1783256333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpQasczH1K35L73A9A20HnaTX0LYp8x8agLaBKFU2yE=;
        b=AagjxOriIejGyXSVsIni6x65UXLaHHziYOPOLVzJgcsR8oOosrD+af0ZxlSpMOx8Ru
         IoSjTG9nQtfUgsPE2p/v76ukA8TYGJNqmD9V43H1+4gXyKm7nIPWSQIOq4wJuwPmo9t0
         17S9X+j2jvf7aNhYJ5fhPAZud2zusFPciczzOCENUm1Wosbz+l25lPbPqfYVJmaXeswG
         NJjmnTrTy9arYQQaj46eyk+scz2vcrXc2wH9iol4C43kIvfI+dIBaZbZ+qG9Fn7z459W
         woCT1UPMhqg1c7yiARCnL32dZJXWiJu2psqbzWCretaHdb9DXZR40QsTDxKZ1pNX8YoK
         zrFw==
X-Forwarded-Encrypted: i=1; AFNElJ+G+LkG0PGl84cwRdCp9LxqWDlKznEPyYzTwrPDUUFXz87h6jflXZ94GH6nZ9VaaTk3tfKr7e8O1ntSpihM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy243FIQ6qbW+GlOCuBNXUWSuBTgI4KpgR8lwFAONqjCwKzxGKf
	X8bVxG+tYK575+8cYzUIivG1efG4j/mf9594fqZC39sucp7en8/4J8zJbP9ZyVahEsGJfe/T1IM
	X1ZmEJZ/07wZlo4b7ub1FFZJh0ARof5eA64QZTMYLDaLTeI2uP0HnXAOIHSMIulsUNu+u
X-Gm-Gg: AfdE7clQ3bEbHoARKqBl0OVTiyaErdDqOCdHo3k7/boD+uCojh8f/DGphLoc2YSIVyu
	kwO4udPsag/4cy7FIRwBYzVnX9XLbD6CZjEJVuLOcwhwy8FzRSnGqnP1IiXKOqN+exgJ7lwELpH
	PqNHOfhnKQ+EwBL/Nqsycx4YoIM5gWkS8fmnIDHim1DySpek2iqHpi7MqidoMbaTBT6wp+Hrl/j
	9wZWF1nGlDnjiKPJxMejdx4nqSbYy/2WCiA4RKuMSKIHgjDYwnE/9JyqLzs4IUbWYKJE7lv7ErQ
	ss8U2TEyr7kniywFYFMxJ1LCczUrsjm2FVUXCMy6OhqaY/lbKT+U+i7uaJImTcWAdNLNCKisae5
	Zh2DCd9ZZzUPJ56zXhD4ojoiGE+0PX1Iyr846ef65ZYFpUsV4a5zzv6z9Q39qlzS+piBCt+voOf
	JusPNCf8b+mF6ANg5H1JIj2z0x
X-Received: by 2002:a05:620a:2552:b0:915:efa6:d718 with SMTP id af79cd13be357-9293cade740mr2223116385a.47.1782651533393;
        Sun, 28 Jun 2026 05:58:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2552:b0:915:efa6:d718 with SMTP id af79cd13be357-9293cade740mr2223112585a.47.1782651532895;
        Sun, 28 Jun 2026 05:58:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999af9f3a9sm62931071fa.7.2026.06.28.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 05:58:50 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:58:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: fix QUP serial engine IRQs
Message-ID: <qp337vbbeah3fjpnpixqnftvxcsyxojnv5djdv7pycik5lg2zn@fpf2wlriviry>
References: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
 <hdq5iicr3sawlkhxmeut4ms4n2x7zocwva44lhnjqjfneqwtwe@3amlnfuuanie>
 <akCKUAa-Yqh3xEZT@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akCKUAa-Yqh3xEZT@baldur>
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a411a8e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=kHK4Yh9qWnZ23RGlZQYA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfX72ZHn5FpEQ4M
 ecPI64HVuXvFiBn1Nno4/j+HhlzBZZhaaiceHjO3BqmG4fT0UJsIx3YckOp9C0T5XGgR/qdAAna
 dc5XX0qGt9s5L5oSYzsRx1au3/XrCLg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDExNCBTYWx0ZWRfX1PWj6M7OUpEN
 ZimXtO3DZ6UPu163FhBPYczYoV1eWf+mzHpciJBiq7X8Vx6EKDw5DEXUI3V2ioP5hMA5lC4nEle
 McIlitMznFJD0QunPnK+6wktkI3kovVRInno2ovAXzYIPsNH83iHIWG0t1d+Uk7pe26TNdpwxqs
 B6BthXoBQjMP8P71JalJPawsKLjRMEWZebOoucunlb5n457yHajU6LunLKr1ZMXUshydLaeqh5D
 iVfYtAn5ITwj3PzyI5U+hlvkM8oQvmYUhiWU2z8w3p8hQqZZrbVvMb/UyZk/WDGr0ROArybEeq9
 m+jBLej9MbVyY3+2sWVRp3FBkfB+fQl0TDgq8XcCWcUzF9SB6u4EcSIhnkZMTGHtfM/XwxVrrmp
 Qly7VH0fDxd3B4LUcPnOVRbgS7877eRoOblVCdfCmZvadJX9jwe9sZnBjsbI4Ot6WhuHgJ/HLcr
 XkCk8Ox920cvxHprWqw==
X-Proofpoint-GUID: Yme_-COEMY4gRkeLrxd1x8Akw3No1D5f
X-Proofpoint-ORIG-GUID: Yme_-COEMY4gRkeLrxd1x8Akw3No1D5f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114773-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pankaj.patil@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28F4E6D3D77

On Sat, Jun 27, 2026 at 09:44:31PM -0500, Bjorn Andersson wrote:
> On Fri, Jun 12, 2026 at 02:04:05AM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 11, 2026 at 05:22:37PM +0000, Bjorn Andersson wrote:
> > > The Geni serial-engine interrupts from QUP wrapper 0 all fall in ESPI
> > > INTIDs space. While some of the i2c instances has gotten their
> > > interrupt specifiers corrected, even the other functions on the same
> > > serial-engines are wrong.
> > > 
> > > Ensure that all the serial engine interrupts for QUP wrapper 0 matches
> > > the datasheet.
> > > 
> > > Assisted-by: Codex:GPT-5.5
> > > Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 +++++++++++++-------------
> > >  1 file changed, 13 insertions(+), 13 deletions(-)
> > 
> > What about the SPI / I2C controllers which are a part of qupv3_1?
> > 
> 
> They are well inside the SPI range.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

