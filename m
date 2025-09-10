Return-Path: <linux-arm-msm+bounces-73008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D7B52140
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 21:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEE995E0ACB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 19:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343D42D73BE;
	Wed, 10 Sep 2025 19:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dM3u2X4J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3712D6E51
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 19:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757533131; cv=none; b=mRoQtPicDJYarZpy7/guOQ97/GGvCuAQRWfiT3ifFJvoSu/NlJFm3Y6sfYT6o0HnEBm42YOT9lNdTBRoj+h0ZQ7Y2I/H1dtE9wcXb2nEfLQg1FCN9aeRIJRcBUOQ4XNz7W+3pgcEiEU78h9ltW1DbdsF5Rdaub+sqW78IhbmTCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757533131; c=relaxed/simple;
	bh=GZrmNvuRj/VZ474191cuI7J+tJm/uerUr4/spWq8K5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mI+vHMVaIfkd2sI1FvD/DbazRdZd2MN72uBTg2XT3BxDaBgEACr3t71Zh5crkG738xO4C6RADDfrHBXCp7fVhZYsUFlPxJ7QP79mcyRQouhLfxKSX8f58F3F/ZwGGk3J8RkAFh1N5msWx/HR+Il+1DoYF4l6wb9IXzMtWUt4V3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dM3u2X4J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgHCD013109
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 19:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQu1oB27eIlAjTTYbUEVNBhRjkuYrUPFp5Bg13JvYK0=; b=dM3u2X4JFtWXF7rv
	MxD7iONV/6g1+O2+D9GH62cQBPHvbJszqQ/c/t2uE00YpIAhmqR/QCb4s91xx8Ya
	mJYNvf1V/UqLe/PeOMabk1/plkG9ybw7mXDWXyBzjfGTo+nf4B+PgTOjDZyvj6Vb
	Ug1eGTtrk1Z3uTclAcnepofloqRIpyRqcI5PY5Nclk3rYfsYvzTynvFCxnAmY2dA
	nL8ZiVBwibruBKR4q0YUVFKQr6VBZgMQr8VyQFBOLNymeAV01vmbeFOP+IZFEI3r
	4Ag91Nhde/+nhBEF7FeKOcih6gfybr+D5v2NEZMdkH4xboBJbZb4ehO7s7WmvPBF
	eCuTtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ad1q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 19:38:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5ecf597acso73081cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 12:38:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757533127; x=1758137927;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQu1oB27eIlAjTTYbUEVNBhRjkuYrUPFp5Bg13JvYK0=;
        b=ERYgy3AYFg7ApteGQOiz6pGJ2lbO8/fQgI8JUnwQwFLm6f1yxsM63f8CbGMOVPEShB
         x4GW6QgH93yx9ytjV44++hoLLqWxXw51A3NbWuBDx/W8A4Ne9DccdaI2zEZop5EgAtd9
         d/BBIRTFX1WVdI0nIjQHLlmsR0ooUbuxTJ0iH6HTDBFNlDLe0cTNlJx8bcZNisLRr2UI
         Y0+lbWCtZnNlH5hR4n5LbwRGzUJ8uBwbd62uCfVdembvjmVsn3vxfYmu39mId4Fo8IbY
         YWZHOpWgGsIqqfSIE6qSX+CvqqV8MfXvTCTOGLcGkNDOraVJ+6/Hn+3ehnAZIHIrslYg
         q8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCW/9bhVi4pkMK7HNWWnxq9ns9qNunmIyVCY82DkUlnvlbjroDyiCix299DHVtm3gIPimRpEzLtKhyeOHplZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyTRLMFpmhi+S8EbQRsbixrq0JIZJPf9wmDuWG6uEARJuC2csK+
	lWvUAAlvuNDcAiwE4zurtBhHibB+u6ohL2/kkz4QvMmcT+WjFDfuENuqOc4VNmKK5E1XaUDZwZf
	e+oJQqUoTfNdN6B1YUo/w3Bgv0oQtYAA6c/XqMJSq04ibw4K2eD3Qb5AMHdV8GGhdej9kOdHGvZ
	57
X-Gm-Gg: ASbGncuocxWaT71tv5oSc3uzsHoxugk+VlYsvOoir8JRJVJz7Nva1JQDGBZSzCNbeWI
	D+gb1I7kF6frOFVp6Jp6xRA2lKjT//S9N1k33zfDVLSGbWlH6caa5oa+mhjQ0Ly2BukEcxXUZzB
	z4K95OQfD/5pvIIp9zty5kOiqeBvg04v8r7/aM1xv8R/uKIEDfSWVHOGsiyZ/7dJAkFUy1Jl/gK
	40ir1l1o4JN3hZgL3DbfYXdqc0q619sNNwFAcqz4MR4umvlkBCj3yskBjMHMJj6tsmVu0A3EmUk
	l9fdASxazwkZlFMPuWZ3C5rctbCZm9joWOSATac/NP2ylpIZp1i2wU7qZ130dblHhcz0e6cPchr
	uX3Wqo3pmrMUgdDKJh4Ql3TekOGhrNyu+TLjvnBexDCxStenxQeSN
X-Received: by 2002:a05:622a:1115:b0:4b3:a2f6:d5e7 with SMTP id d75a77b69052e-4b5f846aecfmr191472351cf.60.1757533126884;
        Wed, 10 Sep 2025 12:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWpzldX+nVaSSGFt/xXRLMND2ntg53y340LE916xuyEMHMVjbyw6ovDoruvOslzFHp0wFBkQ==
X-Received: by 2002:a05:622a:1115:b0:4b3:a2f6:d5e7 with SMTP id d75a77b69052e-4b5f846aecfmr191471741cf.60.1757533126191;
        Wed, 10 Sep 2025 12:38:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56db89110c4sm53690e87.5.2025.09.10.12.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 12:38:45 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:38:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] drm/msm/registers: Remove license/etc from generated
 headers
Message-ID: <sydyej7hrw6tryx5lnidqucx3bcw34dkinj5c2u6szbv2wgnuo@utrlq5q5pt6n>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
 <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
 <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c1d3c8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=UhSop3MGIIBhUl3aXewA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: j8K3ptn15Aujy92Umq4DEoIE6WkHYfam
X-Proofpoint-ORIG-GUID: j8K3ptn15Aujy92Umq4DEoIE6WkHYfam
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfXxk6eIygi8oN+
 2tkV+Hz0ec/ApFqjL0xH8qE8FQHcHEmKtXLAxqIncLXSHwcZWCBGUkxNB3nvKo9mzPa8aSO0x8n
 8MsNxKbefng8jL63BOxpUTssQc+VLl0NfntkjUq7yrhKYWoDarGYgc657jBL6h4N1laclfzW2z1
 g7M6L5FSrtPEXJ11UkakoxQsOpMAf35cZJXD1eKeVi23V+hPS8HmOD75YQ1JjP/4WLKqmzaUmQs
 YypTxY0TTOgfZOzIzgoKXUiM/BMGQaUBFm4M87PiIotVruGKutAxMs4F71BbvLCX1yPQPXRUtuM
 Wd9EHg/t+5X+xKZz5PJfGyt5qlRiL9/3EZpNOvlrcIaszogsreiZPHTqmqqC+gW+nYYaBQvo3xe
 3Q00sw5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039

On Tue, Sep 09, 2025 at 10:25:52AM -0700, Rob Clark wrote:
> On Tue, Sep 9, 2025 at 8:01 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> > > Since these generated files are no longer checked in, either in mesa or
> > > in the linux kernel, simplify things by dropping the verbose generated
> > > comment.
> > >
> > > These were semi-nerf'd on the kernel side, in the name of build
> > > reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> > > registers: improve reproducibility"), but in a way that was semi-
> > > kernel specific.  We can just reduce the divergence between kernel
> > > and mesa by just dropping all of this.
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/registers/gen_header.py | 37 +--------------------
> > >  1 file changed, 1 insertion(+), 36 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> > > index a409404627c7..56273a810c1d 100644
> > > --- a/drivers/gpu/drm/msm/registers/gen_header.py
> > > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > > @@ -444,9 +444,6 @@ class Parser(object):
> > >               self.variants = set()
> > >               self.file = []
> > >               self.xml_files = []
> > > -             self.copyright_year = None
> > > -             self.authors = []
> > > -             self.license = None
> > >
> > >       def error(self, message):
> > >               parser, filename = self.stack[-1]
> > > @@ -686,10 +683,6 @@ class Parser(object):
> > >                       self.parse_field(attrs["name"], attrs)
> > >               elif name == "database":
> > >                       self.do_validate(attrs["xsi:schemaLocation"])
> > > -             elif name == "copyright":
> > > -                     self.copyright_year = attrs["year"]
> > > -             elif name == "author":
> > > -                     self.authors.append(attrs["name"] + " <" + attrs["email"] + "> " + attrs["name"])
> > >
> > >       def end_element(self, name):
> > >               if name == "domain":
> > > @@ -706,8 +699,6 @@ class Parser(object):
> > >                       self.current_array = self.current_array.parent
> > >               elif name == "enum":
> > >                       self.current_enum = None
> > > -             elif name == "license":
> > > -                     self.license = self.cdata
> > >
> > >       def character_data(self, data):
> > >               self.cdata += data
> > > @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
> > >
> > >       print("#ifndef %s\n#define %s\n" % (guard, guard))
> > >
> > > -     print("""/* Autogenerated file, DO NOT EDIT manually!
> > > -
> > > -This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> > > -http://gitlab.freedesktop.org/mesa/mesa/
> > > -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > > -
> > > -The rules-ng-ng source files this header was generated from are:
> > > -""")
> > > -     maxlen = 0
> > > -     for filepath in p.xml_files:
> > > -             new_filepath = re.sub("^.+drivers","drivers",filepath)
> > > -             maxlen = max(maxlen, len(new_filepath))
> > > -     for filepath in p.xml_files:
> > > -             pad = " " * (maxlen - len(new_filepath))
> > > -             filesize = str(os.path.getsize(filepath))
> > > -             filesize = " " * (7 - len(filesize)) + filesize
> > > -             filetime = time.ctime(os.path.getmtime(filepath))
> > > -             print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
> > > -     if p.copyright_year:
> > > -             current_year = str(datetime.date.today().year)
> > > -             print()
> > > -             print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
> > > -             for author in p.authors:
> > > -                     print("- " + author)
> > > -     if p.license:
> > > -             print(p.license)
> >
> > IANAL, but I as the generated files contain C/C++ functions, I think we
> > need to have a corresponding licence in the file.
> 
> I can't find anything that indicates a difference depending on the
> contents of the generated file (ie. whether it be
> functions/tables/prototypes/etc).  And AFAICT it is implicit that the
> license of the generated file is inherited from the input to the
> generator.
> 
> Some other points:
> - the various *.mod.c files generated for each kernel module do not
> contain a license
> - various files generated by asn1_compiler do not contain a license
> - other generated .c/.h files are a mixed bag, some contain a license
> header and some do not
> 
> (In all of the cases the generated files should not be distributed,
> IMHO.  Yocto should fix this.)

It's a bit funny. Normally you use something like linux-headers-foo,
which contains just include/*, arch/foo/include/ and some other files.
Yocto has adopted a way of building the modules against a full-kernel
source & binaries dirs. As such, those two directories are parts of the
cache aka 'shared state', which gets shared, etc.

> 
> BR,
> -R
> 
> >
> > > -     print("*/")
> > > +     print("/* Autogenerated file, DO NOT EDIT manually! */")
> > >
> > >       print()
> > >       print("#ifdef __KERNEL__")
> > > --
> > > 2.51.0
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

