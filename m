Return-Path: <linux-arm-msm+bounces-113097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Uk+UDTumL2pGEAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:14:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB9684156
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 09:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="DPYp/7V1";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="S/z/f2Sp";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113097-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113097-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A8B0301725C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71633BBFA1;
	Mon, 15 Jun 2026 07:12:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06BF2727E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:12:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507569; cv=none; b=QmJieHc3XwFFAGJb8uWTnz74y6OCVxjXk5MzmA2jJcdLgtuOOevdm0AZVyKCC6ulBqFDxeV1EnNl7CHTJQrnD8RqYX4DZNj31wFGDFKcNMz6Y9kF8hAWTE30Xj15hSrWQ63bpxrpG7bQRCiIIEU2TUR69rTyB1u5Kk62LQYz6O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507569; c=relaxed/simple;
	bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qzaeiwiSvjJR/zqYZWj6aWHOeHflhRZOz4mRyP3UHyadCeu2xuSdpvBzW0hXeNpQiXlcqiAYpj37DMAKijERg5k6wR47L1IP+n3YBkmnl1nScM0sfoe9TThKm0dE5TR+DwoHiLP2qia26XwP7PRIb3ZoZ2cwgvH5qxPq7ypwDq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DPYp/7V1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S/z/f2Sp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KJLv3693354
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=; b=DPYp/7V1v0KJTR6k
	Pb2ikbRoKdm7tBCZIv7ExGns2q6zkh5AJzlF7prfQqdeCXtF6nXkST++T4QmHZ/9
	9iDGAoGPbWSpSQG4+IqdWrM17ShIojeDAzNB+8Bc0wE2+y0q59oEExuxqKCdaG2v
	5v928V9ykaIk+BIz5pfyBpeiIUSs+lcGYbV2eafCMOMJcmTA0bCcLt0VVIzWR9i/
	gbgWMKmY1Lk4ZDTL08fhBI77CCWP6e1iENUwerWdCIXk8pk03H1mSIuSDYRsndci
	EP+9iZke4E05gj9Hg4jM8fkirUaW8MttHrUH7yCMT/OxDIl9l29x0dLAdgaWjVOf
	qd0O/A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryk6e291-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 07:12:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b982ec27aso2211404a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 00:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781507567; x=1782112367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=S/z/f2SpfvI0u4OOeCFbWnUi5v6qF02YijMWXA3TpQ0S7MUsDqltOYas1XYWrQTy3b
         eSBHF9y5HDZcPkZRukeaDlnAyajKXb7s+NjMi3DyrbXSi74c4ixdLxopxkujdVmWjp8C
         D/8A/jLqF61X6tP97UntE5eeJjE1AnIqJlHZgkA3m03JVhOloU77AbwScqvmHNySF6ie
         lQgXPCA8GO/sQo9R5/x0Kvh60jTG/G/bsktRU7Kgwl0xkgdPdgrMCLpVAxCiUa0P69gz
         ZIGhZevyxsHBptD8PzeuuPIomQJnnCbpT8Azr1JyTMRaGEKNo0YeoPHfHwdOMGuUAjLl
         8QSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507567; x=1782112367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4nC2LTSIQg6tprR91g53nLLPdKX5ERT2wD35VYnpBLs=;
        b=L9qGbXotprdXBu09CjLlvTuEjm8gWLnB6esCs03/+3dHD80pGDcPWqlZqcLr/flzx+
         zTAVG0CevC/mhsxLqutCzveQK4OvinOQbeNImv6hXXosTjVIjlZf2kDS+meNP9nnDU8M
         1MtT6Qtto9CLZX5/nIXnOTheEerXuGPh8umW2L6rzyHc1/7mVqWQRywo3KbsMahM+Tn2
         dD8dq3V+3vpRQBJHuyA2244bNluYpCz/zK/p/8iaUk6D/Ecuo/RCj748YtURScgOphdW
         omzwKTh2PpaubrcEQpAoezAT5TRbYV3flduitcC0yXIxQXwY5Paex/UxmSibC1OPVJCZ
         fBUA==
X-Gm-Message-State: AOJu0YwcI/QuodFDxugHK/aytE+rQw0pte4sWh9K44VppMg5igCeNsJp
	j9KkJ36U0EYMapWAPng8pLvEyN5UCZA8qVif5N0KN2NMU6p8qd0r3feLNBSWp+qLoMfVMLYUpKy
	OZsA7axGh7NhUdKJFxfudJ+Ic/iDXosrTJdC6zIdJYhQE7To1Hcuj7v0wMXSxY4LbKzvz
X-Gm-Gg: Acq92OHrHgLHtZfnGVkpR3+fZCxNJx24NYPkZCnbvFpQH0z1QpgR4G/0GXUP0QV2rsf
	iJw6DtEwAvL2CyHnCqPEipQJ80CeBkX6lCVrToD4Rt8sfux8d1kvbvo11RxHSwYJzBVD7HwZgMK
	iJcYfdEljbSIAO75+WbsHyHNGQvEpqoVn+S/6t3lguOIWWCdOkxwSn358/m0Cj3EhsNdj/2zR3+
	Objvp/q4yeL9bd515JspD6xGSkMqIpAtFl7+T869jMfGiGGzW6xl4ryKTXvxivG5yWbk6bu19BE
	603IW2XgnrqT8WWrInVWyzCcjB1I4r4eqThPEpgb0vOjk+ka8+PhzHpBwXPxLfK+MRlx5C9rnL/
	474AZxo+sooFqyGiWFiypdkLzC1t35s/vlD1mTYoXJl2D/IwoOhwV
X-Received: by 2002:a17:90a:d406:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c2bcef7d4mr9907984a91.16.1781507566651;
        Mon, 15 Jun 2026 00:12:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d406:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-37c2bcef7d4mr9907946a91.16.1781507566199;
        Mon, 15 Jun 2026 00:12:46 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a2668cce5sm14867474a91.16.2026.06.15.00.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:12:45 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:42:12 +0530
Subject: [PATCH v3 1/6] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v3-1-8183481f48d0@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781507551; l=1799;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=yiYdgiJqd9IrcyVppfU6gBuaofPptGycHJJtR/oHevs=;
 b=f6wJE4CawInMX9KIDvKJViD6Wlt5Tb8NHLZYnQ3WetCaKjTUaanZjZR6mQRiCRIVFywgsCQa2
 swTrlMBOBRpDRRcvKXIC37+gh3lI9mSmlKbAJyP4d8IYj/e0sooWdzj
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfXzzC9FNz7wb2r
 /kRz557o6BSMU76DLUOIqg5rQ1ZQlu0yh81ecrVlKhcrbemGgGyyyFkjxe8ELjGDBFb/y1Zf8NL
 z92zZnzacHcCJ8S16QCiNa7M7coT9sI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MyBTYWx0ZWRfX8hSS4SFkDlKr
 ps36h7j2mES8ZJFjnAlHxsIJxB+wIt8QJPMNUWlN/uwhRSv/nYpbKdygiWoI0Q7Enw7Z41NA5eY
 Aig+R1z+tWtZ7/6V4VqLhQgJgxRF835HTvBjAcjacMB3P+cfY5sNWVayDJDSElZXa+NoWhDADte
 O4wTSIWPYGVXxrE6Vw2dLAQLYnAhsZZpCouzaDGq0RQzQM0zI4A/W2HkcQuUZ9DwlYirL5rRCw4
 aXzM+zWSwqdolPRxep6AnFXX0Axc/wKJt2Gvd0pbUooFEBaGCNsx8DadQZV5uVmOMmdF5TUyFkI
 iofRbgU/JVOIWz+HOuAyShezOMmU2RV/ihkAgMCtZryF8Sq/kRSc+N+T6ETHvbOaUfS2xgE0qPM
 zWk+4xMvh2eY0PQ5rIUeKw3Oeb+x8EptHfCBXHn8aw1+AOg4VUhCFEo/Lwy6JJiXg3NFCj09YXO
 4SArtfuEP37INy+CNuQ==
X-Authority-Analysis: v=2.4 cv=NrThtcdJ c=1 sm=1 tr=0 ts=6a2fa5ef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eer_VDG9gTB7P6MTreNFJN7GitIkiFwI
X-Proofpoint-ORIG-GUID: eer_VDG9gTB7P6MTreNFJN7GitIkiFwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150073
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113097-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 8BCB9684156

Shikra contains the same Camera Subsystem IP as QCM2290. Document the
platform-specific compatible string, using qcom,qcm2290-camss as
fallback.

Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
single IOMMU context bank instead of four.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss.yaml     | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
index 391d0f6f67ef5fdfea31dd3683477561516b1556..490a7f3a8c5ff9c624f46150ee651793811823de 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
@@ -14,7 +14,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss
+          - const: qcom,qcm2290-camss
+      - const: qcom,qcm2290-camss
 
   reg:
     maxItems: 9
@@ -76,7 +80,14 @@ properties:
       - const: sf_mnoc
 
   iommus:
-    maxItems: 4
+    oneOf:
+      - items:
+          - description: S1 HLOS VFE non-protected (VFE only)
+      - items:
+          - description: S1 HLOS VFE non-protected
+          - description: S1 HLOS CDM non-protected
+          - description: S1 HLOS OPE read non-protected
+          - description: S1 HLOS OPE write non-protected
 
   power-domains:
     items:

-- 
2.34.1


