Return-Path: <linux-arm-msm+bounces-67636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC457B19B74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 08:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45C12189215C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 06:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F059D22A1E1;
	Mon,  4 Aug 2025 06:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivYrg4Nx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC5126BF7
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 06:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754288226; cv=none; b=KqTDvlyIkMU4AziwfnNPJqiQ+ZhOIP1Bf/gfzPvQgpWl8q8rBwPm2TZZM50gPK/xJKjoxsvQ1rH5yYX2Awg0hT9uKe2++z+VDeRr6NSLPgkU7f1zB9XjnToNAg7nS4lvZVcFnqg8LM2+ZyDDHmyAdCacFlb4OS8Epx0INHM58Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754288226; c=relaxed/simple;
	bh=eMgZLpYqsrpOYSyhN56WZXWGJLFAvTwwAGp1XIsrIP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BVjpWw9QNrUGkaffiJtP+mRorrNex5nElmi7BV0fDUrP/UfWzMHS1G8Z91+E0b1CZjSh9fgBhZzWgQa0SzXIz75njNLjETazJzWQQIY0Q4jEMC9e3mu9+CsckO+8L1x6qQmv6tT06vR5iZiLewNZ6hM80JLd3/4ldh/ECoh86N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivYrg4Nx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NTHXe021948
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 06:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iAHnqwL0yHem+mv+4tLl/cNCAGcUR4yxE51
	d9JO/2jw=; b=ivYrg4NxISrmRz/IrrTX7ypIm5WthPveyLFfTFHReGoXg7fvoRz
	2r0l6hAoyXjISER3O54JF+xtz0m4GbY9d9RU/845FAB+pobOU6DvmsJwtt5PFy3d
	8k0VH5TSlItBMXwQEhMss5E3+XQuM2RzP6TNtGwas1fLSA/PyfGtWS5cxt0GBNfn
	lT6ftKg+E3V76Fe7KtomdoP3KFOW3PLnIBr2dGnydiWkRVqsSW+vGVCys0QlPVjE
	+6CtHgpWCnjV2RgWOLwBgUKpAzjmbZWlsb6S3oBV1XS3DM2O0ShLpAYRjGHBO5ax
	FNxbTpWY/1aox0GMvjQqPcOBputFTPHnlbA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48a2ke1ruw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 06:17:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-237e6963f70so80473835ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 23:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754288223; x=1754893023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAHnqwL0yHem+mv+4tLl/cNCAGcUR4yxE51d9JO/2jw=;
        b=NG86i+0TqaAKVuPcb+TlWRd6YqCpp87PgwkypXDHUeXpP2D7Bhpg7W4dcB6K3vaYJO
         ifKfaQ3Vo+Ve2bhTCgj7JEHoiazDkW/lMP7OD9mPib1vkQi1F4zq1enp7sHtw0RTigPH
         79NZ+ZUaFZQQ9156h/qHlTPacn66fikBQA8TCzSfGkB31zkQ3MAOgDAFVMCaSXYYJHZu
         yJdRflW1KiqlxmA8/TSjGpO3P91xBw3Xr5BimElRCyXdxIpj5/lNRyjOpTtWNPVlUgHh
         PQsRBFBbh/Q2KZ0SQajv9FqwTI9XU71KpxAQpg6/LeXYHRvJ+jIE9ONZLh6mcvNWFE0N
         vLyw==
X-Gm-Message-State: AOJu0YwlxvPy31Ah9o0zFjD6Ov45M8X3iVISuiGbo/YXE202oe8q6Ang
	g1eaz4VWOR5/lD7CEUwxgkdg0Quu/G9gAxVjQok+efpBmB6z5O5mrC7gNf5YE+PXfW6M8nqVJc+
	V/XI91JztRWaDXREdcoL9rTaUq1sPZrjpBdHxccklrq9TIZmTA05zqqIwa9qC+CnUub8U
X-Gm-Gg: ASbGnctilFB2SVj/fjuQf21UnHhjw5DLFnNLorwEWKkWmrQurHOxraLmMlfYKE71uEn
	fleNP6rzmX1fKdWXj33cqpg3R6OC72tSSto4tf7sbaetoGIizSvw5TG+OA3cuB1eifVGH1eHyO2
	DIRe69luK4TIoG/cq9zsXh0y3S2a9TL5grJP8576RAQ0dTfzPqmNJdRiwg353injLi8Dsn6pYby
	s57u8ouBMAiKD5R7xEua2Goz8eOENLThjXur5nMA7m77+8vk0K2ucV0uP/xC++50jfUWFkLLXN8
	Qketu46c9c1O+trcdBhiNadlEkCsIN7DJHaWdvsr4UaGO2aZCy3c9WHAT9Wnw9GmuAb/U8EjsJA
	3uIg=
X-Received: by 2002:a17:902:c94b:b0:242:460e:4ab8 with SMTP id d9443c01a7336-2424704c466mr116862535ad.46.1754288223558;
        Sun, 03 Aug 2025 23:17:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwDfmm0C9LYhQxt+pKGPY5NUnAnjrRTEjtgxOftkxmDC2olfkZxAdQ9Xd00d821Hb/WvJUbg==
X-Received: by 2002:a17:902:c94b:b0:242:460e:4ab8 with SMTP id d9443c01a7336-2424704c466mr116862235ad.46.1754288223102;
        Sun, 03 Aug 2025 23:17:03 -0700 (PDT)
Received: from a3fd830d25f9.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976f08sm99786785ad.103.2025.08.03.23.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 23:17:02 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH V2 0/2] Add OSM L3 provider support on QCS615 SoC
Date: Mon,  4 Aug 2025 06:15:34 +0000
Message-ID: <20250804061536.110-1-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lEF-4RXGb3DR84mRcsBvLLYbIdlRBPe0
X-Authority-Analysis: v=2.4 cv=TMNFS0la c=1 sm=1 tr=0 ts=68905060 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=VdEDuztqGucW-MqrkSEA:9 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAzMSBTYWx0ZWRfXy03TTMyTrhnn
 y7cc1B5ddwGJM3Plbx7v06fWhVpJo7pkTmEvFoQO/8re7rs5+OzHL+C/WfcYojZTpRdCLb3EpVi
 EIZtZzG7VgxAU1m5KM+JcHwxqdSVBxJhc73aeZad+SA5NZ9+avczTrbOS/EKiDiJPidrIKcy+Tf
 +pnP44YluH2gBl3sIFgaXFnEBVxz1k/wXxwapJr7+z6yiXnIlgqcWN99KLpAe7C6QUhMDvp1QSP
 pbokELbAo0aM7taWe9a1SY7xrVEV1jaeryLSTVGWHRSbsZo3c1NQ8qzKhAYu95IoXJBJB8AzMOS
 P6+G/AbdJWa+zw3LfO5jsZYeVVPa+3uB/Xql9PItDzyemKVU5W+rmEbZhCqICjTsRsGQH5P6lKU
 k7yrb+uLkDAumySIBj8Iqy7StSMj3UuCibkz1zuPJuoxj8vHQIxijXKE9EXCMLBC7+Lu4FIJ
X-Proofpoint-GUID: lEF-4RXGb3DR84mRcsBvLLYbIdlRBPe0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=840 bulkscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040031

Add Operation State Manager (OSM) L3 scaling support on QCS615 SoC.
This series has functional dependency on [1].

[1] https://lore.kernel.org/all/20250702-qcs615-mm-cpu-dt-v4-v5-3-df24896cbb26@quicinc.com/

Changes since v1:
  - Updated dependency on cpufreq patch [Imran].
  - Updated SoB sequence [Dmitry].
  - Link to v1: https://lore.kernel.org/all/20250804050542.100806-1-raviteja.laggyshetty@oss.qualcomm.com/

Raviteja Laggyshetty (2):
  dt-bindings: interconnect: Add OSM L3 compatible for QCS615 SoC
  arm64: dts: qcom: qcs615: Add OSM l3 interconnect provider node and
    CPU OPP tables to scale DDR/L3

 .../bindings/interconnect/qcom,osm-l3.yaml    |   5 +
 arch/arm64/boot/dts/qcom/sm6150.dtsi          | 148 ++++++++++++++++++
 2 files changed, 153 insertions(+)

-- 
2.43.0


