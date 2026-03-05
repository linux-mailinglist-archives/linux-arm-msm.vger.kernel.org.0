Return-Path: <linux-arm-msm+bounces-95484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKFwKE7WqGnpxgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 02:03:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2D4209AC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 02:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B53A7301463E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 01:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD2D203710;
	Thu,  5 Mar 2026 01:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVsloXWb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRBpIhII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC6B35943
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 01:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672588; cv=none; b=G6dHm0CiaAUscOZHQgSIDe4As7JiRvswdxGPJX4HHtzuWFxTDHEfVrznoErZlIx9iBAbF+2Wb2JHTH74FCZ7uz25ztbdqQOVNUHdHqPMp1nGswbcggX5U6ibAZNp5qGip5DwqVpncgse+6Te/D7Zhz6gbk9WLugPy1rZda2Xjmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672588; c=relaxed/simple;
	bh=u3XYuX332iBoEowxU3R5JiId7oGFTnsJ/J6svPST5oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Th9YTkl/WPJaN/sKNzTIOImbLDtmj+fKqFLiH0lwnAbbi3cq1HZlOBi+3QfThsa53YcNcFMG6tE0lWiDjf2+ppEUrvi6nzgmlrTWNrDryiqpFP3Ooxp0h9TAN21YTs/GiWTAcEWAqsD4pnXLWyaw7loC0dXLHZvZD9qVvIyvpA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVsloXWb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRBpIhII; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624KLD8B3615911
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 01:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGVzVQZRlFdbfhTLFkfDsWaL6JDxwkcRKucdgGZVBNM=; b=nVsloXWbcDlLhmWP
	AIVxAIZTCaPKqPWFbLmsztin+3B6KZLLghogAv5IERj57XfRsQaQJw+Twy3v3CDF
	6u7ba1nJwJO9DETN/VFjO+DFp8DYRVlgEuSqlYfWGAEFYWAgTfJaphUG0IVLilFf
	tVLpXNUQRLDgIP1J68akD0ULrS8Gks3y4F69oxIiwRgjxltP2wTRsaW+PWbcFd2w
	ttnCY5EIBsPHJPMKSneZOWJBh7rFl4FjwIjvy4HK1K1FKmpuIkXRibsvVyKHTDWx
	N7bnMnReIrarm8cwBhbpWXAEJIsXEMoHsIW3fjIUSOUtN+t0tON1zp7wDcT6yssP
	fhlrMA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptgmap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:03:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70b6a5821so3815408085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 17:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772672586; x=1773277386; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UGVzVQZRlFdbfhTLFkfDsWaL6JDxwkcRKucdgGZVBNM=;
        b=FRBpIhII7SeeCGyJ4J3zM0AG3TKXQCN3DnfGlvYpGUKbBwHqJWQ05Dzfefe3HQTO4H
         FezXgHblUq0Y9AlTyL+55sQEyh9zCAKB6dGRem3SHu9rxmaU2jdY70Ktt1XG3UimxKMu
         gjnySEgxQTpGgl097gY6D+rLtlGdO8TmT+IVeHpHostv3eX2avo0kaufyqOqNIio8Q64
         WEnroh3xWE8WWC1wW2U/Gc01ct5UxYz1LhNn6Jka7iXgMn4NrU6ndqKf1Ov6ED4ifkPE
         fQu4oHF7g0Thuy8BWHNcCzD5PBRIEzEvLHM8WJhJA2PtZ1SZo/RXlEakXtOmcsvGu4fY
         YNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772672586; x=1773277386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UGVzVQZRlFdbfhTLFkfDsWaL6JDxwkcRKucdgGZVBNM=;
        b=dP1GjNfxENz+3bJnea/1hccdd8qOtTyMFMAnrix9wQaolmAv/OAluW7mSsjjEyu4nB
         C4MSRhprU+pLo+C71VHDPRNVU5BuT/WzfntdGKTxHxOAZYEvsPlzH0obuTut4HcIDc5j
         kYip6gi0wE/z7pzrYtc1aIhWilDJav4OOBbGBXGjAH8y2Gbt4ixx9akwvFr3YKnvaFVh
         N5iSNmegetkbf3yB85dzJc+O3smJnTIH3pN3arU+fHuUrJ4DZT/D7fgd0NplLZTv/Z4z
         tshVlhljYukGH4LwvIDMpb4ew3k7Y9WUmiuhivnhm+GCuK7c2z2BUT9vTpA/JFumaVca
         TSUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7A82L6aYF6bOwskuB82Z2hLT9MfXdcmo3kZ0XdCWVWzV8nWnKFHiGaJXbNDVZMnF6HWEUBolrUKB0L4Z1@vger.kernel.org
X-Gm-Message-State: AOJu0YyvWjiT25EBDyGUPcbOeRg+vpnUIbnbW1fG6HzMGW3iEBPjgjSI
	3xlSd5jHQeeGMQ/ro3QvE2EJsBmpNiWW3962Dz21ND7Cy6kRiMyIJ7C3gwMMfOPY7HK+jJfZgN/
	PpIS160zA6WWv1hPpjWxva53f1SPpbAJsI88yS9EyJwKzPCptwyo5ub+M2sVBQBEZwmbE
X-Gm-Gg: ATEYQzzhZ8FU3p5wznZDG1I9vomdC6m2BQGH96xPCM8SahwhuqZvjM2OUK6KRjFIibN
	OOBdEH5Z0eBX3v6Gnl8pdXeiYO/7LSLo3HrZ1HqaraXCJfljfhtFmCMA7Z71RnWRzWbZjqKvVFj
	9PfMqOiKfzRioSQgBI9pZjARS//lr+kqFfQirW4iXRlhOl9akYx6ituTRka8YtQP+DI0jCt6Zbn
	kQhe13dzPmbsaMu2fCZfnPOEOa8HjgUdsU+1pLiIiJlxHZYh6SQiuDs4WRw5IJIy5BVHhoMV3+X
	+/f5KV2swT8urA3Qc3wE+Nf57XWedF7XnaFAxyozWLX06YCx9D/OOiZ57VGS493qmEpchlrdYaW
	gu0E8Uwa2VfijjuSgIDXive3wvi/hs4OeCg9pCLp+T3cOho7apsvGk+e8pyOYH5XY5EqbY098H0
	4vB/LU/Xut2pybvlgZrgn1oS4VT+BEUhq4F3M=
X-Received: by 2002:a05:620a:f0e:b0:8cb:4cc2:c5d3 with SMTP id af79cd13be357-8cd5afc4322mr502515085a.73.1772672585522;
        Wed, 04 Mar 2026 17:03:05 -0800 (PST)
X-Received: by 2002:a05:620a:f0e:b0:8cb:4cc2:c5d3 with SMTP id af79cd13be357-8cd5afc4322mr502510885a.73.1772672585079;
        Wed, 04 Mar 2026 17:03:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6e4c01sm870585e87.1.2026.03.04.17.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 17:03:04 -0800 (PST)
Date: Thu, 5 Mar 2026 03:03:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: restore GEM-related IOCTLs for KMS devices
Message-ID: <fpeatj5yrhp45rdd2qzcdtltrofr67noqc7fygsisyaquzx36o@ek3mfy32z5rv>
References: <20260304-msm-restore-ioctls-v1-1-b28f9231fcd2@oss.qualcomm.com>
 <CACSVV03T5ceDADxbdgpitczk6rExcRpkQQ8vcedR0gEK3bLQkw@mail.gmail.com>
 <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV01M7YmW1OCjUQ+QFRpXHoY055MEnBCczeG1zRuQyi8z_w@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAwNiBTYWx0ZWRfX4JR8XLMnzjFE
 n7Kqmrkbtz/4kOXyHGBj/wLjLdbyLLNUGYKa3oM3y/5xrVdxuk7/sRcR/gU7OitB7dVBj/5wb1n
 aXWZZ9NcjUD8QpcKCqgr34GGdMrgFI9z4ZFEQywhYsizZh0GqtnMRYyEJ2KG6DU8gRFnRKh7aAi
 Wojki4T/dYeHHFHRbYCqUCrCHRiyvlX7CYmri5tNz5cz9hDywB+KxAePFy3cDB4wQ3GxcdzI1/4
 +NvbsXbEj1P90q7AEjo/YC/RlccLc4L7uwSLUXi1cAKP4Z0lObfGspnd3AFJ/Ig12c7m7WQXuSq
 phqTiEVR3CqzFWgpkb0tLD0yVKMePhupeDW/H97yH7nB+Fk8LSKr/i5DTkvv2oRLYtGthY/ARwG
 IvlGhlVxxdH+mAFDx+tfd/JJkETmrWHYhVdbLLs4Fkd61EtkGbCNJAkzDgQ4k7gVaoTh0wlGMu8
 +lsicaMhkEfipWx1eAQ==
X-Proofpoint-ORIG-GUID: t0brL_5koUxQvITbQhp3CTb00v6kv2Su
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a8d64a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=yEwdYLOYgBwwZM1KkmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: t0brL_5koUxQvITbQhp3CTb00v6kv2Su
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050006
X-Rspamd-Queue-Id: 4B2D4209AC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95484-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 06:59:42AM -0800, Rob Clark wrote:
> On Wed, Mar 4, 2026 at 6:57 AM Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> >
> > On Wed, Mar 4, 2026 at 5:34 AM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > The MSM GBM backend uses MSM_GEM_NEW to allocate GEM buffers from the
> > > KMS driver, imports them into the GPU driver (msm or kgsl) and then
> > > uses them for rendering / blending. Commit 98f11fd1cf92 ("drm/msm: Take
> > > the ioctls away from the KMS-only driver") dropped all IOCTLs from the
> > > MSM KMS devices, pointing out the need to use dumb buffers, however dumb
> > > buffers should not be used by the GPU for rendering. Restore GEM-related
> > > IOCTLs for the KMS devices.
> > >
> > > Fixes: 98f11fd1cf92 ("drm/msm: Take the ioctls away from the KMS-only driver")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > > Note, here I assume that dumb buffers generally should not be used for
> > > rendering. That doesn't seem to be complete truth as Mesa kmsro on MSM
> > > devices uses DRM_IOCTL_MODE_CREATE_DUMB to create buffers for resources.
> >
> > That is problematic in kmsro.. (but also unsure to what degree kmsro
> > ever got used "in production".. the x86 drivers don't use it.  Android
> > and chromeos didn't use it.  Etc.)
> 
> (also, allocate from the gpu render node)

I think Asahi and VC4 allocate buffers from the GPU node and then import
them on the render side, but unfortunately iMX IPU driver doesn't seem
to support PRIME_FD_TO_HANDLE.

-- 
With best wishes
Dmitry

