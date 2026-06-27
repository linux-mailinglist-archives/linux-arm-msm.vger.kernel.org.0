Return-Path: <linux-arm-msm+bounces-114725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CFFWB/OfP2q8VAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:03:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7CA6D1B6F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:03:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AkW2Ds1V;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MXzXL2A6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114725-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114725-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9965D303F9AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 10:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AEF2BDC0E;
	Sat, 27 Jun 2026 10:02:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62343A168C
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554536; cv=none; b=bT1hHfVnKi/xxalWjg02Cw6TRAbMGXhMzGKPYJFIToXl8LD3kNYpN1Kr8DlyH0Fxs6iJJRm/8AdrLFHDOFTCkcOtlQ6hghdQEIqlQlNJiOfg2kj2KQSiE0tmyWFLKwiIoolYHqXCOr0s+D/LnFk2K5mCXzgQN1TBYe/j508B+Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554536; c=relaxed/simple;
	bh=OLwru4B0n9B4zjPqkxB1ugvevxz0A4+EymlOnCUE2yE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uf1TenVWjH7sj4Cs9cDz7Qm8on0YrsEWhr0he9FCSs3czUOUTql+WPoa8AnxoDRp8fda5Z/n2pCxkkEgSzSOKGY1gJ8jhaWEWczemi8Cs8F08kgiR3/jByHLli3A8xFwYcVMjHoTQntEjj5Zpj367xLd52hJ3wMB4Mo1beyt0Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AkW2Ds1V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXzXL2A6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9ZnSg719799
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mPGki1z//OChB538XbgvR2XCB8ufi4VZsCeqa27hZ9Q=; b=AkW2Ds1VI8c0oXHR
	Ej9yFntuegjO3YQYLf56EUUFYF9zhTQ9fYI2krdzRm0HT7mexdzKI8/10dq6T1Gg
	Zlo+fkYtpQC3+9CRhlso5s9oRtRBvPeMMg6/nfi0XvVSwUpMrfR4/wRxT/bGCfqN
	Un2sjTPDHQwjcNSgvxHaPI7m8E6o8YaoGUudy6K24KuDrO+4aFiE+IZ0sMf6rhk0
	mnBhuv5w/2bM0XrvEQZvYrEYCL+JjPoSoH13exyLg1X/ohMqO+B59yfxhRIcrYRO
	kOzu4z2Wy8qHJJG8eY0442clxxkk1G3fK/vShnVjrA+bUYyfKXRbL4u+32TFdq/n
	AXu31Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8gk28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ca81e05bfso1499191eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554533; x=1783159333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mPGki1z//OChB538XbgvR2XCB8ufi4VZsCeqa27hZ9Q=;
        b=MXzXL2A6HcUMmlOmVhX8o9AEIGfy5+3hzcteM7oZVPabgGHiKg0HyzQbqtmgv8eXmp
         CuRAQzZbEWYNH/AwpYLp2maKpSN2Fwwxutlg5IHoGlsNo219BMxPKwJM1fULhzjUXvME
         igbMRED7ycUUJfIzVDRD4T+I4iTBT3vNc44pifheoqMIZpM+WFCFi55zBgH1UpbYGdaW
         PTFHRhy49dhSnro0uiZnSA8dM7kTXkJ1wEl52tWb0RI5yD+yxzNPa6//fRSupRclYy04
         3uH63s5PJE607P1+am1/1km8vfjJT/EbuOdP5DCrBTy+1acCvlugCJoObekdaPnuphPq
         M6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554533; x=1783159333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mPGki1z//OChB538XbgvR2XCB8ufi4VZsCeqa27hZ9Q=;
        b=FFUup7tWugRkbw5otaZwaoTM88TY7WLkd/jXWllre39gJ067wDm7j6CQpUeGQVylf5
         IKVsFSN2Q1c9xbNqnmeTeApMctY/38NPF9dy0JwuYhzuFRUH1zI1un1gcZrRNUOnB2At
         Oft6/7slHqJQrRu/ptrJ3D9YLNiPCMkFGt3/JdZLyn0EHKUGjheSSZYY4AsRQ/djFs0l
         hSe0Kq6nCfg9jsddF0ydE0kcdECcHUTRBhsBHmUn5y9cHoiqmvvqhuyHqcSWf7K38/PX
         7XLJfMLj+tAkkOG5A3XQwD9IAslEWvw1uFA9QS0vDkROyLaqHIlQIynsWKYk47VdOO90
         jCXg==
X-Gm-Message-State: AOJu0YyE5qD4/teq+c/yDKawSgy/dgDb6L5kYkwFwVf16n1Ma9Xfl3WQ
	o2OuL+nhCwo4C26pnf/ORUjvNEC4/Kgl0Ted3UEkv2kcb/YFNuKW/r9ZA8Uz3abYsmGA38Ixd77
	/TpNuZ4/lcmL92wzkwJubdO0DZbE/FaJhrc7et+l4KomzxfImyHv1XW1IHO3mw0uKtfmR
X-Gm-Gg: AfdE7cm+M8egso2+n0SyLiYaT0BQiHLxyVZUc7o/GgK1IkOnh9daW9ryQ3F+SiHduue
	uMVdMDcJJamY2TMlKVMnPEEaPqwsSKfN8QeWzLP705gmeBi2xN7M0ICXi6hKmlTEtvhScdwpsBI
	E3zoYuQQA78Z6DJUmPnMmk9bCcwdb/+9SbdYi8m1dFjO3h3wtf+O7j5Wdrp60V8RanXsQI6qZ7H
	Xg/GmpNDg7DhLOFtlMFb4HOREkZr0NDNN3YwbaGApQ1Dw1O1T3wMcvRZEHR7HnZ0/Lx6u7yx2Sb
	md+NbJgJLnb1mzho301iDkABn2Ek36JYLwRJlhsSls7H0hMPppMP6GRy/0XwSukMylE+7WrfLqi
	Wff5rw1Uca0C2wCtTuHDRMb5PCNzcyAqniCfLLA==
X-Received: by 2002:a05:7022:e0c:b0:138:12fa:3794 with SMTP id a92af1059eb24-139dbab9a56mr8471989c88.26.1782554532884;
        Sat, 27 Jun 2026 03:02:12 -0700 (PDT)
X-Received: by 2002:a05:7022:e0c:b0:138:12fa:3794 with SMTP id a92af1059eb24-139dbab9a56mr8471971c88.26.1782554532343;
        Sat, 27 Jun 2026 03:02:12 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:02:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 15:31:37 +0530
Subject: [PATCH 3/5] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-shikra-dt-changes-v1-3-449a402673d0@oss.qualcomm.com>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
In-Reply-To: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=700;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=HTk7aJ6aEI8OqBHaXPdZyZUgaSNwdzb6u37QVKXf2U4=;
 b=YIKVpBf6Han0nPA1fwpOFpZq8UmiRj4F/gL7Dmcw4f7Csyy2mM3I5Iki9yyYsGbO3W3BQls7D
 pCWDMLbItWUDfsfUXGwOwC77SroE1bXv9L2N25c5+5Z0bY+FCVvb1ZC
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfX+ijOS/xy2EcX
 RHGkpMz4LicqDh/rFuiFrPzhzzSdj8rq7mNP7Ad7yct2Y21r733BCM/WNSPfrZPm7XKu4A+dK9e
 bd33eBZS1RzdUOnwlFQMdkzb4vSmAFQ=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a3f9fa5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: IfIkLj7ozG8GcGzP0SP-74PmhBQToyyv
X-Proofpoint-ORIG-GUID: IfIkLj7ozG8GcGzP0SP-74PmhBQToyyv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXyQh18Xz+J4U+
 x4m6fIosox5FGl+13W6OjfZj9nAjapr+1cxAec4oy6V/ng4099hgNBJrgNG9tsFPhuru7K3K8bx
 7QdtIAc00m2hhLCFRWVI/m96K2GOK5cQKJFl2numcxP53wvbGHROGzMcsj6688TQ7WeevGCJkPb
 kcMmeGxUmw+cA2nPY5X0eoqoxyRqQvmGfCIYaxdufNp5YLMmDS9v4KeWbbG4IpScHGeCo6G05fq
 TDPYK+alltpOeEcu57ojW5asdfzRutp7Okc2kWViSlgcohaqfZro+SEVAHZflJFb+hSqjg0A6Hc
 0ISwWGqwTZQRm8Yib1+ls0OZdNKaOyK240ZXYMygcPvApAAbSRRk2bgD9GIdSBNWZPeesPzXeUH
 xutfbdSCTVpRQd6nyWc7LNATfOESct4GD4B/fA8aJoP/Rv8EyGWNxBVizfZvakT4q9eR8vZDFkz
 A2pkuA5e6476u2K9AoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114725-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E7CA6D1B6F

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra board.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..0395873ec03f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1009,6 +1009,7 @@ CONFIG_DRM_MXSFB=m
 CONFIG_DRM_IMX_LCDIF=m
 CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m

-- 
2.34.1


