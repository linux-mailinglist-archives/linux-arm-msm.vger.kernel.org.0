Return-Path: <linux-arm-msm+bounces-95141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oILWKeHdpmnRXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:10:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 208CD1EFF51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B81C030B6F15
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D55425CF5;
	Tue,  3 Mar 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2vOx485";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H38nHczZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB3A423A72
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543318; cv=none; b=fKAO2raMVB5RCCqs7MSWu2KsWsadjG2xFcvZHWMa+fi204XdrPNgXj3B8Jhh0utkf7UqWQrEpAgNGBcDP3Vz4wA5RJfxpnnimF04FftdkbCYjX9uAC0fAesxma1M0movVAvRxK6d23RCb0/WNteGBdZbS4af1PPQ50cUg1C3Q2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543318; c=relaxed/simple;
	bh=mg3cgdFC97FWfUrb9+ShMVDPv7tjEPXw0RKb+29/bTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R9pAa1jr4dAyBV58cgF5HSbqaz3f4PWb0esrbWCcTSLLF8viug81w2X7DTN8+Y5+w4V/qVZkJ8bgmoo3SBzS/7ZkMw0N3PKmwk0oL/473A8LQTGf3ubIjgW/pLh5TVCl+EeX8FoQ9VO3avlatWDSJPPdpP3wIptq9b4mW4RPbAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2vOx485; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H38nHczZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mfJE3099402
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xVqSxzb8Gx/OXYlUpwc1ht5p1yYFS/pP5SVduKoWSQ=; b=B2vOx485Jgd7iO6S
	mIysokdZHhYU8oJZiwqhqoVNhcCivsfnxPbotaAcllE87YVq0hAUi8iKicFW32oo
	gmc4pJS4NDkuihthd8a4xq4+dD00ptVVlQrTi08tHlLQPLjqTudQXIBQwTkoIQqa
	HagG0zFbgRUm4dev27mO2CKp9gIVkAao/ae6dFtQ8eFPlBFLDYg0gqnbndKOwSbe
	HhfPk/4nHrqJXO4a5YkDr1qjxYt7wGeqi7bWeWfHqsJ3hcz52Az3LHPMPjAfev/i
	RR287R9kBNw4eAiuQ3TuliT9hgEW2EuJS9Ji0WbpQHB56ayGboG54vZV/8KS4G8x
	cr3PlQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu0y9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:08:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso672462785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543315; x=1773148115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xVqSxzb8Gx/OXYlUpwc1ht5p1yYFS/pP5SVduKoWSQ=;
        b=H38nHczZoxc+kSxWepDP40DBmwTh5VUpAgPMHKqthkWCuVXOIBsYLAEoiQEKiM1Pco
         H/lQ0JBvE/y/gheTr3QLMw07BhcTvmMoTGed6dhO1YzKiiN3RBTVUwymq1Z2dRXv8GZT
         YKKMHDVcWqztDFJ5RBmpOhQmYfBKJVgbVHR9I4jITB6A0wxCSkmjASQcufR5xoHyGDF3
         4rPVHc/WdSz6jK9ITfuDiVpFIdjEqSP20UtQXppwL8ZHFm48LAEDVHfwEbZ4PzwxeMnl
         u65DeiBLfWJlHFzPVdH/Ogn/0gqQuf7f4gWIAiHlIeMtxaOEd+7ZqFzgvYVGe8mYzuf5
         Zq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543315; x=1773148115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8xVqSxzb8Gx/OXYlUpwc1ht5p1yYFS/pP5SVduKoWSQ=;
        b=KJV6zBwoDGNQOFvWu/9m4MsjQCW6fyUhEoEG3aoURooj/7dIlEuyhdFWlNstOIv+AJ
         YGjvgGqvDWVI/HOgDZFUBXtOAJFUrzjLEBT/UWYiEBwwIc6w/3I1eAt+pv63TNtpkh2B
         4BB+iiLO4AbstWNuodhtNT6sHM2fKsHE3V12eH2N6l0gxINADIDYPLbqwD/Hir12ojhV
         ohvbLLXzq41avcMKW0IC2cjhPR3rYj517ht9tP/7EYpsBCP2PyssMeCJv5EemhbP3h+W
         ebgBrJ+U3jNEj7D1NggDfOiWL25ec6YDRuZrEwaxNY0Q7r/YT9/X3IU4/GGS7dkfh0BU
         E56g==
X-Gm-Message-State: AOJu0YyAajEEAGtxv+5RccF6GS/p6hqFJTBz4c2Y2qDS6Fq7+hqfF7Rp
	hsRiSz6n9vsXZB77kFGPmhjRjDL1/m/LiDtWb/wie3hdxaWtHguesMBS91o1zSkhWx3yHqCXnLH
	oF4eDs5tCTOcBkJCZx4buQvRLW6nRSGYr9XXoU4E5vyWINfxJum48Y629gW9Cgm2yOoam
X-Gm-Gg: ATEYQzyedrBpUMlOK0g3PvU8wcj2YotJlnrtNIDfOaUGEUoOQ8XdHtVqHhT3DMoiBTl
	eaKs+BpsHfzaGObrZ0USrMwCm35xDQHb67w64e2AnIvdIiUEZCnAsCLE9jpG/e9tPSv39osPsPF
	R1wusYJZ4JoOeam2UQwITf7x7ly+EMxQCiCpKRXAWGD0JVRcT4ioGzezlqp9LLB3/YzJnWDsudg
	DqrpcVzoMCtTkY/70oeqi3t5qllW+yaJNZwoQ2EhcqCBY3sr+//4vjHLQPKdzLpz1Eeob1dneeI
	YXTyW0GWh0vJSvOU3KK1sYHtUAKUS0TbOwY+VX/7+Mzq28rfg0Rrwv/teJwrkKo1ssz1RKDc+Ke
	3kCrY/NFudnASrn+XYmXwWEI+Mcu55/WaaigX5hoEczAt
X-Received: by 2002:a05:620a:40c6:b0:8c6:a809:862a with SMTP id af79cd13be357-8cbc8f15f3fmr2000619085a.45.1772543314628;
        Tue, 03 Mar 2026 05:08:34 -0800 (PST)
X-Received: by 2002:a05:620a:40c6:b0:8c6:a809:862a with SMTP id af79cd13be357-8cbc8f15f3fmr2000612785a.45.1772543314001;
        Tue, 03 Mar 2026 05:08:34 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:08:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:57 +0100
Subject: [PATCH 7/8] drm/msm/dpu: Add support for Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-7-814121dbb2bf@oss.qualcomm.com>
References: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
In-Reply-To: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12769;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mg3cgdFC97FWfUrb9+ShMVDPv7tjEPXw0RKb+29/bTM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0xa5rLRBQacTB+6IoHg8FaEzLuql6ImVE8g
 edZlgnzzfSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdMQAKCRDBN2bmhouD
 10YfD/99GYAUJvcUKWzOY3OEYcMlffUk9rbO/J0UDhvv9T3j0Fj9lET2aFzDZKZkVPLuWmBRAgI
 KVKOmaywvTafrMBkqZ4+5thTMx+H5IMR+qv35eTUBoBlqwPNV9Zia5LOvZsrUSNdMedr1shiZCD
 EQ6I8JjqPIG2Hp6e6n1EVx8jJRpjkePKrVA2zacXtOVzTcZRQDB91RFskIJxmrS9Zk+R+5nRZq3
 LW9EmViX7hyhYJDeepqP5iiWbcP49qY+a5BXxs1LTFYx1bMBv9ANYMZgsMKpeHFxvjTmdZlpjOY
 cd3cxbCmABrZxwyzBPrSxei5KnlqziZ5fI+FwvYK8cxABIsljV6bma64j8FmrJmcYdpF4wfOVkZ
 qyEzZu+J9zL3ldrkXCd573q7G3hKBEu5ELSOcaozUZmPKg4JSgXlpzBldYcnx+7eKT6aHqrNCp6
 gFqcEIjr5AkzMvy3ORdEeCM/LoxI5232NqfbjEc0/LUOI5E4c/r8VIQVtJlBcpmDUpR1Q7diN4L
 KEj+1jDX1d8wrK6coGhDtABht5swOTxltEUGoE2UeDoLdb8OeCq7VlYdNpzAP0CfaF5h+WR/KPd
 aJ/4+lFLzbFIUc4zb7c6/5zHZUdozY8JlIB+czJPdLXO5JFPDRqtavKzeCxtkIKKFBQPdznqo73
 s54f7xu9hmVKoMA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a6dd53 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iownPTfTGqJqHk1l-jUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 0p-T62oY-7LipWPLDwbnM2xIzB7bMAy0
X-Proofpoint-ORIG-GUID: 0p-T62oY-7LipWPLDwbnM2xIzB7bMAy0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfXznnUuQSo27Kg
 lZmdeno8wWshgdBsFr4ZZnyhgIMCTn11vcPnYt9i2LMxI6Wm7uttfKWitgGRMOtxU3/SH2WHIbX
 N7m4iqg4rtlz3rivR/S1E5HlCwNuMzdGiMgvWPKxSWu9Nr2WDpzr7q436+cwz9jyvnCwMMaI+Zc
 DHSEoOdVYAPTxVmlXfwV7EiPrm+1ErDktJt/AgPdcditdOoPuOrI33SddOE3bwQKuXChcJALeY5
 8zt4xl3J+2X68UOpPMs6rNiLQV1Jg4COmZRIovITgWl5NuQ7epupgl6E/2fCsOVhNBHcvo0JIwT
 B43oJuRa9yA+IIPIbfzmhnrH0WZrjXYf7jaPTMqkrp4Hu7Sll4AqLNWl0WeB1GtrsFIkKtVdUXz
 drocJ2IAJ+O9k/AF90CpYQklXVooYNpxX1cXyU8Ouean3joLni0n64Pu9osuA0X2JsS1KHq4G6x
 aX8BL7j1Gs2+BNdm9FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030103
X-Rspamd-Queue-Id: 208CD1EFF51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95141-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for DPU (v12.4) on Qualcomm Eliza SoC, with one
incomplete/skipped part: HDMI interface (INT_4).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 4 files changed, 368 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h
new file mode 100644
index 000000000000..90f6a9a4aae8
--- /dev/null
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h
@@ -0,0 +1,365 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _DPU_12_4_ELIZA_H
+#define _DPU_12_4_ELIZA_H
+
+static const struct dpu_caps eliza_dpu_caps = {
+	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
+	.max_mixer_blendstages = 0xb,
+	.has_src_split = true,
+	.has_dim_layer = true,
+	.has_idle_pc = true,
+	.has_3d_merge = true,
+	.max_linewidth = 8192,
+	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
+};
+
+static const struct dpu_mdp_cfg eliza_mdp = {
+	.name = "top_0",
+	.base = 0, .len = 0x494, // not verified
+	.clk_ctrls = {
+		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
+	},
+};
+
+static const struct dpu_ctl_cfg eliza_ctl[] = {
+	{
+		.name = "ctl_0", .id = CTL_0,
+		.base = 0x15000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
+	}, {
+		.name = "ctl_1", .id = CTL_1,
+		.base = 0x16000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
+	}, {
+		.name = "ctl_2", .id = CTL_2,
+		.base = 0x17000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
+	}, {
+		.name = "ctl_3", .id = CTL_3,
+		.base = 0x18000, .len = 0x1000,
+		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
+	},
+};
+
+static const struct dpu_sspp_cfg eliza_sspp[] = {
+	{
+		.name = "sspp_0", .id = SSPP_VIG0,
+		.base = 0x4000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_4,
+		.xin_id = 0,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_1", .id = SSPP_VIG1,
+		.base = 0x6000, .len = 0x344,
+		.features = VIG_SDM845_MASK_SDMA,
+		.sblk = &dpu_vig_sblk_qseed3_3_4,
+		.xin_id = 4,
+		.type = SSPP_TYPE_VIG,
+	}, {
+		.name = "sspp_8", .id = SSPP_DMA0,
+		.base = 0x24000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 1,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_9", .id = SSPP_DMA1,
+		.base = 0x26000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 5,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_10", .id = SSPP_DMA2,
+		.base = 0x28000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 9,
+		.type = SSPP_TYPE_DMA,
+	}, {
+		.name = "sspp_11", .id = SSPP_DMA3,
+		.base = 0x2a000, .len = 0x344,
+		.features = DMA_SDM845_MASK_SDMA,
+		.sblk = &dpu_dma_sblk,
+		.xin_id = 13,
+		.type = SSPP_TYPE_DMA,
+	},
+};
+
+static const struct dpu_lm_cfg eliza_lm[] = {
+	{
+		.name = "lm_0", .id = LM_0,
+		.base = 0x44000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_1,
+		.pingpong = PINGPONG_0,
+		.dspp = DSPP_0,
+	}, {
+		.name = "lm_1", .id = LM_1,
+		.base = 0x45000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_0,
+		.pingpong = PINGPONG_1,
+		.dspp = DSPP_1,
+	}, {
+		.name = "lm_2", .id = LM_2,
+		.base = 0x46000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_3,
+		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
+	}, {
+		.name = "lm_3", .id = LM_3,
+		.base = 0x47000, .len = 0x400,
+		.features = MIXER_MSM8998_MASK,
+		.sblk = &sm8750_lm_sblk,
+		.lm_pair = LM_2,
+		.pingpong = PINGPONG_3,
+	},
+};
+
+static const struct dpu_dspp_cfg eliza_dspp[] = {
+	{
+		.name = "dspp_0", .id = DSPP_0,
+		.base = 0x54000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_1", .id = DSPP_1,
+		.base = 0x56000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	}, {
+		.name = "dspp_2", .id = DSPP_2,
+		.base = 0x58000, .len = 0x1800,
+		.sblk = &sm8750_dspp_sblk,
+	},
+};
+
+static const struct dpu_pingpong_cfg eliza_pp[] = {
+	{
+		.name = "pingpong_0", .id = PINGPONG_0,
+		.base = 0x69000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
+	}, {
+		.name = "pingpong_1", .id = PINGPONG_1,
+		.base = 0x6a000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_0,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
+	}, {
+		.name = "pingpong_2", .id = PINGPONG_2,
+		.base = 0x6b000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
+	}, {
+		.name = "pingpong_3", .id = PINGPONG_3,
+		.base = 0x6c000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_1,
+		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
+	}, {
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
+		.base = 0x66000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+	}, {
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
+		.base = 0x66400, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_2,
+	}, {
+		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
+		.base = 0x7e000, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+	}, {
+		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
+		.base = 0x7e400, .len = 0,
+		.sblk = &sc7280_pp_sblk,
+		.merge_3d = MERGE_3D_3,
+	},
+};
+
+static const struct dpu_merge_3d_cfg eliza_merge_3d[] = {
+	{
+		.name = "merge_3d_0", .id = MERGE_3D_0,
+		.base = 0x4e000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_1", .id = MERGE_3D_1,
+		.base = 0x4f000, .len = 0x1c,
+	}, {
+		.name = "merge_3d_2", .id = MERGE_3D_2,
+		.base = 0x66700, .len = 0x1c,
+	}, {
+		.name = "merge_3d_3", .id = MERGE_3D_3,
+		.base = 0x7e700, .len = 0x1c,
+	},
+};
+
+/*
+ * NOTE: Each display compression engine (DCE) contains dual hard
+ * slice DSC encoders so both share same base address but with
+ * its own different sub block address.
+ */
+static const struct dpu_dsc_cfg eliza_dsc[] = {
+	{
+		.name = "dce_0_0", .id = DSC_0,
+		.base = 0x80000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	}, {
+		.name = "dce_0_1", .id = DSC_1,
+		.base = 0x80000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_1,
+	}, {
+		.name = "dce_1_0", .id = DSC_2,
+		.base = 0x81000, .len = 0x8,
+		.features = BIT(DPU_DSC_NATIVE_42x_EN),
+		.sblk = &sm8750_dsc_sblk_0,
+	},
+};
+
+static const struct dpu_wb_cfg eliza_wb[] = {
+	{
+		.name = "wb_2", .id = WB_2,
+		.base = 0x65000, .len = 0x2c8,
+		.features = WB_SDM845_MASK,
+		.format_list = wb2_formats_rgb_yuv,
+		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
+		.xin_id = 6,
+		.vbif_idx = VBIF_RT,
+		.maxlinewidth = 4096,
+		.intr_wb_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 4),
+	},
+};
+
+static const struct dpu_cwb_cfg eliza_cwb[] = {
+	{
+		.name = "cwb_0", .id = CWB_0,
+		.base = 0x66200, .len = 0x20,
+	},
+	{
+		.name = "cwb_1", .id = CWB_1,
+		.base = 0x66600, .len = 0x20,
+	},
+	{
+		.name = "cwb_2", .id = CWB_2,
+		.base = 0x7e200, .len = 0x20,
+	},
+	{
+		.name = "cwb_3", .id = CWB_3,
+		.base = 0x7e600, .len = 0x20,
+	},
+};
+
+static const struct dpu_intf_cfg eliza_intf[] = {
+	{
+		.name = "intf_0", .id = INTF_0,
+		.base = 0x34000, .len = 0x4bc,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
+	}, {
+		.name = "intf_1", .id = INTF_1,
+		.base = 0x35000, .len = 0x4bc,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_0,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
+	}, {
+		.name = "intf_2", .id = INTF_2,
+		.base = 0x36000, .len = 0x4bc,
+		.type = INTF_DSI,
+		.controller_id = MSM_DSI_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
+		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
+	}, {
+		.name = "intf_3", .id = INTF_3,
+		.base = 0x37000, .len = 0x4bc,
+		.type = INTF_DP,
+		.controller_id = MSM_DP_CONTROLLER_1,
+		.prog_fetch_lines_worst_case = 24,
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
+	}
+};
+
+static const struct dpu_perf_cfg eliza_perf_data = {
+	.max_bw_low = 6800000,
+	.max_bw_high = 14200000,
+	.min_core_ib = 2500000,
+	.min_llcc_ib = 0,
+	.min_dram_ib = 1600000,
+	.min_prefill_lines = 35,
+	.danger_lut_tbl = {0x3ffff, 0x3ffff, 0x0},
+	.safe_lut_tbl = {0xfe00, 0xfe00, 0xffff},
+	.qos_lut_tbl = {
+		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
+		.entries = sc7180_qos_linear
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
+		.entries = sc7180_qos_macrotile
+		},
+		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
+		.entries = sc7180_qos_nrt
+		},
+		/* TODO: macrotile-qseed is different from macrotile */
+	},
+	.cdp_cfg = {
+		{.rd_enable = 1, .wr_enable = 1},
+		{.rd_enable = 1, .wr_enable = 0}
+	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
+};
+
+static const struct dpu_mdss_version eliza_mdss_ver = {
+	.core_major_ver = 12,
+	.core_minor_ver = 4,
+};
+
+const struct dpu_mdss_cfg dpu_eliza_cfg = {
+	.mdss_ver = &eliza_mdss_ver,
+	.caps = &eliza_dpu_caps,
+	.mdp = &eliza_mdp,
+	.cdm = &dpu_cdm_5_x,
+	.ctl_count = ARRAY_SIZE(eliza_ctl),
+	.ctl = eliza_ctl,
+	.sspp_count = ARRAY_SIZE(eliza_sspp),
+	.sspp = eliza_sspp,
+	.mixer_count = ARRAY_SIZE(eliza_lm),
+	.mixer = eliza_lm,
+	.dspp_count = ARRAY_SIZE(eliza_dspp),
+	.dspp = eliza_dspp,
+	.pingpong_count = ARRAY_SIZE(eliza_pp),
+	.pingpong = eliza_pp,
+	.dsc_count = ARRAY_SIZE(eliza_dsc),
+	.dsc = eliza_dsc,
+	.merge_3d_count = ARRAY_SIZE(eliza_merge_3d),
+	.merge_3d = eliza_merge_3d,
+	.wb_count = ARRAY_SIZE(eliza_wb),
+	.wb = eliza_wb,
+	.cwb_count = ARRAY_SIZE(eliza_cwb),
+	.cwb = sm8650_cwb,
+	.intf_count = ARRAY_SIZE(eliza_intf),
+	.intf = eliza_intf,
+	.vbif_count = ARRAY_SIZE(sm8650_vbif),
+	.vbif = sm8650_vbif,
+	.perf = &eliza_perf_data,
+};
+
+#endif
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c4e1f6b7345d..b096b748707e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -771,4 +771,5 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
 #include "catalog/dpu_10_0_sm8650.h"
 #include "catalog/dpu_12_0_sm8750.h"
 #include "catalog/dpu_12_2_glymur.h"
+#include "catalog/dpu_12_4_eliza.h"
 #include "catalog/dpu_13_0_kaanapali.h"
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 70d5ed4732f2..dedab08ea1d7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -767,6 +767,7 @@ struct dpu_mdss_cfg {
 	const struct dpu_format_extended *vig_formats;
 };
 
+extern const struct dpu_mdss_cfg dpu_eliza_cfg;
 extern const struct dpu_mdss_cfg dpu_glymur_cfg;
 extern const struct dpu_mdss_cfg dpu_kaanapali_cfg;
 extern const struct dpu_mdss_cfg dpu_msm8917_cfg;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 449552513997..4054ed5743af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1507,6 +1507,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
 };
 
 static const struct of_device_id dpu_dt_match[] = {
+	{ .compatible = "qcom,eliza-dpu", .data = &dpu_eliza_cfg, },
 	{ .compatible = "qcom,glymur-dpu", .data = &dpu_glymur_cfg, },
 	{ .compatible = "qcom,kaanapali-dpu", .data = &dpu_kaanapali_cfg, },
 	{ .compatible = "qcom,msm8917-mdp5", .data = &dpu_msm8917_cfg, },

-- 
2.51.0


