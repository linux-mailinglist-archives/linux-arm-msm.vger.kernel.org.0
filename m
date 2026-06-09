Return-Path: <linux-arm-msm+bounces-112228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bhXmMsE3KGptAQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:56:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DB66620EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:56:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=phqT9WP1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c5tgcVkS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112228-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112228-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D75B302F6B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567CD492529;
	Tue,  9 Jun 2026 15:33:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E57E49250A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:32:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019181; cv=none; b=NCitYNvhzthA2Jkd2Ls9xT3XB0X5FdHWhKovqBijleIv6sJep4EdrkOvtNUX+DUWyeLu5x5OL21iWKEkWRG19h3yb6tH6VsfAyCnJNRUAZqkJbvvehyVo5AimjYmdpp/1aRCu61vxCPU4P5Wl1vfB55f3HuFNd+TNU4bVRpFZ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019181; c=relaxed/simple;
	bh=q59UObcAMY1V9mVGqT7Dy3nTkUBnxvxsdcJF9VMZOXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwDM4mtR7iHGbJU309xEhwb2r/Fqy+FvsCmJCtqHun7g838fTDYwz9zG7pnNbx/TU07yEtQp20S8Ye9ljMY9bXjkTPDt3ZnwAUjVj2pJ8SxWjLH1X707vB7HM/oUU29R/xeuBdJe1WopaR3B6xJqN0V1uaPCefkUI3n3cMEMFW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phqT9WP1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c5tgcVkS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClaFE2706270
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42OvwCVR1sO2H7O8XUidUVQnaR3TpDPd+Mconx0OdVU=; b=phqT9WP19YZ3PBZG
	Ry+l8ez+MNmRPCEHhtLLYAaQ4q6WYu+DJwpwBgefChLkYCgKPapBHKkIcoPjXaHh
	ToGDIH+HPiLNQX1O7/uuI11JVkIr5kQEyUoSPmpuqJpBj18JhtzJOW39OQp1zDc8
	7ek0QutbgrrvkRN/j/0RpcEAYOSvCz748ecdrKH15XjBTfGlDQyZ1fGDIaJmNCJu
	D9szeagm6zcCBsTQUvt2lGNoRmSFvfhmmrYKabMnxb5jvL14ZaWBAglXRXe68QvA
	Zg4VFjgFsjARaUi5kde2FtY81lQJgHzEUObxScY8qQvqg5PIlBzwCjeHGIh8HvzI
	9Dtj7A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt2069-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:32:58 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6f7f4e47eso8728790a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019177; x=1781623977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42OvwCVR1sO2H7O8XUidUVQnaR3TpDPd+Mconx0OdVU=;
        b=c5tgcVkSa+HfKlIBgXW+NLoFZBc4xRcuKlv8fSbi6+crEXKWJF4d/Ix+QDzJ4nxwmI
         xEz8pUSR0Qof+A6C1oijgG/zKdj8W7Qt6iNsrZ0bc0r2k0P9JmO5xzWoBBipMvKn5dp8
         EzCQO+CJKLOr0joTeElynfDSI95tFC6sTVs7ruTxLCrLIS81K9yz7Q2QNWRc+Gv9zfvX
         Kxtguz+9jd67pWO8ig3Nd1zJNL2sevPPufie1hD0QxBvHiwLJQCylP1qHjX3N4OaivL6
         2oXRuEkVeq5qCgYH04ffirNuKr8NRuI/QcWtnYpNUEghoPaYIeQ1KuNPt8L59zxT/F1M
         HleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019177; x=1781623977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42OvwCVR1sO2H7O8XUidUVQnaR3TpDPd+Mconx0OdVU=;
        b=HmDdDZ1jEXc1nF1EUIaNvChKdTljcKc4r2uq3eZdHaZkZnbxJtSmlLCoujl95xTbtf
         epvsOjtJe210acUsJijAWR+xdRMWLx1fROhrc5zps3G1dOa2zbEfmDYheB93670rQy9E
         dIuZSpNYkd5gQmWOs2BB7xhxfw8dZuysn3hQgVHt0l36KELspLr90+x99w77i0bwWYU/
         oEmy+GKdAsg67dNVMvzHKPpRK4fKjaosBIKSCOKSakvRD6PdR1iNkdv10EOC5+inBYne
         2p3MAOj/5gDQ3X9+WdExrLhD2qvCnLQH4sw//xRRrk3ndEkSIoG7U2g6asnuYS2mcG2C
         5mCg==
X-Gm-Message-State: AOJu0YzPrQSMFn3a8frmMzEpNEfTu444QlVmrQ6vw9GNbi7StkCymFFJ
	uP0yoSiFB1BHKM39MUnqMVpO9eh9qHbH4mYq5l1m3/Ih8/JnEiuFxjXRIiDtwUHvuyZ4hNd0MJc
	S659vDaNP9lwwRtNWHdtda6jfoYFUje2yMqZFU02sHEx4RbCVsNpoBubAIq1W2ei8c106
X-Gm-Gg: Acq92OH+CpIy9naViMouCOYQHs85FFA7IKj1lN/Xb2eqLGYckw5CZHSyKZwB6X7vCv7
	CaZsnp9qAdZ/XTdn01k1mPieNH5/Tj5jof0H3M202Dw7d0IbFJjuKt5Hr2BgAe4+feWnEtQKhrW
	Wl4r/prPdNiSp/V2Ws9szCLYvsUjtk/VZrb+1CnZU/mmhw0RZdSQloohnlfOT/1dvoxxulG/aVG
	FzOfWqpIhRBNu6+qyEyBBo1i708GuOwwgMlprKqe5LSCasBPYoWqJJwGg5qtReXf+y+lAC+U1dx
	WRcFA4GCbmMUgMSnWAt/oFBXvVTQx6sFZ9kh5sTCcUDZi/p1igbg2iT8edbHMmGm817LfO+memH
	NAElirQUuCQ4stfYluIG5g93Pd/C8CfaPVIjA+L+A3zUZgCSYBKo4dzZL
X-Received: by 2002:a05:6830:4122:b0:7e4:230:96ca with SMTP id 46e09a7af769-7e70c7fe87bmr14981521a34.21.1781019177301;
        Tue, 09 Jun 2026 08:32:57 -0700 (PDT)
X-Received: by 2002:a05:6830:4122:b0:7e4:230:96ca with SMTP id 46e09a7af769-7e70c7fe87bmr14981455a34.21.1781019176804;
        Tue, 09 Jun 2026 08:32:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:39 +0200
Subject: [PATCH v2 5/7] clk: qcom: Add defaults for desired arm64 drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-5-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12135;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q59UObcAMY1V9mVGqT7Dy3nTkUBnxvxsdcJF9VMZOXM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIZsX//lnNginh/112o7kzseEdW/GcurQm4o
 vfrZcHVZveJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyGQAKCRDBN2bmhouD
 1/jsD/4lg8zhI7ncEqMz7tMOkQ4qJMeqjR2MrLcBt4fPCV3GNqpzfgsaIJcgpQflvPajLK+Qx8n
 azRRvLyF6CBvfbBHH7qll5XnUzjmu4eelU+ePxV4dJPErJPduO1WywVhvLKjnwZ+sDuqvnPVHIs
 1BMmbVuhp6kAJKtuea6HW0dDbsbfmnuYbTTv0IHO2EoNJSqedRimNtnDI69cwupTdKz9BGOmf54
 sl+tjBCm/LXLkC1ftGRL+duf9XHxqfD7Aett9TFc8L+gCxNmtFMvVEFf4+25pptObmCNqYEIT/G
 pDtFWxlNEEZf7vNr084MHucctIxKFTZmKXYRKCSvN2EIOolnlbfFvWdYwJKJ5sXOmpBNY7cxoh+
 a6Ma4Ef4/Gev1Lysk8Ro84pG4CikBacS0aB/JqrEg+CakqmNt7FHPjCbzPd6xinC5WXk2fRZLFM
 XZXv6zcbr7+VSsYTV27j5oV436jaT/ywsOVS6+XGOECv6oCee1jP01fyGja0GuL9KmeVxoHIInn
 cb4FyEuC0AwNFS09MQUq2IpRtWsyQGhxXsY6rFdtSrDbdwXtnSUlRmmDp9MJtIRHh7KP7HyCeDh
 wMIG7u1wNM9FoNVdXdc7LBnXrbh83nAnV4ZzRHcSXTBUUocze0AVW9TwBm0meTkzg7S5Ba2ljgz
 dmccxhapvWWTVdQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: rln-khxkQ5E78mnzZmZl93BsnZmk0u38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX28cK441wKdsI
 tcczwzUWq/TumMVe8bf30Wx3r7ymCEklgwgkoZS3V4y532RFI7PQMFPScdU6bZtPespLCZ9ra6a
 3CB0px0TFbkJVTiIrcrObTrx/B5pSZTG45dfkzQebvPjrxe9/Fr021sh70V3eGhQY+eiMdDg6Ks
 G0rKFLHP4O775CgAJYNkpsSybuh3eOuKJhSKRYXIPaqZ9/2/chnzJUZp7kSx/B4v6XEsb/38FDW
 FXe9rGamtA4U0wuMgs+lUEAnx1O92mjDXY4hLZa+ocQ8XUD1Sra8Wd+P04CIIhHotc0Y0tPNYPm
 6SANBCW3ScjSRo+9BSlsbQz5eQuFDBVWNDvKeQDTNVjeMfZEpV0kP+rDuRCiwkVmuNuLq0YVivn
 wvrAwJ0yZWPh447/KNENDcWt0qj2Pl1KQ3aAaSAK1gGFam4VGj3IQBgruX+1xhtrKTF6bL9XHTh
 rYbzW7porRKUm0ejh8g==
X-Proofpoint-GUID: rln-khxkQ5E78mnzZmZl93BsnZmk0u38
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a28322a cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=oRM-sv2Ew5iZelD02ewA:9 a=_dTl747PDKSlraET:21
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112228-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44DB66620EC

Clock controller drivers are essential for booting up SoCs and are not
really optional for a given platform.  Kernel should not ask users
choice of drivers when that choice is obvious and known to the
developers that answer should be 'yes' or 'module'.

Enable drivers for upstreamed or being upstreamed SoCs, which are not
yed enabled in defconfig: Glymur, Hawi, Nord, MSM8976, MSM8998 (GPU CC),
SC7180, SC8180X, SC8280XP, SC7280, SDM660, QDU1000, SM4450, SM7150,
SM8150, SM8450, SM6125, SM6375.  Note that main GCC clock controller
drivers are usually already enabled for these.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add defaults for: MSM_GCC_8976, MSM_GPUCC_8998, SDM_GCC_660,
   SDM_MMCC_660, SDM_GPUCC_660, HAWI

2. Drop the Konrad RB tag, considering above a significant change.
---
 drivers/clk/qcom/Kconfig | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index ed969553649c..9afd4d752f3a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -73,6 +73,7 @@ config CLK_GLYMUR_GPUCC
 	tristate "GLYMUR Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on GLYMUR devices.
 	  Say Y if you want to support graphics controller devices and
@@ -91,6 +92,7 @@ config CLK_GLYMUR_VIDEOCC
 	tristate "Glymur Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on Glymur devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -161,6 +163,7 @@ config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Nord devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -328,6 +331,7 @@ config CLK_HAWI_GCC
 	tristate "Hawi Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on Hawi devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -336,6 +340,7 @@ config CLK_HAWI_GCC
 config CLK_HAWI_TCSRCC
 	tristate "Hawi TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Hawi devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS.
@@ -661,6 +666,7 @@ config MSM_MMCC_8974
 config MSM_GCC_8976
 	tristate "MSM8956/76 Global Clock Controller"
 	select QCOM_GDSC
+	default ARCH_QCOM if ARM64
 	help
 	  Support for the global clock controller on msm8956/76 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -716,6 +722,7 @@ config MSM_GPUCC_8998
 	tristate "MSM8998 Graphics Clock Controller"
 	select MSM_GCC_8998
 	select QCOM_GDSC
+	default m if ARCH_QCOM && ARM64
 	help
 	  Support for the graphics clock controller on MSM8998 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -785,6 +792,7 @@ config QCS_GCC_404
 config CLK_NORD_TCSRCC
 	tristate "Nord TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the TCSR clock controller on Nord devices.
 	  Say Y if you want to use peripheral devices such as PCIe, USB, UFS etc.
@@ -845,6 +853,7 @@ config SC_CAMCC_7180
 	tristate "SC7180 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC7180 devices.
@@ -866,6 +875,7 @@ config SC_CAMCC_8180X
 	tristate "SC8180X Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_8180X
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SC8180X devices.
@@ -898,6 +908,7 @@ config SC_DISPCC_7180
 	tristate "SC7180 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SC7180 devices.
@@ -1014,6 +1025,7 @@ config SC_GPUCC_7180
 	tristate "SC7180 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SC7180 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1043,6 +1055,7 @@ config SC_LPASSCC_7280
 	tristate "SC7280 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7280
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SC7280 devices.
 	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
@@ -1084,6 +1097,7 @@ config SC_VIDEOCC_7180
 	tristate "SC7180 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SC_GCC_7180
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SC7180 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1112,6 +1126,7 @@ config SDM_GCC_660
 	tristate "SDM660 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the global clock controller on SDM660 devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
@@ -1122,6 +1137,7 @@ config SDM_MMCC_660
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_660
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the multimedia clock controller on SDM660 devices.
 	  Say Y if you want to support multimedia devices such as display,
@@ -1132,6 +1148,7 @@ config SDM_GPUCC_660
 	depends on ARM64 || COMPILE_TEST
 	select SDM_GCC_660
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SDM630/636/660 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1165,6 +1182,7 @@ config QDU_ECPRICC_1000
 	tristate "QDU1000/QRU1000 ECPRI Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QDU_GCC_1000
+	default m if ARCH_QCOM
 	help
 	  Support for the ECPRI clock controller on QDU1000 and
 	  QRU1000 devices. Say Y if you want to support the ECPRI
@@ -1254,6 +1272,7 @@ config SM_CAMCC_4450
 	tristate "SM4450 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM4450 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1271,6 +1290,7 @@ config SM_CAMCC_7150
 	tristate "SM7150 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_7150
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM7150 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1288,6 +1308,7 @@ config SM_CAMCC_8150
 	tristate "SM8150 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on Qualcomm Technologies, Inc
 	  SM8150 devices.
@@ -1307,6 +1328,7 @@ config SM_CAMCC_8450
 	tristate "SM8450 Camera Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8450
+	default m if ARCH_QCOM
 	help
 	  Support for the camera clock controller on SM8450 or SM8475 devices.
 	  Say Y if you want to support camera devices and camera functionality.
@@ -1344,6 +1366,7 @@ config SM_DISPCC_4450
 	tristate "SM4450 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM4450 devices.
@@ -1365,6 +1388,7 @@ config SM_DISPCC_6125
 	tristate "SM6125 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6125
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6125 devices.
@@ -1375,6 +1399,7 @@ config SM_DISPCC_7150
 	tristate "SM7150 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_7150
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM7150 devices.
@@ -1407,6 +1432,7 @@ config SM_DISPCC_6375
 	tristate "SM6375 Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_6375
+	default m if ARCH_QCOM
 	help
 	  Support for the display clock controller on Qualcomm Technologies, Inc
 	  SM6375 devices.
@@ -1482,6 +1508,7 @@ config SM_GCC_6125
 	tristate "SM6125 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6125 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1501,6 +1528,7 @@ config SM_GCC_6375
 	tristate "SM6375 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM6375 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1510,6 +1538,7 @@ config SM_GCC_7150
 	tristate "SM7150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
+	default ARCH_QCOM
 	help
 	  Support for the global clock controller on SM7150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
@@ -1600,6 +1629,7 @@ config SM_GPUCC_4450
 	tristate "SM4450 Graphics Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_4450
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM4450 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1619,6 +1649,7 @@ config SM_GPUCC_6125
 	tristate "SM6125 Graphics Clock Controller"
 	select SM_GCC_6125
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6125 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1628,6 +1659,7 @@ config SM_GPUCC_6375
 	tristate "SM6375 Graphics Clock Controller"
 	select SM_GCC_6375
 	depends on ARM64 || COMPILE_TEST
+	default m if ARCH_QCOM
 	help
 	  Support for the graphics clock controller on SM6375 devices.
 	  Say Y if you want to support graphics controller devices and
@@ -1728,6 +1760,7 @@ config SM_LPASSCC_6115
 	tristate "SM6115 Low Power Audio Subsystem (LPASS) Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_6115
+	default m if ARCH_QCOM
 	help
 	  Support for the LPASS clock controller on SM6115 devices.
 	  Say Y if you want to toggle LPASS-adjacent resets within
@@ -1788,6 +1821,7 @@ config SM_VIDEOCC_7150
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_7150
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM7150 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1810,6 +1844,7 @@ config SM_VIDEOCC_8150
 	depends on ARM64 || COMPILE_TEST
 	select SM_GCC_8150
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8150 devices.
 	  Say Y if you want to support video devices and functionality such as
@@ -1831,6 +1866,7 @@ config SM_VIDEOCC_8350
 	depends on ARM64 || COMPILE_TEST
 	depends on SM_GCC_8350 || SC_GCC_8280XP
 	select QCOM_GDSC
+	default m if ARCH_QCOM
 	help
 	  Support for the video clock controller on SM8350 or SC8280XP devices.
 	  Say Y if you want to support video devices and functionality such as

-- 
2.53.0


