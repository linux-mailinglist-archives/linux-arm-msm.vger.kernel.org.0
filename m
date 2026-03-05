Return-Path: <linux-arm-msm+bounces-95667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJyyGnqfqWnyBAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 16:21:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0641421464E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 16:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33A433081F78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 15:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA27B3BED51;
	Thu,  5 Mar 2026 15:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGKuwQU6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaRy2lLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705FF3A5E7D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 15:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723807; cv=pass; b=q1GrtV62o/1TfvYskQfrReCGSZTixFXRcffL89Hvse+nE3c0pbkiil2MMOEh5vISmg53taiIAFYnn5ZQYEDWuCzC8aNH0AXs8bO6cpVRpF4D0d6KfiRiTobx6cBqGcIxjVpW43bqGGxQ0Y8rnQjKn+PPfmH0A/x4lFN/6vfb7rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723807; c=relaxed/simple;
	bh=crHb5t9mPgAi5vYjc7XDJchLr+niSnAlhOrnEM7Lf+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cC92Ib20qwM3E/TGgxzN+/caH0gqVodDEvrzdKix2Kud3i05+ydzqGaziK6dAyGUY0dVIfDNJ+BijeGMm2SQCbfkLuWHrp1T4cjvbCJZthglBW/6CkIm9ohHyzdp8Lt7b+ZNYaWOxlnjWKym1qJdwKXUfIBcnvo/VAIK24ypklU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGKuwQU6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaRy2lLb; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFxoD862393
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 15:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	crHb5t9mPgAi5vYjc7XDJchLr+niSnAlhOrnEM7Lf+k=; b=RGKuwQU6DOFKhp6l
	6dghomZ0tp/CLz+XHH/lmZ/E+RUEW9c41u3zq5L5M/UJCWXqo+3fowHrsxw7KQIx
	zkhT8/NZSMn6mDoSMgB0h++rk8qjUchFIYj7E/s0TD0iJYt2BWhFz0vviPQYCGwr
	FVCzPjtMyrensDOqAQ+8notrnBAzBgZdQyBIiYeUYKdcrktOzD7u3A/hsEDweZ9s
	8obb9y7POvg0xPzyLAYP5q25R5t3BVX9XheLlSX1c6IRncruWnBRXwr0y7RHoDde
	73ScNiMu2kWQVZftx96Jk25rkiSdnIuHcSEpSgfIOwo3ClZWC+2ZXqdeE4uZX3iD
	T6cPWQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wbrsj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 15:16:45 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-79868381229so158646207b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 07:16:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772723804; cv=none;
        d=google.com; s=arc-20240605;
        b=PqgYaZLE5Z8aK0s3mj5JT3XMXvJZ6+PhVho8beZk8HJ6iBi9NDGFqaQLKqcHSqg+1T
         UdotZrJnIHs5RpJjUSnvTdXL6dlUlamDlxfTZYHpmo6/wh0gjg1BWDL4ck7s3Mz5LbP6
         UjZT4baAfKF9VMe0oV97+woRH78qDBa5JBEuE6scHPJYOPf17FjU1cTQNk84N9jTUu3r
         7utCDVOUO2lmsIKWCV4nnmHqUgjIWhKRUZklAr2mAE4zSN/f9j9ZHeij+HSH6k7sqv1O
         26c4qPycWW7Ls7ywepiVot+AqwDsMkYGCWmkbfjme1noxC5abU3mRsMOc9vRTN8vdC9m
         wBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=crHb5t9mPgAi5vYjc7XDJchLr+niSnAlhOrnEM7Lf+k=;
        fh=m/w7dc+OhEWNe8JtAt7ha/coeckLAG3gvfT2GNAo31A=;
        b=UqdoMwNM9CksCOPXVO7QErmH5QLZlogDq3N3rD0fAcgInBZBM+zXZEUqnC2S83IcES
         IiT4ss06FWAI1nXKbZ3195SA2fsWEcj4L7EGr0ezPLq6wWq4gzNhGHjHPdnbo/6GvwjY
         2oUdyozd5BIYdeMoezSggASsDfhW0hVPGzebZfmRU8xL8GbMU/v2Y7zRYdRdIylepmgF
         L5LvShwUKpgstGD17zdode5y8vkGYW2dSEfZvomczdFHcbhw+8TJEyb19Znl3gqyHu72
         oi5Nn1rztWte9qo/3T6TKWajEu/UsJRXDwy/5T9PElhhFaz26kLITYOiU2bWPHDZFd0l
         iQtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772723804; x=1773328604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crHb5t9mPgAi5vYjc7XDJchLr+niSnAlhOrnEM7Lf+k=;
        b=AaRy2lLbi06WI/Vd7by9CK6+jv3iNGTtU95M51Y1ty6noRMLOQoLnOCWwisFXkl+WA
         VYB2jNwowOo2XBITOD1a5tk4qIVl/XDIWimCQAqdLi05q3K+m4blLvI0bjGr+tLU5uNR
         pP8OxSYyCRbajI8bDZsX8OdGeaDOtOSA5oxNABH+iwLCcyLr1fmu1Vg1WRNZkTOI9R37
         SxrXkwGDBT3kHGmdTxHFHaIRrAXhD91Z7BHteT1upKWvsBtPYON3T3idI/hFI0l2ByBn
         wkTmXBrQFIjz+Gl45WOuA5qM3tbwm68tXQm6HxMgmFM3AJE4z1BdS6eqezIlYmMrw1mH
         iHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772723804; x=1773328604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=crHb5t9mPgAi5vYjc7XDJchLr+niSnAlhOrnEM7Lf+k=;
        b=stZzrNW5KV9RnMHbrFF+Xc55hf+rGdNji7YRFeX/ymYC7G89D+ip/dDq/GliuY/xdd
         gbK8mPV2s/EGcdESQ28F1SsjtB1bMjaljbzkVLFpUmSMeql+ET1ahT5JpaXvrezm6zOx
         I6HCOtQk2rlkcB+vvGKh2QhBzR+oQ2uRK1IjiNbFFbDtsju7YaPOMXH4nyJneeL/ARmL
         ADWc1PK4RAVP/HHgtgxzzQb7gqFG5eB0Bmpfeh1Zp7pXqnuuNqE2YAG0WfBVrsyU0bht
         42vPGDr2WBe7EJEk0CEjiJiFkoxSNXuBKPV3iSjGcJxNf/TGagttZOob6hY9OzkdvWKO
         TQkg==
X-Forwarded-Encrypted: i=1; AJvYcCWDbGBD4d3xPEb/811U9kaTRlthLtKNqu4rTwj+B+mXv4/UWfOTVVErP5700Y0XO+JBkOAaquB3PY9IycP1@vger.kernel.org
X-Gm-Message-State: AOJu0YwTvWY/BTf+2E0YyapplHBRpn2rD8TVRtQTizM4eBrM/T6yM7bJ
	QNlBG0ajV6U1xRxeeElFhjL3eoecsivjQ2cRGRMpjBybP1hsJEjRydW1nqReWp3Uz34httarY8t
	ko7eTBkBDeP/ta3Fy6ca20Fa7vRW0HK2xLUqARCZx1bkufYRoIIJFwBSOCb69la4+IRyKMNS5m0
	cU6rQp9vzArBbseXY8s07FrK8I12C7M4G/Dlrv/DmibA4yJLKZLrw=
X-Gm-Gg: ATEYQzzUrB2DEBpm2vpqNLs5eciKr5JM4Vmil4dnCjLtm4D/UCEfV7+oWSHU3NnyE2v
	P7RIsgWNbXoc0VMn+wdoMAveb6372O5CHRkq+RJq3il3AyQIWfpv44CozYtIePsf/kJjInsydFl
	w8X0Hp0X5P7LnHxuXTArlk0+pxbYJCgaQqqSW7C9ZmnaUJ7zYoYl+6rdBgvybcPqYy99USayl46
	YV4kg6hpRvOAlREYQE0NnhCKLBgK4hyM5KYWLg=
X-Received: by 2002:a05:690e:1443:b0:649:4f58:5cd2 with SMTP id 956f58d0204a3-64d0703ee7fmr1901174d50.0.1772723804441;
        Thu, 05 Mar 2026 07:16:44 -0800 (PST)
X-Received: by 2002:a05:690e:1443:b0:649:4f58:5cd2 with SMTP id
 956f58d0204a3-64d0703ee7fmr1901121d50.0.1772723803824; Thu, 05 Mar 2026
 07:16:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305-cci-scl-stretch-v1-0-8412abc65745@amazon.com>
In-Reply-To: <20260305-cci-scl-stretch-v1-0-8412abc65745@amazon.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 16:16:31 +0100
X-Gm-Features: AaiRm53DAsBS99uru1n2DlZ8zMVjWH8FImgxyp0FBOXWU38dtecZYRBCGYS7V2Y
Message-ID: <CAFEp6-3ZuSOW4apj2Ww2DJ5_5Gw-CDXV_9Qc2=wW-JLP8Vbatg@mail.gmail.com>
Subject: Re: [PATCH 0/2] i2c: qcom-cci: Add DT property for SCL clock stretching
To: ckeitz@amazon.com
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: h3HMM5lepmAfBFMh8iXtyUjrua8a0gHz
X-Authority-Analysis: v=2.4 cv=BNK+bVQG c=1 sm=1 tr=0 ts=69a99e5d cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=S_SDiGbfBHtK8l1EkXUA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEyMiBTYWx0ZWRfX/JNfwZZtgAl5
 b87gqtglPuIPXE+JcH5i73pwEWdVf7ZgeWyBwk8E3W8GplqXHdCtFldYhdq8yn1WxJ00eYf85Du
 78/ukDLSV/7g8Xy5cTuaDad/0PNDYhJPzsR97qcXdMLsmlMm7BOU5MyXthLG6RKyYK1CPy64a7V
 tm91wTs8cZIgFs9WkxMF8vnGxw3IGYKZL2b3Ze8RjgOJuy2g39r9nTMjCCC7od/IVK0GoMazAfa
 yqaa0FUy6D3DupDqtYYJFlnawWNzhikaRNjP6js+BifeoGYmSpFfgBnJs8nhE2V9dEfN9sIBF9A
 V+Ghej37g1bxUR7Zc54LCsLhts7QOWasFhsuD3cWeFyyTCQuIgdMp5p5cgwub4naKrb1eaXAQYo
 3b1T8C13Ktt37cUAhyafQpxY3MgWZR8ZHhqFdxvAbsmwcfU32kelyXtqMJgzKZcSRuXEtbslW49
 GVcqS4XfH1psigfszEA==
X-Proofpoint-ORIG-GUID: h3HMM5lepmAfBFMh8iXtyUjrua8a0gHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050122
X-Rspamd-Queue-Id: 0641421464E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95667-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Action: no action

Hi Cory,

On Thu, Mar 5, 2026 at 3:40=E2=80=AFPM Cory Keitz via B4 Relay
<devnull+ckeitz.amazon.com@kernel.org> wrote:
>
> The Qualcomm CCI I2C controller has an SCL clock stretch enable bit in
> the MISC_CTL register. Currently the driver hardcodes this off in
> per-SoC hw_params tables, with no way to enable it from the device tree
> on a per-master basis.
>
> Clock stretching is required for GMSL configurations where the
> deserializer uses it to absorb the latency imposed by forwarding I2C
> transactions across the serial link. Without it, the CCI master exhibits
> intermittent transaction failure.
>
> This series adds a "qcom,scl-stretch-enable" boolean DT property to
> individual CCI i2c-bus sub-nodes. The property ORs with the existing
> hw_params default so it is purely additive and does not affect masters
> that do not set it.
>
> Tested on sa8775p using the qcom,sm8250-cci compatible string with two
> CCI buses connected to one max96724/max96717 GMSL2 pair each. Enabling
> this property eliminated intermittent NACK errors during serializer
> and/or deserializer probe.

I'm not convinced this kind of hardware behaviour belongs in
devicetree. As far as I understand, clock stretching is part of the
I2C specification, and slaves are allowed to use it whenever they need
additional time. Masters are therefore expected to tolerate
stretching. Given that, why not enable it unconditionally in the
driver? Is there any downside to doing so?

Regards,
Loic

