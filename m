Return-Path: <linux-arm-msm+bounces-92083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ec4Me0ohmmtKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:46:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C77E101562
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4134E308DB90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 17:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B03742189B;
	Fri,  6 Feb 2026 17:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K7YKkf7c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CyPGBzov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF4441325D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 17:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399705; cv=none; b=VEIU+8WYz2UZI/7tbuTXFLfw9MY1oknr36HYfraPU4r5NLBC1GTOYszBeuu0hF/eiVWlRDtiaWE3jWhGeQJFt/K40kCKTb2KGoXNGwqCK+N7ABoW6ZGHh5UMssUi66W6qcCeOpnl35E2fco20aZ18Kv7QAwtmO2fVaYh6J8rdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399705; c=relaxed/simple;
	bh=ugzI2X4T4Eu6du95zdaOBWO3+LJFBYSONj4KCG0BUk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LI3/vAAQFI/3Ln9RfgoL9Vbvg4i0/r9igSXfNIxQdymNpv1b9s7dr3t2Jbw07XoO9IDUDo7suEAo7K+WuCszwfStgM62lneuWm6L4WTtnqdOzsXaS4Z+Ibt1BPCz2Fk2nm5Y1KlXcwf4k7V2zrckoOrAzbegIW43mIbN4T0QPRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K7YKkf7c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyPGBzov; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616EpED91852782
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 17:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=slQCzeC9waI
	6hA1xDFtb4CgPu+7qSKt+eKegC+Sl/tk=; b=K7YKkf7cErmTavUwI7SKaJQ9v/D
	QQkQGBhiXb1/ldL41nvpjRelbComZ1GsQo22ZtuRBA7l+TlkPMYOt3fPjvLnBCud
	x2rAH4CwiSrBlmHDBqyekg8EfYeec4ZMzjBeAkikpHEjENljh2AX0Tmt0eZud6Qg
	DCm7IHslIkUDuviuhSlE6KTvOLooe82eUMo+89BO74fNBGhPozb1H+CkBXIutlS3
	DUjrz0ohSdA8++FO0hTs/WqRvgH+CF7rDF0wcM39CldjfrWoaFJFXnoUGIaTf5GI
	FtTGki7kui3mKUtJqoJ2gy0nTiZJYD6rScxh/kpzjDrbxSjjOAXXW2Vu9kQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c149t3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 17:41:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a946c0e441so20498275ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770399704; x=1771004504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slQCzeC9waI6hA1xDFtb4CgPu+7qSKt+eKegC+Sl/tk=;
        b=CyPGBzovAvAPdyvgiHCtdUSEDKJAG7Av3qG0K0cAQoFuzYVobDAs7T+Wy3E64each+
         VcL3om384uMm7UWMWoolSM0Z5Wx9vh824/GzxUe4UYYzH892uWbUzsgSe9iZnACDTUFS
         NHCRxdzsx6dgf0xfnhXTpbkGFbaM1xr4gCuRg7w4riqEEKzJT9bTFKeiKKatdqmdmHLk
         /pXBo7cEzje5Lwm93DKLrtg8GirP7VZQN0za44JIxJXXmpiS5xhDUWX9hOKLOEzIWuHp
         KdTVF08VgI0YRvbE4F1P5VQsDCBHn70zq+rxX5qdvryaHxN0zf4oNV6HpUq19VP1eQUC
         VFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399704; x=1771004504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slQCzeC9waI6hA1xDFtb4CgPu+7qSKt+eKegC+Sl/tk=;
        b=a1N/Xrie4GoVwcTrIInMCxpARIiFo5uDa0CqUQ8ukh2Znq7i1R2ZToT4nAvETom4HO
         1yFGg8+SQPTHz46Eit/FUAfeBZedUPlhArfnBRKZtDvQ6p8JVE3k0kMfqOa5PJWo4tjy
         u7KB//8V/gHuDhYH1c1MTIoiMRw17DeeJvUizLMhkQUKSWItTLUlz7OWBzusab/V/PRu
         x/LgmlvHG2Ld/StcOPdXFVifalgE7QAPXtIkSyUM1yz7WTQVpr5t7GbSzAnWNOc0oWIV
         MVxAZm0ERb2UiPcHNZGdTmhb5SwPEGgHkN55hwz9rQN9kaxmmG3kk3bxwOLqYq6YUvgO
         Qw5g==
X-Forwarded-Encrypted: i=1; AJvYcCWsD62rc0RdSuxJc+NhDNeAcgwH1UFD2FBCVLkSu5yIaUFVk3jcMjD0usEw6yxJfX+5MDW9c+q0A93VOZ/J@vger.kernel.org
X-Gm-Message-State: AOJu0YxwoxcehPK4fpdy4ArWxIezHCHuVVmV3ltSjMjt493dv5/5TrjM
	16Of7Uv6xNQfCsOu4oQpwADmXDNKAG2mAK3pUNRCoWQpriMo/eXKAPzl+gjLGlBVyjgI+3QXppK
	7dTspEzj3dJc7moIAmridC8O4LXeb1LcKzQMMmVUaFGBGKj9Nr9CWK6ezR5NrN4fnTZik
X-Gm-Gg: AZuq6aIt2N+KlpHtHvahytG8DDTqD69H4iiruePDP1VXAFNFJlFvCdJfr1yTC26PJIh
	b82zRPU3jqYHAzsZPIh8recoPOe5CGGh6timnjNpxPI9tqVMojYqsHGaDgGI8g7TGXuodXvR6KN
	cUe0qH9+Ae2f74GKOL3RktOkL7boPAoYHzcNi3o4a4l4xhRE7wZnGD4w+NNTgNy1FpXtD92ZVcB
	vY4CUBga+YlLRFtgKEKAZFNLw4kogcDCXoyGqvO3yWbih6DfVm//7YJgQRZKyCRNCkXDsxdkIU5
	W6p5SjeNPBU6R36GWZ4fEWPxJLMWxDVnOljRZa400jk7cEHwdop4Dq+QjCAqWxLsFVyspMbrgP+
	iQPByTpaluIkV03VHC+O2fhi31D6bZDz2pyxvXRe9x70=
X-Received: by 2002:a05:6a20:2586:b0:392:e81f:6711 with SMTP id adf61e73a8af0-393acfb10aemr3598680637.8.1770399704405;
        Fri, 06 Feb 2026 09:41:44 -0800 (PST)
X-Received: by 2002:a05:6a20:2586:b0:392:e81f:6711 with SMTP id adf61e73a8af0-393acfb10aemr3598642637.8.1770399703828;
        Fri, 06 Feb 2026 09:41:43 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5eccbdsm2639387a12.19.2026.02.06.09.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:41:43 -0800 (PST)
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
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
Subject: [PATCH v5 03/13] soc: qcom: geni-se: Introduce helper API for resource initialization
Date: Fri,  6 Feb 2026 23:11:02 +0530
Message-Id: <20260206174112.4149893-4-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=698627d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=OYYzyx7XpuDNtx8IVW4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEyOSBTYWx0ZWRfX1ppKW5msgk2Y
 irAwUzm5eclHOa0QXxjexbASXaPEdfZlJm8l4bWslcjX0YfUZlgd3vfS4mt4x723oD5KR36Ns+0
 JSOp3vTRIhoSefsthT59shyCgEV6a3+M5Q+mJ4vtzeEvw9h2UsKqZUiSsEgg2AhUaWYe5awVahm
 0DaThcnyr9JsrCnWCbKp7ofKaNu7xMDD6q/kJCe6zEeqGWEpQBDooDqHOXvmrAQb4DnKBMP+1zQ
 5cTanUAgzERJZnm48L9J5w3bKfEEWzuZv+jCO3l80LoxeCCoyK33hERz8vQThq7Ns8jTQOFXflU
 /pqHVPcpJrjeX4MgNemLmtjFaI0Buqu0Bea+TUwlFUEtiGhewWuWlRvJCxdlK+uU6wtAfPdiU60
 ehjE+MYfxnkg2sJAuZT/wtX2eiNgf29UGC2z9OQrdscJtnfNkHOSEZQjX7OQaDK3NNyTUJym9s1
 7WpxboLo0ShhuGwYC2Q==
X-Proofpoint-ORIG-GUID: vNzGkja1Eq0a2qmMrg0R3eBIu5YPZWxJ
X-Proofpoint-GUID: vNzGkja1Eq0a2qmMrg0R3eBIu5YPZWxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-92083-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C77E101562
X-Rspamd-Action: no action

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently duplicate
code for initializing shared resources such as clocks and interconnect
paths.

Introduce a new helper API, geni_se_resources_init(), to centralize this
initialization logic, improving modularity and simplifying the probe
function.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v4 -> v5:
- Added a Reviewed-by tag

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


