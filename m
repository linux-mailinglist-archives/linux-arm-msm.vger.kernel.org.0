Return-Path: <linux-arm-msm+bounces-107532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEZVEKdvBWoTXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:45:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC3F53E771
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 465A33021F71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50093A4F5C;
	Thu, 14 May 2026 06:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TI83Zwyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a6jVW5TZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3813AA9F4
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741155; cv=none; b=e3Sfl+o/5a6L7VHfs7WbIU7b/2T9jO3tEvsg556kQq3kXEeqFxW60qyTK+U6BGRl8TiqLrolMwNvMXmR9ro/eFPmU1OrETEf+Gl7YDT/CGLG5+wklEXs8WpGcuMpxhHTwR37GFY4wB/OO/LT74fW0UcXDG0fKpKCcqyR0CL87zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741155; c=relaxed/simple;
	bh=3IVpNrCnL5iyLexlh1ItaHWNOFiQFPAlQFdXWVl4ay8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/82rJt8zkwYW5ldwHyhvRUmx6igrq41aB/dW1cfxxQTHF7W1Z0dsEh999IEvXKMNDt3f6YzEtOuuuKLawZw19aHoh2fs0s2UxtI/R1eEyKCJelpob96DYDjL8GQELXAS9YqbyoE15rYQuHDSz2HSZLxpa5e1uAmanRGszvKgnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TI83Zwyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a6jVW5TZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E5SUqt2004433
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oG2Gr7C3LtHCj7Uu1Su6emNGQ/dJWK61lrcIhPPutY=; b=TI83ZwywBsZcbWcN
	SA+mCluD0eNd6+MkU+zZbUFKNbFGem9+vyzHJqOgBagxBrpqwtnT6ZCy6mrQ8szM
	Tu7lRF32rxA/XkNyP5744v8X9cDhhwkzKAlDWiEwB/Q9guxRFqkLkIZtRh0tpLfP
	e9VNzJNEYZ/n1dxTONcICAdLe4AAK/cNr0RvxmTfM2I2PMtmX2U+O7cAWCd7odFk
	CTmxPxGIMDjsl25ABiVpFIXbu+sz/F9PKr8lThORgExtBzdBWY4tCZclcHC/Lh7e
	EWk8n2cMqOnrvoCLI9ydVCxCJrMQno1QNSj8pzlKJqMuIM5G/4U+67lIZNoFRWgu
	F+ePTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899r7sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:45:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2babbeff9e4so89897625ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 23:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741152; x=1779345952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oG2Gr7C3LtHCj7Uu1Su6emNGQ/dJWK61lrcIhPPutY=;
        b=a6jVW5TZK42+YzQrQkIlvGdVLt/4H4IcK+8r0AmYoIopghBvBCzVLPUlEjrSDyNTkS
         KL5mbgb1p1uDb9kyge0qg9pqQx2cqZeNXJCX84gRkyxxJCECmPfpYmJYHbD9/PgQ1hyR
         aw7s04Kyy059i06EHdJRBt0/PLa2PAwPuuYj2RdICcQ/b/VR3ZypdQtRytqZXunRnRmQ
         MiZsJ/YE/e0VWfnsComqrRXQ1lz6GSyPoZ2cVHyS93TOU7YzVuWTQRRrf1ezgFoBa7LQ
         Y4OwHNzItKu61xjogmEhlH0laUnlvSEKrPxJemQVrUYQK6it7G1wcnbPGBek/XLNWoiO
         +Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741152; x=1779345952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6oG2Gr7C3LtHCj7Uu1Su6emNGQ/dJWK61lrcIhPPutY=;
        b=JJDbTEUBay55QKhVwq9nr2WVOQebnMzCwUo4jql2yRgodwDzHnpG3M7WCZhlfUejAW
         oQEhIt/h2vWZKvNFobWxC27WyOeh3SH8/Q7dHBGpFMxWK64Lky743BLgiD9UCfvex6c/
         MG/h5eo4TFrfosdqSKNBEmVMjrCpQ3fxJU26iRxWEHq6YmuNEdNHDbvqWvdjglwBOBVw
         hdRjW5NdFYyxp8o7WzL1Yexf9a82aU2c9GY1O+2eCFi7EzcMW+YbvoF9kCbP8uy5TD5O
         p7wI4VvU6fu9xVX/t3aO2GX9Xt3ZzOCAoyDer2Kqq/DnouhWiMpWbrBODVs63xsTTjTv
         w/mw==
X-Gm-Message-State: AOJu0YxXPWR8jWUwVdQKsIpCgd4VyawfVK+vUCK2IzfxuXIbVhEe7zM4
	8KaKrSkte8XdzLmjJneuE/NV5R7De6aSZToHXsjE7BOPH4mQHG2toT9q7MO/Qljk61idahIJMGx
	Ft8AdJYG2MLMmiNrHlqzAs/t9KYpoTssi9x4vg7Dhbcl+a6+Ey8Ke5ICLw/BqxACxCeZk
X-Gm-Gg: Acq92OGK5d7prTpOldL6cAczW2PW9vyjZQk6L3dgWz7Ob4a6UCjza4GSOBDjlC+lGM8
	E5gDwzmmJaWA8pGObj4MRJSU+AHjiO28q0Hj/egeIUkM61S90eosgyiWkfGSKYzyTNX73MENDsV
	Lm50gUnHOKKCIhXYZxT++mWwFHQkURzqeHOKyYXUP+Cdd8VGT6scEFM3ot0z/4fP5rFu3ooGgls
	DoXiCe0nX5rkLMqfJ6q6y5u+HFRsQwPcMAEeQgOWwU8uEHSI3F7jnVpxPYUprlcGJRTvl5VU0zS
	RFAM57AznUQ9j/apJvhAAN/bGN1Hq295QVirWDw+T9c+5yamfi93rD9hPcogLtjTCwlADIpXXt2
	h/G0xEmLtFfTx08v4HoJWwODKYj9LMk/1u88b4JJ7T2FsFfaFp8+Gn5VW8H2Ie6nJBH9M2oQfc0
	uOakjZVL5QZ2m0hBqbjmFDT8GhjOWao3dmOeXKwB+aVbT1p42U9hQ=
X-Received: by 2002:a17:902:cf01:b0:2ba:792a:18ac with SMTP id d9443c01a7336-2bd52b815b1mr23287115ad.30.1778741152457;
        Wed, 13 May 2026 23:45:52 -0700 (PDT)
X-Received: by 2002:a17:902:cf01:b0:2ba:792a:18ac with SMTP id d9443c01a7336-2bd52b815b1mr23286715ad.30.1778741151975;
        Wed, 13 May 2026 23:45:51 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe49c9sm13387685ad.49.2026.05.13.23.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:45:51 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 12:15:31 +0530
Subject: [PATCH 1/2] spi: dt-bindings: spi-qpic-snand: Add ipq5210
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-ipq5210-nand-v1-1-cbdd7492e826@oss.qualcomm.com>
References: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
In-Reply-To: <20260514-ipq5210-nand-v1-0-cbdd7492e826@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        sadre Alam <quic_mdalam@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NSBTYWx0ZWRfXx4ryLMvt17KS
 4jqkMZi6GBJzqNFr/6krpwlxL3atYIBzvu90/8MPgF4IeO/wMHFevYxMtuS9AoW11QAZIXiImmJ
 vHqGSH8uvmi+ct7xGnVSmCLcu10mFAEKMJ8MjLYXD84/YG+iGR4JloBup4xPus+xmuf1GmE3tRt
 HthFSk804ojYs9sK+PYmpQi/wo4pSorlfdD6fZ3oPsK+JgO1ghi/yygW2N4f5x5TfFcKccHJ3rb
 OiKy3HDMjownqo6WsvVz+i5RL+zf90zicGj1I4D61yUYj4ZCRUc6vDpCAshxxksy294rJgNjpQA
 i36V9p7DYLQFdVl2Fty6NKGp3G73Ah09HBIyTF1xLUsU99fSOMNRqbVYB270b7oTpzAap9tIqoL
 v505azZ0N+rWyzsoQZIWZZvMRLGQDbh6AaMECmdV1Av4SpRVuj0s4mMJ2HDCNQpba8J8Op+S6Fj
 uOpwSVxOT5u/1ss5V4A==
X-Proofpoint-ORIG-GUID: XYV1ONIldSf75J5Xo6iBr9Zp6AcinB6C
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a056fa1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sDV5ar4kFRZnHXHNo84A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: XYV1ONIldSf75J5Xo6iBr9Zp6AcinB6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140065
X-Rspamd-Queue-Id: DAC3F53E771
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107532-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Since the QPIC-SPI-NAND flash controller present in ipq5210 is the same
as the one found in ipq9574, document the ipq5210 compatible and with
ipq9574 as the fallback.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
index 7d0571feb46d..829da22537d4 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - qcom,ipq5018-snand
+              - qcom,ipq5210-snand
               - qcom,ipq5332-snand
               - qcom,ipq5424-snand
           - const: qcom,ipq9574-snand

-- 
2.34.1


