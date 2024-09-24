Return-Path: <linux-arm-msm+bounces-32325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D79849CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 18:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A8E21F263E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 16:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3321AC428;
	Tue, 24 Sep 2024 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nmoPLdUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254FF1AB6EC;
	Tue, 24 Sep 2024 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727196055; cv=none; b=bM33kWBWYXNKYX0loBXox1l1zVgSvfqKLl9Y9G9kmmW6N7qlUqtWzZFDphB3FnAeIsNDo4B+KLT2IuByStr9kQxGi+kQd2e44OGSlugUMybhBWOcQGMxT8l0UYGTKiDtwEGHDdEmtGFXYAkJxW++BJbECpsnUbMWAr/ZIBiB72Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727196055; c=relaxed/simple;
	bh=c4/FXaABwTV61KcHglbl6e2JQeLbds1ZzvF3ocQXVAs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyTJnZgYVb5YLueqpgpRjS/3nA0KUePMJt04I+aQwnlQUywSNSgB/jr6I0nWeuQoq+vT+tw/8DpY4qEkYsWji4X6cGFM8mTJ0BQesIo//C6SID/D+ixPLB0yo75VZYhSjFcpzivm5wELrP1h5jZp9/9V2rp4FOS/kvJjYV6f5ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nmoPLdUa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O8H3YN021730;
	Tue, 24 Sep 2024 16:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1aXdEYh5NFr5tG7RMivDvlqL
	RnRj5TY7endHsnkXyH0=; b=nmoPLdUaBwvQZYy/MS5xYORaUMxgDJ/0eI+V7akD
	IyKWAheosOW0VkaJbQxvmkgp5akhoE/Sum/Yz7Tn9hV3EXuauL0ACC8WtChCpfQf
	zGGHRCDzAXzbx6NTSvDmnVDtteNMmpJ7Y6q/2qQ+Y3LDB2m6bQ9e0u6nowhI34fZ
	fmkf3Dza0d71ayLCjNcqpbJ7VZABVeVdvRGcbBZe12vfqtop5/Ff8paMRI5LduXn
	r9GxLQbEf7FsWk3lJuFbj00QW8UAlsVQEFDDxySmsyFq1NnLe/oI3OJagd/XOQNA
	jse3WmjGTZPemKmz6YFqbiFM1s1U9EGRWmJzD6sNKPHS5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqe9920h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 16:40:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OGenZ1016815
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 16:40:49 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 09:40:48 -0700
Date: Tue, 24 Sep 2024 09:40:47 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Chris Lew <quic_clew@quicinc.com>, Johan Hovold <johan@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: pd_mapper: fix ADSP PD maps
Message-ID: <ZvLrj+gYaBzgwdLu@hu-bjorande-lv.qualcomm.com>
References: <20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org>
 <Zu0wb-RSwnlb0Lma@hovoldconsulting.com>
 <sziblrb4ggjzehl7fqwrh3bnedvwizh2vgymxu56zmls2whkup@yziunmooga7b>
 <Zu06HiEpA--LbaoU@hovoldconsulting.com>
 <18e971c6-a0ef-4d48-a592-ec035b05d2b7@quicinc.com>
 <5pl7cewea6bfweqcnratmcb7r2plyzwyofsmcjixtkzwx7aih5@tm5c34mmzzb7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5pl7cewea6bfweqcnratmcb7r2plyzwyofsmcjixtkzwx7aih5@tm5c34mmzzb7>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IE5gG0BAvEar2M4iPUOUCp5ZQjuGtk_c
X-Proofpoint-GUID: IE5gG0BAvEar2M4iPUOUCp5ZQjuGtk_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1011
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240119

On Fri, Sep 20, 2024 at 05:07:13PM +0300, Dmitry Baryshkov wrote:
> On Fri, Sep 20, 2024 at 07:00:11AM GMT, Chris Lew wrote:
> > 
> > 
> > On 9/20/2024 2:02 AM, Johan Hovold wrote:
> > > On Fri, Sep 20, 2024 at 11:49:46AM +0300, Dmitry Baryshkov wrote:
> > > > On Fri, Sep 20, 2024 at 10:21:03AM GMT, Johan Hovold wrote:
> > > > > On Wed, Sep 18, 2024 at 04:02:39PM +0300, Dmitry Baryshkov wrote:
> > > > > > On X1E8 devices root ADSP domain should have tms/pdr_enabled registered.
> > > > > > Change the PDM domain data that is used for X1E80100 ADSP.
> > > > > 
> > > > > Please expand the commit message so that it explains why this is
> > > > > needed and not just describes what the patch does.
> > > > 
> > > > Unfortunately in this case I have no idea. It marks the domain as
> > > > restartable (?), this is what json files for CRD and T14s do. Maybe
> > > > Chris can comment more.
> > > 
> > > Chris, could you help sort out if and why this change is needed?
> > > 
> > > 	https://lore.kernel.org/all/20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org/	
> > > 
> > 
> > I don't think this change would help with the issue reported by Johan. From
> > a quick glance, I couldn't find where exactly the restartable attribute is
> > used, but this type of change would only matter when the ChargerPD is
> > started or restarted.
> 
> This raises a question: should we care at all about the pdr_enabled? Is
> it fine to drop it fromm all PD maps?
> 

There's definitely benefits to pdr_enabled. I'd expect you could have
examples such as audio firmware restarting without USB Type-C being
reset.

So, the appropriate path forward would be to figure out how we can
properly test the various levels of restarts in a continuous fashion and
make sure it's enabled where it can be...

Regards,
Bjorn

> > 
> > The PMIC_GLINK channel probing in rpmsg is dependent on ChargerPD starting,
> > so we know ChargerPD can start with or without this change.
> > 
> > I can give this change a try next week to help give a better analysis.
> > 
> > > > > What is the expected impact of this and is there any chance that this is
> > > > > related to some of the in-kernel pd-mapper regression I've reported
> > > > > (e.g. audio not being registered and failing with a PDR error)?
> > > > > 
> > > > > 	https://lore.kernel.org/all/ZthVTC8dt1kSdjMb@hovoldconsulting.com/
> > > > 
> > > > Still debugging this, sidetracked by OSS / LPC.
> > > 
> > > Johan
> 
> -- 
> With best wishes
> Dmitry
> 
> 

