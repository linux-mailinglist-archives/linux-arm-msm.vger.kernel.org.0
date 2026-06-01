Return-Path: <linux-arm-msm+bounces-110518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ0gA+k6HWoqWQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:55:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF2761B243
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 09:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE4B43029E70
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 07:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFCD382385;
	Mon,  1 Jun 2026 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0BJNmqp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XkzSUN9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FBB37F8BD
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300157; cv=pass; b=TikjpbpgDi6WN9yTomvCxvjxxqNw7MlTFHD3+kjJJDTXfP90FUcJVhXapSKkyzEhWsHarJ9USiw39PEfvIfnXb50fEK52W5ypW54LWdutPdbHfsZg+3jJriDcDvfMqi9bLE2AS38miO2Z42gYst2a26XffHpUGVVygo6GyV5i7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300157; c=relaxed/simple;
	bh=LUrmIVRCQgai3nGDdtAhNB+tmjEoGQhWGpRtMPHNxRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcghuyjSat0wMN0HyLfvwKNB682dQAvhY+55ylkgLMlOmcart94gaf1sxuDWz+S/S+NAnMH+3p1gVg/cbVskvfZSJHEcGlgldHr/WAx5lLoRbfz2DY6SU2lZ86kkaz86U0542XshuMC+JxHQ5PF1PvhgrvPBhBVJz6wZFGmVgos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0BJNmqp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XkzSUN9c; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6510THRA235321
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 07:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0BJA74IOCnwC3hi14hsJBDy3NuF4Dx0fKqgwTy9r94=; b=L0BJNmqpPPuQLU0C
	1ZXrhbT92DSaFTwrE97SdWBgTvCG54nrG74clU0AVgk+cXbtdGhc/wS3/JoAWLjb
	p/aVbFJmFDVcOb8BgDRLLcSFkrDptfotHq5mMR+oxjDg4EAhN1KPEcOUGd9JK+rl
	7oJKob5J8ub75Yn9Aolu4473K6HMDoAJd+YZ6VULDYNiMGy7CC75SA+xYlK9eLnf
	YQglJpN07I8uzqWlDjbxhJEPvZL6HWoYMo0J8U4Vm+x/VgkWadXvv8yrrpN/8X6l
	qpwTPo9qkZxdoax2qwdpC151g/E0+mWz9PCJEqEWDvu4JLnyMab/HswpZ6oe3sqA
	usmZWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efn8pq0ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 07:49:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-914d0204c67so1699470585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 00:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780300148; cv=none;
        d=google.com; s=arc-20240605;
        b=BfD7s3hXv6Mn6SOS1KrljJaQC+plvrlAVi7HLfFhmvc8Ej7Kk2j7cNtwfV38DC7m/P
         AIbZICJfTP0ynMXYLZIqui6nK3midzZ4JTYLVNLRoNUqDk+I/jn+t7JjlWzMHdmOBE1b
         fBb6CZwDAQtPP2RU40/1Oni7YXdcYDEeKTC0Q+OZBsDiphl8Efe1NiQxZttU6pflotza
         GvzqCHPv4q6my6e+JxjZe/IyRrObdUk3O2SqgMffYKweNMDei6U7/eVEymHU16pppZLm
         17WjPa3zPziqpzPSg6QlSdLbrRrjeDDh3Ve7iuHuZRUto/CbMnGzdL0Me0bNd+SXnKN8
         XXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H0BJA74IOCnwC3hi14hsJBDy3NuF4Dx0fKqgwTy9r94=;
        fh=XJ66Y2c60ZD2/8T9mAG4nA0J3tLHkn89EH7gmDgDHjk=;
        b=jAkbgAqu+gQhTIvnaOIJkUGviHMFRWnHN3nqzCL4c+m1mntkcJMuWJx1hddA03QFBv
         ASdKRjHzBC0W1SPeP3LYsObiEmeewlpHUKDas9zoauNtW7NMzuYSsSVRkh66w2yl019Z
         5N6/WCPuNdiXoqEjCRO37JFjtj0jzVqvkJwgu6KrZV+FiBGNX0vROzP1AJmEWLA3MdIL
         RaV/vq0GHa2UxBOC92Xoz3eZdI7b2xZfKR88PTWU2b1rRXOquGop6Yw6+8kEhZcxDOJQ
         djwjT3E2GQDnAPsSadrjyCoV7IugQh/HqNYmABNvHOjDscEqkYULVKloFbqGdlhZE4Ie
         uhiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780300148; x=1780904948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0BJA74IOCnwC3hi14hsJBDy3NuF4Dx0fKqgwTy9r94=;
        b=XkzSUN9cpIPDOOXMNhKSWNbNazLrwm6Pa1hqT/rCp0K8VIHZLR8JnT7CcFA0GfaYu0
         ATenlrDdiRj/REXqp0rCdwlGacpECzzRJ0Ke++ptyl/g/3WCykTKB+mxR0IZfZ369z0v
         +7ntqNIKkRomF1LJXCGuaLHegNYPS3WvGaOgKWScnnSQQblruPbGQqQQDsE/72DKL99X
         rRaLOoEQt3W62swlV5wfJk00nHNn5u5b8psb1GKDFF8uKWkguLplOMdCB4s5xLX9Iwcw
         TDRE9fBGtQnpXrZLv0fZ5r5oFxs3OFjOPWOHA8rlKrjq7uyItRFr0ZvI6q3napcJrE06
         q7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780300148; x=1780904948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H0BJA74IOCnwC3hi14hsJBDy3NuF4Dx0fKqgwTy9r94=;
        b=FKD0ByzY5QpBKC3i7FWYKLkxYk4WJ6JNqfyeDZhpBxQIJ0bcEK+uT9rTkZShJsWz9a
         RXRCOCrHO1bP3jfGOp2lnCOKV0JUUMtTLnJUXsD6ra9faXtxNkqmse/J7zKG+iK2Mdzt
         XElNAfX+vrB3wR5PR19i92QRHlhFWCI3ZD5ZSYuDT9eHHUGmfF7zTa7S+B39mtx8y3uS
         GuBZDx4QPg1+VvM30xNxuhiYpqe6z+NfHNIQrg/U/o1F1diH1LHl1OVsF9h23voA6l72
         EGkAi7q7inwwxY9HY9BIFgFuKW/UCbRMXDEKa+707ZYLf4e0Ixdss/tE7zx/Pwck8k1t
         C76A==
X-Forwarded-Encrypted: i=1; AFNElJ8N+EZPZQFGz94qr9J0OWlWP1bhtdPQa40ZabOKS8jY/GHuXZh3zqk87hDKCUO0VFla/dpswOMWUM+V7Evj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1dM8O69y00cYyR39k1CgD8XYqONz5CjazS4k+DWLrqAbYWUOQ
	igUkaD9IxlA7ZYwnXbae6JYv/mjk0+uTVMtWJIcm8yw5gzngjY09z1y7IbUuhu1VWQCIpHo98RV
	7+tVzHJtgcyZsGNNBXmLdr267q4UOYBwy9CzQcaErwbFBYj5ebGmhE2V+GPLjsbP0Ij0UvkulyN
	Anv0lcdl/ZtgVk95QQRgNAAcTc5a2rG+z+z9D8rNIEmuI=
X-Gm-Gg: Acq92OH3UMkuTI6KV01LNZg6nu4PfRx/99bVlv+VUISItxXuLaWKwsBMIeyvTikQn6I
	ymtAH803Q9x56K7VjkobND8gZVdC7Up0j4foZE4ppMEeCNS7tpXxzXyaLRdQPJLKlRYCF89YWPC
	f6PkmAsyJy9moartoZXS2BvzQda8/wkMz5y9cXtjuh37Q4KWBlV36CBTSWmQBvndwaQJJ2vEUmY
	YwC1t9gZqhUpFwg4D6WuM1ZMr0jwhS5ETFryVWnRD7PKjk2PA==
X-Received: by 2002:a05:620a:1a07:b0:8ef:3953:7ab with SMTP id af79cd13be357-9153d9f87b3mr1498805185a.40.1780300147964;
        Mon, 01 Jun 2026 00:49:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:8ef:3953:7ab with SMTP id
 af79cd13be357-9153d9f87b3mr1498802985a.40.1780300147537; Mon, 01 Jun 2026
 00:49:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260414185202.2714019-1-loic.poulain@oss.qualcomm.com>
 <20260414185202.2714019-6-loic.poulain@oss.qualcomm.com> <178022614455.4008.17510287169443435896.b4-reply@b4>
In-Reply-To: <178022614455.4008.17510287169443435896.b4-reply@b4>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 09:48:55 +0200
X-Gm-Features: AVHnY4L5Zjct11l3S55ZjZJGfzAKzT-8LUZBy5LkCwslYIcTWv_MNbeaNsKPTzc
Message-ID: <CAFEp6-3yvegofHqWTyY2ST_2moqgZ8R8i+soUJUfo_-D6yf9QA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] media: qcom: camss: vfe-340: Support for PIX client
To: bod@kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: A4QvEiEKbADmzPy1EjpNfM269KxsuxwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA3NyBTYWx0ZWRfX/itec3dNzFTb
 HsRMh0cumyy8sk2QV5SCxUKTsgfZqA/a1tmcMZCY5joVffscldK+TtRW997BBF4omFFuF1vpkV9
 DT3YK9GhSAETAE0860OrGQ9TNW5C1KeL9PNCQoE6y/mwZQNfeDpghMkGfDwzRl1vpUScUZ1yz6o
 +una2y4GRt0++djLqzbiPyguYykj1ZjK5tqWSWI8bELlqoFpioSmRLtcEl9JS4jOHl4TwnhvhyR
 o8IA+QvWmcHNRsjGA0txWkE2j/ixs48k/stHKA4hbajQqfh5YdJ2CoZFxYjC+fW9eUImmHbA9ru
 OsGpQ9QrR687ZYLLwKvADDdgTIaqW0/efv55FqwnjyA4/BcQoeYn8/tioSxnWZNXiosPiI127pI
 xJZBWlbv08ewGRZ2eOybdZlZaVKHC2d43S+caB9KRYdNCi3G6/z6QYqWV60JamGJ1wYkr1e29Aw
 pg4toNYu6p75ABiSl4g==
X-Authority-Analysis: v=2.4 cv=NvvhtcdJ c=1 sm=1 tr=0 ts=6a1d3974 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UjtGO2agh6-tWwxbbI4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: A4QvEiEKbADmzPy1EjpNfM269KxsuxwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010077
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-110518-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5BF2761B243
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bryan,

On Sun, May 31, 2026 at 1:15=E2=80=AFPM <bod@kernel.org> wrote:
>
> On 2026-04-14 20:52 +0200, Loic Poulain wrote:
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
> >  .../media/platform/qcom/camss/camss-vfe-340.c | 82 ++++++++++++++++---
> >  1 file changed, 72 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/driver=
s/media/platform/qcom/camss/camss-vfe-340.c
> > index d129b0d3a6ed..a01b78c805cd 100644
> > --- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
> > +++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
> > @@ -54,6 +54,7 @@
> >
> >  #define TFE_BUS_CLIENT_CFG(c)                                BUS_REG(0=
x200 + (c) * 0x100)
> >  #define              TFE_BUS_CLIENT_CFG_EN           BIT(0)
> > +#define              TFE_BUS_CLIENT_CFG_AUTORECOVER  BIT(4)
> >  #define              TFE_BUS_CLIENT_CFG_MODE_FRAME   BIT(16)
> >  #define TFE_BUS_IMAGE_ADDR(c)                                BUS_REG(0=
x204 + (c) * 0x100)
> >  #define TFE_BUS_FRAME_INCR(c)                                BUS_REG(0=
x208 + (c) * 0x100)
> > @@ -63,12 +64,23 @@
> >  #define TFE_BUS_IMAGE_CFG_2(c)                               BUS_REG(0=
x214 + (c) * 0x100)
> >  #define              TFE_BUS_IMAGE_CFG_2_DEFAULT     0xffff
> >  #define TFE_BUS_PACKER_CFG(c)                                BUS_REG(0=
x218 + (c) * 0x100)
> > +#define              TFE_BUS_PACKER_CFG_FMT_PLAIN8   0x1
> >  #define              TFE_BUS_PACKER_CFG_FMT_PLAIN64  0xa
> > +#define              TFE_BUS_PACKER_CFG_FMT_MIPI10   0xc
> > +#define              TFE_BUS_PACKER_CFG_FMT_MIPI12   0xd
> >  #define TFE_BUS_IRQ_SUBSAMPLE_CFG_0(c)                       BUS_REG(0=
x230 + (c) * 0x100)
> >  #define TFE_BUS_IRQ_SUBSAMPLE_CFG_1(c)                       BUS_REG(0=
x234 + (c) * 0x100)
> >  #define TFE_BUS_FRAMEDROP_CFG_0(c)                   BUS_REG(0x238 + (=
c) * 0x100)
> >  #define TFE_BUS_FRAMEDROP_CFG_1(c)                   BUS_REG(0x23c + (=
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
> >  enum tfe_client {
> >       TFE_CLI_BAYER,
> >       TFE_CLI_IDEAL_RAW,
> > @@ -245,18 +257,69 @@ static void vfe_wm_update(struct vfe_device *vfe,=
 u8 wm, u32 addr,
> >       writel_relaxed(addr, vfe->base + TFE_BUS_IMAGE_ADDR(client));
> >  }
> >
> > +static u32 vfe_packer_format(struct vfe_device *vfe, u32 pixelformat)
> > +{
> > +     const struct camss_formats *fmt =3D vfe->res->formats_rdi;
> > +     unsigned int bpp =3D 0;
> > +     int i;
> > +
> > +     for (i =3D 0; i < fmt->nformats; i++) {
> > +             if (fmt->formats[i].pixelformat =3D=3D pixelformat) {
> > +                     bpp =3D fmt->formats[i].mbus_bpp;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     switch (fmt->formats[i].mbus_bpp) {
>
> Do you mean to switch on bpp or mbus_bpp here ? bpp probably.
>
> ci flagged bpp was set but never used and now that I look at it it seems =
to
> me your intention is switch (bpp)
>
> Anyway please confirm and I can fix this up for you.

You're probably right, the bpp[0] might be a better representation of
our write engine constraints, well in our bayer case both are equal,
but if any one generalize this function at some point it would be
better to fix here/now, so yes thanks for fixing this.

Regards,
Loic

