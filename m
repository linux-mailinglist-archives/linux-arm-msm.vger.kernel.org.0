Return-Path: <linux-arm-msm+bounces-117117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c3H4Mc2JTGrhlwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:08:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CD17175C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 07:08:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=buqbwuwD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VwLu4GFn;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117117-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117117-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B48930191BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 05:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0655379C37;
	Tue,  7 Jul 2026 05:07:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25AE2EEE61
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 05:07:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783400846; cv=none; b=PlvMZJnts0z7VxPsssSVvHqJ/V132a/LHMJTXgvuxM/7fZcRDvxJTN9nTPnlGmJg+2M7sxFkvm0BhdSaJ+7SdSNEY2jPnSclCQGhVfTu1PN31Gb/7sZu4h6pIybDH8PDrQFxszz84t5Ae8QLpQMsBrcqcAn6AHNrNDq2lNut1NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783400846; c=relaxed/simple;
	bh=eqcCYKMryMGwlC9zaraKEy9MlKfs6kQJBp/plrMSrgg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QL1DErL8NGoaVKlENNTzRfLchuu5quUKNNdbSBdC2IArAt2fs6WNTXjqtufGCtpcQrNSS0LHr+4u+8uF1LSMUCRePezoAsu6CNOQG6Vat6j31+ZcGoJUzwr+Y10y0FmLuDz6EgWgfD7CenCwNOpoBfPeMV2qznzH1/8dYpO5SfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=buqbwuwD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwLu4GFn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748t632670129
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 05:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vUvi04PvZe61cI/q7bqpiI
	6kNccx4dvVj6Inrik0xB8=; b=buqbwuwD1pz+XgszBJuhRfrPwWMdK+eO9ZRaFz
	8Vr9NBJ/BsRaw+i9VtpHha2co8Gd76uEq0+LLhmETwunv8+APDHuOPymU3itpgKi
	LC7bAXAy+mYaLBnywhRbcLsO8or8ZjFJ91fIvlnJT1kntaN514MnUfrLWcx3mL6r
	LxopOsshDNbrTMQDhvR/36/ty97OQBr5Uz/VD7LpyReyKG1o+N7nxVJd8+ByFNwh
	w9Yc2C51iY4aGaZf4tN5K6KYHWlx15izIiPkSwzfgDnx4PZ67RyFEz57kr4YHX3c
	Th20qUlyytlIr44N7iz3UIA7/yl92mAJ2e2YFPuShYyhx0bA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgvakf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:07:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84622d6102dso5339257b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 22:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783400844; x=1784005644; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vUvi04PvZe61cI/q7bqpiI6kNccx4dvVj6Inrik0xB8=;
        b=VwLu4GFnlb9N6CDXezUw3nrZm/hW8vIhTk8V1sMxW9jQSzavC2ZYoO7wKaWoGcseqQ
         EXpNO1VI3cA8movbu1rUL15GZFqqEYDqwIA7gVEyTKhIsAvJdoN/F17BXcNk7XNMotIb
         nomZpxohpqqLuig9FIolJAbN51LnK/AUMqkp1MIvRsUqW5CwFVeXSYs+RYdeVwY9vF/e
         empAiQWn2zL4SQvYI6Z9hksV6ENQ/bN4cUdlCRrXJS+yzjD+NV9Xh4AdR8O+ihKUxM80
         +QBQvg80sXa5Qhygc9aUD3aqpTCYFN/EP7GmVk1cqFC1u2/F5BlGXbXe4Opj6OsO6MNn
         4qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783400844; x=1784005644;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vUvi04PvZe61cI/q7bqpiI6kNccx4dvVj6Inrik0xB8=;
        b=tIEAijVFqbZPRrkvhnb0wI1fl5X3kx2UCg8NKaeSP0aw40FlT5qfLSqCSn6jfJzixr
         KMUubvyTolsr+0GRKDuajejLJxX2wMItcWG5+xrLvp+R+vpUT7Zi8chSmob5OJoihd2n
         sHUPDD8v0z/5VPet/G9lF9viDnYy+Bq04yM5Vl5pMyec/AbtpjZvyBhy5fk/d0FfoAMX
         c56Or/CWyN6dJtJhRAAB9kkFT7tZV0qpuf5Zgp8RsJ8YLjPJPe42ekuDWZJ000sFKMdV
         jjRBwcONRxlF+83CJgS7TrLt6BMJhxxJH789OP+KOmDMMvm0WlIIMtwj4KnSPDUE8bv2
         7AWQ==
X-Gm-Message-State: AOJu0YzAo6u4WZcOtLsJikfZ4uSK3U6a6TkvW1ku3DOPK9ny2/UsA1Ai
	d2XnZ7rm8Ucv55y5zW8eSMPsu0bslWCpjUZf7tvjEw4xsZ2pCn8QfIt+Oqs650hyds92iSRg9Rv
	JTiYIgCmtG3HWhra3268uI/9JFWgwei/TKo2qQbjJAXZGyoxjjfGGOK+BQp/BwkmTwyzQ
X-Gm-Gg: AfdE7ck6BlwE8bJc05C3etiluWoZZM+ouhLYcuVdmId17O8O8G4VeioUWpVdFyGIKEl
	x4T3HZvmFAqlSr2tYCOW/PLJ8a0DeQ94yJ/JKJdNTHUmlOJpLwYSoHvIitz0U3DdqKhcFnSYo4j
	ZE1BxIekJgPvoZ4UU/VjuGcv8ZRzlXfiMv4ZmcdXC/ecN8L8IPX3tLZlXHG60D0cUDQcxaZ/397
	8U8VER7gfq0oD8w9EXEDZIM0R1Ac1PRqDT5cAEwanQp78nnU/wuFVUqKMLdDeV5AGbX9H6RMeCn
	XfB6lOPukd8eMEfWNluO5740tInuSVHfQv1Oi/C1lP131/RPKVz7jXsmvQPDKnUdOAD6Hv6Nbvf
	M2VJFcx99f7euPke2XtmRuYC5GTABJujA9ZPtrXOkrrXrVuAsdpXcLdbfA7aQQb4jDDfSIhBZhJ
	HsNqHj
X-Received: by 2002:a05:6a00:bd01:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-84826d3e5f0mr3388097b3a.34.1783400844135;
        Mon, 06 Jul 2026 22:07:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd01:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-84826d3e5f0mr3388073b3a.34.1783400843646;
        Mon, 06 Jul 2026 22:07:23 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162b59sm352300a12.16.2026.07.06.22.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:07:23 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable PMIC Glink nodes on Kaanapali
Date: Tue, 07 Jul 2026 10:37:16 +0530
Message-Id: <20260707-kaanapali-pmic-glink-v1-0-3f7d476672d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAISJTGoC/yXMQQqDMBBA0avIrDuQWmhoryJdjJOJnappSLQI4
 t1NdfkW/6+QJalkeFYrJPlp1m8ouF4q4DeFTlBdMdSmvhtrLPZEgSINinFUxm7Q0COzeHd7MHt
 LUNKYxOtybJvX6Ty3H+Hp/4Jt2wEOZJEmeAAAAA==
X-Change-ID: 20260707-kaanapali-pmic-glink-ccefd39ccf7a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783400840; l=761;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=eqcCYKMryMGwlC9zaraKEy9MlKfs6kQJBp/plrMSrgg=;
 b=XDlPi7cLYgtqwj+vt/NyIESfCAOtx2TYyQIO/IWZ74979X0MdGgA4G+8OIS4QuHAkt/yZIqYU
 3M5I++7Adt5BYLxkrL5Ksvdn6/LMNFO1Ri0zxXGWWUUBh2Keeo5X4L9
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-GUID: fR0h96BCf7dFWyah_esSq_Ha2ymXq72r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfXziXehF2Ry37+
 f/EfYY1aInyGECsBkwHFKFgB/mEa1zpT+ZpAT0Ovm3fdZP2AvisdX/FgB/A7qtYlaex1Jps8CY9
 QGIN5b5MxTgwv+rsuagS7pgej2nhGhOFb47/2DaBbtmROKX/RjmkNqOfbyT6HqxWBcr/w7ynObe
 bqZGswxzz9CzmYVQlaDDbGLtI3xvlZZ3vTpJPjIUppdOiWKw3kDuUCwPbr9pPXqBwTqUpxrccRh
 5ksftT4TXivdg8KOy12fwS4J+FB5D6odAj8m9B2j+NyIT/DIUQZgxD+XbvVWSW9j+fKgrEAQMWE
 VW8TDTn8StnNXbi84DXsYZj5oygQdltKrd9Cbu+mdRSzYS64CruuAkBbQSqXUqvJf7xaX6A+pBJ
 42n5MZ143rQ1w/G8v6NoAmcBoeqiGWO51CvrIvn8qZM1KXvu2UFSVNpOa6xhBtryg5I01nZnQL5
 ZKJ8oWUWk73FdxHNJpg==
X-Proofpoint-ORIG-GUID: fR0h96BCf7dFWyah_esSq_Ha2ymXq72r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0NSBTYWx0ZWRfXyiIaTVc2UNLe
 ScjVBCjkD854mH/XCdGAKo0VOoeGFucpk4hUNrPSsTNWIg7aC8V9QpPOb9st3cwY5Jmt6MJwFDe
 /UJgtEkoERBEsQ3IRkXFq3gNlNBgmQs=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4c898c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LW0o7yOu68IG-RbqnHwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117117-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22CD17175C4

This series enables PMIC Glink nodes on Kaanapali MTP and QRD platforms
for providing role-switch notifications to usb controller.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      arm64: dts: qcom: kaanapali-mtp: Add PMIC Glink node
      arm64: dts: qcom: kaanapali-qrd: Add PMIC Glink node

 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 53 ++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 53 ++++++++++++++++++++++++++++--
 2 files changed, 102 insertions(+), 4 deletions(-)
---
base-commit: 8e9685d3c41c35dd1b37df70d854137abcb2fbac
change-id: 20260707-kaanapali-pmic-glink-ccefd39ccf7a

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>


