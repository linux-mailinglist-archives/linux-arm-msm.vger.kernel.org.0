Return-Path: <linux-arm-msm+bounces-115631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +UAcN9boRGrb2woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:15:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D88686EBFFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:15:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n5OF7EwC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EceMmhdD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115631-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115631-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF84D306D881
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07513F44FC;
	Wed,  1 Jul 2026 10:05:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AABB42AA9
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:05:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900344; cv=none; b=nQ+ENxMLWRNsaDwK6qwU2BgkXT7qJYbgBvqoE9PFbq1LawIpEGw/fBfw9LFf/1MlVSrTjhP+FLKFVtAtrE7s/hQKCNv2U9t1JsjbfFkZ0R2zMAW6jsiXgTaOqXn8oMJ4+MtRzV+DcWn2iscRvaru0mAXlAck0Ia5MpQ/v3OyraM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900344; c=relaxed/simple;
	bh=bEv4c+NCVeDI5hZyy74vI/X5n2oJ5cUMsCpcfYOUcp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IS0t+ZZ2DhZv3CWCRRLtcfY3NCKkbR7jkq67eF50NDlbzVFUewZrFPR10TrzFeeilVpDNsrORJdJx7IwhhGEIkx9ZtFD/CLFZTELhlQybFAtn3B50P/awrgQ0D4PBc5ralbwVg5rneUfGJ2yY9PyzEEOSM+Jp5Gt55eoDpvCnE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5OF7EwC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EceMmhdD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A3BRO659351
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AwDwOpiFPSF0ZI1/vfPczW
	kGaSZksvs43+rkmg5AbT0=; b=n5OF7EwCgC0ipxSnjDFLlHBhJQU2nahpC+0Pmu
	SEinjDARNJsCsM8ii8h6ADUv7ex/lRNHgXSDi7z8rOvHko66NL94bIgraL37CBSP
	GxK4Y2dtM70p9KOBBOUeJ0nqLztALGmq+L7KGhhuY3NKX3YvEjKu5Dqr2xToFqtu
	0qSNdZEhSIGyxwpO9RQ5ilxDIwyOA/6Vym2EDOwh4aSWIJjMufaMFwa3hl5ikABz
	z6SZYO5QMkQ5nG+T8X5qgY2/JVnzdcgDOVt4s7FT0ihgPDsXMEJ320kzfyNeE4Io
	6B4fEU0cwDMg8w+57EZdiLFZFec+Vpdo0pKBguP/Urxazevg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f502ur6r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:05:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fca5f21b1so1197881a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782900341; x=1783505141; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AwDwOpiFPSF0ZI1/vfPczWkGaSZksvs43+rkmg5AbT0=;
        b=EceMmhdDQbTMWQwFViX7T4C8aDq2fXbzloHwtPoSFPqYvd+ALu6zBwmcP2OOuMrHKX
         kN5kIrZVwF3wIdpzATAJk/iidbgUHVIo4jNN6qSywLpgI0iMZiBs6Sgp4s81zJf/3VcV
         JWRdaoU6Rs2KexPT/DrHN5DO1u67Kt+F0riUahYHHyPX3o6r7qB4Bdrc7vgmemMI8pue
         3hf4RJE/FfjB3E7ne2o6geKkNhZj6ldM4xxZZFVph79qDAuxqkX95JM9oco1uXRWjdTt
         bijFUee9zqIIK7Ji5WkdX00zxiULOSa1qzpUM3YJXPngWvbSnhem+a3Nkb7FPvRxYR7J
         9uYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900341; x=1783505141;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwDwOpiFPSF0ZI1/vfPczWkGaSZksvs43+rkmg5AbT0=;
        b=pZnQ2xwEEAj9k1wKXkpD42YTozUNBMFMyUYQRJj4CzG7V4UtSKTmppv8Cj01U7Yimb
         U+oBEMHoTun9wPDVBpEWR1piPUqDvXeVMpCxp6U5ZXi3ev42wHv9433Y9goIjhXFTNE8
         wAfPpBPGmGBv6ce9wp7cq4NxA3wSB1/ztcrdx6H9vDrVC4r6HhYlFwG0pNj2U0kKsPyD
         QyBMuNuIEQLXduIcLsCvajOuvak8cmpRN5SNWlCREjMH6mZbVZjgdfwm14WMouOpzkKS
         t7iMpyDkW2ffxT8xSbYx131iSuRE594UBUEZvAP7eFT58emBHiCK4KyLMvUa3LZVwL4N
         TTGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1HjezV97SDZa7mSzwESeXPlRVInVZ2bzYZnZhqOI0LNg/4v3/IQ2ydwAOEzVoKvBR19QvDcy68cN/ka41@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwH2Ioid5R1XuFVVtmtlmkygzirg8H6KRqR0hbTaOuB6y5Sob
	ZlHtmZpS8NLltz131CWbUzmjxXeEa8UazxJGKriZF2AOOeheBbC2S2k0tu66iB9xpTSHeWKDEL7
	kGCnqxV2KX7M3gY3x3RdFC3i7bzfSoWhq4XJ+/fTHfO3lA9nKlyiL1EX+mue1eCwrsWWSIeXFqe
	vHIYA=
X-Gm-Gg: AfdE7cmB+Dh95sdxnBgcHmsQZ5P3equVlUXzWxpCDQLih8ELazg8XrX8OfBYzEXxrUI
	H/tqN9rnFhH/da+E8UpJ4IcZu3KdolNWnb82IKlzUx5gKQjPTcnOKrQUMD7fmGMibfSMVNXw7tN
	HDLm/QmCmQalGfXu5QNUA3+Ism/wARhNxmoJXiqC71frKuskCoBjVentJ1++GOM0ZphFM5khQjo
	pD+XchPjl6YTpi+w6vjAocz5jSOM/69k0Q1Pa7ZC+xjrHYWc7HOt+VuHp8ocsRVGcNuXVJ+X0ef
	k0o7b1GeoZUlT4CTvIpmV2+8ouJr3i+ruaUIdlmhDZXzc0Q6K/D3UfsbWHAxehC5kfwtEVPLAar
	cu8ducuoo4de8qGp3O0W0kPtbyYF4hAvbvzIWz4iKH8Az
X-Received: by 2002:a17:90b:1dcc:b0:37f:c232:f075 with SMTP id 98e67ed59e1d1-380aa1d454cmr815969a91.12.1782900341331;
        Wed, 01 Jul 2026 03:05:41 -0700 (PDT)
X-Received: by 2002:a17:90b:1dcc:b0:37f:c232:f075 with SMTP id 98e67ed59e1d1-380aa1d454cmr815947a91.12.1782900340852;
        Wed, 01 Jul 2026 03:05:40 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d6d45asm1618994a91.9.2026.07.01.03.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:05:40 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 15:35:31 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGrmRGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwND3fScytzSIt3E0pTMfF0LYzMjQwMT4xRDE2MloJaCotS0zAqwcdG
 xtbUAIrau9F4AAAA=
X-Change-ID: 20260701-glymur-audio-83621043d143
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782900336; l=1780;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=bEv4c+NCVeDI5hZyy74vI/X5n2oJ5cUMsCpcfYOUcp8=;
 b=2P/+Er6x2LZiw24Ws7UEotRge0G9Z1NJKmN2F0EPWyZkU0z8vYkU+OJRL896p0H0qRbG1EHrf
 +ipYp7DAQ45Dekyh+sLpNiXppKVb90dFXHBVUW2Xub64SZNAZ7YsK62
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEwNCBTYWx0ZWRfX1Pw+y0XErovJ
 QJvXthw3i14J5LtlYhzAFueZHHlx1zq5qUtYwIHuHUa89A//E7b9qLCR/+YxrW6WsfykGlEDlTK
 7LHReTAXZ44yBDXkJyRH7kWLMUuXBJM=
X-Proofpoint-GUID: kqmWwi3WREtO6yypNgFzBs8wd4GkIVLZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEwNCBTYWx0ZWRfX6zbYX7vEIauT
 9omlWAVHGDoQVWg8IX08n/NMpmXsXvoLdz+3EOzYdnn+70q1Q7LVxAtZknjFOVYd/5xUgoxj5e3
 syrvuJ6HvjakGQY7+78pv1DzBfofRccJ8rYQooJ/SaXGxR/7QykFWY56FKupE9gv21vQOkiBa88
 V5jEdrBg0Czhq0Oc1AiJ3kC9RZzEO61v0XbmTw9pYTuTk7xnLpIsbw+6zFIaCXTjBOUdWvSe/88
 3hQQUMdxIuFUuRfFU93U+RKWUcj4h4ixEOxhXlYhP4arADFDBH8XtbtXoI+9MWj6C0XZ/QTMJCK
 vJuq9f5+nOcPgW1Zj07iIm1MvkW3l5XLm+DJOICfre18kPeoUq0gpqa+bQSn5gjrPQjr9AuCg8P
 1ANg8+WDEYEgGpAQXE1owfUj+mDDTNbirIlqmXu3xoucPAlaw7vuvUlcMrZYc7L6tPMfRCEWBP8
 sz9vDWBNOFcTdplpJKQ==
X-Proofpoint-ORIG-GUID: kqmWwi3WREtO6yypNgFzBs8wd4GkIVLZ
X-Authority-Analysis: v=2.4 cv=PbLPQChd c=1 sm=1 tr=0 ts=6a44e676 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xTAV2kzwEx0x-571GnoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115631-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:ekansh.gupta@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:vinayak.katoch@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D88686EBFFB

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..f403f542aa00 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
@@ -663,6 +664,14 @@ smem_mem: smem@ffe00000 {
 			hwlocks = <&tcsr_mutex 3>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -3845,6 +3854,9 @@ fastrpc {
 					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-glymur-audio-83621043d143

Best regards,
-- 
Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>


