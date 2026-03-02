Return-Path: <linux-arm-msm+bounces-94945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEOeJd+UpWmPEQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:47:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D191DA0B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 14:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 654AA3008D17
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 13:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FDF3CC9F5;
	Mon,  2 Mar 2026 13:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh7RFisp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3jGm0hG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2803F379EEC
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772458893; cv=none; b=oxHD/B7j5DVG8Hc8nK2flBmO3/3/Vv+8qIs60LcmSpZW+9a05FEimHC3UWjk5ulxx5iv0YzDgPqQ5iLwFtjlxk5lSJ35UhDBEu10N26JHmB35Omj0WYpjNRV33Pqz5KWPmDwkNaAvEcZfN00lbd7ThZw6ikF8p7PLv4SnoMOphw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772458893; c=relaxed/simple;
	bh=BeJmXbNjoTu7+hHdqxvNZAqQtEzTchLcnDzAK50yUcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZINbP+GY7RTJRubJfB+NMhoJM8NzOFYzzxfP+KkFVNuR5MK9Qk7k8L0pvSDCSnolt1BPawwul4AxhQOa+uyrObXyhUfok9m0an+2FPwQQ6cTlI2sqzaDcmSKdwUZsyV4mqvSX7wXuXmhdEtSW4b66XBN6adG+A7luP9gzGgpFJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh7RFisp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3jGm0hG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62294WkJ3752705
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 13:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3FvuMRTJ9t5Oa3prM87UIj2ZcMgQFfKYy0B
	Eopqkflc=; b=kh7RFispu0Iu1Fv1+SHRLwEdXJTooXZHWkzTJNjOC2F04tuAY50
	fjXDRPg+RwH+WdHTXUqSmgu3FqvewLehBkK2uQGvShNK9dLNm3kLXUqjSa6Q5kz6
	H3NsH6jPLAAvW5ENVxOCzBopCvpmN4QfV0D9PFRo464Zaqo8PvwQDYVqiAIi/bn5
	0Z786QymS6rQXB2Xh4GofXseLiSKgv3841q3cHXu6bVuTnpKOU38TqmOkW0jz5sw
	hfDc2mm/eiu1EuWGVvLbMNDxD987SvGoin2DZJf3ER6oUq0c/amlS1o8o4zQr5ow
	jmqMF4sxqn8FIEgIv9oJRaN9yw4cjNAaRbw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7kq8x5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 13:41:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70f2120583so2567582a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 05:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772458891; x=1773063691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FvuMRTJ9t5Oa3prM87UIj2ZcMgQFfKYy0BEopqkflc=;
        b=L3jGm0hGw4v1rpCWigNk1UWRQGcNm8WQW2ayVNZWZawCW3FJiG/aub1L2Zs3rywYN7
         zD+AnR7vJpgvgEI+2NU8XEIqMtGlYyDcE2Q6vopqCFFT0qehIsGulNV4DFUW9vsi2BqI
         Z7GDXDVjor9bWQ41Pd1jHsvHKGPjNYljVVsuNoiDRN61OHhdkEv+bSCh1zA8Bnp8wUwV
         Cv11+H8hR90X5Oo94gIRvGix4xFhpf5SeoF+4dDcVYO4UqIYJKcQej/6uQE50Zn8rndW
         RjDH8ypzHoQxPkbwntyN8tWZHkWRlAytRUIr6UQ1jtC3d0QvPRZtZDY6kMIBgO89NUNY
         vi+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772458891; x=1773063691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FvuMRTJ9t5Oa3prM87UIj2ZcMgQFfKYy0BEopqkflc=;
        b=bJayAD+N8bIGJS4Ji4tXSOtkiy2AiYb56CChcFk+puS7uoZ8LSmCTuTosRyGWyo4wH
         LRH4BfKAuLBVtUJmfHT8X0ShkaLx4JjHkh9ryb1dYJu3ZW+5b6f1g87FvRV7tZj9w/YF
         DkB2gLY8EIcLJE5pN/uF9G3Ig4OcHLw3wisVgtzte4b/cwYCJnUQJYarjbJDj7sK4eQi
         H+awJdKgU7PM8PDU4TKZEDkddXYxtI86AeReqRt03buBzcrRV+72z3DdI+VXKKOuXsSv
         oZ3/u5zMx47d3/ez1BsNTgzWd4TrNXBYk1pYWHSGGkdxbx8LsNOS+QwV+7p6Kv1cXPIC
         nJmw==
X-Forwarded-Encrypted: i=1; AJvYcCVfPrm1GyysaCn8vdM37JVaLQrAIM8p4vzEnaD0fJmvazudJN01cvWpjLsEpYCd7Ji6HXn3MMfy19ZkDT66@vger.kernel.org
X-Gm-Message-State: AOJu0YyzP9uBLXfBU8kreQjrPY/iPQfF5YDtTaV16nQ4qbmeckm8AHhC
	4FoYgQ8hX9qFlHliISkDBHoyuo+mI/y5kGM/x6OMtHdYwpiKxGCZ9G0mk71NN3QFnchlW3VcmaZ
	MLlERvGLMKPtJ1aJjCrPcn10A/G1ofRMzEaKRwEy7Le5bOEEY67+ai50s3xcg7hUZaVTO
X-Gm-Gg: ATEYQzw6XtwmbOpePapWf33dT51dU4THvBe657E5rwgxop69PgEhafds/mG5mNwtDgL
	ja89vYI1koRnmwa371dAtsDyWJHmVo06LTqWn2Es1IH/3JGzacIxmP1PZBhzG3vh1fjx58pmfCI
	dNRO0sisX6DIILwOaQki1XWu2K08A9R+d++z9ZmM//VD8K5TdyIR3QXw2LfVnliAUOHa/OY4Os8
	anOvbjXLBNcJrj/AWuJozOUAeS3LOsDfgpEo2IU3UEEF5i51uyUHN9tRONdkRPavOylbEzoJKJ6
	gPRH53eTiLZrZjL3bFfkaDxgyb7RZi/KledGWczDvMbyT8jljATqGXqbVZMmwNVj0LQCVyqr4BV
	3qcw5a5fVbMqtLwgsK4bbXd/mWrUY57jizbNu8Fk4kQ==
X-Received: by 2002:a05:6a21:4982:b0:395:d4e4:2bde with SMTP id adf61e73a8af0-395d4e432bdmr6390680637.30.1772458890611;
        Mon, 02 Mar 2026 05:41:30 -0800 (PST)
X-Received: by 2002:a05:6a21:4982:b0:395:d4e4:2bde with SMTP id adf61e73a8af0-395d4e432bdmr6390658637.30.1772458889986;
        Mon, 02 Mar 2026 05:41:29 -0800 (PST)
Received: from work ([2401:4900:88da:227d:c631:5c3c:695f:8a61])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa632ddesm12292498a12.13.2026.03.02.05.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 05:41:29 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: mani@kernel.org
Cc: qiang.yu@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        stable@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Resume the device before executing mhi_pci_remove()
Date: Mon,  2 Mar 2026 19:11:16 +0530
Message-ID: <20260302134116.18960-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: K_xiguNRCP_uCv-1Mb0oYVaODiNfALOc
X-Proofpoint-GUID: K_xiguNRCP_uCv-1Mb0oYVaODiNfALOc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDExNCBTYWx0ZWRfX9TWrd88QCvwO
 IK6bD6KmmFjZ+Ys3cY7XZ3YAtBjJfxKqgdzEL3CyX3cUzHyvO0KmE0aafcAKe1iEqAugzd+z99T
 1a395eWeNTK2lY06YVh9D285uvotDwZG+M4S2mkbBpJhV1ygPPTpumqdDsDCZN/gDV0uVv4/ab5
 Rlsp/0JF3qM14+V46YnSq/K00HpglaTGVgMQHNodGYVqbMc35q1NsrPgDYWuzB5szvFI8x6qCv+
 CIi8bjPkBukTsWGKDFdIY11GTPUimEaSUSGMlsXj8lgzHX8eRwpTs3dB+/HUU6J4PRu6jHD3CyX
 TUbTG1z/ZkA+y02frSrj5ZD76qfcnoUXh8BUcN2JW+f6w9ujNdo9ZYwVNIqfwYD115LX7vGfZ1h
 wbRDWrBsJUlrN154Ny3ZfRYrh2Xl8YOz5VfjZFuLNSJueYflmX1FoWILKNdFKi4jUvMcj4cAZEb
 n9qbkmc1UI/ErtCCueg==
X-Authority-Analysis: v=2.4 cv=GLkF0+NK c=1 sm=1 tr=0 ts=69a5938b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=8Mze1DJ7461ulW_4NyAA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94945-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6D191DA0B2
X-Rspamd-Action: no action

mhi_pci_remove() carries out device specific operations that requires the
device to be active. But pm_runtime_get_noresume() called at the end of the
remove() will not guarantee that.

So use pm_runtime_get_sync() and call it at the start of remove().

Cc: <stable@vger.kernel.org> # 5.13
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 425362037830..fe3aefa15966 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1440,6 +1440,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
 	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
 
+	/* balancing probe put_noidle */
+	if (pci_pme_capable(pdev, PCI_D3hot))
+		pm_runtime_get_sync(&pdev->dev);
+
 	pci_disable_sriov(pdev);
 
 	if (pdev->is_physfn)
@@ -1451,10 +1455,6 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 		mhi_unprepare_after_power_down(mhi_cntrl);
 	}
 
-	/* balancing probe put_noidle */
-	if (pci_pme_capable(pdev, PCI_D3hot))
-		pm_runtime_get_noresume(&pdev->dev);
-
 	if (mhi_pdev->reset_on_remove)
 		mhi_soc_reset(mhi_cntrl);
 
-- 
2.51.0


