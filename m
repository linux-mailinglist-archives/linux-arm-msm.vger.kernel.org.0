Return-Path: <linux-arm-msm+bounces-101542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFYxFWxZzmkxnAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:56:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C85388A5F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95DA830F0AF8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8004E3DFC73;
	Thu,  2 Apr 2026 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mImhmY1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mwb/nQY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E9D362128
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 11:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130355; cv=none; b=Rc1AVeQUiHkLsqptWyrNKKoMBelQrtKmyYn9gpfyA4r10XIUc4ViWKUrd7M1tweCZLmECPgFcI3k8jRWjcnLqAjwGzSDjxS8sbVhfAEgQzeLFV40Drm40NYmUQzcntGx4ccoBPLbopGeA3E/lap+uN5431C/tkEPw4GUu9gKtm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130355; c=relaxed/simple;
	bh=Hl0zlaD4IFKg1NjUgP4F3RZL1deVCm5fZzxtJLP6NuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STeR4hYTUzy7BzED48X8YLoyDCxomhY841ssAbR6tP+oD/HQ7a6bu/5T3WGQGZE528iejVapvWGI5zH5bKrxNHkzthVP4aDNTeS7dqo5piS0mVVDgmYT8X9o4NA2AmqjPHXTmh6EH629TDjwEKrjcXSxsAvNzfFmQB0rXXVtKEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mImhmY1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mwb/nQY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6328d6Ax1249320
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 11:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=; b=mImhmY1oGBZrt2qH
	75fX8kZbnzFijwj28wOG6UCTJtUm6EjdA5qZlFJVnL5mjJIdQQsLOySZrpPjuSD8
	d4IsngSjeNL0JXg6Rk7lcm4jBZtM1BQ+PjKAYJZJ8mrsXjE8+BlERaxwiHUeBMFe
	Uo4J/lW4+//e9j35G81rTfQr2pjAqADmiM9Ea867OZpI/nGDv5f+3Qj5YZt74RSr
	4VZgyFYFGTx6Qt2FxlRJjwg+FdOqbiAk6fUPNdi9P8HHrwftwjUQN37r6mKwUL3e
	YzCHG89Fc2S7mMXsGDek1dL6GPttBL+rDVOjUoid2o3I8gZxXG3/Bq/K6QckO59s
	Q6cyyg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9n4t0r16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 11:45:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b44f7b7bbso22439181cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130341; x=1775735141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=;
        b=Mwb/nQY116tBruLvJsWVbrp1z4MP150gdAv0WAVQxAa2qww8pmWOYnurVD4vAiEznB
         GzKF/24hPwMM0FEdJs3a/t4YQ3azib4ZCWWeRMXKYc3EFPnG/glGD7yDpnHpALYbZVnu
         bx49mTd5yhBwZJyqDWjqpoZBqDfOWWOURDxDQlUsLBFGnf+IyH1CAAhEt27Ym9ZXHKC7
         6vjzLRztICv1V1+zAS2bw/vsJRyWSGJy+K1uHS1vH3UHdf0+c6EZbH3NNtd8N32l9kJX
         kGGxpL3eHs1NxnEHDPRmU+gDB580AkOtYhEq/xh81Jdx/Lo3nKJm2ArB7L7wJEPdbuqy
         Fprg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130341; x=1775735141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52oscFDjem1+c6zc6REhqJiMklNGT0dva2yqjZoyFxs=;
        b=YCbBZtUi0dxgnclPx8JI1qfLYvO1MUj2OtF+/ILvGmkayVttDquTb/SwqZQz+PtO7P
         WvKO1azwt/9nACCatWFKPCLfarEQ8SGZM1RDi/xAVC/xrJ5z6XqOrZjHwJS2UqLHyRf3
         arkYgSGL9KBWYHir6UESC/aUBaF0EVex7pGBwktR/e4tJE++NngEpJDHnJCipjE9ym1W
         paY2xeb7kj8iJnco4wyz20y6OzE5H0iW0A9DR3ec22o346118qOsYrF9fhe0YEnhsX3x
         XtwguvelZcn8AbWaMs4S5bF4J+1MZ4ndray0MgtazD+S9lG8YFiCba3sXuzfXWHFqe9N
         c+ow==
X-Gm-Message-State: AOJu0YxkSEkSK2RPLr2HyVxmWq+8JBAnfsivLUtNUfB5yQEQhKudhXmq
	XshwfiWGPJ/ldC+mkkL9pNfJ3RN78hKWROm/yfciXa9KkKVgnjhHJT7H7wFz8ID9syqNsKJJ+RS
	qRruqoIEkDnmmC4jLd08ctw5FttfxdbyApqhkKswBtAY46SnNTYb6pYon0rkNoKcNJ7gf
X-Gm-Gg: ATEYQzztn35LL+VNXcJxhXL7NLeAs4/NZgk1LXmWCynwNjAJtlb5REOhr67UqRsCrEf
	s5ZabtCj11rNMdSKRJ9PkPr3wdosH1yEZKClI1Ki2GVq6FN50cKrmNsVeyZmjawWp7/nMVStvvC
	YqSqNFgvg3ZAcijaJTSnIL+Fw9yMkaDZ5BdmAhUtScuTj7aQaUZq70XB66COecu5wGeIo1la+2b
	/kqMbMl9E8ZP3RiKQCwub+q6nMtfChGImtlvBo4/3GnldFwEG+FQ44P2dTD1NW87fR1mw3UtXm1
	CWb1hk2EGWf7p/mt2xoqY3kg3dbEf3gVj9GEOUbkmjp7GemwdyinTxxJrvdaEdzAyVjIM9rpwC5
	P3ftN7X47WUOtdGwKzPL8iUsQQuVh/wJ4FZB280VS0QTc
X-Received: by 2002:a05:622a:342:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50d3bca319dmr93913991cf.31.1775130340839;
        Thu, 02 Apr 2026 04:45:40 -0700 (PDT)
X-Received: by 2002:a05:622a:342:b0:50b:4ccf:135e with SMTP id d75a77b69052e-50d3bca319dmr93913691cf.31.1775130340436;
        Thu, 02 Apr 2026 04:45:40 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:18 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: sm8750: Correct DPU VBIF address
 space size
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-7-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=845;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hl0zlaD4IFKg1NjUgP4F3RZL1deVCm5fZzxtJLP6NuI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbRKzvDDtL47/CaCW54CxrNWexS9GahJTKi2
 iaw89qsyy6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5W0QAKCRDBN2bmhouD
 1/12D/9lyqCjDlTWt2wGfOBuaN4F+vLvaKdGUDuVV78ws1k9JCci/g5hVhpK8FZ3FlRRBgypg7b
 thYKSd7SoG1B3GXAQyC3uCBG1yj9t9cY7tl3o8lLFOUdtXbuhZkl9KTqdzL0U5BepmmPD6l0cBG
 ge9Wz/kZ1Fbzwlv0OIaXLmBeq3ZzpYooFYzfxBxOkHjpRDvR46bPDcPbla/GW0og9UNurohTNRz
 1DyvFCD3OzQkkq/46es5Cnks2DOBA+GcRqlhjchrA/mT+jyQVtb+dVDqdJqtIES8W4m0HSWYPug
 ac/wKFUCONieXfzrSkgilXvqToKaYWjU6q2pFPxYCYnni2I/1rmGpxTuu8vIWM7L3ehFv+B7Bfc
 zT3dfwFb0MH8Mvv26KYnibHXcocPLwDIm5hQ9jYH7SCAOhWlJBs/3S8XC7R0yI8bYAEEVBGKZJK
 bVuEZacc3owj4gJ9NP3PMMt+YLD1pjV4DSBr7cw8Yedn9LVWPoojdodqWqdHBVNYsava7bBrYYu
 a2vpGtV32UY12xOwdXFfTNDiEhEVyplRz09O2PABk6DQ2BdjgsOwqXlpo5zWd+XyDlBslpJbRUE
 102hsPJZa/zxOv1scEAZnxiYFxjZyYo9Ioi1vugoKMEv7UgviVZSKTHMIlrHSM0x57ruCmFrfLo
 W9Mka7rzRqw+qRQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: SAw36weS43RBeOFIiGKIFOpdI229-4dV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfXwczq8glgPBXl
 dhKpLUyIAd0ebHsqrK3ye0kZqrs0IP+U6tEUMKUGlxH6lj8kpowTXzRatJtzTpoo9f0sVoWkeIE
 dagY8jMu/IzgtvHrOR0u8ZIQp2ozaGd6kfqwPhoZWsOkYi86jZhKIVx2oCwk5FbNv9Q0UmmosGZ
 uo6iwyiYO7GEgpem9pRGQhNaFiGLtzmZ/q8qbr8XGfmrBRRdEqQoz95G2y6bmLJKTxrxG/hTTcQ
 KuR+NQ74sdkskgygN4vxUy/1GJFZNrFrR5fJhhT7MjCcdZO58w+/lIJnHOxzz48/9p/pALY1zAE
 ZTLyB4dDdnIisPSY2iCG1lZL/UElROmA6WabxirNLldK0B+uGJG2KzwouZoewqdjSa47B9Z0u30
 09/u3iHTxuzGhmoMQ32dWvB2Drg4Pb7Uv6q7H8/DFp6y06aVQyzGtDUdsQurd4XICr4IrKaWkfw
 wgqlQxj6qfzewcA2edA==
X-Proofpoint-GUID: SAw36weS43RBeOFIiGKIFOpdI229-4dV
X-Authority-Analysis: v=2.4 cv=Ap/jHe9P c=1 sm=1 tr=0 ts=69ce56e5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=WYllmNudUJmrw8VR-PoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101542-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ae01000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C6C85388A5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VBIF register range is 0x3000 long, so correct the code even though
missing part seems without practical impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index aefe517e0669..f4b8703ef856 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3041,7 +3041,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8750-dpu";
 				reg = <0x0 0x0ae01000 0x0 0x93000>,
-				      <0x0 0x0aeb0000 0x0 0x2008>;
+				      <0x0 0x0aeb0000 0x0 0x3000>;
 				reg-names = "mdp",
 					    "vbif";
 

-- 
2.51.0


