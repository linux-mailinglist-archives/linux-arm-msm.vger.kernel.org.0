Return-Path: <linux-arm-msm+bounces-117961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UOQcJEGOT2ptjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:04:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F37E730CAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 14:04:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Dk0OYiTT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LbH6dWt9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117961-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117961-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 409C93033025
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 12:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A37633B6F6;
	Thu,  9 Jul 2026 12:01:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB7E410D01
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 12:01:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598487; cv=none; b=A81JbgE788Li7YJ8CEYR8MSdETkSJ+80eKWaWeBH1AySsX4u+8a6g+Mx8YDPPujNZgy9lzToX9sbyyMPP68+FGIJF+XuJcTai8Efj6WTIrhdODc9Qe6mjHr5UrAHeOfCs/A+Z0n/BJShLRNh3RK2qCPgeJ1NLRckZ6iuWGb/veA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598487; c=relaxed/simple;
	bh=dSRokIMG5FGCZ4G+yYBu/oIlzG/8dd+9MeEg+3C5DBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lr9mey6bIq47UdpTxiireWWQ755z1992G8JZUZRjyFGwu6haxDHPZp0Db/mY2ikAZ6Va8WDzEMYnyi0sz61MOf74Ry3m2+UGUSwnuZURUaoUKPlmVBgd11MpucHq65NshuMcrsPQE8aZmr2ZON+LpyvpJ1p0mhhJ/ebQFjzYGm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dk0OYiTT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbH6dWt9; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNB4U1575375
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 12:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lSRAHUem76Xncoxq5BufxBYy
	3+SviaRcXkZ1QjWiysc=; b=Dk0OYiTTBBpY3gWGfrqEtNt4Xc3PNPcfwugHEUjy
	klD/ypb045J/c1uZs9YUjlVDNfGidVnOs0OQ8oRmRlXcijHfopZ1qSfOyaff2/VM
	WbnrnX+DRZnBb6NdGJxZr4bZ2E/TwKbe5Ma0Od6mCpILXnwEKpa60rarUBEfn9rw
	YGtKrGxujBfFVXLxbSkZtxj1OU45GQv7wrXNUNFexxBC9Dgt7gK7uCbse3W3F0vx
	qzJdRfQi7kIkHK72+CRp56wYgYhxvNfzD9AzyR245mZKEigjLplcGpWp+bOJE5D+
	SkpBw9LOtY/mNQu5JrR63Ey2WIApy2oo46+BO0EuRYVwzw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwc2a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 12:01:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380fe2a3fc7so1918079a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 05:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598484; x=1784203284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lSRAHUem76Xncoxq5BufxBYy3+SviaRcXkZ1QjWiysc=;
        b=LbH6dWt9+wlR3Acrk02BfqbHdM4yM6OBSZV1AzNPMFjcVKPDxpPwU2BSu1hozsjd0X
         VVGEmuy0RA4sFk2Bccie/+Oe1nOyBbHKZC0s9WreDa3/CCNTArnPSLRlZ3ESUxylAj5i
         WEIV0rA+hmHSALvdypNHts5XmcKsLlRvx63LN7vEHn6Ahq9627Q5HezVRWgfVoa6oKVR
         9WyIp87tgDR+Ydr7kIM2m/HvxgOo3+ZmtKDbFyX4k1Ug6hU+BEkpNQRcurD+RERj/zIr
         2QntrZElHAtWE2VcY+b1Gajd9SKMUC/YRTA8M4kN3CHODGvDG6QDvxNNoGvTJS2Kof/a
         OVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598484; x=1784203284;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSRAHUem76Xncoxq5BufxBYy3+SviaRcXkZ1QjWiysc=;
        b=IU+DgB4Kefg6aOwd4yDDE7Y7VPlRY4isYTtT/4I5NbPlDVUfl4+3I64bNwXyuVBZco
         wUJy6/3iGTpt2SgdgD4ruUhcKku7w73LR0C3tTBXaJn/e7GV+LEBJJMzZVp6nizbLMQT
         Y43SwCPIBzoJEaEtG2QOmij54P6fdVFKyL11LKcRNA1Cn/rTIPWScbylMUy6mBqHee05
         S9BYyhHjoI1qkhS8JV3GJH7ZdTogp2iOtr9jblr4FvJdY51hIRcSoVfOH7fucZgFZvr6
         bOkJEF94baUvS62bDqIP36p9HDAQl0h7jNJEdWFYv1K68rNu4/mAgsBGkFyY3Y8TqjEC
         nxdw==
X-Forwarded-Encrypted: i=1; AHgh+Roz8w4GGP+t88ed1aEle1g4AMnY9MTdHRZycPHmchLjQmTD2tWJmtRH/HzlkpTkEvVaXBGy8W52QBIJPAfd@vger.kernel.org
X-Gm-Message-State: AOJu0YwNfxxmj6LV9lTH3JrVKUdCUYi2PIOyCdoRin0vDVVeKBeIaKoo
	mnTTjOMPCrMJyANLbTieptdr5NG2X6dS93XGg8ZP+eqyZssF+4BIup0giu1B4Sy3C/jm2CKKC7v
	VoKkn1EY/zbejqzQyAlCDkOMmnDSjczkBXuYn1yhDCVjjbSrobMAhIYS1hmTFm795H1BE
X-Gm-Gg: AfdE7cmIo+jSEggXILkW4qonhDNeNSEGCjvxsBoRpiAGDne7a2anaieHdZ8ibsAHBP8
	tcYL/tqsHT8p7oFSk7HfN81l5KkSfiPQNTvBXyjdO7pLzOjLHQzxu2NGztZiGANDTasKxukj5YC
	Y2JnIH2+vJa7PXcE0yk3GQ7wq4aO6KW/+20aLF6L4veC3KCH8lefPWAJk2foIXyBG69ZpbsJjMs
	veE+jV8vI08DCqDJtDPDgG5GYeFxOFtZREajZfT9GrR/Yyri/NzNYDQzbXOncRE2UhradYQQ/bA
	DD1FQbo7t2/w1V5J5T/72fSv+ficZT1vsUqAm0LLJ2crjW4noOmtMJlSMdE+wzwimZoahFrEzRZ
	gL4jPqdMzTI9wuC7mr9k/I4hHyYjNSJI47o1gfBqleNA5DhJPiNME0YuruPLS
X-Received: by 2002:a17:90b:4cce:b0:37f:9ce0:af32 with SMTP id 98e67ed59e1d1-389421ac479mr7391618a91.29.1783598483679;
        Thu, 09 Jul 2026 05:01:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4cce:b0:37f:9ce0:af32 with SMTP id 98e67ed59e1d1-389421ac479mr7391549a91.29.1783598483101;
        Thu, 09 Jul 2026 05:01:23 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm34921181eec.19.2026.07.09.05.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:01:22 -0700 (PDT)
Date: Thu, 9 Jul 2026 05:01:20 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <ak-NkIoAuiZ_8q9u@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
 <20260709071407.hd2etfpud5dq44yd@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709071407.hd2etfpud5dq44yd@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX/5pPvt2kKedS
 yGWmdYC3yQ7YtfI3IYdztj8BUHa5DtdDofRIFkwZKBsZZgd9my2qJU4/QBH9J3qF0t+WG9xrhcB
 zEFFXxSLZXoJjOKUdzjuT2WaRxo4IeZlPQ/xM1ZsDgZ4isyGSf1XI/HAVlhva21CA5TeO9UBKFo
 mxzNH2T2MlwdPBbshw8zl30dn0PVQ/iWe9JeozI7UuYA8Q067NzU2pwVgGHsBFxSDDaI58blUC3
 4x4uhEC2oD0mAKnGCajfUpzqSM4lVKyu5acBMeXzG/DHLEa7fsSgs/kd3RO5dZwxlakKVnQJRTk
 hWgCZwKxCAmLLMZHNXTmeJ7WOK+gzdxgmt730ziD3MEzRI46Nb7gpxVbpgxZmi0WZNPjNPGdGUr
 hqsa/2uB1NXvGMywGBJce74LrrwFmtE+Se200vRZ2IjA0Ka4zVShVbRAifdCekPeQ3UQ0UlPmtw
 LgP7wNHT9ZGdk9px+4w==
X-Proofpoint-GUID: 61F2fE-VPuZy2N0_SGyKwEaeQBWJaxBv
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f8d94 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9Iu-izY7Zm1IiM7mkRwA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 61F2fE-VPuZy2N0_SGyKwEaeQBWJaxBv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfXzGS22rQNnzOl
 GrkO8YR1Fyna7O8ysCXaLzC3ANRCdrUr7r5LYyM2Qv1i+t8mV41drE14YaZoighXr9+FLqYjq8d
 HBRBJKh2fWlXSwV0m7Y6lKWOGMmBMXM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117961-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,hu-anancv-lv.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ananthu.cv@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F37E730CAE

Hi Mukesh,

On Thu, Jul 09, 2026 at 12:44:07PM +0530, Mukesh Ojha wrote:
> On Tue, Jul 07, 2026 at 03:12:45AM -0700, Ananthu C V wrote:
> > The currently listed SoCCP and SoCCP DTB reserved memory regions
> > don't align with the memory requested by the SoCCP Firmware. Fix
> > this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> > memory region requirements of the SoCCP firmware, as described in
> > the Glymur v21 memory map release.
> > 
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> 
> 
> It should have fixes tag ?

I did consider this, but since neither reserved regions had uesrs, I
thought this might not be applicable.

> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 20b49af7298e..9ec7c256b80a 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
> >  			no-map;
> >  		};
> >  
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccp_mem: soccp@88e00000 {
> > +			reg = <0x0 0x88e00000 0x0 0x400000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> >  
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> -Mukesh Ojha

Best,
Ananthu

