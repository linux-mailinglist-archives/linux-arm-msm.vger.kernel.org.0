Return-Path: <linux-arm-msm+bounces-112788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GgGEBoMAK2oa1AMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:37:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 161056747D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:37:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Am+kO7Mv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WYmMebS8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112788-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112788-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC51D302762E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738E84968F5;
	Thu, 11 Jun 2026 18:37:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59654B8DCF
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781203038; cv=none; b=tI70D9YIQanMIhdcC+25Xiqi7ogvGhXY1cEplwBIXRoGgIWAFVPYMU29ZI4wE6hrSxR24tlkWMSlI0QfukOolwn6ftxHGeeZGUL5rXncHdyCP+4TNnciQmogpgQM3b6iAkqWdwhrARtyqIKgY8RQXIyJjW9vGXdGse80ZxnmPJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781203038; c=relaxed/simple;
	bh=zOSsQzKp9Ek2NG4SPxgCoFd3tA9TdR//8RVoOu+YbLw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KXg5kOb470BrUKmQ0aVgBkomMSIl4Z50jnK190EuOB4QORT+VvaJB77Bt7MhjM6DXdnTOQc9/U304x7PLWJRcYTQpw/jpD2QOmM+ldfgW8In666qbbUHB4Iorsd60jiIW1SOQWR6LpsBqYCHFyVJ5+5swYKThcYypwzEmSYufWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Am+kO7Mv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WYmMebS8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIRsnZ1432923
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E804jMacXtWtCDDLwtWj/k
	LWRm+8LbGO5xfXQFEkchA=; b=Am+kO7MvE2JznTUpiQv9SuQvbh0OX/Ic8+aNSd
	t1MErlnFU5i100juIcjkAXCarM8B5S2gmabQZt68Bz/+nAwpBCPvfZ1YpK3+Q77p
	Ew8ipyemW8UzvkMr4Zk2TMq+gCgziEX1lu/BX13+/TN2zxDxXSSN0B0kdv2le1Tm
	PD2I1xFfrqdubBZwQNnfXlpLH1i1O9PJHRiBdH61/uJjxUAWCAyte+Xm+CBh48J2
	BPNEQRq+5iHPnkUDfrEA2YYhNdqzcutOBfvwS+7JYrYNpdfS0WNW7aPIR7m0O4VC
	2Coe4tXA0ylM4rXC4zuEniYmZBn+suwAkS86dOLGGAY61mrA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7051je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 18:37:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85a2c305d0so63101a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203035; x=1781807835; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E804jMacXtWtCDDLwtWj/kLWRm+8LbGO5xfXQFEkchA=;
        b=WYmMebS8kthS2nqn6VtXvUdgNAj34OVPgyUcwmi1G4ktszS0LEqMc8aoe1nx+zKyfK
         g0BqTdCbIfvbs6LtamxHfxIZG73SLj/5pr2230XGH1+yj9Z6H4lgyRdCXDRAjphAKgBP
         gVGnovDUGO8TfuTw81KFfDZQ7e9XC00O1ImgljvxBAXY62h4G65y4w16uGhACG/ucook
         hyoNx76Xij3fco8+kGSRe3yFNufJ3oYsWOxxRHOoUbBxpQX5h+HKcPQWxcdgv9xO++/f
         ZsOg948wBA9LlMeNRkw1Cab32IwnqOlImyLlJP+dk8kC/kA7wTwu6A+97U09TOF5XAgY
         IMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203035; x=1781807835;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E804jMacXtWtCDDLwtWj/kLWRm+8LbGO5xfXQFEkchA=;
        b=dH5pn9ucex2SqONxBzGyDoxPpQjvYIGfrtJsG+IMUeuR2YyBTokUWjynDXZBemsjT+
         To8uRP83GHeAPIBrtm6E9z8RnnMN5vObrcyaRMjqgBcP8a/ZBkXTU2zNiMINeP8A50TA
         bKnZKBPxnTcxURfs7zYnjwqZDXUTMVcSH0vLLtMAlYEFh8HeHSTckJMhHUPC+HvLOpkp
         T5lXseeP2DS/hF9upvdyUzPN2yZnvoyC89PIFhFuHhJGwbgtTCd9hRJTyajFSJKDFphy
         caxT3NEvd0sqUZAT6SywCc3yfPGjcBSJoRWTWpEzIaT3FPLN0ai6j9Y9HADGJOednid7
         ZhBw==
X-Gm-Message-State: AOJu0YxJvNQLp7nx+DZu7Vqi4vVAVFu7d5ur77pY75wmVsMaRSo9qAp8
	DvS297nnoIlDli6qupaOtjuWwBw5gw6qW/sP/zSDBsBnv3aUzQZowVAz+uKsflVzy9W66oKYmXi
	X/XRftAd0bOJGhxtS1exFGTBBL+0VuZjANPDRaYA5shLah/15SXu7kKCGt9ayb3jt+2Ed
X-Gm-Gg: Acq92OF5ZZaxBZ4sAt39IT/h3ljX0hFGzpBKDER1NzFByE++NCEuJ8s3j5GTrQ/7gm6
	w0w0M9SKLAy1+Zee3TTQIPBuSQZa768+PRowZ2hYmVhSy/7Z/rByffGich6btBSY3qg2oQ0QgZI
	qoHFX+h1RBi7/WsjbQpR3D+WTdgaXDmfRKOigSY90kGt1H2QR1Xp8TTnNPB1EM67sMGU0H0xYAh
	Qg9BCPAiazX+8uAmF9ZjkNE0ds1ztBS0mtWf5VCxPpug3J0tnFe68aWmlV6DnaCs9Cma7ERLuqe
	AvCBH5RzwHKGpxTvMgeFBcgZ1Zuepblq3JWfgNuzbQX0HPALfsbnbdLn+Az1rEfYx+ryJPUPJ6F
	EVIvHFZGp6xGO++syYEoMHmZjBdI3eDt1I64TKYBsMHC2gmmlkd0=
X-Received: by 2002:a05:6a00:9a6:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-843370762e7mr4554940b3a.23.1781203034618;
        Thu, 11 Jun 2026 11:37:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9a6:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-843370762e7mr4554891b3a.23.1781203034021;
        Thu, 11 Jun 2026 11:37:14 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:13 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Subject: [PATCH RFC 0/9] net: stmmac: qcom-ethqos: add Shikra EMAC support
Date: Fri, 12 Jun 2026 00:06:56 +0530
Message-Id: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEgAK2oC/x3MwQpAQBCA4VfRnG0ZsslVeQBXSYthJ7U0Kyntu
 9scv8P/v+BJmDzUyQtCN3s+XASmCczWuI0UL9GQZ7nONKLylncxI12WxNGlEA1OBVZLOWmI1Sm
 08vMfe+jaBoYQPj4Pg6ZmAAAA
X-Change-ID: 20260611-shikra_ethernet-11a1b318d5b6
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=3357;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=zOSsQzKp9Ek2NG4SPxgCoFd3tA9TdR//8RVoOu+YbLw=;
 b=mC8YQ0sxi4GApKV3k18i5RVzeURK1818Zj96NEZXl6n//I2UQPAi66L+X+JKeTpokQCenfv4t
 981HGHRwgSGBYozy7hJolcaURX9DLt3h145D3F7ol68bmeUpGxMO+pe
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: j194Bn1zmFEPweyfvcht-QShpAutY2mN
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2b005b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nYSQqZ2dnBPUVzQNBmkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfXxVTs6hqc3ABQ
 +d/9UgrwB1v8wiMlHYioszJVgaijUkD27bF+wsipR0y5JY7CXK/lIq4w9TpcQKgevS3d7ZzYK+n
 GZjvP/rJaZbO1IeMGzVu3tnO89Et114Mjqft0k4SyDLUKbrihVH3YbdcWGnPUv9TWCVoQeK/4Ho
 Qtv2yqvecMRJKlw8GlB/tUdAPXG5/eM07x2Zrjykn2xysECw77eT1CRcyLZEHXR48HghhYXaiKU
 dMlKM1HKM112N89j23Y3smBqHI552JMm8fyy8wwDUY/YA6oVK0LVzPkWc/z24dyZn44voNPjo52
 bDuXFLwVgNetqs3whPijRqL+cgIcNorXP7V2xlWiMg/oPBmQKao8l1yCWOduqFIqGmOv0oQvb+p
 K65YlYavQWDqt5srZg52RCqp+ZoSSUrBRwdRjotlSTcltdpuSIOLGR7ZsV12bdtmHybffbPZ6Ge
 5e9UkmvzNWwrk0bbpbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX1joPrI7ejqAS
 byVqMDZnsuYMC8CWK8InUxSWfp5S99DvxR6fstetogv/gLeOoBlQzKn9ZdepZHWoibysys3I5Bl
 I6oE8eLEOT8AIxy8qWap7Q3mYA+oBh0=
X-Proofpoint-ORIG-GUID: j194Bn1zmFEPweyfvcht-QShpAutY2mN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112788-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux@armlinux.org.uk,m:linux-arm-msm@vger.kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 161056747D2

(Sending this out as an RFC because we have a couple of fixes for RGMII
handling in dwmac-qcom-ethqos, as well as a new framework to manage
clocks required by the System NOC. If this gets into a decent shape,
then this series will be split between patches for DT and net-next.)

Hi,

This series adds Gigabit Ethernet support for the Qualcomm Shikra SoC,
which integrates two EMAC controllers based on the Synopsys GMAC IP,
similar to previous Qualcomm platforms.

Before introducing the new compatible, two generic fixes are applied to
the driver that benefit all platforms:

  - ethqos_rgmii_macro_init() is converted to void; the return value was
    never checked and the speed validation was redundant.

  - RGMII_ID mode ("rgmii-id") was incorrectly falling through to the
    standard DLL bring-up path, which may add MAC-internal delays. The
    fix powers down the DLL, sets DDR bypass mode, and programs the
    IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. The clock
    rate doubling in ethqos_set_clk_tx_rate() is also corrected for
    bypass mode.

Shikra-specific additions:

  - On Shikra, access to the System NOC from the EMAC is gated by three
    dedicated clocks. The axi and axi-noc clocks are sourced from a
    dedicated RCG (emac0_axi_clk_srcg) per EMAC instance. The
    pcie-tile-axi-noc clock (gcc_pcie_tile_axi_sys_noc_clk) gates an
    arbiter internal to the NOC shared by both EMAC instances and must
    be enabled for any EMAC-to-DDR traffic to complete. Generic
    infrastructure is introduced (ethqos_noc_clk_cfg) so future
    platforms can declare their own sets.

  - The qcom,shikra-ethqos compatible is registered.

  - DTS for the SoC and three EVK boards (CQM, CQS, IQS) is included.
    The CQM and CQS boards expose one EMAC; the IQS board exposes both.

Dependencies:
  This series is based on linux-next and depends on the core Shikra SoC
  framework (DT, clock, regulator) being merged.

Tested on the Shikra CQM-EVK, CQS-EVK, and IQS-EVK with rgmii-id mode
at 1G/100M/10M speeds.

---
Mohd Ayaan Anwar (9):
      dt-bindings: net: qcom,ethqos: add qcom,shikra-ethqos compatible
      net: stmmac: qcom-ethqos: convert ethqos_rgmii_macro_init() to void
      net: stmmac: qcom-ethqos: fix RGMII_ID mode to use DLL bypass
      net: stmmac: qcom-ethqos: add per-platform NOC clock voting
      net: stmmac: qcom-ethqos: add Shikra EMAC support
      arm64: dts: qcom: shikra: Add ethernet nodes
      arm64: dts: qcom: shikra-cqm-evk: Enable ethernet0
      arm64: dts: qcom: shikra-cqs-evk: Enable ethernet0
      arm64: dts: qcom: shikra-iqs-evk: Enable both ethernet ports

 .../devicetree/bindings/net/qcom,ethqos.yaml       |  31 ++-
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        | 119 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        | 119 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        | 235 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra.dtsi               |  78 +++++++
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 167 ++++++++++++++-
 6 files changed, 730 insertions(+), 19 deletions(-)
---
base-commit: 999ed3289ceea2b2808f396b4bd2f9a43dcba033
change-id: 20260611-shikra_ethernet-11a1b318d5b6

Best regards,
-- 
Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>


