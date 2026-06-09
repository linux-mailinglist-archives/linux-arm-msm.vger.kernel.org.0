Return-Path: <linux-arm-msm+bounces-112229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ySMVD8g3KGpuAQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:56:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E55ED6620F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 17:56:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AifkM7NZ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gSf5Ym1W;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112229-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112229-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15C3832A74ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 15:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4FF4949FF;
	Tue,  9 Jun 2026 15:33:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC265492518
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 15:33:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781019182; cv=none; b=MtxxLB4cw2Q6yfRdREuIuwWCko0rwArnIPFB3dix+/9CWBblYsdo+eQ/ymasvs2zOPUte85vDE9ngd45MTYpV9hCnBB2A7V3p+Y19nGtcZd8WIBRf2JZO2CoE/OHQ6ugZJVyhRgyX9YOuKTSJCLJEd7VafNwM9CTUKJj4DN2quA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781019182; c=relaxed/simple;
	bh=Uj6PFrl95EPjQd87MKegbK48MLKZBpNQFspDgHqgLnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=czQHiHnCNyVkRwsz38OvOh+VIuDr714FQkguncdO0gn18wrumMgFfV1wa5XsJ++HUs0XuADC+cXaOzuqoO5CZRr5cEWeNV57s9ilNKt34ipAYas7hg7/HYbP9y16RKTzp7MVKQczTotAqyaI3zuGVNj9I9kyZrtYPsL4PFEK78g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AifkM7NZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSf5Ym1W; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnJoW2668399
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 15:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o1XQNwY2YBqOGM0jRhuo+EDi7V+lOXGtju1Q/2Fompg=; b=AifkM7NZ9iZ99pWd
	ao9SnQgrrvukCnyKPeglzkfjpf/yxO9T7LG1qhxTrXhGrBa1ivhsF6q04bX0PuMP
	dvrgW8FYt3GWBUgSXnMbsxqMLQ/JTOeR1tEN6t/cIA/6UQwUSqloVAOqL/ryYN5t
	W6qZ/Vs5aUZjTboEDG3uHrInclObm1Vu2Dkb0vQyYvxm2Za0LETFPucTXkR2ePyf
	1KJ8P3S92vxe05E1X1c0d6R9U/8c/rHwK89r/yOI3rSMzN/eioVm++QFcZNcUIsT
	0CU76o/rtE6NKDJSxVTFbSobUky6qjc5mS6GO527v9n1AuXbZtG/YEfb1RHcz+D/
	ujYEpQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25tb59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 15:32:59 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6f01486a0so10987379a34.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019179; x=1781623979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1XQNwY2YBqOGM0jRhuo+EDi7V+lOXGtju1Q/2Fompg=;
        b=gSf5Ym1WFdK64pxZaMv8X60627EzkqQg69F8vXZH9cNEbZqzc+vlP/OCzSLxqIPRbR
         P3jKJlUTA+22vNClkFt/ryiMGhrnW9NTjy7PlGbyzl8SSG5YX1QZyc4RNyOEMvWOHD/1
         uHmP9V+eMleptU2Ta5nVafimg/ju851FLPsQ7UN1fGctu/abeUxbFzxXvtLyl+QFIGdE
         XHoSj0Kn+SlgPGg8Eb81dwRv6GbDdHaKWgvzrxNBc66ATqN6ZBgqrPBi4+lIliRqwH+/
         acN1kPgVCTk8gBC3ZSfj+sgMvvQ3jguPBjHLn7dYr2ySBpQRzahNd82slvLt41oBTPAi
         fzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019179; x=1781623979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o1XQNwY2YBqOGM0jRhuo+EDi7V+lOXGtju1Q/2Fompg=;
        b=E+HZvU49GbEks2aWrjz/j5P8m+zGcZEwjtBa0jjhNKHwcW6eAtYMrW2e7Yn05c852Y
         Ei1I2N64JK8mZgpovz42f5ieS5aJ0e3cKaQWkx3rHvW/ljmzoYxsqXbsaloQWtFTIDbf
         0Yp+sVbdrko+ttFFT6VtBRzMmgiaFLGYNeHSZcNFDLWm6rCJwYjlWyiYy54wf5vN+OiW
         J9osJ7SXJzG6sZtegdfUh7awryl9wbAJQj7pqWZ92xYLXXKGhoLDcDZpxSeGGQ/JWItb
         KLAvX7sMsxlyaRqhScBjclZnbTuTzZ0bxY1mwchK2RVC1Rbx2lMxThO/MZvV9knjR1ko
         ahoQ==
X-Gm-Message-State: AOJu0YxSMzORhyvz1LgO/GF9+su5uDGB6Sh7BjXpk2GmEh4J14VdtEUq
	1atI2FLDxUELqf477qXKH/jINyj/3I2ck/cDP1YBnK4KNNfWasUw9kSRPb2wMuzAMv8SeYxqbOX
	hxXVaVxxJtxV7QNN+VCd8q4hExsUdTsVx1Ns9qux0b0a2t8UY2T6DseA21Ii0XxO1+EKH
X-Gm-Gg: Acq92OFKpejN3il/6kL4UBAqKO9BDxZrXcsGR/oDdDL8IfO5ypvUvxONE01hKlW/CvB
	aWQ86IM8U+WfgQyJkbqSP7killRKUguEoS0MqO2uMCrV0L/UL9hfj7hTYZIyDzjiRnOA1ySXZ2J
	7YVDxUA4iPxFJuVwUjQ2BJndT4vO462yBIU4oMzpLRwZKux4UD2JFURBBXHg+l1DCpVfXVpbxVY
	Bx1i8xGLmTtTqW8y6WSZWpVQX9N3GjigyhVH4xIA7SdxIjIuXQg4O4Bl1GywfeLyE16ZvXwwqnt
	Fr5yb4QVg7hI4Kayfd0dwN162+hmOp9EWEs3H4wp6asL8O+C0L4xblmyekiXew1kgrdzWfn0zgU
	0+CAeGD+a2X20RKH5VDJ9DqXcp07dmdKy+1pwtJg9TPH9/NATi7FeV0pM
X-Received: by 2002:a05:6830:d0e:b0:7e6:ee6d:cb1f with SMTP id 46e09a7af769-7e750a6177cmr2734351a34.0.1781019179077;
        Tue, 09 Jun 2026 08:32:59 -0700 (PDT)
X-Received: by 2002:a05:6830:d0e:b0:7e6:ee6d:cb1f with SMTP id 46e09a7af769-7e750a6177cmr2734319a34.0.1781019178707;
        Tue, 09 Jun 2026 08:32:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 17:32:40 +0200
Subject: [PATCH v2 6/7] ARM/arm64: defconfig: Drop redundant Qualcomm clock
 entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-clk-qcom-defaults-v2-6-0c67c06dca11@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5559;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Uj6PFrl95EPjQd87MKegbK48MLKZBpNQFspDgHqgLnQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIaasrpps8plpO8eUL7uj+vrkyr5NJqiG5pd
 Wg/6jbyMPGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyGgAKCRDBN2bmhouD
 18GLD/9V5YMYTXnI7PGpkkBM6NstQ3L1GOhxbzbVXDOfXHuHH3wav1Y1Kdy8wDKpEdLFCRnCknw
 nELlwEf96Mcxhf2IvZOXciUL8icfIsUmKuguqAzMSapwmRjCaQZAvYlSwkS+s48gAx0p3WqRswj
 HVEdTat2LMH+SUVO3M89c2lHxG4zN9G1dXMx5Ri728nv27wN4LrOzj1owi5MDdQapyJXKZuvoTs
 vTBhrM1YHQghuQsNAb4zcyXsnY50iVX/lvg0Q3QlDkUIC4PYfCNE+lm9TwvPTdamPRN2SYbDayW
 we5DV3Bb+UbR+Is2YjvM/qH3GcPLdvC4mhNCdYpFFNnoqhTmg8O4gn2PIAbC/kSFpkhao4GFeDM
 PCkET17DWu0Ch+ZwE2PBGmI0cFjnF6qx2BrHpgPZKFFMOAA+tkNK33Fv/bY/JVVrUfqq/OKnvgG
 6QEjC7XnhZeB86bc3fjQES6ldyh+G85zVQkQ9957D+BjyztH5YCCCnmra/rnfvYWaBa8rPQMUc0
 4yGWmtai2qK1ffy/W+DGEGx/gGec0bjQ0jpwzIg2KD/6po/ftgnkXkjtjSEdcQl56ezMpwFPKgm
 T1S2uUhGQ6T1icUGlu5tTemKOK2bW4Gn8tMDIleOVzapi+4MaiOwdwWn5lNp1pR7uq6GuSPT1W/
 XRPlJyuYR2TwoFQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: v2ThwCZD-NtqgvUnStfYxTCR_QZGoo2z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX3yHBu20qxBi6
 0V2XvN1rW/rR33U5szJXzZS4nfa7MTkBZRc7gE9T4ddHfTYpXnkHlfENIsak/kZzwBJTJ78AjPJ
 9Z7J9FrqzgmcdLUySarQfrMu2KtWlz4EIRUjv+gPC8JQWBmezgQFjg8/LjnhgRHtdFDoNX5slCh
 wApD/TOgdhf2Z+SBvmOQw0Trjoc9/WnPHkt/rDLyyWrdMsjhvxt8Wdl2tv46I2zLVI29BAl9XJ+
 v5QvBWxyYefrlgzS92l/4qKAD9nVgwlnRLi03r9RzxbpBWCCemgheqEIU0au8unyLkXDPflA5wQ
 fSEcorzeTyuGoKjqLWKoOt82er8qmf7QCmh2vqqcD+eqh1HGXn+Ujvurh9Lm/GwNC2fxFRhqH2K
 wNadu43+kR2aEZLmqJbMzmNpgCCHQaczl24VrSIgZ9SDJoK3ews4Ym6h/aFwUsvQKyeertw2Ift
 teZ2uvTJSwybxd3/e3Q==
X-Proofpoint-GUID: v2ThwCZD-NtqgvUnStfYxTCR_QZGoo2z
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a28322b cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yyKv-1BC-DQKXCkl3jQA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112229-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E55ED6620F1

Drop all drivers from defconfig which have defaults in Kconfig.  Drop
also MDM_LCC_9615 which is gone since commit bac4675a4d1b ("clk: qcom:
drop lcc-mdm9615 in favour of lcc-msm8960").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on clock patches - this can wait a cycle.

Changes in v2:
1. New patch (split from previous)
---
 arch/arm/configs/multi_v7_defconfig |   9 ---
 arch/arm/configs/qcom_defconfig     |  14 -----
 arch/arm64/configs/defconfig        | 112 ------------------------------------
 3 files changed, 135 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2891eeba9032..e075da05c7e0 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1095,15 +1095,6 @@ CONFIG_COMMON_CLK_S2MPS11=m
 CONFIG_CLK_TWL=m
 CONFIG_CLK_RASPBERRYPI=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_QCOM_A53PLL=y
-CONFIG_QCOM_CLK_APCS_MSM8916=y
-CONFIG_QCOM_CLK_RPM=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_APQ_MMCC_8084=y
-CONFIG_MSM_GCC_8660=y
-CONFIG_MSM_GCC_8916=y
-CONFIG_MSM_MMCC_8960=y
-CONFIG_MSM_MMCC_8974=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=y
 CONFIG_HWSPINLOCK_QCOM=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 03309b89ea4c..5316126fb41e 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -205,20 +205,6 @@ CONFIG_DMADEVICES=y
 CONFIG_QCOM_BAM_DMA=y
 CONFIG_STAGING=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_QCOM_A7PLL=y
-CONFIG_QCOM_CLK_APCS_SDX55=y
-CONFIG_QCOM_CLK_RPM=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_QCOM_CLK_RPMH=y
-CONFIG_APQ_MMCC_8084=y
-CONFIG_IPQ_GCC_4019=y
-CONFIG_IPQ_LCC_806X=y
-CONFIG_MSM_GCC_8660=y
-CONFIG_MSM_LCC_8960=y
-CONFIG_MDM_LCC_9615=y
-CONFIG_MSM_MMCC_8960=y
-CONFIG_MSM_MMCC_8974=y
-CONFIG_SDX_GCC_55=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_MAILBOX=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb753cc0f5a4..91c8e9435dd6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1458,126 +1458,14 @@ CONFIG_COMMON_CLK_MT8192_SCP_ADSP=y
 CONFIG_COMMON_CLK_MT8192_VDECSYS=y
 CONFIG_COMMON_CLK_MT8192_VENCSYS=y
 CONFIG_COMMON_CLK_QCOM=y
-CONFIG_CLK_ELIZA_DISPCC=m
-CONFIG_CLK_ELIZA_GCC=y
-CONFIG_CLK_ELIZA_TCSRCC=m
-CONFIG_CLK_GLYMUR_DISPCC=m
-CONFIG_CLK_GLYMUR_GCC=y
-CONFIG_CLK_GLYMUR_TCSRCC=m
-CONFIG_CLK_KAANAPALI_CAMCC=m
-CONFIG_CLK_KAANAPALI_DISPCC=m
-CONFIG_CLK_KAANAPALI_GCC=y
-CONFIG_CLK_KAANAPALI_GPUCC=m
-CONFIG_CLK_KAANAPALI_TCSRCC=m
-CONFIG_CLK_KAANAPALI_VIDEOCC=m
-CONFIG_CLK_X1E80100_CAMCC=m
-CONFIG_CLK_X1E80100_DISPCC=m
-CONFIG_CLK_X1E80100_GCC=y
-CONFIG_CLK_X1E80100_GPUCC=m
-CONFIG_CLK_X1E80100_TCSRCC=y
-CONFIG_CLK_X1P42100_GPUCC=m
-CONFIG_CLK_QCM2290_GPUCC=m
-CONFIG_QCOM_A53PLL=y
-CONFIG_QCOM_CLK_APCS_MSM8916=y
-CONFIG_QCOM_CLK_APCC_MSM8996=y
-CONFIG_QCOM_CLK_SMD_RPM=y
-CONFIG_QCOM_CLK_RPMH=y
-CONFIG_IPQ_APSS_6018=y
-CONFIG_IPQ_CMN_PLL=m
-CONFIG_IPQ_GCC_5018=y
-CONFIG_IPQ_GCC_5210=y
-CONFIG_IPQ_GCC_5332=y
-CONFIG_IPQ_GCC_5424=y
-CONFIG_IPQ_GCC_6018=y
-CONFIG_IPQ_GCC_8074=y
-CONFIG_IPQ_GCC_9574=y
-CONFIG_IPQ_NSSCC_5424=m
-CONFIG_IPQ_NSSCC_9574=m
-CONFIG_MSM_GCC_8916=y
-CONFIG_MSM_GCC_8953=y
-CONFIG_MSM_MMCC_8994=m
-CONFIG_MSM_GCC_8994=y
-CONFIG_MSM_GCC_8996=y
-CONFIG_MSM_MMCC_8996=m
-CONFIG_MSM_GCC_8998=y
-CONFIG_MSM_MMCC_8998=m
-CONFIG_QCM_GCC_2290=y
-CONFIG_QCM_DISPCC_2290=m
-CONFIG_QCS_DISPCC_615=m
-CONFIG_QCS_CAMCC_615=m
-CONFIG_QCS_GCC_404=y
-CONFIG_SA_CAMCC_8775P=m
-CONFIG_QCS_GCC_8300=y
-CONFIG_QCS_GCC_615=y
-CONFIG_QCS_GPUCC_615=m
-CONFIG_QCS_VIDEOCC_615=m
-CONFIG_SC_CAMCC_7280=m
-CONFIG_SC_CAMCC_8280XP=m
-CONFIG_SA_DISPCC_8775P=m
-CONFIG_SC_DISPCC_7280=m
-CONFIG_SC_DISPCC_8280XP=m
-CONFIG_SA_GCC_8775P=y
-CONFIG_SA_GPUCC_8775P=m
-CONFIG_SC_GCC_7180=y
-CONFIG_SC_GCC_7280=y
-CONFIG_SC_GCC_8180X=y
-CONFIG_SC_GCC_8280XP=y
-CONFIG_SC_GPUCC_7280=m
-CONFIG_SC_GPUCC_8280XP=m
-CONFIG_SC_LPASSCC_8280XP=m
-CONFIG_SC_LPASS_CORECC_7280=m
-CONFIG_SC_VIDEOCC_7280=m
-CONFIG_SDM_CAMCC_845=m
-CONFIG_QDU_GCC_1000=y
 CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
-CONFIG_SDM_LPASSCC_845=m
-CONFIG_SDX_GCC_75=y
-CONFIG_SM_CAMCC_6350=m
-CONFIG_SM_CAMCC_MILOS=m
-CONFIG_SM_CAMCC_8250=m
-CONFIG_SM_CAMCC_8550=m
-CONFIG_SM_CAMCC_8650=m
-CONFIG_SM_CAMCC_8750=m
-CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
-CONFIG_SM_DISPCC_6350=m
-CONFIG_SM_DISPCC_MILOS=m
-CONFIG_SM_DISPCC_8450=m
-CONFIG_SM_DISPCC_8550=m
-CONFIG_SM_DISPCC_8750=m
-CONFIG_SM_GCC_4450=y
-CONFIG_SM_GCC_6115=y
-CONFIG_SM_GCC_6350=y
-CONFIG_SM_GCC_MILOS=y
-CONFIG_SM_GCC_8350=y
-CONFIG_SM_GCC_8450=y
-CONFIG_SM_GCC_8550=y
-CONFIG_SM_GCC_8650=y
-CONFIG_SM_GCC_8750=y
-CONFIG_SM_GPUCC_6115=m
-CONFIG_SM_GPUCC_6350=m
-CONFIG_SM_GPUCC_MILOS=m
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
-CONFIG_SM_GPUCC_8350=m
-CONFIG_SM_GPUCC_8450=m
-CONFIG_SM_GPUCC_8550=m
-CONFIG_SM_GPUCC_8650=m
-CONFIG_SM_GPUCC_8750=m
-CONFIG_SM_TCSRCC_8550=y
-CONFIG_SM_TCSRCC_8650=y
-CONFIG_SM_TCSRCC_8750=m
-CONFIG_SA_VIDEOCC_8775P=m
-CONFIG_SM_VIDEOCC_6350=m
-CONFIG_SM_VIDEOCC_MILOS=m
 CONFIG_SM_VIDEOCC_8250=y
-CONFIG_SM_VIDEOCC_8550=m
-CONFIG_SM_VIDEOCC_8750=m
 CONFIG_QCOM_HFPLL=y
-CONFIG_CLK_GFM_LPASS_SM8250=m
-CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
 CONFIG_EXYNOS_ACPM_CLK=m

-- 
2.53.0


