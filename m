Return-Path: <linux-arm-msm+bounces-106577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLavEA52/WmyegAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 07:35:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA1E4F1F52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 07:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD8E03054333
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 05:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D8E340298;
	Fri,  8 May 2026 05:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P3+cDglE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lq6XsRei"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C3233E348
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 05:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778218474; cv=none; b=cR3yux0KzmpaTKsITbzgiu/evX/JsR9RR6Dx3ZVfMzTKOkz6bFSlZssaO2ImL5H/KFWcK+GvwCWFsVROxAnNcc+rK7gP1pol7lt/m3Jbxhgn2r2MfAT5CQCsK6S737KVL9bVVs0/MHAIky82iRVhxGxTfp3h80aF4yXgHpJEZ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778218474; c=relaxed/simple;
	bh=P6UKMocR4t2966bw0ZQAEL6z9/tgVpl1rC/81XwUpSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NqverMACqbJZPEd3DGSt/Uz8uuiAFTsZ1eBpg39XD+UYrqbAPcYQ4a+jm/co7Xgw52lO2VChNZFcGgDCnCN9GIDox21nbbTboKqTsaT0AOISnidDcqGqn+/f1FM5H7+k0tabxE3fN9l52uLzH3pI1mEH7thQ7MaVsv7Y0xWZcG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P3+cDglE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lq6XsRei; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64845Lwl2734203
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 05:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DCE3dWBeUPsD5YNH+fQ7E0WRz+CC11CQijcVgeFRO9w=; b=P3+cDglE1cLPdPxC
	aILUJm0vSmlx/Q+QL2WxR14v1pDHcUyCfZTSkm1+UH1jGrK4WRla5D9cwxiGResk
	saDqgob8xs0P3ly6zPuPNxev1gPDDBpa/sF5IdL0/4/hesaEWWnHaQ6tKpI8F/8Y
	V1XFlacX9REXxh6SouWvGbKr6YUx2g6eppIS6/z0G3KURfDpFbJKBiaZsvSsTiLA
	GURsmOnRzrldFrgEK4HdHP2PaCFgyxOImsnENDsgG/ZTcjI9H+W4K3XCfkqu6+kA
	SpsAU4l1GGT+InM4HXfVLMQspbvMWkGj3jk+QQyseKbl34lwBJxFm0bDE+nO9LhO
	4GRgDA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbquh7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:34:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f525565b33so2182060eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 22:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778218472; x=1778823272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCE3dWBeUPsD5YNH+fQ7E0WRz+CC11CQijcVgeFRO9w=;
        b=Lq6XsReiIzLZDtYK11EtLqzivTIdg6xXhY/Xsfb9wtvv4IGEHKOnkX8RVv9GIBNONr
         Gt7t01EU7df76yFT0DN5cc9vpV9z+OWq4yybDEq9NhwNBO9ghSlys9hXNLTY6DTZsDbX
         FEO4XwXCa+CUvjdissaSBtGBPfLHkCsUMLADfdgdfWM2DfUzB7s2h/KrQgmpuI2FO/Z1
         kNwdHH1Y9tvJObE7pKFl5oAfMVDmx04sB2B68TPuuaaYVAciPlbtLpkqT09Lp/U0ZIAD
         O4LjQ9L+NZ7hvJpJVdI6RV8RhO6UL1Z0YoMbefY3FtgKxQx9c6IQg0t64PYJiynk3U1F
         /j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778218472; x=1778823272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DCE3dWBeUPsD5YNH+fQ7E0WRz+CC11CQijcVgeFRO9w=;
        b=ema933IvjV17i/TIYwFwiEifTye88kc3K5EDxqFdIlPS+XEOLZTk+izOCqw86NBsjS
         t/RAoSKxY5PpdGaaiPTQTNzOpEeweZAiOzbP2gW+8RPIHe010ocQXtmaiBSAXB36NyWJ
         /e/FEKOL9a8eqalQZFKeWnojuvxyYdQMyvO35dNIei0WWUzYOc+27D9U2sExTvtjqtAG
         hZVR84p8zIqvWh4ZRsDrpEqvbcRzXOBLR13ghozfP82IwxOEUN6pLFROymjMvMUJiLUv
         UijJGE84r+0768QJkCYjCnJhbko7R0IKN+FpvG+rMFxwiyXLradw7wuxM/c+czM+li2c
         xyzA==
X-Gm-Message-State: AOJu0YwutU98VnEPenoy2hswENK3uyNyipBJJYOvPgFZlnmj96D5O5Vv
	xTrnjbCgfNrYT8FARc4oV3fL9v1NgahreOhqJvcWBVZjxccADfDOamDrJfEACCzHHdsfHvRjcu+
	AqTx7jSxo6fRROUFGmXYlrJaqs4waluDylF/lLluJ4agOojAUNQLfk5g3vTVhcJPoRPMs
X-Gm-Gg: Acq92OEEWXvqf8vO5U4bt0BNspbRsouZHmU942eG3dswqAUcDEkriy3OnPZjvRT4U9o
	vijoqNza7aN7aOqLkbFKVnBPxUzazCyuipnc2K7JVWlMsX/vf7n8uTS5h7UQahiDtZMlAmcUFCX
	nU4ivBmLAnzABUG8T5JQKJ8s9l7zTVXHr3+QyL9W+mEnTg7+9GuxShvidOTsS038ucV7qkAExnb
	p1Twa8k3e870Fe8HkRvmKNANgi5z/T8K/c8068iFKuKTW5oB38VvudDf3iqvnK6OvXZNELtvbom
	BWMcr+cQ7qvv8ShNzHzeMD2pZQK0YLCIwsZS6XNAFK8fKWEnoCjKC9vOSE6wAz14y63JSnS0jyu
	xvaOloGGpI+wBvHTkCR3EfVT0IyLr+SuQurcEk2DZsD7gxQUo+zFFuJjwLa8/HvZwN9i8N/GZhQ
	==
X-Received: by 2002:a05:7300:2322:b0:2ef:2878:7ad0 with SMTP id 5a478bee46e88-2f55094d023mr4559536eec.27.1778218471657;
        Thu, 07 May 2026 22:34:31 -0700 (PDT)
X-Received: by 2002:a05:7300:2322:b0:2ef:2878:7ad0 with SMTP id 5a478bee46e88-2f55094d023mr4559514eec.27.1778218471025;
        Thu, 07 May 2026 22:34:31 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm847475eec.22.2026.05.07.22.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:34:30 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:34:08 -0700
Subject: [PATCH 2/3] pinctrl: qcom: spmi-gpio: Add PM8010 GPIO support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-pm8010_gpio-v1-2-3bce9da8d2ba@oss.qualcomm.com>
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
In-Reply-To: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        David Collins <david.collins@oss.qualcomm.com>,
        kamal.wadhwa@oss.qualcomm.com, kernel@oss.qualcomm.com,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778218467; l=973;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=P6UKMocR4t2966bw0ZQAEL6z9/tgVpl1rC/81XwUpSw=;
 b=G3/fA+HD/IA51S19vxnOlH4vhhwKZO7RMqYQ9I/QJykTFRdFTxaVD84WgFv2geMd/TUmiPYOk
 CTYRhzf6WuCA1ATUirC/pO79b+nQA5aOwYOJh1mSl5NqxtS1FTxTU+G
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: nG3lOfo80y11AepiBKuTZHikJFwHcBEb
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fd75e8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cw7ao898H97UX0_F1yYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: nG3lOfo80y11AepiBKuTZHikJFwHcBEb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA1MiBTYWx0ZWRfX04c+SM8268wG
 DnPlo4G4mt/1vOCEe9OvoVWlK2FOdaMKzd7AKLvQ2O9vhdAUANqlNaQsnwm/UIxN37JNpADvYkz
 EE8wgDpeaU8dSb/MxKgoGSifQ1QAPsrhx7GYvpCpDuNUAGHQSiiZdjNaXDF9NgJA6zb/Uv9Esn3
 Cd6KQ8Fz+/vcTfcTq1WJKYrfdzCA/AoStosDsn34CAxKlaEE/U7v9fGoO8hwbI0zcfoZ4u15Mqc
 +fPZzfwTS36s+rqBGmJdRJElULsezZ4ta8kR0LyJqWjT6/gF6/XELDLj1xR++vBaPstMzzVnG0t
 Gl3Ed+OGIDtbaMAAV5nIb/vfVXAE0Q+HUw0WUkiyBWVn3CojxeEVSoUrVygrsHqspCAbSBL1FVP
 /JTyzFWjgdBPkYk3I2L5cqN64ijke7idPiHHTUrtEd92ty2wl1d9+MzY5RJue+202KHj9ylGAEK
 14UdjmKzFV8lP6JINUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080052
X-Rspamd-Queue-Id: EEA1E4F1F52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-106577-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add PM8010 GPIO support with its compatible string and match data.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index d02d42513ebb..cdd61dae74cf 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1229,6 +1229,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm7550-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm7550ba-gpio", .data = (void *) 8},
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8010-gpio", .data = (void *) 2 },
 	{ .compatible = "qcom,pm8019-gpio", .data = (void *) 6 },
 	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
 	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },

-- 
2.43.0


