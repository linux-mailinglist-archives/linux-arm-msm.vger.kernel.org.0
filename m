Return-Path: <linux-arm-msm+bounces-94169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B1YGCMfn2lcZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:11:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC19919A4A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 17:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DFAD3182B78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065E63D903D;
	Wed, 25 Feb 2026 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8vpJAog";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B29HuRSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6343D903B
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772034234; cv=pass; b=c5P787Hal+Zm6loqwQd6nK/bnpbJioxIj0WkIhIQ7dBZMdR8tGUIugbULIu7EUI6QPsgn7mHW/89ZlQPAS0qdNWp9vxlV+KWwc/UTT7GPo6WmE5MOa+at+CBUsogXJr9tlCU0Yb+g90nXDiKiHqdlyLcNTdqJ3O7cCncINtbn4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772034234; c=relaxed/simple;
	bh=uCAPhy/gMCxOqNA6jmJXG0gi9Huxaf2pTtLsI6AZq1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNMwrtYlBeAeEttnzxPMcu376iAk/1/vhwlJ65KID+ddaoAiiMHcGWKFYowx4rhzNXCQYNlqOTAcCPV47dqSHJ0z3uCSYr26W0csv1FOt3Ikzc7fbmKNVvgjJ7GTIyldSD+q+UDfmGe/3lRAx6lh26XsyAmHXquEBhaX1Nr7qr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8vpJAog; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B29HuRSG; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SIbY1363573
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+JvHDDbTYtABDDcCUqp4DyZW+RBdiQ43AT9le7Hg1qU=; b=A8vpJAoggljBTw0Y
	OzyuAbK8V6iqX/g9KfS2ptM8BQBVu5f4dMaN/23UTZR0XQfD39Sd9rQy4wMlVWnY
	zRgIHl2xAcRKMoOyE0uwhyajlhbwScEk8YJqquFllK2aMqod3QG1mMb5KKLdC5ql
	ZePzOiXm8LnAUbQ6rSyjSJoSv8mz/KJanTMdxyfEWVzqjUFEytpmAPRCJH1c06fo
	n5zv1yOFw6DSqZLqnEDgO4Fu/cfuDar1N8aTx+EuKfdpOHDvKiirFYwXBa7MVJqx
	VjIjmHlP5A9giMAaNTlTDEQzbeYMOGXMo4oRo/7talrfGfT2+UiJBgPR2eobjhAv
	I9vmNA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp15ahfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:43:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896f84e69b6so683105096d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772034231; cv=none;
        d=google.com; s=arc-20240605;
        b=PjUAt/UnwWvIB9UTBfWHM6zdDJRV5iP23KE2C8rBcWN6LW0MGh3P7Nwcj/HoanEy3s
         lri2f8JFvfOaPeLl1BLWSGBxC4jr2jBcgnO6dqGloiQD2SFbvyQ5YoXviNy16EoSjcBW
         wyaBbd4gDEc/HJWes9uFVv01OMcb4LXVOsUfEXukJYYGPMv28lb9QZCuDas66xAV2zvL
         eTIZJEO7b4CsgjolPzJC/RuB4kO/wl0QeqST3vXtGSNkYVdacTm6QdeK9Zq5uzw2n3EI
         /EdaN4aGgstOPT91Zujne8br90Dyf35qiS9MFyBLoM00ejmh5xVu5qlqSHW6JF57Tn35
         LmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+JvHDDbTYtABDDcCUqp4DyZW+RBdiQ43AT9le7Hg1qU=;
        fh=xvaBjXdPnyfXBlUCp5qxQvfzrMgTG3TM3MNScAKK1LQ=;
        b=jM0V6tB506x7aNtEoXzNnakZXIeMjP3r5Jk4FVXvKxIxwQWYCGWgHlThLyA1+qYcMn
         rH1cacnYSbHt+lRZhOUeRG+VA97st02RwW0c5T6r9gvGuRTBzatgJvymO5htNN0xu/CX
         ha2T7RkapgQmJlG/ktCu+7Ghj8Q1fnUgEgI2kv8F9TSMW0g307gF5f+G3nZPmFNoPRAj
         Js4dfw4QqzhdKYSSHbXfxTaaD8sbrMiOLGyDLbL569lX4NJwTac+EOJ+lXox5xecIwjZ
         hPvO57m5k4Oiw+LcCxD5YQt5tKEOm9BXt5AK4tgTSAVv4P3aZAYQe4gWXCk1H6OPKOjq
         SF2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772034231; x=1772639031; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JvHDDbTYtABDDcCUqp4DyZW+RBdiQ43AT9le7Hg1qU=;
        b=B29HuRSGwv8JrfWjxrQYFQuYxKpYzCbI3sGzoS2dDZnID4Lz+ysYK3DB/vMPFQj956
         L/ERAuZ3txHJ+mxCDNEhVoxVuF7ZZ2Yu83s7Dbs5P8Ol16F/wMsccAukCUu1otb6YVy5
         s/5ugaxaYEeP2dFbE1u3Vhk8Qld+3k+At3Pz95vA/bhkw82E0/KuTNnRu3NEqP1OB1hS
         8l7S4Xv84GvQjNrpn43KcaKLx6q3iurvi4I7sf1z+I8A501L5mJhBLlnrG8g4jGzj3fb
         fFkCtHaI9W+EWrK/bXtOqUuwwRzDruC1+rFbuyug8spYLqpkvNcqKMVCr12BWVKFwQCD
         fiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772034231; x=1772639031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+JvHDDbTYtABDDcCUqp4DyZW+RBdiQ43AT9le7Hg1qU=;
        b=lUlMgHcZdB1vudyQFDhhEeU2h3uMEbPuS7M2ydgE1mGnBIcuix4enq9S9qbJ0CaAws
         QThh4NWFiLgiDyFuz3ExQ4eo7BbS6bJ8c/hrx82L5gUNVMl1O8NG4UDA/djBwGfPR0zq
         lPkci2Vn6v8ABzjT6o7m2gbfVgnNhJ0feO9Ascd3B4FbANgI+RlqQpEOu/VyzLuQwO2r
         58ijS5Ifg/E+57AqeBYdpOScLlNu/LyoNnlsLVY9oqRibIK2QolC6DSfbbcrvIVRKiqF
         f5pvJomUG37OEgf/iwvDi8EiD56Bf5FSIZWYzziYHd6eUhKGs/nXUEA2paXibkKonfT8
         HyvA==
X-Gm-Message-State: AOJu0Yym78c1f1G74mNFQZgYcGO52bHsipaks/f/D+ojc+jPzml3L8h4
	e18ONF8S70Uy8INlc3zroPzxwT7vJpW3Rn9VsbknLocR6tpjnUTRQ+nvrP7KvHYHhuyCGSTM5Mj
	8ARyG1l9kHfj18IQuikdBdQJ5TYc6kidJfqUTBXZcqBkry9iIZNHbQJI6esddewPuzb99zFUPvh
	JKo6723hGZ6qKRw+2+PMNZ0r0vZQg3QxpCPaFtsYi/q4I=
X-Gm-Gg: ATEYQzzI1sf/UWpQTbD9keej0YHTw4aufKI8PrfIS8qz7/JPiYAGgMj2t9BNznQK63p
	AjKcUfwFdsJbfJh7SjdnmY5vfffSSNopHc8Tb70WRoidAd17Vi8LQ/KpwVfYZ9GwbjhDa1nvsOd
	UrgWPcSaOq4N3tzicrPT0Z4ESQ8aHjSXwdanJ8uJyCtYHMF3/mZ3sSxZ9PwDXw0esbLNqCxsM4C
	z+aU6+mExtNK4UVwMFYrhe8iqF7M7LJksqxZY/t
X-Received: by 2002:a05:620a:710b:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cbbcf54d18mr117063985a.15.1772034230590;
        Wed, 25 Feb 2026 07:43:50 -0800 (PST)
X-Received: by 2002:a05:620a:710b:b0:8c9:ea1c:f218 with SMTP id
 af79cd13be357-8cbbcf54d18mr117059785a.15.1772034230051; Wed, 25 Feb 2026
 07:43:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225152211.766792-1-loic.poulain@oss.qualcomm.com> <11249664-38c5-4cab-998d-f715a4e0124c@linaro.org>
In-Reply-To: <11249664-38c5-4cab-998d-f715a4e0124c@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 16:43:37 +0100
X-Gm-Features: AaiRm51h78gpZbERpRmi0XMPMaiOc9elkIWzQ0KU-GSbmyGcBYsvQPJ17GVEdiM
Message-ID: <CAFEp6-1efjKLY-dimV+Z5d3+Nje5t+zshnrK3HStpAv2p7KnFQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Add debug message to camss-video
 format check
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0OCBTYWx0ZWRfX6CqsPT2m1x9b
 P+RJfzLBuvRCr38dxm4SGvrlFwGyXH99pCFVU/Cvtinq0loRlJXNJVgWFTaRjckBu5fET5oC5xU
 O/FGtcGAGFmP+TaSBZax2HhSbpcIe5u15q31ffMLEI1INhI95OF4WnqkK/QxpLGJjeBb+yMeVIo
 sy+6bNgC6AUtSJisxocLKhEJ4CRVdbfEl3C5X76OHTAtmUyvvsnPaKU4id1rbrwtcKOcDOjx92q
 jg3hh402isbaGnzofC8BiFaZvJVGD75pk4nhTaQkPdSObUylCSJ3afsFk7Y2yk4d5ML0F2jPpUH
 qYIUr3R6Jzd4Bkzc9sS4djHdwAn91jtVBxgHPtWt8+PtN8GgKTTxeATXHlY+wtJevN/6WTVsreu
 FrGUgDrQJOYkF6kJ2rh4oBvoOpNd6oiagiOiYBf0QABJPUHxePAaDie4DHzLn6qRLZ4XPzAYoRJ
 PgxgitqGa4bKz3Yn3Cw==
X-Proofpoint-GUID: MoNUEaoX1EiomGsO_XYFqd8kmA4r5CkR
X-Proofpoint-ORIG-GUID: MoNUEaoX1EiomGsO_XYFqd8kmA4r5CkR
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699f18b7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=D9TC-kg5I7-vxv7XpYQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250148
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.c.6.3.0.1.0.0.e.4.0.c.3.0.0.6.2.asn6.rspamd.com:server fail];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94169-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CC19919A4A4
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 4:40=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 25/02/2026 15:22, Loic Poulain wrote:
> > +static char *print_fourcc(u32 fmt)
> > +{
> > +     static char code[5];
> > +
> > +     code[0] =3D (unsigned char)(fmt & 0xff);
> > +     code[1] =3D (unsigned char)((fmt >> 8) & 0xff);
> > +     code[2] =3D (unsigned char)((fmt >> 16) & 0xff);
> > +     code[3] =3D (unsigned char)((fmt >> 24) & 0xff);
> > +     code[4] =3D '\0';
> > +
> > +     return code;
> > +}
> > +
> >   /* ------------------------------------------------------------------=
-----------
> >    * Video queue operations
> >    */
> > @@ -218,6 +231,12 @@ static int video_check_format(struct camss_video *=
video)
> >       if (ret < 0)
> >               return ret;
> >
> > +     pr_debug("%s: format is (%ux%u %s/%up field:%u), trying (%ux%u %s=
/%up field:%u)",
> > +              video->vdev.name, sd_pix->width, sd_pix->height,
> > +              print_fourcc(sd_pix->pixelformat), sd_pix->num_planes, s=
d_pix->field,
> > +              pix->width, pix->height, print_fourcc(pix->pixelformat),
>
> The return is static, which means there is one of them but, it gets
> returned twice.
>
> The second call will overwrite the first..
>
> Just use %p4cc - also please use dev_dbg(video->camss->dev, ...);

Good point, and thanks for the helpful hint, will do.

