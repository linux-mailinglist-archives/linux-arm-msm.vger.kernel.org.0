Return-Path: <linux-arm-msm+bounces-111146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KUsyEpogIWp3/QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:52:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B463D5B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 08:52:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Z6bp/Iyx";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ETAeVR39;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111146-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111146-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8D9030638AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 06:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BA23CC9E8;
	Thu,  4 Jun 2026 06:51:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B9B3DA7C8
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 06:51:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555886; cv=none; b=N+fwapDb79/6oNdH/6HkbAp9+itj18HWnbpfsM6olK7Rgkz/PU5MH6f74zXvaaneSYmA1Luj8tI00SKw2oJB7nl0ZkcDfjj3JQhrPZEexFdoF5IwizFbsamfsmsK+wz/4dgI0w6haJG3e6v3OyhcITL2SoI2iRQdonkTo5pqLkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555886; c=relaxed/simple;
	bh=QrJa6QmmVo43BgQCLwXV/uHCInZpAJ510TCi/NxzQ2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hgi6FE2RPSJxZnOIjJTJbWM7ZKGb1Xq9yDptfSPM37k0AmgshGQgTLvOY4SzygK8HWdIZ2m18m6LoZ/2bQ5cmZvYxGLeWS3ilO42sdENy9bCuTA8O1iB75G1IyLBNA0b9ylJXYrlSD8E7aOYieata5eS1MzOBkwjGO4ncHkGHZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z6bp/Iyx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ETAeVR39; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6542U0rI3552293
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Jun 2026 06:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k6/s/Ll2pjRqqTLT2vU5HLBxfu7d8ihaQntI6L6D3aY=; b=Z6bp/IyxDMGZ1QPL
	JbAyHzWhmWo4VCYjqWtaKFNk0M1B2SPQ1o/2T01EKz6T9CtljeABoUSdG3LYvX1Y
	3v1jPLVz6CfmMsqupXsGNcnMnE2xG+qVBv1Zt8nCS01hw/eI6h5XJ3xWBcWCBfu8
	Ft+1dWNU1xBY2dbv6WCx4GDqbjS+LeH9i4zv6vdtq7BORstVgQUE5JmGrhBGvYBu
	vWeDstYhv4cUgm3lPpNuyRMWi7wZmVhFgqYHrX4iZ2xS1vPSsnE4cYz2P5d612MN
	ibJxuEI0cuks8sFV28FS4BY1et9SO6nJ+0oAMi3k1nPIZ4+3h85JBM0+8V5/uuLN
	qlvuIQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj9mvdj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 06:51:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85dc345ac8so268604a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 23:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780555883; x=1781160683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6/s/Ll2pjRqqTLT2vU5HLBxfu7d8ihaQntI6L6D3aY=;
        b=ETAeVR39bXvd3mJz8zNzAL0lC1Br3tjjjT9LAXNxsMS6OB5KjOVixRaz1kmhlAhCVr
         VuEpxTMxIMBN6wD2/DtSMF3aTDMzxsFk8qtUk/WpzxEtC7c4LahVRf2WKVx/JCrQtLn3
         R/R/edjvTKX7eOqb21u0vgxVuNEySXlt9/5wpSNfniggQKJ4sn0WKtTbicy/Yl/tdS62
         46TtdYnvlbUfgUajcy2vgffy35gfaA0k1KWPbjThtvDLZpIWT0wjy23ZNoLctTmoOUhD
         rDCG7LysmL57O66lEK2vY/ouNmGFileFvIAOLYboMho01IkliMBZynE9mo1OAE1aJf/i
         +m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780555883; x=1781160683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k6/s/Ll2pjRqqTLT2vU5HLBxfu7d8ihaQntI6L6D3aY=;
        b=Bq5+feQkshdTomP/hEgF8JSvL7Rjz6sV/Lyvw0A5zvzuo/rdMd6PbLHo1q01F8MCyQ
         CPMXuDjdFqV+AU/hyexecTvACSuEZ39Sge+U5XMJoDbIEnIzKSfW7Y59gK28OzBia4f8
         V0G+Oaqqf871hP1ED1IspmEQvlmEXeDHl5UeHkU10X8e1PFiDfh4HJOWz27q2j4yLkNK
         NkQOxlRApukThWNSDzxZ1Gn382W5cTaHcBPGYJtsN3U8GEVAGRdHSI7MklcvKwIIhJVw
         StIwrHwBDED3CrctIKBjyGyjDeZXPy2InbbvUBEUrSouCyQb7lWsIWe9t+i/wd6wzrhf
         ZLXg==
X-Gm-Message-State: AOJu0Yws8qkjTTWVAdJDJBLGjbLJ0/E2n8lmoI4FFGxCpmYbmmOCc3r+
	A/xVSlXko7ti2KQig+GtUHVr9YCTUFq3Fd5/k8hqTNfRSK1GrQxs/qeFEG/PiNhxbbADb1wytu2
	PXPHOWYOroSzceinwd5EraDOHLfIEENFOYhAjW3a2ltRd14lC+tR9AviVGH8lH+oChrnA
X-Gm-Gg: Acq92OGDZUNmstpw4P5SF74ayIi3od5iO4sG67Qop6NVy6TDieUMXt459OLJjz2m2dW
	sqmBb2J2ehm1F0LttgJXTs8Sey6C5ru/jCtacgYtzJNCAE6qlCjZH9hGRrTlRyRVhtjUD1PVh/+
	3aPWQRS2hSMe7dCFAtSysa3/yIGjXyHSfEcCvuvZK4XOp/xYaAe1g5oBiNqKZ68rRQi1jHq2w2M
	f+2dUPaRh0p9dD8oJ757w5eOTwS9f9LvizxMyrGTLI2aGloh+8S1G9RFiRgycNBDyLvcKwKpdJj
	utM/CJcCJv7TqDYndZJhjhyqqEMoBb5IIKiHDP+1SO6AMd4veA4GU5fnHHOMjQPVaoI4Aap3sMO
	ARgdaW3NvDWwocD14yJO5/qUzZZqnpOr70g2JoXmszaF7Q5PRzyZSaG3GiQlFCLvjtA==
X-Received: by 2002:a05:6a00:4508:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-84284f5fc0amr6035141b3a.24.1780555883199;
        Wed, 03 Jun 2026 23:51:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:4508:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-84284f5fc0amr6035112b3a.24.1780555882616;
        Wed, 03 Jun 2026 23:51:22 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842823512b0sm5365894b3a.15.2026.06.03.23.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:51:22 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 12:20:38 +0530
Subject: [PATCH v3 4/4] spi: qcom-geni: Enable SPI on SA8255p Qualcomm
 platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-enable-spi-on-sa8255p-v3-4-43984eac4c67@oss.qualcomm.com>
References: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
In-Reply-To: <20260604-enable-spi-on-sa8255p-v3-0-43984eac4c67@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780555855; l=4719;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=QrJa6QmmVo43BgQCLwXV/uHCInZpAJ510TCi/NxzQ2c=;
 b=lwPiOOh3IqZUDjL+lepayZg6zcoWUToaF9SOWtOuc4HJ+XQ/C6yzEFNV1n7md+nBIjEASB/Ru
 SPlmNW6H75xAAvQYb+2lacnWRvDYBtE25gAAyI7qaFH1/tNO5rTTFKW
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: 4NNe_qnY3WF2OoVJw88y35sFSB7BcdU-
X-Authority-Analysis: v=2.4 cv=XK0AjwhE c=1 sm=1 tr=0 ts=6a21206b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L4oeRUVQnX-q_C5JrjwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDA2NCBTYWx0ZWRfXyzwIwiW3TVuS
 w+MrGgZfDmffR38905PJu4C10Sgp+2faQ0wJEH/LwjPOUMAsV5djg/QvElBwpnExsBuLVbWoFUW
 XuJyqgoK2zM9dRwBVr5jmKFNrsj60Z47UMsUV/+ZeyXjHGVFT7ofvuwrPiqWX0O8YWcBE1K5FAo
 BVNlK1pYXjsaU1pVVXjJU9l+/K951SYtnTjglqTEGsXLQLbI+lGFsuIKjDKaodtlyPJToj4z0l1
 67TzRiIO5os59vaAfES/lZQwZR8/eMug4Yyo/tw5HcebpzzRNQcxiVYmTLVxx17OW6csK4UYrS2
 iXvlfb5xXE6zpBBCBUbLngp94non4SZDCgoMNrmPuveJituJQCQB9Vzi6jvt1+RnWjeICcul+8M
 BJFyXCMvHk3GLXNSBpvFs7zuw/IAEIUE7qHjdMGmfb2A48RJRoysyQXDCvK1ydxGtTHl236JSfl
 GQXD9OEzLvSCTDreH6g==
X-Proofpoint-ORIG-GUID: 4NNe_qnY3WF2OoVJw88y35sFSB7BcdU-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111146-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:praveen.talari@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC5B463D5B6

The Qualcomm automotive SA8255p SoC relies on firmware to configure
platform resources, including clocks, interconnects and TLMM.
The driver requests resources operations over SCMI using power
and performance protocols.

The SCMI power protocol enables or disables resources like clocks,
interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
such as resume/suspend, to control power states(on/off).

The SCMI performance protocol manages SPI frequency, with each
frequency rate represented by a performance level. The driver uses
geni_se_set_perf_opp() API to request the desired frequency rate.

As part of geni_se_set_perf_opp(), the OPP for the requested frequency
is obtained using dev_pm_opp_find_freq_floor() and the performance
level is set using dev_pm_opp_set_opp().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 47 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 420534937695..1b92fb1bd8bf 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -78,6 +78,13 @@
 #define GSI_CPHA		BIT(4)
 #define GSI_CPOL		BIT(5)
 
+struct geni_spi_desc {
+	int (*resources_init)(struct geni_se *se);
+	int (*set_rate)(struct geni_se *se, unsigned long clk_freq);
+	int (*power_on)(struct geni_se *se);
+	int (*power_off)(struct geni_se *se);
+};
+
 struct spi_geni_master {
 	struct geni_se se;
 	struct device *dev;
@@ -105,6 +112,7 @@ struct spi_geni_master {
 	struct dma_chan *tx;
 	struct dma_chan *rx;
 	int cur_xfer_mode;
+	const struct geni_spi_desc *dev_data;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -305,11 +313,12 @@ static void spi_setup_word_len(struct spi_geni_master *mas, u16 mode,
 	writel(word_len, se->base + SE_SPI_WORD_LEN);
 }
 
-static int geni_spi_set_clock_and_bw(struct spi_geni_master *mas,
-					unsigned long clk_hz)
+static int geni_spi_set_clock_and_bw(struct geni_se *se,
+				     unsigned long clk_hz)
 {
+	struct spi_controller *spi = dev_get_drvdata(se->dev);
+	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	u32 clk_sel, m_clk_cfg, idx, div;
-	struct geni_se *se = &mas->se;
 	int ret;
 
 	if (clk_hz == mas->cur_speed_hz)
@@ -820,7 +829,7 @@ static int setup_se_xfer(struct spi_transfer *xfer,
 	}
 
 	/* Speed and bits per word can be overridden per transfer */
-	ret = geni_spi_set_clock_and_bw(mas, xfer->speed_hz);
+	ret = mas->dev_data->set_rate(&mas->se, xfer->speed_hz);
 	if (ret)
 		return ret;
 
@@ -1064,7 +1073,9 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
 
-	ret = geni_se_resources_init(&mas->se);
+	mas->dev_data = device_get_match_data(&pdev->dev);
+
+	ret = mas->dev_data->resources_init(&mas->se);
 	if (ret)
 		return ret;
 
@@ -1120,7 +1131,8 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 
-	return geni_se_resources_deactivate(&mas->se);
+	return mas->dev_data->power_off ?
+	       mas->dev_data->power_off(&mas->se) : 0;
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
@@ -1129,9 +1141,11 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	int ret;
 
-	ret = geni_se_resources_activate(&mas->se);
-	if (ret)
-		return ret;
+	if (mas->dev_data->power_on) {
+		ret = mas->dev_data->power_on(&mas->se);
+		if (ret)
+			return ret;
+	}
 
 	if (mas->se.has_opp)
 		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
@@ -1177,8 +1191,21 @@ static const struct dev_pm_ops spi_geni_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(spi_geni_suspend, spi_geni_resume)
 };
 
+static const struct geni_spi_desc geni_spi = {
+	.resources_init = geni_se_resources_init,
+	.set_rate = geni_spi_set_clock_and_bw,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};
+
+static const struct geni_spi_desc sa8255p_geni_spi = {
+	.resources_init = geni_se_domain_attach,
+	.set_rate = geni_se_set_perf_opp,
+};
+
 static const struct of_device_id spi_geni_dt_match[] = {
-	{ .compatible = "qcom,geni-spi" },
+	{ .compatible = "qcom,geni-spi", .data = &geni_spi },
+	{ .compatible = "qcom,sa8255p-geni-spi", .data = &sa8255p_geni_spi },
 	{}
 };
 MODULE_DEVICE_TABLE(of, spi_geni_dt_match);

-- 
2.34.1


