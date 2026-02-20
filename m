Return-Path: <linux-arm-msm+bounces-93446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CA6AMhz3l2ks+wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93446-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 06:54:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D55164D35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 06:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B5C5301AF56
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 05:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3761B4138;
	Fri, 20 Feb 2026 05:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kUkYIZju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1hYm2yU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8E22C11DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566872; cv=none; b=Hgfe5nDh2dKWdomVtQd0XMac6IilEsPrlE7HrcTABhVkukK1BJFoTiPC3Q+6ebfBF0CFtFX6BSp7LFGaaQi/sQjWQrplYXbJ1nIhAMWn2jsR09FIBEiOBMB0jSVRqxt78tpYPyGTkjil588Lyh8QY1y5rLIAPCcX5//PiB1+uFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566872; c=relaxed/simple;
	bh=fV5WWPdwufBIXt9mpDliWUdFwg3X3zqkLcIQSSqZUBM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ijEhecijSAGsD3H3c9BhA8cEZUGVQ0Y30YO0+Unin7DWKVUXxdxBha637y4/OFUD5VxQQpDpp6KceRmCxxTqz/EhzYZnuDeX5t+bmoyiBHLKL1FreQsIP2//zU7+7vtHC8KzvgCit2tRAEnUCjM8RQRTTorogawMR7D+lTEjI54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kUkYIZju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1hYm2yU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5SF4v2380864
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3dHqnbi3dJpAvR79pUJ1zF
	Mqox5b0Yk4I1PRd7BpHz8=; b=kUkYIZjuTS7euGicBSTSOaVr1eNUpomhxyKmKX
	cM9BisEdp87fIir8VVe2TSCZeur+pIbf7wJaelyyjfjI9PLZlp0oypYaMImy5FdY
	cNCPEfEU2mLqFOKNVQKZaMRqG7nEhyqRwx2uH7YyO1Kw1WA0vmj0F0JNxO1Rice7
	aYjSx9WUbkzrNebEWCEPbBmlnhai40+kPG4nhXjxLhM6q54rdELbzXcN5muDC2LB
	KQEkCn+05UUV+vyvhv2zvoIefO1t1mcc1GGbufWBQvbSKBMtu9mqtUs77XTG6yYz
	w1l9TQEyFB1FQ4WHx5JYjy7pVBs88fy9VtbwsA+po/Nc3toA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cechh8rxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:54:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a92a3f5de9so9969045ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 21:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771566869; x=1772171669; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3dHqnbi3dJpAvR79pUJ1zFMqox5b0Yk4I1PRd7BpHz8=;
        b=L1hYm2yU6PTIYFzLYaFkFnkZdWddCVwxs5/i2oDuLtlfVot1fGNoti0ExhgDgn/Er9
         4TobzdDjw4QJyThCpccN08+0hU6e6vBuCz6DDZCBsl1zd2sE2x9wlh4aX547dXMpSLh7
         B4W2sh6+7R2UUvW1PUE4XTtGpd9KOdUw1ICRr0m8TIasZkxd1w+KOehPscOIHmu+gO+n
         aotf8UOcP6/2eF4UfiW8gbHIkCUuAxuQl9AWGoFQU2gNFCWZSuy4U4zj70oqjpIazDd9
         KcO4EcC4WGmRFeBCCjixWoMOeDA/JxRbOXthxuMSyJ7J67p9m849jmXHb8IWFa1q4uc0
         zTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566869; x=1772171669;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dHqnbi3dJpAvR79pUJ1zFMqox5b0Yk4I1PRd7BpHz8=;
        b=XY3Peond2tSuTBrdJr6VSikQmWzRFIQj9HymMq7hEmQ1QQeoa4HCysWb3egdaacmkO
         2cbluRNoK9EFdVJTTRz5McU65ZXlwn8yPVdpyOEniiVNSu+JkIlh3NOd0KthnW+tbwWY
         cji5msgJUfjQgg3YxijW/ztaC1ZgmTPx3yTSJ8O/Y5zhG89hyvuD82jhEhvTU5ubUdct
         4G71DdoXrbfYy0wb4Kj/PcXa/BdDhIkZPNqPfV/L9/vBtNLEZO1rEHnLzqK/QjYk0CuG
         3GJrPchS9ZGXdqjjCCj2Od757q+M275BaZLIXd9HV3SD1ZdRVgoGp/H1gJr0J6zyP8tU
         dNFA==
X-Forwarded-Encrypted: i=1; AJvYcCW4NbZAcAYSUi33sZMmvauPw7uoM7Hea0+alfrZNc3TU/nV6MjjyDwKnxOQ5bTzGDbsl8jBhKo/HesTKmrJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4DFnezcF6wleyOyO7YnWSrCPYJWBHWGh0IMyF0hOw3Dh7NXk
	XKVf17eRIGRjuAfmkQ32QbeGXvJcbfiuR2bevRyEZREAxZqPYJCR4jYAcWpy3JshRUobkrkDV2P
	h7ey0EabYXhYhW8QTvSwufksiAan7TP2m1SraE3KEYFhvRLUQ+CMqBJn+eNcVJTgHvZ0G
X-Gm-Gg: AZuq6aIprmnjVjZMUj/drEbHHIIK29O/dRmYZIbCD8hQfcKpv2+DaXIMINvju7oCANI
	n4D8YFVMH/ZRH3nzqNjfaTr2uo+1L1JqIvY19WrU4ocK4NmBPx/XQM5/SCGT8Ak2RgB2cNQWoEu
	VGLeLgS7fJ1ieW9GaqdEtN2hVQOmioTXVrHZTX/EhLmy6rj7FfdbNyOmYE1xez8FwXRehd3PF/9
	mSBS7nmo2TjYOxNvNkKcpVjOmNRFB3nUGpIjJv1kt6ayaaLHEKvnjryaC+oCAilBpmmDsd3Qt1N
	JfOQIDnQyNXlMSsMNkL5Aw5g+Cff385EOByn8CUOuASATEAJKJGDfK9oIe7geBm089iRIIcSIiN
	vauSXmRePEFm43U+DwyLbGrXcFYnQX3uzPePMoEqRb/vt/A==
X-Received: by 2002:a17:902:e74f:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2ad50ed0db0mr69116195ad.24.1771566869181;
        Thu, 19 Feb 2026 21:54:29 -0800 (PST)
X-Received: by 2002:a17:902:e74f:b0:29e:9387:f2b9 with SMTP id d9443c01a7336-2ad50ed0db0mr69115855ad.24.1771566868553;
        Thu, 19 Feb 2026 21:54:28 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a6fa326sm197949665ad.1.2026.02.19.21.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 21:54:28 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Add support for GPUCC and GXCLK for SM8750
Date: Fri, 20 Feb 2026 11:24:19 +0530
Message-Id: <20260220-gpucc_sm8750_v2-v3-0-6c5408564c3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAv3l2kC/x3MQQqAIBBA0avIrBPMcIyuEiFhU80iE6UIwrsnL
 d/i/xcyJaYMg3gh0c2Zz1DRNQL8PoeNJC/VoJVGpVsrt3h57/LRW6PcrWWPaCyiNeusoFYx0cr
 PfxynUj5DNvRUYQAAAA==
X-Change-ID: 20260217-gpucc_sm8750_v2-866576675fa0
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: OHWxe1_kf6lrrEWYMp7d-b1ycsocM4rS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA0OCBTYWx0ZWRfXz8Fg7+T1/qur
 PPfVV0VMmTifAuIuSF1ijLwi7jCFSLRzlrACl7jBqJgD5GpUEJTsu1yVP5DYp2+oBzxQcGQs7d0
 xDfF8dcDcAaTwWK7VaOXgE/ysd8aIaMvcJ/mbNbZ+Ctbo6UefZwm8hpKdbK1936MP5o8GvY3mLN
 ipLKMIqF5VEPy6l89+Hcawp3whpZc+jXuCs2AZt50vA5y9rw0ngtuRH8zb5/qR/RlUgJbwTj8pn
 IYxErQ7rZQy5ZyL5qEMYykCF05suYTD5dUae/jcPuSGnhDExbPNaLpWnQ/IJiOq4BgljnpPu2LV
 hvClFOvFTOiHoird8hfsGzzgRf9YjyKoT8ndRRfkBwy0Xby41cBZPzB4k9Gp1cW1zs+BEMAmySq
 KqRsvT2O8z3pLByc/ZHkKS8mfJhzS4LJBQP6T5kT26mvbTkjiv33itGdx8bKqYf6k46204iXztj
 uGmfFr0oysKW+mSUVrA==
X-Proofpoint-ORIG-GUID: OHWxe1_kf6lrrEWYMp7d-b1ycsocM4rS
X-Authority-Analysis: v=2.4 cv=KYzfcAYD c=1 sm=1 tr=0 ts=6997f716 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8BAK5ul3PV33nhPFZ3EA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-93446-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18D55164D35
X-Rspamd-Action: no action

Support the graphics clock controller for SM8750 for Graphics SW
driver to use the clocks. GXCLKCTL (Graphics GX Clock Controller) is a
block dedicated to managing clocks for the GPU subsystem on GX power
domain. The GX clock controller driver manages only the GX GDSC and the
rest of the resources of the controller are managed by the firmware.

The Graphics GX clock controller is a reuse of the Kaanapali SW driver.

Changes in v3:
- SM8750 GX controller is reuse of Kaanapali SW driver, update the
  bindings.
- Remove 'qcom,sm8750-gxcc.yaml' as it reuses the driver.
- Cleanup the 'gpucc-sm8750.c' to remove the GX clock controller
  reference.
- Add the corresponding changes in Makefile for gxclkctl-kaanapali.o
- Update the device node for GX clock controller.
- Link to v2: https://lore.kernel.org/all/20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com/

Changes in v2:
- gxcc bindings: remove double colon & list the names for power-domains
- Link to v1: https://lore.kernel.org/r/20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Konrad Dybcio (3):
      dt-bindings: clock: qcom: Add SM8750 GPU clocks
      clk: qcom: Add a driver for SM8750 GPU clocks
      arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes

 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |   1 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   2 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  64 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-sm8750.c                    | 472 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      |  50 +++
 7 files changed, 599 insertions(+)
---
base-commit: 350adaf7fde9fdbd9aeed6d442a9ae90c6a3ab97
change-id: 20260217-gpucc_sm8750_v2-866576675fa0

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


