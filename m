Return-Path: <linux-arm-msm+bounces-113710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5Tp0DZa1M2paFQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:08:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC72069EBB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:08:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZSzMwuFa;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZuTSjRjk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113710-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113710-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E259330FFBDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 09:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45CAB3BBFB0;
	Thu, 18 Jun 2026 09:07:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C6F3AA182
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773635; cv=none; b=HEJbqkiMXD3earASop0PsGUZQLzxWylj0K8E4p29aoqu+yZeZKyJU6RCd22aAoXmytEbkEHaSUdGjGSnYKFdP/pH5apUTuJnUFAzgShnPvGuKSUgYpg5fJbFaeR6z2TezIkP8sEnBIMHlUiFggBVrcWqIz6SyNdgoCyB9V/wRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773635; c=relaxed/simple;
	bh=/txVxAvLF9aMAGkR9CXzGeWqGotHA5mWrN9Q3pLZeUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uShG5xZyGO9B5UAnPSjA9I/9H/ydNZtCEa4O1EPageMcN3KkqIugZyLPnSHL6hqcUQAIubEMzW1doOm0kQZUDI8K31nqlucnct0T+85p0EFiZysqUjoIEZIu+r1wG4ATIPb5wZOK74arrO4Ee2PN/4Ihj3r6x5WxDJ2ZtJn25oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSzMwuFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZuTSjRjk; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FRmi975748
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNTRNEjUl2bB1SNxPHc/nBXY2g2gOYZl5SKxQ13yWaY=; b=ZSzMwuFabmz+Foca
	YJGRHEaoDe9xSh5MWdsbu2cyVGxP5SsFiLiVC+7DPUwyxMpXjp01PkxCQw3FTisL
	LRuTa6qiUKFW6G5ZQt2LKWxAJAtreiZNESjxPQuoNwbferRxZsvbgbtN6Eo1B31o
	o29kCqt4PJ+9PPWcQOBzI5qjfQZb4IgZWVQdfTYv1a01BIv1LNLYXC/Q+ImtVCzt
	9Ob/FFGmRoQnKZYxivtj3yGXhdnuBt+7p3rHG4SJyAQJw++SCUctiaMwcaVuZv2Q
	zmn2NEblxvM8yOd1cv4DUNpPerwLlokwryOtdRoPkzijmbcOm5nPblciOfCrXN1E
	k5mekw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc2ffr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 09:07:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88da04b71dso504928a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 02:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773630; x=1782378430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNTRNEjUl2bB1SNxPHc/nBXY2g2gOYZl5SKxQ13yWaY=;
        b=ZuTSjRjk1KOqohHEryWUU2K2N56wsQg/z/e3nX3fYZzXrB9pWqhxtARsN+W4xLqfHJ
         VHSSisIj4M+x+Vt9aHT3+RoL8Pqb/iVGjYspTto65rdceqm5w3q37FeAe/UMokLG6T+2
         N8u3slfvgaeHgBpGtzJNwb6TuEffX4wSRc5CGYKAexFqAkK+0a2aLW8LTIohKjJEnGrP
         7A9ZYAc6wGoM3L6vvb92MXing3mfaStIu+zueNB5PBsaRRMOkAlcz/A+pnyQft9CakJG
         GwQQnRHmj7poVUTrmP8EiyyJU9+zRPMfk7CONeNhDmjUa1ehLvtjLgKLDxg9YIFOzGBH
         q2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773630; x=1782378430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FNTRNEjUl2bB1SNxPHc/nBXY2g2gOYZl5SKxQ13yWaY=;
        b=PFpB+SjBLe8eyBhgwYMOiB96spULRNKB0tdBidvQ+crOsXnXNL5rSqEh3YUvd0Sr8Y
         PQJjPZ8kMFzWhqiexDYh3c/EUwFR9aYxwznQb9RTFq0a/PNDlpxzlm5A94gNNWYq5/rm
         NNVerk1goXQSs3iXDrYUh16sGYr40RCmtezcTfk23xyo8gvV6/WGDXe9UVVrSGBbNOjK
         g7lHgYNYAv9ZD7gYfUF+HeA791OtzU0W6AejmTSYytJ/Si+RvAoSkpXMktyaygtr7IyY
         XSOfCgxNOOBScv4Mzm61V99NGmGZ7BmZ+8Ft9f/AlSCsWiwRIWY26zbhGlwPi5QkkcjV
         9yMA==
X-Gm-Message-State: AOJu0Yzy5I4JMdwc4D/HMn74xDXGzr3PMcR1Kke2LfGxShrhu0CXijpP
	4zytwyAdf9aA97UTChBG1tD4J5zyTXuOPTaLdmFjlpjT0vW3/AAs52dIYYRCMRgOU/eIOsjEOBq
	UUIOmfJkEzjoM/yxqMbWKIKjH5oJ3XmifRT4zVgtS7mb5EKhcmZMOKHrBXhcvtsUqSF0c5XtgGS
	2t
X-Gm-Gg: AfdE7ckBwdBC0wVrQOcjLlMOd5iIM/CN8LH4ra6+vvl3Jh+nXKGGBtoQuaaVihWnPU8
	vOHOczgzpFui/9LLHMLsodcfPmqyPkZGT+9CSkWV0KX9a0mOB31v4tRASiui+4NQ/2pFR09CHyz
	fbzHI6upj+RCzEggBAqWdZBvYZWzPcUmJJRczs+7uJ1eKkU6HjkhrUrnn/8BFRbInCmH6PabE1e
	mUwHJUwOQOGSKfrCO4+PnB+sroxEE2UfUMQuEoBmxms7koRZfIhX7zKQs/U64JxhphIDpBnewPQ
	BeFjLJ9zof3y7+BiCX7YKWRyvUsbOt4AFgn1Iq1ftpnhkr00C7GUCPSOHsBWcrMLyai9YW4nS+l
	aNiqDgJz6Ah5gGwuvzhTGtdra5WE1P4YA9KuGABoKslYi
X-Received: by 2002:a17:902:f790:b0:2c2:21e9:5a7d with SMTP id d9443c01a7336-2c6f347dbc7mr20749675ad.34.1781773630396;
        Thu, 18 Jun 2026 02:07:10 -0700 (PDT)
X-Received: by 2002:a17:902:f790:b0:2c2:21e9:5a7d with SMTP id d9443c01a7336-2c6f347dbc7mr20749005ad.34.1781773629882;
        Thu, 18 Jun 2026 02:07:09 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac794sm192112835ad.46.2026.06.18.02.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:07:09 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:36:41 +0530
Subject: [PATCH v4 3/4] spi: qcom-geni: Use resources helper APIs in
 runtime PM functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-enable-spi-on-sa8255p-v4-3-f5b5067e7e1e@oss.qualcomm.com>
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781773609; l=2053;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=/txVxAvLF9aMAGkR9CXzGeWqGotHA5mWrN9Q3pLZeUQ=;
 b=XlCL9PArLwZ+b4O6accMSjXrsls6A1CgsKC/2t4RXFFnqwlual08eHzfbWc2FWVDll/pB/6By
 7+lhi25hJ1gD9X4x/vC/oXmZXeC3rnqwZXxmsXYcM/sEom/Ct4RyfGb
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a33b53f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=i7xoKaWEWnc8ZE6DH4sA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: W8jRp0mjHeIJ0SJF96Un73rhKSbAicJY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX/QmG0pf4pgUD
 ipFL1oXbpR8qnrbUh6K1/YFUkdcjp+PzsfFL9j7Ej7vY4NydjohWWBTVl4MaKeMpwHkNQUOPvZM
 HN2BB7Uep9qlybDVOSAOG5YmOHDC/I0=
X-Proofpoint-ORIG-GUID: W8jRp0mjHeIJ0SJF96Un73rhKSbAicJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX1MBnToTaYlwL
 0sXohz6on8dzf3rJSRNxgymfROzwpx+ecmewWKWs8+rNgOf90NaXwt07uphh4oq9LpLas773G6X
 X1qczn+/h6MET8WQTBtmX5ljPuvoEfMhlMO0Upsxj2h15UY+f3vUuNTw1G7C2jsEAoiYg/t2KmB
 UNKGg5c8RzHi5vWm1OmtLChpR0H7e4Q4oLFMJAe7FB7Jh2Viav9mDnPlLvJh3u14IFGnrShebF1
 tjWMoHiCml4JGb5iwcqKhpFonwfQF+nMQeeENcqTG0B9VVuXNrRwnH+UbuC6kkjnHM0aDJzQwYi
 HZ/dEP/kBaxloXr5hX9Y6j0RXxa6T5VuuJshP3ZdZxq0BtZkKNdy7RnNOtO0/xJb/fuX0Ay3KPh
 1e2+eiKfiurfKlMzaT/Js93/+JWPPWbEAUhAtb4QlFGNa+pCPdV9tRrMtacWeegtX0m7Dz0BF5u
 rS5laP+ZYNJeEpXZjYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113710-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-spi@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:chiluka.harish@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC72069EBB3

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 09feb6577efc..025165c4b952 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1130,16 +1130,8 @@ static int __maybe_unused spi_geni_runtime_suspend(struct device *dev)
 {
 	struct spi_controller *spi = dev_get_drvdata(dev);
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
-	int ret;
-
-	/* Drop the performance state vote */
-	dev_pm_opp_set_rate(dev, 0);
-
-	ret = geni_se_resources_off(&mas->se);
-	if (ret)
-		return ret;
 
-	return geni_icc_disable(&mas->se);
+	return geni_se_resources_deactivate(&mas->se);
 }
 
 static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
@@ -1148,15 +1140,14 @@ static int __maybe_unused spi_geni_runtime_resume(struct device *dev)
 	struct spi_geni_master *mas = spi_controller_get_devdata(spi);
 	int ret;
 
-	ret = geni_icc_enable(&mas->se);
+	ret = geni_se_resources_activate(&mas->se);
 	if (ret)
 		return ret;
 
-	ret = geni_se_resources_on(&mas->se);
-	if (ret)
-		return ret;
+	if (mas->se.has_opp)
+		return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
 
-	return dev_pm_opp_set_rate(mas->dev, mas->cur_sclk_hz);
+	return 0;
 }
 
 static int __maybe_unused spi_geni_suspend(struct device *dev)

-- 
2.34.1


