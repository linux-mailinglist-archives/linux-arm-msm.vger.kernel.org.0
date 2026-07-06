Return-Path: <linux-arm-msm+bounces-116873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KxDTIZe7S2p/ZQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:28:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B865711F84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:28:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aXpKcu0Z;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ii0+EYZI;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116873-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116873-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D144305EF78
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396A133DED9;
	Mon,  6 Jul 2026 13:53:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD0632B105
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:53:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346008; cv=none; b=tn+tQVuXqKum8f47VhbCUc69mHjPyIPnApZ0nGEc5sAIymxrt5x5TD/rmku3iEtokVpCCiDLXTqTC3UTcYBoWGf+Bkh8BscUEa2ZybH6dcvd42dXyKweWWig6jXnRfL7wxAvYYq6K6GcTNeSYyIkkQsBG76ABHVawO8KFjh56Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346008; c=relaxed/simple;
	bh=Ie5pYBqhk3vp8OQsIMaFbe7S/1NFcDmqVuYASiDHrc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=breU0nOmb1okU8SH2NxZ7kvnwZs7TQwmWRFZXpHwbp0FPc0JW4KS5W70+e09vYEhM+UvzMUXcCiNxxVaascfAMlWY1pRPLn/uc94QXan4eVHF2iFjQ/dNgX1vGid9MhSmCt5pOsvMumqw61vOYJiywU01y5ndZBbeE2a5Kky7+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aXpKcu0Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ii0+EYZI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxPbR369525
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gh+NdjO2RmlO1SWD3vOIOXcduq0pfLcMmTUXy69Xkyc=; b=aXpKcu0Zv5LZzomM
	nyrUBYWSHt1GXQF3BFh+eV2Uj4uHwpwgoEHPEL4SfAodn5UJTY4Vb4POgqCtQBEH
	ZGX5ds9lr/bti8oShh/ssBZ/PsEN+G4ccwpK5U2RoFTD0/Lq/hFqp38jn661njeH
	vnsXy+t/BcORj/VA2VJyLfW2ZcMohRD5FcOj320rnrJWjUDgFLpV4jQMC6PocrCJ
	cVgJAiEaeRVg5PEvxv0PBy7rY+cS8lZf/La3afsCvHlR0bkJLwcjPLW/MjYBjoBA
	/I0ANUdDd68rU8TzFd3FEmwpAkUjsOkp0YU86nVFMWfNYn/KVMUN4/0RmYs9mXjA
	+Vog8Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h99cut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:53:25 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bbd4255f46so550553e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783346005; x=1783950805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh+NdjO2RmlO1SWD3vOIOXcduq0pfLcMmTUXy69Xkyc=;
        b=Ii0+EYZIIjRGdCzQSWv3T0cmUrCj03f/ZyPUrZPMtbnGZUgbfYBWXfS4vk3V2+ZWFo
         8/lUluQRAMWpwzsjPnG94hcriYIz0x1f4lZKA9i9byvUoFz+f0wyFW/ULi4O0R7G1Tf9
         rke7lufvV79U+iwgquZuFj7U77GfuOpn1das+GvgWrpCmr6JHWBMMEvBs22CVI+9ORAD
         EqJotk3tIFh9OAyRZSlt7b3ie9HMQEC3KEFQ8v92i7N1o9n1e5H39+PU8m8fUWnd2zlt
         TBEaniF81Nl0/A6Hdrf2nL9BzdoqQhC0wtMSHXOR9iZ+JNBvljxkYEBUdloQ0LnKeiBd
         PliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346005; x=1783950805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gh+NdjO2RmlO1SWD3vOIOXcduq0pfLcMmTUXy69Xkyc=;
        b=bmBq9KKE5IFfmQPbBSzQs2l08iOHy2cgE0mS+O4Fm8CQKpgDn4QH4+WsJy8V0SGRWN
         GY4hkXFOMfVrdDq5f74VbIkR7z+RSgAH7XYjeswxNXeajKXLdKf4Qyzh9908srhF36Mu
         NK7zhhvs8TcCgFpUs4jF0IJP+PDEwBhH5reCyNl3D0F01J/HUWvUTefOOBnGapHPnXOn
         fa/Wi+QyUrlNGFqPzCBUci+P4W0h4xW8RfDFqRW97PAH8HSedJlYi1+Q6fAgP6EUjMDn
         p7Axr/kMfeuZGXVL8zsfAWvM3rcU5lGhohc0N3q6/NXj2XL2WshSkWrfTY696Hiadg+z
         jl8w==
X-Gm-Message-State: AOJu0YyYwh4laBe2HhwUYyCFH6Gc1NU82LfQbFWqDoBlxTNfWI2FuyvO
	1yLjDGUDtiM995nqv4k+KZwGFRZd0VRMxtuXX8pPh+D4Akt1FOfF758uYKK4wGVtfYnEhPsZ2ZQ
	0qtiDzZdWGQFg1oS7hjwNsEx/x827hdCfMXbtMoHp+FRpJUqCRw1WbxuDnDMY7P33pDsx
X-Gm-Gg: AfdE7cnTGNSG/i2vrqjzdsMFIC+S/LpdqLQdhRFT0KYO5sZKBJWIFaZfK2v0rWrFogi
	cukSIWG1nljG5DUIaa/4umOPO1G3ED8W1GiaUautDpjOlog6ibvgEvF2dGhPo9iX++ADodELp+q
	w173TjsK6pZUmi+O95iTDPoH5C1i7vJMg8YXB6ZQ/AAoX3CiOqyksBhPTnjQGkzhczvQrUeDaDx
	se9tzraOkCxw7hQ09UgB6QGsztijfieSwvEqAOsPw0nCXBgsCBgrknTG2K5fuRUhoxZU8e/0/El
	4CZ73p2IRDdBzNi7ehwfVRN7huYdsfo2b/4IiOnrSW/wn+IZLQrOor8SRZzCsLi2libOqo26wmO
	O/drLEBojGEC13Owsnkecv/z0ULgNfHRuNemj8EQuTQkH2qQD+mwJgp+eXzivUYrfuMQvAKf6Jv
	WtKq3v26cX8iRbon31MWJmo/96
X-Received: by 2002:a05:6123:4b:b0:5bd:b27c:bade with SMTP id 71dfb90a1353d-5be907432a7mr312218e0c.5.1783346004491;
        Mon, 06 Jul 2026 06:53:24 -0700 (PDT)
X-Received: by 2002:a05:6123:4b:b0:5bd:b27c:bade with SMTP id 71dfb90a1353d-5be907432a7mr312195e0c.5.1783346004009;
        Mon, 06 Jul 2026 06:53:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13701easm2932551e87.16.2026.07.06.06.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:53:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 16:53:15 +0300
Subject: [PATCH v2 2/3] phy: qcom-qusb2: correst PHY description for
 IPQ6018
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix-qusb2-v2-2-8d9cd73b1db7@oss.qualcomm.com>
References: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
In-Reply-To: <20260706-fix-qusb2-v2-0-8d9cd73b1db7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Baruch Siach <baruch@tkos.co.il>, Dmitry Baryshkov <lumag@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ie5pYBqhk3vp8OQsIMaFbe7S/1NFcDmqVuYASiDHrc4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqS7NNWJ0d844JtYmUmLQ1wgzvuIfVAsHG6ccrZ
 +CvpNQP3bKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCakuzTQAKCRCLPIo+Aiko
 1ddPB/9qHlktAkKXgnjmWI8qkAJsxso0HoXFYx4cGpbhfDeEv1zAdr+41NnrF5RfPh1nDBM29pe
 +AExWZH7N3dlhNtQ3fJ+UVe8Rd9SvN7qM6Xss2xkkRdj4KxT/mNVH/Uqm4hUqPvCWT7sfszEz2U
 yIQdfVSj+tQ1E1GJ5mEH+5tAmu4Kxsce8kuA0ustU2FUxhEu0n+JapGOnoHEoKKremkpCsy09Ct
 QBPwEohc0Be0yapfxtNweN5GVIw3P56gIiMwC2XpUwxCofKL2IpcIWNf/bp0aHd3iFUnuP+RMsP
 jIfD2IAn/wpdQcRntghLZ6eaTzGBzVE+c4k7rTvQ7vjWItZ3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: vMuhwdsGaHvmRyexNuwTs3p0YTg3vbme
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfXwYI7V9u5ULOz
 DKernKAczjC5rLO3OYl0Rl2m5kq/wNdJb8AMcetJci5gXFV83f3L+nxZhhRMUkX3m99MxGjJ5Ol
 HPX0NeK2sd1avPb2zYWLthYXQ93aH7U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0MSBTYWx0ZWRfX0DUvW+s5vZo4
 EfIUk0DmSNuFQh0AFgGg5PMlFtqFcAgmSvnawh9gK8jjzxLFIiJg7YJwKrCuHGszlPGpCutPn6k
 42PhXfv0LZm07b3Zu+tiN6y+750d4TFp/jnRvokRPmwFQoFafX9f+W4fql2oKIraZ1U/3z4/JX7
 5IqaXz/57LPn8GgFoNxuovamzEDHA5QrnnOrmdYRaV5EHAIQGH5FFKvQJrGprRZ7FKohT9yzfRK
 RqJ30kr5ZKC+HCi/+3Zutek20EbjGynmNS050MIbSkWvs5NhYdmJOUDQhlHEEQGRmui6LPZ5OnK
 YatKAZiTeeghNBrSRWCQxp4pQL5fhv2Tl2CBz1q8bJRRKLX8uUHHOIFZ0BTg6jHkHb+PR+WII+l
 0u+SbLE42QAzeX21aIaekmzkF2MeJnf8t3mWt3c2oB6KlocmE2CNeuMx6Yga/DgvCZNYO2osoVn
 OzqFU/32GgtbVMPkkjA==
X-Proofpoint-GUID: vMuhwdsGaHvmRyexNuwTs3p0YTg3vbme
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bb355 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rLpG3bFX5iBGt7CpEVUA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060141
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116873-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_kathirav@quicinc.com,m:baruch@tkos.co.il,m:lumag@kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:mgautam@codeaurora.org,m:kishon@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B865711F84

Qualcomm IPQ6018 doesn't need to reach power collapse or retention of
the USB voltage rails, so autoresume is not used on that platform.
Instead of programming a fake register bit (BIT(0) of TEST1, while the
QUSB2 platforms on that platform should use BIT(3) of TEST_CTRL),
explicitly disable autoresume programming on these devices via the flag
in the platform data.

Fixes: 2cfbe6765b7a ("phy: qcom-qusb2: add QUSB2 support for IPQ6018")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 15c36b594c09..b1d34b080cfd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -294,6 +294,7 @@ struct qusb2_phy_cfg {
 	unsigned int mask_core_ready;
 	unsigned int disable_ctrl;
 	unsigned int autoresume_en;
+	bool autoresume_disable;
 
 	/* true if PHY has PLL_TEST register to select clk_scheme */
 	bool has_pll_test;
@@ -341,6 +342,7 @@ static const struct qusb2_phy_cfg ipq6018_phy_cfg = {
 	.disable_ctrl   = POWER_DOWN,
 	.mask_core_ready = PLL_LOCKED,
 	/* autoresume not used */
+	.autoresume_disable = true,
 	.autoresume_en   = BIT(0),
 };
 
@@ -676,7 +678,7 @@ static int __maybe_unused qusb2_phy_runtime_suspend(struct device *dev)
 	}
 
 	/* enable phy auto-resume only if device is connected on bus */
-	if (qphy->mode != PHY_MODE_INVALID) {
+	if (qphy->mode != PHY_MODE_INVALID && !cfg->autoresume_disable) {
 		qusb2_setbits(qphy->base, cfg->regs[QUSB2PHY_PORT_TEST1],
 			      cfg->autoresume_en);
 		/* Autoresume bit has to be toggled in order to enable it */

-- 
2.47.3


