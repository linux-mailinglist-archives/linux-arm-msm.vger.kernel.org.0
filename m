Return-Path: <linux-arm-msm+bounces-116666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RJUJNBRgS2qDQQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:58:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ECF70DD6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 09:58:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RP9GVnXu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NdiyK0sa;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116666-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116666-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6ECF5318523D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 07:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9559B31280D;
	Mon,  6 Jul 2026 07:04:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB3530EF97
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 07:03:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321447; cv=none; b=Qd3GSiQ/GRqlbpUkK/DADgaJBWiXm+TobJ0v5w1UR05PWJpVJfET9XVAGo7CbJ9I4W/nQbkiqyhXjkN2t9gzXzA9r8ZZFXdmHbKeW+JKxPcroE4hAjA5jSpidCU9hkeWHEWiBnY11XTTf887h24pSDjCgUGkmmJmCeD7z4Qk1x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321447; c=relaxed/simple;
	bh=iE0p3m86EJTrb6GqrKDa8eaAPKZ7vdR2SC5L5azGsC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QBAFTqofq4q37o57Oqecp+5upeytxkzUfAlCZqSoDv1dZ9v5u/8DSC2JgeytBQ+Nuqcq+KifC4+ISs0EH4lFyYEOvBbgsTYqdxJabr8gAj7RnVAkRdaaITgwsMN4DJYP7+9JeegezPhTVsyyrhogeVybOidckNyHCqow6+Ejlq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RP9GVnXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NdiyK0sa; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641dtx3470535
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 07:03:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TmrNZ68RhmJrfmHBy4Qdh4iOieMjnDMu7QiHUaw4LEM=; b=RP9GVnXu+PNB/dg8
	RhsbgXwi277JqF+XAVYmWc3SbJ3G1FWiyG+doRa2QzloQAV5bHPbpQUuc2dJG7VI
	ULjRNrLJsvtBUesBOlrzyhL/fKiDviQ7TaEXPL2c0H0xcVvLwCGd8F5m2S9zSob3
	Zw12R29U0tsKfQ2PymLgAnAkpU8v3zT6t0yooJi8qK/PxZ1Q61dZgRwlFkPU3Z4w
	XQB+e4z2twSQskHOShxvW8uk7CFZqXJV5nBGPprjUiK0nTFPRMPUsKfIRUYMMapM
	qTSaJ6qkSrOwkZZb8yN4asFofOw17Jh9/Egox9XfnLHFgUxFA6SLBcVnUd77eCY2
	9YZIUw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txemtmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 07:03:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so254389385a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 00:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321428; x=1783926228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmrNZ68RhmJrfmHBy4Qdh4iOieMjnDMu7QiHUaw4LEM=;
        b=NdiyK0saacKE5ySaVoj7Jm4npM4tYbYhcXt+pkPnxWqe0hSAJLSXSS3zUza6rITlkC
         /hDir2n74loQ1m6JKQt3Cc6vDFIsUeBlUn9jywN6HZSv0hZy0JobAd8oOzxCq3nXZhiA
         xJ9U5Xs7nVPKG5KG1QLCSq0xJmYqQT3rC4uBmZl2soYdGAWADE8r2lC822pZ4SBlMIvQ
         +WuZgT2BgC7WEPwE0O2UNkSRe/kAuPHUtMri/JHvK+z3YAt63XkNBUUrVKSrvTSGSBHp
         bZkQkJ+UP8D8peTErwCaIjKCVRmCOaQa6j1Bvzb5T5aLaym9zUc0yT+/rX7przf+kKUA
         C5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321428; x=1783926228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TmrNZ68RhmJrfmHBy4Qdh4iOieMjnDMu7QiHUaw4LEM=;
        b=ShX/TqnUjJWX31BUHyMphtkG4GWodEqhiuSJ4iPzGuhDm0AgeYdFedRyY5oLyISI98
         He4BKktUOare+MzMZzqBnABsIQOJZ6gSl+tQb8uQL0YbErZ414YKZ2SJoIoqIRUz2Tv0
         6anjw26BxBudjD1e7CNS52jqEOkqwAoJU8Nk4J5pw//U9FJPyrnNoB1HZOZN22P4DvdL
         f1oXVScP4pm9WL4VxF/5gjTYX483uHSFJXIDgxLuJ3Xld0CQx2qxyTpoPIcWrAinVUiX
         5KzcK/lQuRyCfTT1hHVUbzDUUIpqhVv6jsdMIVtaiuy9smlMAy6xsMWZc8uF5ZI7T8X4
         BmDQ==
X-Gm-Message-State: AOJu0Yz3F3+3D42uisQIBSX2jGipdkNyZJb82Rpr8GYHvNHtdcDVIqmT
	1E0hZP6QDXfr7AcTwTctPAORI84MNyiDHs82SwgQ0Z3eel/csKqaqSyp5CTzlSk7xdJPKnsrlf7
	VUUHvClGIDohmAiwjFmHDzEnjbPeYsUG22MzeS0Irlc2aaSqCeMpKhXXnrKry/hpz4z42s5QpOQ
	u5
X-Gm-Gg: AfdE7cn+2C25I/8z+YZexxSNL2wSiy9oHT6wkaVL9NByT7zOXaTW/40C9tLBG+WvLxQ
	ol1DJY6t9TuT4lDvlUfGoLf6+6/mI3h7w1HbzJp/tjP3HmkSTweA0tDEAOkTZ03qdzltbyLEs4g
	P7RNs/Ez2vWLFcKMy2OJbhzi4UyLThnMuiboqTP79lf/sXxQTGRI57aaA6WQ1MKb5Pr3FOM/4mT
	0AM3D0tM4eBDHn0OVgvQ/SDqwODrbEPeS+Zhr/G83nwIh4KZaOXoFjU7YB1fx3E2XEwfGvPQMLX
	r495uKiWLzhsa9xgTmYUSicvFOKEh6dEx8dcl4Fy1ShHN9HAiaU2WgOZ2OA3UH67+2rtKYm/O9G
	RLna9R8jnIZ8yiXiP5mOozmFBsU+bU05zNSA=
X-Received: by 2002:a05:620a:28c7:b0:92e:8405:7ad2 with SMTP id af79cd13be357-92e9a4a75aamr1221841585a.41.1783321427691;
        Mon, 06 Jul 2026 00:03:47 -0700 (PDT)
X-Received: by 2002:a05:620a:28c7:b0:92e:8405:7ad2 with SMTP id af79cd13be357-92e9a4a75aamr1221839485a.41.1783321427200;
        Mon, 06 Jul 2026 00:03:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63bfba1sm397143455e9.15.2026.07.06.00.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:03:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 09:03:29 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: Correct whitespace around '='
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-qcom-style-checker-v1-4-16ce82a2bcfd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1892;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iE0p3m86EJTrb6GqrKDa8eaAPKZ7vdR2SC5L5azGsC8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS1NH6YOkWCR3P1g2Vg/baHUyq+J1VYay+WgOO
 kMKgyY/pNiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaktTRwAKCRDBN2bmhouD
 10JQD/wOjavtSohtI1UzqbpCj5oY84nIajAbGZggDJPclCXKgtd8aQbICAv6Nd5wR1eEfeTXK26
 /9ADke8X0bWKhMYgvxy6Y4PxwNGNRivEEdnkyPfuNUT7nNBEILSwhB9HWd8HsrR9yx2WSQlo+JW
 VbYUOW3DY4lQLgLL3HKX9leLcPeAJJLcRBPtBZLHg87E+51GnIJmFA3L28FEplUHQ8uwMzOF1nb
 daHovVv3badE6IiMXx6DMU+JKG0ZQJ497nT6dCqHtKfrEPgyjyYPww4ahQwAnc9b/1bYy5XKX5/
 NUHaTc4Vxh/B8czStZMkR1iu8diTJlEhbvHRWWhkJAzLkGZxP+NP3wN9aGRnT2vgXcoieEWWF31
 DjOAM0JM3ohrj2AkeUW0JoTGj9sUCCODzZjVyXutJIeSSdgALqJrFLe38SLjtyhQ73MLfjG83Sy
 jb6ZHRhQMsgDSEPQxar003vp4xkHHbHrATESxeZJsk5ts3Tsf4THZ1nCcVWPomim6nv2BVWSgB1
 bKqDKGlHuiGClU3WlS9iEoufQzmZGCTdVV8C/zUTYciS4JGiT9ltVYDfDnx1TT4zKqTP73ntGTy
 97NlfDMS5gWKYTz8WA+AzHnjRBH+sFjjloGrbTp2wvZrdblUwtx63Rll94VuD2ABwcU1A5hJuET
 6bxNkG/sMq4bM0Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX+xbubEwMW+pD
 kdxBIGFYsQzxdeJWBG2dgY2OravvCvaEOACI8GmH0LCbsd6XxIQxLIJI8MUcgTYkfWzEf71RmQu
 z/FTKcgVSRXgO+dniNtPBFHigRWMEc8=
X-Proofpoint-GUID: dViFKM0opU7PvL2JkkWBKhS2OgK07r-o
X-Proofpoint-ORIG-GUID: dViFKM0opU7PvL2JkkWBKhS2OgK07r-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2OSBTYWx0ZWRfX16Np9RWvyQnq
 lsxUA51aF93LrLaubYQCjsKFZi6aUICQQFtPPhEfan8zqXEN3ucvCzSsBW2miZ9jeaI0boVY2rX
 RqlJShQKK1GoQAqWi+F+6MXfIM3V9KdE+ulBxweaOqIM0ydcxVf1x0pPcHo3mA+rN9QPW1TX7FA
 E4KcL4OIx1BZn2f4QtTKGIVn0TQoh2TdufvGmoJSMvg5ZWusbd5spy9LLiMW46j5sKb4hU8KJir
 3AUqdPA7v/Rv0EiiW/Cp7yog7r09+GqyIlnkY3zWteGtVoGVjNsEvlFgWnh3ldTnYKuG8cwKe4J
 ZjbhDh0wxWeOgO3CZGPyLfGU2Rxr6i+ibhTjOycEJ89eZmtPGz8PZOQ0/4EXI9bj7wWlgzhGXk0
 R4c0Sg0h/szqXbGGK/VT8gleZD3kMpHjqAxI3irpfRjC0R+lIH0TxICHNlvcroqpBzvqPaBy37k
 nxf7dxUK2gTBipMZ3kg==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b5354 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uWOkq5aS2IRcaOVXy10A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060069
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116666-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77ECF70DD6A

Coding convention asks that equal character '=' in property assignment
is preceded and followed by a space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 20 ++++++++++----------
 arch/arm64/boot/dts/qcom/sm8750.dtsi             |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index ebdca0e2d2f3..0c90c886b2c3 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -449,16 +449,16 @@ vreg_l2c: ldo2 {
 	regulators-2 {
 		compatible = "qcom,pmr735b-rpmh-regulators";
 
-		vdd-l1-l2-supply= <&vreg_s3b>;
-		vdd-l3-supply= <&vreg_s3b>;
-		vdd-l4-supply= <&vreg_s1b>;
-		vdd-l5-supply= <&vreg_s2b>;
-		vdd-l6-supply= <&vreg_s2b>;
-		vdd-l7-l8-supply= <&vreg_s2b>;
-		vdd-l9-supply= <&vreg_s3b>;
-		vdd-l10-supply= <&vreg_s1b>;
-		vdd-l11-supply= <&vreg_s3b>;
-		vdd-l12-supply= <&vreg_s3b>;
+		vdd-l1-l2-supply = <&vreg_s3b>;
+		vdd-l3-supply = <&vreg_s3b>;
+		vdd-l4-supply = <&vreg_s1b>;
+		vdd-l5-supply = <&vreg_s2b>;
+		vdd-l6-supply = <&vreg_s2b>;
+		vdd-l7-l8-supply = <&vreg_s2b>;
+		vdd-l9-supply = <&vreg_s3b>;
+		vdd-l10-supply = <&vreg_s1b>;
+		vdd-l11-supply = <&vreg_s3b>;
+		vdd-l12-supply = <&vreg_s3b>;
 
 		qcom,pmic-id = "f";
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 71a70d051283..d5f3ffff0600 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4938,7 +4938,7 @@ port@4 {
 					reg = <4>;
 
 					tpda_aoss_in4: endpoint {
-						remote-endpoint =<&tpdm_swao_out>;
+						remote-endpoint = <&tpdm_swao_out>;
 					};
 				};
 			};

-- 
2.53.0


