Return-Path: <linux-arm-msm+bounces-118784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mtnRK1/kVGp+ggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:13:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B574B62A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:13:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NMRute2v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K6Il1R67;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118784-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118784-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DFE134225B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B0A4189B5;
	Mon, 13 Jul 2026 13:02:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0295414DEF
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:02:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947738; cv=none; b=UiwPn/V8Nt+A3bJ0U0SqoHYw6+UGUnAsOKDU7bQksnkxfBiNnsuNJICMiWpzoS78vmZDF8OQP5CK2UQU4mgdNWgzJaesSOfI0WtwZM5y2CJSehdSe541AvYf82iLdvUIst7R9GXnMr66H+4012jdrIXsnTD/YgVFfFMNZlDnuhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947738; c=relaxed/simple;
	bh=xewtmBe7Tjse/Oov1uLM7I+VZpNX0SB8ljw+4HhCUeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3uvs1aRFCZoIoYD1Zyc8sYXFi79hffmxsezYxwVvyHWBG1LTyKcLRDwTfjkK53Vse7XrikvGXRmjdbr23Rj3eg8C7V1gH3eepLdd2Y2/rwDeL305AWiL3kFoDcQ1QAzUNzfuOqBy67u9SS9SJCgXLu/O5ijTfOnqRXGVvt3Y8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMRute2v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6Il1R67; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE4cp1561461
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:02:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=; b=NMRute2vZku5bVXS
	QiIvvm9xeyBMm/mv+rlCvBNNpOJnef8oU//tA05q5vNoSvGUNyDoVoWq3zayf/CK
	3ETL9z0O6xPQigL1KSvDFL3eSHcGikuV7BYFggUtg/EmVIGsWmQEM1OXkcRF1ume
	GpWWL8fwdDsPbMhEZnhzXqzC5nPGTuYXO1/EOAH9GMxVqowSnwiui4BIRbwz1BHS
	eUnRZKYWDBKPV1vnR2qjg5RhJ8PQ+GSenAxYMvpON1z09vPt1KwjpTdyI9WaDtVd
	qtAQw3oO8PlvylR0t8935vWJNIEuJQTyCo+9fiU0dv23l5ONSnApGHKyVVKEGR9B
	lvu26Q==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3akmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:02:16 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4893fc86bebso4308603b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947736; x=1784552536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=;
        b=K6Il1R67PC+VeKfCGQLFAf8ru9quTh0ay4CsJ0/36nEPtoyNHDiLPaKMmIQbm8mG9z
         f5t+GjCH/1WpFzxE5V7nPzSX9bxRRh2wnxPsSwyvt1Hap+7IT4qvPFiAem4uYP9f3jfH
         C50UAmHyT86pdbv2rYwn9pbK+dpeqJBK1wOV/BWiA0AsPUWQMxyr077v9Q5OO/41UenF
         oT75mzUNE24ydmC9zmFfExLZDf8pR6VtpoHFZE7nYvvPqDCReIcC8qD4AbYkotrgpmCe
         zuh6XKzASXcXeppWNh85rdbQb1PDYwD1kknOx4oAh20S3dJ9D9aAKxzZ1pBhyrf4+7yX
         WL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947736; x=1784552536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=;
        b=Vq3fTm8snW2s62QagByU9fLTGLf078IDjivlruVy7extvbIO3TFLbDG5AUK/8OMjhU
         ITAZ7atn/fAuYDTXs9GNJR2uwWRY/lPeG1uiPKgWPIw57LrgQ4Cu2tUn5bId/YC8kwiC
         KGZPIOmombF39P0qy1EtiSVmHtBHEOPy4t44BqzJCEEBWM2IDxHiDPEVa2GXBAQuiBro
         EckWocGvjk9Ew3OdEgSUngVUkLRKyrjdvkwrkFIo/A3ig1YmmS4bHEH7A7WAjNk8eGNx
         NJRoapVtxdY+2cWoam2+FxYlzGpNGVgBmt/BtYi3mWP4kDNoc9zDA8sZkzUEwShocw4m
         B9wg==
X-Forwarded-Encrypted: i=1; AFNElJ/GWeSpGdsllSQ7EfXJMvdaJlNvtfuERbbYJnZzhT7igALHa0bvo5O61gEozkcsxi3iPAvfhU1FoiT5M5U7@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZqsGgBZyxswG96yrOQtgcL+m7+jXl+z7Mq9qSV4Fbf1OYzRA
	nqv5O6MEKvI8Ghpzcm+RS2CQnw4LDzeKlsgIb4YseJCLxh/7bIcxhvSMiCBaJKsMYGT9/MEQmhp
	O9b+png/YFEglRa2HZ7xENfEMwEMjSGpBMFZOhOo+U5G6gh221gHT8Z/moqKJQJtsxqEQ
X-Gm-Gg: AfdE7cnMwsNhf3Dxai0WMXx1k/ZDYBKCfpNV0F95vheluQYa2xk5i4PAiG4JNsxL0v+
	hz1wfR0eokje945J1hXXod9ZzuRiE88d4qw1V48AmJ5HKWs2AtHy3aolVFHAXQWq97uD+l96Nme
	7mjXAMXKNUae3ohMzYGPxonYNFoxGr16qEOsQqvGKUBk3ZAbZ6KtjBhI2y3JMQPCWpunVo2yLVp
	llkQcumhIV9lOupPBRY1tFrtQJF/IMKAXOFi9HS+usIHZsB/NDxBo2qK4rrzj+XgJ8ivcuXAM5m
	W0SrxNJ6pKYuetZlmloObMwn7h9gGy47O1N253xYDisKACNYZRNIJQ6szewQ62mqrYEmpVd9GNy
	KZa4bD0w/g4DY/iWq1gsRT6q/cYE9sT8SrtJhhdIe
X-Received: by 2002:a05:6820:200d:b0:6a3:94bc:bdcf with SMTP id 006d021491bc7-6a39a72fb8amr5197240eaf.57.1783947736068;
        Mon, 13 Jul 2026 06:02:16 -0700 (PDT)
X-Received: by 2002:a05:6820:200d:b0:6a3:94bc:bdcf with SMTP id 006d021491bc7-6a39a72fb8amr5196960eaf.57.1783947732495;
        Mon, 13 Jul 2026 06:02:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:02:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:15 +0200
Subject: [PATCH v21 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-14-bc2583e18475@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xewtmBe7Tjse/Oov1uLM7I+VZpNX0SB8ljw+4HhCUeA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGhfrH2NKXSF17KSmqZSYmJCy4/yZakaynWt
 vvKhTmcPlCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThoQAKCRAFnS7L/zaE
 w4OvEAC6nTAxezYrhc+HKbKJEUbU9SmhCNsd6nEk+cW/LBcJ4dP7CB7TvqbWxccqG/JN/L7HKcZ
 BSIWDFlfruG4HGl4gtYo0dE7OeePRr1k+klnQp4lQkg8aPtlC93WmZOAR0xYFfRgKsEJ9VJkjW8
 tNP7UB6Y4uls2OHbjBWziBzTIqB/ooWP1jYM3oS2scHsjnHbx1p00LOdVUta7jH51XAUeKKamfq
 KYeB+s7GkLJ5cVFjlocnjkOuvcalhZbZhfBugjGCzJQ+g+bH7HwAOwqonKJLYtXo5780qe0fed6
 68A2iXZTVurWhhxp+JS1OOZxO+NahMqrzCR2mrLsHwt26rR3qnTfgoak1ZBHtiuy2uKxuOHXj4i
 cgA4nlJxxHJ96b+RLkQ1zKiZoOuN4gXp2Bj3tbkl9+x4Z+BgV1tv+8aJwaJ4OXErmZ/MdemXkAN
 UqTvYK3VKHsq+8I0AN3t6vm0b/+a78X6IpxTSP0B+GLupECFXVO57OeHO9tRI5BC/S2C/+5Tq9+
 O2KGMVfcN1RUAKPYXu4ndc+2tfbpGkk7wqWVf4vUqXP5iqWLIsj3fldX8ZbErizdigVTaTqILbB
 SpZEtBHelPypXOfqmyKM8eQec40XcEesHJlo+o8wYxXoU+WO6deS3cwQKOV649qF+vIVVx9QtTZ
 zhP7w75muXabpzw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX6omJ7R7NcsDW
 4d49D3d1S3owLHcEsMZeGKJe74lqYKtrSQf/J+F209ttxVgL7Ul7eVUeuM2NNTN8/C6YsNn+X5i
 QF4ri5qUBk4aITFeYUxL/2156/yUcnxmCugp0aOm1tcFbes09hzqx2PdF61Q+xNZKhbSWRtpHDa
 58cOiVo2G1V8jzuLiqnHYKtb9kB8UzFFkvGXKauZqdgZx8vCVgPuBXzayDURTWkbOnr7Ow8JN8C
 ukICjDEhqvQEGBNLLEQlOZRxqTg5VYlW2cJQST+C+dHMVcLi41hErz26CIlacP2Ij8gWNWdTY+w
 7jf1m1BjMi3tQS4OXBVJmqMjWB+2wBBs/m7zRxPlx43e0zIMduIogIqLzB8R9OngrYlqdHJO4Lt
 47Uw7WPy20XWcvd965+oJdRYYx14y9xOku9R2ZnScR+GB845ejYKLmusJCaNzzll5nAhRHuH8qY
 MbU9I3pLcdasChDgwMA==
X-Proofpoint-ORIG-GUID: 7kGMk8CSzu7ifC8IFq3YHnR117334lAx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX37ZwlT2vC3EY
 Kx9vtyrLdWXlLpI72ruLfm+aLCqYAlZ6T/iHmJEmsk3fj5omii+zdCWiaaIgBP24daPmQ76upDe
 0vu5YfKj+1MJFcZ4ersHbx9lJsCjgqU=
X-Proofpoint-GUID: 7kGMk8CSzu7ifC8IFq3YHnR117334lAx
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54e1d8 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118784-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: F19B574B62A

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 1b43c56503334154be4b8000e5a9330b2005cb64..6410f8dc5bcf517223c768a3e8f87af245076c84 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -41,6 +42,10 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = {
+		.scratchpad_addr = qce->base_phys + REG_VERSION,
+		.direction = DMA_MEM_TO_DEV,
+	};
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -60,15 +65,21 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		goto err_unmap_sg;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, sizeof(meta));
+	if (ret)
+		goto err_free_desc;
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 
 	ret = dma_submit_error(cookie);
 	if (ret)
-		goto err_unmap_sg;
+		goto err_free_desc;
 
 	return 0;
 
+err_free_desc:
+	dmaengine_desc_free(dma_desc);
 err_unmap_sg:
 	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
 	return ret;

-- 
2.47.3


