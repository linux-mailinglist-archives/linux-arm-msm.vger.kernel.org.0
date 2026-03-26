Return-Path: <linux-arm-msm+bounces-99986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEclMvGTxGnH0gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:03:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A7832E2C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 03:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4ED1300F517
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A173623183C;
	Thu, 26 Mar 2026 01:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="auSkxRpq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7U3HWVP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552A725785D
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774490281; cv=pass; b=CNGMsNQH6H8f1GDwT1sImqIP2tDXS2HCoe9DRgSBzZckMNIx6tvr63rylvRQATsvtR15Yi5UqS5uIUI3Plif12Y9Z/14+vbAp9mFzayF+buJYv+sSqTPBOd6dRhdi9zu/gz2wxycXbijz6FrEIm/lklTOziIwWuOTvbM5S0uoeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774490281; c=relaxed/simple;
	bh=JbtkIIFR+YMr+Upri8lorNb2yUQ00SoNqFhCBGANvU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSGmhs8z3QRTslzicTxCuOWTfCgWaOIqVP2BBhJ8lg82+7cgf7JJXGpnvS+UMdu45fnXbKSZrZPwX8B5T/gaE7xH0p9P5L75ARwMe5Q1ploL7pg3VqysVxxDtLtSQapI9fmELLK9lXgIU5Z+JGN3L2bGQ2YebbPlTznwMuTKWTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=auSkxRpq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7U3HWVP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKhKkk141404
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFvHN9/W5rsfnz1GRstFgWsxKugHwgU9kcq9OWvzcLo=; b=auSkxRpqVKKkkJ8a
	jZ0M41I2cndLgSVRDnnY2T7e1B33EL1O1zcFCGLx5WvpzuE9UdKg1Qs5EVDC6wrh
	X3WnPtFmALcigppiigq0VAfwqSGkOmpDGUb21dETe/h8drwArZXbjVW+YEBYkWBV
	9mO+S0YFMjI87hCvhNsEk7/mRxLYpJTtV3PbpfsqJuU0/2HS/PkUIrRv6JXhWoS2
	Gnjt0TeJUAUCaVdxh63VwZ9yfc4IBqLlIQtNQZjQq4bPbDs/1KyRyeYIqMm+zD8c
	irzIrhEF0p6F+yPXv1ZMVV0v1EwV1e1toJOsRw/yP5qiSYoj4FbxZD1QNCdgbWXz
	PJjshg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q090st6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:57:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b08025f240so5178785ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774490277; cv=none;
        d=google.com; s=arc-20240605;
        b=djIwHuh8j4FXc8/oYbZsylUMrXM8lWrnAapNORBd7UiTxSeC3/uP2V9SQSgsLhL5vr
         LGHBNrVfHM1KrW2u8SXUOxRCao5OeVOXsTNB0qr6teqiP66zMma1ILVUONPhlb2+7Xsl
         o+9UtjQM5T6x0JwW1sLGdC/2ZMkR4B9KTNWRYPjvnIPT/nsEHk/hHU6iRWy84tI7inTx
         t+6G5Lrb4RVJ8Ypjqz3XrDCDPjmLmtmyWnkVkqNg73NTqvkX7871h1fwJN0GTMfMTUzE
         v27kNG27eC5tJDHk8mHUyogwkufIubLhZz1jlN6m5x6tzRIqMPsPw0mCee05+eQhhWIs
         DOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFvHN9/W5rsfnz1GRstFgWsxKugHwgU9kcq9OWvzcLo=;
        fh=lvilo7beNiN4DdHbZK1yB2ORQc/znygBXdXa/DY/O0c=;
        b=BrSqdyWOrrfuxtb2rU/kwMjbgNLde681UO6XuHBvnkj6VLdioxIXNIBmLmtboxbDLi
         nDa1SjaxHJlm+4qnwVRL9TGmM1t4G9qslKhZdVV9n7+qp+xqHveEzPW66g7H+72Goqw6
         fPJO17usNRUyT2f5eggcMA0RisWFkgKe9N3pYTM1Rvf1bPcjlLC5D/2mXJ7eDVf23o/L
         /UvXgii/c70F6QmZga8IHKmXjVVBOc2KAse/CvDu3pt/hl9POYbEl/ANgTBQ2vgRe3dh
         Cl1lMvtRvV/DA3FABvHItiN5I2y02xHTeAkqaLB+nHDHD5VaI4L8NIgP3WnMi9WwMHoJ
         6Q8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774490277; x=1775095077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFvHN9/W5rsfnz1GRstFgWsxKugHwgU9kcq9OWvzcLo=;
        b=c7U3HWVPp4/acS5WaGR/l9a/PBQm0Zto5wfVJjD+/U8B/SLhy6+Wu9Uu7cs5WgIAHH
         Gebv+ZtvwQWAj0c/tQYoSKGwyoXTz+/S6B+yGsTiGHZEcg9R3wy9mktxycdGKGG/oMLY
         aKk9YMjtNXB59XARKXqqyKKj/CTcAYA5LqrOCUVCsX0NhfpBSyL/7gHk2hIndI9hKNgc
         TVHK48dZXlgzzzs/my8yrt0Ovl+75Up4jrmZJ2vXTkdECHIoMLcmMieljIYLTSYlJdrz
         ObgE/5vbo1p+v3Bzy5w7NKgx/J8MkwVvvKKsg2BFlQJOVKpeat2OCndL3afRi+grOOU/
         Q+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774490277; x=1775095077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hFvHN9/W5rsfnz1GRstFgWsxKugHwgU9kcq9OWvzcLo=;
        b=ZguKdcCrvi7HYG37gIgFA7CkLiZXqbFhDEYZZV/S6ROUZ27VbRWTW24e9o71HNhxds
         IHZxbcTLzlswzt9F1kQ1/NuTdgFwh1w+f9B1TvmMbyWsjsboRdy4fk+RQTlz9s2LZH3e
         j0zLMxNzxdUjEc8Qhh8Zbv5hsJ8u7AqpAuFLy6U4hBFN7jn4deEgqzbGwM56VqHhlNIB
         pb735fn2J+K+ovS8Eehlyrquitj5t1FdyV4y/kWwcwQFJBI/zasCwfpcfKZq6aydbO9r
         XcH52nQMjQNFh39YH4MHwaUcMdK5iz54krtQv463PJlvWHGBODsYhyuHk5iZ9ISxkT6d
         8F8A==
X-Forwarded-Encrypted: i=1; AJvYcCWBsKAbRPHvGsK7aO7E/NqNQc7/Ik7xG8vWNEChS0WSsBtZN6v9cDxbHMo+M/qrzn8l1faJf0RjlUy8er8W@vger.kernel.org
X-Gm-Message-State: AOJu0YxMzVcCX35XHxoNrxAjjGqEFdBd/tdBuwiffiqE42WnTvWXFIfD
	k1prVnmIgmCK8ggxvY/7Axx8F4ihzfVy/JtG4TEi0dG2VgCY/3hBNfECLjtfnV/U5XFQTM4aqD9
	161mkvQ07vH/Prw2Jl8UIDB8IhkEtfZjgCFvo0LWamA7WEXxTwmdzmV8fgRciRDDjrMsnaDc/Te
	26XrRTCfHHgIphuqAh6UNODlQ0TsQ4rxBoPNC4IpxHDgmSmXpJZjDHJw==
X-Gm-Gg: ATEYQzxIczJpobhHrYlLk5E5nNQPFEhyTq1Klt1XDTef0LQub/S17Db6jcpRQsuJKzx
	7b1qnLPhZyc+iNYgeR7toUmqARYzbVe9G8A4uN+512FtL71Ww44YVzumT7mYNsLj/JNcGD2MQaQ
	JKwrmBohXc2w5leTuhLaQMizZfMtAYFA/4kzhCooFK4RIluExxLHd6Mn5yvlVfIo1M3HwV+0GTu
	uaDd3ev/Gc3k9xU7EI3
X-Received: by 2002:a17:903:98c:b0:2ae:5a38:96bb with SMTP id d9443c01a7336-2b0a4d7f7c4mr93599975ad.2.1774490276701;
        Wed, 25 Mar 2026 18:57:56 -0700 (PDT)
X-Received: by 2002:a17:903:98c:b0:2ae:5a38:96bb with SMTP id
 d9443c01a7336-2b0a4d7f7c4mr93599595ad.2.1774490276134; Wed, 25 Mar 2026
 18:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324172916.804229-1-elson.serrao@oss.qualcomm.com>
 <20260324172916.804229-2-elson.serrao@oss.qualcomm.com> <CAO9ioeWxk_=HowH-FcEakL4EXFyAz=dyPwEpqSXPQfvmuvfPHg@mail.gmail.com>
 <fc406873-74bc-49f1-8be2-4b089d0c8010@oss.qualcomm.com>
In-Reply-To: <fc406873-74bc-49f1-8be2-4b089d0c8010@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 03:57:45 +0200
X-Gm-Features: AaiRm50FdCDzTOvo8QkNFmTIKdaOaiursnoEXNalpmkMZcve5JjJ4XHuXDMH14g
Message-ID: <CAO9ioeW7O+arR2VdAZboty_cAdtYm--ppMx9RT3nTQpJbTGccg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v2_1=2F1=5D_dt=2Dbindings=3A_connector=3A_Add_role?=
	=?UTF-8?Q?=E2=80=91switch_provider_phandle?=
To: Elson Serrao <elson.serrao@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c492a5 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=5KLPUuaC_9wA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=aCJT46a3uSuxuuHQp3YA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: USR13S6N8Apl5lghLZtpyR4QeAG0VQjO
X-Proofpoint-ORIG-GUID: USR13S6N8Apl5lghLZtpyR4QeAG0VQjO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAxMyBTYWx0ZWRfX4A52Aek6W2FC
 ZC2eF7qi/rX2VkED11AIxShVl9ECWVX2GHrifb1kR/z6GFBBZZaSVa4Eh/Rk6Hyfv6ONMABQPdN
 zx1s/7hPE96mVouVbVJ40EsNwTtDOpbGKctFGDWiK+dkhbYxGANqNyxWHOqDfGhp2yeICG5BtuF
 A3b2gCDnBDCuJnxDUY1xYI+J7TVqrD5ABIP4I/aLaY3ojyZ5CHO7kCok4KPt9haBkIZkglkNjhJ
 Yc360VjI10w4EaFrbIcTAhsFTPOdvhVDhxs0WDmFBBGxtYzis29yDZw93JMxL/BfhsHy4/KMaI6
 d2CsONOEyQEnY2WfuJfJrO1wu1BxYlog+cvNl5XONNrTZDe16kawb5LQKA9fH9zQgPZ9PkR5XBd
 Q1fK53/vl2djxzKZTT6fh2FYkNe38XBOSxoYPIw796xaItTNyuBvElPrJ2gUfJqFcLtF6Zm65RS
 GqWw14aB33vb0AL9/Aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260013
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99986-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 29A7832E2C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 at 03:49, Elson Serrao
<elson.serrao@oss.qualcomm.com> wrote:
>
>
>
> On 3/24/2026 10:57 AM, Dmitry Baryshkov wrote:
> > On Tue, 24 Mar 2026 at 19:29, Elson Serrao
> > <elson.serrao@oss.qualcomm.com> wrote:
> >>
> >> Add an optional consumer=E2=86=92provider phandle on USB connectors to=
 reference
> >> the USB role-switch provider when no direct graph link exists. The DRD
> >> controller remains the provider via its 'usb-role-switch' property.
> >>
> >> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> >> ---
> >>  .../devicetree/bindings/connector/usb-connector.yaml      | 8 +++++++=
+
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/connector/usb-connector=
.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> >> index 11e40d225b9f..ef8d3d26461b 100644
> >> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> >> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> >> @@ -95,6 +95,14 @@ properties:
> >>        - device
> >>        - dual
> >>
> >> +  usb-role-switch:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description:
> >> +      A phandle to the USB role-switch provider. The provider is typi=
cally
> >> +      a dual-role (DRD) USB controller node that declares the boolean
> >> +      'usb-role-switch' property. Use this when the connector is not
> >> +      directly linked to the provider in the OF graph.
> >
> > This kind of properties has already been discussed at least twice:
> > - First for referencing the DisplayPort controller from the AltMode
> > node (USB-C connector)
> > - Then for referencing the USB-C muxes / orientation switches when
> > there is an intermediate chip
> >
> > In both cases the agreement was to not add such out of band handle
> > references. The solution was on the software side, letting drivers for
> > the intermediate devices in the OF graph translate and resend
> > necessary events.
> >
> > Previously we didn't have such an issue for the usb-role-switch,
> > because there always have been a direct link between the USB connector
> > (be it gpio-usb-b-connector or usb-c-connector) and the USB controller
> > (implementing usb-role-switch). As with the EUD this is no longer a
> > case, my suggestion would be to follow prior art and let EUD receive,
> > interpret and resend usb-role-switch events.
> >
>
> In this topology, the EUD hardware spans more than one independent
> role-switch relationship, as a single EUD node is the direct neighbor of
> multiple connectors. This introduces additional considerations around
> role-switch discovery.
>
> One practical consideration if the EUD registers multiple role-switch
> instances is that fwnode_usb_role_switch_get() ( which relies on
> class_find_device_by_fwnode API), assumes a unique firmware node per
> role-switch instance. If multiple role-switch instances are registered
> against the same firmware node (the EUD fwnode), the lookup will return
> only the first registered instance, making it difficult for a connector t=
o
> reliably bind to its intended role-switch provider.
>
> Supporting multiple role-switch instances in this model would therefore
> require extending the lookup mechanism to allow additional disambiguation
> (for example, associating role-switch instances with connector context).
>
> I want to make sure I clearly understand the intended modeling and whethe=
r
> these USB role-switch framework implications are considered acceptable.

As far as I can see, you can register two usb-role-switches, one per
the EUD path. then the connector will still be able to discover
correct switch by following the chain from the connector. On the other
hand, the EUD driver can use fwnode_usb_role_switch_get() passing the
path's fwnode and find the next role-switch connected to the each of
the EUD ports / paths.

Here I am assuming that EUD device structured in a way like:

eud {
  compatible =3D "qcom,eud";

  path@0 {
    ports {
      port@0 {
        endpoint {
          remote-endpoint =3D <&usb_con_0_hs>;
        };
      };
      port@1 {
        endpoint {
          remote-endpoint =3D <&usb0_hs>;
        };
      };
    };
  };

  path@1 {
    ports {
      port@0 {
        endpoint {
          remote-endpoint =3D <&usb_con_1_hs>;
        };
      };
      port@1 {
        endpoint {
          remote-endpoint =3D <&usb1_hs>;
        };
      };
    };
  };

};

--=20
With best wishes
Dmitry

