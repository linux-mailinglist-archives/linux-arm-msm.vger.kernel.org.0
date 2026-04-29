Return-Path: <linux-arm-msm+bounces-105211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCVkCJUI8mkimwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:33:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2824494E5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99C6830FFF09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0283FD129;
	Wed, 29 Apr 2026 13:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P5sjB3Gg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i+sq6HKE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBA93FCB2B
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777469203; cv=none; b=MVmmDIkToX711QfCF+Kng8CN0zrsTBEUDNA2gPQFFXT0hUz1bQXELWlLGJznhgAQ/wPLeUVPqK4i8F9YQs1a9iklA2dBy5E/7aDpkOR+rHQQxQymPx4fNd5kkFSqPY00HjFs47D0JKtfzpA8Ne/s0uVUUh3nclGy/S5R8hp2/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777469203; c=relaxed/simple;
	bh=Sa/LpuWZdla8uglyVNHfNA3S0et/3/tBB8VHSEA9BRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+iDwCBomCYyb+oWx5SGfg3+K4vSAECjvYSBJYhBygcL+NPM/J+3vDSnoAlN084TKd9dpVLKSxwDPnw75l/E7w/yaiNKfr7Yp0KQogd7OwwvkkDjetX7eaCUyToBqC4K16xrJU2/6DzVr5NRLLYBBEugJHTuXBYj41ELLx58VV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P5sjB3Gg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i+sq6HKE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q2bf1729297
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9uymofP5RshgT06+JOAscaukPzovafnkKbaYnIS8VNk=; b=P5sjB3Gg5U5bMNGM
	bV+M1vq2JWrF04a4jM1e0brpKR/+GzgW56XlpSDcVaairag09wBGmUqUcIXVkWmt
	VuJnJ0/ytCfbx7zi2KeCvE8LaVF2bLTYQSdjALA4K5IbjhNpmRikHjL/LwKIxHbZ
	ZfTaZ5DByd26Iq3x2SJ2vkrwKYLWOrcwn61DxO0kMm83kMrBErEeQMy7yPUaV7dJ
	M2UcVNGryc0Vb6p5UGB3fzGrt1DTPGADLjoFBzw9d2S8sCwC98NxqFRg6dyxiufL
	x4moi0+VT4Uw5wRsxajsJlt84AKMGbrTU4+WhLnofbLRJaE15isqd4aIgXdw1kPO
	tf7/PA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5ks6da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 13:26:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so13180709a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 06:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777469199; x=1778073999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9uymofP5RshgT06+JOAscaukPzovafnkKbaYnIS8VNk=;
        b=i+sq6HKEgOkh4E/p1YOVGF4pfDtKjYU0i9SeOKiMQRfxdXYhjyx+pfWRBe5U7+WO38
         5cTTWCwUXjrxxj2iYsJZIqOAzqYgJe/2Amrg/zm6PjousVrgqSl8DIYrTPgksXYalX/n
         Ekv6TRSJrdPKNnBtxegxQGyVhqha/IAeCRqq4cAr6ZM5GEJz6H82eWyIjfIlUMHW6kpN
         5lKd1mwcZMt/ZpXI9A98TBW6NmkkerWtE8IbyIS8nVq37nSGOsa+NZmlj73AqJdyiuR1
         fG7+jW7qqL0I+sL28YR/xypxD7SsyITZMw8jF7kFxAtmfTizPTFMjN5IgXIh3KCmgbAm
         fppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777469199; x=1778073999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9uymofP5RshgT06+JOAscaukPzovafnkKbaYnIS8VNk=;
        b=dbdO0ZSAxqinmo9M7EKHzxACrfwvemUaZdI0xZeODVooBJr/n4ES8K9JJ+N0mY8Xjv
         4a3qimO9Q5Z9+Zm/6X0hcWlL2WWmF+nxC6ioZZSsBZ1r7AiSyFPYOq/wY1mYjdNPBxRO
         vITTKjcj+5P5VGsdb7Uq8sgdQecSJHcaLLv4QwegXVrndkCZMBmR9O8jR+sbQqgK6+hp
         KVWpojeH/6QZH8CCMReWi9Cim1roo7kYeF09TgX+nMf06xeAzJBUe5XiYbBEC2H/2Ops
         s/hveYlxFCeFB5KIo4LFWEFMFX0JgVqu8tPSyrqI8jghLlfcM86/Aj2COrQvgMAcoLax
         yvKg==
X-Gm-Message-State: AOJu0YwVfh9PU22UZRH5wr82k9TNbaoa5zYscQTEvSaFA77ipYa6Shux
	gXfjtcL5YqnLVgPVfneyTnn0DN3S0HAOUBn3htlNRNjkE+4QEexy5CByhDEQrmYq2Ep/7DVyYkm
	iilGB3N1fQjFXg/ZDQWjyhVq5q3riIt8Fwq7STwyFxI29mBnZx1fqbPr2AiyOmbn/YoQ=
X-Gm-Gg: AeBDievxLg3tdZb7xyRz+GngVxqxJXwVIbq7GoqdgpPRvS4OSNVmHTrf2hA2AqFsorf
	MaRuJGlN6LzBCbjNASG723i8ilTimM6ajgfjOpSxYL9Rjo8/1N7NfbJsZT4GgIO9ANMxbiRIxpl
	6oxmW+m6eKQXThN60s12BtVD6xZz1Q6PgifAuze+uDGSAJDW7TQ71cKJksTlyIog64nvnkO9pkv
	WZ57twPlf/aGhN/GwAxfq8hbq1doTnxWdnEJ3A9c/NqG5ECBoaKrsmpt+vXaI8z0QC1GQPOIAZ2
	0QHpZpFwK2Xm1AqZk0O4lVQoC1k7FF0snUokCWeUxMzfYi6vmIqwk8td0upQ738GozGfLANxa3B
	Tv1SA/U4Z6WrHM3/0gt1Dt8+i5a22tFSXEQS5pdx1TkUClckfqPfU9t4RUH4kWw==
X-Received: by 2002:a17:90b:4fd1:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36491fbefbdmr8120894a91.10.1777469198912;
        Wed, 29 Apr 2026 06:26:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd1:b0:35e:30bc:96ed with SMTP id 98e67ed59e1d1-36491fbefbdmr8120855a91.10.1777469198408;
        Wed, 29 Apr 2026 06:26:38 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a02c5347sm3066513a91.9.2026.04.29.06.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:26:38 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 18:56:18 +0530
Subject: [PATCH 1/2] dt-bindings: regulator: qcom,smd-rpm-regulator:
 Document PM8150 IC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-add_pm8150_regulators-v1-1-9879c0967cf0@oss.qualcomm.com>
References: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
In-Reply-To: <20260429-add_pm8150_regulators-v1-0-9879c0967cf0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kamal.wadhwa@oss.qualcomm.com,
        jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777469189; l=1450;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=Sa/LpuWZdla8uglyVNHfNA3S0et/3/tBB8VHSEA9BRk=;
 b=PHI+khM9SHiGzKFKVDRsYAm6y2z2ZP5pgMUK6cr0lprh/16ij4HFCVCDndoJesyg4E4+ffjcY
 lg1jkph1vd4C/JTGf0aR2zWaUGH3AXb6yJyZtoxe7+6cz1BR3quaRG4
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDEzNiBTYWx0ZWRfX6xBDkef4cUPA
 zh48Ee6UEFaWS6Ak9Yy7drlsSWQVw80U78YvlhxN4fnDgrgsOgoeN7cC8RCV4xJPIrZK35Y7uB5
 QmM28W5BCsaVPV2YrkXuhhqiXJZ9k24icNDSPG04wYdpbUWXT5GIqA+IRnTQ3RDn3foOdRxG8Ai
 k4473e0+gAzWiKlg29pvz7Z+kdp/FzPO0cBiRJo9Gpoq4G6JToUIejTn0A36D+B93hMCErUPBxR
 BYKaQ2SxcI9G2Tx2iFcLrZ/F5bd55ycdjDSvL+6RynWselNA1X8DBIlmOgLZ1VbawkSqJS3Onb9
 SM33aaGtCHmJ7V88U56gf35FIyuOuXJqOSSy+lgSgt2R1Jfeu7aZ7jYQnTgg8mmoT4EK9y71g7y
 WmoYr4J+BBRBgxLSPNkO+8d9DhTLQqGWeB0fPHMqJhiuoFCW1VHxmRviwMebtqkWk6+T4m1uBmx
 NGdeMJopI9qvjnHDDIA==
X-Proofpoint-GUID: BGsrZ0SREOqDieiAJt24PE9jlu67D0kX
X-Proofpoint-ORIG-GUID: BGsrZ0SREOqDieiAJt24PE9jlu67D0kX
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f20710 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-lJ2cGRBeQHhQxfFtgkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290136
X-Rspamd-Queue-Id: A2824494E5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105211-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rakesh.kota@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the pm8150 compatible string and available regulators in
the QCOM SMD RPM regulator documentation.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
index b7241ce975b961f2b5b0f8a42828f265ca50928d..0fa0db7eef23cf0f19920445b88409f5593220bf 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.yaml
@@ -35,6 +35,9 @@ description:
 
   For pm660l s1, s2, s3, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10, bob
 
+  For pm8150, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, l1, l2, l3, l4, l5, l6,
+  l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18
+
   For pm8226, s1, s2, s3, s4, s5, l1, l2, l3, l4, l5, l6, l7, l8, l9, l10,
   l11, l12, l13, l14, l15, l16, l17, l18, l19, l20, l21, l22, l23, l24, l25,
   l26, l27, l28, lvs1
@@ -91,6 +94,7 @@ properties:
       - qcom,rpm-pm6125-regulators
       - qcom,rpm-pm660-regulators
       - qcom,rpm-pm660l-regulators
+      - qcom,rpm-pm8150-regulators
       - qcom,rpm-pm8226-regulators
       - qcom,rpm-pm8841-regulators
       - qcom,rpm-pm8909-regulators

-- 
2.34.1


