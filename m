Return-Path: <linux-arm-msm+bounces-83865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7F5C93EF6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 15:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4A88A4E1D9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0FA30FF3B;
	Sat, 29 Nov 2025 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+541Q9v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GuaXtpIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B8430FC2D
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764424972; cv=none; b=CWyWUeAUFeR4Se53DVM9pVckwtjfF2UvMsJWWHLST2g1Zlp/Rni35M0asj70izf7+tniMHy7Hnb5HDp/cXHtbLkor2eHwbCDtb4HdCkPWWoYrmq9Deb3Z4Xhe8Ce5RkR82eeJiJ832lHWlj4n4wxLZJxsF/Vhj1QYTfvzd9/fQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764424972; c=relaxed/simple;
	bh=aWK8HW93NbPO0VINqLWvyngHL+dlE6K0GHcYstgm2IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QuwEmPzGocTl6Kj/QZiuL/gCxzmQENgm4Nx7ppcLJ45LaeGwoo9/8ri4v6NCgfvkuxHa4dlSho85gPqUOLQrUAlt2kO9eigtV2oskPCHf1qVaqj2HMu8hB7rXjUu6I3z7i3TIB7JQf8VwM5frtnWKbuMki6uuyoa83PVFBHFldE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+541Q9v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GuaXtpIu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ATC6RXD3383567
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qt4E1sFZ0Od7wfHhaZ02HfRz3EZfCVtLOeoJvwlgYc=; b=E+541Q9vWPNUnj6z
	udsWpbRfG6Gv7aSxA+RJl61u/UDrgkBa7siQHsiojZiWBPzu/UKtBB3kAE8aayKY
	Y9CCYEAGH4AdGL0stHCX0D1F/IhOqljaiKyRXwZZUsLhMboJ1TK7Zu3OpTn1cMJb
	bKKOuihqxdgpJskTwvfXW/6mUBYyN0ahpWsdKmzKyqWWYFEBlgHesqfRxnRF+0HV
	ZKMhg5JaFdARpEiL9TEtWdWC/PIaEQTm4auCxnUxPHTk6yiODPG8HkFTIUl1DyRN
	UJnsnnbnNkRcbwcWueIIFDa3+zW7K7zmW5FpeM8ub8E74ffwgoosRn/JowWiwwWh
	MczK/Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqqu60us8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 14:02:49 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55b0cfe81afso3804340e0c.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 06:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764424968; x=1765029768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2qt4E1sFZ0Od7wfHhaZ02HfRz3EZfCVtLOeoJvwlgYc=;
        b=GuaXtpIuHNKxjrXk7aRbLyhvyZHNYjNaLZiwjDVocWYNePQ10/IuJ1UZCg8NPlxb/q
         pnXWa6Xgq3puwoiVokE5kHDFUxsocEiwxcnpN+hFfpW5VyNhyfV8BCZnSuL1NJuAwySq
         bmzp+PMY/UydJMKO952G8oIga8WExj4HMSuVkTwcIzCLKxLKUAY9Pk6U62kCTyKQjgA2
         KCTCj6Z/iudH+w3eSVE2r4jelvFOj50V3upVcktDERk5e0PVGlSj3go92tpHJ7YbByBm
         drICBEMuP7E3LiS9u0EjL1GE/Eb+BxUtX3BQ9vY0j7ZkDzP3SXkwnL151veaj3IrGGAw
         qpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764424968; x=1765029768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2qt4E1sFZ0Od7wfHhaZ02HfRz3EZfCVtLOeoJvwlgYc=;
        b=pv1br0yJ71RJmlH594gmVFw7HCOMjJyhtoELH3jFLVZsVGtgxi8AapmFNjw4zEgPG/
         CmDWzznjPNaRgFuCQ7NO3L3aa4TvqmY3jVulq9hWrSquhfrGgxADnyaYbf1KavNnw84U
         JfMwZBvp1h0VRTPGZkYlgLqv2NK5KP/bKTbYedFDZUcVlM52UnslRCiuG6UAGQ2dTpku
         5Irkcmccly+9DNgLb27uRIjb2dccvWhN4d5MAJBeBQ4y+1q8namJb0EfmIp8rceVRzHn
         TvHueV+rmfUx5umnqRJlXQT7RFOtCRwr+fPD8Wf2sqY9Yv/50Q4tCp5dK20GE4Rrp5Sn
         Zbgg==
X-Forwarded-Encrypted: i=1; AJvYcCU+vt+wjKnyKVmqEgZGwewFXzOqotsVW63rx+M1v1kujnui0+iGA3lYHbYQoGIOjvSTcXSyQdgwD+PtAf+K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv8n7MwGTlUD4LiTIxwNzgudKPVqqjUTqoNlzrEuVnksulT39o
	OYKFxpeWaEeOKi2Kh9csnS1Dwvs+7C7YnjLHiAtI1o/wq7wb6f7FT6dsrFhGIskN1HVFwaN6qOd
	VlJUx3Md028BGUpBO8pg8SPUelMKtqOlMMEAgKPiMvqdMXRnHw9aA0KUC8GiqIezcN/oR4fy7Un
	Bq
X-Gm-Gg: ASbGncuB7Ew58EoyuyEJuQofRFe0mRSrx/RjeA9vCAacIYoavIse2uZDQkr31lQmgRZ
	WsCOoD9NPrO8Uv7GouaWA+P5VIGATxLm0HqToEMwNf3OGPojj3Q4+z4c9BA/NigezgFwE3Q+Yzc
	P+FbKAPFA3fDI566Q9qlhoyYBvCswJeOcfQ2yi85qdEc2cXUYjn+1n5+ojNyFsj9uOKFlzzIPNl
	+mCOzlfhv04Yq8L4GEG4pM3NDdb1XCg8Yqv1i1USFjPQVdKDC9hDE9ToZLVOFOWH8UBAP/+8qtb
	3/4Tsj/a0LSl7HPwKDq6AVIlaMTQKvr1lzPcu8rlntioyAEymFFLhFblH87xu85S0KXBYF/TPDn
	RElbdRH9zk+Sdvcfrbs7aRe1imLjqHuW+Uw==
X-Received: by 2002:a05:6102:370d:b0:5db:331e:4c1f with SMTP id ada2fe7eead31-5e22426accamr7311805137.16.1764424968484;
        Sat, 29 Nov 2025 06:02:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFU98LIvFQ/kkWGpQqGkLrFs1nmiN3rrv194/Srub0dhElVvkfxp33hoIe5XJl3qEbZJStJCQ==
X-Received: by 2002:a05:6102:370d:b0:5db:331e:4c1f with SMTP id ada2fe7eead31-5e22426accamr7311742137.16.1764424968073;
        Sat, 29 Nov 2025 06:02:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59a63dfsm681649866b.37.2025.11.29.06.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 06:02:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 15:02:35 +0100
Subject: [PATCH 5/6] ASoC: qcom: topology: Constify pointed
 snd_soc_tplg_dapm_widget
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-b4-container-of-const-asoc-qcom-v1-5-67a3d3320371@oss.qualcomm.com>
References: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
In-Reply-To: <20251129-b4-container-of-const-asoc-qcom-v1-0-67a3d3320371@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3065;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aWK8HW93NbPO0VINqLWvyngHL+dlE6K0GHcYstgm2IE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvz9Ct56OKgiHXO4G8+WRGY7uM10bETkgsDRt
 1hvzjCNUq2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSr8/QAKCRDBN2bmhouD
 1yUGD/wI4wntZqbkUekoZVu5KlrHFsu3CICW4HZSdUtHxPqBA/Y7AzmKSB47OEQvz2KITJuBQmB
 eA7UkMbbOo2gRvm2ev9+RXKSXjiKruGYerk6TWDZ1FJjsPyPbu3NbLA+IcL+OU5GIonk7420KQ/
 6+dqikAR3QbI3+1oQzZHEOaOMHnwko1uFZ9U6EDoigXoqWiragMNzoqSSRku0qlIrhy4QcZKKyx
 fKVTKY/HKDBeq7RRlEHvlEyyeQTM2gaOtu4KESqKRJ7RDsYDU901jejp0OaSZweozGeKm11yUt4
 eLNLR1lis6aF+AzLlOIlBMS7b8RfKtPoaROsV4WRP+NNpSzse2RSbYS8S5gGfJUBhtyb3SyzrVh
 FEN2z6bnXJCvF9mNuFJZIhpei8X4GyJOQRA0YtSNxCeeLaCiIlkKVU6rsu24nLO9iuhGk4HKDcg
 iU+jCX/R0osDHeBXu+KjUz7Bdi34hYCuLR9UxS86G5mg9fzPW7YG19YFUfL2hGbtuYODtrnPgN4
 UpbuiwRH/e3Yo9CmsFxiESorX5JwKWnWU/pylBXWdHNI+Ts/7XaxnEsJ63bfFLBMTRFnOfcoWNY
 ebaWVVThjq4GcDX3UMjMM3NuN+oLFNs+1ytouhGWRUKqPmtlC1/6hH9NIFlp/RSj557xjknaG63
 LEE2jWjvR3akXDQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: Gr9dmM_U-cp2Df4EckFR2sVTva7E5mjW
X-Authority-Analysis: v=2.4 cv=CM0nnBrD c=1 sm=1 tr=0 ts=692afd09 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LmhyXBtnI0SQ4MprW8YA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: Gr9dmM_U-cp2Df4EckFR2sVTva7E5mjW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDExMyBTYWx0ZWRfXyTZ9JpubMkX9
 xPGRzlRRkx3gfyBtjdpwfiXKLiO7nVRP0ggUMrC1r8u3uc0bh8k3v2JFr/4Pwu/ETl7i2OF6QZd
 jDs0HE+o6SJr+/wDgie1s9oepE3keyxNDSXvMETvTnq9HAdRUm4KNQ6W263HN0JFh9WiYze5s18
 rJU/rqf4mbAHHv6NFotaqHbCb8zPGB7kWuxgigEUcG9mrDdyt+oQJCH6CPGWxAiX6piURAv/B8M
 XMu3kq6QW7X1UCYp4YB34XpaLtzSRgaK/CW033+kGHe2EQLuKE7xpfDOpDri5brAqck7lu887vd
 zt3crmpP86I1CMWqJt23OFL/2ezd92oWK1JMBFU/GyEaWPHXffcnZwSkeI1eUDsV6G2/AOYt7l/
 HRJtlmpQObgrpTez3gMun2yDeYQ54A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290113

Several functions in topology.c receive pointers to 'struct
snd_soc_tplg_dapm_widget' and do not modify their contents.  Constify
the pointers for self-explanatory code (pointed memory is not modified
by the function) and a bit safer code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index fdf144461cfb..b1a8d82b2234 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -590,7 +590,7 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 
 static int audioreach_widget_load_module_common(struct snd_soc_component *component,
 						int index, struct snd_soc_dapm_widget *w,
-						struct snd_soc_tplg_dapm_widget *tplg_w)
+						const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	struct q6apm *apm = dev_get_drvdata(component->dev);
 	struct audioreach_container *cont;
@@ -620,7 +620,7 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 
 static int audioreach_widget_load_enc_dec_cnv(struct snd_soc_component *component,
 					      int index, struct snd_soc_dapm_widget *w,
-					      struct snd_soc_tplg_dapm_widget *tplg_w)
+					      const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	const struct snd_soc_tplg_vendor_array *mod_array;
@@ -778,7 +778,7 @@ static int audioreach_widget_dp_module_load(struct audioreach_module *mod,
 
 static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 					 int index, struct snd_soc_dapm_widget *w,
-					 struct snd_soc_tplg_dapm_widget *tplg_w)
+					 const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	const struct snd_soc_tplg_vendor_array *mod_array;
 	struct audioreach_module *mod;
@@ -818,10 +818,10 @@ static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 
 static int audioreach_widget_load_mixer(struct snd_soc_component *component,
 					int index, struct snd_soc_dapm_widget *w,
-					struct snd_soc_tplg_dapm_widget *tplg_w)
+					const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
-	struct snd_soc_tplg_vendor_value_elem *w_elem;
-	struct snd_soc_tplg_vendor_array *w_array;
+	const struct snd_soc_tplg_vendor_value_elem *w_elem;
+	const struct snd_soc_tplg_vendor_array *w_array;
 	struct snd_ar_control *scontrol;
 	struct q6apm *data = dev_get_drvdata(component->dev);
 	struct snd_soc_dobj *dobj;
@@ -886,7 +886,7 @@ static const struct snd_soc_tplg_widget_events audioreach_widget_ops[] = {
 
 static int audioreach_widget_load_pga(struct snd_soc_component *component,
 				      int index, struct snd_soc_dapm_widget *w,
-				      struct snd_soc_tplg_dapm_widget *tplg_w)
+				      const struct snd_soc_tplg_dapm_widget *tplg_w)
 {
 	struct audioreach_module *mod;
 	struct snd_soc_dobj *dobj;

-- 
2.48.1


