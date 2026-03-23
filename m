Return-Path: <linux-arm-msm+bounces-99141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKp3H4wGwWmtPwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99141-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:23:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE13E2EEF9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB98F303F475
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8571E37B03B;
	Mon, 23 Mar 2026 09:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bmOMaHrS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvYcnUn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40668383C67
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257512; cv=none; b=crF1wEu9QIXQsc3H5pHwSeq/5P/3VSKHPgQwNJLo7ZhLAitwsAKF+IKXL6dIFFhBOVdGqSnTw3tsCOtTfx/XtwfjWlGId2CifpFhfPjrQLprJryR5gTQIm3hZfpmc+V/HLBZNKihJiREbkJ+mBwB5b6YFggvLlPVpVsN6nUPSn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257512; c=relaxed/simple;
	bh=GRasFOQDQnuoi6LdOvdCuvHUGo8tuUdcLZv2gGWTa7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=srtzF6YQX9J4SLgffS5YcR81ZV0Z8DvMvQCnG9YYDVnwcuca08+fBNxt11tdmd4BglMVmmvuWs/QKKp1uPYU8jtBFrQRoXCYpRHDbA/o+AwsV76p2MB0aTpRHyQG3PU+LZSEq4383Lr708wa+5RSOcLhLObuhvlhtGJJEOJ4EmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bmOMaHrS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvYcnUn5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7u8Tp3468428
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K38ecOXWBMhUStpTWn+W7TDtJFk9bdxlpPeuhwPlVTc=; b=bmOMaHrSpkRUjCi4
	mxpsYzlaH/hvSwoLZc8KGvFWSK4KbTGcnBp52OI6GAv6O0eXNAzm3urSN2sbuEr/
	TN37j5/6zjOovos6vQ+82ktCIk8c5Pz484x/7pKb/L93wwyhObApJhHjFNG+D3SC
	eSvo16EEaN1yDZVGEWFnMqIRwf/RopzUYF2FJGxUWFueIslGd1VwLRJpUtVkCV4J
	wVfbbqq/zZ0ef1OAhSoBJgLCU4pqJRq0EjHvhQsg15HcTTnInBZB3Zl8xy4TEMAr
	4GfbwI97fq8j6WWCK15k2EW7pBHvO+geNFqAQM8S9+J4yQ3uf4A3tFHwBQcBH7W2
	q1oXUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgg9nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:18:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35b977ffbcdso3748573a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774257510; x=1774862310; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K38ecOXWBMhUStpTWn+W7TDtJFk9bdxlpPeuhwPlVTc=;
        b=SvYcnUn5MIW9czobkiH2neGDmBcVOH4miEhmNIMAgOMNsOdxC++KDGoQVqhIHZnLzU
         mxGqRGI0pYEW+sAN/alPME9Xl9ofLeACD2AebaaVmcrtNWz7nVOxFsajkRpHieXYAGDS
         XjbZ/ghKpVMgwCrdijoXDD/kdfJh+1bJh74ctcmsj/Qc3vViORkvB/tEfQT2ugXYmpMw
         UK0Wi0xNZH77j/3i4gy27dBBfPn7MnCfChM6GKtt8Q6AqZfyAjK5heXh2sIN4THgZcq9
         3MUqYIfduin/rdUd6mQ87SdJ23F0MxxAqdL2aYE1ZwNv29B8G9LvTe3C/8iWQuRRdrNo
         8JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774257510; x=1774862310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K38ecOXWBMhUStpTWn+W7TDtJFk9bdxlpPeuhwPlVTc=;
        b=H3Np1/tY1fswNYKn6JB+YxPfcRDLrxqsM24jyXOeY1VJLg2Lvjlo4HoizNiCZYSWCA
         iv4PcTazJJJ1G5SgjNu2Ncg/lVrmkQ61h8LXtPSKtYZ/BRXRUF8U2x+6pWKrnaGwN69Z
         cobyJxV6xVB41W63ObfGC1PeMUuRbKAc88kDCTP2hVXvOPgPJtb/05YSIUOGiPAkMRlr
         UDABBy2i3rLDPJpndh6Fsu8iTAmqKa2hk5HgC1cPZTjCUx1gQH0PbjiTQ4bbr6Q4TSuO
         RmuuDnZ14ppPbAW0+p69Nrsb1tqDIjdJuJgzwbeyO3aBHGqDioo47uzx5RCFxDoyBOrg
         p24Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHjmnvNhvIIhwg0JqeG8onHsfFzJx66PwErHzLXYQ0ObvKrPSblJLBNdTpfzmuvnpW4OAlAUWg1c9G3fxU@vger.kernel.org
X-Gm-Message-State: AOJu0YybfLDeAj/Q77JpGELLEBbmibFkfZNIsG+oM/whv+zyyMPafVsw
	h4SdZ72J8chaanua2HNb9/+ojcnupTCOx1sNMUu08nQcH7nMiQrmv5IKWH+sqhFcFhj4ZTXjFm7
	pxOIdv9UnVEy43Y1jow5xOOHd9oZtl9Nveo0K2hWmXMsvSh9VwRHZGxKVElr8uUZLtroX
X-Gm-Gg: ATEYQzw7rNAbxY+E/P7GMC7WDkqx6d946xtumi0koTV/sD30KQFSrghHejO7pcMj9rL
	BJrP1ebCUPhdtRwLpmae8ISCDt6jnGgw0qp9+xvMxWZf+fbYNYxcbN3LJPm2iaINcRo6fxA756T
	DRntjQpxRML7TsAnCuIFblVhVQciq/+vqRI0vt9+Vqyd/oLOjwqudk5vfmzufcYNMpf4r0cmyvN
	UzXZmmofBcijeZSOLw3jZYw4ET0OgvnVTV6PXW8DVSXXkEN5jNH2O7mn8rlaVTKljc0LcGVQEbx
	0x8rId+HBkdNjS0VmCy+3yRvSPxLNM48vYmjCR+EoHJL/pGRV6JHkN/tHBhntApGZTUK8CBPmNP
	obZ3QjPPN/N8YgSCnmA6fA9Oa+5XlQfL26S1yVecUYUK3MpE=
X-Received: by 2002:a17:90b:28cf:b0:35b:e566:15a6 with SMTP id 98e67ed59e1d1-35be56625d6mr4506791a91.28.1774257509887;
        Mon, 23 Mar 2026 02:18:29 -0700 (PDT)
X-Received: by 2002:a17:90b:28cf:b0:35b:e566:15a6 with SMTP id 98e67ed59e1d1-35be56625d6mr4506758a91.28.1774257509385;
        Mon, 23 Mar 2026 02:18:29 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd358b5ecsm3923448a91.5.2026.03.23.02.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:18:29 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:47:55 +0530
Subject: [PATCH v4 02/11] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
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
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774257482; l=2504;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=GRasFOQDQnuoi6LdOvdCuvHUGo8tuUdcLZv2gGWTa7I=;
 b=0AKNRl6KfF/JYgXrtGC4dExbf3Ox7uxMEZ6hQ/OzDCKpAt31J5XhaBXgEeDlTCqSJjJZuQYds
 bmivaZvOYjPDXR3cTODuxf7D9DSQNwkbi3lePlT0YgGyra7M2ElG3TS
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: mqmR9qjoJYu2CjpAaKJQB8IMwpcBMuxW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3MSBTYWx0ZWRfXz8siUaTR0bEW
 v378jsHcSg4IiUNwa0s7lboqgea2zHFyWXBY+/oW/RgKU0LNW+nkLTHcfM6PHPh+HXPKLaaw+YK
 J7/zueSs9B6h4OYSn5MkfmT0cYKnwVKdDA9lXEQgcEyI5ZdqDWQNqXIwfXIfBJMjwYMafNs8ZpN
 DbQIe2xy7NIpKls49AqdTvsybqpbVnICthvzJGpipsC0nFshTPxLaepcpKCyrUxEgRLNYFXMQxo
 a6St8kdHNS/Bf/CvHt3AR/RD8X0Uyv28bcPg85nrHtkgvpZXhtGPgSyQXWDTvqHok/6vVH8iC9/
 WTUiM/hUazIGKS6nDfYdvmNp+dkP2pVyi2FostEhuB05W0YNgBEo3/KGIobeBkrLriG0dNMeN1K
 qh2wMKhDDj+q6l3y/KLRMstHRl/cHAKHBetMy3V7WmAXrhrkGr50IoLN+l33DtBHkol0kY/y12M
 Vl5F4p8idfbALk4hXRw==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c10566 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DGDWbsvPyNGGEFbMfx4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: mqmR9qjoJYu2CjpAaKJQB8IMwpcBMuxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99141-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: EE13E2EEF9A
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


