Return-Path: <linux-arm-msm+bounces-104626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBoEGAsK72n14QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:02:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1BD46DFC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D68F300FA08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5283439282F;
	Mon, 27 Apr 2026 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovc/+USB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9I8zedV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C48B392C48
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273272; cv=none; b=WguOJDwlyOpxaiGSgQfk3ESZK7yp90Man7HSVrVZXxY7VM45Hr7jXOI+2UNKFqQZBN8KtLRhZq37jsZ6lq7/5IcmnxgkJNWucHmwthTAIVea13VwKi3RwuQHN1qM/03DqFjRCER7GETGENEvdRYpPH19Vlio8yIhbUTeVsTFrH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273272; c=relaxed/simple;
	bh=9oxPfm9GW9t/GwNdjoHimHUcvuT3jEKHo89NglBUots=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X/DEReEJzjLbur/mvfID5CrHFJy9EnWjs4vkxEORRFja7DLfW5xCvoMqtM8J+nmfoCgYiBgDhgaOQad1s/6n9qbDv6IvDLIohWi+p/YfLXvNvIYUPyzT4lBiOIgGtu3eZtFsGd5arwYyey+I0K1vgvKWeUhRJWqYkW3yoMR4k2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovc/+USB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9I8zedV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R1DHsH2273990
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P+HSbX6rCEmk+WgtBkvRIPUPeLUPVqSttsY
	Srbkixo4=; b=ovc/+USBdXGYxPmj5yeUDoROgr6V+Zt0Bg6xOSCJ2fuC2V7+MnE
	eTVIBYjSCbrVyIZw/8V0x/p0/vJE76+o0Qz/38omBWK5pmjfhvh/drh96/4KuJ6A
	5kcxF63A0Lja0DrBMjE5a9YWQkzTgewQiBdDQ1+tK1N3nBQH0OZ9z7+bnyWQ9yUd
	+200z1lpF2QS8gZLEdxKeKQOhT5kOhvtA9n8sSZ01VranEv1Q3Xl6Ve7vqL9VJ8Q
	FaDXI7Z4rw8YSy3PrGMSp49Wcs42bvdMGQaOM39HOI2svYbKa6vCghBfyGf6aTVu
	hhHTUSE+veWRHV1w9bocvvL0R4WdfXrcvYA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9cppg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ac9609d3d6so248471506d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273269; x=1777878069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+HSbX6rCEmk+WgtBkvRIPUPeLUPVqSttsYSrbkixo4=;
        b=D9I8zedVjSwCfIi/OBSyIdCNDzto1Yf7hlmdzCrbKTvqhBBbFDV4U7dmXdw7Dl8Wru
         yCYfOxuPh+WLvJpefSUbLD/9ucY6AjX+7a0Ge+Dlp27DauunM4a7s7oeZZcKX4w9ub6W
         OARyj93d8RmtahdY3FmwLpVq5du9ir8zyRKgpBcz8EW1VXnWAkX/eXbBeG9TDmciIWdt
         F7LbeJJgvLA5qC6svPvz9P5q57IEcNxNtw2MWbqABh/b8QA5x9Kr/+uWxY6sIhvEijCi
         ma52KvNNUegENY7LGc3uZuSe4vTXq7U+QhJUoSfrhRwOJJ4jZVQ8jl9EL8mkZY3Zz5x5
         EX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273269; x=1777878069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+HSbX6rCEmk+WgtBkvRIPUPeLUPVqSttsYSrbkixo4=;
        b=Z2bZ582hsz+pxPwNOA8W43CcUZMQOYhhn4jNzl8o9c5FzDMhaY8Mq7CUVcR+MdTWa1
         0snhymD8/RbinkwlMYe3RI9nsiLan+MzWU4UB459XTy2UPropoFHMETxJFEgSRWuRCjJ
         Y0NJrDEjDrAphqPSgzKSag7o8kN/HEIbkntj5kKcJ0WyFyRXxSn30lfSjk3+iuhA5n3y
         B5plQf6uYvn6mox7C7l1u7aaOScPQpvgETxueibsJbaABIFY24ZcmhGlwuiDnekS4PQW
         pZlZbhrs8uHDYUYMyZ880Luc40vhq0AO6O9De20a/DMr1KpElorLDf+JnXSgjwJI3ls6
         b0QQ==
X-Forwarded-Encrypted: i=1; AFNElJ+E/ciu0eslBhycwdOv5jlHPfGOsy+Dug+HC67rvA+6/2p/pM5lDehPWhPOX7nJB1ablu5x/F8H6jljqA8W@vger.kernel.org
X-Gm-Message-State: AOJu0YxIpBGuP9mPOrMyKMn+cp4+l34XbHdtROUTMqfBjvQhlm7fc366
	T15uCYsR6Ofydb8M0qd2Ojuwr1MkCp4E/4gC4CXpWNBfymtxF9B/FMRtWIkBPy6Ec1TYIcfOyqL
	Sq0KCkLcuJylh3YRe7jJ5kZBXS6LxV6qpJS/fgyNFFPSzEdt3wIUTpXso+d8162J30bd1GajzKZ
	YB
X-Gm-Gg: AeBDieungFGSVMwA6WcwNWZI+eY7wIiNwTCAx5okBXkCQt0Q+WmowPA5maYhnYl5cJI
	1Qls85JOIQlsZdDdcL8X/znkJoSASTvsHZsqndDedWYSeqgJ55O/14ZsstbYPwDUSxuiR0rOvD0
	34dDeZ9Xy0C4lDXGaf3/9RtY98DOgo4h/DimAvvJcuVcWKXKK1eHH3100rDfIxj/ZmEToVDQGAq
	OFBimwDFKohnR/KbiqQaZvkkruWtVJY0UQWZjFfMrmwhUGbmS+Mihtka1LSoQ1ML19bNK3uq9kc
	fRlSopmvVbGzP2pRzapstdvYxayIcPsY1RD3GtY4SjUponHOX6tY6DcPWQnmYM7Z6BYUZ9LEUu6
	oepWjRj7UHX2o6ODahAI1Do17tQpBoYFR/WcZwfj3JY4ZJZMO22evK0jcPv0uDRcOcHlZ/qmyWS
	UGUQ9P+BpnAw==
X-Received: by 2002:a05:622a:1390:b0:50f:b076:43dd with SMTP id d75a77b69052e-50fb0764918mr402154791cf.36.1777273269237;
        Mon, 27 Apr 2026 00:01:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1390:b0:50f:b076:43dd with SMTP id d75a77b69052e-50fb0764918mr402154151cf.36.1777273268477;
        Mon, 27 Apr 2026 00:01:08 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm84258724f8f.6.2026.04.27.00.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:01:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] mtd: qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:01:05 +0200
Message-ID: <20260427070104.18227-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9oxPfm9GW9t/GwNdjoHimHUcvuT3jEKHo89NglBUots=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wmx5YbeCWIeDxUe4wuY6WAZow/fJOOofzWj/
 RQvgIheuW6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JsQAKCRDBN2bmhouD
 14ntEACOQR8QIAZgSqHwCwFWP3G9mRee+vBgMXeM7/5u2JLa9abz+vahtpR4l+TEdsNDW8/L6Yn
 rt53bLNA3UGnIiAOclbVTmp2fmjaVABJUkyBn4282Tv0uFw5eNAeTgjQbFUTB0bI8H0wLvwoWZF
 XnIakcE67L3UD1AbcY6TX/q6Mo1LpD4zqwgTEuBmTyhItmM+dJNraYZR9HD1X4XrupOfMrb9jiA
 07u5NEedTF4HuWhSzw/i73/QJxwA9PxSkr0lmJk7U9fAkZjvVFJi1h9PT3QtJlt0KNrJp1aF307
 g7DXYVYsRX/LK6E0LuKmehAQNzObPWEsOPml/Vsuijd3rderA14WGNnVLzN+SU2Z6oLlStl/TvH
 2KIDc4uY86ZaZEzT/jXwhvlJ9yqs0qpEmM/u3yCvvZdYAZmPDzpdtRAKwxXP7ycz9K/YPVV/0en
 ETPnwsR/uu9PX62g6YHt8ExA8q+hm+ANgkAVBbknDuXOzYy6Za/4rO9hqd6tK9D2GqvA8EmhwiV
 IFsPsJduwmpKs0ciffygZYjgq2tspgrmzV2PdSmHJXhPnZnZot4OzVGpizF+AQOKKr+7RX0ILoD
 q2jmewfIfRV9ssmUJeBDqMMn3msNKTkWEXxvNmUdCxkTNTpWiVFHM3nf9FIih9U1TUKBM9CaKsE 7nz0UcTuJBvsXJg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aS7gqWOLOmrbfkfDoj2ZF5FB0Z4TuZHt
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef09b6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OH2BrCJ_zWbRPc5wGsQA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfX/Fsujq/fu0QJ
 sP8U8swnUvFFw6lwvb+T9NYZgkk1K52id1c8Iac8euBH1UYLCWnxCRbvx+Uqunc55lELM48uPLH
 xjZ/7RCkMe2u6IDX+EheXDFmmZ7O4t36PR4g7qsDfQp8/NRXPu2S3m+okJckBdJ5TPfP7tqc8Gz
 R+ydZkpUk7qLrsM+HA1v49h4PZvYlvPqmiHQm5RI2ePDZhfZ5c1OYCyyLbyhbZ0Zr4dC4tuboNL
 +ecX40nBlVPqHWK+iVIjCvPDAiXjdTYh4U9lfF/V2y7NvSCo3+wx+fyFTsDDQ0xk5zeK8eSauti
 t8SGNeViyh/P6cvg0EfCRo24MtJXb+dJmeGVRdNqyfEI7GRwoaMHOXLtfDlOUbCtVD8Knf+ma09
 pwoZQ7f5JiOForh7LkDskYnprl3VnOlef9uQS14+UnTmVP76lYTFep1JkaQtAelUtXjVdSmf9kk
 /nNckGfR+3HN2x3VYlQ==
X-Proofpoint-ORIG-GUID: aS7gqWOLOmrbfkfDoj2ZF5FB0Z4TuZHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073
X-Rspamd-Queue-Id: 6E1BD46DFC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104626-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/mtd/nand/raw/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 7408f34f0c68..d488213b631f 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -304,7 +304,7 @@ config MTD_NAND_HISI504
 	  Enables support for NAND controller on Hisilicon SoC Hip04.
 
 config MTD_NAND_QCOM
-	tristate "QCOM NAND controller"
+	tristate "Qualcomm NAND controller"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
-- 
2.51.0


