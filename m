Return-Path: <linux-arm-msm+bounces-112769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VkEKBrfAKmrpwAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:05:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 505356728DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 16:05:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dEhsvkhw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=giULm2VD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112769-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112769-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AFECD3006829
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBACA403B05;
	Thu, 11 Jun 2026 14:05:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997F73BE63F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186733; cv=none; b=tSsePBzbDPJE49aTLD3nkTUl+7QZsmvGTFYK5ynxHoKpS2/dlo/pB4vYiNf0DOSyfVo5Mnlk02eSEXCmjUswIp/L/9I44w/ZmekfCNA/RcF4XkeD2wZSzHoZrcoPgZ4BM5eQwETyuzINvagpU8vOhpnfJVuuzfyZC0ZkGKOd6T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186733; c=relaxed/simple;
	bh=Fw6gQFY3Gd6QiUmAnZ5DyWfDoT8MRmsSY0h3Ikqq92E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jouUZQ5BzAqarLiWNhd1KA8FxDAfckvyJ95eDo5CSMeVhW4Au4eRt0npVcKE4dsfzSj9pbnffoQC/k+uduUn2xk5R0cq14XJm5YSeeNHfR7GT4IzmShClR68fFpw+uTksDZkMczkkkb9gT7i5g/avt3B6BPIej/horS6ln6rWkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEhsvkhw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=giULm2VD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCSlZn630411
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MLEQXryaifs1QKuY0lfBGF
	UrdbxoYxdxNfya3F5CJGw=; b=dEhsvkhw1U4iu8cqnXSRHKZTBzgsEEAYn2VrZE
	UrSVO3cLd39/DUacluu5SnpnJaaG+gJqL5RciDMb/OnY5ifk/LulLDxFvwMB40zk
	GPwkk4aIlZShbgGLgu+nH9u67BekipsJdAR+ZS8bS9WhUT5+sapxJ2wEyc9PEHCC
	E/yHlK/tCOJ+XRF2BnkfW/iAYXl2Vjv9u0D5KyIR/yEmlDC6EPBPDPEOv/gAaF+5
	4BrBNJr/8TszATRrTUmD0wjHC79SyreAyNfYqeS2lkRVf7Lk9w+PH/yB5WZ/xIXG
	AnP+ZySoIPSUrW1+RFtCnw7D5qN7SDFSpJRYjuAyNRgms7xw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5h2a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 14:05:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b76d12so5659643a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186730; x=1781791530; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLEQXryaifs1QKuY0lfBGFUrdbxoYxdxNfya3F5CJGw=;
        b=giULm2VD5vQjF4dYEbquXK1nlWwmFkkCLP3pooPosug4tYQNTTXx8ekHHBLKO3lhYF
         cVqyphZ8JlysUpBceqCpobLpZBWahDL9pefJA2ZbWY0QTCgBgFYed9TbPVpHWIT6sz3J
         c4SnAZzYnuvQG8f4hk94w/atFi6lPhKscr1hhtdQKFnpNWDu0dNNEWJXVQ86f2cI4pEr
         u80ZSAflGPqCVlgXDhvAHZqe40QBGsJl3SGathyHpMbXsKOE4bvfHT0P0TVGaawzjOrU
         8kCryiuMblk87cQfsRqZv8bJ4xSwTQ3IY+3E+Mzs5zHxR3zErAiLjjT6q4BGXdcAgTR0
         bNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186730; x=1781791530;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLEQXryaifs1QKuY0lfBGFUrdbxoYxdxNfya3F5CJGw=;
        b=FY+Zc+CqL8t0Nk6sPchye7vM4pkUvwhi+bBHhSDKNiJqdEe6Q4/rD6gpgAB3z+BQq9
         lDfK6PVL6aI44DaKzS+6jqGDxs4EsshDtDLk44+vCE5F5KDS+f8RZNccCDtFPIhbePRV
         e87PRIHpfkivxi/zn2Ojs6tc6UNaR+2hoPyMttrmtTTA9Y19FnLuqRnG3onziNRWpbru
         U9m40+mXGO/WZ/urS9npXUPoyOpZeBIoPVs1x0iXi2UeogMPRYSu8RjSUMYxtiywKHuK
         fU5xZNrSGku9IMh4aVmWYU5RmBWyLiusck6H3h9+BZ2/qSfdIidNx6mSjD5QGN8VNy32
         gAqA==
X-Forwarded-Encrypted: i=1; AFNElJ9f0y3hY0QoT8y+TaS3hfkE9XDmEfLOx6vZBgqPKGcwEK8eNL0F4ydOWE+EA/0udPNxLMmsCV6/HzLx+g+N@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmz1PwqKV9nRyaFtc4D6l7fi9UEzNGHTuxWuDKnus60jHA554b
	MZ4Y9+YFWdoDZd03IuhcPogqCrWJNxvm8+pGOvwP88SPMIoeRHIU4uRwYv50OEXt3dQwx4hGJ8Z
	XPHGaCmcoZm7ax0kUwkf7IZHAF82GBwAlgIP3HQx8ges7LbrcVnnkKexdm4IezP/i6oDnm0p7oW
	hz
X-Gm-Gg: Acq92OEHFBjmBIxJ0Da3Gu29CV1PPSh2W/YzjDqeb78LhCuxraB0Qg1EJ0M1qkSE4v+
	w/qXEgITiwk4zcaK4b6B8ACR1WwTayeox3ShX/BATfTpp11j0hAW5OE17sAEW0oO0+JjTsHJtYQ
	E+fv9/SwWPK1Lu0ticUg4CnHXaGZA1m4+LDBbSeEevoh9JNVrI6KRsZ7MuOYjzJK4nLYT/9g26X
	yG7/nAtMwTr7d6X/ZQVyO91v8zvoDc+v2vuAQ86vEC9qs2MJfe6DXEVdQ6vUrWQNT5SnsnSjxL1
	CkA6nsAqMC6CY2l3GIl/Sw43pOsIleeXV2dYzi9rHTwr9Gt2eqrp14FxEEMoLDQ6qgc5aut3fuP
	7SVJ+5rU1sbspus5QQA8b/k454VDA2ZZ68W6oCgdfZC/eIqBMX7RS+D+8Um7W7JD716NS/tWFNw
	qm6Gze4plAKAEIeZOsCatYxTeWmED6XmroE5Kgbqh8EMOkdG797ZI13ySLmLxFIDKAlJbE9heji
	vJwogXOaN+n
X-Received: by 2002:a17:90b:4a4b:b0:36b:d2d9:a584 with SMTP id 98e67ed59e1d1-3779f83d834mr3307649a91.9.1781186730240;
        Thu, 11 Jun 2026 07:05:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4b:b0:36b:d2d9:a584 with SMTP id 98e67ed59e1d1-3779f83d834mr3307600a91.9.1781186729772;
        Thu, 11 Jun 2026 07:05:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:28 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add INA232 power monitor support for Arduino
 VENTUNO Q
Date: Thu, 11 Jun 2026 16:05:23 +0200
Message-Id: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKPAKmoC/3WMQQ6CMBBFr0JmbUlnjEVceQ/DotBRJpFWW21Uw
 t2t7N385P3kvRkSR+EEh2qGyFmSBF+ANhUMo/UXVuIKA2ky2qBWU/Afq8Rb2pJyjHvNxrRuQCj
 KLfJZXmvu1BUeJT1CfK/1jL/3Tyij0qqlXa8dUtNgfwwp1fenvQ5hmuoy0C3L8gWLVPByrwAAA
 A==
X-Change-ID: 20260610-monza-ina232-de180e669dc1
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX9NvvS15KIO3L
 cVPLlbq++YQmPVqNN78S9ziq02Oesc1EnlM+AIhr48K0dRUhxFjswfmP3RcwWbCaE0yUdhFHS3x
 kfLl2vSF5UwUzhys9rBMukLZAX2ukEUf3d4k9NmI7eOF2xhgVG1RIjsCoXH8q+qRSUiwBYOBb2o
 M0g0I537Fso8WTTiu4ItEV64oQtDV3vhiNiEZDYzPpMTWDsfYuAEXPDlbhYg4dyWQYCLzWG7wZ5
 KZCBdfPQ4CREKIhvKK8bAXA/HsTcivhyQlDXrzsp75KGX5PRVIStrnbu6GjVyG9HzKcYcy8X0y2
 aDWudwd1z0QL6jDnJD3zPjwXIrTcmn4gkVCJBU4bATWvs/+zRAy+J0kzfdocy/wrv8jsLqXZgRc
 JQ+wATL8QwrOp4cUy+7qgcujJwkaYOWApZ16NmzoGlhUYDSqMeOTJvU9ubagGeRkSg0bRvn4bzw
 4PdUM6r1U7PNyRhXlLQ==
X-Proofpoint-ORIG-GUID: w0ueflH52hM73X41aFZTb6-mo8MAHms-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX3zVapStPtMZm
 h9u8pLIK1dBayEZdC0rSZttxmIrrQ1vsIrRUFGiDaWsTeh0nh7yI4XGOgV+0Ek87iz+Kn1RnjEd
 6x4gQUedg0kLagNiWmW/1O4LB8lYkOs=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2ac0ab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Nm-2SeViG6Lg8r77o8wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: w0ueflH52hM73X41aFZTb6-mo8MAHms-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112769-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:m.facchin@arduino.cc,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 505356728DB

Add support for the TI INA232 current/power monitor to the ina2xx
hwmon driver, and enable it on the Arduino Monza board.

The INA232 is a bidirectional current/power monitor that shares the
same I2C register layout as the INA226, but has different electrical
characteristics.

On the Arduino Monza/Ventuno-Q board, the INA232 is connected on
I2C12 at address 0x40 with a 2 mΩ shunt resistor, and is used to
monitor the board supply current.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- has_update_interval was missing and should be set to true/supported
  (sashiko/Guenter)
- ti,ina232 added to two allOf conditional exclusion blocks. (sashiko)
- Fix commit message, it incorrectly mentioned 2Mohm instead of
  milli-ohm. (sahiko, Konrad).

- Link to v1: https://lore.kernel.org/r/20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com

---
Loic Poulain (1):
      arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor

Martino Facchin (2):
      dt-bindings: hwmon: ina2xx: add ina232 compatible
      hwmon: ina2xx: support ina232

 .../devicetree/bindings/hwmon/ti,ina2xx.yaml         |  3 +++
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts    |  6 ++++++
 drivers/hwmon/ina2xx.c                               | 20 ++++++++++++++++++++
 3 files changed, 29 insertions(+)
---
base-commit: 8a4062d204752e0d66a1e7e1a2f8834571a8d40f
change-id: 20260610-monza-ina232-de180e669dc1

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


