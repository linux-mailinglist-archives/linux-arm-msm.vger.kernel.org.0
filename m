Return-Path: <linux-arm-msm+bounces-102630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEBqOwTF2Gk4hwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:38:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 875FA3D5056
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 11:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD0E33019FC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 09:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D161033263F;
	Fri, 10 Apr 2026 09:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B22hTKeC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLyLLGc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780C834D3BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813670; cv=none; b=FCuz2riUV+E6tDgoklr+OZHuj1923I+3v897hwaRflLTYH61vW2cUCFO9cesQl3oEdytTUoAA587g/h7dw5PnFxXaf8xILWdeP6GVhyNTxYPr85LM+AapFm0lnW4cnAOydPD+1rxN+PioABCV1ffb7hBwbWVvFz6sGSO3AODvm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813670; c=relaxed/simple;
	bh=vaB5TI6vRjLHkdJJHUC0+HLPLyjZuxAcbDY5pvSAxd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DHqFaWGW6lNj8ZB1iGXOKtskchIojPwDe37M7SUmnM9Vhbxc+1b5qEKewJQ+nHY6MIRKJwfx/KA7HEGTLNUcxKNHRoq5sbyFZ9v2irEzsf7easffofHKMiRYdViO68H++9YC/27x/5R5z16Yu1duB2sPt0MdCEXuxwvolRT+lic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B22hTKeC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLyLLGc4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A5Ldft3352591
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0vw+GVouMdxvKPWFW8nnI4YGOVXc23873dfqdgV/NTQ=; b=B22hTKeC3mO4k4+8
	gjK+W8+D9qBjDhIIIv8/CyiP9GoP42nWcFXemIfJgZ4PJasOXsz4ww8RXo7moxuM
	wThH4DqSFiBbc4aFoxWv3kq25AjY6CoghDTy4K3SPBMQ5XiG1fsJHBdclEVtb3oH
	4wbsXor5YNIoSwrH2O4+IuQWeEA1eiUtsiizdkAAUfvdaFTK5/bazsGS5n8ciBqO
	MYmAWIUydhttkEnwENYpET7eQhZwmT0jrCUb90K07/+HjThjltrEzbg8f3CAVWuz
	ZTMtElyToeMSUHmD1Q4nm37r0eU6gW3jdlKczMqiGpExwlsXJe+V4VFPpb8M4lKq
	uJdtDQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1quv4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 09:34:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8dac6233so36198711cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775813668; x=1776418468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vw+GVouMdxvKPWFW8nnI4YGOVXc23873dfqdgV/NTQ=;
        b=SLyLLGc4Rw2KhfGXvqVT0HCGYXI+NdnVUcl14W05MuPcAMHSrjpnpk+xy3w9DtyKGm
         LnJPY/xoqXfpEGOZlhoqJY1NCbvVTZQMxz6VhH4AC/JhmM9e2LYK72dYBjowsn26BsLB
         qD1c7GcAcPevgmDCpbifUewc0Rpj7Y/37cw9x34IWYp2OCS0ePFyOX+ZEtuqs16M9kpU
         SipAqCVVyRxA4quYR8M+g2eUWou0Ps2Qb+dwf12IN+tDy7f7ZKm0UcXGPz+MOeHlRy4u
         97R+pfE7bWD+5TYI28sPYoS6DcH4jF3hcQB1Juet3rMopvGroNqqM1shnScvg2ulgjm0
         iVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813668; x=1776418468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0vw+GVouMdxvKPWFW8nnI4YGOVXc23873dfqdgV/NTQ=;
        b=Yx04sm5Wg0VLG99RczVAP2bOOcAnbdUWNlSPPVd5LdGG0+dBsVMQO4QFg419b/v8av
         gu8Mxn+AdVAVPZ4BngNULntTrg9zGgGxq7lAeUnDACMrLkMQl2BLDmvpAVNuBHgsClUh
         dZB4sOCfT6bM7pCUxVGs1GwSjLeuLIFGfy0yW33JEXKkQp22ABrgy6z3bPyqQAcUynx7
         TClFZ+ZO5DIw4TmAVT2IZLjJlO1fXloT3oVXBP7b7oW8pFcBeYtWk0YfJzXkki5KnJPq
         sx9FVqc7P/8k/GmHThNbP/vKerQtGhJlp7FkiFFJedf8zf1MGk4Aalmv6CrtFmu8Zifg
         sf0g==
X-Gm-Message-State: AOJu0YxCdHiWNCUKfwEH+Z6G8RNHJYRyy4bNmPPKrz2iQL6CKias9+ng
	UhIyE1j8spGzL9SRhQq2ofIsC32vpp5+1ULKrs+RB+BHQBHzyMs5VJmNj8bOfMRhdvhSCWRM9XV
	ARSZ8a3+0Ww8s7Sn8ZYa/7SxQHXiVF/2ttRw8uQoGboftXVNLBnLdj9xh4JnlXugfCwL9Ksx5rN
	movJzwQA==
X-Gm-Gg: AeBDietCkB/FEIYLucWgLCD7sdNXmKLrbFlv5xNLvlhUlFGbrFOm+Q1mgIPhTwVrvNd
	XDesfXz30kvHNAAJPX8Mhh+0IdQyita0rlCZ9SYQhfBzeVg4rjob/xeBEc8msbWD/U3+yuMIdAV
	cO4Xra9eCVxwBV2c+8WUxpLogkSj7okB+n4OO1BP4R2JPQDxlhAvqXZ2l8GfllkltdSEQDxZCNH
	279zE6SA3rv0eismePOCKn5GwjQvxtIaKUeU1enwEOYqQ0/6E7IN5YX8xNhNqVT/umFUUip8cW4
	HsE9iTga6Hp2n8NGW4Jq3N3ta1P9FV4YktM9QSLWV3zBnhu/FCGKFIVzjtr4c7JUh27yCReuGcc
	h+MfveednuSNZ9zqmavGVxMiUDfRpYMymUeMeI9T2mhIwoMs0fAXXTTCCoYdlcscn9W19ZDgDLu
	jfbVYsqRo=
X-Received: by 2002:a05:622a:7102:b0:50b:5286:f768 with SMTP id d75a77b69052e-50dd5bdaedbmr28094441cf.48.1775813667797;
        Fri, 10 Apr 2026 02:34:27 -0700 (PDT)
X-Received: by 2002:a05:622a:7102:b0:50b:5286:f768 with SMTP id d75a77b69052e-50dd5bdaedbmr28094221cf.48.1775813667380;
        Fri, 10 Apr 2026 02:34:27 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb135fsm19223386d6.38.2026.04.10.02.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:34:27 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 17:33:42 +0800
Subject: [PATCH v4 07/39] drm/msm/dp: split link setup from source params
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-msm-dp-mst-v4-7-b20518dea8de@oss.qualcomm.com>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
In-Reply-To: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775813628; l=1313;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=vaB5TI6vRjLHkdJJHUC0+HLPLyjZuxAcbDY5pvSAxd0=;
 b=g5dy/hjzpqUBHlCBjit+1XAMpFzbXR2uUyC1CU778OHY7g9h5f7BS1OKg6d5GQ8yCvuSBx+89
 jexa4rpk6R6CpOOvw+UYfzVzsgtOokS5vxOsTFBalMToFMTIa8JOWfj
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4OCBTYWx0ZWRfX7zEbXSDohSjt
 hXq84zlbVM2tF4DXQJzWu9pVi7f9aqYIGUC8GJREJWT24k/jA08e9gWplAC8cIti4/t7jq/SDcn
 xOvJ/kpV/woQmoWsIo3RbcQd9vQbmsLGMb/T5LqmH6CDJSvKJgS/bv7Ig+isw33f6m7ctRhLelO
 /mat53cSZ3XaucRHEzf8WqDsRs9Crp8X2r68Nc+NB2mlvqVU0kl9xJPABNJtX6JbRZrmPxveUOa
 WTkLxlC2CS+P14vbGF6ZEQukivAlW2B5Aj1bKKx0FUr+RrjCP2fyYa0QPW7FDIgzgtJO0dS4PdC
 rWsRUBkZgev1AkZe7aLj+XARk2XHknCVESJ311nRg4LfPV/Yz+EBXdTwO+uKEHuAUDUMYyarVD6
 FBGYbsHkNTrkgZtL68WtjFJaq/R1SKvrAJWFI4Xc6zjHQEpKhemf9lAUMkMLqwRY2FxKoHZFEv4
 UMv5MXG2HucqbvoWoUw==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d8c424 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=saXSvH3Ee-fMY4W8qR0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _3ggJ_cNpjHHVflxgxFhySZpVbB1Y7Jx
X-Proofpoint-ORIG-GUID: _3ggJ_cNpjHHVflxgxFhySZpVbB1Y7Jx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100088
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102630-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 875FA3D5056
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

msm_dp_ctrl_configure_source_params() should only handle stream-related
configuration. Move the link setup out of it so MST can program link and
stream settings separately.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index fd6caebae148..cd58968d4e14 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -479,10 +479,6 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl)
 {
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl_link(ctrl);
 	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	msm_dp_ctrl_config_misc1_misc0(ctrl, ctrl->panel);
@@ -2571,6 +2567,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	 */
 	reinit_completion(&ctrl->video_comp);
 
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+
 	msm_dp_ctrl_configure_source_params(ctrl);
 
 	msm_dp_ctrl_config_msa(ctrl,

-- 
2.43.0


