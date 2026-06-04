Return-Path: <linux-arm-msm+bounces-111143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7giiFKchIWrc/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:56:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A163D68B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:56:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ElLMUu7E;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VJPY0DHw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111143-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111143-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6562D305BB5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1383D47AE;
	Thu,  4 Jun 2026 06:51:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048EE3D8910
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:51:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555870; cv=none; b=k5XgqQu0KItW2m3UcL4R17GQFEjo9hkDETXkCkUa0xLo4lb0xDT2K1QuDI40fhDIsSzwxbUhpsUj3TdBZ4hxnSJP05HjO6TqzAFqM8MEYtq2dFpViwaL4x1M6neMvP8bwUHMqLSTFD6EnmTyllnydNf4uMSYykEOvyoE2+DCkvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555870; c=relaxed/simple;
	bh=mz7sc1Sr+mYDYtbtQQ39lk6ZrrViCbd7vqHVpdklskg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXIArebPhFWUfN9OrcGf+2fsVIlElV+/LYc1s8+o2e3RifykxigQDOtdS3CLH5wk315ob1dk9n5DJcuDGDrCkXmSQOrCsRmGuJlLx6X8DhAQNDVb3ZmezRZSAcM19iSY8+u4IbjpJvKyoqJ6UxrWANaSbklXsAbI4fFP6BVyrco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElLMUu7E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJPY0DHw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653NkgAg1476841
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ASBcVGm8MKAYNVHkEl0QaEXtk2qpd/tJX2lsIZT5/FA=; b=ElLMUu7EGDqc0Y0k
	caSnvHiclcm6Dq2SX4pBSLgO6baDCctWgDOFI2VE96jfFDZc7f4lPc/6kO9rQhoM
	4NaTjmDxGUUrIeokPJ12vLChuyQqJra2WyqLY7zoNmoE7eiB080wMsHCEpUFOHR7
	IMOH4vA2LVKIvcy8/h7ncD1Cux0Pxq5hIwDYP9VTLZP4coml8lXg4udWrs+E4SSE
	W8DAa6DaqMagCkqi5uCPbtz0VsoP82g9MSDLoGsx5W41CsCycR5PTSWrRwPsoRhs
	UOomdZg3R0CYwIogHRP8LHQc2X+MBKE21vfAWT78RV0AeQwA9LAR4jlc8NDjNGDb
	vzW5xA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejp6nudcm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:51:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f3e4728so278895b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555868; x=1781160668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASBcVGm8MKAYNVHkEl0QaEXtk2qpd/tJX2lsIZT5/FA=;
        b=VJPY0DHwUBEraZbAhPq0lj0a551xPEUQbDsghTEyQNebfVa9u+Gr7R4RwOPz4Vct+/
         vzxdJWGTalu2eii0u/USHlOHGYaTYfN7kbppLu+CnlEmH4l7Efr018Ma3U/XxthGkeYf
         fzR0WtPeYID0J+14NurPooHV47mUirT7mbEJZm3uuGEOmHkRC8qub2anK9fAygSU87eD
         Cq8idu+tTd1uN2ySKA4pkuvojPmF7Q4oFo74fOar//8XMa1LIqH64Wke4yYAhYb+8Qgt
         QjN91d+lcrpPtG/UZqxBmChMmEyaNjuxZikx0e8ugCXOHUBFpDgI5LGoGLvmU/QftMK2
         wOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555868; x=1781160668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ASBcVGm8MKAYNVHkEl0QaEXtk2qpd/tJX2lsIZT5/FA=;
        b=W737P8BKDFk3U+fuI84TogNQes5FIELfQ6XK6V63GmejcxpLnf2WMGhf1eY0s5W1+v
         346EpftycrbtENTHEo6wjQ75x5TibYDu7WMKZQCQVUfgHfbwotY7OkhC/zYL1yg6VoWx
         Qih2VISoWSPMnWoh58HHyy7eByQ6RLR+fTkLeL5je19N48GqtgXBZ7sOIYQSjB5nxITK
         sy8fO3kEx2K1mui6PUYELZ3isBQuwPIhVVXXDdjM09nYCctnDugrv1ZImwDZYc2yMqvF
         mQhNXdrobCrAVt+EHtfBId/6twnwCEKzg0+U4idC9ed6XS9yTGhNwqPNFczTRrl/yOCc
         HtsQ==
X-Gm-Message-State: AOJu0YydJ2c0q1QaJG26ZBwOymM2edOMtGyqB6QLhMXhEM0AlZOeDk16
	XMvjpmfx+O1lkW9WvqYc0M7jUfCdaZ7z6qATO+MuuR2mvZ0kWmXYQh8sfC2bBeyNQJ+GF0cVDib
	/Peb5doL2EtEZQkkCT8evOLaaMN/mQ645no61tqp29c2TY0/NVm9cR2KVB6iICZa1204g
X-Gm-Gg: Acq92OGUyIek6M2LNOHPCE9n0dyRNNYNHtxL4UKB0XPRgIvx+iiq2TcflqJqbWixOek
	ho+D86QM1fagjlGOJoUD+b6k3rDciLdyVPvnzmOr3cOhIv2catmaMzW4WAzWzkTeB+9XU73BzwZ
	7Bi2ztKLrCd8Tz2RULgjLgC5dzPUJiVfCXIsqiFK/be4ybuS1tS1EO8584vyQK65dnk+zEPFwO5
	ViDMU0jV239Jcirut+CzOCK4/SsoEz8uHx2xTcmytH9Fh9Jpg9AjzrfnqloL0e7uV3p/QnTOm6Z
	HTby2Um5zeGqwg9Hc6te4N93ufOml1ccXKnKiHi559jQDhFTcjXAl8BNRAoj8XbbEMcqZJhXxFZ
	bxy5Yb53XTRsmi/zL8Sr/TtMKFetecH+8Th20PJ7CXsyLgeLp6zakvd0eB1P5jF7wYg==
X-Received: by 2002:a05:6a00:2e05:b0:842:4982:82a with SMTP id d2e1a72fcca58-84284f8a3d6mr7192448b3a.45.1780555867642;
        Wed, 03 Jun 2026 23:51:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e05:b0:842:4982:82a with SMTP id d2e1a72fcca58-84284f8a3d6mr7192423b3a.45.1780555867080;
        Wed, 03 Jun 2026 23:51:07 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm5365894b3a.15.2026.06.03.23.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:51:06 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 12:20:35 +0530
Subject: [PATCH v3 1/4] spi: dt-bindings: describe SA8255p
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-enable-spi-on-sa8255p-v3-1-43984eac4c67@oss.qualcomm.com>
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com, Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780555855; l=2630;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=mz7sc1Sr+mYDYtbtQQ39lk6ZrrViCbd7vqHVpdklskg=;
 b=dusx7NPhon6EDMAMjmIOoMUcME1sDXk6im6cz4qrnm3W6BmnzLuCezH9MxyO3VH7YUQShg6tA
 pHkG01IJd69DcM5ztXD1yLVwZoIZZ/RMYIfHMuaMUGHwzQ+CIcHnG3F
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: je0nfMWUcjiU5-_FAUi6ESZLHzWR4zjK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NCBTYWx0ZWRfX7hG+eEUrxjDZ
 udU2j0kZNve/XD43kawPOZBUeAUn/FoyESwhoOCwRWkpkvcjfqCW+WBgsppCWEQ3Lz2kCCwJEzt
 7GxKwyOAngIveiNpomI6cCUnV4yyoKmmsoAoMqLHgjJ9k4OdfNg1Qz6171xUaldBZX/zKVJtWJW
 UcvGihlMNEsVnFytEzHo6bATD93QWSZXEzVpvQBkntLDBEc39/6ss7uIGPluk7DowYwrB9ZFtj6
 82dN8r/iqLORYW+FWefu8lofq0MusHTR3dJ3nqaKzaESUx1sx9GMH8Doi3bKeQkKCJ/WGyoel53
 bQcvs5h5Ob0kI1fx7uq8s2NXBycCauKtYiWwjBkGcYMIQ651T7/YByk2sFh28d2JGH+NgmiQF0B
 xw3KGQA3ALUmd/CbBY1kHWbVE16Df4xvyD02pYwjbkP4A4FNNrng6hlMWoNl9V4PWv6xI0fe64s
 p4zJumMW/QVhmjhMmxg==
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a21205c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b8-5IbU7OP05I74H5fIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: je0nfMWUcjiU5-_FAUi6ESZLHzWR4zjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111143-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:praveen.talari@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:quic_nkela@quicinc.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quicinc.com:email,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A66A163D68B

Add DT bindings for the QUP GENI SPI controller on sa8255p platform.

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocols are
utilized to request resource configurations.

SA8255p platform does not require the Serial Engine (SE) common properties
as the SE firmware is loaded and managed by the TrustZone (TZ) secure
environment.

Co-developed-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v2->v3:
- Added missed dma-names in example node.
---
 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
new file mode 100644
index 000000000000..d9347d780ca4
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/qcom,sa8255p-geni-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GENI based Qualcomm Universal Peripheral (QUP) Serial Peripheral Interface (SPI)
+
+maintainers:
+  - Praveen Talari <praveen.talari@oss.qualcomm.com>
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-spi
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/dma/qcom-gpi.h>
+
+    spi@888000 {
+        compatible = "qcom,sa8255p-geni-spi";
+        reg = <0x888000 0x4000>;
+        interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+        dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+               <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+        dma-names = "tx", "rx";
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };

-- 
2.34.1


