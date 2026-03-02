Return-Path: <linux-arm-msm+bounces-94826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJPcIl5fpWlc+QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94826-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:58:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9241D5D83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C7633014FC0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16884392800;
	Mon,  2 Mar 2026 09:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZvTX/TF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6uVm4ox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CB432D0EE
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445533; cv=none; b=C216L7moVEaYYPGFPpX35GebNoC6qd/f13mpUfqQxCdPAuxcZD4d0Whuq1LlQACRvpkxmXX2Bno+IhgP3MCpZ/P/xIvIu17wNzx3xEW7RMWFsZPCRyuNqmqUZ81RUBvs2NSVc9JjDZJOzge9ZpF6CsbvJilHXUB2U8QtEGanUXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445533; c=relaxed/simple;
	bh=ugiE5l8CcjjtV9Npwf4dBU2Z3sbwAjztE1heu0QvfRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgZ6G9uHVeF5g1vejbaVNRWy+AoobCx+d+ZrQNAOiM7tSPylrZya1FKwCByAlZqCTOyjqop7Wnox9r4H2aYqwTipeTM8OEL8nPnZJK5B5P2GLf0eKK+7DBSotUbkgLuICL9rn3YTba1EpDvOr44TXsPHotbOA53t6Hm+ebVI63A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZvTX/TF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6uVm4ox; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K9mj782994
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AltrQ11Tnt/rvrqxhAxjaejTKOvYKBB8rT6LAMYIOZ0=; b=JZvTX/TFus0PFkgP
	smpqYF0pKuw4Dh9dOB82LfeLNny7gH9hwTq/dgVIR4UVpRC5LcILkwqIU7xpjSCA
	Uf3xCrFDPtC9sQn6rMP961wrgF4zFfWIwI/uuDz+RYzorsLf3ISQsgMmOSEw1gSN
	H16dKGXWfjbmLRmC7Ng6IYMbol8IFJ9uy+9pfQszUztJeeyRu11LaxZniEb/oE3V
	WefihAwI+UEaEYRNdfxKAytPMaImGywifHrU2Vb/3pIwB613StsjIyKPyB1AcF0p
	ao8RXhvua6hIxaqZDsAwvanNgTjeGMQtZkb+Nzk+P3hElWFT5gm0Mf9Nsjr5la0r
	FEao+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u004jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 09:58:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so3746738785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772445530; x=1773050330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AltrQ11Tnt/rvrqxhAxjaejTKOvYKBB8rT6LAMYIOZ0=;
        b=X6uVm4oxlFwVgkc8okCzSqkx6CHhl7YCAoTOVBRkht9zcouEwZTDJ3TKD6WlaN8K3n
         dPUnOnbHilPjucla0bGQAw7l5cBkRVVlvDEbpDkqXg/ext86gI/LkUMA4tjW/JoaTJ4R
         B2RThuOtf4lW6Ljvh1IIg2HJgqGNboa1DNoOw0aF6YuE4E5pRHZnBQ/z3YL9JwLBibhA
         7+kPG5uzkZV4VAHWfdQeIS6HswqZPq+DQd4SOMIp4xeT/H1Se+CLuWWSeS2BHyRO12i8
         sHhUOclOjiGpB5vRSqBtzPRhdwkJQ4i7ThxjrGKQOnBxeuYw5WcRgTuwljVM9HpaFQhs
         bN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445530; x=1773050330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AltrQ11Tnt/rvrqxhAxjaejTKOvYKBB8rT6LAMYIOZ0=;
        b=oUlsW6u+leQOWi2pYjftSV14Z23AmW/4GhA2RuRlA1Wyc+/xy38nG1TdCieOVXmF84
         dWlgNlgZSh1IOObSlfsb4ejx4/vVHHPlWxn7zym6/ZG6GjTgkuF/4SZAU3BDlKhHXXwN
         JRXyy2U1IacGMyJNO6t3Ok/NGSCUlctuw9yy4IIm1nWQ2nFjl5KYiM7gd8/Oak/ZSVbD
         nI2r3rm5bXgjNqiR1hungfYhM0TOGx2QI+gWiTqVLGShO222Fut2OKBm3Sku8C0dIusn
         qV4SdwkE0zoHxL22StXX/I5SNeCfD6957ILFFGRjVXL5sbPp8MXm5a6lnzEtEJ8RFIrQ
         HmRg==
X-Forwarded-Encrypted: i=1; AJvYcCVj2u0Pf5LG4amM6IKazaRaOH/ky4zgjCZsWwGmMjj5ekLjoj0XN6vHcDGPLWfERfz1AumhnLkqUE1harfy@vger.kernel.org
X-Gm-Message-State: AOJu0YzzlMHyzUGtkv01GMaDsCd5I4itDSwcer0VKD9a+LxpTfVhLhUr
	dn0DprpmNPkwe2aHS0lIp7UO5m07CqdcFauTtapVxjeU3V+Urn9fBbt8XwrJepNunTbFHWMKwFJ
	YQz3Esj6xoJh6VIRTa8p4wiLV/TVInZr2l2ycDdFGdYdwslstAAvBTDNQjNmaTqUVMPQ/
X-Gm-Gg: ATEYQzx0h1amofAJCFH1vR2rcEAKCd3xdDByBU+aX60m4G7yy2+FaSVa5CJj83qmUJ1
	qz9XYojwbxeJ6r14HGLArPXitRNchewI7ZuBbd0nShmTkuKljgTPfXA7kO/DFqHqifTeKdHNjUH
	jIXtS180Q5Wcefbcsl8vDNZVlSGPbrtgYDT0GEqT1Do0Rc28nvNqMd8nHJcByAk0Mq48KfxgVHn
	QGl40Yvf2fZiHUtCZRga9Wdb+Q2hi3qHH6GNa7EWW697OlOUMpBR2iXB7EYmfIgQK3F7HOK5kQk
	W7LS8JRpt6WFWmKoxxFN0iwOxmGyGxJjRctfWFZ3Fc+WuveqMUUzRLXWCPDKgIlvUyo3iFHEnvS
	hgAw4Y2QuYZHErm7rWsqZbxTkvbSbaQ==
X-Received: by 2002:a05:620a:470b:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cbbf36a89dmr1665566685a.15.1772445529925;
        Mon, 02 Mar 2026 01:58:49 -0800 (PST)
X-Received: by 2002:a05:620a:470b:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cbbf36a89dmr1665564385a.15.1772445529405;
        Mon, 02 Mar 2026 01:58:49 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b55d15besm9523027f8f.30.2026.03.02.01.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:58:48 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 11:58:35 +0200
Subject: [PATCH v3 1/2] dt-bindings: display: msm: Fix reg ranges and
 clocks on Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-1-8fe49ac1f556@oss.qualcomm.com>
References: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
In-Reply-To: <20260302-glymur-fix-dp-bindings-reg-clocks-v3-0-8fe49ac1f556@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=2058;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ugiE5l8CcjjtV9Npwf4dBU2Z3sbwAjztE1heu0QvfRM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppV9TBAduqk1gcr0xXxNkiQDCYKg8uz16HPzEf
 wewNSqwUUyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVfUwAKCRAbX0TJAJUV
 VillD/9gXbcbldVwFesEX/WpAjC1aiqVjQ7lPDaV9iSKTn+vNs3Vu8SZ2r7tcKaP2PyQexSdrd8
 mrYVW6J3DqEPW14o7tdPhVckKxCPPt9sHOxGf+XSy8jICvBtg3XZtZQfwPI88Sjg7qttvAAqzI+
 E+FzWOlIg1L0JLD2jJq7neufzgWFhrfvu9yyoFzD8V4SxIsd1MdH6WpUYdDeiWNJkbQ51qW91hF
 6G2dvHy++UYb5wcdMC++IqeTVikEgqO/+m55R08uoFfCGtzH3MoYXCW2N6ux8yabUVtM/84RgJs
 wVGsGC9m/ZdU+ITDYRGemhEwTQ3rGgJ8cQbrESGbLy7BwRyPrDdoCeWckWLmX87iJXwY1NLXOgg
 l33eGQkr7WSuQflEU7PAmW9a8eCzLRSRZH5xUQeKd0tTiQTwdRDI1qdY/1cyROjr0XVb4gylPOt
 pDcxSup+yLlTnT/be6+IQFgeGI1pYwjv1BcBaAXA4YW5xqxwpTaP6/SSm6hlwc7ruzSLj8MCIWy
 AwG3TypK46asAnzCYPbVRProLx/iVDYM6nT3hJoOrng5fNgwNE+PzNeaKrk4D2VYHIgajls0kX3
 cPEAAj/+Fy/5yixcFL9nx4VpSmJw0/SjerRjFCZbZI+W62H86Ke1Gs2dhtAt1Hpx3vpvoMZTQoL
 cep0UDwNFCgKuqQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a55f5a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8l7133DT9HzGPwHiDQYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4MiBTYWx0ZWRfX/eV6G99sXhkN
 HpzJ4/s7e7gQncLDwD+oUw4ApH6Ax57a+p7VNg//pKqNhToPv8VS+vk0tCG0imb/38/DQUSf7Z6
 D8Yy/r2JmDTwZBwedBU+jx/yElNYIxfzpSoZfLnwIQ3L337gAoosogfpa8CdtED04RLZOLwEuzr
 nIeD7H55tHMKlyYtbaGVKhfx8+egREDh4fXghP/dCvFIA8mJS12D3epxxfmu872azr/Cskx/6yl
 nIaIEPPteGLJoBFlnICDxgzu9aK6Socm/3lJeRKDw5TuGLDjhBAeUHtstG+pv2wV4Xw+Rzz9kKL
 E5FT8hoi1eWNCt4B2i3nFDH990M4jgHdM3DVPXxA3salhEDNozlr6h+LUTFp4VZxIBHU9wwQR6C
 SERfUfpVajTfiUOr24bEiJO1wED8KC4DpvU+D52zqv8hbC1LCoyKzn/7DxZfqmW7qK/uhgv6s1U
 lJzqD8PvKezFLawHGSA==
X-Proofpoint-GUID: ffKad6XTFybqGbGpURIPHYx6YrZZM5_i
X-Proofpoint-ORIG-GUID: ffKad6XTFybqGbGpURIPHYx6YrZZM5_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94826-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E9241D5D83
X-Rspamd-Action: no action

The Glymur platform has four DisplayPort controllers. All the
controllers support four streams (MST). However, the first three only
have two streams wired up physically to the display subsystem, while the
fourth controller has only one stream (SST).

So add a dedicated clause for Glymur compatible to enforce reg ranges to
describing all four streams while allowing either one pixel clock, for the
third DP controller, or two pixel clocks, for the rest of them.

Cc: <stable@vger.kernel.org> # v6.19
Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index ebda78db87a6..02ddfaab5f56 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -253,7 +253,6 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
-              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:
@@ -310,6 +309,26 @@ allOf:
           minItems: 6
           maxItems: 8
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              # these platforms support 2 streams MST on some interfaces,
+              # others are SST only, but all controllers have 4 ports
+              - qcom,glymur-dp
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+        clocks:
+          minItems: 5
+          maxItems: 6
+        clocks-names:
+          minItems: 5
+          maxItems: 6
+
 unevaluatedProperties: false
 
 examples:

-- 
2.48.1


