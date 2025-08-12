Return-Path: <linux-arm-msm+bounces-68631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E2AB21B77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 889CA465833
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 03:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7242E5409;
	Tue, 12 Aug 2025 03:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsTrpTfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D462F26529E
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754968315; cv=none; b=BCw3X3PpIn1iPuiVX9qfMvZiiC/PJTLzrD3uED0YALKReZHwiyciLzD0fUMShBrsDkpmPp5T//52eKK4jjpCohEhFCoLLnrblr1nUgaJuQfC2mslOirALt3beW80Ks03qSXc7AFqJnmFFmQ8O2AfIYNXKVoRGeG9IjBdIxc6oug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754968315; c=relaxed/simple;
	bh=iWKr94l4C+wGOu32iC4kUTBBxAFqi2csewiI06tugUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Raa4fRwN4+9HzC+PbSJNGc9bFoLF5W4V35TLTZpbWhO+YBfG29ZJMV5a2UivCSP6WtWilSxOear8wt56JY6XHXHwJGtVw7F0xlGEXasYKqRaserO2nrrcep+8iU/WZJmRCbHLrKEJh6OiiSjpUDnAg5DkArMq/LR2J1JkcBWEI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RsTrpTfp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BGXBlp029264
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBAbKSf3/PgS0PaQMsZaEkwPqrlvCqAgfpJXTwwvKk4=; b=RsTrpTfpSvC3eW2n
	/36qwnsRFpCyLjz9MIi++8n1oLmBxmTHlZt/gIaItVC24+qDu8MmiBOzXVX6+zyR
	C8hY4g8LwT+JVML3gQu+fPG4YYiF2V0WJrBVtbuM93AocV8tRHuVDsrbGL93dskC
	qWom8o295AAHgGc4vyBRg2JMnpQ07XRq+cN/Plgb8nSQagGfVyusnpJXfnIrQU4p
	E5a8r3y6k2WZQT6Eb/cXIcXVGuJLrRTt7PGNDk957BB9bdHtqJS2wvUy5N32jEuF
	rPWo7n6tDp1nS/qV29plKLi1ip8OvYON7/VGKB4Mg6B2/SjXTX6qB2fw1mBnGEPl
	TcTkLQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmej2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:11:52 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-619a5da6c02so7395687eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 20:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754968312; x=1755573112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBAbKSf3/PgS0PaQMsZaEkwPqrlvCqAgfpJXTwwvKk4=;
        b=ZBiMuEQB55D2pQ3iHO2Y37gnkYjBuOukgNVkuvohYTDW+6ImAWlV5D4+mPdI6iEGe+
         xqSfURG1npUNhBBd8xbjLymT2qF0JKyrky2DxVgNjdQZxjD7JI+3ckMsvlwgz+jfbSgT
         IZHVDV5O5mVIb/2+ywAhI5lwN5PEeAkBWQdRgA/IFxU00HhXwblqAQYyiSqEqSGAVLnj
         CqAj7AySm3UENGN1lgxGzewTKJtdxxh6Ik4f25BU6nN8n6H2NWxnikpgzwsUFLs7D3Eb
         NX7SU111adJ5/y2JDnXUfnn0zP7Snus1tJ1TKsU5XG3RFB/Ia15LSPPOmuU/+qe0J8Cm
         Eg3Q==
X-Gm-Message-State: AOJu0YybTEGV3rk6P2x7/T/wKz58cSf3Xh+OrtcfDiU2RCH0CINBfVPK
	mq2dZidWgTAp+Ldn6TovRC13b+tcWPfuA+pGs6L5ntJRaCqKqwzzqWS57Bbv5aH3KJOjg0B62Lo
	H4zlXmJOsKckhSxJZyVzzanHiAgsc6ZHa/GZBczzg9n8L3BBhGKY181USAyilUQ4jqMNM
X-Gm-Gg: ASbGncsLsTycMdIHFi7HgCfDR4TlRoElQWaGrFoMWT9hXnP+lNd9EguHgtY0BQ1e0WW
	VR8BFpJmTkyoxGzMeaeIJK6mog0VSuDtN5gmIe7t1y6fN7Ve4XaWabz60cFv/DSDMbnryxEWVwt
	quU/Oyr9VaXPU/murE1VO+QtlOp2K0+m8blmG6mwYI1UkhUHtkEfwdQqZEtax9M63JmlQs1lAsl
	KIrTIC/oBbekzQgQeGZ4FTseXCK/7ZEa8/ru5BxP0Xgegx3sZv0Yv9nI+W5QdReUHlcpfZ5g+gf
	x3raBYmio4UIhWyTPsSoE3+2BthcN1+4N8eud5UUfmMq4Oy6Y4so2E7W2KIlOTphiZHScnlEdRe
	tAs2N33Y3agCZCKwCmtCIgbwpZGztu0rehqzG9q4=
X-Received: by 2002:a05:6870:8e17:b0:301:fec8:fc5 with SMTP id 586e51a60fabf-30c9504838dmr1239437fac.23.1754968311936;
        Mon, 11 Aug 2025 20:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYeL6E0IFSZGXEtKtjBlJEPzBOueX+0t8ndofxKFQcOfrzO6R1WsxDwocxPN25RhkzaZVT+g==
X-Received: by 2002:a05:6870:8e17:b0:301:fec8:fc5 with SMTP id 586e51a60fabf-30c9504838dmr1239417fac.23.1754968311598;
        Mon, 11 Aug 2025 20:11:51 -0700 (PDT)
Received: from [192.168.86.68] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-307a717f0c9sm8174531fac.13.2025.08.11.20.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 20:11:51 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 22:11:35 -0500
Subject: [PATCH 3/3] arm64: dts: qcom: sc7280: Add MDSS_CORE reset to mdss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-sc7280-mdss-reset-v1-3-83ceff1d48de@oss.qualcomm.com>
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=iWKr94l4C+wGOu32iC4kUTBBxAFqi2csewiI06tugUg=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBomrDzaYgQuecT1vAEY3V2vVAU4NXEVxfTC/6Rd
 umxP8mPc2yJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaJqw8xUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUNdQ//Wo+tahejLl4GZM4AoSOTHfuxsT5do+dilLRbHjj
 rdlqhoxNSr6ugRG+IFq3m+xUg/cL17pSIt2PQggpfaBznLV3VgtOZPGLvmsJZ/3KVPPwRL1DR/t
 ckdcgUOkAD25rsyP3bnXRXl3aqXY0CUhlClw8+at9jnhamIcJRI5Mc9wNgNL8uy7zCA91xNNULs
 BkqUL2MSm308aA8f1Wj+zDdYysdI2NejeHe+0UqP491ef0a+vUz2qRDNnDd0a8QXk9HucIKv4R4
 peWyzOYP92ejK3pShm/s6xOi22trMjqeo1s0Xu570z0bRwQ84E65WG1CH5xQ9CHNW/bAtN8GFsb
 ur68QWvSlkA96KJqIjDEFm8t8QxbhsO2qK+NIgnsWXYaU5IhxhjCZp/BS6SYHCO2CmYFlPwthIs
 ZlsKDh6RTr6WTnv+8NRn0AGNxSZeZ/t50RzToI83E4PgXCEolh28d+aUg7KV95VDq3pDM7dCWuS
 SvJ3KeG21pUC7uYkwNaG61r+ESsGdrBd7kJiMeiRLtAIRFKabW8CUabwu2RK5hWZBQjNa6p2m3p
 rsGp53CmSxmGIvsxNWFVA2r9q7mB4qD4g+ckKg2AobCz9aFfHF+B8WK2Q8PSBkO67laYa+TlPTj
 fRepVQHRPrPKQs62ZvsXEfXmAJCGHZzmlGcj9EDTk6zg=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXyg31+KeWr8NN
 zhTdGuLu8eQyHbedrYUFhCFcYzaanKPfDyGJLfTeNuctDbHlJA+3y1mM936qv2Dwjim0K+3gFOI
 ud28fab4+UkydEE4UZ84xNhzqDgK5H0QmasMmUoC/TUp4G5TBR0ImI7l0Ll0qMgIaksETkvFSZw
 UwUifro8TtrknD3wY+808yKVBw23ofqnPmatdhjevKzmQjvE1f1s2k3s3kMHof4SnquZ14M6V82
 ttFGu3bF+E7bRY5MkM+zgTJBLJvnyWIAaPe7LKTQ0be+b2IEmiAxFd2ds4zGMuyQ4n48DD8f3LJ
 Frija6Yvp6Q+NYs6wxTRuImabYMrBcfL3F7BNKVZkxJom6r3gBocMkWmDoEps3esEmJUQrVEBPo
 wwP2HlqU
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=689ab0f9 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=dOedmflVD102KoYFdoYA:9
 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: 9aOc6JBNGh4LUkYMB15ddIbK3sg2RhSY
X-Proofpoint-ORIG-GUID: 9aOc6JBNGh4LUkYMB15ddIbK3sg2RhSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

Like on other platforms, if the OS does not support recovering the state
left by the bootloader it needs access to MDSS_CORE, so that it can
clear the MDSS configuration.

Until now it seems no version of the bootloaders have done so, but e.g.
the Particle Tachyon ships with a bootloader that does leave the display
in a state that results in a series of iommu faults.

So let's provide the reset, to allow the OS to clear that state.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd3010018e94eb50c534a509d6b4cf2473b..5eafcb84cd452ecc758922b69774837e9f5a899a 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -4724,6 +4724,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			iommus = <&apps_smmu 0x900 0x402>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;

-- 
2.49.0


