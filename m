Return-Path: <linux-arm-msm+bounces-105780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCsxA0PS+Gm41AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:07:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBF04C1BD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 19:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AB44300681E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 17:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E49013E3C6F;
	Mon,  4 May 2026 17:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N/vjQaXc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gt860h0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB7E3C455B
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 17:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914431; cv=none; b=h8mmSUv6WZHColfiEdmMHcXg1fHSC1+9d1xz7WsdOAoZJ6ELKzsBekCQA/jrFO47CfWrThx+IRdV5yWCV3lCRvW7/0S8GnjTTKiZkqVpTHfM8viCIdZTgwn1lU+Os78hCY6Hngf75Vcq2yqolB9NU0zSHKBUDpRSwL8F2a1oAGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914431; c=relaxed/simple;
	bh=l1KP90LuLj4asV7zxBDG3JLI2jxQvuA1XdQmED2XHqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JXkj0e9V7krE8J8Eeob5lPMIKPIiwwo4vNp3K5nTcohx4CvP6xT7R8BP/V5Frcwrp8b50tvkhjbUFilUnPu8cKhaLrhPZrUnY5vinge0pazU9PREtL4RGXGwKR/CBFEStKwBwAcUWFNWp3DOZA9IIQzn7XvvenTYqW7M8Cs0K0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N/vjQaXc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gt860h0c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4gBW1152874
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 17:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vnLRN/b0NlAa9y/7bNkF1EzAAUbk8bLGcQK
	rMdeZgYU=; b=N/vjQaXcpdpIit9nwzzaY0utC5UmlTbh6hv6ZWn43dLNd3e4RTi
	fI7zgm09QbR984iuQXrQate9AKuLNJgRa27OysNGOYYCkFQAdQiu+yRlMWr13xtz
	6dM7dcb4fsMf62ZCYlYBPR3Z6UpvnbmBgLT+dj0b2nlAKqgsdCReSkz7OwBDtiTD
	sp6i/dl0A5Q2mjBFzsOQmz+jaRd82dywfvRN3QrTgI0Fuopci4VPc4xmaNottRyZ
	O8J+Ioi2Ub1KRDkPH0bWgjl7hAtL6pGx5lzwBNAEqPXHkE/huKN3zZfjaSM1rK/Z
	VDuI7yDKMgMtqzwkF8B7Hr/gw7XS0FfBC4Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscy9d1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 17:07:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365161a9de4so2048026a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777914429; x=1778519229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnLRN/b0NlAa9y/7bNkF1EzAAUbk8bLGcQKrMdeZgYU=;
        b=Gt860h0c3OYvKzVfLwL9joHgRYluivWuWXf35+yYoLUQfPG/lRAyv875CAyP+rpcDz
         GtSq2rh5fXj+Ju60m9k9iJHM/PdFqnK1PIq1MaW0ytHK6/rQZtoG6Qg2bx0TD/1GejRM
         mGLnetzM4DYErbvjCJbgfEB4MJShLscWQwEdYSUmN2RxJhy0lFpai7sQ9LrJI6jroQJS
         griF5fm6jDhyMv20PlQRS23U671JVJjxMOMCKhMpYriVfxiPtaXgnMF/oZho19ojH//s
         1WSenkIQCaeaY1ZOTkjgWplErQHL8yiFWO7SEmd+k+h/GyTPSK5jycEof2TuRCCHNJI3
         jyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914429; x=1778519229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnLRN/b0NlAa9y/7bNkF1EzAAUbk8bLGcQKrMdeZgYU=;
        b=G8JPXOIqzOmdlZIYWfRv+ZuBiOT+WMyj3NQEwQVzS6CSZOAV2zWsucTRVsEdy2Dnar
         j0nhyAdCUhmiy+Udv+PKL6LHYawMh7oPRzqDyavNrz/ZSII52UuMzQCzAhaRONQH52Oc
         F4zsnnox75TTgssQyMBM7pCdPWjEUgfNvXYLhfuIwiTObgCTQb86t8xlFgwhCokxroTC
         WX+8PIFCr1eFLDsO1sNiXhnICcxYjMegeDgPi9xhWlLMC7o69ebaVaIdtoHhYX6THsvQ
         3IUbSBVYUN29eXh60DpS54BIRrpmnwrqskivAUKEH+yM3A3UtkcWQw76vHGYHZNgDCiQ
         Y9Iw==
X-Gm-Message-State: AOJu0YxEu46sw7soM/0LhEUp6axUEfmZ8PukSQF9XK+WHTvUg2lN0Icx
	eV3dkpJ5KK3NC3ScVz2zKKp32Vv3IpTySk8HA16kxFThCN9frxOfDy9Do+5XpnBPLsQUm2DY3ol
	uK86XB9OBNS7zktXcGKcjLj/nYXwH2LCYXMvdvVireiPgFdJ25POiFUkJ1qBC1PEGWrYe
X-Gm-Gg: AeBDieuO1/ZdBHKwPklxgIJZbLE4Vi+rce2E0CkyacbEmZSXKSp3IFSPN4kOpfGwdr5
	pIBXjUBsl6ZAKA205d8q1bQiVwlxcsjEInkKlfXgM7+tFT1R6NAmn5cUu5FxTglOUw4iHMVT8LO
	WwtUZa1l9RbU85fEUawIiGjkWkFxFwtQn7MLFK8HM2j0uTYrxLEw2MDvnR58hZ19J9P2Q1AebDw
	uLVhLYIeS3p8HWdkTES19ioRjbXn7Pfx4d9viQX310dMMpPst6SpwmgcvKBvwD+G3SqU3+0S3Ar
	gWA45S6L0iWoZ8xCY0V/93w5vuOZfbXTfZfuqOgWWW3cbsNybh/U4qRSU6tMUapyJbWQXdl+2XM
	GDCFl5RfGMvJ+639QSZb3WCXeb4d8qqCIUMFb2Pnn7x7ltZwCMDilPDCIuEYLqSv9S31bzMcUEi
	vmAaFiUD1liwdTdJQhYzLJB9pAJA==
X-Received: by 2002:a17:90b:4a4f:b0:35e:3afb:a3ff with SMTP id 98e67ed59e1d1-3650cd08f1fmr10015820a91.3.1777914428912;
        Mon, 04 May 2026 10:07:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4a4f:b0:35e:3afb:a3ff with SMTP id 98e67ed59e1d1-3650cd08f1fmr10015740a91.3.1777914428196;
        Mon, 04 May 2026 10:07:08 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm6256847a91.2.2026.05.04.10.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:07:07 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add USB Phy driver and binding changes for Qualcomm Shikra SoC
Date: Mon,  4 May 2026 22:36:55 +0530
Message-Id: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NiBTYWx0ZWRfXyv+5E+fgj+dC
 jt6PFu8o2Arg5tZryQ0jQ3B+6mJncEL9cruMzon7TBNkl7TFDDl0OzUhtteWgYp/ftuW/Ddb5Qf
 jIs1MemHvpMe1Xhw6LGSfoMbyzjtueDPTMvuuzCfFcQjGASNj68j7MAFU7AN48QDZrkD84cqANl
 ZwAncABXfEuBIstPRWEj7eaDP7qdWicnBrnuPb9BgEhIRhzt2fZiOm/PxdOxn8mqqaMCsQuHXIZ
 tSgChA/WRd2ivhcJHsxCPyNZ8kIVFQyuhv5hFlW2J8EpVlhKqsi4TNVP+OL63FLBznm9qNwMZIZ
 GJ98CEVNW1ik9nAXBtktzRkAepUtaS+AmhY/XJCOgYrteUgDcyfvNSGE8e/vYmo67ezyX+OKicK
 NYfGsuwN4PFZ9ACSuTG9Ozyhq5ASH0gOdTfZzQtszY94xK8IOV7zs1lPW3s4EThQ3zrwBDg0R3u
 pWSi4Q8LsymEjI/Tz3Q==
X-Proofpoint-ORIG-GUID: wAJ8Jfii3U-ihkSrkFtEhXQJ7WtqxVFr
X-Proofpoint-GUID: wAJ8Jfii3U-ihkSrkFtEhXQJ7WtqxVFr
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f8d23d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=_yzwj3N-3Ah45w2uUsUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040156
X-Rspamd-Queue-Id: 9DBF04C1BD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105780-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This series adds Driver and binding changes for USB Phys on Shikra. There
are two USB controllers - One of them is SS capable and other is highspeed
only capable. The ss Phy init sequence is same as that of Talos.

Changes in v2:
- Separated the usb controller binding changes
- Updated commit texts.

Krishna Kurapati (4):
  dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
  dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: Add support for Shikra
  phy: qcom-qusb2: Add support for Shikra
  phy: qcom: qmp-usbc: Add qmp configuration for Shikra

 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml  |  2 ++
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml  |  1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c         |  3 +++
 drivers/phy/qualcomm/phy-qcom-qusb2.c            | 16 ++++++++++++++++
 4 files changed, 22 insertions(+)

-- 
2.34.1


