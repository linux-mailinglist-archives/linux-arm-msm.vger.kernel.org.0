Return-Path: <linux-arm-msm+bounces-107816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPWELH8CB2qVqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:24:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A154E59C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 13:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A70E31E16E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 10:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AC247D924;
	Fri, 15 May 2026 10:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSzHlZC+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a37i1ItI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F1347A0A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778842621; cv=none; b=le3iqNOEAo9lgPSIF+RVz0F6XNtrjWho/fo2pc1iLiZ62ZQ7xfXLuJu2idoWqstNC3slQHsOLSnsFBOJKNrKjAdk4/Bs1D9mtPUaIQf4d7cecEvxYdutHYWthJm+eUun6k4n1059zfOqoY/bG9rAHdtUKXYa7PcItoQT6N9jiYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778842621; c=relaxed/simple;
	bh=nCzaPtOgAzOu6WMMaUkEsvKLphsm8vVsM68gBNmWkoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWSZ2kohAFn85DuZh3hYv+0cYsbtFLDJLpZSHVFmoKdy+wt79mqOqVXrnMCKw0Dg//ObUa5xUWBjWYTIstI0rurHurpNMxv7THBdpv9w56MCeHycjQ+MvtLkoRxdEBMFA4aPvrlPthKf2mFahZvM9etI9EH7b2d79NhKmAzFgDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSzHlZC+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a37i1ItI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4w3hn4021430
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=; b=YSzHlZC+KJyWTagj
	pqBIz5MH4Cbm0H4eRUy4PEitQjqumSG5pJ3c2EwLg1XLXSsLo/uVSJEMjpSWEjlF
	SSi7G/dK9l5sEoSfRaHlFkQne/rD6+TxNzhyTMuOkWrixxzy9w8mrX7DupJuRVIz
	oD8sL77x1RlPzQgHuC1kR4WF7LCVafGtKc1gtRcxO3I1qVi/s3ynvIsPufIROMum
	hCF8j7vak4U7cErbj7WYVSD4c9rmcoH3Ql92Bf1KGLnMTZuVnWnNOndzfpWn8Sjb
	0W+wls7ethNTOYMhFc0H3HZNYMs/OHsX6p06JCBJTck4LJFKjg9tXAuOj0jb0vOH
	g4j8SQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1rtxrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:56:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e136aff17so50960051cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778842617; x=1779447417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=a37i1ItIFdC7U9E+s8ljT7H8qv5Q6FPyEBXRhy/lhoHb1rqBt9jUHKLDRfB6lnnEOz
         wllrHiDm4a7gwTNoT8B150AQbGuVnulupkZ4OtMa3Kd11vK+Sh+xw1GA++tGcXqMJEjC
         wnuffPXMgaL1LswvqcXPl90P3D6ZLKhA2mm+5McJwy/4AjmnYtKCIDi7GNwdjEeKY7zi
         VCAJrCHwLysUAq3c0E9t0OJR4lXt1/qps61qDruZeNX5H+Xe0kHwS12SV7jsPw9P6Qz5
         0+oIMILs+8241RLObrUCBtPHVtQLiHLZDgR2K9g/acSEiG9EoNT2xJVM6n/lhxsJEWQk
         STWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842617; x=1779447417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=fmMjIGVDGs4GQ5T5q8SV6LcB3d9cU+LhPbGa1Ymj+GdOo3XY5ChIYMUJ/WgCW7Udaf
         ELzAyAq3KPL7e9csEGjWeHjyYESwFa6pCHH19DBlXieuiay9Fhdzv3NxKvrAnNiU8vbP
         WNO98XDHb5H7XLEd6nQFa1v/vvznStFjkKHwlyU+/mDWYjExMZGGoWjDGK7xoJSqVd2i
         O4j6SUN/vzVhJRhgjM2Catoy95XPSYjsbHv0zufYej1MCUoJi11BYiunzyT53kS7zaZ+
         XirJR57XGcupkhKrTJDve7GIR7mCgzA/xNeB4MzOh1LOC2L70alOvLDZ8Z78dR4oXJeX
         6I5w==
X-Forwarded-Encrypted: i=1; AFNElJ+eJ9qJRgZ9EulK5NMJ665P/aE6P+KCgJDdbxUGqJW66F2pCoYN+u2VcDzBR2wVFvi32/i11mW/4F1ggdGK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1GH1YmiNrMZWPCbQv3r9ed+EcUiXeD3a2Czctq6bTvMg0st5
	ypkULi7bTOkQJRqD4LmEZq2ft1q/OmpHvyk5PvprjrF+R6rnicf0UNAf4zyEA4O/5X6vtVHmt8w
	B+9tFy9YD2B0AeB495xbvddQBURlI8E8tZIYpasjLWBXPW8DpCsaJcRw/YvpRNbPu3Sx2
X-Gm-Gg: Acq92OEKL4KzkHvFUNjNJip6VHcG15Q9lpt4k4soB5HB6OrAMIGBjFDXahyrcUQYV56
	WqLoUblZSRPW+qkJdxF6Q5+2nCwXpRqupA3A/PYgq+0ybz5EK65smwo/lxz349oYbchTahL4N6f
	ULCrXHpjDhbvVj7V/tYfSg5HlCapHbo8F+T9Q9wW8e2NMukYg+CPYTn8FLi3oZFYkGQMSmrDAON
	pnrnQIoK5KKYvibDYy99838FKMecIf89/FwvHxnXzQHZ0X/IpQjmTRaPcbZmSGlDaMYQeBKY19C
	lDLui7yc0Tmh90eXOAyw2CB0ccxErZr3IpcuX7+eIyL04Zxa4uh0+xbiC14ZOr5prDbum8ZjTI7
	wrSKcVQsTflE0ZCxKjZaBfauZ71Ug40YWJYhLBVMQUHk7Xkb6TXJMsv8bBpljHqZ77whzTUzFaj
	Pqv7GCRG2XpDC+fCqzkOg3f8gUuePaEFMAXeM=
X-Received: by 2002:a05:622a:588a:b0:514:6683:2f4c with SMTP id d75a77b69052e-5165a0d1b3amr42057741cf.39.1778842617481;
        Fri, 15 May 2026 03:56:57 -0700 (PDT)
X-Received: by 2002:a05:622a:588a:b0:514:6683:2f4c with SMTP id d75a77b69052e-5165a0d1b3amr42057411cf.39.1778842617086;
        Fri, 15 May 2026 03:56:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91e2b6db9sm1240195e87.84.2026.05.15.03.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:56:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 13:56:38 +0300
Subject: [PATCH v7 4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-sc8280xp-v7-4-2e21f6db1897@oss.qualcomm.com>
References: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
In-Reply-To: <20260515-iris-sc8280xp-v7-0-2e21f6db1897@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=leB8+LKvE7kUH/wvPz6CoXenJFqROgu4EIFsX585OSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBvvxzorg6mpVTt6wzfzmKEHOA97/fPPiuScBF
 I0yPPeAxjeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagb78QAKCRCLPIo+Aiko
 1b+OB/9Z3LS8g2BvuqWqR5uDR7+cJiH+mwhFIpP46QZsgz83QWMhf7wmOutCQb+7rCwvvmmCPYK
 X8iHqgfdVt/k4DCZ+vEyq4chvuJTdWAZU13FrYy0m0MyUF4MBJ+x+BnZB0obH8NbXUVEckk605F
 K1lj6S7/qRaDnjStpxlGQg2VQa9zRInyRg8JpiSqyqwKjZV7nvMSqCP2kjrcJUh2qeLwhJP0RlD
 AYais/TI/HoLndnRCQGnWH9xJd1tF9orYnF/B5db0SUkDt6aoCXsbtGncXvjO2vYW08YND1GNY0
 qAgd7dCiMRNyRQSvajrlH+4LClW4PpoB4PQIEalF0Wf7Ly3t
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SEV_SpvhQpDPk-tEByg7z_sN8Zi4CKeF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMCBTYWx0ZWRfXwt/s0SHsPefE
 G3GeBHJlqdIE/VO5EqwbNEFhaK0Gg0amAk3wsJiChVoQusv0ansUocmMbfiiYQHd2UglIRvBNGr
 kbpDsLvEmGtX9iCFOF/gpV5gF4CiohADyP/+N8jpQu4Hmlrdoeji5g9WowPVkDrOe3vnnbyqfd2
 Opdb7yRMQy3p/2VQN1rxhPh28kXAmAj5sVLFqR2+jNGunTrCuG7ylxsV0Kai80a9cjVBq4NeyJ+
 BRKbFTXev5KFO2RbxXmNi1F843C1RSp9IjsAaMMR0+Yux3AiJuQy/UhI5T7GXxK84Wmx3VHr/wP
 XoU0axtXSKA2vYlS1QK3T1qSAUn/pUlE0rDSZLaTFE78H2bOpC+S1+4xcoMIduL7itTtGvkHdX/
 uc1qU8DLbGJcWRYSqodjHEaANKy2IkkUoSR4phleiNnJ8j9J70aavmCJnDLs5YfKfQQlPZrGY3Y
 ZXeWHirEOZ4l4ndkAhA==
X-Proofpoint-ORIG-GUID: SEV_SpvhQpDPk-tEByg7z_sN8Zi4CKeF
X-Authority-Analysis: v=2.4 cv=JPELdcKb c=1 sm=1 tr=0 ts=6a06fbfa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ie9TG8L8bN-JZtJQupEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150110
X-Rspamd-Queue-Id: 3C5A154E59C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107816-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,0.0.0.68:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Iris and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0eab03495b8a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -932,6 +932,12 @@ keyboard@68 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

-- 
2.47.3


