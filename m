Return-Path: <linux-arm-msm+bounces-102304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILmAAPAm1mnYBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:59:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6322D3BA2F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84D37301CCEB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988C136C0DC;
	Wed,  8 Apr 2026 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ov9dp7im";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kx9fa08C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE1C3AE70D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642334; cv=none; b=X4riGZLZ9i1A8IydMLBatvizM2l9WMuv7iSRYCWr4aP/GYhLw2VM3usCgHVIVCDvTBceQy5B3Mnn/vorVFUa4p2DJOeAPQJXhOEcC6hQEYKWDet5lKveDFi7JjNfcMR6TqLTjImCcFGqUUOoS6en+lqFIAqUWeHE8KJwOGRSI6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642334; c=relaxed/simple;
	bh=JiULUK1wE9JgBG3dpXtkC+G/A2g2mWmaRHx+Bmzu2Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNNlLJRnYnh3WZFsoQcQppcKwn5NEZMASb0YB2eUzPy0/lcsXaiwfrpxxOI8auQimDMzMgqhiiH/fc8PHOHRYF9fSMSFaznvr7m5MlafbPB+56eRbj4Tfwnv342v7Zds2/jVqViv5T2jfLS8wKLJmNXcJhTesF7u4ctf4TLi8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ov9dp7im; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kx9fa08C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387FwLT1619624
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:58:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bILIejA7nMaOjRX+QRMB0T9aXc7K+yJAuiPS9n30pRY=; b=Ov9dp7imMQfBrslR
	y1mRI4yt9cOoM62yTI7EqbE+At0l0gEFgU2wlN8VS7HImnGfjRROmApGqdSAZ5KA
	3A9p9DVi1sla5G+vGWjliv10h/vrGAP3nQU99gyhCkQ0FmfGfzZ9wNAfh46phObR
	G6vqC3qhFV0vfE5v7blJn0Or5t3knLdrYtJ7li0k/hCvNNYq+d+RXmHMqVZ9cxu0
	uUypvS4lBPV+AUs6/jmSszrFcz1WvIV8cplAV0jzTB2DF5uaAYo0N1qY0CspE669
	1cmlC8XRHdnEVyMNYcUfrNhT2T7jMSKdY+uGCBVfVTLOZyB9at24r0+JKuT+dYgB
	bnjxZQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrj71p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:58:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso6484500a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642325; x=1776247125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bILIejA7nMaOjRX+QRMB0T9aXc7K+yJAuiPS9n30pRY=;
        b=Kx9fa08CXjh7eiT7QQUjUEn/pg0b8xV9OHtZK0wZbBJnZvahzcF1s++V7R8PoJIQiQ
         8BsuUK4RRhRUU+4Uydqxdfa1zx2nuFa09I9FZr5nGiOSYivC652tn14HX6q0GIILXaoD
         duIYNrwY2KmSPwIcFaWxYydrTyGTU37bBNNfUxjUhNd7r73i9mwTIQhYW3Z6mwvI0UWN
         4LWWUfgUT/RofD+QXRXmU4eyYYBxkqw+1mB3qFdGpRgVIuG1tXgIE16eQbAiiXfzSYtF
         G51sBaCyymDadT5LGZgrpR12QKOzx2l+8ftUBUGK4rDtH1+Zu77zuLXFZrQrbuRcUDHt
         yc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642325; x=1776247125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bILIejA7nMaOjRX+QRMB0T9aXc7K+yJAuiPS9n30pRY=;
        b=CA26v950Nttqqa3wOAYKkg9zzftsxl1bdzVdfRPtHke7EXvFCVQI2hX6Dbe9wRg2GD
         87CRdQNdcgE0rGWbzHrViyRlQEuQB7hsCq6lSZwzpKv1HNw8OPMBLwKyfaFx6W5ZL+YN
         d7NTJDZFbckbNhxD0g49g7eV8R8tAuM4tbyNIq+7vR+R7VO6OIFnha9djijYVnoHus07
         lF5YHxwCwhICcxYCppvQY80GJrebV7wtLkKOEs4w4kc1WZGw6Aa8sgnw3p+/MZKUoZ2z
         Brb1N1J87RMiyv8o8ntDC5GZPzDHQ41c8bZg50K1oBbOpgW6gliXmaSQmHfJlG0fsBpW
         aQ7Q==
X-Gm-Message-State: AOJu0YzRXWJq8+6JGZb64gnFzSIPug0moMcziHrt7Wk55j6lteT7r+bq
	Cj9BAoFNOKGWmkenKAkh1CoHXALf8IYIfXUYRL3Kvyb5h2Qs35+dhmdN/MhnhxewzW4rBbqQbEG
	vjbX4TbMCbZ0QUx+98xo13LXKn3HLLQZkKAe+s993dZ+BAGv9ZtFY35AbK9OReUOgXWcg
X-Gm-Gg: AeBDiet1L2l/+9XwS6QKOhd2hFcjeaan2KbHX0thnzF7lAm33/tE8fhby4PWS+A9siw
	3C/mM+dvh9D1tHkme1gN+kkYRXEHO0d4EPL9HBSPOo2NayBU48iuTydBitzL8KvFXJ7bcqnS7ST
	3CJY+PDiO6/5eFv3jGo89oM14v1/Qgw/j3mcL/IFRoY/1wRPcvUEUR683UHT0jKck885rkI4aWR
	VXbXc6aJXeWbVcFB8vPYQoW2SlQoBiKR+Fa6eWJdkjZUOTq2GoOZDGnAawf55EkH52y9yro4RYD
	0NwUWR8McpPDfqbSYBFvs3jE13zyjjg/HW4Hcg4v9uENqsmC3HRmZCXMlMo0TVk8WGuDbhCq6kG
	8ITezdtgBGkvqoWRjIkMQvuu3tpkGzazfgdUMcEDQlxdF1xTz8wMisVyH3ECK8AO8ccTY3xGjlZ
	kTAW+LURayiNlb5P5078MzDMrgK9hQnxmzmwlWNS2cUHDpMghJ/O8zIUv6
X-Received: by 2002:a17:90b:53cb:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-35de697374dmr20258812a91.29.1775642325002;
        Wed, 08 Apr 2026 02:58:45 -0700 (PDT)
X-Received: by 2002:a17:90b:53cb:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-35de697374dmr20258781a91.29.1775642324545;
        Wed, 08 Apr 2026 02:58:44 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe62f5dbsm25445663a91.8.2026.04.08.02.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:58:44 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 08 Apr 2026 15:28:34 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: add SOC IDs for IPQ9650
 family
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-ipq9650_soc_ids-v1-1-e76faac33f77@oss.qualcomm.com>
References: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
In-Reply-To: <20260408-ipq9650_soc_ids-v1-0-e76faac33f77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775642317; l=841;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=JiULUK1wE9JgBG3dpXtkC+G/A2g2mWmaRHx+Bmzu2Ao=;
 b=LjjDRARffi+8GTmtluSjtghvAkW+4kSorwYUwznMbYYUEhBil5WbUR/CsKrGeSZHW6GbWDzYm
 fzlN3khu7kyAO7IshNF9z16sqS1ZNVnhBo0Ak4davg7D7226w9VUNFt
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: NXrJLhTNpm4B3c9E4oLqgIluHtTdbv_s
X-Proofpoint-GUID: NXrJLhTNpm4B3c9E4oLqgIluHtTdbv_s
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d626d6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CTjr2INeI02uuWMKJSAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MCBTYWx0ZWRfX+4lS5MLMTAf7
 xQHmeec6UpMZuna/Z3q0mJ9v5kSZ74i1OXBmDMWX5vUKOrY65+8SR1hnvfAl/TrYZrzZDqBqE1G
 bPK3ilc8ylaJ7ttu06SSVhwyPEC/g9EJm4f43y25lTsfd4n/An+A/LeqvkE4MvRIxneIrMc7PtB
 5JRqCfX9Zy5Oo+yBAT4KnmSkqcg1IpPDXyjMGuYTpBNDtUFZgGrWqxMtCwOGCoVHS8QSzkqdJlL
 Lty8x+8MydBbwz746JA4WtK82U/XQ8FNsmcVLyJtBh4NokvJvwyA1DLlXMC48MN0tqs9+I9PD1E
 IKRYKz1uY+uKTKT6V1awktjVhxOSjXCQKY/EQAK75iOb1YhaTaKhJLjHuufMhY/KvgNZGHR5HHD
 YVhEBVdc7POk46XUkBcyPuUugp7FyownvSWcrrR0YwuNHz8UgLXzeDddBRHydI3A7DhzUb/knJQ
 GabvbmR0/s9EpixLdVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080090
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102304-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6322D3BA2F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add SoC IDs for Qualcomm's IPQ9650 family.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 336f7bb7188a..585017b98ee5 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -304,6 +304,12 @@
 #define QCOM_ID_QCF2200			767
 #define QCOM_ID_QCF3200			768
 #define QCOM_ID_QCF3210			769
+#define QCOM_ID_IPQ9620			770
+#define QCOM_ID_IPQ9650			771
+#define QCOM_ID_IPQ9610			778
+#define QCOM_ID_IPQ9630			779
+#define QCOM_ID_IPQ9640			780
+#define QCOM_ID_IPQ9670			781
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.34.1


