Return-Path: <linux-arm-msm+bounces-71890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09FB4238A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 16:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DDC6543689
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 14:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61ACE30F7EB;
	Wed,  3 Sep 2025 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgkry4e0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41F630DD3A
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756909532; cv=none; b=P0IMRuTr3WbDFeBIF1I5au92R5SMd5LyHH6xaQxKu6GLcQCx3WmPJTuyOyxHJBECDYHIoqqyPAt94BYRaJcsNawHakplCvknV8pud1icyh2OafXHagwA7YykP4Osiwyb13dLpavcqLS7Iw+tIcQva3lF/VJQPVrp1q5cOYbZAQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756909532; c=relaxed/simple;
	bh=pElx06XUsACY4rxJuzKiVl+DZCWPVx0HYpaWpniciPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jTBDsihubL9Tew3t4Dt4N7v+hJYvKnfnvmbch7maBYQ2Nj5NDrx+8Twm+m7Sdb0JK6TdlpKN21q7SI0jw3kPw968iadq40qx5SwOeFwOEWSyAccY0e0s03POUSqHM1kt17eQE2EkUOPuqxCnN3SHwNtRlscUqGIsfdY5ER1RHeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgkry4e0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dx4G8003933
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 14:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KhzMevr4galGDFfSj1H1OAb7NqzeNhj7vL+6EKq5HZ8=; b=hgkry4e0xYCmEwr4
	rbl8z4gZNSO9eFZvbVN6oh3nMaNwr7UFTAURPMX/RmkgvL9L1f3ALmhUEX+Gc/r3
	fdbj/2AjyGzymPgRjOd6qbHsntENIOuSVbyg2sUT/UsZWp+qW2OGSFlXKx+psVjK
	Gpb85JdTGsqwOLNt/wE3jZ56DcN85K4QHjMzkSf8+V28MpUDfgdZu1uSzYzLxeQs
	4gHOEidrf58fxCQN8XeIUQUJ7RRBp9fzalPKGYEzv3/8Gn568gjjOLA7P3t0Z5W1
	J2wh+5+YO210BkePeZSaetj7Esx+lnbvpFSzuNMI4poBHYm5oP+RbQNm4jTZCRau
	PFkwcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8uwv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 14:25:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e8702f4cf9so613285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756909529; x=1757514329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KhzMevr4galGDFfSj1H1OAb7NqzeNhj7vL+6EKq5HZ8=;
        b=gg2AI+bX7Rkk74xS9H43jIwb1OzCj/wnYxn22MB2u8VimyQsRsJ2T0dPoFxN+HKhm2
         FIVmxcBdnNxwK3rJrbxOU2WgFJ1L28AUo2XGPKoq7VTp8sZ0kULPP4u658BhyxHqBunx
         prOPipl3adT2PpgueDXDV7lUqT3aUQmGkl0QrUQ5Jgn7iPH6DCSsFHfCRgjQ2QxrrWb7
         qqmwjI6v2qVRsK3fLvVaOUBm+va28ER7BwE9hWL4Y+DgPJUAHp8HyLvTgq++ga7TF0Dm
         Z6PE4rgZmql9fyA0JEYPxpovU/srJBoYHqBnnHyntjzmSFLVTQUfmCMvQa9G6wP9l6+U
         1nsg==
X-Forwarded-Encrypted: i=1; AJvYcCXlVWviYRbXGkjhR9uBsewQVs3BFkBw7583VmircILv67yjOXL9fw5m5qXbIy6fMGeiHLlar2JHeMAM3Xlb@vger.kernel.org
X-Gm-Message-State: AOJu0YwpuEw3+5OiHiUNcsbGoHl9FZN8v1KHxSvQpkOO5fzeeaRbhU9X
	eKnjYAaSDUhNiOUGtHmLZooQUSHyNcfaYK+x2hj/oRQ8/rjVQOkrzeBkELm/wj859a3eevUYVIT
	b7vxfwJE8Pk1amZBHV4iHtrDquX+ejbY+jJyQlextYGw32rVxaIcYeoMoLCgX7Q2d9Y+D20nIZP
	fMWnYPLqjvq8SxBqsZiS28c0NWQmg7fslCA7ktZE9T3dQ=
X-Gm-Gg: ASbGncsbKq7vn9ZKpPYR+JyxgEmVk5aqCUj1WUkiy/Y8f5b0HKsaCbytJPtoKl5yFPo
	2jzOMCqFxysyGvAp1shImJ0OSflaghqmvt8RVTSlYs1Rj2y9DS3uVGrGKKHXnUXlctOYt+APshG
	EFs89Q3NoC2xBBLxTT07wpaQ==
X-Received: by 2002:a05:620a:4451:b0:7f9:4ae2:a731 with SMTP id af79cd13be357-7ff281d319emr1704094585a.30.1756909528615;
        Wed, 03 Sep 2025 07:25:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMFAV11HIaSUVgZ3ALHRBvVq6pfjeaW5KeNRCsxTPe56c/+2TFlwmQcucn2djwmXuhbKgluFGw/vwIx3gPAXQ=
X-Received: by 2002:a05:620a:4451:b0:7f9:4ae2:a731 with SMTP id
 af79cd13be357-7ff281d319emr1704088685a.30.1756909528007; Wed, 03 Sep 2025
 07:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250903002255.346026-1-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 16:25:16 +0200
X-Gm-Features: Ac12FXwxJyt2Vtrcm9t5pYjL2KIhw142I9Cg3Y9Fx9qnoKymlsnFjzOdDKtzTl8
Message-ID: <CAFEp6-1sA5Bfn-2JGVyO+iy8T++W1-Ke-yuXn15DL5sM=bxJ5A@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] media: qcom: camss: a number of cleanups and fixes
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: yw0E5T8Fd7gnu2hDfAx4krAiK1k60g86
X-Proofpoint-GUID: yw0E5T8Fd7gnu2hDfAx4krAiK1k60g86
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX87XQR5OC87y1
 r+afoFAsSue8z88/A+z4BPsmQFoCj5YkzTuLrZl3vYd3K0eznMYOfcB/dsSkpPvymp6iGPpAOvy
 cHN3QMitr/+guiDae2PheBgaWFpbmYLTB12qaMnfNI8B7hFs9MXszQpTnTrqbJdBHpu1OYgv4eT
 sV4nsD+QNmms7uE9m48xej19J5s9DjfhQvJxymxby/kR+hKSxE1xVSnGrMlxW/Trl0NeRPJBNSz
 qm8d2vEC9l9uhB2bk16IvtYfu/W8bIeoeO/hPpH1I45b3Bc5hnL9NdhXuLXulqO7rb+GG2OyEci
 ctNbMUC31NDXR/w5Wi2Xt/IKq3w9trKvB13gHPDpOPUd1Qw5bCA44v0W8NX7x5gocRKwwQK0X13
 Iz8foDlP
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b84fd9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=282giOLc0aumesrqazgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

On Wed, Sep 3, 2025 at 2:23=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> The patchset noticeably simplifies common registration routines of CAMSS
> ISP device driver.
>
> Link to v1:
> - https://lore.kernel.org/all/20250513142353.2572563-1-vladimir.zapolskiy=
@linaro.org/
>
> Changes from v1 to v2:
> * added a gained Reviewed-by tag to patch 1/4 (Bryan),
> * reworded commit message of patch 2/4 (Bryan),
> * explained better a removal of port node availability check (Bryan, Neil=
),
> * cosmetic and non-function clean-ups of lesser significance,
> * removed already applied changes and rebased the rest on top of v6.17-rc=
2.
>
> There is no any functional changes between v1 and v2 of the series.
>
> Vladimir Zapolskiy (5):
>   media: qcom: camss: remove .link_entities callback
>   media: qcom: camss: unconditionally set async notifier of subdevices
>   media: qcom: camss: remove a check for unavailable CAMSS endpoint
>   media: qcom: camss: change internals of endpoint parsing to fwnode hand=
ling
>   media: qcom: camss: use a handy v4l2_async_nf_add_fwnode_remote() funct=
ion
>
>  drivers/media/platform/qcom/camss/camss.c | 99 +++++++----------------
>  drivers/media/platform/qcom/camss/camss.h |  1 -
>  2 files changed, 29 insertions(+), 71 deletions(-)
>
> --
> 2.49.0
>

I rebased and tested the series on RB1/qcm2290, Looks good.

Tested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

