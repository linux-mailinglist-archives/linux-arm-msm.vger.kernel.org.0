Return-Path: <linux-arm-msm+bounces-100714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFe8JAhBymky7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:23:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F33A358193
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 093F23006819
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73DA388365;
	Mon, 30 Mar 2026 09:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQT2422c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2jdik6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FA82C21EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862118; cv=pass; b=Gzo13rOSSiZ1pKaJ7gBtWAjk6AK0kiXiqYpHZHovyDVxI4hz/CtrlLLOH5qO7hJPkE3WwF7a0mG1WT29Z4I8qDPBA7GW/kuvBQ8bInkUQFbvQn3pWawZ6ityDFWF9IZxTYSA82aD+QuA7koiCceD6j/j4eKM3VhOXMn+WLESGEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862118; c=relaxed/simple;
	bh=7rNPnoojxWxF/a1Ookw2tnEXegVgxQ9N6tzbajUIwxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+xukvaoAGlnOYcDHdeI0vOcGX0yDE/Jm9W5EhNWPB94+O8ydR/pnu2MitmIhKYFmBR+32oXN4S6fIRbm3xIMC53sQG6gTpyb9zqIymVMiKflS0kafyHqlOwghGWTgIZl3KlOHh4ZOEgFcUU2Q0HT2UX4w8lXds8BsGdIeCP+Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQT2422c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2jdik6I; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U97tWV3864100
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RZcAczw4mSYr5/IjTiZhA/RGClywOCajTwoqIgAfomY=; b=PQT2422cS784PggO
	deiu/Rh8Z8Uy7lUng4uYxOtL2Bn/NDEWzLCmiKvN2ZzG1AcblUZq3+JPOnH3Fc2s
	zfP6NkflAo33ItMksfmcKC/CWKV/X3TvY8CItl/c2QrAw19siIGI52sT0TTAfPZN
	nmt7mJLo50SZQvS0Mikstnh3EXqDEQuGfp37kKpRTuFctVTUUARtUUYjeY4UZj6w
	K1Z2rz8lRyqT5TkZnuwUe+0lIyrfI7KiJo4YDSNQ4wRAbaGcBsVqG15MI2OV3j+k
	W5J+4Is55vuKmRmw/WaLCfnHreUv6tIP+CtlamUBj7Hvw5Qerj8w8BkUqoSZM6Dj
	8swbBw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64bm5ur7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:15:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cd4f56e89so108376196d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774862116; cv=none;
        d=google.com; s=arc-20240605;
        b=ZV7X3U+jajhc5BfLz8aE5srO/2iGozQvkyvvjIiXxkxVYZJAjxd1D+VFUcqMj8x9tR
         XkmJGobx9gYFDn9lVtbVnGvBrH5Bw5/rF0Kv4PhuWt+I2G9ogwYsHWcPHH/VKpxm68sq
         lVVjO616pxD2VkRo5ucPtJcSfeYxzdD4NEfreZyjYSxRrWnoDDOIBsUstsQKvNMg+/gi
         KGL8P1pF+yMunKOigIHdIS4X7VAMn1TX9ULyxaZPt+YrYef5sIMLJdSPPLZMJyLtngei
         oGApydqRD6GqPCsceV1T0QdvXqG19j7IrosTwJoHCexebjOXUjfSfBQCmEC+U4G3tf49
         AfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RZcAczw4mSYr5/IjTiZhA/RGClywOCajTwoqIgAfomY=;
        fh=gHbcZQp4gKGG4lbgHF4YeyYUlBOCCF+dq7bcoorLa18=;
        b=TweEe/x4XlEbZroOQzJC5uK9sjvqm31V1eDKcN00nDDDodEjNdK0faUPptQPOhEv3j
         dHjJOcnk/zT2ZPKc1CVK5bpnAu4pVZa81YQvG4NMaCAH6a8IQJMDq4mwu6z3RbZtlUae
         NrH94evimkTwIQrfkYtwr4IYUV0hNHJYz4wNI+zodBUHY2YEo0GNtheYXSHQtenucQ+d
         VwMBekl5zaek1kTSEjLY67FN/zTrlrtHWpniwMCwltrgaf/TwfTXMJBiZZRl73hK8d8c
         GTF75MCQN2pF7b0cqUvn5NG2k7PBZrHPJ5Mq5kxiRJCPKnuWbY7/6U+dkz7Ux7bD6kav
         9qxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774862116; x=1775466916; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZcAczw4mSYr5/IjTiZhA/RGClywOCajTwoqIgAfomY=;
        b=i2jdik6IoF+b8eOdw1NNhuGt6o5HpYVqcgQKWSET2OYGlV482ZsNT0lOs3wNsMgGu8
         U0jTFjP0pSsQjWrymxyJI/E6GOCXT7nbQNPK0PaTCeBM+6oiDrhVlMWyBOUZz1pJgPsS
         U/RfdC99dxqN05tdLXLz/q9iyJfKTr7CRyS+vOTgzsLfeAwfjjt+f7PnlEMqpCYWbTx8
         czTU+T+/u9uPzVh/j02vf6uP1NtzM9ZxJ7qaBwXfoBC9VelhUGL/OaYH7FhL7BE8tNSB
         il5F0kg4eeSCBEEVlGeJY1pjwzHwDgiFBnyg1nGvcnQ4IfTeVV7UG/s52wae28w4CaFN
         l79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862116; x=1775466916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RZcAczw4mSYr5/IjTiZhA/RGClywOCajTwoqIgAfomY=;
        b=j6eCWJi5feVrIaXQd0A/3364IrRC1nAhY5PCVdwDDT7lxzfqCUyTbfSLlSfmhdP3qv
         uzQvsEpCanbnxjTAsdu4YoiWitKgk4S3lb2JvtAqGREWIyllrgnkECLjGxYCEzgP486h
         NN/5Vhof3SCzgAd93MMwI8+kz9Yd/R+6n3GhPNy8lkFKpLdoj5BXu395QlZ37m/318EL
         MRRcyMZUUxx8oszy5G3WY/yDrsDt5RVOh7WJfRexmSDloCz8yCOJneiJvhO9qeAAMDr9
         jWLMSXZAppn/9X1cA8VprCugsK9JS3N5jby97cyt1D6SBe68VIu16w7+3ncosmmkZx9Q
         oGZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuphersVJz4Z1DCC0alWurxQoB0F/kzjOKDML/xCjVXF0x/CXdKyyfpso0DwyGqOf5EwFLWhD7Pour07xH@vger.kernel.org
X-Gm-Message-State: AOJu0YzthsDYUZMNMVHYoFPh4/RjWQ1XHYNmtOG5zS0kLp7nv44v/2wZ
	ZCM2f8T37faiuwNEXY0ofPIeigUTGahTRI6yzY8biDonNgJan43OnqSyTm5Cf1HJ4bFW/q7UJIL
	aDVWSWQhNIaKVKLDjs759gObwMCJKHcYYz6vB0aI/lBQHfh7nFoobvkTdU7GVdU0GoGPn1v90Cw
	WiuvrYAn2uNS/HrrazvcNFYMhMAaxBngRYHUS9MLn8ik4=
X-Gm-Gg: ATEYQzwJ9NGken/FxSNVM6SWRBcZfVXonEFaVpUYM/DkxDwLZ5/d+veJlKZiVv3BclD
	jl2B8yOk53PpwORF4vy/Ehc1JDzr7et5mYmvBPgMLA+kIeX98HTE/xb53Kep2bqz7u7NtV5ROnO
	kG/zNR72BZ4kG5qPDiE3C2YiMm1MJH4OfcqEcCZKjtf/tb/outKVZNW02VPFMmgBrTZ5+6i1INw
	6wawg9Q/FejDDMEBILoG/Vdv6ldnRU/DLZAbh8=
X-Received: by 2002:a05:6214:3d06:b0:899:e545:4f74 with SMTP id 6a1803df08f44-89ce8d589c5mr160420516d6.7.1774862115493;
        Mon, 30 Mar 2026 02:15:15 -0700 (PDT)
X-Received: by 2002:a05:6214:3d06:b0:899:e545:4f74 with SMTP id
 6a1803df08f44-89ce8d589c5mr160420196d6.7.1774862114956; Mon, 30 Mar 2026
 02:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313131750.187518-1-loic.poulain@oss.qualcomm.com>
 <20260313131750.187518-6-loic.poulain@oss.qualcomm.com> <1ad5f031-cfd5-4feb-9092-03214872509e@linaro.org>
In-Reply-To: <1ad5f031-cfd5-4feb-9092-03214872509e@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:15:04 +0200
X-Gm-Features: AQROBzDyey8U2MKyAIUh_CmhYPxWnQO5tr5TMwlA2Z-HObxSkDQj0cICwoNxBiU
Message-ID: <CAFEp6-36tMM+6javiitNZbcL_OQt_1TXguTszQT1ppfNO2eSEg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] media: qcom: camss: vfe-340: Support for PIX client
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: vladimir.zapolskiy@linaro.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mchehab@kernel.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: QwEEyO8v-fzaumnuqy-VBZ8CqfdB3yrc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MiBTYWx0ZWRfX+DvFcK+Fk8TB
 SGT7dKCa/za244eUgo27WBXHvFRdQki6/CIlcci9PBUXfSHS7iK2qYo1Xras9oTszYjVWfvYgVi
 n9DYuaB1pIVPx5VkFIEXmTPiep+ultOW21lvmPOuIRnIIMPpP+qctx0wqfj5XkcSrKPRX/VCgnr
 dIj5bqnw2QQe5djDqwfGJ+TmxiY9iSwJ3WQ2vIyUeOSOkmiUY+TI/Re7y7FkkZ8cP77rGHLxL5G
 TdMUbHZk9fsGzVujsVUgG3AHdOGcHYrAyO9e1+aY7C6oqNEpWMZk1O+0w59PsO0FH75AY59g2JR
 pxiQTg7guhl2yuVkA2MoOSeET2xzrHoR+UcN8q9d87fQ6BEfZjKFYr+v1BIVml/kioFeOnvuPEQ
 6S+yqCTXQwsveEbKX2X/f35o7p38g/SXAXNoXYNMBuh43nAZB+ekMhpHJ71OSUSuRCTKLlL7ulJ
 hAuVHF4tBpXx9v4RDZg==
X-Authority-Analysis: v=2.4 cv=eJAeTXp1 c=1 sm=1 tr=0 ts=69ca3f24 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=CHRV2P2cdv5__UWTDXYA:9 a=QEj_SxXEJzKJbFzb:21 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: QwEEyO8v-fzaumnuqy-VBZ8CqfdB3yrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300072
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100714-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 9F33A358193
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 12:48=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 13/03/2026 13:17, Loic Poulain wrote:
> > Add support for the vfe-340 PIX write engine, enabling frame capture
> > through the PIX video device (e.g. msm_vfe0_pix). The PIX path requires
> > a separate configuration flow from RDI, including cropping setup, line-
> > based write engine configuration, and the correct packer format based
> > on the input pixel format.
> >
> > In contrast to RDI, the PIX interface embeds a lightweight processing
> > engine we can use for cropping, configuring custom stride/alignment,
> > and, in the future, extracting frame statistics.
> >
> > The functionality has been validated on Arduino-Uno-Q with:
> > media-ctl -d /dev/media0 --reset
> > media-ctl -d /dev/media0 -l '"msm_csiphy0":1->"msm_csid0":0[1],"msm_csi=
d0":4->"msm_vfe0_pix":0[1]'
> > media-ctl -d /dev/media0 -V '"imx219 1-0010":0[fmt:SRGGB8_1X8/640x480 f=
ield:none]'
> > media-ctl -d /dev/media0 -V '"msm_csiphy0":0[fmt:SRGGB8_1X8/640x480 fie=
ld:none]'
> > media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB8_1X8/640x480 field=
:none]'
> > media-ctl -d /dev/media0 -V '"msm_vfe0_pix":0[fmt:SRGGB8_1X8/640x480 fi=
eld:none]'
> > yavta -B capture-mplane --capture=3D3 -n 3 -f SRGGB8 -s 640x480 /dev/vi=
deo3
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   .../media/platform/qcom/camss/camss-vfe-340.c | 85 ++++++++++++++++--=
-
> >   1 file changed, 75 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/driver=
s/media/platform/qcom/camss/camss-vfe-340.c
> > index d129b0d3a6ed..600c472534fb 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> > @@ -54,6 +54,7 @@
> >
> >   #define TFE_BUS_CLIENT_CFG(c)                               BUS_REG(0=
x200 + (c) * 0x100)
> >   #define             TFE_BUS_CLIENT_CFG_EN           BIT(0)
> > +#define              TFE_BUS_CLIENT_CFG_AUTORECOVER  BIT(4)
> >   #define             TFE_BUS_CLIENT_CFG_MODE_FRAME   BIT(16)
> >   #define TFE_BUS_IMAGE_ADDR(c)                               BUS_REG(0=
x204 + (c) * 0x100)
> >   #define TFE_BUS_FRAME_INCR(c)                               BUS_REG(0=
x208 + (c) * 0x100)
> > @@ -63,12 +64,23 @@
> >   #define TFE_BUS_IMAGE_CFG_2(c)                              BUS_REG(0=
x214 + (c) * 0x100)
> >   #define             TFE_BUS_IMAGE_CFG_2_DEFAULT     0xffff
> >   #define TFE_BUS_PACKER_CFG(c)                               BUS_REG(0=
x218 + (c) * 0x100)
> > +#define              TFE_BUS_PACKER_CFG_FMT_PLAIN8   0x1
> >   #define             TFE_BUS_PACKER_CFG_FMT_PLAIN64  0xa
> > +#define              TFE_BUS_PACKER_CFG_FMT_MIPI10   0xc
> > +#define              TFE_BUS_PACKER_CFG_FMT_MIPI12   0xd
> >   #define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)                      BUS_REG(0=
x230 + (c) * 0x100)
> >   #define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)                      BUS_REG(0=
x234 + (c) * 0x100)
> >   #define TFE_BUS_FRAMEDROP_CFG_0(c)                  BUS_REG(0x238 + (=
c) * 0x100)
> >   #define TFE_BUS_FRAMEDROP_CFG_1(c)                  BUS_REG(0x23c + (=
c) * 0x100)
> >
> > +#define PP_CROP_REG(a)                                       (0x2800 +=
 (a))
> > +#define TFE_PP_CROP_CFG                                      PP_CROP_R=
EG(0x60)
> > +#define              TFE_PP_CROP_CFG_EN      (BIT(0) | BIT(9))
> > +#define      TFE_PP_CROP_LINE_CFG                            PP_CROP_R=
EG(0x68)
> > +#define              TFE_PP_CROP_FIRST       GENMASK(29, 16)
> > +#define              TFE_PP_CROP_LAST        GENMASK(13, 0)
> > +#define      TFE_PP_CROP_PIX_CFG                             PP_CROP_R=
EG(0x6C)
> > +
> >   enum tfe_client {
> >       TFE_CLI_BAYER,
> >       TFE_CLI_IDEAL_RAW,
> > @@ -245,18 +257,72 @@ static void vfe_wm_update(struct vfe_device *vfe,=
 u8 wm, u32 addr,
> >       writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
> >   }
> >
> > +static u32 vfe_packer_format(struct vfe_device *vfe, u32 pixelformat)
> > +{
> > +     const struct camss_formats *fmt =3D vfe->res->formats_rdi;
> > +     int i;
> > +
> > +     for (i =3D 0; i < fmt->nformats; i++)
> > +             if (fmt->formats[i].pixelformat =3D=3D pixelformat)
> > +                     break;
> > +
> > +     if (i >=3D fmt->nformats)
> > +             return TFE_BUS_PACKER_CFG_FMT_PLAIN64;
> > +
> > +     switch (fmt->formats[i].mbus_bpp) {
> > +     case 8:
> > +             return TFE_BUS_PACKER_CFG_FMT_PLAIN8;
> > +     case 10:
> > +             return TFE_BUS_PACKER_CFG_FMT_MIPI10;
> > +     case 12:
> > +             return TFE_BUS_PACKER_CFG_FMT_MIPI12;
> > +     default:
> > +             dev_err(vfe->camss->dev, "VFE%u: Unsupported pixelformat"=
, vfe->id);
>
> This to me is wierd.
>
> If a bpp is wrong we should detect that fact well before writing a value
> to a register and we shouldn't proceed to write a wrong value anyway.
>
> If there is a real prospect to even have the bpp be something other than
> what we accept then that error should be trapped prior to wm_start() and
> the error thrown up the call stack in a meaningful way.

Yes, this is normally caught earlier during the video device format
checks, where unsupported formats are rejected. We should therefore
cover all supported formats here.

>
> > +     }
> > +
> > +     return TFE_BUS_PACKER_CFG_FMT_PLAIN64;
> > +}
> > +
> >   static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_li=
ne *line)
> >   {
> >       struct v4l2_pix_format_mplane *pix =3D &line->video_out.active_fm=
t.fmt.pix_mp;
> >       u32 stride =3D pix->plane_fmt[0].bytesperline;
> >       u8 client =3D tfe_wm_client_map[wm];
> > -
> > -     /* Configuration for plain RDI frames */
> > -     writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT, vfe->base + TFE_BUS_I=
MAGE_CFG_0(client));
> > -     writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client));
> > -     writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT, vfe->base + TFE_BUS_I=
MAGE_CFG_2(client));
> > -     writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_FRAME_IN=
CR(client));
> > -     writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64, vfe->base + TFE_BU=
S_PACKER_CFG(client));
> > +     u32 cfg =3D TFE_BUS_CLIENT_CFG_EN;
> > +
> > +     if (client =3D=3D TFE_CLI_BAYER) { /* PIX - Line based */
> > +             struct v4l2_rect *crop =3D &line->crop;
> > +
> > +             /* Cropping */
> > +             writel_relaxed(TFE_PP_CROP_CFG_EN, vfe->base + TFE_PP_CRO=
P_CFG);
> > +             writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->top) |
> > +                            FIELD_PREP(TFE_PP_CROP_LAST, crop->top + c=
rop->height - 1),
> > +                            vfe->base + TFE_PP_CROP_LINE_CFG);
> > +             writel_relaxed(FIELD_PREP(TFE_PP_CROP_FIRST, crop->left) =
|
> > +                            FIELD_PREP(TFE_PP_CROP_LAST, crop->left + =
crop->width - 1),
> > +                            vfe->base + TFE_PP_CROP_PIX_CFG);
> > +
> > +             /* Write Engine */
> > +             writel_relaxed(pix->width + (pix->height << 16),
> > +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client));
>
> Shouldn't this be width | height not with + height since you are
> shifting by a nibble.

This is equivalent here, as the width and height bit ranges do not overlap.
But yes, using a bitwise | would better express the intent of packing .

>
> > +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client=
));
> > +             writel_relaxed(stride, vfe->base + TFE_BUS_IMAGE_CFG_2(cl=
ient));
> > +             writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_=
FRAME_INCR(client));
> > +             writel_relaxed(vfe_packer_format(vfe, pix->pixelformat),
> > +                            vfe->base + TFE_BUS_PACKER_CFG(client));
> > +
> > +             cfg |=3D TFE_BUS_CLIENT_CFG_AUTORECOVER;
> > +     } else { /* RDI - Frame based */
> > +             writel_relaxed(TFE_BUS_IMAGE_CFG_0_DEFAULT,
> > +                            vfe->base + TFE_BUS_IMAGE_CFG_0(client));
> > +             writel_relaxed(0u, vfe->base + TFE_BUS_IMAGE_CFG_1(client=
));
> > +             writel_relaxed(TFE_BUS_IMAGE_CFG_2_DEFAULT,
> > +                            vfe->base + TFE_BUS_IMAGE_CFG_2(client));
> > +             writel_relaxed(stride * pix->height, vfe->base + TFE_BUS_=
FRAME_INCR(client));
> > +             writel_relaxed(TFE_BUS_PACKER_CFG_FMT_PLAIN64,
> > +                            vfe->base + TFE_BUS_PACKER_CFG(client));
> > +             cfg |=3D TFE_BUS_CLIENT_CFG_MODE_FRAME;
> > +     }
> >
> >       /* No dropped frames, one irq per frame */
> >       writel_relaxed(0, vfe->base + TFE_BUS_FRAMEDROP_CFG_0(client));
> > @@ -266,11 +332,10 @@ static void vfe_wm_start(struct vfe_device *vfe, =
u8 wm, struct vfe_line *line)
> >
> >       vfe_enable_irq(vfe);
> >
> > -     writel(TFE_BUS_CLIENT_CFG_EN | TFE_BUS_CLIENT_CFG_MODE_FRAME,
> > -            vfe->base + TFE_BUS_CLIENT_CFG(client));
> > +     writel(cfg, vfe->base + TFE_BUS_CLIENT_CFG(client));
> >
> >       dev_dbg(vfe->camss->dev, "VFE%u: Started client %u width %u heigh=
t %u stride %u\n",
> > -             vfe->id, client, pix->width, pix->height, client);
> > +             vfe->id, client, pix->width, pix->height, stride);
> >   }
> >
> >   static void vfe_wm_stop(struct vfe_device *vfe, u8 wm)
>

