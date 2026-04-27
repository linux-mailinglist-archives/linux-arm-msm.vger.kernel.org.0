Return-Path: <linux-arm-msm+bounces-104585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J5kOwi77mkPxQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:25:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DCC46BE53
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 03:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28D3D3001A6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 01:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C237B23A99F;
	Mon, 27 Apr 2026 01:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGFXMpFr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsjVCKdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3933175A81
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777253123; cv=none; b=rwB6iuGRmqjxo+8f9s0NH+5/M69ScDgajKj00UWLWq1ieoJpwg36pRieR3MHw4Nv/aJmAFbux9/2+wkUtfJSDkI4vS4jQtHGxOLj8xIZvvRT4uw27s7WTDY+PzuiO+g/KIGeigwwICqjtjEUFh33shea4o/pE4+tc+xjFtDYUmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777253123; c=relaxed/simple;
	bh=iPqFCkAym8p2q+8FMt6XiYG4OdymDNhtxZKPxYd4lLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tdC1/RTvupQNxERaFFXv1Af1v2aNauhoNIq6PL9iqjT1CWNm4PevfLuEz5vouMfXond/UgkSDdbgRTJ+VuiforCxGczGWM4IBAXJzljqeS0LxeltW5+GvFExZuly1waGykvNyxS05PZhRYLILQ+ZNP53kT5RkdPDLYGL7uvMSIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGFXMpFr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsjVCKdw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QI9OGv1887722
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kom1YsRIYEzqfzikMJDUOQNp7yGZKM5G3G3
	kvTtUT/E=; b=LGFXMpFrCO9dT9hWLHfRBWwtM8n0pRvKmHBZy84kxxZpz4+pA/7
	/RR14pbYtByXEuRILIGA+vviLPw4gXN8eiQl6icVcaAnk1/5y75sIRTujKw4mamK
	pIuDT2F3Jgga25Bb8yNEGw+WHyQroKe6PwM1WTTFHqHRI68d60CzhTwHWwuzYeY7
	9GpK0b0ixe3dsZ741OXzqF3vPEPktc/aRE4M5bcQfHErA+UbgpwRIMg3kqHEbnvZ
	a8bzML3nBOuWknImXH9ZBGUf6KH8WnlNpKfBISEoh/52ohBGg8SakmyiR8/dvi8e
	NPNVp5e4fIlhDFA6njxraa2vGGbg9RHM2lg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgurvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 01:25:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2de07c12745so29340814eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 18:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777253120; x=1777857920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kom1YsRIYEzqfzikMJDUOQNp7yGZKM5G3G3kvTtUT/E=;
        b=gsjVCKdwP5m1MAFesmCQnpdv+WwAVgmPe2zywLNJSjw5pRArIvNwBZhGZg5OuMXRsV
         VD6Gjn4M5nvKB9kj6IaSPwTR4tXkx4l6hJnceDoTK7tfcS8gdjCYUdadWVnwk0ndae1N
         CUQvW5wMEDQd1kmTWuCGyo2q+J2Ss9E1/g2qIVX4zMlUC0BNmXDUkX9K0Z98D01P8Et9
         pep8UYdvVEgcEAoO2vmeeX4r3rUzDi0e+ECGToe4JhYeXh+kCmCvMv9zMaEX78tMfYdG
         HSZ3zL3UHEjoKNff76tv3We3a2KPuW1SdaalI5KyI/E6vHeaeM1IkjrfnqsNV8WhL7Xi
         JT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777253120; x=1777857920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kom1YsRIYEzqfzikMJDUOQNp7yGZKM5G3G3kvTtUT/E=;
        b=i9O6nEsjljUvHRFpPRTW3jzHprC3BMb4yThiZZf4AdRxapKc51qbcwF2Vt8eeC3qLR
         XeKdVIfEUaynM+7EExnn8G3MAut0fnCLCVU2xL4sHrfh3k5nyoB+Q2gW4/o8bg+uQox9
         KD36gmOwAxq8yZRCXO/o6ZQWwXF2tcg/Ofi/Qwtdb4SM3U1F18DGY0tkwbndqoNnaOt0
         5P1OLpxMRqYT+EL5HYvnSt60Khz43gAfk0tC333s9D6ivtloviHDS4ch4pQi1FulI1sf
         fc7TfF+Pmbohyj/2ZGa9WfV3a4bIgSpcopKb0IENTHdM/moMAF6l831o+zDaqEfqUmnn
         GABw==
X-Forwarded-Encrypted: i=1; AFNElJ8uY8sMhrlYvUipciRIsfSahTjdwNGldcSUoTMDFnK8gWNd24VDv32XX6HV/RshKbKYJ4gsEE7LwYByeFEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyUeIaqUYRkFq1LYvwEMDBMQ9rnWr3nW4tYrsekKN9CQ2+AJCk6
	ssRNyq7569IbQkRIRI5LZAh91sbHdhi8wvN7J50p/amzbMUaYe11KQ4Pcy3LTifjjAdEPnbHQZq
	XMVhTSjOVVI1TuuJ2+emdZUjeXip/eKzVFdOhpsaZfQsXnMC7GqSSbTLe8l9LoEFRFyx6
X-Gm-Gg: AeBDietP+E9lMD1MOVrXL0EGcDLVj6serO/t+aN6Q63NXWKm8iMoDfvzdaKE5R7eXsn
	5CuHQ2lCGRaKFeiov8C2Ri/sS9jQ9igb9mGcu4ldAo6g6l5Wgqmjg1+kKh9fAlNIsxVeaHLw6SE
	Ot9bX9fUuwOwFUx0wPvtUmwANnPLruSbmkcEzs2QtBR5KnJpeI/xcarQt3Ru8/BeZsLLeCyVfMs
	8uadXaJfJIMYEtQOf5KlWYrlN2Q/MA7zdiGlU4nMiLR/8tYLnfjbAiwXTfDjHQOgtJCKEfIovl8
	D4UAXsuCdiuXpsCRzSih8aPUPnUsSJrIxszVZHIK+76+TCGk/icIgCvl7dRhSkT82UeQnuqDSaD
	f1pKyMc7RZxfEwyk2pV3rwEa+IRtgt+HkBU9BnbA9MPu/3zKf94BVrVDHO+h76Z5QQuL3FRVRJ/
	FLgNRzfKMVl/YfbZ1V
X-Received: by 2002:a05:7300:f193:b0:2df:5715:82be with SMTP id 5a478bee46e88-2e466044880mr20839599eec.2.1777253120319;
        Sun, 26 Apr 2026 18:25:20 -0700 (PDT)
X-Received: by 2002:a05:7300:f193:b0:2df:5715:82be with SMTP id 5a478bee46e88-2e466044880mr20839589eec.2.1777253119804;
        Sun, 26 Apr 2026 18:25:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccd2564sm42568031eec.18.2026.04.26.18.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 18:25:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: thermal: qcom-tsens: Document Nord Temperature Sensor
Date: Mon, 27 Apr 2026 09:25:11 +0800
Message-ID: <20260427012511.231475-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xyFHFRUGgwKotN-99H2qUBptLKAn1NXo
X-Proofpoint-ORIG-GUID: xyFHFRUGgwKotN-99H2qUBptLKAn1NXo
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69eebb01 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eV51uFx1KiPj_Zj1pZAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAxMiBTYWx0ZWRfX0aeY9LrBybq0
 VYMRVa5Xd9c3SLRX7D/FAx03qpq/GSygBvxdBkIod311OWPT/R/aunqLK9R7aiIgTsExxDAwFA9
 FsHq42q6jD5dG61XRP/7GlCfk63/qPkzjSvRbqmxumGTnSlnQcySFdohfGse1Fwi36TGQOAijqe
 wKF3of6au8Lcm34fPAsRTxODQnDbgc1z00+7l87J0SqsLtH+sH0HxE4pKLtdr4YS7+Hw0e3j4V4
 hlMmiW8tlZbuJEoDUW9IwVg0k1OxZDww36+7q8nRAO003d1C70QuYkwUtxYtd/iABBDVsHzx4Li
 WB5BC6VsuQymp0E0yYvlB5ghS+01Qm3O6d2gTUDXCdsirjgtpSBm8xnyU5zgZ57BpEE8cp1wJ9X
 1a1gk9yghy2PqFobxROoCXNGse7Iyx1bYWwGYbFPmovmm4uNWz1MIQWjtaRXPDn1+glRb63X77w
 dXnUkhlhdDM/UiD8n4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270012
X-Rspamd-Queue-Id: 04DCC46BE53
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104585-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Temperature Sensor (TSENS) on Qualcomm Nord SoC which is
compatible with 'qcom,tsens-v2'.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
 - Improve commit log to make the compatibility explicit
 - Link to v1: https://lore.kernel.org/all/20260420065409.1249030-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..e65ebc6f1698 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -58,6 +58,7 @@ properties:
               - qcom,glymur-tsens
               - qcom,kaanapali-tsens
               - qcom,milos-tsens
+              - qcom,nord-tsens
               - qcom,msm8953-tsens
               - qcom,msm8996-tsens
               - qcom,msm8998-tsens
-- 
2.43.0


