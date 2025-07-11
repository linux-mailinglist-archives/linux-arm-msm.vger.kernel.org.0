Return-Path: <linux-arm-msm+bounces-64544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B161B019AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 12:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59337189DD8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4124C28313F;
	Fri, 11 Jul 2025 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dr58cQa8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DDC2820A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752229552; cv=none; b=lzvjS3Z6RlgHEWT3Gw2bV3M+xo6NBWWyWMZ5wpwgZcTVGJnZsuWLwCbrRqIkixattVTXTvtDJUrEPSPwa/aoQ++F3husTG6wuf/nw5w3DeVKjP7J3GTPW+QPk5TyykdzuHfS2XrXEC3Cq/os8a74ld2EynYY2DBExwlur7DCByo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752229552; c=relaxed/simple;
	bh=PUWLtICbEV4L4aRlWDR0eUg09UFWc4K+vrBGp32riA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YkxgAdzAZym5urSo5p1DKlioQSE44muQ190Celu9cdDsHL5RQ1oYuKsULhby41uJNlKzh++uvf/ZjtRm+At/mTUnWNAwO7AxiFyS/Kxxj+tQ07oHECzl272jKmL0+tMEQKhDskxuBWQzpce3q6vWQI2B3MiizVVOqalb6BXFIMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dr58cQa8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X8GL003829
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H0BE0LBDOrjuC7B70yCc4WxoF2P4/T4YLOW
	BcDkRgnE=; b=Dr58cQa8Au9Kq//IpQjchEEbWX1jbEuhhQ6vnGT8GyJDavRhvm6
	DQ621XqYWv/b+54bZLCNGBKeJBM+5gmeifYtVGVs3LqF05EZdSYORvh9c6Oxbn5x
	iSRESzFgOhPypXGtAQ1sQmc53dkovUIU8IF5SuEvFr05Ieohwz3fRZJJwv4uDg10
	76Ir76RyeFwXEn84Y5Q3Glygvc1gNl7INc3AuuJeQHylBC0K/zBL9BIFjBOFkJds
	DfabjTMqYPuRePcjr20ECWuOv4O/JjdA6Z7sKvpXH/Cualeyo8GLtgccq0iBjfNN
	EWB1AzrO6aznxESkx72chff2IS9w4qSGhUA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbp0a3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 10:25:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e1d66fa6so18636165ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 03:25:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752229549; x=1752834349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0BE0LBDOrjuC7B70yCc4WxoF2P4/T4YLOWBcDkRgnE=;
        b=v3tMIWDsGWPvkE9FwDWWUx33uayphVTBvJ9uJTFaSiSH/Y0EvXziFMLvS6IarJjzNT
         9eXBkQZn7zyHyA3HqWIcZPOKoafJIjqq8ub62gY90+MKSphCl9lzF9I+agdF0JlPN+um
         ni8qPopE3OCoSP43tcsfnPtBt6L9mG/SVxx28wwF+ZcZXhbpfKYfw7AYNCXSgFFOTMkv
         gvsiAEbiSbjJGA1Nl7H7mfHY1GibVbAbqfyE5LCo8OCPiZpQ+Suy+zae18CIyz0gxuBB
         Od/xsiihRoXzSSlef/wf8BEBm6t4OpLZl7MFs4SJfcoqNd3E/N2JiGY4TF6dQsUo6tfc
         EY8A==
X-Gm-Message-State: AOJu0YwIhixAS0axBvL8EgSv8NeAWpHcTxho6Xvsvon2Dky2VJHg3t6J
	7v0N869GT16U3wR0YoGQk/r/D+uJL+xULgnPuFUPDrPFtROk3DkGmdpDoFMejOk96Mj86L8V7gi
	vAB257qcRHBQ0ZuOEMBNYlO/U8A8gtxF4wAJPJBNSy2wsJ2ayXyTj6qDmxpwPqA6T2rgw
X-Gm-Gg: ASbGncuGRX/07XpXMjQ32bfpNS7c8fany7asp8vGxqjmXJHaOae+duB0wyHQSZ5aISi
	iSdXUzIooMg/7nfzMxOZodsKhlJCSCv+zUokEhV530422LNQSFTqcNLbojDowcSNh35vcvHbCF2
	gekXZznI4M2oHhCA3SUbGoFWoZ3GVAO58ThSBVtkYE4po21jfjeJldJOUmRYR+E+CYDQTS/giWx
	pyCFWu7DMxn4JGRv38rsIbkQ2Ne9HQh2AlBWdC4rRrdzn5J+IyuHcZTh7tjk11Qyf0g0Lw82W4F
	f7ZweUa0Wilw52UEvtkLw/YZUW4Os2IJOLKmCmthWfjTmoRWnAvbM40WU7keGY4dieE+zLVsobr
	2BrU=
X-Received: by 2002:a17:902:e88e:b0:23d:d0e7:754b with SMTP id d9443c01a7336-23df0831355mr23342165ad.18.1752229549010;
        Fri, 11 Jul 2025 03:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMWhYRTz9DHMwDnknPY8+YaEh+l+tNPzBDYHrBCVYA0fm1baC/+C2SiR09t+a0HEd6eQzK+w==
X-Received: by 2002:a17:902:e88e:b0:23d:d0e7:754b with SMTP id d9443c01a7336-23df0831355mr23341885ad.18.1752229548626;
        Fri, 11 Jul 2025 03:25:48 -0700 (PDT)
Received: from a10065738a1d.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436839bsm42861375ad.253.2025.07.11.03.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 03:25:48 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mdtipton@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH V2 0/3] Add EPSS L3 provider support on QCS8300 SoC
Date: Fri, 11 Jul 2025 10:25:37 +0000
Message-ID: <20250711102540.143-1-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MyBTYWx0ZWRfX+SkS8FfCXdQ/
 ySAE88r5fCA+Cga2kZeGGHtRCKIUN2S+/HKf4HYazoRuh2Yy9kgKhGupH/shVcn8ZAg03/AMsgt
 TmnfWBdClOBnBtKCEZ2IMM4JqKiAaocjH5FkA2vYjsjmf7O2BgX7kAkJQfgfUS6qeHXfJ56+C+8
 2CKPunG8DDqob1CrYVJIN8H85sI5U96Q0ezPGdvohKTlaQqmP/Kqq8rH7RQZMGrPsVe848F24cS
 +W0vg/LyBt3Hbp5F0k76LqPiwxQ3RAZKfZUN9eJraprHoL+9bTQSO3OWUL3Tlw1xQZVCRxUCAsa
 sQvwe7OXZi268Y39fbkq177r8h0kWTlTWToRYjM2DfkihQTlz5GsPZUIusKZQlAyyygRHpTkZJP
 SQbUbpFv3xTMJk9OdQ98mEvPY7KThW4nakG6lKxT/WrsiUw9w0Mqiz2pwlI/zklpPyksYa20
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=6870e6ad cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Wb1JkmetP80A:10 a=3bDbtYyfCIv0pmMcAUEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: AiIDxrTJvtRu7pIbEVR6k583Psunxfpa
X-Proofpoint-GUID: AiIDxrTJvtRu7pIbEVR6k583Psunxfpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110073

Add Epoch subsystem (EPSS) L3 scaling support on QCS8300 SoC.

Changes since v1:
 - Removed SoC specific compatible "qcom,qcs8300-epss-l3"
   from driver and used SA8775P SoC compatible as fallback in devicetree.
 - As the EPSS hardware in QCS8300 and SA8775P SoCs are same, a 
   family-specific compatible string for the SA8775P has been added to the
   bindings. This avoids the need to explicitly listing each SoC in the
   match table and the family-specific fallback compatible can be used 
   for SoCs sharing the same hardware.
 - As suggested by konrad, added EPSS path handles for CPU nodes.

Imran Shaik (1):
  arm64: dts: qcom: qcs8300: Add CPU OPP tables to scale DDR/L3

Raviteja Laggyshetty (2):
  dt-bindings: interconnect: Add EPSS L3 compatible for QCS8300 SoC
  arm64: dts: qcom: qcs8300: Add EPSS l3 interconnect provider node

 .../bindings/interconnect/qcom,osm-l3.yaml    |   5 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 301 ++++++++++++++++++
 2 files changed, 306 insertions(+)

-- 
2.43.0


