Return-Path: <linux-arm-msm+bounces-109750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +r9iMalWFWpPUgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:15:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E7B5D24FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5A1C30182BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810603B9D9E;
	Tue, 26 May 2026 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meYK0uLA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM5BLK2n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF83CAE66
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779783315; cv=none; b=VjafDjxJPo7GkMlPoCp45Ktdg/hpSdq2E5njKBRdgxhzxSMjo+exSq9dO4BcX95mqkMiKiDew1EKjh8DALy3GDa5EQxihf9decsGCMWkrIrbdRSPaLX28xeqa4j+5chuThfOaZgLSU09o+6NFJ6MSkqK5w2eoUaNgWunHLNHALk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779783315; c=relaxed/simple;
	bh=fnhTpjbOfuUxzDB1MKZ1r6g3j7DS/B1sgqSc44bj2/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kL/dcVkzCNUr6jmVWKQYk5bZcPfNb5kKhidvrgZBKgREHMcBB/NJebH7Uv39GjFS3oqxKgxwYyWdpdyN9HVuFGNrhJf4YTX9nn3inqE8eOBLqxpIpgtC+zpgZtbGJiwlOkAZgGxQsYoWwEKXHIoXboYEpuJdcNTxfSm1/izu8Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meYK0uLA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QM5BLK2n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5RU0r079208
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3cdTTyJLWlDlbBax61FifNHf
	vZeH5kUu35WkAG0ZPcM=; b=meYK0uLAhMhp5gzjHJisxP9FMHRQX0vQP70i7eEK
	hDkogM2UODQcZO8ft72e2rUgf5/2bzysdOYyp0qIcRh3jyoizq/C7Vqf02ee91Cz
	bkhgBjp9FNpUjBOgcogqJFinHDeMNtR9hpK9zB+fXbgkmnE7xPVal6yNkXhXLJAw
	7yq7WmqFb7uVXaPC5bgi/JOxRTUvgR4HfgyGws2RaP6MCNk21izIY3iNRXQieVxX
	UozeMuqTIn2YUF35UZhAcznWLnDYvRxovhEeXN/h66Pr/NeGZ0FLZu7sF2/8GpqM
	Oir5xP73ZniHrNm3Frex1nO0KIP9VLdKWtKLsz48julM7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckmabpay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 08:15:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2baf7378ad0so109088495ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 01:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779783313; x=1780388113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3cdTTyJLWlDlbBax61FifNHfvZeH5kUu35WkAG0ZPcM=;
        b=QM5BLK2nk+LF9rL8lkKrbmlE8K7SI5eUnDuoeZHMhgwcgruQEDXGAz9n+MvEyalcSY
         4xPzgXki64FI9z0gG95nrGcrp1MU23Qx83xn/b3utflsj+Mou4mJNEf4cfGZhXlynd34
         gCk9KlbT69VyarXyujfzDKmUD9zYjPWkKUIOnHNBYx+kl5IS44lharTno/hPhXY2Vry4
         JoAt3OSLAQu3j33HZH4nWfoXy/h0MNGO/2vVUyQTNWtjVq6UCt3ZlcG1uqilLsfWpQc+
         2kcYN/Jxk1/CiMe3e3fztridrzaaz4Jcsv05W6RZ8PvAXMCHSYP8Ro7EV2KFcxav/H4H
         Gq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779783313; x=1780388113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cdTTyJLWlDlbBax61FifNHfvZeH5kUu35WkAG0ZPcM=;
        b=osleW+E6D0RkHhURSokB1yRq+Onv6fvNb4lfbAUC5aHdHMUmkqzR2TSmR5ZFgsPorg
         AUIund1rt9/Fg/9VB0ofESTJs0UbgaM5IPmCs6d17Vyv0IOgj6MxpAjUOG1Vu7E2JfUs
         ETIgxcSZ50t7zhbEnDaFivobbfpTOZhFwP4/HUStgLLN2POWXqZnMQJuoT3ew0xjdRcb
         6QliCyjj98nrPjTe4JmpM0fO7zM6qABCUsFZZ5b4hNy7axwiRqB47sYiNVAhOeblIrut
         PZuu3zSBrKs8v1j6avpu2r8/ClLubn8RGHUookobrOz7q5fEkUTNSEvUvTH4AR+ecMRe
         rDAA==
X-Forwarded-Encrypted: i=1; AFNElJ/qWvxUzwEk/BSPD7N3Uj21SSkameMQGswGEE6/acZpdd6dwaeKs1790wohSrQmGoWONgrkAktrXq+BUClR@vger.kernel.org
X-Gm-Message-State: AOJu0YyqJLN0PHBlajHXpMArubQ9hDXaHz3jMFQM9R1V+s7InqNLQbhZ
	wdS+a78kLXEJfmIui1zh6Fknkv6hE2+5+Dk3bcXPXfPk2XU0cRg6hThTVy47eHOnxZp3Pzci/eh
	e7oWfNCIQ3xB4daNdrrvMA83aJcbBFOu8pLzR7Ta03AF78orAeEP7+Hvq0RoWZ5kaHXek
X-Gm-Gg: Acq92OG8DqtZZ0L79Y9AuyDgVDCCp1jGKMLrmlDbIbh5ceXLytxYGRKI5RzvSF25SD3
	rG/AGCTo+nW1RAF3vs/YEZfL+tE8eHe9ElZenCuwhmHK4WdRVwovb+xIC11b+R/+iutYWrkk1Fp
	MyC5Z8zfVvf9/67hdnIa4GRlHgS8ckpzlwN4dPEsDpJOK9fepLle8mWv/Q3fLUQQfzXOjiNgTth
	MPHqfaWpt6XT8UqXwoUaEoSpNkZnT8B+Ud3V+DiX6zbU0xFXuNtMtlWybBWTdj6XDMoJUI3id6W
	VZJur2E3eg7YZC+ncTkaMV4YjX3AgV5HotZLSvq4PdficDpnMyj0kmx1+o2hYREBwJ/1wIGvXLQ
	rXgKWvps2NoEyPlVTqiotu92+4b9+F8LmHbIDUwQb7zoY7N5DI/E5jImTfXs=
X-Received: by 2002:a17:902:e745:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2beb05e413emr187667245ad.20.1779783312445;
        Tue, 26 May 2026 01:15:12 -0700 (PDT)
X-Received: by 2002:a17:902:e745:b0:2b2:4cd2:e16c with SMTP id d9443c01a7336-2beb05e413emr187666805ad.20.1779783311850;
        Tue, 26 May 2026 01:15:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm120909695ad.71.2026.05.26.01.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:15:11 -0700 (PDT)
Date: Tue, 26 May 2026 13:45:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 3/5] soc: qcom: mdt_loader: add
 qcom_mdt_pas_map/unmap_devmem_rscs()
Message-ID: <20260526081506.lqvjflh7zrldmgas@hu-mojha-hyd.qualcomm.com>
References: <20260506050107.1985033-1-mukesh.ojha@oss.qualcomm.com>
 <20260506050107.1985033-4-mukesh.ojha@oss.qualcomm.com>
 <k5ytg3b2wao3d75iuz2dxbvtzidnl6kdvzuvppih4vzqdhtzm5@5yd7kyb5yqcd>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <k5ytg3b2wao3d75iuz2dxbvtzidnl6kdvzuvppih4vzqdhtzm5@5yd7kyb5yqcd>
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a155691 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v5tzlP7bIaCzxq-hjlMA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: eg4s9GZKhDFuENHuZElk7fCcJB89Kl13
X-Proofpoint-GUID: eg4s9GZKhDFuENHuZElk7fCcJB89Kl13
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MSBTYWx0ZWRfX3sZR1T+b6KsA
 j64u86bn0QRUNdJy69XIrr3v4SXh3GoZlXh3ln+9Ry1L+58CFqMRqlw95rYUx+ncccK7whufZmQ
 WprRJGoQAhntZJBQZmxp5h+RaD3wB8PEiBxmLzcMcajoWAKsAJdhaUCdzenrzxwqwZmuRezp/D6
 5oMMlhPynEhUYKdddvD70E+ONqU00c4HMrCTNjubTME4n43SR2HAQ5BCW4DH+aPmB5ImbATbxET
 l6tZr1GHUwLyFYjl2V3+a2Wh1M6kUNmIvKaPYTNNHmjA5M0NOQJ9y6ZQOTAXkT0TRUkS1Yf4osH
 +hPfQhmJDADf8EH85fKuhVxaCWYnBZ0GSQvxSI37bBGE7GOnqbjikC1XgYbwcRRvQlxYzclFsE8
 FTy4x61kSeCOeeMctNkwbxw/YA6ORzPq96KKki+KUZ3cItD66X/ABMmR/JoG4UYcSAgJ1bhBPk5
 10ahoCXKCW7KTHRHkQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109750-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 49E7B5D24FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 09:47:27AM +0300, Dmitry Baryshkov wrote:
> On Wed, May 06, 2026 at 10:31:05AM +0530, Mukesh Ojha wrote:
> > Add qcom_mdt_pas_map_devmem_rscs() and qcom_mdt_pas_unmap_devmem_rscs()
> > to IOMMU map/unmap RSC_DEVMEM resource table entries on SoCs where Linux
> > runs as hypervisor at EL2 and owns the IOMMU mappings for remote
> > processors.
> 
> Generic rule is 'no API without users'. Please provide a driver using
> these functions.

All the non-remoteproc client will be the user., I already mentioned
that video is one of user mentioned in the cover-letter.., will add
them as user once there base changes get picked.

> 
> > 
> > The map function fetches the resource table via
> > qcom_scm_pas_get_rsc_table() and iterates over RSC_DEVMEM entries using
> > rsc_table_for_each_entry(), calling iommu_map() for each. Mapped entries
> > are tracked in a per-PAS linked list stored in a hash table keyed by
> > pas_id for later lookup by the unmap function.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/soc/qcom/mdt_loader.c       | 189 ++++++++++++++++++++++++++++
> >  include/linux/soc/qcom/mdt_loader.h |  22 ++++
> >  2 files changed, 211 insertions(+)
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha

