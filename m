Return-Path: <linux-arm-msm+bounces-109225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMVJK/QqEGofUgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:07:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4FA5B1B2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84BDF3046E94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640223C769F;
	Fri, 22 May 2026 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6JhHwsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ac9MG2y9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6873938E8B2
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444056; cv=none; b=rafK0nKyDWRVbZaW1zcyI6Zj0RvhXVr4CK053sLopEqwv+nAowL7oXm8y+RiYBwyn+uPbX//2nlWTFjtec0rGT+XuWghpWfwNCkfGMWj/pYgNHeDhrLDSI0ckSwbvohMxb49vPBeoK/rLwGUXtOP5gZIGugY73vKIuH0953ZLL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444056; c=relaxed/simple;
	bh=if6n5oE2BTLkyreTvAm2mppyjqBgYiGjGm/kFnU6zlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKkV9Jly7zE82g/6iTO3pKDCOvnw1blUcr3NpUeW98bHhwWjkECkllNwnH/lks8sdMP6m2yBPIITOvyhQ12NLks6GBStB71A5WjgVN8tJoeKSmWbZ+6NG8nw9a03BZ6LNFAqjvmC87K9IukalZCdu83gqr2K4gpeWYIauibleow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6JhHwsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ac9MG2y9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7Fb30779483
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UJDQEQ0DbWmEeeDSdqubLvNF3hjzuAaZeqd
	EeDGLhuU=; b=E6JhHwsWrqoSGHQWtyWPZfys20ZoKzFja+3SiiiucciU8eCfbqU
	+shgBJXlG7MnO4kT0R1DmAFYSPrvrsejegaTrMcZQxVb7VqOzbav1Cq/rvt4UZJe
	9AGqdhI8i0qFbvV66gMcuMXYtNbp+gpXhv97CROUxX5NAhvft1h2G2pPHjSso5rs
	Y/2biWFzO3/UpoQ88ufocTCx0Ss695icuCgOrzAQitb+R+I6f0Y4P2iFwfcqulYN
	yenXgOjS4af92YN1RESp0HzbsnEsT2W1Hzpkw80Q9ZEdh6xkf0Ptdek3Uv1Hbjxj
	coxqwmLIeJthZ6rdatifq3Gfi7NkZNTgGIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7at5re-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:00:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faf575af4so191917761cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444053; x=1780048853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJDQEQ0DbWmEeeDSdqubLvNF3hjzuAaZeqdEeDGLhuU=;
        b=ac9MG2y9HIjQwRmi1jKW8sZadb7vjc89C/QUe7qpl/yCvNVKs1bgmjuHFZx/f0lAj3
         K7CneV7/6xka86esPWBC8alumLw6g58rURmVWU+zK7LxCckT7f4/lpeDbIhoUeUGuPX3
         QppuSaaMxlMqBkisIYcC8jULjnjTplEMhk7DC9A7mdKvCYS8O+3rwMCDa8XbKCYjM6bZ
         TT+6PkGbkjyFTHqqXNY5AverltKa/fqeY27l1KccZk493luFqsicZ920Mvi84FfM5hn3
         SiVAf6/9w5vUq4nzBjSwpvLKSZCUBhbmxbFfAn9eXftAdBRZMIhOrHxWq1F0x0//uTDw
         oeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444053; x=1780048853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJDQEQ0DbWmEeeDSdqubLvNF3hjzuAaZeqdEeDGLhuU=;
        b=fL+bn/S/up9w5m35QBGZl+yCTqR3qWMGMM6tTebibfNrbMJwx0QmUbpcqHLMSq7enm
         Mwer+2ejBDe9w4q7KzLwlBj7o3nncvYTcvZvITfWuixS1DMCtvZn3WCcW7JWqM/TsdhT
         CEsO0MwmWCJ7q0QefWMPtqmpL6QSSAKZ7awLiKLv+2NZx/Souy40D0nX1e7tO17UUwRi
         CUCDHx+QX8vrvA1lK2pwYt5ur7KDB6q2fSzEILEoCTdG8ahbz7QDk2qj6HQDOIuCeeTR
         8SVG8iqH9rOCqfbsvIdmgAL6Y/FYgMY9CyBTUu5evI8vHksUr/3VJsSmCd/0XuJbO7Dr
         NDCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wQ5Cu2CKWOdFUfB8zKQGUaGRWCISmd46maPAvTcNg+Gcf4yBwoCL+10LhiHLWiO/6aRBPjFMUYkJpLHyk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy/6gqMys5ykGVw8fcyP5rSq4HGkKs6OYPx4uzc1wI9wBtetZs
	8RcKGe36zJ0Y0d1uT6ChfvXI9n0ExtnUoMJHUilCsOITxw/3GaROufP2CV1ubSmvtgkAh5fSYql
	ZkKFWlElYwEKwI3lkAknD1dxRpegrDsxhLqxlj+UpYoqnsRdEaiOdoJDrCFzFYVhSOOZi
X-Gm-Gg: Acq92OEqnFH8iEk757XpdLqAAGbyM2M9H5dmhtTUQVW8YvaVRtc8kVX8oGSc5Q+r+25
	86wsi7xbbzqHY5abfqFfmEzhGirxIvu3DOX88S2hj6im7K7zwTo0OxZ7+eipfKN6Kgc+ki2gqFi
	r7m+GQzk5ouhF6r/pmBrDRw6c+XoQxIpmkSRV0ZTexZqUjCNFwj3hoaXFdTXn8GA5Pl3xT0z7rb
	rLmRdbpNXExhkZkejlnQifUmAiG8m+AWnTSHHQXSV6wtUKMA9OyDnZX8lDEOfxNzrmg0uERQRSR
	IYFSGF/9CbZuftUBKXYUFab0FqY8ErLgwsm05n0f3RjTz/+uXCHeHMIFl0Jir1Fqc1XbPT0aLaT
	IYGR9f2sltlxuVV+yfMbzo0FZ82UWiNlnLHOcE+yReG2cXscbMVyY2gs=
X-Received: by 2002:a05:622a:1246:b0:50f:783f:31a9 with SMTP id d75a77b69052e-516d45f9c68mr35882631cf.34.1779444040026;
        Fri, 22 May 2026 03:00:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1246:b0:50f:783f:31a9 with SMTP id d75a77b69052e-516d45f9c68mr35875541cf.34.1779444034381;
        Fri, 22 May 2026 03:00:34 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4850dsm2745709f8f.17.2026.05.22.03.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:00:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: Add Display Port audio on Arduino Monza
Date: Fri, 22 May 2026 10:00:26 +0000
Message-ID: <20260522100026.94760-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WiTXyNZScCCha66lzFn7k4LtzSNwSWx-
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a102955 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=24aN7cj3spbpdN-4_Z0A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: WiTXyNZScCCha66lzFn7k4LtzSNwSWx-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5OSBTYWx0ZWRfX8qGea/IVJdeY
 TxfIr+5FuGSeWBxeKXkZQLtkF+873FM+dFa60QW0KROHPX+Rfy67Bwtuetu/DJIEcKmdfj1Xbrr
 GU6XfHpjYnyqdQhjsHVDTp1vd2bhBYDNXMS1CTIJCqN67wHfww5lNVjjaigEV5+YmpJLPTevVzz
 qiIGvEXLmM9GzUzg534kdt8Z46EA1cYCKFod0fh8Br6FceSvFx26WmWH3dbdjtNHeAvZ2gPDUAm
 Qf2IUbiCKksoa3QWlMCm0vC7zYhaY0EVsccM2OFlMqkHduhGLkI2e4BWVDX4FMdQiDV4+2/Pb9o
 0HLVQiSbHl0FkjdbJ0xmdAHZSSq/6jgWeo1JueAT0kb1zn+Zrq5IVuLFVnZkEBJg6k0PHYf1u3O
 9/6B5qE58Ags/sjbRvVtzE7j3JqjsuwjPxM6tVHeQVvHoqqjOW24QOA2AlWZiwd/iecrTPNmKEy
 lHDLhmL8DDGMO1CWtJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220099
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109225-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A4FA5B1B2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for Display port Audio on Arduino VENTUNO-Q board.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
CC: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
alsa tplg changes are:
	https://github.com/linux-msm/audioreach-topology/pull/63
Ucm changes are:
	https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/ventuno-q


 .../arm64/boot/dts/qcom/monaco-arduino-monza.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..01acc8363cbb 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -117,6 +117,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	vdc_3v3: regulator-3v3 {
-- 
2.47.3


