Return-Path: <linux-arm-msm+bounces-119257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AwlqGbiKV2pfWgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:27:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A575EA96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:27:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cbv7SUzf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bNoRrv1p;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119257-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119257-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85942303D704
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D8644C645;
	Wed, 15 Jul 2026 13:22:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565AE435AAB
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784121759; cv=none; b=ZQjhZE7/Rpq4HybsE56V6AdyQoE1wjqx7/uLkxENo4ERBRWpcLGuBbD9X5DgvoDrOB0+QjEDuLADFqgeWNZI8s/UGi9lHIi88REf5bKNhh3hk0/EalJuhs6GF/187E56C5NQUY8+Q0StIPS4jCRFjM+GpEKSSIEWvyV4xMwwGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784121759; c=relaxed/simple;
	bh=+wdwCRdnJeHhF1zaeA93mid7aVTN7E5hSE1rkcZl2sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Okbprs6BaTgkTjdowEHGLiClDAqfXoS5i0ZD/elItmuAGNMfPEoFuJW7QmuHaMye5EuhPHvWZ5yC9BuHb3QJkBg3Zj6pEBaGkNv+fQS6Z4mUtFMpGwpE/3LBg2K40BTzEJpYya5ejTjekii9FZ/T4m5G5/nBLRvjOt+5PcnSLkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cbv7SUzf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNoRrv1p; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcdUq3450311
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=; b=cbv7SUzfKDzqB7SL
	SIcVNR5a5pVGtFvqRO4pg+YK2eArvCplpJNWKdn9Ls//Ftg+FS3ipZZda5d61GiI
	ewLov4PKLatf9FdEAHSMiqlxqeFV5DOkKYky39OMdPXa015TYCeWA1ivljwonOf/
	xGtnQDhZkyu6xC4q5CMK8V5wIeEnh/0mCT0fqEGqzOpkjI/KXkJ2D4rSlGKhJh5Z
	V0xikcSf26Xd35ZBIpAZIKJevTcvggn4Gh8FlNLj2/P+oRQUdrxPbiFsmDTQD8iJ
	fCW5himF/CWXqENJ6+TH88v0/ciNcgfczeggNNd0WeeU3TJsLXBTj+r0xLqB6rXj
	5/GHNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka8wt6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:22:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ea24a2db9so856549685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784121756; x=1784726556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=;
        b=bNoRrv1pI0FUAfPYbRgF8eGblhOEhmQzKROeK918vWHuk6OV35+C+8U8xQKvU7E33l
         kzIlXfgVr5nZjD0Y34hVwUunPmwZSicIme+QwwR9+UqFhq8gtt2VDHB6bjwIhiYzfox8
         00BPW1j8GGRhWEWt+S+nwza9aRjlDviE1WZcN25fWXUSF4qAXmT6l7Wiph/MwLH3eav3
         pUD7Xfk1RGSoY/rVnTtK6zrrXC+VR/sIe8IdrzoBOjyP40A9KjWe1eM5GUhjoC3r+NjU
         XVGs+nGpR/NhvufokN6BURHqhHZNFHz4g7b6ZCVlhBWzOyykLsgmxqsfW9AzsaFGcgMJ
         8O6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784121756; x=1784726556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+tyD/JK7/asjyuR7NrXrWq4PFgDdRaV7mFipJbTmEL0=;
        b=NjHne9o2xyogxzC3fruhgQ9VzfJtVBe5j6EQ3rqQ2Lt9Urujexu9f6i1iv5G0sUXlS
         HCqEI0sziYhnIyyaXuCDp9GEaZPlKG40+57Aza0omR7r68olWoz1/DaS+elR3Kg8U5+Q
         dBY+I2R4JN4OzPiZUs7+jpawcJRjk3VTdzfnNVmZ9cDTIHC5fhGXkh4BCaMBGpvi6WQi
         NBNS3DQ5HOklFdKk8kYPtxkHYfR+zNY7651g9AigB4EmpyfMhhjQeAAuhskOWfgpq4gb
         njky6AGKvT6qLF+hP7Yi+2UAbJO4Ch+le1KNagO3rH44RhXaUInAxxCuxdtaO8/KWH4+
         k3Cg==
X-Gm-Message-State: AOJu0YwFmss1l3T69Osok12WczkRitqO5k5uP/dUXvxOejGubms6G3L6
	7TQymZcxsdFSzqE8xqthVswUzFEycO0K3phfhCtzHe3bVKqRPM1DEkgcIxS5GbChKDG26IOAX/3
	HtkOKgBQfDBoYkMkknRr3e+ToakXtLr0r5G9yJHtw8dggv6YCVawS3Ym9C6CLi+ZE85cr
X-Gm-Gg: AfdE7clDsxihzzoH5EOxQ0qYGhj8fOsoH9pQSZZTL0zqBOkM995HXuANaWmv3D4ASn1
	XsYV8OaFWUr0CdweTFRsLbJiSEleTPXGMtNTQuFKi8TYNKXvcEeSsSU3wC0pFQJTsSPqkPXB+tx
	jnwXWlYEGEole7uQSKynv33ph6MwHhsd5Okrnj8x+bucFq3auunbiXkUjeMFaHPz3gl5KzD5bjc
	Z4Av+a+kno2Jga9Tt+yWJnlPVtu9+FQxvvgelmDl7g9/qhsVqFdLVxMynZr/X//Yh3WAmJYmgn6
	KOZS1a2cgzf02bdEPXx7FXWAnfw8vhZHhtcrZoO8S9/jJVIZCdCoh/L20ZGGq+L+PG8CZoeOmZW
	vO6/kaJ6uY3Z5k+bVAQrtiEJ3n5MJiFt3cYVIFs4=
X-Received: by 2002:a05:620a:6407:b0:92e:c117:5eec with SMTP id af79cd13be357-93086c626ebmr565210885a.88.1784121756438;
        Wed, 15 Jul 2026 06:22:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6407:b0:92e:c117:5eec with SMTP id af79cd13be357-93086c626ebmr565206085a.88.1784121756029;
        Wed, 15 Jul 2026 06:22:36 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d6a77csm1773676985a.45.2026.07.15.06.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:22:35 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:52:00 +0530
Subject: [PATCH v3 1/3] dt-bindings: interrupt-controller: qcom,pdc:
 Document Purwa PDC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-purwa-pdc-v3-1-be08934dc916@oss.qualcomm.com>
References: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
In-Reply-To: <20260715-purwa-pdc-v3-0-be08934dc916@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784121746; l=1238;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=+wdwCRdnJeHhF1zaeA93mid7aVTN7E5hSE1rkcZl2sU=;
 b=x/mwG7AXDCs2T9OKZm1uAH03OxRf85+GDE9MZ4bFyDmTXKw00Y9bn7FyVnUoZoqthvXhxb5h8
 d7Yw/Jot6HLB8IpwiuRgFi/2QtDVflFWH2n43J4bhTa1nCh32Cynwgk
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a57899d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vCmKDeXsP24Y5dEMWNIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JkaXJ6XDsnfdzrDMK9mubaZafXAJ0ICr
X-Proofpoint-ORIG-GUID: JkaXJ6XDsnfdzrDMK9mubaZafXAJ0ICr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX8vTtEiyGpcyd
 +L6OlhWTmkh9X9rpqLl8V+9Kx3RZ4EGmYTvfwbQov6lZz9AkYRh6w0J0cbanSIq3Eg82tPmIAoC
 AC89m0dJOFt2V49U58Anz/yyJo2AfK4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzMiBTYWx0ZWRfX/tieePAH3kRe
 OwVzKUSa55i70EGZheuqXHblRTAzX4wLPyaLOgq2AH/ew7wzMD7zSzv+2g+X8jHzNCUBYW2+SFm
 YoyGC5oIsBhIKSHUybCR6JvnVKvXF3h0d6FdfMlB79t+SxraY+G3fy+Qt9XjesOGf9fS/Wwc+I8
 lJDUCgTMc4EcJj3GXVhaMRlNGLcAWjAoaFYg1qcdph4QqNloqbZLxZi3+3x9kP3aHJI1WuTaZD6
 hquoOIIqGHGKHKd+xHqcctzjoOOJwIp1OjEtjO0+1siftjLPFeEIfP2KNhoLv6mM/7pFUZ3TCyq
 PWOcVDmBMTR85T5jliepPTXjCIA17Ra/AbUy3TX7fOtL2Jx9qe2kY78cK7M05TvJq/X0DuvSvMw
 OZ0TWA8xUlpqGS++gTD1lgetqx1tXSichCz2r5XX3tLNPVd7pG6rJbwEenAM5UZbd+SjtWCnbk+
 5uBMHBkY9+R3eVHC/QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150132
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119257-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE0A575EA96
X-Rspamd-Action: no action

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Add PDC compatible
for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d49a6..b3d19c86a240 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -58,6 +58,7 @@ properties:
           - qcom,sm8650-pdc
           - qcom,sm8750-pdc
           - qcom,x1e80100-pdc
+          - qcom,x1p42100-pdc
       - const: qcom,pdc
 
   reg:

-- 
2.43.0


