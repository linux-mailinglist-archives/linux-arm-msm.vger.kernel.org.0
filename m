Return-Path: <linux-arm-msm+bounces-107103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DuXO7w1A2oA1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:14:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C64522175
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1658234A2F04
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE5213A2E3D;
	Tue, 12 May 2026 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNC2GR87";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kG0iWrun"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315553A05CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591395; cv=none; b=Yv4j9FXxKy++4kFLLwOWxyOraLJAJg6/xsXfWQ9uCu9ftnI90D2hdzWc2LJSimsrZA5yMcEMUZVPpxDTMPf+jPOgfKVoDbDmtRt3o0mCidCJExc0ZI62sTPX8TkaObXF3o43hLC4QegskOFkN/PZ2XF5evprocvQSeUSCcnKvbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591395; c=relaxed/simple;
	bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KQQz4GLsY3kHGT28W+hxFKFJveT6FaDqQnir39ocspf/BSnS9hzcrcpr6Np0Lk8+bVEPFxw040PFZflCeHu5fZT+dZuLiRQr8CoH8vxI+zgUoZYmBrZYbobvEEOqB48Pj+1fd/02DkqFKWBQXVJeUYoTn9Q0GjB/cnsTpYPqIFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aNC2GR87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kG0iWrun; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5PH7592121
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=; b=aNC2GR87CJrXucOX
	VEhsel9rhuSIbyow70DpMTPuFlhvJtZ8Hg2Q8yVdIZX+bEJy74IahNKZB5u/ZXvs
	/19aGlrDMkAECHKwyQuYIA+7NyXUCuPKzwMRPQzHrZPHTyWOMRnf3nTVr/cyaD6K
	rmj2FJIO1LgeZGGofBh/1A/Z0gkzP6lpu+aC0HaDSudetpeqgUVnxXyV7b90NWqW
	QdCx5S7SNWr/g/uNGmIIcki9bAgePbh7Xg0fotwEmJK6jNEYbHl5pgdBFHVmGoTy
	Vr48XN2bYX0DG45oahE0+snEvI1++zAW+9sowPya50NCn1ZJYhMyayrxwXT+PTvR
	OWOf8g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319rg7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:53 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e3a5fc58feso5449791a34.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591392; x=1779196192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=kG0iWrunOPMuHCbOndKLW/LKfwXgwwsDYjFYPXCCzazNEofI5ORXQfWFnTs+GOteEU
         GOLMwVb5hO43DJw3F5nqH5/56huI6ThCzbRbsqRxl9vPyNvzHXUIQdBzEtxTUHDXoE7r
         7X/+K2sVIMYIqgt7WP+2fANLHfVmrvpNsqPmw1+HHnMo4d75hsRRN6DgWlyo4Pszkr4c
         xKvLfjwfm7WIf1ismNYfHupfxIp5f6Qx1BJ5s7q+N0P3pXQBXc0MqSDq6yQDb9XoEYWb
         /CPnpovXJA/GJL1WqDdISmEwsAxp/57+lmqyordEbnjXkYm4TNG/2IKS1CPnqlKa9QM4
         3cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591392; x=1779196192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyGb0UCYPIrtzlYMMFqHwR0AZmvnwPLK/gKxBVnW7aQ=;
        b=k23WY6Yfd0Ki89tQmvAaMa4cPmP9ptMqH/HaHjxAa16qY/oP8/0wns90VwXGsORBqc
         MD2HrABE9jdGGhAxwKtrU/zJyjSUrid6IEVfytY+tI4TUoxZuuJiDMTZMMcTu1xjCYos
         4/fLwPqLN0MSN2A//xeRhoLevITImPVAmtjG1VV3/VR5lAqXLsIyCsWVRzVaqc9xZFtJ
         KfRHP2Vix6X0br9EqxifOHvRtIXCU9A0YnTxD6qk5w8BIcqrPWJTMN6ZOUwMtv7FiVl8
         WBThF1TtX45WXin+vtBx6p4Iv9MNulaDQCKLOBevlidxKL91jBZIG3S3rLvY2orBabiX
         iHRw==
X-Forwarded-Encrypted: i=1; AFNElJ+Ukdo0xlYjRunbcQUiX5xUelPTqQu88VNN2b6IXq6BE/zlTXEcj/RrI9q7r9pm9crDGYVvR10Fg8ISsXs8@vger.kernel.org
X-Gm-Message-State: AOJu0YzTU25b0gcGZvyvtPjdHn5D8QJb/1wPGAHx1zB5IpYvF9aj/rlL
	TT/nISecb/T/nOli76vQJoVa00CMhuEXPNs1MKzRUw1m7upOzeYzDO5UME9gCESzLx1qWQM08I9
	htcVPlVw7bRagsyHCGKHI7uh8KdT3cw3TboBcpSYrqAFO/SECfw2WKVUpcH101S8PzQrt
X-Gm-Gg: Acq92OEz5QYt+lOzOiJ2d1RslPmqMr9hhh2yhosbOpX+QLL1Ggs1V+8hnu58NtG/+jA
	bJsbIpQypLuUHfvSvUwwPNM6Yc+F2dIkKAa07qgl8Ny6dN9+D2DdX5XdzdosCoQty/LgIco3Q5h
	RqxTIxvIlDmnwpvwkcn/o5EMPnVCPqBIFjGq6OWknurmKxrzgbQec4Dq0RZb/+TXfKo9DPbXsj+
	zPFhn+3c/D+Za8tjCqWlMFbpI8KBs+8BqzZnMW7Gc2W55/DXFJX2a6lE5swBmFbAirCmiC3rS2h
	WxZ5JtTM6tcCM5tn4Q69K+Vwe85nuuQtLvfM8nkpZkH7M1HL9mTM8mI7fd14icChmi2PCRaHI5R
	ujcshJ7+Jd1elpi5WRkkkV8vY9nIXYC69GWQIF9G8QEJI9QaBx0OtSfcpEX086Le87hp/8Mf1ZC
	GJoZfZteetskdff27p6g1q4Xe6dxQLQsrfMjA=
X-Received: by 2002:a05:6820:4def:b0:696:70f0:7ad7 with SMTP id 006d021491bc7-69b25b178ffmr9484728eaf.4.1778591392283;
        Tue, 12 May 2026 06:09:52 -0700 (PDT)
X-Received: by 2002:a05:6820:4def:b0:696:70f0:7ad7 with SMTP id 006d021491bc7-69b25b178ffmr9484696eaf.4.1778591391850;
        Tue, 12 May 2026 06:09:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:34 +0300
Subject: [PATCH v5 6/6] arm64: dts: qcom: sm8350-hdk: enable Iris core
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-6-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
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
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=dicEJZtLq6zW0VUaiQ1W5EgO1yN4WYL6q5FtmZ8EKdM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaUrAFin2gF+M+wxc/W4ANjprSyX58zXRICZ
 j/IR/OCWPOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmlAAKCRCLPIo+Aiko
 1aIkCACuOuwukXm+nYWynwcb4cgPAmYBJclYTUrssk+rPw19hU+3ONBczaDfWgzu8/0wVF2gdh4
 VA6blAe+atLPhziv36a+9GeJvfCGUpC3jE3tcONhdsqdzx8vIp01Epj5lZo3eMeY/AMHvqsl2UP
 OH6ytaDeLF6jn3nKc8YmrUIQuNQ59xRwjbhVwA+6wssLaDqVBVgl+la4Wir8g4q/GDqeLmx6p+n
 aArwsig4imUpyldyExmudDDRXHrkxAyuF4/toa6os3CY/Q2SCpviTITy44Si4vTNxwIp9CLKZON
 /+4gpJY69vdjvEH7+oP3n6GmsgmzKYKU8iWLgC+/uFYuB1VH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfXxqp6SrUukmCN
 glT8M35smXudArRsbi0FIpHXd8JJGx/Ux1mxlgxceCgxTNfMWQBSGdbG5lex4w0prbZTh8+Q4Fi
 zKeU5Xx6tHaR4XOLmLAS9yt63VDvfbfJDXTCfcR3v0dnffAS15XUYcltZh0Qj6F+kOjfaGIP6QX
 oASmTuhgpEVptlc2uvOVtrWe7NEq76KZg4piLb+y6gZMxylb5EuYQUMMPKgKLrIkE9xTWjuMV0c
 Xastql9qfYwqcPA5pNFCryh8Dur9eA8CVYtPKcC7PyXA3L5Nf8dqxINO/Oa+2ClgPTv418/yV9d
 xHJN/pUADXXLk8VvY//NxLxeLzGOgHREgqriDumqCvb0ayqujfNWZJGLIu4GOGgxf8kiW35z53d
 1fBfYMJsnErUZkDVQAHjCSK7d5j2zC1cVmxT2qHamORTrBB0eYhkmDeG65kGk+t4CdxA6hMDEjv
 iGCHYokrLnMZcm8QzTw==
X-Proofpoint-GUID: nDliNWCiMwaXviWgVc4HQlJ6cJ8EXpBp
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a0326a1 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6kKVESMuOeKZ7y-A11oA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: nDliNWCiMwaXviWgVc4HQlJ6cJ8EXpBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136
X-Rspamd-Queue-Id: 53C64522175
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107103-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable video en/decoder on the SM8350 HDK board. The firmware is not
(yet) a part of linux-firmware and needs to be extracted from Android
data.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..055fc8ade85a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -472,6 +472,12 @@ lt9611_out: endpoint {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu20_p4_sm8350.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.47.3


