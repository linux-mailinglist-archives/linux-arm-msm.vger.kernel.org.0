Return-Path: <linux-arm-msm+bounces-98315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePwOBPMkumk3SAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:07:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 875DB2B5AAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DFD6F3041167
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 04:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A633321A2;
	Wed, 18 Mar 2026 04:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xwi5xlnu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gH4pwYI2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7673290AA
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806826; cv=none; b=OAd0Tgcnsg/tbwWqahwvXmZ6EFTtps4W1/7Gx2dsok/68aSKVU33n//MshGm45avqxlrfKfSh48Otyd722Pophk2HOYq3qlB8TsX8uEZ2nx8BAFXfc2rmC2VAZk7O7A+Q1QpaKCmz2p3ZMCYfiE3glf3KCO2cxnKsXg5du3r7sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806826; c=relaxed/simple;
	bh=o2zRIyVnrK+K/Z8NB8eFZDC2LHxUxWG3udiN9D9rX9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hzxEwDomEyOGOWhUcZ2ETT18NO29CiUuM4+2Z9nmrpSbKyDZ9RiBmaPZbCw6hquAMt+ydePsH0vgWBPVUs4Ew5mkXjY6nm0bjRY5XauPpPIw4T7GnNqGAk7Z6hH4F6TcW+B2HJY5tde23z6aUOUJYIc67fZ6mZlfBAvBc554lTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xwi5xlnu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gH4pwYI2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I18Vg42790044
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dnFUHnj6wfV
	nSKifpravZYf6kIMdlWwQd5zEO1oMM9A=; b=Xwi5xlnu9OsN86yTc19VM/xsmk+
	tsQg/t+B6r/a2qOaZR7b1u2vrav7mNSvH5AcSTTwPJ1hwfp1dHTiJB0QU97CRCAf
	84pibotQvaE36fv7crjeKSe31qB0SrfJ0PbOP9QPnLDFkJ9mSSeAyyy+MTb8Iolo
	Kbc9kf0lZYZNJg5v/qypbDWzfS2kOXt7KscDL9v/x3PY+i3FN4G/LPlSfpixoNGO
	M5b4elbb7a5oF/iy045YkqKiB55IKzeOFxiWMsz9vRWlfSx+nm/Y4DQqzAWw9sxl
	LSUhWeOvkMeLARnlF9mRy27SmZOGkj3JdPVpbJeewQ+c5hIhGmBuVoe/hHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g0kpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:07:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b061868724so135428435ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 21:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806824; x=1774411624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dnFUHnj6wfVnSKifpravZYf6kIMdlWwQd5zEO1oMM9A=;
        b=gH4pwYI2WIODaobi0GYmmbdGQaLG81yFEWNlQumLHBqcBri+FrvhMfqVbgvtR4LSBn
         wrr5B664Ba7pbr25ItgieGhi9s1nn7rBjMLwSOcQVdi59ksBSMy/297he8A/OGeuw0gn
         Je/X6IAxyIUCd2habe1FVizVVElSSjX4tt02oj32Er0RB65WJZO0fR7yrhzjDh4hi0lK
         7aIZQwp3bfdKNplnZflQ/O8/keqelqHtgYcpteBJlMGb1aNCpSCnDl8ef9/t1t/vb8G0
         Td1CfLpvLWezTIdQWii2qKoue+kxFzraPpW1jzLCqv2adG8VA+Zl2L8Fdx7434ibPSyX
         ayqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806824; x=1774411624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dnFUHnj6wfVnSKifpravZYf6kIMdlWwQd5zEO1oMM9A=;
        b=XFBG0XxdbKxe9Qu51LgvwOj4lNdvm2AAsNQgX8XG0vL3vNXGFqTkDfg+VaID8Cu15v
         JIo3wW/7KaoZH+Lws1t+IPiABfzJHeMAFIw3eueO2h+Joo6+9Xk8/ImCyE/9lmlgKLG2
         /2fZPhelT7Vycuif1zUM+/rgHTZ5z2pu2fEQya/OU+Xu3q484W7z9J08QfNry6nKmDwN
         kZswhtDUQFMQ4JgvRfeH/EJ0v+eSD/pPG6S0ljin9uE0EBILTCqtboDC4iHOallG08Xy
         xHbvvS6Yi6887qekwqHS8es3K9fbwqYeNsSKzxMQNpnzF9tGCcMEG2vHCgauBxI7P/Yr
         3EJA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Dl9TXmGg76I0g8ZICS82T6ZHBBgruV9BIyf92YJs4FpgZ5QKYLydX/9qTtgajor4FTyBWSM31TYYwQWL@vger.kernel.org
X-Gm-Message-State: AOJu0YybjAsqLiJczHc2PL720YAneTs0GOALREe0HGf7+pEtcIKr2C21
	+zbedm34QEINW+MC8Nn68cXqIMQTrw5np226I0+Ip8jCHADHdlknvf8oXPGQIb0NJ3zfnHHeJ4Z
	wDUCGGsdZYRZyN/bQtst7rmWa3ZtUqy5d6GcQ0ZH+vhOBZ0iv/EAwpFx7BcD1JDXIXvYb
X-Gm-Gg: ATEYQzxlQ4GHu0bAScXy0lVWmfHW+D03vZv6a/oKpJYMn2W0UdBSgg2psYiQoaRbWKs
	cNOXLlQ2NKs6S3ZzGe3d7jc0GD5u0y4gbsrjlVQ3jQvc98jzEybWEs85ZJ+PEqsvkM8mjPKjWJ/
	ywtblp2HbgGr833c1HtpNWHnVQDIXYVQGpo7XjBlJha4fjQ0HHeOijefxG1uZZm7I9cRSNbg+WP
	wzGLq7cFMYb/YkvGf0hMQjfN5j4n6JqSOfRv6UceOIjSC3rblJz1nHzCNJdzSVURuMP7qj9bsb9
	Ht76A8QYvWPVB0fCqgpbW4c0r35OhuhUaMeoV8gcyoJXRohyJG0AvlmA4WMAcz5FmY9UJ6rCxNR
	CRKopeN4uU0nN+ExOp4OqRgmjd4jZ6dM7oSEox/f9o+vRqt79GxcZ9Rs=
X-Received: by 2002:a17:902:d583:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2b06e32433bmr19445315ad.1.1773806823799;
        Tue, 17 Mar 2026 21:07:03 -0700 (PDT)
X-Received: by 2002:a17:902:d583:b0:2ae:55eb:f82d with SMTP id d9443c01a7336-2b06e32433bmr19445045ad.1.1773806823403;
        Tue, 17 Mar 2026 21:07:03 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5f12cesm10243425ad.41.2026.03.17.21.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:07:02 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Pin-yen Lin <treapking@chromium.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v6 1/4] dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
Date: Wed, 18 Mar 2026 09:36:41 +0530
Message-Id: <20260318040644.3591478-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
References: <20260318040644.3591478-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69ba24e8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1mrrX1IwxDsCUTwcy_oA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 3hXJ5kYbaiqGJ1wGjvIExOi28QnDZ6D4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX5u6qUXXEjOm9
 khyNucOKOwyWnT6YPwCl/DKXGHnn62zcHY2uqV7n2GUD9bGJyGclVtQplquGCQ2WyzRUIe9Axu4
 3KaVbBORjOk0JvDuElWf6/75N+ERJ84sl/OWif3NZl43vhkL+lz9+MS1ELGjOhOPl0yqOqT5W5B
 MU2jiaVYCDONC8Ry1+H4+0azaR3XyGaGWrgPG9cwDnfdnKW1pSPHxeRovElQnOvQcQhKIlj2yGz
 wgzPGkxejKnL0OAzIptMdQDfeji9Qzb4nd4ln63KYmShNtKap0mbASzzovYWLj5ZEXSi8yf4NGq
 zDT4MxglchooCoSzy285kBXH01IK1M/1JKzOB08FgfYSXTKeloiaAfzFy+8C2Lpp5mmqgi99gPy
 3HcMrrZvCm22pARyK5LjziiBh++wD3cMcvhLm+skSuUjd+bv87ZoAKwwvsLcV+/CCLrCvEbCDO/
 rMiNO70iSoLQ6Kl+Flg==
X-Proofpoint-GUID: 3hXJ5kYbaiqGJ1wGjvIExOi28QnDZ6D4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180032
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98315-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 875DB2B5AAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the binding for the USB3.2 Genesys Logic GL3590 hub.
GL3590 hub requires 1.2V and 3.3V supplies for operation.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/genesys,gl850g.yaml  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 9a94b2a74a1e..d8ca9fe5a593 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -15,6 +15,7 @@ properties:
       - usb5e3,608
       - usb5e3,610
       - usb5e3,620
+      - usb5e3,625
       - usb5e3,626
 
   reg: true
@@ -26,6 +27,10 @@ properties:
     description:
       The regulator that provides 3.3V or 5.0V core power to the hub.
 
+  vdd12-supply:
+    description:
+      The regulator that provides 1.2V power to the hub.
+
   peer-hub: true
 
   ports:
@@ -69,6 +74,17 @@ allOf:
         peer-hub: true
         vdd-supply: true
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - usb5e3,625
+    then:
+      properties:
+        peer-hub: true
+        vdd-supply: true
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


