Return-Path: <linux-arm-msm+bounces-72866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E77B50465
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 19:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E13827A1BD0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F53033EAF1;
	Tue,  9 Sep 2025 17:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGRZdjwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7004B25DD1E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 17:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438768; cv=none; b=fL4qQ6grXfah7lerKQqlM9bHBbjTCTShyFdPJ7kidigO2C8mnXntBSIsyJTX4dKMdXPUp29sreMjLzB7Z7/ZOx/sThLzUDTjGJY1JW4HXbuTxp1/wF6g3a9SiJRXA9nKodc+6JofM1VJnG/qi/UhHlnmRCIEVFh0XSzcSobOIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438768; c=relaxed/simple;
	bh=g2TDfAzEPepkY7lH8+YLMqR1ZWGnDSlKffZhVJl4KSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqhr2FTYAGVST5ngVMaqPM6ZgcKaCUJ/vBHGrbP4AdmzZuBEQMgSao3SwEcdel6jFp2pbSNEuj1xcJ+2uCBLgpcqcc3HrWRSzfU5ekLbx7NFO40vWIAKPOJ1ySKLOgtY7fGY7XvmIPNyAUxQtNuxVNrlj64p1iVWpqOIt3zvKqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGRZdjwx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSe9029824
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 17:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=dI/tFVPWYxe3gtmKF2QC5qw2SP3z6Sb2TYW/w+Ytjms=; b=gG
	RZdjwxnWNCA5VDqdfrskH+jGqlzP6dMUz5fY1zsBAKKt+50fLGGNIChDbmTspua/
	HGOkRlkbsdfdFVH8vAkQbO3VZ1oCOCWUUMwvoS9RC6gpxnpoigwSHi24Uta70GfV
	4i4FH1aDbSfea/mmmriK/Ex+TVHYr+cEO8+Zo01X67cJh9mKKyfgQrY09S3G4DHV
	s+9hMwnPnisVBtAb/4k2xktb8iGw831cfA8I9SCTl2jGFbcZnDoEOWTqdl9d68Z/
	sNfq2SY5L3wDjUcVOTd2J8UT9QK8TnuFw2ZlZwvXLKNlC2mY6U2NzsbaDCEXq/Gj
	lju1Evql542lEw1s06Gw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37wjxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 17:26:05 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-62189a9fb92so1755020eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 10:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438764; x=1758043564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dI/tFVPWYxe3gtmKF2QC5qw2SP3z6Sb2TYW/w+Ytjms=;
        b=ds048ZlVf5LURuHFwLcZxnhJ3qOn+wkuhywwDpKzPW2oRHETVBHhHQD+8PlyoyaOT5
         l1PrOXxZgpnrhjCd5UWHWfidF5eTP5jR0vXCcUaqvrERo5ir/QQ1+OdJ5UGl66G54aIq
         KmCgXpJ8cti2X2fBE+RcSNe7DzEhLYFSqPHqjyDOJpXeTfJFFybVtMgqoAZ/FI21usSa
         Vj1P4nu0TH2WjS416Vu2M6ooOk0VxGcDZgthQd8n0McVAyWcL3PMdWIoyeAA2rfz+0OC
         FyAblBE9d8nVp5SGbA/OEkoBj+jDH0szjy9K/CuN94UE7pq2DlaZU7ST6ypEg4qeua6d
         Sl3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGD+/JwnAHESP9Z5m2Nj2n9o20EXuUU7TD0trm/vmeLRJTKSbczSsScP0LgU28FnKswZIhEJIxfCnwKJKW@vger.kernel.org
X-Gm-Message-State: AOJu0YzvfQyaY46I2KYn5Por8MSR/T6mrj0uGdZx1J9KXb5kLz5yRsMs
	h3SlwEqSdOb207mQr/PxPnc7yRk29ZU2udEj3uMYN7ieXqvM7jOmV/g2oattmFIdTJIreqzeGS5
	6MffoQ3p95ySyTXiclb4qFrjtLGYx6pFikmOV5k8EfwXhiMntm536BSiRGxN1fTEL2sx4SJ/LNz
	D9x0V6WTn7dq7Dxo9W47VvdtNqtVeCPWO1RvYzrE4Z/V4=
X-Gm-Gg: ASbGncvepvNPv3WW5/VQLNFlHz6Cc433cd1TUjLx2q94wDdEvG/oFdHVm80Yxjicvw0
	ARgRG7xsws49coxeDr3HbKtSVprDb8HSTZUUjBUMF+17uMsCjrlw5HbQsAw9SNJ4Uj1DLvp5WAm
	ChiVSwPI+JGeFPHJ31oreWNLPv0kY1UX72FIgs1CpticrWrw6zt5hP
X-Received: by 2002:a05:6871:7827:b0:315:60a6:c27b with SMTP id 586e51a60fabf-3226533837cmr6671386fac.10.1757438764226;
        Tue, 09 Sep 2025 10:26:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn4AlsT86NdKgN9yHhRkxhjC25mI5BT+6nw4b3oMpLzg3EwapWIo1tkqNKsOWdNothIW6wabluGL0au0IHDWk=
X-Received: by 2002:a05:6871:7827:b0:315:60a6:c27b with SMTP id
 586e51a60fabf-3226533837cmr6671367fac.10.1757438763757; Tue, 09 Sep 2025
 10:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com> <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
In-Reply-To: <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 10:25:52 -0700
X-Gm-Features: Ac12FXxGRIubVyoobxwaPjC26ZhWg4pW-b_VwL3AjiQCcFrkrFqBbJ9eqYgvU-w
Message-ID: <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/registers: Remove license/etc from generated headers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: tTtUKTHfp46ddv0quvZHztLn1A7eE7ES
X-Proofpoint-GUID: tTtUKTHfp46ddv0quvZHztLn1A7eE7ES
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c0632d cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=w4XaYH8Cdj-KDOQYXpsA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX2KnYEWX5xtM7
 +g4iDOUt1fmEj32YTrJdd9YtnurBri2lbHAa1darS2r3N3dy4UcR7+4xHUoqvny9SFCBibqJu7d
 /EHPDuHY0jKee2xI0yI2+rFTZ2zS+E8E24uTfP4zRptDc/tZGsCAWFsQ6fpqCjYJ+3oSp17hEAz
 ZsIErbrjS5ttmN+41WRM/El2M1ZORAeZ6KIVquNCEKAH72p6zlzN0yXmHr1ERDrs0hR7+obWwp2
 xPZQxdWGe0uagOFZiTZAUj3FuFN5/VF2G9s7wZjx6QkwKZBooVrTxzZFOPmxFfCfZLcp8SsE8Ov
 PPepA8uevqqSlvIxefmXuIWU2OjgOpfMjPEkhsU+wHgGCKhZmsiyvNM71uigVg1nuLcWCy5R7lC
 4GfG9xI5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On Tue, Sep 9, 2025 at 8:01=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> > Since these generated files are no longer checked in, either in mesa or
> > in the linux kernel, simplify things by dropping the verbose generated
> > comment.
> >
> > These were semi-nerf'd on the kernel side, in the name of build
> > reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> > registers: improve reproducibility"), but in a way that was semi-
> > kernel specific.  We can just reduce the divergence between kernel
> > and mesa by just dropping all of this.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/registers/gen_header.py | 37 +--------------------
> >  1 file changed, 1 insertion(+), 36 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/=
drm/msm/registers/gen_header.py
> > index a409404627c7..56273a810c1d 100644
> > --- a/drivers/gpu/drm/msm/registers/gen_header.py
> > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > @@ -444,9 +444,6 @@ class Parser(object):
> >               self.variants =3D set()
> >               self.file =3D []
> >               self.xml_files =3D []
> > -             self.copyright_year =3D None
> > -             self.authors =3D []
> > -             self.license =3D None
> >
> >       def error(self, message):
> >               parser, filename =3D self.stack[-1]
> > @@ -686,10 +683,6 @@ class Parser(object):
> >                       self.parse_field(attrs["name"], attrs)
> >               elif name =3D=3D "database":
> >                       self.do_validate(attrs["xsi:schemaLocation"])
> > -             elif name =3D=3D "copyright":
> > -                     self.copyright_year =3D attrs["year"]
> > -             elif name =3D=3D "author":
> > -                     self.authors.append(attrs["name"] + " <" + attrs[=
"email"] + "> " + attrs["name"])
> >
> >       def end_element(self, name):
> >               if name =3D=3D "domain":
> > @@ -706,8 +699,6 @@ class Parser(object):
> >                       self.current_array =3D self.current_array.parent
> >               elif name =3D=3D "enum":
> >                       self.current_enum =3D None
> > -             elif name =3D=3D "license":
> > -                     self.license =3D self.cdata
> >
> >       def character_data(self, data):
> >               self.cdata +=3D data
> > @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
> >
> >       print("#ifndef %s\n#define %s\n" % (guard, guard))
> >
> > -     print("""/* Autogenerated file, DO NOT EDIT manually!
> > -
> > -This file was generated by the rules-ng-ng gen_header.py tool in this =
git repository:
> > -http://gitlab.freedesktop.org/mesa/mesa/
> > -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > -
> > -The rules-ng-ng source files this header was generated from are:
> > -""")
> > -     maxlen =3D 0
> > -     for filepath in p.xml_files:
> > -             new_filepath =3D re.sub("^.+drivers","drivers",filepath)
> > -             maxlen =3D max(maxlen, len(new_filepath))
> > -     for filepath in p.xml_files:
> > -             pad =3D " " * (maxlen - len(new_filepath))
> > -             filesize =3D str(os.path.getsize(filepath))
> > -             filesize =3D " " * (7 - len(filesize)) + filesize
> > -             filetime =3D time.ctime(os.path.getmtime(filepath))
> > -             print("- " + new_filepath + pad + " (" + filesize + " byt=
es, from <stripped>)")
> > -     if p.copyright_year:
> > -             current_year =3D str(datetime.date.today().year)
> > -             print()
> > -             print("Copyright (C) %s-%s by the following authors:" % (=
p.copyright_year, current_year))
> > -             for author in p.authors:
> > -                     print("- " + author)
> > -     if p.license:
> > -             print(p.license)
>
> IANAL, but I as the generated files contain C/C++ functions, I think we
> need to have a corresponding licence in the file.

I can't find anything that indicates a difference depending on the
contents of the generated file (ie. whether it be
functions/tables/prototypes/etc).  And AFAICT it is implicit that the
license of the generated file is inherited from the input to the
generator.

Some other points:
- the various *.mod.c files generated for each kernel module do not
contain a license
- various files generated by asn1_compiler do not contain a license
- other generated .c/.h files are a mixed bag, some contain a license
header and some do not

(In all of the cases the generated files should not be distributed,
IMHO.  Yocto should fix this.)

BR,
-R

>
> > -     print("*/")
> > +     print("/* Autogenerated file, DO NOT EDIT manually! */")
> >
> >       print()
> >       print("#ifdef __KERNEL__")
> > --
> > 2.51.0
> >
>
> --
> With best wishes
> Dmitry

