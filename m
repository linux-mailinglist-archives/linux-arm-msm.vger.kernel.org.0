Return-Path: <linux-arm-msm+bounces-104652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMJ+NmEp72lE8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:16:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F7E46FAE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DB665300699E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A163B19D0;
	Mon, 27 Apr 2026 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjHdN666";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMBzXbPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BB63B19D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281360; cv=none; b=cuijKhPzsfPEfSkzldOOOkx386HpIFcSa1OTyRJyGk6kcSLr1PpXaSTg7qEKX48FjNPIZkhwWqCciEtnYbet7zGnD/Fo8J0qU3PwjP9rd05ldSVh/NKV8VYqLza1hMfVsWFuGXiEzLRzr5OyQ5f7CuzT2239uQtBQGu4pkZBeys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281360; c=relaxed/simple;
	bh=C8t0ZoGUnDPF/P+4BK1Ho5MJ1aexupcCMbMgOX1T0s4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8H9yLPc7+URW+b4bTETfniUlkeb2Cj7pKVV0uvB+1JlqEnn7mmM2sWEM/xGAGtEiaueYsg/EJyYeJtsBAxpMAPboVoCV7vQsQbGEQbQyw5MIUCtfxnVVVJT6wLjI46hTG+Yb+6aUninDhJ0JGHT8esBPbEw/b3/ytbQF9DprQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjHdN666; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMBzXbPk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kFXH3961977
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=; b=FjHdN666g2PqthR8
	V45oXYnO/VUmnauw2NoEVFfCkXZ6BLY/FCRuqtYw8tizUiOa+W1HYzA4Z8/RSTFf
	dgmqlWgwtCea0K6UId9xn3lF5L3iNwYWBdmnMnyCg22nXILpxWtoAUgW+kvCSpuD
	f34X3hfkp5YRU1q6jelBEDeqlhuVzArpxQPIiP5+92eovPh5CZRFqHL1jbrFS1Fn
	4fxzmN4hwwcIDZM/uX0PfJxe48aP3IVSgYINxZNMGSrLC6wigM5OzjzMOnyFA949
	GPylZTzW/SPD0cVsBwQMQCcgJZX3g0R8J2DxCFfiOja2cyLqqjSE4L4xDYCPaDa/
	212VPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k309kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:15:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so38011051cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281358; x=1777886158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=WMBzXbPkDx7cBO7Uy7iMkSV4CoHo9APMcJOdrwv57l2B9G3xfKDC4jS0YE1K8x+Jjk
         bHL9Mun0Y7ga23NZUiCndfZtvhQ8huVjWkzxFzBDDdvYOh/wjfn195DODv266bz48jry
         ac6E/RPkDiyla8mj6O3I/7X1phHcaJuYFNC8A7B17xGg/XnQ6aEC0/PFHy43n/LyT0i4
         MBQWgleNQT6ts7ihC37kubWqRhpeONrRXdMJHaL9MPkilLumgiVNBYLW7dYGc2P6pShR
         IzNi63N50P0ruQBVpn5W6ZF02KpOARBs3+sS5bV2YN1B3vqnK7+Nsl3fRDecX0M5dGzB
         Rqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281358; x=1777886158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=51xURu7Zhd73Xm88jAVPEesUyLMnmj9g9fiXS+Fq4Bs=;
        b=Y/jUbrhv/1S5L8Imn1xonJXS5bFnGbGD2jqP91Fc5C5QYJAdtNtuXBoXXdX5KrdUXk
         OdV1b+X3Tdgr+w2iiO5kGT1Mfh/VPGEgqgl7IKIloTjY6jc2tiqALBPD6DfbXH1UpEeR
         ixA9aG5swjoD3hnQ/6r1WY+8Qu6tk3RYFivSC9CvhFG2sjpTDmyYTdvY1dpXaP++ABeJ
         YBs2LCkhjon5ncN7w2UGdNIL5xM4OAvKYvtvkCfh7Ry4xKzNfunyCyVhnf6+BXzCmRYm
         h62/ebKMoD8YEamnr49MwWqhuMg6uBCfHb8cW+tUuQYjEfx9uUZf39C1moZ/mXjUfMZi
         9iuA==
X-Forwarded-Encrypted: i=1; AFNElJ909qN4LkosFz8PGRbJBp6mVTz4VUFbOLJ58bvlOxviVLJEyY165ZOUGC/03YaX6koh3/FtA5OZGphQw4Nj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Sux+vZZv/NEJwH36THwJydU75ts8uqTd5Q2AFGNEzIG5vTSL
	KRiOynjUO3E2QVct6X0rsoRH41oTi4Fuh6c5c80t+MWnTHNqEJWva8QAzJ0wyxHjYyXntLW08Rs
	rabzL11j5vDElv4/hEyPnIxIrT36VZn38ixcIAPjIFjiGmhJcxIMOs0b2s1iyYcqjZGD8
X-Gm-Gg: AeBDievTdpa3j2eGoh/9Qsy3pQhL3vNv20/K13PxmZaXzHVLgAdhQMmuw60r8ThE5cO
	ZGH/05NfFWBwrwDmNKC4hitUrmAuLt8GRW9BQxdfrua0iLhBQztdErzmcjGunf0cxwVmp+Oumac
	13UjRdpUCtVMLtWIWoG5ohq2FWhUQ/bqZYI1GwBvAaJ3gHsC0LwivWbhrckjexeSm5KHLYcFFfF
	cZTk3NYDazdW3dbMBoyzs0BHvlPkiDv+77fm7lNoDATpP3iW3WmmHfTvr5RO72Z5eGE/ZUeb678
	6IuRfhr1GnRoxP5UDlZa/93FDUHSlTGQEgzSOzVx1KiHZ16sA9/Kk5ogSyyy+FkTGNkjCI5b6lm
	iWAjLIzdfEnSDS9YHHW5H6nf5bnhJfZZULGdP2EISdpzP0V92mvg3KINczL8GdQ==
X-Received: by 2002:a05:622a:4d98:b0:50e:614e:4428 with SMTP id d75a77b69052e-50e614e4711mr465044231cf.37.1777281357566;
        Mon, 27 Apr 2026 02:15:57 -0700 (PDT)
X-Received: by 2002:a05:622a:4d98:b0:50e:614e:4428 with SMTP id d75a77b69052e-50e614e4711mr465043841cf.37.1777281357133;
        Mon, 27 Apr 2026 02:15:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:15:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:34 +0200
Subject: [PATCH v16 01/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-1-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C8t0ZoGUnDPF/P+4BK1Ho5MJ1aexupcCMbMgOX1T0s4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7yk8aml8U/uuKzfLTF1QDzBZcTS5SzTnwUDLj
 Rf7fhGjq6eJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pPAAKCRAFnS7L/zaE
 w1CTD/9M7yohPsNybzjJthNYlFsJYi4zy+/0cXFzB/USDDxoHI0Q/ANqR+s5n/RQEw0X6x/Dvai
 uDhEojPP3frikVdiOxTx/CLcA940MFKtpXK4vLVncbpz6fhpogA9CQ9rEThuN4kyKkRqvGS8wcC
 wvBnssSbYNel08atGXLfBpNzAehokknmj+RJ1AZnHXP78aF33Pu22gQHnnPTsxF/BAhi18TcIUn
 2N6/j99zOp3zfRUVdDV3F4TXrfOohhTJwN59zDwfZgTrkQ8SmlkkKxrlSYRQflQjRh2TvDzT1ry
 LqhNka0RCVw4tJ6EdYUcmFnzGjqudjIn0NeivlCgGDGocaBmuMSjN6/APtfEs9DZSHimh2eFnyw
 2FJMyLWttOf2k4VlY89PnpOQawzomgb4a7YiHJom2IOZvB4gBu9oNnkPbV0O4rsMR1qcUtNoOF5
 CL99W4qwNpkmPCdwrn/w9KSK93pUyr5TtnviPlpJnMlL5+FU1tO0CCyy7o3nQjSQ8zC2Xp6D+id
 Lxdugtmz+N0vCsbO0QEWZCzNjwrxTsaKYnuGXYTBZj38dzSI/hyc/p2UGTJLtyPbi8OBm/j1AWp
 KPlHX0ahhuPgAHLBvrxEbY2++CaC5bFkRZcoJC48MR+RwsOCZTG1C3hHU71aJLSXODhx70TXnR5
 TBQYsv0L5TdfvxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfXzUbw3so7/BEB
 hwqQh9o7N2WCoESaSIRa5rl+bWvpXjVowXgxlmJVoTsAhxf6jywJXmBNZpyqNIgSq+25zG840lH
 44uLy5FC7pThsWtH90wcEf7AMI0cgwTA+n+peW6qGQrQ0t+72U3WOxGWLfuKUTFsYQHpBSCCL9s
 QzYvol2zLjIc98pgUPKsBnZiLlYXFrjjLx1kDX0POg8tcemncHA4Hrj4GjDdWRIJHpo2kksoeQ8
 Q7I0IJa2NCFszMv1iCQLd+O4yXo6Oa7e62uDMButJvvUbQCtDVlmafreMGEec92GarQJDJbAMLW
 eFiKUMon3AA0UzYPsf1Fu+ES7PHS5V4fvTzwV//LflpHt41MXvO/EWLucu7UyZgY3hzUSxxhIf7
 fqBxo4ljqXsk4qF602vmBw27Udg4DdqaUxfveOiIuOGohZq0Kb8Z92gzuHxff/jvReXi09Qoy7X
 8n2qgZFuinJS3wDVtxw==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef294e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 6Q1_tybbDtcNKSnS5l71ak7fLK2KWplz
X-Proofpoint-ORIG-GUID: 6Q1_tybbDtcNKSnS5l71ak7fLK2KWplz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-Rspamd-Queue-Id: 04F7E46FAE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104652-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c964ebfcf3b68d86e4bbc9b62bad2212f0ce3ee9..8a2f235b669aaf084a6f7b3e6b23d06b04768608 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 404235c1735384635597e88edc25c67c7d250647..165b11a7c776abc6a8d66d631e19da669644577d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e95e1b75cf6763d4d2c3a1c6a9910..5244edb90e7e7510bf4460b6a74ee2a7f91c1ccc 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3


