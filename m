Return-Path: <linux-arm-msm+bounces-109066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDCPEvAID2rREQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1BD5A5CCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B64C3119553
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2A43DB32E;
	Thu, 21 May 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2L1EBfa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNHIh62V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31D03769FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368242; cv=none; b=q9JxVquRYGwUh9rHno2pMBPP+re/b0FmAEMI+8PI6neOl4xzuj5ussyb3C6fVqq8IUFKIu2AnMKankozE9sWwZvg0tr8zvQ6TDLwbn9eOwVpIOf66sBOUeO7R7p81oyw6p8J5c9w/qsDu9ijgo/GRILwkE3yIlcXKUkC9fs6Pd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368242; c=relaxed/simple;
	bh=pZzEMJhR/i5v6VGBimRugnf0Sex8LsiVoi6Km1GzQBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HA+70IX5WOZxtPewNNnV8f609RA/E3ypfd6pj/OryfP4oMlp32+Djd/M9CmNHbYmI2e2xJLpyBX6Dq3RfM3oHUBYLY5QfPwaPoyd2e+3IOO2+GhFHRg0c6f9OTpXHGEGrxCG9LqMDehrhB3xuu0qamb728p8T6h2zct9T6gZ+z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2L1EBfa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNHIh62V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99ndj3009484
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BlH+KYy5oNWueaqA/6sX4WHaa1oprAYtrZX9JRIQwqc=; b=F2L1EBfaVRxpL6k4
	gxoWs9uFl97rleAH0JxXINdXVgkytR8KlEaWVilon40dRBuTdG8axpFEN9Zoofd6
	xlT/uPUoxpLle5UzMQE3BJI8CHQuOWc88x6MRnqIvkFKQ+d8/8MUUcmSRDWRp5fL
	caIHJGyLZYDlWm8Ngy/S7YTRYXIqJYAb/Ng97laRaUPnwO5smCgltl5INEY0oHP4
	2VEDKw4E8yJhGjPT3wwpVLPgAHuNenjO9JkZLT4ncv5FQmOGg1jWB/YOyrFfbHHv
	SvS2f2DXjTAoXnie5zbp7NLDO2MA4SBAiaE+rdaZM7W1ZknCrZmF1HlttTxWZwpo
	XUv7Ww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr328df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:57:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c829366cf25so9033525a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779368239; x=1779973039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BlH+KYy5oNWueaqA/6sX4WHaa1oprAYtrZX9JRIQwqc=;
        b=BNHIh62VtKLpnVXxAnI+s6AwlgO877kih/Fepi8BvVdwHp2CMfNNNNi1mH8WnbP7ad
         3cUK9melLcAln0yq617G96KiTLW0BzXDh05S+ozQ9urz4c44jUAWq8K0dkec+BEu6a41
         WLfERKqHDh90jADeLGY19c0WvWrU5jTZuIspo02+NnZidULZ5z9p3KB/G/4/KTQoSK1E
         t8B62KfnOpgj6gjJ8rLN0hHzRdrP4gWpmXKT7nRkzDQnF/RTTbQZWG98hCzjiqGs69FO
         4EtXNE2TE3aM+sWkUmgSYQFema5JNxE9KuXjZh8hHSkNKuuoptQSxilkPADzSE3YqnQT
         Sadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368239; x=1779973039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BlH+KYy5oNWueaqA/6sX4WHaa1oprAYtrZX9JRIQwqc=;
        b=TnTSfish/nCIVzMfb9ApdQ+pns4doA2mOOLgRHAVntk5ladY3CfHMK4jWovItEELaE
         ksJgwjw4wh2cN2oHah0pJaWCz29+1k/mRfKtzzWuhUp1NYtI4fgA4zufEO6dMdjemWzN
         oTxM6i+rU98CLKAcN52oFYX6Z6+9wlkAkz7TPKO7BDSuj47zLytfXNfM6iv4Dl141VGr
         Xj+sIH+mks89RmKMTFVozIRmpR3YKtM13YBfJE8QtEQ8K4ypGFouIj/YxIUDHgDA/oRe
         h8xADK1Fobubn1CXFezDfJaoNuJkfP6Tp7VLnnM3Ag0kSkocmb+07E+5wgaMV+EfNOgZ
         uoYA==
X-Gm-Message-State: AOJu0YzMfpFk+UWJ/FHvmcpmE95DDcRa+svmcjGKM2z3lUXwQWF6kvBN
	SCD8Ptfn9gdbTmpnMNLEdzGyretnpYmmD3uBe6do+1imBX+F2D/zeEdUzfTkq8JzzSMX2Jf4OFJ
	kPb7LICZWhPpWuGCxXBhDypCd5+EmtIlI04qDlGfNqlP9WFIFiZmXGVnmkxWiWeOd9znU
X-Gm-Gg: Acq92OHhpDyHActmfZaH8ueONcpBGC1U7Ecra++9d3l0MJHPtUzq5VfdG8MoKs129/5
	oJa7k5EXKoxamLZp2bTJLJA4bTdQE0tge3FwVzvb9jgttvIHmpHdYzOxr7UMxr6ljamgyZN7sIK
	J2KeyYWrFeqpVVQFqPjUxNgTgOfyHZy9dSBKsoAPG3PQY/BQ8ftir8N/TxPXs6hO1ktsdXGMCoF
	BVXWwNRUTdHrip917MgQgIVB9JyeLOxUeWM396ZGPW2hJrtOtdgkUMRI+fRhJb999ZoDroJ6Cwl
	17ou0ZYrpXHB0e+RbnQ4SqcIA/dCJm1AtbGFaQtDtlOiD6WvoloVzSpWp5j5ahID57Wo19W9ZAj
	PyGOCbG3L1CuMfdewlVUq8E2fNtVBV39xlM0OpLeGIvhenMnGkGIm6aPN
X-Received: by 2002:a05:6a20:939e:b0:3b3:1c7b:ff0 with SMTP id adf61e73a8af0-3b31c7b10d7mr1046916637.32.1779368238850;
        Thu, 21 May 2026 05:57:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:939e:b0:3b3:1c7b:ff0 with SMTP id adf61e73a8af0-3b31c7b10d7mr1046862637.32.1779368238335;
        Thu, 21 May 2026 05:57:18 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85198f508bsm357984a12.20.2026.05.21.05.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:57:18 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 18:26:36 +0530
Subject: [PATCH v2 4/4] PCI: qcom: enable Link retain logic for Hamoa
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-link_retain-v2-4-08ed448b081c@oss.qualcomm.com>
References: <20260521-link_retain-v2-0-08ed448b081c@oss.qualcomm.com>
In-Reply-To: <20260521-link_retain-v2-0-08ed448b081c@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779368212; l=1463;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pZzEMJhR/i5v6VGBimRugnf0Sex8LsiVoi6Km1GzQBI=;
 b=ENZEZ3anBF5vyw8P5smL6IFR26MJFdIz/IZi6FZXMVa5BNiqYpA1eO+cLdOYOgk37x+LCFMVI
 KMSo3WtqrQ7CNWwBgJxy6PaFLT5ZTVEhTxb/7O0+dGERUViBmDubr21
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: d-XECavNtjLYvumthrgrj6fukjyBcHXF
X-Proofpoint-ORIG-GUID: d-XECavNtjLYvumthrgrj6fukjyBcHXF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEzMCBTYWx0ZWRfXwieJ4PbCk6mR
 nRVcipQw5yMYzHbPCnn0mmoVV6wwbAXHv5UsYakX1uAZ7x5SHo4SqWVJv/8ciyfrUV/WG6pG6Bx
 UvLlQYfWo5dmp1nhq4T8P1DUwukTXdT9AOcBpR9TO16ji3EAipYjA+I7FZXNMopmcWRRhuIL9yU
 SGJYNw88p1uPHyE8Y4QvnBPF6ozoFETQ/kI47kx2XqPg5ZNgg4Kl0XDxsY06jNY0vAH6ACenL0c
 /e9ADkGEUBUbg9Z8H386yTPYmNeHnOD+ZUt/vsE9RVsw0KfuG1HqqE6DxXGh+honJBTOeCCfpfA
 fRIr+C1l/a8sLABuxr8Zn7SLBuQzCi8yDQnsWVaYF8WrxWIaVXxRIhxgirdvVx/SHwNwZC9BOCg
 nfCtL4rxJ4MKTzLtQICVdlrdf+uvvtZuganHuBDb4QQeFm2jU4gUNecZcO4DwzFnQyH/KV+ZyY9
 13rnY03M01w6SgEeiJg==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f012f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210130
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109066-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,pengutronix.de,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4E1BD5A5CCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Hamoa platform supports keeping the PCIe link active across
bootloader and kernel handoff. To take advantage of this, introduce a
specific configuration (cfg_x1e80100) with link_retain = true and
update the device match table to use it.

Tested-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b061eaa227b3..8496eb87debb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1557,6 +1557,12 @@ static const struct qcom_pcie_cfg cfg_sc8280xp = {
 	.no_l0s = true,
 };
 
+static const struct qcom_pcie_cfg cfg_x1e80100 = {
+	.ops = &ops_1_21_0,
+	.no_l0s = true,
+	.link_retain = true,
+};
+
 static const struct qcom_pcie_cfg cfg_fw_managed = {
 	.firmware_managed = true,
 };
@@ -2199,7 +2205,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
-	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
+	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_x1e80100 },
 	{ }
 };
 

-- 
2.34.1


