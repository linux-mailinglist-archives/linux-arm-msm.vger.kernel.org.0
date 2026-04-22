Return-Path: <linux-arm-msm+bounces-104041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDNmKhOJ6Gk6LgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:38:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7024438E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 10:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 248543052408
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 08:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFB83C1405;
	Wed, 22 Apr 2026 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEa09hAU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yd9d6fjp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAB53C3436
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846828; cv=none; b=rQDPQwqXHOiTUcOS+wx71f23IIgkLv4CCLcFEAy/k26G3Sq+AddJRfiuwcjqmVuhRhqO7773qittw+uT7XBbNCB/lDfv6sKs8Li+ee2yK8sDxkR8uOq7HW+MQfJvJIcthJ5Q+CETyCsIehK3skDYvCnvdHEOnjQPtadE/3hrUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846828; c=relaxed/simple;
	bh=rylEUKbgwwHeRjA0WoNIWuxgWdZxa5IldWTbxUUv8+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ToNNtsiFyCXWuMKnLNJtY4sqTXuXFSFwNLkjuTceVxDTG2wkCWkbF3HvmcBqNS2TCH1j5Nj+z4xfOeiemd9sZdKfuw6ijlYvWguuGfS/jAltcUJyba9RmGlBnHkrSxUojJ36j/osah407B7T+rTNjMdfX71ViRp8/eKypyhyhns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEa09hAU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yd9d6fjp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5IXuK2935424
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=KST2d59Unaq+ppV4P9iqg7KgECLNrAb1amf
	c3JF3ilU=; b=VEa09hAUwj9rBQ+4kgBM+a3217kGst1mHEynRpoOc7Ss1IuO397
	11VuEbbvNP23kg1lQJLS7JfpkNf/WS4xT+LxCxMJMafaUeqavMs2A15KKkRkDXT8
	3jo2v28ThWBUkS6yEC1oljNBrzLO0QZjG9kCosGbIJuCKKk6LR0OcGIoyzP+8t8j
	hWageFbamHoJ+gLJfULVKU+SN3yEYvxLTF7eNdF2XZix2IZNJQIX+mDzCwkcvStw
	9XitK3oSSbhPAGM+KR7tJ+MqvVwclX94+GSk3L/4ZbV//eS3ZRvlbfuLUB9XqcrP
	aBh2Pi9rMWUlB8K9NwQcnUxH5GPwLnnlLPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenkagbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 08:33:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d58bed44aso94698341cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 01:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776846825; x=1777451625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KST2d59Unaq+ppV4P9iqg7KgECLNrAb1amfc3JF3ilU=;
        b=Yd9d6fjpneEI/wg87ocMTKNCeQFta2SRpO9eIOOhj9SwTf63IJrnf+bHo37g9mvG4z
         I0knk7699zLDvG+f2sSScRjKtnn6wDBxWBYn7OtnlOoHML11KHNXqzteioDqwmVT6UyP
         iEcS0NB+M4QYktuEABXwK1KsAZ05LD6VthmF0tq1TIOVx86s16KBfVrVIdvinxaHsjiD
         XqycMpaQYxDnDHQSmxLGeXLkcfSCyoXsAzbLsOQaNv1mk8kCExTnLrosMqtqVhnMxuDo
         IEwW3oJD2YXmQwM55IQBKVlHeXtdYjQBLwXaKEFTL6gUMrcDjUIDOJpwB/W/uLf11Wfq
         DkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846825; x=1777451625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KST2d59Unaq+ppV4P9iqg7KgECLNrAb1amfc3JF3ilU=;
        b=Ikp9AlDAOGiLfZbGdvz0OTZ9HE7V/2BKqB5hiTrBEwHgS/MybzVXXv2yqzqjsY83y1
         4O/S8KqI+P5OK53wHED9ZAQb2Macir/6Jk/gziJ81ip7ulApu/MDBQKjRRLU2I5S5hME
         265IwC+NRDT8sY0TPIRlof5dsDJLDCcwinjZeWG06tdnJoXbxLdIbudiRPp2jBRgExj9
         is8oAY/M3I4401F/k9WpdxxN538xOb/naHNjNAep7O6PRJWbXUGxOsLa6cp/1QNpFuw1
         quDFu+kmhT5LfZgFlG7WDG+mZx1UuyBO72tPOZEKM4SKRzfO/Wk2QPpwoSWN6fUbTB+L
         Ao+g==
X-Forwarded-Encrypted: i=1; AFNElJ/71p9GnEqfuXmEKtKp22XJn37gGhM1UkSLFE3JDUa6YSji0bfv5O1RINC5KmGqjNyOZ5nf2C4La/2jSMqu@vger.kernel.org
X-Gm-Message-State: AOJu0YyD0MiEoGLjD1+IR+cUzolek6v2XMUOacsbo0g7CSiqjm/2bJAV
	3h9Dz5oQf+QOtWNoTZCc2zDd3uJHNS7ZwheJROOkhDyTWBD0OK5kSE6v04NwD3/SbXxAlfORtVl
	eonCjLhb6SxcI+3U2yAsEyPwuNCferMKALAGAglcL8L3nTE+8dYABtfiJldxPEMwcBuEZ
X-Gm-Gg: AeBDietwI7skzDb3zP2AV7eRBQjXClwlo1aFXaveQ6YmZUzC2GLhgoiczr5+WteRg/y
	6dQRyNc3+YjbBaSCmVn7X3yj2rKUYzjTMn0W0knHmSeHK/VGqWRcMjh38ArxDnXhzjgkCB7VUqQ
	ODjvnIpnYxFWAi1bYxZ8kj/4K4rB6Q+skau2xoRr55auFVuzZqhrDhR04tJnz7WXUo2xcCs3aXp
	s69HfqtK6X9CuZDbhDCI3e3ZmaQBuL/g9fH3q2dWvLMFualgc5mNsBV8bNue5C4YTeTfyREBQx8
	hBDGdXNBb4ZdSopTJ9BXpnQtpMF7ZJILsuui/1fj/BCs97UYJgxy2RAEDBs8W5eAes6klChyQOb
	FYvsW00HDGa2o3mr7oM1n+0uqpGILH2Ay+t4H3MPtyqIadq8=
X-Received: by 2002:ac8:5712:0:b0:50f:c26d:f314 with SMTP id d75a77b69052e-50fc26e28a3mr18829921cf.57.1776846825644;
        Wed, 22 Apr 2026 01:33:45 -0700 (PDT)
X-Received: by 2002:ac8:5712:0:b0:50f:c26d:f314 with SMTP id d75a77b69052e-50fc26e28a3mr18829571cf.57.1776846825187;
        Wed, 22 Apr 2026 01:33:45 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1405sm43546621f8f.4.2026.04.22.01.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:33:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pmdomain: qcom: Unify user-visible "Qualcomm" name
Date: Wed, 22 Apr 2026 10:33:42 +0200
Message-ID: <20260422083341.84390-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rylEUKbgwwHeRjA0WoNIWuxgWdZxa5IldWTbxUUv8+s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6IflxahORMoRUI39K2uOeZPQxfoifYoSKoDFA
 AcLMjqAv+CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaeiH5QAKCRDBN2bmhouD
 1/+/D/9WzwcOYsXsDtnLE0UBvKnjHD8Z9zvOoca3S4ybdArW9FnedgD//msZuvJZt4wvUvymgdd
 z+fMo2mN5uZxsYXoaNW/IF15jf7u5zBQzJHUuj96qMAjcxFEWNJ5ZWvbP0Mp8c+J9GscfiBS+MS
 8OcwD5OD/MhSimXXeRjt1JTaOvpGm//gdcG7h0csNfLH5fWloBIfe+KFdnggTIyroriUke/8cnG
 sudaiHICg6CD/wPGJzAoU01+LELe9GEKhUVDfvlETXyGY9ukzP3fLnj1biSxO91h8qSFb1biylo
 BttEICehl0wOIiIJ3GiOpzkgr7IbM2YrCGK4RNn1ep1SbT00ydCDYnvyQNr622MZ5/sNvI2l0cf
 o6P/BmlMzbTojKO4ICgVEwJTade8cvd7d/ti86tp4B3WZp3XP9GO/qwLZ0unfmU66y7JXJzzPYH
 iPZ0lMli8m7nHRIrfTvuoTPfaz5fvkPYsTAHE9vp93FhnEnzJvA9q4azA8vkLpZyQfYYL/zFnob
 5W0eF7A4Ra7XeEl7q1wzm8jJkH4e5INdta3YmoNkUf9gJHSLu3ObEN9icveg5U1U31kpXKkMc1B
 +VxVVVLZjLCNgv3ANvhrlYCj08hW2cJiSCvyjMRZi4YQ/5nO55G02YcvX53lKFodeCnJxatgWX7 zcLVZG8v2hz2M2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3z0MlC4lENLxyWOWWVi6GGm4gR4n4BCf
X-Authority-Analysis: v=2.4 cv=SONykuvH c=1 sm=1 tr=0 ts=69e887ea cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=PweoiM3H775_Lt3OcnoA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 3z0MlC4lENLxyWOWWVi6GGm4gR4n4BCf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MCBTYWx0ZWRfX2dLE0THILCPh
 BCzOyPl6Vl3n7OTaF/G/ZKFCX11FpEPz0kmIfQdxR8knytmXNrExVP2pRVmGBQ+2KpG3aIL+yn8
 CDe2+rf/wShdq5HTJBM5hKJvhAKih5sSVFZKY1xYmPBP1lLwlVX7Am3VtA+j+/ijBUdjgtEOOgW
 p7vvKvHzPUSK4XyTuJeUJ5dV74wA4I7xg0toyoG53OqYxGOj+yTOugQnZN2ktB6nDmH8Om4HdVr
 R2GlnRYjenbz7wabfNGS8daHrzq23PDiwpNjAh49JmyDyoOOuhsrA8hoYGjQq9VkzvYWiHcZPWD
 oQ4rkxEzk6RcOmWVKZ92meqwgXLH0otpiE3SNV2oq5R5tjw+5Xffd4vmS0hR+PpiNtPr2WvBzuA
 e6938MweTY+F3i7PxHPxf45xbGGZR0X0gHAslBonqQnJJ9UKv/Vek0VRTh/JiAxLL5oYcQDr6VM
 VRy/GbDLCgZ9cqF/9AA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220080
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104041-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1F7024438E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/pmdomain/qcom/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/qcom/Kconfig b/drivers/pmdomain/qcom/Kconfig
index 72cbcfe7a0c9..4abd43a88d08 100644
--- a/drivers/pmdomain/qcom/Kconfig
+++ b/drivers/pmdomain/qcom/Kconfig
@@ -2,7 +2,7 @@
 menu "Qualcomm PM Domains"
 
 config QCOM_CPR
-	tristate "QCOM Core Power Reduction (CPR) support"
+	tristate "Qualcomm Core Power Reduction (CPR) support"
 	depends on (ARCH_QCOM || COMPILE_TEST) && HAS_IOMEM
 	select PM_OPP
 	select REGMAP
-- 
2.51.0


