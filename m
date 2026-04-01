Return-Path: <linux-arm-msm+bounces-101349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFo8NhgWzWmMZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 14:56:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5B537AD36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 14:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D284302A95D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 12:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DBFD4070F3;
	Wed,  1 Apr 2026 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qo334Ikx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBuM+gZ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE360383C74
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 12:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047815; cv=none; b=B8RS1uS69DhiZt5s9UxY8QmAkrJPPOfe+5PdyxMZmTvhg6IGu0QSpr7itUKirehGd1oyxNSF0fxnLebAamXO/XtRvb08wzwuPPAC1+xPDnJ2ImVb9e6UbWDv5DUb2ps0hnnpXAaRyjF13vf3i89cQfzkUJC65PBcpGkexUKlJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047815; c=relaxed/simple;
	bh=Dm4tQY6Z0Kn1vGyhIzkAoLmbQIvLxquHKqRAAYXD1y8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G+dKuj5uWEb4l+CQerf8b53PCotCN/j1Abc0f/fqnLklWhWHx+I061uiJ9DNh5asWT4QQd4/0JsqRqfeWfVCiRtCBqw2uBdxiCFuOewbSJnA20z2/X4qTopV6iDNwqy7nAtlcsh1bSiqWuPMfvPVQotDiL/7gq3YtV4HgVVPWZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qo334Ikx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBuM+gZ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631Ck5VO1285828
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 12:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kRyDyIzvKSryR6EnIDh5pb5/7230ykBouUn
	k1TabXhQ=; b=Qo334IkxsTi/bc0vzd1R9zv1s9uu4G1Hca7jlLinBus1wVc2Fvu
	SnZ9X2tgDnA4cWg1wkTip3tL3/Pp8DUU+1naD3R1kEpVWABa49VlLG+e19ODbza8
	HKd2Xu9Q48qhkWlTVvwhMH071QYOODzR12gBiDtEMScUeDgl4c9U+TL14GahwhOv
	r3X34qbgoUl7ig7Ow0JWKkBjyqRJKtdLRnS5yGsL2pdS5OUcHuzgqbQ08XheXxrm
	JDi2kh1gUE5QghiPKWTBCWMfEVO7So5pdXWV7Sm78wDbWrprmMHGSRomS665pwWq
	6sPH+P6bDOOMoNT1Y2ryVp7hfs/NCtcOE5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xm3sbx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 12:50:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d96923dd2so4605699a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 05:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047812; x=1775652612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRyDyIzvKSryR6EnIDh5pb5/7230ykBouUnk1TabXhQ=;
        b=FBuM+gZ3fQC3eoyELR7W+rqHL8qJRFaBimxGFh23scgmHZDaRW2NOFM+nMEZjozJnS
         OucX0bmFlRFRAy+sdJKKGpLVAUCYMB4WwBYj1cVcLN/lEfUSZkMlLMBXKSqgI4Ib8caw
         NzR9nwDqsqSQFymbNgY6Ar3gvOfShPKsXcW/1+49ETWqtH04c21lSpfW+xdX0ru10CTO
         s6xwBAS5hPIlJvP3dXvMT4SlT+09RfSRggraKjQt2tywFH1oR7fADZmHRcLDY1rQSYex
         +Qp6hj5CcRhxGiFJQ/qEaE/gzLihxiJBa6q+dbQp0QjM2aUKHC9c8lIQAEPOWrldQ42z
         ED4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047812; x=1775652612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRyDyIzvKSryR6EnIDh5pb5/7230ykBouUnk1TabXhQ=;
        b=K7o5rF7FQprMiWZsuKOc9FS/S1db+mfbKLW4ZpURqyah3VUO0mOkqRq3sSOe99XcnV
         Aa5+28CbpMLRgcHvJgU1QKwOzaWOCyIfuXG1AFKnRV0IcxtQ/OWQ7GwPnx3+zGU/KIR5
         mEbquzxv+BJh8XeIbZaPYmHL8t4lnB+WweopFOQpaJiJY6v58ZWAaPGF+HbI9q4J7GjH
         WN8KNU4alpyfuKSEYz2JMLM2pzsil6qEIP2DX0KC3NDdzZQ8/rp7YTyJcO4oflxEVBpw
         qhwCM4sSWlUJ2vqSTXTbsZEZ2zM3XTNKn3x+2JViF5qsgQz/zzQW79Chnx8XjZOnoodF
         GCZA==
X-Gm-Message-State: AOJu0YwaX+8L9jWln3gTNiCcZKX2RQMjWhg7o44qzwNH7h8lQvxST8fJ
	GwIW4lPK3wCkWrh+ou/o4Ew2Tyzt2RhFvN43cgrFr9MbpHSYwdGKgDVW4IzFR8BbdVwHBtYqQlY
	XLHEKXUkui6XXU892ebXB6ssXhCgiA73XE7sMasTWnZvt9hKoQ/dLThp0/aV9VPp44XKN
X-Gm-Gg: ATEYQzzH7w7bb0+VpLfVuYns1UQOtLq+kUXrZc+DrPQ5vQnfP5bMdncHx1fvPb2Kx/Y
	HKH/fJMUnGQP4bxB0fd93OnpgxMk6Hm/e4luX/UwptQq5AA/kFcf7razJciACwCz9MKNRxZdR1t
	pWPqgg6r9kNGE0PL5JHqdQlVwp3vluPqlg7n6JRo7rf3wJXLOEF7cflC2/tZYwHQVH4gAoO5DoX
	KC2YvgIgioONq8bF8phP9NVolQ+mquYqTjt3VeFR4x/1/02MIBTnKsF9lNKhQOLdZsx2GAriack
	NYeXhW8suRl+PJIqmvV2hyHJkF95Mao9/xDeM110xsd7hal3tmvUu+wX+NiNE2sWqaJg/kbqxBR
	NgbOlplczTjVP6Gp0rvDye/PwXeQsQhvunktO9CnAhUkhqABk
X-Received: by 2002:a17:90b:3d4d:b0:35d:9f7c:1424 with SMTP id 98e67ed59e1d1-35dc70a7c6dmr3118083a91.31.1775047811677;
        Wed, 01 Apr 2026 05:50:11 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4d:b0:35d:9f7c:1424 with SMTP id 98e67ed59e1d1-35dc70a7c6dmr3118048a91.31.1775047811095;
        Wed, 01 Apr 2026 05:50:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe637250sm4940467a91.6.2026.04.01.05.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:50:10 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: qcom,pdc: document the Hawi Power Domain Controller
Date: Wed,  1 Apr 2026 18:20:04 +0530
Message-ID: <20260401125004.592925-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=L90QguT8 c=1 sm=1 tr=0 ts=69cd1484 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Ptbc9qrUvVr0bb-3Ek4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: SpWggmMMqtZQwba-4ffQElAhCWg1Ulwl
X-Proofpoint-GUID: SpWggmMMqtZQwba-4ffQElAhCWg1Ulwl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExOSBTYWx0ZWRfXz2T8RkgdD7OQ
 JuePNvC6T6uWipCmETLtKOMSo+g42rEipsNSHzlYox1u+PpZgzG9G1rA+jm97ac9zGbRvY7DVJm
 99YvgaAMwUwGZs2PimvHzfFtTtPXREGdN58bu0uAABSdzgHRLwebJBriCaqTeN2nLEufRjgnB5Q
 9v95iLSVnHRIojaE5TD1c7uJ2yaAFPvxw1qhyjyzxBjNS0mQPIdbEd2jbQVhSIIiKTnbo0XSTCs
 yIxhdUIhtEaZgW4wc2WHaVFLBC3kAjndRvMQyCcPqyRhKJofJHE1J7ZdzOljKmIPmgLr8EwTHwl
 HCzHKCJRBZgrFM3PrpVCvXkJsnhO81WxYg8K4wcUz3QNeNYm3tYrC5RHiMaD9eRfqu+dw5oZ5yJ
 UBg06JO3Omvr6cAnZbAuL0COm5dOnrj7w/GbEeu4//wSWDllFawhSjU+auFAmPXoVylWVzZobdw
 /i24kG27Zt0qORYjPYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010119
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101349-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB5B537AD36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the Power Domain Controller on the Qualcomm Hawi SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 5ad68b2c6fc6..b4942881b9c9 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - qcom,eliza-pdc
           - qcom,glymur-pdc
+          - qcom,hawi-pdc
           - qcom,kaanapali-pdc
           - qcom,milos-pdc
           - qcom,qcs615-pdc
-- 
2.53.0


