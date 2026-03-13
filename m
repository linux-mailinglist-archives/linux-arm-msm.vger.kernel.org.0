Return-Path: <linux-arm-msm+bounces-97521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLNFExwYtGlkgwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:58:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D52A62845E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 14:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F8DC30FE873
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE951332628;
	Fri, 13 Mar 2026 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmCJuuBH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DcvadJC3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E78738CFF5
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773409617; cv=pass; b=QK1UYiPOVgNToFQxEER9lumpvnm5vx/DFVMzY1Se9wuggy5RLr4BiyE/OhLaD5F5nQMv4vHL/HBd1FJiZgfUHYYjdwvo5G3Eo+czl9MnXgGIEDNnq5xIxYUZybxo6SXMcxp8PLJFF7RWlzdqsQXT5uxc08/wad5YsrGsvCguvzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773409617; c=relaxed/simple;
	bh=FV/DtwzhOKzdsslHwgbGdgNDdyr9MZgndBBW2Xvd1+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWz+MgVV7albBWqa9S2p7jr6laWh7pyE+rDUozTY4DD1Ha4nDejL+OADVN9MLLOhWQQ1kJLH1oefI8kk94sTfoDjb24xzNTSaXRcNPr28wITkVm3Lh2ixLzuxkFu4bw4+FkAa1YQ64jXnPjIMiRULBHX/yArWX7R2MhyQx4Vmuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmCJuuBH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DcvadJC3; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DCuKGr3342538
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyRmy/cEJXIwo5hmY9vuraMz3s2ZHyDh9ljpBGyqXFM=; b=OmCJuuBHhuBop15m
	kkTk1Ao7JAX1m1wdM0XgS0LMZwdD/FWD1ffcm83paz380+9bsRtRhRqMiMxGVXzP
	5D3cNxs8wSA//yhAxp2eMaAcfzBB3RnCBfgS4sOquFty4hehK9mLBiZ9sdU6JLt1
	rT2F6rWP73jNoJaFjlBqFoq3sf6HwxGGfIvsoHsWR3sf8psKImHxQ+r6XWuTTgCL
	L8xlsHAiAG4uVnZt5PAN+ncOCjXbO5bIJLEChtCVbOUQ8uBnehj7MM59NGj1iCSi
	etSAn6abowdwT1W/GsJtZvc5nOqGuntaxdH7JbKTKhmX5CdKPPa4mEM+SBJh3uAb
	HcbysQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w513g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 13:46:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-899e76aa555so195118556d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 06:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773409614; cv=none;
        d=google.com; s=arc-20240605;
        b=CwF5ONYESAviEm+Wo2dzMnPUMgsjpoVxCIsw+/rH3J/NsNpoNno72s1Jg+VxSwQ3oX
         JWv/mSJyCJiKV+IJ06290M7I/epsTy2HSfc0gkfSJa7HL5FUL1RfPb3uc4PRvIzJ/Mwo
         LJ9CGuDLu1gK5pGR9RbpLcCL5lLs5xKCalwfdnB8tKctDuhPfvgS8/LRmaDYm+6o786B
         KDb+iFsl5MEw0i6vjhtljXbcuDoP6Grb08cvbqS+J5EfBeBlfxhjTVWnpZBtLgQNqcij
         0scempWTumCB0tu7BwXXAza5RpWxDcrdKRLRGqxnnJvnMEejvUD/leOeoV5GpmCI311l
         t4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IyRmy/cEJXIwo5hmY9vuraMz3s2ZHyDh9ljpBGyqXFM=;
        fh=l86qvR74WxRmKBIEpQPu+3eI6IsPA2/4GOfLl+Eb2YI=;
        b=OmDww1cVFprIVdwBRJgB0rm/bKz4+1M7EHy2V0TCIT0nWkJ/2o/c9smRxuP2nTMVno
         hdUL3p7luZbXYLyC0VNMQz9BM0fXsjWq7iXu5oNS/Jq0+8x5/Vb7ulG8cqInofaxCHR7
         bqK+TOBL75QkHdWPoWXvx3FzJM8CDItxrJ48kDZq8sADTq9wm8DyLXrsT8hclhTDwKTf
         YhQmiDbrlGudSTFgVthVTWANthelZturGd5UChLbleybcxqbCO8YGPEo5D0tRZHjB2+t
         9557o01kS3cten1MJTxBTbuPougUp+LLCxWgEciyJ4KP3HfHQo6Kb29zVHsUzRE40mz9
         dKsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409614; x=1774014414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyRmy/cEJXIwo5hmY9vuraMz3s2ZHyDh9ljpBGyqXFM=;
        b=DcvadJC3XZeosMqlFU2qsKiQHFkG8Mm/TM0+jBa3SNuMeqk8X8I6SRdQ5DJBADHFOD
         clwMNdRngJkea6sDDDmtrg4BumqQOpNSn+SF8I2seNzSjLcz65iQC9O1jRbVxhS/Nzy9
         Hm6kiBnMqqh6j76K1qRNfLWW4/jahZ8k2ixAZuuUoaZQ/GNiEGF/FLe9DMqzvJavKmBd
         vryfK0idjPdK/do/edBuIyHLb3/LDwwHNNeAzySDJeTOgXLS0TdvTTMNU9tatoXxcfKi
         lqZEJHR5HO/zvtDLW6QcoVSN4q2roM21jjFVMpNruH/vXdy42bsZcIyfJ5B4Jn4VNuX1
         Ej4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409614; x=1774014414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IyRmy/cEJXIwo5hmY9vuraMz3s2ZHyDh9ljpBGyqXFM=;
        b=XeZSsyZOuGHUtXI4EAYh6/HzcX7wJUR/1cF97xd6Jh7OLU0yI/PFxGpTDeymcaGVU/
         eKAJ5vUUsQrFy0bQVJfss5w2wFsDmL+LayegKUKy/+SXFvCsb4gJHeF+RqBOCtJsOYu1
         9oo5q9vRyNyGqU9ZCWYzadsmdyTIK/YKI93Rmv2bsLktL1Dmp1TRpQYMkRPaVcKlebA7
         jXZ7dpg9NUm6HfGzJMe0r9RTTq5WKKgwQFGOFc4M15clCafIYii5gF3YPqQ+RaMi8DHw
         779nS9jVDhWaahf5pR0EaHHoYj6rXRFJQQDOdE02IK8o+HQzefmOG5QS1Oi4qmeZAXVQ
         47gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVja4TzjDwQ5kABz5j3TDkXvpkL662CX9by3IveDrVU8RAiQpKHE2Xf7wY2cvILo89nTSiDGI0/bkjoJs4N@vger.kernel.org
X-Gm-Message-State: AOJu0YygQ1YuEDn+INy+uK79yAcTZz0eOAXdg/rzcJ5opFVBepH5Uh9x
	rW5gciRuW//b2krigDZPkG6etbRVAGDeXttVyfQLfCOrSCr6ah37YURtgf6vtF5ip7yfLY1qvKg
	JGIudgUgvU1j9cR8GE1s4ZeSJHnAwrmGXVmzaMrIDPUeBC4L6/LG+mzawstoFOa+l3xWdNPBWXX
	OPEuKB7NmOsfNkoweRWm+fNtuYRL3kT7vesQe81tzDadk=
X-Gm-Gg: ATEYQzzqzt2VDLWcrd27DA64k0hdWBQ3q6A4MoCV+z91UTsukJwXTuwbcmXr9NyIIDh
	JkCjyMYIXf6KwL/Qd2wrryayT/83YuWpR5MjYYThX/7gqxRwuE6zaiKUOZc1SjVrnnn79TYzCOw
	oSLgve5pYDFHPKugp+lFvMhvSooPtsbSikpjVcBhxLIGAAdmmHlF/YiRx92XqaWqvzHHjRbpUL2
	JQtXp1aIly7E0kzWlNh3k91I61Bj//EhgopyYug
X-Received: by 2002:ad4:5ae9:0:b0:899:fb4e:47a0 with SMTP id 6a1803df08f44-89a81fe253amr49799936d6.60.1773409614596;
        Fri, 13 Mar 2026 06:46:54 -0700 (PDT)
X-Received: by 2002:ad4:5ae9:0:b0:899:fb4e:47a0 with SMTP id
 6a1803df08f44-89a81fe253amr49799686d6.60.1773409614181; Fri, 13 Mar 2026
 06:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306160006.1513177-1-loic.poulain@oss.qualcomm.com>
 <20260306160006.1513177-4-loic.poulain@oss.qualcomm.com> <0a31ea01-11c7-4470-a4f1-85e7f863d834@oss.qualcomm.com>
In-Reply-To: <0a31ea01-11c7-4470-a4f1-85e7f863d834@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 14:46:43 +0100
X-Gm-Features: AaiRm51CxSa5JrpSbZHhdSP-FHi-8E2DlWKlpkvOAHo9lXwMhvEJuU0SIRKNLdU
Message-ID: <CAFEp6-1KGXVcc7BDGnojxkojWfcQJS=yd9yj0H9oxAxTSph1UA@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: camss: vfe: Make PIX BPL alignment
 format-based on CAMSS_2290
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _yWSrnBUD9PD2IZr2uAw6pGKBi3tb00I
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b4154f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=UD6jFWV5_MqAamJTNaQA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwOSBTYWx0ZWRfX+0vGlhJlvJSM
 TwS65SPXEuQkVlgz/AHcT2EQvO2hcibNqIVWc5pfht/xNM8M3KdpSu8TgN/JxK0zJ/gtLruxgc7
 4CNjdW5g57za6aCf3uTpCcf1vCdz4z2oQazH6tsgKmLNpCrNZGVBjyruGgykyTfbEuN21kJlVZX
 9m9DyvyLzCP7IdCXgy4HuRa84oX9RSZDvLO8E4EEbu9tb1K/QFdBQ8oaadRTVM4Xr8bFc0tTzam
 8EMU0OMQxXbxlsw5tkpjMpVWhQxA0zxE5gCD1SFLHiH1+nj0JWS2Kq5cLgN+GhMD0UOzjb9GFk9
 twVYwYc5fM249xVW0EEvQalGMHWXi+iyWi56shiuMPdR07qldTHdgW1qlvR042eWoS7zJztvZAw
 zmYT3fTfzX406W8nA+Ifd6TTc4uCPaPDE08NQrRF0ElTrEkmGGxuxvDbSd2uDagNePubZbR2MNo
 F4Je1kITcgrSMMD1Wpg==
X-Proofpoint-ORIG-GUID: _yWSrnBUD9PD2IZr2uAw6pGKBi3tb00I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130109
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97521-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: D52A62845E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 9, 2026 at 12:12=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 3/6/26 5:00 PM, Loic Poulain wrote:
> > Split the VFE bytes-per-line (BPL) alignment logic into separate
> > helpers for RDI and PIX paths. RDI is usually aligned on RDI write
> > engine bus constraint such as 64-bit or 128-bit. But PIX engine
> > is usually (at least on platform I looked at) based on pixel format.
> >
> > On CAMSS_2290, PIX BPL alignment is set to 0 to indicate that the
> > alignment must be derived from the pixel format. This allows the
> > pipeline to use camss_format_get_bpl_alignment().
> >
> > For other platforms, retain the legacy PIX default (16 bytes), until
> > PIX is properly tested/enabled.
> >
> > A future improvement would be to remove platform-specific conditionals
> > from the VFE code and move the alignment requirements into the
> > per-platform VFE resource data.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/media/platform/qcom/camss/camss-vfe.c | 28 ++++++++++++++++---
> >  1 file changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/me=
dia/platform/qcom/camss/camss-vfe.c
> > index 9c7ad8aa4058..c174c7d706e2 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> > @@ -1996,7 +1996,7 @@ static const struct media_entity_operations vfe_m=
edia_ops =3D {
> >       .link_validate =3D v4l2_subdev_link_validate,
> >  };
> >
> > -static int vfe_bpl_align(struct vfe_device *vfe)
> > +static int vfe_bpl_align_rdi(struct vfe_device *vfe)
> >  {
> >       int ret =3D 8;
> >
> > @@ -2019,6 +2019,25 @@ static int vfe_bpl_align(struct vfe_device *vfe)
> >       return ret;
> >  }
> >
> > +static int vfe_bpl_align_pix(struct vfe_device *vfe)
> > +{
> > +     int ret =3D 16;
> > +
> > +     switch (vfe->camss->res->version) {
> > +     case CAMSS_2290:
> > +             /* The alignment/bpl depends solely on the pixel format a=
nd is
> > +              * computed dynamically in camss_format_get_bpl_alignment=
().
>
> The immediate question to ask is whether this will be the case for all
> other platforms, i.e. whether video->bpl_alignment will ever be nonzero
> in patch 3

I expect most modern platforms to rely on pixel=E2=80=91format based
constraints, so they would eventually also use bpl_alignment =3D 0.
However, for this first enabling, I prefer to stay conservative and
keep the legacy fixed value on platforms that haven=E2=80=99t been validate=
d
yet.

I would like to review the other platforms in the coming months to get
a clearer picture. Once that=E2=80=99s done, I=E2=80=99ll follow up with a =
change that
moves the alignment requirements into the per=E2=80=91platform resource dat=
a,
so we can eliminate the platform=E2=80=91specific conditionals from camss-v=
fe.

Regards,
Loic

