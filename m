Return-Path: <linux-arm-msm+bounces-86300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AB03ECD8892
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A018C3024ADF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EE9328602;
	Tue, 23 Dec 2025 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tan1eRhN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUH/QSED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794BE326939
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481267; cv=none; b=QUPsjz9eyuYQBwcoWWElqKINAdGueN81QJyg70DPJqzDMse+qTDpqD9fCKIWi3/ER1Ft9hdKfXzVzw226cUsiikMF33owyIkOAFmCmOkmYaBABXQJ/LJgDNGRAfeMm00ZHHUPC2YZYHczfnMw+pYKzz6PZDW4T1Rc0fnPKztLig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481267; c=relaxed/simple;
	bh=Nqu+aOuN5ZaQ3gE/Xy46Qjo+os29grBY+Nkaip5fCwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8AMPcQzcGEmSuYeQX8HG9O7EXGMxfQUKyHtPj74wodKUEQHzONKWpa7aw1GeZyAonvsICkpNV/oYrYpqc5KDDsogqwr3CAvOMHxhZjLBwxs+nZyH1mXI4JLN1lzzPGYE1ZQhZaVZ1hDa9pp+1FeUM6ICu63LDA8Rj3Sq3cUkkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tan1eRhN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUH/QSED; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2f6SB1569012
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdgl6CNoit5FZtv6YJ05tLpOZmxe0FwICdVkx26WDa8=; b=Tan1eRhNLo4oz/OE
	gvxR7PRlSK6KqrA8Ieb/Iki/IF52nXjJ1uPJ2I3KYTqNVtUyqvBh7xPh+LrIuluQ
	rlWn9SyLL6CN0h9J3l2BDAd747E9KNOEr4zIZU/mhcd089fAp2j3KwkgSseZt1Nn
	ZjkXDof0z97nX0RVTmjLS9weFgtrUS0s3IUXqtykDVvj0fb/UMLGvIfXuidstfq7
	KmJ+X4x00wT9AOZmwFEb7b7vRPgGu0up2YVaJGfgVFuCol1JudqCANPPhWcXq/7x
	LRcF5Zn9qIn/23Nef7G+zlYHI8OPrBgxKCs1As5Wa7dL4qtloRWfKWN1rXD9shNr
	vu/OAA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy31k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c1290abb178so8836359a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481263; x=1767086063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdgl6CNoit5FZtv6YJ05tLpOZmxe0FwICdVkx26WDa8=;
        b=cUH/QSEDoEg1kJjzkklpPk8t0+qlWTJM16COWepB0Pr7WZySaWLWqNL1jAI6z6mOdz
         JnPiiDN9PY2U0TMJftUNH9RWY620e9RvKJP5OjYXaz/P0a7/+DOhqarVxdGYYnMHHWXL
         +7qEB820sJ/t5p84DhL16+YOzF/rSH3Ox7pI7ARgNaW9y+Jhr5QH+TmjjhnQIto4RolU
         fykZx2FDWvtwnF1SDCDUJ6K6PiNmdAo3Onlu5OSTi6wN7/vvT59BW0oT21PHMa90crLa
         /RJN2jf3XlMUMa2o9sQSU/8peUIDPwK8X/zfjOO3CllgufAxvdzYe/9Dg2Rq3RcV6h7O
         k0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481263; x=1767086063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wdgl6CNoit5FZtv6YJ05tLpOZmxe0FwICdVkx26WDa8=;
        b=HL3WCFUopcKwf/hqVCWLY/eLsWpKxAYxCZh9BdpIj/PQ5yUuCV1H45UsAsTKx1Buya
         zyv4Ek2+620UoqcMVwlIH0U5NMmTcewO1vLz1IB+SPfXHkz+qUsiUWuA+01URdP2FTw4
         nwkM715GaZ4vcTuyx48WJ7K+VHGURNqqPEev4/VPQDShXxCQGy/KRX77tJHJqM8wii8H
         mQhxf/woiCMSknxLq5bXDFzS8BN4oWXZuoqCH/A4q5+FAcXazedeDpjl4Kzl1qw2iqUG
         XWLDAWQpIkG0VGyTuobvlDzBLUUWBELULytN3B6f79DZOTqOZdOOMC7Ky2aidcTb8R+F
         C1Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWCXtRukocPi9HFHGUrImSK6AltJilxmYiuUwa6je8aek2n5qeISMXV0hRDzZEWfaNu0tg2v63Me0PFCYZh@vger.kernel.org
X-Gm-Message-State: AOJu0YwZCdoKfPPMMI4YZLErytmgn8pMmA/QsmgCcUDU2IVXHxNmawkH
	iqOGA/+NTnf6OR+LDc1pJv/KbnBk3UdOIaUZL6IErL0FPN8KdDKclSv6ntkHo/Cdd9fyK3nIwim
	XGa4WYxjwzewyiLwB53Llfp2+eqr6W2+/sshelMgh8SME+SKzh+H/8jyzuW+uuicFH83VDoiqaM
	+pCbk=
X-Gm-Gg: AY/fxX4rJvUl/fWSBCXIseLUlSLY6iz69J7wBKF//vtGed750SckFfU/JH2k+z43E7V
	oJHW34Wl/oLe/8YxZ43sn8d0/qQhmyCXCpN3j4OnivN2XMtMx/xlvz2UumVOoK9J01mTiwbCZ2H
	kvJsmwH1WNHRYt5sZsVS3D3HKycveRxVgagtkVGnYxm7X4UN+qU6v+agikrSk15mcSeoMLTHnP7
	M8kRdrRhDX2ZCuyyy3+TRiio/vuvB1eyPK/LtFpp6L4FUqH3kVM/kJoCTpvSIqyHWmHc2XjiVCn
	+2dtMMQQm1JiIePOyVQrNkna0yl0kWYeFEIV9i+QlkMeDoWQZ1RBTlPXNdcuZi64xntXOTF0M5H
	jNv6fydVL2IU6CUovJMIyPfDYKatJDuOUjsPuKqPdGlhKRXTH/FwCjRJ8+ABm
X-Received: by 2002:a05:7022:220b:b0:11a:61ef:7949 with SMTP id a92af1059eb24-121722ac425mr15639671c88.9.1766481262633;
        Tue, 23 Dec 2025 01:14:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDGKzPr8T5IOXZA5LHezIEugBbVPAkJMkTPFlmVIcYmdmUJ+qW6gIul05+V1TWB5xZtLzhUg==
X-Received: by 2002:a05:7022:220b:b0:11a:61ef:7949 with SMTP id a92af1059eb24-121722ac425mr15639640c88.9.1766481262050;
        Tue, 23 Dec 2025 01:14:22 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:21 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:13:51 -0800
Subject: [PATCH v3 5/5] remoteproc: qcom_q6v5_pas: Add SoCCP node on
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-knp-remoteproc-v3-5-5b09885c55a5@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
In-Reply-To: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=1580;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Nqu+aOuN5ZaQ3gE/Xy46Qjo+os29grBY+Nkaip5fCwU=;
 b=IgqiGhdQVv4PE18x02hoRXU65WTPD9xOkUEAef9Md1fHjJlYgEARRi63h34JfZlqs7S2ECCFD
 HXJFq+irlWwCCnbtEIqOiMcRvnzdOW5gR/8dNNY/+roUfPsPQYunVFw
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfXzz7UMv8HG4KP
 o0F6vi1cPhMt//D5Z75hVZpPspQDYI1XEYV5427OZEtkPMFmSz9+u6lmfCPIVhShoSmrfH+bZIJ
 PgCW2gUIOGDvL7mE7bbwrg5HjJcXa4WfH3Fc3yoEN7XLW08xNUEzLzZAssEYE7q4G5fGvMfbbJb
 4DRTewxlVUqrc7DCJm3oBhRVHxu4Y2ewRYi2SPMvnKOOa2jM/QBimtDa3f0Z73WXAerl5pRZSsB
 6042uoUcnIrfcZn2dhOcXJQK4Xl0TICaS9iWArMkNOu7CfHNn5Eg/jjm7hlDM87tF9QDFBeX110
 iskTqWL/F3O1YsvH1l8gVprchaXlPZWt5GkQ2mYzXiQBfmSlDRqyOGJ9EGoivVg5LJEGd0okbw0
 q+Rn/NR6RmNGJMsu2Vh35EACeqdVez2IFUX4qtld7RlS3SwINEYXF9sPnKQ46ACy0kNPth/9mHD
 +zntsij9p3Bl+iHDhNQ==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a5d70 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-54vo4t_4OUFHp6kYXwA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: HTPyK0IbQ5EVKIoOPyh-NILdtYzvx990
X-Proofpoint-GUID: HTPyK0IbQ5EVKIoOPyh-NILdtYzvx990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230074

The SoC Control Processor (SoCCP) is small RISC-V MCU that controls
USB Type-C, battery charging and various other functions on Qualcomm SoCs.
It provides a solution for control-plane processing, reducing per-subsystem
microcontroller reinvention. Add support for SoCCP PAS loader on Kaanapali
platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 7e890e18dd82..e0028143377a 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1530,7 +1530,25 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct qcom_pas_data kaanapali_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.dtb_firmware_name = "soccp_dtb.mbn",
+	.pas_id = 51,
+	.dtb_pas_id = 0x41,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+	.early_boot = true,
+};
+
 static const struct of_device_id qcom_pas_of_match[] = {
+	{ .compatible = "qcom,kaanapali-soccp-pas", .data = &kaanapali_soccp_resource},
 	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource},
 	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource},

-- 
2.25.1


