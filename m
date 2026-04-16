Return-Path: <linux-arm-msm+bounces-103403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHbFOI3R4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:09:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAE740DE37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50427307E625
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936603B19CF;
	Thu, 16 Apr 2026 12:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TlSDBoIw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0TSbkb/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDC83B4EBF
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340912; cv=none; b=tJToWixjWZ7UYkrLd9fgUUhc91W9uqOaBWxi1egUCn1NnERkZXEivr2HItX2yADCgQMjJfJK1FQ3+5kwuAW6KNJ0uW+zqcYtNiDkT7CUZQLkN5UV/dwhDHPePVdsU9raAYu7njnKvzv6XBwq4O4r3a/4HWYElbPxeVuS1X4Bwzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340912; c=relaxed/simple;
	bh=VX5sSr67MU3/CpnlojQxc1yhq5+mYZkwNEH+oRw8f8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RINDM9Y7aeuspdTFaEhSNOswldPnWrZU0KsPimN2WZH3ouENuoLCrkDG0ILeGzwaVWIFjVLg27hYjvZhrJhPkYSnld9Dq+umE1UixzHTfF73n1vN7h8BCJy+7AG4JtVbaZO72Q5T3pzCxvxYNwCDJw6879bYVGyVDXIGlaXnsqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TlSDBoIw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0TSbkb/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G6JNM11668220
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJ1T7dVN6bkDufKjyOSICvcs5KgSIPrr4Xb0nXCC/yQ=; b=TlSDBoIwKB/GqkZY
	jZLHurAn9G/osFtmtPUsRisXUB2Loo3YOHUya0j0awCXyS3APayJQNaQWzR7iDt3
	k96sTxKcDXnkDzKflGCg/4AaW1HVUGdezFA1I6wIV220zzpVVXwb3iTXH2JTJGuf
	p7LFOwd6d5sXZj8pjGDZf0WS65hbWwcX5mmRomnD12BJYjyTVDrcnTR91iyvyEgQ
	KnlkvnM5iFJGe1Wq8Q6TwEwc9HS9tA+zssQ0xBVTZx6HxpvVIq8sDj1APpDF0xg4
	htEfKBANs6Hc/3+ISTyuOZThZBXaaavT29r5saiKc4dmTSA5yhLmSgYN6RyaWMw6
	AOt6rQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djtd9178b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:01:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6610a6c8so1034758b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340909; x=1776945709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ1T7dVN6bkDufKjyOSICvcs5KgSIPrr4Xb0nXCC/yQ=;
        b=h0TSbkb/7GfAT+5yAI9ABhgLEqoj72iWZS7Vf8S2xWS6sDBHpy/9f7SYcIfQqWmPmt
         gpjFu+2XPj/VculvW19iGqkMuS+Rv/pRZInys4o3sB+IbjCoF2g8l8Si5BH7lNJ5Xe8z
         efK6Tewhrib1bjrKKaBk41WVoXeWvWZ5wEbO6tTLq6UqCFlGrjDKKnSYwVSh54HwZZ9e
         AHYEAxawujM7vQdagaC8WqTP574g9lR8gozNBqChiHn495/k7kDVJH14ZafhZzuW25fY
         8ekHDUPzlzyZIgnQTJj5oMRifFWHy4aDVggjdoYt305KMwje/i/FK9VaqAfXGrY0tHri
         rJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340909; x=1776945709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJ1T7dVN6bkDufKjyOSICvcs5KgSIPrr4Xb0nXCC/yQ=;
        b=dIf0udm3MM3mV+Pw5+VXB+quAD4TgzE3Qb7Msp2VMy38BgOaD3qKDcuE+ZLi9BSXRb
         ME1L2TkDMm+/RmgbmI0SQyMtXt1S25OObo6HujFAe017cyKm1riNgpFXXhs50cinWiSh
         qsuJt1yJwTF8Fb26Kwupf/lU14AOwyrK8u03OZcPNhaHrxfWQZn+uicHHxz3E9X1ILFN
         YIFVJNkmxFg+gCbCW8DzedmUKGLuSpBmmzMXIwvo4lRCU+OowQsYBRVA44u4T7/qd7kC
         APK2eTT7DLPoBQi52PyKibD2HdDJEsmQ3i7Y9WKXWuuDzOYbVPwHApyBQtmj7Iptj2+c
         snMg==
X-Forwarded-Encrypted: i=1; AFNElJ8abtlnUTYuntpqwPLDQGbh4qglVn6Z5CX1wpqFayOcCW7mvGHv+9sx9A08SCSLufKTwuF4s7znNHnsM7HK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3yUK/sBXKMQ1K2Fg2wNP1flYvFd0XSR0ldZF7SLqruGtlMOSA
	yXK7fZHAkSJK+IrMKUgO/UGaS7UmYTT6yWArX5w4HrhWgLqUiQQMyDFllyZNnuqLirtEb+9ztxY
	srmir1I32dbDHLG64BCDx7H1ZwCqOq7DgbqruzjdpT7zhQWXbPX5PGNUSahKrM9ZrUPxC
X-Gm-Gg: AeBDievBQBBmaPGv4c0X4qdz/lapG8quaZdBpYgTOJLu7vB4V6qhAy8ftIkAilj4rWU
	zOGtomDO6xyn+gwdhoK1wGfbz90YondehsngZP530UpFhz4lzv4LrhNcdY3s36oYLnROpqa50M4
	irWeErTy8oG+/Le0TUGSlbQ736AYOD7CXJFWKqxHt2YztKjfKzAz+jsPYqFn8DnhMCcN6UEl2PL
	mRuhEIQwKXSWSENOaCXpJtwQQPbfKBzFXmEiz0aZ2StKGFXXHHi+QSgDUjGi5R8TiTLuHSOq+9t
	f8jTeaqSMgYnhSsbh45MXdWLNWOTn+POJY/5XuhziqilaKvJZKHvNwtvPDzKniOblwBLYbjT9bN
	ZnpBk/zyxrBxInKQdxFhWGx6Cgg5ILpRKp/Vr1YEVLBuAqnm/48MAJfWs2g==
X-Received: by 2002:a05:6a00:886:b0:82f:592f:2ed7 with SMTP id d2e1a72fcca58-82f592f35f5mr10651286b3a.45.1776340908885;
        Thu, 16 Apr 2026 05:01:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:886:b0:82f:592f:2ed7 with SMTP id d2e1a72fcca58-82f592f35f5mr10651206b3a.45.1776340908214;
        Thu, 16 Apr 2026 05:01:48 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.05.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:01:46 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:30 +0530
Subject: [PATCH v5 13/13] arm64: dts: qcom: eliza: Add power-domain and
 iface clk for ice node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=1388;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=VX5sSr67MU3/CpnlojQxc1yhq5+mYZkwNEH+oRw8f8I=;
 b=M1qOa1hwZmKz1mi5IFUm46eqntN0RI7xEMv6TyeT4H3YLNyB4ZYvMjT+ilSsGkwud7FusKpU2
 haes6YfXDd9ACWrx4HGp4PkPp8JlraGY9WdBlte2btIV0x6Tx17VuPa
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExNCBTYWx0ZWRfX0ZUxcu4Z5NYW
 JYz/yCcpqtymQ7sdhUxuM1td2F+NwMEkwttBfyNMYPpUF+CDmL8muF/bApglg6JR/vqkPWHPp1C
 Qm98IPPQGU21T/zaIRZf3eaaRqjhYMYKCXgwUQ9HX/QMJDQ872VE8x3EcX0iVwkCbllImX0qLAP
 KwE2VzqEvSKG6K99dUrP6ibr7njRcrbiph1JN7hBVNH+gE7wgX5oAMTG+Fk69fJhK2+ae8oAokT
 K1NYc0ftNBcQGQyYuKECHbJkwEM/JCAZtbtDxDFUmeJWn7Q9Wr8An99gRCbpJubBI5ylrceihKX
 osqT5HKcyJp6th95OqX/zm/WPH6g8MKvn+D3BPowsoD4fJD6UJ/XO3z57/y+/D/8tjcXaOe4bUq
 Etk6p9dyJS/b0oqmYG0MD2iVRZDIqwGHPIycL+jL+96UXlI+rYVPwdAQqDptG0bDnhY2J0JUtI0
 evY5k5P9LzEeY3v+dVQ==
X-Authority-Analysis: v=2.4 cv=avuCzyZV c=1 sm=1 tr=0 ts=69e0cfad cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IPGZAGG64n0kybUxs1kA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: PyIT5JXHK_AundR8EWV_m0Mq0ypjJlBt
X-Proofpoint-ORIG-GUID: PyIT5JXHK_AundR8EWV_m0Mq0ypjJlBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103403-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,1f40000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5DAE740DE37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
for its own resources. Before accessing ICE hardware during probe, to
avoid potential unclocked register access issues (when clk_ignore_unused
is not passed on the kernel command line), in addition to the 'core' clock
the 'iface' clock should also be turned on by the driver. This can only be
done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
eliza.

Fixes: af20af39fc09b ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6..7e97361a5dc5 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -843,7 +843,11 @@ ice: crypto@1d88000 {
 				     "qcom,inline-crypto-engine";
 			reg = <0x0 0x01d88000 0x0 0x18000>;
 
-			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

-- 
2.34.1


