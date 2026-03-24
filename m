Return-Path: <linux-arm-msm+bounces-99703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LeMBCS7wmlilAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:26:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BC3318FB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 17:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C7E56310A551
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 16:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA973D7D84;
	Tue, 24 Mar 2026 16:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sf+1OD7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOvENNgn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C9C38BF7D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368997; cv=pass; b=LMat7K05++Kkdc6+kLOPHMzoWsXgM9R39JiLZiAj5om+TvMH/tuI38um9Hh3qQX3Aq2oBTAxSdftZeykkZpf/VohQljib67ZU90FsTC4/VZRJKq0WoudYfTeM2S0xunHmmJUWyEAicOJ3pNrET6+drMY9S/XFgpTzBm1sW6kOTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368997; c=relaxed/simple;
	bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4X89ElT1XZ9njLOFoPW8HqarvbsPD4Za0kFnO/v6F/lbPxcCdrl/ro6PQNr3ORr56Y3AVP/alTvNJrgwTAreGnUyLYUDR78z4hbizqi7BpqedQtjwPeUqEkP42KnHmBU5djI9grdwU3KDJXNYrzf1TIHd6lX87YdXNUzj6EFWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sf+1OD7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOvENNgn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ODX7n9146221
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=; b=Sf+1OD7d2Tp9RKS6
	F2xueAxJawlJ3sO3X96HAzDwTNMTARGUuzZTq5GhmyvvEh/F2rw0Go0t+c7IFCKn
	dThhlVH0MLxq6IuLTANDXEH95InmbIkg36BgtFCQ+HeDxTMPK92VZmdIiAI8NE/t
	VnbsGpmXaBAzlmZbQkySow6i1YSjr4gq3Pi9Z17kUqvSZw3sliCkh7f5LJdx78BD
	Xw7PuZZAl65UT3q4xy7Z3QPASW3QoMQ46VrKH1f185qU5tmfwq05cwAjy2mSBSnf
	Hx94FHHGaCKVyuD6Xu/o1PDKrsSEYiCyd59g9JUJk7PckbbNl5pIz/sn8fhW7oWQ
	rVRb4A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3ukm8nn6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 16:16:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c514077a6so354208856d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774368994; cv=none;
        d=google.com; s=arc-20240605;
        b=HiRDakAL6xkIZzpucFtjyXDEuf+QwNz/K6ElNB2B8a4YJqpSFpImRUjdP//bpc0ZBk
         wcZMV4H2XzqZOQfuOEh0bbvfQl625Y01B3v3hl13hzeLM6+rE/wirFtuEkj99ZFn19Sr
         JbCWoteqI8S/vn1kwymvMANaE7tjywzVKd0d+R3FmQzTF3F6XXVqSp59kkaUAiJOtsC+
         SLYy/reE7qC4w0ykKlQuU3DfSI6p7Bw9+JM/WzibC2gJZyDoUNvLM3y3bMaubrRqerYg
         oxgHh49tjJMj2MtK+kdGxMI6Hc/8AdyENkMbiWot6DFFRPKbYr6y2v+sBa4jUI+XC91b
         0B6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
        fh=J0NFOu86eNGInQsoBYW/1o2dAjUrr+LMsr6YNSPu3P0=;
        b=OccK+Osm4w8cOpoeYwsMj5NKjm4wRFWW9dn7jBju8k8DJOL2rJ1WWUICQEEVryUtN3
         dM9v+Yj2le/VuyCuQ5cRmlM8XyZ2ZrkUk1mF/dRY+UB6UgE58Mbme7it2RyvG42/GaHI
         9MB022sgYxRy86BmE3esYCMgb+g/iukHVGR2DpllmWt5HPUbe8IbaEAAfshHNHqMf80s
         FUmHDzFRbwcfxkii0GRdK1RjwJj1WPFFkxlnozKCU+nddtS2UMRes/6/6UXjUfsyKxVZ
         c14IBZ2uJ+PLTz9UKqqy0TcsWC0yjB9QpvnoOetBlSw1MZ38VHU48gkCAkuv3JHraDk+
         vAhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774368994; x=1774973794; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
        b=JOvENNgnwtqu5vHjno3XpcWfdwD0PehV5BMnnkzeo/AY6h4JSBiDP/RvybM5vx6XNm
         TPunbZjSykhKyrBAAmd8Fse4HNTbt4KuNLMy1p2BahH97reVLAuv1Vzmjz3Vh/+uXaqj
         4X7g2sX7rOvWlk4EizyUMdd6Nbj+Wa6uXQk2qfsCysad0WpGZYOaA24M4hrUufF8CqIN
         7tQHnJLl0jN/EepCajwn/LTO7Cqf8quIuVxEkx/5Eroeh8y8r9JyrOztaPn1JXa0ZhIW
         oM6jIwNr2fIdBYVGgyODKG/T1KPqrsM5k9prX29wK2FtKdjwvihwgQKg3EJv7n3HiqVi
         PbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774368994; x=1774973794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JsP316n/8TjiS5yGExa+SRGE8xTPwYsLqPECdqNVVqM=;
        b=WxS1E7xkC8KzNcElUKCDfMiqa1t05I+1Duj1aXs1nTdHPgqaiHuWnvGZf/3+AMVwGa
         k/shcZ9AYrft0ujAb5JLZQSN2tIG4UTwb8jB7CizGKbku2P6g8nIHS24w/9Q7/dv5hqN
         OwKW8nCXJXFXMaYvwd403TFHk14h/WVbxH1aZEvpHwO686b58+9LJs8opIrenbkLLts5
         wCD7kYzBm+yNXTQ3b0MYLLT5SLg1lojWBGiIFp8ZsNSMAVZhk4FzBxSwyYPieCs/VCHG
         c0It+sFDuHK84dvXQUvfeuIQWrft2gnoHDWcJTYym2yQWVKpwhF/QuMxVhMDr5NmmYAM
         Ejtw==
X-Forwarded-Encrypted: i=1; AJvYcCXxQ5FfAXZFcG3+ajB7Hip/t6YPO3IYogN8NjO+OrOENdgd/oPJeYmWf+4psDQyCZAZttkw0xv8tpNHxbIU@vger.kernel.org
X-Gm-Message-State: AOJu0YwZgKM1eBDOtyDxMAwA/Eumw9i1ZvvGIHP65dsewQkcxDt+mVfl
	1FtRyyeuDG5R86d3LZJHUUjngPYA2KpKYyT7opyDsd+MScLJPQthob/Ne/KrEmljcM1/x7nPx6M
	wI/VK7Kd6kSMmqX1gtp/W9e+4CFnMGGFbHx6x6uOJPc5LHz+LlBM9+wYPUqfAwtyZSkvjabdlOI
	rTi0/Mg8vAM0WyHi6edX6/R3c94FPGMK1vln0mvCTjOxEWIn+5VbvllA==
X-Gm-Gg: ATEYQzyA/V3wTcpj95/dVhRKLqAERxb1waaK68BWT+tnMh01a6DJTSWJ6aUcmX+i1Hn
	rguPnfe9RNMOkMBr99FH+CkNjh06YqXy8qfxg8hwXL28eUOQdSwpVbytWISqenWDAK68FXk5pDZ
	NiC/LzuJ7uOelM/3CXKZa+1OWSw1/ZRa+W5wyf5moJztv2k7QdvwGAfRaBls75YBPMW7ZRMg0jp
	QRJcqRUyooEekiQReeh4P4oViE8PHTBf5bS4rWhnBhQ8uH6/pOVnNQllu2ArYcUUxwc
X-Received: by 2002:a05:6214:2f87:b0:89c:5f6e:451a with SMTP id 6a1803df08f44-89cc4a557d0mr3475856d6.21.1774368993495;
        Tue, 24 Mar 2026 09:16:33 -0700 (PDT)
X-Received: by 2002:a05:6214:2f87:b0:89c:5f6e:451a with SMTP id
 6a1803df08f44-89cc4a557d0mr3475306d6.21.1774368992884; Tue, 24 Mar 2026
 09:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xy6TKmdveRx4cMshSHEUGZ7s3lbsurWcsc2vq05A7_N4bCialR7EelZitouugtZDkpFCAghjqY4NDdSQEIPprw==@protonmail.internalid>
 <20260323125824.211615-1-loic.poulain@oss.qualcomm.com> <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
In-Reply-To: <055a7281-3e41-4e26-a8c8-5e28d69c0685@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 17:16:21 +0100
X-Gm-Features: AaiRm50CfCX5e406-SjUGjRvLfpq6TLF4DIoGNMk1PfpOJxIRVlPfNKIXGSI09k
Message-ID: <CAFEp6-2NniQquVrw_V8P_cyUayMMY0SPC8hgczjB3ef5zx7e5A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing
 Engine support
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NLjYOk6g c=1 sm=1 tr=0 ts=69c2b8e2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=MBiyE5VTy_gmSsX4nV0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: RYVs_uG1dIvC12mW3-Bmst_21gKzOolC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyNiBTYWx0ZWRfX2UhjxQCat1pt
 4Fsqa8f7wfTS03oudhd6C2xtJOdRt//t9wHjSSpdCR12V4wzrNSENr72Ui+J+MdP/cfDVt9E5rB
 ayPeegdxwrsKSxt2/9I2dd0zkYw/a8x6vWraui6EZrLROtFpab9XQsZ5J+oTgCeJXkOlGeoWj16
 swiNgLnwG5IusV5EAvh3eBULBhzLqREaMEbzazC01Wrn7KHUOULDSWCzpE5v8As2NFwOPDOBLbD
 yA2SmxOtoxbHllnmJiuVDfzVH99C0qAlY6bfpWu6DX6NuexhlljC3V7gdrKSUTqKWMX6BHXeDiC
 BmjShNuINjHHkIIOuXINNYiFnpJcY9qFTKYjHwcmIMJhvSfpNj/zYWLH2Ltfz0KeogJFfxDbRmu
 qNjV7K8AVt6Nd1yjzlJfb62/j9sYbSskegLtYWSP/1neK47Rf8/tDvXO3UK39RZDixDJj3cXhx9
 LhJ/JI6+qOH0fPsV/5A==
X-Proofpoint-GUID: RYVs_uG1dIvC12mW3-Bmst_21gKzOolC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99703-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 77BC3318FB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 1:54=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 23/03/2026 12:58, Loic Poulain wrote:
> > This first version is intentionally minimalistic. It provides a working
> > configuration using a fixed set of static processing parameters, mainly
> > to achieve correct and good-quality debayering.
>
> You need the other 50% of the kernel side - the generation of bayer
> statistics in the IFE, as well as generation of parameters to feed back
> into the OPE - which requires a user-space implementation too, so a lot
> of work there too.
>
> I'd also say when we have an ICP we should be using it via the HFI
> protocol, thus burying all of the IPE/OPE BPS and CDM complexity in the
> firmware.
>
> Understood Agatti has no ICP so you're limited to direct OPE/IFE
> register access here. For HFI capable platforms - the majority - HFI is
> the way to go.

Fully agree, this is exactly the point where we should sync and work
together on a proper solution.

As a follow=E2=80=91up to this RFC, I already have several ongoing pieces t=
hat
aim to generalize the CAMSS ISP support, and I=E2=80=99d very much like to
discuss them with you:

- camss-isp-m2m: Generic M2M scheduling framework handling job dispatch
based on buffer readiness and enabled endpoints (frame input, output,
statistics, parameters).

- camss-isp-pipeline: Helper layer to construct complex media/ISP graphs
from a structural description (endpoints, links, etc.).

- camss-isp-params: Generic helper for handling ISP parameter buffers
(using v4l2-isp-params).

- camss-isp-stats: Generic helper framework for CAMSS statistics devices.

- camss-(isp-)ope: OPE=E2=80=91specific logic only (register configuration,=
 IRQ
handling, parameter=E2=80=91to=E2=80=91register translation).

This approach should significantly reduce the amount of
platform=E2=80=91specific code required for future ISP blocks. It should al=
so
allow you to integrate a camss-isp-hamoa (or similar) backend, or even
a camss-isp-hfi implementation for the M2M functions, without
duplicating the infrastructure.

So yes, let=E2=80=99s sync and agree on a shared/open development model and=
 an
overall direction, possibly even a common tree, to ensure we stay
aligned and can collaborate effectively.

>
> I'll publish an RFC for Hamoa for that soonish so we can make sure both
> coexist.

Ack.

Regards,
Loic

