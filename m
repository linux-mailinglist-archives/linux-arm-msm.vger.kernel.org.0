Return-Path: <linux-arm-msm+bounces-103821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFAwKIhj5mkKvwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:34:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F7E431746
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 19:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9DA0306EF62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 17:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0AC32B9B6;
	Mon, 20 Apr 2026 17:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gHE8kSwi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaqdQQ9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F563A3E71
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776706113; cv=none; b=uIlDK23QdZnHlhlp76OKVqvSZHaAIFci+WnVnM06A0KjzADmQyQ5PJ5Y3Sw60CBj5WPl6Z3k0rynogALARwk9WJHxDqSIGlaWTIEwFI7I5gV6KTGV98BZJWW+asen2doAtKVbVho8FjGEHktcrFZcupyA1QZJiiQz4aYzm+ZpO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776706113; c=relaxed/simple;
	bh=GCi6mw0My36ujT1oK/LTdUMwkJzMpNgE74Gdotixj7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZOCVPFh0+49/ey2k1EB8OEp4f2TExxeKhdP/33ec6JTPX9lgXjrDJfh/gAWwDYSdKLrVJS/jfdHFUncuYdU3WYupFKLXrUtJoZWsD9GJCveMl230qnjKn5zFZI51MyzVnpVg0MPNsr7vA70ExXzfC3gDkgKocch2OMZmxSppWIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gHE8kSwi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaqdQQ9u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KCJZIO1532103
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4UYnNnSbMsa
	SCnlByRKL88+TiKw8FjoGU1HQCV13xhI=; b=gHE8kSwio9FRMWTHIDETRFEHZoA
	633JXXyXt2Nt5Xn/k/+YFmlJ3+hBisjW59+Yq6jwBqHfjn/y/mg9GP4gp3WypREd
	rk9seZfixhpvvUHAxBXJDvi7k2x+qUI4C+siBAJ5gsO+NLOND/ZdIH8fZblCYIAq
	V5qrG+VQkejQid+TbSWNuEuiF1mAuzPSwr027TuFajn7qxiY3oTtviCAaoIez65I
	N5QFEtAipjdrNrXCPX4WLAsFZCQ/ZlxkDZz4OW3JzF/OOo6L8PVts0q5GrIEkZeO
	3LgSKXmVHGk1pnGKNrkNaq0RBC3tYKUsAUuxFohXojn9qfjnUEKTjcZm3+w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfus2h23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 17:28:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2ec948174so30252705ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776706111; x=1777310911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4UYnNnSbMsaSCnlByRKL88+TiKw8FjoGU1HQCV13xhI=;
        b=CaqdQQ9uPu6dS7o4t0RxdP4XcVNRa3m63y8jyt/3HRZ1dPTRxmOnFoIn0qrrkWD8OO
         YiZyxtlKEiZtBWVhP04DQNQsMT5ReBzP0uoWc3+wWWCexGfJN47k/ByuajbqeO73e0AA
         MSAhVxVxCp2DgPDH6610GTvncfY54l6rI7bOPfCzLO/k4bh0lR1OnBDvITmUE/Lkc+aW
         +TIw5nWC2t4vRO6Mjlz0ziUSbzL2AAAx7M53kn5nt/S4RMx4SNBVhBHsiNBKoCXMsYca
         iEo2A62xlJ4sICQzM9rtsr7u1LOPHNAlio5k6oYVAQuWi1QMRvXsdsTz1W40lo0iIyEG
         NlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706111; x=1777310911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4UYnNnSbMsaSCnlByRKL88+TiKw8FjoGU1HQCV13xhI=;
        b=bFeiJaAPaMZLsBlse/oNW0i266E3pIHKHS1gudmxs6ybg+hpqwWkRppaCLIIolULHl
         YacR6zS5w79g/gmVElEf7qnRtG1E+g3D39tvOrySuwZ08YoxeEfhQB1cI4LByp0r4KzM
         D/m1/0SgOG5LjBFCiz6+vnoqxP4613H91EYs79cwd+pPG21Q9qWrOjpTvO4ZAL+cggme
         gY1d59uiscOxoEf2Vaoeo915vjBzvuOW3XZH0SS0XE6yp2m/9QH26BYFPQPkl6gyxiXF
         ar9eFvjHS6j3MoXVx5az9/dvpXXHNVeuHiijFJM6hNMG6ZpRyNdAUcFHRS5oY1oUSwnY
         3k0w==
X-Forwarded-Encrypted: i=1; AFNElJ/qbLh76Qxwb+bI/ZZjVpsyw9ugDFjMYOn2RxJY1oH2d0k96Idu4+HO0uoBZxqHlZF/jnc0NnIoQ1qhJjNJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxmspiJDVT7kDQliFdM1524UeCJ4iXbl0FB0zYxY6GL1K37zJU9
	b909J3ExA1DmNFf2PLzmLFXVn+zOYqXiiBBFZrpCO9HnDsypvYVqSusZEdFjXvzgXIhuOe2vAAh
	muTkbBfgpvAsbHeiVKZO4WmiS9Kay45JNB/6GgwvV/XgEEEiE2jO0eg9dbL/bfboE087t
X-Gm-Gg: AeBDies9j1M4B/TRLOfV3EEjVmyD+d3vl13PDnqseWwqVlghwg11+hJcuJoNlgv+gQ5
	fiF0B15OQqXMGLjKxtN8NN5uyGQHkzMAVgbg+M+jdgIWLkd9YejMkx6wmPj7s0bwRr25/VUhZGj
	PF0i/bQuVGhfFmG9TU4sWfUWylu0shBfrQUO3If2ZTHmHrg1MnMsz+QcGhT28xbaMZ3eNa1DgEY
	v7aFm8IQ8Osp3/iReFQt5XaRCbCSlzo+g53KQ97HOkU7qZ40ItZqIjrTgdds/eoNOanEdM4AP+f
	FLmnz9Wah5pxPF0Dg2J0RVy8EMwlzqSBeqBTWdnjXQvptlitQnbN8rP6epiXrUJtAkBdYnURnFi
	R3f9XTYeWU2mLi0tEkltoTeyQuO7yl3wQi/5757AfF18H8heMSb7M0n+OfJoGqAs=
X-Received: by 2002:a17:903:1aed:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2b5f9ec9cc0mr138879695ad.5.1776706110650;
        Mon, 20 Apr 2026 10:28:30 -0700 (PDT)
X-Received: by 2002:a17:903:1aed:b0:2b0:5ae9:ee4 with SMTP id d9443c01a7336-2b5f9ec9cc0mr138879245ad.5.1776706109964;
        Mon, 20 Apr 2026 10:28:29 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa17632sm113132575ad.24.2026.04.20.10.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:28:29 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Subject: [PATCH 13/13] arm64: defconfig: Enable Qualcomm CESTA Resource Manager
Date: Mon, 20 Apr 2026 22:58:03 +0530
Message-Id: <20260420172803.4124418-2-jagadeesh.kona@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420172803.4124418-1-jagadeesh.kona@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420172803.4124418-1-jagadeesh.kona@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE2OSBTYWx0ZWRfXyiw1X6ReljIQ
 DLD4jW4RyqJnLZLI51DKUo7BCtcBoA8AIUdOwfQ3P7oZJobBGpeiA8ZHWI7STUzeMbb6b/Crxfm
 7hPxq6wMPtwr1Lis6kYjo8n6FgnrHa07+oOdbTMkgLTcLdr4iHYWuTWeSK/wR6CZLUfLuSnq4Xf
 PHX/YYrQ8ELUpAR26Q02rVekxMmG89OhlU5I8kQIv/b70RON3O8eYiwnSZgoOU3Y2YmQoLbcd71
 5QKOQz+IqbRPAEM/oCKlLYmn0MwzxxKzGq5XuZMhYun7KxZyrdNf0Hsdl9v5ATu/By60YaLrz32
 5R8idYV2WdXXZi4e88x60l5fpKwlwpOSw6YHtwFisSfARvv/o7PKMnkbYqZqCII1rC/Dr7rSnCd
 Mnu74owM2hgWsrO/2XGADB0cU+URYRQiDXytqMzlsmmdoxsuCs5KlmE+/8g2HA9COfqBhPNS4uS
 vHuxEJ4yO9qWWlvO0lg==
X-Proofpoint-GUID: 3cmRbMmcHxZgLtmUVQGmXGopJGdhuZyB
X-Authority-Analysis: v=2.4 cv=PMQ/P/qC c=1 sm=1 tr=0 ts=69e6623f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=SpUqWb2v3QxbaYDcPuoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 3cmRbMmcHxZgLtmUVQGmXGopJGdhuZyB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200169
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103821-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50F7E431746
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

CESTA Resource manager/CRM is used for local and/or global
resource voting on Qualcomm SoCs. Enable as built-in.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..94d226693004 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1658,6 +1658,7 @@ CONFIG_MTK_PMIC_WRAP=y
 CONFIG_MTK_SVS=m
 CONFIG_QCOM_AOSS_QMP=y
 CONFIG_QCOM_COMMAND_DB=y
+CONFIG_QCOM_CRM=y
 CONFIG_QCOM_GENI_SE=y
 CONFIG_QCOM_LLCC=m
 CONFIG_QCOM_OCMEM=m
-- 
2.34.1


