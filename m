Return-Path: <linux-arm-msm+bounces-105860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JlnC/2e+Wmj+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:40:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 893874C81EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 09:40:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC2ED3017035
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 07:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBC23DDDD1;
	Tue,  5 May 2026 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FDJaX11b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ScpmJ4JX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D6E3D16E9
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966825; cv=none; b=tGIuVbI+TEY6EFPptJ/eRoL3VTqf65cYbntrNhepK/1oGLXB9BSgkIDlmsanpuOvPQxGByFfJGAAl72HDKGXr4UmTaayq0RzXwUm2YJqoXqSXvHmqM/wrcxL4cL0JzQ/kMxxl5C5OWXMY2vUwlyCxYuk2zoYR5PEp/u56F4gZpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966825; c=relaxed/simple;
	bh=i7K9Z6L1blSo4FLwUqtu/dPp8zle1D63zPXhfonV+ss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nJ1wPJt0Sezd175tkeUhzPYHPlf6CEU9F1pAAmYJxIncai4UW0XNYtC7YiuUZXyBoqZBJEOF/J4FFtLQiJTTMqJSBfFrnIppOTn+ux0cEv+F///vYx/Uwo2V5R3teC8cqnP0QXNEQIoc1Rhxm++EARI9cbpyNZEah9uCM9rMep8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FDJaX11b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScpmJ4JX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456UINo3467670
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 07:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqPIJBKBW8nnQg6FOvU6D7ze4pCjVpw35+JGo/GcuTA=; b=FDJaX11bsQfPpGuM
	v7L8BpGBbCIHCUO0CxU4LGJ9zinwE1+NLShOL0S96CXgFVmGHgSDqeYQUVhM5hwx
	9ycM0mRpGKCZ049daJMPDAOWQittDI414JlS8EoDYAwYNQ8fADI4dOaONPqN5vPQ
	QI+wEhBNw7eaHD+c/hk6U5Sbq4XnWkQhPwUc+jOZj9gOfdQAwqGHmwSNKE3u5Q2h
	uO+kW7dxM1US3EY6MA/9JkcIXXf6mLw/a7vB9itwZUSrCO5mdmeteAN3bJYqw9zz
	lMnCpS9+PtGDzt1qjWK+PXXnnLgTjUuWjJfbeyG+vyDISRBkm3WgcKPAg6MkJIGn
	0UVCHQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjua43-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 07:40:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7c904d476so40320145ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 00:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777966823; x=1778571623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqPIJBKBW8nnQg6FOvU6D7ze4pCjVpw35+JGo/GcuTA=;
        b=ScpmJ4JXG+e9VHS79Dr/MLBCHx9VewNVuVqN7Nh5bByPbofc07IyiheSrYuL0/xA/h
         cS7Ns7VkZ86P8H7BjYUzS+8jrIrqi1kQ1k5Jk+8yBjfoTo9GeL2TTaWejNH5F0oima2v
         V2bdSRJQoORR4XQPIfJZgcTvj9+Rkfjq1Irahg9AWdwEwsnl9NoUtWNIOZPeDBVUhQZP
         HwEvLt0cC1CMkFINUZRZD1FT6OW3fLrAOdWGeYWSftAquyu5HPXhmEeReUR2VNM/hAlq
         N0MvtL862AxHmqPaxDvNdQue8h73mZh49hWI4zPgikofL7rWQATxt7UNzrG0F43r+gsf
         9LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966823; x=1778571623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TqPIJBKBW8nnQg6FOvU6D7ze4pCjVpw35+JGo/GcuTA=;
        b=YudZdQqNi1CVpV6C9stsim5hhM9dewAsjshjTOzwTUFup5mR6WV9oX0DQljDurW4Fp
         vqiZsktaLRzOc8PCrz0uXvCsFIo+F1Eh2JB04dUGQDQOuODZaxu2JswqaIgKkb3dCmWC
         0maEjE9asXsH9+XixjLFmaAxdSms6NkjdkhPaGPYPZ/J71uVekgiiqClhIQHc57vy/Vd
         ZLwZjG2JD0rsb9JH11Lj6NnCFzaX8E3v+jzqRP5J7nUPXzpg7hrpTiaYwbXr1VD2D58t
         ygjIfQVFpNi7h0KEodF7BVlAhh+BhulIahiCdrzfYnnln4voD7uiJk6lMZzuvDQ8dMCZ
         wEDw==
X-Forwarded-Encrypted: i=1; AFNElJ9jxA3Llj5+OZif8vqfALDAq9VpZQMzJz1JQ0uQPsmaW0t+q0Qy90cpKxHBiVtb+7ijd1tvXMWz5d3zjZ/O@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4yuDk5kNev2V+Bc8mB+LO/aztLJmIw9Zb+hLHa9Z2i/LBEfY3
	Lzi4QV2nmiJ6XVNh7i9T9XJf/CiaOJAidsC8Ct4KPYF7s+H2pWaKJiZwmIXL/HoJ/YpZA0wiHyd
	wZndaqWmG/zxXsuBSRy8gvbzEwxW9JedPNjM50SBNRL9HXA0QbDi63mUpnXD94dSJbIVx
X-Gm-Gg: AeBDiesZc8zlMwenKUxtD7/StOezXrKUVdreWovXk3LJBxyKJTpkA9QqyRCcWX/rOTz
	nbhoNjCkhsLSPfNzsbNpFtPsHDUFcl/EMwWW2NHx9UpzA+cUfKlYScqXA7CTaZj1Wg28m/t3MSl
	pnOLwM610IM5LTm3JRcPEDV42eb9zc7oUrFrGjUcPyiAIhxwZ4k5SmgDdEHL82pH3/REWcj65mT
	zY50NcYd91gDX4IwFGIPNEa34gJCtxuDg+ZUNKnky1mTXi2C1p4ak+H16NNY9pd3/eGXwj8mYuq
	UgwrTIfTyqBOviXT3S03aMmsaSEmiwXiwcmxziOS5EjqL0QWVBU7+qp11MIKYdNOJU2RoV+KQyb
	B0GsgsM6YzwPFglGlYexPyzjHFuduxYcVYc+p4dCUXhiW+js9qTYryLrMsQ==
X-Received: by 2002:a17:902:9897:b0:2b2:b117:1e1b with SMTP id d9443c01a7336-2b9f25bd9a9mr90911135ad.17.1777966822852;
        Tue, 05 May 2026 00:40:22 -0700 (PDT)
X-Received: by 2002:a17:902:9897:b0:2b2:b117:1e1b with SMTP id d9443c01a7336-2b9f25bd9a9mr90910805ad.17.1777966822333;
        Tue, 05 May 2026 00:40:22 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caaadb1esm132663405ad.20.2026.05.05.00.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:40:22 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 05 May 2026 13:10:03 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom-qce: Document the Glymur
 crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-glymur_crypto_enablement-v2-1-bf115aeb1459@oss.qualcomm.com>
References: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
In-Reply-To: <20260505-glymur_crypto_enablement-v2-0-bf115aeb1459@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777966811; l=802;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=i7K9Z6L1blSo4FLwUqtu/dPp8zle1D63zPXhfonV+ss=;
 b=zBaxGUh5pfPuhIRSAZnWq3SlzNJU2ziM6386cvXRVJd2V+JFXobNCfc4Y+eQQQQ5ZofCriZW3
 xt0pdqinOL/BJarOnv7tM1FBKJfk/0SUnp8rXfBOLuUzfpI6kHtGB2x
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: FRyZsRZSvaSzU7LTB7icIxv9rW_pTiUN
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f99ee7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Hz3RRZfyAQ8605JJPKgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3MCBTYWx0ZWRfX4gY2M+gtHYaH
 //tv2AxZ7P70zGPO3x/Icdc7R5/oYm0woIez/1qC25xVsxtKdHprgSXYFQCKn7M1X1a9Ti6+GJ2
 dn1FnGzLqyMKWNTDHFxHfdNl8OokHH1L+iWBYHPHQ5Vit+MKisuBdtRWmcaoPFY0gl9IfByYPgz
 JA/0ejDx0VCsDINLvoRp+ttTzp9llK+TuwY8T0iFtGY72+qU+W9QCsHAlccxEFb9TwzkQFUwHxe
 Zf1nfrbx9sad/a1HlRHWd0NzIhAy9RiuVW63i6ozjnWhIrszLdCGI5plezERqfd968GsIsu+ikB
 Cw3hr1CHDrWFLnHAcxD/pRo9BVko05yfXZcS1l9RIUMNDT19hg+MTlVLKzThtxR0zmvRgrwo+tr
 qr010jG2v5Sn5WVRWa4UiwoclCMlBY1RRtIq0sR3QRzqHRozHzkrGh1TQIfKV9wF6NZfZ17REmp
 g+ZFA6wCWGxIUF4I2uA==
X-Proofpoint-ORIG-GUID: FRyZsRZSvaSzU7LTB7icIxv9rW_pTiUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050070
X-Rspamd-Queue-Id: 893874C81EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105860-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,kernel.org,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Document the crypto engine on Glymur platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 79d5be2548bc..0b62271f8bfe 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -45,6 +45,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,glymur-qce
               - qcom,kaanapali-qce
               - qcom,qcs615-qce
               - qcom,qcs8300-qce

-- 
2.34.1


