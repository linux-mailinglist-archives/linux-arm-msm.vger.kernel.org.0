Return-Path: <linux-arm-msm+bounces-116663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mwc2LRFjS2o7QgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:10:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DF18670DF16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 10:10:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mxQehkOK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bdm9cXUb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116663-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116663-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4CC6830265FF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756CD318EDA;
	Mon,  6 Jul 2026 07:03:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01B32E7F25
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:03:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321436; cv=none; b=NVni0p7m+f1GRRxu3R7fmFFeeJpDN+AdGlbJRFRKhd2pHCIIwEXYF90flywJZ68zoGTUszQ+o49bkadaS1stNUBhFYAcTDykfijxfpCbOwFPlAhoe6NgZg+u+nvdutzjWbS05zCabOJ1S6r4tSf8tIRRoq8PYUDC1/EkGFJdHdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321436; c=relaxed/simple;
	bh=8DKdeI7VpqmHqPyxsa1vzB7yfzHWTvEElPRnrq59Rw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OlW1OpHZ0WiNfHYKXdDUAA8U3ybW/HUkOvRJj/uEgqbDlB5V9hJ9K6IX7N1YUrfKZc4aSvaHGwkppsyeQSsx5jQXuHcqYPxg15PBGPsd2ukrYgFiP7YdQUttxOEIcsu6I50+DsRbYtYNZaJa5bRarKFnFAGiUWzsGvE7+csAa04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mxQehkOK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdm9cXUb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641XXE3539273
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5rOTfFRxeg5KhwW6MJzCO2yNHFP0SlIfxYgwbMO90Q=; b=mxQehkOKFF+GzcHB
	yYxbv1kMhFfF73z26QLUN3Dcyj8P6DPlLT2Y9l5tDyRFEdGlpsXTVJdkB3cYQO3K
	O2FL+ptrOBtUwS2aR7Z9Uni72HyaqZ+CjIu9atD4JlrW1MCVCDiXRzJQLoxposPF
	vVBO5VyHtJUtGBEAnPP5nDgoO9mY9YyxcFltDT/FFeXJWr9FiuzaSa+aDiw1MORV
	2WGoDKLwVF1l/zExiII1R74+cZAhEjyq80Jf6fDk9KSexD19dwFGtdObb3Pshial
	b/YNWWvyXkui+N1ll0esTR1gKrxjteY9+wHKfaxfqgK4ZaHh9xGN6ow4OoTTBfed
	h0rV5w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnn93f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:03:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so32475856d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321425; x=1783926225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5rOTfFRxeg5KhwW6MJzCO2yNHFP0SlIfxYgwbMO90Q=;
        b=bdm9cXUbDATFJMgzVgrRMg7w6e45qc0R1jGOKdKCh8DPZony4B817OB3oJ25ls4u9R
         Y7W/zz9iF67yf4Y0c+28Ry6YVCEr4+P1mJDsxtViIvRG/SMRIzKMSd9Y6bK62S7jlZee
         y0FP4i9x8VSh7/4yynbA+UXyAD91bbssSs3jwDjI/6sYJYRsYi9MMUIkR6HIbzScdq5w
         5kOfelysU2Nxn4cj0M8sLdSunpHTwez/w5LCKSSo894sWiStSWg5zzzxvWsuWLPLLd4E
         VkN2bA6usTdMEWb2ds7T7aJehWTv4/ZDGHKENxIEeqpzWZd928sblnXCrAMdg5IxI7WO
         0Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321425; x=1783926225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J5rOTfFRxeg5KhwW6MJzCO2yNHFP0SlIfxYgwbMO90Q=;
        b=ANKzKphI+/R6AU2pmNdABi/bg2TXNwK5E8TSQlUtmNU4KPqT55ZZ/ksh4i1TEd2Vqb
         JD77U6U6bU8yjIpNoMHS62qyVXP8/6WaX7I4VGa94DeE98Zv8A2LFAWT589CijbaZrTX
         AQtre9IUAseBZbmL1ZyTlygkJ55HyVHq9i6pNyxlf3tFqtP9TQABHoaLh81B/dlRnOGw
         7uAnODb5MGPq08V0/Phv+f8Gh77E2kmZJbLhx1d2hP5Fxq5nIXiCSzUVNNY/E+LmMinV
         AGM8avYjj08RcknaWkx3Kl7v8/efxzr32yLILjlzAR4cglBSz8TjOqbwhBK44EJffWHb
         L25Q==
X-Gm-Message-State: AOJu0Yw8SYFAhYaxTfNg/fh0utxLRg3UjTNU9nOav7FRbya4ofVoC5y6
	beEC5DGeZ7nTpbhMVD3I2TZIJSTmuJ4c4YlfQ8hWFKWdGIz/VAu5yGkGVjdY95sQHVJUWFDpc5o
	oq63kDUDcN2b+SsrIRUtAGdnDJvzLTJUOGG6qzbf7OG7iJmOMok8+a15x9Ai5J+vxikNT
X-Gm-Gg: AfdE7ckqZkLwLsRSbaHgtMPlkzHakRMOBbea0ejB93S6OsNJLwTEuIvviCRTr+UfjzQ
	qKs4/CKEqowxHD7dO33I27hHFKd+EYlwm61kNqivq7VZN5ophmDrD5+MNTAAFXfd/8xjuG/I53c
	SBuGeKMN4hNhvS5AwXhX8oCsmEPc3c5Q6bVjg6QZa8s5fFDT6SZkHMR7Q23ba4ZtziRHgXvzQHM
	y1EMa5dXI7a27oM42W/t1qkMNt+Lj34EjYgW4SCzXwhMZBzOtkVqxQwvyQMCroPwB4G3RYjlF74
	cPHXxJQMfTV7byvhxYcu621YosBnmmWCgVR/1LQ8xDyZoSI9m/NRaEeoxPGSnlHfnJ3xY3zm2oO
	tXEtkz+tKtaNYLoeud6uLVHP/RnkIpN3vs1s=
X-Received: by 2002:a05:620a:1791:b0:92e:6bbf:9686 with SMTP id af79cd13be357-92e9a3447f2mr1169662085a.3.1783321425436;
        Mon, 06 Jul 2026 00:03:45 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:92e:6bbf:9686 with SMTP id af79cd13be357-92e9a3447f2mr1169658985a.3.1783321424926;
        Mon, 06 Jul 2026 00:03:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm397143455e9.15.2026.07.06.00.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:03:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 09:03:28 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: Use lowercase hex for unit addresses
 and values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v1-3-16ce82a2bcfd@oss.qualcomm.com>
References: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
In-Reply-To: <20260706-dts-qcom-style-checker-v1-0-16ce82a2bcfd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2236;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8DKdeI7VpqmHqPyxsa1vzB7yfzHWTvEElPRnrq59Rw8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1NG9YfGrUkFpvW8hkL4pjkgHHbFR4P3fv6wx
 eHUvbhNgyGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktTRgAKCRDBN2bmhouD
 13cUD/9gr3SBOdaLlfzXKjuoI/gXjtIxihYJykjUEQs0l21rgtkGZMDHECfrZ2rnbllSdNtSfUz
 BcuPgDNq3N/Tnes4ZW7GU2/EL1X2ghA2S5lNryai635sziWIT+/qw7V8xBb40n+4ypucAU2dlVh
 VFx7T4fCYYD1z7MkrT9MOWrvSXGlGyYZOlv8ewcCWAJWSTV8QDsT+jypGPePv9P68NgX/UfAE9O
 gf0GkWCy5wzGR2fWg3v+jrn3bRFm19gysE7bpt3j8otx7Y6NybvDLNtqm0jUrJqNH+eJGBm54Td
 W/Eib5YPyVaG34uUARKZqWcVj3ut4eLfg8rGYYnser/9UbJlvju1MCBb/7yRW6/9nYhUhUKcmyt
 FiOrLNHMYu3b51knqSHb17s6j1XHJVq2/AaVbe/buDur+LU/pI62KM+ACsZPJizYos0oscviZAC
 IjsPiiNr7ra23Lp3mF3q3h1bnI0gPFNR0LsB5DCUn/hn9gA1hsQN1Ky8ROCbtKs/jo+pqkqjNP5
 n5QstNX8BgbFiOwo7a1YPvxl1uVRT0ZH2XFEbEhDS8vqEtsi8/rKMeC+M3lYNZodf1A6aT+SIox
 mtcHbNSwo76xZWmLlAt2r5bdE+2w+o6XSjsBwyY+4fks+ykJ+chlXbUxxsDg45CE1GXqf2u3rFd
 A53LsaYnfsXNz+g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX+sQ2fzUuJ+I/
 5WjgmzJXc1fgPPViXhSr9S/cEAZa/ySdlLhpEMMRkPVjQ1rVCVDKq0QJG9pCpFBab58ZyBCgFUQ
 mvxuhHUOd47haKaYMzKruEF1o8wKtyk=
X-Proofpoint-ORIG-GUID: V-Dngllmko9H7Ek1cnshlfmT0t4o09Zw
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4b5352 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Uzw07H2qs_X0hPCscOoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfXzIW50acFnbN0
 shQ/miB5gIhJfM/Gbdw+pSfKAufTgkvnUe0uL0cf+65cV3q+xmw8OjmcuU2QQyPXNgMDv4p4g3g
 IjjgELZ9aKRVa0GyLB2PHRo49xhkLvU8+EX/bqV6U8lFJ0/BLZ4AGXYp/0DVGTPu6eHCaHW5wgf
 MpJ8ij8TMVJmZZ7/COpxr30E6a/uWUEPC2NvKmrpf+UTVS6Ols+Kc9uG2tD4LXF/13wMDlxNmPw
 6tnzUWITKBgj4LJoQRMfgin8xMVUaY7u8RpQmC2m9RbO4v2vF/k8kvkQW9OwT2D1pbucPcVAY2v
 vUutCs+w91fIhiRqoyyE6ds7d2lL0QcNOBa/VJd88r4kcAc380HJn6gxitW4qPXB0sJe97btUU8
 gywzCnmwDv4dpSMEOq4I9X3v7eXGuqjpRAe37hzFv2NYsstLpKnQMAm3riMGP/hile+y004Za2y
 iAjaxoaMRsW6qJMhvsw==
X-Proofpoint-GUID: V-Dngllmko9H7Ek1cnshlfmT0t4o09Zw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116663-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF18670DF16

DTS coding style prefers lowercase hex.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           | 4 ++--
 arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 8 ++++----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index adedcc6da1da..1a278503d340 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -591,7 +591,7 @@ saw1: power-manager@2099000 {
 
 		nss_common: syscon@3000000 {
 			compatible = "syscon";
-			reg = <0x03000000 0x0000FFFF>;
+			reg = <0x03000000 0x0000ffff>;
 		};
 
 		usb3_0: usb@100f8800 {
@@ -1241,7 +1241,7 @@ pcie@0 {
 
 		qsgmii_csr: syscon@1bb00000 {
 			compatible = "syscon";
-			reg = <0x1bb00000 0x000001FF>;
+			reg = <0x1bb00000 0x000001ff>;
 		};
 
 		lcc: clock-controller@28000000 {
diff --git a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
index 0dd52cac0e2e..7206a33da279 100644
--- a/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-mdm9615-wp8548.dtsi
@@ -15,7 +15,7 @@ / {
 
 	memory@48000000 {
 		device_type = "memory";
-		reg = <0x48000000 0x7F00000>;
+		reg = <0x48000000 0x7f00000>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index b2dc0327dff8..9368fd6b8751 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -66,8 +66,8 @@ venus_mem: venus@97800000 {
 			no-map;
 		};
 
-		cdsp_mem: cdsp-mem@97D00000 {
-			reg = <0 0x97D00000 0 0x800000>;
+		cdsp_mem: cdsp-mem@97d00000 {
+			reg = <0 0x97d00000 0 0x800000>;
 			no-map;
 		};
 
@@ -81,8 +81,8 @@ slpi_mem: slpi@98700000 {
 			no-map;
 		};
 
-		spss_mem: spss@99B00000 {
-			reg = <0 0x99B00000 0 0x100000>;
+		spss_mem: spss@99b00000 {
+			reg = <0 0x99b00000 0 0x100000>;
 			no-map;
 		};
 

-- 
2.53.0


