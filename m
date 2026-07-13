Return-Path: <linux-arm-msm+bounces-118727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /Y8ZCgO+VGroqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:29:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8754F749D43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:29:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EOsGn+E9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OKzuM875;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118727-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118727-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8094E30363DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B313E8C70;
	Mon, 13 Jul 2026 10:26:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D253ADBA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938397; cv=none; b=tUL84vToMCBlNCAQjdJLAi/Hd4Zhrmls7ProXqkYA51zLCcurnzwpb9rbiHPW4Jee+3GBknkMmxjbaflnyV+GiK0HYwvWCctp3qe6VyRzxbm5++vWFoQ1c4RVkR7UbhAxW6i2yEdSVOOl+Hgcs3YLr0ROALmPH0JmamofhYqSNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938397; c=relaxed/simple;
	bh=j7pyGAp0UgGpWoVO3bYW8vqYqwh9o5Oxzwd8e6+dfm4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XjrB1eOAmGlRxjLnRux2Nd1grdLZnRHSgM9ke/Itn2797CCJFF6UB0dFEq5qogOB8OmaZgl113UrUJLLqHuj0aUiqU6C824PvWaFZkmDn75sKd5FdqCOFtfKKWzPEWqsk3LkAnatuP1KulMyTGagJkkbfTOKCWf0IwO/hsYaxlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOsGn+E9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKzuM875; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NpQ4732266
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYDpM3yHEr7nEa6R+L2fdNUfr3gnkfkg7EwXfX9+5JA=; b=EOsGn+E9yMRqvHem
	SbCotkLv2xzmTfaMGgHG9xyJF2YqLIFdWLtat9mSyOrf+KLyvKm0JFRD9Jh79evk
	Tj/8/J/AREgYTyYfywLtt2M/IQOx5PLoOaiEycBpK33DqlPgB+cBjhT0fE6T9oRc
	kWs4VD99qeX5/nGMKu9jEQi1u4ihEvCPXpOqqYkU0et/5Ky6Ph4W9tK/bJDSBaNF
	eFDsCYepWEyQSRw0wIWST8vZlGMGHlQPyBBMRh4ctJl0CimWvpJOVEB6eC1DY/qr
	zvbSGSLiRwGBACuPVlnVC+9kXzP2Fvi0JWqVwnTuCr7kMwCPCJMVe+T4cRb8yRA3
	3RU2Mg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a28f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 10:26:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8924f4d0a4so4491500a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 03:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938390; x=1784543190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYDpM3yHEr7nEa6R+L2fdNUfr3gnkfkg7EwXfX9+5JA=;
        b=OKzuM875E2HkSF2MY2V2apItQ89nP/EsqAWxeReqxVs8t2Xm0Sb4L1LB6SLJeg9gHU
         cu0ijTvENvixx+lRuVHon4ltVeqEudoyw1nJqDyQ9xikiinwEDhyNbnkrEe6fYROCK6K
         m/7FGQUdc0+Pi1T2pgO0MiOK2GnoL4xdqz941+/06lgncarks/2HJNibqIfGo2U2aU1H
         kjYbhIZULVra9yggTFcLgFN491000w0IoXkbpNmd+Km4TzdVnqLHdcI685rZEE3eqH4c
         s5LrQgMs1xLXBzxbIymxikypD1LVriP+V9QCY+b0Zt2mw7pOPSCO4D/ittC/EhNHm6yw
         4rNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938390; x=1784543190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYDpM3yHEr7nEa6R+L2fdNUfr3gnkfkg7EwXfX9+5JA=;
        b=V4nmvoLyEZYYaJaRebglg5Mu7TEdwLyakNS9jOTwLUHzO+z3Oz+7LSu7+y71Fx2SDr
         kFCsdurwhbaWv0eLbCGp+jwva6sOKi0dpOMMRZLT2wvSqiwH5MCaF97Ky2+NV2P4ELb+
         p2t2H4LMbxbCva2ma7/nacitF9vlCk2GolEbMHLMXKma/w96j0lG3OjFGX50v54b5SSD
         pSBxYTvjVRRdt4eog90My+jvbcoAThynkiGEVEIJXZdCS4gh9+bZgy7p05VRR4uyBVPH
         RNWlqCSKdSCyCr0SosNitPBpATlKDDM85pE1bRuxMHyG/W1QRUySf3rjTJn0kTmNsy8s
         o/yQ==
X-Forwarded-Encrypted: i=1; AHgh+RqhxBzORC1HgEXH0ZCriNHPoiozoV0nyFoyiRVYi/j2h4YmL6uXpOHKd7PqqabEW/FC44dNgucVA3hFfhKZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyQJ7eWzOQuzgGmuYEyiUe/EDbNxaL0H1+K8bluHDUfv01bbCnz
	k5fD4EIW+6CtLYGjDIJIb8bJcSSDgCfjBV1MXQ4SXi9lpwG/ffdxkMOnDQ7jo9mPU75rlYvI3sx
	+6O7ViEG4ErTnn/Fi/+mGUV2zSDesq6UWWYdAUJLHggc7sI4Lj78QbhEAp7xOl/R9EJu03FBdWM
	4U
X-Gm-Gg: AfdE7cnvbk8M0rWvasg2J+5CoEfXKrfGodVWD02rVdUEhzon2GbZ9AE9Ew5EhbCKJlS
	KkvhBjJ4M6oAbo8WOcCIe4DBuMmXVpFNuvVtUgyEIjYNVIZM+qIRT1eWvogy4ZyRjsFFfCffHx3
	5PzlOSgH+/OsfadC2EdDRk2MiFCOlNNKFoS1zaFVzWB/zQdkEPyAcb+cmhQVDSZ1QJa5zFYgN9o
	p68fXThae2BJCS8wYwcihBcIdRlQyUy7S7rEqJfvnjYtfMFKpE0Wvi3HMn4slz6xU3kS2ICAYkS
	rsI8l/A5Yqo67C3+7TQi7zuNjAjNCsCT5E5t7+uB13juRQGcwXFv0CuPyeUGf3VK3F/c5kPS8Vf
	wCoZ7HRmWvygM1ucJdXDXwQfFjeKUhLjbh7oFpg==
X-Received: by 2002:a05:6a21:730c:b0:3bf:98fc:3054 with SMTP id adf61e73a8af0-3c110a207e0mr9293560637.56.1783938390593;
        Mon, 13 Jul 2026 03:26:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:730c:b0:3bf:98fc:3054 with SMTP id adf61e73a8af0-3c110a207e0mr9293543637.56.1783938390196;
        Mon, 13 Jul 2026 03:26:30 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm48465704eec.8.2026.07.13.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:29 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:56:09 +0530
Subject: [PATCH v3 4/4] arm64: defconfig: Enable ILI7807S DSI panel driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-dt-changes-v3-4-15102fca9570@oss.qualcomm.com>
References: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938370; l=825;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=j7BjE0MMpSVBC7FmP3CEL416Fp1EqG4732WWyMo5vus=;
 b=JhajSjmbsaPUdDERWHOJB4J9crOTXwEFcg0Gohew0y/7MNaFBmwR0S4knEHCC3pJ/psAFdNYy
 TOZA8bjn4BDC78dartqEYeLsxeQbRti6xeSGchBs3EWf0ZKayd579W+
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX1SQ36Ubel9/+
 M3fVcZfNYoqujKAzOqJFmmYawl9AXSdR1Ko44LI/U8DhzOq55gh3GuKJYas20TpukJ3RRJbNoTU
 2cEl6XPGFby4Q+rjoNsFDHHY+17F0Mqa3TthxshEWdA/o9zSN3WlWXniIBhhjVbDZSNhKundiGV
 WwNI2oldjR9Q0wALSqBdOM+gHw0q1ZCzt9cZeJBXcVjH7maq5psNU8TISWe+v7lO+81SzzgTZ5e
 wL1c7tJ0m6KOKPcmOfqBpqc/lzBCkiNjPo14eFho9YR6M76O/kJKtRLkUWOTrOQFvctnj26cLPN
 lcp+ejv2a/MsQQ9+4wEOGffz7+GKGNSEGI/ZONgGXpUyvoFPVHzIaQhOdMTOYNJWkKw1oZjZHH2
 LDPSYRGOqA3EDWDe1qHfCEXohCY7VtwOBFQYepQWSlLHpN9owZQLzVS/uZUG5dmwidAdvOmXMXb
 ftsEgNKa/MvzIz8hENw==
X-Proofpoint-ORIG-GUID: tHYC3l0ntpQDHZ37aRv707mkUjgWnLdG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX0QaghluO/LMT
 zor9Lg5y+jMQicISBEPw6OE+VGfSFhuEItD4W5ncjI/UhSoAcQ97BgeuY6CGX01J0BHDscmGS2V
 DB0oMAUnXF1zGJ6YCp0YKZARxBuGT00=
X-Proofpoint-GUID: tHYC3l0ntpQDHZ37aRv707mkUjgWnLdG
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54bd57 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aMhaXRkMA95IrCOZcTgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118727-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:arpit.saini@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8754F749D43

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
used on the Shikra CQM EVK board and CQS EVK board.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e6ae93e533..53f7b3d104ba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1013,6 +1013,7 @@ CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m
 CONFIG_DRM_PANEL_HIMAX_HX83112B=m
+CONFIG_DRM_PANEL_ILITEK_ILI7807S=m
 CONFIG_DRM_PANEL_ILITEK_ILI9882T=m
 CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m

-- 
2.34.1


