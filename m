Return-Path: <linux-arm-msm+bounces-82630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 355D8C72A3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 08:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7D1FB34C536
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 07:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9BF3081D9;
	Thu, 20 Nov 2025 07:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHAL8ECS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MCqL3qcm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83C53043BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763624671; cv=none; b=o9Dat/WdUEsXLwxRWwaRUCygCnv1HRHtoYZdCiAGkt6a3vJfHaXeNkMbibwr6BuJ2jXsiu3dr2YSEg4yKgeop5c3tx600mUSwchshDuDdSkRPGBYG1aGJWb4eN4C19DjP9AjRy53WJAfKhC9TlZy2sOa48mqDWJKlH/HUDK+Nl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763624671; c=relaxed/simple;
	bh=7zETQiXT4xBuWzwG2Ix7qFEr5Fp3FSTqfDMOr3MK8Tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8huPt2cKSRdcc9LuMBao6rSMV0YWi3mupDLor1AqmITj4uZ+k/b9xqeXeuXMzDkA/OHmufa0YodUnOkYnASFQl9R1lJsblWNGVJpXsAcVxRNJfoopJkTIbDikVRsfj/sxXzsQhOPXCb394hDQ3tRCe/3hu8Y49jL/WszHhaDt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHAL8ECS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MCqL3qcm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK4prwl4184942
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dujPfF8ACV9dgOV+Fgtjs2y5+95hXnDada4nHzZtF9s=; b=VHAL8ECSLelPZLt1
	8WZJAK2BB1cw+nH/6uzmykaAOyo2aXb4cpT5GeebuKcVHYvUnObP2ThlSZfG1lM2
	Ns9/pV/gPB+4WaeDXf4/v6zE+KtncX1/CKv7Cacb8mahFB0XJfvcpLlKexBszeDR
	s/+saYcCPQzB78Uy7b9aOmFLvQVMKM9GklFfVIu9t94HjH/baGKC096XGRLGazrS
	GK+LudppumiZr9pR3RGDc+F3oGnADh1HiN2VBGQnKshEvVJjKoWE8Cw6FLLJZoDy
	7gC5ylUpEDl8/N2t5kyk6/jSvY66wLXHTvEKgaz0vSDJRfMn47sul0n5IhA+3U6T
	rm59LA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahbt6ueer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 07:44:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b244ef3ed4so176351185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 23:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763624667; x=1764229467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dujPfF8ACV9dgOV+Fgtjs2y5+95hXnDada4nHzZtF9s=;
        b=MCqL3qcmJktBT23B1r8ZBh3ki0h0JVCikki9xHHp1nW8oVEMpktU+axbYbRqwSEbCx
         Mxj/nQqo05nNlyTjk+E5CD736nCKK+LUfwgguo4xtYoGHS0VKuu3+0eSnp0BsnTKD3n6
         awtsBoX2OmzRg8c3ucqjDiH5C7/Ti/WyW2qHkjIeAA3/RuvE+NayCn68kKBJYC38lWBx
         DVEiXDzrJQZgS8UJ5132z05Dbnlx+1s7PXDqpteGGXth9vYEJjqhpBnk7V7KC4VGxq8m
         ooTfDxy7mfWj6x/WdIejWQ6gKFuPOEFG28yeDwgtX3P0GSWO2EwZz29JPUC7aUCCQjjD
         J+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763624667; x=1764229467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dujPfF8ACV9dgOV+Fgtjs2y5+95hXnDada4nHzZtF9s=;
        b=qWuaWS8Re1Wyrow1WUwwegzhrlaPeVEgDGMVGkv2rhcqYaR4/aRRLIhcQoXhEkgXwH
         b801DSd1K11ZJLmVFfbALFx042/KHQ3aAqB0sale6PMgFGyio5ont/ss0BSV3QI7QpUF
         EXkPTEAX9XjDXhb0dW8IZQ9Y7xbt/Yuv2ec9LxmmSLixkqhFXTvDv/giENStgk2JeIy+
         p3tRvS9zpTT0RcVmg67ULdxphtxPTWrpuk28eV9cHldw4AialzTvFOZaoabk/ci2JzdZ
         /Ls4BljgEYZ9qo1N9olrAq4j2xsCiEFS+NSY89fkvEpKwoEAldVxCWXlC5mncA6+KaBc
         s2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbvSfUT4WA+4L6hjhtvU1i1ul4f/+tvvyssQfVKa5wGdt0lKUQLN7dR5Vm6K9G6bpLAVwpsCXFs45i5/rr@vger.kernel.org
X-Gm-Message-State: AOJu0YwmncHAHfItU3DRfZ2ZiCN+gwymuiC86PP5wCv61Vv1wA+xTpUM
	gQ5wqnKrx6RWxvawzqclk4m24r5wTHTZ15REjEFMqFvUElTLV8/jocbPej6tUd4hQmSEo70NxZp
	4JIARZoIjTJ/w6FKNdxeCkulvzBlPAJWTHCaw2IF6Q4mtdqfLcd4DTAEItvx78Pu6QsESWvtVrr
	oPf4zGdpkIf/qYJa+mQxS7WbAWiI+Zp4i6YbtIEmGO0jw=
X-Gm-Gg: ASbGnctiJAcmGpE1lu3ohzW4uLaocnpFJTPBphY0752gHU70mrJhgnrzDCn+B9/pBG8
	IOGUDBbcxp3uaR2eS3b6sLvXhpaErKVQvWo4VuKbLCvH3kUzte/b1iNULmT1Ca9BK0N2J/QyzKl
	RDjKiDkKoMzwDL/MNoFJR9mofkr/+1AvonA9PI3XkmSf9k0zveGoCopOD3nwpsrt5qukeogjfil
	YsSts0Z6lsPhRd4Bq7jSvST//u4
X-Received: by 2002:a05:620a:4627:b0:8b2:e177:eca7 with SMTP id af79cd13be357-8b32a1a2f3cmr175857985a.65.1763624666990;
        Wed, 19 Nov 2025 23:44:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiTSpTLL63gFNA6kfAEuwhtERl1L6tPSLZBLhGwEhTfPcT1NDl90S4wwKlZLkAOyMLn0P1RJq1xqQ+nA4aT24=
X-Received: by 2002:a05:620a:4627:b0:8b2:e177:eca7 with SMTP id
 af79cd13be357-8b32a1a2f3cmr175855985a.65.1763624666597; Wed, 19 Nov 2025
 23:44:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119105615.48295-1-slark_xiao@163.com> <20251119105615.48295-3-slark_xiao@163.com>
 <rrqgur5quuejtny576fzr65rtjhvhnprr746kuhgyn6a46jhct@dqstglnjwevx>
 <CAFEp6-18EWK7WWhn4nA=j516pBo397qAWphX5Zt7xq1Hg1nVmw@mail.gmail.com> <moob5m5ek4jialx4vbxdkuagrkvvv7ioaqm2yhvei5flrdrzxi@c45te734h3yf>
In-Reply-To: <moob5m5ek4jialx4vbxdkuagrkvvv7ioaqm2yhvei5flrdrzxi@c45te734h3yf>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 08:44:14 +0100
X-Gm-Features: AWmQ_bkbG-y72KHENe0Ls0_KPXmUg0MtnXnXf44C4r75Jlynu6WUZb1WzxdIMb0
Message-ID: <CAFEp6-1kSMGY0ydJjTvZqB4okXQgcwkvhMni8r-tOMzXyY7P_g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] net: wwan: mhi: Add network support for Foxconn T99W760
To: Slark Xiao <slark_xiao@163.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ryazanov.s.a@gmail.com, johannes@sipsolutions.net,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 6l6no_GxQH5RP1UVBVALDIYpFD9JVx1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA0NCBTYWx0ZWRfX++XmiY+lLlN0
 4TeqBenc7cKgoaZevDFKOhB7gmXT8R5znjUUV7kSe5gI59plThUBn/rU2VsKLbwrUi34+JTTJyq
 USD9SApTQF/PuuT80vpTCtQ+RkdcjnaEDo7B6AlVyLGbc29FC8jeURfbv7NqK36sqkxvA+MaqAU
 kLTw9Bb1b2sBNqBJSpFGDt1ZloWW81p5oiuaDuXKOmzg+54OwP6cnhDga4/lDV/n5PNzEc1K9N4
 wCEPeWEGXHBUCLMhmgnB+K7lqHZ2KiOe1zi5V/aLKcl0XFE3Pir9sPwLKX/fYx2E5uKx0OaJgCD
 FUY0PFaP9O1fkNAl2SBdxbWlO2kaHmjZ6cAlD6uN7WQq8XPkaBBNsBdUa0346462YuvNCH6bomh
 wnP9gsTTsLQsd1eTBQIEWma62ikD1w==
X-Proofpoint-ORIG-GUID: 6l6no_GxQH5RP1UVBVALDIYpFD9JVx1R
X-Authority-Analysis: v=2.4 cv=PJICOPqC c=1 sm=1 tr=0 ts=691ec6db cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Byx-y9mGAAAA:8 a=bWBNashKTJGlpAx1TYsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200044

On Thu, Nov 20, 2025 at 6:41=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.=
org> wrote:
>
> On Wed, Nov 19, 2025 at 02:08:33PM +0100, Loic Poulain wrote:
> > On Wed, Nov 19, 2025 at 12:27=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Wed, Nov 19, 2025 at 06:56:15PM +0800, Slark Xiao wrote:
> > > > T99W760 is designed based on Qualcomm SDX35 chip. It use similar
> > > > architechture with SDX72/SDX75 chip. So we need to assign initial
> > > > link id for this device to make sure network available.
> > > >
> > > > Signed-off-by: Slark Xiao <slark_xiao@163.com>
> > > > ---
> > > >  drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mh=
i_wwan_mbim.c
> > > > index c814fbd756a1..a142af59a91f 100644
> > > > --- a/drivers/net/wwan/mhi_wwan_mbim.c
> > > > +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> > > > @@ -98,7 +98,8 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rc=
u(struct mhi_mbim_context *mbim
> > > >  static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
> > > >  {
> > > >       if (strcmp(cntrl->name, "foxconn-dw5934e") =3D=3D 0 ||
> > > > -         strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0)
> > > > +         strcmp(cntrl->name, "foxconn-t99w515") =3D=3D 0 ||
> > > > +         strcmp(cntrl->name, "foxconn-t99w760") =3D=3D 0)
> > >
> > > Can we replace this list of strinc comparisons with some kind of devi=
ce
> > > data, being set in the mhi-pci-generic driver?
> >
> > If we move this MBIM-specific information into mhi-pci-generic, we
> > should consider using a software node (e.g. via
> > device_add_software_node) so that these properties can be accessed
> > through the generic device-property API.
> >
>
> MHI has to business in dealing with MBIM specific information as we alrea=
dy
> concluded. So it should be handled within the WWAN subsystem.

it doesn=E2=80=99t make sense to include MBIM-specific fields in a generic =
MHI
structure. However, attaching fwnode properties could be reasonable
since the MHI PCI driver is responsible for device enumeration, and
that would keep device model specific handling fully covered in that
driver.

It=E2=80=99s fine to keep device-specific handling within WWAN/MBIM. Howeve=
r,
next time, please introduce a dedicated device data structure for the
mux-id instead of adding another strcmp.

Regards,
Loic

