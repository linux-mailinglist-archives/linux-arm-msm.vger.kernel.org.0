Return-Path: <linux-arm-msm+bounces-109328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBNhCSVgEGpAWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:54:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0215B596F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD595313C5B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F6D843DA3C;
	Fri, 22 May 2026 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="No6M8Rjp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcQQnvgx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DF543CEEE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457229; cv=none; b=jqlc6nq7OSsT6ZhoYFWrCEhrAUiV35i1HdS1BtBH8Vpqk10b/LYMdwXTDfYrl5QFFQ/shrpAd6FtnPi2aB2Vl90EX/bvAOqRnYzNS4wC54CvkjsOngmRh0pLVPPolb49QMZIKiOHttChTuxFIJHG18G+SIyX4vbGeozCDVWy4xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457229; c=relaxed/simple;
	bh=8kt/r9HrIy2XInrbgvfr96jusMTBkm3qidl31H1ffz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGJWOoCCetkt6hxgBiBu0DPzNXU2b06V2Kp3ISO5Zvk4mUNfv1BaZCYoK7bC9tjBv2NPxD+ZdqFsj/7hqF1x04W+DLhqYzb/sHHn3nlY0NG4wReUacmz58HDdtK5ocGyqE4hjx7qALX4cINiNFO7buyg279qomQSi8/ITIbmygA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=No6M8Rjp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcQQnvgx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBGvp31960034
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=; b=No6M8RjpytrH+Ej8
	nPxPuBMdxzhYY6j3kJxMz9Qs6FkM1YzdFcOha7sPXPST+aN9pMfAxzn4XjhhKYtv
	tCf5WeivKclkFUQBlZepbztZ0otTM9+ZGcTgGzS0EOPRfPgDva4cUg5o//zTunfV
	2CADJzvneru1kpFX2jINryf+HPy3PvlSFYuQdOaFS3M/lE5uel88UmBoYsH6xo1H
	H68qlK+MkmWqpUGqDaTsRxOZQmA9wFs5Kc6pZ7uomo/I/0nuIcqLXyBiV7tFFqBh
	sAIsmGFSnI9OJOb5n8FTdaG7dN9NyAlP2yWWHT8oAKRHjmzHRWHw55tT3tTxJNxs
	xarMEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxesqc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:40:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516cde13e8cso33102431cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457224; x=1780062024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=;
        b=JcQQnvgxEDKZHvGWljmrA60uVCdu6AWEPSqqeiqJ1nYCBv29UmcO5y2rlf8zu3R1C/
         7YqE5C2uPvJJFrzYdqwPvDFJaHkacclI4wTzN0TybPw9BNDrguV/FEfRLlJmemCm8SYw
         iCYFVOHVPYP3jpi+gJSMqN4u+CZUhOlzbJuKZ1zx0+Ou7CvN0o5qhPbPBaCzrK12vLad
         nBfKCNKFzDmMFVnofUc0E9VmzVxWe4PPWXdzUWzn2RT4sb0bMC6L0erPPsk16ll7DLMb
         i9sQIAbbAH+q6/ro9GWAHkRxSGMz2Fv2Jjg2oJY5BDIop4KZ7SOlH+Ix+lLOX0aqn5Zi
         VETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457224; x=1780062024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=;
        b=b2nLdZN7Zh8pszPm+BTBVkpvufBJe9BHSFeQLMjEcx7z8cvyzJPD069wnD/YYiasrk
         u121jJxRdp67J40vzTIi3cLqWREAx6U3GR88wvNRA0j9mq+QYSaxYfexHb/33rMAX49r
         vQq9hrOlLsBSMtnhJSpTOQoTpiiRnOYpWGT0LPIBlupP0jYg8hIKJ/Ig4AXQaq97XOwT
         tuu6szoNc7wChY45DggyKBdxOCEqm4dsTVrWEX1ta7iQiwfkOQDnt68oMEfrSJK9M1HN
         v7aJa0vBvKvGurgWvseeKvPaaX8q6LdPl40L82gpcXQVmJOb3yRtiw3KWrXcOR1pEFr+
         PR6A==
X-Forwarded-Encrypted: i=1; AFNElJ/yy8I3vUZ8wyUB1rmquPzTro2tcZHX0UpMigu8TllekYS/cfUK6TZKehZWF6Ou/NgcKGDCtwDR/jTJ6II6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0OaFGfrDQMfiD2rO1qzRNHz59vixHoqYeiW0kMCL8meSJej1u
	pZ9L9WspahCSZv7FOjHaJqRwkk9mOUve6TYTHIhzS4WgMNf5WP0negmUJZu/ZqAPc7nQu11WIDN
	oVzCJwuVPnsIdi1K3hgfPuEjqP7Y+fsNax7EDitRPNMYU8rD+kfMzZ4BOf2nN3iWkwlyx
X-Gm-Gg: Acq92OFpnG8wzXgaiy/JMRo+HM5TensLjl/Hj8TAEPd4RHCtVhAZh7uCFs/zcXh3p7y
	mt/IxNhErKaLgMrH+f7VDA2z+FTgRCCkZMZdoMDbHqNA0aOYjdOscljIoBYEkeGrqSQlPNN1DKt
	O3/5BzzL/YFr8NlKA4x9O4f2DdHp/Rp5LRFmwrLM82h/TKBU6FMrkAO3CegpAmYcQZ5DhkMNlGs
	d3prU+AzCd39rIRC/xGWx6nuAh+XT8IKKWj7LqjPbOb+INazl8ItRt9KX3/t5LmhsAqQH7dE//K
	yq6jEYSvCRxFWp4yavGUUXsKjBXgbG2+bdcOmVc2OQrafd3npMS9JRHWKRGxSOgqFELDkZJxnhu
	WjdI6I8ryX7Ido9oBbsvXpVX7MwoFDV0vyQ5UecCslTHDhfforg==
X-Received: by 2002:ac8:59c8:0:b0:516:d1c9:8c63 with SMTP id d75a77b69052e-516d419a58dmr55277421cf.0.1779457224520;
        Fri, 22 May 2026 06:40:24 -0700 (PDT)
X-Received: by 2002:ac8:59c8:0:b0:516:d1c9:8c63 with SMTP id d75a77b69052e-516d419a58dmr55276951cf.0.1779457224043;
        Fri, 22 May 2026 06:40:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:39:56 +0200
Subject: [PATCH v18 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-3-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
 bh=8kt/r9HrIy2XInrbgvfr96jusMTBkm3qidl31H1ffz8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy0QgoalJd4nsv+KyNxeRwnVz7T7emmA0iAn
 w+bq7A/yZqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBctAAKCRAFnS7L/zaE
 w8mtEACcAKWhiKNBPOKaDaJWsMVeL5dSBaURqzzIgwKoPMxvuoftrlvuBf9efXzi/pqWbtaH27k
 zaZ2VYgftBIn3qooLBaL0NYAUIEL0rkJBjRJo8M+OrFTJMRa/zt4/8EMlssPdQ42Z6O9IuYvqXB
 ltpqe+k1ySWpH8rH/jqUymODykLOR+Vh42x0oxLXw0eKowTJCVaLgza1j1In+LZE1gisl3EuPeF
 kX0WWm99riJ5ldQGaKd7GF+DKVF15LNhbVMhQU/wJdzkajj28R7ZppWrDj9HE6UJRUUs1MiFJPG
 uHVZDNMB/GaQ4W0ZGae1S2Lv36kurmV0NGASA1lzZmw3/n9xnNywj/Xc7WqYQ0aAyyuBbIWFG8m
 z4A/vK2REBIoVkpStuaxEV0fV0omG+8va5zkFTPuOaZT/Q/g9SEs4Bo/atbQE6YvngQJx8P+0QY
 Mg7WaYS0gSIHxj7rlXGXWNG8mgA2w/taXG4P/bRXYcDXeWIgTurtwBY6UIq4Tb/YeRn7xxHqvCV
 v9ZBIadNbVG0A2yw+TTYB82HBOPlZKQOnDjG+g6Y76jg0l9df0lzUuDyLLoq2eBHz9+Z+KsKxcl
 B9+cO0gPpUZSV7V7fz83npdvNUp0ZCQo8BrNQiu3DMAhWI8ssB2KQ+SO/69U2QVphTM6bIGp3Ia
 ArAwsHajuC1N1YQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfXxBT2nVH1IcHL
 GygQFceA9diT0C7dcRxhjuDjgr901Lhr2m91Wkq/9WGfgMIIEUcNpXAD5zr1QNsx0RGdOhysY9G
 c2felRL/CehSR6HjB0mqguY+0zr8qBfRTr9OQqg+9DPCx2QAnG30jSh9HCkDQFTyLkv4MgriKGK
 UqZSBmRA9pY9tkepePPer5I0iP6UVNDvNBSviEvPCvlwUDc4X2mRIiPab5g/jxw6UhYBKggRUNe
 Y/1EBSKiNMBurradT91sxZC0gmA9O0pmY9l+iKSy0k2D2adM4ACN0QbaaLfTnn+Wv97SfEcwBG5
 eAX9q9vEdZHFyaT0lJAw2qVSYhE/Guw9sdjxEMVBcpt0n4dcTGD5Syg1/PiE3De4XYF1ObESSPd
 bvW4X5LtYiFd/cxRnOx9B2KqCZKZsH+3tkeDCtCIzS9ONwLePMdajXFNQCiUumS5Nr1arq2aVV1
 w/woicoqt+s+3P71AMg==
X-Proofpoint-GUID: vjd08BJzIydOVYMLrzMG7TrXTgtOYk_5
X-Proofpoint-ORIG-GUID: vjd08BJzIydOVYMLrzMG7TrXTgtOYk_5
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a105cc9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,qualcomm.com:server fail,linaro.org:server fail,sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-109328-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D0215B596F
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
index b3d36ea79984385fe0d05ce56042d3e6e3030c5a..1c62f845ac0b956e311857b93f5b504086662f45 100644
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


