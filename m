Return-Path: <linux-arm-msm+bounces-80695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AACDFC3E76B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 05:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE9BD3AA9B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 04:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E6822156A;
	Fri,  7 Nov 2025 04:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GylMaJDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBcQUzOB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6361A256E
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 04:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762490625; cv=none; b=dqf2Yhf225vwsDhh78+ySjd4juNAqQkO6dF+xf1brM3NK5T1L9abWzAOfVeMQ3LVVEKlK9j7bfwZs0kqLpF8rMvKB87DcoQ96Bt6QfEy0qWvzmq4raDDja2QD7mY5OJyB8iN+DhO01SQKqevLr15vKzehjMgdvvhBzmoWDqBDWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762490625; c=relaxed/simple;
	bh=G2/vAxxxQz4t8AYVp4CS9gXKXzeSLFuZgLICGLS61Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kw2MP9X+SSuAqLrQ0USsNaMzbhb+ZMTSPNEUwKt3Q3GNznw1MD2pfdn/L0Bn+dU3xPyDtPPhPV5FYJVAkngBD6LToYRWZDlOOnuL6Tr1hEmFO5uMlPoEF5dTBuwy/6nOEVs6xq+sRkLQJSue95swEMRNnsF8qxfh53cnOEXhf88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GylMaJDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBcQUzOB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74117g583566
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 04:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DshbN/+SdgJ
	8o5AVzAAO7cIuM+jDLxiKI8eKlaON6a4=; b=GylMaJDKscZuomf2ANZBXI77FH2
	RsTh0eadh0J4vpTeWu7YQa80Bb7CpUE1KLhIxB8Fcy3kvirdQgFCQZBT3EoIXorr
	iEVYax+ObCtwY2P0uX2v18a3un9ppsdf2yk1AcuTpcdxB4D7stMCjssVQqfKh37u
	46oEkGgeSrXDe7y+nucfcBNrSmtxwRi9994Q/AdzYTZLTX2f6vrjVwZCe3kr2yxs
	wSsi+J5XU9N1VqnJLTppKTlSnCbzlAd0HXcc+dPFepHqrmD86ryPlhfXTHNAaAfm
	yjaDQ3oJTRJTA2mtL4cUpM4wrlO9o64xL+PpuX/U8uzRDTVuMh8gSp53LDw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8ykths7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 04:43:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso531231a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 20:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762490622; x=1763095422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DshbN/+SdgJ8o5AVzAAO7cIuM+jDLxiKI8eKlaON6a4=;
        b=eBcQUzOB+liScPkUDNGUinI5tSk7V5VoQcmMMM1dbWNxjXbg+JWUxNlQsHlxjY1q4X
         kR/HHdXMy2ItTq+IkywrMpKm3ENBdE+kZKoNBQNRI7BJM3z6x/ZVKvr/usiKFp6C6f5M
         OjsZprW/PyYTKvq3tuUNzezhnilYELW0FePNYTDWwr8TBBHqFtjnIKqBMW46Rclpsxq9
         o+/7phwMC3eOpFL+2k368JGLvHcxFiqjtx3S75vEfJzJ1n717pVqQLcu+Lloo8ykbMIn
         RTWUA3wjT89mYTxdqv8K0DdXaKIB6UFTmEgSqWDofuhJYZz4lsMyCVXHrWedVCFER0d1
         6VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762490622; x=1763095422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DshbN/+SdgJ8o5AVzAAO7cIuM+jDLxiKI8eKlaON6a4=;
        b=U8IQv4vfVU8wn8Ud81fqG6hXbiEiv6jmNtqLnTfmZVd07D8Pp4S1hgDIPG4KA6AURZ
         IGLJ4QBt+w/UeJE59pwceiqhu4ukk00WzteGyvCjJvIYbTHgYRH3mUZqSwUgJ8h1r4JU
         AvBocw1bgfSH46BdnW0lyJTB7drilQ9PzAOkk/GEmcNNnBAUQfZVkB+GYtDqR3MDLW01
         m80kOUNZ2HiuqzEP0WvZ5FZ42876n0elTurplHoc4CYPL6iYcWQ3pC6AwsjiKdlPo072
         Y+Xdxhj3F6ux2gFwtfwvYDdURNqPU8r54bzz7c1Abjwr3dedlpjRDGj8tzvZHIm7TQM/
         OgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWvOo6S/nlKIZ5tZOqsq/SHzm+RZ1XO9QKWxmMaB94Sloiy3eagID9buPkKgK9xWiOGaxZnJC53sGmTlvb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyit22QPVxoIdIoq2tKTD42pCEwB9o6qDwVGNA7En8j2gMyRag
	O9oIuyuqbdRnpvqx6HMQcMm2o9xLiU7uWvADtc260vXnoBAQud3A4FKtHTszdmnnqHlPGzUwt3e
	rbcU7YpwVzYHtdq2szACYelKU6po0C6TUjkkeu4tdjq91srDRzaIZYvgwTq1GAh9EtbTcWUHazC
	0C
X-Gm-Gg: ASbGncvERHaVtl6PSB30oIOC/Sy6bZRmP5ndg4769cMpYsigK6pNEpqckN2JWp3m4n3
	UNouuQqAVfmTGrCmL/WeFr/uN68ieIHceH13rB+of4IEQGtMmUwKLi31xAqmW63h7/1WME2PWhW
	Ko7H/7D6Aje/4uJ3YQaMApIoopjU3JxmvEMfz2XrMyCcRO7HhgpYmM1kAiUy+1FnSHjeSE02uUm
	oPd7JhX871OMAmLuPdAeO8NqvFSWpdZ3s4tyc1ElpdLegsfIhCtMSb5Zs5aw11rRUwbyI7Dx/r0
	I5iMsr2ramT8FAi3Ia5Y5W6TUlUv55eAWt/0ul9OvDprfvM0Qgo8HudO8Vp5m4aGGfkpSsoZrKc
	ukPsErq30gGfxnibhvg==
X-Received: by 2002:a17:90b:4ac9:b0:341:88c5:2073 with SMTP id 98e67ed59e1d1-3434c4dc552mr2005952a91.2.1762490622283;
        Thu, 06 Nov 2025 20:43:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELudziz9hb7EuaLogNJwCGyLHcXQ49upAv4a7MpFInQ98hOWAEQHJY4aKl5ZMlthqCSZ+L2Q==
X-Received: by 2002:a17:90b:4ac9:b0:341:88c5:2073 with SMTP id 98e67ed59e1d1-3434c4dc552mr2005912a91.2.1762490621748;
        Thu, 06 Nov 2025 20:43:41 -0800 (PST)
Received: from work.. ([120.56.196.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c332f1csm1142624a91.11.2025.11.06.20.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 20:43:41 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
        bhelgaas@google.com
Cc: will@kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, linux-arm-msm@vger.kernel.org,
        zhangsenchuan@eswincomputing.com, vincent.guittot@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v2 1/3] PCI: host-common: Add an API to check for any device under the Root Ports
Date: Fri,  7 Nov 2025 10:13:17 +0530
Message-ID: <20251107044319.8356-2-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251107044319.8356-1-manivannan.sadhasivam@oss.qualcomm.com>
References: <20251107044319.8356-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690d78ff cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=NqeMpCPRvvPHbudmJ2rC7w==:17
 a=X544SMn2G6euAj6E:21 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dVeha9RqDf-OwfEDNMwA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 3iM5z5nGMbJOuvnB2nbZoqrqUm6xSN2V
X-Proofpoint-GUID: 3iM5z5nGMbJOuvnB2nbZoqrqUm6xSN2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDAzNCBTYWx0ZWRfX4icopACpDkxg
 Vf2QJ+C6ryRF+LLVKDl1UblCXCHhqAxAbDruqV3GpY+BnTl79/VP1+uETNaRA6LrRbuLD7IhgYg
 7t1bcFQdQe3wSaiCw9GrMuJg/SPYT+0UfTDNpCaqUyL3tVz7RfpMm6BffN/CjxpR3VrpoQhgUAf
 Q2Ozq2qd1Rw4JmWaPSe+ULZ1MMSH3YTHx+Iw5+/h0P/kHeQhoMFcOzIDmYHpPbZl7mhILtpjTk8
 EFSZBc6ri6erSJHrHtt28UH8n2mkQzMQ9CQZS8THrKnKUzYC9W7C6/H0+gtshKK6UjRqnJICtkV
 7feNJoGfDfUHPfbk0r1MM3JdBQvkD8f8Uoy4PWCCXPgz+IV+3EqGPCF5E3b+L+38kioutoYsRMN
 oQKGI7IPItOvpR+IycXhXWIJt1iMLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070034

Some controller drivers need to check if there is any device available
under the Root Ports. So add an API that returns 'true' if a device is
found under any of the Root Ports, 'false' otherwise.

Controller drivers can use this API for usecases like turning off the
controller resources only if there are no devices under the Root Ports,
skipping PME_Turn_Off broadcast etc...

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 21 +++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index 810d1c8de24e..772bac8b3bf2 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -17,6 +17,27 @@
 
 #include "pci-host-common.h"
 
+/**
+ * pci_root_ports_have_device - Check if the Root Ports under the Root bus have
+ *				any device underneath
+ * @root_bus: Root bus to check for
+ *
+ * Return: true if a device is found, false otherwise
+ */
+bool pci_root_ports_have_device(struct pci_bus *root_bus)
+{
+	struct pci_bus *child;
+
+	/* Iterate over the Root Port busses and look for any device */
+	list_for_each_entry(child, &root_bus->children, node) {
+		if (!list_empty(&child->devices))
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(pci_root_ports_have_device);
+
 static void gen_pci_unmap_cfg(void *ptr)
 {
 	pci_ecam_free((struct pci_config_window *)ptr);
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index 51c35ec0cf37..ff1c2ff98043 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -19,4 +19,6 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+bool pci_root_ports_have_device(struct pci_bus *root_bus);
 #endif
-- 
2.48.1


