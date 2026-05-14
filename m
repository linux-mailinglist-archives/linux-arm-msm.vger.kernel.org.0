Return-Path: <linux-arm-msm+bounces-107521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKWUIoNKBWpwUQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:07:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 160D653D8B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68652306AB5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25133AB284;
	Thu, 14 May 2026 04:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pi+cv1Xd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/NBO3AD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CE53AC0D9
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731562; cv=none; b=LE543wy4EoAC8h1ErjSbW8Zw+kUW+FzikPpqZaKERPH9Qy6GYObsLn5+zzL63KD2fIvU868+hl0y9HqEZILlK/EUl9rOdrU1dQztIRKfmnSBgqR+z0GDngmAhqswj3s8Fx2p+M4aDxSO2DB5fAmEQHJ68hnAij7/w+pbFjbQ7Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731562; c=relaxed/simple;
	bh=NSS+8G+ibskDCDvu6fcJc4pyQaMxJASHeRL7qLz9RVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLpEcZb1ftQpW2sEMIXaLusvjwrOZDBFiWgDJiTwAIj2AvB+M7EoEMeRxl2t/kwUQLNscAZTfyiopaRbv1e6EEYaQ44g9tD2wHfE0raL5r8j2Bpamhn+4S569bBFY0FSsjXndw2ti3MLCsoORcAUKbYmQdYOI7JXQckl3+PpoLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pi+cv1Xd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/NBO3AD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0t3VL1622258
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ee8/YkfiIk33kVhGUGiqYN2ND7/cayQm7TapDEB4c+0=; b=pi+cv1XdGC6lZOeI
	7LIjxJHH/1qohjNkRqqYxZ17qMgwlhhobG7uyhwMObB30ka+mJWPUSRl/5QDVTbw
	vxdr7XWHFlnXppMtcjWpodYKdBUpOmZz177isQCP+xNeEpjvFwhd7vodLv5cNjEv
	si0Lm7FwoqW8hqwsavH67W0FzWve3VeebM0JXtZpNtNNSo4tgGbAu1P8BB3dSNmN
	ozPmieiihkxnJJvBABrCtDoUA75dCe5TOgczXIltk0dHIXJM7Ye1wZdwRN7Z7rUl
	5TswjZ0MLNOqvBN9gXJ/uQyBEbu0E1grCfYaRmxa4af+MaaypLDTWt1fIiHy3Qnw
	j7Spjg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492rgad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 04:06:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bc6899bfb1so61596045ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731559; x=1779336359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ee8/YkfiIk33kVhGUGiqYN2ND7/cayQm7TapDEB4c+0=;
        b=j/NBO3ADNB9IGNoX8TxYmPDyRNUPqyVPu5emDqbulESpjO0WqHbHYMjjGIvJEBRf5b
         IKmn5swS94sOJCyYrOs/LDpRiWXBcIdmnnjGS0SGT7RcQ6JTXmrLYImHsnMlD2Mr/51F
         +OF7jM1I22rChhWPjI/jL4QoWt9kkRiyTyFxqPZPGv0GEEMKhIr4KVvDr0CuEbW0oBh+
         baQasL6Yc2R47sMnjitnvIPPwLDDDK7h1s8+WGUmD9/vYe5iFqe+gWGXLju99AeEiSU3
         JXkgVTl9WHdWahWBLIAjp7IUfEYIFnwyPFbmZa2jnhDMk7Ae1JhvoKNU3r920RZDIB8x
         l2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731559; x=1779336359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ee8/YkfiIk33kVhGUGiqYN2ND7/cayQm7TapDEB4c+0=;
        b=YUJMKtEWYTlKX0o1yk+pYDvIUAcE6kNGltCBZ+NmtB4WZOekn8hndSMC8g+6MbLWBT
         VXq7IcH/A9zaKNYor6vO4HnahWLZZhVKLUm1BCvuAWO25/0hvGZSGVc6nHRBRKOICe3O
         CusGZdwq+R2q4rROO3Yz0VNHngBDK3J9gmJy8dKGUpqEZ3TfGREMEMIljaIEmUG0sWGs
         RDeb4cq4DB06ni5avLRlBeQCx8Kr50ixy6Y/rpmzGyjS7vNWV8AQiyJFQPkAACX3pi+n
         cgkHKvb3M+dacvkaiHcj/q7yX6MBVxZrWGHKSTgdg/fszU5gxIyLo0sLDl4NAW6ddpbQ
         6DOA==
X-Forwarded-Encrypted: i=1; AFNElJ93na0yXaCdwyaNBQFHomeCV3tbOefJHP7xSfOZGu7GyW0cKZLgK82TwyRC/Bkbn/lrpDMu0NRkbPcACrUE@vger.kernel.org
X-Gm-Message-State: AOJu0YxinhrsgofdSlmLnaQeJue6KFM3yRvv4bBVPz89OR5R2Ck2rBxs
	SKvCNCa5PQMkWW6CSSLUYUutjkq1nza10lXTkx4MeOSN7NGa5LwtI+7tfo6qpY2ef84kL8oWdUO
	ge+ezmXziIxCMXqJodAulCf/vLW+OY3nc/3sqdLvBmWW26BREiBbZ9HAq3vTgHtImS2m/E+v+Gy
	ze
X-Gm-Gg: Acq92OH0ElsZuyGJYODnaJHLaJ4R8y/rQC1lB5pfXem+Ler0Psh5p0MfanWxXPBsD65
	F4dUOVM4psXDrgpN3TLSlSxEkp8zQTfo+MJMVq+7QynxPRdw3c/9ciXa2gszYqgSTVtelD1YfMV
	QU8ZXbhlssWnopil6NwE2mdAHpAKzRuzBVffmnBZUjN1QT7c3bXCPCoCmWR0noUADMItteXVup8
	KBAoSiST+JMuVCmrBwq80DXIoc4i64FvOPBixv5zZ6YXuLedRc4m678HT0G1Ay1GGgtCz9SBTu0
	xNdHmYEYb7+QBgvVD4g7H+7FrO3OQ2frR5+NntGRDtmKuM2PUf7CNe3Nv1MxV6tBUecEXFgUFw5
	0E78KFjOg18sFNx9qWdh3amOrUMb8zm3r+vzyEYFdAhxeP64/2Auh7D4e4tJc1Q7AmI8Y75KRhu
	yklKS0vsbXuznD0rIo8Z99NvzjzL9MA9vAgMHkBQY7MpckcFGQ/QY=
X-Received: by 2002:a17:903:2cf:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2bd276e986cmr71930655ad.37.1778731559036;
        Wed, 13 May 2026 21:05:59 -0700 (PDT)
X-Received: by 2002:a17:903:2cf:b0:2ba:e42a:231e with SMTP id d9443c01a7336-2bd276e986cmr71930385ad.37.1778731558567;
        Wed, 13 May 2026 21:05:58 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm8035145ad.40.2026.05.13.21.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:05:58 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:35:37 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: ipq5210: Enable interconnect
 capability to clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-icc-ipq5210-v1-3-b5070dfbe460@oss.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
In-Reply-To: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ZHqTmdjzelJCDv04JFxOG4wmNq5npacD
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a054a28 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UX2V2v9iUqdWKtIqh5MA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ZHqTmdjzelJCDv04JFxOG4wmNq5npacD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNyBTYWx0ZWRfX3I0Jw5VgWXxr
 cZHBq0X5HwjoAH/h7czHb/Fr5etDKVzX6ZM+70iRw/u8uLUm+RPv2HE2NlgM+pu7HCG42EyEqqG
 bkH6gBI8PT45Bu2TtSfAX8itY5a19YILLfBfwXgOpgK1hAd8nPfhJb9sAuaAQkhmI6JkfGVYWZb
 BkOTgtv4TPosRWGOSARb1CfD2quz2hobUabJi+G4+rxX1QhISt9QBkECfCG+KNFTMUKJHGdQW/i
 izyLK5HSfyI3GBtvoxT5XL8frG8iamL/SSa25BPnYS9+gvpihLC1Tgxx3AJOkpVNhOVBAiY+LfC
 UL4iWAn8ZqUIbcril4MtecuaJPRtwJiR69ETwScr2tX6i8RVaXtPqnCKhjjttb64kAg6EWIuaWN
 AUSt5ECc9m+P09ym5TC3XsteW54yevf+KMnLeLsGzV6miXNAcga7ORaTl+8ArAtV8nzQS+GXcoU
 H71/9Gp9pQtXJ5SQiTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140037
X-Rspamd-Queue-Id: 160D653D8B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107521-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.27.119.64:email,qualcomm.com:email,qualcomm.com:dkim,0.29.17.104:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add 'interconnect-cells' to the clock controller node. This will be
used for enabling NOC related clocks using icc-clk framework.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 3761eb03ab24..480196ccfcc5 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -152,6 +152,7 @@ gcc: clock-controller@1800000 {
 				 <0>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
+			#interconnect-cells = <1>;
 		};
 
 		tcsr_mutex: hwlock@1905000 {

-- 
2.34.1


