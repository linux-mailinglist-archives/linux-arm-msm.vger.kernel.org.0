Return-Path: <linux-arm-msm+bounces-113139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iq1KBkfDL2prGAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:17:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35D684FC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:17:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cEI5Z90v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=H4BgJfsp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113139-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113139-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEFFB303F7F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D38C1F0995;
	Mon, 15 Jun 2026 09:13:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9983C457D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:13:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514787; cv=none; b=VZVmhw85NwkQamsGUO7YXi29iYC5Fyc9IUO3zw5rjSKdawRh1ySXCMY6NB4Qk8IMVWZzE4gVGWDf2WvUXCCnp24IFcXciMkbqJmLuqJltucWKwcLAFnZFsKvG2s2RW5yuYWwKkAQwESZvDbV9lOGH60wkGFeRGSi8nTkPOR7V2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514787; c=relaxed/simple;
	bh=Ao4k8UCAQ63pTsAXW+nwl6jaANXflQZYV4NF+HzDpas=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ojq4ieSDpqNWMDTHaehvnedHT82J+RG1gR5BflsV9cfjDgIGHqB5DNAVYsKlkwL5fYDEvVVCKOeYzWaXSwrA4H7ocmI7EBPdZO9VQHcKW76FrwnrylOMTOwoQ/vHYhJ2Z+Jrfe29NFNXK0YGKvXN6T2us56ctZdeGn6poRfNvbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEI5Z90v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4BgJfsp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LkJV3853254
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tx+tU+JavHm
	9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=; b=cEI5Z90v7sQGWvONHb8jO52m6wC
	fmgZoRLcJOYeNR4JlBUnoH1tAl9QUjvCJ7mfFmMSv5Nx5oFAyVvQzf3+OxJaQFOB
	+ppN3Ym9Jw3I2rfHBKVSX0fdojvi+nP4wqQDejwiqO94BEalzIaoPj/FkXWZJcYR
	8aiyBmCzQlrHOOZ0X/RxHz9JWGGoqFnMyXdxoj4XbYWEX3jjZYMUw7Ib7heFaJlO
	c52ERPg5lDqV9D4syM2fHYWM2xWz6+OI+XLVaDJL6mkAq4wZXGm3vc2cny5/kD/n
	DBT6XMGO7vP5dyJA6FpRQ9uKKe7Rpybx0npYWb5aM1AShiFNkGpSxdoUhSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gxnw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 09:13:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so23248295ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 02:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781514781; x=1782119581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tx+tU+JavHm9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=;
        b=H4BgJfspnRauDaG7VACJHmQnuQRqF33M2r2onv2ap2xS0WBszVkH9UkWzG4cnPIfPv
         vVsHeJBRsmBGPW8trWsPCbJzhiOeLVj3KPiGYpzJp3VAY9kxqXJHkldCQXKatLckCOlV
         f6bghKNmDCaYIMoEvwTR+kUDkHHIWBPTfgI8hCMMgKZOtpQQzpEAz2uQChEEwwL6w8pa
         eoqU8LSTeKGHcAucIQIv6AN+T6LuKSqhDszTmS2ovehj39ObcHARYhCZX/mqAf1oPr2F
         ovQO7o8y5eUu+vomuTk7l3Y6eCO8SIaturSlJSSwB9pJ4tGTSd8tL5gkuAmkPSr7KDPl
         TPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514781; x=1782119581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tx+tU+JavHm9jlJKkOPRaMWM/yiGuddWBQeSbrpsom8=;
        b=AiduvOD+QlUYNzPKOWAEdp4O244akqyT/8HeFXuIRapsKsh2MPjZDed124EJcBXgpf
         vy+ZpD+HrYIXizOgXHgB7+CAY2yCGfbNH/TS1nv7dZ8gPEzpS76Qf3rVwJ4kC1l6uNOr
         rJL7I2BXUteLF52YutCPHDKyisUaeiZBSfn/bJKvvc7GBDUAUpRdh+uTAXGs1N2vu/DU
         gXVp3iBDywGZA7itZgiHLEtSSG6h9C2RTtav37QRnbD2QUqlXDbWkdcIru0nqEtDvGAu
         WprBY8YaGQfNSDZlFJZ1M9CVZAF/kC38hsdPJbYW/pqkWg/DYYA/nT6jTC+negntMaDR
         vfpQ==
X-Gm-Message-State: AOJu0YwmHBGAvLc5fQOgEt8zR2T1l0fEIpNVa9aWb2lKU0rToZG/iZFQ
	P3v8sckegnNrT8LbVlIY9Y6iw52PDB/fpSq8EzNW3OEc5QEvhcVH8Xqq8EMyMh1QujTIDV9J8tj
	bY8GnYLTdSiXujgFRHO0AaqQ0UT/YtnrJ0SiHDHV+PNbbxwKk8rU2zXScDilMys/By89o7FxYAp
	/f
X-Gm-Gg: Acq92OGaGtXc68z+JWXAtis9FY9/Iqf8002SF9tXeQ/DkiDRHzDxyrSdToDiSjlUyBx
	9OM+J9ZOv0neqoDkd4+dW89kJ4wALQmeY+EpEx/oMJ+2Cw/jLicFMcR6MuMaMxngG0fZYyqbR+n
	OYMVP/TMSL/CKt/sAzr0RhWYg2hMuuMj0CN4k7k6biytSF02QE6uFpXmOTV0Kq7QF+q5whqXzts
	Txu2MfkRDRqDQIq3B9RCxXQAnH9Pa3AD8jOuVKBgRJBW+MQ0EMs9pxCdAbmIdlx2FnEd4fg1iRB
	jurg6IzYtZ0KzO9Q+JgC/4VERuEKO0zEho9i0LJ1Q+cWRndCxClaPyS/TsmI/XpdA3LvMBb1SPJ
	2Iqh7e8vYcSoqHu0Ug1bG8ldXsX0/3jrPBiDat3mM2Ex0p4D8k8s53g==
X-Received: by 2002:a17:902:c941:b0:2c2:78c4:b74e with SMTP id d9443c01a7336-2c411d79d0cmr150200375ad.27.1781514781368;
        Mon, 15 Jun 2026 02:13:01 -0700 (PDT)
X-Received: by 2002:a17:902:c941:b0:2c2:78c4:b74e with SMTP id d9443c01a7336-2c411d79d0cmr150200005ad.27.1781514780889;
        Mon, 15 Jun 2026 02:13:00 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433079999sm91669065ad.66.2026.06.15.02.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:13:00 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Palash Kambar <palash.kambar@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY compatible
Date: Mon, 15 Jun 2026 14:42:41 +0530
Message-Id: <20260615091242.1617492-2-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260615091242.1617492-1-palash.kambar@oss.qualcomm.com>
References: <20260615091242.1617492-1-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfX1U8xb5WnprrV
 VkkFzEr8akyh1HNmIvtnkCs1nRtyTUUHLVc/PHh5a4kEIGc4LbLgO+boW5vjXHQHa1Hv/CaIIPS
 N4hhu7dD76wFCBG7yUGozRVQVpfVDEs=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2fc21e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=MMZtLZuhhDi3SW52_uAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5NiBTYWx0ZWRfX8gaaNdHWa6fx
 r4YJgXTlGIIHnF1gML00OuenddFRxYaO7aR2+2kqXbCFaYMgWpe/YTlB445LyWT+fCpNKsUd0bL
 F6LyYP0eaF7Gu7zi9d4cra5KCOja4w7wHd2+krmyQ8S6MYybd/EplgH2kRO81Y28M0evU4t2PyY
 RNln7GHKn2ssD+JBmV8dLOroY4DoRhYaGG7Y/558p8xypKWMq7Mo22CAFXWV13m9xPbcYAkRbEW
 XbnyqcB23Qsy54QsLLBvIBoaC344Goest1WaxO76HJvXZfp05/Wt2mcJlsAerf2Pwuyanr0n296
 gZ05k++r7ScVX4hHwMOjHdEITK4g7fGng7TUpcnKZdwtjCKTr/xOuLKrTn6LIpeotVqBf2hEhzd
 KkK4z4s8M6YKPQKo1Bf4PgO9q02QEBUOW2XQuZwOe2/GQP5EaRTvg/dZlQmsGuUECKJH+JOlhYn
 4fjAqM2MRUzFnu9iAew==
X-Proofpoint-GUID: D-eC8hm7OQKh6hd079UOyl6iJZCqLZj4
X-Proofpoint-ORIG-GUID: D-eC8hm7OQKh6hd079UOyl6iJZCqLZj4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113139-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:alim.akhtar@samsung.com,m:bvanassche@acm.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:nitin.rawat@oss.qualcomm.com,m:palash.kambar@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E35D684FC0

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

Document QMP UFS PHY compatible for Hawi SoC.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index b2c5c9a375a3..4efe40c0dc97 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,kaanapali-qmp-ufs-phy
           - const: qcom,sm8750-qmp-ufs-phy
       - enum:
+          - qcom,hawi-qmp-ufs-phy
           - qcom,milos-qmp-ufs-phy
           - qcom,msm8996-qmp-ufs-phy
           - qcom,msm8998-qmp-ufs-phy
@@ -108,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-qmp-ufs-phy
               - qcom,milos-qmp-ufs-phy
               - qcom,msm8998-qmp-ufs-phy
               - qcom,sa8775p-qmp-ufs-phy
-- 
2.34.1


