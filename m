Return-Path: <linux-arm-msm+bounces-95137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI99JnXdpmnRXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:09:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E631EFEB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCDAF309C413
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8555B33F8BE;
	Tue,  3 Mar 2026 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNe6RT5V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZFP1HgB9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BFB423A72
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543302; cv=none; b=np0IIBIcj08xtZD0o/5G/+xOdR35KYoa+ijse+duMaPWs1lGvkz+CVW0qVwIohsDlnu27MZBO5vYOW/eHQx/R0NpPHVWnFgYEbusgeANXJxqiK3pIfotmEN4M9lDCc4xgdrZdbELzco9F3aM+3lhU4EfoOqSTFCFo9sAYmxSRAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543302; c=relaxed/simple;
	bh=8F4yj9WgpcRrhlxe+LM9CP/vQbqufNYhRkj1ketDKcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sJNU3LQ00LoqVaXrQWppR+KdulyIFvYu+pi0iflXRCQHjlv8+5lNyHyg4+nzebjES8W2seZBi9aIsfWmYLj3chl9xaoZmN5CIEDfV7XSZOnTsEeFLUf2jwXMCNV0EGbK6jGTBtOu51y1fLUnz+MQsY3elSEQym0qG2a9lCdjj/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNe6RT5V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZFP1HgB9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mqli3995479
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhLTcvACUzqCHczJcY2K0aqA9L0fy2FkKaMku7rR94o=; b=NNe6RT5VLhOuvfZT
	BIIfpntJNBry1k1s3DPkKbHc5PO00sCILrxXfyZTzsOLiV3YULjo8YDKpYzWG96W
	STm0AK/xOdrW58x1yBddhfkFjZxaBfZPECavcj7Zlw2UPqO7Uiwo+tyiiW3p6Xhr
	Gse2tAJYud4HABopHkt9AV2npIOBNkhtAO8ddEA4vyvJVSrd1Z6oDVp5EbnwjoNb
	bRoMZkvvKshaXDlETxjm91GjMTEM/V4SGVaPdeTFIJbNd0LOggzyXC9WHvNNWVUN
	TYaUmwNsTAlY5twWpF8TvHv7C7RbfFpFyEW5dbEZxIPNCCTByO0VPFjcSHqyISfg
	7Gau3g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cns5fshab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:08:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c882774f0dso3805585285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543299; x=1773148099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhLTcvACUzqCHczJcY2K0aqA9L0fy2FkKaMku7rR94o=;
        b=ZFP1HgB9rtFcEtmeQy1wmkPg0+Pd0ITu7N8gyU51fJ3MTnxrEcA3iyqd+e+mU5zF45
         fGQ/8STP1rQuuC5ocncDNB+sUgn231sYnfdyVcivtntmncvxrA6vz+WD0gR9lkFO3NnC
         rFn2k5MHwPhk09mvxAMZkX2RtfD2jBQNLoMYkUZXVbG11ASbEiG3IJRcNIzZQnp7yiXk
         rRBjpnqSfc8TIxKKxUlCCtPObnyFj4R1QEodXMwHmYu/figWEUcRl8ewT52Ltv1tALD+
         tEtM9VlwgsGSWfjP7U11yXnz+EJLgy0rHeWa1cn79dYY4CVa4WM2Yq+egcNGfnKoEdBy
         Tqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543299; x=1773148099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fhLTcvACUzqCHczJcY2K0aqA9L0fy2FkKaMku7rR94o=;
        b=FEXyvUMNRNycOkkMz78VtZoZWPLJgYgOnSyady0FLmdVtZeRlgjt2f404TzZAXcaRU
         bpRuOQ+m+9jUowmi5c7Ak58YRcpITAGC7qbQNswmIj/OsqTi5e60wXOmRyr4w35Pcgm8
         lj0504j6JeI740S55292n5sYH4Ijnmj1CGzHiaoePNkZBklgVvmqVX5/nW5/ajyydQdL
         gm/hwPk86YUL4SHTbe3xPl8pFyxiYHEyzoMxfaYeL8gZHJD9CcR3QvajOgiMNFWXqcDr
         8QuQdfNETHHOvZ+h45y+HNp3iaqA7bsZBjcgKkR6xlWWWk985r9dhoj/NJL8gF9MIuGt
         H72w==
X-Gm-Message-State: AOJu0YzKtKf9AuC1oQqLkFdm9ZSJZzVSEHtjrXwwo2dYLeo2cGqTiM7g
	DGrEQaoGC/m3XgbEgMIh3Qlec+s/soOQ79Z6iqyYVTeqaqBjid71LOo8xF8GCFZBSpbmOJMBBHR
	d6TW3OB+d9p/XBkyHHfLWUS6ujhrFuJUM9FHCXaW22lag7LFq+ytCD9KaPWdphx/eM1YD0g5RKR
	f1
X-Gm-Gg: ATEYQzwTTmTePk8UYnw1UYggHs/c7SaM6Zd1e0uqgs94eyCog7F9K/7IoBHDpDlgZ3i
	4BVRI3wY18chSFRdD2biOluLgotEoOV5Y8bHifC8EkMF3RnpZMkwxyfpsYYIX563oQXIRe9wzP1
	4y14au6GYDamrqOvuvW6LiJA74o1/Tr3w2ZikLL+1ToqrzxAtUCRQugNF8YOMLIRdcRZQ0GiGDi
	vgIaveTH56JbulEXIG9o5zDw/CeSkEG8ulsTQFgRPskKACdVmwrzHZMRqjNrhn8SaAbXWtGe3RF
	q9AWQFL/88OIOdi9zL08JEx8qiHnslxH3R93WCtcuuAnVzJ8qSFb8403q3PRPPrElIaZ1gwLeV0
	1VJ0Xt7RF/UzWLNutqsIIChPSyToeVUBCM9ck01bDo2cO
X-Received: by 2002:a05:620a:298d:b0:8b2:7777:f662 with SMTP id af79cd13be357-8cbc8e1a5a7mr1865321085a.64.1772543298828;
        Tue, 03 Mar 2026 05:08:18 -0800 (PST)
X-Received: by 2002:a05:620a:298d:b0:8b2:7777:f662 with SMTP id af79cd13be357-8cbc8e1a5a7mr1865314785a.64.1772543298338;
        Tue, 03 Mar 2026 05:08:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:08:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:53 +0100
Subject: [PATCH 3/8] dt-bindings: display/msm: dsi-controller-main: Add
 Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-3-814121dbb2bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1090;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8F4yj9WgpcRrhlxe+LM9CP/vQbqufNYhRkj1ketDKcE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0tSbWDjI4/dlk1HRlsDCAOz5JoDtNTCTLCB
 yW6WwGdzF6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdLQAKCRDBN2bmhouD
 12QHD/9BCO8SDyjv2U42Sa/8wPJ/r0hVx/bkMgsqQGHRVZnMCqqbWINvBusv+uK5VrN3oYfxTa7
 zlXbM0Cxe/Exd+RXF1ieujaTxQY83z69Tmds3LdEuL28fF20SOU/h1JZmwq8PWP2lwfFkuM6uza
 JEC9CV+9V04XjmIND3qC8Mk3f32ngvQQ+qY6BBLtAO5XMREfAAaAWGBwwa9lU2jEpAFoovLE2yg
 nhNChpaFM39/QLWX7wVaX9mJp9jO3W0FoHCTsPBAcyZPMGrzycOFGaGGKTHCmkbkyqitqGH/0hV
 X3i/sLoOytUxzDt+28r7oCGXUH/xFplJk6Q/Cdw5z8poHKaB2fHKFgGXSmEYiwD8zzubZuBa/bB
 g9Rahn7CbCKLtNeZ/dqWHY29EXie45jwgYB5eAz1P/Zd0BQaNEIA03M4sw00dyNO22s06kymzzj
 o+uPpICMpM7sLkqrLgpBR+98DCtEWNbF1Ho/u6jNEQ+LZ9UCNjNdP+PjMfwcRlHedItkPUfxtXt
 dCiMlCsfsttIP/cD4uUqXFh2O+S1fk6bqDGvs0alx/BG6YQmneyCyKNFyCcvB1/MS+scFZX+fsb
 gOCTpjhcUaKiAaGIvfT25fgBNyrDUFbRssGxDp9Oxz89/QjzsDLa4A6ob/W4BRcmVBOTsMFLJ2Z
 Wp+gKdsDXg0Tm9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=Pv2ergM3 c=1 sm=1 tr=0 ts=69a6dd44 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mIdND3L9f6gUZBhNI2MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 5YU9IRF0K9wjIbhsaF61JeD7dc3fRVmA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX8RLmbuqE4PzB
 aeQF7yPypXJ7ZohaAAX5RZf461rOzR37N0+9clqouUlJL9BJ2rYYiFCvw1M+m+Hl55qMR/I4d9S
 vhORkJ+CpWJuKJANTQd2MtYmByo5t1CDF53kRD3vPeJdN74vyWNOnHT4uYNUOY/Je/nCOe1olH+
 D3VIoOkCGgCd5kE2dNe8VxxWigGNyfa0xvSv4SaHGL0Rwcceh27qW2QsFd4ETo9yovHsefbgDJ2
 JArRLvoBsTuuS8eI9EfQz4jtw+pR21UBPFQXHeeaZ2e3dqoxwONpiF/oj7k9fVJzo1/n5FPwP4b
 O93iM7eUzajxmKP9adJ6R/WxQpa+JlCv42Wr6s4wQXi4UlR67MsjYkwBvJnv/YBykcCP1Kxz2H/
 BN/UsEzLWXrSWOiK9B2qwxfXtagcNxpuxfcoXXFszrWSq5eW0JAr549zKmSk1AYXeMExpMqHGhR
 bj7by8xqV4AUMfhusAQ==
X-Proofpoint-GUID: 5YU9IRF0K9wjIbhsaF61JeD7dc3fRVmA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030103
X-Rspamd-Queue-Id: 11E631EFEB0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95137-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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

Add DSI controller Qualcomm Eliza SoC using exactly the same block as
SM8750.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index eb6d38dabb08..49b8b6db45f1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -51,6 +51,10 @@ properties:
               - qcom,qcs8300-dsi-ctrl
           - const: qcom,sa8775p-dsi-ctrl
           - const: qcom,mdss-dsi-ctrl
+      - items:
+          - const: qcom,eliza-dsi-ctrl
+          - const: qcom,sm8750-dsi-ctrl
+          - const: qcom,mdss-dsi-ctrl
       - enum:
           - qcom,dsi-ctrl-6g-qcm2290
           - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible

-- 
2.51.0


