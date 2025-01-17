Return-Path: <linux-arm-msm+bounces-45469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4D0A15958
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 23:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73784188CFF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 22:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC0919E7D1;
	Fri, 17 Jan 2025 22:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKPy3Dm5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CD019CC34
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 22:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737151522; cv=none; b=AUpJXeI7SHVyAvoiQPsN97MN3ZJy+9nFnYzgZv2nquGD2xZ43s2jY8C0i2Bmpol+DsO/bQRneE1I0iuIHrHoDHR3NAdyMq01pz+KFINywBR4Zij4CIdjAJdJFHYcSXYmQGY1rK1pvkRvp7/kw+0LJX2Fopf2H1mGtVg7qFwchHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737151522; c=relaxed/simple;
	bh=pWWEkMtvtT/SQDohStnmEBJisNjdNNakk2Pb1ycp/w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zu/qov1gfq9xEj+WbCJMPWNACebWdiUsfl+EaxY9LIOJTHpTj0lvoRYteNyazfuvvMC5FqQz7ND7q8ot3pu2bS7YdRmu/q5tHMOAx3+j0URHbjb2pNubyCc9Kwf6LZayQ/6bAxfBx0CRq3VaUErvbUU012R8jI4v/gYOTljN9Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKPy3Dm5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HIsXs8005468
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 22:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JSLK34Lu3YRBCLGcytvmW0b3
	5pxC3UtVOnWaZ8x+bow=; b=aKPy3Dm5ouC+0mQnc+a+5z2phKxBp+BpMJ3Qt7Qt
	jPer4T9AyxYPNpWj9AYRr+he8QZMGUvmRIkhC1MXzXJxkSa+BSRV+VbJIfgLnT0s
	bddhrwTbqyamWg3GWpZiUCEHf/oy4CWxjWfEfw4q+bJCUhcUZXi3uZuCdKJe1JS8
	c82B2ENp4eL/6DbBTfy4QzR2H0V0hVgWlRsblRSuje5TK5R43R5K3qxy+MOpkOsE
	LGYDZiytEgrd9Lrc8T9EvPq/RlSUDlsYsfssj9i7sh5khdxEaXqJJ0vuGZhWcjLu
	67xJqQGis6JKy91qSaFmh/NZBpKG9mZ8RuMngPcCS0KlbA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447vw9ra0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 22:05:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2163dc0f5dbso50917305ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 14:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737151517; x=1737756317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSLK34Lu3YRBCLGcytvmW0b35pxC3UtVOnWaZ8x+bow=;
        b=NabuvNFu4vVV3Cj0HgVYgPk5vAZEqEaxxWOgTxvHHY6OBWvLyrHrYisw7JjuGanAy4
         McqO9xDS1YVuwZ5GcI3qHqU8pVs0/WUgNhOGq9rUsrdFhKsQPJKCeF2+GAooMG0E+2fG
         b/+Q1KdAI+R3RfZGAkPGa2MSukcacMUyKvP47v0sPjmLz+jYKR0WB7+hvtzQhFQ+QFxG
         UCd0jxSXG/z6FK/wKG3nPJ1aFwpT3OupjenVR1ru5+mQrNiQ6hwfiyzgxVQgEzTmAllC
         zRLWd86r9StZCrQHhyvJDw/RuqeHK1B5rLgUJWa0MjNnQgb/Xui8jAb4SL0dWrQcnB/6
         2tiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH9IDGTxEvTtmx4ku7bMetTQPK+7zTetxTDyJn/vbSmgNqe/EtkW9bFNewKnVMya1jfN7WzjJk38bb58RD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9BfCpng9xCv6+35SDDScF3CEjW5CGvCm+GH4cXxPu+EXP4Vdn
	x4RcI74RQwRGgcrx48J1WOufNyrAcAmtG9HwDgAD6Uqw/ps9ZECBxICcPK2zj1H6uZsqAdgi/n0
	nlo+vve836TI/K7Yu/mBmq9PWk7z6HSOuJ5gDpbl9Ey8vJo+05BcIl8Jr4BFn1+N4
X-Gm-Gg: ASbGnctv13nX9LdV1CtFEcSTJBZprmhbT7YrhVTKP4epv69T6+UW0OLMCUj+MFHaqmu
	1zM1vIQw9UGXiLAirMqrXeWDjEuua+NRxQHwR6zrhf8nfHENTiUocVvAphafOt+o5DDbzYqS7Oz
	1alLvUjvrqa3FYWaU+c8/yWeSIiqVnOoY/f4uCyIUG7O/RHRC/nzKNf8IfYBvcGci9qbDxvDaRt
	mnVVB+xzPM74mtl4MC8rvgkdbLJbh+eHPuLRpZdY/0LvzhTuelzckL/Zvou1sZpDn00TC+efPH3
	gMUaNeCWK7v69Ah8PJWcyxImmXImUwa6CY41HP4Nf47U1DkkJQ==
X-Received: by 2002:a17:902:ea06:b0:216:45eb:5e4d with SMTP id d9443c01a7336-21c352c7921mr57027575ad.6.1737151517423;
        Fri, 17 Jan 2025 14:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHk7q6iHrRnd1nXp+s+RpidtLrv0uU4L62iDyixRYGuxhfV0N1Xq3R/zhpGVH2sq0L2lUGqQg==
X-Received: by 2002:a17:902:ea06:b0:216:45eb:5e4d with SMTP id d9443c01a7336-21c352c7921mr57027115ad.6.1737151516934;
        Fri, 17 Jan 2025 14:05:16 -0800 (PST)
Received: from hu-eberman-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d4042f8sm20582705ad.236.2025.01.17.14.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 14:05:16 -0800 (PST)
Date: Fri, 17 Jan 2025 14:05:13 -0800
From: Elliot Berman <elliot.berman@oss.qualcomm.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org,
        pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au,
        anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk,
        brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org,
        xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com,
        jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com,
        yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net,
        vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com,
        mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com,
        wei.w.wang@intel.com, liam.merwick@oracle.com,
        isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com,
        suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com,
        quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com,
        quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com,
        quic_pderrin@quicinc.com, quic_pheragu@quicinc.com,
        catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com,
        oliver.upton@linux.dev, maz@kernel.org, will@kernel.org,
        qperret@google.com, keirf@google.com, roypat@amazon.co.uk,
        shuah@kernel.org, hch@infradead.org, jgg@nvidia.com,
        rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com,
        hughd@google.com, jthoughton@google.com
Subject: Re: [RFC PATCH v5 01/15] mm: Consolidate freeing of typed folios on
 final folio_put()
Message-ID: <20250117135917364-0800.eberman@hu-eberman-lv.qualcomm.com>
References: <20250117163001.2326672-1-tabba@google.com>
 <20250117163001.2326672-2-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117163001.2326672-2-tabba@google.com>
X-Proofpoint-ORIG-GUID: VmfmBjebejmIFFwAllN49GQofSV5smZb
X-Proofpoint-GUID: VmfmBjebejmIFFwAllN49GQofSV5smZb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_07,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1011 adultscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170170

On Fri, Jan 17, 2025 at 04:29:47PM +0000, Fuad Tabba wrote:
> Some folio types, such as hugetlb, handle freeing their own
> folios. Moreover, guest_memfd will require being notified once a
> folio's reference count reaches 0 to facilitate shared to private
> folio conversion, without the folio actually being freed at that
> point.
> 
> As a first step towards that, this patch consolidates freeing
> folios that have a type. The first user is hugetlb folios. Later
> in this patch series, guest_memfd will become the second user of
> this.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  include/linux/page-flags.h | 15 +++++++++++++++
>  mm/swap.c                  | 24 +++++++++++++++++++-----
>  2 files changed, 34 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 691506bdf2c5..6615f2f59144 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -962,6 +962,21 @@ static inline bool page_has_type(const struct page *page)
>  	return page_mapcount_is_type(data_race(page->page_type));
>  }
>  
> +static inline int page_get_type(const struct page *page)
> +{
> +	return page->page_type >> 24;
> +}
> +
> +static inline bool folio_has_type(const struct folio *folio)
> +{
> +	return page_has_type(&folio->page);
> +}
> +
> +static inline int folio_get_type(const struct folio *folio)
> +{
> +	return page_get_type(&folio->page);
> +}
> +
>  #define FOLIO_TYPE_OPS(lname, fname)					\
>  static __always_inline bool folio_test_##fname(const struct folio *folio) \
>  {									\
> diff --git a/mm/swap.c b/mm/swap.c
> index 10decd9dffa1..6f01b56bce13 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -94,6 +94,20 @@ static void page_cache_release(struct folio *folio)
>  		unlock_page_lruvec_irqrestore(lruvec, flags);
>  }
>  
> +static void free_typed_folio(struct folio *folio)
> +{
> +	switch (folio_get_type(folio)) {

I think you need:

+#if IS_ENABLED(CONFIG_HUGETLBFS)
> +	case PGTY_hugetlb:
> +		free_huge_folio(folio);
> +		return;
+#endif

I think this worked before because folio_test_hugetlb was defined by:
FOLIO_TEST_FLAG_FALSE(hugetlb)
and evidently compiler optimizes out the free_huge_folio(folio) before
linking.

You'll probably want to do the same for the PGTY_guestmem in the later
patch!

> +	case PGTY_offline:
> +		/* Nothing to do, it's offline. */
> +		return;
> +	default:
> +		WARN_ON_ONCE(1);
> +	}
> +}
> +
>  void __folio_put(struct folio *folio)
>  {
>  	if (unlikely(folio_is_zone_device(folio))) {
> @@ -101,8 +115,8 @@ void __folio_put(struct folio *folio)
>  		return;
>  	}
>  
> -	if (folio_test_hugetlb(folio)) {
> -		free_huge_folio(folio);
> +	if (unlikely(folio_has_type(folio))) {
> +		free_typed_folio(folio);
>  		return;
>  	}
>  
> @@ -934,13 +948,13 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
>  		if (!folio_ref_sub_and_test(folio, nr_refs))
>  			continue;
>  
> -		/* hugetlb has its own memcg */
> -		if (folio_test_hugetlb(folio)) {
> +		if (unlikely(folio_has_type(folio))) {
> +			/* typed folios have their own memcg, if any */
>  			if (lruvec) {
>  				unlock_page_lruvec_irqrestore(lruvec, flags);
>  				lruvec = NULL;
>  			}
> -			free_huge_folio(folio);
> +			free_typed_folio(folio);
>  			continue;
>  		}
>  		folio_unqueue_deferred_split(folio);
> -- 
> 2.48.0.rc2.279.g1de40edade-goog
> 

