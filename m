Return-Path: <linux-arm-msm+bounces-93585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIsgNGX4m2mp+QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:49:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 624291725AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FFCF3066815
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3502134A788;
	Mon, 23 Feb 2026 06:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pPXNeC5N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FldUu3l+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D9B34BA2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829144; cv=none; b=CObnwLx2Or/wT/Kmdei18n4XAfV0dkOVnxVXG39iSDQqn81SUt7RD7NnYn4EY4ZZ5PJgZC07cnJT8HNP+GcLamfKiTQYt53Oaz7DyRzGf+gYYFxmsMepV9KM5iVLPQ6j0jWrk3DcYfbAb3nqbpGsoVopIt2UwG6XIuB5q0Dpk6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829144; c=relaxed/simple;
	bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QGeuUv3HyZ202tRzu7N7nATKdK9BtGc5DQL6Yu+Du5qPA6oIfZw+21ldigqPN5Evc8rHewcp+J3PcRapJrHrscnLszAjbVmHZbyCP33SGgfDiyAH5nYabfWjX56skShJ4gxjaFcBwRBYXWqgAo3wY0tOWrT/vnZDlYmRqDXKbRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pPXNeC5N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FldUu3l+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNv7hD3173494
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=; b=pPXNeC5N16HuJEvH
	NNTVLdWJKjRpycH9VZwxi1Pl9MsXFMI2y1QzyOD5sq9R3aM6mzht9joPQ+z8WoJf
	iwKPoujoYeYJu9A0fIRQX1MqHqOOf0WmQUZBVXLYPsAQyB9Al8NyH/ijJ1RclWdu
	g/Xn3xP/4aIMlIFec9KmOCihOREqbMfZCNZxibQGkCwsDAoUmvlU38cGP2mCVB+o
	KIatDV6+CwnC4P6I1QbILRz3sK5P7K/nFOSZCGyeFwhuUg+Pto5m3lBP/bQwM7ny
	9IZkN3VaRSgzskW1/+XvlTjWYosVfun8Sj1itZKm7KT8ZJWVABDNTv/qOM8yOfE0
	uQzOnw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vj3njn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:45:41 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e18b8fe1eso3203376a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829141; x=1772433941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=FldUu3l+js+aH4e8G4bg5dzdqQGgK/kIvqncTv0UIDKOi0WrdOOsliCYdGDmcfa0Oa
         LWEtvBfhXQKL3b++W1cMfdX1oq80m8pvYLFx0WkywoBVYb4uFkz6B8Pmy81P+3wYPcBs
         YJSJRKICyr+/SjRbXATU0w3a3HU3k42vVhQdcPeNSYmsFwm6U5j2XS+8DIiSDZVT/zNe
         WRI9Q0n36zvmj2ZpsF3SL+dYf0IK73WPbjXb5mgQL/0mXOLFc80IPPy1NukcyUx6mSEU
         JwWU4iyLsFyautg2CLryrLK342PqZi8XOIDaczAZxIIaM7Drv8FJqOnfJZI+3DV1d2vh
         t57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829141; x=1772433941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+6sbBvItLVDaaK2nVoqlOqVJ4lF02bwo0WaOVku2Og=;
        b=t05XTUHlBsMbkQJHGjYSoyHIaNeb6bIKCEzAdxFrb7KVWr9D1nxdonIP3IZJxOcxFG
         CDJWvVl46PSUPR82Mu9XShNqMa0HBVka5dEyBDASf+gweUlIaMHpNjkA4pSEXkgmcCVU
         yodeA3sLtpeIYPrIAixK9BG8Mx4DmRJl2KHwKbZUPzGwtDsrNGzkwFBR2nyz0cGQavsb
         pBK7+u5aWThkZcqfZHpqHwQUcfQ3LvOFeYyVEW1Y7kESkmYsMG/S1HcR2D2/kkvhU/FS
         NIv/836pF3NJL+avieUhO+DXKBPixLnMK1mpdNX8fTu2M4zycAJAmBY6mykRSdKGE0+T
         RxWw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9ESm/6KlTL94lr0QSglLFmvJw9k9nBtsnhTtTAwLL+HVgnD2oRPCJHW76o4xC+kHGQf1+8AA4BMkhlnV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd74sWldFFpBQ5g/ysoE9rlLCLU113ryTnHa5bZcbPvur2w8mV
	wEfZYL1LaT1hgG56Dn3thIZSTvS30McBiMJevWCQpB0W6YplGLQKcWHRHEPU9DBAfOK4VLtiewj
	2m5YQ95advw3TGicj4xvOXNn5o7SQRRdD8jqT3/190qZ0f92POZEAwoP5kxpBO2rfDm1t
X-Gm-Gg: AZuq6aI+xjbxg2n+G5dJj6N86J+zQrh5zzI1wqJYbISwhZQOrs5UlksJOV8VUYR5I2s
	pIP2+1627s3QZzEvC3CqFiBBs+W1ogp/W+42lgHDlHVRfPdiUHDdBdiWuGy6+tMkarFosb1sl/G
	pnWrvZGiC4S/CJng6rMWqs+vB86Et3uGsPfNtRlHSvHVmDmuhSMm3E67yCSphj/QdaCnXhjg1lU
	xnhVhBZ2jlBAywXdrixuuLsdTNYoy0mZ/ed8n0WRTBpmzaxi/VPWLk1NUuHKtZwH3M2s3zJWhI1
	4tmkAI0PPvNf5jSFMx1xXJZwsRo3Wx1um1sgmwPaPDKfwb6w+igeUvzJ4jSPi19PIyza0qbZ4bG
	g0fhyBK27r44GVkPFqp7lwT8kczYZ2tKkKt+Gh7yVBELKUqZTatTw7Kf31uZbB574kwZvsxJjCl
	x4H46+2Nkx4Leg
X-Received: by 2002:a05:6300:8a97:b0:394:f617:b418 with SMTP id adf61e73a8af0-39517b35a81mr11353964637.4.1771829140644;
        Sun, 22 Feb 2026 22:45:40 -0800 (PST)
X-Received: by 2002:a05:6300:8a97:b0:394:f617:b418 with SMTP id adf61e73a8af0-39517b35a81mr11353936637.4.1771829140165;
        Sun, 22 Feb 2026 22:45:40 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:39 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:44 +0800
Subject: [PATCH 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-8-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829097; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=0MADiRxGeDkPQDc+D4cOyR9YpPfqVXFTQN8hJDo+rxc=;
 b=A7MusA8b1rixgM7/D/ASj0yIGsmRsBAexrkdv9rI624/50t9vZK5GeJTvPPItLcY41IBNloz8
 6huL2xXkTumBdYn/0Dhp0CDcxJhVHuohW+RmF0KAeN5DRuFE1OKOZNn
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfX9b2VIXvQ3KWi
 qsSn65/UcW2bU9ZkKPJ7OYtghs4uHgAdwd8K79RWci5ZxJAks2P9cRS1uJPlZiiwkYGqe+zkDCu
 fpjdvmcoqSpxSOrUjy6M0DkeJRi9KqbVyMR0/C3tvK8Ls8SgKpvNsDfs215Jj+JHXHQ5uMCn5kA
 VD8U4Jxe5vSLjz95JRpXpRiNLtSWoNTJJqreMDBNGZ3MkOoOFjSs0phprLe7ajSwfdGw4v1gqtW
 +oPIST9/tjYaH7XdJaWFrpecHrjjTqZ1+FIm0JB9QU7rocrKbxfLSEOU+qhBB16Wsa1S0Mb0DJF
 NZHj78zBhwZFzV8c9nCDxdhDgVaLA/+tYie3u6P0+Svqxqinw4gaC0+RSou4ZtB76oxHwnZaabD
 qHBllD2Vymq3hhDjQfOFNvXHUlCsaW00rR7vkD/ljoVnXsgtlykTZ/Qh9Z2YtYNloosOVykjgTk
 TzQlyXj7IW+KBsHWZSw==
X-Authority-Analysis: v=2.4 cv=T5KBjvKQ c=1 sm=1 tr=0 ts=699bf795 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: oRhYAgtt6W7HBDp9uM2kyWoyWskZ7Bk_
X-Proofpoint-ORIG-GUID: oRhYAgtt6W7HBDp9uM2kyWoyWskZ7Bk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93585-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.61.12.232:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 624291725AA
X-Rspamd-Action: no action

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..e8a20789cd58 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2800,6 +2800,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


