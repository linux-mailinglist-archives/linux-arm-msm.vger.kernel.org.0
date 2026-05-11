Return-Path: <linux-arm-msm+bounces-106851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOwZBTOQAWoVeQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:15:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2849A509F19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 10:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA5DD31238ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 08:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA713AB28C;
	Mon, 11 May 2026 08:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHGqlV7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAt6uQFP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF513AE19D
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486485; cv=none; b=BV0Kf47aeaAg+Gq7HUTZ8IjlQyDCkIV5tBXVHGHnCLX8YADHq0nve0qmMmHo32KMNreuino9dAsTekD9p9HPFUuDn60E1knh2cXITl8GGmCCRRgCF4BwCUZLbJxR9ilvNYjqP4LpLzwn2ixgXi1NGG39TaSmY/LQ4u3fuHoEY20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486485; c=relaxed/simple;
	bh=9At6bN/HQOqxg3TZidbgne5rrgZKG4x7j0HUT9ppzqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Of3B1MLAeBZ5esGFmFZamntkbHn1qx4VA1hSsEStkKmBZnPIZQ4pAIzDjToV8dCjgThPeT1vesm2KBzyVb8Dbk603NZ+ZiT3BbewxWE34GOLR5wFwwfVJxuYirnkXO8jP097QMmGTi9NuD1W9E4QqfuRmywUqhkwnzsduQd6C3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHGqlV7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAt6uQFP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7APOs453387
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wTnLLM3bNR0ig+1jIwsqUgQH
	Tql4t8I0K2Rs/RNYSTs=; b=NHGqlV7bdneSmgiHoUkYtNdrrfJhGYPO8Kc7tJyE
	t60BBdC1OACJgYvTOx5bMS+2QeQeKOYU0uiFq8Mt5gQrYVM89GJEfsREC/yrvanT
	kwomtX4dDcMzwFIqjP6hevdd2PW6DsA4L45bporqi9lo6kj5GuRz/b4n4G7kDYkB
	s3mEFUpz+jRl+nhIJmGwp1Zkt5nbTYsaa9Wtp3dnT9/qsRQAvpGArbWwB89y3t72
	1C8kB6IccymXwRFrAKaUprYHtd4fHbhHarrvoOvdJJPFEhcLRvyOeYzpH/Ss0zZx
	JCGRJiLjskLNChBK87AL5TEgiyMox+wLaC3i+IlK7lZYIg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag6g5ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:01:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba224c3ffdso47863585ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778486475; x=1779091275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wTnLLM3bNR0ig+1jIwsqUgQHTql4t8I0K2Rs/RNYSTs=;
        b=XAt6uQFPY53qOGf7nhm2Lze8weSlh/FgPWdYhEK8628jrMl1LcCKT1mnN4O33ouSXj
         Hn4YKPiYxo0pn2ejX6xmTFhgSTzcUYNC39kqvY+kOaqqU2tYI2/CjAOxwHpm8K7CYHMg
         QFjcUcB/jZZv5bBhKsYM08EFirS4aBxFppFlQqn9d1XSqLI7Diy3NFqTLN870qv7H2fV
         gjL6B9Vy0iQu9bnHGyuU5+zQjKormRvyzw5pLm5on1v9/HtNT3pcvvrx9d0fSzIrXGUE
         isIr6AEFnSoBJPLbVh+vqonnqjOOvZYBgqXXaUfBM6wmh38QIX+JVy6k9JbiIawRbviJ
         O6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486475; x=1779091275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTnLLM3bNR0ig+1jIwsqUgQHTql4t8I0K2Rs/RNYSTs=;
        b=jVVZ1GTOIJIMQ6NhPkWmHjXXgag8oRmjDvwcYLPFTDww7/2KOp5VVK7eZZqLMk/jyR
         NAUPOyev2PydCYR5R21y4KCiwbJdVQGBpaccttBeKm3giVQ0OdhGa3MXRqYXhTSSmpJd
         9///mlgFAnmR4Mhc9+xdCEdog0EJ09xdnk/INs09wdX3LCtpX6kFunZd+8IYCkSgsmFQ
         RC96jdeCAsHriUCHVG23M8CDFcSsU8AdouF8g5Z0UHtThAKI4L0qfjB+LeOOwuUxnh9j
         TJ5vxspwkypxPWWA5XfKD1ZS1GYZa42Svu2iftvGd0SoLrmO2sw1vcT9EU2JuZ0xV1ps
         taUw==
X-Forwarded-Encrypted: i=1; AFNElJ9UBKtsl/WZPYvwFGfjUZqAEqiKmTYoOqnqqwC6UYVrtUDLWKBXq845xn4cfMXeabc30Dd+SdymOatTK86h@vger.kernel.org
X-Gm-Message-State: AOJu0YycWbT2rnMy8kpOQG1FoiOECX6mZjTHRrSNbG63gEOWA1UJp1mp
	qON73dXWLJh3DAS26EBKKNsBDZf3VPSkRxx4WHSw0FHTaBigppjdqsmOphlsPO9BEy6sLk7TwEN
	TGGSs14/F0Xp8b3p5sGwNqcRtnmVa+K3lFhCTizdkAEXLlIlAVWqVMZZLi+p8FqQthVRA
X-Gm-Gg: Acq92OFVyrFvJE2qerijFeBhafyhmOOckWZcROBoonItmeZ3OSCIuSFKv7Mck8qRCRa
	B0iBMaGKA7xiDiCHV7iC4n98bCMl6f5fotuzLGay+gjf6m6RXCC3tjTdfRBPpuJvceE6KZwCAzH
	3FheiNPyGf8xrLK4jJY1M0QDpwSIS/KyO3YAlSByGDWzbUhS4Q+FX0t7jYtd0jwhBRwIENa6m/6
	dzmCUl6fjSs18+ZZ7QkC4D6fAVJdo2L8u/spiuMDxcdw7zKKimOG2vsr9ntRtOziK4UgpdUlA99
	RIYvVaT674nxEqPW4SKm8e5EoabkT0W7h4B4v2CKrqNBh3ntpm1bZLoolFCRKjkIYdIqlme/x+f
	PxPPl88PEZmh9O9OCeTMScEhMk2E6H6BwyhJS5V63y20oh+V3
X-Received: by 2002:a17:903:1ad0:b0:2b0:6e60:9586 with SMTP id d9443c01a7336-2ba792a0c08mr261081885ad.17.1778486474729;
        Mon, 11 May 2026 01:01:14 -0700 (PDT)
X-Received: by 2002:a17:903:1ad0:b0:2b0:6e60:9586 with SMTP id d9443c01a7336-2ba792a0c08mr261081065ad.17.1778486473994;
        Mon, 11 May 2026 01:01:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm98532815ad.47.2026.05.11.01.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:01:13 -0700 (PDT)
Date: Mon, 11 May 2026 13:31:04 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 07/14] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <20260511080104.c4nhhmm2xgzm67fi@hu-mojha-hyd.qualcomm.com>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-7-7fbb340c5dbd@oss.qualcomm.com>
 <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <elhlmmmisecn7vylpsboiicn7dn4umrggktabyixthmevdv7eo@a4keayee2um7>
X-Authority-Analysis: v=2.4 cv=fOsJG5ae c=1 sm=1 tr=0 ts=6a018ccc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DTHjRCbF17pgsZGT9MoA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4NyBTYWx0ZWRfX2lDZjaaMO2I2
 TgHgvJY+DbLCXSNtYBBqRrcvoFSKmfeXL6T/78X/yuez9NUDtb7uvSCyusz9pJKr8uH29UH3M+6
 tZHJzXOLYD/AAwPy6MdwaZFGVdg5G3YVEXD9VFTGZ7p/0nIvwYjwFHljXnrUWwfjZWUlCPIHUl3
 TPWC8rrd4K7q9BbXP/jdXjNGYSLxzVE1fET7WKi7TFjH01iqfcCev7QSJ1ma5OXV0yBIVYXXq0p
 73uZXCbDdeJgiwPFbAPe6xl0Vx5+LKcNS0bLmXElZdpah1bfvDJYv35W7bI6Ij2P/+FlcOMDn5W
 I6QWPxlni4CIIXT2oUnQlhGvH0XJBhPPDU9AztEjns/LFOJMxGkaE4xEJ6Puton3T4jgY65KglV
 zj1batpwyGR735QZ/w8czZ8aHZebmFq+raEod4a/Qqk9SsIyO/gdAOe15/tMySrr/bAdnVJKb53
 /QspbO7eRmcJhPc4KTg==
X-Proofpoint-GUID: VLfkX7RZT0V30RA6LcIwo_phYPgmPDLN
X-Proofpoint-ORIG-GUID: VLfkX7RZT0V30RA6LcIwo_phYPgmPDLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110087
X-Rspamd-Queue-Id: 2849A509F19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106851-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-mojha-hyd.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 08, 2026 at 11:20:06PM +0300, Dmitry Baryshkov wrote:
> On Sat, May 09, 2026 at 12:29:56AM +0530, Vishnu Reddy wrote:
> > From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
> > or QHEE), which typically handles IOMMU configuration. This includes
> > mapping memory regions and device memory resources for remote processors
> > by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
> 
> No the calls to those functions are not intercepted. Doesn't hypervisor
> simply implement the SCM calls?

All the SMC calls are intercepted whenever Gunyah or QHEE hypervisor is present
and in most of the case the preparational work for the TZ like in case of
qcom_scm_pas_auth_and_reset() it does create/register SHMbridge over PIL memory
so that the TZ can access the memory and then calls same SMC call to TZ for
authentication and once done it comes back does mapping the PIL region
and call bring up sequence of the co-processor.

    SMC  SHM setup    SMC (auth)        map memory/resource and trigger reset sequence
HLOS ==> Gunyah(QHEE)   ==> TZ    ==>    Gunyah(QHEE)        === ==>      IRIS 


> 
> > later removed during teardown. Additionally, SHM bridge setup is required
> > to enable memory protection for both remoteproc metadata and its memory
> > regions.
> > 
> > When the hypervisor is absent, the operating system must perform these
> > configurations instead.
> > 
> > Support for handling IOMMU and SHM setup in the absence of a hypervisor
> > is now in place. Extend the Iris driver to enable this functionality on
> > platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
> 
> I fail to identify, which changes correspond to this description. If
> it's about the PAS context creation, could you please be more specific?

I think, commit text is trying to tell the Infra to support any Secure PIL when IOMMU is
managed by Linux at EL2 and the dependency related to SHM set up in Linux are done as
part of [1] are in upstream.

[1]
https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/

> 
> > 
> > Additionally, the Iris driver must map the firmware and its required
> > resources to the firmware SID, which is now specified via iommu-map in
> > the device tree.
> 
> Why? You miss the most important part here.

Sorry, I did not get.. are you looking for explaination here, why via iommu-map in
commit text ?

> 
> > 
> > Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > Co-developed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
> >  drivers/media/platform/qcom/iris/iris_firmware.c | 72 ++++++++++++++++++++----
> >  2 files changed, 66 insertions(+), 10 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha

