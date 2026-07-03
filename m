Return-Path: <linux-arm-msm+bounces-116245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z3VLIeZ5R2rIYwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:59:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF837005D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 10:59:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kA4gQy0X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OZ08bV2R;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116245-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116245-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 231AD30117B6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 08:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EEC32572F;
	Fri,  3 Jul 2026 08:58:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833173839AE
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 08:58:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783069137; cv=none; b=uAfn73N/ldzXKOPbdFwusky3O2dLTMlHNpwVcTchCGyFKAnaznIHBZ3+M4f3E15u0ZjRSlnJN8ULxcxmspRLDx20QTaY3G5tULk53Qh7mhXO3XQn/nAPFlc8beatPMVxAs92+Jsnsvlp02atxjL7Kn+BR1IIA84WchKTbFZVn48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783069137; c=relaxed/simple;
	bh=Vmd/wjMijBMKJpmsPlYuyZime18KXTl17NF7s/TPJcQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HFUKMFF+87vZnqmEMojwHEep6y9P9kIfAUa8OybIudWCPaJbqklEOLF1wHCuqeLviJ6bvJmd/BmUbBGuvFX5ib34OM+Nt3L9qgG6SIGRtyEVATe214Z+ZXivUDtXRPg67n6k+RauL+Z3ox1ZdXpU08e3+Qj/vsE1OerddhcIOR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA4gQy0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZ08bV2R; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rdX23087978
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 08:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ehzOtscBxZ2fpLb9ZKVZ4112nRGeFU3eHLB
	suqLoM2w=; b=kA4gQy0XFWql2PVcvViX62CFV+9QWaEnpfn/GF2MrmBz1eoB1To
	Zjs7TBjXKbl0k0+KgGoAP3JAjt9rzLCsEw0RxMmP4ZGwNstYo3O1FFTaaBD0frOB
	a1jiSEkbchChMI4Fj+GWDBuaUtPPNLybSX1exytL5/BgUyzDsoGYrW2YbCirxUlq
	KVZQkJ3KMl6Fx5h0E0M2nMsdCZNc/I/6w23OmfkGMLVNiFhrf4b36xg9wxVemqsF
	8JbPF7V0tWH+LAU/7wbztFmLyhOYEBgjSPhohCBLdZXnJ/DJEJAECrMdS+ab9fZD
	zMkc1b9zhkxg2ym54jrF9rhf2bQ/HfKBEVQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5s2546jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 08:58:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9667280edeso613988a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783069134; x=1783673934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ehzOtscBxZ2fpLb9ZKVZ4112nRGeFU3eHLBsuqLoM2w=;
        b=OZ08bV2Rf7km9ZFL2FJgAiihqzCIgFwS5/rSKqWQ9KwLS0xXpgeZrBnwDLRp1T5w3T
         vAZpxaMJ0FPQ23iCbsUm+Dj6SD6n7NCLMcr5B5ftWeLIlYeDyfQxYfXAQmKG2FwrrCkW
         XDodxtwTzlabJd20vdK5YA1HVdCNSflI+aXhKycm3DgpDe9uwR39V8tMjxB8dRSUXvaF
         NuJknoaTTcpS01OIEQeheAH7hSevSYSL6tr52m8IW7XYc7kTk1KGk6W9RYQFCPqrcx2h
         v4LyLdO6nbkR3lapFbpmOSMR8/DyZSvkSuSGxFZ+T6VXqhD4ZiGIPYxoyZwNbSs5ptvx
         sWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783069134; x=1783673934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehzOtscBxZ2fpLb9ZKVZ4112nRGeFU3eHLBsuqLoM2w=;
        b=fxE3RIdOSzYfILRZonY7pL4sRPMyjpeCfA5l+zWZF3eSV8NqOnf57Lskgyn5f/hL3p
         4hDk9fNLFceOAs+N3K2OOlBZgspwvaAXsJsgwWmm9x2tS3KdCGZqlSf+TFYgSnb+YtuO
         yBvjnei188Mwp+UY94dR+MN4R2czsQlAjmyPO92VHNyGNnZrGzvTFqFQNIC5EuVbDMBz
         Kvo/RdjHMqSN45fRZ95rRLunqseZYU5SN+hEAn9GRw/YE10yIzoVWXrCkvGw1ok3sHQm
         M/1SBymNfPIliwUzRa97oaTtjByyPGRUzjY1gtoYDEI2Cntfuled3YwAOS+bixxQIx7W
         LLQA==
X-Forwarded-Encrypted: i=1; AFNElJ+PCkwvXvptyrWipBcMFTbwlCmkO81vAgQqKu1SchyL52/rRopobT8kg6Uu0nyiBpnvZi41OWGDDwyYecUJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwF4UmOZT979lecO6/Vsoge88p33Q1hYMcSmDc20d2jozCtJfO0
	uhlZRA/BCJGgdIHlAskj713K5dAHBiCSdOcpyJ75zmLPKakYqTZ9ieBws7eCXYzT3eWiQu3pQyW
	cfYdvlYQ+plY70568jp1rppMyZpi+3cPtMVN0lT8m1bcoAA8rYBOnRwHx+Iqv+oAe+jnq
X-Gm-Gg: AfdE7cnjz7cp1bBhRqzBuiRwOO2ebvjLjNuC9af86qeSrHqzsr/GCgPYIMxssLtaBaD
	4aAiRtYjS4I/4G8+Iet+bRFgw7jKCYu2FoIMz74QxM5MY7AOxC0G1OTBwqZoCZZIOFm9DWpuQ4E
	E0vGdEu32DMGZULIboCvZJ/suwBE5o3kbkOLxB1hN6cJ+/ZmRjN8w/76MuM8xJEqMpC0rAa8CGI
	5cqtLGaRQLHYqs6LTO1DkxK5jdSwsjFYdvc56kBhLCRAGTBXEcELYBR2yY7tJq+laqWTBO8P6Hg
	893gEWgyviJQVUw8BFp8ALfWREcyWY4bVaa7NRnDI+/V98Tj3VPYNtQanqZwPtQDkjbZlruFpCh
	brjQ5PbTfhqeMOWko0DToOFr9EWmqMw5TYBH9Yi10Ks0d
X-Received: by 2002:a05:6a21:748b:b0:3bf:6c08:4ec1 with SMTP id adf61e73a8af0-3bfed5fdca7mr11861915637.54.1783069134359;
        Fri, 03 Jul 2026 01:58:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:748b:b0:3bf:6c08:4ec1 with SMTP id adf61e73a8af0-3bfed5fdca7mr11861887637.54.1783069133870;
        Fri, 03 Jul 2026 01:58:53 -0700 (PDT)
Received: from hu-sarata-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85bde6sm29256187c88.9.2026.07.03.01.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:58:53 -0700 (PDT)
From: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
Subject: [PATCH v4] arm64: dts: qcom: qcom6490-idp: Add IPA nodes
Date: Fri,  3 Jul 2026 14:28:09 +0530
Message-Id: <20260703085809.2573214-1-sarat.addepalli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=6a4779cf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NWDa85BbfrixOsoTofQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: c95C7umftTXVrUrTBYo2B5b5-soqCHRh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4NSBTYWx0ZWRfX0aOKAFRzdIyZ
 h+MDjWT448D8MXq67AJ2y0L9m0s4eFSLVrfSF3XMtuJH8X6z1xjWpkHqHhBU0uqRjW3e49l4TwF
 9/qJqO6Ml/j9bgEkrnHGN72XHKSz+2kTW506QGpyL+YC/huy8Gr9LTcg+08mV4zP+sokbHL3TxW
 gOWZeWUIuc64mueiILQlDDM/1DDUVutDwLShyePUF4DCSxuFbR0qhkK7yUx5O/Wdj2ObAmjwnqm
 523cfazUKI/m8e/SE6xVVeps+fgVBc8JAOjL6rW8yxPD4bR0mXNEl3NCPATJttsyI3VYLg1/cNS
 5i+tqfQuCUGUjOVAjIlgTeQnnmrTNFoK0TH5w9YG2EL5F7jrN11KaUndNpoE1gpWjDazvMxiKnG
 2059GdcYIHf1eO/WnQEet+/uBmsOMNfVJuaD33pkte7ealwgvARAJUbjcAD/i9CtyVHTrNHG4p2
 E2bJThSENVDzk+9iGOA==
X-Proofpoint-GUID: c95C7umftTXVrUrTBYo2B5b5-soqCHRh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4NSBTYWx0ZWRfX8pnJquCWwZDP
 QVgjm/y9aoWFnp5gEnPBcGhQ3dGnMaQvgS8krZvJbVhWKLeIF7CDb7ovF94czPagxuZIM+U6qpX
 JTB6krV/YiGoAIuQ8GQz1lHpVIwVDss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116245-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarat.addepalli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sarat.addepalli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[sarat.addepalli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECF837005D7

Add IPA nodes for Qualcomm qcm6490 board.

The qcom,gsi-loader and memory-region properties are provided by
kodiak.dtsi as part of the IPA property consolidation work, so only
the board-specific firmware-name and status properties need to be set.

Link: https://lore.kernel.org/all/20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com/
Signed-off-by: Sarat Addepalli <sarat.addepalli@oss.qualcomm.com>
---
Changes in v4:
- Removed empty line between Link and Signed-off-by tags.
- Added empty line before the status property in the IPA node.
- Sent as a new thread instead of replying to the previous revision.
Changes in v3:
- Rebased on top of IPA property consolidation series.
- Dropped qcom,gsi-loader and memory-region properties as they are now
  provided by kodiak.dtsi.
- Added Link tag to the dependent IPA loader series.
Changes in v2:
- Modified firmware file extension from .mdt to .mbn

v3: https://lore.kernel.org/all/20260702105509.1360340-1-sarat.addepalli@oss.qualcomm.com/
v2: https://lore.kernel.org/all/20260618124700.2001191-1-sarat.addepalli@oss.qualcomm.com/
v1: https://lore.kernel.org/all/20250304152133.GA2763820@hu-kapandey-hyd.qualcomm.com/

 arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..7242695aed97 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -619,6 +619,12 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm6490/a660_zap.mbn";
 };
 
+&ipa {
+	firmware-name = "qcom/qcm6490/ipa_fws.mbn";
+
+	status = "okay";
+};
+
 &lpass_rx_macro {
 	status = "okay";
 };

