Return-Path: <linux-arm-msm+bounces-111393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MIt3L520Imq3cQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:35:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B438647C4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:35:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BHzPM5Mt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="IZc1Ef/c";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111393-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111393-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7A353008777
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7209D4D8DA8;
	Fri,  5 Jun 2026 11:27:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0604D2EF3
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 11:27:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658832; cv=none; b=uruTRTEprQNWxbYmPbd/mrxLpQI8Y9/Wmg1mQTNvHgci9fQ5OB0d1xG1jHONjpK6Yys3/OOUwBsuwCv4IdkvF5VbnfmHkvvUTGq2OXxJ6EUO5aKYPSfHS6Xy1ABpMN4SZmt8EjMZ2I686cNPuf9+9a3hHUhLF36Uk31hT5WEwN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658832; c=relaxed/simple;
	bh=IsoFDfT/+D9E1hNGxpZwHRL39q/X355qA8bg2jOLQpY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LMi/xalONC0d2HWgiASrCVY9bUJPP1mhzZ57eKwiIzJThDsh8J45VH7e/nMocl7zG1BIxdrREb4iRIjiY8e5itR8DB8WiNB7sWeCA0L0d/p1CAzNdS5e36eLJPJLHjAWZAufeXh+AOGMkz3i+9KJHXRN+DJnv1O4UrpMO1DpY2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHzPM5Mt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZc1Ef/c; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65575UUe1501757
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 11:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IxL/V4vC/wyShVJZdvZrKk
	oxHRzxaLzz1FkDZdj7d7I=; b=BHzPM5MtMZOZHBN+Tahk4wR9eVf3UZ4JoQl/Bv
	RDAp6KlFLh0zSB1MQ8GDd42PU/Dbitj5AzFcgn2VXzm2fOnj/j8UL7EYw7tNMwb+
	OFk4DNILBZf/uZabL2+vRXP5osq+6bfOHaCnbJLPj/HkxXGYVJ1v7E2L1pxN4gti
	ehNb+5yiIWDCHVgMo8gcDD1XgX5xBysnUeZzzlpcCW4ARX8fk7KnjCqoDcxSrC6G
	CiirLqP9p+f5OkkEXyjceKYbtOqcu4h6Ppev7iGgAJeDxZxV7vlllsFgsmfS3PLC
	UY+w1tMJ76vXrgCQ92J4WH/Ne1xL1r2cx6mFA5uPAt6ttjLg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrwryxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 11:27:10 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a298cd62so1292902a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 04:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780658830; x=1781263630; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxL/V4vC/wyShVJZdvZrKkoxHRzxaLzz1FkDZdj7d7I=;
        b=IZc1Ef/cUJui5gSYyeNVNmlcRQfOAArb98YkeeK/Xpfi2Y3vd2oig9fta/K0P1N0hH
         Eo467VcIvlrG0Kj0znS1dkKj03xy3+im3MSSNhc65b+MtoLYRPXl9xVjZlb6JWDMereG
         V8jXAPe/5ntgW8nQCxtFEQxL8JTDgmXeSJeq+IoOWAwSXOTuGPU28ADAHe3rLZ5D/fpQ
         dL2n0jhG7aKlD1y5GzlLG6ZauYOazyd6AM6PZ/U2AYYMETD/nrtyXqg65MEwEHMHfBU1
         pbyH7SWIFWI1BpokN9QkI3Hxqe/P+xjNufciXWpsg9FICle8FtYbAAupnFqa6EWJyKdo
         S3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780658830; x=1781263630;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxL/V4vC/wyShVJZdvZrKkoxHRzxaLzz1FkDZdj7d7I=;
        b=KYDumM9tLOS9Ct1ZA9uKU+4Ym4ziEZMP6R7MWWqYRfmOTXFgwe922Ul3WfJGwnR4u9
         WiOdefvw3cxon2siC+vmLuef5bKm7IyDFH1zBf+EX6IjpSYsYGwWs3qQ8CXVHT3llXZP
         3GOm7TMbNuns2CYVq4JyIyNkvrbt6YhcScsJz6Wg4ZFCmhSuxybXdR1+YTAGeE87Bzrm
         LT3C0qNMyB0a+QrEzzba68eGIGT7GPHHDHGZXH7KXQxMV3oKcwKdizzJUyU40Q/pWazZ
         TSKwsdN44FlZnO9u76gLVZXkhqW9cHwxqsDWkDEAAYNhQYzI74dY+cX8FmMfrJloHiul
         kJBg==
X-Forwarded-Encrypted: i=1; AFNElJ8N3/dSLuxiunhMDt/XrjVBFBuahjVJeqW220kdYKXwhxIBqyjwfwVorkoz7QWFdPYnNf7B7bdIlWV86L90@vger.kernel.org
X-Gm-Message-State: AOJu0YzNOgVSFoMWnRKjG1XPdXwkAUPWnwF9JvHupf0dl8ydli1f8JsH
	QdZ3V/u4oZQlbEoRzbk9g+3pzdHUDjmzSMHrHx3rNRrsLE1sqSk2OYRowooOt8qJFgg3ICtLhIw
	UgyzlpFmHIqcYOKzwatp9wb5OQ4Ga4ksepNHFKDJ4orvwNmWTw3Y1otuiW666yXrPZ33F
X-Gm-Gg: Acq92OFuQH884OxKIHvwunCrJxqu+s2FvmHhptMo5JckItjCwh7Q5sOfofhQh52Lo1u
	cVDiTgL42jnwlDWjgKwFx8Xf7+VR1H5p8xTRRPUkkXDCtxtYYYXngX1bAQ05z1Bqi7YD30eghG6
	FvTQM9Slnkbka/ChI50FLRR2JuobnyYChTGx5WakDX2QG/YunRuvz4y8OxyaWmDQE4Fk+fzjvG5
	SXzDtf/IwZBUoO8mqmhBotJQghAJAVzPsP7thrJMrEojRrahsBl6WzT9OxW6ZGgv7OSMKJ3CTqO
	33DHLUTxNNF7qFkXB3by+o+uPTohShaw2pEr0x0c842ecv1odW1rUgB2r+HUqV13FHHuAYmnLgl
	7TdJZqIUI4FJnG2DCwDr4YFTuqk3DgEAVzNJyF1CGx3ztMowpNRx6rKfEsN+PQDY=
X-Received: by 2002:a05:6a00:9093:b0:842:66af:5bf2 with SMTP id d2e1a72fcca58-842b0fb53a2mr3043919b3a.38.1780658829612;
        Fri, 05 Jun 2026 04:27:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:9093:b0:842:66af:5bf2 with SMTP id d2e1a72fcca58-842b0fb53a2mr3043850b3a.38.1780658828703;
        Fri, 05 Jun 2026 04:27:08 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm10626246b3a.49.2026.06.05.04.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:27:08 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add Audio Core clock controller support on
 Qualcomm Shikra SoC
Date: Fri, 05 Jun 2026 16:56:29 +0530
Message-Id: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGWyImoC/13MzarCMBCG4VspWZ9AmswkTW9FXORnosFTq0kVQ
 bx3Q1UENwPfwPvcWaWSqbKxu7NC11zzfGyj/+tY2LvjjniObTMppBZaIK/7fCiOu0vMc5gLhcA
 HpERJGAUGWAtPhVK+rehm+9qFzpdmL6/nlx67FQZpP/CugeU0tRv+D5VLYYFiSkl5MV5X/jfGv
 v/EceHRYLQGEDTod+BdJR7macrL2IWegpfKJqcANUrrlJSICm0KZvDakrdxAMO2j8cTAv28Qh4
 BAAA=
X-Change-ID: 20260605-shikra-audiocorecc-85efef073474
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=L5ktheT8 c=1 sm=1 tr=0 ts=6a22b28e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9tZPC6dkgApbXn6Rl1oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMSBTYWx0ZWRfX+ZLTNjFAAduO
 I81DUX+53CIAYUm0YnWpMV0Uj8zaGdsQocrpXd67di5awC4WB3s95kp562rdHCV6XM9ovlxhgPS
 dxdWSLvPxhQDmvN0Ybfyv5lr+TBmyhIYRTZ2PRCrcunW8v6mSizT42LqCXBiR0VU4HlKGri2h78
 +56IDX8SKaVoGC2kwwTU7OELL0kuADqtzrJS9rtjEX7QXYz7JB36DAhH4ejeFRf8YeBvHLxLLWe
 NZ0UzDXWvcPsxqAs18VcykLVJr+8jBwEptDAc1fLkRO6vVhbIq8NJQj8WD7ScNlihL8RH2jWIig
 to1hgbDy8RwR3dYdftGaUuKaa+3D9Gjrm0yrmRLNFq8j8xmjTFB0besQmzTRru+fK0L2REMifSz
 107dxm8WD+ww9EtZdejQQQjED6GsDB8PpbyfggxxkGdE7twNaym6ixF3s2Rg+b9MZxPCm9YtRTc
 UfM9zKtVoxpOP0VN31w==
X-Proofpoint-ORIG-GUID: fKJeWuiseEP3t6xppf7HCWDXeGbiurxV
X-Proofpoint-GUID: fKJeWuiseEP3t6xppf7HCWDXeGbiurxV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111393-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B438647C4C

This series adds support for the Audio Core Clock Controller (AUDIOCORECC)
on Qualcomm Shikra SoC. The AUDIOCORECC clocks and resets support differs
across variants based on Audio subsystem enablement as follows:

CQM (qcom,shikra-cqm-audiocorecc): need clocks and resets; audio on APPS
CQS (qcom,shikra-cqs-audiocorecc): need resets only; audio on Modem
IQS: no clocks/resets needed; no soundwire codecs

To handle these requirements, variant-specific compatibles are introduced.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (4):
      clk: qcom: common: Register reset controller only when resets are present
      dt-bindings: clock: qcom: Add Qualcomm Shikra Audio Core Clock Controller
      clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
      arm64: dts: qcom: shikra: Add support for AudioCoreCC node

 .../bindings/clock/qcom,shikra-audiocorecc.yaml    |  62 ++
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   4 +
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   5 +
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  13 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c              | 813 +++++++++++++++++++++
 drivers/clk/qcom/common.c                          |  24 +-
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    |  49 ++
 9 files changed, 970 insertions(+), 11 deletions(-)
---
base-commit: c1ecb239fa3456529a32255359fc78b69eb9d847
change-id: 20260605-shikra-audiocorecc-85efef073474
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v4
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>


