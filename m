Return-Path: <linux-arm-msm+bounces-101314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPiVNTz8zGnQZAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:06:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39358379121
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70516304567B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF510408249;
	Wed,  1 Apr 2026 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmHJDtXC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zx2l5k1n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5645402449
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775041294; cv=none; b=WieJNP8mHwYQ3PvOLpO9TEmZTfi0zT+0GfavKdVcIMHYQ5X1iwcCWBIAk25LtqTOGJXWwYbWkcQvfavkUUDQwvOUZBkKwHtb86Cv1Y3O8zJ2Pr1Q1fvElfHf5HNseWU6rmul2pBa3j9fmCzfPJWuDuOBVRYe3+vQ/7R020Ga6Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775041294; c=relaxed/simple;
	bh=Fa60T1J9NdG0M8J8bhvHiHZIs+TFsgPClwjQYrHu5nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wuz12U43ldJ1nQbDaHWf1sn3YGKRg3n/xlQg8VWT6zuuhrCY215Q8Ldf0m3tKQBO1Vzm6UlR0uGQFdDUGycLhjLtgawS3kh5uMnnuaZmu5NoWHpmiILWx4VQVdCP5qDey09EYVDRnLAI4IVRBKsk8nqdhWrHSYx34txx2dp7AYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmHJDtXC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zx2l5k1n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631AMqea1562478
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 11:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Um9bWYbqbpemNVrExQ12MkVwZ+nPwCvsKWs7TNNv7x4=; b=YmHJDtXCinnPJ2gU
	A6y3Ab8rzxFvUbMoxOyNnpMuzCvBi2K12IXUQvKdZ/uRtmfRJlDThZabVWBqgKwS
	rx1g90D+TB9X8acBauwZJkxmnXZev/o9T2cd/D68HunUsq+6xE+ZUhiNc2Mdig25
	wXiUlJvGHTKwqd29H1OVn2Df6GnzaYuCwbqB+GhXXJD4tFc2y5epaTNky3w90Xkk
	pGfKWPed+lwJNExv5KqbpoXFc+sFysTrH4WSyJUVWJlRFwwDvOebar89AzRIg6R4
	FxR2Pu+5ZRX/S0JJAPJqmiayrnWa0HmUGntdnLmtQahVV/odLFNmt7GhWv18PDi8
	NVp2sA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3sg49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 11:01:29 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56aa6d6bb5bso5761737e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775041289; x=1775646089; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Um9bWYbqbpemNVrExQ12MkVwZ+nPwCvsKWs7TNNv7x4=;
        b=Zx2l5k1n/lhGwiPgnMrytyHht4C16Me1D9q/+LMu/xtMuuVlHHyafpKNhPLuemdXuA
         RNTTn2JZPPTz9ZBlkZWT9rEp9n5hwTjxBotIG5RugnrFsbs9IyV00NQ/Y3nNi8spY4/c
         UbQSQWI/EKIl1qfsNXmK5prd/KupfWEJFDiQpCbFQie/wS9Zqdfm/tNP8XnTmiaoQOcR
         xdm3ITSLFSES/SpaalgJNqPGshwAG0ea7GbFi7LWBtDgxhhWNaP5+dgSAcotQM3V6t0S
         t7ziD+M8LWhTFxR1kzLUTIibyHXUMUNvu40z+fGyAedbIdVSxv+n+tNnC9hYqbQghVNa
         27ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775041289; x=1775646089;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Um9bWYbqbpemNVrExQ12MkVwZ+nPwCvsKWs7TNNv7x4=;
        b=D82obPD10c4NMKO9yDEwTbeb+6I1Mkhh0rsUaQi34BkEsQVRXGtl9j1VnqBJ5hkab3
         uRL77/6gJ+zhY4zHZIPjLGzWpU22dcHrZGPLGTCr1yqSq6ydL9KfiiPX3bUrffprbWvm
         OUGdc6uHt/fnNTv21l5TVrXVZ4S7IAbeT2l2n5BnPs7shtjC05dLh5B0OFTiQP9AzOo/
         /tQxySaYxnUxXwq0CPMp1y31MWukBByG79z8S9G4azR7NOntBmTKwsJ/JeqevupOlX9C
         aYIcBL6aF+b2rih6t/pZ8j2II84xytF+DRYH1gUTEAtj20Xc2Cz5t0Zmz12rEjM4tf4/
         Llzg==
X-Forwarded-Encrypted: i=1; AJvYcCWAgJcuxEjjXS5MrnVYsJHFlWxMKeJvMa8nJ53PazZ9HM1JzzG11BbYxmAemrPW/FACKhSd783GsK3WivWD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz8fduMAEB20c3U97GcnH/fBC7nMeYxxa523cGrOIAXcHIPHwC
	28xB6nPGEoxtx17Ym7hSRlpqP0YKTdkrrw9hlliaaM5+OSAGaki7DPzsUHtZadSc05n1xdpGH/T
	UVE0YnSw7ojMfZGYMb4rqUAedK54EydgVyzh+LPnsQlpBMOCGthQTkCcYLBe3s+lAeDtm
X-Gm-Gg: ATEYQzwiquXSRY79UB8KK37zj6vtiXAacyVvrCFGMPC+tb2Gljsob5sDPk7mdMKOHdb
	1qKdalvesCZ4lKA9uis5q6F7Py5OU7wcQ29N4/+7n/cPVyEraOivOUgNgn4Co/FUKDfc6jbY31B
	lf+eKQDPywcp2ZwZLiMAjp3HFlxnEKk5nWLO+Ks995UNrdaXfcrfcbvZv13rZzHcLHxtQr1tgTT
	hoc4f3Vq9JwyHpGh5O+PtwF6v1TxhGnVmmIv3FN6yojxqqe2pVEoh3JhfyXbr539+IrRl406XvZ
	7Wr7sttEnl9PXkHyulMEKNtOk6u5TZBPVu0H1upPtoak2gjPzn/Qx6UjSrV0JHDF38WYaDr8X8V
	L8rPYAsnJHjyGkA6BNYk3fMzMqElPU9ZyiocLhpWPdtbXcu0f5rPEhgRwnBuO2VBv+2jMByAjwY
	E8H9Km4k3Zzf8bxcGUfDH9hGUBtipeZ9VTMPw=
X-Received: by 2002:a05:6122:ca1:b0:56d:471b:c814 with SMTP id 71dfb90a1353d-56d8a817f69mr1167199e0c.1.1775041288891;
        Wed, 01 Apr 2026 04:01:28 -0700 (PDT)
X-Received: by 2002:a05:6122:ca1:b0:56d:471b:c814 with SMTP id 71dfb90a1353d-56d8a817f69mr1167104e0c.1.1775041288262;
        Wed, 01 Apr 2026 04:01:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2bc5f3377sm1384251e87.74.2026.04.01.04.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:01:25 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:01:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Message-ID: <4fiyjcqt5smotudsfzyqrevxxnx3sf5grbgfluzkndbp2od6pq@vlyikcvl3xkb>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
 <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com>
 <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com>
X-Proofpoint-GUID: t4wTybddId0GBVGEsTAq4q0dgXv2nz0V
X-Proofpoint-ORIG-GUID: t4wTybddId0GBVGEsTAq4q0dgXv2nz0V
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69ccfb09 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=sXGUrAVt7bPh_wKNbm8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5OCBTYWx0ZWRfX9/sAqjP24OLx
 QCCoxUutXRN734P5vw4k0iUBGZV1fUdE0hO9UjrVyCqLCmQXX1HLRpwJ2jeYZN5c2k67ZJiRsV/
 eem6eg8Nim2wLa86ScDjalE2FArORBlYJHo3oERJpVBhFXHreUnz0bRQyRhBArfUyZtXJNbaPrY
 z1cHlh97IPEGW3RsA6FzwFf151bCAMoofJpB2mKV4gMtFVAbVYHicLXHhL5CpWVNdK/T6DBVgcG
 RIdRs47Fo3lD42he8KZ4yeZnsmdq6wZjWjZ9VCj6QaQt98sliW4hFZ43Os7EK+qNRfsgjR/8ISP
 vojR8Sv9bbTyBn5OflYzQV9iN/jOPkLtKnwo8NIw8Di6iad203fT5RPZ05bLpRF4+dgFEC2l7Fg
 izoejyvAppy+TMdwHNLaSdlQyUOPSp+GGLy+2kMJPyeleJKKNlHlUm7wUxp5iLDLG1O56N/bZR5
 P04k1kAU3aWMmmV7oEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010098
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101314-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39358379121
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 12:46:01PM +0200, Ulf Hansson wrote:
> On Tue, 31 Mar 2026 at 20:46, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Mar 31, 2026 at 01:33:35PM +0200, Ulf Hansson wrote:
> > > On Mon, 30 Mar 2026 at 15:06, Dikshita Agarwal
> > > <dikshita.agarwal@oss.qualcomm.com> wrote:
> > > >
> > > >
> > > >
> > > > On 3/30/2026 4:45 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Mar 30, 2026 at 10:55:02AM +0530, Dikshita Agarwal wrote:
> > > > >>
> > > > >>
> > > > >> On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> > > > >>> On SM8250 most of the video clocks are powered by the MMCX domain, while
> > > > >>> the PLL is powered on by the MX domain. Extend the driver to support
> > > > >>> scaling both power domains, while keeping compatibility with the
> > > > >>> existing DTs, which define only the MX domain.
> > > > >>>
> > > > >>> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> > > > >>> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> > > > >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > >>> ---
> > > > >>>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
> > > > >>>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
> > > > >>>  2 files changed, 8 insertions(+), 1 deletion(-)
> > > > >>>
> > > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > > >>> index df8e6bf9430e..aa71f7f53ee3 100644
> > > > >>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > > >>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> > > > >>> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
> > > > >>>
> > > > >>>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
> > > > >>>
> > > > >>> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> > > > >>> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
> > > > >>>
> > > > >>>  static const struct platform_clk_data sm8250_clk_table[] = {
> > > > >>>     {IRIS_AXI_CLK,  "iface"        },
> > > > >>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> > > > >>> index 7b612ad37e4f..74ec81e3d622 100644
> > > > >>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> > > > >>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> > > > >>> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
> > > > >>>             return ret;
> > > > >>>
> > > > >>>     ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> > > > >>> +   /* backwards compatibility for incomplete ABI SM8250 */
> > > > >>> +   if (ret == -ENODEV &&
> > > > >>> +       of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> > > > >>> +           iris_opp_pd_data.num_pd_names--;
> > > > >>> +           ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> > > > >>> +                                            &core->opp_pmdomain_tbl);
> > > > >>> +   }
> > > > >>>     if (ret < 0)
> > > > >>>             return ret;
> > > > >>>
> > > > >>>
> > > > >>
> > > > >> Hitting below compilation error on latest kernel
> > > > >>
> > > > >> drivers/media/platform/qcom/iris/iris_probe.c: In function
> > > > >> ‘iris_init_power_domains’:
> > > > >> drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
> > > > >> read-only member ‘num_pd_names’
> > > > >>    71 |                 iris_opp_pd_data.num_pd_names--;
> > > > >
> > > > > See commit 7ad7f43e568b ("pmdomain: de-constify fields struct
> > > > > dev_pm_domain_attach_data")
> > >
> > > The intent was for this patch to be part of v7.0-rc1, but I failed
> > > with my pull-request to Linus.
> > >
> > > Instead this will be part of v7.1-rc1, assuming everything goes as expected.
> > >
> > > Is it possible to drop/defer these changes until v7.2?
> >
> > It would be very sad.
> 
> Right.
> 
> Since it's my mistake, let me reconsider. If I rebase my branch and
> share the necessary commit through an immutable branch that you can
> pull in. Would that work for you?

I think that question goes to Vikash, Dikshita, Bryan and linux-media
maintainers.  Bryan, what is the plan for this patchset? Should Ulf
rebase the branch? Or is this patchset delayed for some other reasons?

-- 
With best wishes
Dmitry

