Return-Path: <linux-arm-msm+bounces-119166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0WhCHdcyV2oEHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:12:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385C75B517
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:12:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=E8s1wrRr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SPc7proO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119166-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119166-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 723F2300CE8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499FE377AB2;
	Wed, 15 Jul 2026 07:12:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65941377AA6
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:12:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099539; cv=none; b=YmzJjYZFhHTWpOnozm6fVruyoVBkCQ3usAvqgjxLQ4SfXH/rkV6WOtMP1umw++C+vpjAXZDKCcJOJ8qmarU25wlah+BvQpFBT+waVk4ZdJu0N74yN3VaK0ov8Y5+XHXZ1rxtybRBRO1wTSPdnAyYUwqPA+go5XoNIvtS59DnalA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099539; c=relaxed/simple;
	bh=iFBztG9jMWns9PUsQYnRaPSz/7W06Rey7Szgiz47mfc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tNp+0Y2/LIa2mhJca5JcOtC1gnFSUyXhy0mN8lMRy7aNQvNdR6udZmP3q0LQXc/dG48iozfs25qz9TDp5aELYVLFn6PzHt1EiGX1SxYFkE+m+cTA9UIqy+tKNXD4dlbE8ULvEm/3fb9Rjfsb3vOqwQyF+OyNUgTw9sbEnQcKRB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8s1wrRr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPc7proO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lPLE2555680
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hHyvm5yjf+mJwEy/Pz9umA
	/wu8W0G+A7NroJGafo1HA=; b=E8s1wrRrFSxVYxlk+Y/tCfh8c62Ee/yQsQ/JUK
	gNspZ+TP+BdldMCkjrhfM5I5GI76EJdOZJNcoDKXvMfC6ZMrID9Lj2iI4q748E7I
	NUjPun0PB2iI9+hfcyrC69gtxHAJSqga9UYbeDNa+eJ6cAEEL5hwtkMTp95tQfEL
	92zOKGjYc9gjrR41j8i0fZwd0dK2IYyN6pfKMdhF8t9HI70p+cvimsUSZMNX7qqX
	3nRdec9qhha76ENjksf069mGRY34LZc9o3RD4TvxMcXwbE756KFwcrmAkerilP7J
	5O7KPxSJiIPA1oyYuDhRW3PkcDwalkntMLIR2R2y3VKW/CtA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9ktffw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:12:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso6489831a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784099535; x=1784704335; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hHyvm5yjf+mJwEy/Pz9umA/wu8W0G+A7NroJGafo1HA=;
        b=SPc7proO9fyY0wNWpQbRJa7Kf+Q/HP3EuyAG9Q1B7nbLOtYHPro/RDy8dcRjzXoUd2
         6oGYDARDFJQBiXuPxDKGxrJJNcCK49ZAhOVpceKRAHPlMwalrIXsBIO+4mOcJk8W1etD
         /R0KOKLOC8GQ9WbeCalb24c7xmRDvKobYQdgnZ0yU5LyWBJ1onkxsFEaX0uuEp+0TZye
         P833r24J0sIVPQEx864vb+qtpQuvdDkvF1ALEK2ZguTeWvmeRZqHDOHohAWi/YF2RP9n
         7C8J19xGL4n3BMO5kf7P4tMggAYxpPGua6+OhPADFI9u8l2EFQ5Gyup0pxyau/NVK9sU
         g3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099535; x=1784704335;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hHyvm5yjf+mJwEy/Pz9umA/wu8W0G+A7NroJGafo1HA=;
        b=jCAWwQ+2J0dSDe35CkQ5B+Rv9hbbpgO8b//K2kcBsdLTPhV4WZkDnwsjaL8BtE5gsj
         5vPQoV92+ZIXfX2aZrq9zly4/eAayIC/G1UKVc7jOoRbSSbq+4oMJOv8yIR5wX0MRy5M
         oB7WSO32kG9SbGli5LSmdSe4BlJD5KEJWMX9QkxVxYmX/s5V7HqdAmeoq2srfmx2Myzv
         wCdufLZntrQijHXGWGl1GeQpQ4vAmi0zyK3Beosi7FigPwhFBqoAxCdMtINA4cxdl6h6
         3/aQRdr2RgpZ5FR2UdOCAiuzPELwUYt5PgfNtTwOEcBd/1yqbviQCdaWnqtM9zhTjIUS
         o9lA==
X-Gm-Message-State: AOJu0YxOr/c32EkJ8lwQH+BnFIeIG2WkhspS9mTpfTWfA8XnYSJtmtNQ
	rRJWPivQVLtkqLDL/LS41SrP8pjOanuQYyA8iX+H5d4U4XVXEbiKF6n3YbSDqQiQNdCsElrjG7k
	Xet48spv+ZaoMmQcW1Z1CArtnsrgdHyGoqTBdwAJBMEZJPtKYkHfxI/3/Ki/cNK/bX5Lz
X-Gm-Gg: AfdE7cla6+bxUyMgVeO0qf6jnkovzouF/obrwUaTwzb7r7aa6+VWZ3ETSoWMpB+B8hg
	nNzW7SeKIUQU4ll63mhWsmymnv8C7JblZo/nuQEz88P4cKaZWAGaG/pmqSRan6aT88dfM+mCZr0
	C7xqolCOHPtJQsHifAMip+9aQVEazvxV2+cYea19WX7ffGpdEwM3BjGllqA/9K5U6dQ5wI/QHwV
	NaJcL3qTn3JNjdVe6B3U8bLKF1HNNThqa2yQQ+76rW5Nv5TbIYn9+x45xV0xqv0aNHeYRdaucBq
	6KHAYSK69fhLtiKFZT6VX6kqlCL+BiHQK0qRSVrtF5nOwp0SGZDxfg7l0gBd8jZQhtoRoGMnqTS
	kM6Aa9wlFdjjycqTibbmVPqG5ilPSkWcVBTavGUmY3S4QfU7M90OV6rnxHtlVSStXEoNnX8pGmb
	7a1Io9GMnOoWqxJOGG6dLy+lM1ZvBgrvwl+/cig3ot
X-Received: by 2002:a17:90b:1c0d:b0:387:e0bb:57f9 with SMTP id 98e67ed59e1d1-38e1af82809mr5580088a91.42.1784099535084;
        Wed, 15 Jul 2026 00:12:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0d:b0:387:e0bb:57f9 with SMTP id 98e67ed59e1d1-38e1af82809mr5580050a91.42.1784099534419;
        Wed, 15 Jul 2026 00:12:14 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm80216146eec.9.2026.07.15.00.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:12:14 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Enable mutliple peripherals in IPQ5210
Date: Wed, 15 Jul 2026 12:41:38 +0530
Message-Id: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKwyV2oC/6XSS27DIBAG4KtEXncs3uCoqnqPKgsMQ0MbP3GsR
 FHuXuykq3aRqgtjDTYfg/gvRcIxYiq2m0sx4hxT7NpcsKdN4fa2fUeIPtcFI0wRTRQQA35KgIa
 TumbaaVYX+ed+xBBPK/S2u9UjDsfsTbfJorYJwXVNE6ftpsXTBHeTL+sbTMmuu203z+sHSQVE5
 yD2g2SUwEyBQC3zAh9qFIq8dimVw9EeFrTMw8vvkCKCVEQyU2ouGVdAYbaj9fn5sG3Z5vfZtrZ
 92KOSmNySKalglAv9f1BB7yJCvz/DLPIxJRFKa8e9ZvpRZbmcIfRj18DMcktB+gptoMxL+bhBo
 bHxUHenGyJRYe2MFijwcYSD7VMCd/iEmefjCG0kmspWTpq/tOL6Y8gpul19ZZRU1jMSAv8FWUK
 3j2nqxvMa5pmuqbtb+ju3KxUcGoZUOE/9D6rYXa/XL25dWBAYAwAA
X-Change-ID: 20260706-08-dts-e830bb27c72b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a5732d0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=v1hZQnKUEnapy_KJ6JEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: GV5QOpZE32OHbvrzNUkhpIAIB4H2-fwd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX3/g/CXPX/1cD
 ORFx7jQB8zn2O4QdpjSwgIL8al3QtyDEt242wYDIQWbNmkqju8FGZZhVBJDQCTbe8bqTvWcvXY5
 0kAVtMUAtVUhEIpxT0gSWQv0fQ7cc/g=
X-Proofpoint-GUID: GV5QOpZE32OHbvrzNUkhpIAIB4H2-fwd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX4rWBxdB58qIj
 bhiAOV5lCwdf1aXyULN8gMpKzXa3yZlKC/6FZEMeGF/WeDW4mb3GVP85WbkBWwBr/zhFtrGJGMK
 ASxlXGDhGc4SYq08G7zwMerDAyhuJR7SZNn8ubH1LbRm8wg5WyMN16fFzldNkaQHdXc4aTlHVA+
 SA9qelF7q1AQEvDX8YwtqSsfzzV+4HbFjNHCW0afJs+bK7bsIpsAfiI+i2q7XSVBiTG3TgF7Yv8
 jzJIV52dIf4WOzSGX3ijVJEzxryjIdXOMUTiNH18QV6WWhKWlcrZFiUnINCfDcFPYAcNtTMIWqO
 ZV5W4IjmYRHfjYyvWAjdz+1lyc6s5C1fl3dlhFO5VaqomUsxzHeMumw8DdrCrJ4CfpfV+TNZm0B
 u4VwTlkCXySm6EyqqC1aV5Zsbq41qANElwQg3exaAynQ/0dlXR9s/Y6suZw9kP3ihBcpnPtE9t6
 1U1iYOcfCxTCaXe05lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119166-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0385C75B517

This couple of patches enable mutliple peripherals like USB, PCIe etc.
Additionally, it enables CPUfreq and thermal tripping points.

Please refer to [1] for initial review comments on the PCIe related DT
changes.

1 - https://lore.kernel.org/linux-arm-msm/20260514-pci-ipq5210-v1-0-a09436200b35@oss.qualcomm.com/

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Changes in v2:
- Change usb3@8a00000 -> usb@8a00000
- Ignore other comments as they are covered in the following prerequisite
  prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
- Link to v1: https://lore.kernel.org/r/20260707-08-dts-v1-0-fce82e14cd1d@oss.qualcomm.com

---
Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals
      arm64: dts: qcom: ipq5210: Enable USB and PCIe on RDP504

 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 131 ++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 616 +++++++++++++++++++++++++++-
 2 files changed, 741 insertions(+), 6 deletions(-)
---
base-commit: b96de4afaea292f70aec05d40def1d993c04d71c
change-id: 20260706-08-dts-e830bb27c72b
prerequisite-message-id: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
prerequisite-patch-id: 0b6145b6635b18fe79fbbff5815041b43778c5ed
prerequisite-patch-id: 924c6ff7baf4283ac7991ee94c803a00fc5cece4
prerequisite-patch-id: c2fe1800fe769dccd37f94c19860a07f979e3c4c
prerequisite-message-id: <20260604090528.735236-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 5aca3ddeccbd470bbfd0c6a54358338fb8cb8336
prerequisite-message-id: <20260615085218.1421347-1-varadarajan.narayanan@oss.qualcomm.com>
prerequisite-patch-id: 66aa95814074faffb61393faa30396c42af41126
prerequisite-patch-id: 0a03dc1c91a2f0c03af823aa43f59a9005eb8607
prerequisite-message-id: <20260616-pcie-phy-v4-0-504677c3d727@oss.qualcomm.com>
prerequisite-patch-id: 7c93e925f6b3932bb699a66180b49336225dd999
prerequisite-patch-id: 5d3ab24adced9ec6e5a0d302b021e9d36d353975
prerequisite-message-id: <20260706-qfprom-v2-1-f5d9eaf12d55@oss.qualcomm.com>
prerequisite-patch-id: 9159005897e044423b7b72b695c3e31907f8d381
prerequisite-message-id: <20260701-mailbox-v2-1-5e6ebc874e4e@oss.qualcomm.com>
prerequisite-patch-id: 956b405a71f384354b5c35a44b97a0a2dcf65eb3
prerequisite-message-id: <20260703-apss-clk-v3-0-4785e89a9c58@oss.qualcomm.com>
prerequisite-patch-id: d9efdd8a09b028b1343243c5f0e78cf3e8b1e253
prerequisite-patch-id: 36cf721e00f3f5bbc3ccdc0d39503c5899771085
prerequisite-message-id: <20260701-cpufreq-v1-0-98656ad20ff3@oss.qualcomm.com>
prerequisite-patch-id: 35e083bb85434a34d86467e53b9eae14f78da125
prerequisite-patch-id: eb94fa7598d7d17822e0acf534c3a960f30c14c9

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


