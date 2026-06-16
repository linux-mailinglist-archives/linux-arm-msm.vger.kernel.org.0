Return-Path: <linux-arm-msm+bounces-113298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id olHPHxSXMGowUwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:21:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB17568AE5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:21:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kMsLiSYE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Rvg54IbK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113298-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113298-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88354305540B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35002356BE;
	Tue, 16 Jun 2026 00:21:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C782264CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:21:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569297; cv=none; b=ivJ+twXMbvL5LPxXrvqMzYT3PPPMqHz0pT8XpxdMOz50yyzadh7Ewz4hwPdJn6QCzqois6XelHPm2S1stGNfkNXYfw2LEvTk6wCZ+uBrs/yqDxjev3BFW771D9VF6JeDXnQiQBl/8uEW5jA0siZ3OYuvEjhgOLey09FDSEuKtR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569297; c=relaxed/simple;
	bh=11E88Luuh9A7pHdUZjbdVB67EIiwfHFebSQIHTGLQYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZX3Nkd4qL96ldtQm5gYPqCzsG7/pqQSAHDCTTCDzn6XBZmngRHhVJdY4RD71wmcql6D6R6/z0MWvzZ6tgz4wfDlVulrndZFYsHTiGYBgssNje2g5wkGNzzBbrbURZZGd185Jaq+ppBZ47mrL99wZyl48Pz/CxVWhZCLqAQ4iA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMsLiSYE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rvg54IbK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx65i881968
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GXLr0N/URsCJyix68R2sWZbi
	19vCcQkgs1ZPrv1rgMQ=; b=kMsLiSYEp9iBn67MtLPyXoWPNsPEFlHZO+BdwhrA
	qy+3q7g9tD/1zMOwwgtudHOJVMJkhR5tZIfgbgiaOZ2inkDi5e+91fKKoSH8fm60
	C9O2pBzWonVoZ2EaMlFmlgUhjXFrR8lvryhGycQOR1eebJYd6utn+4PniDxeaT7z
	obzFMwPOVKnqg0PMtfWy6EB6XguX7z0TYz0BI5meFyjlRI/v6/IwoubpMzOkd5Un
	HKEIx8VE5uflNsoOqYj9IXFAyvzSMfmuPCbVwmoSW8xA8O4pabO1qIQTrqv/1ij+
	jjGIgq00g2rQo1Ig1y0EAZBlQjnkIdQYhGB++9bM1c6d6Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0ks8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:21:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91579011fd1so599118785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781569295; x=1782174095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GXLr0N/URsCJyix68R2sWZbi19vCcQkgs1ZPrv1rgMQ=;
        b=Rvg54IbKXyuTMunM7GlK8cL9DZXkld0cCJxfGBhtDfTOa+J/FAmepsf6GIKumOprpn
         45CYmOEgKEv9MONNxVCrnvAyszq5vt05ppbjDW90QYjBy5FXr7pzqY7jDrxeLRlk6h6A
         BavzKvsyUsX4xUccPQQrJDn5+4NWTxmN11+M5MSwiaSpD0CAt24n6Dt0HjVlYyu+wt/g
         dnAWCX09LnICIqkTpqOYOhOY0GJO0qm1aAOEpE+2A7W0nzNU+ZSnbkzQOp4QucAST+m0
         hXxePlkt4zmQLNjoT0Yj56RUsfJSjn7ib3C9aWMEpgPGEGlilhtQqmoP9ck4QH4wKz9X
         2NwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781569295; x=1782174095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXLr0N/URsCJyix68R2sWZbi19vCcQkgs1ZPrv1rgMQ=;
        b=FOc+QoTEJmb3E9CcM5LM4Dq55mNwTctwW8XLCA/01yxP4mgIVV9FwUIAYDj2nJI0JY
         fuIv8R2eHnnhRtJKSnrEI7njXDaykNsH9me72o9d1ChduZ/+eGd+VjuZxACMxB49FyDv
         BYWrStstXSV6zcwQB1oJ02pKgErRpcrcpC+VLJqfw3/EwwK6rAEHqR0r+xjztmEJVWq5
         YJmJfUVmDdiNc71crXjI+h+4fVqCu91U7khdQVs1M/2eJPU4V/FHa9wclT23z2MvVmPO
         6ASoOpPBEX1iTQy31BFv2VeitD2ncuFQb3YuhZrS7w0y4gMgZgAqivVW1a+xHlxf1m/N
         my3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/jdw0tHtK6DITXpXn4wQIFOWkc3M9Z9lPzw7gDMkXM+woO+yzgOzaSmtr1EUlJCvpiE+DnFxLYr/t7LTHF@vger.kernel.org
X-Gm-Message-State: AOJu0YyLswXDr50gUn26AFMdDbtYeq2vzTYeRhojRilLQQVUA2LOBe1W
	IFmHn2qu+8iekoYbHyEw+j0h03P6XILjj24Gsd66n0TFR7IiPH7j2uR6+xxCUU9lWWZ25V/tZkb
	WkBgaxkxoX+B0RZDOUi2CDIw1KSUl9HTOksY8BiOGyp7HFz2tJAokwfGmoLdQ8TeNzq68
X-Gm-Gg: Acq92OGfLPFpR4J598Cy06fDT9Z3zLtn1UKbvZ2PNkWkhQe6qPtwIE4hYzU9se5JBDK
	9HVCt4h88a62ZrexjjKxkBbEFOlhm7wWa5s1cTpUfHEc370g0KOpgl3uFOQdsKIYYf7du21pFVN
	gulRKnlcMp80MAHqRLVKcR75tY/yQis/wMc1x2LaSiacBDkV/uWksdRgjd/so3ZI7FFWXyL7cD3
	v4qNN7DSpexkC/IoxM4EFkLZ2rLFjF6x2+jnLLOagin4GlRHCVAoetBOYkP3XIwn+c3j3Y6JquW
	Ov885VA3VPWKUgJV0Z9rDui00F1Emu55dNwsp1cBTU2lJWGxihN9EcaZ9u3pYrWelt8+BF2uFXK
	Oizt56Uri2hNzBhM/wEFgxL4fnFJ+/F1qLas7QcysH4iQFwZe8BkpdQPxTyhmYvl5rpS4TvDAb/
	C/+3hgNod7YQZ8sX1UPSbN+yTIakhlIByrvxY=
X-Received: by 2002:a05:620a:2728:b0:915:a457:bf94 with SMTP id af79cd13be357-91c48262296mr197856085a.48.1781569294761;
        Mon, 15 Jun 2026 17:21:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2728:b0:915:a457:bf94 with SMTP id af79cd13be357-91c48262296mr197853385a.48.1781569294305;
        Mon, 15 Jun 2026 17:21:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c05abc0sm2661311fa.14.2026.06.15.17.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:21:32 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:21:29 +0300
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
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <sdm7sqiokmsgczeat2mxch42ois5rwabav6c5fm7abct2xoepf@j3kraqrjvpoc>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
 <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d25f24ca-5bb3-4276-ac8f-8340e8fb4ce8@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfX5jgPKv6oRY4I
 KBFqZRnfyKHzSyz+7YNpERWy2Ypobht8gsrFKstWDSNjH/8/Rz0/A23MJ8tYwyXB4Jx9MY54XV4
 GaPNgJLic2EP0+qxv4lM6k6r3+Bu5n4=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a30970f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ak52lZM5eA1PxQ1fx0cA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMSBTYWx0ZWRfXzZuQ3LRgGGnq
 muvohTaoeKryqn0IqJY7ThElR2My+73qA6EmzLWancNAR+0TYkOXDmLS1J+B3rgh3UhRSkIzKod
 9qMy5iro9H68Psxqw0rcZCrg5JScuFO7U6WgQ70QH4s+TplYHPnlZOncjZViGdruw7jCWO7+vZ7
 XdnCTq84UAJGQB3NvQvECbAzCjp9H2/eJNX9DodJCDwTNUGG2KjBc/bHXScyvSMKmk2OCXUfAoz
 i+BJQ5QxNt5KvU8cBVEY4J5zdyVTr2QF7c3xqlCuT/UIyZrICU1/3pcy5B/Inh7sQZm2wrVEbBB
 caTADG2FK4R7Pe6vURrZeiEbQzuiHXZHIggqzaj4Qp9nKJVRyvGt2mUj7anOSFxamoHit6BhE5p
 mNxjuRUekCVhG8VdWq1fp+1ONGJKoISDT9BIrKw5M52UJquYsSbbZOxebR74y4G1cw+Xw4SJa6o
 7uqJCVpHNSimcyhvg7A==
X-Proofpoint-GUID: _LjEQkSdmLTbhICnPsmD1C39MQCICFIM
X-Proofpoint-ORIG-GUID: _LjEQkSdmLTbhICnPsmD1C39MQCICFIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113298-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CB17568AE5B

On Mon, Jun 15, 2026 at 06:36:51PM +0530, Bibek Kumar Patro wrote:
> 
> 
> On 6/8/2026 7:25 PM, Dmitry Baryshkov wrote:
> > On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
> > > On some SoCs the SMMU registers require an active interconnect
> > > bandwidth vote to be accessible. While other clients typically
> > > satisfy this requirement implicitly, certain corner cases (e.g.
> > > during sleep/wakeup transitions) can leave the SMMU without a
> > > vote, causing intermittent register access failures.
> > > 
> > > Add support for an optional interconnect path to the arm-smmu
> > > driver and vote for bandwidth while the SMMU is active. The path
> > > is acquired from DT if present and ignored otherwise.
> > > 
> > > The bandwidth vote is enabled before accessing SMMU registers
> > > during probe and runtime resume, and released during runtime
> > > suspend and on error paths.
> > > 
> > > Generally, from an architectural perspective, GEM_NOC and DDR are
> > > expected to have an active vote whenever the adreno_smmu block is
> > > powered on. In most common use cases, this requirement is implicitly
> > > satisfied because other GPU-related clients (for example, the GMU
> > > device) already hold a GEM_NOC vote when adreno_smmu is enabled.
> > > 
> > > However, there are certain corner cases, such as during sleep/wakeup
> > > transitions, where the GEM_NOC vote can be removed before adreno_smmu
> > > is powered down. If adreno_smmu is then accessed while the interconnect
> > > vote is missing, it can lead to the observed failures. Because of the
> > > precise ordering involved, this scenario is difficult to reproduce
> > > consistently.
> > > (also GDSC is involved in adreno usecases can have an independent vote)
> > > 
> > > Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> > > ---
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
> > >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
> > >   2 files changed, 57 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > > @@ -53,6 +53,11 @@
> > >   #define MSI_IOVA_BASE			0x8000000
> > >   #define MSI_IOVA_LENGTH			0x100000
> > > +/* Interconnect bandwidth vote values for the SMMU register access path */
> > > +#define ARM_SMMU_ICC_AVG_BW		0
> > > +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> > 
> > totally random numbers, which might be different for non-Qualcomm platform.
> > 
> 
> Ideally, any non-zero value would be enough to keep the path active.

This is true for Qualcomm devices. However, you are adding this to a
generic code.

> Here 1 Would be enough to keep the path active, but might be too small to
> reliably keep the bus active.
> Other is UINT_MAX, which will reliably keep the bus active but might cause a
> power penalty.
> 
> #define ARM_SMMU_ICC_PEAK_BW_HIGH	UINT_MAX
> 
> seems to be suitable here to reliably keep the bus active by BCM
> for both Qualcomm and non-Qualcomm platforms (with some power penalty).
> 
> LMK, if you feel otherwise.

Shift it to the qcom instance or provide platform-specific values? (My
preference would be towards the first solution).

> 
> 
> > > +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> > > +
> > >   static int force_stage;
> > >   module_param(force_stage, int, S_IRUGO);
> > >   MODULE_PARM_DESC(force_stage,

-- 
With best wishes
Dmitry

