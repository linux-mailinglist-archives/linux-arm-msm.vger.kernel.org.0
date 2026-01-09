Return-Path: <linux-arm-msm+bounces-88193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 408B4D078BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 08:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9DAD306579F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 07:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5342ECD39;
	Fri,  9 Jan 2026 07:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UfyDZENu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGrGTS3L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE51D2EBBB3
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 07:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943299; cv=none; b=liWHcceMknK8u14XMNG4eEedg/z190WtnEBHXywG3m7GYY/jyn2BP9ToOt1+/AyEpCoONsRuDoLZPu0reSnGORD0N6AL3W8AUvoVZmEkf5G6xxa8hZ9IW3R1b7JXIMIqStsLzfcqyMOm0hvVjo0opWE5EruNTfaTTEyVs6ZpleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943299; c=relaxed/simple;
	bh=zejg997ZSWXmNp4lbxFPzukiCXSgprPeCxqQHhJcU0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CdciAL51qm7RQg4QfcYO1+tUv1f6n6spG0GWUsdzide8C8lqSFx6OVrkVbr+jclAY+osi6yXkK8z5yYSbMyJ3Ue7Lgr6+PfNm/Y/CDGjgN9tnY4lbeY6KQ3fr7R98sFmHH9fuMPDWC1CcjkVXGByfUPmYDZoiANtxs27gdA+Gxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UfyDZENu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGrGTS3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095wuKH3019775
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 07:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MWLM+x08j2mwTQLmHLC3ONhPhRCtuCvxS6wZ5AjUj04=; b=UfyDZENurunldCrr
	Y9/dJ2zroDAmVR/RMM4wHwsVVf7V4nuIDmjOjck7MxdsO5mzrFTnruLU9grlWnzz
	uNNy3uH87kfxlIBAY4QUJSp2F3wU45tKXtFjNthPtLI7hidI0YAoWQ2sjcNtWTuX
	mQeBXu9ApZ5A/WntG9zkJB7op6Zc2rK2k/gExs349t8WEzOWaCSG81XCqsjawCtU
	P4PAJRpJnykjUZW0VCkvhjXUntQZsQrHMpuoPG6a5w7RfupVjtL4NDKGBOY7Jy7W
	odgHgJrGdoyGiPoIInR67wjarNJUBvF8+rXXjOJd2rESdtNUoIqvFMBjT7HONw7P
	Pr3NUQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3hqpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:21:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81c68fef4d4so3240520b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 23:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767943296; x=1768548096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MWLM+x08j2mwTQLmHLC3ONhPhRCtuCvxS6wZ5AjUj04=;
        b=KGrGTS3L558H8653QzS/ScRlxGM0txsL3PvSA9PJ5i0F51v48WYObpkEZQ/NampKxB
         +XI7F3trhic0PlGb6sH4Qzs2/l1zacDiXx4GfAuWbAUKDSeKWZV/WOoCGx4vuVFwDbUM
         qhpJbZIYZvaRsNTVvtl5VXVpVd3mLv4MJJJ1Xti5FX9RHrtkFq9NpzkbuH8YpPJuGIRG
         kBpWBNVTyeILyvFXVek+3Gmno1/FYh0qA3JOQJCdheLMble4wwgwKcn6eZSdAuzeO5Ny
         kgJO3g1tBCf1o4rx3rMhXkMK/U+VuQP/PDOB/RITek2dfHhbwCIaxaC7kaOw3T0UHEFX
         KRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767943296; x=1768548096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MWLM+x08j2mwTQLmHLC3ONhPhRCtuCvxS6wZ5AjUj04=;
        b=qu6ETxL4KBnkXwejcP05FaMsTD9gS4hNZyhiT5Y55dta2jEiGBjoy1R3lbJdmuoRVU
         OhW8J+NGO9Hp552M6jwBA+ubSC3ULCQRB1UVXmCF23rHHML2x8kLbPW0ewZlQUeigDt2
         HsKOKstnWoJPS0+ws0f0sN2fUo/z2F4/kL3gEZLKMR0fE+s/Chnq8mS8As/eVF5MavbJ
         5wCSfeeDiMpPOR4MerMHbWDPYHjPrzvYPlC3Kp50Lub5gaFNxyr0opewgebQtp2YjxMq
         OU/ArSPStZwS6ow3JMoTQMm98vYcDFp3k6jLNbwaQLtPOvjXnevR/ADwKRvctAC2Ocb5
         FWPQ==
X-Gm-Message-State: AOJu0YwF89Z/5XIUTLpBi7ZYho4IbiX3PR2deqD2aLiqFZIzN0wVEgJG
	G/RHwIfGsbdCSdISESio5sHeunZ80WRUcfPiuCWeRWQ/Hmr9B04kEl2pL75TuJqxBokXF3lKBt1
	EWJh+HSEGft7GKH0jZFwVayUKSA5zINhBug6hHq1Di0uuur4yVavHaQoIQ471rnymp7RgxQzOE+
	fu
X-Gm-Gg: AY/fxX4i/MEXj74LsDq+Xtmms8JZaoNZDoYaseQlQiXVx/koLJI8wsUDosloXnH4rGz
	rJLUQuYDTVcZbazKOs83+BiRRrxk8FCRRBdXogwJ6g4Z/iLWXR6zZr5VGCD5Jpmyr/UO/ZoraYB
	DSpK3lMfu8NtwnzMuo4KdosP+UBWnFeS9kK0y5yxWmYFoKxKjDRU6dGGvjD3GkOxBUen0uoANOe
	GpqVFTlsfpuuLErVMnJ4mSYKLJ8OerOV9zhgYx7Ej1HAS/6sX750IyZhnC8N2x/wH7O5GfiP7gN
	keqQsC65WQwRUw1DWN9nw6C4yad13RLCVaETVmeMzbnEGwzB5QCTcxseJpL15m1vqNvtmEWlmM5
	MS2AV/a+mvQd8JFAcI0qrt7jwzs8lkn4SN6xiYLFswxnM
X-Received: by 2002:a05:6a00:408c:b0:7e8:43f5:bd21 with SMTP id d2e1a72fcca58-81b7f9d4d7dmr8834822b3a.54.1767943295900;
        Thu, 08 Jan 2026 23:21:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5oswvUvt2eSKOV/gIHmGq+k+j9ho0bKbXCQiNsUMKePo3mhru5IonqVUsfFuQd52XyRbzRQ==
X-Received: by 2002:a05:6a00:408c:b0:7e8:43f5:bd21 with SMTP id d2e1a72fcca58-81b7f9d4d7dmr8834799b3a.54.1767943295422;
        Thu, 08 Jan 2026 23:21:35 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb4c85bfsm9510369b3a.30.2026.01.08.23.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:21:35 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 12:51:10 +0530
Subject: [PATCH 5/5] PCI: qcom: enable Link retain logic for Hamoa
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-link_retain-v1-5-7e6782230f4b@oss.qualcomm.com>
References: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
In-Reply-To: <20260109-link_retain-v1-0-7e6782230f4b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767943270; l=1470;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zejg997ZSWXmNp4lbxFPzukiCXSgprPeCxqQHhJcU0U=;
 b=ecroe9T2ZoReGjqBPMd9o0jNW9qHm6mLLPK+GU5EYr6zawWa3YYes2XYS1rF24v+W69OfgEkE
 LE2BGNylqYfD079R1I5yn0tCkuLwCH2KxX2PO1LpFGylbeXS0VFLHT4
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: mi8P3R9IiUwMadNvt169IAkLlnRJXuIK
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960ac81 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: mi8P3R9IiUwMadNvt169IAkLlnRJXuIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MCBTYWx0ZWRfXy3weBzIq57OD
 kpYf7aKM0CQ8JJW8UVHdHBhXEJ6ZIJh0dc2QIFeoKsUfT+OpbGnU0hEtSQ0R3re77nVRfkKN0SP
 IeETpzg/nOIfKFTlTFbIqlWshQA6apnfD0b/nK2zlBLEoG5yYGBJF7ejq7BUgjUuctNp9tsSYx1
 YBwqTtlWe2EibyrDYKK8YQYaJ3ETNPJnZU1zjApn41dd/B9G9V59ME047HFdGlEHJsp9NElX/3g
 nJzkhuP/wO6ad4cAaV3mCkROR51YgJUYRCZ7obkBB8nofOqXGq94qkB3gyLZszPplV2a/WMsyqw
 jSkrrhxxNxK7byxigRoj0Nl0Xf8stfTXxUIBbFgbwY0bnaHnWqhsMZQQ+ARFQU95ZKWU8ooaoaD
 Ij7diEkkMZ23vCdwn924dWvMzwdsj0q9gREFAHob03bblkV7d0Wk3Ea6qwXWvPqx0ahYQXlGUdG
 7uUBwzHQNAZ52pLhb5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090050

The Hamoa platform supports keeping the PCIe link active across
bootloader and kernel handoff. To take advantage of this, introduce a
specific configuration (cfg_x1e80100) with link_retain = true and
update the device match table to use it.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index bdd5bdb462c5f6814c8311be96411173456b6b14..975671a0dd4757074600d5a0966e94220bb18d8c 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1531,6 +1531,12 @@ static const struct qcom_pcie_cfg cfg_sc8280xp = {
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
@@ -2168,7 +2174,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
-	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_sc8280xp },
+	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_x1e80100 },
 	{ }
 };
 

-- 
2.34.1


