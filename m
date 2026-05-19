Return-Path: <linux-arm-msm+bounces-108517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHunJT1jDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:18:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5949357F6F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8137C304252F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566B34F7970;
	Tue, 19 May 2026 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRARRmyq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UojBztO0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FBD34040B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196699; cv=none; b=qNtRdddS5DVcIwHh+TaNY+1YnzG3indzqt2w9HMmugXiH7ZGw218lKIM/KWoIujrW/EwOG50Z+aqFX9erTCL3ZAa7YTVjHdkpYaYQL/8P+R10UjJGmJKnLRFAfsAYB17IAfXUFOCz8+AHMA2bPGCxsYDlP9gPB9ofO5OCMpWkso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196699; c=relaxed/simple;
	bh=3UZYwiIbKBd4buCQOF+dimTZzhwjtTmU9xpQcGXwfFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSoscYRFWeOMy7T83IDg521xaK6KpojvI3F4qhhtc1/Nsl5boY80JH1tRKCdbVGlaPcQ+sv/2tQ6z7oEBnRvyOHxj05GdRQmupjrV3NsSZcMd1H3i6bjkOrEZ6VW5uApUmJPXOGsMPJnQBeZIR9VuQq2rWeVWTDCq4fG5QBFFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRARRmyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UojBztO0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JCZtVS1396108
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTfz7NVKSYasiaQ+Qj6RScTytUGsa7bdJ2iYVLGLoTA=; b=dRARRmyqf+rotZXY
	9sM/CsoOGiUY0r4VUi2P1eYEdw//lUpn/rRzDhmv/AwSK9NYtFcQ5rDp0ti/JZIX
	ZYfsrNkW8i/eBC/w3DUH/KcpqvR5TfI6ohvRbzSjzeRAgfoj1KLqL0y1FM7IG6AF
	87ORwWrwYimG4tV+Or4M9VcMkjE004J/ZM/ux0yspFbk6ONOjI0Mv9+uKJ3NqpCo
	M69pFPRmmHqadKaT1AcmNxdQ6TTXL2lXVcMV0oJec/bQuIBz6wDJa6EDk7I1s/Is
	FRTTCQpJSbRXLlF8WG8u6E1tDtWALZIQHiu3tt6gaEAw5+2pShS8rzS0keLxXLRU
	fo1IzQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8r0q05b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:18:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so5681323241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196696; x=1779801496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTfz7NVKSYasiaQ+Qj6RScTytUGsa7bdJ2iYVLGLoTA=;
        b=UojBztO02L6LsCoDT6kjYVTroQlbIWlrmJrJNKJu7NfW/CxdbITHFPhXigqwuni6WA
         ah7aV33VC/ev5NHrGnoqW+yxwRjSKfnQPKd+mryXQZxRtiZbGrC7AYCCwCyYXuEUBL4i
         ijHEVI4xmeoSWuRlLGGevR+n9IQRDi9/+AOAZOZyPVVhBOiac0TK3dGn+YEF81+G4zKL
         +dWvI4/SPRmm1nU15LF3SgibtN+stU1T5K9f3PlovbvemGyTELRXRyMoeOHWIS8GIVy7
         sX4A5k5EarQHp36OzZtiTPNaPxQ3uNbHmspv8omjC1lcntabZU00TZuY0J1C8mhc/AtN
         Y/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196696; x=1779801496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zTfz7NVKSYasiaQ+Qj6RScTytUGsa7bdJ2iYVLGLoTA=;
        b=Xm+8yhDyTi1FY1i7leiYc/LQMPE59WopaVvlRuYqqJr0gJnOyLzYRQ1I6UV2NP9sHy
         30tD1wMkcdpNyuh6QKphXY7FuEV7d6SVWXWBm3jBJcAsGuGUIPYqtvqN4c++Uw7Z762+
         mSnU1d4QaBm9C6wPogbbTY3yjU1YCq2gYe58uiarLfpkQnLS8Fq5mui+41TU0qduNmqm
         uVrQcOq+Op/OyI0hugmJJi5VgIminRl99riJxVgOUCdlfgNRbcJYPBuVz4zjtfhmB4wf
         ZJUFtjGD1kiv7Ml+B7OdG2HRY9WyDHg8131UnHvLvUOntAERcV/2lNLSFH2LQcVvwNTd
         KfMA==
X-Forwarded-Encrypted: i=1; AFNElJ90Blmb0ERhg6xWI82iD/ZVTfleZ7oF+bI9aKJ7zaogCr7rLQZ6iadR0fxZ15MiJvyVjft0m51gvcoKD2fM@vger.kernel.org
X-Gm-Message-State: AOJu0YwLHGulCjm9aKMltSnjesSuHFD4JXb3Cw2IEjI3iX4uWFda7Cm4
	1UU3WVvnq2Yj63XIQHD2YarGPJTcL47TqdHcWA87RciGVjNea8/3CosJqP3ZCXgyPcuGxCm3pMo
	83h66R3/lLaAJOjlGxpLtMMMZmPYmzIR7YglgxEeK7vpxzVVg1FFQQuF5muxAPfTitiO/
X-Gm-Gg: Acq92OGH+bd1e/Ae3JaXp3H9CAHjaMmlXaIPkG0Q3myjwuiZrykLAqGdN9vrKGMNmi2
	XxZuBjv3PLrFgF02jhARPtGfNiySoOqfHWhcEpY/yPBH/Mzyjf7wdnk+wLZgjxPBiP2TmkHMpsM
	npk5ZGE2uaNLYyr+0ylcFYGsZAoswmIP0+ClPDc2+bS/QBXMHLNTQVRE3sQsY1DtLe8tlxc5wLW
	LC0X6dmRCXtIQ31mEug5hx83NRS77g1S8dbb/H9ATQ0alCTSZ05CUIPUoD8dM8uISTN8Q5UFnny
	iKT3iL9msrtxJdCMdXgJxHskaT+JpLcB26DXZRtoRgPL1GAmd9DVHGWPlsxfivtnH5RuIRpAofg
	HTkPKKFb2XOt0mCs0mD93v5Smu/aW2gXZc2/7xbz8zj4w60qZVJo=
X-Received: by 2002:a05:6122:8605:b0:56c:f222:7d7e with SMTP id 71dfb90a1353d-575f589f027mr7985238e0c.10.1779196695749;
        Tue, 19 May 2026 06:18:15 -0700 (PDT)
X-Received: by 2002:a05:6122:8605:b0:56c:f222:7d7e with SMTP id 71dfb90a1353d-575f589f027mr7985186e0c.10.1779196694979;
        Tue, 19 May 2026 06:18:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:45 +0200
Subject: [PATCH v17 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-3-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3UZYwiIbKBd4buCQOF+dimTZzhwjtTmU9xpQcGXwfFw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMD04sAXfDjG9QFVOGes3j+ovzfhoeqdRGcx
 UauntlsFLOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjAwAKCRAFnS7L/zaE
 w2xRD/wMKEqcgRKYtiGqHi0TwR4lCcBVEVXesiV3XMpRVecp/HQ+esqoGRTmsBO2szp09SEH+oS
 L8gH+fnLzfaCxYPG6LHorwjF720COOI/9ZrU3CBZtFKFgS8aIY9W+q7FZrb9w5+5SI2d57QiUR5
 fk/FEURVEokd622IRC9s1Rla6iuRcnYEV9uU6VdNmlpa/sfffP6bURg/yuXaRZe2s8eBDdeFZo0
 vTUZb81UDvgrOTXG/lrA0oe6n0IQ1zt4Pvotn685SDfZtto7k/MZwNjD3A8He0HgYFD9cmfozj8
 kIObvyKylzIzoQGGlRHcrFhU/1nRHFHAmyLFpA3CvwGtC5y6hTBZSyVnBbXz3Dp3+2DcX3iEE+s
 /x3U8bkKcfNSdlBu8lb8BwvLRlsaosSFAEy/R2jNmyLxzqRCbcHuhwAZZ4DvJyhfccmhZiYjuKs
 mx1w0r+QBu3FjUIMIH1Lcp/AE8D7sffW+Rpj8qZPVwpAtGVh/fhCxdJ88gNoAfbkVxp3xfR/UEA
 44ibbPPhPpVMhO3d1+MVO6gDprIQfRPV4ot/LHp5MV2c57PGZuuv+CcBX36Acnln8j+d4LmLzV7
 FIURrKdwRMS7ZtnCl6/CQwbkviXmw/v3uUcN1uoyrEtx5VNMI94w4sCQ0CFyGq2A4qXNv0g67/I
 LW+Je6Ufzre8z9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX37GOy7Q2GpDx
 venvgzoB+qGm1ui5lTkaIsUM26wGXxIrlusx7u7I00OWu3ARVd0ynGh/3m6mmx/gK7BczPyGC//
 Z4jq7RmTMr/MyBi3Kk61Fw+32MfdKhQ4BYd6PUwXSneOdsxhrnDFHpn4juOQowHC6iAnnqMuyYy
 rfIkf2uuZLGr6cx1uDnVSqfooiEXY9YzhK2kHMpEu18T+vTNCBIwv7MTbR0GtAYaXX93H6jR+MF
 8/GpabsyMFnPAE6zlzuwvnqNVfi+Uxk1XEaX4YycUPwgguT1KRH9E5qsJ4g7pWR1F66SzGr2b/L
 b2r4o8OQQD5bWvv24nB5rZWrA8+aZUhC5+EuofisT+bxUFbt3PnvHdWCuffePmgyxgwNiwGUYll
 uQQ7DXgSNS3WnZny7HZ/qScTAWo2Nw9cm7CcMRlGU7i1oTKtlHgitFVQpFVmrvlZvXJRCzJHvfO
 U2Bb0yi3ZcRY4zAsdng==
X-Proofpoint-GUID: Yd9CgcGj23ESO0HDooa2e9wt0FK1wnaH
X-Authority-Analysis: v=2.4 cv=Q6/iJY2a c=1 sm=1 tr=0 ts=6a0c6318 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Yd9CgcGj23ESO0HDooa2e9wt0FK1wnaH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108517-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,linaro.org:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5949357F6F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index cea44833201d641ce6a657840d354abb443501b5..e2f16efcdb55f7465950fb81e22acb451e63ba0c 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -397,8 +398,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -863,7 +864,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -893,9 +894,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1091,14 +1092,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1111,14 +1112,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1286,14 +1286,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1359,8 +1359,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1394,7 +1394,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3


