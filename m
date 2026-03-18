Return-Path: <linux-arm-msm+bounces-98344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMtxFH9jummoVwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:34:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C94AB2B8178
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 09:34:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 955A630F9DDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 08:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BAD37C11E;
	Wed, 18 Mar 2026 08:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R7tsnWSb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EQhDIWoq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247E036920E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822421; cv=none; b=sT36+B2xIBUCJTdoO+yQn0oRX9fGfZDjFXMGkYMWBKhwzgg6bufR3IJetV+QQyDSmF7JlthXKBcQf2HWhWxI/iHH4G4AsPm/b15lgJHog9Vtk0xFjIlqs3kDcsHqT/92rn2Aqfl9KpHWywAsC4rQl6i6FrKwkHEIncUH1EhpYzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822421; c=relaxed/simple;
	bh=1Wmamm2HbvjtVnS8O838VC5NstfeHF5rP3WVC9YRpsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lPGiz/JhP43coGuW8OaQBlkjXU5+1gmqLHenNgr2DYHM3fotV1Jdlysn/yaM43XcNfQJ8n3iireIrF0t1QzYYUxGU3RivvbKPUrumSdLq3qRNCi9u4CfT2iDv1pALXG4FAANuC8wu8YQabUrpDq0PsS45qK6D2xp7aPWf4NVb2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R7tsnWSb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EQhDIWoq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I18ju61050806
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CHVZrM1FJjJMG6EOmvuffm
	su/QLPzFL0L6ONcW3Zgyc=; b=R7tsnWSbKF1oiikC1b9jJ5vIA7v8MGoCLG3zbr
	QdtgUFLp+kIATTtuYLj/mbBAxxwocmZhn4bqM0cu0yM3IP1jWJYLtBRvVke7IHfP
	p/I25LicNBM7RqBJYbjQ7/xt1dnXDh1CmhtEeBFF1GGIuyVNWaOrXL0nJGOltTGN
	4xyJnufiyztxkmt721l5ybhPWzbaXzBAV0hkCQUK3uREMihUTQz+w/YE/lwC1Z86
	hRrwv+s58A1kEnbixVnBUmMKxtwYOQBoijGiGEr4bKIwCxNstWH0oAz0FUSzOLdw
	s7rT7WrpNyPv0L19b8tzvr0rtyqdG0j8enqbFieB3YRLKIZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ehhn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:26:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509114d7418so15503911cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773822418; x=1774427218; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CHVZrM1FJjJMG6EOmvuffmsu/QLPzFL0L6ONcW3Zgyc=;
        b=EQhDIWoq/2CwLtyxJFDONrmy29t4KzVy00t2cpGAKcfqDlupmll38YbofPdr6K6MBO
         kT/LO++RlLofqiENZ2F/pPG/PLqOQA0kQuGMC2mf9xz0uuCor3l6DvSb+i0iBljvxQas
         4Qgl0SVGY5WeK/yVdQNzMPvAiB4Ajnsmbx6EWxk0sQXzmbK5DuFEczfYivh0vgzaRN/D
         0ZnDmmPxDB2CCFW0lZhL6K9Jl9iVzyz83W9vy0rQvcDIJYRc/WCG8lxcJcq/ctIwigAv
         qpXpNKNOzT0bvgLj37npOTevnxQ5AImgp5MRd+mPRrfVMcqMYPiZ3fY5ly/Oxs1jKkrF
         ueHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773822418; x=1774427218;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHVZrM1FJjJMG6EOmvuffmsu/QLPzFL0L6ONcW3Zgyc=;
        b=JMl/7WCVJBGKHE10hqd+7VP4Qos5OF5iZrM5YcssxuVzSn7U12L1N9vre30Yscev5j
         SPs7LZUz2jKPs1C1cVG4mIP8SXkB51lXgmocH9F2wMvAJBG2B22gbzYqO0TGF7Sw0SFt
         BXtkMMDvx9bEtxhkERkMt8dUixTPeibf3iXUXewLf4aUzEaaWfz0eaK4TZsV6ctri2dX
         iTZ7aZ7brwIVXf05ccWnJPLRV64YYFS8/rrbR5GyVsCyWQTO/Qbwogl3+bZITym/jqih
         h/PHgYAnD5Cpfz/Y++LXxd9mZuee2t8DSqR7PeMRogWknZe8zzif7XTV5aBHmI46IO4T
         5Vtw==
X-Gm-Message-State: AOJu0YyZLbhOdj7TJZY4H993ckd9T9Z7NZW7X5A7c8ebOUaA5y29EFtd
	Q8iBr/LSf1yGOERiA0mdBf7d0EOTq0YogojPp7ak7p0SKvkKrrbweno8TGrfYtno3xZrJU5GF2K
	rZ7vep+ND+mC/x0GxatmMcP4jRyM4uryx7Z5nRARCmiP7O0hSnN+or4dKl8HC8vfyocyO
X-Gm-Gg: ATEYQzz9R6qsDLUwdwd5O87GfeFaQiJNntf6vlHPpRbRIAGze23E9zu4wbLpFlmmjZk
	0w5OTSLMBKGBzneEb/rjQ3do5c379ktr+4K30RRkq2BdFsCmPW3eeLvevazzouO3hknBCG0GJPj
	Om+joZc7vPdjg914PiP7CIbZXupQaenV+UvUySp63HmWChLR/5B8dJuZeUGFhgY6e5XMO/+bI9H
	R/2b9rlNZ3q/HBOizJ9K7VCLUrpiBR4NRPW4ugYlOk980xmsRzVVc/DQY6Y7G2zXwHw9tisxLEf
	4I8pt0IYraRl04X+3ORb9R2Du0NIkQmLLUVp+6smRcIxW69MH0dvXYU/alEIdK7GsiejvKyvSqy
	HSD+IPxfsNNplR3y0hUcSkyCZko8=
X-Received: by 2002:a05:622a:41:b0:509:23c5:3297 with SMTP id d75a77b69052e-50b14858620mr27351191cf.36.1773822418177;
        Wed, 18 Mar 2026 01:26:58 -0700 (PDT)
X-Received: by 2002:a05:622a:41:b0:509:23c5:3297 with SMTP id d75a77b69052e-50b14858620mr27351061cf.36.1773822417664;
        Wed, 18 Mar 2026 01:26:57 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f442d5c5sm43944015e9.10.2026.03.18.01.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:26:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:26:49 +0200
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: Document the Eliza
 Inter-Processor Communication Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-eliza-bindings-ipcc-v1-1-8f066c33ce7e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMhhumkC/yXMQQrCMBBG4auUWTvQNBCCVxEX7XTS/iKxZLSIp
 Xc32uW3eG8j0wI1OjcbFV1heOQKd2pI5j5PyhirqWu70HoXWe/49Dwgj8iTMRYRluBD8jHFqI5
 quRRNeP+vl+thew03ledvRfv+BYs6eKt3AAAA
X-Change-ID: 20260318-eliza-bindings-ipcc-c636f38f88e1
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-7ae85
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1Wmamm2HbvjtVnS8O838VC5NstfeHF5rP3WVC9YRpsk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpumHPi8nCLFvYNXw9xhZoE3Qye6+H/lRMogNdc
 fnPo4Vse2+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCabphzwAKCRAbX0TJAJUV
 VvdvD/48u/voDuWTFbhbmLpwoBxO2BRUPO/IXW6T1tNJ3jiR33C4p3I8UdU/4Zo3VWXdOvdhKJv
 5pIn2EqMT9hb/za1ey2iHGkk7l2pEXi26geY2EkmL6t+wNYoKPtotrYwdpnfrSp/eA72VXxY79j
 PkHOUOquBrVHhH5KEPwvOPMOU6g/5mQiARg8sfZjuobZfMDCcfqdnIWMxEM3XX0aMJ+PZkhC37D
 cS1SyvB3jBnA/pFYT2M9eTOmeK5V2DV8SNduO1a+2IJjT5Gul0kaW1rpNfqNz7ZowIuzCf/srD2
 vMhrTcfQMgWVgc9RTfveVuCkxV4wsI2EJbZyBPbOsjwIMjp8qF48zhIFpObcNCkCh7fzdLzwPRf
 gtn7iSVnqd3p5OFZg/KCx6wHGn4W4bapPodnFG/nNcGLmxiUdXrQO/R1EVI3n+dXSH627ekTwWd
 lldlXRck3HFC1W9BEbX4kZQGmBKJJkZE9N0d9fFpoAy1rThTC+VmA0g8LWLZrFvfpZYkBhHylN2
 z/wXkAwwxjcBLhwNWPu0MZ6AdnQkP/bXn911hEQ3TumhwLD7YfWCEKUNzZ1Ay2BRk0czFtfSRG4
 mGP+AAqw80u4tmAwHgBOb7fC2JXMgblKckW9w0DehoI7Hlxx0rVTjeaRFh101PnrlHVVKGg3Je0
 Ae9+P9wFnjHLRpQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba61d3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=niBqlyZWqo1841nPlcQA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfXxDloCC27hqA8
 HduuErjBaYOzjutduEMV0leuA2Js8TXPUHWZm7hN7sdIHF3mc2d+vOaHLqUOqBW5ZztJkHFP8nq
 fjUHUjN9tu1zZ63VQieZHzqFYgQC8cQdxJIsPgVae0OCmpZmmPfExkDUW3HxJytkjOuJ5ORC+7B
 xEx4dPd06YPKu2hkeKGay3pRdfnqw7+7Lx+mERFMW8V9K+ZUYIgyMpyY68o0/f4aBKjarhMeiA1
 uzVGkuqrnzG5fyYK3I84LYu6d7OVfIgsFmYxjYvn5L48KQl/I0bRlaiLYOKLHA7oBfqoDtiC6Lf
 ysWPODWjv60VnpAifFR5ZRWvvpmzTCKxLTHEKgzEIvmDaB2zB+FdqmSMGqbhMlHNaB+V/Oc/bhC
 Fm5tW3ba7fvKYbklAElpc3vTnNgp6V8Enuud/R7ycTOlYbC2ucTiFb/M+D7bBI+INrCfdNVeWFf
 8lEYcdVK5kaSVyBWnVA==
X-Proofpoint-GUID: YQ4jc1Vx0iPwWuD8YcAqUU8uGJ4JbTAB
X-Proofpoint-ORIG-GUID: YQ4jc1Vx0iPwWuD8YcAqUU8uGJ4JbTAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-98344-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C94AB2B8178
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the compatible for Qualcomm Eliza SoC Inter-Processor
Communication Controller (IPCC).

It is fully compatible with the ones found on the other Qualcomm SoCs,
so add it alongside them in order to have the generic compatible as
fallback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 7c4d6170491d..f5c584cf2146 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,eliza-ipcc
           - qcom,glymur-ipcc
           - qcom,kaanapali-ipcc
           - qcom,milos-ipcc

---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260318-eliza-bindings-ipcc-c636f38f88e1

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


