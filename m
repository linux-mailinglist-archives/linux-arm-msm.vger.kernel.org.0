Return-Path: <linux-arm-msm+bounces-118774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wgJsOq/iVGrJgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:05:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5599074B42E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:05:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TR2Vbwha;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A9GUALVD;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118774-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118774-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AED8F304C37B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4E3419302;
	Mon, 13 Jul 2026 13:01:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27A8411668
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947703; cv=none; b=TIIetSeaWRSC6LBVKbvFBVu6dGtYvt9w+p9U9PlQX1ANsAiJcd+v04G4yqd+xFOptHf6H4pMY/fLYDVsWLLbhbs43eM8/NQuGhlUz/6youL8uL+fdr8z52N2Yi1RCOkL6f4QVXylOhJiJdhm9kVtoEV8WlzMQOmwGbixSr8pdeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947703; c=relaxed/simple;
	bh=1Q+aPsoEc8W4PfEahFbzsFEdkzT9tiwxUCi1Nvr+Dts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAoB+/bctgbUlqlWhp/mvmtS+wVECyulglwLj1Pcx2gDosHnzQ1QR/svRzHWlMahBb1yyAXAFMarPkEMEnFuq5TGqjsai4u6QTx74LqIrs11AA9ouCVZPOVPODla7KVHkVVQukMg18XdBNCBqvlLxVb7KWsDbCTVDU0hYoQwfaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TR2Vbwha; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9GUALVD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvXP1428308
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=TR2VbwhaedtgsCjR
	Uc6c5F5h++logsbZPYpfV1Fh6PqmawOGcAHQ21iHQezcNdSzQJ/hH4I9NZYrOkqx
	lBLDY34/a6Mqh6J6TYfYnm5Nen5aVfGZURd12dK593ddK0mfSA0h7bDASCFnmosu
	wgZnL8grKitKP5SZYSqwqoJq8K1729eyWuqBzxz3jVAFEXnre0TkWWTyR7m0pTWY
	U5EtcCXUPZXtNmHR2JrUEIvV2wQBvJhkXrdhe5IGPrWD+zqHXj6+Q6M03pA53uqJ
	3PHoHBl9zJgx7ynl8BYeN2NrfjpBZ7+Ix7q+5uw/mgvMSLX2Pd0pIcgpdduXTkbB
	CBTx3Q==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn15kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:40 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4488f192768so3158313fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947700; x=1784552500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=A9GUALVD5VLLOrf//+OFU/zWsZRjaC3X4F0U9k88YsUePzJ2E5A68IwDqWOgETAvQP
         p30qtfVKmm3CI5ZxgV56jflPYHhYfxNuwsqgh0faiRG/Z8xUs4BZj0XtKqSRTPX5YM3y
         T4QJfQreUk9nmfWbhheTgS1pwDD+TeNeWGskn2jMaBM2YbINR7SFpJ+KdwpPHqbXj6Vh
         8lAgOHyR+z0ssqTjBdQelJUbZEzB67vJ95VtogcQFsXxMNH03t4Le3UD/32b7vfO+dL6
         q+MNwkQ4P5VaTaOwFCW7wG8ZU3al2xU0P3DwmJHa2n4NrWwkag1Cp6DQR3Dyza/IpGkR
         hULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947700; x=1784552500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=XLhBX/DE5hZKuNmCn8bjiQ0+A3OhMjOCHdEWGfbpD4/plnkJQ/OVeQZZrPf390UaQ1
         OTLTI0JMtYnXNu+TBGEGe/+4f19bB6TYbaF2P0eueceAn6EwWoYeoAYqJETiGkz2VN7m
         C8RzdqtqdqrhnJUoIGZ/ZptI6X7fD5BfIP7GTtRk8DEGl9VME2e+jJd00TWMg4/vKYFr
         ZI01sqsLrVYU9pYvYwLz8Z0Gih3UDoX2rLcgfFNARY6GJHdLZGxVpf11YNCwFv40H/To
         JiRiO0n0t2OIQ33kph9xbStdOrejzz0hqnZ1ud5E+rNcM+mmEsbhPSKk8U0zqjJ48jlT
         VbxA==
X-Forwarded-Encrypted: i=1; AFNElJ+1C6Z8SAXBMhEN3h1Q3aUARmeGBxaU/jnZYz1c/d08SwDJevaepX23vXegwTgG/gYDMiqTUJdJnJEusbFg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0arFpSEBAMLGlPQFMbFU0yO41Wp4IZs/atFvsuknORIUFMe6P
	ERQ+XgVeQV+dYH6VuoDKRZAes/WSlWkDjd3B+kJdD85S6ADDSPYHLflySP6C1Im/MR4F1cuHB2R
	/9F8kf9XfvsrRRaOfZ8B6w9v4PoMBFZCn3xzGPKeBVPuasuu9d7wSQebDBcVWb9X2I5o4
X-Gm-Gg: AfdE7ckF8fVsAH/RldfncI0jY6vQNfb/dIHB93uouX4T6QDq8mz564RKIbnrT1oEolk
	RNvzCLyPqhRejKrdDa21dNRxDxRoaH7DMPpDl6LbS7/1Zbjj4mumcaDV7H3Qx6CihBi7ZaxIWXL
	+wSCV13vEi+9q/Y8N2mqtjMPAKvnlqXq3F7P5koO/QiSGe/BRMFg96bnWRgfN/CzQTfo4J9sSug
	gtX2qJ7wjxNKovcwJIH0zJ5QAmu3RWOcd5ITNdBuEFIyY7hPoWSfiNaDInc0optDzy7SXx+ADTV
	kvpxHiyu3dlM+FeKn9OLEge5VZyOXGHkVN/atvBd6gn3capUenuKDU5q7T5ZACXYyydbWJZrBJd
	WEf6XyGekvKpztEODuoCzwKmegZgyHfYHt1aIJSS7
X-Received: by 2002:a05:6820:150f:b0:6a3:74c8:c055 with SMTP id 006d021491bc7-6a39a561d8dmr5636189eaf.11.1783947699746;
        Mon, 13 Jul 2026 06:01:39 -0700 (PDT)
X-Received: by 2002:a05:6820:150f:b0:6a3:74c8:c055 with SMTP id 006d021491bc7-6a39a561d8dmr5636138eaf.11.1783947699138;
        Mon, 13 Jul 2026 06:01:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:05 +0200
Subject: [PATCH v21 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-4-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HGeQqzQf8+DrUa/4bzOvLohFWS/bDVC1MPHUwVaBFAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGZvuGUYeChHOLC77HMfiNMIfVnN8AjQan6W
 BeS6asnms6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThmQAKCRAFnS7L/zaE
 wy1iEACsz3YnAAnaz1k8qigqPCxgYXXpAPo28WK2BGkIxJnWSpkVg114GyWtZa9CVovWwDf2FNY
 5mPXTCu7d/cHhSoqNb2s+vD7NcQBdho/HyhKnh1tIToo54h1FbJ4ViWRQ+R8mflfyoCsz4yobXI
 XgbZFKJdPqtW+e0hYpbBF8nPlzP53vpRNpTu6kM4o3fdPUOtwL+sf4NpDz4J6gHcfxIPdStSGDP
 LF7rY6vs/mxVwPHuxytui86zaLzSz5BxthuE0QUgb9vqkibyJRvqUZpfONM1ZI4FQlN7gZcoaSb
 6RMHbvWs1VNxS27/r/4LwU3hHF3RjudDc55Bj2skAEillw4YHRxBHIXhhTy5KsS/wjO1MoBmhx5
 ttgqK7vp48MohSGVdH4GESxroODaknQWBMuIfeGmqxY9ymjvlPqdnCSxW/K3I2HmefMPPS8hSMe
 1CZIgnVz60PtsyVz55b5kqyE3RIpcDqN6Rn+Rg7jDAiH745nA2r9f8ESiwNJR82qMwwvqiLnjIu
 /dPR4SMJKOqA2wafaxWf4kJLmYWCoawsh8EXqmQ30Rnkv9NVk/6Bk6snCJ4jVo+YpJPEFCotVH/
 Ba80v9XTVKr3TKqVnlD3N/vpR3tp6SRRbPLqjndYlcmwY+P1qCQvBdLJBTR5TiIxFCvS0n6nT3E
 Y1DpNNcWZr2QC2g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: cbOWAT0yJ9C9UP_-huucUFVrXFY2Kalg
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54e1b4 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ioP1PY9e4_dTeLeN8ycA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXxUElt0XHlrcw
 TAzhF+XZzVeZRNJuak7o2bY9S1MXeSVfn66OGszCyaGaJOHl6pU+GxqS7Fvf4rHllH0hVZouNEb
 i0AerwGzC+28JYLqXTYZPHhBqlSQugc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXzDSzWX8Jz2qy
 tOdcDmULtKCd6Ai7D2AgLyy7Se6wnpMikMCVbmB7lOLyyxqJdQ9/sj3rhZuvbReK2++HwMYTJnc
 h84PJocBruYqWAeeKqRRWBy3Q1yg4uOBGfMeRDh21Te72eEg4CBERPqKGiHoFf15F5tEc179TfS
 JqqsoJFfyixdcB+401ZyKajDLQzIs/DP/TFXVVqtd0w/flhrLOdr4JPpeMoiOFupCzcEh5APSYV
 8TshCfPPh39TLL93GAI+XTrK6I3AnVLupgvfFNQ1ON7dHNdDYAGRqKy+0mApSmEF6xAI7sKTbF0
 rPsGdC0e5Ur+wkkG9OkzXuSQjbPi5KljMLS5rz7BViS18ETxjm+4LOwH4e1fzV7r/+92aNAQ1Yx
 /Sy30K7L2p6Q8MF2ztJGC7nhCtC9VJwq8lTFpKF9+/BHf0NmUkengFNEIZuKW8ZwQMXgjI1tcFU
 FVhs2G186cDvQ/lbyCQ==
X-Proofpoint-GUID: cbOWAT0yJ9C9UP_-huucUFVrXFY2Kalg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118774-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5599074B42E

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
 drivers/dma/qcom/bam_dma.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index ea3df28e777f99c0532761b6aee6807ab23ab4ca..8ce0fe085c5fea6cc614edd692b5cfd264b94d5a 100644
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
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
@@ -229,6 +245,10 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v2_0_data = {
+	.reg_info = bam_v2_0_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -422,7 +442,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -440,7 +460,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1234,10 +1254,10 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
-	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_data },
 	{}
 };
 
@@ -1261,7 +1281,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


