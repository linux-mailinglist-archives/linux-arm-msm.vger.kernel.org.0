Return-Path: <linux-arm-msm+bounces-95072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jj3EOajpmkTSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:03:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD85D1EB99A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9245A305DD13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C8438C2CB;
	Tue,  3 Mar 2026 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcwYZn+Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PjBoBt2O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3059D38C2AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528547; cv=none; b=B0mvFeG3PNcW9GXzjdPhYRWJKQSAVDE49i3asinml9zRf4ZQhbBEvy4CUB8c0juM2or2r6QDX+oqwYbxpEYUtKumdSTJpNgo9+A994S10mMVf4ZarDiL36lSWjp0vrTu1DhT64dyuon95pqitMhCABtAK2XqeD73B0rGpurBMF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528547; c=relaxed/simple;
	bh=3jdrSYFufk9+/Tbwq5b4Vodf1OshkwsP1bTuXFhDNRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJlTj+qOCOu4UjM63mjoOtFxlPmX5MUi1SFe/Ogv5KpCgCoadulgsGmiwS3v0uaPkOKeWYv3qIuktAXT6IiDsYCLE/q6GGfyhbCvyRx0hnHpH0EeErDE4QD/yqSM0FHO5NUGTRCan+1VHKmbPzc0D+F033Xq1mO4Y5qLGm1qqtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kcwYZn+Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PjBoBt2O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623536fJ3361347
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 09:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AwkqWBcaGIcUUwHXOe0Z6D5tTbeWNwMj+0dLnxLa3R8=; b=kcwYZn+ZRp3y9Ft2
	RQ2KtTc46XCgeqHYtFT1dV87DUKjXDPqZ5TrAO/hnWZkjbEDV/dH2UNFqKbIA8VQ
	NDikCAN+fG8UqX2vattjhUGsNC1D2b7U4geogp6+rh5opIXfNM9pz1ydO+V0mPyp
	9Y/Z0A+UU+PtxDe0nYaAwtuvQ80dEocusSM037wqKKr1j3etpyQHDh8syDnSTKVN
	qyM9CQg0cxatTLSNaAxWQjijNzreulox9rVgrSFDfsOGj9iaIL3CPYJry6cxfn71
	8pB8nNuc1DvBkiPV5r/5WJ/XNKoVFuicOVo9CjtAcp2W9oXe0DiQickv3hSImN1m
	Vempag==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5frseh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 09:02:25 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-45a8cdc7e01so61946471b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772528544; x=1773133344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwkqWBcaGIcUUwHXOe0Z6D5tTbeWNwMj+0dLnxLa3R8=;
        b=PjBoBt2OZRkMWHTLufXpV0QljecD4Ov9m0ac3zphlJmgPq2jjhl3VlQMD61eoRYvBm
         +Tkg4eQHZ6vFCbwwrB5telkc8kdjd9aczHEEyTqXTJ8ufi/Og/EcnVj0r20RCf8NxQ2A
         kAKWN4qQA7RCQv26h8VxQEpy08eRl7FHVAW340UD3lKdTl+0bJt3MxCDRd5iZcWTjqR0
         LOJZ8+nwMFD8693TG9AX8G9rDUT0AV5ayR+dJaDpzhInFHO0JWR4QhJmOQGIuAwHjOcl
         wSagLDDjhqnJ/Rs7xdKBDr+/GF62yqM2LE3MGiGYslS5bX4vWGmX/63NVKW4WdyVrwi0
         /BbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528544; x=1773133344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AwkqWBcaGIcUUwHXOe0Z6D5tTbeWNwMj+0dLnxLa3R8=;
        b=kxia5Eb6fEAnH+T3DMTmfjxWbU8DbfgBHCGRpNAfmAbr+DlUGLEJo13nW+jP34zERL
         iN71siIbFiNS5pURNxmHlUb5qhniLZfcgMqRBbJ3oFuNmCr7DJfffH6TYLSvmWzLAq6t
         61WFPCC7W68/HIQKHaG8V5Lbu3HxbqRRB9diXM47cbSk3r+aIo6Vw2JBcuXYaqy3T26Z
         wQZ025Z7ncLT6SBW0NI/9BfqjivA4O/V5rW9ZEivuXJEDD7bMPzKzRozdqIiT4CHh/2s
         7USxtF53CCixW//t9P1V1lWnbcsjSEVEW7Ij1e62+CZco3a8pyED5+CGn4cWiKehxxLA
         MGBA==
X-Forwarded-Encrypted: i=1; AJvYcCXEhjhUzhe3qWU2JitRox9qjcsOqi1cIc5LqyAlsvz+K8iZdDtiRB0jQSUzR77rxP4l4oLgc137L6zlIIwZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8scnfPM597L1SonTUrPcRXaqgsq8XVpxTv0CDlHw8bM9R3bTj
	mho00M6M/aPPudxvLZUJO1E+BuU/01x9AbX2c5/vPQyxPukmgeQ1QEPRS9x5j8JVuwgAHkN3vdK
	xhODjNFf9XQj7PxuDwLnCaryMLfUYdPVvAIk5MhG54ZUno3QWftLsvemPRpCQg42RuvWzK93vEk
	/5i8g=
X-Gm-Gg: ATEYQzwFLlAIBEZ8FGNF9FmiIMmBNNFkQDRVr4cLkhWlmjJ2ge/2guLtirTZBMwObey
	bJfY+6S1Gj5bI7VsJ3509lhPDQMNC7BzQML/Ld6UJSru5UmawUZxJnzShGALoampH6WvvUztw11
	/+1NZvkK56NgI50vZUM5UzM735QA/mfQfjXclzzjOKPFniyu6/6OcCLYJBrrK9APxu3Hd1GrUMn
	kx4LYiicdmrU2/QP35OoazX9dm3Eu6MkXmkuzSsOj3TlzVPbl5wBaaBfDhCXZij+kEjVftKAEnM
	xZ1yWACdh1gP/fg34Hc9ONFa1v1igYnUC/L2GkQfTBk/rRB+niXsrEOHjw/ieQlwc42bxIwhskW
	dZIokErk5mcUKV0hcvJKxfu87Le84FexXWWJFKA+g0IA6Vms2lbWvNPtgpA9k1IeK/f2u
X-Received: by 2002:a05:6808:2894:b0:45e:f07a:fd0 with SMTP id 5614622812f47-464be921981mr6049619b6e.6.1772528544242;
        Tue, 03 Mar 2026 01:02:24 -0800 (PST)
X-Received: by 2002:a05:6808:2894:b0:45e:f07a:fd0 with SMTP id 5614622812f47-464be921981mr6049608b6e.6.1772528543849;
        Tue, 03 Mar 2026 01:02:23 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb604f5esm9288908b6e.18.2026.03.03.01.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:02:22 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 01:02:13 -0800
Subject: [PATCH v2 1/2] bus: mhi: host: pci_generic: Switch to async power
 up to avoid boot delays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-b4-async_power_on-v2-1-d3db81eb457d@oss.qualcomm.com>
References: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
In-Reply-To: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772528541; l=1362;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=3jdrSYFufk9+/Tbwq5b4Vodf1OshkwsP1bTuXFhDNRo=;
 b=X/rlUdXBoLu+hAOze8ikgPO4qyNqDrZJcCS1nj63JaJ3DTc0/gu4BxxQkxD9GFoRSBQADLd/q
 j+Fl1Imy8hPDLMIPr3P1RQytOeOcw7ZIvK0RRMEOtcc1ej8nIOGmqKA
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6a3a1 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yFp2A1wA7JFfkWW7:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xQtohAntiWRCc_MJuAAA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: yZ5FhZx6BZgnytnbc9Zm03gnhA4Um0-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2NiBTYWx0ZWRfX703heN+qiZd6
 owjj45aZ27k6gPDhusdaJbHoFy67wJQLyFDTbSRGSvAgNREW6XOluYhiVX7juNW+bkhhNtEHi81
 /fTtopaSkl3o3NKU0PobiF4JBPAEjZrX49XogRS9/uGE6CvCH5DRaC39RYxfOLWxeqi/URLAwAw
 StO/h6sUUeNKJ0rDBErXTQeQQO6XcaZrzcoArSGEQrEOftgI+RQHc2TsAeyZ+17GPe97SmEw9df
 atvD6haZqcuPxHT+uyW2avabhLZpI5E2z44pW23WvmFRjTFJz2EYpgsKLoVTk/QcgSdvkW748E3
 4vpFBYvzQb05njV+9nD3Lwoy0WdrvOXrGjRdJWadu46areBrn/Xq4k7BqZghpJBxVTfF2KH4DEA
 Z3KbmuZGIY/qWYLmMAlpILfUNVqFuVriZFkhBSTyCOqEHUh3+RPboNSis+efRGPc3P5KGX/BXgq
 jIvfj70wt3eJiS9b2Dw==
X-Proofpoint-GUID: yZ5FhZx6BZgnytnbc9Zm03gnhA4Um0-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030066
X-Rspamd-Queue-Id: AD85D1EB99A
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95072-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Some modem devices can take significant time (up to 20 secs for sdx75) to
enter mission mode during initialization. Currently, mhi_sync_power_up()
waits for this entire process to complete, blocking other driver probes
and delaying system boot.

Switch to mhi_async_power_up() so probe can return immediately while MHI
initialization continues in the background. This eliminates lengthy boot
delays and allows other drivers to probe in parallel, improving overall
system boot performance.

Fixes: 5571519009d0 ("bus: mhi: host: pci_generic: Add SDX75 based modem support")
Cc: stable@vger.kernel.org
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 425362037830ea9ef30acab748b07f04e47f3d90..0395a8ea52b0e874209ca56cd20ed04419038cdb 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1405,7 +1405,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		goto err_unregister;
 	}
 
-	err = mhi_sync_power_up(mhi_cntrl);
+	err = mhi_async_power_up(mhi_cntrl);
 	if (err) {
 		dev_err(&pdev->dev, "failed to power up MHI controller\n");
 		goto err_unprepare;

-- 
2.34.1


