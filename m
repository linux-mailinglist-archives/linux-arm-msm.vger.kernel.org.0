Return-Path: <linux-arm-msm+bounces-111986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cKVVHQJTJ2pWuwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 01:40:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE63B65B33A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 01:40:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZJb0QwF3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=aYUOb4pD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111986-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111986-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F1BD30427ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 23:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CF23403F5;
	Mon,  8 Jun 2026 23:37:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7AB308F0A
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 23:36:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780961822; cv=none; b=CZSvncd8o8eOf3fLTg4coI/ck8ZxX2fwF0+2xLT0iJpbvXrj1WveUNm1sg/oVV+C4BNuACn0zqcVk8tDPUT3XMvTyiMEaZQrXMKy2mzwJp3DUwAKMLAYIk2X+ANz2pH63LdgzIa1WDJZth/klzEGRuqy9G8n90W0vtNvYwWcXtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780961822; c=relaxed/simple;
	bh=dS1ElGOU/uEK7BuBerHn47h+aj6MzZrnwhNcUiuqfOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fz6ehCtu4hVKMVFOk0Qm12MaEGxmYV/rUITHS7YYNvIdcJMAIB5nbxXojmVOpty+VOt6AnVmsyf5X8GsPOqIXthg7F9P3maYMYEgH4GALyB1hyd6RjOKY3KCMfZ5GyPcOJICMIYFj8kT4ua6l0HMmKJSACo2exvCnNRTZr4XA1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJb0QwF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYUOb4pD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658NE927332598
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 23:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UBrkQRGZcYDhaaq4PZ0t3p+XWTYaSbIMbZWV83bVyyo=; b=ZJb0QwF3hAH7XrK5
	/zmUfib0oTuUCZoyhRvYkgu/gi0MnX91UDY644ag7btA/pZGA2j7AxH94L/IYrD5
	p6V+X66+7dqMy3b2IpKODM6xZ1ZGIJJ5D/5N3fWQBRIZMk8WPgxprvDPzilfCC/V
	NILgh/EXqHfcAP80dbxAY2MK+D1pFDQVUAKLxY8arSMkVoB4Cq4A6tgbLOkjUi5Q
	yl4+MzEXpj5h+gVcZJDlsGTL6lUA69w1CK1ihi9PYJQelo58N5WcEdXTV2/NSKj6
	tkPEDUDtJrHM9lH5uDphP2QfIe18lrPNcPKFsM3W8b7oT/lHxuaAN9NY7wwUVzre
	dU1I9w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx42fd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:36:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so67020055ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780961818; x=1781566618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBrkQRGZcYDhaaq4PZ0t3p+XWTYaSbIMbZWV83bVyyo=;
        b=aYUOb4pDybeMxDmbQyPjneUjHrmoJVeLwEg+py3vkJg8N6fQln3ZGeiPPvPekzive6
         fnDMRuzPOYHJs6EdL8RLBAMqnLlx11yEHHdL7bUrQeBr2wRWm9sX2kGiKrS4yLmG/DCL
         iP3TzV3J9mI2gnmplslM4hUVUBRuEZ49gAe5Kf5/GAB+PLC68U0xnpomsU4kFf68Zta4
         YjsqiY2OUz8IjGg0ZyzlXIpDy5QctqFoGcQKbewypdk1WKgUyXs7hW+Kxs6dOZOdvcMq
         U5pPwtap5txvLZzcwOuHDCmbnHRfHvwhzslAppYjBVXv2Fu8+SFjQ32rYOhJuPeS/g+v
         HOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780961818; x=1781566618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UBrkQRGZcYDhaaq4PZ0t3p+XWTYaSbIMbZWV83bVyyo=;
        b=AZwdln/2wxVJykzXAEi/8F7Czei/3BZD9IbXUe2VXCHmdQRWR/clZlb7XgoMTs2Z5K
         bwfDHjcDuAI+lwxsBHHFIndpxuVxpxFINl3/WUK2EAs5LG2jVFkuAkBzxIs3bp6mP6lY
         6H5h1YJ33hRHHdw6xEMMXyaHzZfVf4zKBgY/Ax6t2ZogV6EGQjQ/18Muv/L+L/nQzW6m
         Ru0Gtj8N9apXH1zknDZXBfxD04Sba6V/Qp6EwwSFVBsCH8HnY6qJl52cz+NZ+znZuePh
         OHKkO4RYQwZU0xr6uSGYWg2fXgifohBX314k4bbUZ3wPVfMUe6F4894Cyy4+s4WQFzsB
         eEXw==
X-Gm-Message-State: AOJu0YzF8MtykkOhpKg3xrcCCXAiKj9RxP3llcipnG8kAvZ2KVpzrVNF
	E4ariYv2zyYw3k4MHLetHvx882ykZTTCrSB/pK6Ez8eN0EIz13M5pOlEEhRO7hrbVEU1RgW9zhz
	YRkRZDmAfSbpWHEPDvmuOnx23IKFBkyRRCF8sNr3/q7PWX9pNYtQHiMCSOWNCwDPoQ5bs
X-Gm-Gg: Acq92OE5vCaCDq8pUOSJnxwuKXNm/ZA3f+NvsPYroSi3yesOZEDa5dq0WIN161NNrQW
	tNl2OaQfZDmLWdXGnijOIfBSnyG8EmZfEtLaXe47JWKrzbw5omcRI/ysqFg3HLMyzUqoYayw8Wy
	ouYYPKtq1txQlsp1mfeAYjWIfx0Dmn2ST8nCfu/ITE8wa0FDt5HtXrf/OCzjMH3r2H5PwQoQbfr
	TRROtu0sQPOY3Mml1MU67xAOYAinijYCKLdMELi4xAlGi3EZMtX8+k+Ij/9fWoH3M8MjDiyNLWZ
	iZu8EQfrhghCSlCBOJY2ferVcxPLzFMMUDC3ePg4mVcFj3sFRQNffMiwRJYEy2DToT8sPBq8tJB
	FZGiOTxJZs4JhBup1Lm4MEuG8qivOI9npRMdKy9x7Y1A4yZ7+06xla9lp
X-Received: by 2002:a17:903:1b44:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2c1e85aef51mr219048385ad.29.1780961818641;
        Mon, 08 Jun 2026 16:36:58 -0700 (PDT)
X-Received: by 2002:a17:903:1b44:b0:2b9:7ad1:bf2b with SMTP id d9443c01a7336-2c1e85aef51mr219047945ad.29.1780961818187;
        Mon, 08 Jun 2026 16:36:58 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8ad7sm66206975ad.42.2026.06.08.16.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 16:36:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 05:06:29 +0530
Subject: [PATCH 1/2] dt-bindings: display/msm/gpu: Add support for A704 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-shikra-gpu-v1-1-9d0e09cab115@oss.qualcomm.com>
References: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
In-Reply-To: <20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780961805; l=846;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=p3O1+oVxykLDP+avfBtT5F2AwxJFis2S4LsUV/Ws0Zk=;
 b=KmVpOd+07fG4xxEEbAy6jMK9euc9ZYNKCadBlM1MTvrQ+bp5f5/mWujTWQruv8ubQ/eSbU1cO
 4yt9peMvMSxDINlXN6z2GwRjuEaUylvOLQ8RbHPlvaws5hOzXufjvVr
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27521b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0BLMfrXV4dllX2mv9u4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: N0jLST5JCC2iYH0SU79c4eBcVZXGHDRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIxNyBTYWx0ZWRfX09jPgR9089/2
 qc4sEU4Melzg+4EfajQzzOYs34satbwWC66NkVUwnvkcY1ZsdfHb9yTXWeDCbp0cbM3wSwsTlHg
 mIXLqcuCdDaXvBjI1QYPepgAU+dV4PdtxNN9VRX1qJCkwbbrNvQ1XkGphLWnZAOGj4iYKjFvK2O
 qaOeUS8DLrJucc2OtUHiB14swtfqh8Vj3yYV9kwrq8PwwAfSxORUnnkjtmr4UklpBJyUbHb9tja
 gHyEFjHdVaQoPN/PYA8wpLcrVagf22fVPl6mfUetx4krLj691uLYcc73TeMDWsd3BJCInqFXDEm
 XP/X2I/gQ2Lfo4uzcq05a1LfOqOWDVgKnWPObJ9qinD2NjDr13NnKj3xyLh/NFooiwYFXhsumyI
 I7t8FXnoxAWu0JQ9u8jp7x/KOjRZ8o1gJw8YH8NueIJ6f8DGNA+7/luf4WRCsr2PAX/5Uh00Sp6
 uq1SfdlXutq4XFYjfQg==
X-Proofpoint-GUID: N0jLST5JCC2iYH0SU79c4eBcVZXGHDRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_06,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080217
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111986-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE63B65B33A

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found Shikra SoC is an IP reuse of A702 GPU with very
minimal changes.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index a40899e5ea58..2308e97f1467 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -357,6 +357,7 @@ allOf:
               - qcom,adreno-610.0
               - qcom,adreno-619.1
               - qcom,adreno-07000200
+              - qcom,adreno-07000400
     then:
       properties:
         clocks:

-- 
2.51.0


