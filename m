Return-Path: <linux-arm-msm+bounces-111842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S+CnHlygJmpYaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:58:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F165565E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:58:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aJ+fkT9R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MPfVJOjJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111842-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111842-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E353F307A1F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 817D3305665;
	Mon,  8 Jun 2026 10:50:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E244340A57
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:50:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915852; cv=none; b=kHgVJTUOGyeqVzwdS/XlSZsoObNKYp9wFcoMZw6BlgchZ7xOyxXRu4pl81aBTqNXOrHfqMBdRVZaHMyqYNmFf5fepDYXjCpsX/u0eVidxbYzwfXKtUnOjY7xecZRe8RxeriOJOx/IDPyeKpmlgvms7nTQWaEUh54uOBSjcRTjLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915852; c=relaxed/simple;
	bh=RjAXLDtyeqYajrszhA7+nXfORAO+2o+t2+Lsa/IoOi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmvnkyEqeXQC65VjrVUc2Xi9xulcZvbdyC1dS2fr4SKK3e9zXTrUeAcHJ0flPjIWZ6s/ZyaOLI8cRG8Rk3x9Igrz9+2KMRpVrQxuWJhsxURzOY60oAcGqq8ezva+UdlLYzopY4sxK3Z03iZVxI9DSSyVfsOjcPLNumFBLzqavXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJ+fkT9R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MPfVJOjJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Orhh2274544
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:50:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=; b=aJ+fkT9RztRhmNf0
	Hs5tso3nBk7AfTBl5tX3u0dCwDsl9/+VUa5mSGG9+pqG3on1RpVlRxxHdc8wJFb3
	zY+XWpCb3vdIvPtr7thAx0jSUCumKMwLb+NuB2JkSon19TshTB5qEr60Z+VQQOl2
	0Ftfi7HVQyOgZMxV/XpVVoNhemQSEOBdCAFpNHFm9yBqoLJLHhK9CZPsCWUWx0Z2
	EkIaWR36t/KgMuA+GOQILSaEaeGK9mxr1nbCC05CbkC0gXgp8gzhB6eomjuEVy7h
	7GlHDYTYulnr540njGieZEuBxy6pxRkvl1rQ4DX4aQRU/dAuigSm+YvefB+ODJgX
	lTiN0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgy5jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:50:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51772325a64so56133661cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915849; x=1781520649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=;
        b=MPfVJOjJGFLlBO78o8TFHqNS+NOAOXZq0SaULctyHQfIT9TvLOuCfw+Zrk0sLHpRrI
         eXkCxoONPQhHpAEVmD7PZB1EZmauY+8K3iqD6IyNRqwHpeq8WAMZa4w9BUieosMwKgkl
         qF9p1MFchlxtbnfdVcxiiPCBx2NT88D9F1rBs/tu3nStirmRtD8HG2XvbQuDxjJ0BMXx
         CHgJ8MvsZrhk8ZAE6iR+YK7VrD/aeOASlVr8ZPb5J8KMpknRDE/2rCd8rLlBb1oMkO36
         JAhQ92KzYMEcac1+VF5X7IaeRq6DdUfxzex6EXZyeO1Fikc2SfSJiSBox2HtDS7wfjnV
         jZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915849; x=1781520649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7Clh3n6Vth4q3WERt/c3dsM43tyAEU24nXfs697yQY=;
        b=JVyTnsZgHFr6x9NCHEiOAMcUDCwL1LODGpU/cunpHkPum/QPnsg1D4KaNGqANTVTqx
         dr+5KW9hNOCXAhEtvGxeeudpMG9jT4/s6Spq2FhrGiId6fPjo8UO84IMgS6MnUsXkkVP
         vKBf9WYFpVcoogUqzaI3kNKvUC2r6s76uoVK/8XqH6S0Im/mlqYNKyZprXLsd6fyeb3P
         dXbHGid+AeMuP/s2OjnVoMjRRDSzD/aqEdWZs2D5lmi1oJT0oOa2tBPnCdKHprRsQXEb
         wecCYBAZQBc2EswItRZ7FVld733m1lymyR+WKTE++xRPogHK5eJPAbxDXgglPW+UghEK
         LrzA==
X-Forwarded-Encrypted: i=1; AFNElJ8WkUB/FUnqOKw0ckwPhdDgjHamc8XlWWONeJe4R2OMwop3xB8ZsbSNjQ5JfZmIFRr0x0pwp8+fqxCOrcAE@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4pFLxozoKPewaPJeoauMIt3Wa1q3kIE0Tk+5t7YFCOzQoAlMN
	PmwT9E5mu8R+77viaRBOOrtWrrOhgKlUZSwJ/LkVGD6k+ysY6xYX0X/Ke8DWaWLl5U3it0iv7n9
	VTlybqKbvjxcgcW5L7okKwfhLeLr1ALBdHSGBzKx0QvZBZcS2ZMiI5oQNFk4Ad7pCNFKw
X-Gm-Gg: Acq92OE+RmWZ4TNLEWZD1sjPiinBbAnU5xufReCZPkrWZayBQx6LeNZJaBYBgoDpEk9
	Y++IZ6fakKIgxV9daZ8b3KmtCzS3BgC5L6SgDhQw2f8mxuKLw0jK6gjrwRTJT5Jrhz9MJMagAwO
	XGlTWjisE8KX7upzGvyVjzQ9sCb2cUwgJ/if0zfgM+OI4OP9sAnAcbhdxc0LI036YMm1/w55fgz
	lVA0c/5thpkwAK9PJ38ix1lPBQ9UQor1HnsAwFSUrJbXUY87okkx4i9qPV5qPe74MAcYxfd9wMP
	gzO1GJ69ziLVoZ3XhfvOvox9PMf4HFBhKbUHY0gpCdeqkKB4fveFbD53u+dPDAvaCDVgVB00cZ3
	ia+kePptQ/FX/rPYg418+XpBNg0GRenAXeXSjKu++vDmL59sVkFRD4DqQzV/89/S16gvunm74/D
	4m7fuMB/VPvZRqHUJ8h2xA1L1vkIPItr3od4YdqJ8t0s/bT0imFZq9QVR7sLONdCerQnsN+Ek8B
	QL8tXL0E+na
X-Received: by 2002:a05:622a:1a9b:b0:517:9157:ecf0 with SMTP id d75a77b69052e-51795be13abmr201563531cf.29.1780915849282;
        Mon, 08 Jun 2026 03:50:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1a9b:b0:517:9157:ecf0 with SMTP id d75a77b69052e-51795be13abmr201563041cf.29.1780915848772;
        Mon, 08 Jun 2026 03:50:48 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm850399866b.24.2026.06.08.03.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:50:47 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:50:40 +0200
Subject: [PATCH v3 3/7] dt-bindings: bluetooth: qcom: Add NVMEM BD address
 cell
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-block-as-nvmem-v3-3-82681f50aa35@oss.qualcomm.com>
References: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
In-Reply-To: <20260608-block-as-nvmem-v3-0-82681f50aa35@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a269e8a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jFERsaRKWwo8c2z-USAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Y5kPbdwG149e08sCY8mo-wW5FeUqHjIK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfX7+sLW0zcJbmg
 nEjofZ5aKBGxbtuzJ3XsBSi5PaXYAHelRhJlHtWYybadI9zx7RCPx9+eoFl1Pnfiim5Gyh5mIZl
 iD9CmBrkCg0awl2ezINPrbNNO/b7uFxxTtbzz/D6/ADMAFqDLlMmfwPJIXYtXaTXcsjlePDhKyv
 ZQt91pk42sGZX6B0DvDJ0iz+5fz2pP08s8lvylb1LiGNu4Rzc2FhcZpHdSCOb40i4NXX5bbZ++c
 CiDf16atHVdApUmuIIvqOKN4pz+qB0QQQ3q8CqDbOv6ihMwgVPJtWVfAXORoGD97L0Rbkba9e1a
 y2dtbNyKhzxXh04xjA1TIW0TVFEylUHKCa86KWmwT5RhTTiUCJYlAETM51KcxwD4lcWI+zUbhpI
 fpgEA/wJpZJXEhN/owYK6EGJNjqCf9QbT0WIcxer6EPoFUhOvrDw346sZv20JsgVP+gGJPH8k9c
 sZL33jdUG8xCZJTKbmg==
X-Proofpoint-ORIG-GUID: Y5kPbdwG149e08sCY8mo-wW5FeUqHjIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111842-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,kernel.dk,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,davemloft.net,google.com,redhat.com,lunn.ch,armlinux.org.uk];
	FORGED_RECIPIENTS(0.00)[m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:axboe@kernel.dk,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:srini@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:saravanak@kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:daniel@makrotopia.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B1F165565E

Add support for an NVMEM cell provider for "local-bd-address",
allowing the Bluetooth stack to retrieve controller's BD address
from non-volatile storage such as an EEPROM or an eMMC partition.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
index c8e9c55c1afb4c8e05ba2dae41ce2db4194b4a0f..7cb28f30c9af032082f23311f2fc89a32f266f17 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,bluetooth-common.yaml
@@ -22,4 +22,13 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  nvmem-cells:
+    maxItems: 1
+    description:
+      Nvmem data cell that contains a 6 byte BD address with the most
+      significant byte first (big-endian).
+
+  nvmem-cell-names:
+    const: local-bd-address
+
 additionalProperties: true

-- 
2.34.1


