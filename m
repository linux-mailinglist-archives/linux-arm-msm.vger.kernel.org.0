Return-Path: <linux-arm-msm+bounces-102739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDqBF+VG2WlToAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:52:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D78F73DBA61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:52:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C36B830FAD35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4B23E5EC2;
	Fri, 10 Apr 2026 18:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o7N6Zr7j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQnvTj84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BAE3E8C4C
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846625; cv=none; b=t4ku33hR1K5/K7cP77z1zeyuMXqq04kRTSvOZte+FVIMW2ffIwlsZ0zVobZ0rThr6H7QKarlP9S3NMQIrNamZ4XKOxG8XOJd7KKeAduMDrLE14cxzspthC7k1kTj8CxTfllnx2QPjTy4mru4yQbDGeyi+fnkTK0eri+pKcEqJpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846625; c=relaxed/simple;
	bh=LrYOtEt9rcxFuphJeoWaWvSb9zymc3pCwefaSTSXMIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFp26LPQUZEnSoqQqGbVB5YRDxwWk/aUBwYgjIyboe26Ww91rHZkEuIkHuE5soicKRiEtRNaepzTEivtKbnx5XoXCQTD/qFD/j908vUEboBcKscde7OG9ADWFSv142d83powzCvnMyX7L3ns+1nIJ9xIr84Z9qJk8HO1bJaWE3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o7N6Zr7j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQnvTj84; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAP2q22698277
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K3tWCRjsFgY
	Zdzb/qQI2S1C4x0elOOqx2eWEbdq5p98=; b=o7N6Zr7jzAlf4MIiXP532/xIEpJ
	ffaJjvUzbmYQmFXOIiaP1kbksO5UV1E6XSq6lGsyvL1szisa19G52ahmPy/Dq/4+
	LplnJcWzkSVX0NBPOZ2/AjcsdkrOMK2XG7alQMAahMUW3v1imY/TEofyXyB1FZ9m
	TYvr1Xk7o567Mdiz/wR/VnBPiXyetzbS5ZLcpzDu+93dL1aq5dlOR69tUddI1jlY
	PH4cAH09yn0ajYevymB3onr7zPUP0Ijy8WPFhTfNnHdMTEKIoq7wr7Fysfc9QJvY
	keNWEQIvsS101lIcpwNN9AoueNrN46vnl1XmgsgFPG8aNpQVOhcXJh5uBnQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9v9ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:43:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354490889b6so3685631a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846622; x=1776451422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3tWCRjsFgYZdzb/qQI2S1C4x0elOOqx2eWEbdq5p98=;
        b=dQnvTj84rfQQEntYqWq5RWR28zdN7NATXtwSzfxg/oksA7GHBCRKEqIc9AzRrW8Z0w
         xR5IzdUXWy2IzpalVcf3Ngj8cGmRLQVvYBdtQzWVka8H9I9jgxsFv2bZPVi7pL5AFLFX
         FmChcORdoU6z+MKDLpWizx7UEZst5gdQw0gl3UJ3AkmAv+8uQRccpxA0FspBpL/g/Wv8
         xEJ4vckZcYhhgveP+/PvEPKVjm8VAc9Dj1Ocza0rgz84xPDGY6PHEI/FeSj78drxJD+9
         RK8zN1IbbSnt8hXhqGYdEIid+DhPZW71IjrPI5lGoriMd/aXy9Z2sAzsymPtqzWTV5l9
         9c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846622; x=1776451422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K3tWCRjsFgYZdzb/qQI2S1C4x0elOOqx2eWEbdq5p98=;
        b=ILaHGRd2OmQMc2VtAZ+MjSEsSyf4bMI3EjzcaZr4BRU8Z2LMjUIML3ZAYeyC9KFdLd
         XMrXZS6buj0SkXj2u2H2McQz8Bnsu3nzk29kXUm5ycL6IQXRiyHwdGb77T5/sbcO+12K
         9Bl9afqMme0/nOYTzDcvny/qdUk0S6bKan195JPmyzdbA+oZzGfH7zS+F9Y/YFx651Ac
         QzYkOiZfq/mLdZogaysWvQ4CdEsdbn+PiKKuYwGPZkkLaNkzKPZpfL3spjJrdh6wYhsl
         Q7QH8RVPeTHspE2kg95xke3YVEmWeo0EL1T4fnmCo+zjjhlXfg2Klf4aaoyMGgMoLbGU
         m7sA==
X-Forwarded-Encrypted: i=1; AJvYcCUzxn0HxwyJc/TMpd4UgPfLDnyvUdoeOB9hYip13loswBC369bE9tYwxFgHEJlA35Rh8LYFnGldiKP44AuG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2qIYmq63Is6DRu1nRFsz6kEI2KmkQRGKunwhaRL5Kkwrrgkj1
	HLZZc2QQFCjR2OhIsLaI1T4edb8k2/OUzQxtiRp3C3536DZUQcei53NyYOlWu1UisOVlspt9bau
	qp5NymiVoZWDTOux9qFdmblDlV3gx50ycnKC32nOmaQTxx1l8K64lSegm6qqEZjW2om3Y
X-Gm-Gg: AeBDieuORhARG06ENF853LQdPm3jYWvgUMcz1zOA6DkaABqk8l89GUut49Sy9EgNfz2
	bezU2FxGrefc+slsThX20FD5a1GRL/HdKQ519MICwadJ78Pwc7Ttbc89OrtD8bmb4Q8TrGZWZ8x
	k+IW56l1LAn2AqnExCO2vwgPaMOco+gfcC+YFeuOuppu72DjE/BQjKe2BqMOLsLW77kC5LnAh5o
	Up4o/cE2JW5inBEBhcwkTdXCtzt42xPXREaB+5be7fWdD/gISiwaPLowG/qdqtlNHnPO4piM1pu
	clhD/Etk+D7FQPzAFNaa5Ot1RQH2u2MyY2ebEs/5R7eIRywXqr5xd2Z3GMXGPqzpghLE6fwfjpu
	ClqHXKvko1bE0+GNRTlWUuvQ4/z7S/R2aflvmQjkwNXaZB8IA
X-Received: by 2002:a05:6a20:9389:b0:398:7a23:2779 with SMTP id adf61e73a8af0-39fe408bfa5mr5121081637.52.1775846622227;
        Fri, 10 Apr 2026 11:43:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:398:7a23:2779 with SMTP id adf61e73a8af0-39fe408bfa5mr5121039637.52.1775846621650;
        Fri, 10 Apr 2026 11:43:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:43:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 25/35] arm64: dts: qcom: sa8775p: Fix PDC reg size to single APSS DRV region
Date: Sat, 11 Apr 2026 00:11:02 +0530
Message-ID: <20260410184124.1068210-26-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NCBTYWx0ZWRfX1+gKuD7nABil
 P6p/0d51A0IIQuAmD2bgafd+5IvJX5gMtkaTzO2UQwjYnPkyEKw27Sx3weiFdTKaqP1ArreZyEE
 9NdhExyAS9NVYapy9QN+gsezk2DZ/im3XEG2gLc0Xx430fyR5J4tFydZyQcFULLpBb/wcpXPgNa
 p+BoPt6O6Z4JfINTCu9N74a0aHBne2Ry5ckR4CHWEdBtWbslCsVxHfPDeB/1HipyVr40xXzlAJE
 5sJfZu+HDStTeKjZ6Z+AR/XHADI1PCiYBnJlN/AyprDbvfAFFQHmYXbD22QMQcN8bUs1tzUGedJ
 P7J+ZpLJnzH1E2gnDyvMam8MPUIU62fIYzABEQhGGuE/PUTVWYA68s7+/92Ta4NChIyqcCzr1jP
 T2QJyc3+/aHwI2LOhOiMFeRA8Ef+6yWi1A8AX41NUZEaML5G1Ff7Q44Ue0SOdbvJgp4ZzmSfnK6
 Q0BXclvYz4IYIEPzYjg==
X-Proofpoint-ORIG-GUID: oCl3iI138-wEh_fVgPPMFjm151DpZY6Q
X-Proofpoint-GUID: oCl3iI138-wEh_fVgPPMFjm151DpZY6Q
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d944df cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4r5VZk7rGim1V93hxqYA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100174
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102739-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[b220000:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,af00000:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D78F73DBA61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PDC reg size was 0x30000, covering three DRV regions. Linux only
needs the APSS DRV region which is a single 0x10000 window. Reduce
the size to 0x10000 to describe only the region actually used.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..1724df115873 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -5536,7 +5536,7 @@ dispcc0: clock-controller@af00000 {
 
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
-			reg = <0x0 0x0b220000 0x0 0x30000>,
+			reg = <0x0 0x0b220000 0x0 0x10000>,
 			      <0x0 0x17c000f0 0x0 0x64>;
 			qcom,pdc-ranges = <0 480 40>,
 					  <40 140 14>,
-- 
2.53.0


