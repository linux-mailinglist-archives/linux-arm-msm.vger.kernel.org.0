Return-Path: <linux-arm-msm+bounces-106858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHWAGVShAWpKgwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:28:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FEB50AE14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 11:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FFDB30E7A91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 09:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5AF3BFE3E;
	Mon, 11 May 2026 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8by+bk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X2yEtJLT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F553BFE3C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489991; cv=none; b=tcdhrgV6k0RVFQBxdzOBAMkZeda8ospqYe/BsKmO7JkaVQw/NhlPY8E5h27Y5l/9wTgLYLV4qV/j/c15Mqroh+NClAjrbmMdaG5cElxniGjHtA3XEORwLWfT1HzYWPeBIsgzvNFvQT+pTA0nmAIKBMWZCxmw0t5YDMG8aZXUvS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489991; c=relaxed/simple;
	bh=SL+UNauRBwwrCkM3uO5UZeJC/78xkw+uxLpccm8Cn7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RiLm7DO8yYvphsALp4mcWh/Ar7ba1z+vBZ/9n0oa0Vm/GpPOQktB8pwWa0fBb6BG/L4kE4vHY875NP/jtTLfWBMQWBTvOIpzaiqhuHsb9YDsimo413rOf0BlkQ6CjRkOCfO3DLuwlxGySmIsU0sIwm3EDY43uxamM4hqtmy9k4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8by+bk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X2yEtJLT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B4H1L8653467
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hjEvbjRlHT4qvFn1wkDbkB8JDFAFYckCq2JorhG/vE4=; b=E8by+bk5bBmR6wlN
	02wjvTuRIduLCU/7e8ON7Jr1mOOjzGhzZe0b6HHxT6AFNTmFA25FLsAqCspraXoJ
	MW+L2yVe1wiLON2SyZWEkjxdBzKtBMzpTkyDTaB5N/00NjdF4p1qQyktG1bKHzia
	kYwVOx2hUQMvw9bBgbpt1Az5xDbyNA9tsJkoFjlJgs38AqXw2RcGWNNS0XaKjXJZ
	X3I4LagruYkUVNvovoe+DwoFZXfksTfciHbqj8NAXL62timR6+9VJZRWOpHHBo+G
	cnsKETC1FIGwu+k9TrPp7Nf4nBNSimhdZLqmsRVl2pNFSTQeaCDm1BIgftPNXAPZ
	AX9V1Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xu8xp6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 08:59:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b1f4478ca7so101064686d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778489988; x=1779094788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hjEvbjRlHT4qvFn1wkDbkB8JDFAFYckCq2JorhG/vE4=;
        b=X2yEtJLT5uDNldY1hxYsocGkRXRgjIWMFq8PiT18RNXy3BFTQlOxFCNsFrxhRF4XKW
         1ivmdbP7bfy7riFGKMARaPp8Av7rN/awOZFIsDbI+h3UYAO9kCrNCbtNszeLKVmmveau
         t/Lb4W9W/k7yA17yHOx3AO9LConeBI3lRFEYZUMDAm9eKwdhCaeoFAndZ4SRqbrG/wwM
         xTsJSCxvd2EA4YKpVTE5tGp4YO9rDfdE3/QXNQJx8/SOE2jn5QBQyP6gifUkd4BdZU2h
         IFs1+0Rb1Jm448WC8S+lSW3X1lPkSTrNb6SKQAQj5yKW3SVp/4HMoqbxsfhCsTJjBB/B
         o/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489988; x=1779094788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hjEvbjRlHT4qvFn1wkDbkB8JDFAFYckCq2JorhG/vE4=;
        b=ml6atKZ2pMnRv40uqHT6YZlmY43Mvw2COVSk+IH4KcMFyN4y1u8UxexGqok6yeRSet
         ZUJ1FuXjnzuW8FdIrB6hHYR68GZqI3jUfSJloAw4byt1v33XgXqWC8gubH7l1XBYBGP0
         MA63fzDG9Wng0oJXEFpOP+q8ii5P+7rbK5Sco05zNpmDwSdVnhpTEISdbZZnQFqxdSoU
         1kMLOgEUMIyCbebJeXp+9OhAF4nmSDVQqjMdXRLzfercv5LvyYR8WJ+WcPHdxpxTCP5T
         WRun08WcHE7nF6bNGeGHRwOf93L1PwYn3vY2gQwFSn2VYyMSSIINNS0ZSFlqldXckG78
         QdAg==
X-Forwarded-Encrypted: i=1; AFNElJ+VPbMXip/kV8W4x55/Ua7HLwb3UK0Dn7XjQukxEGaBfSfBirkv1VBUBzsvivCNnYXJvqlUsWVB7zdlZxpX@vger.kernel.org
X-Gm-Message-State: AOJu0YxLlvVAco4lOpzBvENKuyTeHeafdki1qDTdTPjUmqcyP6vHEHyo
	n6CCWMaUrQLql8iOPB+srFjT7kDxFDAXT1NiflE2DfDyGuA1b9QYMpLg+VwgOG2USb5oTNicen6
	+6mOhsTgE7r72N1nRHm7gDjqtIonPM3YCSEFZvrUTtletPQ3DksdZgaAvs6uDWyo3jov8
X-Gm-Gg: Acq92OF9yegGZ8174y2votOfrVoRfVzbcFx3714eFdxqie0sj9kjrnFkL7VYqcKBDvE
	K/oCt+PNTY8GhBVshY2i739rQ1WccKPp1YAswcb1gjS1qm1nIgBDAUla/k40RH1IXLqNf+1VSFU
	+aoyIrpNwZVEQQariJ9U7g70STA5M/3q7L/4GBi28eN3XkF72ptN/f5SB8bbtW25+92aPIfipS3
	Qpzt0BxdXziA6JZOliG/3E6/oPVnULXTuhAtbF80C4vmwm0d1rmDRnY/02CTLptuBzMy4PkIH9o
	bvIVjEd5QeTirKASiB2aZdc2E0RN1JWz5S5JTUctkNfMl3qlPmF3A3/tm6461+XBwolrAHaTY17
	4mb9IqWygXMnJ9ZrjII+dXF+mvLz1IZ5uXHb2HCQrWQbhNoH1Hzrj5nfDVPD65Fqj7Gg8Bnp2DJ
	wGVH96i1IGxpiQ
X-Received: by 2002:a05:6214:8087:b0:8c2:b36d:4fc1 with SMTP id 6a1803df08f44-8c2b36d5203mr106820616d6.14.1778489988434;
        Mon, 11 May 2026 01:59:48 -0700 (PDT)
X-Received: by 2002:a05:6214:8087:b0:8c2:b36d:4fc1 with SMTP id 6a1803df08f44-8c2b36d5203mr106820416d6.14.1778489988003;
        Mon, 11 May 2026 01:59:48 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3b0c7600sm89017316d6.1.2026.05.11.01.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:59:47 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Mon, 11 May 2026 16:59:34 +0800
Subject: [PATCH v2 1/3] dt-bindings: media: Add bindings for
 qcom,x1p42100-camss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-purwa_camss-v2-1-22608ab9126c@oss.qualcomm.com>
References: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
In-Reply-To: <20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489976; l=12310;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=SL+UNauRBwwrCkM3uO5UZeJC/78xkw+uxLpccm8Cn7c=;
 b=802QAusi2uK9HYjJXmnjjEnHsaiS4JCkXNmfnESCCyQABMcIpoa/WQ4+tC48welI6xO1k3xAG
 ZFbmAwjA6GZAaZUHJBcD9y8JegDMTghNTJQmLqv8eSJIfA2f9XZMCVD
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a019a85 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CXfGsmi0X-KHezRtte0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA5OCBTYWx0ZWRfX9Kg3aukBLYjk
 3XEQFQL5mB3xHf2kKWvqOx7BwexmOateQcOCWEWqkSBiyZYWBDCzLccJ0BG42BwkESODl2nGoDr
 iTT2uNo/oXNHUazbYko0VDL5PkETloSUKKpzwuz6i3jCf/jP3NMPATyhS97xgLA5mXUxps4KaCU
 oj0l6Xo+L0BOxNXFkq0oEHZwydkQv6LQY5D5u4KpczNxCJ7jHEhY5YDtgB2VnTuwNvOrxxC9LuL
 PLklOE8edNT8WoPAgw+NmKdTkTiBmy8k2etvIvFyz6ZTWm2EmPnnB/wN0tKg5jjaPSJyjJrADyD
 Wk2PSM1aDmbU/EUPS1qEAl97/I0dtIqjPLpu2RcmUMGGLclGxV+JJYbiRB5jqS+HEbs9qcMaRCX
 tNslnICb+EmMO69e9fuUSReJE0fu14cH/4K47iFPEXA1sf5DWbnfat0T+AZDA6s96sxu5RXRlKW
 uK43SWkMQY7bTELuZpg==
X-Proofpoint-ORIG-GUID: CQthiC7gNW6IFopvIwu9BhFWlpPgxcRU
X-Proofpoint-GUID: CQthiC7gNW6IFopvIwu9BhFWlpPgxcRU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110098
X-Rspamd-Queue-Id: 58FEB50AE14
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106858-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acb7000:email,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add bindings for the Camera Subsystem for X1P42100.

The X1P42100 platform provides:
- 2 x CSIPHY
- 3 x TPG
- 3 x CSID
- 2 x CSID Lite
- 1 x IFE
- 2 x IFE Lite

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,x1p42100-camss.yaml        | 352 +++++++++++++++++++++
 1 file changed, 352 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..757eaaa0359e724b141863a50d1d8d0b81749bb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,x1p42100-camss.yaml
@@ -0,0 +1,352 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,x1p42100-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1P42100 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,x1p42100-camss
+
+  reg:
+    maxItems: 14
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csid_wrapper
+      - const: csiphy0
+      - const: csiphy4
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  '#address-cells':
+    const: 2
+
+  '#size-cells':
+    const: 2
+
+  ranges: true
+
+  clocks:
+    maxItems: 21
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy4
+      - const: csiphy4_timer
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csiphy0
+      - const: csiphy4
+      - const: vfe0
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+      - const: sf_icp_mnoc
+
+  iommus:
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Image Front End, Global Distributed Switch Controller.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: top
+
+  vdd-csiphy-0p8-supply:
+    description:
+      0.8V supply to a PHY.
+
+  vdd-csiphy-1p2-supply:
+    description:
+      1.2V supply to a PHY.
+
+  phys:
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: csiphy0
+      - const: csiphy4
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-1]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camss: isp@acb7000 {
+            compatible = "qcom,x1p42100-camss";
+
+            reg = <0 0x0acb7000 0 0x2000>,
+                  <0 0x0acb9000 0 0x2000>,
+                  <0 0x0acbb000 0 0x2000>,
+                  <0 0x0acc6000 0 0x1000>,
+                  <0 0x0acca000 0 0x1000>,
+                  <0 0x0acb6000 0 0x1000>,
+                  <0 0x0ace4000 0 0x1000>,
+                  <0 0x0acec000 0 0x4000>,
+                  <0 0x0acf6000 0 0x1000>,
+                  <0 0x0acf7000 0 0x1000>,
+                  <0 0x0acf8000 0 0x1000>,
+                  <0 0x0ac62000 0 0xf000>,
+                  <0 0x0acc7000 0 0x2000>,
+                  <0 0x0accb000 0 0x2000>;
+
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csid_wrapper",
+                        "csiphy0",
+                        "csiphy4",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+                     <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+                     <&camcc CAM_CC_CORE_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+                     <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&camcc CAM_CC_CSIPHY0_CLK>,
+                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAM_CC_CSIPHY4_CLK>,
+                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_IFE_0_CLK>,
+                     <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy4",
+                          "csiphy4_timer",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid";
+
+           interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                        <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "csiphy0",
+                              "csiphy4",
+                              "vfe0",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc",
+                                 "sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x800 0x60>, //S1 HLOS IFE and IFE_LITE non-protected read
+                     <&apps_smmu 0x820 0x60>, //S1 HLOS IFE and IFE_LITE non-protected write
+                     <&apps_smmu 0x840 0x60>, //S1 HLOS SFE non-protected read
+                     <&apps_smmu 0x860 0x60>, //S1 HLOS SFE non-protected write
+                     <&apps_smmu 0x18a0 0x0>; //S1 HLOS CDM IFE non-protected
+
+            power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+            power-domain-names = "ife0",
+                                 "top";
+
+            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
+            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    csiphy_ep0: endpoint {
+                        data-lanes = <0 1>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


