Return-Path: <linux-arm-msm+bounces-77073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B02BD70FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 04:21:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EBDD634E9FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 02:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B737303CAF;
	Tue, 14 Oct 2025 02:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qg9y4Vhq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80E323C50A
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760408494; cv=none; b=hdJVvx9UUuSaDKdEjh3N6PQZNrtVZY44MnrLgV+y/pk1knUcXDZS2xI+HZ/dJI29FVCZCw93oorFncFnqa6GhSMQzcr70D8LvqH5Dl57EK8nSGzAMAvAcxc5LWn3Ek5mHYaYA9xEdhgjlY1GfI+WPYyKH+4wi5ZWNDTp42K45R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760408494; c=relaxed/simple;
	bh=S5O/FEl12KlylopKPyyZS4WaTtSHw5WCR8rj3ZjdBew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t1GXaFLWBZPWnCnmo/p8qaqE931eTDb1MpNOI6kvJi/jWdIz6OKie7erKhHAxQzqVCAliIl1XwAStaRXaYUU7upoR+H6+3P+CLWx2Ed6bbww1Pd6gvD/IIy6DsNgx8hbJOjl8R1bWj9OppjqrC8SaxV/TSjt0DcPTkVDPbbAj+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qg9y4Vhq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDoSi003848
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=unaUOPlWyYZC2qPfUCttQmeNv1tqAOga+7j
	TA4G8nDI=; b=Qg9y4VhqcZOmfRFMNc2FvLMDAKckLBSlKLFOqeG6wtXY2myxgwq
	XUD1uc6WhcSts9KyUsp+EvX6WMNCwBiuYEY0uNn24HUAJ+Nw8WrHcWHhoU8rZWs5
	0e1xfGe4ajTXfmbXXcNHPB4/enaClHqOGa1O0hd5kx3G34PZtf2iuOIbXBXpCOFX
	lfJYMxRBvQznLhDyTMKu0T19fJxG0eJVSj0dV6+bk0VYBK5AkcMIiFtKdZzJDi4G
	YEcr2mZ2+blE2498X0YnE8B98cQw/Qg+iiEemSus3Sq8NK6A0zLWB26ECxYOpXX9
	hRtPdJLE9yuS83rMYaXZ9/UjIUvtKXKP7dw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbhxu08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 02:21:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ee157b9c9so8381767a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 19:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760408490; x=1761013290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unaUOPlWyYZC2qPfUCttQmeNv1tqAOga+7jTA4G8nDI=;
        b=j86zf1w3r202IeFZ+EfET3TJRq+NMQSlHbhK1GD9t42x6LEc60m6raAnKHBnhXjRYl
         PjaIx9hHlbGSsXaEL1UYrzq3j/4lAbQBSWscBVYlWXH+AONkIYHXnO2eX0Wszy2yT7D/
         f2mkdTqpU5I26V9Ugcy3yE0Wrj+B3KU27MATkGGPBk7xv3RYxI60XT+RJwyUwXEtY/Pr
         AS+8vQPhELvc5BWGALqJfHVpCrACRvnXxGQvv20sVyT0J+EzxMr3GMczpDZoDzja6eUo
         aq6EAfDQuwTkqS5ztAzfrYoFEab5Y9mukEUm6EVb9yiVI6i6BL6UHkIPz6fpUjco0W+d
         7paw==
X-Gm-Message-State: AOJu0YypBoWS6/b/12F0yXe/QhPwRmnQ1UksqLa7h2KT1hrHEpEPNMUO
	VISag0hXbEr8spQiT5o/fZJlJCcb03271630YEb/mDBpMSMJFhBP6QROjHCkOoyxDIbFsTnWzZ1
	VIc8YbvxXAbuJa3VGliQEG2AN6kv1X8Lqfgo+DZcIToS/jIXlWYGiENssbPPae/5hRNyj
X-Gm-Gg: ASbGncuAKdkk0mKAzR29kB1kOSOuoFcWHt0eVlEiMGYUxe9vSHOYZk9QmUGUu14unwW
	CCimtq+Y4woOVHHmRXkOBIozp8mQHrfbYt2rNxcMVrurqJ4D8s0taNWIQ/edJBiWvezXIIzXHIZ
	UBzspA04ljt/QMfdIziRlgAgEAhFkqCHaIRzp1NvlRdi0m0u1eQOUuynHVvIOlDb1QsYexBsHNK
	dvfiVRS4lvoor97wu40wkCMekIoLutANZoGoZ8O3ZL1qxdH4DJSk3NmmUzd+2T8Hh+iV0VN2E7I
	j+4aFZVcRS7j9RBECOHbNmlaKmUJP1golOHTcTeaYWbSsWb+MHL+nGP9IaWworJDzbzJKNLrU8S
	GMQ==
X-Received: by 2002:a17:90b:4c88:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-33b513b4b5cmr35041137a91.17.1760408490090;
        Mon, 13 Oct 2025 19:21:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUQZ1xjAjxk4eCc+ofIEgkSIcQPBSSb2nFVfn6pOeR+NG2GquoZycFm6iDeROrjvqgrhSTJA==
X-Received: by 2002:a17:90b:4c88:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-33b513b4b5cmr35041092a91.17.1760408489469;
        Mon, 13 Oct 2025 19:21:29 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61aab6c1sm14006978a91.13.2025.10.13.19.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 19:21:29 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Modify USB controller nodes for USB on X1E80100
Date: Tue, 14 Oct 2025 07:51:19 +0530
Message-Id: <20251014022121.1850871-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX8CpY58l+F0Q3
 gzUrOWlrqTjKW7IDHBoxC+ErvcozFbGRZPJou05Bl3uCG4hbbrHrSPxxoTd7xTlrc2V5xZ/Sgf9
 E58cyJsnVpp/2g0HpaeCMju8qTIhzSiGKe8HjS/fZjGdRLQq+wYFqr5uN5m3G9pFsMCERc3Yv/G
 wxG8FThdXPyhnnla0Mxn44Y4ie7G66WzJB8E1UkOADwJPOyD5mlNcZtGKtnKKmlOwrgx/Doefeh
 c3eG8cugijAWXE7jn91nAReWAt8hjMa5oCkux4Ke4cD/bBMyXelR2FXbBULBOG3CaLOf1KkICfY
 ucKduKHOQVrVgVZe2k8zmNU0XD9S7jWGL5SWFfiOsuoUfUpqIK8ZgBIEliQL0kkXcte3ujjQnXM
 aH72attwRmOQBkv4wDYDpLFMpbf4jA==
X-Proofpoint-ORIG-GUID: -krzELbT6rI_r8VrsTvn4MaElBYTV-Mq
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68edb3ab cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=raB0oGjO3AqbCED4f70A:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: -krzELbT6rI_r8VrsTvn4MaElBYTV-Mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

This series aims to flatten usb dt nodes and use latest bindings.
While at it, fix a compile time warning on the HS only controller node.

Tests done:
1. On CRD, verified host mode operation of the 3 exposed Type-C ports
and enumeration of the Goodix fingerprint sensor on the multiport
usb controller.

2. Modified the dr_mode to otg for the first 3 controllers and
verified role switching and device mode operation on the 3 exposed
Type-C ports.

HS only controller was not tested on any platform.

Krishna Kurapati (2):
  arm64: dts: qcom: x1e80100: Flatten usb controller nodes
  arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS controller

 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi   |  24 +-
 .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    |  12 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  18 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   |  18 +-
 .../boot/dts/qcom/x1-hp-omnibook-x14.dtsi     |  18 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  |  18 +-
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  18 +-
 .../dts/qcom/x1e80100-asus-vivobook-s15.dts   |  18 +-
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     |  12 +-
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  18 +-
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  12 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     |  18 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 322 ++++++++----------
 .../dts/qcom/x1p42100-lenovo-thinkbook-16.dts |  24 +-
 14 files changed, 214 insertions(+), 336 deletions(-)

-- 
2.34.1


