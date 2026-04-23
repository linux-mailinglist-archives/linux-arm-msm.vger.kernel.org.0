Return-Path: <linux-arm-msm+bounces-104305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DY3HrgH6mlCsQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:51:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 147074517D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CB743014B92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331023E9F88;
	Thu, 23 Apr 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8iTYTZr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SulZzhXd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA923E9F6E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945071; cv=none; b=m/ujVi5YTf4DxmOG6ZBWrG0cfm+VtKpFPBgt4K/kHWGKI1xNTJadQs4fXlXdQ0oyXOl1Jbgl/7aT7DJM7Zs7bErssJKARr5rR9rDKZ2BmpruVP395a44t9edwAX7UiOjuQ3tyWPzzNFwAEhVZZmkSeNn1NTXm81b/RTRB8GveMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945071; c=relaxed/simple;
	bh=KGvC7KTLhq0r8D9oY5fxUSpOk1nYc8Ku/N5cFt263kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WcHZCFI69b056iBNslpzefXEcLhoqpD8GA6qRDIqJg4nqdvM7a5TJlCaUHT18GU3MKdE6tIjYSXg4DCkuAbDhf4TBFm3vItdOjIZxE1QBhcKlupiqyiXetbgmZsi729Uyv4/pKWc294tBHoYPGKSiaioHjmeazCOFTZVOlDsoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8iTYTZr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SulZzhXd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uNn41565807
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=41+SGosw4qCcHzNh2g0MDK
	Ln/wuiSo+fXOZ/+DcIqtc=; b=A8iTYTZrLJmeK4fskbzAS/8XrFbjcifx+rUOuW
	H9pCIgrNsi8NagNKgrJezCHqrr5Yjqm0wnsS7idQ2tQlcooedfUq2mgNspdg934f
	XiTeXyHvxWJQhKj2gKE24OsWI/2NvqzWbGl2KlsK06fEUyYSN5T1fC7bd3LAaMQD
	56SusW8XxARxxYHfPI/1smGF1LcCOX8CAVhUDV/hg/kAHMD+mKI57lfjiyP8zi3n
	/09MZgPwcGI/QWB0Xz9WOwwzml76mdWxgiOcakP5GZrQmnSV5uSmgm09Q1K8iKtH
	Z8i9huiDQnv7ZlNAujNj66z6MTUJBxALVfCpujdLUnp77wEQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wuvbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:51:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so8936949b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945067; x=1777549867; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41+SGosw4qCcHzNh2g0MDKLn/wuiSo+fXOZ/+DcIqtc=;
        b=SulZzhXdq8AzqtmVQLbOlSQ2UzE7g0xtmcH+PAui/rSfBvzxfV4Q32ZOVnlEpeN3ht
         +yGMPzhdGwNB2dbqaYTFFfdrnPjTiisLNj02ejdScn+J2CIbKZG17LsOAe1fYFE3xaMy
         EW9WmZB6JW8f+yybFShjqz3zomObaPHtgg1Itql6WTL5WznCJnsBGNLOovkiqeLvDtj8
         wMftJIMz/tDafwzeDiEdkFADup1WNGPANydMYE5ilMzvhfXI3DmrpMZIl51Q2WaaYOHd
         a9FL/81PA+zzpIqskn931pP2akRuVgqZAua4QzsE7LESfPAnuk/YkCetpYjXD/p/czoY
         qJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945067; x=1777549867;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41+SGosw4qCcHzNh2g0MDKLn/wuiSo+fXOZ/+DcIqtc=;
        b=YFYccD/iAX+wYNHeHwqUu1U/mAdVfEOhQPmnfeyRH99dlUhTqomVOKW8OhbxPiGwO1
         xZAiGRFPfJwdUb3mnVRbyiwzW+NM0b3w7xvtOzO+CkaqUY0OCAJrC3Dn8xUjU8Sv+fqn
         rqF71WrE80qwnfCjoEf/vFVSge6qlY/qeD8os/VJMPF9Lr4FwU9APppB7g6KIyY6x3D8
         MIJBwwX18kJ5WkBvokWgsdxUrR8JVSLqpWzak6FgPa/7xUxq5KQhlzXZATlm9EYlXRQc
         Wvn3QLEVb9/RPZWgmRbrMcgct8ehzb7TWL9ExdpOsSeKdD27d6tosX126j0lVQHk8bQ0
         QoYg==
X-Gm-Message-State: AOJu0Ywf32bTzhmv80RxS+jPofumeRfqd5HlZQyUMrUsXCsIlYVcF7Tx
	W8vFzA9y397s/aTgRvnFx3GnyF+BC36CjIMoBO0pYCa/IXlTn4uB26Fq7BGIK6aDyRTAY8WRgW+
	JV+0h1I01592kb2Cnp/FGgq75m/A7If1ubmr4AailcU5V5O5iExrn4TFyuOXgsuTur+xF+PDh8U
	xJ
X-Gm-Gg: AeBDiet65t3dLhW3P7R2q+naTCrK7CWjluE1uYzgS8+Jq+1nac0p7gQl0nbbSa/u0+3
	yKrpA+3BCHYu6ynnh/acRbKAtNUs3i0ME3XR+R5daffly3xyIz/LDqNHSm/u/NiM4ePPAERCvgb
	gjXk4rKAb8vxPCWzxS7/zYf+4oPMaB0HoHPHEIT7EKKHrrviE+mXW3sIDzql+uTPgboqtT7dXMr
	TQq1uolfVg3u85O6RZWmqMLa8sraWthh4zPMgLOFdbcdi/K3tSM4EM5zunUS4xuKG9gibh3j6Hh
	3HORqx/X6gCays0j8/0bb0p++7EPCOtdEc1FRD35MwFnItd1ztr+Dh2HgH48+AuUd9XkSUmEteF
	r2g1XSipA9EKAQx/LqpxW6d7kpSZdt/p1DpzNUCI4aEu1kyXcuvX/wzMMMe7f+ZJKEhJ1
X-Received: by 2002:a05:6a00:3e26:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-82f8c8f07d2mr28912536b3a.37.1776945067073;
        Thu, 23 Apr 2026 04:51:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e26:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-82f8c8f07d2mr28912499b3a.37.1776945066582;
        Thu, 23 Apr 2026 04:51:06 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm25350541b3a.38.2026.04.23.04.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:51:06 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:21:01 +0530
Subject: [PATCH] pinctrl: qcom: Fix wakeirq map by removing disconnected
 irqs for sm8150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKQH6mkC/yXMyw5AMBBA0V+RWWvSFvX4FRHxGIzEIx1EIv5ds
 TyLey9gtIQMmXeBxYOYltlB+R40QzX3KKh1Bi21kaEOBE+JimTZr7QIU6dxIE2iVBuCK1aLHZ3
 fLS9+816P2GzvAu77AVVu9rxvAAAA
X-Change-ID: 20260423-sm8150_gpio-6b97306811d4
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945063; l=2798;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=p0meogd7D+F1u8p1F5dKPGdq/rdTGqXScAMfkTVpPmw=;
 b=Auzxd6uB0zOBrj8V9SWjJffAMpnG0w9QD8vU8Ymj/acGP6SohKz3sxfD/Bg1nzyZK0rMMQlEV
 OyNb9UvPBTiDGVkE0kuVTVCS8LM1TOd5Fh9eHM0kT276XawjZQUUfum
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOCBTYWx0ZWRfXzF8skse0E8Ss
 TmPgEIAY62tDFsucXOQp5AEhbk8E2hoA5TU+H6gQD6bFNS15SHBO2GZTInazaUHORUzD3nuZuyF
 Z6w07jBRm0v8fffJNbjc2k+Lw1sY1fgPwTr3DwyaDkJf61+d41/GhWuR3VIbgbbpR60JoLrPe4a
 YsQYcfFf46EP3dEM9HRq/2xPDNg2gQOYarPIzuKpms8FHsP2CmlPqcERZ8nE8haEWcn+ZNQaAxd
 UCNVGlKMVMUpxyAwiOZ1aU16hapWcOHpyeatC9w7Acpoh40ZlAqGD22lGRiszedJPxKEYwGKMQi
 joCTLz2oj0HTPkKUnn9rh+AwffOImS687sihR8LVbCMLSEjntuTAiljL6i1hztRM59g7hNQZxQr
 fm+R8+AIBw4cPO76ylzoTYtPGEyqJpOY80AQOfaFXTfHfwxHaBW0IlFL+Zag8zIFHa6eShZDUHA
 +ccl1d9Kp9wq3p02zFg==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69ea07ac cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=0zdWKiCgVtcSCpT9hG0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 5Ore8XWwQuxD44vdLeGTFV4hRbpnvL15
X-Proofpoint-ORIG-GUID: 5Ore8XWwQuxD44vdLeGTFV4hRbpnvL15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230118
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104305-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 147074517D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

PDC interrupts 122-125 were meant for ibi_i3c wakeup but sm8150 do not
support i3c. GPIOs 39,51,88 and 144 are also connected to different PDC
pin and already reflected in the wake irq map.

Remove the unsupported wakeup interrupts from the map.

Fixes: 90337380c809 ("pinctrl: qcom: sm8150: Specify PDC map")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8150.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index 0767261f5149..81c08b18ac71 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -1493,18 +1493,17 @@ static const struct msm_gpio_wakeirq_map sm8150_pdc_map[] = {
 	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 },
 	{ 12, 104 }, { 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 },
 	{ 30, 39 }, { 36, 43 }, { 37, 44 }, { 38, 30 }, { 39, 118 },
-	{ 39, 125 }, { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
-	{ 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 }, { 51, 123 },
-	{ 53, 54 }, { 54, 55 }, { 55, 56 }, { 56, 57 }, { 58, 58 },
-	{ 60, 60 }, { 61, 61 }, { 68, 62 }, { 70, 63 }, { 76, 71 },
-	{ 77, 66 }, { 81, 64 }, { 83, 65 }, { 86, 67 }, { 87, 84 },
-	{ 88, 117 }, { 88, 124 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
-	{ 95, 72 }, { 96, 73 }, { 97, 74 }, { 101, 40 }, { 103, 77 },
-	{ 104, 78 }, { 108, 79 }, { 112, 80 }, { 113, 81 }, { 114, 82 },
-	{ 117, 85 }, { 118, 101 }, { 119, 87 }, { 120, 88 }, { 121, 89 },
-	{ 122, 90 }, { 123, 91 }, { 124, 92 }, { 125, 93 }, { 129, 94 },
-	{ 132, 105 }, { 133, 83 }, { 134, 36 }, { 136, 97 }, { 142, 103 },
-	{ 144, 115 }, { 144, 122 }, { 147, 102 }, { 150, 107 },
+	{ 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 }, { 48, 51 },
+	{ 49, 53 }, { 50, 52 }, { 51, 116 }, { 53, 54 }, { 54, 55 },
+	{ 55, 56 }, { 56, 57 }, { 58, 58 }, { 60, 60 }, { 61, 61 },
+	{ 68, 62 }, { 70, 63 }, { 76, 71 }, { 77, 66 }, { 81, 64 },
+	{ 83, 65 }, { 86, 67 }, { 87, 84 }, { 88, 117 }, { 90, 69 },
+	{ 91, 70 }, { 93, 75 }, { 95, 72 }, { 96, 73 }, { 97, 74 },
+	{ 101, 40 }, { 103, 77 }, { 104, 78 }, { 108, 79 }, { 112, 80 },
+	{ 113, 81 }, { 114, 82 }, { 117, 85 }, { 118, 101 }, { 119, 87 },
+	{ 120, 88 }, { 121, 89 }, { 122, 90 }, { 123, 91 }, { 124, 92 },
+	{ 125, 93 }, { 129, 94 }, { 132, 105 }, { 133, 83 }, { 134, 36 },
+	{ 136, 97 }, { 142, 103 }, { 144, 115 }, { 147, 102 }, { 150, 107 },
 	{ 152, 108 }, { 153, 109 }
 };
 

---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260423-sm8150_gpio-6b97306811d4

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>


