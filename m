Return-Path: <linux-arm-msm+bounces-79773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EBBC22CEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 01:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73ABA1887991
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 00:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636FE1EBA19;
	Fri, 31 Oct 2025 00:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt8CVoET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpzWEeeX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346981EA7DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761871267; cv=none; b=gwe9MN/QhriluUUD6iOWq5hMj5qd16Uf6XCXStimqqAswZ4o7kZ+pL5+mc8V7guztS+6S30PKVidzLRvW420xcF0F1caSrNVDkYaJcVpNP+fx3NDsxtIF1Gu1XeZhU4WoG/udjNHNzdNeJfsYo0nFHfDCuByCX9PgJ7VBKvTTWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761871267; c=relaxed/simple;
	bh=9OwIj9PFMRwkVbM/tIEg+J1UpDfMhn0akcMcMbZ4JFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gDhGTBFqPDq9U8GTa1X8PrWIhZJr2Dp8uzjSGjpc9qwow26D/f00f89kLy+7zsRYX/ZSMkXPY0y0hWDJ+JVMDJnMgvE7X8Q6jM2OGmnAyZqgIIqdIwVeP1yi4+SNzlUStHRNwu7XhTYR7T0Y2KF1w/STp8d7hxtJGtpCxjC2QpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tt8CVoET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GpzWEeeX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UKsOnt832760
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fieI57xasLw9EncC0Xevpb3EAjDUZA+fje4i8+ZdQHg=; b=Tt8CVoETy5L+OSB9
	+I2Bt/TKXSoaTVnNnC5uNVLRwG6inkgWZptgp+oPoN5ztfMmhut8m1gVkkbH8+7q
	5IBXIO2AkeP05QxNO7hlM1XVdpt7nsZyVIIBy4ZUi2a5wrfIMf4n5LkVWm+pDWmJ
	pM7F80JKFxxgS6SH/fpZgNx2ZIH/7ApfaIYFBxjlN0NnGM+7BJDS9qfQQTmHjSHC
	tioNPj0cDnk8YD7RL0NdPWRZM9+r+m1SvlxRaoAkxvo7j5zq1OE1L2O1DHec7GqP
	WNZMEOS58jopVwGG9DksPG7HnXIDzYDVBJcFD8+HAOSSSrkgOGLos9d4E1BAesMe
	gtKA3Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb0esq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:41:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-294880e7ca4so33374125ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 17:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761871263; x=1762476063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fieI57xasLw9EncC0Xevpb3EAjDUZA+fje4i8+ZdQHg=;
        b=GpzWEeeXHSTIevW+jZlbaV/O37MPyzHxYec4f4upTMBvE1C02+19Wozs9D+1ko5Szx
         Kky52OKU7xXwbrQH5sOMzlmLfuCzHDRN48QmAO9dBn4gsgQS7XlQWUjZ50hLoS6GbUJR
         Ao0CRluLJU4vHgkS7u4GZFDo4VxlAdh/KecD0tW+kX0jYQg7BmbeQuA5jbo1h+PWQbd2
         RSU0y92L6kgqS+mddi8hDyvDf55n/19cmtm3JuIjxj5YEOj9UUEW5Tlahnp/lEjYvNeF
         7lSnQZhW1bJOplyu9EE4zpTICoGfX1HCBcvqe8YLwxb+a4WyijRa/DrFFczVT5hl2TKT
         7ifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761871263; x=1762476063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fieI57xasLw9EncC0Xevpb3EAjDUZA+fje4i8+ZdQHg=;
        b=ko3uBKrfb6ah0ECt25xCHrT2hFVYE+Wx2Ljc9pfCH86vjKWW7f7BV+QJnd33adePiu
         YfKpC716XseWAzPpIfK0x1XHjzKRXKXzgm64c7XPnqM4BhgzTTl4JIkX8pxjwMxrAzYY
         UqAZ+1BgHo0Dj09wDTmOBkvxIvM5pFIY7bO+nJkZSoS0UCj9o8S90cdwID+cGZpsNw1L
         tS/qqNnZJGahec0uhyDU2O/JQLbilKAnbp1fxU/L2wCeM28wlXs/eow6+WHazQlAr7Is
         eIfgoqw3hKloCz8tXcDufzAfCU1MTz5rZ5kFQQUCRGleKco0aWgSiajEVMwVVMlvKu4d
         3kog==
X-Forwarded-Encrypted: i=1; AJvYcCWCGATxFW/bCgboIEs597dEoo7wamiVfaqcCa2JaUqCI25mfxVBNZ8upRfTm0VUDNRuFx+Ij3INE82i7m5Y@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk6FF9zzNkd0iTYaYLcrifg7ce+b+GC4mcPmwXmiM3VA9OHxVA
	eTX8GTzE9KOvgCllxjpFVlhKMn9Wv29FzpRjTfDpFq/bnbB/oBejkTh3AKA8LNrFSzFugpQxjtS
	0WmnGFIcBaopPznGnZCcHXyeTVWmKDaQP1OVSaxQcIoZJtRntrIaaC6iKkMz9ehJXrjZnwzMXO1
	fiOIrsaqPLNtW0M/CnJieEXOls/PsL45IKN+zOefEnzbk=
X-Gm-Gg: ASbGnctn5ytCxg6lq3kV4zouh8fdb8o2fwTRZ5rpPPQdYytijmxJ/vLI7JFDJhGwfFG
	B2wgPQA0cMkPYGYPiNBqIiN/sYUG8mSqwB1cWm9lY9qkjGj0xEw7zYfDsn+HndIENi+oT1w38xF
	XMQyNl31PwMoPV5LwHxDxuP7G7ceXFRjZ/9YWjPirDiQvNr8zZqd/jkai6
X-Received: by 2002:a17:903:2312:b0:294:ec7d:969c with SMTP id d9443c01a7336-2951a50c692mr21434975ad.49.1761871263419;
        Thu, 30 Oct 2025 17:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC9d0NbRoeYA85hEQkJWEwVJ+EE4LoE6kzbyP6aWT4TNxoNQbGWC2q7luvndHS11q8pvC9sXHuUAdD1HJo7dI=
X-Received: by 2002:a17:903:2312:b0:294:ec7d:969c with SMTP id
 d9443c01a7336-2951a50c692mr21434765ad.49.1761871262918; Thu, 30 Oct 2025
 17:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030-image-crm-part2-v1-0-676305a652c6@oss.qualcomm.com>
 <20251030-image-crm-part2-v1-1-676305a652c6@oss.qualcomm.com> <b46wt76zmlms5h6zkner2rr22hwmsz422jy44qziqe6a2c4qrt@i5x7j6vgrzqo>
In-Reply-To: <b46wt76zmlms5h6zkner2rr22hwmsz422jy44qziqe6a2c4qrt@i5x7j6vgrzqo>
From: Christopher Lew <christopher.lew@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 17:40:51 -0700
X-Gm-Features: AWmQ_bkXlYO_uuXkcSoBngT4E6PKPtcwdTjS6iU6XK7p7ke8Zy-YreTFeA8H-yo
Message-ID: <CAOdFzcjzzymRxqoeF+FDidDo1aa-fNzV-3kERoV7HRW7RpQ1kA@mail.gmail.com>
Subject: Re: [PATCH 1/2] soc: qcom: smem: introduce qcom_smem_validate_item API
To: Bjorn Andersson <andersson@kernel.org>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 6L9oSPhRsW83Y1yWgAn7o6bvc-c5y_MQ
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=690405a0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0zU5oqwhyjOOBdmDFkEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 6L9oSPhRsW83Y1yWgAn7o6bvc-c5y_MQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDAwMiBTYWx0ZWRfX3oV+7DMpgx0Y
 euwBpJPn4pIMcvG02faFnEsMez7W0jj/F8SJGzoTKs8MI+jn5pSN1EOuEe8Jsr/Q1WDID8a22QW
 EuIKbwLYuOatVu16sltYwlNeffqY2at562eSejSd7J6KNYpOF0LWo3y3tW7QEqqr66CNa8pqz2p
 b4wo3WrO8KKuWWqeB7WqAdDK6hLVyIt+NXkh2wJMmr7TPyVWgLia5v7h7qsdirJN7aMyV9/DfzG
 7GsD4cxtTLNnfu/xyP16cuI7MNTo39uQWGpLLL5YrGZiNNGRdnvsBaTSkQT/9xx8TgGBfznwiQ3
 Rsu9VNuTcQiupTOJfgGL+rcpAOtDNhP8q1lwbnOT90o4tsxDOOS4HrkZsDpZF0X9aZNrsTpEKdr
 d/kW8eeKWr8tRRNW/o4b1UbGiR3JGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310002

On Thu, Oct 30, 2025 at 9:48=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Oct 30, 2025 at 03:07:48PM +0530, Kathiravan Thirumoorthy wrote:
> > When a SMEM item is allocated or retrieved, sanity check on the SMEM it=
em
> > is performed and backtrace is printed if the SMEM item is invalid.
> >
>
> That sounds overly defensive...
>

Discussed with Bjorn a bit offline and we couldn't come up with a
really good reason to keep the WARN_ON() check.
Dropping WARN_ON() and returning an error back from qcom_smem_get()
that clients can act on should suffice.

> > Image version table in SMEM contains version details for the first 32
> > images. Beyond that, another SMEM item 667 is being used, which may not
> > be defined in all the platforms. So directly retrieving the SMEM item 6=
67,
> > throws the warning as invalid item number.
> >
> > To handle such cases, introduce a new API to validate the SMEM item bef=
ore
> > processing it. While at it, make use of this API in the SMEM driver whe=
re
> > possible.
> >
> > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qua=
lcomm.com>
> > ---
> >  drivers/soc/qcom/smem.c       | 16 ++++++++++++++--
> >  include/linux/soc/qcom/smem.h |  1 +
> >  2 files changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> > index c4c45f15dca4fb14f97df4ad494c1189e4f098bd..8a0a832f1e9915b2177a0fe=
08298ffe8a779e516 100644
> > --- a/drivers/soc/qcom/smem.c
> > +++ b/drivers/soc/qcom/smem.c
> > @@ -396,6 +396,18 @@ bool qcom_smem_is_available(void)
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_smem_is_available);
> >
> > +/**
> > + * qcom_smem_validate_item() - Check if SMEM item is within the limit
>
> If nothing else, this contradicts the comment by SMEM_ITEM_COUNT.
>
> > + * @item:    SMEM item to validate
> > + *
> > + * Return: true if SMEM item is valid, false otherwise.
> > + */
> > +bool qcom_smem_validate_item(unsigned item)
> > +{
> > +     return item < __smem->item_count;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_smem_validate_item);
> > +
> >  static int qcom_smem_alloc_private(struct qcom_smem *smem,
> >                                  struct smem_partition *part,
> >                                  unsigned item,
> > @@ -517,7 +529,7 @@ int qcom_smem_alloc(unsigned host, unsigned item, s=
ize_t size)
> >               return -EINVAL;
> >       }
> >
> > -     if (WARN_ON(item >=3D __smem->item_count))
> > +     if (WARN_ON(!qcom_smem_validate_item(item)))
>
> When we're using a version 11 (global heap, with toc indexed by the item
> number) the SMEM_ITEM_COUNT actually matters, but when we use version 12
> the items are stored in linked lists, so the only limit I can see is
> that the item needs to be max 16 bit.
>
> I think we should push this check down to qcom_smem_alloc_global().
>
> And have a sanity check for item in qcom_smem_alloc_private() and
> qcom_smem_get_private() to avoid truncation errors.
>

For alloc, I think we should adhere to the platform defined max
item_count. I'm not sure if the remote hosts validate the entries
against item_count while they are iterating through the items during
their implementation of qcom_smem_get().

> >               return -EINVAL;
> >
> >       ret =3D hwspin_lock_timeout_irqsave(__smem->hwlock,
> > @@ -690,7 +702,7 @@ void *qcom_smem_get(unsigned host, unsigned item, s=
ize_t *size)
> >       if (!__smem)
> >               return ptr;
> >
> > -     if (WARN_ON(item >=3D __smem->item_count))
> > +     if (WARN_ON(!qcom_smem_validate_item(item)))
>
> I think we should push this check down to qcom_smem_get_global()
>
> I guess we'd still hit your problem on version 11 platforms if we keep
> the WARN_ON(), but I don't know why that's reason for throwing a splat
> in the log. Let's drop the WARN_ON() as well.
>

I think it's worth keeping the item_count check here because it acts
as a quick short circuit out of the search loop for absurd values in
qcom_smem_get_private().

Thanks,
Chris

> >               return ERR_PTR(-EINVAL);
> >
> >       if (host < SMEM_HOST_COUNT && __smem->partitions[host].virt_base)=
 {
> > diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/sme=
m.h
> > index f946e3beca215548ac56dbf779138d05479712f5..05891532d530a25747afb8d=
c96ad4ba668598197 100644
> > --- a/include/linux/soc/qcom/smem.h
> > +++ b/include/linux/soc/qcom/smem.h
> > @@ -5,6 +5,7 @@
> >  #define QCOM_SMEM_HOST_ANY -1
> >
> >  bool qcom_smem_is_available(void);
> > +bool qcom_smem_validate_item(unsigned item);
>
> This makes the API clunky for no real reason, let's avoid that.
>
>
> Adding Chris, in case I'm overlooking something here.
>
> Regards,
> Bjorn
>
> >  int qcom_smem_alloc(unsigned host, unsigned item, size_t size);
> >  void *qcom_smem_get(unsigned host, unsigned item, size_t *size);
> >
> >
> > --
> > 2.34.1
> >

