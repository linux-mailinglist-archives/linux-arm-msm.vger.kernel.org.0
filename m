Return-Path: <linux-arm-msm+bounces-110725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOydC1qAHmq/kAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:03:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1F629535
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 09:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0ADF43016B99
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 07:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4750A377560;
	Tue,  2 Jun 2026 07:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eA4cHd7U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aTuJr/FC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226B73769FE
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 07:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383821; cv=pass; b=Ad2PWyJtt43dn5ETZUJyDSFrypzxBpfxa8ZSqOVaaV+CP5OAuLxFylqyKDW/h0DjYFCqeJo2k5iSUFNPPfoJDVfDt86CBzwwOdF1HQKhVHfd8rr4xNWOA9ZcuHJAcTgTL/3kZRPQrkomgdQfP4u0RqBAgMdtxMzTmTa2Ji47v8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383821; c=relaxed/simple;
	bh=+kILeqQm2hVQiQIYetIGkenme74GNpC/a9aVrq/8B90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B98jKQ5hsHCBuWoydtBf0NTknZBcohvdZ5DhMidnFeplnduSvzOESTK3fxRhS+ZLcNkv6oGCHT+e4v83787YCm5Rxqg/0s1g1zyVUf+xcyGDTlASNbAowxgp0D0QCN+WHIasX4FB9t/qv0siRnhudlTa/2TW1eryT74J7H7S0yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eA4cHd7U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aTuJr/FC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526MdAS2767325
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 07:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x58y+WIsFfSXaraVm7M5xhpsDQGPTgMhuGLPbBdvVTs=; b=eA4cHd7U5OASwgIT
	N89QmPFsmElwlL599Ip3cSw1knlbej5tprw1+HY5XtEux5exjnH6+uxbEsVfvC1P
	x/qKNZpLxKr8O+5+lUzjjbivx9E/KhO68bISX9yp2JhdhqY5fDYvmaeD+1qgPU3/
	VAia/kT/3nGAB+sPDvTmUx+Sbpgj3QHBDnUBslAlxIZTd1Zwev3fiP4Z6H8QV3hW
	VgUAle7AYwN8olEk1OvUzRchX0f5TP6BgWRMzJxiop10/iXvjQjgVrb+WHGH6/wV
	i+pvHvYTuixEUt5/pMmvyA6PfSx3HQkp+WxmaQPLKgFxk1opHB6JDBMd+axaFwms
	I7R4eg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsus0572-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 07:03:39 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7e04b938a59so53578247b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 00:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780383818; cv=none;
        d=google.com; s=arc-20240605;
        b=CxekFMoIM3xttSZHsMmH37AWBYF7eXt+ZIKsGYoJuDBasJ1zBj4/E+QXWZLd3bCzXW
         hkuVy/I20Ck+UpEn6z7s+iFkMPIsCegJOYZGazPNmF5lljG+v1hNOqk7N0GBkdI0fmzT
         vkW6TMw4xZbshMVAv8Ca+Ug1HeYxVUC/dz849moSKOeMyj41DAGKq+UukvSITIHXGx2C
         407n9rG7J/vDKTyQExj5kyVl3hgtcwhLPB0bw8Uenc5fFZeq5suN6K3FUk8BGjafEoj3
         LeJZb4kBBlXwT19TWyDvfH1hi0wcx8UkUDph6zOkpKtUW7W6CDHZOZA/YVm+TDfRjBR9
         dkBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x58y+WIsFfSXaraVm7M5xhpsDQGPTgMhuGLPbBdvVTs=;
        fh=ch6ZhLoGN3Cxjwv69uhgPSMCLIxkqZjM6T9MtGco/BY=;
        b=UaBxumqdjuHWwOCAcZojJcVvD/d5p7Eeq3j5PsnqfAY44pTayw4gHcLsnOPiwfyW90
         7pZfzN7esiercRG3SgLVX0wiQXB6VA7g4yWcTohrijYXVZ43gt2pw1aRbG3mSUDap3Y+
         VGFs8jodymLz6lmw+OrY+LXZQv11cYMj6VyN6DDtUgY06/5ChiKG+JkI4/lBV6YSOOxv
         Hl7ubdQQrBLjicqNhjIp4mVKd320GGsHP6umgVbS7NMkp5ayhcwjJHEc75JwDX2tx7Vc
         woMKe6kWEcPEMdM16b8fb2+wvbD6P9B3FH9nSTsOAiq9BzKxXUy+Ji36lFHUvO3TwMMN
         FpKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780383818; x=1780988618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x58y+WIsFfSXaraVm7M5xhpsDQGPTgMhuGLPbBdvVTs=;
        b=aTuJr/FCB1quQXvpAMkORV0eY5dEQLXPGhWyA93/CsxDJ3J3cppgjZr4rLWan5ujjB
         IpoKg8V4ODh8dmicK87xFCNno9HYtAZM6chDaZZjNbeLhkHI2kxRgtzccvFOlcgNaYUM
         2UsHP58EERwWBxv2Gde39CI+/uYf38qz/YjlTW9qxI+fD2FY7ZEfBLyfEiOeVaZQDIZd
         pEiFY8vyY3H5eaMBjETzeYVpkVnTv+lK/YWAZKgNOwUgfaYAmFKo7KAigORJOXtjc33y
         thFa7FcoLEvuqwH2Z9nJTg9VaFV1hM7r6zqL12EjBRuF8G5G54xoJBvm/SOrPBxvcte1
         GwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383818; x=1780988618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x58y+WIsFfSXaraVm7M5xhpsDQGPTgMhuGLPbBdvVTs=;
        b=gvQ2dTp0ksvP+MmyVFtV+S+ZqngmrN96JJuqadUuTGqw/DoU4FCzu6LQzsnexih88+
         DhmOk8lWdLVDe++s3XT2iKF1xnwSFATP4EeXyGv/w5cSOA8n6AU3fGpk5rFq/fhVIYWX
         GFntNzV7NjV8VUHC5OtFqPVhLXvRjuKkKIpMOIHfr+h589BnwQHVnEziNk4CKcKg+qQA
         sv8ZhO+kjj4hWLCkStAQT35anP/HJcDWMqpsxXAHXYg9pX3DDb/bzh+OTyZORJMbg9xY
         i/F76bxQJ1pZJHclktFn7ORwTuo2n7Vftn+gAr7TB0OPGimW54511vqwMPf0HUAaxKBw
         Ntgw==
X-Gm-Message-State: AOJu0YwVCO+kyUd/+LuNX+08simiHcp3EWxnRDHSlsIpr76MgVLidBwE
	eWsXwEffHTXzKdpwYX07FNDM10y40mgStFQ7OGJKU6SJnmebkkIafla4t/OAc8+xcKCPJ7NlhpG
	S6b9yQ2zoWM9Ols//5jv+d1qRLzISIsGAnNLMsONvptm8vn5BXt61Q9S96VkXgNXd9TnUUmtr9+
	XHk6pak68T75GKnzo+fCexEb18yA6LEIe4fmKeiNQrzjw=
X-Gm-Gg: Acq92OFZ7tJULl/HNX4CC6RuEtxpYTfylrF1cPdX6za6BEF0shyanABsIq2nZeBP+fB
	T4s1ahJh6YEpoaMiuKAROt6Hr4FfLjl1UfXrRgFYBdDgT3HwV0AXOqOK4gVPUuznSJmSGlRW0+N
	1FuB6wKAbmuWpKTT7KBBerr3WvJh3Iy+pxAta9T3xpJ2WWPGhHuUYq7i/PY2OriQ2rsMSsCSl/t
	6YHMiJW2rFLrZxZuQ==
X-Received: by 2002:a05:690c:e4ea:b0:7e8:6a6a:dc0c with SMTP id 00721157ae682-7e86a896220mr21369227b3.20.1780383818482;
        Tue, 02 Jun 2026 00:03:38 -0700 (PDT)
X-Received: by 2002:a05:690c:e4ea:b0:7e8:6a6a:dc0c with SMTP id
 00721157ae682-7e86a896220mr21369037b3.20.1780383818056; Tue, 02 Jun 2026
 00:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531071409.3557734-1-qian.zhang@oss.qualcomm.com>
 <vvnecdwfbpzeuo2zjk7ajkfwaay7dexjncjuuhiu5ldqlp62wp@ybhqbzzj6x2f>
 <CALC2J1MXRygj9oRwEBsSPfhLjpRZi1T=_E14vkbOkGKKTCz7cQ@mail.gmail.com>
 <hrqzdro3s75sf4tfphmbzswiwquflrj2krm7e4bkohn3zd27rv@mra5xbg55qqa> <CALC2J1PLbuL3dpkL8jyhchREB1d1Pc0BLHzZCdEjgfitQahqNQ@mail.gmail.com>
In-Reply-To: <CALC2J1PLbuL3dpkL8jyhchREB1d1Pc0BLHzZCdEjgfitQahqNQ@mail.gmail.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 15:03:00 +0800
X-Gm-Features: AVHnY4IDDGYAQdn1NicpyYoUK3wWu1NEGtuqenWpKiOxg42RWbCbTkDtKAFYG4U
Message-ID: <CALC2J1O1RRcKMp-AJsKkAvYR-gmKYmr43fNbVDONe-PQbXB4OQ@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: monaco-arduino-monza: Add QCNFA725B
 WiFi support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: yFGGV_K-sucwbyp3ChvL2xZDenpjmgq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2MyBTYWx0ZWRfXw3A5nJj+CYeH
 GNE73+Yx1pCaIRoha3Tk6Z9VJZCrxifAnyVcvmXQ6NQTdBsYT58sW2jOEitC3hthOroUY9elnxj
 c+Eh5H1Del2tIlf+rzBGUDINRJVw/SGJAH3MWM3EzWnE9lEjS+Ud3xB6/on5xNxyw08L/GRvCQx
 FM1q1fgqCPrtAlYZ0ghAxdNjwk3t5CTOf2WjxL1YlIWAzSoyw4zmchOYnKo4vTgwX2xgmih6J3e
 LJDQpSyy28tEtWugVdC4xCEthTnNRvxVsPrqNjupjrZmgAk0PrnyH6HS9RNhG4PFMpGCQXU7RVf
 npOztsciYE/wMsXnj9ln5npe2ijd7egzUdwUip8c65Uxqz4kFFpbTgx8TB2W0mejYec29e9lMLA
 HmJ1TrOo2So87rGOqHRpA4yrFVPKQZdDNjIqX4rKflZfSwjs/OM3KwtZJuTVFznKJ4ZMylFUpV0
 ZnJy1gjmt/46XkREM1w==
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a1e804b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=wxse1RgU5JOuWK4XkC4A:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: yFGGV_K-sucwbyp3ChvL2xZDenpjmgq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020063
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110725-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D8C1F629535
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jun 2, 2026 at 11:32=E2=80=AFAM Qian Zhang <qian.zhang@oss.qualcomm=
.com> wrote:
>
> On Mon, Jun 1, 2026 at 8:39=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Jun 01, 2026 at 07:46:49PM +0800, Qian Zhang wrote:
> > > On Sun, May 31, 2026 at 5:09=E2=80=AFPM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Sun, May 31, 2026 at 12:44:09PM +0530, Qian Zhang wrote:
> >
> > > > > +
> > > > > +     wcn6855-pmu {
> > > > > +             compatible =3D "qcom,wcn6855-pmu";
> > > > > +
> > > > > +             pinctrl-names =3D "default";
> > > > > +             pinctrl-0 =3D <&wlan_en_state>;
> > > > > +
> > > > > +             wlan-enable-gpios =3D <&tlmm 56 GPIO_ACTIVE_HIGH>;
> > > >
> > > > No bt-enable-gpios?
> > > BT is enabled in node uart10
> > > https://lore.kernel.org/all/20260429103537.1282497-1-shuai.zhang@oss.=
qualcomm.com/
> >
> > The BT is powered on by this PMU. So, if you are adding PMU, it should
> > be used by the BT node too.
> >
> Will move bt_en from uart10 to here.
>
> Thanks,
> Qian
>
enable-gpios in uart10 is required by qcom,qca2066-bt.yaml
and cannot be removed to PMU.

Thanks,
Qian
> > > >
> > > > > +
> > > > > +             vddio-supply    =3D <&vdc_3v3>;
> > > >
> >
> > --
> > With best wishes
> > Dmitry

