Return-Path: <linux-arm-msm+bounces-82502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C36C6F031
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 14:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 8D8E22EB42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 13:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFC03557F3;
	Wed, 19 Nov 2025 13:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/kobXso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INHZ+Usz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316C135E544
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560059; cv=none; b=LouJFUOUCGkhZxaF8IEoOzcwt5VP2lpwQwRxF/l15Gnlq0E+MZB/J3VkyqG7vYFwXuxp4ALOIHSnYVOf+oHzA3KNFWEWYAviBCSsMK1Fd6ESc0e6AV/Io6aARzFWsG1GmnelQrfOfVSGv5KOsx4t9UD1GzXbk8mMgv87S4UgRBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560059; c=relaxed/simple;
	bh=fDOm5wEY/ZLTQb0kSG2ctQXeP09QVKdn/pChFY6JxgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFlp+S1azIOEcD9QAxbhA27PiDy6kmiPiIE36oVYbjXY27qRbmjiMr8WsQqjAdmaN+NpUddxBgq8Cy+v4bwQp9GtOCG49dZYJQvUK5CEDrzhOWztEl5wqkOtaLlmFvrh0/10/O0ETahbr9PAflmabt66LVX8ldck0oxjvTmVKAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/kobXso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INHZ+Usz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7aAvn718609
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6tiZ5VSPhJYDa1iQO8d+XKa7UiKTEiNsbsfg2KG3xxI=; b=Y/kobXsoEh9K/hXn
	OgUXohI+Boap/RXTWxWRrZG4Pu9VPX3cQfs+Q5LOu6o3iAkjWKXcuCKThTExm/JQ
	MIyo1QarFe4gUsn5XAcnWoGxwPcbAnQmsT523qfCEuVaHmAEsP0yyo5J7WdQojf0
	fAoS/DU5fbXtz4qA4XYXrnrffTWjGHnDbtAQOJFDeMTAvBp1SL0XhlZ8bPTkg10v
	zQ2Z+PV5qm0mTALJBa7a9hrT92b5JL+noRHIl/hn2Oq9LVFP+MNprzsL5nntdzCy
	lusMTI3/e+5jvUaRlbIYvEw8l2Pii00VTaDPnRWooXWKqgludI+1Pi7qHB3zFpmi
	+rmUjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah9n0s2dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 13:47:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09211413so128294971cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 05:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763560056; x=1764164856; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6tiZ5VSPhJYDa1iQO8d+XKa7UiKTEiNsbsfg2KG3xxI=;
        b=INHZ+Uszw9Awe+epV/r99+CqVgRk+9xeKmKrte6ku5GZ6G7qY32CHDgxQjEtBue88t
         K8veQPBTTZGmrIjSrvmkIfaimSrUM/Jqysw4tDK8sYuAcqWfHl3j8ULB7N4WUIz8aNJx
         i3c2Gj3XIGi04w4jYlysveZ6kGJJectGd4J7cNf/D4QRCg/NR6hyPrcmkHGsgc5g9nLU
         kMLu202py9AHSD50aGdNh9j0S7dObDwNEPsueX01u9Ye0X4eyHTuVQ3xPGXusFYFlApm
         PN4PR6V59yk4vM9ht474fo6vcZ7S3nh0GDAiacyZR1OI1+8kYQDMDf7IkXO02AAyGsE2
         HUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763560056; x=1764164856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6tiZ5VSPhJYDa1iQO8d+XKa7UiKTEiNsbsfg2KG3xxI=;
        b=us/d6If5nPw3QkFP+yf5iLxoGKLYCY3bRWN+50+Rf/NbQh1rsS9M0lVhSJlYyjO6Jl
         2fDASK2M2VzMeBDKDI36gRNkcl83TTvfYUsCJC1jfKqtuxyYuaPwX730GLcyJMLZqwi5
         eJQMX5eImm9MZ0jVcHcnQ6HMc74iOg6b7S7tf3Jgo5kKYxdjKv1BHQrCHgz7sUZwJ6Bl
         mU+8Llh35q5/HruxcAWibDkntjT/zA4uNelS1zMOTJyWqToB/gHeagEkCnkuuoQVaQtg
         4Jqlusx1thkSEYU4LdW12loQ5Le4LzD5y42aQm8pPOzFgGrhQ5Ih5oO8KfDO5lsABjn9
         0fxg==
X-Forwarded-Encrypted: i=1; AJvYcCXUSUT3zww50ii1lhBw8k6vE0kphWaXdSoBCEfJ4bFqfdICMnhsA6NHEywTVWxgQKhQPzFj2I9w/8XAG+Dl@vger.kernel.org
X-Gm-Message-State: AOJu0YyUesyLeXIcCoJI5Tp8s7DVnmFzCl7/tSNq9hFHLUCUgjnO7BCL
	toPEZmk/qYgpsRyW64EzMyaw/2/uJCJXN/jR/d73r7cqVYNIqFK2LgNt6vcp/V+mQiA1RKwBgxr
	5JrJ8UcjQisg6J2RmrjzgiLoYS1nPtLhr/BgyeG2Ul2w9VIBSlyOhFy72An2vKRdivgWI
X-Gm-Gg: ASbGncsffj44D0aI96gAvrhME/XGO1kFqRCEbrqQy2vUXm2UVRG66u3+GWYyDg7GT7t
	NWgSLdynC+f87t0cxvWiGR8cVRHTBtQxFZGfHU95tFoHHod7gmejUxMerub1jZeLi/YzqbkSJhw
	6myi/TxC9a0BjTrORLwyPVuWRLwfRkwGnpPNjgWcdvkoe0kAKAEjAiNbnFCx3LIQIa3KV0J9RSg
	5b2BubT/soDCSiUq7T8o2V20QwdbblLE1040BPmeWa1sQ0xzykgbvoTEKWvRiA4PqFGslKHTu1/
	5Pn9xXFwH49QJ4gVMaQpMwYtOi5HKqVBX7UglT1QHiUU7yDH65WuA1QsaiLOVDOVOFdLQVr6uWy
	jW/zT/LtNHKijePuguoL3PlMmB/5x42QXza3fYRx+so3bBE8rAlnQDe8Fe9FdmR6lG/5oPAj8Wn
	VMqAohKML1dJL8NLlRWAc3uKs=
X-Received: by 2002:a05:622a:11c2:b0:4ed:64ee:b93c with SMTP id d75a77b69052e-4edf212a300mr286925071cf.52.1763560056398;
        Wed, 19 Nov 2025 05:47:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb1xJ13os5DPIP4ym6xUbfxDe9p9GWA7wIXCSbQUAZrlRyRKjmS+0+aXVR3vePPjuKklaIEw==
X-Received: by 2002:a05:622a:11c2:b0:4ed:64ee:b93c with SMTP id d75a77b69052e-4edf212a300mr286924571cf.52.1763560055869;
        Wed, 19 Nov 2025 05:47:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b8427sm4657081e87.45.2025.11.19.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:47:35 -0800 (PST)
Date: Wed, 19 Nov 2025 15:47:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Slark Xiao <slark_xiao@163.com>, mani@kernel.org, ryazanov.s.a@gmail.com,
        johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn
 T99W760
Message-ID: <rchyzpkfozxd55x4mvpsz2toz7j26yeww7yjiios3uky734lnq@rtuiloh6aokm>
References: <20251119105615.48295-1-slark_xiao@163.com>
 <20251119105615.48295-3-slark_xiao@163.com>
 <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
 <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDExMCBTYWx0ZWRfXw8+YBNfEmEZ2
 olB0T1bXzclTG0EgVeBLH+TN6OqhsPzESBQwmjQFERp2NzRwczmGCiFEYan6BFqgRkiqvIFGR9/
 N8mWfN45++qj913FYSrxsq4AFwbfI8aGqdM0ir9s5F3yQySFjmI1i9OSpjn86DM4CVIF8wB6VxM
 CV55y97DTKr+nGbu6UrS8Gr99WXzpBD7chU1E5CncJzJFjyAXyE7rhvB/Ai3u9Wa/z5eo+rvx19
 SVsK5KOkEOZwkiAxJJB7HAiIsNSgHQGHkU1vLuApKF7i3CFIseP3uXf5l20GYRz9VeTwDVHma1/
 NseoUql0Axy51S9pYp5wcLTGPDaJeGm5z57T0/R7Gq1zeZMXK3apAYuyDyvzr7etyUL9WcasvZw
 0opyV7+3Pr00zo0grgUKTNdA1XAbAQ==
X-Proofpoint-GUID: RC3F3tfdUQYgAQCY3ikS3bfJGPpTBwSC
X-Authority-Analysis: v=2.4 cv=QZlrf8bv c=1 sm=1 tr=0 ts=691dca79 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8 a=jQgu-4_j7KVpme77iUgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: RC3F3tfdUQYgAQCY3ikS3bfJGPpTBwSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190110

On Wed, Nov 19, 2025 at 02:08:33PM +0100, Loic Poulain wrote:
> On Wed, Nov 19, 2025 at 12:27 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Wed, Nov 19, 2025 at 06:56:15PM +0800, Slark Xiao wrote:
> > > T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> > > architechture with SDX72/SDX75 chip. So we need to assign initial
> > > link id for this device to make sure network available.
> > >
> > > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > > ---
> > >  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
> > > index c814fbd756a1..a142af59a91f 100644
> > > --- a/drivers/net/wwan/mhi_wwan_mbim.c
> > > +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> > > @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(struct mhi_mbim_context *mbim
> > >  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
> > >  {
> > >       if (strcmp(cntrl->name, "foxconn-dw5934e") == 0 ||
> > > -         strcmp(cntrl->name, "foxconn-t99w515") == 0)
> > > +         strcmp(cntrl->name, "foxconn-t99w515") == 0 ||
> > > +         strcmp(cntrl->name, "foxconn-t99w760") == 0)
> >
> > Can we replace this list of strinc comparisons with some kind of device
> > data, being set in the mhi-pci-generic driver?
> 
> If we move this MBIM-specific information into mhi-pci-generic, we
> should consider using a software node (e.g. via
> device_add_software_node) so that these properties can be accessed
> through the generic device-property API.

Works for me too.

-- 
With best wishes
Dmitry

