Return-Path: <linux-arm-msm+bounces-108563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNyRJPGSDGp1jAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:42:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E71805828D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 18:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 754E031FAA91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 16:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9CB403E9F;
	Tue, 19 May 2026 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IK0RrLcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QNov8uTj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C143FF1B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207011; cv=none; b=DgCVYB6iPMrRMkLW6Ax3edk7R5shxu1yMk1ws2Ij1nTLXlpaEpRFLKRc9DbXIq8BmT6bTcyiCpxHYvr+78PtbtpiI5/Q6N6rHWsRZgX5jFQLjfyySQrgmJhr0Lo83n8iYLPFmCHBrU/32v+yfwpSKEJKy2aE4DMWVcqHrG7Ayco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207011; c=relaxed/simple;
	bh=w5jOT+jpBAAFKtHQB9L8If22TyDL2qU7uVBbZYqxO5o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MC1BlbACJ42qki4zjeiaH2G97b1/Y2WcMkUFUj2rUYGr5muXY7tfVB59tHirn2a7KjqkD0uqR7gageppY6GCyJiyYDrqbI/35Um9S9k5KVRGEDYtan6oaTvVj2FkTrV3YFG1WbUkT2HvtOahBOesS/VDmi9BasGrVhbI8S1rYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IK0RrLcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNov8uTj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx5Zh2868093
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYarrWiCXKr5YH97rLNG1lNlA0bj4nyCW+R0pj6UCOs=; b=IK0RrLczn8Cp6Jr9
	j4VRaDWMLFtwZAb2rqxlMzj4SEuAR8HgM93FpWYGbrmkSZJxussv01Qd6FUCJagL
	B+sfjEhkZ69r5g8LnkvpCgDfpPkMQFRSHK3JJwWT8kEL1fRsKV0Aez9P+k3a9D8Y
	EFyqop9FiGliBFGMUPbVFIz8W8cWJOoY30NtfPOmJXfVzELTnWhxHQGF4i6Sr2l5
	t4745nbPkz3os2FikXfHVsJLIfu2Xvjh5iDvh/MbQXnitWDxBuN5lctQKlK/pb1+
	9IrCOAdIHhbcWSaZtVuEMl0zCl3Lp9flhRbZXBye+FZKxfo6psrLE0oF+VkFIxhv
	MpTJtA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3w8b6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 16:10:09 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5753ef2562aso3070501e0c.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779207008; x=1779811808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYarrWiCXKr5YH97rLNG1lNlA0bj4nyCW+R0pj6UCOs=;
        b=QNov8uTjl2/UNQ/h9x/jIAXzgcLhOzPzjlFpS86PLdvyTVmGPeOS3vUf73V2L0h+b7
         wabeY7A26o1S5zENPJu1ZAdEck288OP6dzwPXGO+lBJkiGYyL4NvnUCk7Hoej2Ltt5JX
         0Bs2jR5ThM2nQD0H4meSJDZIedu7Vfz8EtlmWL6gDQ9C0InwkyTTGQS8PQasKWTXKzkT
         5/Zrr4tCRnd5D8NXlga85o0FAnBAWqrtuD9e2XeXaVUfewb5jPBY8l0ecHZG+tTYWPbU
         uXIsQY33A6Mqt7ODFphlEorkVUu4v19T3EcwP3d2lkY3PRVFuvPDQFz1P+tPlPdK7feV
         EhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779207008; x=1779811808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nYarrWiCXKr5YH97rLNG1lNlA0bj4nyCW+R0pj6UCOs=;
        b=bYmkjGAut/iHnmkj4ydgyOngfDfKQuaAxVvWc0fE/6ykEXWYWF68ByyW/vwcpDREuZ
         fQMvHiKBQFvSItGXkkgSwe43GbNpZWcyFfZF7vLTo11rccuHgvuif8vZG+dhQ+H8nSJt
         cNUagz6nNZUai+GXLY90iLvh5/cOVgS+5rfyf8eiRXKtTcPi0BJQRl1tcLvDHpFbyjVq
         lmkk6Y1kggT4CMp9gjYkc/qN0PT5FXFdtgB0wNO83V8TM+vhdgVfe9Q0xZ6C6ujU9GIT
         bZq9qSQtt1PV5LflTzMJcK7b4QjqD62sABEajQNVtUTyfHQzw/s5thLG+skr6puoUe7M
         iIYw==
X-Gm-Message-State: AOJu0Yxq6c0q8XX1piHOGck15/ZpHP5t+DjEFxipxdBxnOAHH8GoV8lq
	YRjGYo8hF8WHnNleY0iDGMKgaWTSst3ucAvNqgtfpZ4torwGudO7HpeXMvUVyREOIr6WlfcMw6P
	GwJRsHWqV2xMi4HusjyxOiYt3gr+QIwE2OdkjY1hXweHJMwRlF8sLZNjIkrqgXG5jLs8x
X-Gm-Gg: Acq92OHbvj3beB9xQ6PlHf0aeOHtUDlJqxhqjO4srp9hD99DjnMQvqepXU8n9TbcLDm
	3vij29tzFDVHL+oiYB9nrTJ73DxTwnhrrQtbV5zJMnZRE+M2ZoXug2Ik6aXKcrj5y4ARXGXKjx7
	YcwOo/5GGo8MEvuaMG/RuyGxC8e8frkKuVf1A3NRBCKrC90/Bq39re6dRWVjsgOvSEfg8q1u7Gk
	TBQcFj7bnxyEPoftZ+iq00byErajiVZqUdlHb+frIVQ7s6LepfWDj+Y6KD8cRycdpV5LLxIp52b
	OL41ySN/FFxbSJCyALmN41JvL4fEn99l26kflr+xlc9b0mDBuH0Ef63siqRR2vr7kQOlXStuWPp
	5pGxnh5+gYcn+dxovU198+jmSONa6
X-Received: by 2002:a05:6122:3a14:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-5760c01267fmr8525122e0c.9.1779207008159;
        Tue, 19 May 2026 09:10:08 -0700 (PDT)
X-Received: by 2002:a05:6122:3a14:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-5760c01267fmr8525030e0c.9.1779207007343;
        Tue, 19 May 2026 09:10:07 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab7c5sm357874915e9.12.2026.05.19.09.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:10:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 19 May 2026 19:09:52 +0300
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Eliza CQS SoM and
 its EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-eliza-dts-qcs-evk-v2-1-ad7303659d24@oss.qualcomm.com>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=w5jOT+jpBAAFKtHQB9L8If22TyDL2qU7uVBbZYqxO5o=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqDItYTQja3OFG7alXc2UDpi6CK0mcdJBnL9Dwk
 vcrLg3nRqmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagyLWAAKCRAbX0TJAJUV
 VjLlD/9C5zMQ4e953ol+GmabL4xDOA6kzbR4XMdfAWiB6ZyDjPzDa1q5gMac2upyYbrKKElIhZe
 hCb3FzqyzfcxWkunezwTSPtMN+woU/wYFzd67Q37MpAIampAIYYgxoE2V8qjF3I5RIHMoPgjhHs
 HEIjnyTBcr0TaKmNvLkYCj4onmKyWmjyIqap6Vpz8xh5YaxI4De3DnkYo6tlDgBvDhIUwaaHBNW
 pIAb4rlme7WlKfEbJ6qiqfpPACAG69R3TqQ6HAgLMrG6MJGvJe5PF72qcvMd2BSahF2W0EVvUrX
 +VS+6cgGUuxTIwlbXDuF4qoTOaHw2F7Zvb+eKp6YLrcP/ghgoZF1NWye08GzmXYZbopGiLBPK8o
 c9s8GHbmoOnHJTwHT71wEkaBqzkaCxnu9moDMjSn9rc7qSmXSx1IMW44iTLWqpr/dKntAV/V60g
 IbksKIXQhcZSHk15VJgg8KPjtydaboYJYjCG/TDAQq9YsAuhk697RaAk+TS22T7VvUJ/Q8FGGSr
 3TwQ6sSug+Y8qkGuowDYWTTgtwDVqa0nYgdjieTQCvoqHaOMyDqvnUkz4BDu8c0AUuj8ao9l1hm
 0VKbKHQINRHR9XFlJdpK6DVt0fKRinQQ5h/rcHwsgViFZGmn1N0enf5NRqIQ8UMftfawUvaLePN
 fJdWyhy8ef0NPUA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE2MCBTYWx0ZWRfX60nBisBZTopf
 nawjY0TnlD8TgVKghMzjDmJ1lFlTejEIEZN8+ntFlYcv4h4GFSzaH7Vaqwo2zJlsLDCM/L7B0vN
 tW11Uec76YAxilF1wG+2P1hFVI1nGmk1PNtszZaF/lKtvg7V3YOEdQnUxnVgaNm1KLbXk5bRpbu
 m1hZxEDO8bnu9L0bUUYcqgNsuqgCcJnxEhRYlufxO1OnNKpaUIUr7O911l9rNl64HHuyg0yQ7gC
 J8jDWkXiPk7dL3fSxqlSxWVjw4/z0ZNxWVpiJnQoXjec1ttqu4u5I3ughd7iPHcXkbNJTAebofq
 OG+xFSr0wjQ6qIYtoJEPm5YlG63X3YFWy+86Tn9xdnEprFlRU9jx7WnV/n8PaUhZ5Lo4O8JJnD1
 gFqk/oP+8IkXn8P5iuS3mXeVHCqbnz1Gf5M6tI0rlDoi7zgu3o5O7uYDgNZ9AlJmo2yE6fYsl/x
 VcWeq8vQv182n1zifwA==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0c8b61 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uFljGN4_2wiWoYfE8PwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: -X29VJf-f9ko6U5i6MRsIYSiHE0Lkd4J
X-Proofpoint-ORIG-GUID: -X29VJf-f9ko6U5i6MRsIYSiHE0Lkd4J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190160
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108563-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E71805828D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the compatible strings for the Qualcomm Eliza CQS
System-on-Module (SoM) and its EVK board.

The SoM is populated with a CQ7790S Eliza variant, PMICs, LPDDR and
eMMC. The SoM is then connected to the EVK base board, which provides
a multitude of connectors for peripherals.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..bf7df33c1da8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -61,6 +61,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
       - items:
           - enum:
               - qcom,eliza-mtp

-- 
2.54.0


