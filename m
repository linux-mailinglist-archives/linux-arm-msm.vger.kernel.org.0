Return-Path: <linux-arm-msm+bounces-47627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E3A3126F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 18:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5763A73C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 17:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20610262168;
	Tue, 11 Feb 2025 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEXWz926"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB87262152
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 17:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293642; cv=none; b=VtzLeMxahpA8rQ3KeZOCdGzMfF6wNaZ9wUn4L4ce+hKc3CAZgLLUb1T1nlGObWyfXxd7inSRoSkPTAJTB81TyEtONMso2PXkjqD75V/FBG234JcckS9t7tds1pDArvM/HfDWX/Tu5ZvCo4D42tlCchqHrxo/YmvxoIddXmsB5QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293642; c=relaxed/simple;
	bh=rbe5Y2Ln2SSnKxfB/YNLvURbuJdqZXf4Y5kS17Vit80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9WQheyejZYs1cflwSQuLskw9VYOo+SV2TS4wdCswuHW1JtmRJY7dbEsizTByJGmAyQjTedFvoH4FELuSsoCiYUq/sgui2yHA3sEb01NFe2EW8IXSZXAwOu4caPUNC4L6Cna1yWfF1QoVE9dwv0FJf402N4Be1LrEuFB0xMZIuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEXWz926; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BH0aJD006115
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 17:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1GMVTG1cg17eCXjRnwy0UFsT
	hrjnHjAWCsStfcLb0Kg=; b=cEXWz926r09ZKs3nPknOWcICCAD5njRLq+4/RD5A
	zN9N9tdtPhe4QW4UuRAezP2RiBGYzr71biVrP6lBk2faA51E+bJHIyuk612cp/kN
	cQPLh37cGbcQ4FZfl42o9SjRyT4VfVRNouMS0y9QSbWukVtAuJTJhCIHyQMirqER
	4bswWhdhH30LS40XM9Q3VYjeKoMQkWD+oIMFiAFO65PFaYDt3G4MGGSFGzTQHvfw
	sbda7lPo72qH/p/IRXZG09OzFS2feUW8H/18wl22p0fT/yurAH/3OOw8WIaqbaw0
	0rwMzHReIhVPLdTl5SyJZZf8dak70wDAbM9hiln8WFUl0A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mvtpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 17:07:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21f464b9954so96711915ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 09:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739293637; x=1739898437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GMVTG1cg17eCXjRnwy0UFsThrjnHjAWCsStfcLb0Kg=;
        b=Kdpiagogz+BsZS286fuGj5n7UX0CPMF+8/zd+tGlySFoG4ihhlo6YKTjYdfGsoeJLX
         zqkRrPpkoTO/s7YqtMHEJ1cHvNjObH2kn1up+QiPcQobhDzLG/dDm5OEsS0xXp8P0yka
         DMWwXLnjo4rgYsEnRMFajioSFa1M/W6gJpp5gc2p2JCh2fZG5FB9dfP4skqICwrFgng9
         woqMiyPDmhET91z9yasO5qqbwTJL5qf5zlkhe3NQ4KBBM9lAAw9Dkt1Lc/ssgFflj2jX
         AtVQEAhK4jVZwX3/HpIFt8M4JjjPyLwhzbwxWbDp/RUVe72nEZQ8f66NgDyVjvrj451d
         3FUA==
X-Forwarded-Encrypted: i=1; AJvYcCXx5UgvfhvVHb+q4cNNcTtvMIYQHkm4OAvL0Ly1VFs76qvv95eyVPscvEz4/IiIlgxMPxNVHY/t/kJyjNz+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa9a9TmWzYKMQHKINsMVFxFXplIEbsh/8oBRLO+LxM4/Gofvqs
	QpabPu9SnmfYaJfTLypUxcplM/R/UA7qn/MD5yV8ySNc1YbidPwAPwxK4g+w9mxny0G7OCMQw1D
	9X9nUpARtaeN7KIFADPGCh6WfS4uEt+q6Ds+m1hwl0JJjcZWV/JNHrd0aUz/sbE5E
X-Gm-Gg: ASbGncuNcAmMsAod0YxGdVt4TFaea9Zb8EP6UjimZ1I2NH2E7HNx9mO9kwx5/LxNIHv
	6sTy80rBHD3cQXk7Q+xSWFmGR0rJ5lqQbRZvMrADR4K6U0UHMxe7WiBKxtDXmMvzyY6yNsHZoAV
	HKenFq9K+HRrye9Svg4eO9MvL97PgixcSujzChhVK40nLbYiorKPkvtjtgPrS++e1Ict6jubIhJ
	vrFWzptqlOT1eoFfAvQ3Wqtc61HIcFpQRJjDmcrWWhb+s/IlGNP7F1wXqzQy3NhA8BexRveIA5u
	Ihf2nEL6dHxL+P/fqkkXFcBQZfnZgn/v
X-Received: by 2002:a05:6a00:ad86:b0:730:fb0a:4842 with SMTP id d2e1a72fcca58-73218c5366cmr6150976b3a.9.1739293636891;
        Tue, 11 Feb 2025 09:07:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaAarcp1qmTm66w1HLya6eJdieVpL0WZWQEQCxqmomvF7dLUVo+c7WY3hwt8HvtzUA+Eqvng==
X-Received: by 2002:a05:6a00:ad86:b0:730:fb0a:4842 with SMTP id d2e1a72fcca58-73218c5366cmr6150938b3a.9.1739293636467;
        Tue, 11 Feb 2025 09:07:16 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730964e7866sm3360074b3a.56.2025.02.11.09.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:07:16 -0800 (PST)
Date: Tue, 11 Feb 2025 22:37:11 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Saranya R <quic_sarar@quicinc.com>,
        Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2] soc: qcom: pdr: Fix the potential deadlock
Message-ID: <Z6uDv3c3DkmgumnM@hu-mojha-hyd.qualcomm.com>
References: <20250129155544.1864854-1-mukesh.ojha@oss.qualcomm.com>
 <nqsuml3jcblwkp6mcriiekfiz5wlxjypooiygvgd5fjtmfnvdc@zfoaolcjecpl>
 <Z6nE0kxF2ipItB2r@hu-mojha-hyd.qualcomm.com>
 <Z6nKOz97Neb1zZOa@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6nKOz97Neb1zZOa@hovoldconsulting.com>
X-Proofpoint-GUID: n-oqqx-H1U7JQGbic8aSvEP4BCu_9gVS
X-Proofpoint-ORIG-GUID: n-oqqx-H1U7JQGbic8aSvEP4BCu_9gVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110112

On Mon, Feb 10, 2025 at 10:43:23AM +0100, Johan Hovold wrote:
> On Mon, Feb 10, 2025 at 02:50:18PM +0530, Mukesh Ojha wrote:
> > On Thu, Feb 06, 2025 at 04:13:25PM -0600, Bjorn Andersson wrote:
> > 
> > > On Wed, Jan 29, 2025 at 09:25:44PM +0530, Mukesh Ojha wrote:
> > > > When some client process A call pdr_add_lookup() to add the look up for
> > > > the service and does schedule locator work, later a process B got a new
> > > > server packet indicating locator is up and call pdr_locator_new_server()
> > > > which eventually sets pdr->locator_init_complete to true which process A
> > > > sees and takes list lock and queries domain list but it will timeout due
> > > > to deadlock as the response will queued to the same qmi->wq and it is
> > > > ordered workqueue and process B is not able to complete new server
> > > > request work due to deadlock on list lock.
> > > > 
> > > >        Process A                        Process B
> > > > 
> > > >                                      process_scheduled_works()
> > > > pdr_add_lookup()                      qmi_data_ready_work()
> > > >  process_scheduled_works()             pdr_locator_new_server()
> > > >                                          pdr->locator_init_complete=true;
> > > >    pdr_locator_work()
> > > >     mutex_lock(&pdr->list_lock);
> > > > 
> > > >      pdr_locate_service()                  mutex_lock(&pdr->list_lock);
> > > > 
> > > >       pdr_get_domain_list()
> > > >        pr_err("PDR: %s get domain list
> > > >                txn wait failed: %d\n",
> > > >                req->service_name,
> > > >                ret);
> > > > 
> > > > Fix it by removing the unnecessary list iteration as the list iteration
> > > > is already being done inside locator work, so avoid it here and just
> > > > call schedule_work() here.
> > > > 
> > > 
> > > I came to the same patch while looking into the issue related to
> > > in-kernel pd-mapper reported here:
> > > https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> > > 
> > > So:
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > Tested-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Should i add this in next version ?

> 
> I was gonna ask if you have confirmed that this indeed fixes the audio
> regression with the in-kernel pd-mapper?
> 
> Is this how you discovered the issue as well, Mukesh and Saranya?

No, we are not using in kernel pd-mapper yet in downstream..

> 
> If so, please mention that in the commit message, but in any case also
> include the corresponding error messages directly so that people running
> into this can find the fix more easily. (I see the pr_err now, but it's
> not as greppable).

Below is the sample log which got in downstream when we hit this issue

13.799119:   PDR: tms/servreg get domain list txn wait failed: -110
13.799146:   PDR: service lookup for msm/adsp/sensor_pd:tms/servreg failed: -110

> 
> A Link tag to my report would be good to have as well if this fixes the
> audio regression.

I see this is somehow matching the logs you have reported, but this deadlock
is there from the very first day of pdr_interface driver.

[   14.565059] PDR: avs/audio get domain list txn wait failed: -110
[   14.571943] PDR: service lookup for avs/audio failed: -110

-Mukesh
> 
> Johan

