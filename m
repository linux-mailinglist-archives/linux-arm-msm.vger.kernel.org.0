Return-Path: <linux-arm-msm+bounces-90073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPkjHv85cWnKfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:41:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C495D772
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 21:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A71B806BBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 18:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC1C4218A8;
	Wed, 21 Jan 2026 18:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Io40uwXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZ88eMm0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA44D41C2FF
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020580; cv=none; b=tGSvOe7GjYp3i9BLinOSjNebdhZWHj8CP1w1AItylnG3HB1SrmZLZNnu2/pDVr6SeooaxTc/+TsrX4sdqLD4UpF7JvT6RocG+wR1ZD+QDJB7vWbDxidg4Jt1cwRA6peayTiehbRtjcPfrdIiMt7mz6B3GdHVkbljmRhosHVsbM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020580; c=relaxed/simple;
	bh=3zEQ9m2W3rLO5HYuql/PzsGDa8f85lYMm0p2GO/cc8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7AJDRJ1rAoMcI0jr6RUJcuL9nI0kmnksi/iddwnthxVI/lLjQ9RlSAeD6mC/RQk2wyUeCFkP5Zk77Bx1ncmmL44DfFG0IoFvjEnXg8qFfCNP0Xolm3vrHEGwAVGJTg3TW7zQ9DTh630DZ/hmHeOgEnlhPPpmmYMuRkZV4QnhAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io40uwXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZ88eMm0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LDxug63620675
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipXcPVqW2KR4kHqZ7Q8Ex4yhjIP+Tz9Bt8QAaxGEjiU=; b=Io40uwXcod0UBXxB
	rLNez6cdy2bKR6NjGt/FvCi95erfea7xru061FpVHzrjRq16GBSn7lvKG7MnHwfR
	VxyCsaixq2ICT91ctPip1g5WlBAbkfXwMWyd6Rs3d3n1oBH5yxJj+3psO5IbKzWP
	8eu3afIE7kCStKDVBXCSxad+fCUKcrHXvvNwBdSg3LRur91lnln9U0N+qxN2eg0B
	s3u7HIsST4IXLrchA7QfdVNYVavHljBzUAaQZBL83aB/WgUOOzDFMo3fUfSKIw9r
	VYOe9C0Fbh78ZIACXkhW52srSWYNeEkjHWSVeOY6v0HIiOyRcybiKXBdChvo1Qxf
	VMLmfw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu062h1cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 18:36:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7701b6353so968485ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 10:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769020577; x=1769625377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipXcPVqW2KR4kHqZ7Q8Ex4yhjIP+Tz9Bt8QAaxGEjiU=;
        b=NZ88eMm04eCstB2AxUmycKTr5zYDfYKrPvyNNbiQ3CF1GfYwKSMCHkrvC0mse0/eb5
         g0FkVvos14L2nVs6Mq2Cw7Eo2N8Z9iX/orrT6UeqOJUbaeICVA6Pel+XweV1ode33+13
         Hu6GvwKG5V9CwG9J5BL4OEhCn/tdYoQvndDs1YzZYH5FINk+aQd8+5o3xP82vApr0Pkt
         01kCb6ww0/Ym+8v+/vuy1MCF7UyhG7xJt7KBSG1U36qsllxFFa1Hz5aclFtkJolvWU2j
         YmjaYm0l9UFBz47d7+SviF/4R+uuTBCrb81WvcBq7HIUgtXodsoIQ3URG1oZko5z0Uts
         ip7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769020577; x=1769625377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ipXcPVqW2KR4kHqZ7Q8Ex4yhjIP+Tz9Bt8QAaxGEjiU=;
        b=nVUu6OxdmbK1yiAr6CehfD0nHTXmMadm31wJ8tvrbA9D8Un+MMcFRnAjLfzDtouq71
         LzKmZ5UKVR7m7sPVfeHsGNqmg1aLq8DBZ8SVXcJg5twTZfo+NmeVM427NB7PEMAPOW4S
         jaIEfRkdoyJugKajshc9GzusoIbFgvEfBDe7vswlTSH1uGGBjieh5hl0R6ZsZd940uwm
         Zi+Hfz6iRGXub/K9e0IH27ZsnbvjI1vnvxDeHc5qfDc7vYYwXcfjO7mJZ3oFTMJ62dRG
         jfJoOV3D01Htc6h4twa6Hiar5343q25jZ/fM8Byfsh+xZMlCVxmPF0SPmOA6V5HWSqx2
         gIUg==
X-Gm-Message-State: AOJu0YylcQr4ZKrXXEz9WujTEpq58hVGD5w0l4czPUfmN+6EA3sizkUA
	yJrqioRr0x+ysckuljq3hOwd1GF1l6Xj9LXN4YqkTj67cG20v/Mm+fe6CMMlsMiUE+DiSG0iBr5
	Rx4F0F4w0WJzSCStvBUYcGIaqvXVuC2E9fWLon9uj5U1p3c7iR+189jnyw6V7JtLrpV0Z
X-Gm-Gg: AZuq6aKdEswv5rH+rujcdFFlfnpwZy5Sl4eJBGwcc5J/Yst+t8IhKo+7OpqwAyxvRPZ
	iYdK/ZGJx5pB9dRAtLMmQ/KiSCVgB3hMqlbkslmgsRAcpofCPSaoGQe9zCAFI15A136ezhJV4Jv
	3nBMAXQT9diVXZCd9PV3052+aDH5re2vUDHjjHnGNa8xAZMBdC7Qp2T09ZCBEhyytT8twR6WwWh
	OURaOFHFm8vsJi1PPmFgwGO1LxWmB2bYjqKVJsYOFzntX/gjk0XUyo6b2JDNUNKRH/PBlKurknm
	P53VEe6yxzxgKAEM+rnaWQ4cPU6VfzSStF9naBW+OUi1YoOE2if16565AgZ7kvxowQ+KQzmozjW
	r6qXsh//XQrfOENq1G5vrJwTZSJZF/pPxWiF4dNRJCl36x/RByFAvYm2g3OiUzlLuAYIWWrt8gd
	TUPqbDLYCsT9hMHg8APXo+QsPtx6ACHQ==
X-Received: by 2002:a17:903:2f0f:b0:295:5dbe:f629 with SMTP id d9443c01a7336-2a71888c393mr131112255ad.8.1769020577129;
        Wed, 21 Jan 2026 10:36:17 -0800 (PST)
X-Received: by 2002:a17:903:2f0f:b0:295:5dbe:f629 with SMTP id d9443c01a7336-2a71888c393mr131112025ad.8.1769020576497;
        Wed, 21 Jan 2026 10:36:16 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eeefasm159551305ad.43.2026.01.21.10.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 10:36:16 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 00:05:12 +0530
Subject: [PATCH v5 2/4] arm64: defconfig: Enable Glymur configs for boot to
 shell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-upstream_v3_glymur_introduction-v5-2-8ba76c354e9a@oss.qualcomm.com>
References: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
In-Reply-To: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769020565; l=1615;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=3zEQ9m2W3rLO5HYuql/PzsGDa8f85lYMm0p2GO/cc8E=;
 b=50ZwD0orUQrSSuvvbFLxNLVus/+1P0Lmktwq9BntQ9AqE06zPbg27LBSc5g6ZnU64zP/YTb7U
 dP2MDmj98aBCbHk8M3rpFuik8AfKjH0SbffD+w0tZ7cO5tCqC8MCoE+
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Authority-Analysis: v=2.4 cv=B5i0EetM c=1 sm=1 tr=0 ts=69711ca1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=G4s3PgB1coGp2Q1p4bUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: qi770VQ6cHy570ET_MEoiIK6yS_Yw_gO
X-Proofpoint-GUID: qi770VQ6cHy570ET_MEoiIK6yS_Yw_gO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE1NSBTYWx0ZWRfX2JfNfurh2Jan
 7sozVjSgV4NJSADW4VYTcgvbg3pIg1qHH5I4rI/55tzbnb2WqH2miR7PrUnoWzmOaMCw/B22AdY
 HStD8FMSx+mnogZhPC+rqRm+F7A6WoIVMpNMIQdRX9T+r+ry6yESI1m5VWPXlWjPnNgv6NwBxuf
 ntjt7+TiutTUOT8Cugnk1xLqJOZN06+mCENbG2Ye0qVtkVN5LEGwqs1ugJ7XxgwErflElJq2oNk
 I9ZqMc/vIMpp/LjWn6EO5ZXYmPolofwMN9u1LyVWqZ+GxpsL+fGCidqDMOisLyuD15OIveMn7Sp
 0bK1h91x+Y9R040XzY0/4yMA0L9G4sZbindC8KuZpsCn5Der4kLOVJ99gFTW2tSCm+XyAjj3tig
 +bjBXb71Sl5iKG8FcF20A17F+hNo4ZydUvaQuBgp9wRZv8uwD7hft5FzInkXQvALfnPpFviSfd2
 BqOsGAP8wr0ILte/a2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210155
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90073-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pankaj.patil@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27C495D772
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The serial engine must be properly setup before kernel reaches
"init", so UART driver and its dependencies needs to be built in.
Enable its dependency clocks,interconnect and pinctrl as built-in
to boot Qualcomm's dev platform - Glymur CRD board to UART console with
rootfs on nvme storage.
DISPCC enabled as module, used for display.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c43dcadabec4..807881932132 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -645,6 +645,7 @@ CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
 CONFIG_PINCTRL_MSM=y
+CONFIG_PINCTRL_GLYMUR=y
 CONFIG_PINCTRL_IPQ5018=y
 CONFIG_PINCTRL_IPQ5332=y
 CONFIG_PINCTRL_IPQ5424=y
@@ -1452,6 +1453,9 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_CLK_GLYMUR_DISPCC=m
+CONFIG_CLK_GLYMUR_GCC=y
+CONFIG_CLK_GLYMUR_TCSRCC=m
 CONFIG_CLK_KAANAPALI_GCC=y
 CONFIG_CLK_KAANAPALI_TCSRCC=m
 CONFIG_CLK_X1E80100_CAMCC=m
@@ -1844,6 +1848,7 @@ CONFIG_INTERCONNECT_IMX8MN=m
 CONFIG_INTERCONNECT_IMX8MQ=m
 CONFIG_INTERCONNECT_IMX8MP=y
 CONFIG_INTERCONNECT_QCOM=y
+CONFIG_INTERCONNECT_QCOM_GLYMUR=y
 CONFIG_INTERCONNECT_QCOM_KAANAPALI=y
 CONFIG_INTERCONNECT_QCOM_MSM8916=m
 CONFIG_INTERCONNECT_QCOM_MSM8953=y

-- 
2.34.1


