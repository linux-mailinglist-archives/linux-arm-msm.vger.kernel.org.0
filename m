Return-Path: <linux-arm-msm+bounces-98380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APVhK4t3ummTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:59:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1712B9918
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 733343159058
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E776A3BAD8D;
	Wed, 18 Mar 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXTYARut";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rr3IQwk9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08D3B8946
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827690; cv=none; b=R5b4MI3ozERTypz9F7Ai6aZdcC0aOp+F0+VnlygFnTlTdkPCFvU/fMGdsrN3jDSKWNpKcm2Fe57QUyuiu+l/wwm2FpPjvhIFgp7frC2QmNFKZk34QEv9ZBTfE/LXi8SjfqnKAJYJTz/ObWZPCYCDCJ2+CuopU3X7G0Vi5Tk8qX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827690; c=relaxed/simple;
	bh=5ZwfK5qPkxzf0gpr+xJeTTj/BL+hR3QWamHSvnR3AU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p+lFc42WqoqxKnQB+rPmAQ0SUByLd8iL+bxTdQ4xtFjWCXB+qjfQeQyXuc6hfZJ1fXP/Dr6QBMsP4aEeVKhjfQGm1PX5IKtehcMfyAN85v6AJk82hI5gk2MKCt78kVZtoylLwQM2gsjHo0MNu4aIKVM+KOyxCN83ybULUIEPRuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXTYARut; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rr3IQwk9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I8IE8O2789395
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8XfzVj29lHxO49M8WtATy3
	1Kwc7gqWKnVbOEPxpunMo=; b=hXTYARutZBjzjPf6EuKmAhr3OBwZT9YzMrSPrN
	gszTNRTHjRjWUKU+z+rhm+hx61fq9XcPbD0QMfNGeMZ5ATOv8OaKe/nZJtFSdrmL
	kWTSUwRzesahfSRt2UimyvS8FaqqzDieVuRUKsyx6S/ppoPEdkr3Z2+n45rrLTS6
	N4CdnFr/wgjBknm46eHfYgSI7x+z5kqOaoog6juPLDzgTYLf4NSeSfwtiNZLBgE0
	goj+iwNumglIm3/WJ4gq6QlodcI4mPZsse6UG+D3r/deW7f6je9WmPjfzqeGbTvi
	icWnLUNn0/JS13DhsH4NFertfPiKZgDFFf2keT/Xu811XeuQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g2062-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 09:54:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917afa521so48497261cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773827680; x=1774432480; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XfzVj29lHxO49M8WtATy31Kwc7gqWKnVbOEPxpunMo=;
        b=Rr3IQwk9eW7YP954SYx80kdDSYQE/8th5BXLowijr/kQEKDFzUniPydgGtFx7HT3Ph
         6Pxd/bAjiVt1LbYLY1EW7auBvPr0i9+ceEDWzsbrbOhX6O1v71/HIq6evrzkZSqfmx3s
         SNRQCs9LP+yJ56yT9qS8kOXs6nJsy3otxlCmu5iLDMP/N8aLCKTh7/FKJ4Cs+KoXhooW
         aGgMpmLM2Fa6zOD7yvTehywYZTe8GVDzZdF1LdqZL9bWcGgs2PElMh14hF2Kv68I/QKy
         JtCIwaS9eltvK15eTmwQt5CsZGO7nPdlMjXKYapM/wdmGdJBMI+SnR5oUT/IIBCjPbvY
         8HLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827680; x=1774432480;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XfzVj29lHxO49M8WtATy31Kwc7gqWKnVbOEPxpunMo=;
        b=gNcXHMzJsT2msXPLwyO5ei12k9/WKczEQV1dsvQUuiNvf2lzLNPTH84bVBA3GdtqMt
         Ri8N9wny8aK86bbA6f6B0OBbuGkAGzIuIwLX2NUlIJGd+n8hDZyybH3ssM30v9FTG+Eo
         HyXqb+wU4+6nlfaxL1OoRUZzIRclamxglAOlC79tqFdkKrhje+D9cKcq5KiwLoZK9ct6
         OUBXlIDRJ9xneFTqFGmuh1lzfmLka5u3VKGjExWjnSSyLngA+4ahsAZae6dJ8HPyw/6+
         s3AH70O5k2pCUtTZjWvP/hI2vZi6HSmPqv7ZgY7w2fUFteAOvd4V6kdq832TAPJx57rf
         yHHA==
X-Gm-Message-State: AOJu0YxHtZuWQJthUD3DA/j3h/N66vAsS1s5IUoAS6ycn9DE8MI26r6I
	HFDAPknJM4Z/Mxt7JNcxti8Dy8/zJOAH3BOBxmizzXdNZVL9pShD5QWBviftKdm0rD2m/uGCyET
	2CBrH/mmSlCAFRdUeFR012Qf5h6tLnig+oQAeyk0Vi318w6EJHXrDCFWGEC0tacbHLHqxcrOKAs
	RY
X-Gm-Gg: ATEYQzw/RbV1HxYBE1o8AfzODOFudxqYAhPjhR5URZK9TLRXPoczzekhAprf0mthcn+
	gJ6DhqruqtpdJhFyXJjCZS0bfpVsd1yjYtnfELsCb3Wwo++Y2MHixd5yq+OyFe25NqVb3FIivcd
	s6oEH2JAXKhJs0gx8oZrSeKXwt5Vc6ZqE8k2qqoU9wvYwojMffGlgDEkLb1N35OoVTS+wpJVDjd
	pfRqFq98271Ghp3ECE8pGuKrpULVTKs9dQVb4WZzjdySzOUiY3FC8zY318beacexHmOOMKw8Pxy
	TEoNeWnFrTVhVkf+3CE0XxegwubXTIsvNYBfsdV8kP0MMVDgSkLyp2/2MgFm/pcCP2CfLV2L2NM
	V8M4t5NQACYNUaDgvM9Utiy4YNuk=
X-Received: by 2002:a05:622a:d3:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-5099811a15amr88913891cf.33.1773827680313;
        Wed, 18 Mar 2026 02:54:40 -0700 (PDT)
X-Received: by 2002:a05:622a:d3:b0:4f7:a06d:c4df with SMTP id d75a77b69052e-5099811a15amr88913641cf.33.1773827679807;
        Wed, 18 Mar 2026 02:54:39 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f42149f8sm57009035e9.5.2026.03.18.02.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 02:54:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:54:36 +0200
Subject: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Eliza
 QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-eliza-bindings-qmp-phy-v1-1-96a0d529ad2d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFt2umkC/yXMQQ6CMBBA0auQWTtJS8EQr2JcMGWAMVprB4xKu
 DtFl2/x/wLKSVjhVCyQ+CUqj5BhDwX4sQ0Do3TZUJryaJxtkG/ybZEkdBIGxec9Yhw/6GtHXJE
 h6yzkOCbu5f0bny9/60xX9tN+g3XdAPn2KnR6AAAA
X-Change-ID: 20260318-eliza-bindings-qmp-phy-c53be4b0b131
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5ZwfK5qPkxzf0gpr+xJeTTj/BL+hR3QWamHSvnR3AU8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpunZdAOtujtpTrHBUHLjuzJpocVnAwKoZd1kHq
 07PW11nOMyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabp2XQAKCRAbX0TJAJUV
 VkCcEADN8nVxS8KzgKSfqFNYYy7HEaTKSHhznGLtYfgmWTStkQJ35udoGM8cI/e4MVffa0MMp1f
 RQPcC1M3TTR5ZJGW5frilWZkyzkQclSTF3iLiLv/TvZlJsuCCqjGM2sm0HEH1uvcvZVrx3MnjVd
 MIpWyCOo7tDc5cz8nZun96GubVB1yEX/f34zXatEH0/XCzVeWLo7lCgYySGsInMpk0vK73T9QvC
 c9gEds6hv2JnPpUQIV09qNy5W95m0YfsTdee6DfNvIU9h70LsGIYExeGNKekmySNHkHHQtIxd9Z
 8vsrKkANJMdYurqDQHTwZCkdG9qkUYLijqeKnv4TFNDjnG6QCWT5TBbKmjQQMu0lLWuwlgnrade
 B2eh5yY1lSCjpOpIEKAJMX/Y/vH/PrAWc3O4Mrp3qkYXg4KbAMFX806HAJbn7/Hw6txlTVv0M/G
 xrHcX8JHAsqe0UUSTFtfjFNU12Koam0Ih799hcI9vRKK0Fk4wck0NBMJjy/q0nfthsk8myZCe3P
 if1rAqEyGfsUPqwNBNtC93d+jNop8RMKEbXNWLFUFleQdSEi0uAcoyrdceaWkxL0hM65bcrgKo5
 IslxXadbD+gE27wgyDTZ0BRtiKopYElHNia/OziWkutnYS0pYnuvpitnSBtUkjr687uwrRY3hCF
 ofSVlCkArx+GrgA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69ba7661 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=K6OwPNha_kR0oLd0V9oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ukvpcZ4kjiHx0zxuEDN1htPV1nNbApuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4MyBTYWx0ZWRfX/NdMMwRhjFR6
 9cBjVpMn6GghvSxxsEEkckT37c+EqFJxIw30hZfFVcmu2cczPs2LAmlq52O+RHelAR2De+cVjz5
 /AuULrchTB95//oNVDxVsa5pyM81gcLYFhHnhgy/7q5Rk+4ycilAoE3WULcPJCVbvlgd9kIM2xO
 6Y1ZOzZSp+x2suDhx2jpCm4lGCq2+dSBZbMBTq1IzCEUaHnXmMAl+AYpaNjHzeANvHFvFr6qkj1
 J76Mw1GUqZvMsqgzqvvKHTtvVH9Wfy4BxTZaPQswWh4TO5aS6t0Aef5EEaSBP+XCnl5Y58HZG5F
 tNuuj05o3obHe7UsgHagX19alkT2DlpTSfDTpZk7qHU6pV8rMlinepp+LElH6XrPq7gt0QzUHp7
 T6TzVpDCne/mWbBqpG5MKBBW/ciRJqqYAqUeFCDFVu+afpg7hO/rFZ6BHwu10GcFXQvPvpVJCxv
 yxkeauKFcFSWrURpTFw==
X-Proofpoint-GUID: ukvpcZ4kjiHx0zxuEDN1htPV1nNbApuW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98380-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A1712B9918
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the compatible for the USB QMP PHY found on the Qualcomm Eliza
SoC.

It is fully compatible with the one found on Qualcomm SM8650, so add it
with the SM8650 as fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 3d537b7f9985..4eff92343ce4 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,10 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - qcom,eliza-qmp-usb3-dp-phy
+          - const: qcom,sm8650-qmp-usb3-dp-phy
       - items:
           - enum:
               - qcom,kaanapali-qmp-usb3-dp-phy

---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260318-eliza-bindings-qmp-phy-c53be4b0b131

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


