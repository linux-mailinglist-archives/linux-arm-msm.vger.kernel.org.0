Return-Path: <linux-arm-msm+bounces-113297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1c8pFpeWMGoZUwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:19:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F13BE68AE19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:19:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jx1rszsO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JBcNTI0Y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113297-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113297-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9A2D306CFD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C961EB5C2;
	Tue, 16 Jun 2026 00:19:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F49212564
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:19:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569171; cv=none; b=rhv+JNRQEhz9UmBBVBUVjaEkmGZk8/CDPjiyJADQZMqy1jg61IbyPkRYaYdhRrFs/pNWAqR5EHp6nO3W9fn1aFnYhNdUfX/uwEdQvN1l4f+5jzr9qqUsFevtnSUSazhm3H853oCZbGrTKbF/2QOX0y2ybQs91kJufopiypzJZyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569171; c=relaxed/simple;
	bh=peBnrIwG8su5Bxb1yQHNnKYZ4q1gc/Q73SMJ4UjY6gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgGzImCKdcyTd9l1argFhoMS4oGsGXga/DhSt+A8tZZO52XiXIRuFegFgEME5HTCE2g7yXD4QbfZ0VYMM/N7MMw1og6mgWzvpK/4sY40m7bHKv+weDvgd3qdolXYRbRSic3r/3Q9/tqJhyQiMMKw8bO5C+Ycp0HF7be7WV6EH1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jx1rszsO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JBcNTI0Y; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxOKo781835
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KorrUBh94Ss7D1+qQOdc29iD
	hATuENeNSAm/3rBOeq8=; b=Jx1rszsO5ny/jhVDUL2G+0JMtZimuv//fL1a16P5
	NMo8DG5M46RUtxvGs5tsjIQ5IMfOIlyLPuK9elyHvX3Tn9WNQRWxOSuJSFj5ptnc
	Oc9IBaxYqt+KL3PN40dok+x7ja8tuSMerz0U2sUMHmLx8Re2oB9hYzNO/8epGdF1
	WSO3IbThNLClG7ggxmwQvjtcaQEUSLpNtuddg0OSOjFam8gyCqfC7+2gjv/zxdPW
	vzJ/d6Nmp1S5rdHOly7BWGVylQ9IxL90Yvo8hgdKWUcrQucWpufnlpbk7Cavn4Nd
	mP8HuetMKTzvLygy47Im/2copivxy2j/Clk4fVF1j5cruQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjusa8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:19:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccdfe1ff26so46688816d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569168; x=1782173968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KorrUBh94Ss7D1+qQOdc29iDhATuENeNSAm/3rBOeq8=;
        b=JBcNTI0YzS5FpK3CZgSntARiGI3OcjGyWJxB7oEi1uwHg/NomCUEaMOcFuUaAaPrN5
         Moz8z+EYt0CYcsF/+ffd9Lj/GOuPQvyV+x1tgBZ5y4ov0L/ZKQ+fYd5GEnQE2CZpVtK/
         mNm4iD6KTqJkP0CTKwyUjpocMnGCML78mZiBirGPPzbnHCtGYXLzbyUYXOPAI1PRN44q
         X503JIDXVodc51dEv8azKITOngcbuQ4CRRBA1gpnJg85HApbl52RVEBUbWNSegt6fhy1
         RyEikPWdCfKWi4caq/LDQOlC96cEAXTyLnaCGhJeDcFaQ5q2BxEwEbpoXPEg6UFP8hPj
         p40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569168; x=1782173968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KorrUBh94Ss7D1+qQOdc29iDhATuENeNSAm/3rBOeq8=;
        b=MHEnUqmBu+HQslvhXQQ62kvi9xprT/Ko07x1u+0gRDN1bf5QUMN6SFmbNMBFsuI3Sm
         D9HQ8OMi0OtoeiZy8hkJzQj3F09eIh2wOQQ0cvXESSmZNr2EvacQaEz5fJO4hxnz+Zvv
         pGGDzYQxv43xPNy/g4irMJFxX6lL1mxg5wJF6GBoPS7uuZcbg+F9gwTs0O9ksxYuOjLT
         WzusnJ05qT+kfoHL8UzHPf0Kt0rAMb7jBzM1hAAMBs1jqCAJ0or7rmxYeTlnzcleCL5F
         RvGakXJlFDPS932v+QcXeKhWiTQlO/rGzBpCAugkmU5G4rUmmcXOanNDLqsmR13NQKN7
         FRHg==
X-Forwarded-Encrypted: i=1; AFNElJ9hyepSdM0OwYsG/3boRuc5qE8vXIPTgLGoy9tEa86A6KRN6QRQFAatreDWoKm5MenirqzLpeiZxgWdpRDw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1+w2+P9Ddcz4blI8tCkN5ER0s7B7lK79KfPYRQRVUeFQYLpKH
	L4fAu0l7bbH3P4L8Jt4g8uhqVCKSRVW+ftui7G9W5szu9S9scCNEd9f+5U+fM715R2f9p7vCXoe
	SeH5r3DAfNPrkYEEWWim+12EVkvcpLYx0BQ+LMqL9BTOz846qAg24d/9YOkNQThXVMcWd
X-Gm-Gg: Acq92OF6Zaw5Uufi063RX09WZS3qsTD4z4gRZPqVue5Io55Se4Wpd+IQ05a/O0vDbXj
	EQwBwCeDHSFkZlEZP2Le+IgwPiq+K0Kg1ChYS10HCo1/ss8TkUqa9BADQP381LG5QYGvShofMJJ
	CaiJf5BGS8GcvKBcFGk1dTUkzy3iXZDFmvHTDMGK4wg7Y+tDguOhcayDQPCNoPnX8U3wEPH2Btg
	hi976QCRr7iQdLEzDiEyq4GTs/Z08ryM7L0pHCFHwGv/eeUeMWC6cu+K3ZxUowy2brnrI761o+U
	IPLjG0DYyloOQBsFo3w25tPnqU6ytwIx2NyLbrOdypPRv7ncl8V95W0HyjGpzfqiSqaDSWKlVTx
	QqT6Qg9Z96KeIWUl6JT+md4k3S4+KwW2sH6288uy07SyO3sZJvq/S6osao1Zvj9HtLbiA+JVfZy
	T/M5NWXxdYFj8QekdeFMi6Kf56VEKsy3PFdxc=
X-Received: by 2002:a05:620a:19a1:b0:915:7f9e:a407 with SMTP id af79cd13be357-91c42cc5889mr232609885a.0.1781569167566;
        Mon, 15 Jun 2026 17:19:27 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:915:7f9e:a407 with SMTP id af79cd13be357-91c42cc5889mr232606585a.0.1781569167101;
        Mon, 15 Jun 2026 17:19:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c05abe3sm2595591fa.15.2026.06.15.17.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:19:24 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:19:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <zhdacu4upv5kyvyqx5hcm6im4p7r3z5bsnup7hqu2okxyxmeib@snpseurpvhtc>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-3-2a6d8ca30d63@oss.qualcomm.com>
 <p4xnrkcpbufkkbv4kq5civbt6hiwv3warrz7jiyinsfkihfedh@jfa7sgyzot6j>
 <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26d51cbb-2d87-4564-b3c6-cc61ab900e19@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX4WJiPSp9rQ+q
 qaGD8vvbMrIhwxvbbQEjcKcMhJ+ptbSzCPiNsrsUd6bKl6v0RE1eTdbBbww9wnBnHK5dmTMFEX3
 ZoWekqvYdQKHsbzn3J9wRsawfceSLZP3bNX1HPqEV4DSQONcbNYSOviC2MjyX4ocaSLSFZ8h6J3
 w6/GzUy7uftTYtTt0hHaXu6uRkuasc4b1jbrplvohyv1q0cMGHHwrwvNilj12UX2pEy71wezwO/
 m/hoQ4oUWJi4vh9PZww0r1phJm+Yq4DntJDV8hGtzAXePfD4O4BTDmMwr+yz4yq118ILUPSG7Y9
 F0P93Ub4ryDpEiahrBIpMd7YH5TSzpHT5iS/2zBIhiE/yXtq7FRvztdrwpJCiotSEiSmBsnlCGB
 rV4Ef35IYYvz3X3bDALWouSMKaxAKY1a4jZeUyNxG8oh+pDy9oKO4nUa5EXiS8XMeFPbKilTC7p
 OArHNLVASi0dgE0Fw/w==
X-Proofpoint-ORIG-GUID: VjyqD4yVE7mqk2YLFCUul04hhDxvQSj8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX4SFwMICKrE46
 ShxJ1ESQchjuSyB/QfCACyBOA7rliHv+/K3hqPKdzIWI9PBoyMfonUFvYkxtQrp1VrEElbO9Xib
 bzQnosI4KLppeq1r28p6OoQ5mne0Mj0=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a309690 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=zWXYthO56evGz8b0qtEA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: VjyqD4yVE7mqk2YLFCUul04hhDxvQSj8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113297-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F13BE68AE19

On Mon, Jun 08, 2026 at 08:07:07PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:27 PM, Dmitry Baryshkov wrote:
> > On Tue, May 26, 2026 at 08:12:04PM +0530, Bibek Kumar Patro wrote:
> > > On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> > > the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> > > are accessible. Without this vote, the SMMU may become unreachable,
> > > leading to intermittent probe failures and runtime issues.
> > > 
> > > Add the required interconnect to ensure reliable register access.
> > 
> > Does it only concern the GPU SMMU? What about the APPS SMMU? Should it
> > be voting on other interconnects too? I guess so, because currently I
> > see that TBUs vote for various interconnects. BTW: should apps_smmu also
> > vote on the power domains?
> > 
> 
> This race mainly occurs in GPU SMMU, where the GDSC can have an
> independent vote on the Adreno SMMU. However, the GEM_NOC vote may
> already have been removed by the GPU (or any consumer of adreno_smmu,
> e.g gmu), unless it is explicitly voted by the GPU SMMU (which acts as a
> supplier for the GPU). This mismatch can lead to SHUB timeouts or NoC
> errors.
> 
> Mostly this race reported in suspend/resume cycle (when gpu/gmu devices
> moves to slumber/suspend state before adreno_smmu powers down
> and the later doesn't have explicit interconnect voting).
> 
> In the case of APPS SMMU, such a race is not expected for any known
> use case. APPS SMMU is part of a shared infrastructure block, and its
> power is typically kept enabled as long as attached master devices are
> active. Therefore, explicit power-domain voting from APPS SMMU may not
> be required.

This looks like a good part of the commit message. Please add it where
it belongs.

> 
> Thanks,
> Bibek
> 
> 
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > index fa540d8c2615dc02d941eb16bc7253204c2750bd..eefa4b836a81374ff437ab4bbcbc3fecc1590ab6 100644
> > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > @@ -3386,6 +3386,8 @@ adreno_smmu: iommu@3da0000 {
> > >   			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> > >   			dma-coherent;
> > > +			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
> > > +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> > >   		};
> > >   		gfx_0_tbu: tbu@3dd9000 {
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

