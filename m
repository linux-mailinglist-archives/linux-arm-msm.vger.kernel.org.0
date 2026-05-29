Return-Path: <linux-arm-msm+bounces-110321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FzkDt7TGWodzQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:58:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB03606EDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 19:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5FB44300D70E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 17:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6F23939BD;
	Fri, 29 May 2026 17:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0FsDIEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FRkZhhT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7043921DC
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077240; cv=none; b=I6lvh+M4Tb2B/HTHpsDv4Rs9ndX/nTZcFET00d4pBV4hOLeVNOc9oWx2ePj43dgoB5Swi4/DB0FdeiFwqjn/7VvaDuoh7W3vZdd2WFPT0JXFOQ24vyFAGp8ymS3ZcZoOiZkzZytlTmsxnhdREVZmq8hdE+sg3MCzgT5X/lyf40I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077240; c=relaxed/simple;
	bh=yeQt+q6KDTBpZuq2sDms1w9xxk11F+iLVNhI5edtw9A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d7w1Vo5bwK8nFTOYH/CZ5OpgUiGuZeY1a/wNMG915sB4SbEOamJRbQZ8OziRiCpzZ2y+zsp/RHQ9RaETxZXfT2IqtibkZfKUHyenuicQOy9k+Eh3h2WfEBEag7W/E1oODvOFT47yFonn6zLQgLc5spwq3NcZrRRYKoGqlIxOzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0FsDIEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FRkZhhT3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8cRI446430
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dkfRisFqrgZyzc/mO2h/zVdDCwLfUT8/SkR
	65NdWqWo=; b=T0FsDIEPykGq15GjT5Ytk+/6ymlRVeQgxB2YzQjWZkSFnrGPK9G
	wN3iY/CHDzoptlNzY3aA7V5NK0cOr8MqcZ4KM8/vbRaSsPRSciBIvTsDqpfKl7ZC
	LHM6eZ33SvSwc7m4w9jlYsVY4TG2tocWPS2v57Ba7xtJKxur4q9MWXFySjVrM5Re
	yd5lHLl1NnLFsSbHQq8ozODDWUlYyBREVX4wRqQVyAfqowOzIZeAaZJS1N+iJAM0
	rZpvh0BPOc9wBYKHbWeX9t67M2LMR1rQ/OdwhHA7Jub3SmB6P19EsxrHShCAFRDC
	+RFn50YUlFq5jP8Jae/k9wKmZYgAzOzW5Rw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef8rcj8sq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 17:53:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so13705119a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780077238; x=1780682038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dkfRisFqrgZyzc/mO2h/zVdDCwLfUT8/SkR65NdWqWo=;
        b=FRkZhhT3LomUPSuXG4Co2+DUxSzxx7AAhokGoiJ/VlqWnTO7Z8NF9mY+OYq8QZchBQ
         fkMbTv1J6lLgYwOaziFkoCgCiaBcI/wE7AGylkehjSvW2NTCVrUxXsP6duewAzLScpAb
         aA2540CVz6OiLNDxQ+jgGQKXVAzp71Rb97AVqWVrdlQ67DHWrfx6gOuEde14mT7R+WDe
         MKPE4Qi1Xeaui4z71wfZJSloekYl0EofEseu94PEFB+xM6i2dcKHk23EDQ6XiipTyI+O
         zDO59QKjtX6qKeujDiJKrktI+LUE0n9yx6+ZN3gyXFNVy0m4kTPiyC1IlhPCFAfI2pN9
         g9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780077238; x=1780682038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkfRisFqrgZyzc/mO2h/zVdDCwLfUT8/SkR65NdWqWo=;
        b=GkiNphibZyMvLK9MLZL7vbC21An38DVQq/eNOy8H1++YXSpNKdROMKcZZ+ASdm6JaY
         7O0R3Smn2bX69bWgtcLfGOf0XEoge2yvdA6QbZpljirgl9Ycsj5hWB8HNM1J9HCIpUs4
         oN1abhl9+ihGfQIBmJKsd+JSPA3jl0mkQIJ1XmGxH1iZEdTP7W4ISGGcDmVixP5Py0vC
         hOXiU3ygrY+KSFTujUbmontbSMJ7W1tyj2P2tY5U4lGFdVYCjibY1ZYBQgsy5KlQjlya
         7Wc9o2FFQyAQ/8OVrWRKiiPRN/WYz736Dati8dPRkY5do5zNV+gnpUvz0zTlaLee+cOL
         Wgbw==
X-Forwarded-Encrypted: i=1; AFNElJ/j3D91lf4xTSYJE5BzzuRSSZgEPIVkOtPHR4BztmSPCfiqncS15btpCc2pb8NG7bJSzRdY+8NuPwr1E3js@vger.kernel.org
X-Gm-Message-State: AOJu0YwKdhJsnQUXlWICzHazoov1WyI5heUZmFEV9JWkAEe1xePKDOPs
	lL3i8pEoMEIpFwwAuLFgeMA6lAoald0xthdYl5l43bBuwFcGolNdwxD9TeVAuVGYVbzHGRoVzD6
	+q5tTxxp9JUP5fRtEXsi770pvw3VqoIL4VNLRFyLL9F9VL0EzNkT6X1V6e3eGBrlGo0/k
X-Gm-Gg: Acq92OHwWc3sLwIuHOkbgbNzdpDX983qzdgU0YR0CXWn9U/9fDD88zQnCEfMeNhqT4T
	4r1VFdsX+gOnkzmj0fjDkUsxTxtmdXwu6KqRWqc66MhWfPACejNQ4+g+WgtsaSfUYbMLasGsuJh
	XwqpdD4cvaGpZsXNRX9K8QZd84qkvPoUEaHvla/ShjA+xsonyZ8e7Bf+cBnhFmPLxbmb+wF7rgh
	x2hX222Gtc52LuRJdOJXMO2oxpdWSG1B8vIe3ch3ZXSZks5jcSmVZjJMHrbD4muD6Unl8BCO2sG
	7PPFjdi/C2BziaJL6wffPgxOa2zBhyZ3JbC91QJ2GdoPKU7HPcKF8jDtGbcQpIxGVApblPXD7M3
	in0U2IF31h7o8YEUZJNXU2UC9uVUVIhrBjrGOaG+jYjza+wK+FuZJpphxdCO5Sg==
X-Received: by 2002:a17:90b:1c04:b0:369:e1fa:962b with SMTP id 98e67ed59e1d1-36c684995a8mr167711a91.26.1780077237704;
        Fri, 29 May 2026 10:53:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1c04:b0:369:e1fa:962b with SMTP id 98e67ed59e1d1-36c684995a8mr167668a91.26.1780077237192;
        Fri, 29 May 2026 10:53:57 -0700 (PDT)
Received: from hu-ysiddu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbd667fa4sm2088196a91.0.2026.05.29.10.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 10:53:56 -0700 (PDT)
From: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        rahul.samana@oss.qualcomm.com, harshitha.reddy@oss.qualcomm.com,
        dishank.garg@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: bluetooth: qcom,qcc2072-bt: add bindings for QCC2072
Date: Fri, 29 May 2026 23:23:42 +0530
Message-Id: <20260529175342.3363935-1-yepuri.siddu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3JTRoCWbJF8nHHxYxhmWsSvJTEvSiaHh
X-Proofpoint-ORIG-GUID: 3JTRoCWbJF8nHHxYxhmWsSvJTEvSiaHh
X-Authority-Analysis: v=2.4 cv=DuNmPm/+ c=1 sm=1 tr=0 ts=6a19d2b6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=RzHWNqaCwg9CAr5QTIoA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3OCBTYWx0ZWRfX2cVJq00g4Bp2
 hAKA7g68cugyJBOzXiXlB1ZXWFprdfgMYTNaN5ros5YmXSbdCuniwUVo+E22VYJ5sS8iTV/5BZK
 f6qOpv2z+38JGeqss6unEurA4cy2BZGaR6PBPOjyQgP71rYO6BuCtgisT4mVK/pSaHLX3L7aRQT
 6+6leslnOcZfpfcPJrll9ro3qAu3diA18dVs6WYDf6drho3Ey4lsCcvu9A3hB9kl5LnSNsn4yoi
 /sGc8R+UXK6DGNXZs44pxjhvqKfJPaCb7fX1InJVw9QDQJ3G3bhYBmZJnIstKRU4GrF7YWyLR7K
 NzCl3xpcO/bCu2hyutBkt6Tdfp+s1EqbYplg+DaeyzU57e4G3n/ix78f+cJKLWK6CngZPJbTFxH
 WS/waV7NhSlhtmDDcQMuTiINlJi5o4ZynK24UrlU7T8PuCvPIghMiELNQePdC+dJabqJXmckfBT
 qOSX1QMSJvOQwdMFbJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290178
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-110321-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yepuri.siddu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACB03606EDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the YAML binding schema for the Qualcomm QCC2072 UART-based
Bluetooth controller.

Unlike other Qualcomm Bluetooth chips, QCC2072 requires no external
voltage regulators. The schema inherits common Qualcomm Bluetooth
properties via qcom,bluetooth-common.yaml and serial peripheral
interface properties for the UART link.

Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
---
 .../net/bluetooth/qcom,qcc2072-bt.yaml        | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
new file mode 100644
index 000000000000..8e2f15a75d62
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCC2072 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+
+description:
+  Qualcomm QCC2072 is a UART-based Bluetooth controller.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcc2072-bt
+
+required:
+  - compatible
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml#
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        bluetooth {
+            compatible = "qcom,qcc2072-bt";
+            max-speed = <3200000>;
+        };
+    };
-- 
2.34.1


