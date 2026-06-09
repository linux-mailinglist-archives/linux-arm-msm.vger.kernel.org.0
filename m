Return-Path: <linux-arm-msm+bounces-112046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1dPbL8PKJ2oz2QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:11:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B1765D9B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 10:11:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iVVnk9or;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DQbhrXFn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112046-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112046-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 48952306E456
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 08:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43813EBF14;
	Tue,  9 Jun 2026 08:00:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBCE3E9C11
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 08:00:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992049; cv=none; b=eqQEnCoPaD5BzionB/oTAR6SSNJ09FBNkrVKJK/Aszb4ux4pYaD9amABxnhhLBEkw1XrKmhR21n2yJ3qaxO5e1uqsu2s9T0z5aU9NcOPUr/COo9FaXHB8U/Bgl6Nnwv1KwXXdmjZ9u5jdBSKK0kNc559WE7qu0bfsEPNkH2zlwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992049; c=relaxed/simple;
	bh=PZ1XNXCW7b9cydEjIO2vFBBFLv79PQzEbNvAVpI5+nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EGYsjG/HMJVkD5A8QxC4YfMlbzy8J+9rL1U3qZLwpBvBcS4uLqrh/Nbtq4TRN4rJ061Kj9n853uBzs6/amKsOVuMSxZOgCZs4QROjQ+qMf6r5ZXhvSi2X3dtvAqd6CcaXDt8neER3r1uwmjuTlRwR+XFRrDBRvmcIT9AErRucaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVVnk9or; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQbhrXFn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rb3H2034541
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 08:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=; b=iVVnk9ordRiVEJdi
	TkXH9pcHH2bFdcCpOiDmbwhmHPRtKc38AVRIFvKFOwX3QLj9sKxLAI+MchABGjif
	/sbrGBgfp+YNhpFuyP0Yj0lr1npFDuiqImSH+VUQ8p8z+INAN91YVjwHe61WMmlm
	XqYpCegs/OoC7CtkRtUKkZ0H7rkz5cLqf9wy5cfHGwLbJfZ3i0x8Nqqn+JmVLSD4
	h21P1V9vPxqFR7B76S446uN5YV8QSBX97uDQNlCqRQYFiTVWw1GurqZDr2RiQzYH
	pPIdTikfIziwi+9MYpYcXgIx/osAinz7iVaJpRul6qrKS9UG7Jvml1vEHITGQZnK
	XXrEDg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeear4e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:00:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8cecac0e467so96096376d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 01:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780992046; x=1781596846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=;
        b=DQbhrXFnGKcfzLIkTa8S3GV88iZYY5GTnsE33eAd32wghziM2ENXC08EWWoKVqc42z
         454f+LG+Nu08lruw3XgV9A0zGyJHCONhvfN4PZhxrHPQ3GxIYeEse+MoUkKzZzr16zGH
         ylmltW8GR7kX2qonSNWyL/0LM3+Ub2WA52KAl/MoL0huTXNA5bwrOWmCnxrC+jdFYRfW
         7HIsNY3Cua7Pyw/T73W7Ou4snf34phy55AMM82BswqHgZMX+IdscVpKKasH/KhguUJu7
         gAGYn9rT9T8tl9DxiBW1BLwljJzvmYyEHefTDOhktlI+2tz4bFUZ3SlCXwt/+Kp09yK6
         8Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780992046; x=1781596846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8CaWce5TrqZ+S0f4vMpdI7oxRpV1Eg4sjuMXi8VkGg=;
        b=mfTX9mTR2Zw5tW1fO4GaGRJduJuQgPuncwDRWEDB33VuIKJRNPtg1zYv6T8atPKT0t
         ykJHiGCeekyAcczVcMX8dkqQRJNQ8vjfgbw3GIYXtN9UVRoLPgReH7k8iA9ola0rKlgu
         jxKUhh/MEFSmhcS13UAWoGAfwksSFId2+xeJQZdzrOAfyQ0XaSqoTmuUta6P4LPUFlIv
         38xoP24fuQlzHjg1aR1YgowhukQdncTMSwd/n9FIMpLtVXQ0lEgbNa5ZY2ppWa1+2NJ5
         ea8PanrSKvgcr8bMZU84NbvfLHoDAf9SvGIyLrd+8umtjFYuXSW3HBJIlw92AoOAzBcK
         O8+g==
X-Gm-Message-State: AOJu0Yyjmfrg5dhcSekb7glouOURGbaJ1GEl+5R2A69kc0ezdMiGQxaM
	pzJOIdWg15KoGpdNo50Ydk1zAjjc1nzgrgmRowwxYtvqT1my6tVjeiGxoZeWe7AtyC6wBIXtpQf
	LHY3KhBJMIl6yhy26HZSEL1SKlBWxQ63AbyHwhSNuEYHqT/IGN9E/ELX3fqjVZOpgF8z6
X-Gm-Gg: Acq92OEe2dLdEJ4/i7AWoTyjxuGQoi3w8FkURiRnn6fMXaQyphldveoohTUOVAH6AtH
	MyUmekO9Xk+OjA09ujw0jKfrWG/wmM06M5EpTkq++8M4SGzpmi283z1eJb02rwAxkdgiyUGJERf
	nMO285BqffyDIJb2b+cW4LqUvEVeUSX9pYQXuFTiWM0b4epJ/YC/GuKtwLfNNhzLsIQr+IHm1rV
	csXgJ951NRoSUnkzgSSmnhC1lJRlfSjpXtwpPEkmrUI8+y/GNJLmchwCKx14iX8B1k9nh5NcGOg
	CZqhf/zLJDPR1q1yaJFfaZWPyNJTTnzfbha5x4eDt7qaY27e+fU8NlphajXBaxjvGuIVBxxbP9U
	0cSz0pmsp3tnNgxvk03dbHF3A+Jviin/N7hU3
X-Received: by 2002:ac8:610f:0:b0:517:707b:14f1 with SMTP id d75a77b69052e-51795c09df1mr268755471cf.46.1780992045800;
        Tue, 09 Jun 2026 01:00:45 -0700 (PDT)
X-Received: by 2002:ac8:610f:0:b0:517:707b:14f1 with SMTP id d75a77b69052e-51795c09df1mr268754471cf.46.1780992045226;
        Tue, 09 Jun 2026 01:00:45 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35fb24sm63605930f8f.34.2026.06.09.01.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:00:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 11:00:19 +0300
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-eliza-dts-qcs-evk-v3-3-b4e9b033a6dc@oss.qualcomm.com>
References: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
In-Reply-To: <20260609-eliza-dts-qcs-evk-v3-0-b4e9b033a6dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2559;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZ1XNXCW7b9cydEjIO2vFBBFLv79PQzEbNvAVpI5+nU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqJ8gklr8OARUi9R8y8321shMsV/7g80fXYHSNU
 FTK8NnNqEqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaifIJAAKCRAbX0TJAJUV
 Vq+qD/42XZ3BERArZHooRt8+ArPuKu1NF4ncj+xIkUeJ7dYhHZ4jCNmROqZNKeYkSM3dPEvPJRG
 ePA4AfrNJqMJCo7QiMo0WD3QSGMkowkyDZej6Nm/MmcoB+ng7KnSTIFkHFd41l//HfZ5Vg/rNT2
 /0snEi42UYYPFoMYEPc9SEYX6vPGilI00AjuCl0ksnEIXs9e6uuDU/tHlNK/v+CGFRWNeSFZInb
 3q+eIVhh1APoeS5NdNbXw1sK404KzdkK+19gGjoHJ12JCsgrpcd5pG2NXq9jIqGKl1dT8bNVmNG
 5U9399gWVWhATBDtg1naCObSo8xoNZZoRMpZyYFUttwRyNS8xbit47p7/5E3DSlUC9NY1Gn94by
 aY+lgZ9Cbn0njqkzN9+4noneZ65oZMimyfBV8vHSkUed9T4YEUln4axe8oPRK4rY2csJvDjDkk7
 pQrUDJKVmH1q2zAEqhLQDmS7hYNyEF0KDZd8ihD6U/Nccd8KoTPNc3/SNbKEx/EKnAJHcmI2w0Z
 WN2nlEpFDaIvSDUdM0XXzxyaY60YCNbBKPbYaJXKYDTullmUvsqM2M5rudeBanwnLfUxrtzV1Ha
 lZ3ShhC+lW2qN3tPkQbxu6sTe9lTuHv0jTZHr0xzej+GbOS4RhgHnyJ6UKSfRl/+YVK7xhdBf9v
 WCSthHKm5X1A9KA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: p0vXb2AvBY3MqSe1PGGpgsfP6VBHgBzT
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a27c82e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nfd1YeTbQLvsyS6wM0MA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NSBTYWx0ZWRfX4jCfhi3+Xwu0
 gn3fLsMIPcM+p6WILkaeTBCrEZNYluCHCEzdDYe4emkGgytax9PEICAS9XHnKb/0i1AWDuAxAbv
 9t+dVDx5QGq6kZskSOR3uKn6mK74EBFWPXomtZ9JYnBJwAW7yzBPHti0sjeCTgdmNavvgDp3SjP
 KRKoP2pJwzUtRJ1WLlHEPv8FUb4WRgsX2sLs15rbtVVbTm/eOVRRLaSTNzE5uCTVhoBc5X//0qk
 WFAyyllHKen5MnDFHz2e3SkoA14P84bWWPZZY29o6MaepbConn6N6RFmXvw2UXXsoayTD//Y6I1
 PXCo5NA3qPZ+6dP59Yg9ZXAyVuZASFNmWWPIhr8NFdRgZkhEua1sJQps0TMrKsgV9A2Yt75a2t4
 nep1crOa2E4QtNLe8UHyxt0YyHw+/lSybgjn44H1vzr0tdoOIb0ZJDtb8/dEO2mBhFNOAq3St/G
 2BJOlk3Ns35Io5Lbqkg==
X-Proofpoint-GUID: p0vXb2AvBY3MqSe1PGGpgsfP6VBHgBzT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112046-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8B1765D9B9

The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
common Eliza EVK base board, which provides connectors for different
peripherals.

Add a common Eliza EVK dtsi for the base board bits that can be reused
alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
including the CQS SoM and common EVK dtsi.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile          |  1 +
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..001e18cc4bc3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
new file mode 100644
index 000000000000..43d428a4ed2d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "eliza-cqs-som.dtsi"
+#include "eliza-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Eliza CQS EVK";
+	compatible = "qcom,eliza-cqs-evk", "qcom,eliza-cqs-som", "qcom,eliza";
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
new file mode 100644
index 000000000000..e47b24f8b827
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/ {
+	aliases {
+		serial0 = &uart13;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart13 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};

-- 
2.54.0


