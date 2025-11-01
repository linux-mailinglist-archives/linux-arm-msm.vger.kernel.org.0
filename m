Return-Path: <linux-arm-msm+bounces-79975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 389A5C2773B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 01 Nov 2025 05:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 449111B22419
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Nov 2025 04:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399B4264614;
	Sat,  1 Nov 2025 04:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzTVcveU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lv/R3qTL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2BE232785
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Nov 2025 04:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761969607; cv=none; b=q1mNN0kEn5ctyq+U/gbwZ9FxqVfT39ZksILM34JotYy5I6nolTBD64Mn0PUhwOq4Z+h3Q2MhY1gbMmVdasVxnDHsx2cxiEjsA9xwZSo164N2SnBlZT2Sl50+rAHzWZLHmvrvSB2qDvp21ZkmbB46yMW0/FbBY3IGD+3jI/xzzmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761969607; c=relaxed/simple;
	bh=Cpg3+E+77cgaN8CmBzJQTZxMkFdRoEwVVkKgFdeA8+8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9hzo+gQihlMtVsknebSL+3XdYFzc+lqec0nyfZHMV9kqZ+jXa6RwwLdeJdMHI3ms43D0ljpK4ZibNFWAX5u8bPgRet1t1LoIpsBNyCQxnaUdbt6wOl+mnrVyp2kmyz5W4L/rDvwP7dtSLpjeCO7VZ/EG4lDymDUZ0mkpqt1f8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dzTVcveU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lv/R3qTL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A12oAGU387005
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Nov 2025 04:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GlcIk8VGLe34WMvbqxhiaOvLED3wY6vnyW7vFGcSUZs=; b=dzTVcveURJ8uBolK
	OOSdkNSFIcfNzfZcHSBI3iIdy2T0b3AgjykcvGapYMMp+g+R9Y+beeKOd1qW/yOE
	fraeZF555tJibJi9Z4xAGGQzrxQA8CO5I8xgNd8YWMeDFjWeckaUeRbeysvL0Ku3
	mKXGgfh34vpuPijRz5HPKkkmkZr0vACMlgoKH03F+nYqT6RIcBGi6cYcU6MhWcuq
	wJgy4rSI/MpZElbAEix1nrQSXShKSc1PqxbTge8gGOScsinmGlAIvTReg048ky9M
	gVBYOx08K4hZTyoUOzV28lK0NR14gG3oMVpWDvRKSort3seeCVbYrU6BFQ5N0pBE
	9XalxA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57we87uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Nov 2025 04:00:03 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290e4fade70so35994295ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 21:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761969603; x=1762574403; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GlcIk8VGLe34WMvbqxhiaOvLED3wY6vnyW7vFGcSUZs=;
        b=Lv/R3qTLHtplkj08Zv6o2y2cKofRedW0+ESotJxMcJAUfC0H2WQeKItIPAl5hZP8WZ
         ZtebFiQ6t+j/tRInF+bA6bIUst8YewNpaV7kSDC7HtgKtkJGo1tjjyWBhoRcetEb7PNv
         w/vbhVO5kt/VBM2heKduj1EISd4VxnkjZI97iDzmV/xUSsVzE+CDK8e6b0pnVDP6kb3i
         mjZFxs87IMXRyVLWizCUgTSsxhqYDyMPv0B5ZZKTAbVxwichg9QrcXQeRy1SV74a6kh5
         NPbCPJ9qsWH1j2N+LXfuLA62u/u0HpETJ1fb0t47lGZmkJaGg17OZOfuFQ1ZiOmx4TPc
         SdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761969603; x=1762574403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlcIk8VGLe34WMvbqxhiaOvLED3wY6vnyW7vFGcSUZs=;
        b=ZtezjouKXzlz/IWFwe2C55DgB3c/y6thOYfDXMjiK3t8nj3qUsWItYcPvbi5GL4Ps+
         Zy23GN6C9ldyFXj51HfC5R/0S+2pXqddUbdnpKar7tf3cHv0APczzw9Cu9f9tUGrA5kK
         Y11IfEibmn4nAWw6Lj7ChvH3lWvlACUQOHFziDmpigS5ElKyWXkw1HWfGr+4wyJWj+Yg
         20XIxUfJonfyGWqhMxeaifaT/FTUeM2G+Lsmz/uogGKZddMjX9M6RYTnTqprXdxR2nPA
         ZQrizTWFbPmvE1GFuNLE1qlbzigV6pbBX7YKDx+swUWgl9baASj1eHGZ+/9vJbG/AaR5
         OWTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDDExLuceLWvGnxtrW5e/+qJR9LQD6NmkhmVPJBdkzta19gMecZ8UijNYNehBMTeiCTUwR1Gmr+soLhXVq@vger.kernel.org
X-Gm-Message-State: AOJu0YxMWGkQacx2MAAEK6kW485wFFscTCDd31Z34k+zv3lZOvLc4Nkx
	Ez6W6cpsHVe/8ObZOu4MAjpkBOZOywpIHf8PHO1/QBxFVXy2fh/FypUyZyj3PEnmhAkQnIIp2mT
	Xbjff8gHUlxgn6H9DROH6n1vx0CPSHI42oqVHaRCHpSUTK9Q124PG1j1HgTG/307ox6kx
X-Gm-Gg: ASbGncv/lPM27AeF+jDUxVkeuGDLGyIBKxyoCZTMnJdhvEXfndGKvumsOSOabJGbo8u
	crPaIsNlMHSHopiKUBb2d9nTvF/zs0863IgdzimAmcl+UACh9TkxVahRWoZM2I2i/RPNy20Bcco
	7MFLnA56L4lLgfNYyF+VEQN3Uup6oY4l9gcnJ3F2g7rVpSz1/9UvVBJsS5x1nFlZ16HA6DWLkZw
	XBV9znRQVP2tbWOwmhEaKCDRMDEb66l9y/I0Y7rajS59F1Clx2fenV9jZ7kqZSO7JgC3qkbQoo0
	1d2w2UFZdHlepLk/sQzPoGXouE70ZRa6qMRSL9Hk+XaPU5p19Be1QAbAAYkvQwZ4H1cBzApsskw
	1FMrk3tbbSlMepJLIXJX85vtFhcVp+nBlJg==
X-Received: by 2002:a17:902:ce91:b0:295:4d24:31b5 with SMTP id d9443c01a7336-2954d24341dmr27202455ad.26.1761969602739;
        Fri, 31 Oct 2025 21:00:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnujD4KfpMKIa1jbnip3JbXoF83Crapp1dKuTRMgwycbHmlRZs7b7Qay7n+31/vmIdwou0WA==
X-Received: by 2002:a17:902:ce91:b0:295:4d24:31b5 with SMTP id d9443c01a7336-2954d24341dmr27202175ad.26.1761969602200;
        Fri, 31 Oct 2025 21:00:02 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268717ffsm41490725ad.2.2025.10.31.20.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 21:00:01 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 01 Nov 2025 09:29:35 +0530
Subject: [PATCH v9 4/7] PCI: dwc: Implement .assert_perst() hook
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-tc9563-v9-4-de3429f7787a@oss.qualcomm.com>
References: <20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com>
In-Reply-To: <20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761969577; l=1221;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Cpg3+E+77cgaN8CmBzJQTZxMkFdRoEwVVkKgFdeA8+8=;
 b=E/GibS1CySbengy4S+tVaLsYBBBEbb+oHQBsSpYkwMFpxOdh2BPROUZK8Zfy+jh1PyWjjMkpo
 C6wCyo30DSpAmHjbtYN79LvxVb7VI5uZCP0EY0r3zi1L5PJ1zPHTwUI
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=690585c3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dSOQ3hK3KXaY1HoqDbQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: jSjhD9h39z_UrIx94aP7BGUC7Rjm9PMX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAzMCBTYWx0ZWRfX/TKUrLAT0OAa
 1Rrj8/0e1dvVp/YATkvW/Cjft0bIjDxcua1JA4GBfXH0Mpw4SOe3qNB7Y8h9Mul5ibAfLk1I/JT
 LJH/QO3xorCeE7cPC0XQhHCHFxl6Cc7r3jWvyeTIMRIoFcYbMB76U9iucr21H8QroAH3NqVPxX+
 DesGcx1Q9qrO5XcKaOH6ySsdJaCwSHteVDoudbPIz9gRNm8PJC5+h5xRe4Mu3Op154P4/zNeLl1
 5GjqOMK9uZ1J6n7UiuWnKh/wVcL7rZz8xz6WydEtbJFzT2QxPxIYFSvQGSHB8ttVhnXdoCFU0Bl
 pMJsmF9WNWvX0d/wrEqj8MNO201M2SbnOWPafUiu/Kq2evZUE17nzW9sRZu/thu0zjTL690Ix8x
 +w+ap9Pgqz2jyn6WfSOSoxZ7CxYE9A==
X-Proofpoint-GUID: jSjhD9h39z_UrIx94aP7BGUC7Rjm9PMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511010030

Implement assert_perst() function op for dwc drivers.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 20c9333bcb1c4812e2fd96047a49944574df1e6f..b56dd1d51fa4f03931942dc9da649bef8859f192 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -842,10 +842,19 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 }
 EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
 
+static int dw_pcie_op_assert_perst(struct pci_bus *bus, bool assert)
+{
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+
+	return dw_pcie_assert_perst(pci, assert);
+}
+
 static struct pci_ops dw_pcie_ops = {
 	.map_bus = dw_pcie_own_conf_map_bus,
 	.read = pci_generic_config_read,
 	.write = pci_generic_config_write,
+	.assert_perst = dw_pcie_op_assert_perst,
 };
 
 static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)

-- 
2.34.1


