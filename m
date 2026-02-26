Return-Path: <linux-arm-msm+bounces-94274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAnWBIojoGkDfwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:42:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7650B1A4706
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:42:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44994300F5C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 10:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965AF3A7F57;
	Thu, 26 Feb 2026 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WypjpM3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdwqE9af"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A5A27B35F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772102463; cv=none; b=nWGldo9w/S6HuEXfM01oJ8VFNPLO8YCm1KDNlRVT7kct/Sz+zEmzsoIYIsIT5fM2IrUSqFbRQoRyeWmPBoDnmd0pO4WuUro0oYvTyuFOKsQcKttTmPLwgYdTcgKLUnEdtv4DhWzksruyJYmhszQyCm9V8GpY7oSTW3W0SwwJhiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772102463; c=relaxed/simple;
	bh=k7gwFyjHyDt0v2nV5FWKyU+Y1BWj3xUmYVNgPHR+3ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4WEsmSSXGiUFa3hAUiBd1keto1WrxNGNRvOHR7TP44WQVX0Av5GhPk1N/JVw7z5neU1n2705u06qtkGGeB2f3HyBDx1WHlsDHtOrgMagBKmBrnf6VdS2XckMkl0GwtCXiTBu9oT4ifFncD6du4Ayq7Hl9fDVCL4TvQhIPvBzHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WypjpM3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdwqE9af; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QALDRw1110667
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1E9RufUX3shLLcaPDd5LsIzNYiU7fm81dIU5jRV50k=; b=WypjpM3VcjZ97BZu
	qXwe1eFwquO/Kehn/2U8CmFY/71TbMBD9I+9+7zgSffzCDuEUUpbC2ZzVOWUjzaI
	ayiA307o3J73wRIdfFpNGQWnFmWBgTbZqgWUrai50hjc84Hh0UC+pYZGhMoD2aMD
	2af1d8bCQ+0G9dPFxP2vyK7+fmcYK82ZNnK35z6z7FSB9UZExkf2v+oDHXJNEIrV
	1bIdh56/txnd+RKDoc0fMWHw8GL32GjpQhSmkLkP7pVthaScy1GilpEZ4TduYb78
	ByMDp8fWm9d+LczUN4OrJUUDJgvvPuXnpZoqHxrMyrSyIj9acoPXkzzU+VnZqRFU
	qGQueQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj54pawk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 10:41:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so429739885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 02:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772102461; x=1772707261; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c1E9RufUX3shLLcaPDd5LsIzNYiU7fm81dIU5jRV50k=;
        b=CdwqE9afbK93hd6YeV5eoE3tWRswvUk65MNLG5T3SBIQTZI4VDAX60lH8ScboFOmse
         NuU+Q5Cr/QSk25I4uJIWfG49uBn9s4LT92qL0ovjOVsPl33w2+OiQlDvCqo+FruMeYkN
         WwcC19jPGDxIJEnUjLwa2YrJMobrPCL2P9kLvBxpY4UJb9IpnFIeyo7xMfFKgmHTPqjJ
         Kvk9x607Fh2OdzuUMO9pt0DWEbP35DhxTkwdJL/PijV/b2RNCg7g/h/f8TQ7qYRpBNpm
         XKpRZyLht6FMqc+QH0faVrcrrtueUEV5upApF4WiSurXC4gcWeuNN7RN5DCYaXpkbtGW
         V+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772102461; x=1772707261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1E9RufUX3shLLcaPDd5LsIzNYiU7fm81dIU5jRV50k=;
        b=uhsIxfvy8p2Hto9tgZ2TpGPLRC6+4je6VnWzR946UDbIsBp3nVR7sANFicgoC9OXMl
         ryAYfkP+FaE4x2OfmwLvIcrEKHZawi7hnHLGKTn04cClR4NM5t+Y8yP/D+6xxJLNLfkK
         pR8MaW+CdYb8ZIMruQk1BwNIRGFJ5FKiYHtfptiij3cNFDGfilqisSDIOtOrQC05FO4+
         I2UW8+02Y4Nq7XnxDdb+hFbrJHH83EoFPEyac93TIW5QsYjBjj/as12pYKR4EVv8CH1B
         LJfTYG+cv53I1OhcX1RtX7XMfr480HODAZF6dO7KOGCeJdMoAu1lHy7pohkhwrAulPNU
         41mg==
X-Forwarded-Encrypted: i=1; AJvYcCWWj2zRGQMI6Cm6sxK5PQiw7O31ZkzCejE4aEyK03ulA0SI12HhyyJzknc1uOQOsDgrtK8LouXXZknj62VV@vger.kernel.org
X-Gm-Message-State: AOJu0YzVIJA18E9tq56uld5TTWOj4D/oX79PU6p6bCIEMoj7GHd0xNkG
	1UzdTAiWiG7nBVFBQ9Y4UHdIV0E71Etvjft8XBpnVcarsh4FRzth7+BYiZZtVVW1F8mEf//k0D2
	FQe7YtHqmLW6/qHTeR11Qhyg8GyC+u6m+/HopLAz54Nq08S5JOW6VRe3rgVRjgQPjL/wQ
X-Gm-Gg: ATEYQzyH8pTvqTdYVDkQtM+bBngUxaz/eDPUQ5ZH5LJ6PlQbf1O4YD88nACuNqqbopB
	rz9VaUOvOfUUJM2Tq6zHXHkkWXt+zep0V5VG5mI/DmQDKSrzDWj7t9GcefoqzlasfmNWV0yvV/S
	ylE11RZDHVF4fgS/+Dp7BCZ25MiBbfLsy+ue5894XdxaB50A++cqatMzaQaRtmfEy6tl5I8feul
	kgv1mw5ELiBMX0MhZB1PtOz/Fqdd1e7rDm7/WmkfV+VEKKn2ha02kxHye6JJ9/s8pGbObSMlbP+
	eDnOw5S7N7EdPBkVDz6m2Rb1cKRJ8s1gjwM7z6g168z9HTUYA7huwgjbnM4Cj0JsN54wYiHNoqb
	E07HpGe5teyc5G/QEK1Zmt4eZwCh5nTkkZGth04JjjHriD2XRIC7G9JsR8xahFvt8rjw6nQ4z7m
	5Z5Z/WlDS+eIh2GeWzXkKMtfjJUqT4FFilGYg=
X-Received: by 2002:a05:620a:44d2:b0:8cb:4f63:dac9 with SMTP id af79cd13be357-8cb8c9cdc4bmr2602621985a.17.1772102460851;
        Thu, 26 Feb 2026 02:41:00 -0800 (PST)
X-Received: by 2002:a05:620a:44d2:b0:8cb:4f63:dac9 with SMTP id af79cd13be357-8cb8c9cdc4bmr2602619385a.17.1772102460331;
        Thu, 26 Feb 2026 02:41:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a109e050c9sm688317e87.57.2026.02.26.02.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:40:59 -0800 (PST)
Date: Thu, 26 Feb 2026 12:40:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Subject: Re: [PATCH v2 2/5] media: camss: csid-340: Add VC-to-interface
 mapping
Message-ID: <trtkruw4g3bn4sltdj3foq6xqxjxvgejnzyn7cbcour7a4zls4@kwexergrb4r2>
References: <20260225150122.766220-1-loic.poulain@oss.qualcomm.com>
 <20260225150122.766220-3-loic.poulain@oss.qualcomm.com>
 <6js2jmzcbo2dmt3g2griookjt7kkrbukukzkv6ft6i6357g2x4@trpobakpysw5>
 <CAFEp6-3KA5tztKscsaHn3=MVKfwC=gbCMNgZhi7SasxHXxttYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3KA5tztKscsaHn3=MVKfwC=gbCMNgZhi7SasxHXxttYg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5NiBTYWx0ZWRfX0faYScdB7yKe
 ksl4hYYc/SjI/Yk6rUJetDozL+Pi+D3Vd8ZhRy1MFIKNNMxtk7GnHu124DuePSXqGD1FTHOZi/2
 O7E7AkSjpP8Jy9PduycdDkK2OtoUk9zdgC9AeDfYKUwAVilxX6ZIUxx8vc1kz+s+BFoaSc4xQtv
 WBDqFlSPFD6A4VF4gC9QRFS5ZPzVC6DAmHj2YzwKeEZAs+9WttTXrL0Df+S0tPnmBGjWz9LcW4C
 dYOXqlnObLH6/jleSZE+9pVdFbiBzzhxDcAeQZt+rmOzrUOyB/rUpfd3M/9wv2SuzD3MsXqYBCQ
 v7wQvk1yv1naBkS/EBsnDBG4Aj0UmP3NYJKpvHpmk2Ln6bLdph45iI+a7+4xEY8uc8yoBekw9K6
 u3HJDni9C787+G/aOs8HRTyhCcn7GeYvTA1/ArxNLAZFI+FOgntDNyAqLbW5e4Kbzo8VmRgLoKW
 9okEf2rFxWjGLA69Tug==
X-Proofpoint-GUID: 8U6rNiorRznWKklLDUFsV-Hjye8dJ-y0
X-Authority-Analysis: v=2.4 cv=I5Bohdgg c=1 sm=1 tr=0 ts=69a0233d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=kRf1_TII1K2sScEP2dYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8U6rNiorRznWKklLDUFsV-Hjye8dJ-y0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-94274-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7650B1A4706
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 11:15:16AM +0100, Loic Poulain wrote:
> Hi Dmitry,
> 
> On Thu, Feb 26, 2026 at 1:16 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, Feb 25, 2026 at 04:01:19PM +0100, Loic Poulain wrote:
> > > The CSID‑340 block uses different register offsets for the PIX and RDI
> >
> > So, what is PIX? I asked that question at v1.
> 
> I might be misunderstanding your point here, but yes you did ask this
> in the v1 review, and I updated both the cover letter and the
> subsequent commit messages in the series (mainly in 5/5) to clarify
> what the PIX interface is. If this is still unclear, I’m happy to
> expand the explanation further or add more context in this specific
> commit message.

I was really looking for something like (pure examples) 'like RDI, PIX
captures raw data in Bayer format, also providing image statisics: max,
min and average brightness' or 'unlike RDI, PIX captures debayered
images, also providing image statistics: average brightness, max and min
R, G and B values'.

Also note, this is patch 2. It lands before patch 5. So I'd suggest
having that definition in this patch rather than the final patch for the
series.

-- 
With best wishes
Dmitry

