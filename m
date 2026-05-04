Return-Path: <linux-arm-msm+bounces-105666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIx5JhRW+GnTtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:17:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4137C4BA0E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 10:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95DFF3022F45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 08:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DC431A56C;
	Mon,  4 May 2026 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kv4QrLRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDwgBny7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C1131DDBB
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882495; cv=none; b=PEdc90BID6ESzk9U4aFwUiTYDevurmKcqBqCyL0pkiuMjolrNR5S/IlEbDp+bXYESIFzoyJ8pOAJOvFDUUUkHOwupojPnmZynMfY4EA10Qr7PVSbwElgAGEcRKRAc/GKjKeBKcP+0Vqx474Bo0VXciAEW6Bxj9+FK7T8kWcTguc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882495; c=relaxed/simple;
	bh=FLI0geg6Fz4LJNVJe38o2oRNImLk56h1srt9jDp1Ad4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C+9DMRGyc5MtNlAew+MVzKu1DvnPyQ711WbOCB07hcLe6Eidgvr5td9OwJMAFmG1Z74lbTaYkepLAx320f+OxiYQHr612o0SFknAs+LKHFq3LanSwXe7As2OouYYdwrQmDtmf4UpSoqyohjiO6xS8SmLBfFabtkukz2LEeFC7bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kv4QrLRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDwgBny7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DJQf4174428
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 08:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nfNktoUxXUD6+d/5pvB4YbxJkjpwKjoCg7C
	QaNqUz0U=; b=kv4QrLRVJA/A30mIXZYDosDt6I/1PiiR8KoS+7hM/qs6HgMA4k6
	fyLrWp+r5T9kEyPuotHQe23DkMFo0dN0Bp6Z1mxcOHAdunbTRItMPYDQ9rpfrNga
	6hN1IoU4Iv+OcW7Wo6iaEphkOWYna+N2FndXwkEj+YfI+Mg8hJ3qrgUn7BkyrNzq
	e55Wja247QQpVGg9Xv8UUb58VdfN2rmNXnIuszwTTecQ7kXcb0uBA/DSGYsQRDe9
	7yiiP/QitqChlt3FI6pBwD7cOsQsnAuGQeLd7cWsYFmd3PttUSQN0AD6nbpzdQE4
	tTWOImkhuDzUM+bu78boHJ7voIyuZaUn6rA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw9n8cs79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 08:14:52 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso3524734eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777882492; x=1778487292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nfNktoUxXUD6+d/5pvB4YbxJkjpwKjoCg7CQaNqUz0U=;
        b=RDwgBny71Z82KUxpEOLbMtdjszC8J89j7QKdCo9Bpzaiu73Q4DnPPTCEAQoq+hpowp
         /qC6AvjZvJOXqcpXMcvOjVfLxFmMOPTfk6uvfaB+QrDkUq1uwdzzVi8RUqeV07HVw1rg
         kcjQ4ImtiOgpuJ4GXJ+RblJveEjTVznSO4gITI8tLFj8+uw3jD62MJoabkHE7DTd+ENh
         LrN7POwpLtewLt3x/SlN4TG6ei1nNnbXRZfdol0rmo75pI8DiZtjfRIfnl2KJviWParr
         eb7OA9qEbP0D+vpf+nLc7UStk66qh7zgHNjNl17xHckX8J+pJQ0U97n6qjajGMhSOhYX
         3cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777882492; x=1778487292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfNktoUxXUD6+d/5pvB4YbxJkjpwKjoCg7CQaNqUz0U=;
        b=H2khz20SPLChvuXFnajcrWJKvBlAozEhnS4XA7KQklxBpjQejB9axJaXNELWLVUsZP
         VbHT+TxtaMpXf4SpCWsrfbjJcqHBeyNoUvRZnfcjjuWu9AIJnh8MiSpNLYv3NDBvID95
         NRIBnt2nhaPHaE2xIL9mFzztAZtZeYTU1pXrEjurpgcxUiVNf8q89mNg7R6NQU51CAo3
         dzBk/cqHfQ5/B4Mitl5iiOe43AXBFzAKblAvoUGXOtGFt2SNedJhX7mGHQY5DJs7imcX
         ye8qXc9OHDCfBBsUxj4timKfSSk4A4ysVWKCfuOmQChX85bWSwaRpKe19BXbykGGRuqi
         Mp+g==
X-Forwarded-Encrypted: i=1; AFNElJ+rWDVB3U3LCsHtoOYNZwiAEfkpoMwqukb7hoItt56OEuxVmR6xvmlkwpI0hYew8LV1c4WyfJx1vcfYcMn0@vger.kernel.org
X-Gm-Message-State: AOJu0YxONOps7IYjq2aZ/5KIP8TjtCO5sqEofENTTFUUdtcT5M3ye9cZ
	6EH9dxcKcoC7lazuTyguOB3Aovzj88+Ssg3M0KHkrskLAo7JP3b5v11RTBn8sIysqld9Tjaz019
	HQ1rNMbkXLKqMxhp4fU8XWFDUldLoXWdkxATRt+GynTYR4oUA+vI9b9SYnIti0pJMcl1Y
X-Gm-Gg: AeBDievwYz05EF39yDeVsgBmZL6O5olgsmNiYbPIsEOJJQ4X8dwVg6NB1zpnIKw/ntH
	4jWHybZH+nVGZtq/iqGiNVM/4UVWFS2lcTu+EoAffVzqoXrFoFpw59pPtfA2dc8a5hZmkUD1oJ7
	ruolN/eM5eggJi3wpXzTVjX1JZvCLgACZU5j0rKpnv7yHyEYG0MgdW4pVxP+hsor4xOuV/G49oK
	jF74CJ8IRrtWtvscBuXcy/XDR1LBX1Fy3ZiZojNS7vEuOm2GW5ireXLCbdHRzcCbHyjShRePF3R
	etorqEWEY8zNznKr2hvbw+aN8GIh/nLQJ1UqTy44s7mfvRJg/5vLBfd1C8y81aDrXWdxry6YXJu
	GErW++XM7BdN31GQlkxOJPBKyuPYmwPVcVrz85CB3eijB6iAl5GJFU9OqhrBTfklDl+0jcJOfUT
	mRBGkRIZs+QMXu8EpD
X-Received: by 2002:a05:7300:7fa2:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-2efbaa9db2amr3069699eec.32.1777882491930;
        Mon, 04 May 2026 01:14:51 -0700 (PDT)
X-Received: by 2002:a05:7300:7fa2:b0:2ed:e14:e956 with SMTP id 5a478bee46e88-2efbaa9db2amr3069682eec.32.1777882491413;
        Mon, 04 May 2026 01:14:51 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3bc6a79esm17450886eec.26.2026.05.04.01.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 01:14:51 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document Nord QMP UFS PHY
Date: Mon,  4 May 2026 16:14:42 +0800
Message-ID: <20260504081442.825908-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w1Izx8z0DZko6FIlrNM8oTGWPBF5rZ_p
X-Proofpoint-ORIG-GUID: w1Izx8z0DZko6FIlrNM8oTGWPBF5rZ_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA4OCBTYWx0ZWRfX6exlY5JMTs9B
 lbaffHpujBaUemDdvSEiqBdqe0A45hd3I8+VnKjhARH3rBjk+eRgw3PM5EdQgAIMyJQ47CB5fX7
 Q6oROGmV8IQ64c5h1ta1BznMcc1PbC293we/JKNVNRVuWXs4V5atlNuTBF2TJaYR5M0L3IMS/C1
 m4pQtzNyrvS3dcvPq3irFu/wHW31+pQC6lUjCPNsx0ysO0/I8dNvs+DDQs2i2sOKuL1NlUT24tl
 z+OjQ9OfBXrJMDevFqnO4ocKKnRdlr7G2fb8wKdD5KOWyErqev8wyDfqyB4TyWn59HCdlVFOFhQ
 X0zKh/XKDFnstb30j5yOZwK/ChOgdICBZ35ntZvkShTDVHlN+l3xCEA2tPksU7A7OCQb6Fov+Bp
 kzZK/QuC70gDuwixKhA1y1lmabgktj9dPml5bpkfPBTTzGxKkOPqCXVI8V5D2Taimq+Hh42XGIw
 hAXnrJ5nO5Sd3a328Kg==
X-Authority-Analysis: v=2.4 cv=ScjHsPRu c=1 sm=1 tr=0 ts=69f8557d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-P_PvXqPkIm6cR4a8nYA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040088
X-Rspamd-Queue-Id: 4137C4BA0E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105666-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document QMP UFS PHY on Qualcomm Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v3:
 - Improve commit log to drop "compatible with" part
 - Link to v2: https://lore.kernel.org/all/20260427012732.231611-1-shengchao.guo@oss.qualcomm.com/

Changes in v2:
 - Add Nord compatible to existing qcom,sm8650-qmp-ufs-phy item instead
   of duplicating (Thanks Krzysztof!)
 - Link to v1: https://lore.kernel.org/all/20260420074942.1250414-1-shengchao.guo@oss.qualcomm.com/

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 9616c736b6d4..b2c5c9a375a3 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-qmp-ufs-phy
+              - qcom,nord-qmp-ufs-phy
           - const: qcom,sm8650-qmp-ufs-phy
       - items:
           - enum:
-- 
2.43.0


