Return-Path: <linux-arm-msm+bounces-109531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Wd84MJpWE2pi+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:50:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDCC5C3E71
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C1DA3006B63
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DD43290AD;
	Sun, 24 May 2026 19:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfwNk3k2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLw8gpTk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331C63264E3
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652225; cv=none; b=MK6DCt5delN0OSi4kMjn6OgxvYVcB5IbCc2moIhrDeNh+W8wK0zgB0uP7IVf0pWUafnjnyAxdE0F93bYJi1WM2Zf4ASpwYyC8wa/D9Ug6ngz50r2y89w7eVL7ndw5W1sPlvavxNvXkUZ+0B3CrqnNbU1zsr43R90A3863uhKtiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652225; c=relaxed/simple;
	bh=YaItrr6rpfD+1J0ICz5O4ellYSik3NT/UKk/2vkYGkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JG2DEQGQD8UwWWxooTqBMDrC6pVNb496DVOHLItbQt8nYOPwjN8GyN7qO4Bgl6YdFwMAgRYv+fMUq6R23cHLMjyiMt5XO/TIdEVvfjVG1WE0UseK26cfPjAVYzT2jAOng4s2zD4CIlyWirU4UKxON6lvb0rW4R4qbpWnhVZYvWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfwNk3k2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLw8gpTk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OJFuQG1330183
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRmkhfqfhacj1V1czHmTXt56wSL5ts/uC0kRpCFPDdE=; b=ZfwNk3k2E5Poj4Of
	DQYKFpzEJAmAIscs/ryMs/vAb54yqoRLf3K5TIH340+jbakYgnur1azEWq0/PIMD
	NcIOBo10OBGriHD6BJHBvB+8pRoiw5mSUZhlqIfQethHbDgEvTbG+kfyZfWym0gi
	OeQgVXBUVgBDiFTmDC+D0lCg3B0REa14DLH5K9VWvpJT7nRbsKS0y3EOd9TyX4iz
	anjtYPRez25zlAJWlLCqGYF2izYiEO83qQeZ7tq2lZvFOLIOc8tPG+5QcXWiGFTY
	1rEy2HBHFucsF3vk5UM0yMgRMGAmEmA6U/jtthvPCKsRicgJk4gt/HEkZEaIz5ct
	uYAZkg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w3d7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:50:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3684cb22502so8139784a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652223; x=1780257023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRmkhfqfhacj1V1czHmTXt56wSL5ts/uC0kRpCFPDdE=;
        b=SLw8gpTkVy5hInz33I/qL5BTTuNj/SGwSsSGY8lOab6lupaNmoNbkmTfG0LLGqLi5k
         rmJnbHZpz9bH/WaNOWqGTeNmsdy5M5lvXLiY1+3qsdfkSIydLUcllOgyZKlZawBpnS4F
         F3lImM9nOSjsRZU+hD6+CM3zG37OaAgek+pJw+OVPRgpGXy1o/Il62d3ebRgStXlEjfE
         yXP+UAl4gVM1uREh4xZoHJB4KUfJj2xbEF1IPCF6MdRQ47gK2X5/0WItYFGQwM0pUYnT
         rm3VY4Nqz6XFldS0WBS4AuKavqQLgjiYlo6eUnnQd9Vrt2bIF6ejQ/n0rHZMg1znCZ/s
         dWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652223; x=1780257023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uRmkhfqfhacj1V1czHmTXt56wSL5ts/uC0kRpCFPDdE=;
        b=Nn0Zii7V9CqEK+GeoFuiJwZZwrUR/38EoDwpapeLB+bwIjdAa9PYtlaQVK2jrD2Rb9
         hvnXALi+5T15XvEXtfLjxEs/XA95QOBqF0hKYs7ySy1u0gsBk7nNHmUJ91d4lkcEiVlg
         +UFwnsalRy6sMQ1ySPgQXZpufVrdsbLd0wLr5BpQZmpNWGfYMV3DuAWSu2nf1l/iaaHV
         +yXAGBKTj9rVfcprnHv8maZjZ2fwXL7/9D1CfS2vnS2rGzQbfHDiSLcNRXoTRf9JbtB/
         V7ulMZduRzZ5CGO/etsGoYh4x3IP+W3PwqhEAjrjVxNjM3jRfnnnbAP65aR4mh0GQkip
         y4fQ==
X-Gm-Message-State: AOJu0YylTWyrmuJsadboAW2qL1uP2zrRgHxIDZVz1LC+b/HQ+9586rUd
	ePEUCx9QxjlkVt9vV2yXAxIu+mYMjLvxAbMzXV1rGYhuCuP88269chbNjl6r2FS6vF5lSRRPcbW
	uT/4bcgjd+x3yLtQwn9hZI9jBoHdEEUSBGjpKoUvRdy/5ca5gVE0yOxd8KOKVmADkGGAf
X-Gm-Gg: Acq92OFL8n2P4nsiQrPkC+33hwyYfHBrQ3iJSQoqi7ERtva+MThM41NjdQIhBgJg9aT
	+9KqeOsPl7RYQqesDIPFsJUL6ofi2BFjFqQkXusE24VMSrrM+DgJA2i04IIrNRWpjNrctCnXLzT
	cT15VN7F6V9zpZoTKuBx9uJ3tYMgQBLhQnv0AFg4Fy2WQ79v3pVngr8sBX5SdSpFyZY5EnOnw41
	OALoJmaGEQvGGklIDfZh+BYsGhUBLL7dUl4LLv95xNylqFri/pxQ2hMAjAfMz6GSvo+/SfxqgBh
	I3jhBh7ZHfvUyfq8OVEQEjz0HsROkEglyaZE4GtdRVlxGABLdP8brDhMiFGU+Rj/a0Jn9gIKLmd
	49RLE2LcLItycrwJ9/ZEd2h923herPqJOd380bsZd8ZF66LM=
X-Received: by 2002:a17:90b:38c6:b0:369:7433:488 with SMTP id 98e67ed59e1d1-36a6741ecafmr11276890a91.2.1779652222583;
        Sun, 24 May 2026 12:50:22 -0700 (PDT)
X-Received: by 2002:a17:90b:38c6:b0:369:7433:488 with SMTP id 98e67ed59e1d1-36a6741ecafmr11276860a91.2.1779652221984;
        Sun, 24 May 2026 12:50:21 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:50:20 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:14 +0530
Subject: [PATCH 10/16] arm64: dts: qcom: shikra-cqm: Enable CDSP, LPAICP
 and MPSS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-10-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=1019;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=mB3yqU/Z1sFfy8yB7RzQUxCVfP3cMGqsyBxBir2vgWk=;
 b=Gy7LIHwJEGfLhQgF/uZ3m+32Pve1JinDhqNpWJORnk7juWWPIxYT/gMXSJ1/q4/pQ5VRIEDVp
 MkniWCgBoUHAzhfMWbxfTrZPhu+uVMTWCAqjt98UzvitY4gQ54HuCYx
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a13567f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0ebg2YenFEddjv6MTxsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfXzNnwM4jnbT46
 aqZ2t+zm0vWo4s5tQSsQq8fzeYGnHwf/a4WxRR7kRnnaxATmWkN0fCZvfZHqhWABwJH7wLt5r4C
 OyJ29h8W139BaVzT24sNTeIv5kfg33nHTMVNv340zMua816KSKrFvsFxa1dq49zieqIbDkglPS/
 p2ksO9tCDrEaw6M0fzL9BHveVrm3eYb5muh0P0Fo/nK6OxnGwKzpV2tn2i7GTuDRW88Co9gtRjB
 Gi1rLkFfL4g5Wg4b8y7mcLgeDJA39tZ/McPBLf/AiTLyKnW4vrqcs0z1p3e9oCRy6Yb4qWJCYfb
 LQWUV2USr/ZZi8OOPCaR7t8TkxInxSNJhIP1iVPG60H+wRntGh2uBNQdZX32Vz5RvkgTedr2TAZ
 Nz79X7xujcF3AVA/AhSFPbnFELwvpI8TKQYfD13xbHhDuiO7Vu6SkMzbN7BNAIIkfRExb9TQ4jf
 ZERkoBGLvNeXpvg2gqw==
X-Proofpoint-ORIG-GUID: zqXOagXMl1Hx67T84XOGTIhESre3fh2Z
X-Proofpoint-GUID: zqXOagXMl1Hx67T84XOGTIhESre3fh2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109531-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5BDCC5C3E71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;

-- 
2.34.1


