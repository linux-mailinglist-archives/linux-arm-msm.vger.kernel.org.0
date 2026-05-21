Return-Path: <linux-arm-msm+bounces-109108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIIHKQcgD2pSGAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:08:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7175A7F5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 17:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE5E731B7B71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12798383993;
	Thu, 21 May 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LDh0IMi4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZSUVm2F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCAE23372C
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372356; cv=none; b=UMJHjzFWgMNDUOClqVYRHCzaZuuY1No/0Y9skswpmqwSZfxS4+ERuL4H+YWkVanQWgeJKIro9wNcgUHFF2V0g2Bafe0oFU3/rHvrWm+rm97CCw9KcJFOYzWsqBi7a17D1Q1l7YpK09hm98+t9xx+9nKaCyVzFnC/8+wOsdzuGJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372356; c=relaxed/simple;
	bh=sRGh7S6MyKVrh0BInxsk81hA/AV0Bj4E4laY11Hu75c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJZ1I6x7c9VbAMg6JW5IvVvDg4R52EbeGc0JLeHhuJ46aJu23mTITbaeY+N9DLchMf4QklgH+/QSfBCjwm4BEOLruiRgLmcG6JpQ+590L1hcRZ1vcK7vhfU/74uLsJFzjN3ulZXxXWem8Wue730mPceqa22/OFfBsmiCmuEphDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LDh0IMi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GZSUVm2F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99nhv3118945
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iCoeHjjloUdX9dKsGMDAd4b+0Fil4rvCP2G2OTCb8a8=; b=LDh0IMi4lk7LWaSo
	/weudAX4lJnOKHPz/8o0qR3qlioo6g4MJN7xrNQMo2lTs0RoZrlSHF+9vaQYA9Ko
	oauuPHl1WqIqKzghurBLZAMtcPis8wzXsf6rZfS6MvkSjwBYSRqbXiJcUuRU+t5p
	+QTkvNQ5IQ3EXntbPVkJiwe5G9fDIj+j1TyUo3rwan24Je0cYiuYe7emJ9dnv3YU
	/IRwqVWLEmuM4QVYUPOeu6Tv2aYU837len/zn6ZigrONb3RldLVoBxx82PyCUHn/
	5FeRhOL3JcSdQSvOVS5ZgsZ20VQ9H2bvgWsBQPWfR009FB9qXZ+nX+mUCJ6GsxHX
	VUVX6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9r962t36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 14:05:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2baf7378ad0so64559735ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372353; x=1779977153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCoeHjjloUdX9dKsGMDAd4b+0Fil4rvCP2G2OTCb8a8=;
        b=GZSUVm2FAjRz2duWmon4lp+ZC14yqFcvl9cKgd6qsFNXeRODo1KHM908owmqt+8h+7
         6V5MUcG/2GTaZB1qeK9pyBzHyd65oEsjj2YRSNH7frSho/SW2AUHXnd5rd+VdR34G3AB
         UxuA/JFYC95o3wqncWaCJsIE6/QD9CvSrQD1a9nJeLwNPiOrr29NcKbPJZr58l5L8zXI
         iyN1JPxgYau3pPeiVwX6zcqCrFRhyud3Z7YOFFzq36yweLIDETYroZSv42x4mjUReYUo
         0rhDsH0by185m/+GWRVCd6Ucb0Dy8zmC4n5ZReLY+mcIBBiffVXm7f1JVImIWBxfJAaB
         8xig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372353; x=1779977153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iCoeHjjloUdX9dKsGMDAd4b+0Fil4rvCP2G2OTCb8a8=;
        b=PX5BbLF6Hs+IQF84Kfvrg9AsDAE2OWSFeFsb16tS/u0RNjYoNDn3T81781t3o9UXHz
         FtJjDrO/tOX5rcpI1rK0Fpana/JFAK3oEXy3s3gLLAO7BT8T2c1hgvDvb2BXibYDU9HL
         qFfXFB0IAYBpMMIbgSez/dSxmDc6p06U91INLio/jbgW36HW7ebriTcnE7J5VvJb8K16
         t016FktLNgcRdNfWwzHFMA8LoXunyE3EWz5miw+riXZB/FzQQYmNnwnH8pEEExXgZEDd
         9g9vnzrtvlIWz+fBr4LyCbGqPyurYvxtPVGegFqDQHiv14kkio6nr0pLPLIdQHOCz7TW
         Mnnw==
X-Gm-Message-State: AOJu0YxAlXKIHNb4dPZ1EaxPBXoims9qTVXR3Z+0C8/cQ3kOp8kI0xyw
	CQo7WKfqmZoscwF3lcFCoDCtYYiNIcrusZWllFVqGkc72SrgnxyG9SCu3NJAJ/R4JX69z3xIsW4
	yNOjLJ0nTyW0Rz36J4t+5xnY9rJUQzu9P0wYD5U3tHmek3YsUkgdChUrNhATprqY5QKqR
X-Gm-Gg: Acq92OHQZOg1pthVu6OsWOUhssUPmuMR/A2a2x/7FowEUoNujUZt640tyPYWFC5Jsvd
	aPcWYEmqNPtvFStzvlSAgn8O90hbrRI9BC7mU4uF66OSdNTqY8XKD1EpAhSeAqRWrAGTSQYYoA/
	7wceXh8O2EPUm8QHabLh+ePknb7/7rvsia0XKgLiQQpd3ICHUYh2ms7lfoVpcLnBG+ClS8XNS2d
	f/6RFWxqsT+wF+KljfrJG59VHZ8rjAFNSzcq4ifkyJQ7K3IVcwZzkPxW//dXqEJl9m6OUfBeCxQ
	GtbeFEqGQsp7orny/rzBODpGpoV0PiF8Nr+KojcjEaY1YR7kdmTXAGPIHjicie1LkCg2mz0Q1mf
	mVMkvLiXP0E10RKqB+tOShoQr6boAoHA5TUEv4LO4mDBAHx9AD0E0I1mj
X-Received: by 2002:a17:902:c94f:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bea2fd00b5mr31297295ad.1.1779372353177;
        Thu, 21 May 2026 07:05:53 -0700 (PDT)
X-Received: by 2002:a17:902:c94f:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2bea2fd00b5mr31296625ad.1.1779372352669;
        Thu, 21 May 2026 07:05:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9287997sm13189765ad.24.2026.05.21.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:05:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:35:31 +0530
Subject: [PATCH 3/4] PCI: qcom: Add Support for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-eliza-v1-3-97cdbe88389d@oss.qualcomm.com>
References: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
In-Reply-To: <20260521-eliza-v1-0-97cdbe88389d@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779372332; l=1041;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=sRGh7S6MyKVrh0BInxsk81hA/AV0Bj4E4laY11Hu75c=;
 b=oOQiaTe3ZLkTlXdBjVUDD7f9dAV3Tv1of9VZx8/bw9AkHjzEgDPHhutpwKZncdvD99BH+M7QO
 7rLOozMHs9ODH50YlvOuz0y+k6tF4w1cwb0nlnacdWf9kTJsLW5QfMR
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 6ZYfD46TZ-QkzyzdcEbHEsf935I-4rv6
X-Proofpoint-GUID: 6ZYfD46TZ-QkzyzdcEbHEsf935I-4rv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MCBTYWx0ZWRfX9CIcMkAq17IJ
 QK+kJe5up0z5NatDlRch3v2hgHxpjJ339MO4RyTXJdayozRVfc1/XQnnGlxL3IgkGha9GVVQ6D9
 kawgZgV7PtWQKqwI+IhKj1ZEwyws+medH9DxP+644r7CyfO0LE+2owDtfjjZysFdhyZ3y3QfD9D
 M2cumolNwySVD3Mt1SS6Or/6XYcERRv3mtxmjO1cZUAz/br/j0R6N6v/lYhQEitnBHIMs1TFwNJ
 Ur4kfJKZ8/ddZTo2Z+zH9lUCPQvRAe6N6twi2a87xGIcUFHS6tgIrWgwFM0IyVWotKPBUkgl9GQ
 V1m+z2hSi1MHIvwUkPEq7lnpYQAADli9k6idO5WI6ndEQyMRaTEEykNhVZgTd3vYRvhqDqPGWow
 hL0CXldwa0jDwtJv5c+c3Rr/IFQ5IoRBbdFdrIYOz1Oz+2UtCFzQvMiIYkRtq3YNPidzyxOB61q
 3lv+GfOpnzTlOty5w/Q==
X-Authority-Analysis: v=2.4 cv=GqFyPE1C c=1 sm=1 tr=0 ts=6a0f1142 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Py5lcOcq67Lbq8UMOfUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210140
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109108-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.chundru@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0F7175A7F5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for Eliza soc, which has two PCIe controllers capable
of 8GT/s X1 and 8GT/s X2, using the cfg_1_9_0 configuration.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index af6bf5cce65b..40f0a5f247eb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2123,6 +2123,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
+	{ .compatible = "qcom,pcie-eliza", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },
 	{ .compatible = "qcom,pcie-ipq5018", .data = &cfg_2_9_0 },
 	{ .compatible = "qcom,pcie-ipq6018", .data = &cfg_2_9_0 },

-- 
2.34.1


