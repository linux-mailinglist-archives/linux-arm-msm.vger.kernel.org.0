Return-Path: <linux-arm-msm+bounces-107124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH44LTFGA2ri2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:24:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E892523937
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 17:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60DD730461AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800973B841B;
	Tue, 12 May 2026 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iw5rHe0j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhenT8mq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A8397AE5
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599281; cv=none; b=W4vxKpst4b0xsQ2fLQSoURT/DR/XuiHzVTpDqYvgKIG+sHlx8Ue+RyCLGRI8sp1tI1pOHKsOL09SgiPu/freyNlQeaLRjquc1LG/R1w//XmXLDbBG5NWkU411aCoE4sanCp9OGQqJ0T6nE1eeBLNqCKtFN/QNceBI1z+1NvkgDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599281; c=relaxed/simple;
	bh=HdPSzjRWBc35/YgPY7tgZ5p+LtadBuPxVUcK0Yl2ZRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qbGAUi6NepzpGjE4wlBxCbqknRGnn7HBv52Tt8Ums3dTy2C0hBU+7OJ9jGwfZjrFouHTSOdnFKOlWliE3Jut2et9ryfHBDJQooJj2WqepBAn1hRH6CZd8Nd2PF3XPfNAzICIkYSqvJxnEzSSdit8z8g6DObMxTJaNK2zYtOAsP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iw5rHe0j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhenT8mq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCKwgK545082
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVlEUdGdtYwePqSCJIzsJZbCsq1btIHtvAOYZEpKAEE=; b=Iw5rHe0jeKcTz7do
	ap1IJ069jXq/r8uglqsZQpOMeFQ/XstOZnWmvbD+tXHgCei47zMgHqkbLrlV14Fw
	towXlBdb2y8Wx/TDWApMEE3lOzLTGm4/9e5bu7foS095mg8ktFmydEWIAk1lKWtq
	dqYpgOM3N0AdkJDM4uJSDAxTBHJYOvI8hgpovzk65FbRUslqtnDtz5VSEZda0GwS
	/yojsN1Gb6s3b5Ald+z/7Ox15gRrYtkaRB46/CGF5OL3EMstwY/Yc/VDpJtSQK9n
	UVfYMK1EVVa4vjvGdd53l96pduDnoDGAovekNW0M+N3pyMv3jbw8dd3qgy2CchCM
	R1eirA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444srpf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 15:21:18 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6948c46e69aso6175715eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778599278; x=1779204078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVlEUdGdtYwePqSCJIzsJZbCsq1btIHtvAOYZEpKAEE=;
        b=EhenT8mqEdxORO9T+HeSXXcwLL2t6js8dLzUp4yMHZvrqT5cNC1jrWLsLdPAypaigQ
         yiwUW7Fx0jUjKLm9ohQazUpszHpMyEr+JEwZ5u6G+Nwd6Qfj1Im5FzjoeUwiNruCmxlK
         MypfRJEvYCBuafE8klb0drxDeqNChSfgagGqqjjyHqv033JH9jCcCz3IGm/fnclIErHM
         RYhUdDV60SID85Si3kusEDTYVSfE2CWmExWIpeejQchJffV8o8ZIz/zvyxOQz9y9g0GW
         fzudE7aGfSSvIVOuA5A8k07N3OYIKOdSXVqCU8tHM6jR7PrZ6NtcBkOU6jSt+jjeU3MS
         h2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599278; x=1779204078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hVlEUdGdtYwePqSCJIzsJZbCsq1btIHtvAOYZEpKAEE=;
        b=Q2CWVCmzz3fn3NKuYaItNa9+TRHJtBGqqFw7PJmds3Sh/31EgOB0PXTbJ+W6L3QtuP
         j/ERWpvApBjxoJ0mZilUhQKIrpMMH4/oTkiZlpTzk6adKAPAZkjaixH/6gbQgzAqJ0PJ
         Wp3ZTEemNhBXSEGV5DX7sEyvqetPtqIs7XzP1JXoYdXefIoPNctkHG8/rVtT0LbDhkO7
         h1o9jE9yjIvgeKt/JeGr5Zv6s7EV0vcb+FEvxQS4y2E0yzZAObJHwW5QOqdN6J+McNRB
         fvHqj8znperV88MZcyIQSEhlhJaAQpR7eoVOiT2P/RCi0DXAI86Y6bZ6ab6frWgBkJVD
         d6FA==
X-Forwarded-Encrypted: i=1; AFNElJ+tVtdZQ80gma4cgi6TAyomvi7Tz1Dz9w4asxktj7Sa1uZTjIJFUgiWz6LaqZIP3zQ9XW48WYDcJsW99s5U@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0MjCzmYUKT7SCgbq3nWEqLgH0rwYASlie7yF4klDG7igc/g9n
	JCtnGhub6Lj8nfTuroWnaBEcGPWC945lDZ0Rxpvc9RuwRUEV4kFNMgqniGzkuZD84ZjmsLAN83V
	DmEqUVRRPwXj//tAdIeAA/3wnghvg1e12nEpD2YspsQ1E0e9Mq1i5wpINvMIiaCC6IiW4
X-Gm-Gg: Acq92OHKrVijU6XhsIy3HghDlUTx+Aq0hcnEUym7c8StqVJ8X8tN8y7f0w39bhj1DuB
	i98BmFGcUWqlzOezq0BwTwJpFezvyOChCG1reQDx1V/7Y84J6b0IXQxhzJKxvrcTF2HU9MOHzlK
	+ddpX6hQ+ZvE4WuGaAPrUMegrXwfVpZyIhB8CZATim5/qOzAQK2zNy0+keEOXfb/9NpcfFoWmuR
	ZNMZORfgcY8IRNKPy9foS6Q0Wn6M/vBUvxbhDWaC6k/YBeF5t/sqSA+VdPlPYfYZngGXX9EzLtS
	mki+Dda+TasP6zx+owDFGV7hD5yzZuyXXaf5loEnDhLPZAf17//bTAK78Oh3KxUuoyUnNEmsTOs
	aVzRR767Oaw3+QfQisUVmggYPJggvsvqK+tMUPf1mpQcbdLk4FF6wiDrbYR9Qr3te6B+QwxUvlz
	LjpybMjg8GYFYzXNnfVOW1Nx5hNX+KbiTy+oQ=
X-Received: by 2002:a05:6820:1388:b0:694:9707:4e59 with SMTP id 006d021491bc7-69b36d95102mr7367462eaf.46.1778599276326;
        Tue, 12 May 2026 08:21:16 -0700 (PDT)
X-Received: by 2002:a05:6820:1388:b0:694:9707:4e59 with SMTP id 006d021491bc7-69b36d95102mr7367438eaf.46.1778599275772;
        Tue, 12 May 2026 08:21:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6268ddesm34036571fa.37.2026.05.12.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:21:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 18:21:10 +0300
Subject: [PATCH v5 2/2] media: iris: Add Gen2 firmware autodetect and
 fallback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-kodiak-gen2-support-v4-v5-2-a98968423d24@oss.qualcomm.com>
References: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
In-Reply-To: <20260512-kodiak-gen2-support-v4-v5-0-a98968423d24@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=12334;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1txGwldQSjgLClsGqOr+nzNedmiJND3oMJ/msrD8Rw8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqA0VmOBC6jlgUt2fz8Tqvb9sFH1uqi3aox5vJM
 UsWuGSLR3yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagNFZgAKCRCLPIo+Aiko
 1f8SB/4tyw0AkYV43ApM8DnG7RY5/Mh0nNIO+Li2Q5FxBZkQYQCejPqkFXsT6K24GywXss56SOp
 LiEv8Vkx4Eb6JH8H05OTcUyGTxY12mJ9wHnNbENAt1+iKOZmZAfwVyv4AJrZ9GkrLuqgE9/v/SE
 ftx0OkA6cM4DQ6NYNmfUkxJF3hwD5C7+KO49V3pk9MnfXa3DKVv7zeytn3xJJUrcWgtnZMChl3/
 aVP30gA9eTuGiwUBBf+6Fp1XG6XaH5jtdDGuUfIYTBEpA6yoEh9tbpEalbOSpRdgV2igymkdJEy
 mkagqPXLqYuKJP4I+NphuZ14PnPO7vL8zw5Z1W8llTJIPZ5H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: dBcw4BZwbaIMEGnrTfjoxubblm_i43yv
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a03456f cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=AJYS51BlHv6FyquiitgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: dBcw4BZwbaIMEGnrTfjoxubblm_i43yv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE1OSBTYWx0ZWRfX2Nhjd3qDDukF
 IE3X2XJXLuf8eiWUvgngeGNDGAoC7lZq9wPEYVvYY3yewdKblddOU4lCIzq5jFVQJzFwEITbe/K
 zbj50kehWUWXPPBSUSCCaImgbOE/BY35pUYCY/Mjc8JIwWJCa2rRKrhSUe7d2B1Ql8250KJiLcs
 QtBalXbAExsV4f2H6VfCy43X59hq7Z7nqMUo5G/CRFXXGLttGrfVM9lMdVSL3Nc7pMpI64fg6oy
 p3Jq2T/9CWirtWcasdK8M07b140mw8P0oeXAWbpXKGz1jGh2CGK1VqdvIACPy0H///Hf5xywEF/
 kkec+a/tlTqToLtxMgEoFwRRfj09tEALxWSU4vehlOpxVXB/y0/1si8QqPHyWYmCNAxoOP0gUuu
 viK/7EMmYY10UGQcAcWwcTecdOZIY0k9fKLlNvc/sO9iqWrW+jVEEMrGfbpglMEPIawNKn5j3VB
 la5EurcGUuwvddSMNBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120159
X-Rspamd-Queue-Id: 2E892523937
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107124-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Action: no action

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
Update the firmware loading logic to handle this generically by
preferring Gen2 when available, while safely falling back to Gen1
when required.

The firmware loading logic is updated with the following priority:
1. Device Tree (`firmware-name`): If specified, load unconditionally.
2. Gen2 default : If no DT override exists, select the Gen2 firmware
   descriptor when present and attempt to load the corresponding
   firmware image.
3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
   descriptor is available, retry with the Gen1 firmware image.

When a platform provides both Gen1 and Gen2 firmware descriptors and the
firmware is loaded via a DT override, the driver detects the
firmware generation at runtime before authentication by inspecting
the firmware data. The firmware is classified as Gen2 if the
QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
"video-firmware.N.M" format with N >= 2.

If a Gen1 firmware image is detected in this case, the driver switches
to the Gen1 firmware descriptor and associated platform data so that
the correct HFI implementation is used.

This change makes firmware generation detection platform‑agnostic,
preserves DT overrides, prefers newer Gen2 firmware when available,
and maintains compatibility with platforms that only support Gen1.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_firmware.c   | 105 +++++++++++++++++----
 .../platform/qcom/iris/iris_platform_common.h      |   6 +-
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 ++-
 .../media/platform/qcom/iris/iris_platform_vpu3x.c |   8 +-
 drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
 drivers/media/platform/qcom/iris/iris_vidc.c       |   3 +
 6 files changed, 105 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
index 1a476146d758..64a2170bf538 100644
--- a/drivers/media/platform/qcom/iris/iris_firmware.c
+++ b/drivers/media/platform/qcom/iris/iris_firmware.c
@@ -16,20 +16,95 @@
 
 #define MAX_FIRMWARE_NAME_SIZE	128
 
-static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
+/* Detect Gen2 firmware by scanning the blob for:
+ *   QC_IMAGE_VERSION_STRING=<version>
+ * and then checking:
+ *   - version starts with "vfw", OR
+ *   - version matches "video-firmware.N.M" with N >= 2
+ */
+
+static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
+{
+	const char *marker = "QC_IMAGE_VERSION_STRING=";
+	const size_t mlen = strlen(marker);
+	int major = 0, minor = 0;
+	char version_buf[64];
+	size_t max;
+
+	max = (size > mlen) ? size - mlen : 0;
+	for (size_t i = 0; i < max; i++) {
+		if (!memcmp(data + i, marker, mlen)) {
+			const char *found = (const char *)(data + i + mlen);
+
+			strscpy(version_buf, found, sizeof(version_buf));
+			if (!strncmp(version_buf, "vfw", 3))
+				return true;
+			if (sscanf(version_buf, "video-firmware.%d.%d", &major, &minor) == 2 &&
+			    major >= 2)
+				return true;
+			break;
+		}
+	}
+
+	return false;
+}
+
+static const struct firmware *iris_detect_firmware(struct iris_core *core,
+						   const char **fw_name)
+{
+	const struct firmware *firmware;
+	bool has_both_gens;
+	int ret;
+
+	*fw_name = NULL;
+	if (core->iris_platform_data->firmware_desc_gen2)
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
+	else if (core->iris_platform_data->firmware_desc_gen1)
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+	else
+		return ERR_PTR(-EINVAL);
+
+	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
+		core->iris_platform_data->firmware_desc_gen1;
+
+	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
+	if (ret) {
+		*fw_name = core->iris_firmware_desc->fwname;
+		ret = request_firmware(&firmware, *fw_name, core->dev);
+		if (ret && has_both_gens) {
+			core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+			*fw_name = core->iris_firmware_desc->fwname;
+			ret = request_firmware(&firmware, *fw_name, core->dev);
+		}
+
+		return ret ? ERR_PTR(ret) : firmware;
+	}
+
+	ret = request_firmware(&firmware, *fw_name, core->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	if (has_both_gens &&
+	    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
+		dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
+		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
+	}
+
+	return firmware;
+}
+
+static int iris_load_fw_to_memory(struct iris_core *core)
 {
 	const struct firmware *firmware = NULL;
 	struct device *dev = core->dev;
 	struct resource res;
 	phys_addr_t mem_phys;
+	const char *fw_name;
 	size_t res_size;
 	ssize_t fw_size;
 	void *mem_virt;
 	int ret;
 
-	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
-		return -EINVAL;
-
 	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
 	if (ret)
 		return ret;
@@ -37,9 +112,11 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 	mem_phys = res.start;
 	res_size = resource_size(&res);
 
-	ret = request_firmware(&firmware, fw_name, dev);
-	if (ret)
-		return ret;
+	firmware = iris_detect_firmware(core, &fw_name);
+	if (IS_ERR(firmware))
+		return PTR_ERR(firmware);
+
+	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	fw_size = qcom_mdt_get_size(firmware);
 	if (fw_size < 0 || res_size < (size_t)fw_size) {
@@ -66,18 +143,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
 int iris_fw_load(struct iris_core *core)
 {
 	const struct tz_cp_config *cp_config;
-	const char *fwpath = NULL;
 	int i, ret;
 
-	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
-					    &fwpath);
-	if (ret)
-		fwpath = core->iris_firmware_desc->fwname;
-
-	ret = iris_load_fw_to_memory(core, fwpath);
+	ret = iris_load_fw_to_memory(core);
 	if (ret) {
-		dev_err(core->dev, "firmware download failed\n");
-		return -ENOMEM;
+		dev_err(core->dev, "firmware download failed %d\n", ret);
+		return ret;
 	}
 
 	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
@@ -99,7 +170,7 @@ int iris_fw_load(struct iris_core *core)
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 int iris_fw_unload(struct iris_core *core)
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 0408d51188b2..7acb073f7197 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -257,11 +257,7 @@ struct iris_firmware_desc {
 };
 
 struct iris_platform_data {
-	/*
-	 * XXX: replace with gen1 / gen2 pointers once we have platforms
-	 * supporting both firmware kinds.
-	 */
-	const struct iris_firmware_desc *firmware_desc;
+	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
 
 	const struct vpu_ops *vpu_ops;
 	const struct icc_info *icc_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 6e06a32822bb..961dce2e6aa9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -22,6 +22,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p1.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -65,7 +71,8 @@ static const struct tz_cp_config tz_cp_config_vpu2[] = {
 };
 
 const struct iris_platform_data sc7280_data = {
-	.firmware_desc = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
@@ -94,7 +101,7 @@ const struct iris_platform_data sc7280_data = {
 };
 
 const struct iris_platform_data sm8250_data = {
-	.firmware_desc = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
 	.icc_tbl = iris_icc_info_vpu2,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 85aa0c87338b..9a76149f37b7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -83,7 +83,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
  * - inst_caps to platform_inst_cap_qcs8300
  */
 const struct iris_platform_data qcs8300_data = {
-	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -112,7 +112,7 @@ const struct iris_platform_data qcs8300_data = {
 };
 
 const struct iris_platform_data sm8550_data = {
-	.firmware_desc = &iris_vpu30_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
 	.vpu_ops = &iris_vpu3_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -147,7 +147,7 @@ const struct iris_platform_data sm8550_data = {
  * - controller_rst_tbl to sm8650_controller_reset_table
  */
 const struct iris_platform_data sm8650_data = {
-	.firmware_desc = &iris_vpu33_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
 	.vpu_ops = &iris_vpu33_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
@@ -178,7 +178,7 @@ const struct iris_platform_data sm8650_data = {
 };
 
 const struct iris_platform_data sm8750_data = {
-	.firmware_desc = &iris_vpu35_p4_gen2_desc,
+	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
 	.vpu_ops = &iris_vpu35_ops,
 	.icc_tbl = iris_icc_info_vpu3x,
 	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index dbc15edc602b..89426ed42fac 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
 		return core->irq;
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
-	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
-	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
 	if (IS_ERR(core->ubwc_cfg))
@@ -271,8 +269,6 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	iris_session_init_caps(core);
-
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 807c9a20b6ba..6fbc20366f5f 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-dma-contig.h>
 
+#include "iris_ctrls.h"
 #include "iris_vidc.h"
 #include "iris_instance.h"
 #include "iris_vdec.h"
@@ -196,6 +197,8 @@ int iris_open(struct file *filp)
 		goto fail_m2m_release;
 	}
 
+	iris_session_init_caps(core);
+
 	if (inst->domain == DECODER)
 		ret = iris_vdec_inst_init(inst);
 	else if (inst->domain == ENCODER)

-- 
2.47.3


