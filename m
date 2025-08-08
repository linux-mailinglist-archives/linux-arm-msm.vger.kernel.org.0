Return-Path: <linux-arm-msm+bounces-68125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E39B1E9D9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 16:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A88A7A8256
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 14:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BBD2750E2;
	Fri,  8 Aug 2025 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKviQFxg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B03223710
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 14:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754661833; cv=none; b=qvuSPG1ZuyYkSafTH5QBqxfqnv4tGhAgTmlg1RABTvj0Nw1wPgcn5OqKfStce5aQUMdduhOxwJraXTOMm3XG5adAGaZKCp85N8MXR1h7cTCPye/eWETHsvwxubGBKs4iPKtukGnHKsFX3FvIrzxe/HWyq8XYEscjzoY/XjWiQRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754661833; c=relaxed/simple;
	bh=KNSFSQ6elscxyJktPMiz3bx6RWsh26XGE1bHk9J/sMk=;
	h=From:To:Cc:Subject:Date:Message-Id; b=XMHKTuP1NXjWlLe0o7DkfLesbFmKoeJ7UdV1956Y/b2AZVARveSUrFKFWb8Fe50wxsksT6jy1vnJ1Yd7CFaEd2gjQ337u4U+UHeb7i85F4AbU+eND6kN7K05byxxuOK3kt1xrT/D/07DKWlS7vAbu64SdOIJ0Nyj4SnqH41VMrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKviQFxg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5787Z73T022433
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 Aug 2025 14:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=DYlHBOVdDgh8
	f6X0diGns/kpdvEmUjNJzPbxdtZIxq8=; b=DKviQFxgcNbCFRu7UrIYxRN6rqLv
	xxwgRnJ8I9LDf13Igcj6+VdmT+8/lKTNIQlVhfWSMawT2ypn8UGhCaHKy8emHAXF
	raleNzgVAZ3GhwucBTNmC2l00pmtWIrhDafhdAbRHX+aJiY2QTfANWQDLSzwHcmv
	osW+7toivqOUvuJFMIcIjnU9RtYzpqEPX4eR3EDCmlZUXbPnF8eglulnQvQiVqSs
	3FP3kvHbDpB/LZ4QhbUpAPmVHCXxhHJOpn3Z2b//SUvQf6aXMI1yZy/842f6PJXz
	ekRBLC/y2EOj9q3EUdz+nsPCha5ANKekfzcZI+DlYPpQZ2YxwZJkwv+mWA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5nchf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 14:03:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76bfc40bdceso1577630b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 07:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754661830; x=1755266630;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYlHBOVdDgh8f6X0diGns/kpdvEmUjNJzPbxdtZIxq8=;
        b=YI9qhR07KxWlOLQVYxT0QXGAZGi683SFV/+PQpQ1WqPWyq2zp69qOYy2f/fOF2uB8d
         4mhKBf/2BaNf3a8pUcxtsmVE2aCnG70OLcxRq9yyPYhFt/L6nsOEZg86ID/uA2G6XriI
         8e6fRGx/RZ/3xLvUp5LxYXE849hV7L9h4Ph/M8gqcGkoL25gPAfzrhQpoXAGTOsSqa5V
         O7Iuc6TVZT385GWokr+katiwYgDZ48xTcSC/UfGhE26J64ZkHQGPg3OK0w1EiB2H4Gu+
         ngmF/k3Ia2Sz9BgERHdt5flQNLrnGH3pVzQRhcV3esgsxqYVXr3sND/BNrRf0L+Rs6BR
         e87w==
X-Forwarded-Encrypted: i=1; AJvYcCXur5Z0bBM1brmcQ8hhbOVznxm3wmiVJn6AO8HDJK6rdLTdiHuoIUUSb+5p5aBpLAcX6+BiLQbNDAEbM+Ww@vger.kernel.org
X-Gm-Message-State: AOJu0YwBQxv1h3uy4rBoMjO18EnLzuIIjyOZ5o8YDhi3lYH4jNpApkMq
	Ylo46kwJueK7BTgVPYe0NR99gqMKv5whiU2OIxLto0254cf2H7wBursEEqHSukKpZWO550t7ume
	rudzqnUb5jdQOZCRoIikXKceBP7HvE9/54wtuIZpb2R04di2lI4XS6CJVLI4ubfiWERsk
X-Gm-Gg: ASbGncvb3FbT3UTeVCi/D4v4MST8RewXwrdi3Bgh6KBqO7Szoq7+baAgk/FqgZAJJsf
	an+punpVLEyuM5zA62bpW2k8+InR/xJAXe+vYWZilLRIL3kITNWRh7KAiZkczj4zM0zcciqdvyZ
	sD4KzdG/B5PFTPbY7jSFuw1LuDUTyNMOgnZgTQhQiGHNaEd1LRw7ehNFbJxNcuMweozvrBRQeHy
	rb/Xfm9YRK6c73ytL6L8rAIye7JVOsDHZK8WpBuVSVV0VUjCYKuqXlL1gxArs1l6Jw/JnTb9v2B
	zowAlYOut7Uk4jMR07SNzS4+La9bqT94OstvAwQZGh4Zjs5KRiuE3rpSBo4ye0OPym2pgaHhkA=
	=
X-Received: by 2002:a05:6a00:14c8:b0:76b:ed75:81a with SMTP id d2e1a72fcca58-76c460db4a0mr4025988b3a.5.1754661829748;
        Fri, 08 Aug 2025 07:03:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhEiM/0PtRwCDBt4ZjihWPSb0Kaib7rt7yZ/T3fusuqcHUJsYFV6dtXZ0fUfu8FH+LqK+L1Q==
X-Received: by 2002:a05:6a00:14c8:b0:76b:ed75:81a with SMTP id d2e1a72fcca58-76c460db4a0mr4025894b3a.5.1754661829052;
        Fri, 08 Aug 2025 07:03:49 -0700 (PDT)
Received: from hu-okukatla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c2078afd8sm8595621b3a.117.2025.08.08.07.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 07:03:48 -0700 (PDT)
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Subject: [PATCH 0/3] Enable QoS configuration on SA8775P
Date: Fri,  8 Aug 2025 19:32:57 +0530
Message-Id: <20250808140300.14784-1-odelu.kukatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=689603c7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=2OwXVqhp2XgA:10 a=pgtP2bmdoZ-auWmCWbcA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: uVeTs5Ghsi6ENUIoU93BomnvSZfGiNQX
X-Proofpoint-ORIG-GUID: uVeTs5Ghsi6ENUIoU93BomnvSZfGiNQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfXxLh4yy2UZvP7
 +TK7K9lr/GvUWaskBTnWz5PkuWpHD5ijBD6AKK/7oHW+pK71i0xJMKGSYbxMDOEONQMdEACEpfL
 rE49pE2wvo693ANkql5d5xgqeYFsywgn0DnxpAmaEts1Ft3iIw0WjYpZMIQAomqnTaK3yu3Ml2/
 Xse0dMB/dhxSyxwfqnLKicIeKmtBYivh1o85UMElNGNbHJaKTIUohMslynQZQxHOq/T8Yb+Xx32
 tlkT4tuMKsM8o1KnUy5NQVF1tp2oaMRFEUmN9TF+sAVgpqE2/5sR4L3E0koa7bvheRO5ynpQMUT
 HbCsGspBotwOXW5O75Y7lCilMAToisM52TIicMve6kpi7H4n4bWaPsYFL/xumAmysc6CTvZ3YVd
 an5OgSdL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

This series enables QoS configuration for QNOC type device which
can be found on SA8775P platform. It enables QoS configuration
for master ports with predefined priority and urgency forwarding.
This helps in prioritizing the traffic originating from different
interconnect masters at NOC (Network On Chip).

Odelu Kukatla (3):
  dt-bindings: interconnect: add clocks property to enable QoS on
    sa8775p
  interconnect: qcom: sa8775p: enable QoS configuration
  arm64: dts: qcom: sa8775p: Add clocks for QoS configuration

 .../interconnect/qcom,sa8775p-rpmh.yaml       |  78 +++-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 163 ++++---
 drivers/interconnect/qcom/sa8775p.c           | 439 ++++++++++++++++++
 3 files changed, 607 insertions(+), 73 deletions(-)

-- 
2.17.1


