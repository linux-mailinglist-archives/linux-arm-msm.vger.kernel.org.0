Return-Path: <linux-arm-msm+bounces-68646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D45D4B21DC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E55AC3B04AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF46E2882D3;
	Tue, 12 Aug 2025 05:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZB6D01sr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA59267AF1
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754978152; cv=none; b=CcjqtJ0WAasD9gQ1awgjCJgQ1eAxNMfgjD4y4VDocNJYK4mukosIBdrQk/xDZlMl4xUhqT+l4mfNt3oum4PpG+f4iON3JKx9LMnQE+AfTSMu3RsdMm3wl0L9uyWqvpbWjtZNqYQwYOFnrIrCO1Xb0XjcG4O+xbLGGW5m7Ib1inQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754978152; c=relaxed/simple;
	bh=Yheg6I/35trUnbBJ7j7xz3R2vgSRMnN5w+YUila8Cio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TV43xJfVTVC2imK35ha1QJirWx7iiB2G2V+U5br4PTSBJOAwBsTlkygdHlW+lQxerG6bXOtobgviI4jTeAzAcgWZ4hKswxPxt5Db0LXBUuLAyPDQNZBd+OGjhl1kwZb0dLXCJKMu9BWTJN8dpIVtobFYbIQ+xt3fi8Yy63zKKvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZB6D01sr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5YKvJ018311
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=X8/t48amNz5Y5I/LII5CBlUVRP7E7iiuvo0
	c7s+eEcY=; b=ZB6D01srLVAiYNQdFPxS5AKmdaB3rb0ndb2HlbcJBKIEnDoOYdC
	sXfaVu6jG0vbu0q9/nAR43NFAR8+aF8Gqv3Zt3mWykn98NAgYoZNMWNTvNhXrnBG
	belTArDI5JxESrKVmmrOJNNwdcMIH7fxzW+IkhEJpSJKlblcfqsLBKMZebPUrN7D
	hnhKUAsEaj9siwcja1Qm5ECOcNAc3cw2u8uq79ml+5V1fjv81jYQFU/Y+vuDV62i
	BZP6HkroBjwsKlft1o7kkDBZmxxD8zeH/SfWoXullnxqtSZ13wES2PBXdLy2F1Qw
	Ef1wirHyGRU2eLJTGr95M4Sw0LGsZzQUEYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g6xbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:55:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2425364e0b2so59322175ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754978149; x=1755582949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8/t48amNz5Y5I/LII5CBlUVRP7E7iiuvo0c7s+eEcY=;
        b=mMt/wVMYXECB3hM1UYheo1jztmRS8jfcG7ckkEisvoeKvcqCZRcRuqByUfOX/fDCi2
         yAkxLGmzWZe+aG+UTHZz/RRIiJfiO80qk18v/uXzvB+dsUUqYzfF6AqSukEUkUlH+ACS
         bbEmaGz31YNNPOPoftH0d3vCy9fwu2vezOCYqU6MEcvLDEcc4gyT+Fb+ks/mD4u5dn/n
         YO0sC+AzaLIHsHFhsqgk2Usc+n31C7zP7I3SvEaDA4rryXqfMG5cIgBlJWpBU7Vz43x1
         39EMHkTdGMo6S0eaHTF6OTXa3znEXnr7UrfB1DrQzGDBcmtis7fdh3Hhban3GMHCI2zW
         COXg==
X-Gm-Message-State: AOJu0Yz13EbjkpHdehTidoHknkKXvwV04eracEvscLJ3SUxHNABY0EuW
	yd8R+ZCB4QBRKfr8dCe03HsOpqo4668a4Oc//NhqzeLnPJGeCj7ZrgWO9Fz9X9JMkH8mzcj5V1o
	yOYbOyf7A0GeK1MhzPnnsN92x5t1ePtG8KGaGMw9BwAe+DgPc8dAjBNUBzdgpGCZs3uIW
X-Gm-Gg: ASbGncuX/hz5KoXd9vcaOTUJwiiTJ/dtjpa5qnQEJ44Y+b6+ssaHKMbHEEHFwfmFopX
	XKGRtz7xTbM/+DPGbfv3l94eV5WdxSmAWDfC7CIzoF1HIssJd9FXO/KQeQuwTtDeEfrTnXDT9sF
	meYWIQ0hSjsdqJo1ZuE+de3D6pX0nwiXBD2chbxI+Hl6jQ41GUc6/xUPCDCk4N1Rse4TCy0oaHp
	4oQQFM7BOTqacMzmbKhql7Xh9eR3pxj4J+RXrruAuaNg/8LnXW9wx6byzVslsj/66sc8Pii3p2p
	OWU0szJUQgOlZov6qlJjPyu26avN2kW3FcIJNmrGQjRhxyBZUwSCd9L2h+3bkT0wWkOSjDXe/4a
	kuQ==
X-Received: by 2002:a17:903:2a8b:b0:240:6fc0:342c with SMTP id d9443c01a7336-242fc29a26emr32028595ad.11.1754978149340;
        Mon, 11 Aug 2025 22:55:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlUsjaJb8koPD5Sg2TIon9Iy4UMzUrz2urZj0cwHINo1bgRLZQnc8zXMRb0Mzkr00lh7hzWw==
X-Received: by 2002:a17:903:2a8b:b0:240:6fc0:342c with SMTP id d9443c01a7336-242fc29a26emr32028265ad.11.1754978148847;
        Mon, 11 Aug 2025 22:55:48 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e585sm288585985ad.40.2025.08.11.22.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:55:48 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v4 0/3] usb: dwc3: Modify role-switching QC drd usb controllers
Date: Tue, 12 Aug 2025 11:25:39 +0530
Message-Id: <20250812055542.1588528-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689ad766 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=aun3V7K2MoTQ9LCyWAoA:9 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX7ZQUAlLz8L2j
 TMpy1e0vSmdDp65CZIDZ2rKE6bK7n/uqPn1M2sVx/qlsbPmUXeBanhwCWqNR21yelJSR6jQAtnf
 9ietSDv3WPybcJ0a2KwL98stj8rENdm8lYWKe4cwljAUYyjS+mz3Rp018dKEckPil4Oz2MD8JFT
 bQ6QmNu19DM8CVEOTdzx4pMFLtYGBJ84xniR02DQ0QP0DQjh6tj1B69/KoGLbaJXz2xFQDTxsrl
 cdGRAbiiVvd1+Lc97fXPJx6fMAfdjvKaRqRsUpa5mv21Y05GaSj4nMbMUB78/gS9d48KPbcBgZ8
 h6B1PXaqL+IT3GCn4yOwOhsYVR1AUOX+hAlWceCbjaludM/iCHUdZOTd8zdabGMaD9gIn+g2oKT
 bFSVgWWE
X-Proofpoint-GUID: 55Z78ufPcag-SSUp0OZ50rw4msB8tDwi
X-Proofpoint-ORIG-GUID: 55Z78ufPcag-SSUp0OZ50rw4msB8tDwi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

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

This series has been tested on SM8450 QRD.
This series depends on removal of extcon functionality [1].

[1]: https://lore.kernel.org/all/20250729092708.3628187-1-krishna.kurapati@oss.qualcomm.com/

Changes in v4:
Fixed function names in comments in core.h (Thinh).
Fixed nitpicks in dwc3-qcom mentioned by Konrad.

Link to v3:
https://lore.kernel.org/all/20250806095828.1582917-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
Removal of extcon functionality has been moved out of this series.
Addressed coding style comments from Thinh.
Instead of adding notifier and enabling autosuspend for xhci, it has been
done in xhci-plat.c

Link to v2:
https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
Rebased on top of usb-next.
Removed glue's extcon handling and made use of in-core handling.

Link to v1:
https://lore.kernel.org/all/20231017131851.8299-1-quic_kriskura@quicinc.com/


Krishna Kurapati (3):
  usb: dwc3: core: Introduce glue callbacks for flattened
    implementations
  usb: dwc3: qcom: Implement glue callbacks to facilitate runtime
    suspend
  usb: xhci: plat: Facilitate using autosuspend for xhci plat devices

 drivers/usb/dwc3/core.c      |  1 +
 drivers/usb/dwc3/core.h      | 26 ++++++++++++
 drivers/usb/dwc3/drd.c       |  1 +
 drivers/usb/dwc3/dwc3-qcom.c | 78 +++++++++++++++++++++++++++++++-----
 drivers/usb/dwc3/gadget.c    |  1 +
 drivers/usb/host/xhci-plat.c |  1 +
 6 files changed, 98 insertions(+), 10 deletions(-)

-- 
2.34.1


