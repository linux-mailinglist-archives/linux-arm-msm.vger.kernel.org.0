Return-Path: <linux-arm-msm+bounces-112363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SCKiAW8oKWrgRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:03:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C0866796C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:03:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mdg5+8jK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=elh3IY4y;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112363-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112363-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84809324F7B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932373B71DB;
	Wed, 10 Jun 2026 08:52:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D03CF963
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081575; cv=none; b=jce2SbiJQ0x/UWzOz5oB0Tz8UxqBHzdwfMJJfs/YBOz5yermMm2SoTJKLjcwmh4eVzIPRn2vOWFwfujnLnAdXasQOOq8npVjPS6ENZ3u460F0KtVR4Xr4kwKU2xzGSU0fdAnSu8zVV9GXoCRrUamEmflzEnF7ZctSLFa5gR/2WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081575; c=relaxed/simple;
	bh=mcI/q+LhnTwFsgpuGRD41S+Cl+laWlV+orMRVBKD6W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QrwM7lMwV7zHss3BlzEHzI3ctx+Lxb4yfHhyv5cYtNien0qHmHIrgArIi8r6PpdjOh7AfeMRd1bcZZ1PtWdbydsmOQ3JHOXutcXTGpEV/4dCSs18qp0EeVF22U5gOv7TTJILs0YTl23vMH66sBNSSRg5+PzMfVQ1F8TrdZQyCCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdg5+8jK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elh3IY4y; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iW4l904065
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSuOxyqohNyFghg6trX5SYjSHgMDEUyPSbSYNvimIaQ=; b=mdg5+8jK1Yod+3UB
	MKGxGgARMLz8SkRgI1AC+ffOj9duVH/OAfHgUH2xzdvKJ5raF5UlbOTRlhLIt2OH
	SP8NzjxFrruVUr5sJ/lOpv2SsTniOF8KJfVteZuBtFvA1iiNNNSx+xPCkZ/f7RsW
	sEaFXWH/neuPjJASaEeHsK0l9OSqjmhoOpMPWtM4JIzKZPpLVUynlxDvTG7cHFA6
	+awq5dCep66R4z1/tDoHRKEonOzEXNd5iBRs7yuAeMaCtVlXU37po4qSxyVP/qRg
	OGPtoIY3txYizcUplhvHvwlA4Rz1nLd3fxv2fEkjo0+rAdYP85vLs+0eXSjKxdFV
	xhePCQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epuket4p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:52:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0a99db8dfso71165515ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081572; x=1781686372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSuOxyqohNyFghg6trX5SYjSHgMDEUyPSbSYNvimIaQ=;
        b=elh3IY4ySrbmlLm9peNP78J+QMmJPpwlWmLCzwqy/ZSpq7HlJFbTxgfTyKxy4+HuU3
         5NcrVusSykm/WIceVRVks4CRI/+Ci8HF6awHyHCk9PIl9hRzC9u3ABXMxAKcy+H2S0ww
         7wMl7bguotUI+kU4iOGULVnc5tcg8QKF/dMZWUiDepigrDN86nwteUpsPHMwsnfmq7ST
         CJ/y0EJwzmVVps46DACJCGQVKoNClhMlBdA3P/xBUgGZbTlYNjY29ZwRgjW7NIyixM3p
         KzzCf0daJXwtMAkk+gPwux9o1lm1szNVgNXJ5+lrrJYd79HbdVaI2G5Xm0aejb5IGUET
         Tj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081572; x=1781686372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSuOxyqohNyFghg6trX5SYjSHgMDEUyPSbSYNvimIaQ=;
        b=XGYMYqxqFuvx4Og20GO7ap+bTdwwWq5HLdjDg1M6S2npZ2Yc2wpdpbX2KRWdfoGpgA
         wEhiwRzXSH2UvYKTGa5DsOPDixxGzn+KZd3EfHiP4otofR2XUdxtS2pITNGUMW6HQ+s4
         FwLAkPlsGWZVpcvVIDF3VGO+AqgAPdZyFcrP32eED786Iur48vZrzPTXsBtKTuuFwLqv
         DlKWpsdDx5NBmBQzKyYIC98HYqreCedqc46JMeqsCRIa0eENZYxPq2iD9hyYAyUUEBe4
         LyuaDqmJpjoZjc0hpcGUvP+801mQkiL22nQ9Fv260lHabHRwobuKValPiWWcL5IqHdge
         9KkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dkNYZcUG+6pBIcU+zqYVP6N2A+gsIOw57961yAh2h82i6pxS9qcxlGbwZoGW1+dxz16Pj4O0VxqQssjPa@vger.kernel.org
X-Gm-Message-State: AOJu0YyRN7KT9Ex+DyMgUMpO3w4xawp7zmL8HandppU+APsv+NxxAS0v
	IWO1OS9SE4ye938vN9ghz011ji/NqHZPegzGP/Z5qkJ+sMRyW/Sep3xYc78opTtgR5pmkcVlP7L
	bnjZzy59fhvOYBrI27bW0mhT8VeXxj8msUl+3pLQUJJingr0cZUxPuLhKIhXKMsyUtTR0
X-Gm-Gg: Acq92OE4I7GfQikdSnSw/MV8OuaYDQcz42hu6aJKo/LIZpYx0u0n1ztBhKAP3ncnAT5
	qbsZDp4lIVUYiCrV9fHBERQz9WgH1wnVP7HRSvAQkBqDG1q++C4DKtf+AjM4MYxJy8faPDn12Ik
	1iCT2ta6zs0UdUUkcXsoUVMM2YhRAUE3k/GCmFAQkQM9cP2VO/1DU/89O+bH9bu9ukr6pQbtixf
	9h90owBNluRwHvLsEGPfDb1DSSPh5SdFSaYOdBBH/uz7ebRWmxo7vjBakNwRH5URTFnCabizm+K
	ZGJe/i3v09juyp41izmp26wyrrkOgkOAYZht5nxkXvLYDZUqRYJE79S9BIBKvAWqOucA4NB/kPl
	Z3mtkQZp2+Yu7/Wn8/PXWWPEwqkf3KjPKiAUsYmNY2S254E1/EUV3NVWogUlBi0STkAgzN7s5ZM
	YMB4fSAOqEEXSSVCVSj0APX/tpUv8oTbvCKxofbDu7IxcnWkPflGyLRhwtgCA=
X-Received: by 2002:a17:903:908:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c1e80ff89amr302918815ad.31.1781081571971;
        Wed, 10 Jun 2026 01:52:51 -0700 (PDT)
X-Received: by 2002:a17:903:908:b0:2c1:a19:8396 with SMTP id d9443c01a7336-2c1e80ff89amr302918445ad.31.1781081571486;
        Wed, 10 Jun 2026 01:52:51 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:51 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:35 +0530
Subject: [PATCH RFC v7 8/9] arm64: dts: qcom: glymur: Enable
 LLCC/DDR/DDR_QOS DVFS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-8-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=2333;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=4Fx1VL1dpIFfd4Qo0Yj/taSxtHb2Ax1sJaQX5XeZ+Cg=;
 b=BjKyZHKjCreiepd6S07vHbcdWfLq7M5XFoZPL3rzrC1KJGYL3mrnWvPRBNOAo0xvsE9tz7sup
 Y1kMzGHyWhRAn852ChSaz7twP6WkOVL9Kxk3S+FaEq5bGeKkbeTRDZI
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX/LOj93Co2tRy
 J7WUXPbu7eTGb4BnIlXiNcwQzmKOVkaLwSfOhTjslzQ8lsNeXLf2QZehIkdYNmf66zP+KC5JVvC
 f66mPqs8nXxSh4GgD2X//G1QU8DwTY8wkQX5bVzjYKgeNiSSrgMcvmWzpKpp2UGes1qThvgAFeo
 QntWPKW6UchxzqervWGijmGDkVeGW7juYHZUN4Q4dNoVu80BQEYPmNZTpRHtA9BzS+BM+kpwDR/
 FziZlmtsrCnL5xNKen4WK9sNlW5mggK9Rp9SFhKXRn5aFNxtdQ2UHGMVKIC2INEVWiDf52ibzEJ
 ykQINejy2GNNTufvIrv3otGjW1VsBGngwumOZV+3t+4ixchEvaSLqRaivhAM5j8u5YmbVvL0bdG
 QQjgm5PWiD+IQH16zLywYPw39QgJT+zntumjynMdQmNwvLwpnDiUvQuo5GhR5U/pJNAMPtxuFdz
 RXyHvSlMu/x8939KeJA==
X-Proofpoint-ORIG-GUID: aMzgpqo42ZscOpk76Xw_FKrb0frR0C6i
X-Proofpoint-GUID: aMzgpqo42ZscOpk76Xw_FKrb0frR0C6i
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a2925e5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-olaiSHPbsRiaquSn4UA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112363-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:pragnesh.papaniya@oss.qualcomm.com,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52C0866796C

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On Qualcomm Glymur SoCs, the memlat governor and the mechanism for
controlling the LLCC and DDR/DDR_QOS frequencies run on the CPU Control
Processor (CPUCP). Add the CPUCP mailbox and SCMI nodes required for the
QCOM SCMI Generic Extension protocol to probe and get functional bus dvfs
on Glymur/Mahua SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..c0edbfefc39a 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -396,6 +396,20 @@ scmi_perf: protocol@13 {
 				#power-domain-cells = <1>;
 			};
 		};
+
+		cpucp_scmi: scmi-1 {
+			compatible = "arm,scmi";
+			mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
+			mbox-names = "tx", "rx";
+			shmem = <&cpucp_scp_lpri0>, <&cpucp_scp_lpri1>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
+		};
 	};
 
 	clk_virt: interconnect-0 {
@@ -6919,6 +6933,13 @@ pdp0_mbox: mailbox@17610000 {
 			#mbox-cells = <1>;
 		};
 
+		cpucp_mbox: mailbox@17620000 {
+			compatible = "qcom,glymur-cpucp-mbox", "qcom,x1e80100-cpucp-mbox";
+			reg = <0x0 0x17620000 0 0x8000>, <0 0x18830000 0 0x8000>;
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <1>;
+		};
+
 		timer@17810000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0x0 0x17810000 0x0 0x1000>;
@@ -7103,6 +7124,26 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		cpucp_sram: sram@18b4e000 {
+			compatible = "mmio-sram";
+			reg = <0x0 0x18b4e000 0x0 0x400>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x18b4e000 0x400>;
+
+			cpucp_scp_lpri0: scp-sram-section@0 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x0 0x200>;
+			};
+
+			cpucp_scp_lpri1: scp-sram-section@200 {
+				compatible = "arm,scmi-shmem";
+				reg = <0x200 0x200>;
+			};
+		};
+
 		nsi_noc: interconnect@1d600000 {
 			compatible = "qcom,glymur-nsinoc";
 			reg = <0x0 0x1d600000 0x0 0x14080>;

-- 
2.34.1


