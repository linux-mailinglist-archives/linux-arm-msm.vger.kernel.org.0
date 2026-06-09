Return-Path: <linux-arm-msm+bounces-112101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id opTJETbiJ2oE4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:51:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFFF65E8F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:51:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=D+hW7hmP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K6TPNElN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112101-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112101-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2567A306B1F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B47C3EE1DB;
	Tue,  9 Jun 2026 09:47:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F293EFFA5
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:47:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998426; cv=none; b=aMpewY5EEsZQQYYnWrZtHmuWnVV/XXReokX5JP0IGBo+W1pA34/UznB8eKvAEpDRx95ejAL/yAA/lRVNjdk3pPBwxU1oj9QF/ZaYBlnKnwKJaFdtFrXLHYjMMXDssE9pIoVycuwf0FkYgvgvVfJ2h5xQ4vKBufcjisYWMcuUHyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998426; c=relaxed/simple;
	bh=k2Fff3upCougTurRhx1qk32jaQDI5eLSE+rUossKmgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EmRfkfEuNNYEMyx/UpOczbLHpDAexXAI7jivCnOYPTTJKANdbCE2bsFSy/Pt8+/yjjetVV9K3Bk+jGwfR7Fwd5c7DajpkhpbYWLhBjOlHiO6wtriiTkpRY1rc/I58xsHOvcyFPbNXBszH8i/vplaF9OszLcwWi2ua2LPVI9rkCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+hW7hmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6TPNElN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rbPX1923214
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w64aJR4GsiijIIC+qw1V7Ljp4DhfTK7YqGC8ys2CQuk=; b=D+hW7hmPAwJOQP5X
	s5zO3sRRK6NmN5OGElUEjgIjgGVFMQoPO4+NTNn6Zr2LlKq4CxY9mfrQMqUtk0cL
	RBl1TbNsvsxYghlru9i8Qo3CIx8Zmqaqj6my1M261U7P5gdH3AbwTFTnePsX2RqL
	w2X3GtyAiRUlHZ6zLLkiXlh962PyVeJ6IjviCngCLYMndrqpasg25GXo0svumuCz
	0gSy7uX5sNOi8LJfWuMiluGYr3Uia+SBF/GUUnNzQVyMQlAwOPyCIE8Q5Gpv90Z7
	tjokGk6aGNnkwMYaMGZSpJYVQIv0ZQlVBuD3/zDQ/ZOYvE/TxH28qZGSj2bHfc9M
	9nUb3Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epee4gjsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:47:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91572601753so1046840485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998423; x=1781603223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w64aJR4GsiijIIC+qw1V7Ljp4DhfTK7YqGC8ys2CQuk=;
        b=K6TPNElN8ZWAar1lZv3YQKIh+d+iKLQzdx1pMPKuNQRJLXpL97+xvm4nW1oUe6mZ5A
         CtvqgSewX2ZiVdG0z8JEQ4Fy/sKHLXYM/vx7ZCVbbPFYJiISQgTZV0CNvRmcYzKAUSdr
         2UHa3/bdCnD0Ir18D7YQ0gO+wkPn4Gt02ujIY20ufM/a+Aik9cuce9Q24cOPLOLqyRP+
         CcYO8i06OseqHOXKWPmDA3HrIFJojXEI+grdg8+Q6MYtFqrJ2G8KpRXVFRhkf48rQmoi
         f/Uc65mNmUFrgN/X/HY87r/D+QPWFXrpHJcGENDJ5zvZfVpAgYv1DtDfYdgQaqqqCdCC
         k0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998423; x=1781603223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w64aJR4GsiijIIC+qw1V7Ljp4DhfTK7YqGC8ys2CQuk=;
        b=AnAK2JwySmFET5qPAI+l0e+PdL1o9YmW8k+KkWeF0/sIJv8mOQ54DxapZgWBXQ8czv
         O4rG2upafbvugIBlwDQk+HP7kJ/kDpPSfwnDdc5Bkc1HbnCBaLDEZ3Pa97aL800XsqFR
         ARHKm6kGHFRzmptPkYMHkFjRyIrcHvR90josYnRm9HI1FISs79atFrIXXNRAseUvft9e
         f8IhrGv8YD1UM8lKNxnMsgcWxUA18F53fuNudR4VaHEMi6FQ5bsPQt3fNNkigFYUmz09
         h94d+P8M/GyCRCsqdjnvKVOCVe49EPpQYSVeydz2T9Cf7HcNq+23zFOGCJuguFfJ85Vc
         Qefw==
X-Gm-Message-State: AOJu0Yy/1pr6uNMm00HO9zm7JBlugi2hjgUMOlxUOfJ7oabcrR3zzWDX
	74w7yQmtAVYcei/72hwIQZSKRANwbhkJMXuuLjV08uV47abxMJwn7XWKW3oJp46kehBTpJpKoxT
	CNzOgBRW1eAgKhIq0BuvSWDTOh2is7KKX47Eh1a6+aZK4kK0Ob2OwD/Pa/Oe5o3Ji9TXx
X-Gm-Gg: Acq92OEx9h59cYxtYu4OuwH4g30hkkcRhj7AFOv8UjEH5wFFga/bHypONQ8MaGITDa0
	cOPkMBvmuuuUIHsoGMbI2YqlO3wUdOMZmDXQYA/Cr0/ogJT/+X8KkkcuckkNaqANEMsOziWHrXe
	dqpKSIrdfxUW2KLk+mURzT5IWKsc6CZudIanMrbp1uw8qdrqKLzGsIwA8TsePcdqPCL4EqwGfh4
	MUA8tl/e9Sf3usiqL5aRcVuMFFX1l38ym51wHCGth61viQxjf0c2lJ+ZdvJb6JxYhtGc/6USXDr
	w4Ld0RbcjTomMILJvXmRAfSYT8Ma7gKg08LxJ5WGCv2i8vWhmVREcMgsvLOGhwt+cUovgwcGagZ
	yHETJ4I0k0hv4K4HHN2GKwR/CUBIY2xn8wwpnkX1CR++YY7eTdfWycqlxHijPajF/73QkzOwTXN
	6IWziILzvLnAXriSgLkQ==
X-Received: by 2002:a05:620a:6507:b0:915:9d08:94e1 with SMTP id af79cd13be357-915e831bbbbmr245012085a.46.1780998423361;
        Tue, 09 Jun 2026 02:47:03 -0700 (PDT)
X-Received: by 2002:a05:620a:6507:b0:915:9d08:94e1 with SMTP id af79cd13be357-915e831bbbbmr245009585a.46.1780998422916;
        Tue, 09 Jun 2026 02:47:02 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a00afafsm2047489485a.2.2026.06.09.02.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:47:02 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:46:27 +0800
Subject: [PATCH v7 05/15] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-dp_mstclean-v7-5-ea04113e8233@oss.qualcomm.com>
References: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
In-Reply-To: <20260609-dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780998392; l=2097;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=k2Fff3upCougTurRhx1qk32jaQDI5eLSE+rUossKmgQ=;
 b=xb11ZGlCXDEh1bxcp6TS59hAhz44+4Cx8Agb9A0zHrLtoMrZCIw9sWK1MQJilzjEp8GYmTx9D
 VTzcFfrPaTwBpb/CCAgH0oiIOEmPL0DUERHxacmp5TPFNbBMQLcOdIu
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=PIs/P/qC c=1 sm=1 tr=0 ts=6a27e117 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TC1OlXllJ9dbkp4NpB8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 5PFgb6RvlsoxKt_QE2eylLD5HXpLUBMU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfX+zGgjnpizsKg
 jR1ER9G6LS/IiGBZOGUaO2bMDYqOHc3VltuAbm93X/cPGSiP9qzdZX3NI0VVn/mFoIGnpyG3Ung
 negYuK+aW8cDVV/oPSDJ74AUSmCmT52AOW9VpFmEy/JbCTGWP0ERNDNwIlmcYg20mSBfMTOciF4
 2cIw/v0yXtWgLlS3oDEHtYNjCJ3zEwIaxSra476KHHGuLaVmVeIw752HTpf8QM4TfNbiyNvZtag
 BYW8eSkA0GRc8Y1Xv+EpSnlTuovmkJMUR/XYMCjT7fFXu9ZrHQyIce0B9WJBeFs5HoOFzB1GaM7
 tobLgZ+CamzOVlEmkgwUL4lVX64uSueB0/ebYyUTJrWIL9b3pcpxWCZzBsFer+vVeDSvW5rtKE6
 pG567GQqqartVmfbOgYxN3NvM7KSJ1NSSD0+Vt2eoV+hOUYh9/83+81ONS8Uc8+rIWB7d0cMMwj
 JwMr3HCyeDgsmtZHEkw==
X-Proofpoint-ORIG-GUID: 5PFgb6RvlsoxKt_QE2eylLD5HXpLUBMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112101-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:yongxing.mou@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDFFF65E8F3

Refactor the MISC1_MISC0 register configuration into a standalone helper
function to support MST.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index ed2ba47881fd..71d45b2c4daf 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -458,17 +458,13 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 			ln_mapping);
 }
 
-static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
+					   struct msm_dp_panel *msm_dp_panel)
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl_link(ctrl);
-	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
-
-	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
+	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link,
+							  msm_dp_panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
 	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
@@ -482,6 +478,17 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
 	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
+}
+
+static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
+{
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
+
+	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
 
 	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }

-- 
2.43.0


