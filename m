Return-Path: <linux-arm-msm+bounces-103392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAddGDTQ4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:04:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2177140DCA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 14:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CD5E313E815
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 12:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5893B47FE;
	Thu, 16 Apr 2026 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FUdq2MpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H09TE/Ne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3853988FF
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340807; cv=none; b=KqDj+jMETEOk4zXcHd/T/M3tHosH/MsOsr5PZ+G7LYzBt8Nx+88c/DZPfmb7wwJ9WD/LZzIoIwWrphsHXM2VraVp/eTE7iv8WcroO2CAIZJROydIiqdcgHE85aEcYQ3D469WpeWsbCrqEYu3WwsdgxKFuDcu3FsfbtroSHveYw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340807; c=relaxed/simple;
	bh=k98Sd+IuX8Zn4GRN74V93GHVqiBr7BdRALamjqjLJpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S86xfSBNi0Foc130ahzpC2U/SFTfJ7kr3kqgSjCkr8AsGc2Abf+OvBQbJsMAgO4vAZcs0ZR89kBKR8JH7ibS/1JnAQdr4F+VxVJlwnX9FeqFAsx9UMlFYPxSSEDEP0Vl6rNc1N0ELkfFYT1yty/gC19Wko8dMr9quX6OjTFLukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FUdq2MpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H09TE/Ne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G8xiBA4124964
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t4D3kKEXk5KVz/5AiBoL0eMglz9Da/HUz+0qxKgAV6E=; b=FUdq2MpRUYWfcoXg
	pFy8xh4XH/w3CiG/5L58x0mjDfCzAixVD0a4reKeqSSMmPfxF4MkS9+7PDZrWD3Y
	v0S7+mnkgThC1pmzNjX8iyTY8I+hb/wv7F68C6e8j36fSMdrx7QAs1ONpEIV8eWz
	+OBNVO0CjnzhM3arm5adaeinkhV2Ixtf5FG0Qrp1sP2jujA74j9kNxE4GkPLd4q+
	VVssIlrot9BrioU49VrrVvJTvo2h/9hL85CPPirNYcubJqDNyPF3DRGOBwwzsBjY
	TmhKKnsq5NiHyLQRnAGhZzw7DJtrtn9vT/0n3dtWqMtSkBsRhkvihDhsO5Nnc30O
	dZ931w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djvrf8k38-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 12:00:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7939ac69edso6016903a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340804; x=1776945604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4D3kKEXk5KVz/5AiBoL0eMglz9Da/HUz+0qxKgAV6E=;
        b=H09TE/NekCzEhf+GW1SR8OBe3jaG95qf8q37g3enBQEH9/1feV6Qe8Jk3ph3YKtp+k
         thfwza43OZn58j7jHtKVTUZ5z70Q/wgm6yE227QjF2VWRzrpxWpWGMPI/ZwZAnY3RcK7
         AnYHFi4rd9649i0RTyij+CZsoOShNIJh0x5KNnSFXRCXJBipFtkaEmVyT2caGPTCr41O
         kAhj64zacPZmq33jnFXfBfWx3B2ROUD9cDKAnfbttYcVLRhNO3ZM75HJzSaDAIgbJTWS
         Epke3TXjM06vcgdJmpgRPcqWuaX4zt5oV9z3QAwBhydB9PS7oUEtCU9uohXCI9XNvHhC
         CbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340804; x=1776945604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t4D3kKEXk5KVz/5AiBoL0eMglz9Da/HUz+0qxKgAV6E=;
        b=OqN9M1NsiShcs+CPdt4dHRbl3E5alJ7OcErtuQCfkgM7KkMI9M04ZkShrDqrF6eeAj
         SuH0qaU5tjVJz1kHbEUH95aWirlb9wxfjOJIzgXRAo9u8ILt+h9txZ5xxj6FHT+G/69O
         FW2WnEsbKl88CHvuuW+PC17T7JXY9GF2igMrZukH2saRyS+tlfCvmNvMjrYJ/wj3+lnD
         r5mpxErJUt5SiKrJJiiBrR+IHf6A/cd02ZOMQUHZNQbqof0monCyUtBGRebBxdC4Zr+Q
         YCaGN/gCk9QWm/abIs2qha5HxGx2KhaT/gM8RnUJYFBZiS8GQ7T3rFbhbbxFR3VUu3NV
         sqMw==
X-Forwarded-Encrypted: i=1; AFNElJ9NkLWyszlGG5dPaYp3C5YPPWB6WfGgDPlaVGpfE5gUbeGcgpiNo7FKp2a7wtLHgkYeTZjaQFUK3xbvdpEM@vger.kernel.org
X-Gm-Message-State: AOJu0YxcT9cTjq0O9Wpf1ByOU3KC7KggIt20uwP23G7Yi6uHBpTDR+bZ
	0ZC8ZMO0Lz1pCZBoNcOanbYbfW2HQkBYimaArNhWKi/2ut5h6mHV9WGZAgHTF9DNF18L+qMPxux
	jn8BxPqdfRghASKSNiHRqyBGRvrpgLQSJiSi2hiefke7izPgDTJeaUMygWLNIVzWtHUoe
X-Gm-Gg: AeBDieuf0qbk+P5JlkpTGQ+F+0MhMO+69TvcDSijSuu7xsjWj/6xxjCNIMEc0CDB1MQ
	r9Qcc+GQObZpD9rjCdm2tYrgX+EMMr/dgDQ4kJzhp61TBSwOTQJcMVQQURbLaOTptTw08uOY4rh
	96P3a5Y544zCdbEokSklg6nkVHfQeBUQd2cb9nMyOSAQJfN3E2BRQ6DUFvLiSpK+2Ky7JcjDBbr
	+gxOdf19ZGHM71BKlRHsSrZOcEpEDWbzSKMLVDRUUp7e0DIIctWQkqRMhCDc5MUciXXHTu3ipnZ
	7yy0vRRJFYrOd9BlnbjOHn1O4nhthp5YFPoyFt2nFZhMdbu8UC+okd+vn5V3ihdGeAL8otojMfx
	z+k6rQDhVUZ3f3SL20jXcwD4/rCJ9MHYnb43XMPs42xGaHayX+bFpip172w==
X-Received: by 2002:a05:6a00:400b:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-82f0c2efb17mr27197915b3a.48.1776340803743;
        Thu, 16 Apr 2026 05:00:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:400b:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-82f0c2efb17mr27197857b3a.48.1776340803124;
        Thu, 16 Apr 2026 05:00:03 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f673e0f15sm6335937b3a.35.2026.04.16.04.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 05:00:02 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:29:19 +0530
Subject: [PATCH v5 02/13] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-qcom_ice_power_and_clk_vote-v5-2-5ccf5d7e2846@oss.qualcomm.com>
References: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
In-Reply-To: <20260416-qcom_ice_power_and_clk_vote-v5-0-5ccf5d7e2846@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776340775; l=2680;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=k98Sd+IuX8Zn4GRN74V93GHVqiBr7BdRALamjqjLJpY=;
 b=oe/UGWbm2S1UOJmEZXb7xFis/im2RDqGaiAutBClGq+FEU5aI480XpHFOMuqVF1yWN8lLG2SI
 bZ1qVSG4I6DDC/RvkWQyFhOWLOVI3rpzkJH6M8PO/F1jeBmMyfU6ihW
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: mq4AnC-IsGQeCRKeA4qb1GcjMFAr-oSM
X-Proofpoint-ORIG-GUID: mq4AnC-IsGQeCRKeA4qb1GcjMFAr-oSM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExMyBTYWx0ZWRfX35XYc5ZHtb1K
 WlLvjdTNwXJ8vtOSvuvu8MSFsmJRwl93/0vXfdiKDORL6CcmkkucjHn447hAuRMutL80VjUidtd
 7JqTKuu0yME2xKMXgZxjKL9I4PhGLlF+fzaDvdRKiZH7bBLHIUo99xt1jhXR1aFAyCC8jsflphi
 hdSn4KemhCBV4oNkbfjJP/Y5CuWpCV1dB2YOlYXL9TebXaWZl6IK1QzNi4hHp44af3/omGn2EZf
 aMudHFk/7QxvduxqGGJriO+Wuc2A3+ZmTeJ9nXkghErIrx0JbdzegjYhyu80pIttFpN9PXOhMOn
 euBZcOs8D4fv38WxjCaqzwob/+dujAzkgBOyQGRpKbEGbK8HseyIbIB5TeJln0xiqWSq9hyVKok
 rGUvuMv7MKssaZ3+0y3Ni6amWyZxJuCW5dz8Prj+F1BMMP56kjvxypZPX6G6COVcj3GACVUlCZN
 99pKKGmzPjpuom/rD+A==
X-Authority-Analysis: v=2.4 cv=YtE/gYYX c=1 sm=1 tr=0 ts=69e0cf44 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DGDWbsvPyNGGEFbMfx4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103392-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2177140DCA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
de-coupled from the QCOM UFS driver, it explicitly votes for its required
clocks during probe. For scenarios where the 'clk_ignore_unused' flag is
not passed on the kernel command line, to avoid potential unclocked ICE
hardware register access during probe the ICE driver should additionally
vote on the 'iface' clock.
Also update the suspend and resume callbacks to handle un-voting and voting
on the 'iface' clock.

Fixes: 2afbf43a4aec6 ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..bf4ab2d9e5c0 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -108,6 +108,7 @@ struct qcom_ice {
 	void __iomem *base;
 
 	struct clk *core_clk;
+	struct clk *iface_clk;
 	bool use_hwkm;
 	bool hwkm_init_complete;
 	u8 hwkm_version;
@@ -312,8 +313,13 @@ int qcom_ice_resume(struct qcom_ice *ice)
 
 	err = clk_prepare_enable(ice->core_clk);
 	if (err) {
-		dev_err(dev, "failed to enable core clock (%d)\n",
-			err);
+		dev_err(dev, "Failed to enable core clock: %d\n", err);
+		return err;
+	}
+
+	err = clk_prepare_enable(ice->iface_clk);
+	if (err) {
+		dev_err(dev, "Failed to enable iface clock: %d\n", err);
 		return err;
 	}
 	qcom_ice_hwkm_init(ice);
@@ -323,6 +329,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
 
 int qcom_ice_suspend(struct qcom_ice *ice)
 {
+	clk_disable_unprepare(ice->iface_clk);
 	clk_disable_unprepare(ice->core_clk);
 	ice->hwkm_init_complete = false;
 
@@ -579,11 +586,17 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
 	engine->core_clk = devm_clk_get_optional_enabled(dev, "ice_core_clk");
 	if (!engine->core_clk)
 		engine->core_clk = devm_clk_get_optional_enabled(dev, "ice");
+	if (!engine->core_clk)
+		engine->core_clk = devm_clk_get_optional_enabled(dev, "core");
 	if (!engine->core_clk)
 		engine->core_clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(engine->core_clk))
 		return ERR_CAST(engine->core_clk);
 
+	engine->iface_clk = devm_clk_get_optional_enabled(dev, "iface");
+	if (IS_ERR(engine->iface_clk))
+		return ERR_CAST(engine->iface_clk);
+
 	if (!qcom_ice_check_supported(engine))
 		return ERR_PTR(-EOPNOTSUPP);
 

-- 
2.34.1


