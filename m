Return-Path: <linux-arm-msm+bounces-93298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APToGHzxlWlTWwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:06:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFA91580FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 18:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5F2C3012CE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 17:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BCC340A41;
	Wed, 18 Feb 2026 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGDmHQ0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJsvkFUi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC3D22D4DC
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434362; cv=none; b=fviRCIRBD/7YgnP9QBhwHP8UELPbAsSUBytZh87crugr980iDKE8TGNLRYwk44GVSCftrNCAHGuPtzuTBjn6foPIQxLu9QFPQrEcsxVM3mtibLomXeo3QYG0ZHjxzULkpT0WQxpbpwm3LI74n+8QzD+Op/kQMZbddJxpBXLlpOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434362; c=relaxed/simple;
	bh=DvdWXdunRSkVA5KCX9rHSsw9oZhlQwqvoB6yqApJjz0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cKrSVQQIwN4ge1VRmtPdQ/nI3tXUCYRCuvgSfPPfzBWX53L0ZsVpwYvEYTcjBFC+9p5MHRz0KtlOMEhPe/VY2ZOrow+zFots2UdLPorcJOwa1IcbGaQV7nxRrQ792i0Ez17sBfYsVC3MWRMidKR4d0dyzWeBaJte17gsx7NdrcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGDmHQ0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJsvkFUi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IF2hYR421595
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1qK9Zb8zZyt0PbpYlMP1Wr
	O+HbhwOeofgpZF3zizBsg=; b=eGDmHQ0pcugp9iIotvrg8TovMEOqfuib5zoHjc
	vIgEkjP2aLM+9sNpjSgO05VUKKEDKhwyi3Amj6qgvvEsXEDaPJ3cg2kFl7Iqib4u
	j+0kg35cTVRqvfS3WOG9UbMEvTbXVQH2b472L0OxnbiTRzOvVHwpJExAk+p2jkHa
	XZLocvOtg5BSe1C2ujyw7+diEBX51l8dnybvIB9jC+2Y26NKW+dCfCTOd1yDQ28g
	OybRLFVnuR6bfmLcn0yNyItdztBhqjtG9f956RzG9TX6ddwq1EiB0g+ODkDLbGcr
	vhW7gHrwu0sjxsgrh4c9rhpBPHhyri9I/lD148k5jaRTWOUg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e1stp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 17:05:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-94ad0ada369so84123241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Feb 2026 09:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771434359; x=1772039159; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qK9Zb8zZyt0PbpYlMP1WrO+HbhwOeofgpZF3zizBsg=;
        b=JJsvkFUiAGONLEjYyt+LKxscp02DXhVGjMhCi+/O1+ktgfl1K9UIVoSbbV7NcodOHI
         Xo791a5E3xMHPkHLtU+2DZxp6g6l8yfQM49F5dAuBWxRP5xZ0mchkG/XP1TJFzSsE72I
         jZ3RWmRU3SP/Qgp3olAXFmZA8+Nd2puHF2LEIw/YyYemHXRVqczvaJkF0ffjfP0m+DVo
         Z1T7hiFKdG7D5Uez7tqYucIkWky2ccvDMOMrf5VjwDPJtwhP49yGB37NmSVpas3HgSFJ
         vSxctPzEkHYL0Bqmitqc4x0e3d6ZDMb1L8nJd80PgqKivEJHs116ONKULZD6VKXvyFS0
         zcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434359; x=1772039159;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qK9Zb8zZyt0PbpYlMP1WrO+HbhwOeofgpZF3zizBsg=;
        b=nwgR8agudbnYbHTAYlM0uqLdYNPhN6R0HJGDt7Vhnui+54mFudaSuWVGq/W9yJ8h+o
         HYL7OddR8jIEUaVMDc6/aS2iNk2qNcoraB5fzJke9Tr7xGjbWkYm51yKoQre/y2HMhd4
         1MjTxkDR1+H57nyqMfiXwme1m/FnNgF2jJoYCUSbaW1g9+oLfTfmTFF6TnnmE2LlISHm
         Cl7HEw3sOM766q5bQ+xNSrww3HxfS+ubnLI/1xhYahf3iw/Mpv9czT3TAnzW09LCzyoP
         sV8uxEGjJIn6GhwXDDKNXYkKOlTHHJJbr28Ec+2O5shUao3PkccAaHCkdFmmhV4kywuD
         DIfQ==
X-Gm-Message-State: AOJu0Yzv3Mrc4sIvsxGeoED879Stf+GBJGG2km8GpeVvJr4gZZ1E0i+D
	A5STKoD56odfkCTmiykXpOjyOHmcxxt24/1CrDO7iNHOV5IRwP3TlqaONiOulIFrhxblALLQv81
	uHyyeiPmnyZ2ohQX29dkVxe7Un89qV6cJDa6HDns/oHM1VceUz91Jb40o0ZyUQorM3nkE
X-Gm-Gg: AZuq6aL57CJ2PIzHAMWKm2yCRKLelhDREKKrXz7kl8NOVp9HbzuiA30tdK+Rdou98Hc
	tGIDxaGgkdCbAhrlIpQjuhlAt+fqKqMB4b9pzeyMIumwsFA8sIH5jZ+rfQ+GwlEz7adnrUKmLIV
	L0b/XdSmuWZMAzHhHD9YjpB7oa4hkIfv+ybVneJOKwF6nANtTCO02XJaSmbA1cDd3TT+fOk0WLZ
	O6HVTcVxmLdsrFcpuv0W2dhQhgMj7PoBOdK7X9vug8vr2vV6OeAGbbrS4v6fL+txqV3AuwN39PT
	N5nUxArutYytS/rPnv9JK+AzefK6psG1DcqX4FMS25DgtPrkEPE9WFRjSxpvZdXsfb5jRKXPlIs
	TjGpys1puNnplUNkwIJbD23kwJZn6siZnSv3aeoGrs4vVqg==
X-Received: by 2002:a05:6102:41a5:b0:5fd:7140:e38b with SMTP id ada2fe7eead31-5fe16f5890dmr6211648137.35.1771434358725;
        Wed, 18 Feb 2026 09:05:58 -0800 (PST)
X-Received: by 2002:a05:6102:41a5:b0:5fd:7140:e38b with SMTP id ada2fe7eead31-5fe16f5890dmr6211627137.35.1771434358195;
        Wed, 18 Feb 2026 09:05:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm482188845e9.4.2026.02.18.09.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:05:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/4] arm64: dts: qcom: sm8750: Enable display
Date: Wed, 18 Feb 2026 18:05:41 +0100
Message-Id: <20260218-sm8750-display-dts-v4-0-1743e9848864@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXxlWkC/33NQQ7CIBAF0KsY1tLAAC268h7GBVJQkrZUpjY2T
 e8uaqILjZtJ/k/m/ZmgS8Eh2a5mktwYMMQuB7leEXs23cnRUOdMgIFiEiTFVleK0Tpg35iJ1gN
 SKStZCSOE957kxz45H25PdH945eQu12wPn/IccIhpeg6P/NH+3Rg5ZbT0RwBrNsoLvWtCZ1IsY
 jqRhzfC2+Ccw08DslFzVVZWaaGBfxniYwAvfxoiG0LrjbEOvGfHXUQsLlfT2Ni2RT7ksCzLHXQ
 Q+5tYAQAA
X-Change-ID: 20250424-sm8750-display-dts-447473a33fff
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DvdWXdunRSkVA5KCX9rHSsw9oZhlQwqvoB6yqApJjz0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplfFqBeizv5azQYn9CTGffHchcCI5s6G94+FH5
 hL2SWc0I82JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZXxagAKCRDBN2bmhouD
 12OVD/9wUHkPymt9cDq6f20WtVF+TTjiu+q2Z+SfB7LbchKK9HMHWR4nx/Jjc4tF42DP839aImD
 CTTDIO8eeH+J12ijpg3vEjOTsxEh61DVyBRDpBpWJHSwhmCngyEYHkGVxXVEelCeR69CYneWkdn
 JGKDPRJZbbUxkYhaM3FnuIvm3AXV+wdXsrZIZsRUS0JZGfLgIjlTkxyAYkVlFWMR6u53YTIHU0D
 KZUiKmLz6K8Kr0DtB5edhHSoPKigkM9s75yNWTKU2+YcDwrqLMMP4ufVzzbH/d7PlXY8gK7joFz
 4LdICBMKqPi0hKGMqdoOmP7JiwSD8fIyULI80eEd9nURIpKocwkYUxbt+MKFX2fqDOEvEbvUDzt
 U0ZgBtU4xN0JRbfRa4oT+HIoCzNb7f8/1jkgtiBxDRLA/GICOQoPuD2j/QCmoo2bfZKSysskivl
 QBrZGQh+9Jczm8oQb6qMPnnQYUErLfa+gWmLEin2kMU+LzT28+DjROEtYEKEX8jW9Pq7FJzNO8G
 sTFo+2bo6y/YCdoXJBchsR4HK/z083BrtsaUvbnCPbI3Td26K9vIjV3dBhXwsEIr05fypWXrYwW
 O81Dv/rusfEKI2Yi+rIpQ09aNqlsoqC8bM6kkZ5GyVEhhgrev8iNCX/FJkdl0kC7cp5K8zb+vDP
 TdUTshRreaSucSg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6995f177 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=9R8VuvqHf2Z2bX_J5xIA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE0NSBTYWx0ZWRfX87pAPodUE9MR
 a1RFQZDiv6uRmACGu/NKsr9Jq053zniFeYwh3DRM/PvlwjMEsG3TgQ4xzryH0WaL3tW6z89DaYv
 0fZGBcv2dtYWGlU2MvY9CeD37X7KdryWUIVXrbH4xhwMN+w6fWp0QALV+cLXRrqLkAMAoYd9ucN
 MjK8OYFt9DQRuKThkpT58p2f4bXk6BCe9eZrONDZJfGNv5/vtLrbZZGQ8bCt4Qw7CkspWnPsX4x
 LNX3VRj33v3QONpyxU18sMrbkl6nltHLUDw9/xLHalrVs38S3WtTSFlQzMXNMkU4BnX5X4uR5dp
 uVsASlGUJ6+R9a+RmL76HkTHp7O1HswTH0KjSh2HEJ4bj9/ihkfScIUZqXGYaOimfJN6S5iakzL
 Ngfdq+twEoaDo3se2d0v2j1U9hMCQBLaAe2U0lj/MmZc4oUDVhwQgUDfatdACnfPXv8hc94pcmv
 daKa29ilBdYgMfd+UJw==
X-Proofpoint-GUID: XwYtQH-mTHPH_8wUgdULlkyLf85_WyGF
X-Proofpoint-ORIG-GUID: XwYtQH-mTHPH_8wUgdULlkyLf85_WyGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180145
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93298-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,msgid.link:url];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CEFA91580FA
X-Rspamd-Action: no action

Changes in v4:
- Add tags, rebase (context changes)
- altmode->accessory mode (Dmitry)
- Drop redundant TE mdp_sync pin state (Dmitry)
- Link to v3: https://patch.msgid.link/20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com

Changes in v3:
- Rebase, add Rb tags
- Patch #3: Add link-frequencies as Konrad Suggested
- Link to v2: https://patch.msgid.link/20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org

Changes in v2:
- Add Rb tags
- Re-order nodes/sort by unit address
- Add low_svs_d1 opps for DSI and DPU
- Add DP Pixel1 clock (they were added to other targets as well, also
  Abel pointed it out)
- Some context changes due to dependency changes/merging
- Link to v1: https://lore.kernel.org/r/20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org

All dependencies, including bindings, were merged, so this can be applied.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
      arm64: dts: qcom: sm8750-mtp: Enable display
      arm64: dts: qcom: sm8750-mtp: Enable USB headset and Type-C accessory mode
      arm64: dts: qcom: sm8750-mtp: Enable DisplayPort over USB

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 122 +++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 439 ++++++++++++++++++++++++++++++++
 2 files changed, 561 insertions(+)
---
base-commit: 9f85da40ef9770dee2039c7f9e5cdb8942920241
change-id: 20250424-sm8750-display-dts-447473a33fff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


