Return-Path: <linux-arm-msm+bounces-113112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /DcAHFS5L2qTFAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:35:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC3868495B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 10:35:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=h36EGtv8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=i2Uhq0ch;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113112-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113112-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4DC33018438
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:35:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FD93D0907;
	Mon, 15 Jun 2026 08:34:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04263CF1E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512471; cv=none; b=Dk0gH1s8uS47sIjFTJHHqXJ/X8746upZQZmp8rZX8bc5zcB6eyqKZQ0bTi7ojZ8RnrjktpJr7YDTUenWNqRnhQ9NAlFHWmFGqaeMlaMQE5BqtA0uEcgUI5ezB+bA2akuxfvWdkcTlOIY/LxMFPxWYh/lpCN8d2MaDD0HOv4vsLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512471; c=relaxed/simple;
	bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pidNC99TPBKoDhgXGhZMixHjFWqZuLw/jVgS+hHVgghA+XJyTdBT4RUGBPylgTtIBvdKNRF9za/tHKXt2hyGpzou13iPyU4D/CbStID/eGrs+TcpJ8FOYl37PHwu3tDSJJtOIaEiRiLI+4JhPZg18VRHEuNu3JXhF3x6fh1gFzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h36EGtv8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2Uhq0ch; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Kx8K3888453
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=; b=h36EGtv8Vx0KQuJD
	PZ5IC27QV9rqS8hOCPuzi8adZ9hlXABwztMwbiGFplsxterTTY7eQ9lrG0sD1dp7
	n+Nb3P8885TdV+y/WbWvc+xAxXhjWJhnl4KHCez6JNidjz7vDBGdvxgBQalXT31C
	l/tIVgLFYBpzk/dvZ8pm6lDxUV7lCH1v5ZXev4tmJ8sWt1tslZQM0Iw8fbUuNMNA
	GxVXsBATQlZISgrdVJ5qLn9FeM9IbxcE+CS+NcKkbNz9CCUtHctHDXys2ei369PT
	H2jjniQDp7moJKM1vfTBHA2+2Pf8TqUhR6HGlTNoGXPGay/i2cMPgSRh6K+WVb0B
	GeiRhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wxekn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:34:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2c98c1be2so23530845ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512463; x=1782117263; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=i2Uhq0chMk0h9AMS9qnzJiROohcSwR0ZE61sVZFx656nLlK/vl8WVz955jR9BrU6iC
         E88zdRtTlw0RAmmcLp4dRTILtgfFRbThf/TNXrQxeZ6r7WonMue49RCmHRX8Euezumw7
         LTg/uwTY1Qnzrd99Ox7aOAUQzqimrJhJmUiPZGbsTeJfnEzLmzc97Yax4O4PJpK80+KM
         W2uInPhNRfuQt6lhWxn334bkQtm2c0/z+E+kmMhwg1ki3OfsvqOwouE2+75cA0aN5J70
         8PjBUjqIdDi+93CH0SHkD/3YILE72URPESRfP1bTYySo/HaSdDXwkbOE49u29EVHbR8u
         iEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512463; x=1782117263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=bbHhUZ+tNLBVLs/+YFycVGmLnmcr3VZ+A04etoHvvqgUqoNn61PKXU7YpSbtSSsFZV
         18A2wLnAvBzLBKqcUGrPOmwU762bo1LofjHw79u/T4/vUpzJ8V1DDyGjNWVU4/aPtH2S
         +sFizo4gkzCLAWwnDew+bvrm8LXj4sePEI63/zx7vjjsTx7v/0YcyElClPodVHp8cysO
         mmMy1CZo51MUicfUJytIlHAN7IKdvxkeXAaQlHEbZwMM8Q3ZyUX7Hh0wGgjDKl00iXlN
         /Ez1ikt2yzZrIN5hbGv0QoYyTFhDsW3zArxtgM62B//rkh5YKs42crg6hn3DY/2VM0sP
         V1XA==
X-Gm-Message-State: AOJu0YzyxJYdc3lnsd1EkjXOQ1+yD4KntuDquGXxWGovev3BBUjfVDix
	IsGcfQntoB4LD8jFfOcdkzGz7BpTsnkE010UJp+cypfp5kVtOYEARQ3HRXyAGHyLWrnlh9Aezqs
	AAc8WmHxKetaXi8l+ntVBv5W1Ve25BQpvMz4dboMdey7uY95X5vzjpP317dEovsqZoqat
X-Gm-Gg: Acq92OGeFA5RLtPKYQcDkUaqrcjMCygzggqiANBfOdwpENgZioOYIkbLK8JT00qsih6
	NCCBUQkwfF1f1jRngj/I4CpMmgfD6TCW3Ebs0z0M4rSbn4A7qkhfSMjWWGUKJ7ai0CE1yiliNpi
	hNpZ8fDNZnGCPR6y+CsCUWJeBxbF8XWl79gStnVzJp5xIsAxX3QvwmeNxrkkLW5u6UlQrs8WJ1V
	0xdDBGPznjKgselulirMKB+gRGERuivCVNi0MzWbBgYo96wEo9HFg5YsDx9zoC9g0aHCaQUDs0G
	cJDsw+C/pCHyFhpK8xwE2zSdLwSCnBmXanoukyPW8EKD8RVNQU0mPTZ4bD5DsAtNhp5fk1XOxkh
	UF9AbkRULumIza6UzknyH6TzNKQgsWQFUoD9oYuDLyT6FwQXRRag2
X-Received: by 2002:a17:903:2310:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2c4136e81d7mr136314995ad.24.1781512462599;
        Mon, 15 Jun 2026 01:34:22 -0700 (PDT)
X-Received: by 2002:a17:903:2310:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2c4136e81d7mr136314725ad.24.1781512462126;
        Mon, 15 Jun 2026 01:34:22 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:21 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:55 +0530
Subject: [PATCH v4 2/6] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-2-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
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
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=3937;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
 b=S+g3AVCbFZadW0cTR3VKyGr/WyTEp+9L5TnSb1M6ihwOPpO9a5hWKeZBoHRpo14yQvnGDguUA
 sDaldeY7rINBJKtG0qa3JAYOz+R0/fS0KO+jnsBqbCg8PVZFhry85FL
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: NNSO4jbnsEmN4QKpOq8s-wvO5BRxZvK_
X-Proofpoint-GUID: NNSO4jbnsEmN4QKpOq8s-wvO5BRxZvK_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX661wTlfBTGcu
 TYrdOp/nivB4svn1Cfa2QubH769q1WHS+xPjpL9sud0bj0Zl+nkSXdNWfabsC1uMvQL4wPL1h8P
 dWAY+PRWY5B1f1XrzGdi+I9znWHjhlI=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fb90f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfXxtyNxR2Qdp1q
 ZAxuJHHtzRyyoBT8J9e6TY07R+bJGCFCFPGJVyVTnCJPrBzHNGUv7lwyL7Pj6vTW4824GKxzvq0
 P/h/uWau+af+f9fYSPjVfYycVWASt0+mnNQx7o2BTOq6/c0NAc0mxaNIGrNDgKTgLgFOrC1JnoF
 F14MbEAK/95J6Q0zHiJmb5hptx5PCq7D8ghcqZjvMofS5SfDEq0yCKll07NbpupSEu3Nu54KM/b
 6aG2PL2CDctFxPNWzSByajjxToNDBX51C7r+KAKW/k+B13g3zipmq49rtwuHCdSX5PorjOmIfBG
 zrSiGWRYw0AfrkZ/9PhqxWHd126FrUrpvsxDbjgLTeMXdH8Q6MPGmeq4M289Sevcw9IyklU/7g/
 75bbooGbfSNsK0Uo1SPIyqccod3s5Vo67vhGg+q6YyJfwtMJqKUiPD8N7CxVy7EP7S9lc8WVhTf
 8UsOwRh5Ne6583++4YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
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
	TAGGED_FROM(0.00)[bounces-113112-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,oss.qualcomm.com,nxp.com,pengutronix.de,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:quic_svankada@quicinc.com,m:vikram.sharma@oss.qualcomm.com,m:nihal.gupta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nihal.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 0AC3868495B

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f0e827996609dab2c09834857a1bffd9560155a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,106 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


