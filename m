Return-Path: <linux-arm-msm+bounces-95302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JcgF7EsqGk+pQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 13:59:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8E1FFF29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 13:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D2C13038AD9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 12:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7802580CF;
	Wed,  4 Mar 2026 12:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4LYzdMD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkSQP9/g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3962242D60
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 12:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629146; cv=none; b=YGDNQ9Bjpfyn8qFNhXHl5I3rjc1Toxmz9tRJlg4Aha1B0ln42xy0m1XR1FUAtoS0SwG9Xh4KlcZ7radbZ4Zt+P6a5sqMW0pXtbdDM8062m92S8uiuWhWZAOkGWOkgmCjzEXXCTNLmfeJQg2iDgNENtlBBKF2+rx9leQByJ3jePU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629146; c=relaxed/simple;
	bh=lue32kb97htDnzVq/E2GGEoAq2EwhaD55U9g6KnE23U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wf0O3BW8VfYuMKLb8MS6KeyDKISON+Y4IMTVODDBDmXMFAztgH3hJX+ngEDueSI7qjPylYAvxbwjXf8lGJtETX2kvNtCvKm5aF6KueHqeq5BTmbfmHBCJDfDU5voMWVyWQllZZW4JQiznoCSUgIWrTrXMJ97dnSMoDn5xp6vYEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4LYzdMD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkSQP9/g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624C5mpx1677945
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 12:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OabsN2NmqUFGX8fMmH1AdpxTEOvN4YrgWGbMnRqiD3k=; b=b4LYzdMDq7KmK7JD
	mJ4uoD/4qP8HQBxIQAiiDYBkYpWxbWZjGm2BCZcnivv3WbhKsxz+xLCx4ziFVxCx
	WWIJqinBMjFsuuIJL7f3x3n+pdBelWhHoEeytl++QlYa2YJFzcnFdFDjI4EjU2rB
	qifXHkWC3xbuvFoXz3j+cAivodv7HM2G7EViFePAuhjVhzPBvnJMwtTi5YiDhOQs
	X5+qIYHoPINlEAS6eo5T90mSZ5qg7Ic3JIrsRyP6FxWriA1X3DQ5khDNI0EXGrat
	v4wZ0Z655i9XcaJOlEYVh92ecclBbsGdDlNi3bJaqiriNu3e3wUeSl79KWT4GpnA
	WlGwSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp73havd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 12:59:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71500f274so717958085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629143; x=1773233943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OabsN2NmqUFGX8fMmH1AdpxTEOvN4YrgWGbMnRqiD3k=;
        b=EkSQP9/gQ2PF5knTCzaFvXQpp6FWXQJoch7yu2ahNSGlqXmgAUpJYEvyk8qWq3z2K8
         2O85RYJ2qQ4NusV27aoQShF82ij0UJ5+dl9jKcQHDfuOkwMOSjl+M8nqJBZVRkmTojV7
         ROfcvd1gARcG6nGUSSr+HCHxM9sibTBa6XChp///HjbNrjvGIXTGiHlXteUNffbDmS/H
         MxZ3JQykrMkH+F/IbB/X5dVQB7kLASdDEck9xXGuQgMVpayNh4VsrJPvXkBZO6J+X6Zh
         5XbJVneB0Zmz3stQC3++eU1WOxxVRuLAo3ns6DTcX9xJUeWQqozqWJHaI/Q91EsQHSuf
         h+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629143; x=1773233943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OabsN2NmqUFGX8fMmH1AdpxTEOvN4YrgWGbMnRqiD3k=;
        b=gCiqeNI46TelL5zOr+8RZt59HDhO7D+CMyY4e6c2KQQjKsXSEVMyReCkTv34Xr/DvE
         HYz27fCWMJTPtwijobUOhbTw+66nLOMq8HKpJyX1PMGNC4yOE4KmU2vhAWhH3xadPwp2
         Hd19uDTGXyTkLqye4x3hGb+7y/Z05WLsgEwSCNo2WUOuqEV4rMpKsa8Ubkh+hjutzNP2
         NKwouI9VDO4a7yC2MXThBBcOIsUalMr5HKwrrlmy1M7VNIWO3T9FpsJmz+N0vNDi8lBw
         tjFpBoWXb/458q/lG8+wgjo5Y/SRT8/AfEBwS/WeNEE70nPVv5LqNItDV4pgnfo2xXAn
         YOTg==
X-Gm-Message-State: AOJu0YzQ0q9pH2VHTp1LsXkEBppOFltKbMgsISjQK/833+d5PYZSmBHt
	NdWF3NhQ1s8+ENtEIUc/ku3uLhHf+y0w17jflNbnCW792L4Gyypzo+TYeDsja7ivCQoUI/MyNHp
	JNYqwRrHfF5TF/PJOt2DGrWo22Km9LvrP646kUOLUhYevmD75eHU04QCEiKbTzBrMFJjF
X-Gm-Gg: ATEYQzzJEbfwHpmz+Dvt8zFONxqgXjsl40SxAmopznM04c3ACK7wDbfKcGwgVZSNVEJ
	Hy9DFHizDbtq0kY0/jgcunml1HzeUh8pZmRFni+WNZ0Omw/ow5TivCdP2iCHv+29fonVkgvV/Ze
	wMxmBP0TdBo8tanv2PC0DncuNGneUww0JMPnuAy2B90/EVAgDL4jQZuWfoaDuHUUiRwv7bI3Lp7
	QdyXlas09z0At5e8CxJAAVEx839wiO7Zq5EkkxHntmOr4IYjo5lxuY7QDkhuviGZay17fgBVkKX
	BEPGfayZ7LaI8cngHoxLTF2R7i5PgkiIcvA9bOjmTzdJEMX1F3UUC5oi0gbK3+Kq6HKd2X0EvdK
	kWimPBJvedE9/oHMSzu5I8Y8KKkH3L7oLrps8yu9Up0WQ
X-Received: by 2002:a05:620a:29d3:b0:8cb:391a:48b2 with SMTP id af79cd13be357-8cd5afd2c35mr207798385a.79.1772629143333;
        Wed, 04 Mar 2026 04:59:03 -0800 (PST)
X-Received: by 2002:a05:620a:29d3:b0:8cb:391a:48b2 with SMTP id af79cd13be357-8cd5afd2c35mr207794385a.79.1772629142835;
        Wed, 04 Mar 2026 04:59:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:59:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:43 +0100
Subject: [PATCH v2 1/8] dt-bindings: display/msm: dp-controller: Add Eliza
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-1-ea0579f62358@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lue32kb97htDnzVq/E2GGEoAq2EwhaD55U9g6KnE23U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyKmtS6NyRnvukSrpsNu7xFG1VLxuuviX8fp
 NgC9TXnwxeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagsigAKCRDBN2bmhouD
 1w2ZD/4oXikB0z5IXKcd3FNLyd+5LId0ySiS2OpckaW10MTDXDHLNrcEjyPd/CqUqz4SnJHgIuj
 NgaWL1K5DRTzeyw1sKsH+2tbFSR0rkkyeKAbQ/MEwojgfhAeNA2hR0MZXCGL5kGzrDZ+jd7HOPu
 6LJT7FViLYkeXyTKKgeY11jSwyU5PbxyEG6bDBdjjDFzufJpUaj+vtsZukfQn0qLcEmqVjBkzWs
 CBk8ICJjtJUdsYDoBHMygN88C5v42CZz/iQ22hpIcY9Y2KEK98hun3mi8+np+s/izYLkRA9yzUZ
 IfIRTse8ynQ/J6vTUfLoieSnnwnrd/yq+IUsTGubVSxjJ9kcTeFxXpGssBGpFiXRTkQZb+Mkumd
 AlchKqkZrJyhn0WsVVX8ebUUJX3VcDeUEkSu6AjEEeaDftc2osJTc4uvDkY1I/3A0exuh+wm41m
 tQRMu75hXNnUg/6s6SKes2kYI+SWRiSiLJEt1uQ5pSycbXsviiTrZMwBQLn/hvM+nNcgMwMOJUK
 QoVjQGkfLTAsQRKI41rDQKGzWtS97aWaNg2X3v5j75UQPyod6Ru+L/qMoeawEJ6Tl7d5qtTAQYj
 tv50dLqeZFVEiOvIpxksYsjkEIBIHxLMpWspLKm0wsCVhlvBYz2DnYnitqqCRmYQZTkbaCp0pYu
 g2EuMsUgd38FNAA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 4WLmuqA8Gd_NAbUrY6e-hKRK0dhAoXKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfX85bi3kJjRAx0
 q/2vk4WMiFO+uiqikQuRC9ilTkf2KBreGT7eUJbhAmLt6Hv/qNCtLMH5CxzR+Q1nPXxNikUBZor
 K8k0OXJaQjLd3Q4UUeB/VOs508+uOEgQmM0MXuSJ/3QslvtOrCoy5NrPVbiGAlHj+xcqfM7SX2s
 cmncbtkm5QMLETx2B7UfRWYhoE7/oVBFs16bamdaJ8X+mWC3HMmZI87FVnknrDt+MmFbkQJzuAN
 b7JXtZPR+wBPRXp9Y+UBiewvPqUDmpouEMPVrYmQHbkiUvgZW82uhIzIcCpHjFh1frd+uCgxhzR
 hLkbajRiGI1/wTr1XBtq7bGpXOrIJgMebthDfBIl972mP4XRvK2HBKN4JbupRMqXGzKM4uQmu7n
 0KH8j+yhFyYizibuAj+6NmW99o+YQs9IPkV1JUsquPRd0cHEKeq7GZztpAuel/30uJCfZMxGTLc
 vRjTRN4teaCmHLIhtpQ==
X-Proofpoint-ORIG-GUID: 4WLmuqA8Gd_NAbUrY6e-hKRK0dhAoXKI
X-Authority-Analysis: v=2.4 cv=BpWQAIX5 c=1 sm=1 tr=0 ts=69a82c98 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=a0c4dxopxCOJUshKGJ0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040103
X-Rspamd-Queue-Id: 64F8E1FFF29
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
	TAGGED_FROM(0.00)[bounces-95302-lists,linux-arm-msm=lfdr.de];
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

Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
SM8650.  The device looks very similar to SM8750 (same DP TX block
v1.5.1) but with a differences in DP PHY: Eliza and SM8650 use DP PHY
4nm v7.0, SM8750 uses 3nm v8.0.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Commit msg
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ebda78db87a6..d06d396df4c0 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -67,6 +67,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-dp
               - qcom,sm8750-dp
           - const: qcom,sm8650-dp
 

-- 
2.51.0


