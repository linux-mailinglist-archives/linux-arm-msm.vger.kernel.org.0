Return-Path: <linux-arm-msm+bounces-99676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGVNMgmRwmkXfAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:26:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8D3095FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 14:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80F043150B05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEFB3F7865;
	Tue, 24 Mar 2026 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAIkb8Bz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXGswm0W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46143F165F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358030; cv=none; b=mBTB/WCe/Y2uuEgyLQp00cd6qf4Hj0N+HozuBA5x21OkMsAapcYmPMFsabpsJg6bd9W+xiHVZiw4ZEpIH4p9mTnnMxNd189iTysvZwae6O48Hlj8Vv+XlZks5HL02jtF7MLooh5afxqB9zwgwa1n4yOYb3/L96v3JCfWH4H9oSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358030; c=relaxed/simple;
	bh=fdUmE6bdo/6oBTv1gQYA8yAcgD4vDO23bl41zp+i76c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pODw55X4wyx/54cc7+1JD2tPX5nxLbkWSuxQ6vaEsSxWYzcb42rccmMgjsxRYw7K9sg00JBOYILketRL2LWRbzF3F85T7ellA8bRooLqFU3bvKwcxgZVPt7nmUA6ERKDmgTqKIbL/+HoVPcU3UzM+gpZompWLvRGsbj0iffP3X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAIkb8Bz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXGswm0W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9Zkji3903726
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4x+lKU9enbGajNh0xt13Vj
	7uSgZgTYYZnpiKoXs9f08=; b=OAIkb8Bzgdyb0BJRa+v/Pg2mlhVh7cwOpEUcbz
	apcbjXEKyac0nqGjfEHb/8L9mJsHT3L8EF395kggtLj4EvB2otjHo2wbeqkcHPF2
	AO7h9anPiQOKL3YI0jNj1NAAeo9ihUHwSIdEChJPcmXdmDbO+/I5FSpDgZAv56Kt
	BthNc0AEWUqhgLehSQnsosNYiR+nJXKQlrbl6Ar2M7L+UpX67M5hFyqUJaFEjQEG
	KSJaYddvy+uIuclSHnbvIB9sF7m9YzFKRltytetmb7W3ZBNQSSm70sidovoq2zFH
	Jt9aN3/hKhG4bl/yDeONm1QLtKkwShNB/udorfi+rfciT4xA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0j27y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 13:13:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a68acce26so809570b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 06:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774358026; x=1774962826; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4x+lKU9enbGajNh0xt13Vj7uSgZgTYYZnpiKoXs9f08=;
        b=PXGswm0WtAGoww2ecfutaV5/ZmOhk2k091rcJl78SEVqEqDjQWnRvUP+pNyfUbZhG1
         RK06oVO2EN3gc+q3Ol1dtXngztzBhZTWFw53jg+e7WaUu8NFWZbudJVmJ4oj+09hWofB
         PNsWqWJIrKy4IgSlIGBGNZOA22UCkIMhW7RzrrgepcCsdYysQxcGR5vsW7vSAm10iqK5
         pRf1FMlrYY+iM6PbuYTMTxcy5YEwCu5I1KlwmuiMzUUzgq+kLZnYN1UMobxCM35J+Zhs
         WTu/UQ9CtKPIDBlT5XYw1rOvVIXsSn+QVH9Vm/FYSnlaEFK1ryCGrNzZxC+uuqlfB58k
         uHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774358026; x=1774962826;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4x+lKU9enbGajNh0xt13Vj7uSgZgTYYZnpiKoXs9f08=;
        b=aVYMHSHZyZh5nIdC0sbmLcSxSfx/3bOjH/pzl4s0vrqSUeSep0hC73sUNGnJLGYVyH
         vq9lp+/RAuh9HnZsk0/JBNymIIWyNwLXF6CQyO+fxIY+bxsc43kvz01h8IieIl6ZyBVj
         TMEzEqu7CmrqOnNbnDRbwv+iUxrUxTUcPiELN1smlr4rcsBeKhV1TW23qqQcIPZxUyE7
         VZz3ZsaBdwsczfTWOgCDTGM44VxKzzmTaHEZHzknC6zo/JoxSn4a78msnx3vMjFdW5bG
         q6PZEy6+PDPyth8RDEGJHLe4EvyHNqd8bNl6BCqMq2z5W0tlwywvrPC0zx3p5sppMT6+
         Oi7A==
X-Gm-Message-State: AOJu0YxlNDGwZa6MitKyedTERE6O38vwXfx0ZuSo2d+F4kOv1wiLMLN4
	uVCFhMhDg7JBLaII+W07tYnwAQ6NSC8DDW5/+87tVb8HJ/0LVNWiJHVsQTh0aOWhJpVs+97AOle
	UG52+TjK8hULr2Ie4eCGaY8h7MmOkcCx2ujJW5zFHpJFpV4cpxquCp8/5TGv1zPhdL0Bx
X-Gm-Gg: ATEYQzxics03c2o2gQN3zGZjnQTqSzRsVri+rSJuaIlqMMUn1tHT+ovpYIo8GUa6FFw
	YsXgPFxw00SyOdZ0Mw3Y+r3sH7r2hERmyxsQuNNlLrWRQnffkClXSrmfl8lG9FC9fVqmaIZa2r+
	8+BhtS2Ak2GaYzhOzkQotarRE8v2VlaYp+C1im588Q9d8agURIb7Nv8kQyfzlJ38ZwFpceZ2dJq
	ES9IE152ItbXcKBThJJdMsaVxsuTA6x6XGpOZZaKmkeDax5GFiwhDm3YAcTIix1GYc0ADo09lNy
	E5crVLjWvr/TV897YicNQ2iQ7IkIH8/MH6eU+O2KspAKnmuw6m8R1Ofr0nIx1ketE08iznH5QaX
	RDPKRrk3ivSn1ddkrftRBxJSLwnZ2YxOGBRasWXip/PuOtKm1C5jCnf4wkg==
X-Received: by 2002:a05:6a00:1da5:b0:829:803e:6798 with SMTP id d2e1a72fcca58-82a8c3c0c8amr12021261b3a.56.1774358025789;
        Tue, 24 Mar 2026 06:13:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:1da5:b0:829:803e:6798 with SMTP id d2e1a72fcca58-82a8c3c0c8amr12021227b3a.56.1774358025125;
        Tue, 24 Mar 2026 06:13:45 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03be3396sm13517528b3a.27.2026.03.24.06.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:13:44 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH 0/6] Add QSPI support for QCS615 and improve interconnect
 handling
Date: Tue, 24 Mar 2026 18:43:17 +0530
Message-Id: <20260324-spi-nor-v1-0-3efe59c1c119@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO2NwmkC/yWMwQqDMBAFf0Xe2cAaq6C/Ih5sstX1ECVbQ0H8d
 9P2OMMwJ5SjsKIvTkROorKFDFVZwC1TmNmIzwxLtqXaPozuYsIWDXWu9R2TZ2qQ6z3ySz6/04B
 UYfw7PZ4ru/d3geu6ARdHHexvAAAA
X-Change-ID: 20260324-spi-nor-09c6d9e0de05
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774358020; l=2643;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=fdUmE6bdo/6oBTv1gQYA8yAcgD4vDO23bl41zp+i76c=;
 b=R1f/ekuseTAc7pli1TlKnZ9asu9tnbRSrSI5w0Ut6bL69Rv+VbvW5BZCG+ThPaoPQ9PpmCsB/
 Tfcrmx7cRlkATCyDWDT4qQWJei2MRURkophAWGdBlGm626nvZv9vQMt
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: jn5haZ9yNWsKYDEkj0a60vwZuRI7J96p
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c28e0a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SJd9AKo0rAINbb2rthEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: jn5haZ9yNWsKYDEkj0a60vwZuRI7J96p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX0zsO8m3zKtbm
 WzftjAA9e1rXG/KeiNI7dghaWZwmJAFyvLcIQRyCg7satbtpc9E9s+L/D/kDXsBYwtIH7559OD2
 BfLVVHPgj0BdzMO39CEkTw1JyWjK04ZTaDl+aqWNd5CzaW12O2cH7sB3SY2mGFBNU0Y5lDq8JeJ
 KfqHj/ifkzlTlbiBQfMOfXvPGSozjzMxPR2FtyXjy8kd5phEKeICdWBU9GFVPly/r4hd8O9t8IY
 w3KRvHOfxqO4l28Ul8rK0aKaP1xFJ3OznQMRXOi14AKB60QB37NWMhWlzlYqxaNOoF6h7LztYVO
 r+eaAQOQZ+c7YC75leIJu7x74Qg1PuUQtfrrWKOQZXL8NvEweKVChiEQjT79kKG3o9IAA6yO0KE
 N7Kxr9weEPUXRkSDlSGFCk5iYPFs06hrTV7wLNiU8eiaCn9xAekEz6+lN8VXLwdfBfKRgEwS03W
 oLjUbTcuKcVCHxf/07g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99676-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viken.dadhaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DE8D3095FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add QSPI controller support for the QCS615 (Talos) platform and improve
interconnect bandwidth management for QSPI controllers across multiple
Qualcomm SoCs.

The series consists of:

1. Add QCS615 compatible string to device tree bindings.
2. Add qspi-memory interconnect path support to the driver for proper DMA
   bandwidth allocation.
3. Add QSPI support to QCS615 platform including OPP table, pinmux, and
   controller node.
4. Enable QSPI controller and SPI-NOR flash on QCS615-RIDE board.
5. Add QSPI memory interconnect paths to existing SC7180 and Kodiak
   platforms.

The key improvement in this series is adding the qspi-memory interconnect
path. Previously, the QSPI driver only managed the CPU-to-QSPI
configuration path. Add support for the QSPI-to-memory path, which is
essential for proper bandwidth allocation during DMA operations when the
QSPI controller transfers data to/from system memory.

Set the memory path bandwidth equal to the transfer speed, matching the
existing pattern used for the CPU path. Enable and disable both paths
properly during runtime PM transitions to ensure efficient power
management.

Apply this change to existing platforms (SC7180/Kodiak) as well as the
newly added QCS615 platform to ensure consistent interconnect handling
across all QSPI-enabled SoCs.

Testing:
- Verified QSPI functionality on QCS615-RIDE with SPI-NOR flash
- Confirmed proper interconnect bandwidth voting during transfers
- Validated runtime PM transitions with both interconnect paths 

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
Viken Dadhaniya (6):
      spi: dt-bindings: qcom-qspi: Add QCS615 compatible
      spi: spi-qcom-qspi: Add interconnect support for memory path
      arm64: dts: qcom: talos: Add QSPI support
      arm64: dts: qcom: qcs615-ride: enable QSPI and NOR flash
      arm64: dts: qcom: kodiak: Add QSPI memory interconnect path
      arm64: dts: qcom: sc7180: Add QSPI memory interconnect path

 .../bindings/spi/qcom,spi-qcom-qspi.yaml           |  1 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  7 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           | 12 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  7 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                | 80 ++++++++++++++++++++++
 drivers/spi/spi-qcom-qspi.c                        | 36 +++++++++-
 6 files changed, 134 insertions(+), 9 deletions(-)
---
base-commit: c369299895a591d96745d6492d4888259b004a9e
change-id: 20260324-spi-nor-09c6d9e0de05

Best regards,
--  
Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>


