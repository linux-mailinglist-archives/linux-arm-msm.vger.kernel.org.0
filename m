Return-Path: <linux-arm-msm+bounces-117790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ORhkHKmWTmoXQAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:27:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DF872980A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 20:27:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i37blsxS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AVNVHskQ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117790-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117790-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 305FD303B4C2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 18:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032FA4BCACA;
	Wed,  8 Jul 2026 18:25:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFCD478E51
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 18:25:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783535148; cv=none; b=FOfheSw4wOdVRkzmBHAoRseCDQlThc1YffEyEL+IggYBfY/PYwVJ0lfsSjA2lHbihjLYKP0PDXdSL0S31TLOjSoBEvOQpEKzhHZF3C9f52niJm+jOX5/p/u7thvFwvPHJgOc7xyOySHs8w1gjzYcYCOTWsb3tZRgiYWDbBrYLJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783535148; c=relaxed/simple;
	bh=3K6L4c6OZp3Eul3Ri9W31RQJgrKQhggB3UWIGCxKmz4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBRGOuGfrufxC9iIC2ds2eBF0qEzUzYboBp56Xc0q1YDHv20imUXiMpE9HY3IZkSE08+MwiRh/53TxxGnkOGqPhDyfXYbgyauhwqzfLRQJ4yKpogbruR1Nnhw4Qyb8G/izIoOKnB3TadEK+zzvJS3UwYicjIeicmL0mNR5+EzIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i37blsxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AVNVHskQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GL0IG3256330
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 18:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SBzV8i8B0VApk80w48yOX5U8XJD0eQ+y0RjEDHih1bQ=; b=i37blsxSEiIOBQl0
	o3rlLfUvYnTwH9VGRR4PxuJM5kdFFj9+JwdPns6MvYl/HTcR8VAoP8MMLSoSgUE2
	VPY/V1K6h++w7UVd6Bk4Y3RduBslVac9KTJTy7E8y65drVwgMvnYVTCKNQnXkxRx
	9a6DUCqeD57We9+EM+VL0PeYVctnZVUOtpnLi905uR1zfvLGQVKvEdM8E3FKLhSf
	haZkXg66CC7easFoXsGHG7mAPwYUDbPNR9CdUn2x4+iuc7EomVOdnwscKjYVZoCr
	+WsnU1oWyxwszDGb27DxW0uOVAmOMT9iOXM1Ed9KXyvLsOONXOdpl6OHNPGKmWPe
	AdPH7w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqw8kj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 18:25:46 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so122067a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 11:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783535145; x=1784139945; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBzV8i8B0VApk80w48yOX5U8XJD0eQ+y0RjEDHih1bQ=;
        b=AVNVHskQwIR3pR0CvpcOhx513VVmDNXj7qQiBLvMXTDhdqA+KNhethIl5ia22FLJ3Y
         iqFrYjAfmBSAj0bnpPWWEnVwNyFqObauifTMQ4S5wzJMAnwHrX8CZWxjhuuharngTXyJ
         J8E7tG92L5Gys3GziKdVlsdfJWGtvcxgKs971Dfze1stkDlFa/miSjI2gQfqH9wE6tfD
         E5ZwGivWMua8kkyVTcw6PUVO7wfQlsDjyN+Ud7pD7RkKa+v3r/xC763Twhjvbw7/NXzw
         jtgc6MG9zFlG9mFjQh5zli4As7SwbgLXSBSustGT6NCPVSFRpAQm+8yCMyBCWbKoyCxs
         uOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783535145; x=1784139945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBzV8i8B0VApk80w48yOX5U8XJD0eQ+y0RjEDHih1bQ=;
        b=dAcrvVmaUtjGBJ2GtkNwgcgjfpAQjSvOVUyrbK76ayMh8nywwDIcEkt9zrlOx+IwpY
         IhTIyjmBPWIG36yFVo26JJqGYVDWV/tiRY2yQ0Xyy5s2UrebsqQoBE0dvmDpWfJHvBF7
         c+uMA0qz08Xf//cKSpkRPSxa9vPmuoMP4DILMUlJu252DSJlNqB2A/mIMeRXWlSGugXp
         A1sCANyEbNdXY0RSGwR64rfHEtXDFpvd9Yp4UU6TbbdCp+vqi3z3YyBpAElXG6emnzt/
         OKRZjCf+lG1kQNk4VJl84KaiUXdGQCwcE18oPo51ZYgTcbPYofsBe2VZpx25h3QiGFWo
         GuHA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1tvNardKN8vwD5+2c8IzfazsKL0ex2VsEa7fm0hPGs1yuYy3JHPaJDPkGPNy0Ja8f1IfrsrCJ0nAQk/2c@vger.kernel.org
X-Gm-Message-State: AOJu0YycUYeYWvX+OCIkBjaf9wkdOT3pB6LU/vAOAuheaOoxNbOqLu12
	re53dp2wFQyUFn4xlno59Y8sicnZa2q2rxwQ/DqDDQ95knrOklgKqwHOz9jsx2htwBv86gS2tFE
	bVVaoRPAFbfhunE5L8mARxlEnlZQ0SqeIVldUjilSznWLNAT8xvLK9T6/6QGU+YXZBptvgGmB/N
	Xr
X-Gm-Gg: AfdE7clA+S2K5ovJSAR1a3CVUjRRYmGdpQQsJK82e36z0wwSDuTbia6MN7sIoRJ75U5
	7Bl4ZrsECSK3McZfkGz3fQuV/ovWVzt5QEpREwuJFHWZjtq5mq+Oh9smnysFHIm+jwFtI8mrN1C
	We6w6MxeqFcMnFzHo5Lo6QYDzX+KFX1s6hIkLZdc1xkcC2VmIz0E/jOzEuXT9hE+CVe3YTvCy7d
	ECND8ZxYaA5j5LKau8VZKDAjBaroSOZiH/LIq7YPH2gwU2EEemOpbW3XE/KT+r0f/Wbui/sDuOb
	Z918qRtVP2gzAvDh+c5UrMC2TyW6hes5XJ91oXZkKSocj370NxO6dNXNjCMMQoFUq6AfF+9dPh2
	87X601wDdYts/k7Z3tPnSBeO34RZu29OUgaYRaA7+AQ==
X-Received: by 2002:a05:6a21:62c8:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c0bd164cd0mr4158494637.56.1783535145412;
        Wed, 08 Jul 2026 11:25:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:62c8:b0:3bf:aa1a:d2ef with SMTP id adf61e73a8af0-3c0bd164cd0mr4158449637.56.1783535144873;
        Wed, 08 Jul 2026 11:25:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af7d5946sm2671098a12.7.2026.07.08.11.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:25:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 23:55:08 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
In-Reply-To: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfX2gKT3CN4OlUG
 3PU/ExABHWENRK/WR9WPY4L9O78BoCnvsUWcko23kpEHoJjmT2/TEomoj0YMZBuETdX5cAf467q
 oePHKztRQY7l1RewGVd4Qm4Q6vfnSXGc+uZkZ8Cmz+eOVymXbrKobmSZniAkUGPYuaqjYD+2GMf
 IogthYBVXGDVFaBJJR/hWDi3zuEBFjFXVPlClbfG/TdQe+Y36JAdYncYBadp5KhxtnZvaMQBGpL
 gqWCdQwWT/zBXtJrruJs/rNTz9MykGEa5s9tp+UdBxgDot8DFWklUNr0NAAk5IAaHULCPA5lLtJ
 r0+kP1Tsi8gHhey+2FooqtgjcNYH2J8ENW2E677npF8yozC7ZJXO7+kNqAKD04U2r0RruupsrtL
 uslqvFlM0yUnEWRX3Xg5sqsFFE7YlAUur0HzByYNlZcGCxBMW3OfF1C99bK3Tiq7liXJjyxBzcP
 Sb84I/vMSn8DekYHoIw==
X-Proofpoint-GUID: 6HUnygTpibMz-ihAWUvPv1dt4Q14xO3d
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4e962a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3-fpjux48RbdSrvt_gcA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 6HUnygTpibMz-ihAWUvPv1dt4Q14xO3d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MCBTYWx0ZWRfXzChL2KInLCcB
 OARxVDgedPv0uHdY3wsa35iK8rYnn4w2oBRJ83Ut3dwvyEfKxTlNybZUgS6z5CCxbHI8+cF0QiE
 3r0qcBf9edJsvVdL+JEy6pSHjZexVxw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080180
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117790-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04DF872980A

Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
differs across Shikra variants based on Audio subsystem enablement as
follows:
- CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
are required to be supported on HLOS.
- CQS variant: The QAIF driver runs on the Modem, and required clocks are
handled on Modem, so from HLOS only resets are needed.
- IQS variant: no soundwire codes, hence no clocks/resets are needed.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  8 ++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts |  4 ++++
 arch/arm64/boot/dts/qcom/shikra.dtsi        | 18 ++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c34d371f5ac23efe59d1c9d2723f4..2d56182a6aeb3c36f525fc32dba7fbcd75103984 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&audiocorecc {
+	status = "okay";
+};
+
+&audiocore_csr {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7aed3121ef092df684b19a4de39b497..46e1d8b718af30c095b2535eb4f7fa6e60157c2b 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,10 @@ chosen {
 	};
 };
 
+&audiocore_csr {
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..c008a836251fcf96e8376bfd3fc17ee994e7250f 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,rpmcc.h>
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
@@ -640,6 +641,23 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		audiocorecc: clock-controller@a0a0000 {
+			compatible = "qcom,shikra-audiocorecc";
+			reg = <0x0 0x0a0a0000 0x0 0x10000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&sleep_clk>,
+				 <0>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		audiocore_csr: reset-controller@a0b4000 {
+			compatible = "qcom,shikra-audiocore-csr";
+			reg = <0x0 0x0a0b4000 0x0 0x1000>;
+			#reset-cells = <1>;
+			status = "disabled";
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1


