Return-Path: <linux-arm-msm+bounces-103287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MOICcB332lJTgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:34:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C88403DB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 13:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8A353102E3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E27437C93C;
	Wed, 15 Apr 2026 11:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmIWpX0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TnPBc1+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD6737C90F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776252583; cv=none; b=H0JDGXuZdSPbbLwejg0oe1MFDx9LRqffuYAo7Dgme6LZGwycwpVaLCjamGVBk8ThvPOKBquXgXgEovYyHb3x5hRGrvjNTyA0YY3pIOycXrFf8dtIGCfeAJt04W47Z/JwmnsgeXmpG4GR+plwCTW+IA1MsknfKUSy78GN+DOcjaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776252583; c=relaxed/simple;
	bh=zkTj1FPBTPay2KEYBi9VK1EONkKuBT3XGTuds7WjW4E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IMJaK5iBiAJA9FAzWDB0P1+s42AaeDbsb+Gn+pfFrgv3rVcfNXhHcFLp5XjLud0/yIz25TQhNYTxgUW95TZBg6pz0UE+/emKy/shwV3XedmK8M+8nhRqwg4ecNu/KKThToRcIBdDpONl3QbxqabeKu+WkQjSzRKyRTJJ0+DmyGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmIWpX0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TnPBc1+w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F981ct4053063
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MvJqQNQOqBECWN6GQMmqlr
	hF5/Geu/mthKKLlru98gk=; b=ZmIWpX0RnxT48IdcKUnQ+i1bqGgW77TDmA5m4S
	VtEfxVwA5r8WgE1UZWPN0mXL/VWkyD8W7/jzLWS2MlinOYXZNB7TaXxRC8G0W1QU
	BRvv+jAaAIF258zVGwqBhY0a0Zdcfs+PzFquPE8JACPGO9PnSAf68NL73hn1uCse
	HCxfCpXV49jp66/xlzhpbA1Jug1Bffgjw/RvpuxffWYKvm988HsvVRMUm2Gf0V3r
	6ENMn/dJwvdfeq82+VHxXgQ8I91J0ECFenFP1HkvtbS5/WGnK6nuGJ+/T6oq8Y0u
	/v8BBXCKI+Cgint9cntsZRb7DNhOfox/30ABJN0cwMgHAOTw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj7s5rde1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 11:29:42 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b465bf993cso27669665ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776252581; x=1776857381; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MvJqQNQOqBECWN6GQMmqlrhF5/Geu/mthKKLlru98gk=;
        b=TnPBc1+wQcradvZgvJ3gP0PifJHUkO+28oCmrkvbiIPRCnqsjyrZgQkAAul0nFs68I
         Kr+yxqY4t9clu9jjLfhr6y3DS9SPmszEiluEiJT3yKT7d9jGSOO9Z2rftbYjZRgND2QW
         H7DTLFEC2aLwNn9qVYtemdrqBDI5MV3bBNoGPnpLpnLasT0XQa4d5EMSiq1g1SYvOfLe
         AQa8nSnF19Y/1R+NuesaIWKmZ3F+3T1IlyX44BE8WhyX6wjbp9SDvCN/fSkIGf+4/xRP
         yix0h9aVLLTJteGmbNlV9FMPQ6v6wMg+F1FNUmrX4XpM1iihYYu9Rszs49ntnWWq917D
         4GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776252581; x=1776857381;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvJqQNQOqBECWN6GQMmqlrhF5/Geu/mthKKLlru98gk=;
        b=PL2CdkZ6akWQWyRp33mSyEKHh1GJmEJKSxB6+FjJUM50Rzhf52cNEiwPIyXq875WBP
         AxklU7BEuYd8WTJFVjgWow94QhM0HE0DmNYlZk+ObLJ/RRvaCtNQ5GMQmlU9LmpfxRmR
         CxlcIetBEF5kYFp/SrsPW3pws7IdIrCvqRfWsy9aiMyvqJiUdZW470rR2w3bUCCkbY3W
         oDoEFlJca7xG3P7ym1nQh/VYwA4MkCtVqn64so7xS0JbsbKyQm3GfmWaksHWgXeq/Au9
         X7UJBIDoe/ir2z3QSYVndBUTeVSDt+E33cGony5rnAAEzojnacjtwv2aO3UxJyHZcrnZ
         8XcQ==
X-Gm-Message-State: AOJu0Yz9JadncYDX6YZDq/ge7tQ1sA47WP+cwYmNiwsVE7UL8UJZ323M
	A0mIJ+HKDMHL3nsO0DaMWSKh1zSyrd11F1ay5hiU7t1Noz6WwT30h+mybNCVjKmHEgrcl2liaV2
	QoV6aGoupo5zXCsX8kB3Jp7Q3NA0O2s3D5Ll82BtPJkRauTCQjvS5PyCst3OKFzJPqP1o
X-Gm-Gg: AeBDietL4ASXyKAQ3TbCtaTIe2r+UvQOJXl/xmTQK33RE/KA3JVEV2AxFrbB7CD5VAN
	qcRjd5sMDZKQFsjY8hXOjDWlyPotyNMVDgGX9WdSwMTSspQWbg8qcBLElOWZXFr8oCvpz04KPnV
	vK0mTN/tGdkP2GxyJA2rRr6+BAb/CGQdbCih3UQGr0VtVxtm799xF7nvliQB5uhydR7niUcOgs1
	THb+o8vBjoj73W7hjBqZ5s0zzAHpi+1mlm7Uu37HrZblNd81DDtoocaOGRa9FxDsNYIgMiXHf3G
	s3l51OZTctAud8rk/xCLEP8+DVbyyxZ5p+BVat/EsFdydwsrfSGk7qbIdlPbWDrUidMF4TNOCGH
	r2v/3z+3Wsz/pTloD44VxzWjBajP10NHfbLDgO65dE0qQP4TdPrA55p7xvwAvlRqkozjq7Otz2O
	Vz/gRbvX+UfBbE/VpOfbKb8vJJncLaN9PR5aPOsnfPchpA4+mxe5Zk0KdG
X-Received: by 2002:a05:6a21:1b8a:b0:39f:27ab:2438 with SMTP id adf61e73a8af0-39fe400280amr25183966637.48.1776252581409;
        Wed, 15 Apr 2026 04:29:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b8a:b0:39f:27ab:2438 with SMTP id adf61e73a8af0-39fe400280amr25183939637.48.1776252580924;
        Wed, 15 Apr 2026 04:29:40 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7957ecee24sm1417183a12.1.2026.04.15.04.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 04:29:40 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] Introduce TLMM driver for Qualcomm IPQ9650 SoC
Date: Wed, 15 Apr 2026 16:59:23 +0530
Message-Id: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJN232kC/yXMTQ5AMBBA4avIrDVpiyZcRUSqBiN+W0Qi7q5Yf
 ov3LnBoCR1kwQUWD3I0Tx4iDMB0emqRUe0NkkvFI6kYLWuqEl5uwzgyqYVBHavGpAJ8slhs6Px
 2efHb7VWPZnsfcN8PqYuTw3AAAAA=
X-Change-ID: 20260326-ipq9650_tlmm-2a1cea46fc91
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776252577; l=842;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=zkTj1FPBTPay2KEYBi9VK1EONkKuBT3XGTuds7WjW4E=;
 b=gct8cnLRX2BpHIVUTXwooKifRVem7Rf4JL4pVZzEVlUXczvn8jflm59sRI8dfrdgB3CDzpwGH
 v8poMwWur64AJaw6PExA/eu3zcflRzfWJtngtRWeYTW7b4GDdm3l4m/
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=A7Zc+aWG c=1 sm=1 tr=0 ts=69df76a6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=udllaobD4nFk2SGM0x8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: SpJ_8sQs8vHqcvK1MFOEueJoVFyBgd7u
X-Proofpoint-GUID: SpJ_8sQs8vHqcvK1MFOEueJoVFyBgd7u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDEwNSBTYWx0ZWRfX09l5Xn85IXc6
 mEoXLeunEA2IrzEF5pblqvhuzdOw4EM01/LgfmKyCgLEUbUREyu4sp7cCbGroofVbdnqTqqwEk/
 GWDwK57DvS9hCIHjs/EscSTcGGIjmYbXjR1VmEkAdaTELSAOlJrPO/NscbouCy1H4k6LxFJw4gz
 BZK0LYudjZAQ8t5105ur6HJnRF516xHaxF0HjpSmc8VrVSeiSNSsZXE3v3/FjG8yqAxlRKJe7ow
 TQIXVF/vrBHdBdmc5RwwEf/D3r1d8S6vDdMlfe6BGhfjhTk9ypCRqmsZ+TZDXVxMFx1V1YAnMG8
 HtKW+OLKbCtuDqfLbf07sHHK6rLIjlFG6VHUYd8EDAU289Oo/Gwif+U47K5P7ONFVSjNU3K7gS5
 KvvywV0rDWSwNMAlSFuZNFRHi3jZjgDhzlwjqTFB9QtpgzLdr2knCoXrkjVm3lGSGusAG1Ws336
 I7TTTolmBErq8B9pZtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150105
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103287-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6C88403DB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IPQ9650 is Qualcomm's SoC for Routers, Gateways and Access Points.
Add the pinctrl support for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      dt-bindings: pinctrl: qcom: add IPQ9650 pinctrl
      pinctrl: qcom: Introduce IPQ9650 TLMM driver

 .../bindings/pinctrl/qcom,ipq9650-tlmm.yaml        | 118 ++++
 drivers/pinctrl/qcom/Kconfig.msm                   |   9 +
 drivers/pinctrl/qcom/Makefile                      |   1 +
 drivers/pinctrl/qcom/pinctrl-ipq9650.c             | 762 +++++++++++++++++++++
 4 files changed, 890 insertions(+)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260326-ipq9650_tlmm-2a1cea46fc91

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


