Return-Path: <linux-arm-msm+bounces-95307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLaEMUItqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:01:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CD11FFFB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB059312330F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 12:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DB113D638;
	Wed,  4 Mar 2026 12:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuZW4Bdk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tec7qGgv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BE623B638
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629157; cv=none; b=As17Gi0k0bzo0AyqxxJThnjfdNdjlTY1MeLOiNnO+6Ink3CX3i2IbFG2n6yWoDOIHEeq0hGVW/IzEfDkR0F2x14Y2GfmeMJzWPtMMhMSBcUbniJXeAaQ1wSWy/GoFGcneuOE3pxoOJFzUkGiUu8f9wsjSl7/sUpNcLECjkFq9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629157; c=relaxed/simple;
	bh=A0isBPfvtv19/rZF96jjkXvuTjw3cs72aAEpUz1TX/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wg6gjyJ3Z/cP36d0E6rN5RAijXCzyrizL5otJsXq06Rs62e2piP/y/iefAlEfGSosiHNs5P57nNUxfv8fLu18/q+RULQ/mpYOo+MIcVrIfo8jKlmOIQLXHtkYM+i2DgMIqMO4zm5OvrlhTBR0MLek7E2711EyiA7vlBWit2mXHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuZW4Bdk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tec7qGgv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CAYXb1678164
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 12:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ixwUNY3FhPaLn0RIA0x6OgA9msiCTyxEpi5p5oX17h0=; b=WuZW4BdkRexaYpNV
	P+EENcPl7dwLMtle/8EhyG0s+YqpZeqwHv48Z1c+YYBoqOJeC1fMCxg1XiBxjlBI
	CX7Q25qs7OLIM3f/MLCp35fiPoWw+Sk7m/q7grmtuoX8OdZhKMHhiw0FQFJNx7N/
	1qCEu1p8ISCl8xhAE2gEaSiyvxlfTFVgKopitM138EeyWEdmNKKngkMlmD/qpZTh
	sonmODZj0M23AZ9L3UoLYljYlu54kbMskRQHvhGIeb3+IEypo3L6TMkuclq8Zuiu
	64aSCtslbiHUcRV4O/ZcfXsg3mkhlFjiachs4kyQzmuoxquoD2MFPoB06+raT1n/
	DolPow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73have9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 12:59:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3a2eb984so4871006585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629155; x=1773233955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixwUNY3FhPaLn0RIA0x6OgA9msiCTyxEpi5p5oX17h0=;
        b=Tec7qGgvKpjnTl8zAmuavLpncTa+KLw3h0Wx5ZpLIobNXJNy8hUwyaClV6Pv4CFkrR
         fZXbzLCihtXSISoweHFI07hBPww/W3Kgl5UU0xNFWvJ+YpuaxLSwCB6rPaj8/AxOcNvE
         6WEmkJ0C+CHen2vsDXOHAtX661QCvlK2Qhdb14at59bgg6goSnmtbas+qUkoiBzxlmf5
         hs0fNHmXGwviMH0jOCIgKc+znaJJ3WhRLuMozHeSpBvwu5V9sxTyu25cpR7KQUp0WcoF
         xXWJJOxyGJbt5KJOgBFCtukkdhxAfePZahrWco8mZt3vhtVXacMH05bxJDn/4X6BlHp3
         i4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629155; x=1773233955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ixwUNY3FhPaLn0RIA0x6OgA9msiCTyxEpi5p5oX17h0=;
        b=TOnwCriMxoMfTLjvXOG1tBXcVWuL6ddQUF2Dsja1v4p8p2Lwd2OUoC3n3Tjjne/feZ
         0oAw9STSlDjWSexzM7BGuCvyuVObZsGucPmY15F+/PKkIKsw6d0fn1hvtZGwXtArmfC3
         5+I/0luPVBgKvgSySvf+Ov1j8r4gJaXSrDCpeaSpmIYjaWNERHKYTqsDEj1+AIWsM7ok
         ps4yd7Xz8cZjDsYrHABBfTsG9BlCsa2D4jE2ib5Q2YMHCEGQb+8qdXJXDxzw4q12HLf2
         gVuOPlVfxcEdO2OT7fJ6yKoBNsc1AQ5fYUmyaoYBZHDgLYCnYxSoB/4EXcYjC3APwVfH
         C7Xg==
X-Gm-Message-State: AOJu0YyGaNn5Ht55d5MZz4JzUxQjvh5YSiuT5vKdUuV10/AbOa2j/mg0
	24+mwfZYtlt3p5Z1NXj+ElWK7VJVxnj0UUdGup7H6Qea4H4HjuwaVx2LecGgdgC8j97FHkUythS
	fx5v1OWrp4u7r1WfJvri0pe0mePyw9DQs9155MLH8svBAH85j5zWCz5oxxXrCAJeh19KR
X-Gm-Gg: ATEYQzwx2s/6Z3rycGznVJlwKZ0xyCTeFwSUgqb+AsjH7KVJGMgXbNuZ9EaOCtX4bsI
	kYtwcO9VEMZS/ToTWvuiFlyJ08QFGwOSfEbvDFtYJGTjFZwPtp84x+2SiT4vrgpSKJUXZLG6n/n
	iasgjg5ogt05j5uFP66kbbxDM5vRx5yziUKjhmYsZx1rUfxmvolMn0BZLn/RWXB5l85afk850z7
	N3H4PES/VnXpLmvPoSr3Zd3mXvXU0DzmAdj9v/hoNWUf9T2LcOKMZUGiVeJFuYPJYWRyOdLEPH3
	DZsCR/SnHysg0KX2L6Z4UPIyNIPGeJkDX6cWtj8XgohpqbK2ILS51zmM1E0SoC6IycNFLlIRZ/m
	I4yEs7PI8pDVHQMaSP+zQBnVD7nZh4QaY4b9ikv5zje+i
X-Received: by 2002:a05:620a:690f:b0:8c5:2d4c:4f0e with SMTP id af79cd13be357-8cd5aefb869mr209345885a.25.1772629154881;
        Wed, 04 Mar 2026 04:59:14 -0800 (PST)
X-Received: by 2002:a05:620a:690f:b0:8c5:2d4c:4f0e with SMTP id af79cd13be357-8cd5aefb869mr209343885a.25.1772629154510;
        Wed, 04 Mar 2026 04:59:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:59:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:48 +0100
Subject: [PATCH v2 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
In-Reply-To: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A0isBPfvtv19/rZF96jjkXvuTjw3cs72aAEpUz1TX/g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyPA7rdAeJeKkp3B2oG0OtmhA3bWB1CytGVM
 MPyrhLeajqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsjwAKCRDBN2bmhouD
 1zXED/sH4ElI088Uuw9/j1e01n/LV0h8NX6F4MbebFIP11rTOcoqlpwyBQ+jui/P6Kp74V3q420
 lyBv7olmR5rX0vqOv2oe3Bb5ecafcbdTU+n6WWKNqrKxpPfz629IikyO0nmK4Uweqgn21ZTpMm5
 5d1BsIexofV70PghYwAgK1o7H8h2FpQqLfGnfH0R++MPczNV6nRjYhq7p8tzGE806DBNlv9gs1N
 RPyRS+Ou4WqrclwhfXxyRFPtGobqGW19V+QYUay6d6zff34icNfFW6XTc+7DrpvbLD5amClDSch
 UcigbuPTVAAkxQcniS7oPWUVSdfrCqqomtMMheoSTUr0waL6yypLRr5mxJRgww39xm8kYW0Irig
 pe625vKqz7RTzDvv40d1vygKar5Cb9K5DK2LybipbO0fUAMHGc7WCmTc/HkrKOBhIMLuYxc79bP
 nDNjPurNiM8mbclG13jGhqAn57xznsg5YhItI9MCvJjCQmPILrP6ihllk0AR8m/DchkALlo8W4m
 5+9J0KvU0Y18ymxnkD0qbdl5Zex09dw1/4oZV5tWJ7kilCsK3oJZaaaAgq1K50VglqqVS+NYO+0
 eBu7IObwEekKMclLEaxM7cecu6Se+IL7Z0LfgO0ddXsWFlGrIdBuJJa3C18UOEKhqyjXoN4u4yQ
 QUz34oqo13KAA2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: R1lXgunZABpgHg-5_H9MZoC3W-QHQTTW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX0RuIDn45sMgw
 sGMqisQLNzj/AvRauK8oQo1l6SgvT27ilQAw6hx49uSvVWFjNLkiu8LXcymlrhL2bwi8hMh/Yeg
 WFbZg3n0F+vzr054ZZ0cRfPBpz35tlSNANcr5ETWO2QgQRq2KYoSulUOW/gHX8FxNI1gnNmfGNq
 8rHjgO2KIj0XkoCGy2c3JhM6cdHj82CpoGf7KrKXWe8nZklN2Vxl0V0zebAVCj6TZfSJTxOv2ru
 /temeTSl9cUABthnksIg8wtiJYOYEGK7Qi/2CAbX0Dh66uDyWYeV5P4qysA8s/mrR6PrsqQgakv
 ZtJswHotww93Le+FOvGOwXw2YOtwdI0Mm1lDCvrHj8oPg9xOyNg9Gam+QlBUw91R8c5QeIU3+cH
 VL9DLe0HLidlLkVSfL+Nlkft92XTzS8n9SfZNXNr77+F7c0AQwHTdd9Sxa/IpG/BMZtGbj9hmiw
 0ggF5d+sZz30sb+ANZg==
X-Proofpoint-ORIG-GUID: R1lXgunZABpgHg-5_H9MZoC3W-QHQTTW
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a82ca3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-43RnHntoZIaUBb-iF4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040103
X-Rspamd-Queue-Id: 42CD11FFFB1
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
	TAGGED_FROM(0.00)[bounces-95307-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add configuration data and an entry to OF table for matching the Eliza
SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different
   highest bank bits).
---
 drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 1c25aaf55e52..633d1efa0883 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -16,6 +16,16 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
 	/* no UBWC, no HBB */
 };
 
+static const struct qcom_ubwc_cfg_data eliza_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
+	.highest_bank_bit = 15,
+	.macrotile_mode = true,
+};
+
 static const struct qcom_ubwc_cfg_data kaanapali_data = {
 	.ubwc_enc_version = UBWC_6_0,
 	.ubwc_dec_version = UBWC_6_0,
@@ -245,6 +255,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
 	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
+	{ .compatible = "qcom,eliza", .data = &eliza_data, },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },

-- 
2.51.0


