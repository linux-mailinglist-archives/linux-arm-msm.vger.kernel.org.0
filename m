Return-Path: <linux-arm-msm+bounces-104663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FpVLwkq72lE8AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:19:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6556246FBF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 11:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05E6B3016D00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DCE83B52E3;
	Mon, 27 Apr 2026 09:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Irdcl4My";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zcn1llyN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFB93B3893
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777281389; cv=none; b=ZzyCEM0f6+TeH0gV0PXJ5glCMwaiPNfCfNQIJJBYlzb2bItQhD4JMsXXlH+llEw6mvIlgCL+vRCRwJxGq5yuVuh+U5A7zRgLu6tmmvCyLTEMmyZbKUmuI5QDCBn5KY3t6hAcQubRolZGqG1YlHe6K42A/YEmSv6cSZQ6iit8h6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777281389; c=relaxed/simple;
	bh=diWgOzXY9pNpSKSKiyud1bbSlEDatQXeSQQjMy32SOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRVqIBj185cA0sfSVDPAhLjRbD4hoH8oxhHTtwPttHqocUgmx7Q26bB2PUK5XVkLN5OO/sReHra6isfWQAVfjypw4w7GZJ+tuknjCi2typw6UV++JqajenGnFu0leNz3Ks3s2zXsDIGO/GbkguqvmDsq9QQJIdWfyIYs67D5Zc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Irdcl4My; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zcn1llyN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TCuc1501572
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JWPMLFyvcLV0IDQ/Od1mGhJtfWVit0lH/9qs4Y36Y8E=; b=Irdcl4Myjjif0Lx6
	r8nD3wPzsNoSzlswmO9QdtaAWEniJ2GWLAj1BP2tidFAk/2W1S8LSxKNcvA7qxLV
	4yyFGaBpYKtAD+z0YDjns3w5rc5T5mjI355IIccaVI1AQ2XtqW51C+2b86N0bZvG
	2ppAR+oE3VGStscQfA6OanOp8PkCrHObICOu9F/pM65B7G5C3KN1tuoQhWzy4dbx
	QTwC+12rKwLrhOzZW0gRMhGeKuSi+/c/XdrevVmTF3StXKWEvWqLMLPXgtLz3ZUg
	XPd/QvfD9yLw5deyPyq/WPPw0Ca7qc5CoXXfyOk9OJddJkCtMNrZdi41WCqJ6pzP
	Rs/jLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrncer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:16:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e136aff17so183011031cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281386; x=1777886186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWPMLFyvcLV0IDQ/Od1mGhJtfWVit0lH/9qs4Y36Y8E=;
        b=Zcn1llyNaqtT8c0FtySmpziThAoswjPZ1zQDhhy/DanC71xsvR3Hp+AfM2NNMx6Y2z
         TJb4S9+iIj10E30FSel9rfsvzd25a3e+7TJaRrhJOfOutMkfH3kirzhYnriNfBN8eBdb
         w/ShOa+U/aKrikNjvnGrRKIPO+JjiCiQjBouWR4G2861gWlzCXb1D2FUEXlNFSfjN6Af
         P4+QkdO1EXAwHwR5R4n0Q3426sI2MiQ7U6bVjOlEicd7zSLPzYwS5OU/gEvefu+TxHdZ
         5PCKWDAV+qYIxC8qpcJIkWob199IGxeyelw0dhtsUkkzUDvm7tx7G44nIdPmmDtOUDb7
         nmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281386; x=1777886186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JWPMLFyvcLV0IDQ/Od1mGhJtfWVit0lH/9qs4Y36Y8E=;
        b=mRXcmE3625I+sWlJUwINIG695QSq61O6kzpVrCx3Jxgj+cu7EBJAQ12CYxCy4gAcNO
         Gs0A4RRmn4z0a1CamegEy/ede/tHjZqi18+a0JQkE7eJYuAuSGKeodE7k3YiqZsEZWOq
         05qng63OTSYgPChVSyE2JygjFpKf202syqfZ32ArwD+LJ+BEsQuSXin1YtbVJyQjO6P0
         roOGdo8A94CAxN8iae5uWktTZZBPWReP4JJSrgiakJSWzqTmx8oB6sz5GiZkNkEYt1n1
         +Hh2axz7KpqNtqcphjPGUC/y2xIUjoHadycOhuLt6jrYA1u8/Ez1CLQ3Sm5X0JaKpb7V
         y1sA==
X-Forwarded-Encrypted: i=1; AFNElJ+/IWY7tisF7FlfP4dEcshmGQOcl7C6TirLy/c074bA/2M8fARfx95XQ9o1kAsL8jyvXYGSan6GPbBkaI7g@vger.kernel.org
X-Gm-Message-State: AOJu0YwPMNP8S8sugkKHIzIZVUPR+Yfyp9tFXHrvu/1ZU7nh5KyRmK15
	CsKv4YSUuRIMb883tKhq0U8iMLyWs0uxcwTs0144I06buj2kD6xFJ+Gj3J8M4L6GRov95G8gX98
	UCVdOPjQ629qFpivJO+MIy531sJlWMkvkZCqv59pWTNI/D9PkBGOU2EOiRc5mZkUtslDZ
X-Gm-Gg: AeBDietn45974hn79T2xyFjXE+/TJerw/PDjDUBCkYMzIWr/hNePRuJEDyQDw7MIuA5
	KnheSfQiTe829F+ikwihjncg0drLDB7xLu3cuDW+1Mesne+t1zenh7yEnAIh7+Ez592rFhCL3CE
	xJhvSfGW1YPJDhSQlPImj2IaliuzP0F3iV3pVnv0Gg3ZuPuwh8pP+al3q3OUdF53Mg0ogA8tdat
	PzWqvP1KWRnCt9X+BHdPvZrppIgXM9dEf7l6Wljm+K2Snh3Z/8LJvwvWc1N4IJDkkNr5sCZEKki
	prVscbMZigTfW+GPjgsnBcpkBMBHN5BJQxln4CTj2ii1h4I6eioOhj6hzMtnprVYfBzeYNWts1R
	qxbTTI+Klnh15YGzLkI93fnhmA8pV6Ceso/svLODRAd0dhzyO3zbRQGehDFvGEA==
X-Received: by 2002:a05:622a:1903:b0:50f:b17d:7e4a with SMTP id d75a77b69052e-50fb17d8032mr427687721cf.57.1777281386230;
        Mon, 27 Apr 2026 02:16:26 -0700 (PDT)
X-Received: by 2002:a05:622a:1903:b0:50f:b17d:7e4a with SMTP id d75a77b69052e-50fb17d8032mr427687241cf.57.1777281385798;
        Mon, 27 Apr 2026 02:16:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:45 +0200
Subject: [PATCH v16 12/12] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-12-945fd1cafbbc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=diWgOzXY9pNpSKSKiyud1bbSlEDatQXeSQQjMy32SOc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylHv6AL2efgKMqvcL9IoV/UKtMSrgAuH9OR+
 LBTlolfjkmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pRwAKCRAFnS7L/zaE
 w2G6D/9coL2vesfCzIDMS2JFC+5AeWfyDCs5DW5HkFIMcq2LOjDyUD9RJZLZ5RSVwA6M1bhF3c6
 Y2mrf4LY4+jQO7iOu1OfGb5Ra43Ty9bn2W14bk0d5hMbxwQvyy8jw7yJvSymuVGwiPpWWJiMW7A
 z+z8FK80p0Yj2HzUuqIuGmyD0+9/wGVJbgo/vqys8Q40ZsTMa50BsuSNr1vUEC5q2SoDEuw6eNO
 KaeNr5B4SJuVe+6VMMLh0l4G0BxuUQ5lXJ0dTLySmflmaCRVKLf9KkO6aWGhFREurcy/WifSP7z
 jBiLkHqp8PEdOH5EOru6eKIxBRuDvTvnqarh6eQAW4kKoyAfM1zVrwehRq1ZJNbtOJ7TTpwAnZB
 tICY+uT86nf2uUrKtQuKymmSse4JEijJCOM5J+h/WJGCQniK78amVXN2VI3oJnONIzggr0zawR7
 IEe7bORoBhRWsJe6RRXdl10HoHSSQ4KfyG196oK94ayr4HpLTyUTrj1j5DIU1ib/AeU9BINnb5G
 E6gkb6jW+AM8giG6S6sXqTwBhGQzvY8wdawFA99qVYHmo8RXGBcCfq8FCSv9xcVnRL/9azm8r03
 gwxN2zbZlHVmmRBjWw/xgilDZcESLcbKTC0Levny73M/q21PfHM0XJUQ649DQfb67uRH7JZmEhw
 znqXlDWLwOd61tQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX1msAwm9//rqE
 WNzm5RFrciM/Wx9VipadoI8ysI2Y6iRRXA3AZv7aBXZAyRfUKPEMe0excDr4XIXAJUte2ddyAht
 V2+f/pG8B/n4zdRb6/iHwfntjgWNs3ajprochrkd31zEOrTNxPfS/PezYHG0RcFguex2dBKiPoB
 nOlOlIMl9bFTtvJ1sxECWjFmjK50vi8MTh2RK5HN8RzXlCRL7d6B0pkK24HbAW549ZZnJyc9c/2
 /gk1+S8pM1ntwvPrp7u5BikvJCujmT06cjrka/2m52cyN7qH/GoQPlHTg4gEnFxNeXXT/itLxof
 SCzvqEIJfzAMxrFj4WZMJm095dBQAW51dCOqMFcF2mSXO9KaUKPim/oT4xHpqBk7CY2GJECImvs
 oJ6nGulxiYSJFRWmVzwLOoOuh4mvoznOTjN2DKydgANZuUki8ALGzehaKynq0dt7FdzRloiO47C
 wxpscg2gpOfCDAU62LA==
X-Proofpoint-ORIG-GUID: IVaTxWuxYzgTSkaoQ-3IewCep73eoDx3
X-Proofpoint-GUID: IVaTxWuxYzgTSkaoQ-3IewCep73eoDx3
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69ef296a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-Rspamd-Queue-Id: 6556246FBF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104663-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 312a8664f87e63cb3a87804c52b8b2af612a47d0..44a237ccc7a4f6f9e2f19e43ad50c4c90f5effc8 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -43,6 +44,10 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = {
+		.scratchpad_addr = qce->base_phys + REG_VERSION,
+		.direction = DMA_MEM_TO_DEV,
+	};
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -64,6 +69,12 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		return -ENOMEM;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, 0);
+	if (ret) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return ret;
+	}
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 

-- 
2.47.3


