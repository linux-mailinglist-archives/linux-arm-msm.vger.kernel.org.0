Return-Path: <linux-arm-msm+bounces-81987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BF8C6197B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 18:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A9614ECF19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 17:17:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF15430F7F7;
	Sun, 16 Nov 2025 17:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aq5AqNd+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKvtkBP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D328726D
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763313447; cv=none; b=pdL0BykkdfRqPHLkuHBZiYQvuaVAw7E7TKX4R6zjoXvQBRbz5tuOG19dISMUivOjYwsHLM99LvdPbemPN8o4O9PE6g2pfdtQoOnZrlGL5B1PRHyhpG7hkGps0VyM4Z1ET0OO94aSoZHMzIx9N7QX6NqQW46J5TE4xSA+62FdsRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763313447; c=relaxed/simple;
	bh=jnszFHmKNM1a9F0cXTGUxupAHwO4OuJVmszVfLbqIIc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=douQbs6mN/FppfN84lpxQ77hyOHRfHeo09BzgGjMl1OMbTPdmu2h+cB7DRQPV/+MGYJZAcyGa2WfHfdpJA+ed59MvWKwY5Z5r3UDQbWSW0rWnFVpRL+ZkwDjAhZqmh+XJfBESLFhsuYmRMKR74D7dmrICv4MUmlQ4KJl+edf3AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aq5AqNd+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKvtkBP+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGGL1xq1282196
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1jl2ispOdO9La/5OQRAP02bv6sdNxLuaFxM
	tRQznV8w=; b=Aq5AqNd+SeupZPjpqfBrkc+yVyKJ7fHnv2qrq1sxEUlhQ+TsDtE
	Vu2UgzW1fPeiuljtcnXgTpBQpQvAhcHZWOI/GLJ9CtiTSyqY//BIrh7rSnkxK7vQ
	+ix5ADGgMDEh1TMn+WXAUVh+Bhdk/N1o+JzAubXCq7rtQ3sD8/8RsJRLdMeZZ1Tv
	53pyGcnh8CrKec81SGV0RULOp3dsZelSp5w2SRRNE+d7jQgUu+3MbosuyzWNjET9
	dHp3YUWnjsGzQtYQCM7C64F6BZCGgLeCN5ebsvcCGsHsOsyySPgjm+bJFjs+uFLH
	LaKNgWj6YNANQe+TMzAWnTJA8SbRvplPZWA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejkatdev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 17:17:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2955f0b8895so52245525ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 09:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763313443; x=1763918243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jl2ispOdO9La/5OQRAP02bv6sdNxLuaFxMtRQznV8w=;
        b=JKvtkBP+Mv6n2piaIw4SYiQE7scb/ahT4mGZOI7NufkJiitQP3uUfj2kS6yyBBsq3s
         LoL4n3Y4ZcqGqwK7RL3/Bhg+BZT8NOrlbXXVHrUWRi3UYbYZZ5cE9d0AYvLSeIaO3caM
         Hu60/126+elJioJeYXi0vOGqD6fy691yDun5ZsdoiQf2yfJ6S1ywVCWn/nu62163XWqU
         mOhxGo4CnD87CUySrKJDLfEZasMDfB9t3pAWVcXqBS5Jn6oaL3io3S/IBekZPqZIGKSm
         w0nnKH+yHC0ZYtsHUWcz7WGZQVbK4yZQhbHN+4TyS71wSaG8uixRrYMOxiDFLhHbLM4A
         mSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763313443; x=1763918243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jl2ispOdO9La/5OQRAP02bv6sdNxLuaFxMtRQznV8w=;
        b=sCc0e17HLzp5f8Rz7uHhC01bPKr6ok4T8ZKkWhpjudAD/CP8xTS+mu3rTMsV2BiDMH
         0d5FTZhlws7FU9x/Cd0SvZlBGBSwAKqtCQpJROBz/ibHJhbRJ3g/GryF/wS54XUbeS3z
         8reRj69d0VFPVH7ANsGX7ykExR+Tw8rOR7TndMQZSEU/hZ6Q62/T7t+RsFjAUYtGzBTY
         BX6oA1j048LB19hsV0kUyq9Y+piKN7ZenPg0iNHpalVMd81nNS3DJZc8Z0byJZ4Hh39I
         g46OHDSMRBzdTNEJ3lkpfXf3VoZloClWf2U03URCVc7Iwr6lSxeJOiqFsWBy9thd7qk6
         HW3w==
X-Gm-Message-State: AOJu0Yy4HT4QthnFr55Dk+LLKOAF/OwGfD78CY539WpY8ifZ+Kl5TVFm
	GyDlmvKQ3OYTx4LFUBAXSS6EnaNi58Q8v45RKaYJMmg33I2zOMDqrEjiKuUqGN2aEGxNyT5C6Ts
	CS+MCPEXAML8Nt6eQEjBfdo/np5tZkKJAYtN46LaEu1qcIKP43SuI7e3YLY/jtpW36GrD
X-Gm-Gg: ASbGncv5RO+MPjvheUf8+tnEajSEhTKQUXcEYHQDSiOM67PkWCApaprImb/p/M6nFCZ
	G24MnVJ6V8qWnISP8x6jFq9L2be3A0dZvfo65jaE7/gMecbwrUfP7qnn5clyz/cOY9Y1C1sYQFi
	r6Qg1IdfBcDX31yQjMnGSL0AWlpnHEL/1wK7NTAyzeWf1PArvnC8AIyr0IGV/uNPXj7uQJv4npn
	GRNqXKaKgWBqzw3+eeO2Eyjel5u+4Qct4FROA5xS4xjzOhstjC/I+lV/rAbyfE0NsKHtyGJJhBV
	ogJOLUHF1Q6dCxU1r02/Lv1DKIeBW4ryHgzWbioKKzgNgHoWTGoM9fm2zu69L2yvt+2dH8XIYBn
	ocHSlq2XVZ6VJg57hgBmMCPOTl3aTwMnu43I=
X-Received: by 2002:a17:903:37d0:b0:295:55fc:67a0 with SMTP id d9443c01a7336-2985a4b04admr154189955ad.2.1763313443312;
        Sun, 16 Nov 2025 09:17:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHk8MyWeaDy5xJlFGfVzLFXZP9K3vQI78np6fV/wBn7qbFqtjl6F8oXUYRft86A2WLaOraRDA==
X-Received: by 2002:a17:903:37d0:b0:295:55fc:67a0 with SMTP id d9443c01a7336-2985a4b04admr154189785ad.2.1763313442831;
        Sun, 16 Nov 2025 09:17:22 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b1055sm114415105ad.59.2025.11.16.09.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 09:17:21 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        ravi.hothi@oss.qualcomm.com
Subject: [PATCH v1 0/2] pinctrl: qcom: Add SA8775P lpass-lpi
Date: Sun, 16 Nov 2025 22:46:54 +0530
Message-Id: <20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDE0MyBTYWx0ZWRfX77VxGntrEuYn
 A+L8wycRXknHuZEMM8NIyqPl2hOUOklwoEOu3Fn78q/hcUnG02emFgnerYxdDuhp1893jboS+lT
 UXp9rpv2BP0molFKfMllwtaggqXoWia7OTRLp2KwpHGzNHrgfMe2iwl+8qdY4DgSw+WJwQ4dskn
 vK+yZCcO0C53lcTXgjC0Ltj5sAiBrtZ28QpBrzHvwxvnlc58Uo6JjObjLB+/4I4/QF5qqvQEdyY
 /8sZhj7Xcixw8ud9nkr397nd+EAKYAD8zeii4UosLhzwQwyX+MTssAPMEQdcD+4mFxl4wmL6GbN
 FQyYfk3tmbKDHUYmcMa1bdTqc2C28A/ge2FXZpRPoLBpcm6a+e+YRyEd3RS3y0oZCiJNKwGQybN
 NHy7/10955+Rh2ud8cNM6IdBk0aBCg==
X-Authority-Analysis: v=2.4 cv=UctciaSN c=1 sm=1 tr=0 ts=691a0724 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=lAFZS77bQIXJJI-DYKkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: ECWO7u92P3GxOQRZgubqJtD5ZXMyVREd
X-Proofpoint-GUID: ECWO7u92P3GxOQRZgubqJtD5ZXMyVREd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160143

Add pin control support for Low Power Audio SubSystem (LPASS)
of Qualcomm SA8775P SoC.

Mohammad Rafi Shaik (2):
  dt-bindings: pinctrl: qcom,sa8775p-lpass-lpi-pinctrl: Add SA8775P
    LPASS pinctrl
  pinctrl: qcom: sa8775p-lpass-lpi: Add SA8775P LPASS pinctrl

 .../qcom,sa8775p-lpass-lpi-pinctrl.yaml       | 106 +++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 +
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c  | 216 ++++++++++++++++++
 4 files changed, 333 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sa8775p-lpass-lpi.c


base-commit: 9823120909776bbca58a3c55ef1f27d49283c1f3
-- 
2.34.1


