Return-Path: <linux-arm-msm+bounces-105782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UE0BEY7S+Gm41AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:08:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0E94C1C2A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06C3C30347F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 17:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A313E4C88;
	Mon,  4 May 2026 17:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVfGolBM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WfecA1z/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991FA3E4C79
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 17:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914445; cv=none; b=Zdxvyro4tGXXLvYMnPP7iyv2FJXn6NmRB7paycqS6nyGU0idV9uLiniUk4/JQIno87SuDJqFum/FwyqCgiXSE28dCbq3sBVmxBbBbC1pFRFnPXKtKcqt0wXZOd9LCXOQX72B0GLe3MCvR/1V9+VYVqn9EuIIddGwf33X9r/VyO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914445; c=relaxed/simple;
	bh=F2O35Uv2rMkE96sboDI/Zcq/juuR3QBkJohneNGmGtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GP3Dc1zLWl7PsCTR6vucLz4G0Bz+SBq+9UomwIsl6N0aGIkZT70jlBqaRoCy8k6Ec2mSJG7g0CizeZFUTEKgpfeRJ/Oatof53+A3Xwj73DxzFbyLSEPekKIAbA3JbLGBveAe7Z+Xp4FQ1ulcWaoRGK0XNxYF0C1BLFHYHETv6Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVfGolBM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WfecA1z/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644Dl93t366314
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 17:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kwYz6UWOy5b
	+OSxGK1ilKg1S5TT3o7G0l08NWn3Jakg=; b=RVfGolBMN4gJqfqNkvmdDdTqQIM
	GJgyPXBeQjwPy8s01h29d2mdmNFvMRS39L/4cgTxh4+sEDVpZk+7EOmxjQRXiulF
	OCMuSV4OiupNKTxAs3TjyWNASxcepjnW1s2159YZ/jNLPYOogYzb8o4g0yWDrG0w
	Vu9UG4I6eM5WfRb7fNeHEXNnnZmaW1bOdamt9YdfHWugVM+H12/zHv12WNpaZqcB
	XQBSvmAoDEAisdTRTRxohG87bm3JBf0Lasi9IOwHp56k3R65DOzHZubt8abTHImy
	RZSc18EB2CkjtBwV9ChvzMV428MPLOfS8PelxTYSrgHVLnszMNhDoiyjGuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvn6rrcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:07:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3651991d0bcso3865556a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777914442; x=1778519242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwYz6UWOy5b+OSxGK1ilKg1S5TT3o7G0l08NWn3Jakg=;
        b=WfecA1z/B5veCYT8c+XDsowOtEcyR5gF9sFGgOveCSXPAm7cHCo8X4hrWNSskYvxu2
         Jn0VhKJ4o5DhPJJ9U/PjRoRdFEDW3+TmlX9ScKKprx2t4egiDEfKHkSQlcvABRQ1yi1t
         0dbub/sAzaTmKZGUmGSCZGG89kfsdg0joXF8LMaZJuRTXvfoW2KvudEtK/R/4QdpRcpb
         LOMvmkslMKv0g1cEU0aQrAiL7wzNkCZ/Y2EMMyHw8kCrROptHPRh2nslOdWJKpYmQvED
         XpwQAh6jdNtEoE3qylitO4lQd+jFFhitxtSyjx70hdIPvcyPamSDhAm38DntWS4F/LwU
         gEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914442; x=1778519242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kwYz6UWOy5b+OSxGK1ilKg1S5TT3o7G0l08NWn3Jakg=;
        b=AoFrTGBWt2pJ7KNaLXYXrCSOVPq1krSNTimWlSe7qQWQH0BGQ5VyBlfJbqKz3P/Wad
         aic7NYlxaOvF4f8FEHSx74GU3/L5lUvzZjNOaKw6MYLpJTG16la3yOkzfIC/ThHSD0gL
         uhUnbqsZ++jV2fk6lmMXnRe6lmSMdXTA6C6DbPP+DClCqmoY9SkaJIqsekIA0i6tr0SS
         TJuoBCKZnEAbIf9sHJzMKUMa/rw3MX7/xnAoKpeoJGRyMjw0UTxr7w41e7amvQF4G1eA
         S9sRNTWMDHkCYaX1c0aEVIknsH9AM4judO2CAOf08LrdVCidLfrzJM7TNh1L+0SVpf21
         Jmhw==
X-Gm-Message-State: AOJu0YxclabHmD/TlsuovVUoPdka5qhFUcKGGNhq3tEcoiITz+c2GPxf
	pC2rl8R1rBPDuN+wiM0gaxJFoSQlZ8Xp7quK5CW7HNsXOBrqlexE/1DSctiEr+iWsWAF/dciQ9a
	tjEaEA+ExDA1fwZV2yow0XgpuzEh+v7HqF1rrGKZe1EQHD5eB9sJMp6Cesrxlze6gWzrq
X-Gm-Gg: AeBDievBJFgiTKbjUuhOnit63L18kuwd6gEM26/3QUgNletzLOS5OjSw32bzLu2M2nr
	umCx59M3qyfYyOreJXJerVr8BmR2jQcKDxuPBx2xND90n6z6ha41OMyO4DpnCpMfucsQbocpwjt
	vE2nWNknuv2W0KaOfSXOH55Knm/IUUAA5zybRyTdCnbe0VKNfdNQb+YrlUEXloFNjP5v4M+mgYr
	fHxvidOIpbollYZdwr24sZCiqJkP9SPAK/6YoQsIwrNkeM8s9hiULLGmyGxPVVDMpvsg2FNTZN5
	hmEZMhd98eMbbt2/n5mKS/3egM7WAp5b/b/qWMLiuA+33yiFXoDEdbjMVHGy7QP5gUmC1p5br56
	RLBYR/+L98shNs4qeziIaqZuzmFOFJ+maIoIyq2IDQKxl64kKuUo2Lsxm3Gmkb86oFtoioEURJ0
	N3JLeeufYoIEqjCWLBqlAzXTpuyw==
X-Received: by 2002:a17:90b:17d0:b0:35f:9ab2:a5b4 with SMTP id 98e67ed59e1d1-3650cda4881mr11081070a91.6.1777914441603;
        Mon, 04 May 2026 10:07:21 -0700 (PDT)
X-Received: by 2002:a17:90b:17d0:b0:35f:9ab2:a5b4 with SMTP id 98e67ed59e1d1-3650cda4881mr11081020a91.6.1777914441127;
        Mon, 04 May 2026 10:07:21 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm6256847a91.2.2026.05.04.10.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:07:20 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 2/4] dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for Shikra
Date: Mon,  4 May 2026 22:36:57 +0530
Message-Id: <20260504170659.282532-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YqB179gmCvgt2tqymI5kD5CAC8LRuanM
X-Authority-Analysis: v=2.4 cv=Z+vc2nRA c=1 sm=1 tr=0 ts=69f8d24a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=a8DDbfJ14wVBhdYpEPQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: YqB179gmCvgt2tqymI5kD5CAC8LRuanM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NiBTYWx0ZWRfX1wvNJpCET/Xw
 Mn68PCQRD/BSPdsui2Kv+HrD/RRfl74J5nN2l469xujaRafU2DxF7vbyYanPllC+/1KO46LRKVK
 TomVytfrTX4YEKctN9HLV3ClffuHdaOrOKUYNBzqbkAeCaIedU1THhQFlF7rAchxrYbBliI/ZGQ
 u+xpXf5O2MLJaynaAZB5CM8FcWpoKPnTTh+wTcFJFCvZYmwa44lv9xLNjl1gfulrnkMHD4ju1Mj
 NcWLV4y+tXE3AsKMJXUlXFaIG5twXLEKQyHsXlkBVGvNjJ8fL/Pi5JxNh39S0h7uPWl26y7JlHg
 RzQFhlniCMhkuV8rBKijKrN0l6f1wnZ28PWJFf5FmE1jA0FWWTUYSqamVJotTt9tSO0PWkOY6mn
 6KfRjzAk+sSxm6DLiAzbcwbhVJ6jYiXThum48BXUj68Vkdcf82wtT+KLcM6syESGQ/EVLhpMvoS
 vR3px7L6G+vWt7F5DwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040156
X-Rspamd-Queue-Id: AC0E94C1C2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105782-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Declare the USB-C QMP PHY present on the Qualcomm Shikra platform.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
index 1636285fbe53..8402fe4a96e0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml
@@ -20,6 +20,7 @@ properties:
       - qcom,qcm2290-qmp-usb3-phy
       - qcom,qcs615-qmp-usb3-phy
       - qcom,sdm660-qmp-usb3-phy
+      - qcom,shikra-qmp-usb3-phy
       - qcom,sm6115-qmp-usb3-phy
 
   reg:
@@ -116,6 +117,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qmp-usb3-phy
+              - qcom,shikra-qmp-usb3-phy
               - qcom,sm6115-qmp-usb3-phy
     then:
       properties:
-- 
2.34.1


