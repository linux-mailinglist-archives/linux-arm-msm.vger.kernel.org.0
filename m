Return-Path: <linux-arm-msm+bounces-57410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65032AB0FD9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 12:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3B3B502679
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 10:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3366528E5F6;
	Fri,  9 May 2025 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjixQ+So"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8440227A132
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746785179; cv=none; b=T1UsDDakhPRRK+qEzP3gENM9HUkas0rkBOvMvNxCIQYRLPBpwBr0t88bhAw3BqcLdVmG+1u5mf8mByLrFeFIAAL/IRuj1ZcZy4Pod5KjmJ8FyrHmoxJHAKHXiWfhQxVs17WbXqfjohg8/FaDmb3ugW18C6tSrY5nfbJj1ZnkPWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746785179; c=relaxed/simple;
	bh=2iPVjI2JMMIkbC1wnE7KPfvysHeq4yjharWuJvAZfag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fphFImNQ/7PFJ2sE4LB8eXQFcbRp8J5Y/rX8qsvhf207C9MsxFG0h4qtgzRl5B1naqqxsPP68TqVW2vCyBWP2/ckfvLIKhBlDKIBujjjJhTwLK4nB/Bwi/Uv7nfixXbmtfHzicsObr0blZh0PQ3T5z65OpU1g2VwOs6HPqr6zrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjixQ+So; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5492kifA008582
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 May 2025 10:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9cgawicPr1IJlvTgmxtP8ZjX
	/oSYhm5D5Bhw/WPNgnY=; b=fjixQ+SohhpU5xvwQ7b6p1QxRNmFZkkH4gIpJLd3
	vFbL1v3h2xAQdTBUBm+QHehE9uu9//9qGSRke2/HUHHqap6Vdqqx4AhjbcAkUm3h
	H/TPPj3OTrz3uXIxtUy5rVdJjS3vnI9ZnMpZoM/LGq3A7oUJOyWjSbzIo0Agr1yI
	1k8XI0wq9dDDdwRr/RAMONltIb4TwL0uNTb/BpPaobtACpREjK+vpeGilox2e3po
	gL6DIzdXkEsu13NnvpM6PTUZVGeZzHKOC49fMp2Wb2p5lEw4Eo+yapfbljaWElIK
	gNtmgYkqL3onNQ79Dou3EeQ46bn2SoriHMIyGoRJR2TAcw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5c848-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 10:06:14 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b19226b5f7dso1561269a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 03:06:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746785173; x=1747389973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cgawicPr1IJlvTgmxtP8ZjX/oSYhm5D5Bhw/WPNgnY=;
        b=wgolrpwIdSLzQ+kJ0Rdj+bx8rOoW4PME4ZYuKACPQtQNCbdiPhVLSHbKmcYRwKstFH
         2z7U9hw6p9GsE/Gd7eh0V2XdZezoIh979eoya4ftt4WPbAFNz1eBDsMz05uZCDeyPcti
         SVC0T1noscCMRIkAOzyZrZw1evIQE249LAHkp5FMH1k78LohfbbNLRt8aHoAYHD9nMdo
         GoTpfPqYMSOI0ua6ijazYP5LghOt5xWTjPL5+t1T+iEkC/s0iIqC+ZsYB+nisscuLTW2
         grgQFAEtnhuZMl/lNgTI234egjtgsf1disPMAt431xi9JilW8U0Wo9wi/LGCgahZkvm3
         vhHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXxJf3Zi4/P5SA3FcUhLbRopu8JNqojorXhurfl3iu63zeTJo5GyFeGi9EOeVMtLAyxELlcyvJLYncwEMD@vger.kernel.org
X-Gm-Message-State: AOJu0YxfJvYC9MK2IyTOveTBn8QPii2G97NCxNErGBPPWBEWa1aDpOt+
	O3XvaXRYPKJ+b4dJ3v3ceBqc5MMHjmjhBjCSGGK09zdZ/KNyqqJonKV7UfBm3o7kTGlkIXe7FSb
	oD0u2jb+lBZb7L2x8NX3eYAiP1sckj/S+IaIy8n5KAHiAH4dsVjFsEb2LRemg6460
X-Gm-Gg: ASbGnctLd7fTXxGfbM5pjrOD7j7fazyRCr7BSiR3N/4w4nTXM8063sfGtSLGnR8mh+p
	QWMCDxeG6iegvS9yzAk/8m2uAMKwMwmVsxDv8TBHPDG/Ke9O8yqDT/Y81GJQRbJSgYbk1+hbD+2
	eZmWirxdtXzrE0KwOWcCfebScP7BB4P5CtODbwtROHEHZOc4NOjcezfhjZHQpP9T7rXylW08y55
	6uz6ba3/pdSQufvF6/J4t0QK0oLaGxMAeM8U8vc3Y3yJO5GaS2d72/On3/lmTVh0JaTdVVf9Gva
	xY0GYhVWRHlmC1wV4c6qFvQ6LrKl8br7CC/z1k8=
X-Received: by 2002:a17:90b:2f84:b0:308:2945:3842 with SMTP id 98e67ed59e1d1-30c4011c2camr4315705a91.15.1746785173084;
        Fri, 09 May 2025 03:06:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH250FvnpxbtXSQ21p4lHFBiXq38OwV7gXcJ61cEP5I646CZCVB3NJnb8uIcgxLhmeXhtmW3g==
X-Received: by 2002:a17:90b:2f84:b0:308:2945:3842 with SMTP id 98e67ed59e1d1-30c4011c2camr4315670a91.15.1746785172607;
        Fri, 09 May 2025 03:06:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e760acsm1458746a91.47.2025.05.09.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 03:06:12 -0700 (PDT)
Date: Fri, 9 May 2025 15:36:08 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] soc: qcom: socinfo: Add support for new fields in
 revision 21
Message-ID: <aB3TkK7wEjdxSSvQ@hu-mojha-hyd.qualcomm.com>
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
 <20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com>
 <mc6n7fbhjhe6cxyoqkxs23kjs7gsa5cihy6qwrcrnz4g3kwjms@vh3vfqzfprw2>
 <aBzPn2OXapJLsikk@hu-mojha-hyd.qualcomm.com>
 <s5fd3txerbwgzzgqnoovkffmijgub5dxfucqqskhdqyjqzkbyl@5cyycrfmubup>
 <aBzgaKSspA0Af0sZ@hu-mojha-hyd.qualcomm.com>
 <03409f08-9612-40be-b8b2-6cebd5acd0a4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03409f08-9612-40be-b8b2-6cebd5acd0a4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Lu2Symdc c=1 sm=1 tr=0 ts=681dd396 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=n4EBUbhx65UTRA3-c0oA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: sPHBt-qXVPisYkUB3jL_IrkJBo6BHLx7
X-Proofpoint-ORIG-GUID: sPHBt-qXVPisYkUB3jL_IrkJBo6BHLx7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA5NiBTYWx0ZWRfX9d1NtYX3Q6zd
 NgOHXxAk1kJJWmpH5plROvsuIssJJ4yTZm70BAJi/KDH64iflnJeZlUQ8TMyKSEucwijSxvhO2p
 lnh5z6UPZw/4gJqQ11ASK3cpDc1gIr/NXFbB148RGPsPFG42dLdCPyZGoMC6GhREc77F23R+A0/
 ZTz3nYSlvL3gmhvKRHNHS2IfmthRyxFN5484r0vtSuJPjDDsOUgjOhoSGu8N9pNwQKangIIl85R
 1CVR4iaU4t/glZwwwDEdSJ9anMnITq3/jEqXWTgGBeFZp7ecQTNKpxN6BOTf9ynnX+PddTx/nKg
 KJFw3MbpzMOpsE+OoCA6X3B0xIXNYfdm0FHLnphN/sFoBx5IfvSIUXUEYMVixvpnCvUGcvpE/7C
 EuDU80Ff+5AgRyYjuJ5Cxg8CcIJP1nMPf88PcA9aj0Z/6x/GRj2aSdvaseZw8XtwJDENdazL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_04,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090096

On Thu, May 08, 2025 at 08:01:44PM +0200, Konrad Dybcio wrote:
> On 5/8/25 6:48 PM, Mukesh Ojha wrote:
> > On Thu, May 08, 2025 at 06:56:47PM +0300, Dmitry Baryshkov wrote:
> >> On Thu, May 08, 2025 at 09:07:03PM +0530, Mukesh Ojha wrote:
> >>> On Fri, Apr 25, 2025 at 08:28:51PM +0300, Dmitry Baryshkov wrote:
> >>>> On Fri, Apr 25, 2025 at 07:29:45PM +0530, Mukesh Ojha wrote:
> >>>>> Add the subpartfeature offset field to the socinfo structure
> >>>>> which came for version 21 of socinfo structure.
> >>>>>
> >>>>> Subpart_feat_offset is subpart like camera, display, etc.,
> >>>>> and its internal feature available on a bin.
> >>>>>
> >>>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >>>>> ---
> >>>>> Changes in v2:
> >>>>>  - Added debugfs entry and described more about the field in commit.
> >>>>>
> >>>>>  drivers/soc/qcom/socinfo.c       | 6 ++++++
> >>>>>  include/linux/soc/qcom/socinfo.h | 2 ++
> >>>>>  2 files changed, 8 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> >>>>> index 5800ebf9ceea..bac1485f1b27 100644
> >>>>> --- a/drivers/soc/qcom/socinfo.c
> >>>>> +++ b/drivers/soc/qcom/socinfo.c
> >>>>> @@ -154,6 +154,7 @@ struct socinfo_params {
> >>>>>  	u32 boot_cluster;
> >>>>>  	u32 boot_core;
> >>>>>  	u32 raw_package_type;
> >>>>> +	u32 nsubpart_feat_array_offset;
> >>>>>  };
> >>>>>  
> >>>>>  struct smem_image_version {
> >>>>> @@ -608,6 +609,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
> >>>>>  			   &qcom_socinfo->info.fmt);
> >>>>>  
> >>>>>  	switch (qcom_socinfo->info.fmt) {
> >>>>> +	case SOCINFO_VERSION(0, 21):
> >>>>> +		qcom_socinfo->info.nsubpart_feat_array_offset =
> >>>>> +				   __le32_to_cpu(info->nsubpart_feat_array_offset);
> >>>>> +		debugfs_create_u32("nsubpart_feat_array_offset", 0444, qcom_socinfo->dbg_root,
> >>>>> +				   &qcom_socinfo->info.nsubpart_feat_array_offset);
> >>>>
> >>>> An offset into what? If this provides additional data, then the data
> >>>> should be visible in the debugfs. Not sure, what's the point in dumping
> >>>> the offset here.
> >>>
> >>> offset into info(struct socinfo) object.
> >>>
> >>> I agree to you and I said the same in first version this is just offset
> >>> and does not provide any debug info we would look from userspace.  For
> >>> parity with other fields I did it for all newly added fields.
> >>> I have dropped it in latest patch.
> >>
> >> I'd rather see the decoded structure that is being pointed by this
> >> offset.
> > 
> > You mean info + info->nsubpart_feat_array_offset ? 
> > 
> > There is more to it which I don't want to mention as they are not
> > upstreamed yet and unrelated to this change.
> > 
> > data = info + (offset + (part * sizeof(u32)));
> > 
> > e.g., Here, part is a enum represents camera, display etc., and data
> > represents their feature presents. Since, part is not upstream yet I
> > don't feel we should expose this information to debugfs. We could always
> > add them in debugfs when such things are standardized and upstreamed.
> 
> That's what Dmitry's saying - just add support for them

We definitely add support for this in the future.  In the meantime, does
the absence of the support prevent this socinfo field from being merged?
Without it, there could be inconsistencies between the boot firmware and
Linux for the SM8750 platform.

-Mukesh

> 
> Konrad

