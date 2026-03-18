Return-Path: <linux-arm-msm+bounces-98410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKAaM0qBumldXQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:41:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3652C2BA13D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C07F930CFE86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 10:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE6D396B68;
	Wed, 18 Mar 2026 10:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAqCBY8X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiQ+iM4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860338F92F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773830382; cv=none; b=SMvH8CSszeWJw9WCNTBm1rfpXHmIUYqDSMWe0iVDbFu6553Ja/UtJpvl/3FxE6SaY4OKn74VXIlV1hmvUAR0hjXe149bGas3NRhoPHriFYx+NSlC/pT8N/UPZWc9XmyQuy1f//V1Qg7kBzBXIWFWqyYFDfDbhr+8zi0wGbWwaaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773830382; c=relaxed/simple;
	bh=jCyonB+1fZunKZroLG/jUPB927eUidndoEqEUyDiepM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ob4qOMwPG06gfCl60x731V7UiYIMBWhb9W5c7U+B/4bCwAcDbC6YmEFq9a5YcWvOcCWY9I4+bd+Y5iALmwInvsmxCy8rmmOhMRsjWAi0s2qaEFumGoJEZ+fke0DeEjnoS5qPvVhfo4FaXvOl2AZJxwLn/VK4kNlDKGbMVefXY0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VAqCBY8X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiQ+iM4s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I7xq3K1049603
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+09mQG86GZTliBK4YoKWejUGxV8w6QTEnSqRydfNOo=; b=VAqCBY8Xcbh+Iaio
	wd0ycXy2AA0M8xb6wWDTrHspJEUs9vzXNT+ICpdUlqPpty9a/QEM6swnYcaHEv7W
	lpYAsDPtCirpjlXSdLWQZRnHfh8/hUbVm6d/CStUH5x3o7kEHHsUK4gjUcUie1Pf
	RA9bjE4HBYC6KxHeq2oAZRQivBZ/Z9PmbL6POQFR4zuduANzwCzjZWQCLpZT+9jM
	1uYeDnAD48ydKgGCWNmIX4472HGhxCXmM0XjvpAFrIEcTQSXegsEFBlTAFhOkP7N
	4Szh510eo1N2vTEjNjU3Q3A20Syvj65PU/DvpRcvWAJww8fuYaSoiyw5YwrkvI/z
	eKJvJQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4ej3wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 10:39:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50921f7da6dso14168271cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 03:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773830378; x=1774435178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+09mQG86GZTliBK4YoKWejUGxV8w6QTEnSqRydfNOo=;
        b=YiQ+iM4sZtdyVoeyUdNaHW7F18/ykqbmHJEEfYOdE5sbFCLd7NZR53k9yo39+GU/hs
         3LXg2LYz/QqIKeBlbkfxAeSv0GWBIYaUmrebD3xGK/Wk35tJr31aF1aAW9BmI6QY6Uzx
         tU5t63HIG/PdX1J15TKNU7wWJCmlEqA2nLC21H0n9nDWyqDuMgoDpxam0z4xaq7/k5+K
         Rw+1tkKsgLHOb2vtgvaszwJ4IftARoCLFfwPjGAnAF+LZjvbxqE/oN7f9CEF8vxQVx+L
         0YogSxqYYSIwNLh4+eIDamVv3s+S3twQqw4eTD2NmKOnUjOrnx4a4478iH5s5zuFywKn
         mYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773830378; x=1774435178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h+09mQG86GZTliBK4YoKWejUGxV8w6QTEnSqRydfNOo=;
        b=YnOyZJE3uE1IWM9fH7F/ZgiWdcmMfnGPKu2bt9/NjKR8p4P0Ubl/JCJX1xQMqx8qPb
         LMQoVphOASfZhuaxjXPcOHkmdjaJspF2mjLihHh9+1huAQ57i46CY0HxxlY7R93dlXWY
         ugYXTSz3N7+SqdIwepAPkUeCq6fuKtugquXAwYdmIh45JvhCnRQQ1aj041plsFBHFXar
         l8Z6LRGEIU/nfOILukVnQSqIzQiU4iF1OM7daEifprA6JCvsinwk6QVwAh8C1GNTQ83h
         f+rlEMMLjNVXvIxZSmoLMvJphLXdsChKY52eIFAuKnhb7V3LOTLJ4vWGLrcn3q5R74CW
         K5NA==
X-Forwarded-Encrypted: i=1; AJvYcCWPDEFxY1SM6+Dty4EHaCrurCKCZ4DiyATlcvGclXiDKjwHfQyFSPjTXK0LHCjDxNvp8nYgKsZJdeRyrcdP@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/o9KPvgMxitViN6lABYmXCC3EMdoInSXDkuma0WcBbMtU8k9
	WALK4wkounaMWCwR8o7firGPQdtpQo2irI2vqhivqtUDpaom1a4TADSD0eFR1qrTKs+0fW0Jd3S
	dnsE032PVXlTnOr+4AHWPR/r9slR379om3rUoPvbAO3WCbb3+7xlInboNpwgSwRwkiDPd
X-Gm-Gg: ATEYQzys0jm6OK9HxSkAGJkViG187EB58if3ScvhZp7td3+QQvBvPbFl/4evkkOSFIw
	WaXzZhIowislwklegS9DmOUhf4BjlR+MlTpcWzgtPdipp6yLc7xco8ds1DEKbOohEtQeWTd7QzK
	7P+YRrqUTStFFmxnoLvXtRPxGJ57r/Hi/q6SeDl5vuHNDu6KbeeoXP8t5gbtBQ2eus1ZW8gPqwo
	LewDvbEElkxDO6uXpy5y3j6aQ61hE5ggnz/pUcjiWhf98ewse3wAzfxNNX0uFnpsr5pmrTDsurH
	XI207vnO52IVfDw+jxfunqIcE4aCahfdiwcCv8n+lAilHlNBaeJzM4IGNf+9nGWyT6ZLCRVNynA
	0p/btpblR3e1Bp6PWw86BDz7wK8lApoUAgQs9uYBVQEme
X-Received: by 2002:a05:622a:1313:b0:509:348f:bc1b with SMTP id d75a77b69052e-50b148b4a71mr30529291cf.64.1773830377581;
        Wed, 18 Mar 2026 03:39:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1313:b0:509:348f:bc1b with SMTP id d75a77b69052e-50b148b4a71mr30529041cf.64.1773830377070;
        Wed, 18 Mar 2026 03:39:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm7300906f8f.21.2026.03.18.03.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 03:39:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 11:39:09 +0100
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom,eliza-dispcc: Add Eliza
 SoC display CC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-dispcc-eliza-v2-1-8c05581168d1@oss.qualcomm.com>
References: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8886;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jCyonB+1fZunKZroLG/jUPB927eUidndoEqEUyDiepM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoDibn8nH40oGfvUgbwfLQSXGi0yfX4kn3GyC
 eNzP75zdlaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqA4gAKCRDBN2bmhouD
 1wSID/9mvAKFiZBkOHlIX8UT/7OvSyPYrRwbzeVFpCrQAnzMUsMMDR8C6TXUWkiz2V3hCaoIJT+
 5PdqwFxfT6gte2wesRZosODq0l0LAa56I1xBhwD160UHfH+4M714zqae2r0rmMy/6yWO0bsRtZt
 Dasattj9Y9ZvsAD1vrVNde4bEkFWc4PqBtFX6VzlNmAkQv35aFX3Q0l50hdjGb4yxcB/bnVkC/Q
 lJkJY+KlzeHIFD0VEN9BxWJyjoJpHxWMjEarG2U+RaidzzvCMvqRy+Hmha6RgTLtHUJ+G7pxilW
 kwPk9B+G36rTFMbZ7FxoP0zfIPNydSuabVTRNFrxg69aNkkdjAZGSHNL9piJ3UmRWlDefi/iSes
 G3wiivMoX9HjHMMB4ukqyt4JHVL42Pax/GLaNyrBNiUxm8XgGXmuNav6RCGvMmEVCAy4yyQ7CnW
 OC7tnXI9iu49irFwi4ottTEXsZTKbguFAj/r6V2jNX4EiaVXZTloOoZUcdpUAQej5S/Z48B0KDq
 hDPM83hfZoGhXfA87x1nPX1W5K49ptt8w6swo1REI7PexJ745shlK60Do61LfAI28RUpWoq8HSu
 m4VAgPLWH31OfGninbh72Zo4rSxQ0T48yg6GO4N7G8JgbwUbeD48P89wd352iIDeWB9SpiuMpEh
 07+DRjxVlEnr0ng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=T4+BjvKQ c=1 sm=1 tr=0 ts=69ba80ea cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=I8plYztaKvtxx8zCzTMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4OSBTYWx0ZWRfX042h8JjeC1Ix
 DOBaUbQMdjQZbd2mgJCr1Fkn3R0L8TNAOYMFrM5FUj8V42LE6QR0epFOXuG9FivtfRjZR/5jzJn
 2qzGftBYKM0qfTaapzB5BVuVliJkl88LsJyy3+zxqoMfhb5xQLXKLXoOP2mFBMZXzPuG98xK3r4
 R1/JrPBYzXsWGMDJchuURGp33DAtIAJG6NmjyfbhDyv2XYXI8WgQu8ZT1uAPEtncwWh4gztUUWn
 L9zTTatDgWrfNp9hnmVxVUhoQlReuAJhQZ56/PNIaIPs/rUn6COY11IwSIvjErRAxT3lQMgLOzO
 DoQvVNbH1gMMCYDEcfVKLOLFTEBxJwyIl9aTWh56D+mQP37+gwwczsZj0BzjTWv32sLeaHaXgFD
 XIPU7gUS4zTn9cOevauaf9KE5fGlZfAyBlLp5rWkQLkUyuJQYg1zZl2X2GmZjZO4Q+HynI4Cl3e
 W9QL+0El1S6UF6uaDug==
X-Proofpoint-GUID: IPrnyFnnYC6s16RUwqx-uRP0e_5N197a
X-Proofpoint-ORIG-GUID: IPrnyFnnYC6s16RUwqx-uRP0e_5N197a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98410-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,af00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3652C2BA13D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for Qualcomm Eliza SoC display clock controller (dispcc),
which is very similar to one in SM8750, except new HDMI-related clocks
and additional clock input from HDMI PHY PLL.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/clock/qcom,eliza-dispcc.yaml          |  98 +++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-dispcc.h      | 118 +++++++++++++++++++++
 2 files changed, 216 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml
new file mode 100644
index 000000000000..1f1c7da6d746
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,eliza-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Display Clock & Reset Controller for Qualcomm Eliza SoC
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
+
+description: |
+  Display clock control module provides the clocks, resets and power
+  domains on Qualcomm Eliza SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,eliza-dispcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,eliza-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
+      - description: Display's AHB clock
+      - description: sleep clock
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Link clock from DP PHY0
+      - description: VCO DIV clock from DP PHY0
+      - description: Link clock from DP PHY1
+      - description: VCO DIV clock from DP PHY1
+      - description: Link clock from DP PHY2
+      - description: VCO DIV clock from DP PHY2
+      - description: Link clock from DP PHY3
+      - description: VCO DIV clock from DP PHY3
+      - description: HDMI link clock from HDMI PHY
+
+  power-domains:
+    items:
+      - description: MMCX power domain
+
+  required-opps:
+    items:
+      - description: MMCX performance point
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+    #include <dt-bindings/clock/qcom,eliza-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@af00000 {
+        compatible = "qcom,eliza-dispcc";
+        reg = <0x0af00000 0x20000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&bi_tcxo_ao_div2>,
+                 <&gcc GCC_DISP_AHB_CLK>,
+                 <&sleep_clk>,
+                 <&dsi0_phy DSI_BYTE_PLL_CLK>,
+                 <&dsi0_phy DSI_PIXEL_PLL_CLK>,
+                 <&dsi1_phy DSI_BYTE_PLL_CLK>,
+                 <&dsi1_phy DSI_PIXEL_PLL_CLK>,
+                 <&dp0_phy 0>,
+                 <&dp0_phy 1>,
+                 <&dp1_phy 0>,
+                 <&dp1_phy 1>,
+                 <&dp2_phy 0>,
+                 <&dp2_phy 1>,
+                 <&dp3_phy 0>,
+                 <&dp3_phy 1>,
+                 <&hdmi_phy>;
+
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+        #reset-cells = <1>;
+
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
+        required-opps = <&rpmhpd_opp_low_svs>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,eliza-dispcc.h b/include/dt-bindings/clock/qcom,eliza-dispcc.h
new file mode 100644
index 000000000000..30c6d856fa98
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-dispcc.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_ELIZA_DISP_CC_H
+#define _DT_BINDINGS_CLK_QCOM_ELIZA_DISP_CC_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0						0
+#define DISP_CC_PLL1						1
+#define DISP_CC_PLL2						2
+#define DISP_CC_ESYNC0_CLK					3
+#define DISP_CC_ESYNC0_CLK_SRC					4
+#define DISP_CC_ESYNC1_CLK					5
+#define DISP_CC_ESYNC1_CLK_SRC					6
+#define DISP_CC_MDSS_ACCU_SHIFT_CLK				7
+#define DISP_CC_MDSS_AHB1_CLK					8
+#define DISP_CC_MDSS_AHB_CLK					9
+#define DISP_CC_MDSS_AHB_CLK_SRC				10
+#define DISP_CC_MDSS_BYTE0_CLK					11
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				12
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				13
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				14
+#define DISP_CC_MDSS_BYTE1_CLK					15
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				16
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				17
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				18
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				19
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				20
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				21
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				22
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				23
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			24
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			25
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				26
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			27
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				28
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			29
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		30
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				31
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				32
+#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				33
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				34
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				35
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			36
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			37
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				38
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			39
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				40
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			41
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		42
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				43
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				44
+#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				45
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				46
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				47
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			48
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			49
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				50
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			51
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				52
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			53
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				54
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				55
+#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				56
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				57
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				58
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			59
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			60
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				61
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			62
+#define DISP_CC_MDSS_ESC0_CLK					63
+#define DISP_CC_MDSS_ESC0_CLK_SRC				64
+#define DISP_CC_MDSS_ESC1_CLK					65
+#define DISP_CC_MDSS_ESC1_CLK_SRC				66
+#define DISP_CC_MDSS_HDMI_AHBM_CLK				67
+#define DISP_CC_MDSS_HDMI_APP_CLK				68
+#define DISP_CC_MDSS_HDMI_APP_CLK_SRC				69
+#define DISP_CC_MDSS_HDMI_CRYPTO_CLK				70
+#define DISP_CC_MDSS_HDMI_INTF_CLK				71
+#define DISP_CC_MDSS_HDMI_PCLK_CLK				72
+#define DISP_CC_MDSS_HDMI_PCLK_CLK_SRC				73
+#define DISP_CC_MDSS_HDMI_PCLK_DIV_CLK_SRC			74
+#define DISP_CC_MDSS_MDP1_CLK					75
+#define DISP_CC_MDSS_MDP_CLK					76
+#define DISP_CC_MDSS_MDP_CLK_SRC				77
+#define DISP_CC_MDSS_MDP_LUT1_CLK				78
+#define DISP_CC_MDSS_MDP_LUT_CLK				79
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				80
+#define DISP_CC_MDSS_PCLK0_CLK					81
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				82
+#define DISP_CC_MDSS_PCLK1_CLK					83
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				84
+#define DISP_CC_MDSS_PCLK2_CLK					85
+#define DISP_CC_MDSS_PCLK2_CLK_SRC				86
+#define DISP_CC_MDSS_RSCC_AHB_CLK				87
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				88
+#define DISP_CC_MDSS_VSYNC1_CLK					89
+#define DISP_CC_MDSS_VSYNC_CLK					90
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				91
+#define DISP_CC_OSC_CLK						92
+#define DISP_CC_OSC_CLK_SRC					93
+#define DISP_CC_SLEEP_CLK					94
+#define DISP_CC_SLEEP_CLK_SRC					95
+#define DISP_CC_XO_CLK						96
+#define DISP_CC_XO_CLK_SRC					97
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC						0
+#define MDSS_INT2_GDSC						1
+
+#endif

-- 
2.51.0


