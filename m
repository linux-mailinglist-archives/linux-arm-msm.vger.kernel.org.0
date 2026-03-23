Return-Path: <linux-arm-msm+bounces-99325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBd/N+ZjwWmaSgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:01:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDF2F7484
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 17:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9DFC30AD680
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 15:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E329E3AB277;
	Mon, 23 Mar 2026 15:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGWZT4JS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/dd8K3j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEE63AB295
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774279057; cv=none; b=c3nZAI9lEccFox79LIxhXK/9Abvfm3PMYka3cWpD/HOv92itH8/FrHFMsjUAkiyNLSpcvuhIwkhqEwz7VC9XYZMlrjg6FoIicA+kMs3+/UJ77KWJv3O0Oq4854NpnBU1PuwwsACdN5pc1wbf/gfyS18DHxl1MlaquJzc3DGbMCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774279057; c=relaxed/simple;
	bh=qoz55FlU0wzlioVR5y4kqwZWHtjnuJw0AgLGnvGjRME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+EIyXnHYtefhXKrKiKks+ZhubFBA3fxcJljR6hKI2BAHG8JfEjSLXIu4LvYLqB0VWckhrp9d9NCDWqTTPmdAvNjOkV3aOSDqXIIiaat0BVglLLiJRtjCihcgWennYWx7bgr2T4pMIhJCXn+16KkEIuPY4zXn6I1sYhBvsIBoZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGWZT4JS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/dd8K3j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGUj23588755
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=kGWZT4JSkGl8CjPN
	gazARJCXqib/p/gf/2sz9fTaxkkLYcyyuohN70Ac7u/L33zWfS7gFrkuaQIEp0Tq
	zTBMLbOcgIstE3RzM4N/c0etFHtBN1e5nbRhrmJUMYFAl+dADPEt8+VK1Ns1qvKr
	nKyVk6vCeO50HIkiuyCaQLcr1s0PXq5zYwq/yG2yXG+i2b5UPCZsSnDCZHxWX2fT
	AfCTotJy8suo7HW11YTZ/eijVVW/po9mQB5d6IHhResj+ipR3iCs+kp1qGg+wRV1
	VXubeh+2feMFOzcA94QbyajLykGGCd/x8MlN4AgwBtAQhgspQwV8Dhq24ynfoMPw
	wTSXdQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0g5t9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:17:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-60132c655bfso41590067137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279055; x=1774883855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=E/dd8K3jC/rK1PHZk1p0ztNDHjXUqged1EJ2U7J4F6BhD2gaD4Z5/mfVJwZLyZbeWH
         u4NUyJrlZxTv+juF+Y0ibfgsQRMM+mA55aJaGrVYWW5j8mpF78eltJh3sawHKsoBL9W9
         1U7Jf1UZxJ2ESpE3FeeEzMJ44GS1xSIuAZd5Ghb0W1yAS+M0tM549zt6TtSQQh2iRV73
         cx0xQ7LZNdB+Dtl6TAoN//X2ssxlYO02pBlPhVPEhMnVY7Sfp7Mf39OqgI5u2SafjFHt
         g6meE/arYWOe/rgHerN9C1kFQ7V21tFfuQodajlqC6KzyGwySFmJRXJAHztPSxcJt2SQ
         6qXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279055; x=1774883855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=bG+X/kL6uZQZPtOh7Vqt6b5HfEZxrd6+JLXGjORnmZlukeLzIGrhYTEv042IfV6tnA
         QiKCj9y6AQKG8BVCf0PhPIejTtVSN/YzzXIXsd/+7/qQdYKI7h6j62tGaDbfE2hut6jl
         Kf6VLj6cradNaiYrFpT9cdwKQdUSfixSgE1D0wKmSXKC+MLKe0BjI362ggG4D0SK7MGm
         8MJ9XWtLX3xWKHM+D4g3D19uH5Ba14qR9UUrvwbuthXGywKb+IbF0uCisezyMdpTOE1T
         W1DjSNaerEkjc3P4A9gZukcISGGFit7AlqOltbae0XBBTUDOULR48bt2OZm0RX3sR9t8
         zggw==
X-Forwarded-Encrypted: i=1; AJvYcCW62c9zO3EhYhpYkJ4QgJrNnrXW1Je6xahZSrUCA6hdp6eEloW0XiB5GQv5iE5vXrX3mnHvWt+zekhqCOJ+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8PDcF/hKNbaDEAbCi9F1wMvgArzIlrGbS0f8rWh8uvdl9BHSZ
	F12SxAD5LQCvzZ7UZUmto9n8RKKucxVbaNbD9bmZehv0Tg0ycz/fel76byF7JiI/WRdYCkPsgOC
	tZP3djMZ6+WajUQxbpENpBr53JzxcxKk94AW24R2p4MjTJxR07SEfNE/k8WqalnmD9JJy
X-Gm-Gg: ATEYQzyHUH63mACcdZzHPPwMa/psF01Zi3wRXuyxoruOZ3ztFJIsYtdARMZuKfsAmKb
	zljtkf82WY5bmSBgXKb2Xiq+ljY9UNWDJ0toaBO8lCPr4NKCockODPOf43S2FN8eewlFGMRgq6R
	dlZbx8Us+gyi1OSwlsDc2/EF/smEScV1Sk42vfV4G2HLU+v4eI7ORqxHs7bNAuh9EWsvhRZdWtx
	hmyXL9YNc9QKj6clJ/azokr+7kvZLdOUS1jrJceQYa4nLzonVOxho5IuL0TsEFxt7UsSlfB4Jc8
	U3GFfgNpnSVjf/jkvWR8bvCpbBmcl8QmdVcOaehezSrOKhePljDtG5et7kO7N6fHfvgMHcvgsyd
	Mt9+SIQ9QUOjLlaQA1yAJdmYbEqSRCZpvw/8f3pLieGyDBh797aGP
X-Received: by 2002:a05:6102:358e:b0:600:1547:967c with SMTP id ada2fe7eead31-60295f98c4fmr8781912137.16.1774279054712;
        Mon, 23 Mar 2026 08:17:34 -0700 (PDT)
X-Received: by 2002:a05:6102:358e:b0:600:1547:967c with SMTP id ada2fe7eead31-60295f98c4fmr8781883137.16.1774279054168;
        Mon, 23 Mar 2026 08:17:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:09 +0100
Subject: [PATCH v14 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-3-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RN7fpsHiCZHYCJzNDBLJB3M5MgjeycllWN+nZFNR5GU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVl8OLLyF9aeTIVtzCoOOIE2qZunIfV1911Bz
 KQ+q7C7QHGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZfAAKCRAFnS7L/zaE
 w+1pEACjd+dBDsCtr9r99mTt1ag0OpCzQ64m26+B7AxCgmKG9elKjt+uDI7Lbr9X6xXdXa46L2l
 lz75ziRJCVpa06pdDEsdBgXnQogp6mjJv8jTmWNNLB/EU525xl8wDYo2xjomm5JNvwnUT798+d6
 ez+74vB01NIqS9UXW3w0tyIekSY1rYU/PgJ12SMJzs+detLRrLWUiFF740ISEPXnI5sAAolSBBK
 teYABzQBxUx9Ta56CKhdxNvUx2NhKWf/LFwVGlPWZzwvp+W/A9K/FNf+dd7nyc8JjbFtvHS6oVJ
 +LigW54tK5kjgEwBwU047ofr02PvrZY2NFm7xjSPsnuqwJs2i14Bk0RiQfSOSBF+L7I9QnHJOkx
 H30Y+LoC6IFiJko612QZ0s+aaZtdUAhLUb98kstnRiXt+53dzcXXB61/oV1/aM0gt1voH/2qf/j
 DbTX4FfEFQNuqio/1RzhdskCM7sCChm/ka7W5KN3gbc6dU5s1zAc0KThkz9SlaN6py19uqwq1bl
 VbzFq1kW++JjPONNpu0fHcwf8EpWWz8RQqRHC2GqNM88wVj1JCp70YlCmhEeTK0Etqmas/r6aWY
 zLxjZGEqugWdFfFnNlvuKH3V9Yz/Esc3uOnr88fQTDz7ybnDhEiXmBge2582PDx6djW7xYnqjy8
 xTEvcH46kzqM3iA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1598f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfXwPfptl2I1Bnx
 DiiAuxv+cHPwWl/898CvSsb4ysGMQRG3L/5RA5gteZ4jHZSus3UXqc3KsC750OVoHGaEH4h4H3e
 WkgQ2C8m8qL9zzirempHOV200eIFwxnXIFM9uM63ENC5/CJKZG+z8xRy5nd/esAJgTTm6S3HJh4
 gTiu+JF/IRcUk7s4zRb615BAPzaPtQabXM1xqewki8rZjlTujD8FDAOd9fDATej4cC8Lr7+dgFF
 yYPPhH6rqCCz29sI0zlZxec8FX5VZb+7I+Fyha/sIvJ5kwDy2EVIV3Ao3ji1QfIuviMTWyNb38F
 R4cZdOcNhQat+ktWdYiOL54y2pNza0+fWfaYL3cOiUdgP9vf2S2879eVf+he2c8gwSO2tFkeRO7
 XvmczdCK4zhbRI3BEPdxY3YszowvpZN4Lw75qdpyfpGNJseXri3uhpEm5UQFgqBt/S9tpjClycD
 wSnGez+TYfFkyIhHzaw==
X-Proofpoint-GUID: T4t5hZq3Y9TwlMiU14wnDdAIyGr1mAVd
X-Proofpoint-ORIG-GUID: T4t5hZq3Y9TwlMiU14wnDdAIyGr1mAVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99325-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 80BDF2F7484
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index c8601bac555edf1bb4384fd39cb3449ec6e86334..8f6d03f6c673b57ed13aeca6c8331c71596d077b 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -113,6 +113,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -393,7 +409,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -411,7 +427,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1205,9 +1221,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
 	{}
 };
 
@@ -1231,7 +1247,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


