Return-Path: <linux-arm-msm+bounces-110204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BMmI7znGGruoggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:11:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6375FBDE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 03:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 776103064087
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 01:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C06A63546F3;
	Fri, 29 May 2026 01:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2U6yIqs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUk8rV8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705C35200C
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780017038; cv=none; b=gmu4+e86OmvZVJR3Bxti/7ipDJ40z+bUOjulBOPKL+IsHwggIWtPmARXb30HqzfL76mZ5f2nQ1w7ndUj181gl1/jOvHBOoKlyj6685+l8rx75auezl0TD5SCeHOhtHH99Cp7uZAG4bgrG6udBBeGACNxED9+/3oRQ2pwyj9+PoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780017038; c=relaxed/simple;
	bh=SqRYyWGxDpggIYoY312hZiHBKDzS7/Y1bj/4uMnD8EA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2K6geOPLCjSn4dWGt1mgiF/WXJo0Ja5ZyWGHAPRRo/cjMnclfHaPTXg/qom36AbckFGlEsAbVtPD7qmyteshFCaVVd96j0JmBmmL0iTMQZU8sUf5aj6CCBFSOy0vMal0PjA5pGm3vwayHnQj8A/wCCW2Ps3m/IQvU9HkJeun2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2U6yIqs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUk8rV8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SKkSJh562424
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3m15oxw937hnCUF7HC9R6PrqWp2ss+eoVplrm1OGcVw=; b=k2U6yIqsbXGzlfv9
	Jkz8GPwIROxGvmYMXqyCLYLTfEzhcT2hfU62gKWG9yu3gPwFgIBn3CEH+1Wl1Z+M
	+51S11FRPKOH9Jt7ieKGFHwLXqoNgq3yQqFqUYE/kygOZ0nedyyQmhObq1lEZFtV
	XU+N+fc6OebMrbwH7NwhIcXGRmlXaqIELHPIUs3YP/1ztsnFEWTofXcAWWVXKqlV
	++h3ZY6O6dy3qa0t0h/7w3ac+sMrGllcleNwUiVpaIfSU8Dj+7ytJWq+IASKELMv
	nBgJMWZikQ0wrBvT9njDdFnAiSgOWkc67SR0PLN2FAOruVl9PBzmS1WIWDYRI0Dj
	wLlcgg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug110g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 01:10:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304d0d0b28eso997803eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780017036; x=1780621836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3m15oxw937hnCUF7HC9R6PrqWp2ss+eoVplrm1OGcVw=;
        b=KUk8rV8qsejG9eczKExSh4KZ0MZqZSFi3grNHx6m+yqxZhw+T6C6/8BwEy5shQx3iS
         04E24UMeiWVvCdLkNLMhMuxvbXyNRZnP0GmIprt4Zt1xy5RkfjzvXC2czhU7rPSqdAkV
         +gtu7+RvYQJz8O+YQ4UrZUs3w77Ee+0b2zB06+NCMHkW+N4YRA4vcgVCjaf3uDlx9GVu
         E8cxVMmmdukEfZfxkHlEWCsXZa8fOLHEyIm6AKNHvJI7u6+SOVrE6fDqWQPRMIkObFmN
         4AKg/YgZUaiSZw52P5yWPvTjInw5t6VL5f+BBHQcIBK4qvsyp2lFztN9QSj70MBcnz+7
         uF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780017036; x=1780621836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3m15oxw937hnCUF7HC9R6PrqWp2ss+eoVplrm1OGcVw=;
        b=c7/8XXfFG20dvG8I35H42l2Fl/cKYMCWBnyfEzmPCe8WVHFCP0INRNokxlYBG2MWlX
         OLJw+sRXVKOm9x/oVp+Zg7jvp/TKr5oa3oBGZ/dknAq8XFKCuIQVo3XsRjjOQ+/zheiv
         IXHBTvvQA6IkZe9drp9zXMf3nWSlXdKeCYRWwuQBPPRTvmy2xg4lLPYt3eq3vWuHSdqI
         osRBO36xplgmHmdSu9QeCPtSJ0WUcmA0y40IruiDRx2rTUFDk/bAxUw1wx+ROwcLeTlZ
         rQr1dmAeMsX7YWqBpYSQ/uHCjNJVT/3xKbhJiK9ANiIelq8GqwsvPOcDkPqtMXJDkuV8
         UymA==
X-Gm-Message-State: AOJu0YweOHP3N2iwueg6usX3VTiq408XqfS0DHU62pWijIqBNMZEJTLE
	wZNn4Cyl6jJd2ltOEVa09CQR9hnc632Hp6qeB6nbExRq3YPS9sHYdlLytUjX2sBHW4XnLn77tC4
	SU19uTx+L+Eq+sp2BdyIwoByoF5xUPFlWbvrCguBnI1nPESlw46j4Fe+H61Rw/5kvi9gB
X-Gm-Gg: Acq92OGMt4Nz43WkDi/QsxheGM/PkKSOPqwgpg4vwgCWI8SP6kGM/UlIvQUC1VGVeP3
	kewJGlLGY6b6MDQpwjF2IfqYy32meoUgWB2Sp76lSYYLEHuVls8brx6eZrX7qiteVudPh49Z233
	hy2IMisRhgc8ZcktdFOq+E5JGntFEWugNcp9RTZ0UPuDHhVKDQM4/BQp0uRTXm1jqXTSLga7LYY
	CzLGE/0KrqQXpfU7cM2z5kZ1cT/LLi8USF6PKQy6eWakY66RdBDd33u6UgSQuk8ZliMv/VqsStN
	bR6YqV0MJEVqJvvURNKEs5kYOH0D/uPmtE+t4r2b+VkK6X4U/bsAzUKIJg4zDQ6Y2HQZPK7eXh9
	D3Jed6VYIN3ravlT9Fe40hE8jt/a5n2vmQCQUjcWMTRw15HnMH5CZihA3RGfrsclm3oliqA==
X-Received: by 2002:a05:7300:7313:b0:2ed:e15:c922 with SMTP id 5a478bee46e88-304eb161d3fmr378807eec.30.1780017036069;
        Thu, 28 May 2026 18:10:36 -0700 (PDT)
X-Received: by 2002:a05:7300:7313:b0:2ed:e15:c922 with SMTP id 5a478bee46e88-304eb161d3fmr378787eec.30.1780017035380;
        Thu, 28 May 2026 18:10:35 -0700 (PDT)
Received: from [169.254.0.3] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5a114dsm173785eec.24.2026.05.28.18.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:10:34 -0700 (PDT)
From: Matthew Leung <matthew.leung@oss.qualcomm.com>
Date: Fri, 29 May 2026 01:10:09 +0000
Subject: [PATCH v2 2/2] PCI: qcom: Add support for Hawi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-hawi-pcie-v2-2-de87c6cc230c@oss.qualcomm.com>
References: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
In-Reply-To: <20260529-hawi-pcie-v2-0-de87c6cc230c@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthew Leung <matthew.leung@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780017033; l=919;
 i=matthew.leung@oss.qualcomm.com; s=20260428; h=from:subject:message-id;
 bh=SqRYyWGxDpggIYoY312hZiHBKDzS7/Y1bj/4uMnD8EA=;
 b=x2Mhs1h6QGe3C4hNRrzrpoZoETXQ2icHktNcZc//QGUXgaYDXCh2J0HryCQSgSeaG6TwVcjag
 AjHlnzlbhLMBN167zvse9emeWKy4lZdA/Veg3xo7Ms8JJvicb1ZMpOB
X-Developer-Key: i=matthew.leung@oss.qualcomm.com; a=ed25519;
 pk=aT25ggJo5PMHLN9N+TsZ3s/BVU++kEYuiFebPWe21+o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDAwOCBTYWx0ZWRfXwEf673knyN25
 VDi06neaD2bq8suTgNiisJv3zIJ2WT3/JYfcaAukgMKjhy/BzKLwiHaqXAnhPwLcIYS8sQgpG0r
 fRV67m7IDz1qF1SjdsGJ7Yg2gOv245Qxi5B6lJguFliwkfKaB9/MJSGzr39g20/xZp9v5IYJmsU
 NtcG8dbdCZmBHLNQrwW/RjYumslgom8LXwp78g5vPqHIJqEfvAVaz46REdQUT+IyCNvQ9DmtXot
 iEGkxThwGyxYNB1jyoZS2TqgaTMEXsubDAWpnD2dRG50SBvpcmp9cXEMY/zY6pdh/SbApd3wobq
 w0McEpldtTiW5tJ8lK6fX/xH42G7n7i5O8Q4rsFqzNg2usKTSFkobTC6ViJwMxf+G1CyEEMDyjF
 rcRsec0dm4Ot72ZtbcpcBnBZ+WiqUMOQgsc/1Qx5Eb8D4TYDKGd7Efazs3OVeRFLZKEtR0pS8Uq
 mPfSez9vk5BOLmr503A==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a18e78c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KdxOZhL9OB_EpBcCT-QA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: MZt2JqTuX7s1AyV9ABxJFUZ32FK4y_XA
X-Proofpoint-GUID: MZt2JqTuX7s1AyV9ABxJFUZ32FK4y_XA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290008
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110204-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.leung@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C6375FBDE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Hawi platform which has two PCIe controllers: one
capable of Gen3 x2 operation and one capable of Gen4 x1 operation.

Signed-off-by: Matthew Leung <matthew.leung@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 11fc60489892..5fe8667fdb8f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2280,6 +2280,7 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 }
 
 static const struct of_device_id qcom_pcie_match[] = {
+	{ .compatible = "qcom,hawi-pcie", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-apq8064", .data = &cfg_2_1_0 },
 	{ .compatible = "qcom,pcie-apq8084", .data = &cfg_1_0_0 },
 	{ .compatible = "qcom,pcie-ipq4019", .data = &cfg_2_4_0 },

-- 
2.34.1


