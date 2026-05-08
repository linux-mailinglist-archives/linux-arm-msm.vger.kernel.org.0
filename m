Return-Path: <linux-arm-msm+bounces-106745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iK+6MLNW/mnKpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:33:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4374FBF52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DF6B303DD1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 21:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BE030DEB2;
	Fri,  8 May 2026 21:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jNAdAH0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ehEvbRPd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FC82F1FEA
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 21:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275989; cv=none; b=upcDR8P12+3qJVEOSLSODxGJv9NiPGqgHCddmt+PZQPxDLSTv2XP6S2SLgXvOp180dH6uOcNZggbGyZKay0Yb2hcwyR65HvjuFl/AdjPZoqS3gRDquK5wOqVi2Kf9JeLBcQWfxZujCxLPDlKXFCKzMT3ejH1sJ4esRrG5Lzp4K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275989; c=relaxed/simple;
	bh=r7Z52qBn7Oiq3+44QCWlmOdEnbJHHdtV1GjdHQai3oU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=htQnEKpOE8inJtsIi3akw8vn18kgyul9UZLTSXqp+qjKuasdZGWdZQjkvJnoykvZ2/iwfgju0o3k6rwUuWHXV/LBYUTOidwdCflGZbHQVH5xulI1oWAuxXX6qPXHM7sozRC9Bpi5bS4nPi8yc1XncUb2jUtLBRk4xVOROM3SHD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jNAdAH0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ehEvbRPd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648HU2E12515226
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 21:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ecNTbhYHuyh
	QbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=; b=jNAdAH0YKmnXVRc++ujA8I1EB3p
	SaaHA+r/Y0HkFFNG6dcFq3Opd+3AyegXgHzRdbJFTFb7ZztzO1dbrigMuxFzgRsO
	5PPRwGPXmWsDfRCciL4++sdaTpztMIL+3VAK0BuPftWFLdL3wXCo4m+JVN8nGnjT
	cP+nsnLyGeqVnVjlMIxr72vaOsBMil1cDZRSYzoH5/RlyxF9yGBZIYfz8XurX4bF
	mmIh15RZ3+7Vw9I6xDfvn/tY9v8QQshopZaP01or8L8JEJTwYmcKv3TqUoS3gLA8
	umjOYHALIIxAHA7C4cw3xWUeISzUJOIBwa9ueC8vt7c4IyJQZfa9UicilLg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1m9nrq7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 21:33:06 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso3469393eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 14:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778275986; x=1778880786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecNTbhYHuyhQbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=;
        b=ehEvbRPd8Xweku9+usz5UJUBQ49vptXwl0vdncOxoJpz+kSJLSIlqUkUidXJAmrITk
         h5+CEslagbdXk32ucRYGXhUUefEjKV/O2KfyaFjMWTqcPq9ULwrEjq6ZGN1pQhWffV2+
         hTqyIe74dxMzqPffkUSjX0ZA626Z+uQ0N7aDI6164RXpi7hnOCEzOyxRxeaUBNt0MkXV
         E25X3MGYplXYGFABSNDVDp8kVbb8bgL4D9PX+XXD3OQo8zF7lAwJtAAJo6BYrukOqfPy
         27Cdc1w1hPGet2ujoXTV1p4vg1cZ3YrpvRC3iYvx6tAzF/11mL6Apf6wNZ5u1+ZWmsq9
         Xlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275986; x=1778880786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecNTbhYHuyhQbhuoB+7vmARq36r7IGCdT0R1LSWjkRI=;
        b=NoU/BFO93C5k2K5P5DZfBp87Rth95tO+fjilcOdEodXMPRW//oI5faEY02V03/dQhP
         YhT/56l7yUsvxYGNaJyN6VUMaqLR/Ar8D7sbuXFRNUEwRjWjG+bhDdCq0JRCtJiEdQUz
         N4sv/jVx8R5YfCh5gWOqZaa5w2hIILlgHqxLbT1BppskpkO/MdR+dyhk9jPA5nVOTm5L
         aaQbfffQzVSjZafZDxhXarK6aS5j07GqCSJTofKfekwg66IPFeihLY0tnH1f9A/6shNw
         hKrVMrCMbJeEtsNHIo6Cnr4Li0ZDPYpQbIEQ/6QxxHDzNd4By7o1HIsZl3teO5ElxmYy
         34tw==
X-Forwarded-Encrypted: i=1; AFNElJ/DHH/Zd2rvJ1GhvrPaXMwy/SxOnzj53dy73yEBKoUXwPrBZlNUZVOcU26zEK9M3SPR8w1XjBgxaOASSu26@vger.kernel.org
X-Gm-Message-State: AOJu0YzKs+AgdHrqVncDV1T3ooea4D1yOZvoi3+l8u3O/2zMxF/WxBzf
	ixesYrk4tLP+3JqSea8wVaw4MC1y/WWKuHQIYh1drxFy5TJEZl0LjHMdLO0WHO9hbfwaB+pLsdb
	upW86pT5O3VXpo9IoHHWWHdn3UkFrMXhj6lBuJ8Lpmt/W+tIyUdvjhgff1Fx/v+q2cVTj
X-Gm-Gg: Acq92OHewsd9UXT98MJFFZrEmouq/PY31qzFTt15sk5ASTYqSf3z2PCNVVDAEbCABvQ
	2Zspf5DFtVb/0A2r1B1iLwYd/x6Pqc/Rouhxi3CYpJR3jKktSLIMUD0aY2GHg2eHYEQbVzF7x8e
	yd/sDREDSg/IvleVZCtQI8dIl2rLGUi1Xj9g1sxdoxcSh71og9hLQe0W79VNQuaS59JDy4CoB3E
	3FZnRrFZ2UWGrdnQUm6fgdDxw5w4uoBR+XJgjGtWxIAuNb3Y8EOiwNuBB9lWHbnl8C28VK9ECB1
	fUu8LATlHvgYe1I/1Z6SKf/g7BH9DOjghYKESm+ngG4QqhRVB8jSxjK2PJ59d1a+X4GRwCF5bIQ
	WmLW5hpt/NTHCzqltTtImftpwgBVyyNhao+NSBfpXtWMPMIkKI0R7c3KHz+NlJbho+AfuP3qOhh
	w=
X-Received: by 2002:a05:693c:394c:b0:2df:71f0:e5b3 with SMTP id 5a478bee46e88-2f54f9447a6mr6846195eec.20.1778275985280;
        Fri, 08 May 2026 14:33:05 -0700 (PDT)
X-Received: by 2002:a05:693c:394c:b0:2df:71f0:e5b3 with SMTP id 5a478bee46e88-2f54f9447a6mr6846176eec.20.1778275984797;
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
Received: from hu-rraheja-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm4871285eec.27.2026.05.08.14.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:33:04 -0700 (PDT)
From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org,
        neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com
Cc: wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        ronak.raheja@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Hawi
Date: Fri,  8 May 2026 14:32:32 -0700
Message-Id: <20260508213234.4643-3-ronak.raheja@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DaEnbPtW c=1 sm=1 tr=0 ts=69fe5692 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=vC2bFTPnYnLVIQvTftgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: aG7EuwrOOEeUpw_lKrvwyuQsx4aD9LpY
X-Proofpoint-ORIG-GUID: aG7EuwrOOEeUpw_lKrvwyuQsx4aD9LpY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIxMyBTYWx0ZWRfX1ZcjqOuCZoW3
 KaEMob4ZYvXPpFn7ZJeIxZDkM9SVcAuigVRoHY62NV7ClK3t0d/BsvMwv4X7aWe51Tu7oA/e6wo
 los5yX1k5TpjFh3DV+5UOU/HjbfmjcjAywg4iXgRUIRUM4NAcHGWIc/GmSKJRFc2g2gEcXr4Rlp
 KznAeoEbwM+QM8JNdGP2eyAgCbo7TBntfNk8hmy1I/Fr5FcfzkHsnJNHtiZ5+Eh3+aFck8XNnoc
 47iVqRjmFh4RPX3h6b/xrGKrk2291mM5kj8J1V6D9S6YkJque70cuYTA5rqOlzulKL5pjY6e2rk
 juI/bS7cg6/NMx5N+QAU1/Q333OkyQZio+HgMl6q75hIzl9rWvvkNcaIHcfD50G1Np43L0cddgz
 WmAbPkDUbWuRJSfuM2MIKjO4hBVmPvP6KLyDwVXTtNGHUv59r8OQDzY2NmKpPni0U6ci7wa7EPd
 qTNH3ascc/LbeUmxJmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080213
X-Rspamd-Queue-Id: 3C4374FBF52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[ronak.raheja@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106745-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the M31 eUSB2 PHY for Hawi which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the Hawi
with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index cd6b84213a7c..c0e7e2963ce6 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-m31-eusb2-phy
+              - qcom,hawi-m31-eusb2-phy
               - qcom,kaanapali-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
-- 
2.34.1


