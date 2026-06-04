Return-Path: <linux-arm-msm+bounces-111084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E2ggNYbFIGob7wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:23:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE9463C0AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 02:23:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=anQOUATT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XsvT7v1N;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111084-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111084-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEE3B301F99E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 00:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36263200110;
	Thu,  4 Jun 2026 00:18:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1E81F09A5
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 00:18:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780532290; cv=pass; b=Rp6LnKLdYoymxeKRHcvHyCf1qXWQH2kpqm93G61ZUEuGSQaTj2V9yuB08D2MlzrSFni8zrDXpLUsP248BXe+V0oSE+K2xD7RSgjeKXnUF9Lbr/4KrXweGVjM3pE3G4SdzGg9c7dfNpH7ZI3NCNeDiT20sDUVT6IqhNtRKaFUa7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780532290; c=relaxed/simple;
	bh=Ap5/C6EYcAmS24Sqi4LrbI1m+sbWXPWi71vnz0mEiv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwsiRVWqZKUl8OaRP9zMm6EcJYVe8PdKr8eztKB+JJ6q+nnGD6V8K3hkUSYRJ8mGv8xMtgWtH0NrSHGEWaGHDQtGCAxpbaQdSqoiwnuwZhEJa6xgq44ghCCSzYgTWumrIDqYEL85E89gTZ94Ok9aG/k4Fyf10X2R8mCXqXKFgR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anQOUATT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XsvT7v1N; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653Iwsq51740442
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 00:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYFYc38r2qZwIQxvzB/fkxnK0uRpZc2lBvWrGqkrou0=; b=anQOUATTN0OPiy6o
	uN/gF6rlC4itvmMdtsyzby0zHUFK/c9v2TfgD1EEZlwPcLIgnc4uHXKwjKxW62JB
	m2kyVYiwN2JVfY82fDFgrmeK1JN/jN15BsRKF6+epHDjYTtHEHymETteI7pgIQ91
	5VEgpctPwtUb0/IDWgp6/HYMdZHbK+tqRAKhFOQN47e+XMzDwCRijZC850fe3eG/
	U7VLx6Nh6kBFsma+ONzUnpzA9+OwItMZKx2SVyVyoWM/FDxZyer7jLb3ScYVg06h
	0I5lOJ1dICZUZmcjNvtSCxX6KaQpf78wAZGpfBquJcIU0GIqEKPC9rE0Sb4S/9rv
	fDadfA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejdq7vjp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 00:18:06 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-43d197b99b8so317234fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 17:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780532286; cv=none;
        d=google.com; s=arc-20240605;
        b=GEgFg73qKvtUuekC4W3T1AqbEn3gNek5C9fPGXDalsWiPQiSq/NexwMc5Ng5KeCzR+
         sRiQncHNZQpQEvOXMD28njP3I/UNpp1GvH3rGCOFF1t+sf4tBAqKXczPmOoCVu1oPbnq
         zr6kZVSuobKx1t5z6BD2Z9rhHgWJj92SEkP5g0AZGjN02UU2rMnUxFLHxR8XO37vX/fY
         nncUjlVWHK6q5ye1v/lEvgtxemaDc8tvzla0d7E/0mWXFdqScA55CRBNBXYgb54BZPFu
         c9vCqP4XknYDkP3bkm1uFQKNDYPCSrsBChr5VW0gtsho3cIMADSfjI9ryebefyjXjwnB
         kHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aYFYc38r2qZwIQxvzB/fkxnK0uRpZc2lBvWrGqkrou0=;
        fh=umHNqOxckVd9fGqoeF0x5Tnp0vfNsorqF/IMpO1VDNk=;
        b=SrKPadSuGfMQUV5dLvO492bLh3FXvAbxyV2TPZSY+Lo/u3L2yXg9MSnBG7NmgN2TQK
         z6pcAuzGnktiqiQPl843WnECy7rHKCIf6TbwiH5yMZAiuUmN69WFysYqQGd8BVxlQmmd
         uojKcXcVJ+r2hJkSAA13+DVT+fGgMMbV5i8/ZgYOgKiPm9Kurqz8mjaVF19Wr9mSWohO
         CWs5RuguGXS55TLbBQ/WgnIKnM/vyEEVKhc9S44k4s9cwkneDFsRrF1HExTfzyW/Y4Sv
         IE3vBiq9lrwXA1wc1aZErDWFSOA+ouUS+Lcw/u+FpPt3KbXKW/ijAdHaEkDkvojD6nMD
         qngg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780532286; x=1781137086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYFYc38r2qZwIQxvzB/fkxnK0uRpZc2lBvWrGqkrou0=;
        b=XsvT7v1NhGxOnjhTPcw3m3sH5YL8CcwBCTRBOnwKkjD9zQmIDB+aYQsb99ZeaMcopq
         GV8F0rtWBvksFp1h0tPLqzKjrXgE99DzFYvN2cS5r42xAr2gf9hRTi4yqmD3A9KwQOKw
         2nOb953wv+znisUS5Q8W3hH+1V00md/3mRNoK0JjQNQ7KOxUKejRZsph1uN58rw6Y6Rw
         U4vLYZR5zB2RaNHhbfrayxnx2YmWskGI8W2QBFMbHYQMWa9mvk9w/Cy8c9aTRdihchwC
         V5uhDnm3D03X0F/F3B+HB+zAhWVt2Ic+WnxQIqiNfTwjvsvgR3l6enYsuscxJcqbz0iR
         APmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780532286; x=1781137086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aYFYc38r2qZwIQxvzB/fkxnK0uRpZc2lBvWrGqkrou0=;
        b=p0RuAolJFao8SVGp3gC5lRAxvsNcAH5UYSQrqdTPyl5Q41bQSaB70NX5UeFpNw6sWp
         zwCoLNZNei4Crg17+vOmRyDdnp/qXztcu+5IXJClXvzz6td/LKAGpYxdZomIN8GqRqhg
         ssddVIDzIHF48R2p9pUERpCnRgNdPVWfn2C35fdOyYJcJNystEJxUi5USGCRQCulz1Xn
         RIuh1hV90Qj10/+QPdtYni2z4Mn5FoI4h+654WhFuTmKsZ4RG4x9CDChDpTBpr/RDO9A
         ZPk3fdegO+yDhEokiVtfj3TT1zkgdXoHRHe4TV5k3QTFV5NQXaIzLpSk4+9PdyOBK4rD
         +4Sw==
X-Gm-Message-State: AOJu0YyCGwfwDouhbqNDtZqlsZD1Yu0DjFfiJOa+lJU+u+9G3LsDN57B
	FzGYVdxUud55FRn0hzMxpdp0xWbr8gv8AcCnSCXlHgjo+UBsYokuSfT50b31JaGBsMovacItxGs
	HMfGM74mhmum5ga26OAg48Il4wBmWZR1QbOr92gCvP5sJ90/kG+F8shtTaHYUscgo7Co3QImnzF
	T+z7NaR/vPG/cF3qNUw3Ze3qyLRA+H9zaVbVy8hv9zIaE=
X-Gm-Gg: Acq92OEx6uBUsYuw71RhOXZuqIih9tHZ2IOVo/QKxuyCOAkfplX4ojKj9GrSFyJsRAs
	oB+z0l7WOn2i2C8yWbcOm2dIbmcDX+QVsH/pjpMMFrKP1YGJSltNQr61UCmvdb4LdEswY77ad/9
	IFKiinVHcHKBm6goE5ohj2nkmT4D02fyINjywTudzAZr9292+j1yIrnCCtpaJKBNIf8HWh/4z15
	WJS4D5VWUlVeN7fTg==
X-Received: by 2002:a05:6871:6c12:b0:43d:1575:c27e with SMTP id 586e51a60fabf-440db59586bmr3818751fac.6.1780532286192;
        Wed, 03 Jun 2026 17:18:06 -0700 (PDT)
X-Received: by 2002:a05:6871:6c12:b0:43d:1575:c27e with SMTP id
 586e51a60fabf-440db59586bmr3818728fac.6.1780532285806; Wed, 03 Jun 2026
 17:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com> <7c33cf4d-4281-4e26-b1cf-fb6635b01b72@oss.qualcomm.com>
In-Reply-To: <7c33cf4d-4281-4e26-b1cf-fb6635b01b72@oss.qualcomm.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Thu, 4 Jun 2026 08:17:29 +0800
X-Gm-Features: AVHnY4Lwp_ALRhn2rUTfU-Gw5K0PDGTD7aLD8kz0n01YYshYrYHqyF1L2DmDom0
Message-ID: <CALC2J1OczZFBPFZMRK1mYew3E7YQKt1rM5ZcgSLkZLAqp=gKKQ@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAwMSBTYWx0ZWRfX3r/jUK/DNYHY
 L8BszTJ4ZYAUv1rW2vm3Mc2eaQfgog36tdgKUZwWyeEGI+lhVARbxtUnHQllVKs5VC2SJLWJOl7
 XK1E9Heq+3rYelssUoolHGXFWUPqhxnLl1IJTSEKWOLdbZZURsQiE0919a78nl7BzqfvEA+6Cqi
 AQU7c1xHHR2vtZJHeNMmhtKS73V7lQ7BUfiNyDGKbv+ZJcfhYU8Ivy02iW0rp74mAexza1unXwm
 G4rslHV0mVhBkfisSFKG0FQYOhPagg2+U8EMgYUKfvqteX/RHpmZnYYXkVO5jFlIc4JKPiP8/JH
 cWgxe3eIqnikE7vWnOdro8+RZGkaJdFYPSpWpEP5P/eBWex6/boXgRLNn+Mm8QmRuiCgjM4DfmO
 fo5VjtifWZtc/0GvSaH/s6FufSAEf7RX7Tjl2PpdkyJdZzok010S1ylUhXrRj2I5eXVOH8uaTYB
 1EcppOyzi/5D/4kWzWQ==
X-Proofpoint-ORIG-GUID: zOreI7SzfrJGqgzcO85y54pwDFY_nNgK
X-Proofpoint-GUID: zOreI7SzfrJGqgzcO85y54pwDFY_nNgK
X-Authority-Analysis: v=2.4 cv=ccniaHDM c=1 sm=1 tr=0 ts=6a20c43f cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=SEjN4l5unJ3OIN10KysA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040001
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111084-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3AE9463C0AD

On Wed, Jun 3, 2026 at 10:04=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 31-May-26 09:14, Qian Zhang wrote:
> > Add support for the QCNFA725B M.2 WiFi module (WCN6855-based) connected
> > to PCIe0 on the Arduino VENTUNO Q board. The following DT nodes are
> > required:
> >
> > - qcom,wcn6855-pmu: manages GPIO56 (wlan_en) through the
> >   pwrseq-qcom-wcn power sequencer, and exposes the WCN6855 internal
> >   LDO regulators consumed by the wifi@0 node.
> >
> > - rfkill-gpio: exposes GPIO54 to the rfkill subsystem for RF state
> >   management.
> >
> > - wifi@0: describes the WCN6855 endpoint on the PCI tree.
> >
> > Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +     rfkill-wlan {
> > +             compatible =3D "rfkill-gpio";
> > +             label =3D "wlan";
> > +             radio-type =3D "wlan";
> > +             shutdown-gpios =3D <&tlmm 54 GPIO_ACTIVE_HIGH>;
> > +
> > +             pinctrl-names =3D "default";
> > +             pinctrl-0 =3D <&wlrfkill_default_state>;
>
> property-n
> property-names
>
> in this order, please, everywhere
>
> [...]
>
> > +             vddio-supply    =3D <&vdc_3v3>;
>
> Just one space before the equal sign and one space after
>
> [...]
>
> > +             pci@1,0 {
>
> pcie@
>
> [...]
>
> > +     wlan_en_state: wlan-en-state {
> > +             pins =3D "gpio56";
> > +             function =3D "gpio";
> > +             output-low;
>
> The driver that you pass a reference to GPIO56 already controls
> the output state, drop output-low
>
> Konrad
Will fix all the issues.

Thanks,
Qian

