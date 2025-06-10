Return-Path: <linux-arm-msm+bounces-60733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B9AD3185
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A6E37A9065
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 09:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E73C28C012;
	Tue, 10 Jun 2025 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ps98xiqz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8F628B4F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749546851; cv=none; b=gOdsWjHN8YG84H5qz7WwJtYTmBE5+4a+V1eafgk5IKKFy2RQTaVrOcUVGklbOLoQBjiXnCCrHEU5XfB4UxWxKJkamDMK/vA+iHZky3F0fR7TOAu4xZpkb8kVr6WmmiabtgCYVGh3ED5zWjc/FZBuKHu9ugTJOEiW9NCipcBv0/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749546851; c=relaxed/simple;
	bh=qjl+BYDY6gqONCG2e6oCdswdZQgu3xt+TuVVxWOEvy8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dlDL52s9BimsUN2WB8yojD7v4msAJJcUS8mpW6x9y0am2TJeppya9bTUCI2uJ4SKTpyPUbWJNzcrGznIhX0dLmpVVvDbTvhH0wMp6SK5nyUNYWUOV6TZQCrKkF7YcRr4lRz3q5UV0YhKK86mfvv5hEMaOq+AUzWAPYGQ7e4zvQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ps98xiqz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8lf8R017676
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zVRDOyB5Ai4LipPm1xDU5BTQ38yaVzybSDw
	R5qGwP5k=; b=Ps98xiqzeK876EtM8Y5oCTnE1TDQv2X0/+ZEteuUCrTWhbZT3lj
	m5Vn0Xt7RqCz4QBOmScq38PIq33/1KFbLPXmFlaE1hvCWEFaMuoLszFtLaCsz7Tg
	qL1O0Agfjz21/eSZydOfOHdUWt1sVVRd6FwwlK6EicMiqxIVUzfTTssrgjDAQQN/
	Bgh/okwq5CeJQ+/7LwMSoIC3cGAIhwPivKq/tjlbFNiHGOlyOiHHSL8FpZjiwEfs
	uYbw0j2zxe1AclzlSfj254BOoedtDJn7/mZSNClWvDO8FAHNhLguXhRWkRiZ8naH
	Lpd0JoJDt4x2RJWPiX7tPXz1zQ1kzmOZPog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mchjfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 09:14:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so2038886a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 02:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749546845; x=1750151645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zVRDOyB5Ai4LipPm1xDU5BTQ38yaVzybSDwR5qGwP5k=;
        b=CEEA0cRbwb0mb3Ay+2MXOCyZN34vXAamhGqyrw8LN1IA5tEGF1s0jXp2JcjycRwIwY
         5iNYcMsPQIsvB1OlOcnAuV3p7wb0x+5gh9s3991e2G4tIaQLqLf8lmVRQdq2AUP/la/n
         x0zR3lC/Mig+4Jx5w2AaGmVLa/FvqQyzc9pL4HQMBS5q3exBgU/PrwvaMd9e7irirAMI
         AfLRBwjGK8euLyY1fDCZ5PueIqK4pXJ7v4+LfwI6nHasS6WqOBWEDDxgT57I3LjTIRPS
         EaRWlGxFgRWwu07yzsv7VWgniZ9Yj3ZjIrLfso2P8wos5hp04K3eNFM190FFSUyrcTGG
         Qsow==
X-Gm-Message-State: AOJu0YyOr8hCARTvU8i7TUY4TXiom/zOi98p9nCQ/8xw6cLXfd2yoY8A
	tIXRr7R1F7Gr2/G0RS+SQPoyzMV262zL7yxRvvSfFduG1/4IXJYGJAUMOj8SnvY5lPhpxPP4ETq
	9UC7OsEmsQDNpus45YEhCFgOPZdq7pdZ6kEHmLV6EsS3Hin1k/oonM68mQYagUoxhOyCX
X-Gm-Gg: ASbGncuLUBSLg2c1BIDFpjoL0dvW3IFyVNKE4Jrh4QkTeI2Kxv/PHLSL1D5Voqe6B8u
	iddxgF5dORV/Uju+W6Wah+AeoqBwoMQBYLWJUJCbR78g5Tm4/erbm1T/RRxmdZqIjuhGbGE7w25
	109Ha/qBcY6DdFrmrxr7YgdD+p0ObbBVpDqYJxrKyvN9k4Sr6qo8Up0PQo/ZKq5OSsKKZsSvAHI
	0PYEYBClfNG2N+uMqxchBRVnawVRxwHHXntlhTJ/quo5HZap2xqm3ABMwVnywT+IHvnoGQxjW13
	mU7IcG8EO9r08HhjiCBSqQ2gB+aRU+nzMakYyeffyZV/Wz13eJD+ZKmkBNxp
X-Received: by 2002:a17:90b:540f:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-313472d087amr22039078a91.3.1749546844713;
        Tue, 10 Jun 2025 02:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPKE5ddYGSWWPaXAav9AjL6ipYIcKD3xVvTVVDcFAX1zelPwmcZkWoBf/P1DKT4eS5Q+LQJg==
X-Received: by 2002:a17:90b:540f:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-313472d087amr22039051a91.3.1749546844299;
        Tue, 10 Jun 2025 02:14:04 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349fc3e72sm6913550a91.31.2025.06.10.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:14:04 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/4] usb: dwc3: Modify role-switching QC drd usb controllers
Date: Tue, 10 Jun 2025 14:43:53 +0530
Message-Id: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=6847f75e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=2JYEZmQa42-x6bohhNwA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uv13kgIxMl4Og_QfUxVkqMqDzltwJTKl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA3MCBTYWx0ZWRfXyQzv7LguqdOk
 kEc7w8hRHjoLh7cSFN2cg7yCh7qB1vBDaVikDaiyiNjRFZSKmOufTaEBeh6LR7aL9mrOutaec6l
 wOFdT3Cz/lV5j666DQU0srWzyBM7OwQT+sPrZcfn0zBzHNmADQFt4SEWvm6CH4ra+XdpzG3owyC
 5K/Wd9hCBTvMfjj65dE1Kt6putI5zocd4NP2IhMTBQWYTTNCP17hOT10qlInfILgzkM/ZbmTDQ0
 Vdf5hgpBDw+tKeWwFx/OSDfHpn8RlUaGXv9i6OE7yJ2gyFSIvHDBMTmBjLovSkvwirS0MXb5dGY
 Dj6QG4w+YThrxxN5CYE7ZRzfLuwuoFB3Koj2GY9lJdkVFQZl3iUSb8Fp2WignGCJNt0+qyRvxmI
 HfgzGA91HUwlbFGr5WbccAaWs18wXBurQUmPbldKn5KvRxlov1MrD6f1dajyU2O3xfoOeCAt
X-Proofpoint-GUID: uv13kgIxMl4Og_QfUxVkqMqDzltwJTKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100070

Currently on QC targets, the conndone/disconnect events in device mode are
generated by controller when software writes to QSCRATCH registers in qcom
glue layer rather than the vbus line being routed to dwc3 core IP for it
to recognize and generate these events. We need to set UTMI_OTG_VBUS_VALID
bit of QSCRATCH_HS_PHY_CTRL register to generate a connection done event
and clear it to generate a disconnect event during cable removal or mode
switch is done

When the disconnect is not generated upon cable removal, the "connected"
flag of dwc3 is left marked as "true" and it blocks suspend routines and
for that to happen upon cable removal, the cable disconnect notification
from usb_role_switch to DWC3 core driver needs to reach DWC3 Qualcomm glue
driver for it generate the event.

Currently, the way DWC3 core and Qualcomm glue driver is designed, there
is no mechanism through which the DWC3 core can notify the Qualcomm glue
layer of any role changes which it receives from usb_role_switch. To
register these glue callbacks at probe time, for enabling core to notify
glue layer, the legacy Qualcomm driver has no way to find out when the
child driver probe was successful since it does not check for the same
during of_platform_populate.

For flattened implementation of the glue driver, register callbacks for
core to invoke and notify glue layer of role switch notifications.

Set-Role and Run_stop notifier callbacks have been added to inform glue
of changes in role and any modifications UDC might be performing on the
controller. These callbacks allow us to modify qscratch accordingly and
generate disconnect/connect events to facilitate suspend entry and proper
enumeration.

The series only allows autosuspend to be used but still relies on user
enabling it from userspace (echo auto > a600000.usb/power/control).

Tests done:
1. Enumeration in device mode:
After creating symlinks to ffs.adb and writing to UDC node, ADB is up and
working in a stable way.

2. When none is written to UDC, device enters suspend.

3. When cable is removed, cable disconnect notification comes and when
qscratch registers are cleared properly, it is generating disconnect event

4. Device enters suspend upon removing cable (host and device mode).

5. In host mode, when autosuspend is enabled from userspace for controller,
xhci, roothubs and connected peripheral, the controller
enters runtime suspend.

6. Upon removing cable in host mode, setmode brings back usb to device
mode (which is default setting), it enters suspend as cable is still
disconnected.

7. When in host mode, if we enter runtime suspend with wakeup enabled,
clicking on buttons of headset are resuming the controller.

While at it, remove glue's extcon handling. Let the DTs being flattened use
role-switch/typec frameworks instead of extcon. DTs using "linux,extcon-usb-
gpio" can use "usb-conn-gpio" if they are having USB-B connectors. If they
are using Type-c like in case of msm8996-xiaomi-common.dtsi which gets
extcon informtation from TI based typec control chip, while flattening the
DT, role switch mechanism needs to be used instead of extcon.

This series has been tested on SM8450 QRD.
There will be a separate patch sent for flattening usb dt node.

changes in v2:
Rebased on top of usb-next.
Removed glue's extcon handling and made use of in-core handling.

Link to v1:
https://lore.kernel.org/all/20231017131851.8299-1-quic_kriskura@quicinc.com/

Krishna Kurapati (4):
  usb: dwc3: core: Introduce glue callbacks for flattened
    implementations
  usb: dwc3: qcom: Implement glue callbacks to facilitate runtime
    suspend
  usb: dwc3: qcom: Facilitate autosuspend during host mode
  usb: dwc3: qcom: Remove extcon functionality from glue

 drivers/usb/dwc3/core.c      |   1 +
 drivers/usb/dwc3/core.h      |  26 +++++
 drivers/usb/dwc3/drd.c       |   1 +
 drivers/usb/dwc3/dwc3-qcom.c | 219 +++++++++++++++++++----------------
 drivers/usb/dwc3/gadget.c    |   1 +
 5 files changed, 150 insertions(+), 98 deletions(-)

-- 
2.34.1


