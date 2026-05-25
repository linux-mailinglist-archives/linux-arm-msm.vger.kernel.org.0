Return-Path: <linux-arm-msm+bounces-109558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAPIJYzrE2qoHQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:26:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E715C662B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 08:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBC07300DF77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 06:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44725399CED;
	Mon, 25 May 2026 06:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8KP7vKK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QP5dmy4x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0C339A80E
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779690377; cv=none; b=kk2Ss/HmtzrzsBf9OPjNiKiFhEIfeCZwu6mH91VCAGwW+hz2R1FEtT9zMw5R75M0WpZn1v+ICMG5w5Fv5uTyT2W/5D4LrwDfMtI6TUMNrF0JRLYTDN7l6FJlNF9Y3U3LKHHuzdFHFvZR2h8v0wrWPr7Eyc/ViOuW0Jg5SASwqtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779690377; c=relaxed/simple;
	bh=L00mK2raJrV6y81+9ruSkaadJuU9lHh8SwKx0G1dYEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FBGeIGtDyKlERHE9U29QUtKsFjrF3dlz4kDy5yoFEdkAUB5R3AeyY2kN6Fj67T3bJqqjfdNzxg8+oK6wk9+Ss4ETPBlFq8Yygbh5fyWnDUXbxx4lO4f1zsyvuCxAb9mg5ycBEcygLRnZKQnXxhLNUeccAFschd0jWkxHG5iIQsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g8KP7vKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QP5dmy4x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P2wP2K2573613
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eYhzqpB2/DI6hoFeRTv2jv
	ZcHqK4Bvk2u8nJ1PNwcWg=; b=g8KP7vKK9EyV7fdtXf69d7mxSvB5K2JI8itChI
	NDy7G5M+Hc4vFgMuZD+biwSRWV0yBn3kxkH90zR8gtI0QOn4DmDV6OYyDkwXTgrI
	MnhEfpYxBXIAmSlhSxcLYlRHPIsPKvtUSe8NcED5uqge547Ri7YJPeMFm40AbSBx
	ETvJGAVHff4DDelTz/IxR8t66SuNxQg/ETLAXpIIYER/w4czvRqbeepUCRKJsL32
	ydQgXEdNstTtGD/uQCz+zrZLVhWsc5S4btob8L7/jLc11mFKl45SGAh4GMgK6usX
	dQ8PW/BWw0fVyyUnn5J9ZYuYarkCwi4gInk3GhQQYcXt5Rmg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4f3d7ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 06:26:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so125928745ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 23:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779690374; x=1780295174; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYhzqpB2/DI6hoFeRTv2jvZcHqK4Bvk2u8nJ1PNwcWg=;
        b=QP5dmy4x3MptFmixhielpmxEHmWup9TCLxqhBV/Yc6v/l/oVOoXsHBmz3tB+wCPc19
         mTIk3WyrqVd5xfBBDFOLFWGTlKCSNGTMY6KrawixlfRyd+XDVymkhp2EXsPag6hXSLy5
         TzEy40DHiBiY8v6mwg3x8tL75ymCJzVqgWNd/26MQmcA4kYq+zZoQmYgEIdruvkQLaGh
         Jey2exA55qBJ+DPX6UZX/+iWD56jwTId+1CMS1Zlasn9famLPFHWmz8TtG3o9JktxNlR
         EAZUqUDZXSobdAXHTeamFKunibKHRVqQXQqFLrtKQ3/zCCy9DlIZ+ey4C3IwKpgMou3b
         hwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779690374; x=1780295174;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYhzqpB2/DI6hoFeRTv2jvZcHqK4Bvk2u8nJ1PNwcWg=;
        b=VjO5WmaxZbdrKVdj/AHvw0pIv6UgghSYf/U9JuQmZrx7mxV9GpkvHmLcvrAUt64+Ga
         ITufqyOLAjLwvltVMm3IjLbLQ+PxwYq7OITYtNnwUoHSF3RTI3Pi+uMF3YLQFum/kNvg
         ax/u6VE3d1R2saMX4PkbmdlyAWADJ+TqgqEviTKRhNZ1BGTRORXaioDomFlnxu9q1NwK
         2AYEVkTI7ess96pgZLYmosph5iOaXQ+wzzUx6Vlap+eFK6LWMNgcOcAISUjwzl9fMTUM
         9njEJhqMK+fBvQQyN+utgGNMQE70c+RBSW18Z/UYKmDHOaRo5xwSaG9HK5wZjfrOS1v7
         RzUg==
X-Gm-Message-State: AOJu0YxkgenZBiOUVse+gdixsE1DCsFs7hqjuscsMpJhsSDIo7P4OzXs
	VJuEMKPHQGdw6ogurIhcdukUSW4dzJI5ARw9tjthVE5ZNiku2XJXQpxUG6g1+ZhOMYwIDpJQlUI
	1QBjHOPFMMtWGnDse/SoMlGKXnkAqO4AXGw5V0vOmpNWohslf7RlB2GrVk64AU4/bPQ6w
X-Gm-Gg: Acq92OHVPH7sYsn+dVbGyBySL3mYIFOzxejsvG/pzJP+ecYrww5SzSRRZJGOPMndG2Y
	eJKmHMCEggqWt5qtdcOSFA4k3N8rPLvLqCGFiXmwXY/debLZrxWQHnxburakYjCWfytZzG10h61
	xT54PmQj/98BY+RNv6MoBOxKrhmwUOzNGDSWBq/74BqfRgS597rDiFk1yGmxtLLRzGKeGigKe9l
	29+ZRTWirnG2rNl3I1RZU2mZtDFOwlBUgqyRmsvBGDDX42abnaUkLxsuBp5p86KzToBUmp5cuc8
	e7C9KjiNHVHnHKCqNgAIa8EMlfy4dNMXeBXLTWFuSYBYmRXjllf0xQsV3lmdH+P6JJZ9jhzEBJa
	bj9OW1AmYNiS+1ivdMmTvMclHeDvofQgq2upF/77XUDK87CF5WrAEBxO5YjMKyZ1MY3jNwmlQRO
	YLw2Z60WD92Ds2712qKe4+WdXzuA==
X-Received: by 2002:a17:903:11cf:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2beb076ae28mr145177095ad.35.1779690374311;
        Sun, 24 May 2026 23:26:14 -0700 (PDT)
X-Received: by 2002:a17:903:11cf:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2beb076ae28mr145176765ad.35.1779690373801;
        Sun, 24 May 2026 23:26:13 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58db58esm80174405ad.62.2026.05.24.23.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 23:26:13 -0700 (PDT)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:24:00 +0800
Subject: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Add Maili
 compatible string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-maili-pdc-v1-1-2fb03a977cac@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAADrE2oC/y2NSwqDMBQAryJZNxA15uNViotn8lIfNGoTWwri3
 ZvWLgeGmZ1lTISZ9dXOEr4o0zIXqC8VcxPMN+TkC7NGNErIRvMIdCe+esd1DdIYsMrqlhV/TRj
 o/Wtdh8IjZORjgtlN30KEvGH6iwkfz/LaTvtU3RIjbX3VdaKsvHJ2tBic8UIZCMFK71pRKytBQ
 /CIbDiOD+1Vau3AAAAA
X-Change-ID: 20260427-maili-pdc-71a488a96973
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779690370; l=1042;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=L00mK2raJrV6y81+9ruSkaadJuU9lHh8SwKx0G1dYEs=;
 b=DN/fUjgTJg/gDDH8u923TaoqGXaJGznmBut3NUWYQ8adqLlO+k+f9qBN9HqEiZh1eJTlLJqHV
 4EYNs69wi4nCIdbH1VRfBRj7afDBhDdxQ/bVONyydM1yONXGBkQsWnx
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: b0XhalZs0hMY0YL42sr_ARaSkDXJfW_D
X-Authority-Analysis: v=2.4 cv=WvYb99fv c=1 sm=1 tr=0 ts=6a13eb87 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0TWJLbmp6Z9Bekl7B0cA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA2MSBTYWx0ZWRfX9GdeUBNyfmMZ
 HV4Ku3zFWIzs1f3G2TwmJFqcT0qeo6oq/bFqg233RR6IYgNT9b8QQRGAffUi2NMkg5+3nrIO67n
 Z6o73r7j/8PwM+QDfs3N3rlOvOeNHFpeEaQnzoo9uHtUBSJzQMAe3pxsSNeE1RbjPTUBaPtJz7F
 fgHGMO/mpHwN+4sQAxgTmpICWqozT8XZUTjLVYyCZX8053QkJVme3AkHdvAbvUlMyp0a2y81gzb
 mr0chpuSDzzAkfeKstzL5ygyBTwqsXfXeeGRF4GU0wmzrIWr8TgFddwahRuQZvgkgXntJCCehpl
 9xkV3825rCro1aD81YyUO0B9KpriwYBZQ9Aeqo8km1rMqUGbXaJpGSE8OjLo3ykZDOFrrqS7Zax
 HOETLEjLQWoqLp0HWzsOw03hMSRPp57HZmQ4VKFhdqJBywyX98Oh/uhvAPaPcj2AcrPIegBskW1
 wcTJheFFlwhez+dLTtg==
X-Proofpoint-GUID: b0XhalZs0hMY0YL42sr_ARaSkDXJfW_D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250061
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109558-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[yijie.yang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3E715C662B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Register qcom,maili-pdc as a supported compatible string for the
Qualcomm PDC interrupt controller binding.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 07a46c5457a4..8162a49d49a6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,glymur-pdc
           - qcom,hawi-pdc
           - qcom,kaanapali-pdc
+          - qcom,maili-pdc
           - qcom,milos-pdc
           - qcom,nord-pdc
           - qcom,qcs615-pdc

---
base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
change-id: 20260427-maili-pdc-71a488a96973

Best regards,
--  
Yijie Yang <yijie.yang@oss.qualcomm.com>


