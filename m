Return-Path: <linux-arm-msm+bounces-92086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKrfNz4ohmmLKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:43:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09170101436
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 18:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09A76300D57A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 17:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55F0B41C2EE;
	Fri,  6 Feb 2026 17:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dS0HqYh8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ny8Muqqj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C3C421883
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 17:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399730; cv=none; b=eT98oINslD8KFkS/7eikSwqr6NPnUnRLVQpFhZKwaoL5mIKArYZH1ruAQ9/26THPxPkI/ibKGd2XUMIIAtP6coKmpxbr0ZXus1wL7eIwE2vuP6/1cJkiYjKhjUEQ+iqG0Uq3LPtnbvPOojWJ2nxXIyaqSg/0vhx/uZ4OXzIatM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399730; c=relaxed/simple;
	bh=ga6zv2X08xWdzWRz3TuiP7Yq07BTW+J17Yasvwfw7GM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=um999RjQM8z00JIUHSE9xYUTKqPSC+LNisXGIAqb2Ei2eT87GajCpiwdvwrd4ogKqjRO+krTjluAHmC7kK1fAqcf4bkfzoA86BYzQJYPKVp0+CtSn/kmDM4AsPQwYRMDhEBkk2KvYDzcKWv1pMluHCbRna0esQhE5WX1l97MGC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dS0HqYh8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ny8Muqqj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 616H72Hr3924302
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 17:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6g1n4zS8IqK
	CO/ZoCH8PjgZhBqCIfpcPG7bciUpyApU=; b=dS0HqYh8o0eJs/EnS0cBl0I5WEx
	cnBp3ZngbaUQpnxMkkTKmcYGXCu6aLFaMotHWb0zWnRdaXZvFL6dlSZLGFuotKYc
	s4NI15/1ZQDuWTEJkVY6/g50py/DWvzQP9walvPz1LJH1WdgnnLqUuLZPpLJPTt+
	RV4k+dRgduWyOHQ9Rs39b9pQ3spnCpBzZH3zNmMyUkxr53HtTdngpswW8HUv/fhI
	Yhzj1sSNrN9Co84C8VtQz9+SuWciCiC0OYCW8+ZhBIa5yqkLxTROdW/mtkpbf+7S
	ZjQp0H6xMTBnMbWDr/3yU0Fr9Fdbf4R2Kj7l2XCEjueplS5UFYWsw0mvzmw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5mdur30b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 17:42:08 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354c0eb08ceso805831a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770399727; x=1771004527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6g1n4zS8IqKCO/ZoCH8PjgZhBqCIfpcPG7bciUpyApU=;
        b=Ny8MuqqjB2Zdvz6FNY946K02lRB1sb2zKqZGAxAZ2DX+RoZA4kuWj9aNSeM0r8OiEb
         rTnly5MpxunvgVTToo7lU6QfP/BsUoj+51EUvQKJVYXiXfCCUmovEq8tzMByODGmogNh
         agDE5PW1tk3CLGDZXVFyLonF6OLqI93QsM1POMlOzRtFH9T18mzv9PsC+UdkSJ7kfFkn
         7AGdVWCxnoZ2fmKH2bCCQHdeOyOIw6KTfT+2sTSJ/corIGWGARIZJnCD57vOI/OnFXDL
         ptIwR6IrcHpSQ9gtv6U7KC1HorghX76bGiPJ1CqmjWcnlikpVXYuyV8QVnSuoz4ZLczF
         cuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399727; x=1771004527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6g1n4zS8IqKCO/ZoCH8PjgZhBqCIfpcPG7bciUpyApU=;
        b=lmYKE1Sfi5uMIUGc4wGqHJlM50stGj76cbjhLvjJe1xM3+ayc6NE/keuplJqhx3ZVU
         5ugeFe0F/+lbyfRjBkDGbOXoNIMwOLzchKdDMAob//4F0IFU/JUCA9mbQbx4t2al0dTU
         +HvSYIYVQ0zv91t4rUMXYOmamWhzi5LewyG44aZ7S5fEPIVZLI55oB/NPTaRLd9Ufmr2
         eDNpHojXiyScfL2dFtqF5H+QBJOR/lSmQbOswX6RGgK15ER9OmC3Ef2SGcpmfpKlBhBh
         ujb7AU67yiJhLFgsmKAp2YhBnv9djlhpon+BvNrRVHUQfcpdNDSAFelMY+dLNJ2UF49f
         MUFg==
X-Forwarded-Encrypted: i=1; AJvYcCXSCBuoT/7zchjYi7TtN50sM6XEknsQuvLrwoNUEFEt0d78WUEVk36PeolPOPXmigVCbCj+pLyOV8H5b5m+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0YCPBCLOMsiPYY5tZfEVFUedCUEcjo4nN7WsSxnerNItvLqpC
	8d5UNFzEWUYPg5LhoxIxmrUMItxJPNYtOkfA1K9KmHOgkTGG93s+4Phlds2GQZpGKlUrzJNyBMm
	W0spCLZBlvms2LnEaP4163k+mH/bLFUvEPoQk1mU9Ye6sseNBPPQ2a07t0SR+QfwgkRygg7UD74
	Ub
X-Gm-Gg: AZuq6aJR0QFEzXfX8vlcBUIkdpJG2a79mmlnu0RVPzCpQlN0qd0LdOeXwm5sgf8QbHj
	31eFlXVUYdgISXsRxofN9CmTkgXw4iiQSEvzszWK4ZDZxgzwmK69JGRYEJtEHUHkhnqBvsb4nSQ
	R7PcvHqe7N7uTq4WdxkDeoVe45X2jrqro+R+p15/b3DA9VNM3V/zwSPwAb/pd8ZMmZ7jXtMUEw6
	84joSQtqPc1nokFrzAb6jH3/Bwm8ZI09L1vXTlLEHAYU5S1fhPsfO8uVHtRxlCCdDPfCFq2jkrK
	dv9K/Pk3VdK7HyaGcV6iVibF+igqnymqwZvl1yYrfLfjhVBN31hQ8moW9m8OXXAHggRsU4AhK6S
	sIyqllOsM9zhhlG1C4dt8rGiPcQASkh8GUWX7KkvU1PE=
X-Received: by 2002:a17:90b:2cc7:b0:32b:c9c0:2a11 with SMTP id 98e67ed59e1d1-354b3c41887mr3034801a91.4.1770399727533;
        Fri, 06 Feb 2026 09:42:07 -0800 (PST)
X-Received: by 2002:a17:90b:2cc7:b0:32b:c9c0:2a11 with SMTP id 98e67ed59e1d1-354b3c41887mr3034767a91.4.1770399726839;
        Fri, 06 Feb 2026 09:42:06 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5eccbdsm2639387a12.19.2026.02.06.09.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:42:06 -0800 (PST)
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
Subject: [PATCH v5 06/13] soc: qcom: geni-se: Introduce helper API for attaching power domains
Date: Fri,  6 Feb 2026 23:11:05 +0530
Message-Id: <20260206174112.4149893-7-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 4tMNeQ2qBxpvWiXcvq7wtZ_aDD_cRIGZ
X-Authority-Analysis: v=2.4 cv=Nu7cssdJ c=1 sm=1 tr=0 ts=698627f0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=WUWHbvwt6nHlCWk_UTEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 4tMNeQ2qBxpvWiXcvq7wtZ_aDD_cRIGZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDEyOSBTYWx0ZWRfX9Gw5JY7KJ1EZ
 /m+9hwdWUJ4ONZtHP7hrN4AX8/5X5/5kj9IbGyAltzLxpGnvF+9BklbQUdfySjcTVFgTfGEmB31
 3baF2jUJMHAaVqMK2FaFGYVaOjFRtbVsu+lirrf/d8AoYXUGMY0EagV371UIVBQj3htmGG/CgUd
 cgEJt5rUNkMQWqRe5Ex/aSJqERe08UnqOXygGQGbL6owfdyZXES+OX9ViOVL134dmtElGe1k9Qw
 myEKTppIYnUydjPluYah16ua1AnnoZVFD8GTZQdZVgs/QeTynvfrJydRQpV1wjftNpqsviq5vdY
 ZzfZD/1Gjj9IKvkNEkFOTG7E/GRkUrk0cQUW3zeMMUk81pZzdTG5zqWjWXsqcjy8zhTz/vXXFQQ
 aAFU6VkwOb9zterw33rTT4FLWRDcJmm7H4vWyfmDZwz6vMJxAw+B7giW+CUGkEvlmWApncxejH/
 pvVQyAWl2WiSI5my8PQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92086-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09170101436
X-Rspamd-Action: no action

The GENI Serial Engine drivers (I2C, SPI, and SERIAL) currently handle
the attachment of power domains. This often leads to duplicated code
logic across different driver probe functions.

Introduce a new helper API, geni_se_domain_attach(), to centralize
the logic for attaching "power" and "perf" domains to the GENI SE
device.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v4->v5
Konrad
- Used devm_pm_domain_attach_list()

v3->v4
Konrad
- Updated function documentation
---
 drivers/soc/qcom/qcom-geni-se.c  | 29 +++++++++++++++++++++++++++++
 include/linux/soc/qcom/geni-se.h |  4 ++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 4bd4fce33ea4..ecac9006acdd 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -19,6 +19,7 @@
 #include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
 #include <linux/soc/qcom/geni-se.h>
 
@@ -1092,6 +1093,34 @@ int geni_se_resources_activate(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_se_resources_activate);
 
+/**
+ * geni_se_domain_attach() - Attach power domains to a GENI SE device.
+ * @se: Pointer to the geni_se structure representing the GENI SE device.
+ *
+ * This function attaches the power domains ("power" and "perf") required
+ * in the SCMI auto-VM environment to the GENI Serial Engine device. It
+ * initializes se->pd_list with the attached domains.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int geni_se_domain_attach(struct geni_se *se)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+		.pd_names = (const char*[]) { "power", "perf" },
+		.num_pd_names = 2,
+	};
+	int ret;
+
+	ret = devm_pm_domain_attach_list(se->dev,
+					 &pd_data, &se->pd_list);
+	if (ret <= 0)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(geni_se_domain_attach);
+
 /**
  * geni_se_resources_init() - Initialize resources for a GENI SE device.
  * @se: Pointer to the geni_se structure representing the GENI SE device.
diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
index 36a68149345c..5f75159c5531 100644
--- a/include/linux/soc/qcom/geni-se.h
+++ b/include/linux/soc/qcom/geni-se.h
@@ -64,6 +64,7 @@ struct geni_icc_path {
  * @num_clk_levels:	Number of valid clock levels in clk_perf_tbl
  * @clk_perf_tbl:	Table of clock frequency input to serial engine clock
  * @icc_paths:		Array of ICC paths for SE
+ * @pd_list:		Power domain list for managing power domains
  * @has_opp:		Indicates if OPP is supported
  */
 struct geni_se {
@@ -75,6 +76,7 @@ struct geni_se {
 	unsigned int num_clk_levels;
 	unsigned long *clk_perf_tbl;
 	struct geni_icc_path icc_paths[3];
+	struct dev_pm_domain_list *pd_list;
 	bool has_opp;
 };
 
@@ -546,5 +548,7 @@ int geni_se_resources_activate(struct geni_se *se);
 int geni_se_resources_deactivate(struct geni_se *se);
 
 int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
+
+int geni_se_domain_attach(struct geni_se *se);
 #endif
 #endif
-- 
2.34.1


