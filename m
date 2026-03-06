Return-Path: <linux-arm-msm+bounces-95893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHnYD2AFq2kMZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D342256F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 17:48:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F2F1303A61E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 16:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A349C4301D1;
	Fri,  6 Mar 2026 16:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fg7sAIPR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlEs6wTm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42830428476
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 16:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772815668; cv=none; b=CYBVMeHymK2fKzTuzFYgk6IObtYXgN4heO5wUL5dL5uTx905WyQoMAL9TYRouLENbLRBnbo370EteVXBink2V/ET7bzrZUix1glX/WYeu+VPASDptSpWvdkjJw331lQAOGnmPEAWNvKi3YiLCm4PQKA7QZcG4dE2Fi1sJPWOPf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772815668; c=relaxed/simple;
	bh=z4RQ2542mdKmT7Il7PrHpeGFC5QNfj01HavCYOFO0fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffLFB3LjEmlRG/L+YeQbFJ3psWGqsaBOcwf7iUHt5KGIDHSawwj8HYTMX3TJQZ2uYxF598bSGi7bsF9szEAkvzygHC7Ylu1ul7f9qu55JU/hN3QkQp3cESyncjOypoZs5uOTqizN8MBpUzUIPgV5lTvpqS5R6tyC512Npf4I/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fg7sAIPR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlEs6wTm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FquMX549900
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Mar 2026 16:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M38kDb4qB9NXYQ+LHNR5zTGrfaGpw+7+YITovw8Gl8A=; b=Fg7sAIPRN9rmbSYy
	HHLD0I03VNTDzuvZQW0NZEK70cJcRcbMs5WZ105UmpGmQgmdEWJVtdUK3SV5gqdy
	Y5+witzW1N0Yt/Lux3lC7NtrzS9uiBOZftJjVnsduK57kBlD55+rlYlu2oznPKNb
	ER4I4Mo0au1Tdak9b9sHd/9SYVeQKAEG8W5aPNqy2XEBjkVOpX71FEKeewgLiq5n
	MMdGZrIBnJS9Ujg9gdPCHlArZHqLsBuUL52Kpk5PkC4xzr6jULVDiW9P0EF7VNRY
	ROeuep0aawKUcByF11dIwCeN96whWWDFvRIbRv8nwa3EBQpoAFhl7SPSf8X7As6I
	7+S10w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqruka699-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 16:47:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ab7f67fso1675984685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 08:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772815662; x=1773420462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M38kDb4qB9NXYQ+LHNR5zTGrfaGpw+7+YITovw8Gl8A=;
        b=AlEs6wTmLj467iPlzvLZPaF09ihLM6JUUrKfVW1SAkiL5FCVh9tdO5b2V6wwlQoczP
         Croh/vqQfjoO+gvbukUZT0Ay9z0ihW1dVxJM0p41UwWaFWcv0IUtrmcl029VBn3oGRVJ
         9LmnsPfoegckD86OVgRTqnZSeTBuGjoIngATtk9DqcCwPoRy3sJN+a/I0K7hrYFHjUn0
         DoyHp8tcu4USm3E8Uhajxzk2pX6qRHoYw/dah+5Isvebdhuj+kusK/6/JERZCORgOwiJ
         KM5S370Wr2YiAIN7Ce9NAQTc7vvyCJDlC5Ei2MmB+zB7kmEWAkht0pRC34mP8oWbxyG5
         tZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772815662; x=1773420462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M38kDb4qB9NXYQ+LHNR5zTGrfaGpw+7+YITovw8Gl8A=;
        b=jRNxwNIXcn93CrolLzg86/dwRjcCLBtLYUkDIwTdbx1wkY4DMqExabhJrxufuQ84Wh
         8WcmLwPUAZvDRvUwb5/iUbq4txCxMd1AUYK83UKkygFXk5sNRV+llKd3+mc/4F82t1Y+
         qxwu8WBU24DsvvPTHreRZLxltapoK4/ful6y5jBDtqXiumCplIuyuUSyg5CUrfDhoOZ1
         7R9AXHXryQU8DXsqKDUlZebT7rbgMS4nsWaPW9beZJb/JHPt/OK2/fbsfSYg/EJijFZA
         0fSSLvEM8EsN7yZvdGp4zchZ4w2OLW2FRTSG5J5OUGQy1nVGb/LgiV8dxmp0hoWu2e/k
         Cpsw==
X-Gm-Message-State: AOJu0YwSlJt0PEmBupkZo7FTQuIhfPnSm1xX/4BoxZokWUHEDyi5QEBz
	DKXc/wlyWi64camgEJLDdQjjm6T2Z5anwDU44w8ZB5eMw8xGN7HaiMAwuFKgbgHEy5z29r5bzy5
	OgcohQMo+5VK7iu5b4TlID2PRZUxKdrea2SsTm3wRj9rbfhHWs1UQAhHl1PRr5fnce4eI
X-Gm-Gg: ATEYQzw+WYio7e+FSCpJL4F04JZ09RuogCX9I5Yucw/lhBOyS5yAuavK4bqyqTy4dPr
	UIISBAiieTP51pf+o3N0pSDUT4s5Ceo2rK0W0MKdV3o7p1+rict1Yo2wuQgraifwj2oINx0FyKQ
	QPJ3UIUzGCx1diRPXWHMiBuwXtQQR0lxauwdpl981LipKK5mSA8qdnL/r9pDD1z62knOyPXJu94
	reW+3aSxZJlLnoGd/SXnpo7x3fpNRRa5AIyEEiwUa9c4uiftCKFmRjRMqeb9FqfiiJpMKbXIRjJ
	Ngboc3E7hQWo1rqpWum6Nzeze85qk5BdqLbppB7qtEjq1AAh7yOKAF8irX9st497M81zfnXXKX/
	nKEJ9TvG3sLcg9Tn/wl9QIsGJnIKUVV6scdTxeBv2I6tIr9AfmexyverUf4wGnaxmzTuFRt0icp
	rbrf+dp1PYgTRwk78yAFFg8pJ1CKeDAkwrl2c=
X-Received: by 2002:a05:620a:372a:b0:8cb:68ed:cc26 with SMTP id af79cd13be357-8cd6d3fae29mr342147685a.6.1772815662178;
        Fri, 06 Mar 2026 08:47:42 -0800 (PST)
X-Received: by 2002:a05:620a:372a:b0:8cb:68ed:cc26 with SMTP id af79cd13be357-8cd6d3fae29mr342142585a.6.1772815661569;
        Fri, 06 Mar 2026 08:47:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13eaebd0asm213804e87.51.2026.03.06.08.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:47:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 18:47:23 +0200
Subject: [PATCH 17/24] drm/msm/dpu: adapt for UBWC 3.1 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-ubwc-rework-v1-17-9cfdff12f2bb@oss.qualcomm.com>
References: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
In-Reply-To: <20260306-ubwc-rework-v1-0-9cfdff12f2bb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=z4RQ2542mdKmT7Il7PrHpeGFC5QNfj01HavCYOFO0fw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqwUP2sCuaPevdnSUx3Y/gS/IOR3Qx+EGuqMcK
 /UBoTsYZo6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaasFDwAKCRCLPIo+Aiko
 1SxJB/9DDzGSeQowiab9wf8vtsjy56GXYpuY020hSbY5xU1mSPCrN5QAtzKAM1ASP6ipmyRuqLE
 GOoVO8WVjgVmmvbnQ8IrABipILsbJbpq+5WCF6NCZ6i1ebFjwh7jA04DI2diRfPsu7FI+gCjIuA
 1MQBIKyO/waj7TjzMedkFdKcVmyFjKZj23WzlTjjAnlhMFT8QFdU3N5gZ+t0UR6WKZNeilA7F1M
 ESjWNBB9A2mDKYVwmi8VNMtuO6H+10pDwEWJZcHV7PeWx9mzg/P2wjeBips9F8HWRBeSeE2KnNz
 VBgiirurU9xOJShJBphLiyxpL/XCXb3IgaGUEpQpv0bosMij
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1OSBTYWx0ZWRfX3ULpz7rDLprQ
 yabA8aOl6V1nKS/FBKYZSFAcur6UXIoan2FKaCpPAklawmAsNNmtlmmBRSPVd69lEHw0rFMmLlR
 DFBNkKF1kTh7PHHGRuOU0GHw81dC1v0tZh00t0MVc2iVr6KAfT/m4voenvyx1hXbYxuCkhP7oQt
 PsNlfcNPIp9i2bzjJ1x4wvbCLrqoBGNHx3mIppaYHhqaNTfDTIr2hMiO0mvYfTOOWfOE7k+VpNT
 5EDLWTxJhDJI3IQ52JXd/6/mxkhSx150rjKsHV9w3N90XO1Y/RYE9ke+tybO1bTNYqEEfyRrHMS
 EAxtPPocrWSsMq9uM0uBvLl80uD8OcaG3f8zJj8R4VLcchwiVbj3O3F2rc1S5/rVu4VRyEvgYlD
 9TW2IAJOmertqD1ripOmsK1d/3Eg50zxDlWq7fkW5kxnM4X2nseW9lmbeuUrXvQPSBmY4lFcaZ7
 NU9jVBJSAefrVRZZOqw==
X-Proofpoint-ORIG-GUID: PeNV88azeftxQ6E11QOZQW3FAJnQt23I
X-Authority-Analysis: v=2.4 cv=DvZbOW/+ c=1 sm=1 tr=0 ts=69ab052e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=2jSDvX-ur01rGIY0dUYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PeNV88azeftxQ6E11QOZQW3FAJnQt23I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060159
X-Rspamd-Queue-Id: 23D342256F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95893-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.925];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Extend the driver to handle UBWC 3.1 (in the same way as we handle UBWC
3.0).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6089a58074ac..cb06db3cb367 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -324,7 +324,8 @@ void dpu_hw_setup_format_impl(struct dpu_sw_pipe *pipe, const struct msm_format
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_2_0) {
 			fast_clear = fmt->alpha_enable ? BIT(31) : 0;
 			ctrl_val = fast_clear | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
-		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0) {
+		} else if (ctx->ubwc->ubwc_enc_version == UBWC_3_0 ||
+			   ctx->ubwc->ubwc_enc_version == UBWC_3_1) {
 			ctrl_val = BIT(30) | qcom_ubwc_swizzle(ctx->ubwc) | (hbb << 4);
 		} else if (ctx->ubwc->ubwc_enc_version == UBWC_4_0) {
 			ctrl_val = MSM_FORMAT_IS_YUV(fmt) ? 0 : BIT(30);

-- 
2.47.3


