Return-Path: <linux-arm-msm+bounces-95309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK9iA4EtqGk+pQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:02:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 762B21FFFF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FBBB314F5B9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 12:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD8B23A9BD;
	Wed,  4 Mar 2026 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArtWOjct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DPfT6RVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A55B23ED60
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 12:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629162; cv=none; b=WAYCIA5i5ccv3WBy9lw0AveTjzPG0VcgeGy4FLCrWbB8JIXPWm6F2eFXs6zRMyYJAaOTA8kMd1J07HhiCaJGQmjxH5a/iIKCKGIdC+JfXM46Tx9VCoDwOWLJyJ1aKIEincgWqZrh0cyVe8EHOxTHGjCEN/+84T88ATBGxQwInhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629162; c=relaxed/simple;
	bh=dV4c9N+VPGpt+iF/Qhlf6YTdOXhS50ODX2RZxCnCTzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gkbTm4b5JziCJBkwcyv7LvBReeZGyojAmLNfIbmNTYyPR1nMlKC4kjLkDPPoDwpmMfLwNRtgBKTKpmWMMZqWbiQkYBEBl6484+NXUHwPrPrBIsIWgdSGYM33g5Z2rEvhD84dIhMoRGanJ5KieBhzC0K2/F59R8v9Wllc25/5srY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArtWOjct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DPfT6RVw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CKbEh2275163
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 12:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irP6RT3EqC1keUbn+JPZoRZk0Vj5ZSyp1qChfAmYbnI=; b=ArtWOjctLd3zpoQF
	QZk4ci+GMltgbG2G1OxVKQZGKZ6zBBADUGvGSYEDmWv7ZzFw0u7ZzUoMfI/MOAYY
	5AocZmYfz2gWtXsCF7WJfj/mpFpyZtm9l7EysK0iwJDmdHb3caUMXSISvsyr5EpW
	p0jeB6rOY5bQ4Pf8LUHQDT4ROHJ7V2tnkSNigpvWqVwSzubfAm4L6bdq0gZ+3acX
	1Ei6+QfhbLYP5/ovrOChJrUF3cN/j1Xb65XHGOdiDLm2iT7JHECU1qbNBrprYEKT
	+KBe/GgrUFprBQ57tfivFEvIUyN+0zzwC3hU91EhXd+Hotgy1DGgNUww30W3bFC8
	6r+z9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4msv89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 12:59:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3a2eb984so4871030585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 04:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629159; x=1773233959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=irP6RT3EqC1keUbn+JPZoRZk0Vj5ZSyp1qChfAmYbnI=;
        b=DPfT6RVw3qj9oJKaSM5wdLyBxuaaMbFrFQqw0nmFmUZ89cXN8iKSlyzfON3itllQoU
         C1RySZx8D3tcPgmB0lbg014hh59f85Res+8neJSngKf3PDiqh+6eQ98RZk6vyu+eeUzY
         LKVCf1E216ov5QJmpy93TLqH4kDs/QukQ6SSkOLG9sSv82UmpSb1/RTHbpAS98y7JdjT
         h2KX51BncrBYHsw7ny03FoeDXAi8Y+9+iaOh4tv6luDB8JeJrhMQHCTYMdbWQK8bqZLH
         nC8VOW3oUFdJy3UXhxqvA9KjNZmCbJUytfA8V2HRfHiuKNrGeYAjmEEn0skqG5rGf96/
         QqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629159; x=1773233959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=irP6RT3EqC1keUbn+JPZoRZk0Vj5ZSyp1qChfAmYbnI=;
        b=FPFgrJhgX9ncD2hfifbvXZZ+4duzkMdrA9tZgmjI3ZiBvcBr7Z72cB0KO3qX9v+/ie
         aeUOY0npNyqfJheUeTyEN8WbhYzRH70MEP6/kuj8ZfbuKWnShzlZc/0JoqSqVbL4Lwj+
         DiLpigx6QjTKhNrbqTH3+iwS7M9dqvn8Pwwzq5L14yKjJy5XMJJTvRkTArnLWu84T/C1
         tswvKwOg5APEpLNOJoHSw7Q3yVrPp6ZUpGHnVnHDZTKGJb9+7hkBrBnbhVr+iGfphT+Y
         F/MUIpwJogIViNc96Ci4qNzu07XQaSxR0jNtEULAJ5GGFN/4LKp0+UaaQsGQAIVPYP2Z
         +lmQ==
X-Gm-Message-State: AOJu0YzleQtieQ4EOJhJqkBD1/cRlRnvDnQ+MiKK1SurGt3M55tFTs5f
	FvNdqruQmf1tQbXHJULd3JDid54wd77b15WGL6xcusMwQFt62v4y7NJZGdjZGL+rPlJVoP3hThJ
	wk/BKTwTtGPZmi2hsy8bYWDBR30fGu4Ou/xJ3s/zHrHyOvE8fOa9osJoopetb7Mwt4fcF
X-Gm-Gg: ATEYQzyZxVrl6ucTRogErodX3Grez4Uo2RjhMp7UXwT9SvzTG1AvwAPpVUE8XFnKtmG
	DR1kXbmcmHGax5IQV8kmEhVBWc3ZQn1ev9Eirf8uWu7GcwJq3BabAnT6sUYVGXvhXR5Ymf7RTn4
	bM1dWlMD+sn2HXD1hM2gvnLM2gXqp+7ZwW0pWfHi7OTRU46ODqXpOsRQCs4/u0TKoOGUIcIQ62M
	pSQM2lZqwQTvihTp06wJCayQWiUpVNDpQR2AnHdBuQkkVV7f6L+cIvFvD+VL3iPq4jve0wn0On/
	4BMYvXkrhWH8pxlJyXAZZ1mgaRABML78nSPT7NkPvNLMvu8jNYDOioLk6LuEowpcToY9aU9anPP
	vmyYT/lI+1MbtDNNVoY7QpSN+xVgXmVK4F9iCfBF8e3+1
X-Received: by 2002:a05:620a:4481:b0:8ca:105a:298f with SMTP id af79cd13be357-8cd5afa6928mr194899785a.68.1772629159507;
        Wed, 04 Mar 2026 04:59:19 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8ca:105a:298f with SMTP id af79cd13be357-8cd5afa6928mr194896685a.68.1772629159102;
        Wed, 04 Mar 2026 04:59:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c1fc577bsm11318491f8f.19.2026.03.04.04.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:59:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 13:58:50 +0100
Subject: [PATCH v2 8/8] drm/msm/mdss: Add support for Eliza SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-drm-display-eliza-v2-8-ea0579f62358@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dV4c9N+VPGpt+iF/Qhlf6YTdOXhS50ODX2RZxCnCTzs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqCyRX7UgpBwNq2kXan77oXCkwScsgZ7KubZiY
 FS7KYrlwRSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaagskQAKCRDBN2bmhouD
 12yJD/0dDKJsXz0uhoNClfA+5NKCeO+laTmSJy6R2FEZzGF+7MWApUp6dg7f1hPq4PaIt7iaVeM
 F2oVUlpmJ/Cto+44b6iGuvCLrVFWoCRNIxUxVCEPgK1dn6Ppsm/wFEOQT3B7NT/tRzcE0kE6pyo
 8F6fGiWG1H1RvGwlgpe4nXWWDs7aIXjISwGqQS+Edyv6LrD4Um7PaKke1KwF4kZG4VH9cbkWBRn
 FTKJ9h1TaYC2un31Xu0zLWFVcVaBUlHuUHEfLhtiDLTFRbSbzlN+ypDwVNGewxwuCp6pLBmCsmp
 Z1fbrtutCarAnoudcxETCiP4HoKs9a0Emvo88KUizke1J3WvouVoOHVX23hmwbrBPnlUZQ9heMt
 CGBK2plkZ+GpE4ZfJ3fxSsgQjl9NHivbedd0Nut68OSA0IZmVLblqv6K8dQh4t+aYBwUjxEKWkx
 mQ/o41MxnwJG805qGDIoJxsOZTLcZllm5Ioj5msCgVNfehZBFrzL3nDsRc+VZ5hzXG2NZCQLrhS
 KnWFr1t/nXeAbmfF2KvEGxNX1A3/vdv3HrEyObXi6Z7Tx8H090WCCBIvB1X6c8s4hTPyOJoHHUB
 wnKkSGHw3rQiEUFRw7Jo485AfIx/wdfke7I3zeAtqgthrZig7nsy7tP+nqeCaQsHPHxlvGCYJBk
 nMnmGbFFKa7TJtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: J5QLVVlmeRnu-0d8cLS9bUdvNmRrXin0
X-Proofpoint-GUID: J5QLVVlmeRnu-0d8cLS9bUdvNmRrXin0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwMyBTYWx0ZWRfXwKqoBmSljCs7
 zJxGbc9xzprVnu8gIfwTgm8xoyQJRDGN4WyOb9hb/BtE0tlIr9fKytC/4ySGyNt49sUZ13fe88J
 /lhA+BZdxRF4XoU45hch/qR+AAY1f7gRMtpm80qilWh3YaWd9LJGcUJ0DbxlksYtc8mtUlo0t8a
 NQEErvCHS88XjTGXFYpvI6/KYtlBZGFB1KC5eD8zZA0mKBSv8JGvLAb8f8iyN5TWyQayU9E5P/e
 KmNwoY9OlU5mFD/n4J7edjh341yzAWu7QyhdC5Zt0tVwRcjQbtD667iYgKnPvMa/8KHsjmLcD9z
 /bON7068HocIkUwePBh0O0gHd7c2KK4SRc/wdTlRXg/HSCmXijat33AefiMsgxEJ/zv9PKxoKtQ
 Zstog61ZmezRp8QmdjFi7hr+YNNs3o0SVYM07JlQalw4Ki4qtMzMDOcnUgvfl28eEM/WV81c5oc
 dU4TPEGlrvNgPLlDIGw==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a82ca8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=KosifQuNy-GW_fqSRSEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040103
X-Rspamd-Queue-Id: 762B21FFFF0
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
	TAGGED_FROM(0.00)[bounces-95309-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
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

Add support for the Qualcomm Eliza SoC platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9047e8d9ee89..a86776425f26 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -560,6 +560,7 @@ static const struct msm_mdss_data data_153k6 = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
+	{ .compatible = "qcom,eliza-mdss", .data = &data_57k },
 	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
 	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },

-- 
2.51.0


