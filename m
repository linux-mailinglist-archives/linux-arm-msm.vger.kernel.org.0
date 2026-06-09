Return-Path: <linux-arm-msm+bounces-112041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y235LNzHJ2ox2AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:59:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D765D772
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 09:59:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e5bwKaDP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cq6vcQdk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112041-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112041-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C984307F136
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 07:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C864E3ED3AA;
	Tue,  9 Jun 2026 07:53:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931E43F54AC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 07:53:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780991623; cv=none; b=btZWEyEw8DRxN1+l7hFz4P+hGtBK/qF20Lat+5zYmdONqm7GIN4AdKuEQ39guokjAS3wRwpdiGCVUEJgy1rxpprQzK2W+FiPOdoApjNSGcpp6DoYIETGLOob4g9QeQlttMA+/obvViNtv890x4/rs4P0ycLSzx1ZLaD0W/1VnJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780991623; c=relaxed/simple;
	bh=45LaNgBPxbRtyHZ0FmSbWF4XyTOkfAE6p0u9C1oK9dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ff1aYTSLtivuoGbK6Ev9K3g9hE97gYhnl3lQ69y4Ff0PEZaYpV38qNZnP/oQp4RIKW0kzTj2gwiK4tJkBQHWl9S/SKrCEwHkamFiIfwEMgDjutTMkhWk/kRUrgW2FkrTUJpXvAbiZlNwJnC99sw+OUPoaxXnuizbhh+Qave6yX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5bwKaDP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cq6vcQdk; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rfNH1568406
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 07:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=; b=e5bwKaDPTzMnR0Ul
	MMl9KzjZPAO3D4cvHAhIzVz5+f4NuKCH3NhSokxJwdcgSWREJa/zXZS5EPkGnu/v
	2upG/2b6d4I4pjpXyUWeoPuNUMw5ILcpskCSIhx0HctiPPzjwKXY77Avs1KS3VYY
	fwvSS2wn4zQTvD2/dYODCRHpHEf7Q7VyyraHdWxMiMrmOzdZIby9H6hSBumpiZr3
	e+2kNnMcK7x3Wh1ZK+RKbxXDtLVxBkmhO228D+HagLcgN7zUKFCf/KHFHx0DS2f4
	iEJ713MhrnSeyuh2tPSmwvibmfErZu0q87CTcDk2VP5UXNLz7UVWcNQpnAlpRkoq
	KH2lSQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx45gan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:53:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5177bddf6e0so2838911cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 00:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780991617; x=1781596417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=;
        b=cq6vcQdkavbKfLWnJIEooJjNFcIdfFqokkGpJTGGpXVRdwqhHKz7REBg4BDbZeIh9Z
         1lXcCCWh8sL0wD35Fx4e9mkCLNqdhZ94Pq+TRXZRCW5ej/GrWgx8C0hZzFGfgMi+aJYu
         ftZVW0foB/P7QXd3vhZAG/svVg9PCHwXfuPvFGVJeAtUHQauS56TQEWrG0a8SzuBBfj9
         vwcIidWIfZcnhZ1MyvYuVIBzEIWFB2YBmeYpOAIz7FjVQJP8Q7CHVnL+MhmjGaFmGZzW
         +h58YItGZ5camg2SIOeq0zFpupM5KENiG+utAuqXHbIPT9ZZd+YwanPS+pOmzzUvPzm3
         72oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991617; x=1781596417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JbaVcxwuW0pNu9X0F52ZmLiaxV03v+NOG21Kfuhl0U=;
        b=aJOvQLqNxE7iOzYSQhqOhvSMq1+BASpYDbzW9HH3McDNMf5GqK10JLBLaLe+R4HBaK
         BkGtoZ5Vz8AmLyEko1FVkCnSxE69/eWwlg5vlIhoebrckiInB0kgETdA8wx5c5nhpiGm
         CSfFf6l372u3J31cGIU+nAPwuL0/0p/WG7Xuk/Xu8kEtmHYr/GNMnRt2d4G7H/jLaZJp
         D2qdHdaFudclLKcU0X36SsPKXqsy7nvo2V+uoDLzjfx4zSVNxTfBLOYTSBBsu627oj4Q
         v6Z+vYf40E8B3NJfhA/LBf2RXXA8kdpBKtM0JUKJJGEHnGH/q/YMbeBMVtXBZziUfnAp
         cF2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8FIAEaT9kUxbJl9VE2mWLocA7PI4UMVhWdsbf/CvAHgWqmeVjy8lSn6cZlX+PSZpPmpX5DRvKFnDILlPYG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0/oVP69//BH/K3sKrXOM0d6ueJdMJLPKjHg2Lj3rwtXejnq7t
	gHf+vR9UGjbzoJFmnJ1Uu6ymLtOIeRGrIbe/qd4hY/Z1fOjmBeEzw6+XAgixx0IXZJn+DesjVjP
	TVwor1UxRG33SWyXDQT7iwQ7m+UPhrcq9lOeNMxagoVtqXRrJgVcTUhiYWb87imn7+R/2
X-Gm-Gg: Acq92OFA/RRNJcoCdbtnYlnJDfbqAk+TyfTJgy6Apptgm8JsAvQsC+sE4vPi9VWhpZo
	GiRI6ZGF0mbgJ0DiRysYQorq2LdmfqPYrOncgWp1pt0un+7ohvDwJjA7+RIjj1cEXo9RoJtOTc6
	XcGXlk6HkwnWfw2JutcKVeBB7qe5DFyqJoRCBZgkwcIdWpcyET2eTGCoFENKy7skr/7Xbj14cWE
	/li6tHYWdLCC963ZBytj8MycmNGHBQgIzWAlt1b2+dqHyBxVnuoMbDcrWH5uqqh03Q+WyS7J/r0
	VyNE4H7XX1NQ8sqmrOKKcg76FccUK6pko+tjHL8M0fdtMkY7FeWXgUI4M5vOnt5690hPRnkDO45
	IY5H0G5A+U8A4Q88Hu9AZafLq2YY2sw8kX9dcjZzqmbw8YEoa8Nib/JzgYVN9QM98y5fNrcrAF4
	tiTJQKCI0PTJBRvAbc5o4yAZNblPY0JPcaqfQOjrZagIhEocvIyGZvAYqLgWf+26TVqP6hNrVaB
	EoYlez749XA
X-Received: by 2002:a05:622a:1b03:b0:516:d7a5:afdd with SMTP id d75a77b69052e-5179867241dmr191571891cf.3.1780991616887;
        Tue, 09 Jun 2026 00:53:36 -0700 (PDT)
X-Received: by 2002:a05:622a:1b03:b0:516:d7a5:afdd with SMTP id d75a77b69052e-5179867241dmr191571431cf.3.1780991616438;
        Tue, 09 Jun 2026 00:53:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64303892sm8121631a12.0.2026.06.09.00.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:53:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 09:52:33 +0200
Subject: [PATCH v4 8/8] arm64: dts: qcom: arduino-imola: Describe NVMEM
 layout for WiFi/BT addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-block-as-nvmem-v4-8-45712e6b22c6@oss.qualcomm.com>
References: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
In-Reply-To: <20260609-block-as-nvmem-v4-0-45712e6b22c6@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a27c685 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 2Wq86BbtF-CkOLMrUJKfjiVjqAQ-sM0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA3NCBTYWx0ZWRfX7SMGi4vNCOB1
 hItQnABO+RtGzWMyxBSl9d/oZsKxzW2fPTX/wPmuUR9awAzF7Xybg94gMD5MSPceh8QQCxoWpgR
 TlXipC1Vr9djMK3nD1XzvHtwl0sPClgznm98OzweE5EmnUHu5D97R1zBz7MsaBGH6IcB26eaZZQ
 Ag8cgzIpHa5g2+LuUYCh0Eki/jYMF6a0vlODg5Bo+Hd0A+/yyONqsest9Rg/HYX53+jpj7BqJBG
 GpmJhS48itPOIQiEiAsuQNlpjf8XWUsf5xcQiKy5HjuOyQxogxT6zJdaCx8yvwaIumpxHgk97k5
 96KLbf+ntEFUP3g/TJRRjV00uOvwKnpHBlTOa7/eXGi5Gq2GIpMICLccjsWrs3IW7lQkOnE65a1
 wvlJcO2/FSL3ZpKOOntNVuMSCJSN+w==
X-Proofpoint-GUID: 2Wq86BbtF-CkOLMrUJKfjiVjqAQ-sM0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605210000 definitions=main-2606090074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112041-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.
 com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 757D765D772

On Arduino Uno-Q, the eMMC boot1 partition is factory provisioned
with device-specific information such as the WiFi MAC address
and the Bluetooth BD address. This partition can serve as an
alternative to additional non-volatile memory, such as a
dedicated EEPROM.

The eMMC boot partitions are typically good candidates, as they
are relatively small, read-only by default (and can be enforced
as hardware read-only), and are not affected by board reflashing
procedures, which generally target the eMMC user or GP partitions.

Describe the corresponding nvmem-layout for the WiFi and Bluetooth
addresses, and point the WiFi and Bluetooth nodes to the appropriate
NVMEM cells to retrieve them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index bf088fa9807f040f0c8f405f9111b01790b09377..128c7a7e76b5b089044745f5d6407d6391055fc2 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -409,7 +409,40 @@ &sdhc_1 {
 	no-sdio;
 	no-sd;
 
+	#address-cells = <1>;
+	#size-cells = <0>;
+
 	status = "okay";
+
+	card@0 {
+		compatible = "mmc-card";
+		reg = <0>;
+
+		partitions-boot1 {
+			compatible = "fixed-partitions";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				wifi_mac_addr: mac-addr@4400 {
+					compatible = "mac-base";
+					reg = <0x4400 0x6>;
+					#nvmem-cell-cells = <1>;
+				};
+
+				bd_addr: bd-addr@5400 {
+					compatible = "mac-base";
+					reg = <0x5400 0x6>;
+					#nvmem-cell-cells = <1>;
+				};
+			};
+		};
+	};
 };
 
 &spi5 {
@@ -512,6 +545,9 @@ bluetooth {
 		vddch0-supply = <&pm4125_l22>;
 		enable-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
 		max-speed = <3000000>;
+
+		nvmem-cells = <&bd_addr 0>;
+		nvmem-cell-names = "local-bd-address";
 	};
 };
 
@@ -557,6 +593,9 @@ &wifi {
 	qcom,ath10k-calibration-variant = "ArduinoImola";
 	firmware-name = "qcm2290";
 
+	nvmem-cells = <&wifi_mac_addr 0>;
+	nvmem-cell-names = "mac-address";
+
 	status = "okay";
 };
 

-- 
2.34.1


