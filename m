Return-Path: <linux-arm-msm+bounces-90149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF1IEJzvcWlKZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90149-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:36:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 222B3649E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 10:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C8A760AB0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 09:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1534A3A35DA;
	Thu, 22 Jan 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHQmGr1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VutWJXiX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506363A35DF
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769074150; cv=none; b=TLFZz6oS0UYyI2YlMGQCJh6jHAUoLjtIWsNivqk61Jema+ozo4kXRX2u5rHb7V4goJZEnTLSV/MIREVZAN4bjgqqXQBISBxwt+aNSGV0zby4BH+Lt3MVoXRZYI5IShX/jTKBhbyWCt60LkGhGhHtsEnZODBBIby2S4+6ctu1pIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769074150; c=relaxed/simple;
	bh=l726UvUudfj4lAVHQRk7doXHqWF8GgYbHwQGE0X0cTA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k5Ld/BxhPHkmRVoY477MGpmIY/HmCCD0XXav6EytAo7O5amgfZmwI2nz7kJ0IeRuc5VqcGxldSShp822xoQjLj4W1HbN6QXzg8Jxif2WRF3jeg45BURk2H6KYSu6/6mK5twDLwOQrSZ6Xy76uMGhvPgF81SIZTGhED5zR/8K9YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHQmGr1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VutWJXiX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M8h6On646221
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dGvF6SHJr0bMIa867tDAlm4sNqFsBGdAC8D
	s11+ZVUw=; b=WHQmGr1WG5K+xBf0MgBW5deHnfOntjJC3q5ZRAf90oMUsj1YWu5
	8A0Yt6eNFs8R6gkgA22LggJE/f59J4c0SbloftUDDWnHYy5S7q0NyvRK6rRGjPmA
	AfPoqcC2cdvDROIrMWslP6zOAZ5XEfeHLk5jCmRhhDgn281TtRxGackCDitCNEiV
	UXTtY1hQ8DJJ3ctENa0TVznBSC+8MAsuK5RXn7OFsr9iucAoOT2jWg/SnXqPhwA9
	8I6cx7/ZB7bqinZZH+02U5bEH1OdEcHmNvNrzRnOpdUDgp+CRt3yxvGdWr2FG6wk
	j5L+dkCI3eKuHhzYCRqr7TH5KvrKwBXgnrw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu8j9sj3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:29:03 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c52d37d346dso412814a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769074143; x=1769678943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGvF6SHJr0bMIa867tDAlm4sNqFsBGdAC8Ds11+ZVUw=;
        b=VutWJXiXwoVOzEooLK8gKZb+TlkPSkQ6+uXdvR16zXxNzwc5901k5IcIXdrfeDKLUl
         Jc+aPx3efvObNas2YfaYkvb14Ll0kTRn5JhjrHsiGZz22S8SuTuSF8CFTyB5AnDav6kh
         IuNf7YRq/dBGcCNTgMlZfJ8gvMdg3/e2Rr1B5brEepytzdGzMF4cLB9AvseEEcUXWPyL
         2H5tSP59HTChRX4pfdEwUc8PkAnowOw38dXIvPxzD09Vk6f44ZbW7Plsr0QC9dhxPP0P
         7D48NhTSXPrDymJcfAmPwoHMfm2Hp1mqIW2AScaqQUmcfpKIaNCBEN1VvJMseLbttseq
         CHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074143; x=1769678943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGvF6SHJr0bMIa867tDAlm4sNqFsBGdAC8Ds11+ZVUw=;
        b=fw6dSMzJ56VFn5vWtJrGl/JVGdsTrbBnahlKBqJ/KqTbN1/KRH3PP+akRKCM6BNARS
         wlvDDsTn7E2H1oYsNOef6yKpR3OOaQAlQfyUKDxBVbXtS6dBo1FaJ4SV8L+WDy8JCTMk
         4aliJmF6gwWBtEvjfNf4w8y/jd/KUmNQluBykZ+kRufNGmyuoyhMv/nMxtICcfpw+ceb
         BzORPcyxJ/szovBByEFyqjGqg6yhQ+f/jrqFS1f4hyWUvV2YXfm4XAJeBmdv75adpag6
         7e3dP5hc/cQtaKrqmU0FWc6jEoXcCQlI6xTRHj+Qg/f3K9NNrWdm0QCAQKsstlVGMsbg
         s7jw==
X-Forwarded-Encrypted: i=1; AJvYcCUhUBB4e7A/hqGRFLJR9jH7B7zqFGxbPQI5mi5yI+tlYgCWNxUQcMPMylq7EPX4gkuyPTIs2em7hEn8SUpP@vger.kernel.org
X-Gm-Message-State: AOJu0YxpNsyeJa7lJgn717zMHdp+fGm+V3eUpN0V7xq3sNqPUJr8wGmV
	KeYbpIDVuoE6BKjbIddwp01k/Hr9RclfqopT8UyAKGoyprUWajY1VYV1xUkVqw9kDRdYq65a34m
	5jzuZYe0BHldDGRoJUUgChvDHXVbZaIh9T9JKzLyQ0kGF9WPv0Lvg1/S0XY3xPxP/uLY6
X-Gm-Gg: AZuq6aLey21bbFnO9DkU1LspsxbajlHjCbx9S4nKZywpuNl9TkCqsWPLUTcajs2o9EX
	GjnpYUH1MrMxV+VQpFkKR09Iq+Lx4z5LF6+7RN/7bBercBFQuMcely+SQPp2iYqVbgjYl+mnRfI
	gInrUqLlzyGrsJWo/Y+vxYqg0mADeskFN1ra3WWRvQEBoanSlJYsWlRzyRxzJ0wBs4RlHQQy4l9
	XJZl5Lh46iqdbrX1eAlefpnsd72+lrLejcoBuf1QgRSwZVqNmjhzeUCC1nHQFa3zAjaKjxyJuU7
	mFwvtd7P46sBdmLeOLkmEeM6B1kOcaoS1QZtuoTuo0u/fjsxGG0Pe+ucIY/pz2eb+AHnSB0kXAs
	D2tPOkq8nEZ109Nk1i1EhH6Axb7Ea+IRindAIIUuG7/o=
X-Received: by 2002:a05:6a21:b93:b0:34f:241f:aa1e with SMTP id adf61e73a8af0-38e45d53373mr7897315637.31.1769074142681;
        Thu, 22 Jan 2026 01:29:02 -0800 (PST)
X-Received: by 2002:a05:6a21:b93:b0:34f:241f:aa1e with SMTP id adf61e73a8af0-38e45d53373mr7897291637.31.1769074142150;
        Thu, 22 Jan 2026 01:29:02 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf355ca7sm17395247a12.27.2026.01.22.01.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 01:29:01 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Enable secondary USB controller in host mode
Date: Thu, 22 Jan 2026 14:58:48 +0530
Message-Id: <20260122092852.887624-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -hOuAtQkbB38E-oN8a8dkLMIfmDa1lO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA2NCBTYWx0ZWRfX+o6tFa5henIo
 uKC5jj4fTWW6R+ndZLmEvlkulCopYPZUN9z5CO90NdYyWXr5DjTtWe3Fpn3Rquff0ZE3OXDcMER
 Lz/w+QkbNI5nrnuTGl5DP8tcOuQHB316zsncHLXsvTjzGrOZRpQgu7L8Qucg2yr3zM6uZOcy7MN
 GPMiHUjdGku+5QADyHM0aEbM52wKvT7rcMxh1j9XwJWdPDVTp60w0iD7qd80Z3nFa/JjfsPWFSA
 FU3gt/PiueCbnmHQmzfwvG4h9zdup9m596IGzTyeguT9kjBl0UeQLY2T+3JFieli7dijGEOGh6y
 iccE90TmOixj9imnsSMPr3L4995e44Nyd9ffdgWp9QJd4Y8aOCQWWrxyx+6lLQJc5tFnRWtP+g1
 xuNzmW35G1EBMprmT1UtTW6eR7WuHFxDhjIkuiWWZip/RF+sWBCyiwi20WAhHifBwfrF03PANM+
 ZBr2rLd4yvcE2UdDLmg==
X-Authority-Analysis: v=2.4 cv=U4CfzOru c=1 sm=1 tr=0 ts=6971eddf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaSnYlJwPn2ZfU4Ri74A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: -hOuAtQkbB38E-oN8a8dkLMIfmDa1lO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90149-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 222B3649E2
X-Rspamd-Action: no action

Enable secondary USB controller in host mode on lemans EVK platforms.

Changes in v5:
Updated comment description in DT.
Updated vdd-supply status for other hubs in bindings.

Changes in v4:
Updated power supply property for hub.
Updated details for all 4 ports of hub.

Changes in v3:
Updated binding properties for genesys hub.

Changes in v2:
Add Genesys Logic GL3590 hub support.
Rename hd3ss3220_ instance for primary port controller.

Link to v4:
https://lore.kernel.org/all/20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com/

Link to v3:
https://lore.kernel.org/all/20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com/

Link to v2:
https://lore.kernel.org/all/20251216120749.94007-1-swati.agarwal@oss.qualcomm.com/

Link to v1:
https://lore.kernel.org/all/20251203-swati-v1-1-250efcb4e6a7@oss.qualcomm.com/

Swati Agarwal (4):
  dt-bindings: usb: Add binding for Genesys Logic GL3590 hub
  usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support
  arm64: dts: qcom: lemans-evk: Rename hd3ss3220_ instance for primary
    port controller
  arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host
    mode

 .../bindings/usb/genesys,gl850g.yaml          |  19 ++
 arch/arm64/boot/dts/qcom/lemans-evk.dts       | 216 +++++++++++++++++-
 drivers/usb/misc/onboard_usb_dev.c            |   1 +
 drivers/usb/misc/onboard_usb_dev.h            |   8 +
 4 files changed, 240 insertions(+), 4 deletions(-)

-- 
2.34.1


