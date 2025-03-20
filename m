Return-Path: <linux-arm-msm+bounces-52094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5550AA6A823
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 15:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1CD97B174A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 14:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864FB22155E;
	Thu, 20 Mar 2025 14:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEWDKUOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC25211C
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742480145; cv=none; b=V+3K4mLKIOCm3KLwRaifWWJtenDQK6hpUC3Q3BM1t+NH8ACiDni0t/rRZ6bzi/V3a/gW9DHtiwF1vFqUItCktF3SxIcpGFRbZjUK4D7TEW/2v9ZK+D6SlX4vNWFxs7n5lFaJia+SWu12XlwKP/fUcQYBUpiTtG5OPuuwqzH+Oas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742480145; c=relaxed/simple;
	bh=5ronVJq9UU0bG8QY1CBNRyXP7cs7CbWkOrSQ2Epye3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cik32gk6tkWcd0ia6AG0xiJ9yYfIhrDcgkgf7lftd89n0zx9euPamTYv4W8kxxTXAp73R+O0vcADHSvxDnSBAeMGDhG9ZCoCn3hkT/OwCDWuCRO7QOdl5onnGJlGyc2pW31oub0ZwL91zlAomR7twg4EHBqMUKqQmt2E8Co/z2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEWDKUOq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KD5g6e014467
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 14:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8aBcQrbNTmhrIz1gphJsGN9i
	CmDPwX8fWpWm652biE8=; b=mEWDKUOqGxp05cdXm3S6yhSf8ONNGMBYxDsDK3sU
	MVdPOQ/6Gqjga9+mP69soGUeqKvkc38Ln2Qm0tYUrQcB3kOG6uVAugysIaGkDBWN
	jg6R3HpHiiYvEGTjuiB2m5dgQ6Vf8Y3jk2QCG8fpWXtMvwVY43gTeaxVfbUkAC5j
	Pj+sqBQBBBQ693Zsi9+rNRCHsVtUoDGTM1+aRjfdSjZrEdNjq2g0m8i/PG0Xanpg
	GLMpcQ/6UbOvp+SrD9feYs0iUXrTkYoDNoEfCrlVonI/zgY9HxZItctrSsM7vbbK
	GSx5xfrn5YhAAj6PUBDrhrwZgxu7ePAzUyA+q9+5LPa8Yg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtsgcf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 14:15:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7bb849aa5fbso257036185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 07:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742480140; x=1743084940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aBcQrbNTmhrIz1gphJsGN9iCmDPwX8fWpWm652biE8=;
        b=Oj2vWMMuvKyjOlVGkhniXDeZQGHZQTHmgUOqlT08EnwmYxd6PEkyH7i6XDIFLHyAGe
         RSnafTxAWKeZnbgLKbGnbR6sCRwa4fEFV0CJRNshAqrdp6ElyE9xg97YKpBm/Qu4CqbS
         Mz1rubw4BKZzlENwPdHvVA69UOUOu2iRVxMWm4ea37a+EsyC5VkDle9r5+RrtFw9AF1N
         2RMC9zaDSovLkmgANmZoT7s6oac+ugPk0nKfM1CYtrNb5h2YMI+CK3oM4M/FSxyaJGGA
         F6MjbPk1pawPrwlXWSNJq6eSgfpn4FwVZgce/jE98J2ZRP7mjZ+z/BkwoKIvGKX57xql
         DSuw==
X-Forwarded-Encrypted: i=1; AJvYcCUB5EeDEFbUO87vdg1LDULur2ItTLgANRJK7gOEBlKTreT6ibDb/L7q9PKEu96Uo08RNm1NaUn5ITg/3sx3@vger.kernel.org
X-Gm-Message-State: AOJu0YyYbNY+ijzU1jSwfBiZIeU9eZNMUt/QeNhesGe9eH1NIVovM+2c
	mSQA1+NZCOgDN3sM3qjIU1QuYEWxYb3Qz1cGBhzwGHtP+6wKgnxPz0RJyOw6GRAUG9UFbzvJuPd
	dclbDhrso3iXuS6z/AZnRWvV79Mr2QiWVgfx3mCH2ntJESAs6ouXwSL3wbVoD5Hod
X-Gm-Gg: ASbGncuUQnH/DqgTEluPJRn4pyqeYA5HQ8egyaDOA7s9LmZTxf4cLSPMz25k/qDU5RS
	sftW0EG27S67dluJq8gfGgqaCzMd2yiOf2bpoKUPdTNFi4xNLivVff21H3mIelSvHvdOEiCi1dx
	IRv6wZWBEVSuFSUjxBnpvNfAKD+csUkf8De0ClNh460QkmATsJOzV6+qVrwXlspQL27Iu9RkLGH
	2Tx1c9dsrybKPWGLG+11zzh012DUzE9QfgJvvUhyX4s1jNGC8aai5T3bzD50zKwti267VdPDASS
	1dbb/TvtkEpkzXzYou3GuS7fKTZY1/HDcWjft5Opl/ONB4m5DW3IGNwCxOq7WV5Z5tHWvZGKbx+
	LexQ=
X-Received: by 2002:a05:620a:1707:b0:7c5:4eee:5405 with SMTP id af79cd13be357-7c5b0d07bc3mr500717085a.35.1742480140596;
        Thu, 20 Mar 2025 07:15:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF48Z8OdEGRPlkLUazNGK2qg1AZCI2lznykkVH1S8wwNrf4UsdJLlA4Yst7O0bQCuVa+zPlpA==
X-Received: by 2002:a05:620a:1707:b0:7c5:4eee:5405 with SMTP id af79cd13be357-7c5b0d07bc3mr500709485a.35.1742480139998;
        Thu, 20 Mar 2025 07:15:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7c07b0sm2209494e87.79.2025.03.20.07.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:15:39 -0700 (PDT)
Date: Thu, 20 Mar 2025 16:15:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <2k6573yrw3dyn3rpwqz4asdpx3nlmj4ornm7kmxv3f4jlc6hzg@qkwn7gqduwri>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-5-quic_ekangupt@quicinc.com>
 <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
 <49295da9-82d4-45a0-a2a4-fdaa6600c70d@quicinc.com>
 <an4cvztdkqmrt7w2iaziihlxf4tbox65ze362v2lmycjnqg26y@jizjmh2ki34z>
 <939fcff6-fb93-487b-995b-88e3ff020784@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <939fcff6-fb93-487b-995b-88e3ff020784@oss.qualcomm.com>
X-Proofpoint-GUID: wvG1Le-eq8-HXLli9C5-fD8nIDQvCH0q
X-Proofpoint-ORIG-GUID: wvG1Le-eq8-HXLli9C5-fD8nIDQvCH0q
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67dc230d cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=I9Tj63J92sXnRp7HOM8A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200088

On Thu, Mar 20, 2025 at 07:19:31PM +0530, Ekansh Gupta wrote:
> 
> 
> On 1/29/2025 4:10 PM, Dmitry Baryshkov wrote:
> > On Wed, Jan 29, 2025 at 11:12:16AM +0530, Ekansh Gupta wrote:
> >>
> >>
> >> On 1/29/2025 4:59 AM, Dmitry Baryshkov wrote:
> >>> On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
> >>>> For any remote call to DSP, after sending an invocation message,
> >>>> fastRPC driver waits for glink response and during this time the
> >>>> CPU can go into low power modes. Adding a polling mode support
> >>>> with which fastRPC driver will poll continuously on a memory
> >>>> after sending a message to remote subsystem which will eliminate
> >>>> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
> >>>> With this change, DSP always sends a glink response which will
> >>>> get ignored if polling mode didn't time out.
> >>> Is there a chance to implement actual async I/O protocol with the help
> >>> of the poll() call instead of hiding the polling / wait inside the
> >>> invoke2?
> >> This design is based on the implementation on DSP firmware as of today:
> >> Call flow: https://github.com/quic-ekangupt/fastrpc/blob/invokev2/Docs/invoke_v2.md#5-polling-mode
> >>
> >> Can you please give some reference to the async I/O protocol that you've
> >> suggested? I can check if it can be implemented here.
> > As with the typical poll() call implementation:
> > - write some data using ioctl
> > - call poll() / select() to wait for the data to be processed
> > - read data using another ioctl
> >
> > Getting back to your patch. from you commit message it is not clear,
> > which SoCs support this feature. Reminding you that we are supporting
> > all kinds of platforms, including the ones that are EoLed by Qualcomm.
> >
> > Next, you wrote that in-driver polling eliminates CPU wakeup and
> > scheduling. However this should also increase power consumption. Is
> > there any measurable difference in the latencies, granted that you
> > already use ioctl() syscall, as such there will be two context switches.
> > What is the actual impact?
> 
> Hi Dmitry,
> 
> Thank you for your feedback.
> 
> I'm currently reworking this change and adding testing details. Regarding the SoC
> support, I'll add all the necessary information.

Please make sure that both the kernel and the userspace can handle the
'non-supported' case properly.

> For now, with in-driver
> polling, we are seeing significant performance improvements for calls
> with different sized buffers. On polling supporting platform, I've observed an
> ~80us improvement in latency. You can find more details in the test
> results here: 
> https://github.com/quic/fastrpc/pull/134/files#diff-7dbc6537cd3ade7fea5766229cf585db585704e02730efd72e7afc9b148e28ed

Does the improvement come from the CPU not goint to idle or from the
glink response processing?

> Regarding your concerns about power consumption, while in-driver polling
> eliminates CPU wakeup and scheduling, it does increase power consumption.
> However, the performance gains seem to outweigh this increase.
> 
> Do you think the poll implementation that you suggested above could provide similar
> improvements?

No, I agree here. I was more concentrated on userspace polling rather
than hw polling.

-- 
With best wishes
Dmitry

