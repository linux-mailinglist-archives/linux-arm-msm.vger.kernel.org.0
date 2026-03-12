Return-Path: <linux-arm-msm+bounces-97258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GGuEY/bsmlMQQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:28:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD36F2746FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 16:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 956963009F33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 15:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530093815F9;
	Thu, 12 Mar 2026 15:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3vHAaJq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J8GsuaE5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168DD37CD2A
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328745; cv=none; b=KZigxxn5ZE2/qGZX7iwp95B+OAYZ6FiDIAi0zmmAgWOzR+os4QBGcXRHPAPgLXp1xYesCItjceSY5Cjs9pAK0T/vYXt9dHD+4azMWldHA/VThcb34K+vKQAC5td9ABhCjP1ca7TMvFz0Uip9aEe80DK/FSW93JNITl1Qud3aHmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328745; c=relaxed/simple;
	bh=rw9cjFTPFVQ+ZCbCDgC0zpw35Koclq/8zUtdK1vKwrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDvFvFAh0iVKp7UqzOPBsq/Fk7gThfmrlEx5P8kH3PA82FlVQdZl3AcakHlPzwFGLLtwIIUoOHUww50sUVfF6r5GdSPP2294gkBXELhB4JfEIqlENfmhPI5XHkrUTvFRDUfHPx6P5qhSMVyyf31VJdRuvPZAGKCnIljclBKVUC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3vHAaJq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J8GsuaE5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CD73ph1740587
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hw6uxQ871DsIRv+VHm15KVSw
	+iaEQhZxCZPFOTPJMUg=; b=W3vHAaJqqosA5GemC3HIv3RrhoBoMe6iURMk2BZg
	8eI69PPgbZqMSAMQhBzPHU5rPw4Yg2i5gm574wyZ3BntlH/U4+fabySlm4335nN6
	6B6hy1zfNgnfwjw26GCO86RuhUhGlRHbKYuFyDot6AD7KPEjhFyEBJFrtpshAvXl
	8nNUCAvoBFBxxYWAGIZ9nkbQI/dEXqfetv2ciuQLktv5IijoJwe8EBDpzlyRbQ1L
	devSmEJK9WmpeD080hrTnRQv69c626yiKtJJ4o4tK4UQ/xZX6IVOjVNr7OrrsiGE
	VZbuZvMIx+YRvFiGU/dJ9Ihcd/T85FkGV9byJc02j2rYwA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdhwk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 15:18:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7f6ac239so723880185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773328738; x=1773933538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hw6uxQ871DsIRv+VHm15KVSw+iaEQhZxCZPFOTPJMUg=;
        b=J8GsuaE50ZgrEH1q8W7Vxa6oOB0YNVrAEmnTZCZ7Ipq5IRLfcUuEsVHmxVOfjjPHpp
         mJjsWW1bJS9YVaxxsEzb1BOHYo19ZXzNsXwCGDPsef/a6PwKdZSwrXRo3imYpk9N6Qzy
         naoei8sILwlGbqgiM/Hagl7OS5TcO7k8ktWrpB/47eFS6efsAWAwQpgGaP49/bn7aIOE
         +qnuUj6/T7tUEf+B6w9uH2zS0n4n8/I/+kPxp9wkC9/uVmwsZv2KgzIDleYONPavlhb+
         4PCvWixRR8disCdQv0hK20gvyKlIgh5X32UcxySPHTJWkH2zYN6bvVxgMyTj7wvy80wt
         aLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773328738; x=1773933538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw6uxQ871DsIRv+VHm15KVSw+iaEQhZxCZPFOTPJMUg=;
        b=aWnenhV9u96AhQKGqmybSceDj0J7H2SEY+O1xKkCD7JNhuRvYygrfM7xeN6H/agtlS
         SksC0z5MTgW+aH5UyQR1ROMsHX3O57y3FNNPU4jxqP5lQSYrPDm68XfkIzkrmUHrEWFN
         PzG03aQ0nO5jMYbjnzu+ZeTN2SGeveeyxq97itJ4eBxR+24dX+dt/lzS527jA8mI94Mn
         G8dya+IHIY80LbBPZ4Nn3biG0L1qlK492+RAMAiFen91IkzmHNXnzYppL4mcKnkrwWc9
         4GVMOBKcmoNjR0k5pK7fLkTMAyCWEm2RU/O1k3pp1IyHQ9GQMpIRQbKcyu/kCLki2yyx
         ESJw==
X-Forwarded-Encrypted: i=1; AJvYcCVxJixY8nWPTYdbPW3Y3mhxg8npE7sM1C7pB90amAbtKAzXJz8Vf0ThMluzY9/VnTud8JibZawTeZpqsh8q@vger.kernel.org
X-Gm-Message-State: AOJu0YwSMMpNmlGCBfFBvzWR9nOYCX78/W5UNdp6OY91QGwykwAniNOO
	qtCiwsrifj8NjRVhO8AQq2/u5dpyCmvQj539ISH8YCXiUN0xSTWOAJspCV8utP000H5gBz2QNmk
	Lu1OIkncdm4CvTi5/c5+/x39ngNwtzJ78SUY0p1NuNdADJPO4hIbqiarxory0kD1KpswaNo/yVg
	Eu8QU=
X-Gm-Gg: ATEYQzwKr3E8SMtTwv0itgQ6q4Hx8l7xgLh8dCkfNYAYYOBcgEUNHXiFcpFfnI1guSj
	0YEaJhWkdUJIdCisJdAJgy2Pz30I3unJ5i41TTVjMZn2sNE9yBfBmAsR8XBfUQ7meWRQndTs1wd
	G0+NGEPwipfk1qQBIl1z8XlNK1NxMZsYmCdu2U8NJwZDAzEpfeO6Dj3YLJaMQ8C2yM26EDY7512
	NWP7aw0wJGmWEH4P5AgbQcIeD36ZLadE82QOFbZ1DvaPowKZUpgzRcxCwbFNQjto/rwRyeW5rpb
	ZqsNAbXt/moXAZTKwBhf/ZRqu7V1LunfMZvJxD47oIBk6ZHVHumJW4dvohOvZ3b9jL6wvEDCKZv
	ZZiwG26V4Qbf7oRdIsr9cqQvettglUXB9m/LU13kqH1BC8fkw3/6xtXaeHBfaDYCsZzcWeytIYd
	IlqEP+xKYy9+KuqX+jt3Dd+qQJ/Zt20UMtnPg=
X-Received: by 2002:a05:620a:4509:b0:8cd:923a:879f with SMTP id af79cd13be357-8cdb5a874damr12099785a.23.1773328738494;
        Thu, 12 Mar 2026 08:18:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4509:b0:8cd:923a:879f with SMTP id af79cd13be357-8cdb5a874damr12096185a.23.1773328737998;
        Thu, 12 Mar 2026 08:18:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a7fsm1008010e87.76.2026.03.12.08.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:18:56 -0700 (PDT)
Date: Thu, 12 Mar 2026 17:18:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, pankaj.patil@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Commonize Glymur CRD DTSI
Message-ID: <ke6nnmlvy5wszwhzwv3cs2aqbexjos6rbu247yad3t63plq6zs@ntwgtpc7b6pu>
References: <20260310054947.2114445-1-gopikrishna.garmidi@oss.qualcomm.com>
 <20260310054947.2114445-3-gopikrishna.garmidi@oss.qualcomm.com>
 <rdnz6fc3jfypy7yh6lkswvacarketkcepi3zfaq6pxlsljilbp@yzsyuirax2oy>
 <0330abfa-7932-404f-b3e3-f43251db2e0f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0330abfa-7932-404f-b3e3-f43251db2e0f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEyMSBTYWx0ZWRfX89kaFhXm8zFA
 /GtMVIBlkroBAa9RlAVSuTvrbOzz/RIwD4E1Y7H8DK7LdFXUKOcCVoIckWXnpT/qY56bJsBHEMC
 LTLw+A9Nehly5EHnRnadYCH5UI/53uJFHGyx1l75NWcWdzf6we3GEh3t/9DA5oU0vix58rJlLo7
 /42s59DiftiYrXx8w1pnJXZNDjNiuEhz3QR2bgawD/pvvlprInNpsmXPT2sieQkSR+6pWbEgDpY
 RS9xNRklipc72INF5rBc4V/BVjfe5oi0fi80+fVAaIWZZBVDg6iWS32/pIiQk3/14FVLYroZmgV
 aJe0rfGShv0SVnOU+ml5wiTdUb6IedW1734VV/1ZEF/jo+J+uoesKGgQBZfVb3Z6Nrr/J1rrfP7
 IBBA2wqq1nnJhSwtSoXfEQPaVCHMsbUWNBJ7ByDLeLMbOyltRan6Bq1CBRKOS6nAfk9OZyfwLJr
 Q0qDku22JaQ42q5fFgg==
X-Proofpoint-GUID: Ma8VD4A-NxoDdqHHz2p5j0VpUiS0dOve
X-Proofpoint-ORIG-GUID: Ma8VD4A-NxoDdqHHz2p5j0VpUiS0dOve
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b2d963 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=d6TojosC2XHYXO-6eDEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120121
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97258-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: BD36F2746FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 02:10:32PM +0530, Gopikrishna Garmidi wrote:
> Hi Dmitry Baryshkov,
> > > Commonize the existing Glymur DTSI to allow reuse across the different
> > > Glymur SKUs.
> > 
> > Is Mahua a Glymur SKU?
> Yes, Mahua is a variant of Glymur SoC with the same silicon but with the
> third CPU cluster disabled.

Your next patch points out that there are more differences than just a
disablement of the CPU cluster. I'd assume that Mahua is a sister
architecture, but not the same silicon. Please rephrase your commit
message without making assumptions and being more explicit that it is
going to be shared with Mahua, a different SoC.

> > > 
> > > Also leave PCIe3b nodes disabled until the PCIe3b PHY init sequence
> > > support gets added, since it's disabled at the UEFI level by default.
> > > 
> > > Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/glymur-crd.dts       | 586 +-----------------
> > >   .../qcom/{glymur-crd.dts => glymur-crd.dtsi}  |   7 -
> > >   2 files changed, 1 insertion(+), 592 deletions(-)
> > >   copy arch/arm64/boot/dts/qcom/{glymur-crd.dts => glymur-crd.dtsi} (99%)
> > > 
> > 
> 

-- 
With best wishes
Dmitry

