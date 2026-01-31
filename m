Return-Path: <linux-arm-msm+bounces-91379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IvtCiQ9fmkvWgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 18:34:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA1C3404
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 18:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EAED300E5C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 17:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4A135BDC1;
	Sat, 31 Jan 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/6CKUsA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N0mydqcb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217712D2496
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880839; cv=none; b=X6twWr24jSe2401Gh8C0Qm924AEQSRSOu/rf38OIHPMYRcHUerkO14clOEiYeYHVhe/8+71QCLDiVfZltkGIJ4nnNhadG6UagPznarsW0oi/+kZLCoIPqvUAW8cXuhEvHa+/xUgEPshCcRIjTGKLf5o0JL0zYPe9YCRkGOL30Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880839; c=relaxed/simple;
	bh=V8seKBLMc2XCjBIuIod8MrpNr1Y/AumnUHtI/qBPKU0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o81YyZ2OA+ED9Cs2z8UO5PDieLMcmp6bEXyGZLMBJTp+gFRaBHmXB9Bqa2+swlUFB4ktxzywd/SEURgGFBb515Jg/TKLfV8V87BDtv/KwWxZgEx79ctLy5PLk+Un5F4lNwiljsyzgR8+Sbx4vMEmfBN/7SzrF6Jr5dbsmIXRU5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/6CKUsA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N0mydqcb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4eNwd393123
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3pxyf02sUds+FetYaEyjrt
	v/4VrVlWlRD+gfjbvWsZI=; b=E/6CKUsAi91zI+wxqaahfGT3jss2GpTV2NSF2R
	/WrnDrybQ+WWXKWb2P0Hm8aI7IZAsPPp5nFb+o3R2WIhRFqIBJUxOh2y3McEwuTx
	oQe2HIcZ8JTXzPLRkIvvJCNYsWugCTH4Myndp5LgpyQhlCoGBhBH19wjAIkb5UKv
	RN8/8phxElUH9WXq7fy+eJuI2E4cKqqx3kIH8Qn2AlqY0+9iOzSRcNZy3o9D3LHw
	8hbxMtrF8ADrN2T9sZW49K9PmbRwS15fLyLTMiPphsIRNdi3btdD8g5piqr129Q2
	fkZdxnn8v6gE/3kmriN8aCB7oY0Eg3V5r5YRJbN95PksyvaA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awns67s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 17:33:54 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9489e51a487so1685695241.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 09:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769880833; x=1770485633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3pxyf02sUds+FetYaEyjrtv/4VrVlWlRD+gfjbvWsZI=;
        b=N0mydqcbl9cOPnUFZnNPEVMEuKHGdYK2leQmuiEexjpbBfHhLFl31LZG6xeFrgVKv2
         JEYdoRsnd1fRfEf7rNc3W1a40297C/8jxs9TDFWnjZrlsEo28T7vTWf9NFSdecmIIoOY
         WJqaZCDlAGiaQUYwxngel2Wx3Yzat5F2VXl+Ow84d08U8RgUvHE/kfcAA8ARbbUmfy2a
         YJ+5FMZ9qAlHGgAiz+usKtjjPObPKXFoQg+jXNH0k0APNkp1gSS3m7ajJoMeKGnuQfBM
         TwlTOs3B6eXIH8gCQlSPTi91WGyHQdiWoN7ZlQK505vPpHJNy5i48uQ0E/wVRY6JNtp0
         UTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880833; x=1770485633;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pxyf02sUds+FetYaEyjrtv/4VrVlWlRD+gfjbvWsZI=;
        b=ng9mRO6Jgd/YOi+fAtLqA0XdSg15KTIiV1VWhD+w94yhZheHe4JXh2s8NnTYIv1u8w
         QnekL5XpYYPdgU7Lr80QArrWmuUcS1B36auqx7S6qBvrWn9nqCiTz0kCqUQpUynAzGwv
         aLUbvm7cp4xAwqKNJSULfBjskEetsM6ZGg+/Ow0ZuB2ZaFbZlXw5k4I3idxGD1ktaE4F
         V/VmxjyIFU7zo0XTs4oVa/mEx8HV6EWwFu3R75HiNgHYpir4ApV7iVkwSm23ndb2hOvc
         7YjNGHytfGIH+MQo89YGpJiT5GDs4wdzgv9IP8vZrdQxmDDd9xZGmFg56gTxZLAlOuIR
         gGsw==
X-Gm-Message-State: AOJu0Yw8Y/4EhF7cNd6pCi+dm5NNWrdVw4VwKhc9y7sWl49O4nyUm3nc
	nGX3Q7FI2rGgi+vPxWqjjyhTdYqVOKAA1WIwh4UJvQDKyexu3krw+6Y4NkvIHots4n0ciaMgnVa
	WQPV31FFDB72ojeRx8j71frKWf/Htu37tLuk9ZajUz882O9+tNBBP34RDaYZnX3E93veV
X-Gm-Gg: AZuq6aKeTfELF5qZuDyUQFdjyTeP8egDAkhlKlcaBR2kwt2eMbfWght2HJCsh7SJtFl
	3kZTBLaDfYNoS3Gxv/q0d3/OchYQcFh8Bh+dloMSpusuo68Nt5b8s+pTZXIqWE8Yo7Ykx0dtjrA
	ZCBW0/fM/xyfQxpSl7u0w50nSk9X5DIc7InqGyH7TKkN0o0gGQPAKPQPUR+YQRZ+B9rtpiFoXQM
	PuJPyr62hmi4bQqRJZkwKa4/wLnGrFLsVxg7inAVdbGhtbwXY9VlnmWSV0TF+GddG3Kx6nCgb3z
	ijvHu2TkYxZ+pVuKhle//VOS5YOIHiDR04c9IpZcr4AU5Qu1qQTvmCEt5r1oxVHmod18LGUmLul
	Wl6wGDJFHIdhYoau6KD5BkMaSlVa+Y+hpzI0yDfj05B9IytET+i+zTUjM9zsnPi1pDR7bAP+IQ7
	GmYmVZwcGhVGfgOxfINPdGM+w=
X-Received: by 2002:a05:6102:b0d:b0:5f8:d1bb:128 with SMTP id ada2fe7eead31-5f8e255abe9mr2034479137.27.1769880833337;
        Sat, 31 Jan 2026 09:33:53 -0800 (PST)
X-Received: by 2002:a05:6102:b0d:b0:5f8:d1bb:128 with SMTP id ada2fe7eead31-5f8e255abe9mr2034461137.27.1769880832851;
        Sat, 31 Jan 2026 09:33:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074886f0sm2443236e87.24.2026.01.31.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:33:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] media: qcom: iris/venus: fix power domain handling on
 SM8250
Date: Sat, 31 Jan 2026 19:33:42 +0200
Message-Id: <20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPY8fmkC/x2MywqAIBAAfyX23ILa034lOkSttYcsXJJA+vek4
 zDMJBAKTAJDkSBQZOHTZ9BlAcs++42Q18xglGmVrjRyYMFI/hZ0/KAcvWkUOlv1ZCx1te0gt1e
 gbP/vOL3vB73S0GtnAAAA
X-Change-ID: 20260131-iris-venus-fix-sm8250-f938e29e7497
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1790;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=V8seKBLMc2XCjBIuIod8MrpNr1Y/AumnUHtI/qBPKU0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfjz+Cuhup6QdFylU9IHxfsiBjlupoDyQB84NK
 Cn/58W6c3SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX48/gAKCRCLPIo+Aiko
 1YPrB/9qQMBkmnwuxpjJFSUdeXeIk/BydgGoAS9Fo/ISHhaYVbvbEklk86iBScauide8lcoaMrG
 FSnauGmwcx3WC8+xd0lDyfLNP8/tKKsG0iT/fpVCWm1s+3q1+lUYI4gGcXQhC0VDRmpZaGEN8iw
 0xgMQKIVzz3SKli8sJ+9lWRjqBdzZyTR04/9dCYwqyX2cmQOKOkYJVC8e4NkNzrVqYxoBiyi9oG
 0JaqYOwaOBBHB/eO8IpWn2eIr/Jep1t1hQ549t5GyjZ7G7a7mVIL3SfN1G/YkNdEiydQNdCehbf
 Amsl+Ef27kUJLK2l37/oVwU0EnQXpZDKMbBBoXpkVKIz8/2T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=697e3d02 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0RjBngDeADCmygnGHrcA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: 44dZP1vbF_22DTiuxNeY_ZnOpL-UiVaj
X-Proofpoint-ORIG-GUID: 44dZP1vbF_22DTiuxNeY_ZnOpL-UiVaj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDE0NyBTYWx0ZWRfXzYcWsW6s/TlV
 XjaJE0Yrp4wwNGtMdmKJVmgllevUJ98ct4xhjENRM7L142XmYh8Q08RtuKPOphJZrLwzKrw9M/E
 eS0SCyn3uzHCmXKuq0vgbdh7zcdDrnfubSRFoXE4XO0OG8RjnHZh5DhdACzVlilPp0QJIN82fM1
 clt/nZhOFaewF/R2QIXw4mqp4D5YEDVgJJ8oRoq4agYLC/DxF25tSsLWAsK3gOfT837oNd90ZKl
 Z5V170UwrQjEjkxdwkFwg3zfObspHGRelPcxhojJx5VaUtmQP3Im/9SA6+AoUMuI1dtWQPgYyTf
 JdCoLKn9zKE3fftd//erNNfpDmDo9SHnLNpjFUOspN14Q7cSRdmpQI2oVp4v7snxGsAsAYMCKB2
 UoOLiFY1wRS3OpAeM3lB7/AQETWgr/rN/cgVTRVNuw/pyJzMSWNUoB0wUFlSJZADjwZC+93YSbE
 LatdSHeo/Dn0qH6gL9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91379-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 59CA1C3404
X-Rspamd-Action: no action

As pointed out by Konrad during the review of SM8350 / SC8280XP
patchset, Iris aka Venus description has several flows. It doesn't scale
MMCX, the frequencies in the OPP table are wrong, etc.

Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
stopping it from being overclocked).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (8):
      dt-bindings: clock: qcom,sm8250-videocc: account for the MX domain
      pmdomain: de-constify fields struct dev_pm_domain_attach_data
      media: dt-bindings: qcom,sm8250-venus: sort out power domains
      media: iris: scale MMCX power domain on SM8250
      media: venus: scale MMCX power domain on SM8250
      arm64: dts: qcom: sm8250: add MX power domain to the video CC
      arm64: dts: qcom: sort out Iris power domains
      arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table

 .../bindings/clock/qcom,sm8250-videocc.yaml        | 80 ++++++++++++++++++++++
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 ------
 .../bindings/media/qcom,sm8250-venus.yaml          | 10 +--
 arch/arm64/boot/dts/qcom/sm8250.dtsi               | 42 +++++++-----
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |  7 ++
 drivers/media/platform/qcom/venus/core.c           |  7 +-
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/pm_helpers.c     |  8 ++-
 include/linux/pm_domain.h                          |  4 +-
 10 files changed, 135 insertions(+), 46 deletions(-)
---
base-commit: 44ef70faf71468e0ae4bdb782a6d43f0614b8ffa
change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497

Best regards,
-- 
With best wishes
Dmitry


