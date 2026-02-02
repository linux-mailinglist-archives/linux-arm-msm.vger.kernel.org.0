Return-Path: <linux-arm-msm+bounces-91540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJUxDN3ogGleCAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:11:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8680ACFF66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 19:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D3A33006086
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 18:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607C938BF86;
	Mon,  2 Feb 2026 18:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFGdS8eP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtD/ALvP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4E038BF80
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770055811; cv=none; b=B64tMVRb15udjOCbdm1MZZBkA9rhxuFo4zlROOL+KluspFrIsnBXL9WOUcW7vzFec4UZTL8y73lC+WmbiYKE4KrcHjRZp2JmyFxuX9B2R2Zd+z4ToGaOXbuLtGDCDA6tIPNJx6TLNDqetHRjByRUEXmX04/BmsHaesyinsMmhHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770055811; c=relaxed/simple;
	bh=jI29xu22h/aOLZUcJch+Uw8kf8cbeFFY9Pk+gWe9Kig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eh0dzXw7MywESnZfFrQKzzZePT0m6lXuJVjBy3wDpbi5KkL0vgIWL9+XnOgbzoNZPN6hyY3qtKshUITVEIvyQJEE0DGBmtDOHbTesrGqCcj1DWmXDxbDjaWIm4hJM8zK/sMYm7aio05/nzkbHgSVPXXcUg6TLzCxif4nO7JhYww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFGdS8eP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtD/ALvP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B5K9r3459099
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 18:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qe3vIqAk4Km
	3Plesr4c+NFgSaiZDJPqNZPQYZwG4wuw=; b=AFGdS8eP37rD+sXQSFDnIkiieoI
	RGO9hMpu2rX1VsUB8eV5JtfkZ3ABWzot3jB35bcHWyhb2W/XpI3M4IOLr3vmrljk
	TnEbRmJXqK0G+ZU2VX4cssocaOSpasKbm0XBgHZydqjSglxjY6ikJPK6nC6NHAV8
	1aHji5BXQOMbpTjSfiJqtKbgaJzd9npec/zY36mtzAE3ngTMJFa25FH1UUssk3Ru
	PYeDFU9Dsg/Emwq4VQ1zWn2f6Qftuk1luokMimIDiII60MlOa7g5P7unVDa/igUO
	3dT7ycHKMIOMDYr/abTQZ2FUHUoOsCtu7WQTHBedTR9/CJcjZAJ7yr9AExw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbh9fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 18:10:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81eef665b49so11376366b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770055807; x=1770660607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe3vIqAk4Km3Plesr4c+NFgSaiZDJPqNZPQYZwG4wuw=;
        b=gtD/ALvPdVVyFOIW5s8VWjijwxxNRXW6hta0oJi5+bBoSYcQiCLRwnzkm/OUsPHq9E
         VFZtiS90Tl3pmy3V6rabbYwJ53eivVy/PH0oQ1QYD61DTKJk0bsXZ/dcHd17AZtFjile
         nvUn3s7Strdo9aoHuzDOlB1XPKCYTrQIbj2WKaupiVtKbmh9VBk2b5qE836rFuWJiljF
         vOU6SYB96Aa1EqA5AWL+qUb93PuiHS73Si3qsEhvS4T6dmyuhfsae2q3+bmr1C34mRXb
         gxcApizvhQxHg4nd0e4kt3oZN5YhW640wpaPhpAHY3+1Qv7UB2MatmBRDSYCsQjyf8ng
         2Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770055807; x=1770660607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qe3vIqAk4Km3Plesr4c+NFgSaiZDJPqNZPQYZwG4wuw=;
        b=LfJWaUxSrtwABbfERlB1orv9Kw2mXJQ/uAvTL5c/UJ95yFT2zKdYFUL+dZoTBDrnwc
         HB9cgfFF+tsoTSA53H9Hf6HF6QknM9teOStfN7VVrPKFGHxaF+aUJzg7VtWl0QZ8qWim
         WtDILl/8OCzw5MTHr32kyBHoFyISnXhcPbGLarA+h+mrawrY92WlcOp4ZzwABw5f1OVL
         c4qA/1nHPiDrxa1HKnSJrPfPgyQTOX5gH/iYG0vpw8ZcTkWcDxgjgF+eBOcQgWtTxtgp
         Aj3EYdFfWeL/W3TZjh+XBfxHctVsvbAEIzzFHB+HZhPKhVNAdRp6/+gZZN7rX85HEXmT
         D8DA==
X-Forwarded-Encrypted: i=1; AJvYcCXth3A8S1hz3ciSLsL81+ohA1CBTxRxQk6Wc/DiuxJXx4WHbfFPeBSH9IchYRzWfhPdxRvki4MyIDsz/r95@vger.kernel.org
X-Gm-Message-State: AOJu0Yw72OEkcrpy+mvuWqId4nRfrpSpfxtr3lCF0LToZGJ6Y5PxByuI
	raFZK7vFRLW2/PdvptahthQbhE/ImQijmp5DuMAmdo0AcCCOJWsM1DFAOWyzgHWbboWs2RZ1x+T
	zxQCLYmWJCtxqkUHy+SfY64c0/Hhur7w/35ILjNEICSCE8upsXAOisNzAcYBUootjpyZ1
X-Gm-Gg: AZuq6aKk8mcSlmbGgzI1T3ehU1ni/QI7hzRupeumM7USIUpOWig1bavGH2C4hMhyZAm
	+XrNe25BR+id7iefxpZ4EK8Ji/6jVRWR3wBKcy5Y96S8wGPo9Q2ku95kLuQuLUTS54Pw1V1ddBh
	6aP7Oet8aG+KWuHnp15oLf1GkMvWWIFCZpbjNh78vqw6EPjYJtBYx+xmL+ZKFQx+R2iluhfxgGC
	Q/dla9JXTNn4rE3OTYhoJLPim51Hf8Cp8PIwlsKk4tRe8m7SC2okhAJ4rX6Jv8XrGfBsE8sfqld
	/rHMwHN2oWqiAsMKDL4eDrIrQh1roW6nXXAzGS3kN8F+/ILI+1p4WLsapABnW4g2xChJzqtJGPL
	hjDrXIwlRz3Y6YuI+9pB+yk9FeUaH8XTGR27a7wCgCm8=
X-Received: by 2002:a05:6a00:2ea3:b0:823:1212:8e87 with SMTP id d2e1a72fcca58-823ab748a2amr10756603b3a.32.1770055807124;
        Mon, 02 Feb 2026 10:10:07 -0800 (PST)
X-Received: by 2002:a05:6a00:2ea3:b0:823:1212:8e87 with SMTP id d2e1a72fcca58-823ab748a2amr10756572b3a.32.1770055806518;
        Mon, 02 Feb 2026 10:10:06 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm17476780b3a.40.2026.02.02.10.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:10:06 -0800 (PST)
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
Subject: [PATCH v4 04/13] soc: qcom: geni-se: Handle core clk in geni_se_clks_off() and geni_se_clks_on()
Date: Mon,  2 Feb 2026 23:39:13 +0530
Message-Id: <20260202180922.1692428-5-praveen.talari@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: JXAUpCpmet6RhFF6sM4pi2IAfpFmuLX7
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6980e880 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fzsqq50RfsZR9heXkngA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: JXAUpCpmet6RhFF6sM4pi2IAfpFmuLX7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0MiBTYWx0ZWRfX/0vCaM5y/Quv
 NYTA5tJsPUlm53RGwjZoVgLoZdu9wipYJ8YFFDJRz2nhZIxJmKp+fUy878RffTEjGrjG3okJYuC
 g1mbnPZ1xtUF0m9BCwuJrjOsGxVWQQ2KOsqPVuqVj1rzNILqa2qmzLDnAUYqI7WP/vZsQFOnhAg
 F40Iv/xOVFqMXo1czY+dC1FErxENb8nyg+33cKRZ2N4IoyM68hQJ+m2V3coA6xVQG13u7djbCEb
 tsnIv145m+asP0D6OpccFQwOwEQc2/779tooO9+Dzr7VB9K4lz7mxheLqQAOvgOybtLuxHI74+Q
 Ux9tL6fNJOZYJMtrEn93Ecq+65LFwv8uq+n8gTu8gERe1YlP3QfrBocGdxrZ0/54ukhkk7yQRB8
 b2j+bW28AG1tZuFJBnjfUhYBIWjjcsXQed2fhsR+ACgu1EQYFTGMPTsKKrXrEAOA4NIkE88EIg/
 FgD9iW8GNig8gzA9TNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020142
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
	TAGGED_FROM(0.00)[bounces-91540-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8680ACFF66
X-Rspamd-Action: no action

Currently, core clk is handled individually in protocol drivers like
the I2C driver. Move this clock management to the common clock APIs
(geni_se_clks_on/off) that are already present in the common GENI SE
driver to maintain consistency across all protocol drivers.

Core clk is now properly managed alongside the other clocks (se->clk
and wrapper clocks) in the fundamental clock control functions,
eliminating the need for individual protocol drivers to handle this
clock separately.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 75e722cd1a94..2e41595ff912 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -583,6 +583,7 @@ static void geni_se_clks_off(struct geni_se *se)
 
 	clk_disable_unprepare(se->clk);
 	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
+	clk_disable_unprepare(se->core_clk);
 }
 
 /**
@@ -619,7 +620,18 @@ static int geni_se_clks_on(struct geni_se *se)
 
 	ret = clk_prepare_enable(se->clk);
 	if (ret)
-		clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
+		goto err_bulk_clks;
+
+	ret = clk_prepare_enable(se->core_clk);
+	if (ret)
+		goto err_se_clk;
+
+	return 0;
+
+err_se_clk:
+	clk_disable_unprepare(se->clk);
+err_bulk_clks:
+	clk_bulk_disable_unprepare(wrapper->num_clks, wrapper->clks);
 	return ret;
 }
 
-- 
2.34.1


