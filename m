Return-Path: <linux-arm-msm+bounces-112123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6BgRF2/qJ2pp4wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:26:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB53865EDF1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:26:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Gh1m0U+v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AlW56y5Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112123-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112123-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40A9D306BA80
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 10:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45BE3F39C2;
	Tue,  9 Jun 2026 10:23:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AED93F1ACC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 10:23:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000600; cv=none; b=AZkzuEYbo7/Jmvy+pCvb+XZBjAictq7NkG2xzlsxJRFnsu1Oxg1sshxya8/RPXQBmMJfRjjYjFrKdSzubIT9JpSQcdSIksSzb4MQ+qxesJ0AcEMGNL0rqzqFw9sLK/G4cXgVi3Yx2DovIyc70xyEJ+Yrdc75gHNTkREuqwHjm/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000600; c=relaxed/simple;
	bh=pRWR7Sle0Ibge83uBc7U3bzTmBHPG659jM3kFTWozRQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Cvaf5c9I44bGUz5crpPHxx1FLCFY24ZSp02B0mig57vun25D8wd7Sl6GqynbUxGd22gXqJc2oiLBHi3rMU3BcZVlmpMDX8ENC042ExhrTK8tEO/tEc9BI5D+DtFAtU0izoe65PszvrW7EgAkUiJCe4XgCJYNWJQ71TdL/9U4i7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gh1m0U+v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlW56y5Z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599vQIx1867945
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 10:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ObQ+hdcLgIgQf/C1IxxeoW
	mIo7Pz7pQxcaJXHArQT1c=; b=Gh1m0U+v/mdHb92vT846r7mnSNcUb/cjHm9aFk
	iV6kJ0iKB7faoAkzv3loQSMP9mqIeiRXbpVEJrAyNlnbDA57BlDrYsVdfHk9aNH+
	lJsHxv6lIJo/h2ScILSN8NZTVF4dRfEAwolk/KuxfjYwST0BaV6+RhV7LrZOAqhY
	v3bS3Hq06GWSzXaHbXSIODvNofS+fjCe1p77l3KYYZ6+Qce9BAQCeJzsFGX2C14C
	nWZu5NJlJeRIQu4e910FMB1kQ9D/fjnNO/BltM5chOCRKVQxMA1nZtMS6nVAiGm1
	3htwUDIxnLy+k2gm35Pai/+OMKmU6YV44cXKbEPpiCcoXhWw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdees0c1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 10:23:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0b1bb53a8so41018235ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 03:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781000598; x=1781605398; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObQ+hdcLgIgQf/C1IxxeoWmIo7Pz7pQxcaJXHArQT1c=;
        b=AlW56y5ZvpTuzBtlmDVDQ3fnLJQqhWPfWQ6EDj+vZzo0MfJGUQQ/dynJ0s5UPxZR9E
         0ppHNFHo7xT4vlpPwPsJeS84752Gr64XKFc2pjrPG7dcBG8K+yGl1Rb506HemgPQWyA0
         IHMZRIKbJsvg5JUsIwQCCVZVCk2Gn8ZEwzj41BvoHXrLrdwWchDYICLuuG/CptSq/+Yg
         B1A9kGIdPdKbC6AZIniLZDUWrq0LBGm1gmHI3bRigtpBLKbGfBDnmMQe5Sv1I8uLSLzN
         TC+rOhy4uEmJI6XZxxoEHPWWrFprqb+rJswhTMhnR5luxLpxzMI5BeszmOsfpWdNtYZc
         Uvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781000598; x=1781605398;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObQ+hdcLgIgQf/C1IxxeoWmIo7Pz7pQxcaJXHArQT1c=;
        b=lVH0eBH2YxAU9WmLFL8N09KYmvPFevuF0n1XMNh6wnKl6hJdth/AcRjQQsppc3N3rf
         3AUac17BbsdAGhkDTA5AA76+dKVnrpi83zSxTYaQJmR3skOuoo5WPZ4Nyr5qbkM8xdmx
         7FpA+x6VwBXh7hX+GbLPhRqx1LzPIQ9OICYKkKSacVHGqtG9mS0TZmcA4orRywMUFUl5
         z/zVexBEYBDXoPJwuDSmW5cF4VJqYRoiBSf9gypt+kpMi+dqNXu5NxRgyd3nTNWk8LL+
         /7MKdqTEnTRF7R02n4x1gyJSn9rxg0FygSZHea27KZaPWx1lS1l2Lz0WhWl1TJpsOEFj
         gCkw==
X-Gm-Message-State: AOJu0YxRVA67inT1UgJDQ6xTRhFhAwSqHkMbEx2pJYbPppfzp6fG59e7
	3mFe+/Fp14Q2/I5b3AKUpDF9gnIDh7hWSPVXQMD0I7x/TMjxvco6tmkE8b/4GPQ9aUtpPpdehW1
	udqLIFo2ohW+p8JdL4FFxryrgisFQEsoT12ET+JZA1jT/W74XAGH5p1c4x/xOGPVA6DB7
X-Gm-Gg: Acq92OGI3rgtkoG7nS1uCCyhY5kM58MOKx6a8vE36+YWuimaT6OnH0gzptDv72QJg3V
	mz0nlabnOT5xIlG0Z8ViWW+5HWGvhnBqtN6MAF7vYpQnCfteBqcLU2EOl540ONQ1F0Bjpdj8g2c
	NOPUrDn9ZLvFv0aQkPkW4abSoxv0dS5U27wRKsrpNW90nJD6diNHhDUhufinpid8rErwxq2G2mu
	o2RseMUTtWMkFpnUlr6yg0H2Cpe6XlsjNT9RO+fLsTAIVMd0jxxfAs9tkc9PvxD9jTbiCKdYsjT
	IWRjMxaAV4t1j6xZ6HYmy4tqNw3ZwfYVpIw5o87/LyrN2yOr/3cnAziyw+ciJwPqSofota6gU2V
	uMX1XxcqbbQbCOD+eu37a55n8f+T0Btp+ye823ubU1sVM1WjSR9+lbICanrQbXw==
X-Received: by 2002:a17:903:2acd:b0:2c0:bcff:e1a9 with SMTP id d9443c01a7336-2c1ec7dc6d1mr151598145ad.9.1781000595614;
        Tue, 09 Jun 2026 03:23:15 -0700 (PDT)
X-Received: by 2002:a17:903:2acd:b0:2c0:bcff:e1a9 with SMTP id d9443c01a7336-2c1ec7dc6d1mr151597585ad.9.1781000594976;
        Tue, 09 Jun 2026 03:23:14 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c2a4a64e22sm14738915ad.61.2026.06.09.03.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:23:14 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v3 0/8] Add support for Qualcomm remoteproc subsystem
 cooling
Date: Tue, 09 Jun 2026 15:52:55 +0530
Message-Id: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIDpJ2oC/yWMyw6DIBQFf8XcdSE8ImhX/Y/GBVGqNxWpoKSN4
 d9L7eYkczKZA6INaCNcqwOCTRjRLwXkpYJ+MstoCQ6FQTChmGItWR2SzQ1ENnKQzHKjmIFiv4J
 94Pss3bvCE8bNh88ZTvz3/htcaF7XWggqdKt1Iwkno9mDSfTppxlvPka67mbuvXO0DHQ55y973
 AYjqAAAAA==
X-Change-ID: 20260609-qmi-tmd-383d30e1a60a
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781000588; l=4132;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=pRWR7Sle0Ibge83uBc7U3bzTmBHPG659jM3kFTWozRQ=;
 b=RUjO4ZaHu8eAp2L8TuRvYgI7olAouPDsvkLczSlOr4bCtcXeXr4R2ehYF+7uafzptJ2lzbQbE
 PA6ZHT1TKsLAppBFVkEqBbikCGwHhlYKjw0Y/UZcTJwtDp32DYfMJ+6
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27e996 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=OMKWdJ6r1yPKoj1lEeoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5NyBTYWx0ZWRfX33hq/0CsK7nC
 ss3HhyNhXbHP9p97EoeBIlVzmIqumyo+to99wybuVLu8hFkxYuA25CDggBEhQMxyMLiBMZQTiOA
 hJtwsvzxQKaK2C0pfGsXrpR3NOMKuxuhAJp3i5y5+ZbkNuSvHST/d08i88viyphLSpKhpsZwgwB
 d6TsUm0n5Sc7an/EBSQmSVXnL0eSPaZ9/Vuyjj0UfkH/WIWca8n+l8wWAFnkcWgGgpzqB4aocVY
 pRW5AkrEXOEI0XVDxtxZX0Lcm0Bx0MGgbopIX37XZZcdxaKVoGi76qh00ivFnJmKOR7P96N9Moh
 qbxG2W4Gv0VmDjkWrGkenGPwfHxl7C4dko+QvjAFm8SXX8ajBRoLpTgYo3LLrHAeJFxFSxxOFDz
 g+ioKl4PukuZW5ZOWbCBDDRDsqiW8BMMNmeijbR2OjGmMExhOZ46UmMhCcSmIqc3KEJ+WMI2fZB
 CamFQE6pmGJOTCOkYow==
X-Proofpoint-ORIG-GUID: Bo6L6jyFC-esCWGFzcjSMtxLVh9eNp0g
X-Proofpoint-GUID: Bo6L6jyFC-esCWGFzcjSMtxLVh9eNp0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112123-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:casey.connolly@linaro.org,m:dipa.mantre@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB53865EDF1

This series introduces a QMI TMD (Qualcomm Messaging Interface-based
Thermal Mitigation Device) helper library to control thermal mitigation
devices on remote subsystems such as the Modem and CDSP.

The objective is to enable thermal mitigation for Qualcomm remote
subsystems (for example, modem and CDSP) by using subsystem
temperature data into the existing Linux thermal framework.

Major functionality provided by this series:

-> Initializes a QMI handle and performs TMD service discovery
-> Monitors TMD service availability (arrival/removal)
-> Creates cooling devices from DT-provided TMD names
-> Supports multiple mitigation devices per subsystem via index-based
binding
-> Sends cooling-state updates to remote TMD endpoints

To support cooling device with id (index-based binding), this series depends on:
https://lore.kernel.org/all/20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com/

This series also revives qmi-cooling from Casey’s earlier QMI cooling series:
https://lore.kernel.org/linux-devicetree/20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org/

Key design differences from the earlier series:
->Integrates qmi-cooling as a library and hooks probe/unregister into
the remoteproc core framework
->Uses an index-based API for cooling-device binding
->Cleans up the macro name and removes unused code

---
Changes in v3:
- Removed the remoteproc-cooling abstraction approach.
- Integerated QMI TMD with remoteproc core framework.
- Cleaned the macro names and removed unused code.
- Switched to index-based thermal_of_cooling_device_register() api.
- Link to v2: https://lore.kernel.org/linux-devicetree/20260127155722.2797783-1-gaurav.kohli@oss.qualcomm.com/

Changes in v2:
- Update Remoreproc thermal config to tristate and removed unnecessary NULL checks.
- Fixed dt binding file format and added generic name support for cdsp.
- Fixed memory leak and cleaned up qmi-cooling driver file.
- Corrected DT formatting errors and commit descriptions for all targets.
- Link to v1: https://lore.kernel.org/linux-devicetree/20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com/
---

---
Casey Connolly (1):
      soc: qcom: Add support for QMI TMD cooling devices

Dipa Ramesh Mantre (1):
      arm64: dts: qcom: hamoa: Enable CDSP cooling

Gaurav Kohli (6):
      dt-bindings: remoteproc: qcom,pas: add thermal mitigation properties
      remoteproc: qcom: pas: register TMD thermal cooling devices
      arm64: dts: qcom: kodiak: Enable CDSP & Modem cooling
      arm64: dts: qcom: lemans: Enable CDSP cooling
      arm64: dts: qcom: talos: Enable CDSP cooling
      arm64: dts: qcom: monaco: Enable CDSP cooling

 .../bindings/remoteproc/qcom,pas-common.yaml       |  14 +
 MAINTAINERS                                        |   6 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  63 +++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 127 ++++-
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 126 ++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  99 ++++
 .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     |  17 +
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  |  17 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |  17 +
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  18 +
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |  16 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  19 +
 drivers/remoteproc/Kconfig                         |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c                 |  61 ++-
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qmi_tmd.c                         | 604 +++++++++++++++++++++
 include/linux/soc/qcom/qmi.h                       |   1 +
 include/linux/soc/qcom/qmi_tmd.h                   |  23 +
 19 files changed, 1223 insertions(+), 17 deletions(-)
---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-qmi-tmd-383d30e1a60a

Best regards,
-- 
Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>


