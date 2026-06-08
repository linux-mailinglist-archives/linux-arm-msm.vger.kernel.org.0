Return-Path: <linux-arm-msm+bounces-111902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ywzDLIjKJmpnkgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:58:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB9E656DB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:58:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Zh7cKoXi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a3F+oc+M;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111902-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111902-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F6FE3025C7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56473C5DC3;
	Mon,  8 Jun 2026 13:55:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3994B3C3C12
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:55:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926915; cv=none; b=SgJL/tfO+RH/7gB0WJQwHVEuUGeOkaRHNkWA76W8FkHb5dO031OZBlrHPZ8ER4mcEOPNSB3afBH5tRuFY0L3AyR9Ikbpe+m1rX4MJRTzWWRd1ciFYjXPhNVDX4X+qJMZTj0y/QmUoRS4hMKaFHuBd01VLYXUGPPjqcuh79j2W+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926915; c=relaxed/simple;
	bh=DxpEN7Qq0/TPMmz8T9HJznAY2mONEoG4Yh1I+6Oy1qM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g5EIR+6llnP5Ps48j6ckqbEGiKeavT+SakGRdfCIpbKzEbyE29gWTB4kvnMFXHqZB7DATucSEyOrdOHAW/47jQN/Q/WrZiiUjZotNSMaPs0PJJhETgp8Q6eFvheNVswId1mq+8p+hZmnoHquQ75jy3WKsuXDRB8dJRmksExTW2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zh7cKoXi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3F+oc+M; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR3WE3346718
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hjuk1KpG4DK4R94Jw4NYgXvu
	SWpQTUimOywC/vaPeSw=; b=Zh7cKoXiEuMFEPo8ZkqoCcmFe398OW17QCwiCAzh
	fbA9Ab/+aHiu1NC2P4DgdzlBl/CNlt/5mx77Jjt4E4H5FS4LgPzdI/l+26Ku1Gmx
	I7AbFXxVl2oZKY4UVyNhpJz7twU6okEpevB299J7/6lj9IrIbJ9zRJLWbfwKSpUi
	Nt4guGHM4of6S3OgI60F+uXNrnds0RW+kqboQi+QdkRwVl6F3zPkVgowir7ZpyqR
	72HRymWWvVQH8Yb1V137HL4CSAa9q0TOJG8Rn7JHSNW/cRZgylE8JHR8c7HaggNJ
	o8XWpR81VvPto07HMVD6fwYr0E3ferpDDw4NM7x+Z8uI3A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj8scn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:55:13 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-963b11561bbso1747408241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926913; x=1781531713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hjuk1KpG4DK4R94Jw4NYgXvuSWpQTUimOywC/vaPeSw=;
        b=a3F+oc+McCtkjEnue0Vf+kZ0xK2S1nm2lmO6olXJCNVAl/VxfLQHcu+hKdjB/i8RAe
         oJSajO7guzPd8CObeHBnBXoiOwXR0cLm6S6WdqCAMXQQhFF0+mN1DG4xcFl0nK5iMlPe
         Rzs71gTknfUgQmH7xoqRhFXaiJEBIOyAmfyA/zt88zTlOjCncBxScq/tUoDYyXkYKmSM
         LC6xdFYJpp0sic/7hz7D9JDpABEth39sFPK+1i/o69odNMNbWGnhiOk5Lb1nX/pGNl9/
         243CqgxUHLQEticGIek95LzezJpB309GWalduN56QJlg3Nv4OZHvcmH2/Z5e0uJUXL1M
         VuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926913; x=1781531713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjuk1KpG4DK4R94Jw4NYgXvuSWpQTUimOywC/vaPeSw=;
        b=DftZoOBopdRYLcCHeu4rXU8FoTfn3Nhu2VDonw1Uye5W9ZRXy85jS2bVRQ7WoitCM2
         fyxRFOSOWKRwJxgRu+45CFphnEFrAQ88HC5ur65d2q3tWNrwAQ2PtJ0hZOowNnksW27k
         1lA2zfKfs/T0zf8LTM7oLINDHLKntutTVdfNZjFVYdAWKZwAdYYxZa7gfWY2PzNzHeJR
         jYHAMjWP9WljoQb55q0EQZkiD9Y28fylyEd/pImSTPKl7pN5NUEJTL5aNFeMxmUmeoLo
         4dZoUXU+HJ7t4CZNYSS2gMMFRcvAHLsfcW/+ITSgMvsO0XQjWJNH8mU960UkEDzLBbz6
         SUww==
X-Forwarded-Encrypted: i=1; AFNElJ/Emb9XRQeXcQMuOcLPgtd5fhjSmMAh9Nw/+SkkHFo4wpNBmDE0ohxPzlWLLDPbVkRN1DQ2W+Fy6tkKR2Sa@vger.kernel.org
X-Gm-Message-State: AOJu0YwyNSoHXhVhEHpE6X9cuu3iMko8Lt7gEC8bLvld36ILqQ05JVrz
	1dyvkO3ap1bGd9fukwQkkrlLWXettZYLr6nCePpsmRxJEe1T5hg0s/7ASFpYBua63epKG/1wiWY
	qhVY/hOxPsy86TckPnn6tqlovCa8E3k0xtI9ey+PUiP9SeB/91ar7ROVD4wifYDBSLOF9
X-Gm-Gg: Acq92OGzvgJwhbptYmLMabxVZBTywtb3rh1nbi/gqDsvF8PwvxApx3BzgffRbPCHQFT
	GY5XVChi2Ez5XzSKZyKiz+bN2yO8CDombINNhH/1R2lqS3yDWkWUgaHd+z0Q8XdOaTL5LQbGOby
	3eCUCzKknfYyrnGePobMV6WeLl9oNebXtVUx7WJzbppz5yDLl7lkbaGSLvCV7rpGhF5AFckzhTD
	2IiROHLrX7xqFzIgDxMFES7bNs2NNwix7s2Hti0d4rA2mLeeVkfQ2U62kSslZ/lr2cfbZ7iAxwN
	0PD/eS+X/7XWullU7HP2dUyywpJ+ffVFx7P8NPLP6o7j5+7w2uwMBbN+CiideLM+RjJlj8FhjYG
	tm+z0aL5N6aCqIctyqPITgoT97pbd+6zcKEX5K0ltUxJOCER0vMzCS4eEzKV50dQBwnHDvNiCuf
	IA49Y8/TUaqbJg6q2yn7nZlFWcJTrcYPNyXxu8tgJVTxLjEw==
X-Received: by 2002:a05:6102:32d5:b0:633:1b2e:e574 with SMTP id ada2fe7eead31-6ff0300f0b8mr6715657137.29.1780926912478;
        Mon, 08 Jun 2026 06:55:12 -0700 (PDT)
X-Received: by 2002:a05:6102:32d5:b0:633:1b2e:e574 with SMTP id ada2fe7eead31-6ff0300f0b8mr6715640137.29.1780926911952;
        Mon, 08 Jun 2026 06:55:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be29fsm45071611fa.21.2026.06.08.06.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:55:10 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:55:09 +0300
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
Message-ID: <7xfxlxfqjcqdzl6gckaoyy2ioefglc7bgi66yv5khrbl6fi2zc@ivtiukdaj4jv>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
X-Proofpoint-GUID: Ktniog7rqYF3bTmxgIosCM75-Lz44A18
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26c9c1 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6LyoA_EE4LLIN3d-eQgA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: Ktniog7rqYF3bTmxgIosCM75-Lz44A18
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX0bYP6NJOb+hZ
 CY1qCQY2KsZfyDNOQAvEX09OaWbnng9iRBefj3T3V/JcHB7mtyCJjdoZocxLUyZz1C9XEdKSS8J
 ahaViK3XG9n5GN5t0YjbOw8GMH1LGc8BfbtYLtV5L9euEit4GJ72aObxLR8f14hqY5/7gYHXW+J
 HApfuQVgwKtBtmRXEquRHPuhnCV0f8fIGaCwly3kTYkABrzDpqYo9XYdtLZOubYe8B/gyqbYjfo
 Di90C8KcuIAnb5f49RG4MR+oIOgYoWDJtoF2qhVqi+Q841or0pYaqLJ95Ff+yIbDAV2WI03SBX+
 GAIS/A/4UfX7V0LBTMdI2F67G2asyGylwYLfmKtXgYYDcnPt7WTf582EiO447h93AvByJiHUtE0
 HrZN2VXwxYvSQyAP3oDfuC4b7Bgh8qlPzQTHXk1Cd29PKIMBZX3AaBJaKeMlM+zanUP9qCrS1te
 xihVElPWlYX4spK4Vbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111902-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ivtiukdaj4jv:mid];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCB9E656DB0

On Tue, May 26, 2026 at 08:12:03PM +0530, Bibek Kumar Patro wrote:
> On some SoCs the SMMU registers require an active interconnect
> bandwidth vote to be accessible. While other clients typically
> satisfy this requirement implicitly, certain corner cases (e.g.
> during sleep/wakeup transitions) can leave the SMMU without a
> vote, causing intermittent register access failures.
> 
> Add support for an optional interconnect path to the arm-smmu
> driver and vote for bandwidth while the SMMU is active. The path
> is acquired from DT if present and ignored otherwise.
> 
> The bandwidth vote is enabled before accessing SMMU registers
> during probe and runtime resume, and released during runtime
> suspend and on error paths.
> 
> Generally, from an architectural perspective, GEM_NOC and DDR are
> expected to have an active vote whenever the adreno_smmu block is
> powered on. In most common use cases, this requirement is implicitly
> satisfied because other GPU-related clients (for example, the GMU
> device) already hold a GEM_NOC vote when adreno_smmu is enabled.
> 
> However, there are certain corner cases, such as during sleep/wakeup
> transitions, where the GEM_NOC vote can be removed before adreno_smmu
> is powered down. If adreno_smmu is then accessed while the interconnect
> vote is missing, it can lead to the observed failures. Because of the
> precise ordering involved, this scenario is difficult to reproduce
> consistently.
> (also GDSC is involved in adreno usecases can have an independent vote)
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
>  drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
>  2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -53,6 +53,11 @@
>  #define MSI_IOVA_BASE			0x8000000
>  #define MSI_IOVA_LENGTH			0x100000
>  
> +/* Interconnect bandwidth vote values for the SMMU register access path */
> +#define ARM_SMMU_ICC_AVG_BW		0
> +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000

totally random numbers, which might be different for non-Qualcomm platform.

> +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> +
>  static int force_stage;
>  module_param(force_stage, int, S_IRUGO);
>  MODULE_PARM_DESC(force_stage,
> @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
>  	}
>  }
>  
> +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> +{
> +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);

Is there always only one bus / path in question?

> +	if (IS_ERR(smmu->icc_path)) {

if (!IS_ERR(smmu->icc_path))
	return 0;

int err = PTR_ERR();
if (err == -ENODEV) {
	icc_path = NULL;
	return 0;
}

return dev_err_probe();


> +		int err = PTR_ERR(smmu->icc_path);
> +
> +		if (err == -ENODEV) {
> +			smmu->icc_path = NULL;
> +			return 0;
> +		}
> +		return dev_err_probe(smmu->dev, err,
> +				     "failed to get interconnect path\n");
> +	}
> +	return 0;
> +}
> +
> +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)

Drop the if.

> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_HIGH));

WARN_ON_ONCE()?

Pass the error to the caller.


> +}
> +
> +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
> +{
> +	if (smmu->icc_path)

Drop the if.

> +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> +				   ARM_SMMU_ICC_PEAK_BW_LOW));

Pass the error to the caller.

> +}
> +
>  static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
>  {
>  	/*
> @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	if (err)
>  		return err;
>  
> +	/*
> +	 * Acquire and vote the interconnect path before accessing any SMMU
> +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
> +	 */
> +	err = arm_smmu_icc_get(smmu);
> +	if (err) {
> +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> +		return err;
> +	}
> +	arm_smmu_icc_enable(smmu);

Handle the error.

> +
>  	err = arm_smmu_device_cfg_probe(smmu);
>  	if (err)
>  		return err;
> @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
>  
>  	if (pm_runtime_enabled(smmu->dev))
>  		pm_runtime_force_suspend(smmu->dev);
> -	else
> +	else {
>  		clk_bulk_disable(smmu->num_clks, smmu->clks);
> +		arm_smmu_icc_disable(smmu);

Handle the error.

etc.

> +	}
>  
>  	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>  }

-- 
With best wishes
Dmitry

