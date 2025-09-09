Return-Path: <linux-arm-msm+bounces-72822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C812B5007E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 17:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17A02442CEB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 15:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E64319047A;
	Tue,  9 Sep 2025 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ujc/zzZD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E0350D5A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757430065; cv=none; b=PXTHg1wqO2oPhd+Ji9raGtiauzHJ0/sBrxUMByGBsuCO8Ubu2g7SSpcgv2V+mxCldlu0Rd7l2PS9kH600NCH7PcvBJ4dVOuINnEIM4m8jCCTjGEvjLgYdni6XF9Gom5UKut5vkfYm9dkRIrJ9PBCj/W0KgKW/D40i71gD5ZiVd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757430065; c=relaxed/simple;
	bh=R96/ZgIb8udYyannyAPIOIbTWhbXdhgJI0PZcq7B6IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMF1IsZE4nJQEE+JjzexcmNxEsUFaOowc8i+4OTIesaBsveMdJ+9cvVBVJ3ZzQsmpgfttq+tw6qv4IJETN0RGcCbAyy8YZtJL1hG+ZOQkAUXActW0QNyV9s188ekEZ9Io/3MIR2wgekkWX7FzCDwRhuomLVjtqMCI+J0/glRe+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ujc/zzZD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LUPB024180
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 15:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XqTohBj1qLgWoq9uplvti4/t
	OBT3VUOGqeH3HMHa23Q=; b=Ujc/zzZDfrz66ycCfRDwoKgyozPtCQtDLcQUJy7h
	GpeY6fTqjvPJo3xF2Q1/l9j88dxXLHsirSC1imZ1REETNpdB3FRYkgtckOPoJn6N
	edK04EejMtI64A+tZE5+DHp6PmcgXP7Xeo4/tRtX6dpVuSQx8Tzn1qdBOxO+a1F0
	h3VyMlyqnBljcgisvUlEmP+d90KXSex9RkxWaEsrhNyPBtXhTQwrHFpdiTmyRAhY
	4cTYJIqnsh1P0ZxJwsxztPm10FE4eEPaBdMoYyeXy0n3xoMF1mTQpGdWDZwuBiB2
	08ah60erE2GtkElTqkt2dQ9nAzLNEgBdp3V4b3SrIOGQaA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by90n0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 15:01:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7211f13bc24so119993466d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430061; x=1758034861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqTohBj1qLgWoq9uplvti4/tOBT3VUOGqeH3HMHa23Q=;
        b=Zj9qBhTe6PUreAWsQv+ar/PwQoTbPf7boAl5/KvSFyRXqJ6qhTPbhRjtbBh++JVeQa
         iBEBJVeAOVYgHC0j25FJN35f3926Y4dzdxc17QyFgFv46/zzchHWr1YyMUyjaIla+Wwz
         VrMIWonneag0n3bp/u8Wx57Inqt21s3+OV2h4dyNb63/f7z0uavwSy0uHRZIxW3/tUl7
         9z6WUaBLhlGMf2UuZWKBm+t6YU2dhbo9zIsaNnRIpbHi+X2DLixOTY8KG9L1qAdZAYoy
         20tCipeemcolalsUnqM+dBCTPkg+3wfjUlKqJZL5WUYgRcjU1YfwUeQo2EY7W2LC9B7h
         Btlw==
X-Forwarded-Encrypted: i=1; AJvYcCX6eKI0ycz1zTCbB9bxyBiAFYo2IRr6/hUkPNdf8+yhsQEXsfvCrXrjSY+FE4u/ndO7u87zxadE8rUQhrR4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9L5RPtO5wtqm9mcFumuaP2Z4n8+Pi+CCLIeGWTGtdA1ADQ6KC
	sg7KgemaqcU06UcTwQ20se6LDQDr3lzziZUBoK7fBopBuMF1cu5AJmu2NOfRC0EX8slqXrmrqI4
	zYCNiYm4KG10V0CHzoCaBWYjLHYSuVaSfwqSS5m+siYdBsPCPaQm5wUV0J86BJkCwmq37
X-Gm-Gg: ASbGncvTQEj1vzA0cSVIgD+ZJPeA2TAwhOLR8G+YZuXNFYYF5rt015nkXM3J7KYt7ti
	x/C3uhMx6JEAgPmCFi7UTN81WrPgrSByC/IXbRRgHm3gBvghmU4r0bb0T4RcNURi8rJqspKNq0E
	IA7KrK83p1FiETfmtF1jHSWB/jMW1++1AhHNrXqwJj6oGvikbXmduBoY1F/8nrkhpkgPplowngI
	t1TJKYcqSie3nmkFKM4F7b2amOft2ysD8bH4JeenXy+zh2ACH8++76gVZpe2DWE1LCQFoCbvYjA
	bxmoTZOl5x/hzOt3EgC/hUIcmPEuwd3FcoDMYNDlzQOkCmjovFTIZE3FT1E5LxffQtWXfPVnOe/
	OAIUf22bEy1UzQW6ARUZU86HFPh4EJk+Zc8wl3XQErGYE4wzWIFhf
X-Received: by 2002:a05:6214:528f:b0:70e:86:af36 with SMTP id 6a1803df08f44-73924e25c29mr143249446d6.19.1757430048918;
        Tue, 09 Sep 2025 08:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFtK5sa4xm8mOsPdJfOo7fiBsFLFw85/oBAA2VqPWFp39gtDPu1XOXGBLAKw5O4Aqb0iu2zQ==
X-Received: by 2002:a05:6214:528f:b0:70e:86:af36 with SMTP id 6a1803df08f44-73924e25c29mr143238896d6.19.1757430041379;
        Tue, 09 Sep 2025 08:00:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50d3662sm39087341fa.69.2025.09.09.08.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 08:00:40 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:00:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
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
Message-ID: <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c0412e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=q_i8wjiaOVoz8fm2smAA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 7nWfi2vsI5lQ8IloJVd6OKFOzU20W_1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8MZIXQm+5HOG
 1yjVMCWspeVsmP8UivqQ1msMo0pNGSmQS3h79BoyFvvpD9D+ymoUL9AlNUAzJi/K8qN35NX7LjT
 X4IQBgsSoVNi4P0Pk4BkDPwHGnv+GVQer13Yu68x7qc/FXieQybGeU3Cwaaf/tO407FtDWHkhup
 8lbX5TxsXTB024ralnzZGBFmdMmJYtirCnfzQDfVu6NiBxRBDXUhRP0reKPJKkbyZ1yhR+n5oUX
 qwBcQCrCWPgv4ENcE1kwjYnCdp0ZTrii9NnW3YyS+yQ3OIR1gshdWF8liigFwcgcMlhmCpJPP9z
 buX3W5Dz2b7DLVdFSycOHoVoEo57qYwcNvc4C4b/xmR3SAtFxgk53+xfChWuah13gKi1NxV9hEn
 CrfkRj28
X-Proofpoint-ORIG-GUID: 7nWfi2vsI5lQ8IloJVd6OKFOzU20W_1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> Since these generated files are no longer checked in, either in mesa or
> in the linux kernel, simplify things by dropping the verbose generated
> comment.
> 
> These were semi-nerf'd on the kernel side, in the name of build
> reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> registers: improve reproducibility"), but in a way that was semi-
> kernel specific.  We can just reduce the divergence between kernel
> and mesa by just dropping all of this.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 37 +--------------------
>  1 file changed, 1 insertion(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> index a409404627c7..56273a810c1d 100644
> --- a/drivers/gpu/drm/msm/registers/gen_header.py
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -444,9 +444,6 @@ class Parser(object):
>  		self.variants = set()
>  		self.file = []
>  		self.xml_files = []
> -		self.copyright_year = None
> -		self.authors = []
> -		self.license = None
>  
>  	def error(self, message):
>  		parser, filename = self.stack[-1]
> @@ -686,10 +683,6 @@ class Parser(object):
>  			self.parse_field(attrs["name"], attrs)
>  		elif name == "database":
>  			self.do_validate(attrs["xsi:schemaLocation"])
> -		elif name == "copyright":
> -			self.copyright_year = attrs["year"]
> -		elif name == "author":
> -			self.authors.append(attrs["name"] + " <" + attrs["email"] + "> " + attrs["name"])
>  
>  	def end_element(self, name):
>  		if name == "domain":
> @@ -706,8 +699,6 @@ class Parser(object):
>  			self.current_array = self.current_array.parent
>  		elif name == "enum":
>  			self.current_enum = None
> -		elif name == "license":
> -			self.license = self.cdata
>  
>  	def character_data(self, data):
>  		self.cdata += data
> @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
>  
>  	print("#ifndef %s\n#define %s\n" % (guard, guard))
>  
> -	print("""/* Autogenerated file, DO NOT EDIT manually!
> -
> -This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> -http://gitlab.freedesktop.org/mesa/mesa/
> -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> -
> -The rules-ng-ng source files this header was generated from are:
> -""")
> -	maxlen = 0
> -	for filepath in p.xml_files:
> -		new_filepath = re.sub("^.+drivers","drivers",filepath)
> -		maxlen = max(maxlen, len(new_filepath))
> -	for filepath in p.xml_files:
> -		pad = " " * (maxlen - len(new_filepath))
> -		filesize = str(os.path.getsize(filepath))
> -		filesize = " " * (7 - len(filesize)) + filesize
> -		filetime = time.ctime(os.path.getmtime(filepath))
> -		print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
> -	if p.copyright_year:
> -		current_year = str(datetime.date.today().year)
> -		print()
> -		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
> -		for author in p.authors:
> -			print("- " + author)
> -	if p.license:
> -		print(p.license)

IANAL, but I as the generated files contain C/C++ functions, I think we
need to have a corresponding licence in the file.

> -	print("*/")
> +	print("/* Autogenerated file, DO NOT EDIT manually! */")
>  
>  	print()
>  	print("#ifdef __KERNEL__")
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry

