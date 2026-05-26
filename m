Return-Path: <linux-arm-msm+bounces-109712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HbyTDfkrFWpITQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:13:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 836DE5D0C0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 07:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7999B3014BF7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 05:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16B8835DA40;
	Tue, 26 May 2026 05:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqdfGxrb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RcIIhT/z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F32BD11
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779772406; cv=none; b=P48c1DjuSIt9eBb55z+VHV7Q5DlDkN/uT443C9uw+C8Na8QUwlW51nd009MpszGvH94qza82pyA0P868RIM0cBPZTFhCFt4o84Me82IxUVM1BCNV6xjXHU34O6ko87bBtCnuYvqFBUP3sCHsVTt09iPycmrCmRtpd8QI8cIMqjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779772406; c=relaxed/simple;
	bh=i8xIVDkEZbfitPKLyNZMLZ+kPQ2krwQdgOM6EvC5jKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UMjyHeiIVWkbsycOIWNBL5YPLYcnK5R9Gzvci3Eh2kgsK/PTZ7Syxp/AEUDoVqI4hfbrpQh38xI8MVcGscIfDSvAiqB2enKDC/er0x4heeXaMrKuwr6LmjbHdTSWHWj5y14LtrcZnwTHW/5VaeggHjIcGts7Kbtf2e+eDPlPY/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqdfGxrb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RcIIhT/z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PIlQ3U2146351
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Fjj0r7FjNz9men9qfkiywh
	V/7oP7JT75ZB7jNFpzrig=; b=jqdfGxrbvNGIJe7isTa19ZcQiVRG2HQtbFz12Z
	bKMMd/vTvriKBmYbGrehsKw69aLdyi72LsHq/d02X+X6vYzrubfjS4oEuaoM0IuY
	6kKNw+Hr9ffUAjQvn+7D+anAtiehNBR+gdm8DZ3FYZH0uprJQ3r9Ly3ZFKP1+FLk
	rkSJUkj+xFKWckVUAUMRxOTVz+vBJEheS/nOdwdvIUU35iDGMePj6OH0XwWQH2KN
	b+93zAX/vOuxnGNHr0g+hzi5P/yhA1RZS0ZoujtyocJSpmpGw9Q23PH8vxLWCTtO
	ZDm++27VwTXS86zOqdiOATyqEzQS8q7DPIkpcT/zFiPFIIyA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv2y6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 05:13:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1361d52b3a0so7763156c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 22:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779772403; x=1780377203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fjj0r7FjNz9men9qfkiywhV/7oP7JT75ZB7jNFpzrig=;
        b=RcIIhT/zC6IemZcrc2bvlqiXxUNg+Du1VhkrdXcPyWCaBVKE57/Re6QQNHdWMp+jHL
         A3fmE2Dy5Ncdozi9AAgr9Nh362gw9fszYp11+qLitiBVkBEymW6YO7JWDKCaBrB0JkwN
         iqAU2FF3RWxh/h3vnYjlAnyLXmGlSuQVGp4Fx1j2nGqkxZbJiDKAtd3+il62R3HibG/Q
         JPcLuntyJzAOOWF4YxVroxB8tJwu9Q+w1mmIVy+zMaH3nfUftAxAfkPcFb972c0hm58c
         ZpxtWzs39RntIntltvZJKQZ7sJ6cODeEorecD7uqtLAaV/O8gA7SK/cQM8W/73CEuwER
         OS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779772403; x=1780377203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjj0r7FjNz9men9qfkiywhV/7oP7JT75ZB7jNFpzrig=;
        b=du9LEwWO6uNaeQBCSIShAoZDANi89oCP1HFrYvzdBgo+tAHMp9HGEalktZ1WjZHCjt
         57TtVJ0OR7NpXYebT5HPFVXYbuVeEqrFbpNnRMIJEOnSQvhZBFyDifruMLzpaX0TJkgZ
         pF8ruMlWfBqofEKK39/JrtvkrGfhmaRkqI/7Jx8zhgQ9X9/wmmiOaW19KGJcrFKuJQvx
         mUqXKwVxToKBYhABh7rTTrAdhQzYzapce/mM56UG0jIq5acyczUjTTeFeseq4y9g2ESs
         xz1eZGAyzJS02jjtgpmQujSZ2sRefFfnetpI7676TCBUmo85Fvoqb0UXuyblp7N4FVjr
         SOKA==
X-Forwarded-Encrypted: i=1; AFNElJ/FrmOG5owKytsOq6Ll1cDSZIO+fxz3U0s52J5tFNvSY/xS/aDkHo5/edh9i6+cxvZtNn8XIrBlH2v11Uwp@vger.kernel.org
X-Gm-Message-State: AOJu0YxBpd3mpI1D7LxwmnYN8Il2h8B3uV0l+q20YvYY/oPl4quSYtzb
	+YJc6qefWFd1zekZTHr3gvV2aYjsRhPmvPcpke1j3gEG7OopMHU7TVvsBC2ss+T5hsmrBVdPJYO
	mbma4T6H0Ssllzz305zWDgspSep+/nwywDG/bXpXTGusLqiTcE+l6bQ5IofEJt39BCIAd
X-Gm-Gg: Acq92OHNDIhy51I1WWGwTbMdz3I85wz+KOBLsKuGSnEVBkY05eNgAL/QcldN+qahcC/
	tUGO2wI2YVeSf9gQclR3r0REp9q9oSHm07gZhvSEVllCFVXWsE2P5F9cpkNz7aWdB1bkR2BPEZH
	18FGJBZT0a8yIBbuJE3sDbqhFhUUQXJVhBTY2DFLJ1g6OfC27dxdjDUb0Uxg0vAPMGrZOrUD2Ft
	grcGsQC1I94nqsOGK66Bev3zJj0Q0NnawCX2vIvyFUNZWF1B3Qw0KM7Mi1h3MP3a/0Xk0nD7X9e
	DPG2To5+0kYO+6A6bfUNDW0gyZMLQHhuFM/4EGrwuGFLLDcdsJQvoy9w7O0df0qYntTQ+3ypCZq
	vWvWMvA5AQB9dIT8cMXTZra3NrbfwAO9DIYFwMXUumzYpaEKKzmQjzjcCxW2Z1aThMmkajptBpl
	1AXmaFCg==
X-Received: by 2002:a05:7022:2528:b0:133:598c:2b1a with SMTP id a92af1059eb24-1365fc70587mr6195135c88.41.1779772403149;
        Mon, 25 May 2026 22:13:23 -0700 (PDT)
X-Received: by 2002:a05:7022:2528:b0:133:598c:2b1a with SMTP id a92af1059eb24-1365fc70587mr6195109c88.41.1779772402412;
        Mon, 25 May 2026 22:13:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm5423053c88.13.2026.05.25.22.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 22:13:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 RESEND 0/5] Add initial device trees for Nord SA8797P
Date: Tue, 26 May 2026 13:12:55 +0800
Message-ID: <20260526051300.1669201-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0MiBTYWx0ZWRfX07+YL1mewCbR
 XdxzNXzz/xfA6yzv6FijQqQxB0+AZANdBOqJq6Zvi097M5tRRVCaxmnsW7gAaLmJs4YqX+hbMKc
 vTLgQgbvgiu/jpXiAH07SM0k0kr7bIP3n5K1aIFQQ7qpZMjwd9E2nTZffhIhL0vKva78QLRdCwW
 H/yE8EXq6PfdkPRW63/3C5WV+5ALYWHSABHZu/d26OdLF7kX38dK1GO1ptHXE0cBq4Uzvv1o8TG
 dKtBg/jUkZei+clRDoUECMRFMh9MOv9dbWnbMN2re6EA2L8SA0lfo5rZQGrA6NQxW3K6Ep12HFd
 q/NrZqOgEHaHHkzS/o7v0zDRgoG9C9yN8+jf8jdhyDdrTkxOgpJODMACR7HJIONZwY3n3FRX2W6
 9ShTRmEY5PtM/cSwX3+zEuUjOBCMO8tWbxUsFDwc0DhMqNFzVCIGh5XM7IHgPW0m/20PP4kctnE
 yg4C11d03Eg8iwbcwWQ==
X-Proofpoint-GUID: gV7CdFaRzpN1AANPoY15_SvbrOoo8ToE
X-Proofpoint-ORIG-GUID: gV7CdFaRzpN1AANPoY15_SvbrOoo8ToE
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a152bf3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GKQnK2gSpAXo-FtYTtoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260042
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109712-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 836DE5D0C0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[ Resend to correct mailing list address ]

This series adds initial device tree support for Qualcomm's Nord SA8797P
SoC and the SA8797P Ride reference board.

The Nord is a new generation of SoC series from Qualcomm built around
18 Oryon cores (qcom,oryon-1-5) organized in three clusters. SA8797P
is the automotive variant in the family.  The IoT variant IQ-10 will be
added later, by sharing the base nord.dtsi with SA8797P.

Dependencies picked up but not hit next-20260525:
- TSENS: https://lore.kernel.org/all/20260504081236.825755-1-shengchao.guo@oss.qualcomm.com/

Dependencies to be picked up:
- RPMH powerdomain: https://lore.kernel.org/all/20260414035909.652992-1-shengchao.guo@oss.qualcomm.com/
- APSS SMMU: https://lore.kernel.org/all/20260519013950.873105-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Rebase on next-20260525 and drop patches/dependencies that hit linux-next
- Improve commit log of "Document SA8797P Ride board" to explain the need
  of SA8797P model compatible
- Fix the real issues reported by sashiko-bot
  - Fix unit address of pdp0_a2p node
  - Add missing compatible for i2c15 and spi15
  - Drop GIC_CPU_MASK_SIMPLE(8) from arch_timer interrupts property
  - Update commit log of "Add device tree for Nord SA8797P SoC" to match
    code change
  - Sort sa8797p-ride thermal trips in ascending order of temperature
  - Fix sa8797p-ride thermal zones with identical trip0 and trip1
- Link to v2: https://lore.kernel.org/all/20260519063505.883379-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Rebase on next-20260518 and drop dependencies that hit linux-next
- Include SoC ID changes into the series
- Include ICE binding change into the series as the prerequisite change
  from Harshal [1] was merged to qcom soc tree instead of crypto
- Improve commit log of SA8797P Ride binding change
- Use label in nord-sa8797p.dtsi for referencing nodes defined in
  the base nord.dtsi
- Link to v1: https://lore.kernel.org/all/20260427023455.236410-1-shengchao.guo@oss.qualcomm.com/

[1] https://lore.kernel.org/all/20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com

Deepti Jaggi (2):
  arm64: dts: qcom: Add device tree for Nord SA8797P SoC
  arm64: dts: qcom: Add device tree for SA8797P Ride board

Shawn Guo (3):
  dt-bindings: crypto: qcom,inline-crypto-engine: Document Nord ICE
  arm64: dts: qcom: Add device tree for Nord SoC series
  dt-bindings: arm: qcom: Document SA8797P Ride board

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../crypto/qcom,inline-crypto-engine.yaml     |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi    |  937 ++++
 arch/arm64/boot/dts/qcom/nord.dtsi            | 4513 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8797p-ride.dts     |  306 ++
 arch/arm64/boot/dts/qcom/scmi-common.dtsi     | 1918 +++++++
 7 files changed, 7683 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-sa8797p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/nord.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8797p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/scmi-common.dtsi

-- 
2.43.0


