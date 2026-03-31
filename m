Return-Path: <linux-arm-msm+bounces-100943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI2IANlay2lJGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:25:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D70364129
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 07:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 047B03055572
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 05:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5F536F42B;
	Tue, 31 Mar 2026 05:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+VWp3JT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kecujMpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7954A36EA88
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774934720; cv=none; b=p/NFzZJkyF4htgNOGNeq1ctvAU3U4F/o1CKt6QFaqnggc5ICzFJbZKbVMDacep3v/vVK3fxnj7segZUfTXJgQMDnygZgMsyAmBgnQMWUO5MUiOFygH8j76NGbAZlyoYVxOX1OJ8Qs853Fxto31TlKhp5QKgP1e95ixa4r69n9+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774934720; c=relaxed/simple;
	bh=UhvS06E/0zxHH+6YzYwm2XqZemBnbJ44byW3vy0sff8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffTAfmJAyUzI/CvKkbrMNCFLPVMtN4owgIRQFGozvwwYaoZYeiJmm38W6llxmen+llC+FeIf4XbEEliwuVxivulfU3k6+AhnCSLtqXpv1Fl+XMc4sadFOMM7CEu30l5MjEkGb72E9NHoQRaDiXAK7Wx0bPSZHrHW/T2GxkAQazM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+VWp3JT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kecujMpY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V25h6o1402790
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=; b=Q+VWp3JTr0c06NSe
	iRDfWlfkUVRLurwuVNrDbXxa+BD7xrs/Lwy2qSwgaqwrJIiCiOFmrhPsAM0CgyZ0
	BG75IW+xgO9DQYc/bQ1g9B3d0lRDSTmuHJ3DslFS43vWWkrACebsQUIhQcpQ8Vdp
	O2wuZQwMUSglE4w8DF0a+VUwTSnTZ1OK2h6gt48N7/vXSkRy3+mU8Q6B672WH193
	pvhx5L+q74uwtE/bLfCUg002nFwxllUCIuv8akkOqhU8DBOoUApVhVjlsxMCjcwt
	9u//A4wtOi8dGJKGIMqaFxMM76iwgSvlltfZvU1B/C773PHGNZQa7X+2u+24olVK
	48oOow==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4hbrkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 05:25:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62da7602a0so3132170a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 22:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774934717; x=1775539517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=;
        b=kecujMpYKjsmmQ3ZDEtSG9VAqC/8X0t6rT9L1SOyFadAoA4fsyj6mx4vDEjsva5lfM
         e8er4yTh0VpFO9XBo0GOxx81mFZjh+AZC6HYhoo7qzcNcc+sB6A74h8iumz4V4Ure16b
         592RyY/ZKu+ZYtzOQBUDUNF9+ExTFg9PNcf/g+HsGU5gyXSUq3kLvYwwcG09U51qYhP7
         U0AAdk6Z9w1LeAN9wrUvt7COGrmyK0PtpofqBdpgzAU+1wEGu/KrD4MXnM9uxoGR6MYm
         o59lRQe4g3uqusjXz1dITw+laYAb5OwrRPpMiA4ABHe21bhedY3KV/wkB4GyJUIdQMzB
         Orow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774934717; x=1775539517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRzpvodU13mSbiQfR59O+/8VRELzK9xIqeQgF2URa38=;
        b=prFZ1bDIEhAv288M3OIicO0DVV+3A4MamHlwjtR2ZaY0EEPbaeGUfRa7IUeCnyHocT
         Q9nP4x8tF0ZwovjXUdHeEAR3g1gsXli9nmWeEJ7+L6sJ5P8II+DOtz0zGqnRXgNmnQOo
         ad2P2c4YaG3/bA1msOAXKof2cUB8AklYNziuwWd6M00nfdXaUO3kpGE7crxto5xQYXT/
         Fcb3TNmn/2IFLead/hLaBRHUfrfmLKaA1BrIfYVgrhk1blMzCCd3G58WN7XIx7y8xjph
         ixsKOp3jhPMKMlCrKT+SCGoG4IAe4cxaO7kLd3/L5SlLgULzN+uWLcxKtFGkuyL9IWRH
         cHEg==
X-Forwarded-Encrypted: i=1; AJvYcCWlYcKnfg8hVGZIRUo+bTIn2lv3lE4km7UeAdM9vOTT6MSd/pNh6g9pmwUyFX01rF2qpDFVFfAEXLxL6DwT@vger.kernel.org
X-Gm-Message-State: AOJu0YzVVR6CSc6ZxAKJvEBUiYFY7k2jSJjBtgnADRmVG4St+HPMmRdU
	uoJr+e75s3RVFvk4/vgrRc9Su74idFCt+tZPtZbKI/vahSK/xVdFlLbU1Y/S59pjghIe3Y1kSRU
	mXwjPz1/dykC/zsxAALWzdj6wATIuypYqSvliqWoHU5lQUBG5UCTa5VY7vcfBIzlw9F8VJO6rck
	yT
X-Gm-Gg: ATEYQzwObblFznyX2/tNhqVJ1ytZ8z8Klznl+cUkSxgT93MIZuobu760E9ESQz/e8JU
	vYle36lve7Nj/9h2tgR5ObXQDEawpu5P6zDuvYnC0i/kEX5iF8N998hbsvOahJn4mBaH1g7/0ZT
	dQAy4GlYq+9tSmQ3mAFCeTNBSSeItXHcpoBtLuK2u3T1mU2TtF9dVXJAnSpfxA6TfoUW5J4z+1K
	M6+FLB55BH6jlaHpOplGa5eZNDG51RrR8pYMUq/Pbn9sX1iynn5xERPyucwVWRDGtnnjbbYF1oC
	ib8D1c6Grr7Vvvitdi8UmS9ka5xQdd7f/x+IP0O7ACcZy7BTW/iYFLvRS7OTccJWY5pD7GHOmwy
	v+hb9bYx/8r/b9QCfZidv88St7dC/TfnJOTNq3zMkFrZvu5DxIQX0
X-Received: by 2002:a05:6a00:1253:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82c9605d1e6mr13802085b3a.36.1774934717238;
        Mon, 30 Mar 2026 22:25:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1253:b0:82c:212a:906a with SMTP id d2e1a72fcca58-82c9605d1e6mr13802035b3a.36.1774934716737;
        Mon, 30 Mar 2026 22:25:16 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843db09sm10270751b3a.7.2026.03.30.22.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:25:16 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:54:16 +0530
Subject: [PATCH v3 7/7] arm64: defconfig: Enable VIDEOCC and CAMCC drivers
 on Qualcomm X1P42100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-purwa-videocc-camcc-v3-7-6daca180a4b1@oss.qualcomm.com>
References: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
In-Reply-To: <20260331-purwa-videocc-camcc-v3-0-6daca180a4b1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0OSBTYWx0ZWRfX3qeGE5MS4mPl
 uAfXyxDad3CuVlPzSor9+wv2g+fB4FdJmDOw60XykQZh6R77FGuE89u1x9iUaRLlo7iVXrJOAFH
 KVPC9Z9ild7GIxMs3W8vMr2rbPIpNrvVEjA8QgVyrU+1j/hgds1zva1sLhWX0SYwgsUhd5XCxNS
 up1GGXABpJCm8XfC98fAYoURDPYk01kHHkhXAp02I23DVuvK60SxX/c36ZoIly+pGTh2e5XQreX
 cOw4ii58ssqRYoSsIbr4s33tEDzRnaILOh6Sl0V6A2CTYKRMqSorToqy6sENIY7QhpggX8N4rfJ
 8SUPTkp2iefPR85zym+9v9Ov4HsuusdHFc+kcOVEgOMVRU1Qpk7tBxV2ciuRgX6nPSdkviAz7c+
 FoPQnVHR5c3V+hKQTq9EkeBzab/wnznh/YbyuFUkrlL3MzBuwLHJQjmUOQ1kx1U5qVfsXXll+5z
 U1oRu7JtA0rSGxGTs+g==
X-Proofpoint-ORIG-GUID: GwRlxl2ORDQDlOXqlRbEfzlvFK8gUZ53
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cb5abe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rO3wVDe-YCVyVCuK1RsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: GwRlxl2ORDQDlOXqlRbEfzlvFK8gUZ53
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310049
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100943-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jagadeesh.kona@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73D70364129
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable video and camera clock controller drivers for their respective
functionalities on Qualcomm X1P42100-CRD and similar other platforms
with Snapdragon X1P42100 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e44e83bc57812aaed21bff1b12d36ae4a373ce11..44dc5da9805ef01b30c39ad2235f9d294515b360 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1492,7 +1492,9 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_X1P42100_CAMCC=m
 CONFIG_CLK_X1P42100_GPUCC=m
+CONFIG_CLK_X1P42100_VIDEOCC=m
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y

-- 
2.34.1


