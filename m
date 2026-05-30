Return-Path: <linux-arm-msm+bounces-110410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCrCIZ0tG2qU/wgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:34:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B21611FE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5EBD31062D2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 18:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911D73CA493;
	Sat, 30 May 2026 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtDwerSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6sjLKxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE6A3C455B
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165722; cv=none; b=Yeu4FI+U4yRnMXlHxWLZyQBVIa3CIADr4RJ/tHUuJb/VRzzE/IKg9GRxYuNFYO3QTz6hpnR6vq/xI/fXuOSSse5p3SPAlNO+zmF1WCkaGQ4INyUW8Ob9n7ZoIJPTC+Li8GowgH1mD2TbS3EPusB3+4hZGzbV5WFsbzlUg/Afdfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165722; c=relaxed/simple;
	bh=17Yiv9qE2TbdWW2B+sfjsCoYrdlNtkiAjWBT3SqBDO4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SNuzQ6FKckBEEgOGR/AbsoTvN4OWdUpi+PoasqymP4spBhOqhSCEeRAHDFEsatiD/3PdS8Md9nkt4irTRj4gZfp5g8kXzOCEWbfGJMVt8u+a0oIVEfn0BF6wzX+YseTdDZM6vfxkz5hk7GRi1vnVTUHAQCzKejvUGJYtysxrhbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtDwerSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6sjLKxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEQ1rR3471456
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZWBrjk8gfGrILzQzobZsj5
	BbGVxX9kwkrJPUxOT7Bu4=; b=BtDwerSGs8d1p+u/8Vjtj9QFR/VWWpehyuqzr7
	Z7+caaNqK5gARi6BZlimT83uuQ6y6lsGJkzfnyLEIEZt/TdjX4vUXYyf38UoLJOM
	DyX7jWJmmU+je3GYspk3GEWOu0PBHLzi6CVzzYdpO5b/P8QDJ1PqNPpTYsJVvGvB
	3ZKsKrVP/LaEeOEjWO8n8ZnGO/PhgcJqFfsT0qejhE17ZWJZqqUDpsRMij+abm3s
	F6PWdJygiK6YZy2ezU4UoJALCgikkmo8OPO5QpqduFsLVmvxTqBoVsYtkpvjvPxV
	ttFcn0Nk1SYTgGCd1PQ9mQlwOkZVOz5nBWkwkW9r+7BGmZJA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efr989n3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 18:28:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf11699875so29235835ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 11:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165719; x=1780770519; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWBrjk8gfGrILzQzobZsj5BbGVxX9kwkrJPUxOT7Bu4=;
        b=H6sjLKxF80z8B9RDWEiiSj2wYM6z76UAv7Py6kL0pSpDIkcyze1+oDD6tJB12ISUW2
         k5l9ZFL1oiok6IHlA0ybmmrkk5WgKxBWMEkuWE/zbitsuH7tPm5Arj4ywxt6lX/r1+ce
         iQ2ZLpZC5nKggdvv6m//MgzipoEJYpsUG2HeOztP23jaaOH05RT02w1O+c+AVoqQ/BuE
         T98BGUV9nisFnvQTFEVQPtIRWC/+c9cVaq2uT2Ug8keBo9YVj6VzSWCt9zuszF18G2qR
         sjibSpOsCsIK/XLMvQN1XECZShZQzxtgDnhf5VOz1xG1PumYVO57HIUvfg3+qGK9YIzl
         iMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165719; x=1780770519;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWBrjk8gfGrILzQzobZsj5BbGVxX9kwkrJPUxOT7Bu4=;
        b=YAIA+C5mPM/r9bINrj7KdMRlGO4E9/DrBPFZM3oJMD+VtJrmmlV6k/Kc6YZJU4M2yK
         uPpdLLz7QLIrkmXhTouB/AFGMoJxiqqNxrvCagUgqxY8P9ICtc7hu63kbZo+0mgpH6/E
         OPFOA9wDUUlhhudVT20cpIS6C1dhbJy7BPhZq83XO/UDfhu2W1tPR/gok5RYyKVp8evU
         qT1kxMe9+DI5R8oxftSL+IVuo80PMeykBUENNGn8Mfg0//NH+0JMF2ct2HdMon1iCgAy
         03J1JFtwvLbVuqhlozrC9W7gd0MHhQSGAtolgTNW0EENkCn32YjFf7RvcwLQsH1hEt0q
         EDbw==
X-Gm-Message-State: AOJu0Yw37kh/aEaCc9KWBEaAjdaTCIRwp4KwwEseK/UmdQhe1Hcd+Oru
	b/WO+tzivBvRdeJkcKFYPAymHEQ+uJzl/Itqu7tqlClR8qxY/PY+GJKM3RgNxDhNSDR382HKjc9
	bWT3U9SSjNbR7DaSZYXkMFfH0y5Wzdg7dDUlIJfWAYVXElmR/gyWptOvLKN5x82VOktfu
X-Gm-Gg: Acq92OHi7CMUjcjf5xIcHiuyIkqPaenISbJSUFBuPfkR+mJxZddoykPPGub+YC0Sg8y
	R2/0/KRdqJoMwl04fnXfEkZopU0BWwefDw+YKyKfDUclCMc8NE3HWZpbFwLdSHEGFcIq4DY3in7
	pNUEXsEFnU62GAxmOWpksGe1wYRF/IdtJQO5ILuBsLFk/PvaPnT5glpLl9Tu/DiuXEs3YIBfKcv
	q8Z6Ljb6HtNS5Vr3tjB8z8XM9etKWrMOsSBMzly1yIaorG0z9BEfueihmYhkhCrSQH0JQL0xfoo
	N77LVbDyyWzaLWXX5uyx8lyUhyRMsTsTnCMNHV3r9O7UCLRa8hRolbe9IsqiwOWt0enWPVijMaW
	ZRQUMaDGw7sMi7VkxJtytn6VvGJOlFxyprpcziuDcp9FO/FO2eG2hBI6zy4ypiosnrQ==
X-Received: by 2002:a17:903:228b:b0:2c0:af09:f3d4 with SMTP id d9443c01a7336-2c0af09f567mr21537755ad.27.1780165719162;
        Sat, 30 May 2026 11:28:39 -0700 (PDT)
X-Received: by 2002:a17:903:228b:b0:2c0:af09:f3d4 with SMTP id d9443c01a7336-2c0af09f567mr21537565ad.27.1780165718591;
        Sat, 30 May 2026 11:28:38 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a27ee3sm56879635ad.36.2026.05.30.11.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:38 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Enable SPI on SA8255p Qualcomm platforms
Date: Sat, 30 May 2026 23:58:22 +0530
Message-Id: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEcsG2oC/0WMQQ6CMBBFr2K6dggdaQOuvIdxMdRBaqCtLRATw
 t0tunDzk5f891aROFpO4nxYReTFJutdBjwehOnJPRjsPbPAEnWpsAF21A4MKVjwDhLVqFSAWmr
 NRIjatCK7IXJn39/u9fbjNLdPNtMe2x9d9CNMfWT696VE2ZTyVBVSodaVBgkh0sLsiokGivbiU
 ypeMw3Gj2ORR2zbBzdenGvEAAAA
X-Change-ID: 20260529-enable-spi-on-sa8255p-8166eaa226cb
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nikunj Kela <quic_nkela@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165714; l=2558;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=17Yiv9qE2TbdWW2B+sfjsCoYrdlNtkiAjWBT3SqBDO4=;
 b=XXkD/QKdjaNZgz8iLvCtJTsxJBYT9ET5BKXWr9oUONBTDMdnrZOS24FOCTb0bfArZqET2uJUW
 Zzqz3CAS4WSB3fe9o6QA9MqDQcQYV4SEEoN7JLLNKSv9W54V941+xIG
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=BaDoFLt2 c=1 sm=1 tr=0 ts=6a1b2c58 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NeO65QaY_C3oiTlxhukA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: nZdcsVejhZQ-nDv2SeS05ZBHp1vWU_1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX6ttLJZKRnlZH
 i9+HdtXddKY7bHyYVuBztxd6zKMn4jwMDm3/7ey+NqvPMc6m/e8UdgT+2EW+D7fdkKlp/zl4tLx
 OLPjpQKnU6R02s6Ju+DktRumFkUEW0R+1IczstKxQipwnlZ6xxOMAvwB4Z79Dls+gpIyeaw2qD4
 k7gIGbrz3GTJbFmiqU0WwF1ep+SMdUW1qTDrMGa0iQovE6d//+7wH4cBUFU1W+PFcJhda1UwKUN
 zBLDgoWLmC9zbOI/RSBMtfea5PNTUTmGlyEnSFAuYq0ypfLAjyddxexGXA2tErr6S1B7LZmn1VO
 CpumsCqTjgm1wc/NIIdYZY05OVrlvwyAeHslEuDGPp16ySLgtQ/fyteG8BzihzYoyom2/f88wFe
 +HAbfO4oNCGKhDIFb5l9SMVRRF40KNydXlxFlIVOPZ9leKegz5Ds0+/mhoyLKRwdg33uEAcCome
 XDN4dMEqkyzx+EcY8WQ==
X-Proofpoint-ORIG-GUID: nZdcsVejhZQ-nDv2SeS05ZBHp1vWU_1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110410-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 04B21611FE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages SPI frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate.

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Praveen Talari (4):
  spi: dt-bindings: describe SA8255p
  spi: qcom-geni: Use geni_se_resources_init() for resource
    initialization
  spi: qcom-geni: Use resources helper APIs in runtime PM functions
  spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

.../bindings/spi/qcom,sa8255p-geni-spi.yaml   | 63 ++++++++++++++
 drivers/spi/spi-geni-qcom.c                   | 83 ++++++++-----------
 2 files changed, 97 insertions(+), 49 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml

---
Changes in v2:
- Rebased patches on latest linux-next.
- Link to v1: https://lore.kernel.org/all/20260112190134.1526646-1-praveen.talari@oss.qualcomm.com/

To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Praveen Talari (4):
      spi: dt-bindings: describe SA8255p
      spi: qcom-geni: Use geni_se_resources_init() for resource initialization
      spi: qcom-geni: Use resources helper APIs in runtime PM functions
      spi: qcom-geni: Enable SPI on SA8255p Qualcomm platforms

 .../bindings/spi/qcom,sa8255p-geni-spi.yaml        | 63 ++++++++++++++++
 drivers/spi/spi-geni-qcom.c                        | 83 +++++++++-------------
 2 files changed, 97 insertions(+), 49 deletions(-)
---
base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
change-id: 20260529-enable-spi-on-sa8255p-8166eaa226cb

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


