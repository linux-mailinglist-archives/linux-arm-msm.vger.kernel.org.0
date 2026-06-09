Return-Path: <linux-arm-msm+bounces-112017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2WiLHnW5J2qt1AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:57:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1537765CFED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:57:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gFr7uKY8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ze3KlvEl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112017-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112017-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17CA8304C61A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 06:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6163D5244;
	Tue,  9 Jun 2026 06:55:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A728A3CF1E6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 06:55:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988103; cv=none; b=BO48SyTHoaoBBjTsJuFonxHfFMXmdhrCOlJwQoiN4jKeCu3ed6VetWJRjOCxtnqOsOZ/ZYeO8+C10MfP5qqJuBjoCnevfjZoGGi8ofkixcrjqZwFAGSLAMoUOjSGyL6gjdBpZ5DbpL6ogueHcYTOG9d+lDAOUbz0t74skMwemMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988103; c=relaxed/simple;
	bh=to5r01E4yNOZlKCiXJbFoRfL797dldzR1knX3M8uJLE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cvyTBxUslO9TLlY/bpNChvAHahCQ+FtcW9aOkRbT78DkDtjUVXAy904j6rgwQD+2fWQ8qE0DIfxwRmBb03fzSt25a+TplB+W3CMQdgyrFmIRq+A9QDdDjWZZPFEK2xOUuw8ZjqHSwdR2oHkO7/BxvzgJ0YPZyv7+o7fw4X0qvmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gFr7uKY8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ze3KlvEl; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596GBCU1736463
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 06:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c/g4sSpc+Sy
	20+048o86PNPCNwK2/z3cWgWlvqarn5c=; b=gFr7uKY8Nm1Et9Z9AkOK3Mi/LrC
	C73sEZSdyenSYuYHZYpAGaEx5T9qWoF8id1HnRIquHzSznjPBlc9mKTrfmp6NSzC
	wwe1NuO8ggiXZ4hNAxrf04A6QwTCI5RWXBIwUQA+2lTcVTt4hRc9UgOLw3mUxx/D
	4uI+gO0mX0daSRJt2NHE9RPCKixS6cpN7pbNwB8+7tFPj4YoTuPBkTYBlxm+wMXQ
	Wd5BakHIrB8M4iDfjBQKfuPlvEw4R4QjLVg7X+SN6TFr0NttI8Egx6G0ZNKThx+W
	YPqYbdX51qYcYgfn6iZYCdtZ5h8Yzk19OHF9+A+QHZDoRfdP9derGvJVHog==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds85gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:55:01 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85dcdbe502so3450275a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780988101; x=1781592901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/g4sSpc+Sy20+048o86PNPCNwK2/z3cWgWlvqarn5c=;
        b=Ze3KlvElQaPxbynDbUmD9jJdFMxnfgclBpu7VYrFJH3g12v0XRy0nFSGLeEOqgdHva
         RuUHpog3ZvAFER+oYpwaef8dt26SPHcgnWiYaBOb2mw+2JkLwOShOZX1REtWHdUQh3oL
         kMKKb59dT/rY5QaFKEaSOdbKBIAvyidZ0vL2jQPSPf63fiHgDYgfitVpOkn4yH9FB2md
         hzqiVHZiZG7TN8YEXLGGBqK7tW9uZ0l09mU2w3IlTBW45tqK0uzoGIYgJHvffJI/thYk
         MZ6BF4Q92dDiT5wxIwr0wQGCRqxsz1zvxdjlHVCM0h4L2er3wHzYQEJfrQTnu7AgNnNi
         ldxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780988101; x=1781592901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c/g4sSpc+Sy20+048o86PNPCNwK2/z3cWgWlvqarn5c=;
        b=hYmn4R5UqJSbc+E6qpJleK52rwhX7TquiIVKueMjeDjkJM1nRijmtsEUnKHBqeDqRS
         TirGBTrnsYhZgueyPmOUr4ttC+DcbKNfmNSCBvNePIrdOFMQJGlEFqpB9OYvuvSFPcob
         EySTSKmS38HI8B6AMUwkmVGJIzX3d7jWABvpCpqSH2TeovdAbHxA/MXKxvAA3IBIRA8W
         DAKkRAXI0UHaccV0dHR59G4tPgLlBjsvr44sGEXpCctIPqaaimecOHNMLuhQ1ylzY1jr
         1/w6BZBEyLPggeVINDKHpFikpUhgK8Ho6+0P0rTD8jdhGAUogLpGRphL2a4/k0l3V58p
         QixA==
X-Forwarded-Encrypted: i=1; AFNElJ9iU9Ks/kxWgIQGKt0jAQrqBrmsr+PpvkARmUxL0UiA/+HeMD8GAz5RS/JJZnmb4SP7SO6/OFbR2Qr6uLZc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpu+y1OiMK/vOyefMVVD/FAg+YX5iTYzE8ahddb3oplV1VEafl
	A/8d87vKC8W5THIfnjRzk2/Svn8gEbjbTgv+jpe5UjBbqLC9/nn0lL92IQUmdn48IV/fI1XMWwS
	xWnVuVRGqiuLz+7aMPcXMl/+b147jN1bMzBnjr5NT1kGgxX0X5t2+5Alo4dXBJkJhUSUc
X-Gm-Gg: Acq92OH0g9ap8pKNXvZx50VHVw3EK4jirj3P5o65loWO15AydNS/+XJD/KXfSws5EQ5
	2AarhkRqREoXFJlfrSmLLtHFIECVFLMBLMfjdFHzm10d/++WQPUh1ahj3ZWmwDo8teRbreuSaGO
	WO19W6Yw3FYhh7cH6K+Spxf4iQFBll5zzAVEz62JkS5d+8BgRDCvWyUghn3xttC+p7XiCL4VXFs
	hWtyOBhjV00/wd/jjLGYk8TAUTVvHC7xlj37iSBGGzMHCJZdflipYvXcv6k527OZZLOuHaXB76o
	NEYas+h6g3DtOHwYR7YqSrruMgy4DH2xcgOIX9Atn48gfelDbH5LyF2ajaycpGBw9J5zlTA4LkO
	fskzeBoy2QPyuWzdDluGtWeBqne7lNXWJAxz4JkpkKm5GbmW0Z58KS0gBG3ch5Osbi/UcuQdNCu
	B4gD0UtarSyvpr/7UdaE5Yri9Bl3/2Kbjjee2FSKETNufzNdTlf5V8IgQzZAmFKw==
X-Received: by 2002:a17:90b:4b0f:b0:368:78da:803 with SMTP id 98e67ed59e1d1-370ef0f15c3mr21274085a91.12.1780988100622;
        Mon, 08 Jun 2026 23:55:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0f:b0:368:78da:803 with SMTP id 98e67ed59e1d1-370ef0f15c3mr21274054a91.12.1780988100181;
        Mon, 08 Jun 2026 23:55:00 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712fcb3a9fsm8607926a91.0.2026.06.08.23.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:54:59 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible
Date: Tue,  9 Jun 2026 12:24:46 +0530
Message-Id: <20260609065447.4024695-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609065447.4024695-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260609065447.4024695-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7r8Kh2-N44IV7i9nWp7LhaYSVoyQAK8W
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27b8c5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Cj70nMFs6DzugLwqs6cA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 7r8Kh2-N44IV7i9nWp7LhaYSVoyQAK8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MyBTYWx0ZWRfXwCkK8PUgb1UN
 NDAOWb5bu+F1q269Ju3GGJ9GExKZhsae9wGo51NcmgRrPOE3Jf/qTsrGmd5lYs38LMTpkir47ai
 sQtZAM/Lje8v5UyA+B9Qh2SKCvbXmdSkeZH61zMGtQ043S4vDLa1Q5Ri79tTT1vlz/ZfDTgDuLt
 L196wyWSxg4jUYRE7+JHh+P2aCW9iRfsiZ005N4B2KgFRPTLe46fZFJNSmzQcccjrNs16i9KnQA
 9laXDLP9gBtXGgqR26OuShj1cPWEHl4BuB8Ci6bsN+dimEuzMoT2LdOhValGM2aLIBbYvGf44qk
 wN5RObJQKCl6YhWU9vdbCp1Vbj5O11F8COqbN0xnKcZ39DoOJ6Ppkjmeg8F+nOztKUyuTf2Op6h
 vvIqRagEXXNYDcNsT+/4XRFXSs1z/zJtfrKz5QekSSoWDZwB9mNWZsk+N2V3qnUL9rzOy1p5YZJ
 VCXAkLPEfQRlhe4RNQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090063
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112017-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1537765CFED

Add the compatible for the thermal sensors on the ipq5210 and ipq9650. The
ipq5210 uses ipq5332-tsens as a fallback, while ipq9650 is added as a
standalone v2 TSENS compatible with combined interrupt.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2: Fix fallback definition
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..a927650c119b 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -92,6 +92,13 @@ properties:
           - qcom,ipq5332-tsens
           - qcom,ipq5424-tsens
           - qcom,ipq8074-tsens
+          - qcom,ipq9650-tsens
+
+      - description: v2 of TSENS with combined interrupt
+        items:
+          - enum:
+              - qcom,ipq5210-tsens
+          - const: qcom,ipq5332-tsens
 
       - description: v2 of TSENS with combined interrupt
         items:
-- 
2.34.1


