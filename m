Return-Path: <linux-arm-msm+bounces-73019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4DDB523AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 23:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 643F1177DF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 21:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D963093B2;
	Wed, 10 Sep 2025 21:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afQSqLgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3343002C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 21:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757540715; cv=none; b=HVOBVA+WNJu6+h4dm98kelzmTc/QnoltD/H81Yr/qR7+7LTgxlnIvXYTOqBoSxPB4i7wqZdGnz4o9Qw0LNZPSAYe7pAUHkwX+bVYdvbAlrVfX0lteap6xOn43PG+nDQhfvq30c9yt2KGgRrj5O4Oatqslc6nHmX7mTaQF6Od0Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757540715; c=relaxed/simple;
	bh=Nuc/Dp+QxAfVD1t5zlQhzhPb/Ldfq9L80zQIs71n/kA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXRJa8lVi0c4Opy8ohrObUVXoPySRz2xA0+HXAnXFBKntfa5ZYpjbhSM6LShOCyvzyKrjz+q1zd/lI60CnqndMe5GAcyjWOVXppgqATTAvC63tmlFkFsBbp8ifnuWHnoFBw2nYQwnNmCGkAaaeXxjg7kl3XlWekfDldOz/hVfwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afQSqLgi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AJ61hU024004
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 21:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=w/Demwy4FFKT7wLR0aTkZ0G5aRoHqReEtHzkVf/kk9M=; b=af
	QSqLgi2w1YJVdrThDNuPd9hmdEaSNEqZYJC775XZYXiXqpZ6x+cbC88fQiSzO0pa
	8m3hc2VmCLSWcH2yVTfyCbJXBwVnDvxz9yFGJG0BF+rReKBoZuKTItEPQLH/OkiT
	u5MQLMGkPFPGc0THe4QoNRXFnjf2a/OCgDggVoafUGGhtfpvijOFkBtgPFnicRaR
	p6XaQxKnlptFJaN23Sl8buj06gh2fHCnz2RbBTDH77PqTacdb09wm7Le0knSqhGj
	01VOP7B9Zefv0kxiu9TjHqna4JzMB+ahI51/lB57HxPNW8NHpuEJ4NxM7/9OdX6O
	k6+KtTA7afXD5lvKVq5A==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h0cfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 21:45:12 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-30cce848d95so36583fac.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 14:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757540706; x=1758145506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/Demwy4FFKT7wLR0aTkZ0G5aRoHqReEtHzkVf/kk9M=;
        b=W2qHm5J7WKNKq5kj1GEAK5dXc/rv/UUjZTGRWQZBBc8x+/ve+Cji2bhDAoLAND0LbH
         oCum3AARxE+/K8eIFKul20fCldXl9plSPQqehwXsICMP0D3IZHAQfXlvtfi47tWrOD6t
         +6jmv83s6KvkKHcZKSUBCsaLfzM0LrpVntCRmDEwjqAa3oRE9f1U6/0JSjiPwGCmO2vG
         yfDbo1885VlHAt16jEHfQ00tOFjeZz+zmqPdQtE0+/nYqoWDo/8aYxe+qp+Ho9URDvV9
         m/koyjCvU4STbODCcBydetlayPNL7J2hrqQaiQrorWWYRMp9BWVP2D6ATkflmpJSBOSp
         lsGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXI0ZRt4OqQtreOSvMfw6CJUniAJEVRGCNiIoupWbYZawGRcwn1PPsQRoi9vn3A5O6OLXJ+zPeUEQQdOfx@vger.kernel.org
X-Gm-Message-State: AOJu0YwFlpxI2y6O7LNh79I4O5sP4IrAT5xOQlea3aEwparQvZZ5acJo
	iDo0kh4PpGJE9m/OiAyQZunrxmJBg+CZocBWxFDf+eqCQiqGemKX4mEybcrnmtAGrA8QHMgHrGl
	6fafqkJG0C/Y5em+YA3xRRpSzbjq4gkwG/veVkD53DrjR/bBZeFHDqtpSChjMnpZsYN1EHknQPQ
	QZ1hkHyLPD/C4+wxgBVmZudVt35zTvSHIIG4q88rAiOl4=
X-Gm-Gg: ASbGncsQCi6pfTAWp0xaC7f0ON/ICi1y1ODsEHMcdZSzazkdFmDafC/6i0pxGc7kmGe
	ntD06hC7qDn3hqLRx3sLHahrp4RSQ9yN/mqAQdbEq9HshxPSpVoKK8123DHHnoi09J2dOJtO/p9
	T2ScWqrUzVbCTrIxAwpMaIvPXjLOwksLbvrYHRZHR4p0d/tnqOb6Af
X-Received: by 2002:a05:6870:9a1d:b0:321:2521:5a5 with SMTP id 586e51a60fabf-32262a6d362mr7274775fac.3.1757540705907;
        Wed, 10 Sep 2025 14:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVJ/g50t9kZW/ZaLe6GVeeuLBnWoaA7n3zqpoh6NbWQOdQF2WIKC87B32dbYHeYbUE2X9ZEP7MoGbxj7Ep8to=
X-Received: by 2002:a05:6870:9a1d:b0:321:2521:5a5 with SMTP id
 586e51a60fabf-32262a6d362mr7274754fac.3.1757540705293; Wed, 10 Sep 2025
 14:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com> <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
 <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com> <sydyej7hrw6tryx5lnidqucx3bcw34dkinj5c2u6szbv2wgnuo@utrlq5q5pt6n>
In-Reply-To: <sydyej7hrw6tryx5lnidqucx3bcw34dkinj5c2u6szbv2wgnuo@utrlq5q5pt6n>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:44:54 -0700
X-Gm-Features: Ac12FXwEpZ-r7IA8mOiamsbu_r09tIKNVWf2xHQxyoK9apW3k-0zqtWLdY5g9aw
Message-ID: <CACSVV02=+=PXtW-MrZVBKkFpadbMC_twKyRDPBb+YSJDX7dqTQ@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: R1EA90vW8DcMqgPcztshQEN2FD6OaRTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX22I0hvTMk89l
 oC/QuP39Sf4kZmCP1gjdHji2XEX9bt1kvd50rQuB7y//DH1mX6NhJMdmbJR9SGC25ID5gx9HYyw
 0gpaIrPmX1ZsbXmJKIzujQb5wIzmYldWh9Wg11ABjS5uDAl1c4GzzOJa+VnkiaS6jsTJ2iFILRP
 Hk9hnRBUcLqpw27BFtk+FBlAl1V41RHAw46ehZiDFYnY0rvBWpof6F+QhSVeeYef+Oh3nimQl55
 kISMgAlMEtW83UWsd8NbckRn4IL1Sy2dpKodhALk1KjPsucnKF3qem7XJCOBghLD6iEpBIwStNr
 crBzWcGi/Kq6f6yvZGNHptUQ13jJjxoTUmEs5Rjc2ED7LKCYbVDpbn5gRGFInPe7WAkX9aJ09wP
 2iQfMF98
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c1f168 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=mG2Gs39SVwW7J4BDEKgA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: R1EA90vW8DcMqgPcztshQEN2FD6OaRTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177

On Wed, Sep 10, 2025 at 12:38=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Sep 09, 2025 at 10:25:52AM -0700, Rob Clark wrote:
> > On Tue, Sep 9, 2025 at 8:01=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> > > > Since these generated files are no longer checked in, either in mes=
a or
> > > > in the linux kernel, simplify things by dropping the verbose genera=
ted
> > > > comment.
> > > >
> > > > These were semi-nerf'd on the kernel side, in the name of build
> > > > reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> > > > registers: improve reproducibility"), but in a way that was semi-
> > > > kernel specific.  We can just reduce the divergence between kernel
> > > > and mesa by just dropping all of this.
> > > >
> > > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/registers/gen_header.py | 37 +----------------=
----
> > > >  1 file changed, 1 insertion(+), 36 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/=
gpu/drm/msm/registers/gen_header.py
> > > > index a409404627c7..56273a810c1d 100644
> > > > --- a/drivers/gpu/drm/msm/registers/gen_header.py
> > > > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > > > @@ -444,9 +444,6 @@ class Parser(object):
> > > >               self.variants =3D set()
> > > >               self.file =3D []
> > > >               self.xml_files =3D []
> > > > -             self.copyright_year =3D None
> > > > -             self.authors =3D []
> > > > -             self.license =3D None
> > > >
> > > >       def error(self, message):
> > > >               parser, filename =3D self.stack[-1]
> > > > @@ -686,10 +683,6 @@ class Parser(object):
> > > >                       self.parse_field(attrs["name"], attrs)
> > > >               elif name =3D=3D "database":
> > > >                       self.do_validate(attrs["xsi:schemaLocation"])
> > > > -             elif name =3D=3D "copyright":
> > > > -                     self.copyright_year =3D attrs["year"]
> > > > -             elif name =3D=3D "author":
> > > > -                     self.authors.append(attrs["name"] + " <" + at=
trs["email"] + "> " + attrs["name"])
> > > >
> > > >       def end_element(self, name):
> > > >               if name =3D=3D "domain":
> > > > @@ -706,8 +699,6 @@ class Parser(object):
> > > >                       self.current_array =3D self.current_array.par=
ent
> > > >               elif name =3D=3D "enum":
> > > >                       self.current_enum =3D None
> > > > -             elif name =3D=3D "license":
> > > > -                     self.license =3D self.cdata
> > > >
> > > >       def character_data(self, data):
> > > >               self.cdata +=3D data
> > > > @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
> > > >
> > > >       print("#ifndef %s\n#define %s\n" % (guard, guard))
> > > >
> > > > -     print("""/* Autogenerated file, DO NOT EDIT manually!
> > > > -
> > > > -This file was generated by the rules-ng-ng gen_header.py tool in t=
his git repository:
> > > > -http://gitlab.freedesktop.org/mesa/mesa/
> > > > -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > > > -
> > > > -The rules-ng-ng source files this header was generated from are:
> > > > -""")
> > > > -     maxlen =3D 0
> > > > -     for filepath in p.xml_files:
> > > > -             new_filepath =3D re.sub("^.+drivers","drivers",filepa=
th)
> > > > -             maxlen =3D max(maxlen, len(new_filepath))
> > > > -     for filepath in p.xml_files:
> > > > -             pad =3D " " * (maxlen - len(new_filepath))
> > > > -             filesize =3D str(os.path.getsize(filepath))
> > > > -             filesize =3D " " * (7 - len(filesize)) + filesize
> > > > -             filetime =3D time.ctime(os.path.getmtime(filepath))
> > > > -             print("- " + new_filepath + pad + " (" + filesize + "=
 bytes, from <stripped>)")
> > > > -     if p.copyright_year:
> > > > -             current_year =3D str(datetime.date.today().year)
> > > > -             print()
> > > > -             print("Copyright (C) %s-%s by the following authors:"=
 % (p.copyright_year, current_year))
> > > > -             for author in p.authors:
> > > > -                     print("- " + author)
> > > > -     if p.license:
> > > > -             print(p.license)
> > >
> > > IANAL, but I as the generated files contain C/C++ functions, I think =
we
> > > need to have a corresponding licence in the file.
> >
> > I can't find anything that indicates a difference depending on the
> > contents of the generated file (ie. whether it be
> > functions/tables/prototypes/etc).  And AFAICT it is implicit that the
> > license of the generated file is inherited from the input to the
> > generator.
> >
> > Some other points:
> > - the various *.mod.c files generated for each kernel module do not
> > contain a license
> > - various files generated by asn1_compiler do not contain a license
> > - other generated .c/.h files are a mixed bag, some contain a license
> > header and some do not
> >
> > (In all of the cases the generated files should not be distributed,
> > IMHO.  Yocto should fix this.)
>
> It's a bit funny. Normally you use something like linux-headers-foo,
> which contains just include/*, arch/foo/include/ and some other files.
> Yocto has adopted a way of building the modules against a full-kernel
> source & binaries dirs. As such, those two directories are parts of the
> cache aka 'shared state', which gets shared, etc.

So _all_ generated files get shared?  Is this about building
out-of-tree modules?  (Which even in that case, they shouldn't need
these generated files.)

BR,
-R

> >
> > BR,
> > -R
> >
> > >
> > > > -     print("*/")
> > > > +     print("/* Autogenerated file, DO NOT EDIT manually! */")
> > > >
> > > >       print()
> > > >       print("#ifdef __KERNEL__")
> > > > --
> > > > 2.51.0
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

