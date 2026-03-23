Return-Path: <linux-arm-msm+bounces-99085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKZSEJaVwGmxIwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:21:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B1F2EB717
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BA76300902D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 01:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140082135AD;
	Mon, 23 Mar 2026 01:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZY0dwN7w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SugjusJD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2A421E097
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774228874; cv=none; b=abc/D0zokqmTklYjzGukDQDleAiFy65cnnAuideiTU9VvNKMHlMspEcSSD1MsDFezMpDq9G7X9VGrYOUvpDCw7s5B8hClDB9Wd8UUD67Z4LFtzyp7cA1Ba5l6xWfBIkVPhFLOE2Rp3a1bVbe7gTTI9oxd0WO3HbqVu6fRWM7oMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774228874; c=relaxed/simple;
	bh=ovkp1VqYDxWwaMR8IKDklY9LWDBhmym8XUwoMhAE84o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQziXyZTwHwtbrel5hVj4ocBJr0P2LH1MNFDdPlkX5u/UaT2lEuNnFtDMUjTWiF/X4x3i5Gj1Txaoy91IQsb5LOfYbYI9fyZScwtfIZbQU3GGE3l6wexnri+L4/pt3cczT2nqWlz5yZagJVVYGww5Ap2Be3Mq7epdMJZmXT/N+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZY0dwN7w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SugjusJD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MAjWk84045054
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	shuGCPtuF/W/Fk6jHf9iSHzPtfL43JdmAFjP+eYf6wQ=; b=ZY0dwN7wjfCqkO1v
	26KTsssR4CshJPZJfmFNQCuEkvfp2qVzUG78hWtYIv3ze8O9yTfMTqyrL1zmkoZl
	HgDVBLIkkFzTZ2xTy9AVifojAb1SCHJ1/4SeViuBo0LvoPDM9evijGuBkxB6Q4jG
	f/hs7W71KrkxbjCHR31H1qeKxP12hdLHg2XpinDgzNz42XazOEcYeFAsDQ4+fGsg
	VA/myzqr4hPXabfD0BiDoGgMvlIo7bCxKSfvJlaCPKJVOqXcQJB/RpK5f6Fu1O7a
	YdgUgFYobBInKbndenB2bmkfw6u1y7kV4OGC6tc84V0lL6RM5/O+rZCwujt3G6hm
	OlKINA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5u8j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:21:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so167399141cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774228871; x=1774833671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shuGCPtuF/W/Fk6jHf9iSHzPtfL43JdmAFjP+eYf6wQ=;
        b=SugjusJDylLq2ny7CIB6V2mQJ5ZAEC7912kGyIwbxMnBhfZjAhoi1it72CdPvgb5/B
         ASps7HltY//nFk7cb6CzeiCgAJs37QNr8qYu1bxBnIBlmdyBobzVZqNjQYWAmJCbFis/
         XK35Cv3B944DUvlHPvvzREhFEgBefgzoTmQBJ4gwMPrxI8S4ZAJbulgxdEgIt9lnAMN8
         TLdAMZDzaljTXdnor+QJZfMCRjIInW6rsP57gFU5yXgJygULZ3XAKnL2YZ7qPcJ7CSrr
         3t92OdgndVzO996P1/cZQTxJQneZU0O+gKQ57cbnyJ7QqHRoiGxMTfMREZsAhTM5tSpk
         ltSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774228871; x=1774833671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=shuGCPtuF/W/Fk6jHf9iSHzPtfL43JdmAFjP+eYf6wQ=;
        b=LEgQ4xSW79bcLjGjWc4rySuRHgal2fP8cxuqAcqC/fRivMlpyJUTaoe2hHxTkvc6Zf
         1MOnHxuUMR3GCmGVZd0zCYSGyOy2Wbbf8oFBmj12CnHn09OoAjYoR431oSdB9AkDPeAo
         85YeXk0ltN2mFaHaqEWDT8KfarhVTu+RSO4Z/UPpVBpQfSy0cXJReS6UAcNQCsyRt5Sf
         HQR65PzglRlqESKRuI5auTtMM4Z1znf8UAO98mZIVozgagf1iaTtPf33vQ7imw1v1Yvl
         vEfZUBNUYENgn7xo993bLeN1JQEKjMOGxN3q8v+UIJZiSQMiHvfxOLIC6VtZWLc3hN0E
         uccQ==
X-Gm-Message-State: AOJu0YxLue/Jz0oVrXbQfSO0sACk7BHfRlAUyWTyuR7OcJpDco19FbUl
	gUVCQDWdHODbeR/eIMZ/3jrCdNJwa9bRrO1/uLCi43WZDwHt3OFhGeQZpRZ4/c53yOLJYPrKkso
	f0q670EcmspSWzqX6k6IANkPh9jtE3b08FpzLEC5rrQ7e7kOhCcmCANyZv4emrrEPwsgb
X-Gm-Gg: ATEYQzyFlJhciffuP8b2+AtbgHdqTRUPVSrvkt+/G15gggQQLgEDQJY0y0GU7czHfY7
	o6/cmahqQ5XAUo+E6ztxpdzqZ7CyRJDF+ZTbtMmteOGt7OlkdlJSuwttQcCSiBNSoxvcxHk0cog
	+mYs3NxmKQpXjgqa/AhiL4LDeAEE4GTx/cAm+Dw2Wk0UC/ioj2q5FF9Kjcwv9wo8LtCR90GDDnk
	UkEcdV9X1yrFVUYVSyIoyAVebM7bdRCPKa7yXZHk2OwH+gAuLjTSXPALzEXiMgTmYWKdkRpZ2HW
	D3/RyuSYrvPF1utvOulzB7MzmJwZIQKgexZYVJiEBgmFtQOl2NubaRcXb/bF6+0cIwBDXgcyGwR
	gVlPl0k6eJNcbBVAM8QEXm3UrulHwskR/lxL9gtrxd/nussbLS2UPBsZE52p3AaXlpfpprPZMP4
	oLMifvXQsaX8C+4coGl4T/NjkQ3XhPHhdKOjU=
X-Received: by 2002:ac8:5e51:0:b0:509:1260:b141 with SMTP id d75a77b69052e-50b371761c5mr155467131cf.29.1774228870820;
        Sun, 22 Mar 2026 18:21:10 -0700 (PDT)
X-Received: by 2002:ac8:5e51:0:b0:509:1260:b141 with SMTP id d75a77b69052e-50b371761c5mr155466971cf.29.1774228870387;
        Sun, 22 Mar 2026 18:21:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a28530cf9esm2108092e87.82.2026.03.22.18.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:21:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 03:20:58 +0200
Subject: [PATCH 2/3] soc: qcom: ocmem: register reasons for probe deferrals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-ocmem-v1-2-ad9bcae44763@oss.qualcomm.com>
References: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
In-Reply-To: <20260323-ocmem-v1-0-ad9bcae44763@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ovkp1VqYDxWwaMR8IKDklY9LWDBhmym8XUwoMhAE84o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwJV6Vj/y+dCfsYjOm0y8rISa/fzhnSHojswMt
 s7VKNlFpTWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacCVegAKCRCLPIo+Aiko
 1ZP9B/0Z/CqdTO8a7oDv9SSpx4LWL55qHDrKrb7vR0Xg5HcBhgQUDi1erJKvPeIGjOf6IfvMoIg
 V3bt/fAQ+z6Qe076GcrZUYqv0OL71iF3yA/hmp8452t7UmIDk/eQ7so7wqptDlvMppNeLGm8MKy
 SkS8l2GqyBp0d6BZiW1KmVXVrCMlnFaFGTCuuo1nSCkDkuDnd/JZKe7OtJRvfeHy/iPgQIGR3Tw
 Nr98dO8ehvwwv4lERpbFjTd4Q3v5P1+NfiBg4BkWpN80rW73+7zIExu/X/29ArIxr9izodQhxdX
 Z1GMLFwLiai7gFK6BbYVDNEQtwUZJ8qFt4iXHd/JWzXjNR+5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c09587 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=OYm7Fv3sACm0tvZoCOwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAwOCBTYWx0ZWRfXxanfuOIWnvDL
 BERwnirZ7DJFHCOi9UCy4evbqj43yVq3/tS3zOBe5t5YXawQMESSAWUFN2Z7QmcMS5t2A5HNJ1Q
 GFbIzTajf7jm+PjUfnMsrvUuLVuknG+dBkI5mQd06iub2EZucX4tvN83MQzpjLd/SbLW3wUh5R1
 qrhxaAxZOK2IEecSrH89xpv2/ZPyvFrG26QqXOwDYzsvXo7BOuINrYBjT74wJ0HsJJsv6DliZG/
 55O39ttes8hC3Rs5ffQSN6DAT7rXlyaMITXw07Fr8nx89CfSCF7E00QbX5F4pLOCq27PYxI6TqP
 78NZX5yDWdJv8+gubT+ZMpVITcyI8AdVb8zO/BVQbVSohGtbM25g7+rXxJGY4HfZvf5NPZFCyb4
 zHPZeb3/BhpNhoSQe8LXgijRZ+LL/vGKZI+JMzwjmKx3GUCO9+5ezq8m+5qcxv4Vp1Xop8n5lpr
 6bsdfZyQ4FX79eHZ1tw==
X-Proofpoint-ORIG-GUID: L6TaPVvVdLyxbkhzJhbBDvXBkCvqFzCk
X-Proofpoint-GUID: L6TaPVvVdLyxbkhzJhbBDvXBkCvqFzCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230008
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99085-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0B1F2EB717
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of printing messages to the dmesg, let the message be recorded
as a reason for the OCMEM client deferral.

Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ocmem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index dd46bb14b7be..d57baa9cfa03 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -196,10 +196,10 @@ struct ocmem *of_get_ocmem(struct device *dev)
 	}
 
 	pdev = of_find_device_by_node(devnode->parent);
-	if (!pdev) {
-		dev_err(dev, "Cannot find device node %s\n", devnode->name);
-		return ERR_PTR(-EPROBE_DEFER);
-	}
+	if (!pdev)
+		return ERR_PTR(dev_err_probe(dev, -EPROBE_DEFER,
+					     "Cannot find device node %s\n",
+					     devnode->name));
 
 	ocmem = platform_get_drvdata(pdev);
 	put_device(&pdev->dev);

-- 
2.47.3


