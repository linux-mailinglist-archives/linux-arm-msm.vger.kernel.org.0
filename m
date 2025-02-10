Return-Path: <linux-arm-msm+bounces-47379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4CAA2E782
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 10:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D082316682F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 09:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082BC1AA1C0;
	Mon, 10 Feb 2025 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eG3KHlZ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBA41C1F08
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179227; cv=none; b=egiWbZ6vIhsv+4xgt7kXlYNOgsF6GgHlT+eHCQsqm7E0KDhz09CPOX2Q2P/j+/1ycbZdxfzyjvxKTgC3N9XzYGENh7jNRRKH++Ep2wM+m8omTZWiIpubLWyZP+huV+FuHKLyN0dlkH4F3RY3jNnwyThnRT40UG014uqIdt+ch3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179227; c=relaxed/simple;
	bh=PT02zREhwXUaI7oSUo68634yGkEnv5WqHiUuJQRNAyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJ3jn24VgCspyyewha0r5KTSZ95xKN4Fu5DOXPaLsPn+P3dU/qrDFiBooDZSsk8mtXBlFcilXeGoNi9l4P4TIgn2idNntRJISbZfN9sPrdEn2xHLEzWRp0RZwE95deTAEJZ997BsejdMqYxlfW5lhdItApQbNmJFXLGU6Tpr128=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eG3KHlZ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A2Lq0t011071
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:20:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lzMoqxxC4iIRXsH/yWCzH8jT
	RNEGRUBbLR7vl8C1qf0=; b=eG3KHlZ59ulPo2rRN5AeX7X5b9VgGkmySmTZ93jm
	PAnd+mpJ6aFsa5BpbSFl5ooelx1OOohMFGnBNfCKXgklHWH0vEgNY57C28ygz7k6
	G0g40nMQGjPgBzBWladHPynvXTHSlUqMIt1L0CkuxyMt63Z3GpuxBVoifAw+Cc4n
	bxMuP+286GMpEFkX8GQqmLM6d0M0NUn9a56gXT7vA6NCpT7yCQZa6ArMtrIqeqrq
	BpSWPoBFI//Fh8zcHp8R4QylH7LGCsWeGfnt4PIOjJn1a9a1dYDQGD0rpfLXpwgz
	BK425E1nr2SbmqYwI2vgYU57yROJJficA8KtHHo1wrwI7g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44q8ky8yu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 09:20:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f4666364bso60978775ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 01:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179224; x=1739784024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzMoqxxC4iIRXsH/yWCzH8jTRNEGRUBbLR7vl8C1qf0=;
        b=eerVE2dYp7jB9AOHFM6PbxzDtZkq1pQajmq6z/RfBpwPSef1uY7UlRofY4P2JxeTwM
         fyTh0j7hy1uJdW3/Cc6HqvVY1beXYedpkJQOYzuYFiYYtPGZ1qvPHcKFpUnkhqA9KDo/
         PDNnYGsfdYkNzgDQsP0ANm0e7Z9MxYcSjBVYgClWOiBRxMCDVNikPJ2LiEmUV5bU3ctl
         KHwJoPOwFmSsS8/aQ0P5ueXXa8ejQM7VAElb/ETfl+7ZNHNDT4MwxtvMsYAVa5cjaNk/
         oGhGBkeT9d4I29HvIRse0479NQkN7aRRuvpXU/PbIG93PG5avDL7FyoIZxOmocdnXAF8
         8HjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHmCkbEBCxAm32FFKRZTMfQcN5mPLlyq5hE8ynqplo7FefBRYdXs720hkLDV94RMzUcACGgJe/FRxjJsLL@vger.kernel.org
X-Gm-Message-State: AOJu0YyHmQu5frsUQuj7zbcR4oszIPEHkyVYlpIL7aJjAcXwURmkwIX1
	f1DlNSzC7OJXCSk5Conpx42//5PyZwM1nfj6WMGx6OeL3p1A0m11hU9JmDRgbHRPdse5Ecdw3NC
	mq/4yUfE5XgS9MP/VxnEzK+KPqDBwByJpj+9BaBNwz8z3nWC9t5E6vRV8mj91W7gZ
X-Gm-Gg: ASbGncsbpwhibSGMPZsv1MqaGD2n0MWVRe7bD+QmCaBg7ZRIJruyjdkvdH7IXwcHyOm
	V1eal6jytuk72Hs7OHjjQknxnadrsDwBIgxbbbzt+SvqcEh4QAULHcZIPOIs2FBMc1W7qTYGGia
	4pSUf1cJxmd5jgzVUDlxsGVFybAPs4MT4JfSmdSabUzdCHAYRxdzGA7ZWa1CY8psZ/l9ESDsiz3
	68oAiVLfXyrgK+epS1OvAFZDvo9bDdOTPeGHtkPk6PnTj4mLbx2LL27+ew+KHiQzbXi7lzPPGGq
	0fxYBmHyd6GQn3AlY44/PyzmrbeLIr9F
X-Received: by 2002:a17:902:fc84:b0:21f:8320:f409 with SMTP id d9443c01a7336-21f8320f454mr80737925ad.21.1739179223999;
        Mon, 10 Feb 2025 01:20:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZHKAzKZvTW6bB8BRzfsWOsXkmuCrb/IWIeRi+vf2G14R+RdaAzW0RqOhh/yDhzr0WLFQZDA==
X-Received: by 2002:a17:902:fc84:b0:21f:8320:f409 with SMTP id d9443c01a7336-21f8320f454mr80737625ad.21.1739179223593;
        Mon, 10 Feb 2025 01:20:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368bb4bdsm72679345ad.235.2025.02.10.01.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:20:23 -0800 (PST)
Date: Mon, 10 Feb 2025 14:50:18 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Saranya R <quic_sarar@quicinc.com>, Johan Hovold <johan@kernel.org>,
        Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2] soc: qcom: pdr: Fix the potential deadlock
Message-ID: <Z6nE0kxF2ipItB2r@hu-mojha-hyd.qualcomm.com>
References: <20250129155544.1864854-1-mukesh.ojha@oss.qualcomm.com>
 <nqsuml3jcblwkp6mcriiekfiz5wlxjypooiygvgd5fjtmfnvdc@zfoaolcjecpl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nqsuml3jcblwkp6mcriiekfiz5wlxjypooiygvgd5fjtmfnvdc@zfoaolcjecpl>
X-Proofpoint-GUID: FFFPGNyaNUvtckU1C_3cn1DIjGT2OmeL
X-Proofpoint-ORIG-GUID: FFFPGNyaNUvtckU1C_3cn1DIjGT2OmeL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100078

On Thu, Feb 06, 2025 at 04:13:25PM -0600, Bjorn Andersson wrote:

> On Wed, Jan 29, 2025 at 09:25:44PM +0530, Mukesh Ojha wrote:
> > When some client process A call pdr_add_lookup() to add the look up for
> > the service and does schedule locator work, later a process B got a new
> > server packet indicating locator is up and call pdr_locator_new_server()
> > which eventually sets pdr->locator_init_complete to true which process A
> > sees and takes list lock and queries domain list but it will timeout due
> > to deadlock as the response will queued to the same qmi->wq and it is
> > ordered workqueue and process B is not able to complete new server
> > request work due to deadlock on list lock.
> > 
> >        Process A                        Process B
> > 
> >                                      process_scheduled_works()
> > pdr_add_lookup()                      qmi_data_ready_work()
> >  process_scheduled_works()             pdr_locator_new_server()
> >                                          pdr->locator_init_complete=true;
> >    pdr_locator_work()
> >     mutex_lock(&pdr->list_lock);
> > 
> >      pdr_locate_service()                  mutex_lock(&pdr->list_lock);
> > 
> >       pdr_get_domain_list()
> >        pr_err("PDR: %s get domain list
> >                txn wait failed: %d\n",
> >                req->service_name,
> >                ret);
> > 
> > Fix it by removing the unnecessary list iteration as the list iteration
> > is already being done inside locator work, so avoid it here and just
> > call schedule_work() here.
> > 
> 
> I came to the same patch while looking into the issue related to
> in-kernel pd-mapper reported here:
> https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
> 
> So:
> Reviewed-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> Tested-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Thanks.,

> 
> > Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
> > CC: stable@vger.kernel.org
> > Signed-off-by: Saranya R <quic_sarar@quicinc.com>
> 
> Can we please use full names?

I have informed her about this and she wants the same name to be mentioned here as well.
> 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Unfortunately I can't merge this; Saranya's S-o-b comes first which
> implies that she authored the patch, but you're listed as author.

I will correct it.

-Mukesh

> 
> Regards,
> Bjorn
> 
> > ---
> > Changes in v2:
> >  - Added Fixes tag,
> > 
> >  drivers/soc/qcom/pdr_interface.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
> > index 328b6153b2be..71be378d2e43 100644
> > --- a/drivers/soc/qcom/pdr_interface.c
> > +++ b/drivers/soc/qcom/pdr_interface.c
> > @@ -75,7 +75,6 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
> >  {
> >  	struct pdr_handle *pdr = container_of(qmi, struct pdr_handle,
> >  					      locator_hdl);
> > -	struct pdr_service *pds;
> >  
> >  	mutex_lock(&pdr->lock);
> >  	/* Create a local client port for QMI communication */
> > @@ -87,12 +86,7 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
> >  	mutex_unlock(&pdr->lock);
> >  
> >  	/* Service pending lookup requests */
> > -	mutex_lock(&pdr->list_lock);
> > -	list_for_each_entry(pds, &pdr->lookups, node) {
> > -		if (pds->need_locator_lookup)
> > -			schedule_work(&pdr->locator_work);
> > -	}
> > -	mutex_unlock(&pdr->list_lock);
> > +	schedule_work(&pdr->locator_work);
> >  
> >  	return 0;
> >  }
> > -- 
> > 2.34.1
> > 

