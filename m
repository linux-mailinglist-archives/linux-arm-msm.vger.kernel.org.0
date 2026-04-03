Return-Path: <linux-arm-msm+bounces-101595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C6AGVINz2kNsgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:44:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D34CB38F9D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 02:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA62E312F346
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 00:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE9823BD06;
	Fri,  3 Apr 2026 00:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JqvtFzVw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ch6efdQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CEE23A562
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 00:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775176578; cv=none; b=ZFE86lMttu18Q4JbBOEW/oGCm8r4JF6wUmDY4p6ZAgE4rUVwwnLo19FJafl9iwzNDr68ga5StkjH+ZeFUaj2piLrEaVuaVrqXP+1xvnaRejSTZRBK80dPjOnAiFxcKcpHScUJxuV2vJpIjJEwy8RfsTnxSyM4LfHZF3JNEx6ot0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775176578; c=relaxed/simple;
	bh=8+zQnJVyiAurgkjhPC0Db4ho143HWCzHXfzFv1rHJrc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IMpYLDqe2RXuUWdolhbiNdmJ104OyqP19V/CHgdy3gcWI4/HnBbqXs5riQkciC3nkerU+zY1GAT6c0v3FOmTF8kbaR5X9bJtaIMZHYnEU2SfqSimy2DureXqbyPtutoL7twvjV4D6D4TFVX0DfN2mtlLrYHGcOzjiwuzyBO6364=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqvtFzVw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ch6efdQi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4g241380883
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 00:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h5UAAm/txxqbelO8VDP+Qh
	NQZ0HfLYdusAPKbzIIshs=; b=JqvtFzVw83pb30qhKk11CX19n+zsm/7MBeiB7G
	Xf7s57mq+7OxjmXhIeLuU/U8REts793Gr925F2Mfa2IlJDJ3zOKv4mCiq6bZ3p05
	LbHKyuMc2uyUtZERnzcVNC/AoSeHtiCr2SzlYrhNkUYrHsYzC/tqSdkAVvXC47J0
	iKXT2BPJ1iTkKj2G/ze3ZiVgYf4omp5Js7Ob4siHpWrgkT1Qjp67sj8L5otXMxzO
	/6dAODC3HfD8s0i8DjdYqtOpTTdL4aY46RqEnviGyzXkGyXuucpAHCJ8E/zSIh85
	+gr242b1gQhbLvWjjffF+NHntTuxmjtq54Dy4+S2zsHN/iYQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myhb9k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 00:36:16 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12737f276a2so2224772c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 17:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775176576; x=1775781376; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h5UAAm/txxqbelO8VDP+QhNQZ0HfLYdusAPKbzIIshs=;
        b=ch6efdQiu3sYGbtS5YrzKM5iYKMbTrr4cHCnhVhu84pGGBGWqcoMrAbg6aF+MjYJc1
         Sg4vKUpPFTyGDCLhUyzxuLvUUjIaCFheU5y5I3dC1H+suGHT2vGJE9r2pCHrF8F0nW7D
         lOXDe6Kv8LvJ6RqZZRVz8vmiPDfs/DRXCRLyCxjYkW3a8bar5bhmrUbuECH+iRN5iLa+
         hSAcamTELjXML7TSqpv+1XHxE6adMDIl4rcAVQadypb4fZ29CqoSerNnxGiCwz2WGUSn
         nZfJJbYYkSadccXS1Fi5jAV3YV3lpixd5xc+pxxRjeCa7q0LbTmEzbHvN34450EeJFhb
         SFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775176576; x=1775781376;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5UAAm/txxqbelO8VDP+QhNQZ0HfLYdusAPKbzIIshs=;
        b=NivMTvRVZAMZjnYQUp3rzpZjhICzx9jMNWPNxRhslg+08tUOooeB1GFKwiV0KS7hUO
         ftEyM0xhlM4iXppKBim6WrZFflHFV92VF60524nl9AokZuKjhZXqdmMp0L7WMQMWCS8p
         hOTbEQbRUtt2Tg+MjU++KH5LfY7RudcZ0iZwKS0vHFRfbClfrvp1VFSXg9Nz/eXmpIs2
         h3kYyMfWL55vZzr0BXgveh9ZW465/ndcIKOUen3u1yEMUgHFgSixqWmwXzvrsm2sRakz
         mCttkHBvDCZMWA6jqwc4zf/djiI1qq+4GQBEOD6x6traFG55d0E+qGvU24ClP3GRXOuw
         dlqg==
X-Forwarded-Encrypted: i=1; AJvYcCXOH07nRGzgeJ+FRM+L5sGWNxo5NTU44Wb823VFky5ZOVRWgtK9Pt4HIdIXdpUqfQGQXSsMHVpS2noG2uO+@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjLAplavQxxBlRe3X7niz8n2/nM+8jJy5V2M7r1XShg1cNZes
	juSBP8QYZm9XiUgaP642TRxSCryzfJAneg/q6rBeyQ3Hi9hUWtmYLrUmuX627bNfgRV0T3s/eCf
	D6aAHPHrYpzHRTtVHA5WRR7MCjHo76Af2T+bbnFodaQBAX3BiFecmbHG1D6zgIxSLP6A/
X-Gm-Gg: ATEYQzzch2kBzfawB1A6DllKtdDrbHxe8Gq0rEN4PY1bgd4QOwMJUCeIMjXaz8WcsrN
	iuo7BfOrnDFbD270oHtvAr85DCgQr4CyAXkh1ZQpYTPK+MpDw2a2TEjbxzvA6fvwsy3rf68ILpx
	T4ZBMUTIjuG2Wd9FKpXGTwPfPGxc7dYtKqD9rulNmmcstCrlROm62qmBI/8E1HpYElZaGlmVG0p
	P83iVFc2Z8ncuTrSfRCJOlRIfdO1Ttceoue6zhb0DLcAqRq/5u+TFqOmcSPua8LXfr0o0WpX8lV
	Xag+1PqPzcGW2hMB7ONGYcasHVAoYBBx/3mHj+v+n9gVuNVVLKEwyAEk+D4y3IH9BJMdpMkTYAh
	DV/4y+NDBfx0bUkK9w6oT84jD7pN7RQxqN99x/+yqV7HzLKfdMEodDyKkk9xd2VrA0QR9OAFgLg
	==
X-Received: by 2002:a05:7022:6997:b0:122:3a5:fc42 with SMTP id a92af1059eb24-12bfb745a46mr543692c88.20.1775176575950;
        Thu, 02 Apr 2026 17:36:15 -0700 (PDT)
X-Received: by 2002:a05:7022:6997:b0:122:3a5:fc42 with SMTP id a92af1059eb24-12bfb745a46mr543673c88.20.1775176575415;
        Thu, 02 Apr 2026 17:36:15 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm6290550c88.0.2026.04.02.17.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:36:15 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] power: qcom,rpmpd: add RPMh power doamins support
 for Hawi SoC
Date: Thu, 02 Apr 2026 17:35:20 -0700
Message-Id: <20260402-haw-rpmhpd-v2-0-2bce0767f2ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgLz2kC/22Nyw6CMBREf4XctSXlER6u/A/DorQXWyO09gJqC
 P9ui1s3k5xk5swGhN4gwTnZwONqyNgpQH5KQGox3ZAZFRhynle85BnT4sW8G7VTrC+5qBpRSKx
 bCAPncTDvQ3btfkxLf0c5R0NsaEOz9Z/jbc1i7694zRhnsim4rFtUzdBeLFH6XMRD2nFMQ0C37
 /sXVTl4/r0AAAA=
X-Change-ID: 20260401-haw-rpmhpd-b40a68a3ce79
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com, Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775176574; l=987;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=8+zQnJVyiAurgkjhPC0Db4ho143HWCzHXfzFv1rHJrc=;
 b=KvoD80jUtV9+vyWUVroOchLMOdOoMkZyHR1Wbl3LaSjT1X6E6Z9yI7FcBnVPxBKAXZBbn7VWb
 kn9+4EewxT7DH9Ann9pWE/obgLWjPylMk+3UweVfu7sfhHnD4VxliEr
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: VClGH1Zfm6c2yiVZkV-5AR60CabzrVpv
X-Proofpoint-ORIG-GUID: VClGH1Zfm6c2yiVZkV-5AR60CabzrVpv
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69cf0b80 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=q5vjKfq5BPxnf1QuwTYA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDAwMyBTYWx0ZWRfX8zCmr5Nn8mwS
 QtFLfRFVEj3hDdzHWPwJlxgeCDnE88gHIw767L2GLUH3G8TThGMLF2JJ2G9ZUUOB9JXKERRjU6N
 GSQ2DO2CT+r49YA+r5ESbMvu/KF5lrN+kdDTUS50573KIsB7AWs9L1KDJzka/VrOdHon2+S5rHa
 EIf1NJocZWhqKU+WsHACFPHtk3D7s5h6BlniYS+q313faTm9yaskxW5kI58kiu10ZJvdakqhl9P
 pZ3v1XHuYZo/3CGdpleBpIkmqLb0u1SHZeyisPt8alaxlpQ1aqcWBYZgqtQl2aziiiDthS0qrY9
 8ohoSbTxMhRCzLgNuxoB9UBt9oeSylxg6pJ2iPCnONFOpbbTqQDmzATSiHz9KsXZjsHO54CJBXJ
 wGRVMRtZ96KoODEkkxVXRLo6b+I5gYm1gGmxR+6gYuEYabGk9B7PhV2OAZJYKjfvsqDguPbfXmu
 73IT0aIF5hWaHBZUKGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030003
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-101595-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D34CB38F9D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add constant definitions for the new power domains and new voltage
levels present in Hawi SoC. Also add RPMH power domain support for
Hawi SoC.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Changes in v2:
- Squash patch 1 and 2 into a single binding change
- Add trailers for the new patch 2
- Link to v1: https://patch.msgid.link/20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com

---
Fenglin Wu (2):
      dt-bindings: power: qcom,rpmhpd: Add RPMh power domain for Hawi SoC
      pmdomain: qcom: rpmhpd: Add power domains for Hawi SoC

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 drivers/pmdomain/qcom/rpmhpd.c                     | 38 ++++++++++++++++++++++
 include/dt-bindings/power/qcom,rpmhpd.h            | 12 +++++++
 3 files changed, 51 insertions(+)
---
base-commit: 33b1a2ee3a3df63e7a08e51e6de2b2d28ddf257f
change-id: 20260401-haw-rpmhpd-b40a68a3ce79

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>


