Return-Path: <linux-arm-msm+bounces-95134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPk2HR3epmnRXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:11:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C09111EFF9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A84303BB06
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:08:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE8FD374E7C;
	Tue,  3 Mar 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pe07HqQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iX/jgcRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9632231F99D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543290; cv=none; b=ZDdcaDynW/cQ5oUcpR3t/Rj39P+kLQrsmoxuaWrXnBhm2GkPGCZn6fMv8a/pPkVTwSELFP/ughp5YDwbCGb/sIp9B7tHz553pA3MXOaVS7pqOLOtk4FSWXU6pKCUfeqNYUYDoLpnF9w0A4IxH/zbyi9BfzbjCHENtc0OmGW7Z5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543290; c=relaxed/simple;
	bh=P0K3emV+On7DoMLPrHK64H4lAgpvQAJ3yzHS2N5UrHQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dd2WzS+coDBniw3dkxvqYweloC7pIwX8P4agRmgEqPCwnuGEL3V4J03BwEAAR+hAVl+X15jGrjhwHbJUfLfTlGaX8JbX+zfzzOgTui4tY+MQNkE8vIcy9QlX9O5C90QuTCAvRsE1LJkx6s1V1Ld4qCaii3BuYFLmsdSZQonM3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pe07HqQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iX/jgcRE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nG363349588
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g4Kutmg5lRIANp4+yyxijt
	cO0qKcnRuRjkj0Wl0IrvI=; b=pe07HqQNa2UciCKY6LghMPMSdwbYSjmFbdnEz5
	ill21V6mOVAbhi8ZlmYPEgZd1FX5Bpa3SQLh9OjQsCxjeEdG3xwRAd5rgzIegGK6
	ID3YJLh4wa5fuc/JK9ItWSozAyFUzS6obtnEComx1KvqHHEo/XwRpmk7dW7Qmz46
	+6jySpyqu9TXvlxOPdXyeUNL1ItuhkFtnCcML4IM+2HxJIEHDrfF0dirXxt0gKna
	9hkWczeypoNHMGvDmb6g4fy+Yai461w9356CRI0eW49uVJwTYrZT0KLQrk6pHPJl
	UjZ53WlXLXAXjS7W4xwIx9KPGaFWQLhtVCyF8MzCNBqsU3TA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsauhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:08:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-896f84e69b6so714301076d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543288; x=1773148088; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g4Kutmg5lRIANp4+yyxijtcO0qKcnRuRjkj0Wl0IrvI=;
        b=iX/jgcREskqGSUrY7nhmCbja047h40ImGZe4FsTGt+VqpAO45NOrzNKii47Th9r8++
         q02bjADXonBFQXSTsgWGNRnowxeVlfyls/CK/cb2IU8TGv5aPOlh9KPMSNk4Q/WzUQYX
         TcVfZlMGGQOXTXCkCnvSyUzreLdLmudmYkafckPvVXT1huwU5AXt4bJrJhophBadln7q
         xCWfxm0loiv2GxuK3EWOyvyLmTrvDguH/yOQAtSL5x2ihh6GeJZEgAt389r5FxK6PJBU
         4G6BVFhd5Q4p3GYhWJJmBxzEtFmeyNMRk8Q2VuWeajFOc4/Qq3vGygyTCV58ZO7JI3SW
         4bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543288; x=1773148088;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4Kutmg5lRIANp4+yyxijtcO0qKcnRuRjkj0Wl0IrvI=;
        b=jwjgL6g32fsXm+QgMDjUrFhISHr3EfFgb03bY7RSVx6KX6dTVCV+SQwFpLZEGFKy8p
         70k9pFB5Udx5kaPJtfzPdxXhX5GZlaADd/arQ0RjCiwmJwCnK+nGp9oweGFNSBB6p3zE
         1TqyrPT0E4L6gn6b69LPM+bFmdeJo+bWGVkm/87PFjCRO0Bc3kDGKZs4V3Q99GMjIUV2
         3zeXtKEEIiqlk52I6TPQdqB2QE9rTuCS4c3Uy5ugurTw/2lRaDUsDw4ifwQGgjQDOTYT
         Ahyov2ULl0U1KwJxq+qo+Nd7DJWI5LoweHOZxBCaX4/HsDhh/QVh0fBMFuoREm0GVUR9
         ZTKg==
X-Gm-Message-State: AOJu0YzONeQ5bcLTQlil/8+D60DQvZxiQUaIg3RCFc5tPLUkKoflmZJt
	QJyrZj/3BWlhFM1t5RA4X+VNLp8z2MHflOpjdYy1ual5cqj+QRuAEPVp+na3wXIBdUQ2JVW8SmR
	/J2uRt3iulT5WnUEfzNs2RvEmn3HJbpgg/IlqvFP6B9DVkwD0zWh+Do348HGwifdpumvI
X-Gm-Gg: ATEYQzyuno26hCRXWHgPxADVYXfl52cMfYtTfIGp5Mjwb65lQauwwNXkALZE7oW0tEw
	7OmzoJqiZbW6jKvyQFzw2qclxEksEelOO/Bh3C/PmBlS3SF370L2PbQydba0er3xIvqaCtild4/
	j3Gu5jlUV4jSHDapVYzp68lkvS2CeI5exs6W+hLqMhJknz8o4ZPjHFUrwdBSkh1b5Ks4tPlFckA
	uxkyspS7KxvyZU0OT/96+7eDVVfeK/8LuplLsvH0BcatqbFWzXO3UIALbm/gb5bwSyKGDJihKoA
	3sYJ97VJDn7WN2fUOC3DY+2UYXwnn4tdAqOmLRbTyz9K2l5KatTCCNJ7E6g1GY5O7MUaqYSmBxc
	6xPLFFrm3CQSDK9MEfEsG9BbDB8Xsh7ojcA0JBLL1kkNt
X-Received: by 2002:a05:620a:2947:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cbc8dee816mr2008930685a.26.1772543287647;
        Tue, 03 Mar 2026 05:08:07 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cbc8dee816mr2008926785a.26.1772543287151;
        Tue, 03 Mar 2026 05:08:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:08:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/8] drm/msm: Add Qualcomm Eliza SoC support
Date: Tue, 03 Mar 2026 14:07:50 +0100
Message-Id: <20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACbdpmkC/x3MTQqAIBBA4avIrBvwJ4K6SrQQnWqgTBSiku6et
 PwW7xXIlJgyDKJAopMzH6FCNQLcasNCyL4atNSdNFKjTzt6znGzN9LGj8XOtLNXzjjVG6hdTDT
 z9T/H6X0/h6HS9mMAAAA=
X-Change-ID: 20260302-drm-display-eliza-634fd1c3c193
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1678;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P0K3emV+On7DoMLPrHK64H4lAgpvQAJ3yzHS2N5UrHQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0ofAEfP+L1dNySRo+06D2fL14cpcc+HF1HZ
 Iq0dJpSQZiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdKAAKCRDBN2bmhouD
 18ujEACNIKsAtfofeHyTp1tCc1koMc+t8CwDIQTfCHrORdq6AJ9xs6ec9xWTlp7VB+ubXXWsHDF
 g/nJrLwcVfKpMu0KQrpMZPGHh6zzczwwydnLX93ES0tYn/0OgSxpadqmdsz8jXl+MwNAmEN64oM
 Er3L0a7RTSjy8GeiUOfOMVloB2M1e9sl6AY2mEkLLtjKsRXHzem19Y16gZ7a/nOb0ZNmM/og5Y6
 32kJT34pXKLSTj116HCBAqfOnO4c26nq9uevmiBjq+ZLEduQS7roZFaNpZxcIi168SZbN7b5i9z
 iifhMWlOI2TDMeHJfLLZywUttqh2UtkitXlg894ZAlfOzYRHSr5wf9lWrGjMh6/b4j0R/azBPIm
 v6KhDroIAXwnV4+LvGyZbD1HPC21aZFz+SNHK0SgeG8Bm1q2RkpxefYoYnJ4MDt/lYoz+jYxwlw
 NYrUuXvTE50XT4J6nYaVbBqZVYDONMiDVM+4tlFQ3TByCGe+wbSWC3ByW5wHJ2QudPsrkamWwBR
 icifpQOZ1xEs3se132RFcIVpbe3RON9kHvdbVCIOkhXu78lW3lFUQ+WUlakRTi9veWizXmjD7wZ
 mV3yb4gF4GCXwCM3mMYPzk94gZgq1EiSSFz3fANls5g+FzVtjXSnO+mfXGVOusnhoKnKS3SxfBO
 7GK+4berNVPUaZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: FARgLTbPcKoC3edX1yK95jfvkMIF1sb5
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6dd38 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ji9SQXcMXxRat5kPLT8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: FARgLTbPcKoC3edX1yK95jfvkMIF1sb5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX1LdRFjrRjyfI
 CxKcKW/INwNYin2bct0bgekfcJ0pBmndn1fZj2fU4s2LTN/S0VIhELXliyTy5ihxdWEti9HERIk
 FPURN2AOr2oDU/HtQwyVSRFtiJMDIKVFUfNjZp+safgaVqQfvu6drC3Gp60tO9y+tIp4Ke6qDZM
 lA59+EsXZDAd8dDb9ExG2ZeVPHSiG5494GO4m5OI0PsQ+VAySMuXrTeSZOg4DIgeQqOMaQp89ba
 /JDJ8wHFSOf3jx6ziTYBr8g9vW+hw6qoiw02ko2LHcdzG/4kkw0cOHZuVhoBVrwgAnHEz/OJr2u
 CcyYsxAC/VDVaAnde1FUhMiGzj1EkxfyAGnj9wDdKe/xlZu7R2LjWQq0g5Nl/IkLCI/r9Q9Mt5l
 J99g7BvmodE3oBIIgC+OYZ5482Pz3RLnXQwdeC2lV52lnwfGvqQblrk82ZAij8IJZxB24nhfaGo
 zhaebKDF8ASoMjFZCzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030103
X-Rspamd-Queue-Id: C09111EFF9A
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
	TAGGED_FROM(0.00)[bounces-95134-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The MDSS on Eliza SoC is evolution of one in SM8750, with several blocks
removed and added HDMI.

This posting brings working and tested DSI panel, while DP on USB was
not yet tested and HDMI was not prepared.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      dt-bindings: display/msm: dp-controller: Add Eliza SoC
      dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
      dt-bindings: display/msm: dsi-controller-main: Add Eliza SoC
      dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza SoC
      dt-bindings: display/msm: qcom,eliza-mdss: Add Eliza SoC
      soc: qcom: ubwc: Add configuration Eliza SoC
      drm/msm/dpu: Add support for Eliza SoC
      drm/msm/mdss: Add support for Eliza SoC

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   4 +
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 496 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 11 files changed, 876 insertions(+)
---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260302-drm-display-eliza-634fd1c3c193

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


