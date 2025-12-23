Return-Path: <linux-arm-msm+bounces-86305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D591CD88D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EB203029C18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F4931D362;
	Tue, 23 Dec 2025 09:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdHR0OTh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTXEfbah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78173016E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481413; cv=none; b=XYEYPlptlZFwZh7CcGE9WGIGSmWWmNKOXmTkwURs5XDJ4eCGgYCISHJG3DTLkHo4ZAWeqW+jighA48uIMQd57XlJZDFM3ia6RpDYD6bduAE/MOGcUWkWHhUXJgnU5Q2gqix4Zkb5ilMaBkj8rMHNE14zeSlfXankD0YxOVs5xTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481413; c=relaxed/simple;
	bh=Ooh/Y1wNUiIlJUNDCEDKVGJcP9tyUFJnSvKYmynbJfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B8jEW6GUuYIgbwYazP7AJuvrSEA8+tnFSy0dVFTko9NWN+bS0RGx6eFny3m585yYBLTkrZxpaNzjMuxIi6yfx0ireHI7K8OE2ygfLJjWpoRtNqkTMQbfUz16sgG/CJGvMD03kLEWQ5lcjcYyK69c0J5p2dRb8IlJGuwD2MK9Lis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdHR0OTh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTXEfbah; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2kuvu1889226
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wvhf6tDxCN1I4MjR4CqRoX
	Y1pe/hNwHpzYJ7PCuWEjM=; b=IdHR0OThnco1FQdfM3RIg+Or9ea+juIF27GvNT
	qf4IxsgJgfB3p4KoFbBS631Ytaz4OZy+yF9N+lzUic63K9mJx7ExGtTvArWJdrr4
	Bld1PjqJYMnMJP3xSVR0XX/KMonGYWkH9FcJETaL+OCWbxnI2FkQzChedUHzsLZm
	Ng8ZGYfFmWXe4eLIoh+6m9THFKhBrizt+TyfZiYg7O2v1PD3NipXfnxf8P292ORi
	+5ZzYnTDxsMA1enBeJQy4mbgVGzs0ciO36zcgD1Tn2lGrddRpeYd9XsNrKnRYUKT
	6+noihpvckugAU5Fm780dt3pX1KzIZ+o2CYCg1h2k+7hAmrA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ajyag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:16:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b99f6516262so13200052a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481409; x=1767086209; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wvhf6tDxCN1I4MjR4CqRoXY1pe/hNwHpzYJ7PCuWEjM=;
        b=dTXEfbahQxFKwqyiKrTt6OE3RHaAtQgrd2gDkXk3Y8wZkCmKAYetgNaffQJLCAGqxz
         qtF0/H1Ig2Cepfxht8pfC0htfFydzwVeGgPD8EQy5OTNkI9gNvAY+7wBL1lHPSxr5klZ
         vBMBNXZCFKJO7K9r+iMc9jBLMnU8AWWN/biTBDQTFUjAEbxLOP0jrfoVTap9FLZ/lnwj
         PX23R+iU04byjH+2fEkITdcCsVM4DiUT0Ym96V39g/VF5M/TRBvfRDx+GuOtLp4CecWi
         PQ+vtVtkrI5aBoUezishX665+biTUIEewYJquQpeS7r88V1DFtdOtswtxwpyklSv5MHF
         Xpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481409; x=1767086209;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wvhf6tDxCN1I4MjR4CqRoXY1pe/hNwHpzYJ7PCuWEjM=;
        b=c7ttoZpNkOS2BZbwaWHrjP1ll0+q3thiyjZGDBLSeowxfknaFOzWs0DM8vzRZ8fi05
         pI+twkIDuiTozH3DwjpTTPHS/y9zKU8qp+iLd9f8RPPe0Ol+ubG0x1PE4troazClPxEw
         rz2g5vupwiRAQsnFWwC7px0yxvE4GNhwgeQ0/LY5J5mlQbxkxvchsUDmLxjMQREIjA3d
         g0aZ1jBqJiKv+5+CUtqFhXN0LTrMnEaOOrfu7kDd2bwj1CG+jvrK1013NwoQAIPK0GqN
         GvyAjllYL1C4G7LO1q4TycpoLAWL2HwcQ+94XlfZqsF/RiloebG1YE590Hag+0c8hRBC
         rKZg==
X-Forwarded-Encrypted: i=1; AJvYcCXLIfd/HCeZXQLSCnhDNFAPosUBSti3FNB1Mci0G4G8TGeV5CfuHFEGAtz2yDuX2bQuusXG2tszzHvZSQuC@vger.kernel.org
X-Gm-Message-State: AOJu0YzBJg+vv350YRWIvUpSqP2sRDE68+GZISYo0+M18gA9nWMxLSda
	NhqB7HIf8XVFOxzbruDa0Gm1ywpTM8/6WBOCvqFMDmcY7d9I4Fixxd26nzFf6FJhy2Rm77XmLI1
	Glit0N1yvf774JE7aEbD54yHqAt6xuXtEPBfA6iscN+XGCy/hlvXp5GafcjmwJQpRv1Vw
X-Gm-Gg: AY/fxX56Un3Pl786ChtrCLJSlsELmQk8DNhFT21gQzp/5uFf97cS1LukRVr4rboyimG
	0p1bK6byszBRLwMaycWkD2VIDw2t70lAvYsip+L3nNqmndpLxc+ZJktB00i8cWPv00IPqDgtTRv
	anxDFipZLLjD3zRw6FRhUkML+gMEhazxvH9UF4SzA1o13PVWwsgxTZea4XPFJ/litH8xDNjQtwu
	O8xq5raDP0PlhT2D7QttZSTozFgh+cOlDQhGM/BQKCfb7Svq07vH75zwj9jlyJK+KQNTd1xXYvG
	hO/C4seciVmx2AmpR/kh5yj7vCfcsvuu9aXm2+nrRvIeKFGQtfA7EdQf8oWqBVobd014JpXwO/n
	uOFVG3sLyRC6puPhD9li+97XJO5X6dxov2+zDKdG6btvo6S5PjqeUVsMh
X-Received: by 2002:a05:7300:50e2:b0:2af:cd0a:ef8c with SMTP id 5a478bee46e88-2b05ec9162dmr14944700eec.36.1766481409191;
        Tue, 23 Dec 2025 01:16:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKf4qTYw7AEPcEbQ2LCeERW1vmIZ/9PY0R9YpK+j+f2D58dxleDF7HMOolSZfQxnOz7TdtZQ==
X-Received: by 2002:a05:7300:50e2:b0:2af:cd0a:ef8c with SMTP id 5a478bee46e88-2b05ec9162dmr14944669eec.36.1766481408540;
        Tue, 23 Dec 2025 01:16:48 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffad66fsm33055965eec.4.2025.12.23.01.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:16:47 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:16:46 -0800
Subject: [PATCH v4] mhi: host: Add support for dual ELF image format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-wlan_image_load_skip_512k-v4-1-a00234a6c578@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP1dSmkC/32P0QqCMBSGXyV23cLNWa6r3iNkHLdjjtTZplaI7
 94qCCLo5sB38X//f2YS0FsMZL+aicfJBuu6CGK9IrqG7oTUmsiEJzxjjEt6baBTtoUTqsaBUeF
 se5UxfqbG6AqFNGWOKYn53mNlby/3sYhcedfSofYIH2OyTVIaBugMeKOwqb7MY987P9CJU0a1R
 rnbCoFS4sGFsLmM0GjXtpt4nm21DYPz99cjU/rsfG/mCfuzeUqju0RTZkLmkOXw6y6WZXkA+XX
 AgicBAAA=
X-Change-ID: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mayank Rana <mayank.rana@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481407; l=3390;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=C+A8qHMtEOFOgyFYF9SwWUcHD1V4zZsKXVCt9deYI94=;
 b=Ooax4iwSFOswFLHKEclv0TfJauk1FWql2aJ08SMJBT99FTYNHw3uZJxgrkVBhaxFpNxZK5sld
 xxgxetspSerA5gb/fN9D35Ry5EGHHxa4sYOFXjiXALOOrVa0vVMOrSX
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX+dJKKEhiaRk/
 FhZMLuv8993SvdHLq+SE793zp8rjKcfdTsgrjBPUx3Xe0HXdowFceg+j191p9A6ReyLVT2YJXed
 82IWPA0t9mz+AnKDefL5CdM6neLZqEzIcoZtw9vBmybsGiVPnKknVAeLk2hMjafiWr3im2fe+JK
 6wN74YDwc0D8ePxONKnY057qGYDsuzSiuvTObhw4OaYCt7AihCnS4NNQ5Oedf+s9WZEdnV3RfJK
 Lp8YT27prbDhYSOBv4hQUvI+Wb2gHVOrcD7+PEABn7v6MvoOX/vV8gd17b/qOkdykq1dAqZ1Mzo
 ju1PoXbTgC74WHj1f1sxAtH8v/Qi16RpXQ+q38F2PSfxRqaRM4qQMooYy80BBtpcfKEcJ41YXXC
 FkiuMWolKulR4b7nCzSe4zVrE6MXTsVEnB1Z7XbxfSfsHsRivtAg4Dz5Votb8Ln2qgBOO9mq8R4
 TRhNXQ2m9q6NUyA77yA==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a5e02 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=yWoLkE6zulz-TMI_RbsA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _cmREtSK_qdAHl36lPLOukQCRC5e-w4x
X-Proofpoint-ORIG-GUID: _cmREtSK_qdAHl36lPLOukQCRC5e-w4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

From: Mayank Rana <mayank.rana@oss.qualcomm.com>

Currently, the FBC image contains a single ELF header followed by segments
for both SBL and WLAN FW. However, TME-L (Trust Management Engine Lite)
supported devices (e.g., QCC2072) require separate ELF headers for SBL and
WLAN FW segments due to TME-L image authentication requirements.

Current image format contains two sections in a single binary:
- First 512KB: ELF header + SBL segments
- Remaining: WLAN FW segments (raw data)

The TME-L supported image format contains two complete ELF files in a
single binary:
- First 512KB: Complete SBL ELF file (ELF header + SBL segments)
- Remaining: Complete WLAN FW ELF file (ELF header + WLAN FW segments)

Download behavior:
- Legacy: 1. First 512KB via BHI (ELF header + SBL)
          2. Full image via BHIe

- TME-L: 1. First 512KB via BHI (SBL ELF file)
         2. Remaining via BHIe (WLAN FW ELF file only)

Add runtime detection to automatically identify the image format by
checking for the presence of a second ELF header at the 512KB boundary.
When detected, MHI skips the first 512KB during WLAN FW download over BHIe
as it is loaded in BHI phase.

Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v4:
- Detect image format runtime by checking second ELF header instead of using a flag.
- Link to v3: https://lore.kernel.org/r/20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com

Changes in v3:
- Reword commit message.
- Reword comments of standard_elf_image flag
- Add reviewed-by tag.
- Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/

Changes in v2:
- V1 patch is paused because of no user. WLAN team plan to add support for
  new WLAN chip that requires this patch, so send v2.
- Change author and SOB with new mail address.
- Reword commit message.
- Place standard_elf_image flag after wake_set in struct mhi_controller
- Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
---
 drivers/bus/mhi/host/boot.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 205d83ac069f15a19ab2d66a63692e5d60334d4c..6ba0f16854d3a839e987f19d782600467b5f9836 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -584,6 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	 * device transitioning into MHI READY state
 	 */
 	if (fw_load_type == MHI_FW_LOAD_FBC) {
+
+		/*
+		 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
+		 * file. Hence, check for the existence of the second ELF header after
+		 * SBL. If present, load the second image separately.
+		 */
+		if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
+			fw_data += mhi_cntrl->sbl_size;
+			fw_sz -= mhi_cntrl->sbl_size;
+		}
+
 		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
 		if (ret) {
 			release_firmware(firmware);

---
base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


