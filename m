Return-Path: <linux-arm-msm+bounces-63280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7F0AF0265
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 20:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3025916AFF4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 18:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786FC1B95B;
	Tue,  1 Jul 2025 18:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KD1Q1LAc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7B01DACA7
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392883; cv=none; b=tTVelWpgX8jqJsYYSnWWTG0RxzLG6Dv84PWCSuI9CZ697g723w+qWIYOFMDvmNnVCR72tQvnZLPW2bazHFZhKxb1rC227FZjxuHTQEFR4n0K52yOnL3ySjEFVcW/oeimtz7mu8wvGv9o6c/zbpoIQb+qPhOoXaeeDASoW68Zf24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392883; c=relaxed/simple;
	bh=oiHyN88BxV5LLHRvPQjfOYp/9uy6yp6oHBhu53Za8sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=SlaUntpVCOi9ZecCrIr1W1hpwRbiHtsxtDRTp3DQjaBppyoAQRtKPPIBi/C7VfH1P1UuFXX8TQ+48+GvhV1b8oiYGMSuqnT0T2eRY2Xmru7hPFqdE8jYWd83VN01+3NBjD1tFuiW0Yx9kHmv/BhO/i2qtUFKHaA5jiMLxnFxGZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KD1Q1LAc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561HeTqC032118
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 18:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=E08Ymkj00isvwn8MFFMgxGIKeBNJqDWH0W0N9Cm+9UA=; b=KD
	1Q1LAc0XLplbVj1vNa4FXTpyujgdndAXSVEbt6da9gUp9KWaXfonB1GqhIRGT+GZ
	eU7r9KrxKr24PeRtPAkh9trvz0KRVNC/iikLDqbJXj2FATGXHI57PG/ZzWaQllmQ
	RupCf6ZKq0oOA/tkE8Ly3iipIMXBrd5UCLUODgcV+SG5QTPYCAwxVrZgb16HMfi7
	Zrs5ZCfFZ+GMXCocetTLCZ+MKt/ApCL0lrh9/d21UKV9tUhauaXptYuaqpxEL2TJ
	DpCXbfzqgdfgq3sN64utbsv07MkS6tD++dRD4hJCwVy3zymv4BnBIXr0gjLqiufR
	PFOPaYbSmQcei7xelXLg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k9y95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 18:01:20 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40b59532098so978697b6e.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 11:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751392879; x=1751997679;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E08Ymkj00isvwn8MFFMgxGIKeBNJqDWH0W0N9Cm+9UA=;
        b=thXifNfJEFzSvz/bcOyYDqXCXp3RRHw1FmFJvP8dMpLzGPMedX7G3gKIXdJUbnqu0i
         4OM2fijf97QdA/XF7OP54DWJTHkRrXW/35TURufHzb914M3hqF4F1N16Owp+q4FIKi+0
         dh7Rqs4tVNqF/nIs2wzPspQ/E0LKOPbRBv0icxB9Jd8Tz8HFqUMJCmnWsnjQuQlLTRU2
         v9kjgx3gvFxQClltDs4uq/cciAou4XnXsfzvw3E4pDoBs8VnJVHu0Ke2h1Otuw7ed7gs
         k+pqK+yRL46y18LpYplsb/T8m3b6XUm+ipEUUROMAr2z1mK0gTc286UFNbBCWfNf0E20
         D8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwCsQkw3CL2yydQghpXNR7uHVsp26DArbEnyFnfWzyCcPMlcp4QWbZuS8ffbhfpaWX/tbt2P78U26NHi9B@vger.kernel.org
X-Gm-Message-State: AOJu0YxTPjwMkUSO3r8Yt3fBNWm8/3sIs2K1cqfejhh7j8cv7jzHP3mI
	4bE14gV8qdA35wbjbnv2ltUUS/QrQTlDHqtzw5xEV4zaTTl7nzGoyfV+LuUzEUoabpA261hZ2bC
	+QsdrGe4l4dkSm599MeJ9pvz7McoIEZqHaci2cIk6iCUK15xwkVYyuTaMuvcw6+KfLl4xrwPo1h
	bxqasdydyQ4ERSGYp1ot6152gZ7gY+0r4CclNBuMoDyYA3WG/WjbY=
X-Gm-Gg: ASbGnctei8rG7Ae6hqQHRNl5ty44RZbXP0xybJNqatkx2iLf0K5vmCanW8lCfuXbcvo
	358KVV6hWlulmVpN+gOBJ3+i830YsQykNOsFYvA1vmTbhYEUv15Wd/8MMIPTRDgzsBjCo7qWwPU
	cwL5JgB4clK55xAdGAW/trP+jH/M6wASLW+gs=
X-Received: by 2002:a05:6808:1208:b0:408:e6e0:910a with SMTP id 5614622812f47-40b33e1abd7mr14971060b6e.22.1751392879073;
        Tue, 01 Jul 2025 11:01:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjqhhJ9WPCGNh5gW+/pqNz4sabEQdLdPjloNPnyLQIyPDtO+reo3m3if0HiBql19pnlFP8rHqGr31iAL5Le2I=
X-Received: by 2002:a05:6808:1208:b0:408:e6e0:910a with SMTP id
 5614622812f47-40b33e1abd7mr14970999b6e.22.1751392878425; Tue, 01 Jul 2025
 11:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-8-robin.clark@oss.qualcomm.com> <20250701162114.5gkdr7f5cww23ou4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250701162114.5gkdr7f5cww23ou4@kamilkon-DESK.igk.intel.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 11:01:06 -0700
X-Gm-Features: Ac12FXyEkWfkw9gSLZbeNFdYURWOCDuIIzied9_JpHK7kcGSUVi9eXBW_4H2Y1U
Message-ID: <CACSVV02jA9dFUFuaKAmoOn_wav0V-QrTj4vo6Krr2V4n7MRDKQ@mail.gmail.com>
Subject: Re: [PATCH igt 7/9] msm/mapping: Handle larger gmem file size
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <rob.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68642270 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=_LjFwpKmhB6XmTo0UT0A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEyNCBTYWx0ZWRfXwel7ryE1mPzS
 2zkAKPDLqIDE3E5GS4ZbFxXQz3KjBB6AqRuq9wRmdHAmExXzSB5csfqH1JIQcgPymKGTPHhz3UY
 EyqC5+ASxmej13OuqrAOEfVI8qiP2H9RozSyvnGgLd/GiC4D5kp4FrlciIo9V0xreNf/IZS7ZxY
 miqXWMWxe+lt9odku8ibh3Gqkz8QhN/TKG8Cu4Y2a9WFQ+pEobaVpF7+kCmfdqbhgrCtyGYUH4h
 CBzE7zUD9AVeWXpjMO+UM6Ksz59BWeKa8aoiSDaHC5DxsVlZTu+i5v5UFr7//240CV6EzfEBkr8
 BLP+iS7Lnsb4ockmfHu237ZJX2MrHXL10Hpf0p63PbSOhSiLIEYOHJlGuf+c8+pCyvTlORCURgX
 VkaJMb4d1SZAnaFDWvIdYt5BVZ5n54uWbbgsW/1RnUHGT1DGzAETklbncQzmOKZeag97wC/j
X-Proofpoint-ORIG-GUID: 50_1Nmci4LDq0tD9bePsNYMOLGWmfEmN
X-Proofpoint-GUID: 50_1Nmci4LDq0tD9bePsNYMOLGWmfEmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010124

On Tue, Jul 1, 2025 at 9:21=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2025-06-30 at 11:09:01 -0700, Rob Clark wrote:
> > From: Rob Clark <rob.clark@oss.qualcomm.com>
> >
> > If running on a system with full desktop environment, the file will be
> > much larger than 0x4000 bytes.
> >
> > Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > ---
> >  tests/msm/msm_mapping.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > index 03a9e814c931..978ea18375dd 100644
> > --- a/tests/msm/msm_mapping.c
> > +++ b/tests/msm/msm_mapping.c
> > @@ -122,7 +122,7 @@ endswith(const char *str, const char *end)
> >  static uint64_t
> >  get_bo_addr(int drm_fd, const char *name)
> >  {
> > -     char buf[0x4000];
> > +     char buf[0x80000];
>
> If it is that big why not malloc() it?

in kernel, for sure.  But userspace stack size is multiple MB at least

BR,
-R

> Regards,
> Kamil
>
> >       char *p =3D buf;
> >
> >       igt_debugfs_read(drm_fd, "gem", buf);
> > --
> > 2.50.0
> >

