Return-Path: <linux-arm-msm+bounces-107099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFlTIxcoA2rP1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:16:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C23E520EEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2089C302EA05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C46E39AD28;
	Tue, 12 May 2026 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vdv1IfKj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QK/yrqn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863973911A6
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591389; cv=none; b=i7vBDUD/ZeiGSsPX5haugMJF2G91MuzPrd7c7N6Kz0nnpnb3dB6mQ6O1D0KbmtMPeXwyGD7ZesilIN+G8OFbu0xAY2wEKN1y5whcLo989+6sc+18FnvCvsAUHPnfxjQZXx5GmYQFkRZVrb0+hMSm1986exLrHfpA27XhR5grz4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591389; c=relaxed/simple;
	bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1NRMGM7uZrwUTO5+6q50OPSGeXbIAndlDhqiRBC3gY3S43LlenJc9osrrRxfiOmCtRmhYo0NOVXPToYfpRJZjjFTgZz4KLXEprW+YYjcD7eApDOFXVeE5/ELASaYGKakHtAEeB38FK6pJMaY6ZrT3Wk5NWKY3klC+uWsBrrV74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vdv1IfKj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QK/yrqn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB32Ev2186404
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=; b=Vdv1IfKjkEG+FIQp
	cqNHkAKasKgqWsC7c7LavDHY+tcDxNoR59s9DcCXJLI49BTBC5OuYkSTCzdBZ4ja
	Jo0INvr452xB9kKxKst20HCZxN3bTbYwbsvgX986MqwFIBI69wUMhcikvnhsFlMo
	4xwnJ2gKM7fAPPNirYOOs5OcN56CjhKov7peX/0KDKRalOeezsi55fVGaSLdW3D+
	tbxjNLKN3CxPvZtgmAx/s9dTePsnlXEYoO+gYIObIRddhMHHlEV7l499PHjt+f1+
	gehQYnpdBCHTNG4w5WGCpt1hhsUrlffNla1O6W7CzAzN8cug9NqjvhUZmmP4snJQ
	JDCThg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0ub25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:46 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6961bdde2a1so11235748eaf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591386; x=1779196186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=QK/yrqn2W1K2pMxjSHlN0IFEqXUbJ2FFIkXZ9t8xtyv0zfxrxx2vMygSsbScsb2hSr
         ysyVL5I7I5/zor5NE3PPm+rJ+vXtDv3cuYkSDWbuIzxNxek4OlisaXXWBh4HtKQvXULL
         GGNljyWvNvNS6qUwDJnxrG3jDXkjr+e/8TBnq0bmD9VL5LJt/IhQPLTjUEkAfozsIKSj
         3ln+OCHEmogyA8k6adnndv9zBUltcMghP5xf01B5PiGYGGDV9LltOZQIoWB8TdTP1chF
         DH7oOzkjLlrC2EfjIveLCUn7Oesx4RLwekROxEX3r94y2aRHRPiXFyk/PXGe1KlYYs86
         TSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591386; x=1779196186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=khQXf2QmPJPS6U1LINJFjANgUjvY0G6V+26gokibeA8=;
        b=G4/6MzkCJi/m0dQS+mDE5QYKh0Xx70TF7hYy8KKMlh90NBIRmFvtO9m3mvO5flj5zv
         J/rm8tVT278iFhUz0+/PDITJPtl2//ahFNRAzPkWEqfWbjW4N5emAhvKf3XLzlCTNQBy
         OWIWG+LtsV1yNqeT/sew2Z7sjD67CIsc+A6ggJZ+djLB/9D6M9OW4N55NmQGmdcoRpSD
         33Wf0g7F3oN9PG2e9P6P+MiN9H7TfbnX/RWn6e297RSGnrF20gC6OgM1lcPwndmV34+5
         82TAzz7L/Pexb7ng6n0FqRyHKahokIkydJrMLKb4VVDOIlKN000kyLGFM0E/mEX3Y5OP
         OaMA==
X-Forwarded-Encrypted: i=1; AFNElJ8jvb8nvvWszj9jWtvFTdHahB9QKL6xYDD1sXjAFO1tQAiYIZvZCpI/vBuQMumJXUY0KraCVKqhHaFYiyhj@vger.kernel.org
X-Gm-Message-State: AOJu0Yym9vkJLkakhm8Oaw9HHBN3uToDQ0+AiBxELZKuOPwZlBrW7DJQ
	yJmX/sbqRb0PwZJGBevyHP4k1sHUuN0f4ry5nr1iMuEBYU1llrYsCt0WKWO11YtU9TSevkCMdw5
	T6tp909+bXG+/U8/C+eAQRUu36EAc0btmYLTiYnPqYyCDWZO8GBfejEVbJKVgjHDYrReu
X-Gm-Gg: Acq92OFiz8SwgLOzpqCAM//FFgn+c2QjHbnV7/OMJfq6dMi1Cs2VAv/3gHlz8KHFKdA
	stGSm0SRzhDM2KDxziYpRQJx2wb8FZdDSiPFOseTEHypEMbDVRkyIM+KSf18iKHZ5yUo5gTgah2
	8uB+fepUObtLR/Ue1bZg9jCWLfY+lhASuUdMmGfSR2jPlbkilplW0WMFogC80KCUrtypoTO1Xwm
	MyJMMqdR6WU88Hkucnzdqed8xhBxkKbaqgt8OzSX1kNEy/MrbamcisKrN7xS2845+qvEkKN6VnP
	0lzvtT4uDHDU/4AvnaF+Z9kaEwDfXkpTYnMz1qc1EKwS1xUzTdo+11OCR/Y63UjbQu0lWkWYdNQ
	qgCtvnyXa9tkAKgIWHTF+/nDonBd6wBKk7t/U3L6jVS5iT94mPOM7Txvg83r3p00kFc1imsgiQj
	BqG/oLp2G6YXQcgTOhObM8GZX/WXFIJ3FvU3M=
X-Received: by 2002:a05:6820:83dc:10b0:69b:3a3c:1e4c with SMTP id 006d021491bc7-69b3a3c25b7mr5107806eaf.50.1778591386016;
        Tue, 12 May 2026 06:09:46 -0700 (PDT)
X-Received: by 2002:a05:6820:83dc:10b0:69b:3a3c:1e4c with SMTP id 006d021491bc7-69b3a3c25b7mr5107770eaf.50.1778591385529;
        Tue, 12 May 2026 06:09:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:30 +0300
Subject: [PATCH v5 2/6] arm64: dts: qcom: sc8280xp: sort reserved memory
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-2-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
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
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=aebLYbRcchyj2DpGs2D0Vi4WsjillqsL9nVCS+SsX7c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaTAmMYVOLPcjInsey+YNrJPpS5uKJ2xSGTY
 xanEcUSiwGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmkwAKCRCLPIo+Aiko
 1e59B/4v1AQ7YHmgmfDoc8ZtQAXk9r4mQAIyXqtLShCQt+UYyZR1d1MxfAWo4B+gAgl5CtDnL4F
 8G44Cc2Ot+vSsl1FZN0g6yXPkYwVzWqY4Y16PWnHp5lu6zMO8eajqGEBkL24m74we8BcTR/F2G/
 yintbmsKgFSEnWFEmT454xQLRNzliF0vouvLGIPvUSSlO/5YAyiUNorg0MCZf2BmcEWhFvkQ/5R
 kiZ9J+BiVG3SQwUypfa+9ut0/CSfcunyKBwgIc9p+/lBpqjMaB9TB8QZqbzSxB5jduYJ15/qfkw
 Ya237XQbSTiMUDrFMuwJ2Bza1YUenKRf+nVUAjQPeiAgiQUY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX1v6eVzSvEVSR
 tHVKZDj4uLS7brtBl0BWsz0y4g4F3SBXs16yEsJM69zUvqe3W4oICac7sWe0EcVbZP7MoOuKjC4
 q40OrMsjHc1/WbEabQ/Jb/eBcx//keVdmO3nIgIo/Rx6Svzj8bNK9JpDzPoMHtSVEnrH2iCahQ0
 adiDaBAdreQk3HZIzvKP2hGnU5NPDuERFKvfUutNgrHEb62qfrKrw2kWPyPVABmWgxRDLVWsXSF
 EFZxYFTEXCjbWChpqXS50Z3ksCn6kJeJbpkQRPxewViYhe/YUNR08lFeOZ4ZB2boX3vRmi1MtId
 pQa3arPhZjN4jz5IlnjcrsKCmZyihFBWRUtKuNF/YJfIfWc5xSJY137IMCwS9JXJpe2YzU7l1J0
 muD+nriAfuk1U4ZmzRojSEq0bSEp9A219nb+mgvLTkD7vlGydl5AlKD9REDQRoLH3plwXqczJ5b
 RsNnSvCzlQWogKFaXjw==
X-Authority-Analysis: v=2.4 cv=bpB8wkai c=1 sm=1 tr=0 ts=6a03269a cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=dWPP9-k4-ZVWm8qm6WgA:9 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: wFEMIdDjsRBtcQqq9Hi6G6Wr3XQzMXwC
X-Proofpoint-ORIG-GUID: wFEMIdDjsRBtcQqq9Hi6G6Wr3XQzMXwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136
X-Rspamd-Queue-Id: 4C23E520EEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107099-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,8bf00000:email,8c600000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move memory region reserved for the GPU to its proper place in DT.

Fixes: 6e9612ced0c9 ("arm64: dts: qcom: sc8280xp: create common zap-shader node")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 761f229e8f47..b09bc6f3b518 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -692,11 +692,6 @@ reserved-region@85b00000 {
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
@@ -712,6 +707,11 @@ pil_nsp0_mem: cdsp0-region@8a100000 {
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


