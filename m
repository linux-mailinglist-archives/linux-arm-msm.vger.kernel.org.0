Return-Path: <linux-arm-msm+bounces-111167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lHQkJFJAIWrhBwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:07:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EB863E589
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 11:07:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="FJ/+XyA7";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WkLu6D+s;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111167-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111167-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0832C308A931
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 09:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B343F6C59;
	Thu,  4 Jun 2026 09:05:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528BF3F5BD0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 09:05:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563951; cv=none; b=hzYKKsrpMTkh+w/9SIlWaYr9cCamt1Eeu5EKxHM9Gkivh3LXSP7sc/2AtMB2hDGeCMh4PBgjeypKdxSdYdoOl50Z9kZ9wBtkz076v9RZsqP1h1Gsf9MR0SI6TGbKclpn02Gh/r6PQxABg4WjTCZ+if6jQWsFYOyhF6ff8rVXtFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563951; c=relaxed/simple;
	bh=BaKUM2UywPsrZfjC3kDRqaq/kXfkQJdiHLSSxwmanmM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tS+wyVSnzxOJjHuYcAQPEueb2M7uxprwHJlX0ahtq7owjX3PCc2BCdx3clLGqz54fuS05XOh1ue3pqIeo1nNse+N3lQyRl/dKOXsgkjWlost2RU3ea9JkTgmRQgsFY4Usp3eympg1OsjrxbGlqY+DYi1owu7gBJRFpTvda85A+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJ/+XyA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkLu6D+s; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6548Nd2w140358
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 09:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Iz8FTTBe1U3WzTPujE7PtVwMCPkGgJwjXDv
	f44rXKjE=; b=FJ/+XyA7UyXEUcoAfTkYHKRGhTy++zgGzmIEsSgJoHO0OlmBWHM
	DpSVKj9/boz2X77ECCeIE+sTgzSrwL5wsVYWc3BB/xr4swjJ3o0QJh9bLxatC6Js
	R+/B+BLGxHDX2VkVEonJ0ue6u5lKK+/GszjF08Bd8A32+yLeNXgBUcDYfunE8SRD
	/rSP42O5QYxQdT0hE0k4LVS3CcQwwjoIDm/xV44BCMdu0d8Krs7DhaMVBCGIm/gC
	owcFrXPSYh7gqi54Su4lQYySF32KVfGxER16jLp0E8XLbjjvx/3O9UzhSHMGMWS8
	APxB2KJqrMJ9WycDu9hLoIqiJf2Qrj+fVVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejyen9h8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 09:05:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0c1e08848so8224005ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 02:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780563947; x=1781168747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iz8FTTBe1U3WzTPujE7PtVwMCPkGgJwjXDvf44rXKjE=;
        b=WkLu6D+stmDYX54OQnPs7aZB0dg9aIYvA3SvXlbjMSqCjPAlZLJXkxHhkPRFKfOguC
         dulpkvaizDt9/do3rAsh+oQqqbnqdjG3GqUcqB5l+/LFg3gtx+gU3DDeK9akMoQ26Q1l
         /yQ+GLTLdZyqq91hqKVbHpq8Xa0neETZ68Psfo0GjpcF/PM9kFZHaetKLDLbYr+K+fpA
         YacGeLaVFneZUl4weKVahKoCLJS0FkJOoScF3vsUhEpaWe9y46KtmCq4j2wEepTdZJie
         18w5+gCR4CsMgF1hMYJ47T++B6D310Hb2WDocQTU1yCYj9Jdh6dDgLvjy1LK+TY2iNhd
         +vgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780563947; x=1781168747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iz8FTTBe1U3WzTPujE7PtVwMCPkGgJwjXDvf44rXKjE=;
        b=bO5O+w78HZak4YUnXcQ12hPKbSJ7NrVGU4HlvtpGH0YBt2hbhACZ5wmb5TxChIzmQK
         40Oj4Zxexj3c4QLcAFleM19Hr2paVCzLrrgfG+slfbv7ziRE1GPWKMr2hm+WbgsHsloS
         sZGi6gwaVROwobHvoC9ERVUC0sGZ3V+UFZyBHtCZ1GOnTzFmnL4RKvsYZUjy8ttluTOj
         QFP9o1+Qi1Ym8xY7i+0CPVK+p+Psy9FEV7cpdyFKzOK5sAFyRs8aOg2eZ5dKdR21QC6E
         Q9l6IYvORIA+0n0LV6GDqs2l9hDrQ8UevIr/b2SqFLzE2xUSFSyi9vERCH2030QMMNIu
         z0DQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Atd9IsxDnwUWJ3+c4XwcxkKiOSRbz1dTbWiUU4s0Q42tMtyu7rzxN1NkLlU6ibtlL89xgU7amK1n/amXq@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPTjcEid2YAt5oFqxNZLYXC8ts1vwMzv+trVi2ftX17F30jb+
	xLjMnWkYYGXS+IDUQMSJZCgepLWmxjdWxvfwx6jiUHQOkDrF58xO6fIR7Iv0f3u9AU5rfZjId9q
	8JPjwzLCbjoW+QwlNCruw2Hp4Kkijp9kfUYaDaui1+GLLVU+ldbsVKkqz7OtiZZzYu0Po
X-Gm-Gg: Acq92OHaO/jFua5/AwOEpG1/pZp+JMSCOWRe5VZghmvR1y6mLbxvQQ3BsWs45yOK8HR
	tOxCDUvdT/NqZcRMzVM7IBKjfHzULfeb7u8rG/89W1XRgJ0tRWO5NS6eBGeAQag0hcZb/hXaufN
	ScK2R/UyxwZS9utodZK7Y6nrPSGsQYJJIytbM/SInR6AS7Qf3SX1y2xS45olivhKdtt6eaCMb55
	1cDd58kiPxdfu1NTAfgqnb0x4YGdBTqpknw+h+moJzYIbz1Z+nH1Px3qMVQ5O+S4qO0AqFyMBkr
	ZsPMqVXUJEHP/6CFTp1e/h7ljL+I8M5/xzmqsCfHmKLXBmwUOYd5z1sC2BRD+Cjd1cQAvEvo1TQ
	kAdRZErk/5pm8tSO1Y+wbnaW9qKUTexEcepwNPsJ7sMwtRZELjDkSyfD1DGuZsVMBf6i7Gjhy4N
	QKrv6EwWOseaY3iZoOjJaJEcdUY6mACmTTb2P6+aISpJdhGPS12FFAtxl2XmxbvA==
X-Received: by 2002:a17:903:2f0d:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2c1640aab54mr69291855ad.26.1780563947331;
        Thu, 04 Jun 2026 02:05:47 -0700 (PDT)
X-Received: by 2002:a17:903:2f0d:b0:2ba:bfb5:9cc with SMTP id d9443c01a7336-2c1640aab54mr69291555ad.26.1780563946848;
        Thu, 04 Jun 2026 02:05:46 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8429fsm63211845ad.18.2026.06.04.02.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:05:46 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add ipq5210 to USB DWC3
Date: Thu,  4 Jun 2026 14:35:28 +0530
Message-Id: <20260604090528.735236-1-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JaSMa0KV c=1 sm=1 tr=0 ts=6a213fec cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pdNo10f9niJiPu__wPQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: O8VkljnlvSb-8R5T5OeTevALnl8T7SFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA4NiBTYWx0ZWRfX2GAodX2JClRR
 qQ8YiFJvWXKJTYEz0v2Kdz4v59S4IIrUJ7l3TLvvCKFHisPjhtv/buTAWpIU4fgNSDVcduGZDcT
 nwNe+v82Q2dYBAOlDb+Ub8vVIJJkQdWaCaYCmwn827jqQ6YvKl+t2OJBuzNqZE8/wymLhUslRfw
 yNfGvvr86Opejo92K2wOyXcHDmg0qG/Tlt6xLDz2JHpz1l1Fe6/1sXzLwlQvRoBTpjgtH5vTXC4
 ZSGirBKO/+z+2rU/n+k1BflCW2PhzgM1hFlFshmdRRrt0yCmguq4RxAsBCGkgdv0aUDbP9YjlSJ
 Disa9oMWHI++SU/PWm1lTbv5Vm4Aoa1O/yxvz6FHl0Y6+QRFIAZrdCITM/x4Q2j2nPc7UbIUPsC
 xQ8X3jiIowfGtYAgccRLkkEyfVPrY52xqa5ErAjUOiHobEN08+SW4v82lm/dRqN2antoQuS6Mqg
 q0K2FiNmsmwBcEt6Rfg==
X-Proofpoint-GUID: O8VkljnlvSb-8R5T5OeTevALnl8T7SFg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111167-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 24EB863E589

IPQ5210 includes a Qualcomm DWC3 USB controller supported by the existing
binding. Add its compatible string to the schema and include it in the
matching conditional constraints.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2: Separated out from phy related patches
    Moved from deprecated qcom,dwc3.yaml to qcom,snps-dwc3.yaml.
    Included ipq5210 in clocks and interrupts constraints.

v1: https://lore.kernel.org/linux-arm-msm/20260515-usb2phy-v1-3-5f8338d466bf@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index 8201656b41ed..932d7aea43c5 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,glymur-dwc3-mp
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
+          - qcom,ipq5210-dwc3
           - qcom,ipq5332-dwc3
           - qcom,ipq5424-dwc3
           - qcom,ipq6018-dwc3
@@ -203,6 +204,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
               - qcom,kaanapali-dwc3
@@ -497,6 +499,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
     then:
-- 
2.34.1


