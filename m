Return-Path: <linux-arm-msm+bounces-110131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Hh1FF1KGGpoiggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:59:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6945F33F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 923E63009B31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 13:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74284275B1A;
	Thu, 28 May 2026 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmE7Zc6n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hSn1tAHL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B746327CCE0
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976430; cv=none; b=PJQnFQltABgt7XPwpFF5GtbzHd9B2h+7RBdjVYIMo3Itur+5iZavOL1tEhRwRvsaAoRA8WCcrsqYY0RyCpXUm5ZmEA1LYIU8SEa0sBskcDftkQpjZm/dPw1WJDfvpSDqJD7hQhFwlB9xXpFlaYjseLdm14NMoeg+Ln7zGCUOAgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976430; c=relaxed/simple;
	bh=Z5jHEKYlnHq9blygIp04x8kPJ+G9+sAPZfircpJPTSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F6JnzOt6HyjexqnesVP2gv0VFXa5m/IVoqONQITDqSIpgRikLwIo+7BdKiOkTQE5VHr3xVrBtMUjJEuTP56A/kBNLyNh40AJFl7LyWFE9XKU3Kp70WWAh+kC2IFT74iJpb4nY41/REAdODWZNptnPzf2Av8NYKoimTrxF5c1p88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmE7Zc6n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hSn1tAHL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vXZ64016426
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=r8C5tBkc9P5qygIlEDIPmRkW+nBFHz9T0Fu
	3Uy/u1xU=; b=nmE7Zc6n5LkB847ukuW91Sj8tY1YA20FbeSXts3BqwN6Hkl9o3d
	zdRwbo4cHkFPkD1zb8WlOGsG4BiC1riH7jZ9D/ev6arhbw6pCPTBap9oZdVXcEGI
	zGVGYomrhe8xoO3LJFLL0JDN4cZJ5H8ZnCOxHeG05/cRi3uYHd3CVWkNZaDr0Amq
	Nzte8qzrkh3bw+xndkwcmQzJ/CQvupNW/tdPD0aNresZIIY7OACM/S0tjL8CcStw
	5Ckmr6VOc0LwP4C5lpr9aLL1qvPLRyzJTY/hhk6Os+vRkSCEOmdbEZg3GH6Sxh4m
	V99bWcdN/FD5lIWISyvwCQBVFdwTY4b+AEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y5axty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 13:53:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517288c4ed0so3726151cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 06:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779976427; x=1780581227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r8C5tBkc9P5qygIlEDIPmRkW+nBFHz9T0Fu3Uy/u1xU=;
        b=hSn1tAHL3ZUFEIiipJXcYRVDQ56BwnSkanXztbkb7u7/8lUxTw880GcCKbENsbQTj5
         caIAGm5w03N6IXah+bHq/EtmrBpic7R1MkT2elnauPhG8+z89uA88kmH0fHQhpMUFBS7
         LmsxCYf4h/iNMDw9gJtKQtzW3qY6NkfoUKcFbqPsblU557ba6caLnT+s5xBdnr2r0esB
         UR36lRNotOyPXKBLEPd4diZ/XMqd0u+7B/iwzGjzVGR7QCh9Dz8N9CnHJQ1ogIKzIDOX
         IAT5AXph/XHTo8/2VgWVR47ppXS6d/erRGF7ObNzqjXboD5NZ7SR74NybNdv/Qdx4T/s
         JsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976427; x=1780581227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8C5tBkc9P5qygIlEDIPmRkW+nBFHz9T0Fu3Uy/u1xU=;
        b=BhdkL1eDz6KEV5mm6vk+sLte3+PZtfmfSb5xUxb1MkIa8dC2ci9akp22rkDM3ukpVz
         YeY0MxkEiOqi0PVezlKjJF9LMzo/7K+ogActWbgmvkblRw+CevE8Yt1vcitR+C7DRyWr
         djCz7O9WPMmBf2CRQb/tRkeiKe40wnpq0QI+xrBaW6lVwxr2qySywaDFk0pxqo4Y6SuE
         WpXqys4Vx+YWSlkwAAFFaFZry2+uqSDWlkMibM+YUY9oiO3VCmcnZzjaLMe+DTUSYdTS
         UyZCwfhFwycR0wW+DMN1MFueG6daBs8RNqRyS1W/qEu4P3xKAjiSummNYzDqljV3pHLK
         YEBA==
X-Gm-Message-State: AOJu0YxTUPZ5q4WuJY9ukwQ6W82DO6YcNv6YRkoloWDKpsQZuvW9VQxS
	bV6bz/ZA+JWm5CcF2ULC3LIdqI2jrXV9ILJConWloNN2hu5cYGRl1+TQ8TVmqJi7bKX2ResxjhN
	RmAEofIpoyZSv1j8LK+dc5SPtUCJ8ibwopBUqzRgK6n6rkTigm5VppfCrH/fVechSUQHg
X-Gm-Gg: Acq92OGZ8sRfKK0RhhSvv4ycCyzc6wK3GGT3p15xGwaKL/Xq8KBoy8Rd4vNz9JvExvx
	iu1w1gAwDUzsZ28ILO4bvDaiTAJYRD4eAG+YfmEKpeVs3HdMYCPKVWEGofMGfeslDJC+H0stafp
	E+lQGgIaEihchUG51i6g3wRTi9v8a2VZC3oOcn26slVbs+uYg4bgBtefXqvUHSw2ZIxiNzwUgrg
	AWdgqLLRL8eKdjMLDGXY1+gzF9GJ8jS8u3N4pogu2em7hyPvDXBT9h/5KxX4GEddXZnvUFKSt3m
	rxAwgXzXpYGYIucJN1AbyUZdmgMP1dXVh/Aac2Np+OX4lK30tbpyaaxTZ78ovZsCmd6XK7LtcOK
	Ll784fdemZZawUu8sH5ycqkOWBvtQhDu/f7H3YTc5ScrKIU7nKOyhanXHanNaA6n5xpZw/8LNL/
	yHQlhT4leLOU8U1gF7YEutmA==
X-Received: by 2002:ac8:6f0a:0:b0:516:e5d4:f86b with SMTP id d75a77b69052e-516e5d525e1mr299338011cf.49.1779976427000;
        Thu, 28 May 2026 06:53:47 -0700 (PDT)
X-Received: by 2002:ac8:6f0a:0:b0:516:e5d4:f86b with SMTP id d75a77b69052e-516e5d525e1mr299337581cf.49.1779976426446;
        Thu, 28 May 2026 06:53:46 -0700 (PDT)
Received: from work.wifi.ville-nice.fr (62-193-63-110.as16211.net. [62.193.63.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b5a618dsm17225435e9.8.2026.05.28.06.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:53:45 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: ulfh@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mmc: sdhci-msm: Rename the binding to include 'qcom' prefix
Date: Thu, 28 May 2026 15:53:42 +0200
Message-ID: <20260528135342.11678-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OM4XGyaB c=1 sm=1 tr=0 ts=6a1848eb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xizqlaZpAqmNt8UN1ov9oQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8 a=doSvXZN1fV365kk4ip4A:9
 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: coZlUtcneEnYb7ZovYlomhkB9um1vrMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE0MCBTYWx0ZWRfX7O7ei6RZWaXs
 m6OXdA6frZwmso5n6Lm1HWWSDuf2Ln0pxL5EgspakVuel4pJNjozNedRctYVK3qZ0YDEd+jhixp
 WjJH6qrGV9sq0NTw+iyaUnYLDVsZo1l9F1kI4YizkR3+B9HPUssx7vcctGdqyGRfj9mF+FT0Zyp
 gxme4IOe6nBdyGIBcLndUKJkwJZ6+ZqDHAlMpY/rQTQjWRGxfm33d3TNvN3BBTp1rLSnAYrhWVu
 7HaIHde1b+OILxA2SIVN5TaRilWd8zVo7ICz4Qtr4jJhWfsTFVG0g4CfXmwAx5eQMFefokhPYT3
 FPA4JeDiQWEpO4+b+v52YhDo7Mf0fCro/xzS+ILDf/sNxRP+T9s4ziczH89Q9rEeGD1nZJk8wQE
 2pDzY6WiH6G8oO/jut0aTZco6yZW7diyRbYMPrKPOvMoVLX3tXmOcyOC9rIMin426IwM2qzwIkY
 eivVhqW/HjYFLvNbYPQ==
X-Proofpoint-GUID: coZlUtcneEnYb7ZovYlomhkB9um1vrMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280140
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110131-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,get_maintainer.pl:url];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B6945F33F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is the only Qcom binding that doesn't have 'qcom' prefix in the
bindings name. This doesn't match with the regex in MAINTAINERS file and
the 'get_maintainer.pl' script fails to list the 'linux-arm-msm' list:

Ulf Hansson <ulfh@kernel.org> (maintainer:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND...)
Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Bjorn Andersson <andersson@kernel.org> (in file)
Konrad Dybcio <konradybcio@kernel.org> (in file)
linux-mmc@vger.kernel.org (open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND...)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)

Hence, rename the binding to include 'qcom' prefix so that the regex
matches correctly.

Reported-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Closes: https://lore.kernel.org/all/20260526151003.p4kn2vek3hpv4gzv@hu-mojha-hyd.qualcomm.com
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 .../bindings/mmc/{sdhci-msm.yaml => qcom,sdhci-msm.yaml}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/mmc/{sdhci-msm.yaml => qcom,sdhci-msm.yaml} (99%)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
rename to Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
index 695a95e8f35d..cb16c08d22cc 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
+$id: http://devicetree.org/schemas/mmc/qcom,sdhci-msm.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Qualcomm SDHCI controller (sdhci-msm)
-- 
2.51.0


