Return-Path: <linux-arm-msm+bounces-61111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62595AD6D91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 12:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DA443B05A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 10:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A76851F92E;
	Thu, 12 Jun 2025 10:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGT0AfTw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5851FBCB0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723862; cv=none; b=lrNfm2cFkyuJA5pYKH1vhcfv/FG5JGIoIBxQQMFe0RhRA+NVxZwfL27QciVBe1Co1fiU7cK0hJ7MiH09MbOK2k37jYqndP1ZPuHM7XZM2DzF07bZSyGFFSK7hOuvo3mx2gLtMoSnaWr/jfeTvHPplt227FUC5IEBXGg3gMXcY/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723862; c=relaxed/simple;
	bh=9xJkKdirzDQxKrJS5lOpHK2yMv73XcI2TfgZc4HXVY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcyNrXdbUOpIwrRrKSn3vyqq699QTv4TLWq73tOrAhuT6nsxYfa/MdokcXuDHC5qmPT42XJwEyPZePjRxeaOt/FSXHiaOhCbuLOL4SKnxXeFtYJKDjZIkHTygnUPi134Q2IhxhX73qMdxuS1ZDDVVXKCTwod36lcyWaOpoT5FAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGT0AfTw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7h7CV011018
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 10:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bei7vpBLRM7JsSliScp8d4kP
	UcOnvEQKa+rJash+xv0=; b=VGT0AfTwwq0qzpGH0lUkHbs59BKcBup8GrV4yaTZ
	FJdnCpiSjCqHpUj1lJ6qjjMl40cJ1iW8sr/ZqK2rN5C5umd3n5O6eoNtfv6UigTd
	jhk0gO+KJ/oLGv8d9RUD+fborANiLfhJUPL5i59Ffc4T7UlmwMKNvO/y7lR71/Jy
	gw3a3wenP5JRvmWjapubw0NKG3UyTV1QH0UF6eDWDz4DQg4KLuYevI9IC2Z/28NU
	sXAfr6VneNdrY5Vbuq9SYlNNM1drLAXfbok1CvbQ/fwqoiJcgzA6O1rag/6fGcZC
	czXGH9B4IvBeQzuXusAuk5R/ylIJ7v/9Hb8VVI3sZlMlZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpyu5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 10:24:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d21fc72219so65565085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 03:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749723858; x=1750328658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bei7vpBLRM7JsSliScp8d4kPUcOnvEQKa+rJash+xv0=;
        b=a/v9so/qtgiICV45hjAQuEJif+zKsMy7GF8YO+ZVDzb+hc5OxId1FaEwPQzksicaWa
         0cur4pZa0/UVHtKbI1azyZsueh2EacqxGqm4g3T893JOy3xd7mKRBbBjB2VF44eCT4iv
         R5pwPk5+83lqdx6R30fHbR1G2XyxyM5KX3XEynjkxkEdiNhzvxvNmKoZ32RlaagAYAEb
         kf3fT4K0JPJcvb32qZnBLoiwJuXx0Raj02eVoqMCJWQaT2H1mIGb2zmgretBXj354JEW
         oe07hjAhOSWsYNyPA5xVzUmsX5BMC5fCewJcfUPXWZy0OTd4173ZA33oHn1zb0vVYTLR
         +2ww==
X-Forwarded-Encrypted: i=1; AJvYcCUonSHcmUWN6fFngrgmCC2V3lURII1WTrwoGANvEMRXf/KS2ffgrNZ7BvhL1tgL1sQStxSmsamPYoj7dVGz@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUuWM/XJit2d3GSEZNe19aXhxKVMmxhL0/L881UpwGzMfOMiA
	kq30sMPtDhLBrDgk/odCijkw6fKgl9okcIAPxRpY6dUdfNJxkohE/TLtRLAoLnW2Vsi5llF+hiW
	4OCTwzB1qjgO5UWSsT/JIrICT1xIoR3uRdbOMqFrVDXESaJ9DH6QvJxmSXB+5G+564m6x
X-Gm-Gg: ASbGncvaIxwzGM66PZ6fnNi6jNKPR1BWEfYEEBbAHLYmXtLmh1ie+CDD+ELml/+FBmN
	uAyabbLi7jD/SlbE2IStPgmsrVPvwQ3mEbR4RtHpHWPAgq2uTT11hDEvA15h1N5pVk5PmXtHrgf
	r7i63X7oIn4W/8QahAdCeawOeKBTY/wjc1htJtWpB94ZfQYZraarTvBpkqEDkAS3+xAhZg3dFlY
	zgzUjbq8IbsDAdP+8JoYUELWisiNK5YNm4LsA20ChBBKFVJfNRwcIqtBNG4h1rKPleNi8T93Rlx
	v/L4ErZEDTJk6HABRBZSHFYxjSMfhr6I/iWfFPnQ34G/TZm6vXRpDevDt0LdqlzgO4ck/uJxOk0
	tYY9SCS6LRhkVTjGIjSZqkeK7M4rMCa+D1ro=
X-Received: by 2002:a05:620a:4447:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7d3b35bfea6mr343780785a.12.1749723858487;
        Thu, 12 Jun 2025 03:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiRYepXEg3WA0kVqMAAKmdx5rX+tZSqO2LWnuB7dyJHukSnp7ktrS1ClN/yxXDi9idO0oT2w==
X-Received: by 2002:a05:620a:4447:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7d3b35bfea6mr343777585a.12.1749723858018;
        Thu, 12 Jun 2025 03:24:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab231sm64419e87.132.2025.06.12.03.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 03:24:17 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:24:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <cq3qfx32dallivdcwjwqgq7kggiwucpcyhwqqlbrf6n4efkmuc@htjwnigojag2>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
 <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
 <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684aaad3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=F3-oJ8RDkLYzbOVVXy0A:9
 a=CKI3rSdrBKJ4BORm:21 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA4MCBTYWx0ZWRfX3yFr1j5FNBcP
 4HXqHWGI0R2ysa1jOX4xgMXjnGj01xf8CijFxDkn7YmyM8/oSvJJII/clbJWzi4ViTgZgz35s0r
 eEuQ92qvbysKgvhSRpXfo43Ongke6wVufOm7rMzcn3BRckHmNJlpaZDTO+IfqaopEWygs1mW5Fp
 cdjQcOGUKmJWVNLdhzHcn3HlBDji2A0T6AZ5fpCR2g7yOEvPNjKAtgU2ick66TpK0dWRTOjlBG8
 qLeR1XGOpJ8vxjhNgqMPIWSq74BLXnIhxm4LUmc2l4g2mpPPSsjX0xWw+tyHuMZfElI5p+E06tE
 y02eewyTOhBbpcZq5QEfDiRCWJ8479mp4fXqe5jX0lBHFW05MhskioAZ+dxfUmLu2r2a74QHBZY
 /63VWvkaCZByaMmtZd3FxR7vBdvdW7kUfX+c9XUMVTGlFghWlP3cjzfY2L6TH9QmFLzFUR40
X-Proofpoint-GUID: wKO_v1yChFq4LXFx2odXLf20wuYfoTTc
X-Proofpoint-ORIG-GUID: wKO_v1yChFq4LXFx2odXLf20wuYfoTTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120080

On Thu, Jun 12, 2025 at 03:02:52PM +0530, Ekansh Gupta wrote:
> 
> 
> On 6/12/2025 1:35 PM, Dmitry Baryshkov wrote:
> > On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
> >>> <ekansh.gupta@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> >>>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >>>>>>>> User request for remote heap allocation is supported using ioctl
> >>>>>>>> interface but support for unmap is missing. This could result in
> >>>>>>>> memory leak issues. Add unmap user request support for remote heap.
> >>>>>>> Can this memory be in use by the remote proc?
> >>>>>> Remote heap allocation request is only intended for audioPD. Other PDs
> >>>>>> running on DSP are not intended to use this request.
> >>>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
> >>>>> use? What happens if userspace by mistake tries to unmap memory too
> >>>>> early? Or if it happens intentionally, at some specific time during
> >>>>> work.
> >>>> If the unmap is restricted to audio daemon, then the unmap will only
> >>>> happen if the remoteproc is no longer using this memory.
> >>>>
> >>>> But without this restriction, yes it possible that some userspace process
> >>>> calls unmap which tries to move the ownership back to HLOS which the
> >>>> remoteproc is still using the memory. This might lead to memory access
> >>>> problems.
> >>> This needs to be fixed in the driver. We need to track which memory is
> >>> being used by the remoteproc and unmap it once remoteproc stops using
> >>> it, without additional userspace intervention.
> >> If it's the audio daemon which is requesting for unmap then it basically means that
> >> the remoteproc is no longer using the memory. Audio PD can request for both grow
> >> and shrink operations for it's dedicated heap. The case of grow is already supported
> >> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
> >> memory) is not yet available. This memory is more specific to audio PD rather than
> >> complete remoteproc.
> >>
> >> If we have to control this completely from driver then I see a problem in freeing/unmapping
> >> the memory when the PD is no longer using the memory.
> > What happens if userspace requests to free the memory that is still in
> > use by the PD
> I understand your point, for this I was thinking to limit the unmap functionality to the process
> that is already attached to audio PD on DSP, no other process will be able to map/unmap this
> memory from userspace.

Ugh... and what if the adsprpcd misbehaves?

> >
> > How does PD signal the memory is no longer in use?
> PD makes a reverse fastrpc request[1] to unmap the memory when it is no longer used.

I don't see how this can be made robust. I fear that the only way would
be to unmap the memory only on audio PD restart / shutdown. Such
requests should never leave the kernel.

Moreover, the payload should not be trusted, however you don't validate
the length that you've got from the remote side.

> 
> [1] https://github.com/quic/fastrpc/blob/development/src/apps_mem_imp.c#L231
> >

-- 
With best wishes
Dmitry

