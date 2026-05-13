Return-Path: <linux-arm-msm+bounces-107480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CO6RIlnkBGoNQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:51:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FC853AB0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 22:51:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD8BB303F711
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 20:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85C638AC7B;
	Wed, 13 May 2026 20:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtQ5O5aK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gOPAORbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4B1386C15
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778705479; cv=none; b=Ncw3OvsuBQ87w4vg9muNwqYViuMWSMA21A7MtBrTNCfbxJBZGZgOVNNmmQMowZ3/Jpkmbq+St9wfEzJsMQ/PqbpqcIP668ff9Lq3p5NF3dPOOZz8jgQrtuGfdvrQyPnzAyFbHRWMtQjIabY87faXB5Oc3q/n18sTwavn8y+cf4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778705479; c=relaxed/simple;
	bh=qgUL5l6LG1LjiT4uTB/UJEu7KgRc4b/z/fRgvu4/+Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiC0RnVit3SMY39wpf9qzuKcdQa97NACGem36utElYyZtJV3oOKzVXClhWHX/aLKlS83Nq9FzwhYvpnv+teWMTidKW8L0LtcWBF4UPsDrnp2olOsrFaVfiYl4YUMpJbyItyFaZhksDwGpYsOawN7olZnfnQ7aHu9Lz+0m8CpbTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtQ5O5aK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gOPAORbK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DGAucw2524334
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=thyzqnlnbdIEabdNYQu9CwdI
	JIdicm8i3KSQI23YSBw=; b=XtQ5O5aKZ3S41t6CSF5mHkv9inoSALu8xZrWxlji
	MU2TsBhV3z9aMs7+Nby+0QuVvqoCRxHoDfeLotCX6qRbN/YujjkH6auSA61ljWpQ
	+qnxhXV0QLBWI7+xtC0roKNESgVrJVuouNM3d02w5yaJHzlu1ZwujPc5z7/mdA1g
	5//opoDs5yL5L3/2J6vDBmVA5Sr2tnkcQKZ3ESouF+DG9iL62hz3GYjIPznN+aoB
	WnzieKvJ3vaUDAvjZkGxkP85T+lINeB6C3WfxnYteQkuv+hnByZT17LRmJc8UTvF
	DvPFpf/4b7ycUviBGu7Kwt0VW7U7dk73/NSRztOWsPM7kQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjh4t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:51:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51009190feeso145658071cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 13:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778705476; x=1779310276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=thyzqnlnbdIEabdNYQu9CwdIJIdicm8i3KSQI23YSBw=;
        b=gOPAORbKox66JlGfKH84W0C6CAlhXUpvWbREyJFiEHPti2VJtw4EWfG0cAwFMaKDwG
         L0S/9/AcDqFts9fx9zY+TDbjNXu3Q/F3Vtw/NuQh2oByHFYMy79jqHHH69/YSE9wVUEj
         D5DiZQ7WYu6+qNvBmLX8mxTfsbKFLCz6cEcTE5QMYJEHoSHwhL8oDXj0Y2lyXc61ZTyz
         94KUwqx66bjWqABP3KnqdPhXjfjEyzPqiG0j3puzmzx6fhIABxbNCel0iWcnFSOg1qgA
         7ZyRmnzr+m0Czhu7EvBHRO+j103VF8S1xdllS+3UqQ67eKKVvkP2fm4AIHGLIUVSFoxl
         CCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778705476; x=1779310276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thyzqnlnbdIEabdNYQu9CwdIJIdicm8i3KSQI23YSBw=;
        b=MTtXa9dozBdcmUtUS+gRoao94gHTV/7ddR+ZbxENWNJsmWS8xMPTsFxd5iTgX+7q6L
         AvMgjJpuJMgk6hnM1MjYJnL3VzJ0UZfD6KHlQHh06CWTvK3qApZY0Tj4cgruJq7Wvf0b
         xdzEncsbt2bODbige+sUXmd5icOQIolMXvtX2dL7mO5m5uxU+uMp2DIXZJm5HRbXGkZM
         LIt0+wAKE8CMhwRNNqXawrtIL1b2WPw8Sw2xjfAHJuqeWKQ18R4fLSRQ5hQJuW1L6eyF
         inJQcEGuo3j/RItojNT9TqtEavhhfSsbb/b60N1XUEGemNNqLUJrkiiYr/W3wkwmwKXs
         RQfA==
X-Forwarded-Encrypted: i=1; AFNElJ+56nkwx4K1BI1tsWvIOkd/Lw3oM++9XPbzxSuYcGOCZzNfNlHSP+MsYQbKvVMadIPXvSzodhiJhEU3qPy3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlyy7RTT4iztKpFfe6V2ZPMvqB5ctgqsAUf9wky+07zvyTTyhx
	q6/x7HrOV9Zs/6fspkq5QcdSl8ReL1vowH/UilV9ar0hGNEmzroo+Mc+lFkEQfi9O7jrqBfD+vj
	rfFWs7ZtRQGyx+P2gGlbhE/RhTQIOL5/TSwlNhYNHlJyHgvbp0mJsZl9Qbd6bzCWJRPm9
X-Gm-Gg: Acq92OHf58Mh0oeQQErocEJdGwN4L1al2BgoublfVIeeATWLHd6qd1yCmO7ZEnD6M3m
	CAofqTN8mXaLjF0jOYNfjhOFoym6UbpZ3F/9ZvE6o130gC3J3EVXXnr9ytizIEdvCLkDfGa5V/y
	fFiG59lsaFE3dO2MwXRTCt6vYtpNbrnv0pAL7n9h/NsHRAIJg13mQg9pKt22A2p7UT51V8qhswB
	QABdFWr8izZn7lIZdYfWaRkF090vfZE1Epf1JWK4LwrhUkEdcJjRNE0oOXzTQiT5w2QqDfQ7cXH
	EU3B0itGzyo2QOjV2QgkpXDZjRML2yB78NFCntB6DftNKeA9kMwy8tAkhdhrH6MGLegzdxz03nF
	DlT0YOZmR7NBNO+xJZouFkoq8JO1wk98/FGMeotUJ36s0v6TfVqC1hmAfcXSW/510Mve+CTX8b5
	KflhxowYmtzHBn1K3+vjAgVENLiPn0uIMnbX4=
X-Received: by 2002:a05:622a:2c2:b0:50f:be4f:465d with SMTP id d75a77b69052e-5162f5c9a7dmr65137781cf.46.1778705475989;
        Wed, 13 May 2026 13:51:15 -0700 (PDT)
X-Received: by 2002:a05:622a:2c2:b0:50f:be4f:465d with SMTP id d75a77b69052e-5162f5c9a7dmr65137131cf.46.1778705475399;
        Wed, 13 May 2026 13:51:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cb4d24bsm1075671fa.39.2026.05.13.13.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 13:51:14 -0700 (PDT)
Date: Wed, 13 May 2026 23:51:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 11/14] media: iris: Add support to select core for
 dual core platforms
Message-ID: <fbbxepjsdmikduj7yu53jc6djiqkcqojcz7sxywqaov6e6evg6@5ezmetiuoqjw>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-11-7fbb340c5dbd@oss.qualcomm.com>
 <qodaq4xoi6whna4phhrfbdfanfm43y7vmg4qxjuke5m3qgxozn@h2ot2a7w36xh>
 <a9658e1e-70ed-0c30-28d9-28966242a4eb@oss.qualcomm.com>
 <uujvaqpr72vmdl7w6kjh4xggci4pnhfwukatdj2x63hewfhawa@muzebwimx4oi>
 <fa2eb472-92f9-9bf0-be62-93a88785b405@oss.qualcomm.com>
 <urpdhb6svgprfvo3drmpr5pusy4vjqf3hom3vtvf6kket3fqcw@lrad6xcrbzex>
 <b9d69082-2a76-db71-365f-b8867ba692f5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9d69082-2a76-db71-365f-b8867ba692f5@oss.qualcomm.com>
X-Proofpoint-GUID: gJEtrjfIgBtIij7Jg1s_rT7NuWWSw4wl
X-Proofpoint-ORIG-GUID: gJEtrjfIgBtIij7Jg1s_rT7NuWWSw4wl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDIwNiBTYWx0ZWRfX2MD0Kz0qI0DL
 C8WqtYwpBlPmE9l9T6DrcN3ux30FhhXVEl5F+YF27W6/gO1xu/k7fFwlPcEYEqklEG3RKl9+Wwl
 P5KjoFpIuxPvFkbJFJzPuBvZn+x0GcO3uuY2Xj6tNUu0rrxVgJ9tm+Bb7gNVyqsVqWP4Mpf8GDU
 /J9lQYoICYovfRSBojMaixbqAQUYPF4hMoZuriE4wTbWavtJFEnL8rKiHlkTNfogJv/tzkzZB3V
 ed5v2Wop0QszGAUfsM6nyhZAl8eJ3Ff+KQAnqGab1Jeu56srK6x58ZzkmnQlTjw7xmnkRcgFTV8
 hGUm+nAK7n18L0Isf3utf4DYFv/XjgZDDHwK55rwvI4I2bY/1GO+UNT/8JXqIEVUBGApbmazx3F
 5eeCGoRdW4aGnaT76H1l8r///Q8PqCNcOKybsoXkBkVLVltCk/zHXjrDyCb2+Qp9LMwie4LaP0p
 oD8A/hglv7dqaQMwYRA==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a04e444 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=YUjwTH3TWSO4uhTXXAwA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130206
X-Rspamd-Queue-Id: 00FC853AB0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107480-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 12:53:14AM +0530, Vishnu Reddy wrote:
> 
> On 5/14/2026 12:40 AM, Dmitry Baryshkov wrote:
> > On Thu, May 14, 2026 at 12:25:58AM +0530, Vishnu Reddy wrote:
> >> On 5/13/2026 7:21 PM, Dmitry Baryshkov wrote:
> >>> On Mon, May 11, 2026 at 09:42:43PM +0530, Vishnu Reddy wrote:
> >>>> On 5/9/2026 2:30 AM, Dmitry Baryshkov wrote:
> >>>>> On Sat, May 09, 2026 at 12:30:00AM +0530, Vishnu Reddy wrote:
> >>>>>> On platforms with dual vcodec cores, select the hardware core for a
> >>>>>> session based on current load. Assign the session to vcodec0 if its
> >>>>>> MBPF/MBPS capacity allows it, otherwise assign to vcodec1. Communicate
> >>>>>> the selected core to firmware using the new HFI_PROP_CORE_ID property.
> >>>>>>
> >>>>>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  drivers/media/platform/qcom/iris/iris_common.c     | 10 +++
> >>>>>>  drivers/media/platform/qcom/iris/iris_common.h     |  1 +
> >>>>>>  drivers/media/platform/qcom/iris/iris_core.h       |  5 ++
> >>>>>>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
> >>>>>>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 19 ++++++
> >>>>>>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
> >>>>>>  drivers/media/platform/qcom/iris/iris_instance.h   |  2 +
> >>>>>>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
> >>>>>>  drivers/media/platform/qcom/iris/iris_power.c      | 11 ++--
> >>>>>>  drivers/media/platform/qcom/iris/iris_utils.c      | 75 ++++++++++++++++------
> >>>>>>  drivers/media/platform/qcom/iris/iris_vb2.c        |  4 ++
> >>>>>>  drivers/media/platform/qcom/iris/iris_vidc.c       |  6 +-
> >>>>>>  12 files changed, 113 insertions(+), 23 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_common.c b/drivers/media/platform/qcom/iris/iris_common.c
> >>>>>> index 7f1c7fe144f7..3b3fc482e194 100644
> >>>>>> --- a/drivers/media/platform/qcom/iris/iris_common.c
> >>>>>> +++ b/drivers/media/platform/qcom/iris/iris_common.c
> >>>>>> @@ -46,6 +46,16 @@ void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf)
> >>>>>>  	inst->metadata_idx++;
> >>>>>>  }
> >>>>>>  
> >>>>>> +int iris_set_core_id(struct iris_inst *inst)
> >>>>>> +{
> >>>>>> +	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> >>>>>> +
> >>>>>> +	if (!inst->core->iris_platform_data->dual_core)
> >>>>>> +		return 0;
> >>>>>> +
> >>>>>> +	return hfi_ops->session_set_core_id(inst, inst->core_id);
> >>>>>> +}
> >>>>>> +
> >>>>>>  int iris_process_streamon_input(struct iris_inst *inst)
> >>>>>>  {
> >>>>>>  	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> >>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_common.h b/drivers/media/platform/qcom/iris/iris_common.h
> >>>>>> index b2a27b781c9a..34e32c60f768 100644
> >>>>>> --- a/drivers/media/platform/qcom/iris/iris_common.h
> >>>>>> +++ b/drivers/media/platform/qcom/iris/iris_common.h
> >>>>>> @@ -11,6 +11,7 @@ struct iris_buffer;
> >>>>>>  
> >>>>>>  int iris_vb2_buffer_to_driver(struct vb2_buffer *vb2, struct iris_buffer *buf);
> >>>>>>  void iris_set_ts_metadata(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
> >>>>>> +int iris_set_core_id(struct iris_inst *inst);
> >>>>>>  int iris_process_streamon_input(struct iris_inst *inst);
> >>>>>>  int iris_process_streamon_output(struct iris_inst *inst);
> >>>>>>  int iris_session_streamoff(struct iris_inst *inst, u32 plane);
> >>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> >>>>>> index b396c8cf595e..54a8649841e4 100644
> >>>>>> --- a/drivers/media/platform/qcom/iris/iris_core.h
> >>>>>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> >>>>>> @@ -30,6 +30,11 @@ enum domain_type {
> >>>>>>  	DECODER	= BIT(1),
> >>>>>>  };
> >>>>>>  
> >>>>>> +enum iris_vcodec_core_id {
> >>>>>> +	IRIS_VCODEC0 = 1,
> >>>>>> +	IRIS_VCODEC1,
> >>>>>> +};
> >>>>>> +
> >>>>>>  /**
> >>>>>>   * struct iris_core - holds core parameters valid for all instances
> >>>>>>   *
> >>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> >>>>>> index 3edb5ae582b4..fbaf852a6b99 100644
> >>>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> >>>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> >>>>>> @@ -124,6 +124,7 @@ struct iris_hfi_command_ops {
> >>>>>>  	int (*session_drain)(struct iris_inst *inst, u32 plane);
> >>>>>>  	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
> >>>>>>  	int (*session_close)(struct iris_inst *inst);
> >>>>>> +	int (*session_set_core_id)(struct iris_inst *inst, u32 core_id);
> >>>>>>  };
> >>>>>>  
> >>>>>>  struct iris_hfi_response_ops {
> >>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> >>>>>> index 30bfd90d423b..9d9fae587297 100644
> >>>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> >>>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> >>>>>> @@ -1300,6 +1300,24 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
> >>>>>>  					inst_hfi_gen2->packet->size);
> >>>>>>  }
> >>>>>>  
> >>>>>> +static int iris_hfi_gen2_set_core_id(struct iris_inst *inst, u32 core_id)
> >>>>>> +{
> >>>>>> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> >>>>>> +	u32 payload = core_id;
> >>>>>> +
> >>>>>> +	iris_hfi_gen2_packet_session_command(inst,
> >>>>>> +					     HFI_PROP_CORE_ID,
> >>>>>> +					     HFI_HOST_FLAGS_NONE,
> >>>>>> +					     HFI_PORT_NONE,
> >>>>>> +					     inst->session_id,
> >>>>>> +					     HFI_PAYLOAD_U32,
> >>>>>> +					     &payload,
> >>>>>> +					     sizeof(u32));
> >>>>>> +
> >>>>>> +	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
> >>>>>> +					inst_hfi_gen2->packet->size);
> >>>>>> +}
> >>>>>> +
> >>>>>>  static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
> >>>>>>  	.sys_init = iris_hfi_gen2_sys_init,
> >>>>>>  	.sys_image_version = iris_hfi_gen2_sys_image_version,
> >>>>>> @@ -1317,6 +1335,7 @@ static const struct iris_hfi_command_ops iris_hfi_gen2_command_ops = {
> >>>>>>  	.session_drain = iris_hfi_gen2_session_drain,
> >>>>>>  	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
> >>>>>>  	.session_close = iris_hfi_gen2_session_close,
> >>>>>> +	.session_set_core_id = iris_hfi_gen2_set_core_id,
> >>>>>>  };
> >>>>>>  
> >>>>>>  void iris_hfi_gen2_command_ops_init(struct iris_core *core)
> >>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> >>>>>> index cecf771c55dd..600e9dc07669 100644
> >>>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> >>>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> >>>>>> @@ -56,6 +56,7 @@
> >>>>>>  #define HFI_PROP_BUFFER_HOST_MAX_COUNT		0x03000123
> >>>>>>  #define HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT	0x03000124
> >>>>>>  #define HFI_PROP_PIC_ORDER_CNT_TYPE		0x03000128
> >>>>>> +#define HFI_PROP_CORE_ID			0x030001a9
> >>>>>>  
> >>>>>>  enum hfi_rate_control {
> >>>>>>  	HFI_RC_VBR_CFR		= 0x00000000,
> >>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> >>>>>> index 16965150f427..dd341ca5be57 100644
> >>>>>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> >>>>>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> >>>>>> @@ -37,6 +37,7 @@ struct iris_fmt {
> >>>>>>   *
> >>>>>>   * @list: used for attach an instance to the core
> >>>>>>   * @core: pointer to core structure
> >>>>>> + * @core_id: specifies the hardware core on which the session runs
> >>>>>>   * @session_id: id of current video session
> >>>>>>   * @ctx_q_lock: lock to serialize queues related ioctls
> >>>>>>   * @lock: lock to seralise forward and reverse threads
> >>>>>> @@ -79,6 +80,7 @@ struct iris_fmt {
> >>>>>>  struct iris_inst {
> >>>>>>  	struct list_head		list;
> >>>>>>  	struct iris_core		*core;
> >>>>>> +	u32				core_id;
> >>>>>>  	u32				session_id;
> >>>>>>  	struct mutex			ctx_q_lock;/* lock to serialize queues related ioctls */
> >>>>>>  	struct mutex			lock; /* lock to serialize forward and reverse threads */
> >>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>>>> index 8995136ad29e..502d7099085c 100644
> >>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> >>>>>> @@ -258,6 +258,7 @@ struct iris_platform_data {
> >>>>>>  	const struct tz_cp_config *tz_cp_config_data;
> >>>>>>  	u32 tz_cp_config_data_size;
> >>>>>>  	u32 core_arch;
> >>>>>> +	bool dual_core;
> >>>>>>  	u32 hw_response_timeout;
> >>>>>>  	struct ubwc_config_data *ubwc_config;
> >>>>>>  	u32 num_vpp_pipe;
> >>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
> >>>>>> index 91aa21d4070e..b72ce5b596b8 100644
> >>>>>> --- a/drivers/media/platform/qcom/iris/iris_power.c
> >>>>>> +++ b/drivers/media/platform/qcom/iris/iris_power.c
> >>>>>> @@ -77,9 +77,9 @@ static int iris_vote_interconnects(struct iris_inst *inst)
> >>>>>>  
> >>>>>>  static int iris_set_clocks(struct iris_inst *inst)
> >>>>>>  {
> >>>>>> +	u64 vcodec0_freq = 0, vcodec1_freq = 0;
> >>>>>>  	struct iris_core *core = inst->core;
> >>>>>>  	struct iris_inst *instance;
> >>>>>> -	u64 freq = 0;
> >>>>>>  	int ret;
> >>>>>>  
> >>>>>>  	mutex_lock(&core->lock);
> >>>>>> @@ -87,11 +87,14 @@ static int iris_set_clocks(struct iris_inst *inst)
> >>>>>>  		if (!instance->max_input_data_size)
> >>>>>>  			continue;
> >>>>>>  
> >>>>>> -		freq += instance->power.min_freq;
> >>>>>> +		if (instance->core_id == IRIS_VCODEC0)
> >>>>>> +			vcodec0_freq += instance->power.min_freq;
> >>>>>> +		else
> >>>>>> +			vcodec1_freq += instance->power.min_freq;
> >>>>>>  	}
> >>>>>>  
> >>>>>> -	core->power.clk_freq = freq;
> >>>>>> -	ret = iris_opp_set_rate(core->dev, freq);
> >>>>>> +	core->power.clk_freq = max(vcodec0_freq, vcodec1_freq);
> >>>>>> +	ret = iris_opp_set_rate(core->dev, core->power.clk_freq);
> >>>>>>  	mutex_unlock(&core->lock);
> >>>>>>  
> >>>>>>  	return ret;
> >>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
> >>>>>> index cfc5b576ec56..da8a89d3dd41 100644
> >>>>>> --- a/drivers/media/platform/qcom/iris/iris_utils.c
> >>>>>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
> >>>>>> @@ -90,40 +90,79 @@ struct iris_inst *iris_get_instance(struct iris_core *core, u32 session_id)
> >>>>>>  	return NULL;
> >>>>>>  }
> >>>>>>  
> >>>>>> -int iris_check_core_mbpf(struct iris_inst *inst)
> >>>>>> +static u32 iris_get_mbps(struct iris_inst *inst)
> >>>>>>  {
> >>>>>> -	struct iris_core *core = inst->core;
> >>>>>> +	u32 fps = max(inst->frame_rate, inst->operating_rate);
> >>>>>> +
> >>>>>> +	return iris_get_mbpf(inst) * fps;
> >>>>>> +}
> >>>>>> +
> >>>>>> +static int iris_check_and_assign_core(struct iris_inst *inst, bool mbpf)
> >>>>>> +{
> >>>>>> +	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
> >>>>>> +	u32 max_load = mbpf ? platform_data->max_core_mbpf : platform_data->max_core_mbps;
> >>>>>> +	u32 max_session_cnt = platform_data->max_session_count;
> >>>>>> +	u32 core0_session_cnt = 0, core1_session_cnt = 0;
> >>>>>> +	bool dual_core = platform_data->dual_core;
> >>>>> num_cores
> >>>> A num_cores field would require updating all platform data entries. For two
> >>> I was thinking about adding num_cores to platform_data and to iris_inst
> >>> (or iris_core) and setting it to 1 if the value is unset in
> >>> platform_data.
> >>>
> >>> A better option would be to move all these multi-core functions to a
> >>> separate file.
> >> Thanks for your point, Adding num_cores to platform_data makes sense if the
> >> number of cores grows beyond two. For now, since we only handle single and
> >> dual core, the current logic feels simpler and sufficient to cover both cases.
> >> Happy to adopt the num_cores approach in the future if we have any platform
> >> with more than dual core.
> > Again, an alternative approach is to get all the platform specifics into
> > the corresponding iris_vpuXX.c file.
> 
> Are you suggesting moving this function to the corresponding iris_vpuXX.c file
> and hooking it into the platform-specific ops?

Yes, where that makes sense. If it is the only dual-core platform we
should not introduce code into the generic codepaths...

-- 
With best wishes
Dmitry

