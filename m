Return-Path: <linux-arm-msm+bounces-95135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIS6OTLepmnRXwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:12:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FF11EFFCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 14:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF8F830ED527
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 13:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4054423143;
	Tue,  3 Mar 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7XCzeqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OntZ8SrP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485E6423A72
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543293; cv=none; b=EpdSgbFnJ9zbT6ANYn0yA5rwJ+E2aUkOJyg2Zobk53Un8uZHomg5fwm5ikoP11bqY/lJx3DQ9KYQrjvOcsoIxQ5p0UXqjlyBr9hisqwQj92fePDu2JW6EUwnC9CPpcwl8MPGHi0jZwsY6Fmm1XxDQuXQU3x8WHL81pBE2oxVGDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543293; c=relaxed/simple;
	bh=MdsedeCf4ANTTpubxrkwpqg4SHUnRXKuJ1I5Fc7YjgQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSlpJWELW/XwEkIjDyQv0C9yQgEfj53XcfiQe1DlDVVbvleaLGBid42HP4buapYDnZdXzB8J+VtFA1/h+e3xvT0/1PUjBP6aHfMZRk3kz0tqXZdJIZLg33+YYXl7tLcBqNbS/q2ooeg9nAMMlQD6C1vHjArtKqw0sEiDERkN2r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7XCzeqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OntZ8SrP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mrwK3099626
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 13:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BWoXrEUOgffNZCGymGM7rHpUv9l00RibqBXKK49/ffM=; b=M7XCzeqrVKDZ7ZUi
	pRjwXV+Sa6fONy6BDmsT4yghRKyn+Wm9SXJ2TlTEbaqcJulo4CIJX5CesrAoQuvn
	pEmFhs4kDWMxBoRzaA/2tSh0hcgRBe7sPmR+HB4E943xXza0SPglRDpxcW5RTa52
	NF5hskPpX/3QfkjD2c5c9hdGx7CTI5+vQgvLt9eBoRcz9TOS0VIN+vEpl3iffmI7
	kM5fmXoEbhTtozel8lVd9DMPPF+YKwo5VXg1ywYclO4nn+x5y5DG9ufUe9nKO76g
	sQoYP7wY6doywZqAOE6NNXrlZz83MfGhg/rTNlXyhZmvKmb8Lxdget+MJyqqeafH
	f7l0kg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu0y6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 13:08:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3d11b913so3820850585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 05:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772543291; x=1773148091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWoXrEUOgffNZCGymGM7rHpUv9l00RibqBXKK49/ffM=;
        b=OntZ8SrPDQPoyLKxx4ffmV0I3BtoaW5+GpdDPBy5DZR1hJHuI5Y2hgqCufoN6cVQTL
         kaB8L6IYtnd2d+ZolO4gEwqq9WFyKLQQS1LOofQ/uv+4sbZjL/lJTlRATZ1VVl+BJbfI
         MgwyehhF1Q92Q+9AbU+EohTJ6wBdRNnImrXBkadtv+RXRsG0iLJrAsYD8WXHAYfxbiHF
         OjuD091oc7lHrOgewF96tB1k2QE+lcaTNQ1vyxNfRcS0WpcvHFpZd9ESz+Woqc1NLhnm
         u/k6VcCOehX7qE2ZOY7EhL9lnDfFqC26SKfV4laXMXTQh8KyobSGVyNcGSZtAbFvrW+z
         L9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543291; x=1773148091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BWoXrEUOgffNZCGymGM7rHpUv9l00RibqBXKK49/ffM=;
        b=nDLuGsoMuCf4PvwOYt6D+8Pl0QWGa8hn30XUcqH9qDNn63fB8zd5tYx5ZJdg6ge0x4
         enHd3i/Ade0w4pcITc43zwom+hyC3AMAK3T9cnLyZDuon4lgApw4I98iwcyLW7rpz7O3
         YvKkW/0z95YVZdmCZTnmLpwmECc7DvFpzP+eKs7XqcIzoS4yn0cc3vX1XOzYBGJS7aBd
         0yjPqlU0DnrU1gj5PZjEwjOI/kySuAVp5I3pMchPLuP72Pzlg+jGv6RgUoDS1IgbGvir
         EwsWFxtrMPqsBsggR4qvROZqySofUA4oMyKWQT+BDo5p2xq9IPDL/9TOfss4OmvZUryO
         exOg==
X-Gm-Message-State: AOJu0Yw2/ZJdEU3HNLDcXKOIzw5FeQtmqcH9dIYrMHsDG03ZeStaZUf/
	1oOFAuejTVPvyCvRLjs9xyGmjxQKUm568MCrDWo9ruVqeTNAGqfiXcp/DdodpS4x6Jlr2A55KFg
	bUqMfadMNpXeC6lwAzO3NWc/NxLJWskubPCMiIVwhXI8eNQzW+pnj26c0Atp5rUSMet/O
X-Gm-Gg: ATEYQzyd4yqYo58QE1LyS38SC9CebNrr8+HtUY7PB7/lUC3HSYn+FWVF7uY8zfwEOjy
	dZ2k3XquafenWbaf9AGnhu9HIIbhUT7Uut6zoJI0yGmo7pSDG7cqT8TU1lgOTHk6OmfVnD90a6l
	x0DeE5Lv04wqppfuH66OPeHBtqLd88E6YIpQmqA8dypqkE10FQu8GwoC1GIXLuzdCG0RGT9PCB4
	KLOP/7bxfJXYbfCaE4nKYUWlqFoV1whJXxSmCXw5XWTpXq1yPgZkMSNBLV/DGKZXhvAzSvEGkUm
	XPuENeznWDv4tn3D4tCy1mZeFSZ0Imr6AZx1vJUQ7GhdOPEv+HArfwKB0E3Ik0fQEoDUy0jHhvx
	UXze/RK3f198VyEPUFUpSYghgMXGL/g8Yq35lJvCmsebM
X-Received: by 2002:a05:620a:28d6:b0:8cb:8150:b1cd with SMTP id af79cd13be357-8cbc8deb9bcmr1945424685a.26.1772543290620;
        Tue, 03 Mar 2026 05:08:10 -0800 (PST)
X-Received: by 2002:a05:620a:28d6:b0:8cb:8150:b1cd with SMTP id af79cd13be357-8cbc8deb9bcmr1945420685a.26.1772543290205;
        Tue, 03 Mar 2026 05:08:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485126563ddsm26253495e9.3.2026.03.03.05.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:08:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 03 Mar 2026 14:07:51 +0100
Subject: [PATCH 1/8] dt-bindings: display/msm: dp-controller: Add Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-drm-display-eliza-v1-1-814121dbb2bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MdsedeCf4ANTTpubxrkwpqg4SHUnRXKuJ1I5Fc7YjgQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppt0rzejX/Cug8m6PVKm1rzybqpY6fqV2lhCb0
 3TkSGo3lVeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaabdKwAKCRDBN2bmhouD
 1y+dD/4un7OMCcTu3QHr5l/jJdFsc1HyQAgMZv4qD1NgwZqQ9qxSLZL14G9s1UEplEoxSWu3whz
 a62IAGLKHRxJdrGhst7g9wHZVS3DlXVaJW0t0RmAG1xYQZUWrV5HwvDZY/AgTgqWtb98XuTQkyE
 tdNor973fkzRYprhHiaV6VnxZ7UJ2rZc5EZLfzMWyVQ1YfETU4eOEeaW9aRjVc4I58RWahNysLp
 OCAvbKgdSAvk5CFf2gtuUp6aB/XutUCeoDz4Vf5OeLcYYs1qT+p9VANB82cf4Jg0vLr0AvrD9VM
 Lk6MBPAO3UkzVQNUdyFUKD3j1cCP501bw389NpigPfZNU+IwPpw1Xn+XJYcKHzU6LtjtaYQSS6U
 dJ3e5oG2fRdmX456JVPRnHC+pB8zAbNfXhMaVubhN2VVakwNJ/7SVtAX2op335xrpPg4vefonsT
 TYHRNlKQdacgQG6JVqoRcp0vmn4uIOwaFCOqhO7zFgl8Y5VyMT+j9BeOf2duHQ99kq9mmlhZGlb
 LrbcpN5pueTzIe4Gy+3Dj3XQNbZDCzqZpcZPtbnK7XsNxx5TqjmfcK3cxT3uuOdqFINUS0zAcrY
 Q8/hsctpyHRK5N2igQmL7hv3YlgRTLtnHgqm5KZnWl+7cnQPydv/QB7RqcuOSIqBqL6vtVKIo6d
 nlzyC0eHfYmSKkQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a6dd3b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=X0BVKsNMwB65LJnTjtcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: fQOSohdByUbS87fb-asyt9qXq7u_zaCb
X-Proofpoint-ORIG-GUID: fQOSohdByUbS87fb-asyt9qXq7u_zaCb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwMyBTYWx0ZWRfX32iEYvehtvhX
 fYOi5umIqx+AePooUPHH4DMbLR6AqWy2KWpjoOcAc/wktiXR8eFuOoGaKADrZQtRqinLemGvAyr
 k67aYc64Nqtl1cWN9kyA6WeLznkXXycql0PwTtbm+gwUMQv/NvGsS0Wtm3zD68hDCoOJuwUw+7s
 j8ae+/X9SwQn6l75Wwg3mK/z/DypBv/GD1w+powuptmj0ZqdV+heGtlloeInZffizFNY8NrUX8/
 JLL2X/q9dEPuVjUhh/4cQyhj4ktMBi7cv8wF3WejER5celJnf6x/9Pf/1C2zlb0CggrQe2QOCNa
 9S5302yXmqF4n100EdJ9E1Kag1WsNecMerPcqHFg2MmIR20mNlql/Yse0dLkxebn5vDDvY4ki6e
 0qyDiVTmfhHqdiK7m1kbKeTENJKEoIQVGx/jcjLNcmt6mTikdhWvoXhXSpqmazq4AHk5mQfRNL8
 YBo5y6rgtA91HmdZLEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030103
X-Rspamd-Queue-Id: 95FF11EFFCE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95135-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

Add DisplayPort controller for Qualcomm Eliza SoC fully compatible with
SM8650.  The device looks very similar to SM8750 (same DP TX block
v1.5.1) but with few differences:
 - Eliza and SM8650 use DP PHY 4nm v7.0, SM8750 uses 3nm v8.0,
 - No MST (according to downstream sources).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


