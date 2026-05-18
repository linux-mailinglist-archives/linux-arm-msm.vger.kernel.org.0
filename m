Return-Path: <linux-arm-msm+bounces-108241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH82LJVFC2rgFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108241-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:00:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F1C5715AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A27D73031CF4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7904949EA;
	Mon, 18 May 2026 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aW1fIayC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+Ee5Rid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA178492531
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123238; cv=none; b=n0DKQlljNDoyK4lWfGXPjV1PbF5UQ1oVX4A3F87ZfaPQBFNHd7dMYVW9bw/F5pR4DSvHh8R9aFBlIy0SA3TYV0+hGhwv29LFi6CqnCagmNghpQwZOWHJfZkLwj4mcoT/pBs6BhLSSup8BuUXC6+fdUArAe3oPsyvEDMsZdgRagQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123238; c=relaxed/simple;
	bh=ioGP5Gh5mUOREyixP1d7WQYUH/GX0L+WVAO7T2iGpyA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FCRZRK/kfpwzTUFChMjkhPY1hGOVKpyj/Pa/UwsBtEvADBScmxdBPPIeIDYIKWFZl4WBBJHzeoZ0ITf8MrWuSxuRMpzCgy8S1aDh8ecSjBZDaWk0hlswRoujPZkI5U8qJ5lxxls9LZxoyFDrsuwxSWJZDS+Y5Pa5fcTLrSWFP+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aW1fIayC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+Ee5Rid; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICp0SS2437964
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7lxUpI5EKNmm9bW23PyCFwlpG321pegHYU1
	zPi+AZCo=; b=aW1fIayCRt93kgOeuxzaB/69wtRh4CPaEc7dJSFfZb7Gjg+OJ2e
	JkuqyPIBABL9ZmBFaHfXwqofR+NHYsCv6qRyiHMgixpt4dvlKqCuY0fmY7epAk8C
	kA9o+wcjiHzhI4Qrx8AmcwnIP2Ka3Z1MW+NwK/yxytdCvxgZpj/kkh10RZWTpYag
	JUbL5U/SfBEjKosxFci0HmouJeJkC441kIy7jp0qiL9JcoJImIb5PfnpLUVsJZG0
	13DkXt+7RK43pEe8SES2Kq2+g9rokDNPg03barZY5+pFBOZDzRd8XFp/MsU4tEbG
	XtVqDg58699KwL7t9U7qVkfkJLjsojGhgFA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v0y7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 16:53:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc860066a6so19067745ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779123235; x=1779728035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7lxUpI5EKNmm9bW23PyCFwlpG321pegHYU1zPi+AZCo=;
        b=f+Ee5Rid4SLmEDJptg55M8xNHQEVnSMOs2gVG+DM9fICq0r/trRpgVTMg3kwYsYV/6
         FZ++PwUKBTbiAtdfQVWfsiZU++f+T+/iSny1feyHCw+CqwR40c6GHPRxswHfozUxdqy8
         I49zlimkypflcbmUEdM5sr/ODCNx/4T3/pJFe1g/E88x5wNvEOSwVyM4OIcY+yfdUTgk
         CWyuraYjcTBDfZpePU/PuZAp074FKB9SSuRlhmBEA84LMXmjQcKsx03FcsvVxc5kQszT
         +oMXSkWKN3Ox8Jh9K3WbyVKysdP18v/JAWfplsmTm9yapxmBSaZtFjueOpmGwLGkAib3
         c0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123235; x=1779728035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lxUpI5EKNmm9bW23PyCFwlpG321pegHYU1zPi+AZCo=;
        b=I35Pa5BXaXXYFURkXcsM5hfNyyLax3FY6451hVoWnlUkaCQcbOmWkrj/LRJzH+usLd
         MXKHe4H4bh3eCRU1LHXLXzc3atCzWPLWI+OxueVrtCrYSs9L7IoWBSWdvkAUmZiaa2Q5
         LMbu9hVf/vQT2kZ3RBIWDKhMJH2kmdu5SdO+wAYoV8AS3VsxpNFgoLXRKMhQErkZHk8f
         JWxJQ/iefW6Vn1lqx+1TfVSnnZN0W183yafwYzmKvB847XG489snyCdce/A0/1ppZRs2
         PgV9tDLQLhh4bjSadPBO2XgxdWWOYqISXAugKmc2Gb/cFfEMYBTiNWO70A7JZ3bOhzyE
         SXyQ==
X-Gm-Message-State: AOJu0Yxz67qjP4B5b1KBohJxkLwHBpRGPQ9gg9sg5gSoDGvMiIu9pWI4
	KbiUrlcUNVL5PnXL3aIDaVfiOXX3HMg7wtx79qNcgv8Bd4vU2AiSoQzyiiC1THHpqSlds3ZN6tV
	7q469zfxDzFf+VcGB1ysx/NUH1hRF03RD51WnuCuT3/7eR1C+RppPsLYFK4Hc5ymz9U6RmqZ2mq
	nx
X-Gm-Gg: Acq92OG1d8F9qbq7IxNQBNzOkFw5DcImrD5bxYed6C3uLxH+WBBhXdXKMEdrWPyTKsa
	WCw0fPSMQ5iDUUNCjgnuP9MKsKVOj+CDHV7gMcA6xMwByXrJsWZ0BE7XzMXPXpZ4bs41U0e/NUZ
	kdOl02ECdjUQoF1/jDgZEN7Z5jYOvq8dHPPHuu2UXurbaZoFK2O9yWgeaVdAXylX7gTG+yVavt0
	9+h5sU9GttsU5DwhAceNacNxYYaaHGiSrJ4itfi6tPlhqjcGoBBNaIVvhN7fXywfJHCK8iidkk7
	u4wSMEWbY1VEiIjvMrdmeufFoCr2RTrua1Oi5uaKzHm3XNiEOhHCmqtO0AbVP/GeoUnSYwcaO9O
	/QYh9jfrU7lkI/46yaKBTzbX6d9OOD6P5h0+Bcki2qZ8T8AyVbnMMU2c8iQRPNeO7
X-Received: by 2002:a17:903:3884:b0:2bd:b585:55f5 with SMTP id d9443c01a7336-2bdb585571amr91337495ad.8.1779123235474;
        Mon, 18 May 2026 09:53:55 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2bd:b585:55f5 with SMTP id d9443c01a7336-2bdb585571amr91337175ad.8.1779123235007;
        Mon, 18 May 2026 09:53:55 -0700 (PDT)
Received: from hu-pkambar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc47sm149971045ad.10.2026.05.18.09.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:53:54 -0700 (PDT)
From: palash.kambar@oss.qualcomm.com
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Palash Kambar <palash.kambar@oss.qualcomm.com>
Subject: [PATCH V1 0/3] Add Hawi UFS PHY and Controller support
Date: Mon, 18 May 2026 22:23:43 +0530
Message-Id: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0b4424 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=wRtOOnJjwWicnHpPwtUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: f50mKv4GQkaJYvTE7tVZDg4wgZvWZ4cu
X-Proofpoint-GUID: f50mKv4GQkaJYvTE7tVZDg4wgZvWZ4cu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NiBTYWx0ZWRfX/VhBKYlohr77
 jnG4JafLgsTXd8L/t+13m2vJpt3Tq+agHry8gprNkQlSHSl9VFegiWSMWJM+BLgyU/XfwXUlLFF
 /JjcLGCAhvs+vzdPdPNL7HVn4DNu9k2mL+qd3wMEw7twv9bVyzJjdMXYf1jGyktatRqFIQg50kM
 JaVmuk4/lL0JLi1qM0KRCSTgjWQfumhpAuosQTMZIxE1K16fmc3RZlPvrFL8m+DHxae4e2mLOJG
 teTioy7anzeXMbsd1lKvlEAtYCI2AMoUAuCgsYMDVxEhQpiHUjDbatAHof3AdvcGeZADL9dz9nX
 DRnAsghZcdyzVQLi80G78shoynxcM/MZvocYxqSFKtVGq789u+rdaSBHN91mbFYj2eQWyJwcvW5
 AXuyZn1b8rHtrr0hDAbgjzxiaYfJeJbGBE7FOavYSANzjFLQiIW7UX99515jMyQtbjuDWXhfyPP
 AM/TCSKMhf2LFkU7f+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180166
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108241-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 14F1C5715AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Palash Kambar <palash.kambar@oss.qualcomm.com>

This series introduces devicetree binding documentation and PHY
initialization support required to enable UFS on this platform.

  1. Devicetree binding documentation for the QMP UFS PHY
     used on Qualcomm Hawi.
  2. Devicetree binding documentation for the UFS controller
     instance present on the Hawi platform.
  3. Initialization sequence tables and configuration required
     for the QMP UFS PHY on Hawi SoC.

Palash Kambar (3):
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add Hawi UFS PHY
    compatible
  dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Document the Hawi UFS
    controller
  phy: qcom-qmp-ufs: Add UFS PHY support on Hawi

 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |   1 +
 .../bindings/ufs/qcom,sm8650-ufshc.yaml       |   2 +
 .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  22 +++
 .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
 5 files changed, 202 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h

-- 
2.34.1


