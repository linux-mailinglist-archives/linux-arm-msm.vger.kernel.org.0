Return-Path: <linux-arm-msm+bounces-91721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIk6LdZOgmltSAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 20:39:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D43ECDE2ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 20:39:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D2C33009E08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 19:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56621364EA6;
	Tue,  3 Feb 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMxJV6WX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUiaXdIO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D645931AF3F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147538; cv=none; b=IWt2zMZvqjseSMlCGON0Xl7ynDRIt3c6ugjhINvicj6Meft98uoQsCHxmoUh9xCVltomKqSIvbzglTT/JcB1V3sUAIIyZIRSfGLzSZcDtqNBO8Ix9lCTbQSSEwCcvJ1PQ9phsYpTeRZlpcVPZFUqlR95CZM3BFCVYEWRLQidQuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147538; c=relaxed/simple;
	bh=yw7ChvNfk/HcHJm2A+1trVKKGLfqJZ8ysuHZIfGb4is=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=grjE4qheQQJDwHzVlqgPITWj0+4mccD9DDZXsSdEKJyrh3MSf3foNvTPHE4OmE4t39QFiHX0Ms+YOZY3wQU/KlJo4nCDLvHCooEilDt5S6txyrbU0Sl7pmDWaUTmMxjPyshfBHKnlcKMOIBFsyo8mBQH0kIRRMzMGeEmQ6bXca0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMxJV6WX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUiaXdIO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Im0Xw2154790
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 19:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h9+tceDJVv+KlB9oeo+MtIrba4b541DMzAR
	JUMskHSE=; b=TMxJV6WXdK0ifh/UJZB4vPD4p57lrQRK1yS6yayA3Edvk0oxMk/
	8MUPnyFqjwJfa9YxxSxJf+FXACumBMQEo36Wbcs6CjI7iPCLRF1f+1ryGY4c4qRE
	mbaRwRb/joCJUMeRMolZbIxyUmPrkjoWUMQrun4sGZJ+na2JQCUT2zQTBt3XuhoL
	Afd0/STP28D4JYq8xsgoQXvCfhSziX6c6pMe6m3QbD37MNrBiIpKwPmDtbIp36Cw
	330nIbDuSBeVvjiRrJmJOlpfhlIQSBfT7d+0t81i+hIsUu4NzjIAvgBZj3+vZt5j
	qS8kSk8O4CvE6KPcICtkW2JmJndg0SUOQAg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3dutj3de-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 19:38:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a9320d2e7fso903045ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 11:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770147535; x=1770752335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9+tceDJVv+KlB9oeo+MtIrba4b541DMzARJUMskHSE=;
        b=VUiaXdIOl+3TjWh9D/LuJBuwc09k0qWiBSC+XGLpNZXo6NDw1iXzSj3SimQTfqcjMy
         rxjDdKr+K1ch/AFIggvssmCqBLmFFdSJBUwRhEn5Dlk9E3Rau7GWA4Lyk8YVYVeheyn+
         FWfOzUjBNt4dMqCI1+1rqoQzDqwKaKaIaseiit+IB3IJ4E8KM3oXG/qF+H+YJfgOkfMM
         uZnYlfpXGAirIxpVhjqVsmiu57IW28pTxFX+FyT7XAMBT2IUys/Uh6vDo0XgViAvs8F4
         8kca6onfbajWMBiS5JlVjLPbUEKNuM7O52ROjZwM12wYPcNRRFYqWohyYP/LwNfp3GV+
         9MLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770147535; x=1770752335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9+tceDJVv+KlB9oeo+MtIrba4b541DMzARJUMskHSE=;
        b=YDpcwddTeiKLHU6RUxXiJx/8dvEtKpTs0VMb1XHDmJQ1xaEZpYIrDdn2B9N2NErLkE
         1RrRVfe5Vn9RQr0NNSBQIg9J9vMKjKLcrtvGoL2hyomo+KGfoufrWhhMh5+cO9C5h/5B
         pB4r3Wg1gTfatZ0QILFHy+kkxGkURDe5abspAlNcU2ZokIetRKuA1OaCKQAvMxxdxr1l
         XJHcD0tofbmuN40S07zaFF+yDYjrpRqPvGc0FU3Wy4HnMVCVKG6QpMrFVnuU4iyLcP3K
         T6GJEAQHR4LA5VD0kGwFHVB2Ehotui5v+RZiK2qqGS2E0p8C/0FjV/Jw47fyiavthLnl
         B8OA==
X-Gm-Message-State: AOJu0YxQ6v6UL5sl84/krM2HpxWGPTYSlGRk8gVyqVzjMd2Ry5QBYqKV
	/qviyXrG4JCeSbCt9oLorVcfr7wSG9YbESkX0qLSL65tdRIhS9PlKkptMapsQSbtRKxpIf/6Kx1
	pXX4rUeVF5hfaJ+wgpOMOTtyNUl+KTv+ncYGwwSacbM6qw/xDI7naBUg4pDbmRpqo2l4k
X-Gm-Gg: AZuq6aIEnVZuLdQu6+4GdbN+BRRcOt0RuOkHdBv0vnSlYLN0EwUMi4OGYg6xPaedYf1
	oBfyzcfzVjeXQh9pfQ/BueV5wapxkXzXEuSnc9cYrwTa2vMVORdftvBRivHIgGR7gDJNLuTHN+7
	dwwxlnpFHofFyvHXJIYPNCQ3PHH75E0EOjC4UZY8XWnzlh1X/UnKylgQbIY+zaCbr9njrXhFaY9
	UVQliSsxE5jlzs89MHcmoXTpzCKgGzVwDD1arxjrM5WeHA7xmxSMham7oD1G6UCcjRtx7i2K9Fu
	U56LenHBidbxpHRcT73xToF8NPTHTaeZK7WBiUN+bHXnl5R4VPUB4hTyN8Om050kiGJ4e0O6vNv
	gzTbR1AQQjvaDWJ34KgAlRF3hz53LeCnf+o+8TWEn
X-Received: by 2002:a17:902:f70e:b0:2a9:320a:1bf8 with SMTP id d9443c01a7336-2a933ce4e54mr2678115ad.1.1770147534815;
        Tue, 03 Feb 2026 11:38:54 -0800 (PST)
X-Received: by 2002:a17:902:f70e:b0:2a9:320a:1bf8 with SMTP id d9443c01a7336-2a933ce4e54mr2677925ad.1.1770147534320;
        Tue, 03 Feb 2026 11:38:54 -0800 (PST)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9338a11f1sm3368055ad.38.2026.02.03.11.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 11:38:53 -0800 (PST)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, krishna.chundru@oss.qualcomm.com,
        monish.chunara@oss.qualcomm.com
Subject: [PATCH v3 0/1] Introduce Lemans EVK Peripheral Mezzanine
Date: Wed,  4 Feb 2026 01:08:47 +0530
Message-Id: <20260203193848.123307-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE1NiBTYWx0ZWRfX5nrX2iquXRJj
 Q066mCuyu/aJlr31AWeeWzq8sXC9KJ0nvY4Y6BavXLKXUh+CBtglLfSMWb8243VhDNgrvizg0o2
 /RQ3ehiXRTRxj143Dgn7DSWZBToIDkvaaw5A8YlXdJumNWNVWzhxTWnF7Y5tb+E5nu8JjAXu/70
 mGonQUsIb6UXGNTwclS2lO329ZoZV/49667yeIvXpkwWxDdzac7hUTiKbKhrSOx09P5B8dz3/Vz
 Cq/lNSJ6hbB28m5rn0sAwOyT4gDVaatMJIfr4H1MHv0GD5C8FHqq8zE+fu3d0D87K47CRumxl94
 N1O+l+3+Y/8Nqnq3C7W32kkrMbWc+TL2LxTjpfzNzvOtazWQyoty4UF8qtv077slBmn1Tm+0EXC
 mnFitBRU/nAhsvZ0P7PGgOrXCz/8ymEmJ3VZvBUWKn46zB1Yx2nVgPBKehCDzP65q/ogf4dKPD7
 nZI9wcwu4tBQA7xj3GA==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=69824ecf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i9EfSPZJsWMLY0D97e8A:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 63PvdngYvNMKTDA7_8nzQ4iDaUzg7lgy
X-Proofpoint-GUID: 63PvdngYvNMKTDA7_8nzQ4iDaUzg7lgy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91721-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D43ECDE2ED
X-Rspamd-Action: no action

Introduce device tree support for the Mezzanine peripheral expansion
card used with the Qualcomm Lemans Evaluation Kit (EVK).

The Lemans Mezzanine is an additional add-on card which can be stacked
on top of Lemans-evk board to extend peripheral capabilities of
Lemans-evk used for industrial applications.

It connects via expansion headers on the lemans-evk and provides
following peripherals :
- 4x Type A USB ports in host mode.
- TC9563 PCIe switch, which has following three downstream ports (DSP) :
   - 1st DSP connects M.2 E-key connector for connecting WLAN endpoints.
   - 2nd DSP connect M.2 B-key connector for connecting cellular modems.
   - 3rd DSP with support for Dual Ethernet ports.
- eMMC.
- Additional 2.5GbE Ethernet PHY connected to native EMAC with support
  for
  MAC Address configuration via NVMEM.
- EEPROM.
- LVDS Display.
- 2*mini DP.

---
Changelog

v3:
- Sort regulator nodes - Dmitry.
- v2-link: [2]

v2:
 - Move "regulator-always-on" and "regulator-boot-on" nodes at the end -
   Konrad.
 - Drop labels for inner entries of ethernet1_default pinctrl node -
   Konrad.
 - v1-link: [1]

[1] https://lore.kernel.org/all/20260129172850.1175728-1-umang.chheda@oss.qualcomm.com/
[2] https://lore.kernel.org/all/20260202194234.3701434-1-umang.chheda@oss.qualcomm.com/
---

Umang Chheda (1):
  arm64: dts: qcom: lemans-evk: Add Mezzanine

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../boot/dts/qcom/lemans-evk-mezzanine.dtso   | 301 ++++++++++++++++++
 2 files changed, 305 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-mezzanine.dtso

--
2.34.1


