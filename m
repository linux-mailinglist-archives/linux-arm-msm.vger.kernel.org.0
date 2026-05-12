Return-Path: <linux-arm-msm+bounces-107101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHZ1EqA1A2oA1gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:13:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F646522147
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 16:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD6F6303DD47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A499C39E9D4;
	Tue, 12 May 2026 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctLwxXzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g049FlUT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACACD39D3CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591392; cv=none; b=HXz3LCbC4vdaYXSY8MymDQCaIks9LsWn1r/mYOCJY0HnRgLzJsdSzp//agYl5EWiqKH1ESjjrlgr/8kkRXvKBotPs9ihe3G68XX+I4iC2Jo7NCWQKYpLAFl1uxOHNDudSaMfou3fBsghOiKNNUIVjqooDCKdrztR7LxFdL7wlWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591392; c=relaxed/simple;
	bh=nCzaPtOgAzOu6WMMaUkEsvKLphsm8vVsM68gBNmWkoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fz89crKXPxO0TGoK0CILM5CvzcFiQX/CqjXF2QUn6NnoA/qNHnRifXD9Xa3HTTBWe/eTdvLMi2xzn9oN7qwXBh2yjczFYq44DBh8refIcV8DYwHB7xtqHQhQEuL7Iax53+8+LFGMOnjhnsf9Rk8qGozu8MHaZUgrXA9ZSwVwS6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctLwxXzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g049FlUT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CCL1ug545238
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=; b=ctLwxXzcIEWxAdTB
	dX3A8s1CUoofPBgIIcM7LOAcPQvwHFgT/jktNG/9W34OMPsDXAaYK50S2CqAezWp
	CuEoBIJcnx3I+QkNqhv2/Hs7M3MpOXoyH6niC4HEakuk92Lze5iHii03RguU47AS
	7JGzjWIOvE3QdVH0IH5lmsZIt6u3umYMNYiKBGkO+lSyN6Ae7a0JtKb2Dso4jtgQ
	HrMzSBSeZwjGJmTG9KkVyqW6cpiY1rUU1cL3tL8HuLvDN0j9dlUCT83R1tp/xACm
	fhgCLktRMau0CgoTn+SLE0fdYdNl60DSQ/Bf4OKHjYHB3ZSnopARELDQfr0F79qG
	tqSu1Q==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444sr560-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:50 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-696307c7f2eso9455789eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591389; x=1779196189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=g049FlUTIoTfbDRJ0i5bXZOgc/KxXIVA9TDTmKmeJ0w4uaeQVElnF1xnj8gEAc2NIb
         RE5R2sx+dTz0NK55gfxBPMdrDQhqsWQ95XOjsB0kbiKa2+VJ+bbfcYCUoDt32vuyC2hu
         Rc49N+p4tpy05Wh3r6NtdPstXD07GeMPO/Tvdkpus+1xcBz92Bey2WLnElVuId9OzZHY
         2tejGiEnjAUk8gQorzi0rmNjmXV/hfBv3EXAfYw7J4GhwloJOqLWbpF4EuTw0WmpuCml
         /E/dEOMaM0gZaXI9Wf6Zn8cp3Bz8HsxDAXvNZwT5j2G46AE8vGSIHbdqXEEe2AJEzqzU
         GffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591389; x=1779196189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xc0LIbJK2UYdiRG8GdteAjSaAc/1cnapMZKivOv4BUQ=;
        b=Az3Emb+v4VjJqKsD7Dl/z7MH9BcphXMHvOyeFlwg2828lR7Yn+cFcVW6ra1ivy5prT
         Vyy1GoGjRhR7Q5/FCvNd5T3vH34nDjYT3FXKGKApSJfx/dJae9zym7XHkQEd6CGIr4ES
         RGY/PtkZWDvbTbZZBqLVroZyjR7rz1ljWH7CVlsUCqhi1haGPXcjE5izUQqPEf5qpsZL
         wf5F6zEzDIX6q9DAaRO2fz+3S+RFKaUX4w8S5U6uUs4noUKL3ryzac8ymh+/f+cYgTCo
         5PrcV2MgJmXDmOXCGAJHivAyuySbTyf330fPaQZDbLsV42pDjTF6Tvt13UihcjaM5YfV
         5m8w==
X-Forwarded-Encrypted: i=1; AFNElJ+l5y6NvdVDmLOv0twA8BC3mX4JuZNwyJxataVstv9Cz/XzqObXI7XVIYpHU3QmoBG3Z3Zjn6McEdCm/QoM@vger.kernel.org
X-Gm-Message-State: AOJu0YwTFyMoSsaqc1NvFKAX234tvBfOO6AnthNCdNP457M+Tqw0vtnN
	+heTQWCr6BVxIBljxf0aYFGFzUvCBJ2VaQtmXo2iavzUsg8ltHn8Xf+u7zBts4E8dSRrkwZQuYh
	foPKuGxa8I3yKex9J4AG6uRNfapsBpxU4PVt5j/1Ks8ybEN0VI7Y3axgNq7kWH0f/+AA4
X-Gm-Gg: Acq92OFJnEMCeG++0F052TRLGsBQQQovPP1gP2P5D+5p3Ydn21re/fE9pkkfjqiO8ez
	yn9EBgegYD1H79XF0bIDAJuVSE6rVjGx5+FCybyw6cVoSice0Ph48k6lsUnw8qwOprA8a4sRUbm
	qSGyjVPFa4crtc3gcSM2eAR6SzyDHnhYt4guoqGWkr0UmLsg6EqHkztctR+58DAsqp3GowYQKon
	6/xva1DoN4flp9PD0PmInfGI4EpVNa9VkmN9f5sGrTkbSzdNXhphOIN+mxNO0WthtzKEnOpeVy4
	+SoSdhfIYMO5J63rPh1BcmxKggxk+pftiGlFCMnE6Zr2Cg/LnQEqdpHnq0TQH5rZc0k90aUgavL
	/9Kq494En92WqK4vCnTYeqskezgZuAXn9ZPzHZV9n8WAP4oekqwAmmsiMG+ITU6YWS5Te+8iiw2
	gVpE4m+FNMZAOsZIhfrHgfp2d3cuHZsI/MTws=
X-Received: by 2002:a05:6820:1a0e:b0:696:15ed:6a09 with SMTP id 006d021491bc7-69b36a92bedmr7372676eaf.24.1778591389224;
        Tue, 12 May 2026 06:09:49 -0700 (PDT)
X-Received: by 2002:a05:6820:1a0e:b0:696:15ed:6a09 with SMTP id 006d021491bc7-69b36a92bedmr7372641eaf.24.1778591388728;
        Tue, 12 May 2026 06:09:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:32 +0300
Subject: [PATCH v5 4/6] arm64: dts: qcom: sc8280xp-x13s: Enable Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-4-8cc251e83b58@oss.qualcomm.com>
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
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=leB8+LKvE7kUH/wvPz6CoXenJFqROgu4EIFsX585OSg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaUJThxkMm9CqBAf7q4ry5/VCwjdOHKgtWu2
 9R1ztNZS7OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmlAAKCRCLPIo+Aiko
 1Z78CACWqa3gELKDbwO2PsumwIg3uHEh9RigHqaLePEIZJM6Fnyb2CY5NJzcxtFKSoJYc9s8mMF
 iKUfaJS22GCYct8j6wk03KJit5/1gYBLceSq02OcoQCA+FQ9zZN2tKhTNowAHG29/BS2LvI5sTT
 VixTMN5fFUdUj2ebuQa7/+6oZ/Zz9E329KzzaCCh+RjtnfyablC7smctocTyZ0qX3vU2HxrdP8j
 C7Zx28h3c6eAXOJyeqW/hjbx/7gleC/m3OfX77gULjwha0AAXo0pIzrSJ58/4vvJtVJPcW8i5Ei
 CW3JeMG3ktbRYER6seYdUvvqC0eKBlGtRpJ51qjgcaCncw5w
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 3lLb6aDJnPyviQemW467y-dLodP5pl-M
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a03269e cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ie9TG8L8bN-JZtJQupEA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3lLb6aDJnPyviQemW467y-dLodP5pl-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX4sd60XG/6h3t
 FwB5KpCEsNnXutMlJq3AhG0MYELcOw8mVKAeJvZjDDaa4ZaATLX7hPusrqbzXk9MsWp+XnmJx6h
 4UDugh4wtDOivafBvM7QXvgTJ2EdZOFp3Yn9L5Lk70FDfl/dxEnqeWlNSgoHEGbrDSLFDt26w2L
 bkxbW5HzZSLzsaqNQ7mqDfDuzp6X+zbssSVrbGwHtG7wIsjsrug0CaAOL7dOrcXVMC8wMN2C33d
 S1bgUEULyCFfN1LgX77tjQE0jjMzq7AQeoSWb25Czo++lg9UvJqiSLK/gbbuJ8FenHE6xQb73D3
 axThq60UtdCX3VBRvkAOjQVn551/m7SSIhh9eO+9N2dZwMPBEbyz1PujRC134psar2FeIGAvekS
 +hqzV9Zfaq+H3WPlUj1r4OYZrS3BXX5n5tM7V3Xbf5mTr2b0CfKEArK+Fi16nZhMsa274n8Ieg1
 GrFI8VrvPpzSjnWLRrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136
X-Rspamd-Queue-Id: 9F646522147
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107101-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.68:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Enable Iris and point the driver to the correct firmware file.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index d84ca010ab9d..0eab03495b8a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -932,6 +932,12 @@ keyboard@68 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/sc8280xp/LENOVO/21BX/qcvss8280.mbn";
+
+	status = "okay";
+};
+
 &pcie2a {
 	perst-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;

-- 
2.47.3


