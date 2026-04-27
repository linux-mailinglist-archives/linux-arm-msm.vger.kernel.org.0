Return-Path: <linux-arm-msm+bounces-104827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEnICZjC72mLFQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 22:10:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C3479B80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 22:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 838003011777
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A0E2DCF55;
	Mon, 27 Apr 2026 20:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NUwUd2Ck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h6oetvM+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382552DF153
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 20:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777320554; cv=pass; b=URctucn7G4XFatr5QxWuVjU6cXJWMERbfHzErkGb/QJIIoW52+sC/fTfmS3n+I2fzEDx/Yv7CzPAQvAlR1IWRB5kQQb9pEA/iOUC9e4j0QzAC7U0CUm3mRvO0hYVPmfbJkWAU2sEqYfj56fqe2WXqDjLMaVfKkwiGm8qGNcfkHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777320554; c=relaxed/simple;
	bh=zJf6itPcif0oS4I2opQ1ZeZHwhSjUSFKoJJMf+zZal4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgQJIj3dogfeeEpajL1TwEZhDalzxy2ZbvtdVgAX7nvvAMdV69u+Wcl/08jD67DllzjTdXzJ+GNo3S0um+n2EMKNoIK4mF1Zh54ugCVfoE0X7+hDduvNf+VKNyZHNiwWHDKhoyfvFnnlhTWsQ46tWNUOaLI2Qv7GUGEE8yIo3u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NUwUd2Ck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h6oetvM+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDUuJG2913900
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 20:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=; b=NUwUd2Ckcp6eQcr3
	wjTRb6FPXg5tcMtTN2yu8UL2bS2zGf/Em6YqtiyEnlJj6Yk2dGodyuNgS9UGpG+B
	LjWJugW+aBMwe0xaBWSIDK6tmE0menmih1aGaTk+sUHYEEcyXsM2ffIFPaB1koEx
	sc9eBnL1YYESQltWqWn7PK/SQB/4eRg1JKVUtTplcjikjZ+YUCOpmWV6ts618dpZ
	vwG5Woiwp46nGW5yd9HXXNrYo4pRalp3n9DrMpGse+s6MHswQJ3PhfqvlZqaZ2lF
	SvaDPXUGfjXZ4GTZtAU1C4LYoH+6bSkSIctobnRf3MyrG/MXXBT6/BO3hJy//ZQg
	TcMBxA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt26xk7yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 20:09:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a5f6110cadso253119716d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 13:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777320551; cv=none;
        d=google.com; s=arc-20240605;
        b=ZZyBJOucL7sQqe+EfyIrGmIkR3V+xoRfKc2Sg1w7FbkazuQHLslTYck1EAiaUvUuht
         fOz+UPkJO2xsCDFDIpLvIQROpgHSQ/Mj6EaB41jTIREepXGCSGMd7v/pz152/qChDs1i
         Grk4B+TocKh6+qBqB+F1q8DEW2QkJOwFfv/4W8a8aEna4laBh82urVBgZZv4IfpN8rQr
         469Vu3l2Y2oAP3nc6/H62j1sRvOzH3vdlKySJaQvdM+ctweF84Tkmlll5LoP7ZBdEoCv
         ZjUG663nzXo2Fc3eCN33LalHgyTMuh6Bgqufz1jTQ/BrNldFKoCfg4mRUIQfwcGbMhOV
         RqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=;
        fh=RwX4CHOqgPepn81Q9qKiBx3R5Sx/+tjdw+5r7Zwrvvw=;
        b=WNDG195H+bxL2yCmgRkkCU4dBlvfNsuksJPOBzGz23PUiCCv4VhbVUi6CwZIDpEwGy
         prBiHqlyL+IRuYZWheYzIn6szFjdJsARCQATl6nWt8I9xtpuNnOU0QxccragYnj8Aqbp
         ErJv5oGn9+yDJXH/jCj0m1CbOmh1U49ylqpD7LN+9I7BHvHJDHQPehxf5F/1xKDzZknG
         EV9I3b0/a5hk34O+aCASSUw37p2EETlRgTc5JFgZfeiFi9Dd5XtKg+0/VJxGn1viDCzQ
         791sEAHHQ/YNv9dE21Z+MKcOHo5ALa8juAstkSAYQJ+2iUBCVYOZUxg0L5M6jWyGahUm
         nHJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777320551; x=1777925351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=;
        b=h6oetvM+pp9+S/xwnBzKR1jBNK7mGsrYc6Q0nhBAptd80K68zcVo9VLIjf06ZSjQxk
         QsozJwDRg3jB2M6AHbPU7+BIRnyPaUwH2KISec4BIbHY4eMRGOiQUFtmLCSoV9/8ktzn
         4IKrwBP5LxnWtI3pXHwVsuniSqBoD0X05odQBUFVJNUns4Ksk/ICyJFpZJ2oqAbvVkwS
         bVdFUGAyz6wpp/fhWen2He7Fw1n8HiRrb1wDWIXHZKXZrS2iyNmsH1xea4JtJq/dZyz+
         PRRp8DhXFUzIhRxWKQX3/bf25scYX4587NolzEKHuzO71ehHdIpWrORUb8G6T7hP8Ho7
         fOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777320551; x=1777925351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2HnqUmhHcbUyD58GB7XPc0QpK+OT1yUlEKIPYYo7QQ=;
        b=hePpAc2F7eWUQZFzThNhNdWi5lRCjBklDMqYECGmD0cxZG+34R8sNGDxlOzrY3KITt
         wucsxNeufwGAo0+LgEZIfGF3aYjf2pBj/4XclIEevqowzDnEJRp7dFRMTMJlNdjOIvCY
         KbllRCLhU3ozsCsYKVocSlufSkaHeesVNP1L4DuZXYbHvH4c3vSNVsaJw5o2VqcUVUzx
         IOHPGZMs9XymHQWzZD7me1JaL8EA9ye6BycHELDA2SLBOvGiOv7DZOQzmgA2GOzlWYUM
         bvypJYutNk6w3kPairjii+/rTc1f0hMLHaZ7jXr721ROrrBS/2aBuTsj5BlKeEMqpe2Y
         ppYw==
X-Forwarded-Encrypted: i=1; AFNElJ8cVF7bljpQXPVD9YMo0UFoF6n+Bxh/FhRtsK2SvRuUZr+OGJcFU5vGDajEbYP9sa5yun7727X9BDeagNd2@vger.kernel.org
X-Gm-Message-State: AOJu0YxQCC7175qjOlDU4HyTHuoyNKHSn7+nyvhpdDEzb3Oedqtk4nm9
	iOi46xySXtN3DvpC3K2dGaAkfrN92l/hROEgoW24mGjoRSgWuq8yQI7oCzt/iLgr403iHqpGH6j
	MxVh9pctPLsd21KadI7+9YMThaQ6ym2Ywlx3vEF0u8Icw9Jb60PIVLseprv6otxZ6rJsSQSurC+
	UMlkQUu5p108gfa6nmf4qEvPGTex1Cjv/7lLJTiJ54qiQ=
X-Gm-Gg: AeBDiesFIwp/M7ljFKo9bgCCfybgC+gdn1Asyi1ujmo1tSL6/dScRmZjAmJIco7AvME
	BuWgL6wW3vXmWQmPHZGttcZXJq2BXlQdUa7X3eE4HZqEUOBaiHVwK55LKtNGwrU5XGDqTNCjOBh
	0qLIY77OwZFji991Ilvmd5Q6WR4YRKT4+nIhbgQaLdKmVmsVpAfeZISgzHr2q8mNNErRZdmED3m
	7r9GWkmq79SwyPCuun1Vowk5vN74kqhHQ+PkDjQApn83eQARJI=
X-Received: by 2002:ad4:5e8b:0:b0:8ac:b619:5ec3 with SMTP id 6a1803df08f44-8b3e31fca48mr5277876d6.50.1777320551047;
        Mon, 27 Apr 2026 13:09:11 -0700 (PDT)
X-Received: by 2002:ad4:5e8b:0:b0:8ac:b619:5ec3 with SMTP id
 6a1803df08f44-8b3e31fca48mr5277336d6.50.1777320550568; Mon, 27 Apr 2026
 13:09:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com> <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com>
In-Reply-To: <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 22:08:59 +0200
X-Gm-Features: AVHnY4KEu3qZJsaEgSW3oDVV1djoe7ePu-gt-mc0PBpeJhQ4prv1LHNjDVdgtGI
Message-ID: <CAFEp6-20MzQh55iJzyhn=htFZxN1yq9o+EJJAX0CWG3O6_KSyA@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration definition
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: VwlzsD4fYZBswlP3EBlJE_ZIOB-x95fX
X-Proofpoint-ORIG-GUID: VwlzsD4fYZBswlP3EBlJE_ZIOB-x95fX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIxNCBTYWx0ZWRfX638DAu3XpGrp
 ZnFp4Odo0wMhnS65xsESXvHpXrHeU6Ui7lJJRWrnCza4nXSFGQZ2xK69RXF32fq9Z0GJ7o+n6aN
 scExFhssw/yMpSNKk5YF7dey16Ao0hkytPQ/9BvNtJGNXxl6vfDf1XGA9+zTKnd7Zr7B7etCVHU
 s3SOJ0UPIcWSLfC/QV0n2J1Cu7E7P9e6f3QPSDfBU3vPWki3nW9HG01mh5TFxLZOgX1wZlAsska
 8fgfgrqiHFkJv6/SlT8SKdElxqgpgiRAEujhB1LKtm9FTxqBa8tHIYAuW4vnXoL0NpqAcMdLh/3
 jY/XhkwYNT+bX/RkF80UMiDhWfpZQ74ak54kNLhXeBV36emLYy08PckwYnZjG5a6kMabqx0oHLT
 KR2xsx+531HB6SKfpxcAUOlmvzl+up3HpUDjysed5MZjKA5BQ9xOsJlR+XUJ6buISpA2z9NK3eC
 iGD6hKxK0eV2i2OCEZQ==
X-Authority-Analysis: v=2.4 cv=FM8rAeos c=1 sm=1 tr=0 ts=69efc267 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=NNFLuuOXt9NZh06aAH4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270214
X-Rspamd-Queue-Id: 7F6C3479B80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104827-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, Apr 27, 2026 at 2:56=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/27/26 2:43 PM, Loic Poulain wrote:
> > Add the uapi header camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> [...]
>
>
> > +/**
> > + * struct camss_params_wb_gain - White Balance gains
> > + *
> > + * @header:   generic block header; @header.type =3D CAMSS_PARAMS_WB_G=
AIN
> > + * @g_gain:   green channel gain (15uQ10)
> > + * @b_gain:   blue channel gain (15uQ10)
> > + * @r_gain:   red channel gain (15uQ10)
> > + */
> > +struct camss_params_wb_gain {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 g_gain;
> > +     __u16 b_gain;
> > +     __u16 r_gain;
> > +     __u16 _pad;
> > +} __attribute__((aligned(8)));
>
> Should this be __le for all of the related types?

At the moment, this is purely a UAPI, the values are not dumped
directly to hardware as-is. Instead, each field is translated into one
or more register writes, with the appropriate math, masking and
shifting applied. Adding explicit endianness in the definition would
therefore require special handling on both user and kernel side
(to_le16, from_le16).

On the other side, there are scenarios, such as platforms that rely on
ICP (firmware-driven processing), where we may want to forward these
structures directly within an HFI packet to the ICP MCU. In that
context, explicitly defining the endianness could make some sense...

Regards,
Loic

