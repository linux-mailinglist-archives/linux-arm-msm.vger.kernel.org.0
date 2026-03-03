Return-Path: <linux-arm-msm+bounces-95073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KQaKe2jpmkTSQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:03:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AC51EB9A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 10:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9F813060CC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 09:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEF738BF60;
	Tue,  3 Mar 2026 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TH/djS3G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxeeDuB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736E938C2BB
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772528547; cv=none; b=ayZ5fTkv9bDy/9ViRw0OMrwihGwuxjH8eOctdm0fHYipQYcpmpGar6w3t01WwGRt/SdewY3Vgn2Hz3fziHFkQfwkrs0xIm2evOxNIzPzH3IRBYbylv02bQMBQ/Y0DTCRKp/5XAaA9yGQtDCEyZ/oJWfzhMnay3JhSvYf+hrmUlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772528547; c=relaxed/simple;
	bh=2f6yMK46tPJaTveXsb0Gf1R1SLcm5dpehHbEx9p98Vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZvuJY9QDjDYOx3WMCvnQpQwsBIuosGIrkB8ZV+8pjAldrmty3aqBDsVh0D1gGXitgDBq5r/RljBDmZp8hoPL0QOByzaG7Y/QGzAWik7W8F8RoY2oSHPWWZokqwhOc4s4onvA66d+5kgiyJOgAfSfruWASfy84+pKFoG3RYmw7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TH/djS3G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxeeDuB2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6235s7m72207894
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 09:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	APytyPy8g8LI3V1UZPcKWFEdvHQQgjkqWH1jGroneSw=; b=TH/djS3GwCUsziui
	/uq3T8a/yWrM5DSqu6CRyl1KSpSjjsGZqCdDKFRnzVkaxRD644Xj8P54cqQhOYYn
	YdsI90Twx3dUGZUggK2tYU+7+8gWp8E9Pav4efow+Q/kxlaQ/DXHdKGzrWIaDaL8
	jMWpzzGblYQ807AXbkk20ZoZJtxSSNMvFXNvtEXMTtZAK2SIK0OYNPKuxE9SMm7z
	nBiBxG9M4+QzWeFwPQamS6f3uaqviSqLvfPq/lV4/am1waZsEWXZHYlnvqbR/4cb
	dzcLM25+JxrFJVQgj4/FYh3ZMNo4ZLg1QrF3s660UHfmUonaqvMmB7ufbYWgw3xE
	p0uZrQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnswe0kvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 09:02:25 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-464a0af43deso29432174b6e.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 01:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772528545; x=1773133345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APytyPy8g8LI3V1UZPcKWFEdvHQQgjkqWH1jGroneSw=;
        b=FxeeDuB2xSoHE+NDwxxAtxKb+dmZ0+K7QS+422TYlfhPKEGqGJEtF4m3WqCjXYOPJI
         5luREB6NCNJ5AOmW36V7yUEfU8z3mXu4NK6L6Jtjtn2UnIwk7xJ7YUaweZKUcO5MwNsA
         TsfL442Yo+BX/FdEumRLaBVbWUhDRH0KcM9oQ2+nTac4sP9zCHjxssywq/1EbRKrD+JX
         KFmADgcutSZW2sBV22a7MmiNbzzHB1tdkvaJP6uRS/D8JoGL+03WLmd8kwMTlV338qCb
         cwKrSmB2o2liQ67bsJ9O/hDhE9VkfZdSypMxR2+eZGADEGi+LmSTyI6mUR2Xq7DhNizZ
         b49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772528545; x=1773133345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=APytyPy8g8LI3V1UZPcKWFEdvHQQgjkqWH1jGroneSw=;
        b=uiXzW4PHXAbK0dDhrSLeVhvRFD1Q3Y4CPgRucUNp25xOTzC+dZKsFm25ctBh07sk7P
         djOCso2y3XuekQpbFaH/HYV6MDiSawQvL8gud+db0p+J/TnmneXdUupcT1WKt6bO8KYZ
         atUfU13pzWY3HK7xZoFiLCgvKerDTls2gJ9MFjSJ3XM7AGZ8SvX8HI86jbk5EBmglsiN
         nlpyo6RI9Pzh/X8pSc9pLlxzpJO2y9DHLYN3GPOm8RJdsfogAzee4kwaDwpMx9hQteUC
         KAVWB/jtcvQmOuk3/qijd27b9H5fYmjwllRSMnUENCxVm7mupHGy9X6aNCWo452ILkXu
         Z+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCU0xHB5S2sDSoKqgq2JQa0OnSVuGNKm1ouA1v9kR32tVOldxYBd5Dx/tQmlTBf8FfYA3gvTt+1abraZpEx+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy0a0CJ4mPPAcHTOoT6N69Tt+OUe9COfcFKCq9kGFpb+CFOZOD
	SGLahcd6oCkK+j1EcwP19cJS7se1ZRDbhmN4lmGT/GUkk+Eta1kSzM4yHvoY4jtEDP4CWZk6dgY
	oQzdsMd9EGrgWxQH95kpEAbTOMcNTbpwhAo9JgSwS1n8/5IcZ4ypyZ9bPBJBXqHcBfHw+
X-Gm-Gg: ATEYQzwQScr4O+uRFDiSahzBkjzGbFhz0oHq6f40Ayjlkg1lYJHSdONVhNHJFR7PD6a
	lnb+1ct4O/whF/hqO/hQjXl4VRsfYzHc+qqQ8HhWz3EiCndhEePfJZRcHM5begKSMYH6NCJdPEu
	YzOnbJk5/Posxv2ob2+yaFW3X1Ny7+NaFF7TnUXvgT/6QbTo3iThA6xULUYiijq6KxgNwyadRrO
	g4U+sY4gIVOVcPHS3ayyibv4lnelFVCg5vl26xsw35jmqAVUKbmLZnUvQYBbj6719kV24T+yyk/
	Wn3XO9ONEyEOq0wmlt0fTACmDcZcB1Z6h6WgVecHXowoXZpXUC63INqhVRuu+JlIpWBM9Sxrj3t
	kasREk2Dr7gJpV2df8JeNidGOha6LHT5jh06WoZLBT5miNrHRjTjs2nkuZfllfs9xPmw9
X-Received: by 2002:a05:6808:309d:b0:455:d3f2:4bf9 with SMTP id 5614622812f47-464beb3fb23mr8864482b6e.30.1772528545219;
        Tue, 03 Mar 2026 01:02:25 -0800 (PST)
X-Received: by 2002:a05:6808:309d:b0:455:d3f2:4bf9 with SMTP id 5614622812f47-464beb3fb23mr8864466b6e.30.1772528544862;
        Tue, 03 Mar 2026 01:02:24 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb604f5esm9288908b6e.18.2026.03.03.01.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:02:24 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 01:02:14 -0800
Subject: [PATCH v2 2/2] bus: mhi: host: pci_generic: Add
 pm_runtime_forbid() in remove callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-b4-async_power_on-v2-2-d3db81eb457d@oss.qualcomm.com>
References: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
In-Reply-To: <20260303-b4-async_power_on-v2-0-d3db81eb457d@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Qiang Yu <quic_qianyu@quicinc.com>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772528541; l=899;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=2f6yMK46tPJaTveXsb0Gf1R1SLcm5dpehHbEx9p98Vg=;
 b=ZTtVRJGYucS8HZEcniSuF0NvGdpFa9q7fcuuyWNKHjRiDNH1Q2QefDCtzZaUm39NQRWr/12QC
 6qark6kI3cACWaCs66a+AH05UiR5rEUG5FVMDgOFokxv+IQQnd8w/BK
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: VF3IRiEQ_jFtMgeeLv7T8tivtpHw8nF5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2NiBTYWx0ZWRfX9aCnwyEypaFb
 e7Aa0XQ/7LAPeeLVlBWtanvJl4R8clOEEx/CGXJg2b8Dnww1eV1dhG22Gsrwi9AKzaJnRzFxvtr
 /jcS3S4qeHymAwEiPqLU9jjEH4CuxvfrCwlSZ5ymJnY85tOXzl/lrX3tJCNRBlVnWXtTsVYQ5FS
 yustK1Kjj8KzvQ4P9jskf+EoqBrND2GCPpNv8Dwcq/r5bjlxn9iIWnwH5ZnIp2xn7JVEtVWB0Ku
 huYe/NC+3RZPwYyOSYsoJmrIFT/CsCxiWYQrqtv0HLGos8fA2jTh+Zr68Q/kuWPnVKLrJxwEdZv
 uMFhcmnZWSfkW3+u1PKofPVc7Bn/P4LQ5kDEyHXey+WdEDpWaK4WREQGqXYUM2CJCskYH2SA6xN
 2989pVA6kyp+QnLsKUpPidYVBYUyeMe/vAEkyum7L/VDKE7F0bPNK5P9Xds5HW1wcet5BqglvPp
 Yyf8l3vAJITyyQShGyA==
X-Authority-Analysis: v=2.4 cv=TtHrRTXh c=1 sm=1 tr=0 ts=69a6a3a1 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5YqorbGh3H_VX0Y9zHsA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: VF3IRiEQ_jFtMgeeLv7T8tivtpHw8nF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030066
X-Rspamd-Queue-Id: E4AC51EB9A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95073-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add pm_runtime_forbid() to balance the pm_runtime_allow() call made
during probe. Without this, the device remains in runtime PM allowed
state after driver removal.

Fixes: 855a70c12021 ("bus: mhi: Add MHI PCI support for WWAN modems")
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 0395a8ea52b0e874209ca56cd20ed04419038cdb..b6b21d0f3388d61b771062b8077f836a6bf8f9f8 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -1459,6 +1459,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 		mhi_soc_reset(mhi_cntrl);
 
 	mhi_unregister_controller(mhi_cntrl);
+	pm_runtime_forbid(&pdev->dev);
 }
 
 static void mhi_pci_shutdown(struct pci_dev *pdev)

-- 
2.34.1


