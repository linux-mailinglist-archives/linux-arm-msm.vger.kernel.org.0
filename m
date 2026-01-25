Return-Path: <linux-arm-msm+bounces-90438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKv5ETIAdmm3KQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:36:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4A780545
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F74E3007CB8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 11:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9C531A077;
	Sun, 25 Jan 2026 11:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j34VQx9m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GjlTMceI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7625231A7E2
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769340640; cv=none; b=ko7yIsClI5Q+jYYawIVeaZY22kdSQr7JPZ/XrSl7PFh6f2cZkCYMjuJHk9d5Wpfv1I+EyFEayPVgPtjpAPiVdWGnqvEsYdeclH+nJilI7x3syYhCJeYAmMQudF+TQZOtey3K91ecMIU5PF0o4vrPcdEUJ24B2TaygGcAU3syqmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769340640; c=relaxed/simple;
	bh=Zii42vc933kIDeIsFaUR4oAw5uqkZPXC/RIXb2eV3yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ifv/feygS1t639jL6l/y8L5X0LEw+OgEqRZtNv6rTaOHspTMtibVkk+QdYIyGZy+e1aFuIjaY97WWx5sVAmVuY6R8As4V5LjdzqIBiFHo+dVtL40fCizzDuNl53mXMfqRF9Hql+bEv+oF3qbFEd02jbSbTU35aAfjmG/aTNajBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j34VQx9m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GjlTMceI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PBQs5K4093644
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=; b=j34VQx9mqIC+owxT
	/qrHhYXdoaLHomDTw1Hd9ylZ29X7bAjAbXW4j5kMJVIRddLGrg0MlRZ+bRGyK5c2
	adw9fGmKUFmewU65w+tz9V9A8ZUVtVHgQ1PULCYeWgPh3gbTGRM3WEcUhWDxOeTF
	bnWSN0re70P2ldtttax2QoKN78Jp1nPyI7Sj5lklzA9KJISuSjxKtop3Tc2n63Qm
	IU86Yhn98kEvlhsHXdp1XgvWEj7ZNMNa4wmEy6lrkXHZ/tIioadoAQ6L3KbL6zf6
	K6vi8ShptKAKeRFisthS66SFKkkCAJILCBh3pbuXpgMf/PjL1kk6l5jES2SK9ta2
	DvkmhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq3ha23t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 11:30:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a291e7faso1309271085a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 03:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769340633; x=1769945433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=;
        b=GjlTMceI+L5zprYTmuxPyVi9OVwmcMe6aRu6bQDIFzSHPuNJBQQfvIbIFjWpGPfm8a
         hTPTDUQIfFF9HUexmxFS/h2VVzGE3FfSZUuYOYaHyYkb8veNC45lqcnuSgqBccZmoT0U
         yFev9Tp3paYqKtEVprV8oj3VhIGjyMmf+oJ9+jaDrZ0vqpyB0uGOxWrLit7P1OXSNxxL
         +CXV8wblvzeYNFERGsAUF78IC3WwobYki/cIRg47UBGeQirSUb9UYTvH3fxoP01esDeh
         svwO6OQVKIlnpLY4RhtqVDpwE3ktqkqf/ZJms240YdnkDza8ky99lMw16fIZLTbDm4z8
         nj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769340633; x=1769945433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/qBXAspLOui/eBATBY+xFXnkG3ex3UdKwBiljLWkZ0s=;
        b=lTjBux9wF4xGzX24NLyrPnQGNRDsosV6uJe9H5HcaiKosVGQrqnTsWhjBorGTu/wtB
         EEJkN98aI53GccBTHoqKcE724+JT1ugfDID9rNHn8VuW3i8159/+e9BcV42Nxh7mK/Ve
         digZbZYchGLj3B7OMQqtzbvpswCAPp7ONynKWmfCszQHQRFCqpAG/T7u4caQVn+hE4Hq
         L6xW7tqfPsTtjEvxqcceHUM7B0hafB5lHuQcWem12p7Sw9fs6zzDjciDYu41n+FTdYmT
         uR7yK85YJ2sI5n/Be7OlR4pEdXSCL9i7d1UG0ISlciFwPiMaCCjCvpME9A6I+KGKk2Cs
         tpRg==
X-Forwarded-Encrypted: i=1; AJvYcCVAvWl+o+uaLsZIJup1UTzAQkSi2JE4QjZhQEBvD6yW0k0/5s4m3jX5E8TujYjiLPVcbXs+y1SRhSl5LZMw@vger.kernel.org
X-Gm-Message-State: AOJu0YxqQJtlWldMcRBoXB7gAJFHyHm2ARAFAUsT26D8WTqIhP01JNL+
	Uo1VscXk6jq6Y8EZwBdi/EgVd3mcoLItOEtPt7paxtBawRnUST9zLSnBjO9WOZTPmTtz0hXDMRZ
	Re/dNL/Mdj0eVS9G8bieaoLpuyildOEbL/1wu5Es0n+LgBaDWyzab8tcZVWrObymDdsz7
X-Gm-Gg: AZuq6aL/456+xCb+IWMkmnzpnfQdwaUsKW3VJdmwLXOvTRbJ8YudsbbrksCJ2QYqh28
	hWXwbO8bngS0LnIy4+1crabaLfjl2S1XHrbAn7rzNS85H2MP31G7Ae35uDCrieZhgkCoQ3UpI1M
	7TsFjjlEUHqWqLsSn4jDH2gPMYeiQ25RhHRXntj6KXs6sbJ20GVgn7o4qhzddOhgyyQMH5dt9CS
	6PQNK+m+i3gOyfs3XNABcYkevXtrtrLGcQV6vrc5wXSdcbFqQKtw7R9Uneh1x32onC9epHkb5Pa
	T4qaVhn4NeMDF2x0gTF/5c/ClS2oA2tUG+s7lpe8AHUsUe2PO4eROS0n4QAkTe6HdhqqpNspf/7
	VDa0B67j4k1rNwlJnx+VHLtvI8nrEDBxBOMj2jql3TDXCtzslE3Vc962FVH5GzTkBqdFqa5xhgK
	CQLumTJxdD2AnTYWBseDG7EWM=
X-Received: by 2002:a05:620a:29d3:b0:8c6:a8a6:e164 with SMTP id af79cd13be357-8c6f9624ad6mr138743585a.45.1769340632871;
        Sun, 25 Jan 2026 03:30:32 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8c6:a8a6:e164 with SMTP id af79cd13be357-8c6f9624ad6mr138740885a.45.1769340632419;
        Sun, 25 Jan 2026 03:30:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385d9fec3c9sm18583451fa.15.2026.01.25.03.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:30:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 13:30:10 +0200
Subject: [PATCH v4 8/9] media: iris: don't specify max_channels in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-ubwc-v4-8-1ff30644ac81@oss.qualcomm.com>
References: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
In-Reply-To: <20260125-iris-ubwc-v4-0-1ff30644ac81@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2408;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Zii42vc933kIDeIsFaUR4oAw5uqkZPXC/RIXb2eV3yc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdf6/GFwmt3wB/NNDPoTG7FPLYdaLK8uoEJNB/
 co2oG473LmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXX+vwAKCRCLPIo+Aiko
 1T/cCACIWuIaY2aDARq6LRJW0RYbNHy9b2znKquYteXapTrcyF6XjXnM4YwfgdgYrNwwn19rAP3
 yjn/8aWgAm3qaWKj/IqiIzSvGVIDY0knz8qjCiC5/twYYxcyQsPWWm9pVY48zjIS/MfW/Jm0+bU
 qz/euUYTsG7s7KbB1AxAO8GOGiEJ+m2rH2hThU+HTWEnxbpAfy9U18++i3MFMZ8Xp7LLYHtBdzz
 rOOS/fB5C3xR30r7RepYodaAcLYWiiRgbncriHF//yjmrVY9t3jJSspBkjwsMPHhFg31qZneVI3
 0hdRnSXZIw4tVBu7LGn0QHdJrIbFiBJ35V2WE0Esc3StzJVo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDA5NSBTYWx0ZWRfX3mOeuBV9RgiO
 MAwhiRXZxWLrxGaLumsmQh4wiKjyiGgKX7fWHGAJa138dBFc4uP+jzkF0r6xyVVTr1GiNKGq6ev
 h13tNuDqAqqkuzHGeI0NuJUV0MA9pXn1j97Zdf3NJsYYkR4WBk07agMTFUSMelVHXraNy5+Cdfd
 dw4sPMIP4xeh3bU+E610XI9924iR7gUWOHkfn1cRt47D+RSG464+rdMI9lJCZfUAhMBfYDwPxPx
 z/TTXPdoXTitYQxrj1uUqqqvwbQnvzMFdREQqDGjZCCKIETdbLf+6rmwfmKu3RKFQ4/+AgyYK8+
 Kybnn+Bh7KokPvmWPiX0K0TOlS4DvvO+gUIvaLQ+u+PR/FnFhmIX6mCNEb84PFd+y0g+HaS8IBP
 4iA95jSNRXLXcKOjJsOJJPUdja2xpa4M55NVrsFGxMo26x4hnxXn3dsB/HPXUSEhN8YCj8Fx3NO
 30oNqBGSkYRVj1F6BFg==
X-Proofpoint-ORIG-GUID: K9_j2inv6Z2luBBQIItw3tYGThdld0SA
X-Proofpoint-GUID: K9_j2inv6Z2luBBQIItw3tYGThdld0SA
X-Authority-Analysis: v=2.4 cv=c/imgB9l c=1 sm=1 tr=0 ts=6975fed9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=rTy9geyXzX0TkIcb0cAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-90438-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9B4A780545
X-Rspamd-Action: no action

The UBWC max_channels spreading is specified in the Iris driver, but it
also can be calculated from the platform UBWC config. Use the platform
UBWC configuration instead of specifying it directly in the source.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a49394b92768..0d05dd2afc07 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -140,7 +140,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->max_channels;
+	payload = qcom_ubwc_macrotile_mode(ubwc) ? 8 : 4;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_MAX_CHANNELS,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 07c58cf3a14a..e8b5446dce76 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -76,7 +76,6 @@ struct tz_cp_config {
 };
 
 struct ubwc_config_data {
-	u32	max_channels;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 4e617176dee4..05b1dd11abce 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -791,7 +791,6 @@ static const char * const sm8550_opp_clk_table[] = {
 };
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
-	.max_channels = 8,
 };
 
 static const struct tz_cp_config tz_cp_config_sm8550[] = {

-- 
2.47.3


