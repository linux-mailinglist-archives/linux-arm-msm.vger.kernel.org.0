Return-Path: <linux-arm-msm+bounces-116164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i2BfMsxER2pOVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:12:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFFB6FE9BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:12:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VdyClTiL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aEFx8zeK;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116164-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116164-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05D5F306F622
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A243439182D;
	Fri,  3 Jul 2026 05:05:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06457213E89
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:04:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055102; cv=none; b=QBjDh3uexVRJf7o3C/1rcLEvtzRbdbBz5ktVMukAKW1u6foYttydYhKJr8saUCKKx7+cZSeG2keOwPldhpdkFCLZPFRNU0UCUqngcODLu7Ifgn6rbtMIkKFsJ6Utg0V1bonkvcTadgDZD0q8SQd5xeX9YNkw5c2UYPpajZNvqDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055102; c=relaxed/simple;
	bh=M8YZxWnB0AzPIjWqL5OibClRHhK4JBKvlyKlKEDeerI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdyTBPTX7s8taEAp17VzNvVzBOmdC53sBNuLtOMTHMHMpk0wZaqq+5LNvzKWbS5z294jzYQ79VZ9aAzWIb9ywuO+TTohaZHtJezeceVWwc5xdM64hpu3O0eNVgjWanANN+f4+B68njVpc/+5B84J75heft+PxS+wMttB6ApVgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VdyClTiL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aEFx8zeK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342Xqt2686979
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zICdr+vEr0mmN+oN36pGjTuJRAL7dBuDCDW6Sapxg7A=; b=VdyClTiLaxugj/8K
	YDtgOod5AiOUo+SPzRmwh1/oDXwO2iX6Z4GAovaceMgZTzvLeTqJHuF8bvRN92dz
	y4A52toHrWy1JQimauPK+qgTLCD+AKotExm9mxCapORPfiiqUFsP9e4NflojJJN2
	G7PXTutSza/AvC7kV8p325cp4Q5zGRVUM1+L/h0a3LxwmrDuGmEWE3d7gewr0Q2K
	HBy3LCyGL4CObZ4SS6dlw9Gyf/QMO0tX3rJgzy2EULz4l4fszmUJwW541SnXGAOE
	mXjIXSrb5K9r6QhgXWEGbUsDJdtbU507NK+VLeK135x6zeS2ZzdC86nJx85RFJOr
	FXUcWw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n0hwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:04:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380ddac2b02so313082a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055087; x=1783659887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zICdr+vEr0mmN+oN36pGjTuJRAL7dBuDCDW6Sapxg7A=;
        b=aEFx8zeKIgwE77e7i+71X6xGDbOM6h0HoTsyWYnnXR2qIh4O6hBdTAz/6KAvXmIBJ6
         QZ9FHu4iKRA6XDWMxWyxltZnN1rrZuIYryJtkU1xrj8mIJHVENsOt0eyJhzSuaGpTGnj
         SzkNegJEsIvL+kbOwc0SBPon0FscyjohQqIVRl5cXLQogXnHu/HnC1rOR9IyDQ8zHwm0
         0YifQTNbP9HJMXpqzzbShCuFTyHs7C2RBDgLbbF81vgFBjqdTd73VqYEaaF8G92Fh4BH
         NnyuiOThI+tEfO73oa9RsYWu4JTWapXtXMhYqfFYaJtBcGvyNCBqq2T0hFDnf93q7DOr
         ySZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055087; x=1783659887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zICdr+vEr0mmN+oN36pGjTuJRAL7dBuDCDW6Sapxg7A=;
        b=tON6pTpWghtc6uuBxYkwSOxjZBiVwUuGDnIc0AwDuIJ8QMSHJWfvdNqhEbaPPeD/Xd
         2dlyCLpxdCv1lGldh6QUHlyWNv9ZMUX0QCJHYE8DDG2aQrBGj/r56yen6XmpVhBvEUT0
         kS99TbLvJvIz8+IBEK3HtbTWwENgaDImdvPRP1p0Nc4mKZ4KePryFlVaJvUoYC7IgNey
         8m3Tv39BKt8kFy0skygL1Zi8GCOn45FpXQLrjIH6G7Kb1vTcDx+3RJwp7gEi3+tskocI
         MioQOyPQvPgbGCmJCsX01U+K7WNbrCagdHgKXIcx7vR+3bV+csOPYks3OnuzQR7E66kZ
         A1Tg==
X-Gm-Message-State: AOJu0Ywue9IZ+aqtVJ54E/zWbhc/BmEGCssQlj7GMSqf7Fur3MNXFzei
	O2ZaO6ePKFd+U+H9mTlys3h1nQd5wfT4CbuDnaP3D6MEmD94huwtQLspGns7iqX+ONCkobqKw1V
	OBrCZX3MR/f42Rcxb2x9ap4eAINsY0M8do8+PDbwadJY7hkrIv6I1KTtn7fwEupdmpj9P
X-Gm-Gg: AfdE7cmIvsyy7tQ+i/j3fUnW5cjeluT2BbclQrKfNP6qA40Vl3lx9oVcOP4GWqf1Vbc
	WngLtf1MqBU0bubdzZt0T4ZS0GVkYnVcPb/qZDqlmxntj2fHV4rFgQPHAotk3Id/r5lrkSzaITx
	0Talsm8f2P38NZWA77y+OKoNono1jyb8bVtw/wZCvILCLtB6b+ujeHEAARaJG8xqemk9xYwLCE9
	OyZeF3XbhyU+41N5CaB9C0qGSSx76HoyZh001S+kWUx4ZOWy1glBnKytAppPXr41jvmERb8qVBO
	0WLfXN09253XHw3Z/NCRImS/xdYOrMyg9cdECcPCeumlaRFuiTtJMlQTOjnY0hys6oHktlVodLS
	FMUXHdYHrUmHhv/G+HHR7EYyhq4/P562AY3VqtKfH
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr8753789a91.31.1783055087535;
        Thu, 02 Jul 2026 22:04:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3c03:b0:37f:9ce3:ca96 with SMTP id 98e67ed59e1d1-380aa20dab8mr8753738a91.31.1783055086945;
        Thu, 02 Jul 2026 22:04:46 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:04:46 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:13 +0530
Subject: [PATCH v4 10/10] arm64: dts: qcom: hamoa: Enable CDSP cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260703-qmi-tmd-v4-10-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=3918;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=Xwl8eyOC8ES3VqB9mPM2hr8gP/1CW/uw9ZVxGihPU8k=;
 b=vg0rFo+N6LIj/TQkcg0Zm9fnzF6Xr3KxFeoie+aH2fHi2td3rxumjgOf2RIysauPCVXtpU2BA
 WltYikBYTeUAIKrqUx0s0zfXMz5x83beD5fIEw8nWkSmhDMCl8UmBqW
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX4w7DibsRjPIy
 xPAFQk+131Tch8VAmvCpfklTqIJia3GTT9QCLBPmNgvmoFv+py017BOHCWijw3n+fFxovlZwaWS
 UUcNn8rmrRUOEXupWiOmCqTtglqmtdE=
X-Proofpoint-ORIG-GUID: Q23cXHs_q5qQ-D2N0ArF6vs2nRVpy-rR
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a4742f0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=l8n7A-dT2XO7LBAajUsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Q23cXHs_q5qQ-D2N0ArF6vs2nRVpy-rR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX/gv6VvyO3Q9p
 lI4IoX3uOcUV1phk6FJHxlR70XWvDvEa+DtxMRD2Qp1OH723+VkvHQwdtfwWxIkaIswxEYVWbag
 iE98REIXgLNP45yCpQZttKpcq+WdCm/rF0Rfnbwwp0ytrk3VabkJRbIE5KFY7jlZ3mafNDjr5nL
 IMBb3eSC+7FE1Pv5/mEnOb6RttohTX9AIrY9deUulLmleV6TRdNmObEe+5disbV7nQXyMvT87GZ
 J9cZ14DIWDn0BiOEC3dPivUzQeiFYPrx208KHDkk3LVtXxS4/xKYCTyvpZYGvcIl8HVd4pdQ7qY
 hlOMzM6ql9O7OjSFg6g3wb6+yIU/6VV9ZNMCUFi8H2omKCIvvTsxsmZUcxfyQk9MSCJDJfDU86Q
 Shx/7vZfqBwi4zSLvO/mJdeTlW5yZTXLqcafVluM8Y5IKnNYYFU8TrAyhfC3Ij4hT3lsYmL1/9o
 ePGW/d3GiIdJnBfs+9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116164-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:dipa.mantre@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AFFB6FE9BF

From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Unlike the CPU, the CDSP does not throttle its speed automatically
when it reaches high temperatures in hamoa.

Set up CDSP cooling for both instances by throttling the cdsp, when
it reaches 95°C.

Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 63 +++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 4ba751a65142..397049d2d238 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
 #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,qmi-tmd.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -8815,6 +8816,8 @@ remoteproc_cdsp: remoteproc@32300000 {
 
 			status = "disabled";
 
+			#cooling-cells = <3>;
+
 			glink-edge {
 				interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
@@ -9402,6 +9405,7 @@ aoss0-critical {
 		};
 
 		thermal_nsp0: nsp0-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 1>;
 
 			trips {
@@ -9411,15 +9415,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp0_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp0-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp0_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp1: nsp1-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 2>;
 
 			trips {
@@ -9429,15 +9448,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp1_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp1-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp1_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp2: nsp2-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 3>;
 
 			trips {
@@ -9447,15 +9481,30 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp2_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp2-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp2_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_nsp3: nsp3-thermal {
+			polling-delay-passive = <200>;
 			thermal-sensors = <&tsens3 4>;
 
 			trips {
@@ -9465,12 +9514,26 @@ trip-point0 {
 					type = "hot";
 				};
 
+				nsp3_alert0: trip-point1 {
+					temperature = <95000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nsp3-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nsp3_alert0>;
+					cooling-device = <&remoteproc_cdsp QCOM_CDSP_TMD_CDSP_SW
+							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		thermal_gpuss_0: gpuss-0-thermal {

-- 
2.34.1


