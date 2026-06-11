Return-Path: <linux-arm-msm+bounces-112587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QinvDnpDKmqglQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:11:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8668A66E6B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:11:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Rw9KzaPU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jMkQjzWn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112587-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112587-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4B823201EB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A2436403A;
	Thu, 11 Jun 2026 04:59:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6322373BE6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153988; cv=none; b=PR9KzRTYOD6vPjr1fE3rtUONGq1tXxuZn3lSrfAURLrkSLzcx3oA/ep+4enCovzl3jydttzSz7bLl1nOYo4ZIBMnNU2qrcZsi+V9lhcG3KXiEieFUE70xfgxb2vBephjXt8kphx+SQq1gGwaDZFY4szIU9oysGVC34JblpL3UWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153988; c=relaxed/simple;
	bh=grym2NR/kAV0aYecoJf+FpWLScxnZ+YDsJl1+8FBBOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSHxq7KUc3i0LOO5oyhYJw5tjS5Qvg65qM2pCyobow8RUQyn8olxQ+olHyNFHtITrVzKLVnlcJP/ba68f4evSBt48rRk8Gyjx+pucM64OKWGK6aK2FnuR8KnJUqd9sX5ahcDMKi5sDCRkUciOQq0mlYbpMQ1KaKVutRJnRrf3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rw9KzaPU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMkQjzWn; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NoFO3215433
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=; b=Rw9KzaPU6m5hix1u
	popX7Bv+DjF8OAqDs7GSG2SwcIZYGxhy7Uiyjfwj9etfqHfPlkHGRaHwOFLexgRr
	Lnb/N3rXbYi6+iWJZdPp4IliELS2p1M0vbfQcELg/vulTUI82Jb8bw2bJi9iVSTS
	S/nXYXyXE1UJbTSugYB9WUwUzU2Ytaft9g/3Q/nK5y5E0cnaT2ZR4FpWvyWd2xkv
	icwVpoNzL5BT08F4x5yyanh3I2mMpeIwH8RjAy2ZmfviS0Dc/QUeGK7SW2exp6E3
	fxLSTmSXF2ZfpjyyCwGyMO1Q8Os5mhsm4D1BxT1SgK2hVwW7Jr35dtcezF0Bgavr
	xPmKVw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1n4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:59:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c32faa62so133372835ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153974; x=1781758774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=;
        b=jMkQjzWnAwMdt32DpgfcMe4iQ86TT8/6M7Jl4aSy0ZKbxbjeChPhgUAIjEvvWv7/an
         pDoAGw3wGUYXL+fRch1M4EneIU9F6ni3Tyht8TaDB38DYEkeTNrunaOsa0G/0Fci2tQa
         WdPlucQVdUMX8T89KRplwooDNjghQ5lwYbSZf72dVs2i8W5ektAaHTCbgDlp4JCafl7E
         BMcFS1BVYVObb8/gVxxctjK7CwIW4AujhjDcYPJ/4TDyjOObpcb5ybId3eIKD0lETe7x
         h8/obr+tAmSZwk+BnhPuqpuh0gXPzrPCX5uxqsC/NJqI3qXcTcHXkO6Uo5q/uWYwHzZw
         OoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153974; x=1781758774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7n/2rnujuyivCuY5X/zQ1UdWqSiPXQtl8dZdQZ/7k4=;
        b=U4Hw9tzVe6WfQUG31SkhmgmDYp3nwySbKWX7pZi1Qvi1XOD4LgEbtdQbBuJ7paTOtb
         H/K/zlZw6z4hNNsfiiUwSuTcvUp1VuWrbWr0qBQhHTCkTnkIWjW8erKkl++213+QRtOh
         GYB2IVI1Pi4FrJdkBv0kSdQsE6PeMRfo/Z/Q4TROKspps/+7ZauRCpqUW04wC2uxMezw
         i9mfP/dYY78OYrm2pNWtRDxpsQ6pGrYR8DKhsF2Icx9EE4gE6BtUdPHj69vHsJLJIrlV
         uflJj6064QckeHjn/qiicMewlZe1wIfbIdeO0hD3BqPTVAnWTvVOJfBHg98acXom8lQo
         UpwQ==
X-Gm-Message-State: AOJu0Yx6tQlB86U7qBRTVj6HytefJcwagZ8wfNRGEXe/xL9Z42Lw5z7a
	HCwyM1czYvK3z7htDVYIJXSR2dZ+ujhgh5pdXJVzuZ4XPAlo47W+anWL3yB3gG4HHYPQLw4v6fB
	YO2ksCGDedfqf1/SZ8bwtMqSnom2OeBxQYXfceKiBvK4v/f8NGw87ie6OtqPTouIY4z/ZahumNz
	8k
X-Gm-Gg: Acq92OEFoGw9YCgWry2kbxPJX0hTFVsQB3vnCSQDY1xj1AMoa1NtvO6UEREanzP9R/Q
	E2ie4eBY6q7tB/VAgUrr/VT38HIVQh2jzLZ4OPPMAfGq8GrMULzDFrnxTWD6/A/vY4XsQu5pLqZ
	CgvbNRkKF0/OYh66Bkc/9GSsflZSuGVCIoc3p+0703BxlEZxpIClaPeJVbRFOjwr2q3DkwT4MuV
	pX70cTxBxa6x3Jz0GCvgevv/EPnc2EYXNKfnFrd8Hd0ZC+s9Cy7TQNcSQwcYxXK18s6Qb223C8l
	nfcisO2zgS9BdE8m/twQFlxi4cqzAAB1GCF9L7i8WrcjKM7cBEm+b00Pai+W2uNJhehSTinv3pA
	gHlW+RJpAlEYmnjRfzcw4MaNz7FN0Ha5896TpvYugwLNkpdWcSg0nbAdurTrZvRe/q2M=
X-Received: by 2002:a17:902:ecc6:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c2f0638230mr14301655ad.9.1781153974327;
        Wed, 10 Jun 2026 21:59:34 -0700 (PDT)
X-Received: by 2002:a17:902:ecc6:b0:2c2:27be:39a9 with SMTP id d9443c01a7336-2c2f0638230mr14301195ad.9.1781153973836;
        Wed, 10 Jun 2026 21:59:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.21.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 21:59:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:28:46 +0530
Subject: [PATCH v2 10/37] arm64: dts: qcom: sm8650: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-wake-v2-10-2744251b1181@oss.qualcomm.com>
References: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
In-Reply-To: <20260611-wake-v2-0-2744251b1181@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153928; l=3273;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=grym2NR/kAV0aYecoJf+FpWLScxnZ+YDsJl1+8FBBOI=;
 b=MByTtOInsB4cIjgXiY1hgmbrDZXYrOMfh0417xXrAcL2Ygvo8LX8epTuarVbJB4u/QRvuzPGb
 G6M08ldUBzFBx9VxLjuHfa1e74U678Zt29ZpWhhKIhIdKFA/nqZzs5n
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a2a40b7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vzsU3dzRAwCoIzd_qrsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: le4LFH7hdvi-uG5U7H1u9707F7g6t_Ir
X-Proofpoint-GUID: le4LFH7hdvi-uG5U7H1u9707F7g6t_Ir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX+2pfpcfSzShF
 8keO+UolvdDCtTa409/mfOLJeweMZp8yplvOsAKjAWQhHu3xX/2W+C7mqgkMUjRuhqbE9jsJy3S
 /1sJh2lpJ92vBBH+g+sAA0xXV8Rz3WZ/VSYKjhDofB6OGTdK8yNMPwq+owNohHkD493Fi7Czwnw
 PwgmitSg9R1tPrlA10niUa0b0jpK6buMjBKB3Q/kqpzx06dPfLlOzJDOVCB8DbhrDp4aO8Cw2An
 yz54L4JKRtfxJ+2MahKuzT+HY+BkejTa+JE5S/0o+4tbGswn71iJzS2fuqdA+REk0arAfskwWMk
 94BWNC4F3urt+/OVHTBmE6pwSTKop4ZjivsgflraUqSU3EOqU92spz8rOu+KISLrfpYasMqr+LX
 HXJWOyLwCF07MFRaEv+Oez/MtMksu/VAf/VHeA9VLZawEF0f3C6druoc9hzUXaI3QDNmVSlohQE
 sHDoWKXko/DlaSQ7UlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfXyfHGIFKDKebt
 q97worzeGos/cnr3+54Plxo/MtwFFCqcunXYXESoNiSeVg8t+ItMMbyE3esE43UHJc+lEggLQBe
 qBStDzAQoowiup/H77lcwSIYG2Ip86w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112587-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8668A66E6B3

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..2123312d88f6 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,7 +1074,7 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -1108,7 +1108,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..775ce9f2dba0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -942,7 +942,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -976,7 +976,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index dd6e33d2dc5d..8cc0d2cb3515 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,7 +642,7 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
@@ -659,7 +659,7 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index a3982ae22929..c302996a7857 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -936,7 +936,7 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;

-- 
2.34.1


