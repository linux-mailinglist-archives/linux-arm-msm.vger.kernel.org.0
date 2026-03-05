Return-Path: <linux-arm-msm+bounces-95568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC/BHuJSqWkj4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:54:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 095FD20F0FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 10:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A55BF300A630
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 09:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940F237BE6A;
	Thu,  5 Mar 2026 09:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Si5A8wQk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XB+l3doD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C6937B41B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704118; cv=none; b=meIGxt9ZKkhY3eAFRWgYqDy9/9lvB7srnxX6eyHmBaSwpTNrTgtUOGxlh/HGM9Grj5UCqWp6KTvhN4xoTR3/aEYTKuhCeiCkf/rE3yRQydv20nDlKcnWsMzd2N3FvT8rBv3F0HwNTLFPe7Bx3piRCoEaSEH+HAeWFcQWnbLh75c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704118; c=relaxed/simple;
	bh=i6izUJviyArX46Sxz3psV8CYflgOEvKVmFWmHyN2UJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IybPG9oA7PFwq0yyujvKbmF7bQMY9lNqassXO7cFKf0Jp97TZfG5im7QB07HJvzo4nUWDPVrsl/zlgPMYQ4OS1MV4D7IWH0EoJ+qs/SAImcs8S7oRpA3Wf8uHwppvhwBbW+BvfCC1Xbo/FwAMxViSBiX8GjTWKvE04Dh+ihrjj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Si5A8wQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XB+l3doD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258sWR23483047
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 09:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=; b=Si5A8wQkVIgZLnx1
	siu1KnQufSbALw07L+ODCEEgkm7qe5QlRfWt0ge2kpNv6ovG0sMH6lHz/4AYyHbs
	FHvsfOZoYLuqcgA0D6/4ddqRoc4cdAmYhHzFzHUaCkciVmz9aMAem9IZXf1C+wYR
	rJAxk01tTKSGJjHusbHf4rwFcJyZ3QH2fKtwGiIQOUSMlYnzUdLGvH/xNnI3u5yQ
	rGGr9OFZdvLg4uwvHCvEh6YrVUv8N/YAhimUMXhDTaRZ1N5VPglOlENuJvxdfTqP
	B/jpEt987CcmwUT7ffiOx+4BiwfUr6SiA4+rR81NZwXQcNsKkwPxOfsnn3pFZTz6
	yNhe5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wjrc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 09:48:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506ab115571so566045241cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 01:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704115; x=1773308915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=;
        b=XB+l3doDbgS98znvECBXuTKJxayzgHj39zcvO5ERsIrQIApu0pVOV7r0I5sZ4f5VQ6
         YZMyXdLWPaSSkBfHXlrOnjJV27KG/teajSZQxN2NNSTyAPBzTxHgINaBKz1CqaUnMTIR
         YiKEsghsDLtJiG3N+iSY3K5HmRXBQzyHEX0NuiZjbpNNKM/TkFb5BpqjggmESmCkVZjH
         DQK4TtXVLO1hX1U2CKYncqIyC1XLhDH73uNffhGZY4EdYGyCRKGcOKtxbIBmp/NZaOIV
         CsrqISlrxKJjxBVDxHLR87mm5EMB+zYuFl4m0ULv68VHeKueoxcGOUj2+ETkjD6aCCct
         Sugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704115; x=1773308915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=azIj86InPC+CXN10XsD4qgZL9tAaO+Zo/OsdMtMqGik=;
        b=tU6JGBqy18/yuEZV6+AhYO2Jpo8Nhbo2ebT+eIQQ5iWVdmWNo7AwqMu+H7N/zJpFCq
         mBZ8h5pO/kQSe0/SOBRtQdLZWf2kz4XZyo6v/c8mariKWjVNgIUpsSvI+e8ahNagrG6n
         mHP/GJ1JG6q16tVKucD6cH7qui5WJ2do2eRyZaxL2KbM5niExpRj5DUuX2hqxqICO8lo
         t3lwLZDkk5hnqAmexbn4qBh3BacjQZB8aCtOIWKbRL0TPTGaLg4BC+Hr6x5eT9ngF/w8
         NNx3n+NEhsu4z+XwpODgEiIGLoUtSfNgW1blnJHApCJd09G5Ifskk0XuYg9sLH64pmgG
         FMeg==
X-Forwarded-Encrypted: i=1; AJvYcCUaswBztzblJwOSQBuY53GUcJDgoGQzWyuSM0hk+0GrJ4BTAtxM0hKTKWrBjOlvdvMk2Z8PN8DXL+wWiLvL@vger.kernel.org
X-Gm-Message-State: AOJu0YxkIF0AxTJzlWU6Q2YuDzk3AbEsvtUN8ZAD4v5DhnWjbz/t62cr
	Ert0GmcDq9PlwZSTpKv6VxBPx0BWKvOIUF3UVYhYRrGnlJOLLJMHyfeIp348zgc9BW++y3NTP87
	5hqrMp7IPF69yT2IDpw5R92SUxchPZP6NhxgENkWRg/6ZGqPVg3p+vP88NovkwvMqBjoa
X-Gm-Gg: ATEYQzxt14t/IhG9xZH9pDK3fm8mqPe9ZKU9FnSxlnmRwCHAKgXnfyq25OFk284QQ+J
	T32g2my4Gw9Oc4WyLNLbqp5t2eZc9RiSIdKZI2rHek16ZSwiLb8HzC8zG4H5sb/5LRTf8DlM2XI
	f7EPig7eRIGAfdK4o67FuY4AjLf4Phrg36VS2R33OCsk3/6o6LGstQ3wo/dkko7B97/0kIG6Bvk
	1m2+0BMiIsM4q2rJPzxSCk2SLIqYzbId0BHe/5YUzkWyJRx/6zN9r+7DcpAkzR4C5X3o+Y7M8ho
	HALiDoVRRXqPHHR4Q4bRvOWBPrL8YEG5mNItAmkwZiVWLYukJgJxr8DWZ3kuG4qMMPN1R+50GYL
	fddldDLHde4RC+FoyMHa42rC4lXkk8Mdl9mW1bkcKG7+OD+8htW2peb/MuZls2BdRWRzv/tExGi
	lRjwhbJuClPqvZ
X-Received: by 2002:a05:622a:354:b0:507:3ee:23be with SMTP id d75a77b69052e-508db25dc3fmr65562091cf.9.1772704115068;
        Thu, 05 Mar 2026 01:48:35 -0800 (PST)
X-Received: by 2002:a05:622a:354:b0:507:3ee:23be with SMTP id d75a77b69052e-508db25dc3fmr65561781cf.9.1772704114585;
        Thu, 05 Mar 2026 01:48:34 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5074496300fsm177126211cf.2.2026.03.05.01.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:48:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 17:48:12 +0800
Subject: [PATCH v6 1/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-sm6150_evk-v6-1-38ce4360d5e0@oss.qualcomm.com>
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772704098; l=1336;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=i6izUJviyArX46Sxz3psV8CYflgOEvKVmFWmHyN2UJg=;
 b=61XRv9AhrNpd1bojD8c5P7j8kwKYTzIdkkCrl5q3FdMqWSZvfOltv2e354lZ5/0tJ6DNK/Xby
 xvWi93boORvDrN4S40rT/4FyP90rUd7qmkTAai4hPS2SHvehiAcgs0z
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: 7ZJDhr4hhCVcroYeE2b20-BkHqX0yzLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3OCBTYWx0ZWRfX9ALpzfVTC0mn
 /ZJwPdyf++vKcYzoGKsDGakPFa3web0ULBGx8/BD0vyRO5m+yxmw2GzgnU5WmG9cT7/gPwscfuL
 liq0zcXX1xmk0EBaF1azXx+vVNf5D7LfN/1wLP6/SUjbmwz7l1DyY+o8IwxElLd/h2/TvOLHuxf
 47v8uH3Y4PZ7XIe3SDHm6BiKlZC+39aQe8hFeLuJAOJczK7MXQqDWGqzWkEZj5R7Ff3j19Ds2st
 ICe8CwjxWdrpVzY2Yx/VsnbGZZ+NICqjcsLepb88hRTe9OIQyjGf6Sa+8+aGS+WJZXTmFQGrWbp
 pex5DkmmwjQLOF6gR26SZMM5Mpd6IRCPBODHlinp9MSXJ/n28UhQd92mDkkvx8uqum2xBqod3n0
 +l3wAbjV5rcDk839KEEQoZaaD8aD0WRKno+WzD+j979BP7Iimjm8bnBHU/U1jcseW2ixavlne9a
 NAxeefybKiqd7uu2IMw==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a95173 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UHGjisO4C0SBheCDbiIA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7ZJDhr4hhCVcroYeE2b20-BkHqX0yzLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050078
X-Rspamd-Queue-Id: 095FD20F0FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95568-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,linaro.org,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenmeng.liu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the sm6150 CCI device string compatible.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 399a09409e071b7caad8df7fb831c429a8bc7750..35d3a0685ac4468d49e68621d0359dea1988cbcb 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -34,6 +34,7 @@ properties:
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
               - qcom,sdm845-cci
+              - qcom,sm6150-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
@@ -251,6 +252,7 @@ allOf:
           contains:
             enum:
               - qcom,sa8775p-cci
+              - qcom,sm6150-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
               - qcom,x1e80100-cci

-- 
2.34.1


