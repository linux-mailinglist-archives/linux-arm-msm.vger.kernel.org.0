Return-Path: <linux-arm-msm+bounces-99248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APK+Jig6wWn2RgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:03:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 511D92F26D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 14:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ABFB3303B5F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B28C43A9DAB;
	Mon, 23 Mar 2026 12:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUO+jJXM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OuGJ1eQj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6158C3A758D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270711; cv=none; b=e/0MIewEY2EloSJcxl8eSm8C0FUlQAhrbcc6Qy47JXO5vQi8h/lnrZZmvtL0BhEI7FKkeS75qFy1v5IGPZm7nufN3rHvBQ3gIQJ84ATGn1pWoSLdHi3uhf3DT0R2S8skMzsSdZbyGQ2PAmLr2I7dpbSxRqr3YBrqEl9wB4fruWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270711; c=relaxed/simple;
	bh=Wi6Y2BBnsOM46XGjOTLIrgWTvNj8GRhq7EiHI7Vdrwg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H13Nam5nyA8Pgq9a+MM8FDFML8iH8qfMOZ1sNUd1pqCZgNDdb9XQ/Cf4QuqjnRe8pYVjH90LhHSM/bF6OHBsZLCt5SNxBBgYZ6+ETuMpf/ExkZiEBxGy9/uV933ni9jTjksFRt0TfywT316tGopfUGN7iB/NTtpdAL/VkJsjEZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUO+jJXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OuGJ1eQj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7X6NQ3240094
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PmXbEe4RrtLmKI+wjThuaUJn4LtpM14Al6Q
	ZbrWnkaI=; b=kUO+jJXMEnRIHtbIQGzgHfoB62E41pPCxRaoMRIVDlI3hSyRTGD
	5xMBE9efjjSUby/gFadznBeJDdNruGabFXjPDI/2QNeytPWa2xqZH7jHSM81ByXq
	DDsaSdy2JdKoOASIUuGZiNn59pceZrawZja0s00N6yFFuSZkw2OJmU6oSO6D05nV
	KtVc4mqBLUoQK0niah0z1L9kG+Wy7NM8djS7IiHW8leCnRyc7vMCE3WtGm5QYUF1
	J7XDuAX0JDjzn4YfmIvwEb7yLO3Enw0t9s4QSmSB1IdSEaKT9p7jSQ16EBDoDLMp
	OSjQMkPrRFZRwqpX5eKpu9CZHpbAapCp1ug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng5e85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:58:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so310302181cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270709; x=1774875509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PmXbEe4RrtLmKI+wjThuaUJn4LtpM14Al6QZbrWnkaI=;
        b=OuGJ1eQj4BijZh/1eccPUuFgoy7ykpDLHJLH61CTYFvWBBftP7SXF/rNs7aA7V/I+7
         caTRJhVxCH9rTVn5cxW1N5xiuhHaz/sa6lHYzs3sR3Q1Qkqp6aTOYhDcnGLlUfmXD2fs
         ogGo+PvyXDx4FwLUMbo/eN5MVHYKKeiiP0oqLjmrZfLz6J/M76xnSXfHoWnWz0S/MXAL
         4bDNzXWO1qmR0AdfTpNMHFFKBFyKh5pGl6W+qYwRw/E4XShM7S/WWL8dnJiVXoD0moWY
         VkFmmFx4hpUpQ+OSZJHx3+qekTITfwTbLMQKlyrSvpdIsqtGgzt34tldizWbMYZXGOWR
         CuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270709; x=1774875509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmXbEe4RrtLmKI+wjThuaUJn4LtpM14Al6QZbrWnkaI=;
        b=Sjw8lRtB+Ii/qQdR8wKUH9aQKQmmmkX5rVOrJemnHtodRQ9ClFWAToTWXHDSYkOxX+
         EbmjrWpJOOXaC05OYFGmG0WZBpbR/nxGVlGXWLpLP4wCaSDFKuQiTII4J4ivrCYwDLSb
         A0CkcbfRHSH3dl3w0LJPHrrVmorHL86/vjz6vHM/vtgoAXLXgKVtEyxVPhs2eSKf4z/y
         t8ijR3PNFTWpsQPrv7ePl1Om39OuBh/xz03XfSuMLRN9xqH4czLCAQp2JkKVDu+DVGP6
         /oAZmeq98mqtCW8mtygM3GtH+3SEW2HoiYwWNEzswKCPzvDB8yfEsh2/J/J0n2x7ZbEh
         BBkg==
X-Forwarded-Encrypted: i=1; AJvYcCUNAdTv1yPXtvFmBx5mghFmSjgimC0Hx6Mfg8MLxKMcNgmxexZElRPNqkZd62TSofLGQHUaOzuqv4JHwwcw@vger.kernel.org
X-Gm-Message-State: AOJu0YzfcgloIIm6/WNKzchxpXAzIu3iMNOuoORaN2tDDidB9Nhbw4pp
	4/0hUu7AE7J4MaJHTPChWO8fy5v3+lHvVuRqkv1zuE3e0pNOwYPr89BBRYZ5hhGjINfX9Mk+GMx
	4Pi7LaZkMS7qQsBL+oE+ODqJ3b6p24C38on0mAqjlgWlIHYT9WfOZoO8j7ZESV5efv2ru
X-Gm-Gg: ATEYQzxI/qmb0TSPUD0KBeZGNJ1e6dHZO2LAHO/QdS6WsNP61AWemVMvlH6qytUZvqT
	W8BHsj+k2UipHasrdPirhOE3vMSLe6mBqGtM+7LBSsneRLJnbMaNeTXOmunlkFGJr6xjgcbHwqs
	KoGUFdSlXCz4f+zj47WJS/FTgBNoaMy203EQLmI5bL4R32avKHsHjryxiXffL8XNYa2mbZ5DGBL
	hEmkfs6xCGXfaiJ4Z2PdmQ9jVl1r0nfwHrxFQqRSTSn1wXZAfUiqOsOMXd5NxLhgtW/bFa0CwPd
	t9ceFWQTaJb3FDVbjeOYJaCshOano25nsCGj1QByj9RwD55iu10IanJZ+TWg+8vGn+Jys2Q7Pi+
	RkV5ig05pYSzDTFHtr5TixQy3t6XP4H9rgFw2IRqJQAyvbvkJS0c9C69VE9CJxTIOo455DB4ktv
	ttcyQm5nAC1mPL
X-Received: by 2002:ac8:5989:0:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50b245b643dmr219189781cf.5.1774270708671;
        Mon, 23 Mar 2026 05:58:28 -0700 (PDT)
X-Received: by 2002:ac8:5989:0:b0:508:ffad:4bf4 with SMTP id d75a77b69052e-50b245b643dmr219189491cf.5.1774270708236;
        Mon, 23 Mar 2026 05:58:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:d9f3:cf55:9f3d:be1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfb9sm487139066b.37.2026.03.23.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:58:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RFC PATCH 0/3] media: qcom: camss: CAMSS Offline Processing Engine support
Date: Mon, 23 Mar 2026 13:58:21 +0100
Message-Id: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -t0Otr6ZgwPCxKv45OyOfqdUwdGnVrEs
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c138f5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=KcaBgNpwSxjJcJ_5TmQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: -t0Otr6ZgwPCxKv45OyOfqdUwdGnVrEs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX1jC7jBBFGqcX
 Vyi/exK8UE/PUWrkLGcAFGz2H9/zdhAQ9oXFVIHY3ynOEzhJl65lEfrcyualJp52d1cfble2UiS
 2xn8V1XkMxNq0Dr+JGSMKFHj87LcFu5K6KtYKD/oyWxTa/GHd24cid+A91SaYN7nWP649g6tXb2
 sUQQuV7ukLd4PRTPUDAN9aEO0VF/bYWeCkyoJ199GNdA+0EjEBe+XN1U6FGQgTeLoeSbhKvaODL
 E0m8Gs1em0UWfcdPuFrsnOLf576WQX7nrNIYqi5WzcIiQaZWwM2fIHmmoKtWklla2jLWTZkXWk8
 9a26jMQd0F61ZTnJAcFHGonjtNiW6CFkoHPUuCGslUFGJSaiIbtuIr8fmUnxqOY+HWnkgvTdPTb
 bhxIWsVUvnnfmDJlmB1Iah9D17GmfVUKR9KR4/Rw7qW/k9L1u0bNe+5B0DIJSrQ+ssKic8PilR9
 sDgg7r7MGIRuQ4zaDfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99248-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[oss.qualcomm.com:query timed out,qualcomm.com:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:query timed out];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 511D92F26D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This RFC series introduces initial support for the Qualcomm CAMSS
Offline Processing Engine (OPE), as found on Agatti-based platforms.
Boards such as Arduino UNO-Q use this SoC family and will benefit
from hardware-assisted image processing enabled by this work.

This represents the first step toward enabling image processing beyond
raw capture on Qualcomm platforms by using hardware blocks for
operations such as debayering, 3A, and scaling.

The OPE sits outside the live capture pipeline. It operates on frames
fetched from system memory and writes processed results back to memory.
Because of this design, the OPE is not tied to any specific capture
interface: frames may come from CAMSS RDI or PIX paths, or from any
other producer capable of providing memory-backed buffers.

The hardware can sustain up to 580 megapixels per second, which is
sufficient to process a 10MPix stream at 60 fps or to handle four
parallel 2MPix (HD) streams at 60 fps.

The initial driver implementation relies on the V4L2 m2m framework
to keep the design simple while already enabling practical offline
processing workflows. This model also provides time-sharing across
multiple contexts through its built-in scheduling.

This first version is intentionally minimalistic. It provides a working
configuration using a fixed set of static processing parameters, mainly
to achieve correct and good-quality debayering.

Support for more advanced use-cases (dynamic parameters, statistics
outputs, additional data endpoints) will require evolving the driver
model beyond a pure m2m design. This may involve either moving away
from m2m, as other ISP drivers do, or extending it to support auxiliary
endpoints for parameters and statistics.

This series includes:
  - dt-binding schema for CAMSS OPE
  - initial CAMSS OPE driver
  - QCM2290 device tree node describing the hardware block.

Feedback on the architecture and expected uAPI direction is especially
welcome.

Loic Poulain (3):
  dt-bindings: media: qcom: Add CAMSS Offline Processing Engine (OPE)
  media: qcom: camss: Add CAMSS Offline Processing Engine driver
  arm64: dts: qcom: qcm2290: Add CAMSS OPE node

 .../bindings/media/qcom,camss-ope.yaml        |   87 +
 arch/arm64/boot/dts/qcom/agatti.dtsi          |   72 +
 drivers/media/platform/qcom/camss/Makefile    |    4 +
 drivers/media/platform/qcom/camss/camss-ope.c | 2058 +++++++++++++++++
 4 files changed, 2221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,camss-ope.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-ope.c

-- 
2.34.1


