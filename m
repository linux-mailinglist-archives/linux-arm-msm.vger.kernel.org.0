Return-Path: <linux-arm-msm+bounces-112612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eUbhJrFGKmpRlgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:25:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C7F66E85F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 07:25:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LCNBQAjE;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="cw/UJUWH";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112612-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112612-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C08332D2B7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 05:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59443395AC7;
	Thu, 11 Jun 2026 05:01:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CCB33D4F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154084; cv=none; b=HKfz2IxXCff3/s6pNzDbX3z1FOITXW/N6d4wPiKzBAP5ElF/TR/vCVuthWeeXZYsMMbJtZx/wqNtMiM3Ptk5oj2IyeBppO5BaEHBre2h1eNyuwztAzl4GOv8XhAwsgT0PAipfzhHg8sEPKt3NLdJfEf76/yq9iX50CXIA0/a0xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154084; c=relaxed/simple;
	bh=CRhjsZHkD7Sl441bFPGjztZUbbEF7q5Uy9WgqxTnHGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KN0ZgFy5n8eJ76QX+GzFwsjghW85LZzEuAbluYNrErQNTS6v+HeKO36XtLigB3NBJdGf1TTMC29BFP+Srk6YYAXV/iEgDD4DyR6zZpe0ErfLl9zArDE3om5sa9RRQKbqHHjZxVAB7HZe6JbQXlQiLBe9JVKqY+lcxPuXJpj5+4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCNBQAjE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cw/UJUWH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0Nhii3183781
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQrbnqb3JAm20jBiC9iPeFLBZRp3ucGiH/GJ4sUF6wE=; b=LCNBQAjEvlRnnjWD
	y9xsVWkdCTRs1AHN0WzK/kd7rSL8Sfw/6RBbLUiGdQjMlkieEkZu3kmzRIlNlwg2
	mco3OACnHkDIwZbUmQ97bn0WC8l9GIIB14mOMbKlmqdDm1A8F3Cw+z6ZXjLNoEHd
	dkU9SzsS3f9YRt08rRqSy8NqnctmEZi2NXU3K5Vjop6H2CuF0d6YnSJ9YRMAlooY
	FX2ggmQ7mU1YJGqtkq9McMpU5vKFEQcP8iOTxgjpXW1ZVUJrhJmGw1OBlJb5qw7r
	fn9fy0K7nRZHTNMPI59PmEqfMP6DILZ1Uu2hGgP7c9X5Ad+3RO53BeXKmKhNxCdk
	6pgx0w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1ns8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:01:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf2bc4371bso4343145ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 22:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781154073; x=1781758873; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQrbnqb3JAm20jBiC9iPeFLBZRp3ucGiH/GJ4sUF6wE=;
        b=cw/UJUWHyF3HGpWA6r8ocKfc+Ql354KwGC1rSMuFkEij1qjo89eYMrr4IWqfpq07Vt
         Eee5bXkd4xTE2fSqc5DvpAnH5BXWRVNt6AYnrsV9jyvthuy7rRoqRkiHIXK0K947JiEm
         xXs/feQmPKEFZDFbnfS9R9n43U7SzQd04kEd8Ncu3NVv4sVKHWGciaUUVjDuRnoJev7I
         a3GbynlK4YE1TSt5xv8KrZxIIbVGFsBW/KeyuU5Px6wvkX4m8Fakp0/7bIaspXDRrWNm
         4j2YAYNVhAut4K5RtN1/J2ZJwOHJc5GbyT+FnpdFK7p4lTRamtLNJeylFBno8tgP0iCS
         3AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154073; x=1781758873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xQrbnqb3JAm20jBiC9iPeFLBZRp3ucGiH/GJ4sUF6wE=;
        b=BH1Wc1qNv/GB7VSJ8cPggGEaNG6ugzn/d5eLGbLMXFNcrRd2ctLnbdmxGyjX5kjATA
         rEuk6cvqMQkdg7g1P2KybFOADJzOG7uw3NnqyKcRByWx5zakGmFG5bzyyRlk+MjoH5r4
         X+zjG9NVnbX4+D8erbK5zn9AOjbYEjD9Qcn1g15g9Cmcdxs2m9dtYGGzMZP0zBcoq2fe
         EhE3tH5p0qswKY9yJz+QVcfKcDhAv7NL0zNRpRO58sRr4jBU3qwkaZoHf5nXPa+JnZGS
         FLBPjNRcD81mKiaGiBAymxnflsMAeypDo3c+EnwhjJBVnSsN90gXjUB6Kdw63QJ1HnjO
         912A==
X-Gm-Message-State: AOJu0YzPwwQnX7LidUBZcXSJsb7dGZkYsVZ8Dja4jwe7cb9kw5MDumkC
	1GT4na8sUnPZ3CoGRLlAzZNvl9878B6OYrTBbGLNgUo9DaJtaXkRurDnHLq+uVloIBD0KHefp3d
	09qMmIFgadNIUjmxAoIOrnIaeItabYsykJIZ4u7x0Z5GHxKU5P43CPHrTKlGmDYueRVR5dkErYt
	lD
X-Gm-Gg: Acq92OFahe/zozSQ1/HiLAI8IP44w9OK7IPAOud/XShIwUy+P9oShFXl92yQlo2Z5uT
	xH7YS+cHvIWSQiVwT+XQuvFuF8yRgY5+5TRPVP3p3wV5sqnsK73xf8S/u6AjlY9Q46D/B1UKMTf
	zTVAmVeKDD+C4HxZuHmtG7XetmOfIHFtmlpznt56hYTjL8FNpCVKYsJqW6OzLctwR6NHRukKfGh
	DQ5HrdhIomGA5WWP9f5IwoBVwV+9FVX48iJCS2sDq8PkXNN9GtgbSuj3iwLeQDNSrX6PgiXP/wW
	Cb+B0caRqCjhQ6HJREVqUSZaM5CLfGewRo6AGoMCs0tLZnO4Xy/cGmDD2Crk7nLvA7/mRi9L9Hm
	OJiNYdVGL37zJ4Hq5OY/WjKgdLfoWldWyn6zTDzPYpkSqx7cxq53MKWUOkCOhtdd3yok=
X-Received: by 2002:a17:903:3d07:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c2f57ae62cmr10413225ad.1.1781154072920;
        Wed, 10 Jun 2026 22:01:12 -0700 (PDT)
X-Received: by 2002:a17:903:3d07:b0:2c0:a858:8128 with SMTP id d9443c01a7336-2c2f57ae62cmr10412925ad.1.1781154072453;
        Wed, 10 Jun 2026 22:01:12 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm276188335ad.27.2026.06.10.22.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 22:01:12 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:29:11 +0530
Subject: [PATCH v2 35/37] arm64: dts: qcom: sm8650: Move PCIe phy and GPIOs
 to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260611-wake-v2-35-2744251b1181@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781153929; l=6180;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=CRhjsZHkD7Sl441bFPGjztZUbbEF7q5Uy9WgqxTnHGE=;
 b=AsZHzER8Ew0hYGscBoraPzd15cf9MuBuhuF3A0BL6Ws0y+3do/eDZR1XHkYy9AMxh0Fu3Quee
 1F4stMs4BpxBXICUfvTYf6kUVrxNHhifr14aZsgu1NW4/YC1/dO72Sk
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: 7WQUbpLravN5Sd_MD7ThNNDE4wYU3n1S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX21ZjXJ35DfXa
 BgtejI2N40bbTekOS4DlyFHstWbqOvp/XPv5sslkfNbWIB5c/GKrDipIJRLEPHlFw6Iraexe5nr
 mPSrItTknlTvZgeGNY18zBXo2s20XNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0NiBTYWx0ZWRfX+IP4gfgdNt29
 P1hfHck+vI2Kra++/8MryMU4BhFZMh7/60CtX/+E8Hd8uKXMfrrmHjvZC5Q/VUfxuyT930lgU3a
 /xDRcHkONb28qJSfFxcIJzxQ5z57tPceVNmqpV0e5TWAi2/ahUW3tAvx5QUs6wg7CMyboHtYn/B
 Kf+wHcC+UDLnhkTyoLvAzPG/E8ctWBM4yIFkPMxEYtgSfJepgGIt83tDEW6ZscYDIciDqJIlKdz
 RU7vD3qvNREGX5H5Yfmt7LuK0SmlNv7An8z6GtdI2Bv95mZIicBEGlEVqwhZlV9rMvRLHo4dq5L
 nXX4BHzYG6hoFVr0X6xaFbQlrGJLDan6UzuE2U18OUtSgr3+I1rPHXH0sRtEymwPdqe4ytmH4RX
 yCwcc3pmS48c01IHcpHjyr3b1Pc7/r+5DSUtDGUn35MMIzDKEH5ViBX7nfWw2FbQbINGPiHcdOP
 nxpw1rC7/zT24pvjVtQ==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a4119 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=PQP5rm17eCTiIiCJsb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 7WQUbpLravN5Sd_MD7ThNNDE4wYU3n1S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110046
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112612-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krishna.chaitanya.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9C7F66E85F

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and pcie1_port0, allowing board-level
overrides. Move perst-gpios/wake-gpios from the controller overrides
to the respective port nodes in the board files, renaming perst-gpios
to reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chaitanya.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 14 ++++++++------
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 16 ++++++++++------
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              |  6 +++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi                 | 10 ++++------
 5 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 2123312d88f6..74a286bf7696 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1074,9 +1074,6 @@ &mdss_dp0_out {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -1084,6 +1081,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -1108,15 +1108,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_port0 {
 	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
 	usb-controller@0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 775ce9f2dba0..02f8760212a9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -942,9 +942,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -952,6 +949,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -976,15 +976,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3e_0p9>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 8cc0d2cb3515..08107a559292 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -642,15 +642,17 @@ &mdss_dsi0_phy {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l1i_0p88>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
@@ -659,15 +661,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l3e_0p9>;
 	vdda-pll-supply = <&vreg_l3i_1p2>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index c302996a7857..a18c01a48e4f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -936,9 +936,6 @@ &mdss_dp0 {
 };
 
 &pcie0 {
-	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
-	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -946,6 +943,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..fc6fc4d7e39d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3644,9 +3644,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges = <0x01000000 0 0x00000000 0 0x60200000 0 0x100000>,
@@ -3716,6 +3713,8 @@ pcieport0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie0_phy>;
 			};
 		};
 
@@ -3837,9 +3836,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			num-lanes = <2>;
 			bus-range = <0 0xff>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			dma-coherent;
 
 			#address-cells = <3>;
@@ -3925,6 +3921,8 @@ pcie1_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				phys = <&pcie1_phy>;
 			};
 		};
 

-- 
2.34.1


