Return-Path: <linux-arm-msm+bounces-113920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ecY+EjfEOGorhwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:12:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1226ACAD5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:12:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mQ7nqszH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="YtAlKWL/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113920-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113920-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E91230241A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A712359A70;
	Mon, 22 Jun 2026 05:11:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87435677C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105098; cv=none; b=lqhWCf69WObV810dleg1HlekImLOvpjT7p4oWDzR4l9Q2Nl2+tbNwjzmS65UfYZ/DmHv2rURhclgIuySBgTru5+ET0NwcME0nrzFktJzNVSHG1TvCHUY0CUyf7gtpwiJXNbOg4ujR5z5sQJNylBGbfLWUqulNyUrR9FpcsDvZvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105098; c=relaxed/simple;
	bh=8DTNYS+P744bOozJQkgvmvf0NFM53z+xQfE4jjKNjX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lwus3Alma9kDAffHb5ev7GHBhN+7LDx16qa6Isr6qCvqp7UwybIrsAckJ8NVL9wKlbkIu1XlIhpkMibj61l2H8D2lYrePkl8Unic573HmQcChxYlq4Nbe01D9ts2DEDhBzr8NjNCoKY4WlHHkU31xExZ40LbhcZz6rMjwkSlaaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQ7nqszH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtAlKWL/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59BUU3850431
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNtxURgF27LsFZz4oh92b8xVTH9R5tBU1x6VEmvTsDk=; b=mQ7nqszHd9LYH8SP
	BDuD5bGIVn1qxJF9pLkhT1wpJuGgko4IcG4fWIQPfEm81ElYw4ibqEDk4gnV9Cu2
	Zmubmg343+KsV1O/0pyMKQW+cc6EOuWE//i6Z4qpF3q1+Le/X+gXnP5KLRxuVFB0
	GnSSawgp/hwmXMA3zewqAvy1sSq8w/Lu0hqzpHJJ2gtbSrIx+n3vRbtBmVkAyMOm
	wJhlkSI9d9CUptXG0W8ak7LBmxJHUUB/CbtcmVxhj7vbUz3df0PYASuYB+nbPZ70
	8xdDSdNwjI5nJ3MtyqoP4BAKcQgNoA4njnO+yKdjHcCiade6oPZe/eS1zW/MSsR0
	vZzdpQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm584n86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so2421895eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105096; x=1782709896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNtxURgF27LsFZz4oh92b8xVTH9R5tBU1x6VEmvTsDk=;
        b=YtAlKWL/b2QWOJj9dQ7mYRtmKAwNyKMRRGZYxG/Rb7mZLhjukHBR1Xw0pBzRU5JGwF
         R3xPJ4xKLth9NcnHoQhjVLEC2bRiZINKr1zKv/xrMBZXYj2xYCQedfmX94ZOR7COMWtZ
         1GKz180kEGBnQFA96jMwzfUOQiaLMZGPG/Ma/LbQZc+Qh2yhDwX4JA9KCQ7wUpneSDiN
         cbFL0tLXJh/dJExC4DZZohcGEjYXjZi22m+wzd/Aa1l/l5Jo6UkDemsoTdegFAPSYOak
         8GL4hvoM8o045Hwkq5l1UrpwWOCua01NdBSHhiKyQnGstdTBNwxxe/74kFvV5H1B3yXw
         aD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105096; x=1782709896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SNtxURgF27LsFZz4oh92b8xVTH9R5tBU1x6VEmvTsDk=;
        b=NcT/YXWyk27BoKq+eKSaEn8Oco9+RVkhUNG7ghe/1VVCd55rd2daRMrNBMN2WssajE
         ebOc4XE/5ATdejU9BR7wflWqOgd2uZs6Y4j2qmHyefHpcvCpyYRjhJXgdXwYVgVLsFUZ
         kI46QyZPgOQ0JOww3rvL4XyHUewagna3VvaUfWz4MYeY/SuJg4yHrWo8NoKzlvQnpwwZ
         nP48R3Nixdc+lXce+wfyt8eONZ6w0GZP3vXXEtPpJpMAESeA2wEPbqvpFcJ+YTkH2gf0
         1F6aYKDyqcF9JY0oZESJD34xtkbSi/2d5xpgQuJC7VR0ggy+YZ3Eq/7NEkWhWFWHzCCJ
         BltA==
X-Gm-Message-State: AOJu0Yxp1Myfl+WOwSc0HLAqxyJPVXOdojpM4hXZwpV7XtETv4vAfGRp
	hofrwggjuM75R7IWdXi30zy9ry50hPWwgLmV+kbHkc33b7i1243AtXJfg+FR+rLvECAMInz/3fR
	aZ7GVyjjZAtnJaF9D1B6shVHeu83GiN3itd0fOmmhCWoj2xOjjHrxZqqjZDuj/SyrOQj+
X-Gm-Gg: AfdE7cm6MBCRIHXtC9gw94yQQ0AY8bphrBuOv7etZLKSLCVklv8P6oJJjg4USST0CT5
	L3OajqB2VMXZpBA42eVRRP2m388Sd3ZXBHXJdk/ajflaL9a7D45/HDsL3eTEl2nvTySBYvqMshG
	MdvHvURBkJLrSnHikCznZlF9xMRwhS6oKfP8vKPDjOpGbtpDW6KCS0GgcLgG4WswVUi36z8BX9i
	tsyLSEyMq+Tym0dr4fcPOdJMO2x9zfVlSLkUfMcz3mr5/EA/9u74jOj8eqyrRXYVYJJJueE8xiw
	g2M3uqudS3+sz46TMaeEmYrmTgEeutvztJpGZJFNeKyyDPa1lMliw50GUQg5kB90zuVVZQ/qxDY
	zilyMED1MnbpJPuIs35OleBHCiYrEPK2FBY7NOSpoIhF/8ygy9UKZ0QvRbQ==
X-Received: by 2002:a05:693c:2d8d:b0:30b:e4a6:1ab8 with SMTP id 5a478bee46e88-30c0ceac786mr8884471eec.13.1782105095823;
        Sun, 21 Jun 2026 22:11:35 -0700 (PDT)
X-Received: by 2002:a05:693c:2d8d:b0:30b:e4a6:1ab8 with SMTP id 5a478bee46e88-30c0ceac786mr8884450eec.13.1782105095310;
        Sun, 21 Jun 2026 22:11:35 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:34 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:25 -0700
Subject: [PATCH v6 2/8] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-2-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=3510;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=8DTNYS+P744bOozJQkgvmvf0NFM53z+xQfE4jjKNjX4=;
 b=gxa6FLaSvv07V0PsJuGw6iKWlvIpksvtN6PIz4l3pwzBE+lc+R9+GJU6hC5KyszsZ/7vtAMuR
 t94d65KWkmLAOt/RAubyj1uWYzki6aVJaY+AeCsmqtVd/oT2JswOgAy
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: e_BY5yojsYMhd4x0-gBaXFag2GitdsVI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX/4zyLBJeQsfL
 YYRdr3WzN6gWz4UODgOVd+IRhizhTgBptGAi/9x8ilPtjQsi78ZkiwSnO5dLXrnO+hMFiWBUPQn
 K6YZVUUrejQ+L6frkBNjEoCXqb1Rsg0=
X-Proofpoint-GUID: e_BY5yojsYMhd4x0-gBaXFag2GitdsVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX8Zw6CMctsEFk
 t0VIicCZVTyoKpft4MYRPdr8egEXV1krtnqRvPRyL35UgeXbmPEmNpTPJALc/QeyrZpxTzKH38f
 K94KJDTjnwbjLEGrUs/Qzjk9OyRC0TLltetIbS6zaopJRkR0KSNN4o1BkeygsL4SI83VnuZEyVk
 bZp+lsZucz6zxEfR1p7TR3KbXc5Azor71KK4i6EmLj4sARAImF+KJAgoLSeGJdN7LVqNjMMQV95
 b37Vltp9IJ0syD0mQy+TbTsTtFgMQxIxr0o4hOzAdyMjobJ4khkxiVxtk9FTZ+x84T+DiO1gYj7
 VMNj6aJs6Wd9FgugQlXo+PlDHIp82JxQMUjXW9s1fsNVp/OdDZObgE+Whi/7rZq3hvoD5uTTrZd
 ISGtsryCXOk9nq81TQebB+8tGvgOsz6Fes0C9VWQ2vJESs8l52tcvlF1anrk43adg/WuezpxyrH
 wx1Q0x/dOyizMu+pgZg==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a38c408 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lXSjqk9dN1moIixwM0kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113920-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA1226ACAD5

Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but
has a different topology: a single QREF block fed by REFGEN3 only,
rather than the two independent blocks fed by REFGEN3 and REFGEN4 on
Glymur.

Add qcom,mahua-tcsr compatible and document its required supply
properties.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-tcsr.yaml           | 68 ++++++++++++++++------
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
index 16fc6ab87f9b..2b6422627165 100644
--- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -20,7 +20,9 @@ description: |
 properties:
   compatible:
     items:
-      - const: qcom,glymur-tcsr
+      - enum:
+          - qcom,glymur-tcsr
+          - qcom,mahua-tcsr
       - const: syscon
 
   clocks:
@@ -41,9 +43,11 @@ properties:
   vdda-qrefrpt2-0p9-supply: true
   vdda-qrefrpt3-0p9-supply: true
   vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrpt5-0p9-supply: true
   vdda-qrefrx0-0p9-supply: true
   vdda-qrefrx1-0p9-supply: true
   vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx3-0p9-supply: true
   vdda-qrefrx4-0p9-supply: true
   vdda-qrefrx5-0p9-supply: true
   vdda-qreftx0-0p9-supply: true
@@ -54,26 +58,54 @@ properties:
   vdda-refgen4-0p9-supply: true
   vdda-refgen4-1p2-supply: true
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,glymur-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrx0-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx4-0p9-supply
+        - vdda-qrefrx5-0p9-supply
+        - vdda-qreftx0-0p9-supply
+        - vdda-qreftx0-1p2-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+        - vdda-refgen4-0p9-supply
+        - vdda-refgen4-1p2-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mahua-tcsr
+    then:
+      required:
+        - vdda-qrefrpt0-0p9-supply
+        - vdda-qrefrpt1-0p9-supply
+        - vdda-qrefrpt2-0p9-supply
+        - vdda-qrefrpt3-0p9-supply
+        - vdda-qrefrpt4-0p9-supply
+        - vdda-qrefrpt5-0p9-supply
+        - vdda-qrefrx1-0p9-supply
+        - vdda-qrefrx2-0p9-supply
+        - vdda-qrefrx3-0p9-supply
+        - vdda-qreftx1-0p9-supply
+        - vdda-refgen3-0p9-supply
+        - vdda-refgen3-1p2-supply
+
 required:
   - compatible
   - clocks
-  - vdda-qrefrpt0-0p9-supply
-  - vdda-qrefrpt1-0p9-supply
-  - vdda-qrefrpt2-0p9-supply
-  - vdda-qrefrpt3-0p9-supply
-  - vdda-qrefrpt4-0p9-supply
-  - vdda-qrefrx0-0p9-supply
-  - vdda-qrefrx1-0p9-supply
-  - vdda-qrefrx2-0p9-supply
-  - vdda-qrefrx4-0p9-supply
-  - vdda-qrefrx5-0p9-supply
-  - vdda-qreftx0-0p9-supply
-  - vdda-qreftx0-1p2-supply
-  - vdda-qreftx1-0p9-supply
-  - vdda-refgen3-0p9-supply
-  - vdda-refgen3-1p2-supply
-  - vdda-refgen4-0p9-supply
-  - vdda-refgen4-1p2-supply
 
 additionalProperties: false
 

-- 
2.34.1


