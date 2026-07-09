Return-Path: <linux-arm-msm+bounces-118006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0b8FODimT2rUlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:46:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE68C731BB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 15:46:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=has8LNja;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZPG3V0MD;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118006-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118006-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C54D03098C34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 13:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A4629A9FE;
	Thu,  9 Jul 2026 13:33:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B66D28643A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 13:33:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604026; cv=none; b=gPlsnGP3sUUNoYNdPPFHr4rKsm+9N2ni3BUQz/iwowaHJYcKnEWgDpPu46/cI9193/zbje6n/qoG56B6Kv4kqwT/b27t8Xxe1EQGck4UfG0nqhk+5iQKTYFubNjvyopV3pfj//szAxmzLzPxBN3F8NL4tbATy/tqQPu8LOyUTY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604026; c=relaxed/simple;
	bh=1iCLJJpqrL4AOIiE1kNcZnaRP0P4Kk2PCRe/zU210vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WH+wk1oY+6I7XIqkJXENfeTJaA6osZgV/yNkjKjdBh4F48VkmyfVNrFVvGgEKw/7uXFo6OjdwU7l9azJHNhFS3EADE6rEVrB4cmg3Wl7d+MNHPTSrTd8nDr2wQw2b2hTFDJOuXtiH2Cnk8GDYa5hiB/l/oITGa/v7sjvy/fJCsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=has8LNja; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZPG3V0MD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNEPJ1716346
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 13:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HGDQxKpfGuynELuUuEDPnfET
	C7Na4BksgET0EcwscvY=; b=has8LNjaLvZGUemb95IqGqRWSuaUtWQFSTBt+Rsq
	aIQiSMwwYUlwSzU79SULrNdeRwtdb519LAfqwtjOCcHoNgxPIAusiqU1OrZJgOzW
	cLE15DBMGbP4X/bRKD3xW4v5YwvTYp6FUS03u256q3qy9VQT0rQrV1vtrHIbN3Bt
	RRtwOW4NQhzEoSPdC4Ma88jO9z9H22FTyfPvUBeCl609zmmTrz6L7PYV33Eh93z0
	5nrwzr1G6TBrB6BIn9VBI8u8eK0nhJMZ6rLwZ506rx7CK79RuEmd2n5yGhqO8QQw
	mTaHiSVF5Yx69gGuwaZguQj/M5WXjcyHokiFHTEAK357Lg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vv3dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 13:33:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-738e5b5ef68so298514137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604024; x=1784208824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGDQxKpfGuynELuUuEDPnfETC7Na4BksgET0EcwscvY=;
        b=ZPG3V0MDiGnzGjc63dP1H3UVjHjzNABFt7r6Cic168lCn6fGe2E2VvU1VrnKPxxl9V
         V4ROJYEXdI2Zj+08t1qYfdW+EBmk0XmwITCkaz/w6bsTn9WUGN1tyN01R0WPDnPIBVUq
         agM6VA3VkRrVtTvtPsOOdLr1PcR4ks1bXg1sq8KBhbAXh38nr+48Z7gyKCcl8gnLrtLG
         neGhoDN3pu4Gas8vQXhjwJgQ3LjB0cyjngV1CjP/frTC2rANljpC4TtFSxTJDqBCh0Z/
         qE6Rh6DPcyg0ZyMsdBV/fHfrK3VcZd1OCpGQGH466ey7RCGcN29P9KQ0bKCFJk0CydTy
         sRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604024; x=1784208824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGDQxKpfGuynELuUuEDPnfETC7Na4BksgET0EcwscvY=;
        b=TkEKCJ3gRq3WCWs2tlHv229XXcQ9PzaPmTFDym4xSyDlNUpUEC01U/XGOD9RfcMitn
         avAicko3ZC+xjSIX3N7jCXYqaSPv47CWfAv8SGi4p22ng0CCUPqUTe7AFinudOf6KoRa
         nznWlF0tzIou55pC8NBgVyrOwSEa55LfmC/PFWLFk0dq31o0TOibZAVzofTmbPnzkUf+
         KuAoJT1YAoGtflW3NGLj05z2Hro4zwCq/3J6Um+BEb6wfK2LkHtb3odVhfcMmmvCMcVA
         GmAvyKbnzZZBkWPyNHqAzdZG4EHxUHKx3TOX7J1Mfo5kA5fN4j66jXRdF2yDpS7/iusT
         z2IA==
X-Forwarded-Encrypted: i=1; AHgh+Rqz6xWtF3NnJ30GRdEamsw9sFFkTFT+GIxknbg4OFELEYsbOcFAsBOSCQerdPsd59vM3/BGgjzdZaBgOptf@vger.kernel.org
X-Gm-Message-State: AOJu0YyDTSNcOphQF+If33nyKIkVc7yQoeaozmvm995odhPQ+pADNrS4
	jw5aGhjJ9ojuDe8+JA0IuNfS//320e6VvwkLf7kG9mK7QuUfIFEIDcrWkzY16M/10TLDlR0WgaR
	p/QNEF6pwzej3E1lEbZKYD8cfic5+3yWxhp+Jcq0LqsDwk6FkyD4XwQmX4EMcZMUluiqa5cZY93
	e0
X-Gm-Gg: AfdE7cl2a5GAzJjxxy0umxdFn/sdeW+VTI7DQc1IMEDyjP7UkElbdECbZyprV4p5rBz
	LZMZMrKZBP9eJP/1hHayFo1iE7sAQjw3P4aG8SLRTfGJBAgwozXTfeQym5M9bR2x5nAVyrt2g9d
	JvfWIkUU5ia1BBujiQTo3xFH422rI69W9ATTu73LY9s63sRiPqr9YDvwZBIyDH2iaWqddMedzXl
	eSEfqRQgVVlUMr3UvWaQCxRkrR9aABV7bDOod5s+Q2y/0pg8Nrp6I90lmlURCGP4Mg7EuEBdUsT
	UMysfbWUhUaK/WsBni2BEvC4Oxm/s9EiG0Cxk+LGGohmIMk0tBD3Gmn1gfbycOkxR8T+ueLvrOF
	9nM+v1h9uA9j0t5Pg2XcbdQk/mjrADvRaCWjsoZB4RB+RzA5uGjZ+679unGwIwEWwVYO4A+uWes
	q/mZakFLtPr5U3B8KB+d7hb/Kd
X-Received: by 2002:a05:6102:41a3:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-744dff81cbdmr4215314137.29.1783604023420;
        Thu, 09 Jul 2026 06:33:43 -0700 (PDT)
X-Received: by 2002:a05:6102:41a3:b0:73e:9fae:5841 with SMTP id ada2fe7eead31-744dff81cbdmr4215282137.29.1783604022950;
        Thu, 09 Jul 2026 06:33:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b00e5801e8sm1438500e87.21.2026.07.09.06.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:33:41 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:33:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add SoCCP for
 Kaanapali SoC
Message-ID: <azr2xlic5hyoli6qtneroygofl3k3mvouigootxti7eyqdimxi@kfdcvufgwrhs>
References: <20260709-knp-soccp-dt-v2-0-6e2bfca96088@oss.qualcomm.com>
 <20260709-knp-soccp-dt-v2-1-6e2bfca96088@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-knp-soccp-dt-v2-1-6e2bfca96088@oss.qualcomm.com>
X-Proofpoint-GUID: 0weD5R1CcovFnR3XQ1wLKrG0iqR5wgAj
X-Proofpoint-ORIG-GUID: 0weD5R1CcovFnR3XQ1wLKrG0iqR5wgAj
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4fa338 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=3-YoKPAtwUcdJlF2dtsA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfXzVPIyNPkDVx9
 n7see9AETY2ynhQX14F/gh4mfZfjEAryngtTbnigQq1dA9gQJR4xTJyQDyrKQl+88dTvH8X95RZ
 P68iAQw8OupRs/37vQsIPZFbTcr1wc/w6oNLffVsElC0O+j2egsamJm84V3hr6bFkajl8CjeEip
 1sjBlU8Jyj1+xtV8pjovAMxtpYbjIZxfIHXbVzFOGwmRNffqjczxd1XNsJ5GVQhy28U37YsX4Y7
 caXJsQXELZOOWK+lxCcx1G5q38nsP/Yi+JwGkclFvJmxBVdADCFhwvzPNeC6y6rkATScvjC4tyW
 20CqlBdQv5RaLFG2WZ9SzNmPHrPKN7Rcw0qUHLZk5q2eyzcNLOMlxoCWgxOfCszAp3Cb9KM6Lqg
 Qtj3J+GgupX1uSPqq51Gk9mkKezO62BnnUUu1cAGh2QPKZ5Lf8fzvja0x+R2ZU8mPyDv/FEIgv8
 aW/QuFtXruL7V+mFw4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzMyBTYWx0ZWRfX/NSE5JlyG8Di
 jl0OwllBnwZxvQ9LRZmFSBOeWg0t0FYW4/HBAZv9Lmg/reyCh8FRJ+ONZH44FvOJrbkEowYaOID
 rs3KU7FZKaOVQgFzbNAP6eU02oZwCi0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118006-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,kfdcvufgwrhs:mid];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: EE68C731BB9

On Thu, Jul 09, 2026 at 01:14:23AM -0700, Jingyi Wang wrote:
> Add remoteproc PAS loader for SoCCP with its SMP2P. On Kaanapali, it is
> brought up by bootloader.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 70 +++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

