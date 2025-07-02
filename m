Return-Path: <linux-arm-msm+bounces-63446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 904B2AF61B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 20:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 675D41C28807
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 18:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B971DDC07;
	Wed,  2 Jul 2025 18:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkFrX/Gg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DC11EF38E
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 18:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481677; cv=none; b=JX/Fg7Yz56L+T0qlYfE4oNBYFRwP3z7F2h5sBpymxgCyfsFKnFSa4y5QnxXQwH+TFbHJE/9ZUe1EyvN2MK52A6uweIch8vxtrK6xRK8GlHJM/iTDUdMqqamU8b7DnrxysgyGm0/gLTM2UuMx2DlS/BKf4t8UrZMt22TaFdidGtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481677; c=relaxed/simple;
	bh=hOXvaofeeADOueSvdm6YgZPZxA5fySzyqPTJT9iLYeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=gdVS8OvzApFqDbCBOIRRLS6A5UQmzDt3M5FwM4S/xe5F2Kug+M4nA8p0RxiYi3BWLZz3XT8gVs5rVL19EuMS/omOnn0/EiJDD9K15ghCLrwB3QsKLSpeWg1vG+h+KC/fjz8XT8KRyODCSCZGUsuI+bfFOt+IM5TyEMqc1yE5aZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkFrX/Gg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562CRvqw018560
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 18:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=HDOAgqdvnMBZZpEZh4yzmK9zvBDjP1rjpUfSRdH7hCw=; b=Sk
	FrX/Gg0dwHJqHyDbE0E8ULyCsd4b0lUiEir7Ft8TO576Lwo8oVuuz7L+oSU0S2gk
	HnXVUtXx5JVxH39dyeIwiP5RtUC1xytT25ZmLxc7g2WKWe3GPmiJqW+hiM2e1vwp
	tDYejg6CX7AuZUas9xl2N4dK3yh2VnOKMahqHTyEj5FiHHEgR9dUyM0jnIosyfXZ
	IYtl+1ObKMRrtbCUOc800NxOrjEE8GOB5nKJjAei4rJFR9umV2DklEgnpqNHM73b
	Q2XFkBfGVtdMcLbmSwLzPhPJblA2JdC8niGs5EYPO7PFehkj/sUGY2SvcVMUhhDp
	BDy52f6Y7RZc61uLD6uQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxnrn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 18:41:13 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-40b4c0b616fso163734b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 11:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481673; x=1752086473;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDOAgqdvnMBZZpEZh4yzmK9zvBDjP1rjpUfSRdH7hCw=;
        b=m7VHGol8cmjkBnPYrLBZABAPlsPM26IGaQalYwq1oVG/xUsIbNl9MEVqdY6m9NuJn9
         pqZSKJ9hKYfZdTiM3FVx4uSmYwiq7QVaxzMyKB49hoDYv71/CxbpkT1cjyYnf+h4smo0
         mqDfz47TB0QOI0dk0G886fkfF/ZLjhy40TFqeIMvq9V6cN0CvetSaDkQxl2SlgocPzVI
         IvzIwfyGowEAgHNNADzJ8tGYRI9Hb/8ZrrACDpSdY7g4bZ0eTwXB8qfRtP7UgzG+jzCt
         jRbPuf4l4rnvSn4a9UrF8B1LwtqDMuMZSbgav/uBQm8RJ+iy72RE9/uMeTIQOydMuaBK
         AzsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFSFYsWRJgrUCHcdFtoeUBYcV1yRlZbW5ZqFCAYHOjjrAuLewjcXAlYQGVTQcf/PMorj/qB0iGVgKghdcY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzeyv67zfGviLFDjJ+oEkHDEawZzM/g68c9x16SIxCiOtI88Y+w
	9/x42LRdyPX9SKPem2t4ZUf6LLwEuR3VGy2K0uhYwHW0IRSBcjH4AD1FnCH4ilGEt8dgNcEcEdU
	e9mnve0HBG79lJtF96G+0QwIWH5nPYhwQsB1E/Fe7hvj6egVEE0XwYkmritrqCAM4GbR+oSLFxd
	YRaF/he8ynkF/mdrFl0RzJBQ0txY/D9VOSqIAh7zh/LG4NbPFXnkI=
X-Gm-Gg: ASbGnctpxHqrg/3HmBkmhgm0Q5FSq0VsGHc2dwvftdQfF2w69VgMYA4xLXUfdxUJD9D
	gLwvXer/2dWzlot2eUaxWay8TJlbj3ICqx5LkTQc1V/he8jx2q3S7jfN9aQq329tNfoY2d2s6CU
	1qJidzZ/gwMW0ddj8g3f7FU5FMz6Uw9o8UNrc=
X-Received: by 2002:a05:6808:5146:b0:406:6aa1:38d9 with SMTP id 5614622812f47-40bc11913d5mr498574b6e.13.1751481672633;
        Wed, 02 Jul 2025 11:41:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlQmHndI9ppZAkhlooSCHd6/vHTuT4bsJ5tFqoHMFjH4qiFMNEAvbg/35Tivhp6LtwlsmiRU8zgSWS0FXzp18=
X-Received: by 2002:a05:6808:5146:b0:406:6aa1:38d9 with SMTP id
 5614622812f47-40bc11913d5mr498561b6e.13.1751481672246; Wed, 02 Jul 2025
 11:41:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
 <20250630180903.77990-7-robin.clark@oss.qualcomm.com> <20250701162014.u6lhg7g6gcjebofo@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250701162014.u6lhg7g6gcjebofo@kamilkon-DESK.igk.intel.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 2 Jul 2025 11:41:01 -0700
X-Gm-Features: Ac12FXz7ZSTjXlr-9Iv0mwO5N0J8lBKAiAEyyHrIkfpWv5RxykutX8ORDHT9hNI
Message-ID: <CACSVV014fDckkZksEf-T+n54xQoBpSk4Weg-0Wq3ppEiYryARw@mail.gmail.com>
Subject: Re: [PATCH igt 6/9] msm/mapping: Wait for devcore to become available
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        igt-dev@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <rob.clark@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NCBTYWx0ZWRfX6GLidzOwyKNU
 ihrhIvOTas8Al9c1OIHWDTPf3ssmE7iJAH8a6U09D9/PHP7gzzB+CFA5cLlde6cRUftOLLZtHUg
 REhH0dER3JcBkCtGvtHzhWResbA/jAOlkXE8aGLcNF2C+fKTNeo1gHYBGYU4XP53h3hi3MOJuG2
 bsSJsIMOGCppxk1fBMWDAN9eCOo3GLkQA6zzOc4kR4llV0lvUbY6ia0F7+qWy37dflbkrWZ4UFW
 O7rhNOFuTjmxavQeLQI/Zjo/cQabCuX6bd36y/WhY6h+Vl/bH+6zW4UdZWeoR5cho3H9h3ZE3SV
 4Eq+jLbzKA+02IExCQ6VB0mDjLVx/HpOLdPUYbLkHycTPFSN0BuIG+Iq7HHlXt6cMBrYedgzolI
 wYP1WqpIu7kwkN5DTsCubdlbbBMg1VihoL0n2oAku12Pd28pTGYxrPrfKMNRZEEeKzE+Z4sG
X-Proofpoint-GUID: xYuTxKRTRsCL-wq_v0Fr8hMVmL4AMjbs
X-Proofpoint-ORIG-GUID: xYuTxKRTRsCL-wq_v0Fr8hMVmL4AMjbs
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68657d49 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=6aLHVZsPNDPI464lO-QA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020154

On Tue, Jul 1, 2025 at 9:20=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Rob,
> On 2025-06-30 at 11:09:00 -0700, Rob Clark wrote:
> > From: Rob Clark <rob.clark@oss.qualcomm.com>
>
> Is this the same as 1/9 patch?

No, but similar.  Both tests have a similar, but subtly different,
function to read the devcore.  (In the mapping test, we don't have to
read the whole file, but we want to return the first part so the test
can parse it.. in the recovery test we don't need to parse it, but
want to explicitly read the entire devcore.)

BR,
-R

>
> One more nit just spotted, it is useally 'i-g-t' after PATCH:
>
> [PATCH i-g-t 6/9] tests/msm/msm_mapping: Wait for devcore to become avail=
able
>
> Regards,
> Kamil
>
> >
> > The devcore could take some time to show up, so add a igt_wait() with
> > timeout so we don't fail the test if the devcore is not immediately
> > available.
> >
> > This addresses a source of flakeyness.
> >
> > Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > ---
> >  tests/msm/msm_mapping.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> > index 846385bb5206..03a9e814c931 100644
> > --- a/tests/msm/msm_mapping.c
> > +++ b/tests/msm/msm_mapping.c
> > @@ -42,14 +42,18 @@
> >   */
> >
> >  static char *
> > -get_and_clear_devcore(void)
> > +get_and_clear_devcore(int timeout_ms)
> >  {
> >       glob_t glob_buf =3D {0};
> >       char *buf =3D NULL;
> > -     int ret, fd;
> > +     int fd;
> >
> > -     ret =3D glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, N=
ULL, &glob_buf);
> > -     if ((ret =3D=3D GLOB_NOMATCH) || !glob_buf.gl_pathc)
> > +     /* The devcore shows up asynchronously, so it might not be
> > +      * immediately available:
> > +      */
> > +     if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
> > +                        GLOB_NOSORT, NULL, &glob_buf) !=3D GLOB_NOMATC=
H,
> > +                   timeout_ms, 100))
> >               return NULL;
> >
> >       fd =3D open(glob_buf.gl_pathv[0], O_RDWR);
> > @@ -175,7 +179,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *=
buffername, bool write)
> >       int fence_fd, ret;
> >
> >       /* Clear any existing devcore's: */
> > -     while ((devcore =3D get_and_clear_devcore())) {
> > +     while ((devcore =3D get_and_clear_devcore(0))) {
> >               free(devcore);
> >       }
> >
> > @@ -208,7 +212,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *=
buffername, bool write)
> >       /* And now we should have gotten a devcore from the iova fault
> >        * triggered by the read or write:
> >        */
> > -     devcore =3D get_and_clear_devcore();
> > +     devcore =3D get_and_clear_devcore(1000);
> >       igt_fail_on(!devcore);
> >
> >       /* Make sure the devcore is from iova fault: */
> > --
> > 2.50.0
> >

