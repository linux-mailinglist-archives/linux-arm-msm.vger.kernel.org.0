Return-Path: <linux-arm-msm+bounces-97201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHCeGsuwsmmYOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:25:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2456271AA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EEA23058DE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E8B1FDA61;
	Thu, 12 Mar 2026 12:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SNYpNbs/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NpG5rmAY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54D7184
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318016; cv=none; b=Al29uXATVcVHwlSu78gHbLvnJCZc8V29SbSulXYDDRsWHi6fnMxNUV18+DJgXDkCAoznGcXPOlUc1KeAKx0WG2vPkzdORAoPSlWOOqyTrph5QgrX1g28h4HJMr39KN8UVkO51/UXbcmKzzM1ZJPtec3i6enn9Zp84Jdb8NU4onw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318016; c=relaxed/simple;
	bh=uvZyXpvSIzjkEhAhqcybddGX6aL/FduKO6bLICARU28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKx8sBUk26RuOz5M2cJLvZfVxMsA/xKUtGjN1Tk2l2egmIS1FRuKAxp2J8fbGSlNvbThX2Td+OJ2FKRBA/cwWCuJPrNmC5aYMqz1cTmqB5IhB/ROYKA8sxM8me/D0MaFqxxShTZnSpRpyotMbWwRI4n+1OrrAxRvszo2WI+4bvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SNYpNbs/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NpG5rmAY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9ltdd4025716
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IKXUOntQYsG3lN4Y7nqak0OL
	uSe89G4F8ELwm8O7w6k=; b=SNYpNbs/FUfMLJVVWFKHxvuhCz039j/dUNPWDXA9
	yNrAwkJu0ozKUsZjvQAtE3PGLQt4noyeL7XDaa/qJUUF3zQmY09V1xDCUdwWT+rU
	GHjRMXXb97dF20rsxXwexMBUopRQbulOcUb7iQ9svHqepQLCqy7kxR0EHv9ROmN3
	lH06Fnonh6/qH0NEM495/vmoIz5KI65cUCnDFZizHIkLLWmuCi/0koNGWD2mNJ2o
	/emf+Ty9B0iqSgMKvDSOFtUKyy36DmUEJ7bL39IS8uUW9VcrasznifWCDt//otHG
	WqPVTgytQdOyObqZeGNpTKkvSRmtHBHZotXh1s71XNMsLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50t0nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 12:20:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso111557985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773318013; x=1773922813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IKXUOntQYsG3lN4Y7nqak0OLuSe89G4F8ELwm8O7w6k=;
        b=NpG5rmAYD1qafkWLpx61M+S76m+jT85/BjEml34Px1brlUhG78eB0QDScKOOvu6uRc
         0AnpLU/NshAMjGbfUtPGxSenO0o/QRVzk+/jBH0EIrHLndpbMylkS7dpWM9mu7kxgydY
         jq1wXBd92n9VbYKMF52ke0yWV+/RluS2jtTKCzqjx2m48I0o6V2QNz4VzpEkZq+9LxSB
         XM9W2Dfq+kslnygR1E64BN+5JAILb2e0gzrAsS9+IWTL/8Lodu49qb0xe+GBTWdw84XH
         uofpMIsuJNFKmmMYvHrBK+w087JyWq70P2t+KPj3XpYc4CXBmu4ShUva4JsQYnDVC1Uk
         aH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773318013; x=1773922813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKXUOntQYsG3lN4Y7nqak0OLuSe89G4F8ELwm8O7w6k=;
        b=lQRTiWxU97WCaFlY+X6BLhIrlmZYSovgtNofbXi62j1h+PTI5jL1d4tgq8tg26H8kJ
         U+iEOuSsqkirkS4tmWPm9IlXF2VJw/ToZSnRkx7lIqnzbcCGxjQl4NfUgwGYVDiInzhL
         M/XjZxfHm3LErm3h8y7llEHJELNAU756EhDgurWwwspLGx8zod8RP+xVE9Cc6Y9Xbks2
         LqN/rA0liK68AwckckyBpROftd62x0+wKmH4WoFNv72gNK1JzhD8zDllwn+4Y7zDP4bs
         y8mwYJXv4h0IKaqCvcPrUuPpAzuTnb+KBdKdctui8e0Rqg3kUbzW2cqj3bmctlswTj31
         VhVA==
X-Forwarded-Encrypted: i=1; AJvYcCXsuD9wMzI8Q/Sgfv9MkbJWkQn6zScA1XzY8fq8ANvbK7OWmHefF3PIum5ecYVUcdYgNDT9+AXx8pZJYNDk@vger.kernel.org
X-Gm-Message-State: AOJu0YzrX02bTuFl7WX8FfL+Hw12vOyYaoruP5Gpyh/dO8GcLtvr//gR
	NJ1872D3HpE1P1P2jPKgctHMHk00vr3dRx3Vy+yzwJlcJeQ8g/gX+9KBz8XdFxImE8cX6KHSzaJ
	qZPPAVJe2MI55tlHGxhqqFkXAdEyuPPgRwDrg0s8zPPoznECyLfMLEc8P6dryYrkuLLqS
X-Gm-Gg: ATEYQzxZoWAwTk5QLUj7hDob7QJQV+Qcd2Yxo0AKEdWOsshbhbKML9EM1Z2ZjcYU3xI
	qzlM/9T4grbPxhI/OYe6VWjQeTVlXzcbBgcvnsH+LcFu1k3rqE2Y6mJ0zibfnQIIB6Frg32kweM
	oBKSPw5SeCE4JWamJ45dspIHnGH67yi3n+DMce8K8N/gkMBCwt1EooPRdprZRmyMkXeiR/OH+f+
	7Chel5O5sFDazGTmWrtQSyQy+X0q2Zhd4S5JcBMKkjXDF1NPGU9zKHPsW2QATyGybJsTF88v7hQ
	mK9VWlYLnOXXHCQKsF/XVv4y6nULuHio3OZjaJ7yrn843ggKP54e545t3sQdEm1epAWK8yg81eP
	WN7gCrluCEmp4YGZaRtiieAUiWqOhpSS/PQ==
X-Received: by 2002:a05:620a:4489:b0:8cd:949e:5e31 with SMTP id af79cd13be357-8cda1a56246mr683701685a.57.1773318012594;
        Thu, 12 Mar 2026 05:20:12 -0700 (PDT)
X-Received: by 2002:a05:620a:4489:b0:8cd:949e:5e31 with SMTP id af79cd13be357-8cda1a56246mr683695885a.57.1773318011705;
        Thu, 12 Mar 2026 05:20:11 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe219c41sm7792937f8f.29.2026.03.12.05.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:19:40 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:19:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: Introduce Eliza Soc base dtsi
Message-ID: <tvpyiv2fznwmc3udtcgbtkbg5xzbd6u4vtivupgq53yrytqbmw@ng4worw234wy>
References: <20260224-eliza-base-dt-v1-0-54e8e3a5fe43@oss.qualcomm.com>
 <20260224-eliza-base-dt-v1-2-54e8e3a5fe43@oss.qualcomm.com>
 <521fcb9d-6538-430a-910e-0e4e9df2c693@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <521fcb9d-6538-430a-910e-0e4e9df2c693@oss.qualcomm.com>
X-Proofpoint-GUID: hxWT_GSCC8VqUIO6X5VcHIYRwZsao9l4
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b2af7d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=EUspDBNiAAAA:8 a=uSqJBDpC_HD-RXYSHlsA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: hxWT_GSCC8VqUIO6X5VcHIYRwZsao9l4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDA5NyBTYWx0ZWRfX1W3NpdOeVJX1
 CmnLracSYvFWXzYkWGx8gCvLICQa28omJh+WT8eJaU3v/gacNKBWUptisp1ZjynY6lhp7umkzw1
 9mvKw2xFgup3djW8ykSq9B+JICltOHofep9Cd1w1uTxy/4tE0WnVhiC8hllH/v3GoQIBKhYrSPw
 dshaO02aQ1ndVIhSm15tX9ZSJcwP+muD0xysDUnUnQGEfufrjtO6rAZO6/7l37OPHeuFhy7YYWW
 BojyNc7bYX0xk21FlvRsLnn4FlXaf9z/1LsFGj5HberDRSn3EqEKR3oTI3+ciO6jjVvuiUu4J/3
 9+oagZTYC4xuYuzKyDUj+xukdADv/1zbVPm3hKAcp4sxDQDhdw9+y3n8MQebWodjJocA18eDYwM
 kiBBVD3b5JmikPuE4vsnmHvGHzH7jIThtO4nVklgXeEXQkLXCrdE6wOtSvuUrTvOtLNAfHnMNWd
 KyPLCkW5xuF7aROF9Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120097
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97201-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1.5.137.32:email,qualcomm.com:dkim,qualcomm.com:email,320c0000:email,1fbf000:email,c400000:email,oss.qualcomm.com:dkim,1.4.236.224:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D2456271AA1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-02-24 14:06:55, Konrad Dybcio wrote:
> On 2/24/26 1:13 PM, Abel Vesa wrote:
> > Introduce the initial support for the Qualcomm Eliza SoC.
> > It is a high-tier SoC designed for mobile platforms.
> > 
> > The initial submission enables support for:
> > - CPU nodes with cpufreq and cpuidle support
> > - Global Clock Controller (GCC)
> > - Resource State Coordinator (RSC) with clock controller & genpd provider
> > - Interrupt controller
> > - Power Domain Controller (PDC)
> > - Vendor specific SMMU
> > - SPMI bus arbiter
> > - Top Control and Status Register (TCSR)
> > - Top Level Mode Multiplexer (TLMM)
> > - Debug UART
> > - Reserved memory nodes
> > - Interconnect providers
> > - System timer
> > - UFS
> > 
> > Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		cpu-map {
> > +			cluster0 {
> > +				core0 {
> > +					cpu = <&cpu0>;
> 
> The values of the MPIDR register (also present in 'reg' of CPU nodes)
> suggest all these CPUs form a single logical cluster
> 
> [...]

Will do single cluster.

> 
> > +		l3: l3-cache {
> > +			compatible = "cache";
> > +			cache-level = <3>;
> > +			cache-unified;
> > +		};
> 
> So far this has been defined as a child of one of the L2 caches, any
> reason for a change?

Will move to L2 node.

> 
> [...]
> 
> > +	firmware {
> > +		scm: scm {
> > +			compatible = "qcom,scm-eliza", "qcom,scm";
> > +			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > +			qcom,dload-mode = <&tcsr 0x1A000>;
> 
> lowercase hex, please

Will fix.

> 
> [...]
> 
> > +			ufs_opp_table: opp-table {
> > +				compatible = "operating-points-v2";
> > +
> > +				opp-75000000 {
> > +					opp-hz = /bits/ 64 <75000000>,
> > +						 /bits/ 64 <0>,
> > +						 /bits/ 64 <0>,
> > +						 /bits/ 64 <75000000>,
> > +						 /bits/ 64 <0>,
> > +						 /bits/ 64 <0>,
> > +						 /bits/ 64 <0>,
> > +						 /bits/ 64 <0>;
> > +					required-opps = <&rpmhpd_opp_low_svs_d1>;
> > +				};
> 
> This OPP is not supported

Will drop.

> 
> > +
> > +				opp-100000000 {
> > +					opp-hz = /bits/ 64 <100000000>,
> > +						 /bits/ 64 <0>,
> > +						 /bits/ 64 <0>,
> > +						 /bits/ 64 <100000000>,
> > +						 /bits/ 64 <0>,
> > +						 /bits/ 64 <0>,
> > +						 /bits/ 64 <0>,
> > +						 /bits/ 64 <0>;
> > +					required-opps = <&rpmhpd_opp_low_svs>;
> > +				};
> 
> There's another one (201.5 MHz) @ SVS

Will add.

> 
> [...]
> 
> > +		tcsr: clock-controller@1fbf000 {
> > +			compatible = "qcom,eliza-tcsr", "syscon";
> > +			reg = <0x0 0x01fbf000 0x0 0x21000>;
> > +
> > +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> > +
> > +			#clock-cells = <1>;
> > +			#reset-cells = <1>;
> > +		};
> 
> [...]
> 
> > +		pdc: interrupt-controller@b220000 {
> > +			compatible = "qcom,eliza-pdc", "qcom,pdc";
> > +			reg = <0x0 0x0b220000 0x0 0x10000>,
> 
> sz=0x40_000

Will fix.

> 
> > +			      <0x0 0x174000f0 0x0 0x64>;
> 
> I see this region is allowed by bindings, but not consumed by the
> upstream driver
> 
> On msm-x.y, this is acessed (optionally via SCM r/w calls) to write
> APSS_SHARED_SPI_CONFIG_n..
> 
> Seems like Lina tried to get this upstream at one point, but the
> discussion stalled
> 
> https://lore.kernel.org/linux-arm-msm/1568411962-1022-8-git-send-email-ilina@codeaurora.org/
> 
> If I'm reading this right, we do indeed want this register write to
> tell the firmware about the actual edge/level trigger that's requested,
> but maybe we should do it via a syscon instead

Sure, but not as part of this patchset. Since all older platforms are
impacted, it will definitely have to be a separate effort.

> 
> > +
> > +			qcom,pdc-ranges = <0 480 8>, <8 719 1>, <9 718 1>,
> > +					  <10 230 1>, <11 724 1>, <12 716 1>,
> > +					  <13 727 1>, <14 720 1>, <15 726 1>,
> > +					  <16 721 1>, <17 262 1>, <18 70 1>,
> > +					  <19 723 1>, <20 234 1>, <22 725 1>,
> > +					  <23 231 1>, <24 504 5>, <30 510 8>,
> > +					  <40 520 6>, <51 531 4>, <58 538 2>,
> > +					  <61 541 5>, <66 92 1>, <67 547 13>,
> > +					  <80 240 1>, <81 235 1>, <82 310 2>,
> > +					  <84 248 1>, <85 241 1>, <86 238 2>,
> > +					  <88 254 1>, <89 509 1>, <90 563 1>,
> > +					  <91 259 2>, <93 201 1>, <94 246 1>,
> > +					  <95 93 1>, <96 611 29>, <125 63 1>,
> > +					  <126 366 2>, <128 374 1>, <129 377 1>,
> > +					  <130 428 1>, <131 434 2>, <133 437 1>,
> > +					  <134 452 2>, <136 458 2>, <138 464 11>,
> > +					  <149 671 1>, <150 688 1>, <151 714 2>,
> > +					  <153 722 1>, <154 255 1>, <155 269 2>,
> > +					  <157 276 1>, <158 287 1>, <159 306 4>;
> 
> I'm just going to trust you this is correct..

Will double check before repsinning.

> 
> [...]
> 
> > +		spmi_bus: spmi@c400000 {
> > +			compatible = "qcom,spmi-pmic-arb";
> > +			reg = <0x0 0x0c400000 0x0 0x3000>,
> > +			      <0x0 0x0c500000 0x0 0x400000>,
> > +			      <0x0 0x0c440000 0x0 0x80000>,
> > +			      <0x0 0x0c4c0000 0x0 0x10000>,
> > +			      <0x0 0x0c42d000 0x0 0x4000>;
> 
> The bus is partitioned, just like on Hamoa, please describe the
> secondary one too

Yep. Will do.

> 
> [...]
> 
> > +		intc: interrupt-controller@17100000 {
> > +			compatible = "arm,gic-v3";
> > +			reg = <0x0 0x17100000 0x0 0x10000>,
> > +			      <0x0 0x17180000 0x0 0x200000>;
> > +
> > +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +			#interrupt-cells = <3>;
> > +			interrupt-controller;
> > +
> > +			#redistributor-regions = <1>;
> > +			redistributor-stride = <0x0 0x40000>;
> > +
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> > +
> > +			gic_its: msi-controller@17140000 {
> > +				compatible = "arm,gic-v3-its";
> > +				reg = <0x0 0x17140000 0x0 0x20000>;
> 
> This is supposed to be 0x40_000 long, otherwise GITS_SGIR is cut off

Will fix.

> 
> I see many DTs have this issue, I'll do a mass fixup
> 
> 
> > +		nsp_noc: interconnect@320c0000 {
> > +			compatible = "qcom,eliza-nsp-noc";
> > +			reg = <0x0 0x320c0000 0x0 0xe080>;
> > +			qcom,bcm-voters = <&apps_bcm_voter>;
> > +			#interconnect-cells = <2>;
> > +		};
> > +
> > +	};
> 
> stray \n above

Will drop.

Thanks for reviewing.

