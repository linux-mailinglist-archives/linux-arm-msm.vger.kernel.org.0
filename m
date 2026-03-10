Return-Path: <linux-arm-msm+bounces-96731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNrtAI1DsGlLhgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:15:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B74F2546A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:15:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AA6B325994F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA283AD52F;
	Tue, 10 Mar 2026 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5XgHHmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcOsZ514"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7CB3A16BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773157509; cv=none; b=YdB3C3FRDdmPfMcEeeUmE+ANvbjJc+BlBTLJeXx0YeXHVrvpt9IEpJh3+x0m6b+GywVvh7FMCGmQaAqmTK40uoeqcprII2G9M7BMfqUQmPdFdsBUwjJ/Cyqk3yIHB5eWLmp5+Ya6/6rXnnvrM3QwJccq8aD6P2DoKLjxKQ0OSzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773157509; c=relaxed/simple;
	bh=FnVBtOe0OnnBy34d5WsqwWSUvkeiYQ93/vJc1qwp/2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nnyYpiOIRenUzjBlQGpT3c2gnr5mMG2Ym1PJHwNOarH/5bdA+u1hjkIVSL5HqfIWWFox7IUydPz38A04nvX5zpiXKHd4w9my72g4dPkAaW2JFNtd4ppqyUfxI/1F0oscf19Zesc2tWRbw9fKGTvpgbEImAnbaIepLOtqAVJTcAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5XgHHmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcOsZ514; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaonP3760444
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=H5XgHHmX9Ide9a2L
	ssC4kHTnxvjQNiQzfqnkAgCp2muei/otaz+Cs2RrEpXCYgYpUOVRgdnyyaB+wL5R
	0fc99fheFD3lpSPX6v1iZ5eZlE5LmAk4KEmFX1iaGYB6YPPA3Eq0thlA4NUP85q4
	TURH2rZpxVKWH1VLS5FX9i68HspSf/fArOU0XEv6QitqEizHLwo36VCN15+CVHOd
	9o+pic4GKqYY+LTU6RUQfhY99Cwofu5Q3DDEmpqCLMKoteLm8aZha3OTwyXlD1lt
	MTMH3VbvgC+OIvCuRx20dVJ6tu2iO9JjOh6eJUTF/+iEFP+QDK+Vz5F/PVWH96bs
	bfCxGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ugsh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 15:45:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7c4ab845so1273955585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157505; x=1773762305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=hcOsZ514VGRNd/N3E7ZWgTJNVY8RKhCfk614Z+mbEYiNFxmhaJbwSQMJ8QHmgtiQj+
         1HA7eaFcuYaYQDvQzCGOX2/FwKKT/ls71lI/a2+23+34RZqpvqbikloNCAbVoCoHmfjp
         0LjdwVH8KP/+TR5KT2ifh4YAle41S6zDAfvaK3k+VR6Pio+LFhKtHHfYLWvIdI2bRQW/
         i6LRDISiedtjN9Va1BJSxuWQqAqfOeqW2SSnKJdLTsbp+uHlwJptvlzReq1UZ5X/eOE9
         Fy4rvNaRRnehBK0BwQvEbEHk6N/VivyFW93QRVS6A/+k65M2pJg5HBFDh1zFoUfgYvkI
         dRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157505; x=1773762305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=SdKFrioIB6Vl5H9MQTAU4yAjBOrOMdCp5Rt6auGVWhRNki4bPEPunsxqLkb0UG/rB+
         oVIXBZnUmf07iRcSimdJLEody8rtRmFwLnNPUlX221TuoIKEC2ydKQFKSUSuvgS9WwW+
         9v0bFlvDTH4IcaQYPpwXHn+CKsTChH00P7gjDwFC7/aXrKgNUiELRQzy5QXyLkB5iYLr
         Z5GrBrAgavBpJeSzC7wInsRoRPrr99Fiwc+nXKFNsLWDQVyV72/tIsj2RD/bLJUmclVa
         Z5X7e1geIW96Z5tEEW3wv4rU4kzAietBIukJTmLPWmffMmdokpyMCzRs1PX+VjKjuHij
         hrAA==
X-Forwarded-Encrypted: i=1; AJvYcCWUWVaTDL0xcC4zB7R0Gu5OaT68jL+vfcsoi3R2MTkqzP0V7BewS/HqKeeWoWGloza0HEiyTJ6dVei0JrtP@vger.kernel.org
X-Gm-Message-State: AOJu0YyP5v680uhY6jNz34jrLkmc0ifmwWUo2Z/eDdEerU1Ne8ZsWeYm
	HPFO/gytVPkGMV0Dikw43IGPrUDxw+4tkftEBZCR2I4NNSZ1MOFwjzUOUMjxkOrMOCIgF/azGkP
	2XVdFwr0aSTFCmRRO5x1c6nzIadMnTn40JELrbph6VcoZsZp6jkLH9jR69XR+MGIndVi6
X-Gm-Gg: ATEYQzzEr/eMfPyGDdv3Dal4b7hpPXSgEU/KU5QALP7IHByywBwjlp2EqfGPXSl0ns8
	cMcQLZk6h2jqQfSmeh1EbCha0E0WgtjTXQQAMo68HxU9tPBHT9sYrWtr9K/Op9YJ9AHoVS6+9Eo
	CAuMNUiu+PLqP/ltpw3deBX+iBZfYkiK09Ll95lyZx51/Dv/daeurOuzpeIhKish2T8kDxRGTyX
	uMUxaLNlWzdzNw3QFF6XPl+VmerbL1uMYUbZ1qlRrKrBVOFnsHr11K6SLcz1OOajwKOy7Bv/RDU
	A5cKa91lJX0Qth5GRkeYk6lIm5t7Y3HIFbhTokkB3RmnJpLcRG9Hh6oRcf0uJNgiYpYZZcxYdDO
	ioZNYhBtV60w6GwQ4vThBacIXG1/fw1B7IiEt/9r8Pw+4tFEgB+l8
X-Received: by 2002:a05:620a:4713:b0:8cb:4fe7:4c8b with SMTP id af79cd13be357-8cd6d46a65fmr1741700485a.62.1773157505035;
        Tue, 10 Mar 2026 08:45:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4713:b0:8cb:4fe7:4c8b with SMTP id af79cd13be357-8cd6d46a65fmr1741694185a.62.1773157504474;
        Tue, 10 Mar 2026 08:45:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:45:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:24 +0100
Subject: [PATCH v12 10/12] crypto: qce - Map crypto memory for DMA
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-10-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxpruHRIFXTdAiT1NdYBgIWl9dwNSWxbmDhY
 MFpLWTuOaWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8aQAKCRAFnS7L/zaE
 w8zjEACU75BhOGlQUrmhew1Echsz07OmDT9fQ5Jvtf3m5VFeQIPOwMPvhOktHYTiLlqBJ29Y3i+
 d+mZGPPm2Ujrp5UEcdENXELjaWDu89uA3/2CtY1Si7b30em9oF2DHt+knNGWYfrFWQfmrOcq0Ds
 jzm9v/o079w4/LCQyV8cp6sMbIKaNpu1IIX6qmC3k2kg88q54U1epWJgpHBNimAOCU7ynoqTMHx
 qtS8ME3YGIHsSrMGbBA2YvSPjTcdbvt6lEUIkyz+SpqrMV3j9nI+F5y+1096/pz8aa3P/DfG7yf
 grBswCRkiIR9WwlU7VtgVT8s4Q++Mnqrg7Nbyif5XF7G8UR03c7uCyahOVUpWYya7osRWNMUhV0
 P2z5O9PEnhDXNSP2GotH2dGEKUN+wraGq5lyXmfiFcjTWccCO06/cjwPz0rKVJQyfhyoisbeqQl
 n5gtxGi/GiLXcRddAgj13RuOXPeZJ+glN7vHS7frASzagP//9y50PFu3AB7AreCuUmukCGWV6yG
 VYWeF1TXvZhVbdClbjDaE4+gyTsceihbUIYyvQ8UBPR7qaIExxsGOIbRqMZ+hPtwRfURHJkJsJb
 XsX/w1VP5qhFOzDoSlUfvaYOTZ+rzENnotBpvim4XuirlMBL0dCxPUXYYCRaLOmJrlXzuY3asBh
 G3844dVFNV3QL9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: xraJa5ABujwK4FT6VnSKpDd40kmyrcqN
X-Proofpoint-GUID: xraJa5ABujwK4FT6VnSKpDd40kmyrcqN
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b03c82 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX8Ap47crXqAQ6
 tN/0mxehLpOgSY4Gj4QUvZiB1P+GfT+T4eZ3wFK29CVFBJf5d+c8iELc3WpQEssGwUBTPuPPtJc
 5eyP1A43GyNidIRvhKXZzxkBfN86ZVsLtqMYPqkeoTN7OZAnszB5R7opxVnPFKqWqvwEw84hheV
 CximuQmCU2GcxRvQfiXccxepJZfiDOZdDlaR+FLmecXbHMiBu5Tmo+BiyyRR/gMI3RN1JmCJEEG
 7RGEE+egtKvkLRXPY2bdTpby0mEUcSr78JZiFB+DBdcXfGJbSwkHIGfNfI5vyYpcaA+534LoMrB
 edIs3ASdOyHE/T7l6aX86lEpzDp42MH9NmZu26gGM4ap6tdUqHcr2XKhPjoXFqNUvy1C6dekiF7
 YP3j+035BzNP1tBOz5UjmOZZN1ONz94p9tu8Ahvy5TX+6i/meDC8gJ4mkcvWmAS5dt2Vaiu6YJ6
 VDuvipNLHq2VwQx2tNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100137
X-Rspamd-Queue-Id: 6B74F2546A8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96731-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 25 +++++++++++++++++++++++--
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8b7bcd0c420c45caf8b29e5455e0f384fd5c5616..2667fcd67fee826a44080da8f88a3e2abbb9b2cf 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,10 +185,19 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -198,7 +207,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -244,7 +253,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3


