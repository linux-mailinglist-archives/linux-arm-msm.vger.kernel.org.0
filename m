Return-Path: <linux-arm-msm+bounces-111841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vXbfGFegJmpUaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:58:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE5B655658
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 12:58:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DIbofuVL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xg8fwuyh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111841-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111841-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE7A73076F1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 10:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE2C340A46;
	Mon,  8 Jun 2026 10:50:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4638533D6ED
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 10:50:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780915850; cv=none; b=Mj6Ng+z2+0Aa+0boZOg9G0ngXq2+UhITTML9zI9ooRkvUCzFeL/z3C9NXUmpYYtteExo2QbZJEGYsw8zsQ+zdp32qWVHXxKqVmdTjuUKxrgFqc7lIiMTcbq+9cfjEg7zbI+BJdR5247I4mGmtw4ykXFgmtQCvQEQGxVd9ErsFRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780915850; c=relaxed/simple;
	bh=Py9S39WSsqNn5txRhNRguCyI8QhKY+XwVW2450FRg1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZw0hbdp6rVsIPVwn4lEl+TxfphuVKWM3osmBGuylknwoGr3q2kvfLZI8MOwXPBNC1moYJK1sksCcWQ1aL3VGN2kWalYrlMgSLdnv5nbEy3gFZMyLwZmR0tddJJ0Q1M5cSbw3u04jvcULodPjwBg8RrAq6P1Ixd7c32b4WehJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DIbofuVL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xg8fwuyh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65892L2O2677815
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 10:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWi+MtCOvdURNk0hMiFLYvRu4fS7vb184xBw7cGri0Q=; b=DIbofuVLZ0OazGPY
	eM5Fx7D4dpdBevCAkSGgCG4FSIbgCFSVwfZW4LCQAntAgjPxORVNho5v1DCgfslF
	W9kj/1D7UKheGa6LNYtUnNLQJOOex1NVWxTPw0zSfl2lx2eX6JCUa7+aDO+bKy+c
	0rqCQHpy+l1MKNyCZSbY1v3ObgIN6qzypHWDb4Z0yV4PFVe9jK44lABrGw5Fjmsw
	PrwdFTEvzBigxfKLrzRJ5wPt7S6hQ3nCmbvRqXaFkcchzzBXhc48ggXw7gBo+OG6
	LwmZ7+R826Z8AO3t306GnuKl+gyzgYPbqTIR6jn3mGtVnInRVeLXvRIVySfZjkUY
	HJaGEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrkrfdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:50:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5175a1e32e3so119761581cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780915847; x=1781520647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWi+MtCOvdURNk0hMiFLYvRu4fS7vb184xBw7cGri0Q=;
        b=Xg8fwuyh30Lia5IJYEO4AZ0yxlRGlMlAhHftmr7YKF80ePg9Y7Uk7nr2i+abwZd/7h
         VQisWow6IUfiqvB7IJF04yFdF/2+mSt+ScAQ3ZaZT/M99LERO//4Hpa1bkzJC6EE7r8d
         8mVn3G7yZ8qZGlWgpPmcgRaJ5DMIIXHaRCA75uOVRcbqUnBoyWrWMr5PUiOugR3hdnS5
         mNRzJkHcl0i2ZIVVK1JnN6hyIjugr2cajRP/0+hS9mQ2DDgzn44RcycXARh/I+6E9WTx
         hx8CIt8xEQxJa0w57pihb9VqPXWvLw9lB+jsuB5D7vQVsa7z3giu8tOaRns6E8XRjqF/
         GF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780915847; x=1781520647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OWi+MtCOvdURNk0hMiFLYvRu4fS7vb184xBw7cGri0Q=;
        b=orYt5M1kPPJAmJrLFXtE7KV7wyK3vIUY/gQWPa19Z6tOCUFPKnI4I0R3R4wkQNaAEw
         pd/HxDytnV/MJxq/gsgN+1AiFzUuLTrqy+nnTyqpM7J0qtLYQuK7zumwF4AV9tYMlree
         pu6SaeFyzp94ZE/tTlndrhVFWxzVqZbp/BCXZ1WRJG5wkutEZuliSFHqCKZf0dmu2Wi2
         RmctoBcTjkwX3qTlDOH/IP66B1niOnT7R2za5j2P2OxJMIpNV9spGEqO9DEBLj/jRx/N
         mLTbjvj8fjfaCWJ+3jfZsLs5j5v/Funv10jqvjX66FJIis6kRB/vjNsyh4SYE9cRl8qW
         gJsw==
X-Forwarded-Encrypted: i=1; AFNElJ8sR/bo1I/dQQdz9mEQF/0I3G7RXjnhcTh0q0pZOyKWxbL11IynXm0LG2373yzXtOZyzGkRQn277Rr2sACJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwG5i3cat2h9PkbBXM50klSHtm9puFvMi8m22+kDOJdjri2Ob2s
	7aTV7aFLKuV6Y4mCK6hEF1kVvpt4vfksIWzGmROl7C2OpYISyd+9ICCb1td3TRw+1ynwEuxEBFJ
	oaLXgOFGLBXEmalhAIkX19Y5b9fRkEDyh/QUWIbVkvEsF99ymSx/FimALmtahoySIFuFN
X-Gm-Gg: Acq92OEBynHpWLo/RINNary3XusFjH8lbj1NoR+hffSBf0OPiEHQ2eI0MvF9xx/kR7g
	+MBzS1dpjlEP4AsUtPAtO8iVacjcCQ+03KhsbX1M+tTtXtCQfnGf82zbBKi1SkAVH5tWq8rK+dx
	TwxQODCuBqytbqFAyMtqHy8OubwLhpm2pz8N2Dg3t8Y8clCW9sH39cZvLQRCGI9ryqrcpxnN/0E
	PA56XXKI+IMGTNDESI46dwiTjBZBIjbYswLodWwb7GxhfAcMvCS8WxlSArrXp4OrwZWJCTqLqqd
	ys79zIdhH9SdduPXhGX1s10MAEDhavPxKHdAeyu8CLbA/qvhEdDBMX6RQVwNqtvh84XClQ01mem
	ezA1YzkCahk3uzzpFmSekvjEkPZYlYCsy8u60UBbqq1YX/Ac+i7tPdYTeaxbUSQEAvqN66GtrF/
	uD+YvPu4YzWSIC6UlTpo6UQmx37MkOcYPR9k4vSGjHPty0P0h+NYwzgYOTcA2srmPJbTk9BS5KN
	qMsUZNTR/29
X-Received: by 2002:ac8:748a:0:b0:50b:6b21:2a83 with SMTP id d75a77b69052e-51795b7322cmr169213901cf.3.1780915846620;
        Mon, 08 Jun 2026 03:50:46 -0700 (PDT)
X-Received: by 2002:ac8:748a:0:b0:50b:6b21:2a83 with SMTP id d75a77b69052e-51795b7322cmr169213621cf.3.1780915846226;
        Mon, 08 Jun 2026 03:50:46 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm850399866b.24.2026.06.08.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:50:45 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:50:39 +0200
Subject: [PATCH v3 2/7] dt-bindings: net: wireless: qcom,ath10k: Document
 NVMEM cells
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-block-as-nvmem-v3-2-82681f50aa35@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: PfJE7aN_HCcnzVFbYN7pBZACcD1Ui6mW
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a269e87 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: PfJE7aN_HCcnzVFbYN7pBZACcD1Ui6mW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEwMSBTYWx0ZWRfX2TmVVL/o3Vec
 ZZs5Kgi9D0VTL4NT3mzLss0kzS+XLcRqhX3mJpO9DxB9th5IsEWvCm/fpHfJpbV4RJorZJ5WACK
 qZnAGE5AawHxCt+Eieg5PGTj3um4pI4njEHDsZOpr/8zEXv4xtLpmpeikMno6at05z/uxrTXAGw
 0x6pNoswbKc+8wDPGunzRi5nbxRUFAuMDw9LnW/qxm+wQLDlvlCzRim20zQuogYrFCmcDpTpTZ0
 FWBDdzz0QLsWrNp74n14adHuqU9eqZ//Nd0//UMJYBfiMuMrKhs+ZQbn6oBxjOrADOi+2g7Fndl
 ShBs377RsjD/zh6EVJoeDvo8s8+h5xXc2+xSrwsqNJ2Tu5dBcEn1VibGhNPiy5IEvD4Z2fts6A7
 /7T4TO49UmduMvAWqFSdvFPdHvaRN8ml/rwT9sy9y89K/dbtwlZOI64nIgo4Xff1J3uMMsWPmYS
 2shEPtkr278EH6gtNJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080101
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
	TAGGED_FROM(0.00)[bounces-111841-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: DFE5B655658

Document the NVMEM cells supported by the ath10k driver, the
mac-address, pre-calibration data, and calibration data.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index c21d66c7cd558ab792524be9afec8b79272d1c87..7391df5e7071e626af4c64b9919d48c41ac09f1e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description: |
+      References to nvmem cells for MAC address and/or calibration data.
+      Supported cell names are mac-address, calibration, and pre-calibration.
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum:
+        - mac-address
+        - calibration
+        - pre-calibration
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1


