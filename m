Return-Path: <linux-arm-msm+bounces-108161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mP+9HSPxCmpv+AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:59:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D18C56B1CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 12:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2864830CE254
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB573ED5D6;
	Mon, 18 May 2026 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYzMix8u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WsEFZ7qH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0896B3EF0AB
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100501; cv=none; b=V5arw4su4yaLLHR5VSf3Djslb6boaEqtXhi8j/bKw61xqXh9cmZuQvhRXKSzF9qoKJDOVU1R44mwP2dHMjSaMJFrE8eAZabWv0onFlhXZQW6HslxMcUQJKKqogeu4t0/CoaRosz7xOAeCqlogSu1Qo7TD1y37sWyOOFkIBwj68k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100501; c=relaxed/simple;
	bh=HruJCBfmYQnSIf7/uG0sMk4KwwbHKq9ZOPIx9Z6UMzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VsMi2iRIGRdtesoqsH68UUiJcaRsLRpeX+IJ2rYjJtBO66/BcyAD+QSdAUEB6Ki4yO5HNIBw3Wqu3pC+TXB0Rqew+ISK9wgJfQTkhHGuQx9ks4ZqCCcr9q2UCjRbVMyuOdkIfNQ/kNPeXmNvhbbfzJE3u0vac7WNtYCA3eyxx84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYzMix8u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WsEFZ7qH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7Z1xm1931006
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dQwk0ZcYwIT2ZAX0lFVV7M5q8STCdl7o/BdUfUj4Vzo=; b=kYzMix8uJagLVQ8z
	Nir4lY13cctMG72q14AGINLrAcTylBuBsduqL/iKgh9Z7AvPd+5qLBDnTIq2gCMi
	wbdLzviUc9JZpEBLrbQYhzicHEa+/JqbY2R+rvyN3ZXivc9/ARHT26gyuWwljaNI
	idgaxcpYK98P/+k2qj//TiKpto3LitX6nvWzGWOLn/3mLOQLW6TWfthnEpF9+jCm
	qdlHdMIXH5CR5qjUU5SDI8QF8HCFyvaZsKXT5yEEOcL+5ZVq13qxoQq2mGeke646
	c/5MZnS77zQD8o3iFsPamJPt+57hlW0zofri3XAe6PswI15li43ckwJfbfis9PWL
	UIbl3w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6x0sj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:34:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516879bf1a7so37155401cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100485; x=1779705285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQwk0ZcYwIT2ZAX0lFVV7M5q8STCdl7o/BdUfUj4Vzo=;
        b=WsEFZ7qHW3QTJMh6RFSFBPkteuWqopZL4gyh1wNSzFM+y+LojNZjC3z9ad5LAFaY7K
         LObSgMPyLu44whVbS7FHVWg6IUToPM6+Vj7ukxNn/Va855XcCFViwH3Aa6aJkMv9+3Ac
         NcHBklffz6xU/qroN53Q4RqE8mfrSemqz0y3c9hefFtNI7f7xHhbDgBFdrx6hTKzqf3Z
         HQM/yFvTEOi1AbrTSTilp8Re4qRth+5Ksr4hkcxSm7chJi507JjMic9f8YcTgqDB0KbW
         59uO+r6tgr2V132FC0iJZLFIokrq7UuHnqhSzTYBcXQmF2AoLXqDJadP6uhjtp8sDnV5
         mk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100485; x=1779705285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQwk0ZcYwIT2ZAX0lFVV7M5q8STCdl7o/BdUfUj4Vzo=;
        b=ezh0YIvIYwUdFPonmw+sTxvivpMqARsTU7bnTMxetwYc3b4+bXkvpRVqFzWj6mSlRk
         znEAB7HDmC3YS3sEQGzlxA99txSp+L7ESZj+J1SnU3JWaYGgq6vC3qnxVrLf+qN2CLYT
         2UfBsOKzCfIG5Yx7C576uqlFnYJmwlB7iQdJeNJVl9Fpf8ibFKs8h0upxxS52CjrMMer
         2F2fPb9HogjgOhmcwA775TN8LDXvjXWjSywhnOWyEfNxhz5ZmQqbiREAK3uL29J1hFZS
         HOQhy+6NvLdJpNxQ/nU/rnB/dfaARJdGd1upWFdvzETd/6KwSY/o0FKtD80vKWk0bLeB
         PP7A==
X-Forwarded-Encrypted: i=1; AFNElJ80de5L48OTWJJYUdNSidZhQXmJoW7Fo7rRyzqU7Nf8vMmba1X4k9GFDvI6MYYqeM1y0mU+YdYFCXEdn1dD@vger.kernel.org
X-Gm-Message-State: AOJu0YwWPCpxajNzCsfuPiuQvHZOMqPBtkIbLB/oUkeUyrDs4QrBaRh7
	Xf4hmh4u/4CS7Dr+ZG4HzTBt90HkvhjkdvTuqeJPXGJ/op5yVwkbfwSRkt4duu1BD8HQ0J4TRaW
	K9cgI+X8gc2gV+tR+kCViRuF5rLExq7wrvsv/3BGBNyVFgX/fyoIxkuxToCBXJxb86Nxy
X-Gm-Gg: Acq92OHlnhljFo/V5duQJiROq+2CsjgWNjzrQoLwhvwFaAhNKQZxChQmGL5CH/u081j
	twAydj5CT9ar2tkjHNRx8AXHk560awM+hgXjvQst+tzGB3lcoxytwRO+yE0ayaCWq893P8kCkKE
	Uxsn8iKppGeo0BEmUVeLMzUz6RzZhjxQyvZbay7oO0cUr3oyaCq0yG/0+J/TpYJKTmm8UMTjgwJ
	fB5YdsM/i3GztvKQ2J/Jw8YwC5YHtwyxNLMXKUXckhvnJb8VO6o9hmg0tIGchw+ouqGMUARPu26
	WOpbf5cFVSzTAHTa6/RBXswmrw+Ne1KD3Hii+OX1McfTM45MzLg0cSy8G5NYzg+5OyHbnL38Zm+
	FbKS7WW8OC9+DqJk7mKUq8/KtEgiQ1/eJ74R2q2RyYyPnyDdv6w==
X-Received: by 2002:a05:622a:d06:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-5164186ce39mr189401491cf.24.1779100485490;
        Mon, 18 May 2026 03:34:45 -0700 (PDT)
X-Received: by 2002:a05:622a:d06:b0:50b:4a3c:8917 with SMTP id d75a77b69052e-5164186ce39mr189401241cf.24.1779100485099;
        Mon, 18 May 2026 03:34:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1337:b6d0:456:372c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35654171f8f.5.2026.05.18.03.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:34:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 18 May 2026 12:34:32 +0200
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: add the definition for
 the USB2 PHY reset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-nord-clk-usb2-phy-v2-1-17a86cb307c3@oss.qualcomm.com>
References: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
In-Reply-To: <20260518-nord-clk-usb2-phy-v2-0-17a86cb307c3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: brgl@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HruJCBfmYQnSIf7/uG0sMk4KwwbHKq9ZOPIx9Z6UMzU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqCus/55rpVeV6o37pq3pi1Z+279auIAgvMmoNu
 /3XiIEfw+SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagrrPwAKCRAFnS7L/zaE
 w1CSD/0TVTTBuhGfc8Y9Rz0xmWiJNRMZSpFbc4nNe+tA/g1KYji0JXibnUWZ6LTO+Yxh+GVn1yA
 omNyU2SqhfmdORpPTnQVUl5rCEulcNgv7YBCwkwjTfCV52bqkG8Vcoi7XyRQ0ti+iKOJajEtBGG
 cOL9ql+dhF1tMn0xhd/E5Hs6x9TuhDnDpUDpd+u2FOEz+deZoBo8fYbLPdpdRzDde1VGhLfFxrd
 QY6O4KHWKZ8FbVVAOxNZFdOPf5PxHOCON+Ig2FiU1enTu4JJ9kCo7jNMKgduJqQJXccla7o69wp
 GCrT6la15fHOcx11KKxbsH0mb5JPPI6xb58aCG8jkuYhGjpZQV8U+DlrRkpMWsnuM1htYoZ9oW5
 lhaVobP7uwIavARvTHbIpsBrP6aDIQRIPUGxhOUyzdqU1ybOwoyx9h6A46AdLUkpMsEMCw3F9Xo
 w4DbICBydSNczF0vgS7c/sW4oP70SQB7hpHgtuN870D2uV2y6G1axNGb2Pr/GfrDHd/g4Kohr8P
 qxKbYaU1yUH2jPCeoZYXMmbYu1mHoOqaMq8hFM+37OD5ae/OjkoWnwX/3dVckP2w3VXhkJbkG6l
 voGN1akXMWPgjUH1rEW/PlDKIq+rzAkpf8dT8P55YXEnyzckqd233Jqz5N/8Q9Ohk/LEfQsedLk
 oEJRJZdPeHqu+Mw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: cBAllmz7gOXrQgR2ZpKTjT0OAWjnRMq-
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0aeb46 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yy8D4xeqwGRH-rPZM9sA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: cBAllmz7gOXrQgR2ZpKTjT0OAWjnRMq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMSBTYWx0ZWRfX+SpfdesrWfcA
 qIl3OyjHnn/yR1Bw65srvLCG1pv0xHDjy8fWsoVZktPKR3t31krcFz5Ga5iq4YHps5rgKpsBGTx
 T78U8sTk8MlKQLuGcD9JM2zZpNdzNaIIHdOGSORAaOgn5byo15cw5mDM/s78/Ep9pIyvASMEKC/
 3tfZBF2OC4TNbbKQqibXVDw2mWCvA6qKa7hPfROvrkkVptRBHA3+xHg8Sj9xSOtpEbkg49wyEMy
 LmTsMrMScqJGimk1UAfOU89u7iVVglyCzAIPCjdIBDaZvtQQM/O4a2ps8/frEiTz/jrE87+q1K1
 KbokJTKYggxykl5xvxJYZPVMqQ7BG7WozPfyrN15jzLD2IDgnoOURoX04agkNa/y/CAok2DRiDT
 VeMvXhwnPmiQbEVQFZPAIgziVlVWSlgddik15qA5/uG8++k1Uu8mzqVk5gR22JhXlQCuhWPPA8U
 wEkxh5QfMs62Jc4EHjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180101
X-Rspamd-Queue-Id: 5D18C56B1CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108161-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Provide the USB2 PHY reset definition in dt-bindings for the Nord negcc
module in order to enable adding the USB nodes in DTS.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-negcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,nord-negcc.h b/include/dt-bindings/clock/qcom,nord-negcc.h
index 95f333d8e1aa7cf1e386b6926380b2c853f7cf43..a7024317e90b136841feb48486a04eb03965109c 100644
--- a/include/dt-bindings/clock/qcom,nord-negcc.h
+++ b/include/dt-bindings/clock/qcom,nord-negcc.h
@@ -120,5 +120,6 @@
 #define NE_GCC_USB3_PHY_SEC_BCR					10
 #define NE_GCC_USB3PHY_PHY_PRIM_BCR				11
 #define NE_GCC_USB3PHY_PHY_SEC_BCR				12
+#define NE_GCC_QUSB2PHY_PRIM_BCR				13
 
 #endif

-- 
2.47.3


