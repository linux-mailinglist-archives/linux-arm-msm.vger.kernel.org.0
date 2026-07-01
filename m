Return-Path: <linux-arm-msm+bounces-115756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YVpsN6w+RWoZ9QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:22:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 384646EFB5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:22:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pCWIxKkP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WTXzWTcS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115756-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115756-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD5B5301D335
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB006343888;
	Wed,  1 Jul 2026 16:15:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870E1320CCC
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:15:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922556; cv=none; b=L0sTNeY97FMS5thKXlLwyFPUMyUEJ0TzIgXWCRRyVyQDWyHu/4/Lh45BohQRGLxJ04LpVHQwI18qZzGiJlCjG/ZFVz2eS1weD0AkAMtj3vpHoC8ra32zI9x88h9Ts9EjwJMSKVprdEYMiy8NaG5gwy/8eC43doFGMmb6XOfJS0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922556; c=relaxed/simple;
	bh=fffIHIq+K2Xt5vA/CwQMB8tzEP5cr2Jy2YbmMNydBjI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UA/HsE1wu+iLJWR58b6PQ17Apj2ST9PPiJfPXynSsaljRoOOMHOlzPnNYG6XuYyIAFyvAdGM+WsDALpjZmaEfK15q4r650e60FNc3TT1tglQqZhMB6MrV0QDtjSDJrFkNNWAPNTNhBzdNoEou+qSNNspFz9SkmluPvDuT+iVhAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCWIxKkP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTXzWTcS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoIr61553151
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kf+pwVBk5mAbEcKiU3KEkL
	A1zCtomGQqKVOFrEXk2TE=; b=pCWIxKkPE1J7j2MUqm8bIguckB3q4en2Y6TK68
	6a26I7gMeYxeJXJT47MCx+/MIAWRHIPPbzipzT/Skd62EymUx1iFG0BO9RxQRT9X
	AOiUuLLPvB9g/RX8bRarrxfttgQkKl3ukmjuYahVpZwWfZdZo+xzhqLF4EpN1hZx
	fszP8Y3zqRnYMHtZ1EcAi1UUTPULbH7HWrFcxe1V5uQJQbkuDuLska9oSupFDTZJ
	FhV7Kdj4cqmBweK17aPk5HRmL7dgXThz2FEygbiPm8f+g8AnRC7Ov+elsNwCfItt
	1Wd0mRZJhud1YW2uGtCKELqTk3r/Lln4lHCERE/UQ4+1depg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd1jbv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:15:54 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a0ea6e29d6so569831eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782922554; x=1783527354; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kf+pwVBk5mAbEcKiU3KEkLA1zCtomGQqKVOFrEXk2TE=;
        b=WTXzWTcSfWv1enyYQ1kV8ijtiVngb+t3zFOkD+0C6BopKM+2KYQl41zQ60CWu93nJ2
         uEn2EitwoBeKMD9nLySMA254aJw4ffoJA10lHJVIvJx8DdJcjgUkwBI96abuPbtKvjzO
         1G2J+Li3KK8ynmWqrHcvwO9HgGTy2/aGcKJbdYI9Kwx0S10gjpS1qZ0hL/EsC7kW2E0a
         yzZty1ZZdr61ryav+v/H1h0mLPNljdgWuG2baFZjAFCR7Mm5MQp5xhDwCQdc27hTgyGC
         qrJyxL4ys6WtQcfTARscYNBE2YQ5oLcSHsq/40ijSc9xVoHZaM51j7EHoYMaPtCAmRq9
         UgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922554; x=1783527354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf+pwVBk5mAbEcKiU3KEkLA1zCtomGQqKVOFrEXk2TE=;
        b=r6//+SnKIAwhiE63Bi1MB1QJaPyiFFVIa9k1zSQ0ObExFLCTKvND+8XOTXhqECyzJH
         tLkQjXy0sV6IsqT2y19zEfVKV9YdZC/J1H1egA53svgUMOZ1yRm/4ZaGS/UdRg42HVx6
         +clUhDUyXl4BG13VZx7HEc9iK+Kap2yOr/V9hp7Vj4BdpkctcTCGHzbgueUuRWytioEN
         PWFlLLO9ucjqPksY68fnYLFGaoj2OG2tTDeqYSDDjDHNfWgrpXEJjPaizkORoYdFtLR7
         R5sXPVYw350/sEXzs63seuFzAOyS0HgHMe7+gQkiN7aDupSzsgKMaPAk9TVHnXECZztw
         gNWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EbD9PrbQeZx7i57wXFSC1zQL2d6Ck4XeEElUnzO+xz0yUR3IjaWUIEFlxVxsi0Zvuak1GB5Yq4JHrkcC/@vger.kernel.org
X-Gm-Message-State: AOJu0YxrmSFCC6l6ADUVpHX9zCkOA1ngqfjs7kwKF7j6RZ696r2927NS
	0GmvibUWR1vlr2VYdAOrntQdvT5GCQtwV6s3yiwV/z+iHTcxyyi7zWfLQmW/qxFGCvXYm+zbyJH
	hQ2z+RXXVRQjYIPaE95XK92PlJoYOOo+uCo1xHxgw4qZjaZZsvmXIaPDchWkOeUN2I2qHcBQswg
	bqHZPCVQ==
X-Gm-Gg: AfdE7cntGN1CHOHaSwiPxgfhKBDtuh0woEX2TasFRlO4OOp91sUc4Em4y+2+n+5+nc8
	exO5g18bZXH5Foz68k2c773HVH4rroAGPItd+WGWwiGvn5FNLHurTRZC3YqIVCwS2ooDS8QBf90
	gtUsR2yJQk3h9ypqNSFFFWgUXgM9Qc1w9vYQo4f2sUuBKQA9pwQ0dWXkdQCr25T/O1d+3wDyrns
	0JZTXLGg0yn+R5fOW6m640qmVvNeA5y40yrgrOU2xexbiXosUz5Hoa0XJykSVModij1KbmnCkFl
	T5AY3j67UcnZzro07fHZ4eOuqBjrRxKu26qm6vG4TDG/vQl+dQB61lbNJhWTalJJOYWMwboHypQ
	Kk7Y2BIiEJ0QV/+qiH3HplZYPLx2nFC7k06Y5rx4RG4ECQNv12dbCoBcMAZslPkCv5QzNdWWYxw
	VYpb9qWGBRCUcgJOp3JhFKmgAzs4fIWGxbPsIqnWYLGUTfqCmw+WmhEaxS7JFdQmI=
X-Received: by 2002:a05:6820:829:b0:6a1:9a9f:7be8 with SMTP id 006d021491bc7-6a309b37233mr1197983eaf.48.1782922553809;
        Wed, 01 Jul 2026 09:15:53 -0700 (PDT)
X-Received: by 2002:a05:6820:829:b0:6a1:9a9f:7be8 with SMTP id 006d021491bc7-6a309b37233mr1197959eaf.48.1782922553393;
        Wed, 01 Jul 2026 09:15:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm299570266b.3.2026.07.01.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:15:52 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/3] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Wed, 01 Jul 2026 18:15:50 +0200
Message-Id: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADY9RWoC/22MQQ6CMBBFr0Jm7ZC2IWBdeQ/DopkO0gRa7ShRC
 Xe3snbzk/eT91YQzoEFTtUKmZcgIcUC5lABjS5eGYMvDEaZVrXG4pzix+HEXpCMNdweybrGQhF
 umYfw2mOXvvAY5JHye28v+vf+zSwaFSoaOlKu86SbcxKp7083UZrnugz027Z9AVn3Q9+rAAAA
X-Change-ID: 20260629-monza-leds-c292e68c9a49
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a453d3a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=yzvYhh2-rlWI4r5pe9MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: 63m7_ST5EZGyHJsjBfwkAsB1zmgVNipA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfXz0OSAE6rF1Ww
 gqnYuIFrAE0XteYxxH50XlQk/FIK+ORlvtuJrgNBf8HG2ob8MI6XiArTvaKjr9a9PcSuoPMD1Od
 Z8lR4IEyxKrKwyDHXwo8ai+3+8ScVuY=
X-Proofpoint-GUID: 63m7_ST5EZGyHJsjBfwkAsB1zmgVNipA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX2HBmVUO1jSro
 ua1eEFcUmnL4iuGZ2n8hsyYhEIxmyAO8knlV51tCt9vh7NF4cbvmTKKGLgN7hE1/XrRKJ+rp5qP
 JYCLwvuAB/1d8oxoSIoCuqIFbLBCFlbnrH3LZ1txFBeGTUaIs4pSNOvfC74ibhQmLcFGYO797e1
 0INkfz92CM5KRLYG9FRJfLOr71Bdt9U0ePumih7Xv/K1xZ3xkfFc9YnlVBZ7lHWXXzw48xVZvDF
 KS/cpYP/8KNm3lsnrcf11ofzBEDhl9FR22qV4+wMx3dmGmZ/5te8mjIvT39z8z8ZSYAOU1LV/7R
 RaSI0N4q3SeI+WQhbvPK9aYL91/LwzJzKn03UJ0f3RjB5YLrHDXUo6ZQRSjLtxikOiVXX1cM47S
 Tbu56tzlfjdlxAHT/Xl4DC3+00Z37rlE8l+8Ihxc25pSo1e1txX0B/+/TSUzQodYGG2exzMNs9s
 jwas2+h98Gubkx/4lHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115756-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 384646EFB5A

Some devices use PCA963x controllers to drive RGB LEDs, where
multiple PWM channels correspond to a single logical LED. Add
support for grouping such channels into a multicolor LED device,
using the LED multicolor class framework.

The DT bindings are extended to describe these groupings via a
multi-led@N node with sub-nodes representing individual color
channels. This follows conventions used by other multicolor LED
drivers, while maintaining full backward compatibility with
existing single-color LED definitions.

The PCA963x driver is updated accordingly to detect these grouped
definitions and register multicolor LEDs.

Finally, the Monaco Arduino Monza device tree is updated to expose
the onboard MCU-controlled LEDs (compatible with PCA9635). The MCU
manages four RGB LEDs mapped to channels 0–11, which are described
using the new multicolor bindings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
Changes in v2:
- bindings: Reworded commit message to explain the motivation (Krzysztof)
- bindings: Kept the "^led@..." pattern and modeled multicolor groups
  via a dedicated "^multi-led@..." subtree.
- dts: Renamed node from "leds-controller@22" to "led-controller@22"
  and dropped the unused label. (Konrad).
- dts: Moved "reg" to directly follow "compatible" (Konrad).
- dts: Fixed unit addresses to lowercase hex (sashiko).
- Fixed checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com

---
Loic Poulain (3):
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      |  79 +++++++++++++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 126 ++++++++++++++++++---
 4 files changed, 299 insertions(+), 17 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


