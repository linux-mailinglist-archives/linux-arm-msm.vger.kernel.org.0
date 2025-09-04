Return-Path: <linux-arm-msm+bounces-72134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF3B44723
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 22:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6707C1C87101
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 20:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D41E27EFE9;
	Thu,  4 Sep 2025 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhAtwS7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCFD27E05B
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017036; cv=none; b=ZKUf2LwJNXQ1fbydbkW3qync+vXw3umsQs3DFkVUnDs2o+zNSe1t6LKdEQ9mQeWs6HlarpWEMJ94IPxtkOzVSBBNa6zupG5kBY8/oH8kT0HdW476lR/18tECGk2u+gOZpB+KCvKLQZAhYz2EwcLBu4usunl5Yt2kfyA382GZxoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017036; c=relaxed/simple;
	bh=A1bBxKE+UbQNERGerOt9UWUgvARgsLszTLRBIrhR7to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+gCeIry2Ba2ZLB5IrGmhDkBn0P9L932NCo2Lf/uvCGstA/Q85iveJ5RKWoo1KGFk/MiGVxyzhMoJZWPckSEtCoGappYmq3zI/B2oht6mTtRzG9WUo0pCxNNIqzZr7N7hMG1PhlGhMXNTP3uXXNkMP6xJFg2s8sxnRNDfBdVqmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhAtwS7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IB5lf003768
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 20:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PMWsb19CFWkEFXMKXc91+DwP
	kgTTzLo12RNKo1X1z00=; b=fhAtwS7syQ0VSyDDcpV3BZ/XMzkmlE+qVRx5ha5F
	voGoo+DD/f0BwGuK1Us/JxoQHT8Lc6RCvHXCqK9L17jCxzRexrnDufHASEn7bT1l
	eRjTmJBiMpirUEtuG3h6TuIng9J7AqejBud+rPNjHoINtGyh9tjVOn8MppA57fSK
	y/+4taAwE833kmPIFP0St7KpdRNdsr6dvTSSYDuUGQYQLmSPLLoeZStnYB0XmDF2
	4SHjCgp3k1NUpRVZnov2acNsAYEViiMzsCyHfqL+xgyvCTbU7P7a05bK9s2SynFn
	wheqWy2CGl3MdDsW1xpfqI/7TFrhSUU5BrnLSvXB+sJM8Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s8uam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 20:17:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-729751964dcso17986836d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 13:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757017033; x=1757621833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMWsb19CFWkEFXMKXc91+DwPkgTTzLo12RNKo1X1z00=;
        b=HTUn0mMhJubnGIug9dJxeih+HyxDtn1kOaZslh+YO+Rt9F5RnM5R3Vis56X2eagb5a
         hDj9GYgZR8Aip0Yqf2PayIvifDibLWgA+K+GS99rLV2VffgV2mlBSfExT5Q7B9tOKVOU
         sWe04REL/0/8T3KEoA3al6ptIXjj5XaiQzG+5b9C68V9NYFALxYJmbLwY+hFUZRRHJTQ
         ynvAmEct6mIg/g+ib/H0oVatjMBj5PsbuL4D5WB7F8wIvANoGA8DX6PqQx4aZAUb4JlE
         CJ5lwej1jtGUmxyx/Lh2qc8jrli0gdBF51nohENN8F3lyQk/jwFmT/f4WlqUoTuQcX8I
         Td4A==
X-Forwarded-Encrypted: i=1; AJvYcCUOyBePr6koncfgRQVM1eNXzpevHpf89sXUAPKOP+RhYv5uYaC+3O+NGJPijKP3cW7kNU0z7fxbAEv42r+e@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/21sqoIilqwD51qTIWLb17RQjoWjUnMkWY4qHSxxvLXFQD84+
	B/GJf8Yiz0dP/LMII+YgUsGKe6fjuJDW8ykIG+Anln0Mdk+uviKJdcgCCF1qju6F0iCDjUYd+hi
	D7+cD2rW+IaFlRFp8p3Zw6G0ZJ0iY7wQf64lPOhpDw/iLpvsHSSdMRRIILyZY68kBzMZu
X-Gm-Gg: ASbGncsFmTD47vywCJ0Uck4eG4tVmmKMtYsvYQtWHBBENnYhN5zP8S4tFSXHNAIAPB0
	anYDCXgqOBHn9RXxgnIIL0U5xwCk3E6vN3ZrSlH/14XJ6HQtpWzvj9g2O+K2xJzn7lk0QdjvJDn
	WRFz5d6B4ZeT4ZeHk3cLfumuFej3pdQqOYj1pWNxi4z4BxwKMjw5OzBVtB7WhPug9HLQSnpU++w
	Yrf12UllcakdmxLVc+G/211UUZuiqEKhNNmFfDnVPlyBKX437x9U9m2CIBDL6irrpPIhrrZQVJ7
	Zo5hM0hCQmdzjKjIz+Ru5ASFKN95ZfQP0nbAwB6GnXeHm0uyrrx+oiuuAz5fDMizq8hd5WkaxF1
	vpcKTwY/bi+EYbe8pUbUG/EWUCRsoH/vgMkT3gvm238MSpZNrRGhS
X-Received: by 2002:ad4:5ecc:0:b0:719:9ea2:6668 with SMTP id 6a1803df08f44-7199ea293camr222119876d6.19.1757017032792;
        Thu, 04 Sep 2025 13:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFg1IxBgYRYFnQ7iNADg67T9sGhou8A8S+BUQKTwHq4BE1x8wrT4GrfsEGqgPZwXCBKxDIy0g==
X-Received: by 2002:ad4:5ecc:0:b0:719:9ea2:6668 with SMTP id 6a1803df08f44-7199ea293camr222119396d6.19.1757017032135;
        Thu, 04 Sep 2025 13:17:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608acfc24fsm1389024e87.104.2025.09.04.13.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:17:11 -0700 (PDT)
Date: Thu, 4 Sep 2025 23:17:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Jayaraman, Venkat" <venkat.jayaraman@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        PSE Type-C Linux <pse.type-c.linux@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL
 command
Message-ID: <d7nbjyz27pcvsic2gsho6ft6pjubmq2x4she5kvcd57i6dirns@bte5b5aap3wb>
References: <20250814163028.18058-1-venkat.jayaraman@intel.com>
 <91cb0acb-73c4-4d3a-9aa8-1056f367d82e@linaro.org>
 <aKbI4DnIDD9fD_Gz@kuha.fi.intel.com>
 <b897d082-0d74-46fc-a0e4-7745347ba597@linaro.org>
 <CH0PR11MB5300AD8DD6BE6CBC799B49DD8000A@CH0PR11MB5300.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5300AD8DD6BE6CBC799B49DD8000A@CH0PR11MB5300.namprd11.prod.outlook.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX2cimDQ21/Fqp
 SNwCy4HBYFVO9YfIoypi4qaZQX4UILqOlxLjVHKubY4YtgM/kg22J2kjODBcqOPPWFAAIamd2cb
 BLI/coy1dqJI5Yecc1QOPjPHMc5XwG6dfwl5XsQBj6HaOLZLzVMU3vCej8FWdPQZh5tUvqEtyKs
 WsB0h5Z9RyvIvJnzu10YRLb/gDfvKr+BoSXe3kKzvzTAZQMSEd7PiZz5mb+ZlOXiztJ4siNJCGB
 m3g5CRRRVfboL1q0309+pVxeOcJ9f7budonm1sGHshlkCOeWeYdVcdQxS2Mm/ALdq2t5qlexnCB
 NWZdpSouEefUdIKCI/2OKtH7UGOJ5JQkreMtK5qlKGV6nMWKpi8SUdLvoLT6XcYlioDsie/L8oq
 KS2BIj8T
X-Proofpoint-GUID: ldGvMB6wChDb9DM8L8vtZg0jE0-kucDy
X-Proofpoint-ORIG-GUID: ldGvMB6wChDb9DM8L8vtZg0jE0-kucDy
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b9f3ca cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=fbkPUmDYxqMCz1gZWXUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On Thu, Sep 04, 2025 at 07:14:59PM +0000, Jayaraman, Venkat wrote:
> Hi Neil, 
> 
> > -----Original Message-----
> > From: Neil Armstrong <neil.armstrong@linaro.org>
> > Sent: Monday, September 1, 2025 12:50 AM
> > To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: Jayaraman, Venkat <venkat.jayaraman@intel.com>; linux-usb@vger.kernel.org; gregkh@linuxfoundation.org; PSE Type-C Linux
> > <pse.type-c.linux@intel.com>; linux-arm-msm <linux-arm-msm@vger.kernel.org>
> > Subject: Re: [PATCH v3] usb: typec: ucsi: Add support for READ_POWER_LEVEL command
> > 
> > Hi,
> > 
> > On 21/08/2025 09:21, Heikki Krogerus wrote:
> > > On Tue, Aug 19, 2025 at 11:47:58AM +0200, Neil Armstrong wrote:
> > >> Hi,
> > >>
> > >> On 14/08/2025 18:30, Venkat Jayaraman wrote:
> > >>> Add support for UCSI READ_POWER_LEVEL command as per
> > >>> UCSI specification v2.1 and above to debugfs.
> > >>>
> > >>> Following power related fields will be exposed as files in debugfs:-
> > >>> peak_current (Peak current),
> > >>> avg_current (Average current) and
> > >>> vbus_voltage (VBUS voltage)
> > >>>
> > >>> These files will be updated either when a READ_POWER_LEVEL
> > >>> command is sent from OS or when a device is connected.
> > >>>
> > >>> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > >>> Signed-off-by: Venkat Jayaraman <venkat.jayaraman@intel.com>
> > >>> ---
> > >>> Changelog v3:
> > >>> - Rebased to kernel 6.17-rc1
> > >>>
> > >>> Changelog v2:
> > >>> - Removed extra space in declaration
> > >>> - Made the call to debugfs_create_file single line for clarity
> > >>>
> > >>>    drivers/usb/typec/ucsi/debugfs.c | 31 +++++++++++++++++++++++++++++++
> > >>>    drivers/usb/typec/ucsi/ucsi.c    | 16 ++++++++++++++++
> > >>>    drivers/usb/typec/ucsi/ucsi.h    | 13 +++++++++++++
> > >>>    3 files changed, 60 insertions(+)
> > >>>
> > >>
> > >> This commit causes the following warning:
> > >> [    8.646179] ------------[ cut here ]------------
> > >> [    8.650986] Access to unsupported field at offset 0x59 (need version 0210)
> > >> [    8.651044] WARNING: drivers/usb/typec/ucsi/ucsi.c:1296 at ucsi_handle_connector_change+0x380/0x414 [typec_ucsi], CPU#0:
> > kworker/0:0/9
> > >> <snip>
> > >> [    8.832491] Hardware name: Qualcomm Technologies, Inc. SM8550 HDK (DT)
> > >> [    8.839228] Workqueue: events ucsi_handle_connector_change [typec_ucsi]
> > >> [    8.846084] pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> > >> [    8.853277] pc : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
> > >> [    8.860031] lr : ucsi_handle_connector_change+0x380/0x414 [typec_ucsi]
> > >> <snip>
> > >> [    8.944023] Call trace:
> > >> [    8.946570]  ucsi_handle_connector_change+0x380/0x414 [typec_ucsi] (P)
> > >> [    8.953328]  process_one_work+0x148/0x28c
> > >> [    8.957502]  worker_thread+0x2c8/0x3d0
> > >> [    8.961401]  kthread+0x12c/0x204
> > >> [    8.964759]  ret_from_fork+0x10/0x20
> > >> [    8.968474] ---[ end trace 0000000000000000 ]---
> > >>
> > >> on:
> > >> 8550-hdk:
> > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253312#L1418
> > >> 8550-qrd:
> > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253306#L1560
> > >> 8650-hdk:
> > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253308#L1494
> > >> 8650-qrd:
> > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253309#L1594
> > >> x1-crd:
> > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253311#L2226
> > >> x1-qcp:
> > >> https://git.codelinaro.org/linaro/qcomlt/ci/staging/cdba-tester/-/jobs/253310#L2160
> > >>
> > >> I guess the version should be checked.
> > >
> > > Venkat, can you be prepare the fix for this?
> > >
> > > thanks,
> > >
> > 
> > Gentle ping, can this be fixed ? Should I send a revert patch ?
> > 
> > Neil
> 
> The Fix patch, for this warning, is ready and approved, can submit once the initial patch is merged.

Can't you submit the fixed patch instead? It would be much better than
merging the known-broken patch.

-- 
With best wishes
Dmitry

