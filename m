Return-Path: <linux-arm-msm+bounces-103578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPB3FlHE4mmA+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:37:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC241F344
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 01:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 900903021C14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 23:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A665358D00;
	Fri, 17 Apr 2026 23:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCAdYq2d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqs+s4gh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955F2DC789
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776469054; cv=none; b=TJYgg0HB65+2zaesqvYYezoCxJM85MvaneXtKsxTw4ubRyRMqNoXtyL72oX81fnwaTVYU/5BaAQn4FADHyzKhqzUceVgNqnKJvxEZ2nPz/Le/PlmOlaMceXYOS22Mo1jrUZBWLSJyPNgK12TGvQJT5Ws3Ru7FGbLxZIKiDYwwo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776469054; c=relaxed/simple;
	bh=eczYf2dkFvlA2exsS3bVLjKh+H5ACB1fIdd/wBEUUFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmWzQ/LvyPHdNioQepAFRDC9BSoUZR03U55OqZ5PU1z2AczV9d9FOwwTYw3+O5AXMzv9LMEYJ6SU/mjKHf/pZm4PBIJr+4n5s4PxYPaACSuxbOmMpXUb6wLR/bUqp7stP8cNu+6HeAAlx2t7M2COev+UIjH/656MGsTECoOOuAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCAdYq2d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqs+s4gh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HIRwh32434104
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lq9o0MXBvHnGDIaaG0otXZUtvnMWwrMQbTMngwp/WXA=; b=dCAdYq2dW7CivrhQ
	QAkhTE8NrtNFSMWzEeU5mUmStmRgKzikwKnH0//dimMveH8o+BgnZSTLG+iwUFPg
	vr3hBKkRokvoICsQ8DvTNK/8/vQj54AgC7UhEGkMlgQRItJpn0PLaDt/9PKQIVfc
	b1OpGT9kmNqh1oj+C3EeWvHSEitMsyuR8XhSBii6IR0Gv2ih6la09ceWrX21dNLx
	oLlDXWUesif0ToBjO8O2ixpFM2bPnlaJwDAj2b3Evv6R44m0ydR2wacswDbzA6na
	3bTjh6bdTS3VH2oE4uZuFr/cBkeC7/WQUBVU2WHCMcYhy5FMMxCrD2J9N5SPjq4M
	tLTzxA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkt5mrnub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 23:37:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d1c2289so29231501cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 16:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776469050; x=1777073850; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lq9o0MXBvHnGDIaaG0otXZUtvnMWwrMQbTMngwp/WXA=;
        b=eqs+s4ghLFaY2vVnxL4T0ngp7XQumICgxZTQk6Ak1+ubxjTZoEsIubAbbydLj9lDyt
         f9O0wyomBv6jQT56et6YCjL/9lKgzDH3VMwLiRSsJrE2z1d/xU0yrY8JazHAQrbNS0Mg
         znbFJJuXcfOE80t9O9dqd8TV03pi2vdzaEIhV4/8RMgdWLdQ0UpLSFxkDPubXZ3JBrMJ
         1Pi8CgH5+lG5qR2LumOKnsARtW/cbuiq7QC5zOHzVZHokv8qEv6MQrmfwfIeXooHT107
         4mGXdK7/GeNKCooy2h+FRNFMRz2PWpcX3sadWv83ja3Rb45J77yLeKDzMx6F+utaCcEG
         JC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776469050; x=1777073850;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lq9o0MXBvHnGDIaaG0otXZUtvnMWwrMQbTMngwp/WXA=;
        b=N8JaimZcwM7b1s9WBrg/aLSTQebxpa/HaMUoeBBSGlc+mst8Qeo8PYpE7iAqvSXetf
         kkKD8ikfWq6QrqkXKgGIb3XyPag5/o7fIFBaVXfsv465OqAMTbZjTdzCZWqBVFm5npOo
         H4GN8xVSC0LUrK8cFKGSLWXQ2SWcMbLCqE7npypGXbFLIuf4NVE/IInOoFHyxbHyUqQd
         +2VYybLkDX4CC7zQ2wAvArAC36o6I3oWwuM9FfIykkRokZugKmvGepSl4FeWusssh4GK
         wwRK+KYPOTR1aOP6V2aOt/o7Ix83VcL0uScbtdTK4qRTAPn6R3PwjB353X9l5dJEOmEU
         WZgA==
X-Forwarded-Encrypted: i=1; AFNElJ9PrMBjkUPLzdxGSwlakVKXUOwD1tjrh/sRK/YS9/h26/aW1ZMxe+YqZL+xCvIHkwKGTD2n3FKIwbHWLzA9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4w5TVLbnj15YcRTi8oFg4I2VpYg3vGnC8+XjDO5g0Ep3a7kbb
	/ed9ZnuhG5bHZKrkV7jsDM+GFvOZ30dH52jwruR1WLD3wdTVKdKJuU048hYJB7Zlr2VgDH/D4SJ
	xYiZ/P470F50AMKhiSrlvpKtx03Keca1Owi+TqA0gqp4qOyFEfSdZauF5Kq8zbHbJmGrh
X-Gm-Gg: AeBDieuxHEhpnvh5zgjydKnfyX/byxDlzgkKQS0crJJgko7IN49QH4XFeB9pVHNG5o2
	mJjfwaUiXm3806SIFBp2F3lLiM9EYO6WUOiYXgWfzxqP5SiUJg6dN6BiQFVFxgUWkO6XSkTUx66
	mYxe42AKqp293VGm4if+0lEpSNdrni29fAXYzxnRQXgZWb/RzbkSwxFSvEHm8ahgoWzPGCQK/X+
	s/s+S37nOfB4g9m/IaTRmldWbcqu4wLj6N0Oe2BmFpmHVqi2agxmcNBUj7xW71kbEuhAVSbA+Uv
	fKJg/XNeE97Q0G+EbMMGE+dhybqL8TnprR+Wrq/Il9/rTGIRusScmm9yso14sbNxTsDDE7jg3ok
	wkVwpgZtt5RSHEEIkJ0FKwN+RItoNwsLwAhOGKtukP7ADY0feqvWGwh+v6M7RPDYxhBqq/5lxvZ
	1KWowNCHTGXTVAgnPhKkDGQCZUPBOOpAJACvNQRHg7bbmYkQ==
X-Received: by 2002:a05:622a:d18:b0:50e:428c:4f41 with SMTP id d75a77b69052e-50e428c5169mr18470361cf.60.1776469050210;
        Fri, 17 Apr 2026 16:37:30 -0700 (PDT)
X-Received: by 2002:a05:622a:d18:b0:50e:428c:4f41 with SMTP id d75a77b69052e-50e428c5169mr18469971cf.60.1776469049764;
        Fri, 17 Apr 2026 16:37:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm824544e87.7.2026.04.17.16.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:37:28 -0700 (PDT)
Date: Sat, 18 Apr 2026 02:37:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 00/10] media: qcom: venus: add MSM8939 support
Message-ID: <zki3ozehtlw3g6lhsdg6tjbr7ysk4ka7wn2erc2ignkbj4todn@ovchixjotspo>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
X-Authority-Analysis: v=2.4 cv=AOj9hFqm c=1 sm=1 tr=0 ts=69e2c43b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=UVpfOe0Sm4tf6V5tHx4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: -zN2GAX-HMWswo_OpwwpzX7stUaxzquQ
X-Proofpoint-ORIG-GUID: -zN2GAX-HMWswo_OpwwpzX7stUaxzquQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDIzMiBTYWx0ZWRfX1UKuHoPyhLAT
 Rd4VQfJaYUlq4wG66ia4kvPuMVsSKsiAgIqxnc6ZSCgYf4NhjLwOigXTmfguSlXiEO2NKlm4DvE
 z1e2csrtQ00s5CKmMSVzQFaWIB2bxOYLHfi/zWIVHqoWHJFzfk02b3Hu5HJYGk03gzG9QI5tke3
 JRqGD93bFiY4TMCL+nBx6VZVrpeDuM3LmAGEkbd5tyKHt5lqejQMOHrMku7jAzySH1CX5otXije
 2e9afbPnSi0IdXmxVzgRso+w2D/N3lEke3yUfn1iyOelu/UdtyVMZ1PemLw+Ny5rB9oheHMfloV
 FDnowBAhKPAkiulYXm7BpnFxW8mFOBpAjOWbwtryYZaLWvYedhdUDTOzR89pdoy9DUniNWRN8oH
 jxwHVnASy3LYzewfnmLycJs2wJLc/qtuYJtYPW3IhGmxlawi+/oqgCY3+jyxdrVI5Islngrtw3U
 UZnIZrAm63mcl9rXrHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_03,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170232
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103578-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50DC241F344
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 04:43:47PM +0300, Erikas Bitovtas wrote:
> This patch series adds support for Venus on MSM8939. It is mostly
> similar to MSM8916 Venus, except it needs two additional cores to be
> powered on before it can start decoding.
> 
> This patch series is marked as an RFC. Before submitting a non-RFC
> series, I would like to have some details clarified regarding how Venus
> works in order to improve and eventually upstream support for MSM8939.
> 
> 1. In downstream, particularly in LA.BR.1.2.9.1_rb1.5, the buses
>    for vcodec0 cores have only decoding bits enabled, as depicted
>    by qcom,bus-configs property of qcom,msm-bus-clients children
>    in qcom,vidc node. Do I understand correctly that these cores
>    are only needed for decoding, and not for encoding?
> 2. Currently in device tree there is a video-decoder subnode for Venus
>    node, however, for SDM845-v2 (and newer) chipsets, Venus does not use
>    subnodes. Does this mean it should be dropped for MSM8939 as well?
> 3. MSM8939 supports HEVC decoding, however, as the patchset is written
>    now, it does not work. It can be enabled, however, it will result in
>    breakage of Venus for faulty MSM8916 firmwares, because the code
>    disabling HEVC for HFI v1 needs to be removed, and as per commit
>    c50cc6dc6c48 ("media: venus: hfi_parser: Ignore HEVC encoding for V1"),
>    this would break support for some MSM8916 devices. What could be the
>    best way to work around this?
> 4. To attach vcodec0 power domain list to dev_{dec,enc}, I had to move
>    vdec_get and venc_get later in the probe. Should this be avoided, and
>    is there a better way to attach vcodec power domains?
> 
> There may be some other issues with this patchset - this is WIP code, so
> feedback is very appreciated. Thank you!

for the next iteration, could you please also include fluster results
for the codecs supported by it (VP8, H.264) and also v4l2-compliance
results?

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
> André Apitzsch (4):
>       media: dt-bindings: venus: Add qcom,msm8939 schema
>       media: venus: core: Add msm8939 resource struct
>       arm64: dts: qcom: msm8939: Add venus node
>       arm64: dts: qcom: msm8939-longcheer-l9100: Enable venus node
> 
> Erikas Bitovtas (6):
>       media: venus: add pmdomains to the struct based on the purpose of cores
>       arm64: dts: qcom: msm8939-asus-z00t: add Venus
>       clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
>       media: venus: move getting vdec and venc for later
>       media: qcom: venus: Move HFI v3 venc and vdec methods to HFI v1
>       media: venus: add power domain enable logic for Venus cores
> 
>  .../bindings/media/qcom,msm8939-venus.yaml         | 104 ++++++++++++
>  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   8 +
>  .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   8 +
>  arch/arm64/boot/dts/qcom/msm8939.dtsi              |  24 +++
>  drivers/clk/qcom/gcc-msm8939.c                     |   4 +
>  drivers/media/platform/qcom/venus/core.c           |  39 +++++
>  drivers/media/platform/qcom/venus/core.h           |   8 +
>  drivers/media/platform/qcom/venus/pm_helpers.c     | 187 ++++++++++++++++++---
>  drivers/media/platform/qcom/venus/vdec.c           |  12 +-
>  drivers/media/platform/qcom/venus/venc.c           |  12 +-
>  10 files changed, 374 insertions(+), 32 deletions(-)
> ---
> base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
> change-id: 20260416-msm8939-venus-rfc-c025c4c74fae
> 
> Best regards,
> --  
> Erikas Bitovtas <xerikasxx@gmail.com>
> 

-- 
With best wishes
Dmitry

