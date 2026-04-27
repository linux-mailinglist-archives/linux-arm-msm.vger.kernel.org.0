Return-Path: <linux-arm-msm+bounces-104833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGRgLrHO72mBGQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:01:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B2647A744
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 23:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DC400300E16F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 21:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214683AA4E2;
	Mon, 27 Apr 2026 21:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cp/1dL52";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSvSZ3W7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E9E3A6F03
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777323695; cv=pass; b=lxaCrUp0xPvnrflyd0oMNanVLf0jOm9WM/fNV4lfl8SwnRcR2aMCUlgHOzs38Drzf2d5dbgANXAtBohOTh77mmse4LRHR2LWomXO6Gl1caTu0c73R9CaTCDdybZWHoaBmuiH1TAoL+/27IhoQwvswJHQoiQH/pswGf9z10/8H00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777323695; c=relaxed/simple;
	bh=+C4GOpYhh4aS7P7JVT1CRxfrSUiV6hkVbjF9PaKWQQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dSim68S0TTIa5GGndhsn0bkq1O1Dy2SUMEsgeibzqeft5F8PGH0uGgUoA7w1Lu1ge/j9G+EPOgD/cJ0oa2gtRreMpF0Gb9pV7BHfhygQS11rLruLxagALrFpPPZApiNOlZjxeO7X2ONLBqbV8MRc0hzzNwlcQ+JH9vzXXXSWnP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cp/1dL52; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSvSZ3W7; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RJ52dk2006990
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=; b=cp/1dL52K20USnHG
	xbiP+49+kQ33kx6K6NX65lnRHBunBRp6nvDF4IjzIJx/T8bJSXbPJgXh2SKonvI5
	yhXCkl+uOR6RvyIABH1bBk32CkE3iVKN0r2FsgHJ7eycpvuBUFzxeYPmHlrdlvBK
	A+95SBHUAnlqulwA5/pwGrRpjodDriQNbLjGx6wH4H6MoTibeiTZs3zBzFRdIxnh
	6TjGOEMw3XMw7/7NrgE2AXlHQdweqFYd6/JwJ5qqB6/cQXcFVgOp80Et1OT9qQGZ
	HvZYackOvIzvuCvMlkFeOu9Zs2JaEK19uOYS3HxMmtdnAEE299tQQC3rHtltZrpL
	lUMZ6Q==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkj047-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 21:01:32 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7dbb6b95836so20916534a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777323692; cv=none;
        d=google.com; s=arc-20240605;
        b=V4hv8MDu2fVYMM/IMYJobWRxLg2QLEuQcLqCDKWwjpPdDo2xqsm/8VDM3P2dH9mZJ8
         L2RYFCh8yOUn//f8IbThGXinRx5OETD/ZniXRq8/a5FwANkkCz2LA1Hc0AWoCQPQyERE
         TOdH6Bx1KrYjyB39nmhs75i5lRMQW2UWZu4FcK+W2XPAOknA8WypJ6nPHd0uDulZdDfS
         49rIif6ebhROjJ+ZdLGLCYZNWPlSVdHtXKoUM1GYf2nM7WlICh/7wxhC8ymw0hX+DWKE
         wJ6859LSsZ5WVxF9prYYtKRDDgGjXRSpII5QVg7vMKIwDgpCc3BG3/4JbkrhMtK+Tlai
         bRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=;
        fh=s/558OODA0oXySBboaAnLdWvciJz+TGAWN56OTrmmoE=;
        b=WEQhneaQOldo0OS6rKdlrEqGVmH0cKeRSEIrwgZ3Cq//qarN76xbtTHFkgOwxth9Co
         kP+F5Qd3YK/sGUR+R4geY6BlEqBa29xtHf+H+nSdfEhfb3lCP4Y2okMxylj7TgGWp+YH
         nDjJf6S7+3DDIKr3byJY8ilw1gt1JFKQWp5dH+QiqyKVIrqN5a3v/hISbpksURltDjFQ
         EZHdoBrvFKUv5E2e5ZhNl+uteZ+GJRoo6wDXrOIcmh3b48DBboo1PPODbibEDHZP94aH
         M9zqbdj2oWZw+o6qcl4e+JxIQCAQry9zwHEO/srWrcZlw812IxEnJqbBHWPD5Rv7Nd/8
         2PJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777323692; x=1777928492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=;
        b=hSvSZ3W70lwVCeBl6POuEEIYXu5Ow80cVmKV9E8vMgm4uuG7P6i7RqPJRDcbl5ItpH
         gKKz2MkV8dhFbkez5xq8PFW7roSxF4W+MjpnACrP8wpPdes1QWS/NQd+9XDU3JJgTfBD
         DW3Sn89653Y3g5+ipDy1XIouapkZVTQJ3obS8Tmbq+FWlzOn4EcKI1OCTJEy65OAoUlM
         9i2j4f+1ivi7P2HKNR8mgzfunvLoLVp3iGNOMIzJlGU7eoZdcZfLSiiGnq4ZvOO2FTQ3
         Pvs9pNep79au4k6/T46xagPtY9iV6o/jIMbigbl6XBzAT65xDO3FQmSOSo7Q1KmtsgXM
         tyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777323692; x=1777928492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1JV0342BhDHMDqkE0j+wNHcbkp8N7EQgQZU0YiwIqxU=;
        b=Q34Ib4lHbxdEDleyA4Qh2azfyZULFWNlbSsxT95EUfp8IOZ3ffJBsNDEA+WJxIk2AL
         RX7wG3gn3WaEvkxL7wtxItRElsTnkotlifxjaWUnGgjHfFvedFo/p5aBXY45X4KsOxaP
         Mhzj2oohxVwB8/EzKKPNH/oo6fYR7cndKvdPO5QE9dBgYLTxgJ1UgYletLgH4Tt8YVIF
         PBI25KdYQ105NaT//M2VKdo+2W1t0StI8aX/e4SwQj0hK3JG94VfeghpLqqJ2WjNVoFo
         FmZwOtq//bCgE3/2aeTd1NnWSWST/T3Lpy48++PvI3PgFtS77zSN1KD+uj9yeUjY0rip
         QQPw==
X-Forwarded-Encrypted: i=1; AFNElJ96P19XWXNj8f65m0H0NYEVlNwuIFXISMfFpXYgxJ8I45qtJvARnhVlxdm6THp/LtjIXOkfoxzaiDo2w764@vger.kernel.org
X-Gm-Message-State: AOJu0YynGm0WZcOLmxhYZNFxtJ881Tqfu6LcXYdteTDsqDyV5EUaOiKw
	6B3+3SsKxbULgVfnQbLB7yw24RZRWv3DF438YIjdVSD1u5AIzFiscb+V5MXaFwf0TH49DGvur8j
	3cJPV1dFQ6u5hL9V+2/vH51p8Dao6j/Ahu/FtsVM6H7hJdVNh0xmSzVbEJ6KcVtk6MKgjJWfpr9
	aIi8SaCJk4sGNawADuaAUDcTS45Q/gAWgGKwO+buyOn7k=
X-Gm-Gg: AeBDieu6/uoJJnw0DWu6tvRfru/PbBBzrqoDj5Yaqe/UzBUuOFhr1sXzJXDYcvhs3ZJ
	weR/T9DwyYBUwsi+HejCYqAJE8haxTVASdAr7792UZ436y+GTU44ziDexjpc4tVkxAlVOsLjZtf
	MKXzgL6s3bSHTtTuxtjSCpZND7ltg/v2iFcX7YC1cH5vNs3QYDcO9p7KaCTHUeBtKjBYgsdzgfP
	TDQOORongX4RrhcfQKdvvJgfuPr3LqPOTWexWF+QoRh7Cgrm7M=
X-Received: by 2002:a05:6830:81ce:b0:7d7:48cc:ccdb with SMTP id 46e09a7af769-7de9a0ea40emr232039a34.19.1777323690803;
        Mon, 27 Apr 2026 14:01:30 -0700 (PDT)
X-Received: by 2002:a05:6830:81ce:b0:7d7:48cc:ccdb with SMTP id
 46e09a7af769-7de9a0ea40emr231987a34.19.1777323690349; Mon, 27 Apr 2026
 14:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
 <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com> <CAFEp6-20MzQh55iJzyhn=htFZxN1yq9o+EJJAX0CWG3O6_KSyA@mail.gmail.com>
 <20260427202523.GE3219146@killaraus.ideasonboard.com>
In-Reply-To: <20260427202523.GE3219146@killaraus.ideasonboard.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 23:01:19 +0200
X-Gm-Features: AVHnY4KhboWBXcHPTL_60SWtSw-AAA7UM_3jLhGlKnmcS9RCmKJpNOXClsRGkmE
Message-ID: <CAFEp6-3yecq5oGRFFbaTCEW5Ag9JaZXjVTAT=Z2FSX20UC41Ow@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration definition
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
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
        kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: WwovLNJFQmk_1Z7nLAWaUgVUSTRJr2T9
X-Proofpoint-ORIG-GUID: WwovLNJFQmk_1Z7nLAWaUgVUSTRJr2T9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDIyMyBTYWx0ZWRfX86dErp+KUlxU
 3rK2O5m+owDld3E4Zs7y0FjsRcml+Bq4f7SllL68y+9D/caXaQ1xphgdb+p4fZvsQ/rbXso0mco
 lA5CxmYHaC/Igu8xZUcsNLuTfn25t56ORKsmdkUYF58VY5DwM3qDfA2L1cf4NhJgJQc65vyT8bW
 kC3pP2+l4FG1U2bhqMnGB0a9PE51NLlKYel79NQ+H2VZIaAyX7h8zhruBoDy+l5sUUNXsgCnz//
 TZAHE258fBB4whZTMVZ6pDW2d8MMKBlLRCqTuUzywSg7ehTIlhlgAIfa0mjcKx8WZwRnqzswpMo
 37Sj2WNObZQ0jbpFixBVFfNyP0hBMEuQ8JX3jP28em3LX7MKoZ6LFOy4aSpdlk085mtcSl/t0OI
 NQbp/VrAkGz6ApyQxC0+voyYYP4InZQIvwz5YYHOPkwA0it+MogueUzbt8bKUWyIGncJiIcWKCM
 c3lw8fnqbbVPEbzSAOw==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69efceac cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8
 a=EUspDBNiAAAA:8 a=By-mYhKeKzH8vs57knYA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270223
X-Rspamd-Queue-Id: 89B2647A744
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104833-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ideasonboard.com:email,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email]

On Mon, Apr 27, 2026 at 10:25=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Apr 27, 2026 at 10:08:59PM +0200, Loic Poulain wrote:
> > On Mon, Apr 27, 2026 at 2:56=E2=80=AFPM Konrad Dybcio wrote:
> > > On 4/27/26 2:43 PM, Loic Poulain wrote:
> > > > Add the uapi header camss-config.h defining the ISP parameter
> > > > structures used by the CAMSS Offline Processing Engine (OPE) driver=
.
> > > > This includes structures for white balance, chroma enhancement and
> > > > color correction configuration.
> > > >
> > > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > > ---
> > >
> > > [...]
> > >
> > >
> > > > +/**
> > > > + * struct camss_params_wb_gain - White Balance gains
> > > > + *
> > > > + * @header:   generic block header; @header.type =3D CAMSS_PARAMS_=
WB_GAIN
> > > > + * @g_gain:   green channel gain (15uQ10)
> > > > + * @b_gain:   blue channel gain (15uQ10)
> > > > + * @r_gain:   red channel gain (15uQ10)
> > > > + */
> > > > +struct camss_params_wb_gain {
> > > > +     struct v4l2_isp_params_block_header header;
> > > > +     __u16 g_gain;
> > > > +     __u16 b_gain;
> > > > +     __u16 r_gain;
> > > > +     __u16 _pad;
> > > > +} __attribute__((aligned(8)));
> > >
> > > Should this be __le for all of the related types?
> >
> > At the moment, this is purely a UAPI, the values are not dumped
> > directly to hardware as-is. Instead, each field is translated into one
> > or more register writes, with the appropriate math, masking and
> > shifting applied. Adding explicit endianness in the definition would
> > therefore require special handling on both user and kernel side
> > (to_le16, from_le16).
> >
> > On the other side, there are scenarios, such as platforms that rely on
> > ICP (firmware-driven processing), where we may want to forward these
> > structures directly within an HFI packet to the ICP MCU. In that
> > context, explicitly defining the endianness could make some sense...
>
> Would those be different structures, or do you envision that someone
> could develop an ICP firmware that understands these structures ?

I believe some of these structures could be reused across different
platforms and bus implementations. In particular, a given e.g. wb_gain
parameter struct could potentially be shared between OPE, ICP
(firmware=E2=80=91based), and the inline engine (IFE), with minimal
driver-side adaptation (limited to shifting and masking) or even zero
adaptation. Bryan has sent another RFC [1] defining parameter
structures and layouts that (as far as I understand) mirror the HFI
data layout, so I plan to sync with him to identify opportunities to
leverage common types or structures.

[1] https://lore.kernel.org/all/20260426000418.1158716-1-bryan.odonoghue@li=
naro.org/

