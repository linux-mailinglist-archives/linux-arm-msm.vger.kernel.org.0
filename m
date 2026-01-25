Return-Path: <linux-arm-msm+bounces-90445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IiBDU4ZdmnXLgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:23:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 766CD80AE5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E3153038ADC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460A0191F84;
	Sun, 25 Jan 2026 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1jHMo/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UAVkMTUD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C9431ED75
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347234; cv=none; b=gKC++4lUZ4zonResr/vpEziQygz88ENogxckfx+z8BKT37Oo55XqNYjxqBtfOqzRhM2oBSd8RqI2I3PPSrN3FAE3+2/GnegJF2jmLP03A4p+E8ePoxfKLXFEpSoIQEFeXjL58KYmHXudAq7Wy5e3cBg0C7Chb3Bz5PsjPwU86Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347234; c=relaxed/simple;
	bh=PJiHYLnSEuffYvSKM8ePxKvMNbsPyKyLyejgTYc0tWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JK3oP9pejfV4zdBXmVZd3Rk4D46xj6/Kep+NCFyuwcqA6FLZyu6RD12J0b5AtXCPYiCutsRoYBLLBzb3QRfgk5Hh+iVqDm5rJhLpCk9ch04DrDTRFGLpyWF4KTUReq+UbdKEGMhg12ploUDRTiSk0Fic2qptF0piHSAmT7NHBEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1jHMo/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UAVkMTUD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60P3EkfC2512566
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=; b=a1jHMo/7sKixqGHO
	tk1KvDC8+616v6+IwrG/wXG1HIeGEnLSPY4hRWMD7bhgRIgX7fHRGk0Ftwtg//aB
	ETHmuIOYFJ+RLAD1jPjW6lwsKiQanyLUwpGU+/Jz6qeXtnKbVOi7KIRVSz/Ie1+A
	plEzkRvSWB5kNlMjrYhzUTwlAjrh5XxkT6H+r88q4y6wjKBV28eer3X4JuxzQQfJ
	zdbgXRaHcFmdsJHN9OAflyC00WMx/REsq+tLrVx3VGxW0T6/cxnGVtHalghYhJhQ
	XSrmb4eapiZoMGxDws2k+uuKbHRToI40m9nRAdvVB8RPJVNL0ovcNIc05iXvEtuQ
	I01S4w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6ut5h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:20:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2ea47fa5so105840126d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 05:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769347229; x=1769952029; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=;
        b=UAVkMTUDdoz7Ql4vtGOJC1uoQcKZK5wmh+0uEbNtFrncJk90fZiai3WGOm4fiYfQpq
         YWvsx4ROn6V2EWoESY1XLJJ3YNorrjmcVl+EdKtrLTb2Qt5GKyJf3GmJmqJ/IIWvE94Z
         Brx3d5AUKeBbxZybGchyKZ2iF/esfaba0pDw+b0CnilGVOBwlDS+seE4fP2sPK7jBwRH
         BkUcGZYN80M9UZXp8Y6pyAPBJIUvkh/Nn56D1UyLDNbrX0Xc9d8XaJB/FcIe07FDrpNu
         BI6l29tJGYEEXJDUuYUnawxKW7wnGBS9PbyfdGARe243zP1AwjtBwQilLP5jik/+7Iq9
         IhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347229; x=1769952029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMnZgFstSfhXFxxtUsEMfbmsL8APUsp+8DEipnzhrtQ=;
        b=MEL1pAMJsKrSaR5NT8Hx/qULW+M42rUTldXTRHrAHyWTzL0lpLiBGG52yl9ChuXeNz
         C7UKklou9WVryFL/Q5yItLnOR3WwuJdUO5NNqqcTco+u48/A9mkQ5twexsNAyIG+xl4j
         lOOvYVX+NiaiYfUKe1yW/mEN2EGCSkY4MT/4fYAdtUex1KGgQwX9c4UoII8966ZYkdir
         21PIICdJcI+BMQbt2jT2MGCCJsBFysV1DgeuMvxWfwcbCdgKxEyREFiMSW/hrSe8s3Oz
         o+usCmXYikSsxVRm3fN+3WLM89H6Inx1mLdtF6RM8e2fzBXiDmUWqu3cFJwC31nWSN+U
         lduQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzYzzH9lYVE5pjV0iRrCoBZsjOTAnGk243q4eFUo3gfK/ar1/tbhNPwKRQyorr+sFd4ijJHADc7HVYVGUa@vger.kernel.org
X-Gm-Message-State: AOJu0YymI84b5qT8oNCYtchAsATaDWOwpTGynsbv0YpIxDgrylEnOWcG
	i2P9X8Nxki8dhtk/eH5djfL2UaIPWxVeJbgZ1RgjFcS3WXebHCpkQKv7R6NkMnaVyRTvN0BAqoX
	saOfLRR1lwe1wp+g6aWTMz/UTuPPxR7NY34BVb738VxoFweGHBo7TH/vx4OmoeJ/5Z+CT
X-Gm-Gg: AZuq6aJcU4FDCUHshgjIUpuDaoMj9MGM0/WLedrfi8zawmSjSDvKyB/W12VOhQRJa1C
	fkVod5CqsAbDLDcwOzsqOiy4pqtlPBWjlh14j3e9W+5/WO6vFDLpvT0IptGB8m5UkIDN7HjdGxF
	ShDsZbN1GzYl1FGdIDPIna7cKR4ewzMtbVn02jSdSJ9z4SFxY57klJubiffyW0/jPoAiLtVG2px
	T8mrMmDtyN6E6dVhGLiUXcgiz+oFUqPOTSS5WFa8S+6RoD8tmK1L5GAVaO8SL8f9QV5vY+plwFP
	qkVk0z7WZFNriiQqGTxQKJNyRNcMp2ZhBLT6+nKprPGCaOdKqtI5+d+V8bqlft7ihn19Qv4etbk
	fQjEZVARjYbLCgGvLZ0i88Oa8BV/jYS8gjKD39+MRsquWSs4fTecFXGQ+1J7ofX0W9L8VIn2UJX
	Fbon0/v/zlk9parfztsPRaFVs=
X-Received: by 2002:ad4:5ba5:0:b0:894:22f1:88d0 with SMTP id 6a1803df08f44-894b042218amr17662366d6.16.1769347228629;
        Sun, 25 Jan 2026 05:20:28 -0800 (PST)
X-Received: by 2002:ad4:5ba5:0:b0:894:22f1:88d0 with SMTP id 6a1803df08f44-894b042218amr17662036d6.16.1769347228180;
        Sun, 25 Jan 2026 05:20:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1706b5sm18901821fa.24.2026.01.25.05.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 05:20:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 15:20:20 +0200
Subject: [PATCH 3/7] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v1-3-2c5e69fae76b@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v1-0-2c5e69fae76b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJiHYLnSEuffYvSKM8ePxKvMNbsPyKyLyejgTYc0tWs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2aZxGQ71SuHFGpLhUqMGO8zWstLzV+VuTkgY1GO9Wvlr
 e9/Js7pZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEchPZ/4otcNof+96lVO6q
 wPeyffbqZctet0THuNRbSq2qLNjFdvhR7tcsEWUXDqP4U3pyNy67Sk99HVv6cGuxqPCk0uiyP5y
 r5rOs7q3Kq9HKSCr6YTXDt0FAyMzybf8apqI0uwKblYoiLCryPGsT1piEb/x44oN32TYV3uvnrx
 o8a7GwY5zscdXlZpGZSP9lvbDHP6eflzYrv2g4UbHqbPvNZSGzzz5fXLrn2fnfAd/V58tKvtAPM
 nm2xi7mYt6MXS5+r65ftdPaJll19r3ha8+JbQHRa9VK+GavZQ6aFV3h9CQmhFc+43tH239nY6Z2
 sdpQvYmpU1Nnv1wqpHPTu36zkOTxhPUnplvd44y9LFYMAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDExMSBTYWx0ZWRfXz3Eww2TMsWT0
 dttMtFZNsOXTcZ1D936vJggsF8Pl4jXIDnLgqR9vwHRQMwsxRakIR8pL8bBSdMazprtzu4rNoO0
 pUFlZ/bgosZ+yJlen9QAsUxjByBgx2tCKlXyo27UJc1wHS25BNu0hYMn4xNL10zXBx5XZdnH7P4
 dN2dFXyyLIY6hU3bsoosLMQxfw4MY1xbeg7QFy07lzBJxcaQkz8h0G2YsxiiAF9NXcplGdiMkHs
 QbM3CLRAHV/0QUsYV9o9lK6J1l6U0a4YEsEsT1sd9alsywaVVzzZgrEn8KzVIvmM3+2YkxlASDH
 dJInB7FsNPYFEThhRCso7aRZdb4AlltdK3AduwKg8yqw23DmBeEpmZ+JGIg2jYmOgbVVvxJu9l4
 7IsOJSsZz5CxyjWFI79Y8rCLF6nt5RImjevL4qrGGKIbyeKWvgrAOjilyeY/pTtuysukFNeJF/6
 d6OyGhbTwfhL5yWOeTA==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=6976189d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: oZjp2LHxhilqgTOOoAZYa0iYrBu3M6E8
X-Proofpoint-GUID: oZjp2LHxhilqgTOOoAZYa0iYrBu3M6E8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601250111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-90445-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[8a100000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,8bf00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 766CD80AE5
X-Rspamd-Action: no action

Move memory region reserved for the GPU to its proper place in DT.

Fixes: 6e9612ced0c9 ("arm64: dts: qcom: sc8280xp: create common zap-shader node")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 706eb1309d3f..41c57e7dc433 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -691,11 +691,6 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
-		pil_gpu_mem: gpu-mem@8bf00000 {
-			reg = <0 0x8bf00000 0 0x2000>;
-			no-map;
-		};
-
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -711,6 +706,11 @@ pil_nsp0_mem: cdsp0-region@8a100000 {
 			no-map;
 		};
 
+		pil_gpu_mem: gpu-mem@8bf00000 {
+			reg = <0 0x8bf00000 0 0x2000>;
+			no-map;
+		};
+
 		pil_nsp1_mem: cdsp1-region@8c600000 {
 			reg = <0 0x8c600000 0 0x1e00000>;
 			no-map;

-- 
2.47.3


