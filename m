Return-Path: <linux-arm-msm+bounces-91539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHsvK7LogGleCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:10:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ED373CFF42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD054300E194
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 18:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAE62248A8;
	Mon,  2 Feb 2026 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZwfvJWbl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2FEQIzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878D338BF84
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055803; cv=none; b=TuOAolF3d1d1maiYf89ykx8/gMKgMSHZZ+sBdVwXoQ38QVkhSTIHeGv+OAM1PD/jzcmsT59g3xFQMYmjqift8bUpYtv3/gEj09gyYaZKsVtADbp3cxYMtrI9T8DK5/82n68SGHj6lfho2kLLvj027GFUyh3VmzNiPBS1fKl319s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055803; c=relaxed/simple;
	bh=aNFoPhCzK98jZhwkTUn8Ng4tLog3h9ErdlG5j8XEi8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P4Wc/pHGPeew8hMUTYB6/kCRyg3s26ARwcqLTkqsJUSsC5iJYvzD9ce/D3Cf+Vc+l35/6udRlKmOjlRuHb5piu5QTwZpr9ltxw9ZcWbH3Q70e8vIpmi8KZm+N3IKkiUdySvkUcfSeknyeoe0VCFAvmxeyUqu1EaIK6a7Ip/6HN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZwfvJWbl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T2FEQIzd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612F6L2J1659531
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 18:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=coMCstee7sz
	aR5m5p6HnyI6xCasetiM+wXF6qx7XZKc=; b=ZwfvJWbl05rJkF43azl8gEzwJLP
	wfDisdYRdeRuxJyeTlXFRYRMA9sgZZCbTfdz/GRjy6mr76BRYY20BCG7SNEFmvEL
	UeitmEOf7hy1SR6NEqTVP56qPUCXDPFXXWj7CsaEZsafo9cxrsgJaHs86y5Ma4N1
	gWyaS9fjJRYR6KgDT0G0q3vLOEks1Q6flS4S81SzUo3itoSFbZOFexEF57tqZTM+
	wbnokE8bbGHRhEVpeyzaXG8iI0tKonMiLDqds4KowOU56JUdldjduL/oblpWv1V5
	qqdzYKhVFVpo8faY053FQnKzuv///PoiwLn2TrdFyt25siaGIJi66g7mu+w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c23h1m70y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:10:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f53036ac9so3876551b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770055800; x=1770660600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coMCstee7szaR5m5p6HnyI6xCasetiM+wXF6qx7XZKc=;
        b=T2FEQIzdLiEH3l8VzgjfwcQ62Tgpq6yeA0uacInxKo5cx35s1m3bhy3cb6Djw4jp7k
         89cAILX2t9lYcYOi1iljKMjiW3PJ4+7ZS50rszfTr1HUq8BnlNqIRTpfGVMvV8tDbw2V
         +6v+v5T1oUjmhizliR/qJvBB8p1K4EwOnW5s1x1eaV+dl/0ABgRNLnSzXT63w2OvL8nc
         sBSvk1NroNAHoWPzG2O6XPsy4pRhudjLqe2FIIr0TNAtsRKdNLBPaWUpfir/ztYV44yy
         rjk5tlUQ0L98XDLdvP8EyVTz41V46iE/2F2q4VsS9Eob9hzx8is30RUX2hO65drbeX62
         ItBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055800; x=1770660600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=coMCstee7szaR5m5p6HnyI6xCasetiM+wXF6qx7XZKc=;
        b=N71D282j+V33K6iMPB9qBdNrfpDoS7cI8q69nx7g4a4K0jMfK1PewSBdcVTZuH47s5
         Wkcs+biweFdREc/NwCITXQqP5wmrIH1/zuq7zJDs4fkSsv5WB8RlMxL2K3JqA06oeg+P
         zRXVmm2H6iUf5rluD5J6fU/aWq71APELFQiQ4rnUG67qoNJA3J9kbiKFFuMZve4yN7Ez
         ge02iosZw0nzeNUr3T6YUPfQ1PQDnxbC+8nfqjsH5KMLSFMYOLsggTi3NvkWdvif4kWt
         in50EA31R/G/t2YRUBfweOt7llk0adeovjUIqc1lxT5VtYqPk7INAFcQTWBvOOHkFjM1
         I4bg==
X-Forwarded-Encrypted: i=1; AJvYcCXV1CzugkmdnZ7AK/tD83LMVjB7bokj+g1gCoRj2wP7oYiYzsM1R6u/gAwUwPLcCjmqkv0a07jR4PdW/rwA@vger.kernel.org
X-Gm-Message-State: AOJu0YwboTqz11Wo2vLagyFNDUiC3JB2IhB6IDUMIJ/cmE7Tt8pSoeED
	yojiW+jEgzjUWDBcGdh+EIjfOs+K4A8s6nLuy58DER7N2POgemL9K+lhzYtWNrsD4U4dmozNgPk
	LLiO7sB/m8ICYHR5M7off+1GO6kj97mmd8nJAH4gTbK8D/D6169IavwwB3DyNrnHFT70i
X-Gm-Gg: AZuq6aJS7+zD9o5a5x9M6+ujaTdr9psVAwzOcmoybZQT2yx1/OZdPqIFedpjXQU3jSY
	lcLyRR7UH563EvVqlHVmoDVW+kN8qgjNAu8cDn2tJR2b+6E0r/w0ilcg0LM2IPFmvORz7IfHRCO
	9tEtrjw6GJBAKyBanJ1rOzld79xCkBBEZDvs7BJR2QFdQgPH6G6qq0snIRm9XmHDQcg+shaTiL8
	IV2INL2IP6No9YsH9f2kHN5xUMACOg7z+MC+1DWmafsn8PI/lxvdIm47Wgyg9LKgyHoIiixx7WS
	LjiRrx4wKcXOQ5k9mbPyZP4NMBf+CGWcsz4Rc22Sh9XpbaHE8NSgWn0LshT2HXX+SnHQRV2CH77
	hvQLsyQVttWBN863h4n7g0Sw21EbOgUX5aGrYENEC+/4=
X-Received: by 2002:a05:6a00:218e:b0:81c:717b:9d35 with SMTP id d2e1a72fcca58-823ab6be188mr12337611b3a.28.1770055800033;
        Mon, 02 Feb 2026 10:10:00 -0800 (PST)
X-Received: by 2002:a05:6a00:218e:b0:81c:717b:9d35 with SMTP id d2e1a72fcca58-823ab6be188mr12337588b3a.28.1770055799418;
        Mon, 02 Feb 2026 10:09:59 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm17476780b3a.40.2026.02.02.10.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:09:59 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
Subject: [PATCH v4 03/13] soc: qcom: geni-se: Introduce helper API for resource initialization
Date: Mon,  2 Feb 2026 23:39:12 +0530
Message-Id: <20260202180922.1692428-4-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OKTWOGcEIfnAlnCdylmL-7pzwXNwyrk-
X-Proofpoint-ORIG-GUID: OKTWOGcEIfnAlnCdylmL-7pzwXNwyrk-
X-Authority-Analysis: v=2.4 cv=Fu8IPmrq c=1 sm=1 tr=0 ts=6980e878 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OYYzyx7XpuDNtx8IVW4A:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MiBTYWx0ZWRfX0v51RwerT2ln
 7Jmhkbze1Uob3Gye4Y1iv/+G6R5/+k7ZR8VdXST0rJHFgMXuJYHrMp23ZxCgFO7dx3iKyl+B0iG
 tS8UTIl0JOza4ndj9fsV+mm82/2wBE9MFCBtdA1tUNDHuRC34YrZ7MQ5AIrX4evUvEUpdBZkj8n
 LtZNo19dG7HKrJlSOA+ddXKyhTkL+KgAOioiVfIp1AaDEcemZHHtL1ATa0e3o+HY5CiMbzNjJaf
 hPuQO3QRlzr9vB5iEPs84Qir24iRGqqqltZ0UZcOFgzOwN/3IVg5+MnCBp/uGpaaoUVnk8G7h/a
 QW2Q63vcCkh8aKI0n2O6uxhE/XeHZLrRmnpM4Ie33JWeJgTtua+tlkUfFz6lGsO1cTrtBVzU0fo
 xGOgX2yC3UfL5SfCuqUBMmQVdVUmlJwH//0WYbK8tny1nbJljyPmp6clopEK5WJuDKjlXfsurZ1
 rXiZThsrr1ic4WGklFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020142
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91539-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ED373CFF42
X-Rspamd-Action: no action

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently duplicate
code for initializing shared resources such as clocks and interconnect
paths.

Introduce a new helper API, geni_se_resources_init(), to centralize this
initialization logic, improving modularity and simplifying the probe
function.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1 -> v2:
From kernel test robot
- Updated proper return value for devm_pm_opp_set_clkname()
---
 drivers/soc/qcom/qcom-geni-se.c  | 47 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  6 ++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index b0542f836453..75e722cd1a94 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/soc/qcom/geni-se.h>
 
 /**
@@ -1012,6 +1013,52 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+/**
+ * geni_se_resources_init() - Initialize resources for a GENI SE device.
+ * @se: Pointer to the geni_se structure representing the GENI SE device.
+ *
+ * This function initializes various resources required by the GENI Serial Engine
+ * (SE) device, including clock resources (core and SE clocks), interconnect
+ * paths for communication.
+ * It retrieves optional and mandatory clock resources, adds an OF-based
+ * operating performance point (OPP) table, and sets up interconnect paths
+ * with default bandwidths. The function also sets a flag (`has_opp`) to
+ * indicate whether OPP support is available for the device.
+ *
+ * Return: 0 on success, or a negative errno on failure.
+ */
+int geni_se_resources_init(struct geni_se *se)
+{
+	int ret;
+
+	se->core_clk = devm_clk_get_optional(se->dev, "core");
+	if (IS_ERR(se->core_clk))
+		return dev_err_probe(se->dev, PTR_ERR(se->core_clk),
+				     "Failed to get optional core clk\n");
+
+	se->clk = devm_clk_get(se->dev, "se");
+	if (IS_ERR(se->clk) && !has_acpi_companion(se->dev))
+		return dev_err_probe(se->dev, PTR_ERR(se->clk),
+				     "Failed to get SE clk\n");
+
+	ret = devm_pm_opp_set_clkname(se->dev, "se");
+	if (ret)
+		return ret;
+
+	ret = devm_pm_opp_of_add_table(se->dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(se->dev, ret, "Failed to add OPP table\n");
+
+	se->has_opp = (ret == 0);
+
+	ret = geni_icc_get(se, "qup-memory");
+	if (ret)
+		return ret;
+
+	return geni_icc_set_bw_ab(se, GENI_DEFAULT_BW, GENI_DEFAULT_BW, GENI_DEFAULT_BW);
+}
+EXPORT_SYMBOL_GPL(geni_se_resources_init);
+
 /**
  * geni_find_protocol_fw() - Locate and validate SE firmware for a protocol.
  * @dev: Pointer to the device structure.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 980aabea2157..c182dd0f0bde 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -60,18 +60,22 @@ struct geni_icc_path {
  * @dev:		Pointer to the Serial Engine device
  * @wrapper:		Pointer to the parent QUP Wrapper core
  * @clk:		Handle to the core serial engine clock
+ * @core_clk:		Auxiliary clock, which may be required by a protocol
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @has_opp:		Indicates if OPP is supported
  */
 struct geni_se {
 	void __iomem *base;
 	struct device *dev;
 	struct geni_wrapper *wrapper;
 	struct clk *clk;
+	struct clk *core_clk;
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	bool has_opp;
 };
 
 /* Common SE registers */
@@ -535,6 +539,8 @@ int geni_icc_enable(struct geni_se *se);
 
 int geni_icc_disable(struct geni_se *se);
 
+int geni_se_resources_init(struct geni_se *se);
+
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
 #endif
 #endif
-- 
2.34.1


