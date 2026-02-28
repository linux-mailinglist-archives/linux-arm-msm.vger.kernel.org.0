Return-Path: <linux-arm-msm+bounces-94620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFq6JqcJo2nY9AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 16:28:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D35F1C3ECE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 16:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8820830DCCD4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 15:27:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E98D47D923;
	Sat, 28 Feb 2026 15:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xs6Gvsgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJYbR5Vs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEA347CC65
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772292403; cv=none; b=UBceSR4Pu758E6JkD1RaJw9qPtZhlX4llbBMyxQ4DiuHcv0jbL36w7/0smNHRsnZ4aHq7VGI8+v5efiIQcI6MUo/d9ouTt0euIW3rCuzlATbPKfjfsRTya6TxjqHUcoOL7yjaLcuec2QRn3xqRt9zyV5kELWmdVACZesaM6zzX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772292403; c=relaxed/simple;
	bh=UTDd4q7OJ9ElblHjzyWaiYHRBQRX00Jcn7/ePPmgxl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dz1Kw1xlABi42oREQ5IQXG1YiN75Xlj4fkt+2OTshWtbEvfx5pvb4kp3pPExqKnco/QWeogydfjhPxp5kVQJ5+lW+S+XHnedgXjFTK8LOY2Km3RhYCLjMsl7nRVBSjLSForI0rpXvhMfYVZvmPrVwHtcgZLr72cucbO/3oZgdGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xs6Gvsgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJYbR5Vs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SEOPVj2775471
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5hCSj4BVNzP/ybKc2el5rIGmk2I7+zGs50Rsmhype+o=; b=Xs6GvsgkwprcBaMq
	0Qhbd+iya897oZFglK8jPAjSwdqrvgC10QiEdmSIpPpankF/CECcgfsTwDsYRJZK
	yWLJVynaoe0vbZ3AGprmVQ/pflVUIfVHuV9iC4r6O+7UmPYaU1HVarWRPkGV81cW
	8tmTMo3KQlkqA440oCkJvp4ZWGmFeUEU1Vtwx5PGz/cTRfVtp+x22KWCf2hwvc9s
	n//TrodlABw31FSOyM6G8ziVcUYLW98uW/dEObuYxqp08QG3Hs0ZC1TjgP5bqwzD
	hMFUbWNEiZaiVWlirEEQsgjqOC/Ml+Vwx87p8/XOqeuCGtHXmu+M9Lh2nFKnvVqu
	BrfVmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq15tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 15:26:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c711251ac5so2453978385a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 07:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772292399; x=1772897199; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hCSj4BVNzP/ybKc2el5rIGmk2I7+zGs50Rsmhype+o=;
        b=CJYbR5VsmnxWTy/KTND3ljROK9IPAIbOT3GngGWX7YxEW/zs/Cs+aB1fM+WdnPOJ14
         BqrAv06lb12lADbq++UTdVAod2BA6D6kkXBzECE5WtPp9uVToxlHj9su6w0VZepZyJQ5
         eFT4dPa+MpdueDeuH17H4kFLNplOOLo/gIThJdJ0m+dJ/s3s8a6ak8XppFlXQi+WVlMp
         6x2XuD5DdHN6vDm1Gxg/Yv8Ksxqm+IgN/CWR1BI5KoMWOITh/B3U5sX9eq1RGQcYFAP+
         cEXvGQPepbBUZlGIqRtCNUZzlOitq2UD5fbbUZ9mLUla4wM7Nz4ghcEQgixrWf0c7diS
         JJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772292399; x=1772897199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5hCSj4BVNzP/ybKc2el5rIGmk2I7+zGs50Rsmhype+o=;
        b=asydEMqj6rO4XwTwZsdBWUQLsDGuIKJ3iAJuli1XDQcgjJ5+ggUZ762kaiFOm9qqgf
         lKe+/RCs1Oan+0o5kXNBW19nLCeEbKEqK40eZ3gmhL3+2X4EFp9BDlWjsTvPKhLEKeqa
         g9TgHt6Iaw5MBrMwd1AGDlky9xEaH14/IdOICtdOBUQAib0129qIUhSEilCzy/F2wkBk
         dOOm7byB2dQo2657MG2v3yEORwQqK44KIiC2w1jdVRNuWbcsbB2ptNWXlHdVScZwgXBF
         6iHu33VmAs7pYpajosPMmUBSOT9ZcZIh1jERDWtGgvO118OU8PBDsbm00eUegAgCPuA4
         GSJg==
X-Forwarded-Encrypted: i=1; AJvYcCU6ALfQRzdVaOIfPbBu/NjTlNLxZv615nMnkrigHstO/EsnHjQCgE28tADtZ8qcH5Os0h7iIBrdVIxc9lys@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3wt5p8B23neygMabOFKdEodPzX29DGnBjK+666UUzikrGgq2Y
	ifJ85ICI0pOF4VU1sJoOCbew7mRErULEq9EKkcr3ShBmWxuyMwQZw1V4stwtp986AntR3IDpPl7
	PPFBGa0TrIsA9sDJ3hgQY+F3iEOOMYJ7PiWazaTFJGmRqvAfEss2mSO682VhMAWvpY3QBehTIgS
	cG
X-Gm-Gg: ATEYQzzYWp4ePrqDGEDwkjj/7LTcTs6fhemw3l0oDEEUjgGGMeYbJVtd8mqXnwu2BZv
	dvDYpxtiZl83g4CBRy9UZZ3C2bYn4ChVSmSMn4pCcOr6x4dTySTSfJf5V+A76O78h6SoCCkU2cx
	tO/NdryHJ709+cOq2+vPpm0QFmF9d6envr1TChl+0mfXnF+UKMK0vcC0KJ53K7+VzL2fswakfs6
	YbQwAM93CeUlvLKZEYefNinOUZis98WU1cu07qp1XWqOMn+JARE7s6JDY6//ES7cgd6zLKSJFEg
	HWgoLFYTzouJBU97nv36aPR6jRkcMP0KtSb5j+ReKGrRz3gCx5t9/nGnDmLNbHNSEZQQqgNblx/
	hZgRYVclUsskPbsNYe1M9tmSitR0eN2zBql7f7tg0IX1khP3/px9ek3qnLdd8o408SboH8XdQqv
	RuCAzEcFy5UiwmCXHz0F9i4PdxFOp33rEtjls=
X-Received: by 2002:a05:620a:4409:b0:8c6:a628:8608 with SMTP id af79cd13be357-8cbc8d71072mr739578385a.6.1772292399116;
        Sat, 28 Feb 2026 07:26:39 -0800 (PST)
X-Received: by 2002:a05:620a:4409:b0:8c6:a628:8608 with SMTP id af79cd13be357-8cbc8d71072mr739576685a.6.1772292398661;
        Sat, 28 Feb 2026 07:26:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115b57922sm625558e87.63.2026.02.28.07.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 07:26:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 28 Feb 2026 17:26:32 +0200
Subject: [PATCH v2 05/11] media: qcom: iris: handle HFI subscription
 properties directly
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-iris-platform-data-v2-5-acf036a3c84c@oss.qualcomm.com>
References: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
In-Reply-To: <20260228-iris-platform-data-v2-0-acf036a3c84c@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10234;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=UTDd4q7OJ9ElblHjzyWaiYHRBQRX00Jcn7/ePPmgxl8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpowkmJoUbM/bJVcd8YEJpVlTqcbJiVkix/KhSC
 P7maXrzFMWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaaMJJgAKCRCLPIo+Aiko
 1bwcB/9gEEly6MMYnOeG4BOjaxedwgB1aHHdiFGDWQ10o+9Ps57D6FMamxoG27mE1eID9jVMBQL
 FA0rOstJBdlFCOslIlXPpNnxDVIWAn4N2rNlEEe/ELgxhKjNZFSMVv96wOnN6NHGKSwZ1K5KlzV
 rC3lz6aoMgiW7rmhImMsdFSoSzf9JAioTAMuSVaQJ9KicTx/N9QPvk2XJNwaWikuUVWZAg8MHWN
 oSdGMQ3VJgyXbtcBkrUjYbazXDk0KLQsbbFmq0OoexB6C8PthE6bPYzrMjzeEXdPAeiH4fQdCCP
 As5dSgKiT5b3Qxv73JYShjixvijITAfkWjX06q0LMvvMrkht
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: a38_fMwodjY6FnLLapnaucxQWb6wZlop
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDE0MiBTYWx0ZWRfX2sRncU1xxmQH
 X0BnTpRU/vrX+NgN9/bxq9zLJzVbMKE/uNOvMP0wKkP6nJEgbR7/svT5H2qXvieUlOPs+Mc1N2v
 sszKrfhCq2dFGdpEdlm+nM6OVIR128xffnpak3OOGn6P7gTVKyag9dQGlGfkypwW6iy4a1pbggr
 +fYNnfc6Po1hP8mw0ZNu/+Gadw9YKmzQ/6Axnx7nNMHqQVyvYc85R41cY2PfjhfD6A5wcjny2BV
 UYoMtSUIAM4rV5d3/hKB0pwRxUeXGoYCCZBwr6jccmmJD+Yh/Rs2zpzoeit8faiSdY8uv16HL8q
 41mENhn2J004IQlUs4lctA/uk1PzjwT7Z9x5oE6FHWo9fJGCQ+djsUag8chEXhBcYg6y0I0BZpO
 dPGOysaPEEZhE1M7j+fgrcg4FNsBAxGmSwQMPbum/dHrFiQ2c5vcnc1m0+VHF02WZVgHCliq/iV
 CpFG9h/jmT+gYbIPeSg==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a30930 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=GYkPiPrV-DgmlJk3dwoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: a38_fMwodjY6FnLLapnaucxQWb6wZlop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_05,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602280142
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
	TAGGED_FROM(0.00)[bounces-94620-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 5D35F1C3ECE
X-Rspamd-Action: no action

The HFI subscriptions properties are set per the HFI generation, they
don't change between different platforms with the same HFI interface.
Instead of copy-pasting the same properties between platform data over
and over again, move them to the corresponding HFI generation source
file and drop them from the HFI platform data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 50 +++++++++----
 .../platform/qcom/iris/iris_platform_common.h      | 10 ---
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 83 ----------------------
 3 files changed, 35 insertions(+), 108 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 28f352d99bf0..fd8a055c4acc 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1053,9 +1053,31 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 	return 0;
 }
 
+static const u32 iris_hfi_gen2_vdec_input_prop[] = {
+	HFI_PROP_NO_OUTPUT,
+};
+
+static const u32 iris_hfi_gen2_vdec_output_prop_avc[] = {
+	HFI_PROP_PICTURE_TYPE,
+	HFI_PROP_CABAC_SESSION,
+};
+
+static const u32 iris_hfi_gen2_vdec_output_prop_hevc[] = {
+	HFI_PROP_PICTURE_TYPE,
+};
+
+static const u32 iris_hfi_gen2_vdec_output_prop_vp9[] = {
+	HFI_PROP_PICTURE_TYPE,
+};
+
+static const u32 iris_hfi_gen2_vdec_output_prop_av1[] = {
+	HFI_PROP_PICTURE_TYPE,
+	HFI_PROP_WORST_COMPRESSION_RATIO,
+	HFI_PROP_WORST_COMPLEXITY_FACTOR,
+};
+
 static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 {
-	struct iris_core *core = inst->core;
 	u32 subscribe_prop_size = 0, i;
 	const u32 *subcribe_prop = NULL;
 	u32 payload[32] = {0};
@@ -1066,30 +1088,28 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 		return 0;
 
 	if (V4L2_TYPE_IS_OUTPUT(plane)) {
-		subscribe_prop_size = core->iris_platform_data->dec_input_prop_size;
-		subcribe_prop = core->iris_platform_data->dec_input_prop;
+		subscribe_prop_size = ARRAY_SIZE(iris_hfi_gen2_vdec_input_prop);
+		subcribe_prop = iris_hfi_gen2_vdec_input_prop;
 	} else {
 		switch (inst->codec) {
 		case V4L2_PIX_FMT_H264:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_avc;
-			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_avc_size;
+			subcribe_prop = iris_hfi_gen2_vdec_output_prop_avc;
+			subscribe_prop_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_prop_avc);
 			break;
 		case V4L2_PIX_FMT_HEVC:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_hevc;
-			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_hevc_size;
+			subcribe_prop = iris_hfi_gen2_vdec_output_prop_hevc;
+			subscribe_prop_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_prop_hevc);
 			break;
 		case V4L2_PIX_FMT_VP9:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_vp9;
-			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_vp9_size;
+			subcribe_prop = iris_hfi_gen2_vdec_output_prop_vp9;
+			subscribe_prop_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_prop_vp9);
 			break;
 		case V4L2_PIX_FMT_AV1:
-			subcribe_prop = core->iris_platform_data->dec_output_prop_av1;
-			subscribe_prop_size =
-				core->iris_platform_data->dec_output_prop_av1_size;
+			subcribe_prop = iris_hfi_gen2_vdec_output_prop_av1;
+			subscribe_prop_size = ARRAY_SIZE(iris_hfi_gen2_vdec_output_prop_av1);
 			break;
+		default:
+			return -EINVAL;
 		}
 	}
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 00e40590d5ec..f5eb17ae072c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -243,16 +243,6 @@ struct iris_platform_data {
 	u32 max_core_mbpf;
 	/* max number of macroblocks per second supported */
 	u32 max_core_mbps;
-	const u32 *dec_input_prop;
-	unsigned int dec_input_prop_size;
-	const u32 *dec_output_prop_avc;
-	unsigned int dec_output_prop_avc_size;
-	const u32 *dec_output_prop_hevc;
-	unsigned int dec_output_prop_hevc_size;
-	const u32 *dec_output_prop_vp9;
-	unsigned int dec_output_prop_vp9_size;
-	const u32 *dec_output_prop_av1;
-	unsigned int dec_output_prop_av1_size;
 	const u32 *dec_ip_int_buf_tbl;
 	unsigned int dec_ip_int_buf_tbl_size;
 	const u32 *dec_op_int_buf_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5b157697d478..ef70472ecde5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -794,29 +794,6 @@ static const struct tz_cp_config tz_cp_config_sm8550[] = {
 	},
 };
 
-static const u32 sm8550_vdec_subscribe_input_properties[] = {
-	HFI_PROP_NO_OUTPUT,
-};
-
-static const u32 sm8550_vdec_subscribe_output_properties_avc[] = {
-	HFI_PROP_PICTURE_TYPE,
-	HFI_PROP_CABAC_SESSION,
-};
-
-static const u32 sm8550_vdec_subscribe_output_properties_hevc[] = {
-	HFI_PROP_PICTURE_TYPE,
-};
-
-static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
-	HFI_PROP_PICTURE_TYPE,
-};
-
-static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
-	HFI_PROP_PICTURE_TYPE,
-	HFI_PROP_WORST_COMPRESSION_RATIO,
-	HFI_PROP_WORST_COMPLEXITY_FACTOR,
-};
-
 static const u32 sm8550_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
@@ -880,21 +857,6 @@ const struct iris_platform_data sm8550_data = {
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
@@ -954,21 +916,6 @@ const struct iris_platform_data sm8650_data = {
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
@@ -1019,21 +966,6 @@ const struct iris_platform_data sm8750_data = {
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
@@ -1088,21 +1020,6 @@ const struct iris_platform_data qcs8300_data = {
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
 
-	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
-	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
-	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
-	.dec_output_prop_avc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
-	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
-	.dec_output_prop_hevc_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
-	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
-	.dec_output_prop_vp9_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
-	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
-	.dec_output_prop_av1_size =
-		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
-
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
 	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,

-- 
2.47.3


