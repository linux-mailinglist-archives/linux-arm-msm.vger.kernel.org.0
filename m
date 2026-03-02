Return-Path: <linux-arm-msm+bounces-94997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GgnD/K3pWkiFQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:16:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A41A1DC8C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 17:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 321F7304F1BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 16:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C079B42F562;
	Mon,  2 Mar 2026 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ii+o15pJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKnRMiiW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225C642EEAB
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772467084; cv=none; b=pH+OQLk1TT1b345Pq6cTrzIXy4KBjJf7G+Riuv0keZkXLDV/XlLr34SOKE1tPLwKMed0znIJeZ6lSLqvWq93MwfAKB8TD6qVKWCDoZmXxoxgAn5PF+oXXLPiS8KHwX+xPUaQvs+w0cDyODQhSw7Yyvp2NxzbSBzPzn5yDo57Juc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772467084; c=relaxed/simple;
	bh=UUgEXylEiIfyENE0peCNzYmE4sxUi2nWK9Ajpi5BrrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=klnZZFNZjkg81V6QN8HxUEXl2MNO16VNVk8k6boKAJ/IsUY/vCasychQcP0iQLCyTajUwcjXaPannbSXa3Ww55HyXHlIGtWWmNNL7EU8vTkNcg9C/gLxI7SDz27sa1zg20o/+Jej/NLEUHpzuxFP0kw6F6IWRw5IxzlbYBq+aEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ii+o15pJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKnRMiiW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229JrTl3742605
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 15:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UPKupKC1xgRq8szLkSXUnMuGW4ZDJHNFE164RxCwkP4=; b=ii+o15pJA0ObdYt3
	nGfXs1wAil3n4EBCqhUko6dV5l0WXWS9DsGA+IP3l7zkNx9RRI4+6J5OH2RzJV6i
	qQYP5hNh0i3xWwtSnUwHV5uO4K3igZc30yF1/JKM8P4jJrlZVgUBwfFJ5J8Z+jOG
	TlX1Ao3gc/YS5XnSKhcDon5svWi1KeUpUKCMYhznFYgBjm6RS3FnkSqfuDd1CFpt
	nCfjNHDwx80Kj4qul4aSPTkB0Xe3vron3l7GiaBppDPBzOJF37qLuQMgS9ffsWZT
	pPnm2JXAu29qSr8ftw1n8jGyHwjyps58l7jUQI32hTxQaxLFxCHCw+KZTz9e/9RK
	HQQLrg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trhbcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 15:58:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb6291d95aso5124622985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467080; x=1773071880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPKupKC1xgRq8szLkSXUnMuGW4ZDJHNFE164RxCwkP4=;
        b=SKnRMiiWsxCWEcfJ50/MVtCJjc32xgPLJ/o5zqSxInOP85giWoSBkkHcm0tVKh/s9u
         sC4+ZgeuhRyhadZOvCXg24LuwpfQR04FC0I9ezMs19KZI/6q7Az4n3lNgrP/sU8KEAOi
         wVRNn85lxKAWeCKQJ7rcUvyAkbet6YOIyvWKFi61j+DRnCSceYosRN9vh50VqL8VAzyU
         shezr4GcaqjKtFveiDfZFP7IZltODvvFtL3JDCEap7Izk4RMQdTwLiBE2TCNSJVkpwhp
         4ikZ0tSo/70/rXUzHv+CEEg1oiLKdC6zvmz+Ca43FnPKlHvfUyGUSAYolCW9pAPSeIN9
         KFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467080; x=1773071880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UPKupKC1xgRq8szLkSXUnMuGW4ZDJHNFE164RxCwkP4=;
        b=kyx1R/BcYOFcNfyAM4RSAE5ePJhpxC/4u2LX19gOHFgUW6r8gO515uyezU4PvZYLXv
         4o88xQVQUzzhm8CGm9CC3z98smhOzf++qGsd6/4mXBIm3X5yvHjmNp12xjLlNhOU77aQ
         R75pXnLYq8e4ireSyt4Jg9SSJhHGvRZWMc/DA9gFLwCsfMts16bsLEbUuyXaJ94YfY8Q
         PuL3IRw7JPcjNiOWFdtNYPKi6ZvvNZjFTgRHtDR7YRGS74n/opLaPrR5JNmriHh1NDNH
         +hOuGLW2PDU2gn53bRuOlEQS/rkk7L5tuuQuzJODDRnBC/yggmmXrnT1olTVqGvhgfg3
         1vSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyY1Wq5xZMxtF34CX6S/DwZ9kx9DswvRhh5eUJrvBYn330PvLagd0H9/oxof3jTSYUlqkHO8HweaTAKPG2@vger.kernel.org
X-Gm-Message-State: AOJu0YyiS5PM7rr8hSMVK0mR1HqiNi0NI+ocmYE/UESpBSZv+0CN21sD
	WvGmcaTxd2mQsSz/Uny2sfv2i6ggkL4jb2rOumqIr/bhJwfV9Q/5Yh/RxdcbE7zl+BvlY+FFw7o
	TqkcXHS3SEW4hFR/ynme7cOVtfPkVUL5eEal+0cGmVORxcPFbrXziOF6jKaESMTmKd9L8
X-Gm-Gg: ATEYQzz9nLA7eVTfTtQ6Vbak+v1gAc7xfOKyIdRTq5UQfBImAr/lUhMUZT99Kc2FDzr
	JyCz3vufWjAUlsuHsd0NrH97yw+qDN5/rvMZySCGomNIg5zAZzwC88+V8n5ec0pO/FRAknX3KWx
	7rhul+rRlbZkmMgblMXDPT+GnO4kbHsnMTarXLOm1PK+meRZ5aoWOJAoSPD5sAOYd8HFNRZYel9
	ThABEvFs4Iz4bnr5tRCFmZNkueonzGB/t2iR8EC9IUBOjrBQjc6ZYBuCmE+cHVx52Bx9fcdFcxr
	ilITCi5xUitERNNz+2L4gOx1+xCZNWieSis1Y0Hcbaog/QmYQ4VTTPuaJW1A3Fjs/r6VIvOcaP8
	csr3yRaKRJJgKZbxDCD0W3sGUdmPENeoXe7LqZuVTBJ+SwgcjuMYf
X-Received: by 2002:a05:620a:7118:b0:8cb:4059:a90d with SMTP id af79cd13be357-8cbc8e50bf3mr1568262385a.38.1772467080446;
        Mon, 02 Mar 2026 07:58:00 -0800 (PST)
X-Received: by 2002:a05:620a:7118:b0:8cb:4059:a90d with SMTP id af79cd13be357-8cbc8e50bf3mr1568258085a.38.1772467079863;
        Mon, 02 Mar 2026 07:57:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:25 +0100
Subject: [PATCH RFC v11 12/12] dmaengine: qcom: bam_dma: add support for
 BAM locking
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-12-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4900;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UUgEXylEiIfyENE0peCNzYmE4sxUi2nWK9Ajpi5BrrE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNuYzNnk2eJGRt4JyOLFUae7n6EGdPMeWxfu
 miC6fIYmfiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzbgAKCRAFnS7L/zaE
 w7F6D/0ah6PwxRWwRZZZ5QK1V24RCKtmj7bJS9c2b+P7QDdfyd9Axw1tX6IBQOeiU/H6d76yCCc
 FKwRTrSdvxnIMCjgyz+F9zyo98CqyeY729UpSZso4Aix+B3ur0stcv4j3I/Sjw5S2L7jXkUfFXd
 dDwOq52o2hvUnwp/Rs1xWulqb6yKgesa46m0fCw2PCA8PcKYckNMUiITaITT2Rz9Hvtr9PqAbf7
 oU1lOAi3+mCzJBcVQ/GJSyl3lSAmTeYeRv7JdoEJEnVedQ9LXTGJwmVvjBNt5QGOWov0YJT4mxI
 qWAXfRZ6/qbB7taKE0xR/pujgrZlThSqp2kiIIn58N8VdUFbPHVwU68FRP7gScBFenmwgmev7t3
 0YwNvoniDq3zLervKJu1fxgZcUkjN5RHdNhldom0bhU/KF+/OH1ubzRLLppW0Dx6djvopjCWSy7
 WxJZL9fkwwucP7wBiJfZju3J3UvkjLVe2K8ebI1w0PVGGo0cnYq+vQkd/x+bR6LPkq9gwPKv0J+
 +qwk8haYIqtaArSVdx0Cj+j+t+qMwcb9yWvcxzD2DoVlgA7G6LaSBJF3fWpHh2ZPETwmPW+udNF
 MfvjZ4/g57Z3zSwVWsn9D0xGM8YHTmTSP4nZQlfFdXF0qGcET+J+dzK/onXhMMod+UneCCi3R6y
 E+lmkkjCDmtGdcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX63nNdZouitMi
 z8NVFWiXGykOosLVYY20dGhXFaPzffZqzJT3Ttapa8yeNh1l/E9uT2CKzphCAvCtJg23mTDs3SH
 OGtIOXhe6SqoUEqKYDXuCYOGb5Tblik6wBg9ZrMcDHfipIh+SNawBS2q+6euqI/eFuWYu3sRHIT
 LeV/1NADmaGT5aQVooCoOaRp0rnHGzvJh7vTipSOQ2jf/uQSYYmQd1UmJLW6ynpm563NoItbjE7
 hQ3V00CBS8pBNP84ZKhZjLVHDh0WcMjQscJh4ef+4SCs/1309P/ySGJe67UVsrzd/f1UHk8y+dx
 ovjPhdi/0B/p5dyqCC4xEFJDJHoWl78R+UaKZGFVnSvF71EVUAnPhbWomLXV8DOvm2+asRGv40u
 UjpEfy8AvA0fJAC47D95uqIMbkKIIwTahlvcnBBuKY0jn8Rn4khRxMxfjBnkIG1CFYCpEZ/Hgb9
 nrnNH+34XcT080Zku5A==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a5b389 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=KZCnMsYHACgmd2lUPBsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: RpRcM710E02jfZx2qjolvqlxLS67RhDM
X-Proofpoint-GUID: RpRcM710E02jfZx2qjolvqlxLS67RhDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133
X-Rspamd-Queue-Id: 3A41A1DC8C7
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
	TAGGED_FROM(0.00)[bounces-94997-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for BAM pipe locking. To that end: when starting the DMA on
an RX channel - wrap the already issued descriptors with additional
command descriptors performing dummy writes to the base register
supplied by the client via dmaengine_slave_config() (if any) alongside
the lock/unlock HW flags.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 100 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 83491e7c2f17d8c9d12a1a055baea7e3a0a75a53..b149cbe9613f0bdc8e26cae4f0cc6922997480d5 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,11 +28,13 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_dma.h>
@@ -60,6 +62,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -391,6 +395,12 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	struct scatterlist lock_sg;
+	struct scatterlist unlock_sg;
+	struct bam_cmd_element lock_ce;
+	struct bam_cmd_element unlock_ce;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -1012,14 +1022,92 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
+		   struct bam_cmd_element *ce, unsigned int flag)
+{
+	struct dma_chan *chan = &bchan->vc.chan;
+	struct bam_async_desc *async_desc;
+	struct bam_desc_hw *desc;
+	struct virt_dma_desc *vd;
+	struct virt_dma_chan *vc;
+	unsigned int mapped;
+	dma_cookie_t cookie;
+	int ret;
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return NULL;
+	}
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(ce, bchan->slave.dst_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(sg, ce, sizeof(*ce));
+
+	mapped = dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE, DMA_PREP_CMD);
+	if (!mapped) {
+		kfree(async_desc);
+		return NULL;
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = sg_dma_address(sg);
+	desc->size = sizeof(struct bam_cmd_element);
+
+	vc = &bchan->vc;
+	vd = &async_desc->vd;
+
+	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
+	vd->tx.flags = DMA_PREP_CMD;
+	vd->tx.desc_free = vchan_tx_desc_free;
+	vd->tx_result.result = DMA_TRANS_NOERROR;
+	vd->tx_result.residue = 0;
+
+	cookie = dma_cookie_assign(&vd->tx);
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return NULL;
+
+	return async_desc;
+}
+
+static int bam_setup_pipe_lock(struct bam_chan *bchan)
+{
+	struct bam_async_desc *lock_desc, *unlock_desc;
+
+	lock_desc = bam_make_lock_desc(bchan, &bchan->lock_sg,
+				       &bchan->lock_ce, DESC_FLAG_LOCK);
+	if (!lock_desc)
+		return -ENOMEM;
+
+	unlock_desc = bam_make_lock_desc(bchan, &bchan->unlock_sg,
+					 &bchan->unlock_ce, DESC_FLAG_UNLOCK);
+	if (!unlock_desc) {
+		kfree(lock_desc);
+		return -ENOMEM;
+	}
+
+	list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
+	list_add_tail(&unlock_desc->vd.node, &bchan->vc.desc_issued);
+
+	return 0;
+}
+
 /**
  * bam_start_dma - start next transaction
  * @bchan: bam dma channel
  */
 static void bam_start_dma(struct bam_chan *bchan)
 {
-	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
+	struct virt_dma_desc *vd;
 	struct bam_device *bdev = bchan->bdev;
+	const struct bam_device_data *bdata = bdev->dev_data;
 	struct bam_async_desc *async_desc = NULL;
 	struct bam_desc_hw *desc;
 	struct bam_desc_hw *fifo = PTR_ALIGN(bchan->fifo_virt,
@@ -1030,6 +1118,16 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	if (bdata->pipe_lock_supported && bchan->slave.dst_addr &&
+	    bchan->slave.direction == DMA_MEM_TO_DEV) {
+		ret = bam_setup_pipe_lock(bchan);
+		if (ret) {
+			dev_err(bdev->dev, "Failed to set up the BAM lock\n");
+			return;
+		}
+	}
+
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 

-- 
2.47.3


