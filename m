Return-Path: <linux-arm-msm+bounces-107515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJA/D5RIBWpDUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:59:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4114353D773
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 05:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE5493027FCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 03:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3113AB273;
	Thu, 14 May 2026 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCMZ1dGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ea79RGEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F073A7F6E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731119; cv=none; b=SpyRuuASXgIaYy+KZrG2UKbpuG5qJ6LDfPVwcqk2NLYJr2RkHgOr9RZUSumzb46suAhtMo6JPzTY3oOnNyAU0N8cB82F0N88+6hjr0AC7Y70FOy7Cf/HcHD0eFlyeI6hiiKpFJyYPoP4jju/wMW92F3f3QRmX1EXX/SJXFeZklU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731119; c=relaxed/simple;
	bh=6O/bG6e3vMsFCbLsi/7u2c8deVs4V79kNnaTmQ94xEQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E9w3RNeir67XayCEluPgnX7B+DtMZmOQDBKTiz5vrcCc795VdrGAOpvNM7VIILn4ZToy4kanktzIOU4LTD8pjoyFYYgnO5I6tDvtEosir/gDt7pFHkpjKYurGNmte7A/941BwI8gLeWozF2LrkseWlLw3qXEm6JAdaRIbpjS9Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCMZ1dGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ea79RGEY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DNxKks4160087
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TSbDzdAE8ptqW0SfenM4rB
	SaW0jC2PEUuRNQdXSt2gQ=; b=jCMZ1dGYwnJhzqEltTALw1P+Bz2QEP8y7doYYE
	aUVBOmmEgvhf43BpXH4nyTYTGOQngvBn4hsh1ctXqPk1oZK5eccFGPa0FTxiCIOy
	ytaY42FQiPJmsnAUWIKG/uDLaY/aotprxRywE5fQ+/P+4VzOYs1/6ITVxNxb4dol
	QXaMazMe3LplhQ6f2QdqndqNjULt6vBRddiv6mjFY3TXwlwsIYV5jC2wZtndrWQr
	f8+9Ebe7LC1L0axhlPEo96MY2GRlbiNgNGHeqWIlyGUZtXA/+4ctYlXvwUCH00j3
	c9947sg+mxFNVh+qftgeOErWLPtrhhtBqKwLATVPyfJqp6vA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91uyd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:58:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd1dbcccf6so40124515ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 20:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731116; x=1779335916; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TSbDzdAE8ptqW0SfenM4rBSaW0jC2PEUuRNQdXSt2gQ=;
        b=ea79RGEY5IiOn2dyzeRt18gNtqE7Icej/SN3SNeTeG8JpVuNPC8A035ezy4n4DRmKd
         JPoSzNh8g60ZJfI0xkt0S8Mgvb17XzZEMi+OqadJzhNsFtD0v+dNOjFYnp0o/7rd3KlG
         7X6NBQfQS2TRm1CmuEyHQZzzdiGWUwTqqY9cFc909AXcqnBsEZ8PnP7w5hGZXl596U/U
         RthYLbyyxzUGkNcRlJ5YQp/eX8QzH3fUzA6/ZU411bVQd9DJt1Wy+7SW5fkaDLRpdOlT
         f+CIxb8YLimpi68Lzj0XhbaDMUk+OgGOc3fP5AnOruJVQAiNUHlvR3263IpjFQytHhwh
         8jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731116; x=1779335916;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSbDzdAE8ptqW0SfenM4rBSaW0jC2PEUuRNQdXSt2gQ=;
        b=hUfj4yLemJrTalJBozrxfQKOfXp6umP+8ebWHQ67z8ubae7cLm+DJI6Fk8NneB5TTq
         ukingGFF2HvMP68BAUElMi+IwVpJKvZYxyfT8fAoDhYeLrkRaqX0C/pcxoppH0DDkR3u
         SiMZ8ER0QteJNqpptaSjCPDsI6FhIo892bZert4WCyPhCJFEToIOyn4SM7hGBZ199Ofh
         ymSgLbx9qI7H+hWp6LyihuXy2CzLUzBJe2xzZHAYx2JNiuZdtcN7RJgiu/qr/FP9K6Vn
         CGsDtPpfSlQnQkAdbN1y7SQvqyxhnSi9PVV8m1frbwmcXqGrxQYpfQZFm+MkHxOKlCGB
         IabQ==
X-Gm-Message-State: AOJu0Yy6wVN8rSW0079Nv+M2SDA6jSetbs6EcFEkBLHso/dbgYd6gxf9
	vX9+YPeQLacUZ+//DWAJZ3+H7n0CClgbjDWn7LvxSRV6rBKYe3IA3WsTmQA/AOJ4qqtm5FWsDMH
	Ah2ZIDtWOCxkQXwfxQho9qETWB8VGCp23p5FWkdEsWZqg/gm3kkIDVXzC9i0J7BRzmLN1
X-Gm-Gg: Acq92OHYuizop4eoGDqOiYZFvnE4ob80r/Dfq1j5HZFnNr50cL99AyD4Nv5sKWFOQTE
	jf2jdLz1UUDbomSB8NfyrJ2X6++GcPASHgpdpGxrWmTQlhWEuzfdRmDyOE/815aEf9bWtxUGHnu
	BPNS+9Z9a5d5g7rF6dFWJ39zd3QQSNiNFrt2KvPn1j4oUmQ3n8Y91PR3V4oZE7ITsn+0B1y1vT8
	+beITVNy1b/E8Do1WDD3O4O4GDLHow4docrr2YFuwDb+EiWQS/Tzy9KCer73tohuGBX/iSh+Xz2
	b9xp5jWjCuuqcq8CyFSWh99WLTBOT2Pl+0eUt45a6aYsBjJ7KSmooISdCZ014eic050DQ/cx7wt
	2sB+hc6foJhjYzmrjh/KSA2AEpU/UZ5A6/CbEQwU1caZmFfH6rRWPhvWfOcFHuDQmirMz9oZinl
	0a7u2AvY2Lpc6BGqgyZ1zCN6+C3cfi1l9fDwPXCMw6e/87lD8GuCA=
X-Received: by 2002:a17:903:1b4e:b0:2bd:417:8ad with SMTP id d9443c01a7336-2bd30210d8amr59213545ad.20.1778731115621;
        Wed, 13 May 2026 20:58:35 -0700 (PDT)
X-Received: by 2002:a17:903:1b4e:b0:2bd:417:8ad with SMTP id d9443c01a7336-2bd30210d8amr59213175ad.20.1778731115124;
        Wed, 13 May 2026 20:58:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe44sm8313965ad.11.2026.05.13.20.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:58:34 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Enable the QMP PCIe PHY present in Qualcomm ipq5210
 SoC
Date: Thu, 14 May 2026 09:28:27 +0530
Message-Id: <20260514-pci-phy-v1-0-482429192746@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNIBWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0MT3YLkTN2CjEpdY4vUZMskw2TTREsDJaDqgqLUtMwKsEnRsbW1AGM
 MCntZAAAA
X-Change-ID: 20260514-pci-phy-38ec9b1c5a90
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: VQgYATEMsb-uRsvABg6NDPklxTHBIx0n
X-Proofpoint-GUID: VQgYATEMsb-uRsvABg6NDPklxTHBIx0n
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a05486c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WjzJGeGmWMr_TuVvyBQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNiBTYWx0ZWRfX+vvmbEsAn9tq
 hms1AuuUczSpBdsg3BZ1843yUR50NxxnWBVD79guqvM0x/8ebt5Vh56/m11Pz3OnGVTc4IEv8kQ
 CUvGx5eDoI11AxXN25z9FM08t5BKhLt8nn4zu8aRsXe2Z+M+gCjSj+jn35aMus9mubAWZUJrkH3
 myY7ecjltLClmxCv/XUlFsOmXJw64aUi8pgkLSYtcr4PEZPVJzfUDxVFpMuPIfhGwlr4FXGMhE4
 5Tb/UonKxRinoii5zk1I94UZH5zMMq/6t9tcU0bwjB7OuAVhAo9NSiesnyECny69kDjiba3vP7e
 ehRCtvNvBNEpo8s9FBg/cU/jBR6lf0xJNXrqG1qrxPHsaoG3BcvkuRlZBIz1SI076aW7Tx3okZx
 UukPwYlxQyRob8c53PgGuD1pKGhfuII4Gf4LRHm3AVtbw2tnsVACra9PC3fVdg8a2fI3KGdmhAz
 yyUs3oSn69fCtyZynVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140036
X-Rspamd-Queue-Id: 4114353D773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107515-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Document the bindings and update the driver to support
the PCIe phy present in Qualcomm ipq5210 SoC.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: phy: qcom,ipq8074-qmp-pcie: Document the ipq5210 QMP PCIe PHY
      phy: qcom-qmp-pcie: Add support for ipq5210 PCIe phys

 .../bindings/phy/qcom,ipq8074-qmp-pcie-phy.yaml    |   3 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 152 +++++++++++++++++++++
 2 files changed, 155 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-pci-phy-38ec9b1c5a90

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


