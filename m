Return-Path: <linux-arm-msm+bounces-86336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9452ECD943B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 13:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0D73C3001BF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 12:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7683132ED4B;
	Tue, 23 Dec 2025 12:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOXfdVNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKLt0Fgh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6112D192B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766493214; cv=none; b=fVRyNdLOYgD5pL8LVaRDevxY7a1HhNHBvzy30I5xZz0Q3zRaQRsPeZHQw/P6olJK1l4qCab6DfGuw7g+kgEzIIDb0p9YvH/XLwTyLlrw+f0gWHYNEO3I1gwp+D8PEtsOoDVV/4TjbRcb9Dj+TPMzasshLyxUVVGIEWEnxPRgYm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766493214; c=relaxed/simple;
	bh=f2DblYm4IikIkPOUFgX8XrTdAHk+qkYmAbd1e3uBOgE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WgIQSAeQCuEasfrjG/i2szrnLoq4SF7f/LhVjpmoz6tTykYmvOwgqbODh6bp566QBrhGl7F3kmnt21NEWVCwBLKno3rBfxwsI1Fmr1npc8eYf5ouBZII9fjIhfRw4bUZ0HlTpVRa37cCGCkZUvdIZ0/ar26+ozP2wYkh/mGVhL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOXfdVNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKLt0Fgh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNA9oCm1531701
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iIv6qtwkYZND/FKNsvT6qnTFLyLwW4dABnX
	NrT6027s=; b=kOXfdVNvjDBLuAb35qvoJ2wS+p0z597xUL4WJL5GBA1jSNFxgQz
	9JhK5jIlxGfb2HShGYb6Vo0q+oQt9ptFSbo5Tt46neFFnRkF8RBp/kSdKel3nk2S
	si6w/FQHi7rmqcEWKKQmW8asg9rOhMyjckNU3KvxIU9x0gKWuMFwdzVm8RTkTu+q
	goUOEulUPBPh8CuvlFg/DBIFdlTkQBjDPidiYm0bZ9Q0ySII1/uTf2ipdaFQ2txm
	SmlJI2ij786APVYLWCCWtDb0ARio11tESnxo8uJTZNW8RXLD7/WHN/dK4RDWK+n+
	6IVs3GHtc9vJDcV7CwNjx/obsRU+bFHUBAA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y3wdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:33:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34aa6655510so6567298a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766493210; x=1767098010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iIv6qtwkYZND/FKNsvT6qnTFLyLwW4dABnXNrT6027s=;
        b=aKLt0FghpKTKWJJ9KDnQe/Xf7fnQ6OzymBbk4RGqnkCXz9QkmfkNcFG4vQRGfWh0iO
         cPGu2fT4nlYXbSTMtJPpZ+BeiI8cprQXSGtjpF3HorZ8dwqj82KJvbxPxUKcBR3+BRGQ
         CnYwZyn0pw2x94ovitO3oSsds0nWQLBRUprd5tNmfTP9LN/Lqg51YvqWcDqwkfQpzU0W
         s/0dcPklg1shehHgz75M9zMD5FWzBU9s7wZrpwzlu5Y1xrJnmcqvDd/RaWiEFnnfGoBy
         R53QmT3rO8YjK+85iDU8ZebdGqID27gIKWvd9eW52eb5pHKtr3z5OZRtFc+YxZYyajpY
         Z9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766493210; x=1767098010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIv6qtwkYZND/FKNsvT6qnTFLyLwW4dABnXNrT6027s=;
        b=RtlOIFtkv/tsebsmJT8O3q+z+geb6ZxgYZe3ouFdDZv2vV14XltTXa7T5lsolvbw3w
         dqZ3ega4yHQU4wA5dcjSuMHg340JlRUFG95Jxb7rjYFDlS5jELWwKV8VvsX+epwonqsV
         YTDu8exuOCJKKzCTQIt0Hijjt+6Dpc+gdjETeu/eLQseuHOUibkW805nyV/xvJ2osfiT
         FEOWE+jiXSGLOtmv1i55mZqMKX3g7ytlDL88YB+TNSJZlzxdY8YbK8iDmClz8a9VcEui
         jyA16k4S/UqQQYO5WyyOOg4aP4mZE/txhej/zSnA2rmF3l8uivxXgEmJgM2CK7D5F2Q6
         z3kA==
X-Gm-Message-State: AOJu0YwZYYRTl8Hu0IQ4xooLM28FhIT1lpKYtzErdLKASRcYVCnxbReI
	VVSxOBxYr+cQ8kLK1OqWc/HOshq0lm3wI1LoT7SVsZ4+Vo1xTqTKvAXC+mLl5aphKgadm+gy+H4
	ys2NngIQgR0H2DJ33UOUAr2us0+osIT4iaAiBk2Ydss2oUL0lM16d40gOdk8TvwUpKKkk
X-Gm-Gg: AY/fxX4+xFDvV2IL2xgONW4DUtBfz1dyR0akyip0oUxXs8ybwhs/dSNYqTz2YdLe2er
	uVNSKTFel4sKMF2Bsx01kAmfrAAz/sZ67XY4UqwXqZR8vZc1NlJ6hdv740K4zNn5Ow01Pfiqcsi
	iIrX6TdtCMxeNmcJeVUzz5xEKXqcmYTaPS8UCZpGNn9yx3R+fN1UmMUqi1sMGvmBgAdClP9YshJ
	5F3hAgMpuYOvrnJJUhSkzIfHJFTEgMalUwsz3fwg0JOUJftJyfuUxp8RFR9GpbrhNjn71fh6Ed5
	MkPDzQ4NS9HToVw5fn7ltfP83LHQNoY0ARhyNE2OhNjnDl/HzAy2ma3MMKMAjnxxgLiQi3VbH8P
	E8h77vgx2vIr2bOPhmq92hW6t6KNHNPcRSGLrYNs=
X-Received: by 2002:a05:6a20:3d8a:b0:35f:27d:2ded with SMTP id adf61e73a8af0-376a7afab9cmr14396094637.25.1766493210215;
        Tue, 23 Dec 2025 04:33:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrHGyedb2Nt685yxOgPioq2kyEt9iYKz++7moPb/2qg70fnbdX4GNWq8699m8Tg1kHPSqq7A==
X-Received: by 2002:a05:6a20:3d8a:b0:35f:27d:2ded with SMTP id adf61e73a8af0-376a7afab9cmr14396070637.25.1766493209702;
        Tue, 23 Dec 2025 04:33:29 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b39dfsm12936044a91.8.2025.12.23.04.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:33:29 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v1 0/8] Add RemoteProc cooling support
Date: Tue, 23 Dec 2025 18:02:19 +0530
Message-Id: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694a8c1b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=gDoSkZ6CafnO6Uh0iTMA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ojg757pgO4BlYRSEnoGt7eQrkHcTsZ-F
X-Proofpoint-GUID: Ojg757pgO4BlYRSEnoGt7eQrkHcTsZ-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwMiBTYWx0ZWRfX6zRWbo7E2U3h
 3Qxzam/dCfnKyyHjQhOZ6RVLghcr894CBmkXz73uBrEOhhShnus3rV3kv/c+jKu7ezpFZ7SmKlA
 q7FDZ/Qy/nHVV+iNhYZTr/8yizSiNuw5a2NR3lHHDZ9vf+3v2J5RrvXkybOQ69Hwhy3iaLrPSY7
 0reMrAzwIyp0xkbt8KRJgAoOXw6qdgD8y2poDSUfG9KRSGCedehcjhgsa5M2jUmZbbNKeWTeEK0
 q+B4tNhdlgnjMnX0Y+2VNw5HLVI2WtsdCpBRV15w4assCN25hwaGer6Ko1G8TdvQ1xkkLuLCnyY
 6QcUGPhjy/rtes9cnjI4utBFEHAgX5wxQ1bGbmpDUyvOwta8g1V7r9MK2xt//LbTdokDxq+dLVs
 8R8ul7ZqrC3874StKM5OUafCSK59C9dh4zNrRsZRxXoAOYQ4RzBSszDwyCFi5YcMOO05JZSCNvL
 8Tt4wtqGXh1o0nwKNiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230102

This series introduces a generic remote proc cooling framework to control 
thermal sensors located on remote subsystem like modem, dsp etc.
Communications with these subsystems occurs through various channels, for example, 
QMI interface for Qualcomm.
 
The Framework provides an abstraction layer between thermal subsytem and vendor
specific remote subsystem. Vendor drivers are expected to implement callback 
and registration mechanisms with cooling framework to control cooling
devices.

This patchset also revives earlier discussions of QMI based TMD cooling
devices discussion posted on below series by Casey: 
https://lore.kernel.org/linux-devicetree/20230905-caleb-qmi_cooling-v1-0-5aa39d4164a7@linaro.org/

That series introduced Qualcomm QMI-based TMD cooling devices which used
to mitigate thermal conditions across multiple remote subsystems. These 
devices operate based on junction temperature sensors (TSENS) associated 
with thermal zones for each subsystem and registering with remoteproc 
cooling framework for cooling registration.

This patch series has a compilation/runtime dependency on another series [1].

[1] https://lore.kernel.org/linux-devicetree/20250822042316.1762153-1-quic_gkohli@quicinc.com/

Casey Connolly (2):
  remoteproc: qcom: probe all child devices
  thermal: qcom: add qmi-cooling driver

Gaurav Kohli (6):
  thermal: Add Remote Proc cooling driver
  dt-bindings: thermal: Add qcom,qmi-cooling yaml bindings
  arm64: dts: qcom: Enable cdsp qmi tmd devices for lemans
  arm64: dts: qcom: Enable cdsp qmi tmd devices for talos
  arm64: dts: qcom: Enable cdsp qmi tmd devices for kodiak
  arm64: dts: qcom: Enable cdsp qmi tmd devices for monaco

 .../bindings/remoteproc/qcom,pas-common.yaml  |   6 +
 .../bindings/thermal/qcom,qmi-cooling.yaml    |  99 ++++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/qcom/kodiak.dtsi          |  36 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 138 ++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  92 ++++
 arch/arm64/boot/dts/qcom/talos.dtsi           |  23 +
 drivers/remoteproc/qcom_q6v5.c                |   4 +
 drivers/remoteproc/qcom_q6v5_mss.c            |   8 -
 drivers/soc/qcom/Kconfig                      |  13 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/qmi-cooling.c                | 498 ++++++++++++++++++
 drivers/soc/qcom/qmi-cooling.h                | 428 +++++++++++++++
 drivers/thermal/Kconfig                       |  11 +
 drivers/thermal/Makefile                      |   2 +
 drivers/thermal/qcom/qmi-cooling.h            | 428 +++++++++++++++
 drivers/thermal/remoteproc_cooling.c          | 154 ++++++
 include/linux/remoteproc_cooling.h            |  52 ++
 18 files changed, 1981 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/qcom,qmi-cooling.yaml
 create mode 100644 drivers/soc/qcom/qmi-cooling.c
 create mode 100644 drivers/soc/qcom/qmi-cooling.h
 create mode 100644 drivers/thermal/qcom/qmi-cooling.h
 create mode 100644 drivers/thermal/remoteproc_cooling.c
 create mode 100644 include/linux/remoteproc_cooling.h

-- 
2.34.1


