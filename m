Return-Path: <linux-arm-msm+bounces-69072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B099B256E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 00:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8ECE63A6799
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 22:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28822FCC17;
	Wed, 13 Aug 2025 22:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qc9mVHMB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A05D2FCC04
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755124940; cv=none; b=HwFlUaUM97uLddvWaBYIWvmugb2PkkIeTAQkijWkuoynuufHTGQaXdVzkqOa4b5nYOjDOjtcCPsVU07DfwhGxO8zYfbAp4dSqvKt5xovm4Ebnt1hc+jf9VVlpWHZQbxZ56b8alglUffAyf1ONDFEx+n/WGMNw9iBk078dLvFBJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755124940; c=relaxed/simple;
	bh=HKtBdZ6TDTNd5owO1H3gyhJGO4bKwPP3mCFmHHenSwA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI22aiMIIxswyHYhC72EcBpOv7YGwRlhbIuN44hnfF917Ds14TWOS6JpbPVLl2dDG/sfiI/7EM7xpJRUkaQQE6z+yztdQHIQQeatezqvGWaWOLVpGbyKqVx8qnXVWS2p8LvzzdFaqe7DrT24Uuo2GmGTDrxgTaIDbgT6IvgLsYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qc9mVHMB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBMGTl027115
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gq43x9DS30JDovCPMRQp1uHs
	Nm+sjZ4fDdkhVAciSrU=; b=Qc9mVHMB7hBtlNpFToyhqJp5+4BfDHbEa7Z3+0Jn
	tKSPmvpzHXXwz2QP6UjBwWE/pn+jiBR5LMIhFQeS/wH2e0sqdU8aQVJgk+mDK21p
	EMWPJY3+hlHmYP5ZTKIiOQQFGTqC0T4H4uS9DLkv+3t82MNQCcJSR6Zz3oU7+hTk
	nIqCKYj/jBCzv4QGfR9rOIeOVbH6LlQASwX0Ufk56T9pfvhG2p8PrBO/yG9cbQ+1
	3L0hfnpeTh2f3VYIcEhIAVbF0m/O9XA1dnJtpfJhS4FPrfV+jyw2LiRRYDP9FsFH
	FX6aed0vQvTLli52CqC8S6cMsOA0RZ9bTCMrdiCdO1QsGw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3gddk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 22:42:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109be41a1so13011891cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 15:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755124936; x=1755729736;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq43x9DS30JDovCPMRQp1uHsNm+sjZ4fDdkhVAciSrU=;
        b=jzEdzqJW5eTSczmaF0pW7J6rnzeCOoRMUvnYS5jAFTslnFzhfWuZ6/RPdc8jF/Z08a
         gYQacs24oyvMxvV6WudeoInkjb7ceRm3DVJfufTy/d07VyNfjw+xVcISfBgSEQd79l5u
         qq9gi+whqiJsDchVtswGT1CzTFVUrBu88X139cHgjeWNnWrDnCRrmyxxSp8+dE9rXxEZ
         nZ63K2iA/qTVCasDwngDWmg354+upnWjxne1gAhNERRyxBOVI0DhihWfjtMQX4FDPnWO
         LtQ1OOaBIL/C8PKwecKByhF463s1woSfOcVXsvw/gDqToqCKIM6T8oOyJNTswaCI+0F0
         lgTw==
X-Forwarded-Encrypted: i=1; AJvYcCX8lfDwWmDdorkCJv9QR7VxbhWc2TdlHjwWin7M16aqwBZd8rGMRBqxeJqWVT/jbsAtPBblncZvpaKf0aa2@vger.kernel.org
X-Gm-Message-State: AOJu0YyAEJfAHKRL0zFwFYifQ5BW2Wr2j7CRbECBIt/r4e+9DBS1PUpI
	/3VbNdTpgDMJrXtMEB68yDUgeVjZoiNaG9IXc0nhkFNtB1WkOCc6d912Pzrjcdd/JVfTPGWop2B
	nlmhm2Zs9qOiAUGbega+197qCaD+ZFZmtvZDI0HcK6gqoyzlU+Ph6WpjLJSkNBQwyoe6A
X-Gm-Gg: ASbGncshKzi0/7Pp+YRwL+g5Yh7InaWywGtpPIAsmVKOWCaA+RJ4/ib6BEg5LzigYW7
	Q1d5caszkhAsepcxyRFRZhODxkidKXNanx91872g19d6uJz5Tmd+PYbiRNCRKbLYJAZ+sKbfkeY
	HuDsTF6RhHhj83ygt+nK19HQyuUz6+dT6Q/GduxcM/haIRtK+KicgZvyLLDHaG61J40HQMI83hR
	ss8HVrPGb2jGNawRLSGRMd10CrAYrk+3w69DuAPtVWV/YXwEskI7Tl5AlBNGD2RTdHw7hY2xjpM
	KbaPxOv0204Gtuu+Ax9IDfucdLQkJI177YN20o/IOrHD2P4puAYGfLg0SP5GmSA/J2TzvA==
X-Received: by 2002:ac8:5c8b:0:b0:4b0:8190:5c13 with SMTP id d75a77b69052e-4b10ab52e65mr15453181cf.40.1755124936199;
        Wed, 13 Aug 2025 15:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2UjsrH/J0iSZScKz7qT8qxg9qYGGtFUn72OoewbCEYNGixkDcA6fwtibk9Ix4IUxf+JCrsQ==
X-Received: by 2002:ac8:5c8b:0:b0:4b0:8190:5c13 with SMTP id d75a77b69052e-4b10ab52e65mr15452841cf.40.1755124935676;
        Wed, 13 Aug 2025 15:42:15 -0700 (PDT)
Received: from trex (205.red-83-60-94.dynamicip.rima-tde.net. [83.60.94.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1a517d49sm17320675e9.11.2025.08.13.15.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 15:42:15 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Thu, 14 Aug 2025 00:42:13 +0200
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, krzk+dt@kernel.org, konradybcio@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/8] media: venus: Add QCM2290 support with AR50_LITE
 core
Message-ID: <aJ0UxeMKrYOGccPa@trex>
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <bd8a88f1-403d-4089-b174-f62ba69e188f@linaro.org>
 <aJ0QJVnafFf/S0EF@trex>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ0QJVnafFf/S0EF@trex>
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689d14c9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Rr2dNH5/fcnoRoBmcVUeRg==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8
 a=xOd6jRPJAAAA:8 a=OKeeDrLR6-MU7LyzxQUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX4owbeTjJiC7s
 C6AKhatqZOYQdjTLYmQkzU+LSNiwpKl1SDCrNFqSruZoZwMYr2DEiavHtdTuxf4S8XDZI/CPppr
 /4qO3rHwud40wTTut8TNVgmF+0oZfbuueyHa+Tohp7y143KsfAL2kjteRFhJa5XxA2MUVzkjtkN
 PKnKx0wfwqC70hQROmAeLMBthkrsLPogGmXcTwHvrc1ecHze4An9YDDYHVcsqUpMMTSCWhhFQPl
 dNraSQGpVBGMIn0nUXQ6UJJSCkUQ6VgHqmBT86usbfT0odcBSXpv0D9rVqTXfGFOluJNKLQ4W3l
 l0egwWTnptPM9urhrw+Q5KPGmVQOfJ4pPOULgExUaZTszVNBCDLC45xsbHAbgnqX1FQaPGk7YZm
 dB2UXqqp
X-Proofpoint-GUID: 2E1VvcHqEPfd_30ESlg0XGF1NXXOZtwU
X-Proofpoint-ORIG-GUID: 2E1VvcHqEPfd_30ESlg0XGF1NXXOZtwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

On 14/08/25 00:22:29, Jorge Ramirez wrote:
> > Trying to apply your series and getting a few or more than one splat anyway,
> > on media-comitters/next
> > 
> > Could you fix this series and test up as a V10 ?
> 
> sure, let me rebase and retest.
> 
> FYI when I posted I applied it on top
> 
> 
>     media: rkvdec: Unstage the driver
>     
>     The TODO list for unstaging being empty, the driver can now be moved to the
>     main media folder.
>     
>     Also add myself as maintainer.
>     
>     Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>     Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>     Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>     Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> 
> 
> > 
> > https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/commits/b4/bod-media-committers-next-platform-qcom-6.17-rc1
> > 
> > ---
> > bod
> > 
> > 

um, are these venus patches in next already merged?

16 hours.. 277966749f46 media: Reset file->private_data to NULL in v4l2_fh_del()     Laurent ..[Hans Verkuil]
16 hours.. 47f4b1acb4d5 media: Set file->private_data in v4l2_fh_add()               Laurent ..[Hans Verkuil]
16 hours.. 32eab5181105 media: qcom: venus: Pass file pointer to venus_close_commo.. Laurent ..[Hans Verkuil]
16 hours.. 8003313d388f media: Replace file->private_data access with file_to_v4l2.. Laurent ..[Hans Verkuil]

should we try to keep a consistent subject format, for example:

media: venus: core: Add qcm2290 DT compatible and resources
media: venus: core: Sort dt_match alphabetically
media: venus: hfi_plat_v4: Add capabilities for the 4XX line

instead of mixing formats like:

media: Reset file->private_data to NULL in v4l2_fh_del()
media: qcom: venus: Pass file pointer to venus_close_common()

This way the commit history stays more coherent when searching for "media: venus:"....anything we can do about it?

will post my update in the morning after testing





