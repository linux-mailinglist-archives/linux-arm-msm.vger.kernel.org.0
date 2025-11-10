Return-Path: <linux-arm-msm+bounces-80950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEF9C45D9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F2DEF4E9F02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBFE267B15;
	Mon, 10 Nov 2025 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LNQUI3hR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OswiEGYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9660301010
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762769459; cv=none; b=QvapNdPty+qQbtqYxwIC2fRSjGOGoYoIOkusd7U7lmCbNJ22PGZL/sjaCzUP6oXtHqpmuVx9XE/D31NziMpQUTeRx4d8PhLS2xzw6yx13L2OwhNVU6xLrgL2e42sMoU5SCWt6wQcC0jKwiBzjkWyxlxd6OjYb5e87Y2yCDFaq7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762769459; c=relaxed/simple;
	bh=L1vucliNasDKObPZpGeHSjysvEIsdMIphONGTFyX0AE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qwr8G3OERyUeoNtB8b7nxnFOze0Yp9jU6arD+D9F1b85kJ8z7d4eVYc/qvDka6I8pkP7NrHY8ncoFhTwy4B7uXolQtPFz97juOZez6qI+rfR1M0j9U67YZZSiSMCwndwkDpaklxRkPacdfjSq6ZxWSYQNN2fvxC2JDrQyKg8jd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LNQUI3hR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OswiEGYU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA6SSm72407879
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mMd9Piz57k2MZFzuMa4objFRvRL7MLy1f6F
	P2mnb+eA=; b=LNQUI3hRJP7PmfxA5eYcnadah29kMIiCxsndfZqn5NrhFtQByKn
	ARFvDm2E1IVgA/V340bsDAq4wQ1YcmdqUeEN6K9nXNby3lf2EtC70orw7u1fSNoW
	xikO9rKtPbvGAiAcxtal9h+pwGnh90QXiZyqVJTWhY2O5vmhDiJOtPBvklEA8HL6
	bx6I+aOQ47EvgLehl/6n4P5epJsb41qb1T7gd5zET5xkIl1FLCjn0P+h/aFlV2Cg
	3P0Vi6ynGb64hi8BqlY4SbcRddITKrL0A9+5/jSO1eUesERglVG+mRuOfhGl/Hih
	9EmOF7cz2hxSuElX5JmXG2dugHmL3Ra6XKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abatd8q68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:10:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297f48e81b8so27031645ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762769456; x=1763374256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mMd9Piz57k2MZFzuMa4objFRvRL7MLy1f6FP2mnb+eA=;
        b=OswiEGYUIZ7sooGBtOMWYdbfYHoKLVtXJMxNCFLsHIfqIWFInrxGuMtmjvR7UvDEMD
         jIWpnEmbWSvmefjjKv7AOm7zha4qCnz/UgVgUBRf8cJG1u5ELVrVk/kBkEoknNS4w2HI
         JBJetzKVgL2bkmrtiCXUJAdrBQ2PUqRBr1YHw9akqZPHugg1smYkyMJabre4G5rGmyLv
         E8xRAiO5srkL2+jxYweu2Ey8qo5f0rxvW+Uaa+YGWENcadHLnq991zZmtv1Uk7rBdIFG
         Yw845OsrLrBZcfAwo9xlOzr1yyq6Fi4QEk2oYUzqnCP/7dXkFi1yFviN0UF5wu+Swqnt
         wQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762769456; x=1763374256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMd9Piz57k2MZFzuMa4objFRvRL7MLy1f6FP2mnb+eA=;
        b=ne3nQNlnun6SA8BLol8I4EzyoaRAVIS7qO4ZjzhXVrvb30NpB190PZWuxSA2zAc8Hv
         ODJek2Q2OT679jugSHz7B3XVR03+e4+P4+LSob+ljr5M7qGHP5pfszDVzBmcQXwrl5EY
         zJ2hehkstq/SvqeUi/qT7veM61tVed7erG282sE/aFO12SiRuSiWbuQ4oOXlsscHw88L
         0BWeRigIa9GA/kGKFT3pHreHV59t6eTqopaDrnTalVvzTObqNPOMkY1mXLW9mQG7+Ttt
         j0csmcEt6sGj8TLGZMS91cy9lhI8z95Z1b+99nCWEAk/cEDN/pD2IH0ue+nXmZKBi/MX
         zD1w==
X-Forwarded-Encrypted: i=1; AJvYcCUYkEb/bs9aPk7UbbL50+GdjCjarROaAVpKtajjjxLsYmw2h2lAAT/BYfhIyJEO38rx4GPd0NpuTaYzd76C@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgmmxgR96ZQp8dWNeZmRefWz4wAtSk1FZ7Q30mD9shKqtK/dK
	3/JkWf5S65epGFoiiy17LA1lEtgOEwo+CT1ayHPX5rncMz1P10yh2P3nUWpTw8TEEhk75nxkqE/
	L9LisKxiskDIUlYGN5SmrB4Wdolg17DWzKUsXfDdY+1+GMMYrn2tYvWZ+ox+e4z5zpEsI
X-Gm-Gg: ASbGncvvbUpmEQr6JcQ9wUf8H9j5UqaEjUcFh3pGu1NC0RdpVmEmpPgJGV25ELG7SXN
	UilTAzJueP4wH8j45MqX0fbh+3FXH7vmXKoyv5Qehdumbp2gA+Ck+oJeCqzCq7O0gHK9sm8RMQ2
	yA8ZxNAh9/XhHreLQcnr1jod6iXvKSbIwaYPuk+OVWStyuSAQ0gzMD4OsPu6lD5DrwAGdK8r2hD
	m8XcNsGtz2ITk4yJtlok0eaeHdsMPufGkcgwQ27DnE7KD8xqBai8c0BNab34MkRUjBz6jx20HDf
	r840zYJ/iMHVeJg7/Po787O6jDfVUC3hvi8tvwlHQUQv6USHb2DlMeVa1tbwAUwopbozENViPgz
	PWQoAhfFS9rX1GdlphQMQEXWn9U8ESkvt
X-Received: by 2002:a17:903:3804:b0:297:d764:9866 with SMTP id d9443c01a7336-297e1e33347mr100516005ad.18.1762769456414;
        Mon, 10 Nov 2025 02:10:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOvHZR3Wfm3+slGSa2LDZC54iSNYIgHCmsn2ecCk71PcynUbvaa1YJZlv4wWE9MkQ7NdudCA==
X-Received: by 2002:a17:903:3804:b0:297:d764:9866 with SMTP id d9443c01a7336-297e1e33347mr100515595ad.18.1762769455827;
        Mon, 10 Nov 2025 02:10:55 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297f2d9c971sm60180395ad.55.2025.11.10.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:10:55 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, alexey.klimov@linaro.org,
        krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v1 0/4] Enable Serial on SA8255p Qualcomm platforms
Date: Mon, 10 Nov 2025 15:40:39 +0530
Message-Id: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4SVAmNpQyh2OJdTXkCo8lHA32pCHNHlQ
X-Authority-Analysis: v=2.4 cv=eZowvrEH c=1 sm=1 tr=0 ts=6911ba31 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=zExy8rvKblQCe4eoFioA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4SVAmNpQyh2OJdTXkCo8lHA32pCHNHlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA4OCBTYWx0ZWRfX8QrfXY57jAjP
 DdcY8SuN+6rnzGUKkkzLg0ztkKnXALirDKiCuuGiqYc9rVxWqADvZAZowbQjS34J46ygNvXkZ7m
 BAnkmVf6lDewG3Gz2/zXjrQMLeMqmtc/Xn2NTwPHVVuSQvzRI1gbEur9FKVlrGn0rgotL235PeO
 CCR/F2L4PyaJdzw+MdMJSLa0y3hqm1pRxOeEoljbiXLbQKy97sA/DgnfOIzcN+UY0O3CZiwO8BU
 0AJjwkEY4Bh4YWCPmNVDQYYlflF0KRRSK16BBMFJqFxApT3RCwrqFWtQK6AOWZcPrWvmLZRWugM
 Bo93f0tWjDsJbvDs5lT4kC0JW+hcMBOJSSMCYLeELsRsAjP1Qb4DwsEMXyK7P2YKfDbnQBGo9go
 K+bAe0uMD5vfifAxD/WdCWYJnGjOLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100088

PM runtime support was previously added to the serial driver but had to
be reverted due to wakeup IRQ storms and deadlock issues observed on the
RB1 platform.

Reference:
https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/

This patch series reintroduces PM runtime support for UART on SA8255p
with fixes to resolve those issues.

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages UART baud rates, with each baud
rate represented by a performance level. The driver uses the
dev_pm_opp_set_level() API to request the desired baud rate by
specifying the performance level.

Praveen Talari (4):
  arm64: dts: qcom: qrb2210-rb1: Fix UART3 wakeup IRQ storm
  pinctrl: qcom: msm: Fix potential deadlock in pinmux configuration
  serial: qcom-geni: Enable PM runtime for serial driver
  serial: qcom-geni: Enable Serial on SA8255p Qualcomm platforms

 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts |   2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c       |   2 +-
 drivers/tty/serial/qcom_geni_serial.c    | 178 ++++++++++++++++++++---
 3 files changed, 163 insertions(+), 19 deletions(-)


base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
-- 
2.34.1


