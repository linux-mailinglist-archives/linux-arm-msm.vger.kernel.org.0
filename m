Return-Path: <linux-arm-msm+bounces-93705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNL+LmFonGmsFwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:46:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF7A17839A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E671303EF9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FBB1E515;
	Mon, 23 Feb 2026 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8qDC/dV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6mhYbDC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF7713D638
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858009; cv=pass; b=piix0OP9DuDnyBVQf8iBSV52y9kGj3qQfCKFuYP+hFK+3bMdZXbKse0mDX+lLafRdp+4jgkzympUnqN9cmLFf5Y5iXqDDx22x4xwkhD5hQVEpzhtelwF4nxdz7v0BXJ2MO5sunZbH3vFJ9NtqmXOQ8Xt+fFXMRtm1faU1SHvwrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858009; c=relaxed/simple;
	bh=qg91zdLq7qsLmamE1qtR+DobQ99+gMm3iZTp682hH+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRrqyAg+zhVgaYFfgprKCm46L2YFH4eC2o8wCm2TqszbyI9ufNEED1zeWj1QdiCR3Duuo2EYjxTTM8k9T3+Nu/0cgIejtyz9C0fhHgdsRjZWYeSY0jPFlcqPMq6gjjhPZrHGmMKqxFm+PE/l5qQmFgSkjJ08/1qzZMu8U0SjM2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8qDC/dV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6mhYbDC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9i8Xm1754162
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bKfHG8a6WOAKsVs6p8iftf0Vvn6XVQlGVDLYpN0CYfU=; b=H8qDC/dVtA1KcRcl
	/AGh0w8TtRwxUr+I2cPzMnySinbDrfxkXahOpOTXOQ9KdfnRYiZFqRBJbCLkum+F
	J8WD/m3EK0uTMr/9/xUSIE1i0LoRYE3oVbMy0636tvppUHF+NSx9VCvtHOvogGB9
	0y5lQhXKJ7mzNtVJDmbe1LAOEJ6c4Il0BpUZi8kCNccuasgIAzAyLj5KxWg1RftK
	rYuj4185J1nl7VNoawh5Id7gjU+DRm3DbMGpoY+CO8WHdtlTXEQIuL3DUntbnqIt
	epVymi0bN7AzQY+T7Ark3nfWNB1HL2RyR5PbO+7eU7T1IL19BfczjAZd9NjuIZVs
	mNmNIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5waw3q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:46:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89502dfd7b4so476236746d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:46:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771858006; cv=none;
        d=google.com; s=arc-20240605;
        b=fNQdBOmS8Y0u0Z7eQpvrTMR/FFgMkPjoZadr6y6Kb7/aT0SNaqQWi+0ZzwbvYZVmiv
         4AJd6nK6D5CvDFol3+lGZXT9z1VG1Nx3GA7K8uGIyOdUgbTcr7ejLCOqkBgQCllEhA1o
         KDyknyKedXHkhCeDX9XxsHOHdiJ+RvQCcKNUhM+5BSo1zbYE6u31292RZhPpNE0kDyXs
         nqoEOojkG2L4T9nkgOZ5a2meNJXFZQR7Fmnnw76EjVyLZolSjSfhiUpHmg7QuwNOfNwc
         paRLzhkZ90PWQzfxedSYEwf+aUVy3vs1EbXJx6jQzhD59h1DQOr3xO0XaWMLjyypNru+
         Bqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bKfHG8a6WOAKsVs6p8iftf0Vvn6XVQlGVDLYpN0CYfU=;
        fh=ePy7m3254FGRS31BuXjDQvMIC9xIzkuG4OLMjT9IkWg=;
        b=C2oS5O8ovSlUXLKRrYAoTVpovwUMB5UfpkYclWKnw0aBGXE3ZRdfFSVhm5IpqbHmH9
         yuSRRgFU14VVWEvmkCnk70bXnXdwUTxLSxzcF6PK8GA06Drvcy/cTjHQMggXXgwgjzVh
         9PSM9BA7Qk/2XH77T/GzE0VXzULafgKhQ/tecs+fvbyipPXV3en7PTAdFADsyvYoivhY
         KMaAh6569T2aYqPUsob+tFRiYPKxbn/8dz+70kt4WKwr4g58KvX1tgWUff+M+0r9pWwm
         FIwJHtWQTyjHsBdgePdr/ef6yOQnIgyIQP4stRV4pzfQNr/H0n7w3i4joajT2zlOh5O5
         nmIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771858006; x=1772462806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKfHG8a6WOAKsVs6p8iftf0Vvn6XVQlGVDLYpN0CYfU=;
        b=A6mhYbDCoTlDxQa/rl+xtIM7qKubxeNH7tn7cmE8MFQfwgQ4nqxj6PBlOgUqNf2Uy8
         zNklrCHaKfAxHAwCLIgIsEy0xGNt/EKQlM1ShsEFSrZ/c1RY51DQKfGZSWIQCL2ED1PS
         9DgUu/FMOT8wiJZA4NfxSz4vqTWx2lZaZQ+SlANgFS4QH02zyi25zohpZuVkphUCzZF+
         XBowGa88CD1iwMdeFXBWD/Ih4FNd2in0sS+btTbC+t4iGmTYI5TdNCwARHdE87KKDnTF
         KpQejpXZFAGWTw9zV58XoABsWvnTHA/hSByhPEeELUjjYw3frWD+DmZXkQTi0Cs5pbHU
         DiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771858006; x=1772462806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bKfHG8a6WOAKsVs6p8iftf0Vvn6XVQlGVDLYpN0CYfU=;
        b=YgBJzFJEEM4/xNqg+AyheZpoam0DjxmaC6EwMDtWjGxzmJ2ex5gd5R5N2rYL4Ddopd
         tRAFwHu1YVy00tfk4tPMvnYxgkxG4I/WOjyxhWJt72gHcrFoWFEJhfndfGfKpAo/UN7n
         qvT75PcFIyGTzIkZEQ+FaG/a0aT8zq+qIV6gAFXhJ1zb0EzA2jzsYtbjK5JsI2ZzXa2I
         U7+kdNtl0AQbQRfuq7TViDe/OdQd84WvmipWOcESN3wRcuFYrznzn9sOVmqEZpslrVk1
         wobsskR2K+ngvi4016C3XvpIK4SlLMs04UBRS2ubAKRmUIjMZ9XkBYK70kT3ilOhAyfr
         2XCw==
X-Forwarded-Encrypted: i=1; AJvYcCU+l80ZYnsK84oGNex0+zPSZb1zbKiXHANsMJRNxqqV2cjKjQyK9z47qAsVtWIOFZCkgZVhWRrp2Quc0Qpw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/R0vCqpbSVrH647CTwSBfyRQT4EN3bNWK/EJmhsEbyQr6TBxZ
	2G0s7RaIxxTb3233kTVwA/d3gHhdp+bvTJ0Ame1xosiCuxjzWD+sGgXNH+kIM6TAiyrWp4BBhxb
	WVzTVbykchdh0kpkuEg2bI0Oh1foTaN8Eus6MxoQWv+LdDpA/wyyfxFoS1dPv/tM+opjeV8PoQ9
	R5K+CfD/iIERMla7dcysqT4r3f1Ax/t2EAxvBEHjsxl5Y=
X-Gm-Gg: ATEYQzxMAMwnNvPqkIVZ04ZweiF7KlEN79x+kz0AHUrvSmL2lH3tPYZqqCs09VR+SYE
	EemyX4144DRk0GMZ7o5gkEB9OZVt7LSWMR6C1TBlI5A3G6R27i3xtUPUFWx5CVaIk9IKzTd9QYN
	UOqsyzWU87hIzP5U2iLlXikzGVK+IGuQCBFzL4AF07mEN3wZDqpvLrBUmWachDUkT+raJ3XiDUq
	UTFiAmILJHZQXoKuSjsB/KQxJJAo62TNK6mSBvN
X-Received: by 2002:a05:6214:e49:b0:888:57f3:ac07 with SMTP id 6a1803df08f44-89979d6301amr121873086d6.54.1771858005785;
        Mon, 23 Feb 2026 06:46:45 -0800 (PST)
X-Received: by 2002:a05:6214:e49:b0:888:57f3:ac07 with SMTP id
 6a1803df08f44-89979d6301amr121872686d6.54.1771858005320; Mon, 23 Feb 2026
 06:46:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-4-loic.poulain@oss.qualcomm.com> <01804171-a9f2-4509-afed-d222c5d06251@oss.qualcomm.com>
In-Reply-To: <01804171-a9f2-4509-afed-d222c5d06251@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 15:46:34 +0100
X-Gm-Features: AaiRm511JEkWulNdfOn2-5mzgw7Pi0Vh_ef8p_SR-hXHE1nYpmvPAZcMnEaxnzQ
Message-ID: <CAFEp6-0+RKYLJ9pGzP1f9rbHNFNG+cXhwCr+=fwDAghrbB5Bjg@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe-340: Support for PIX client
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c6856 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=YJuqGnECvhMJ3ga0x1wA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDEyNiBTYWx0ZWRfX+5Oo762wGcgd
 A/LbfbcECj8Po7H1jBCDtYWLKQqJURMIL4c2i4Bb2Uqoq9j0IttSGXNw7p7EN61Kuvn8PuIg09Z
 TxrBQsQoROEs6s5i/YTgTUogEPJMQZk64vE7bhV3nbQlDsqGHx/SNdRe8gf32iX+6A0nwhonRFy
 eobj0ilv6DcuIKRzuUOb+x+qmsG+VL101gZMGBTrlGBrQAxW32Th/hrnsE1TeZlUyKzLqTNjk/z
 vXHQMcdlTIdh7q33gkpR2VTNfm9xb+GJxmwwq9LW68jbDtWu4vvoAQ2RA5YMYhs+HsEejw+nk3D
 KAkLVTiAk6rvfkP73Y38tTq/uGA6o8TRIT/BgFqlzWrIhhn8reX2Zk6Rnjf+C1XdPqKG0+5LipR
 Svi/UccMHaTj8wkKmlsBAgxBDk2rahdZ74B+QClRUUrMyT3cIgE2mxPR/ER6HW608J3Gk1mdI0m
 7b1xeXFT1Y7c3xuBT/A==
X-Proofpoint-ORIG-GUID: 055IkyBWn3dXmAqB_ZoZ-2d4hV4ys2R8
X-Proofpoint-GUID: 055IkyBWn3dXmAqB_ZoZ-2d4hV4ys2R8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_03,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230126
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-93705-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7AF7A17839A
X-Rspamd-Action: no action

Hi Konrad,

On Thu, Feb 19, 2026 at 4:46=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/19/26 4:27 PM, Loic Poulain wrote:
> > Add support for VFE PIX write engine, allowing to capture frames
> > via the PIX video device (e.g. msm_vfe0_pix).
> >
> > Tested on Agatti/Arduino-Uno-Q with:
> > media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csi=
d0":4->"msm_vfe0_pix":0[1]'
> > media-ctl -d /dev/media0 -V '"imx219 2-0010":0[fmt:SRGGB10_1X10/640x480=
 field:none]'
> > media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB10_1X10/640x480 f=
ield:none]'
> > media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10_1X10/640x480 fie=
ld:none]'
> > media-ctl -d /dev/media0 -V '"msm_csid0":4[fmt:SRGGB10_1X10/640x480 fie=
ld:none]'
> > media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10_1X10/640x480=
 field:none]'
> > media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB10_1X10/640x480 =
field:none]'
> > yavta -B capture-mplane --capture=3D30 -n 3 -f SRGGB10P -s 640x480 /dev=
/video3
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +     if (client =3D=3D TFE_CLI_BAYER) { /* PIX */
> > +             writel_relaxed(pix->width + (pix->height << 16),
> > +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> > +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client=
));
> > +             writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(cl=
ient));
> > +             writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_=
FRAME_INCR(client));
> > +             writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
> > +                            vfe->base + TFE_BUS_PACKER_CFG(client));
> > +     } else { /* RDI */
> > +             writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
> > +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> > +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client=
));
>
> Were these default settings (prebumably "dont care" or "always max") vali=
d
> for RDI? Would the ones you set up for PIX work/make more sense indiscrim=
ately?

That's a good question, the configuration above is the typical setup
used for RDI paths, and it matches what other drivers generally do...
The RDI path traditionally uses very loose or =E2=80=9Cdon=E2=80=99t care=
=E2=80=9D format
settings, and simply 'raw' dumps everything between the CSI Frame
Start and Frame End packets as an opaque byte sequence.
On the PIX path, however, we expect at least some level of processing
(even minimal), such as cropping, plus later statistics... For that,
we need a 'description' of the frame format.

So theoretically we could describe the frame more precisely for RDI as
well, but that would diverge from what existing drivers typically do,
and the benefit is limited since RDI does not really consume most of
that information.
Also, I think we may end up dumping content that has no line
delimiters at all via RDI, such as sensor=E2=80=91generated metadata blocks
that don=E2=80=99t follow the usual LS/LE framing.

Regards,
Loic

