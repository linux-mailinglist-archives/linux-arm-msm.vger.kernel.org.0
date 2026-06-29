Return-Path: <linux-arm-msm+bounces-114957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4i7ADUZEQmq93AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:09:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1806D8B5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:09:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XztrSDxP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CAxVRPe0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114957-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114957-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B47AE302D1A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD843FBB67;
	Mon, 29 Jun 2026 10:01:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188883FD96F
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727316; cv=none; b=eeSXz3nAVKCDatRWbESCw2Ln15KN6VDgAXrlDToE0ykwBx47mY4g8YU9vj+5kQnWJH2pYt5JBugaDrmCEryhUq0ZcBJUHjqFijb5Yoo8uUhmtJ4lYZnaZARISBQ1APbVcCvt9NdKAi2yfUjPlEDjE8bhocIHhNrzwYV+GU1imtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727316; c=relaxed/simple;
	bh=3yBeQNw3jzjlpjDFEUCe3Cu5wMqOMdw6j0aFa7VZxZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FyLomryj0wLJH4ImTH3CUYMFydIph5PeIhDg+g7qnGTn411IwtJtZT+QnsjyxOFbl8fnQMWRRhxl5Y95uohjO55SdfZXpVInc3OkDuOmwe329SceWmkZE7fbfbwCRBDvNevC5W2SgwOZPfqXRkKoveZToCRTIq6Nt2TKZFVRMrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XztrSDxP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAxVRPe0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Dqno2188727
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=; b=XztrSDxPyclJi8we
	vRgiAtBVobJ+eerpJLvNwf1p5kAvzavzKHffis4m6GRbnKiQGjFqk6YU8xmRK/Dj
	ISq0927/c5LdfTKIPXZeAitwPTBLPQeDEk0JKwIUpe3kNvOgCnIu5XLxDOfk83a+
	xrkcZGbgYeuzdlN/jwonLtciBCisKFYel0LRQZEl7BlMb41ruYa8wzRyR6I8mqYW
	3vNCJ705lfoT+KAOuujn4x8RJBcz3bgCXdIB4fg1wRG+f8p5Cx74XZKL4XtgqgZ6
	xpzucLNybjVg93OTouKGD3UJD7xI+OuEsanf7h99aY9dsMjaxcqhJt1gQ92F5DrF
	6gA5ow==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trq7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:54 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd83569844so3246495e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727313; x=1783332113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=;
        b=CAxVRPe09C2GOFL2qCH/RRo4G+iuJil8rp9E2ljd1jlDZ7YlfVK6j+rGHy9Ne8Hs+D
         +jxi4GUptf98siwT0VTz7ma3RKr+ojLbkddRi7rxdVE2cxn7ya1Vlf6DywHx+etE/0O2
         NsCl5wEIIHYr9NCODYJsBofDYKzfR8MkaooyFRwnXBV8ULjvV1ibjXt36cPXICMawERU
         4HQEOIO18Gfz7knZN8f8JpJzWz+tisq0C7VB6/7lnAT49n+TVY4FSYrQ8Nz8B9ew6W9X
         oegWLeA6dQzTGC8nxnf/a57ehs58tOZd4hOo9dgdauK6rgQJCi3H2vxtL+UpmcqEx/ic
         GZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727313; x=1783332113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HYRuBcDmeSrwysgBk6y3pl9+6SWSAyowGbE1RPyJdFA=;
        b=hyz/hTGj1L6hJbBj+cGB8Ntq/vMQxWvrGUy4AiPKnZAUKq9d6qZQCxLyvRqyW5mUmg
         p2vSvOwzr7wrbibwGzqvVD7JktRmvKZVUcj823kmvUnsEzmle1TZqwbUmIKZozRAmq/a
         hTVtOovX2PLeUcIZKcuKQOkEUQUj8hVapflpToZZJcpNpNq+4T0omWefP6zhCRuB863P
         13FBvm1+jZnktnLJTokKQ+bUaOSiUE3T3eiarcbEZK6rOuhDlmkc95f7u2DPYwW8ZVKy
         kHZsvYYGtM7hIcUbhlbbwq8DVkEoldApMOMmkMy7LFOXkgf017sRrNvzgnzFBxif5WHg
         MPpg==
X-Forwarded-Encrypted: i=1; AHgh+Rqn4TyGjCvp+X0ByW4j8LbuGAetHxkta4HxzofsoXx+wm9gNT51qhvXiL9rpx/ykK0ChlL8NeSir5s/5Aro@vger.kernel.org
X-Gm-Message-State: AOJu0YwBSScTBpaS843B1s8DLJr5xxtc7dUKDCnI811eqEZE6+1/rGXl
	6Yf9cxu0DHFE2CyIFmvc0yP9URvS1NhvUjry6BS/SMa4QfV63HCoW/lkvrRuyZnQySYrcNufK5G
	q3dbou1o/sGw6PPXnAwl++EmWIGo3vOKc+EMpF0+io4H/RTUf9eDPy5LIiOX7wt6JSi7p
X-Gm-Gg: AfdE7ckPtk3VRpJ8XSQFPk50u/wecwNT+GqSTeKv0kG5n50ivmUNE5A0zadAcSGPXN2
	HJyOxGnU1CvFvh1xvHRygqJL8S/pDU8Wx+y7DgXXSVOYvU0GewTObwDDGHzvS2mbEh/ivPH4BBB
	qsgFWR8cTNDAcKQ+YBqJn3G9befK9gk7ZOO2Ml1vWloBUnT9f9mMKKdg40HCS4nvbYAxPp1y51i
	NGCLhib2+Ad6ytz72xPkEY4jwsSmYqw0SonYiEzaR/96vd2gK32ROIfC9SVif1ro+Arh2HGq6gP
	PtaC5EMrKvVcII7L0x+OhExQQLN3ZM6LvHl0HBynO+bIy5tatJ05IJgM4STCwWtjsVchbCwddkf
	NPijF0fIqNWgHdVbUtr5SypemYBgiHr41MmOBAJii
X-Received: by 2002:a05:6122:8b1c:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5bdba8a339bmr27584e0c.6.1782727308098;
        Mon, 29 Jun 2026 03:01:48 -0700 (PDT)
X-Received: by 2002:a05:6122:8b1c:b0:575:634a:a604 with SMTP id 71dfb90a1353d-5bdba8a339bmr27486e0c.6.1782727307238;
        Mon, 29 Jun 2026 03:01:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:12 +0200
Subject: [PATCH v20 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-10-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fDLeS2ZDhx+ScijOniaw6DzPwcx1IpnjO8zSFEJey9c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJxWoYdaECBMJU1ae5UmTpJ/sF45cGJdaurU
 vfvAW1JcVCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcQAKCRAFnS7L/zaE
 wwkpEACzlOolvjYNbjF180IhoXcv1UxMesWJbsR+q/6GDNbH+H+8Y05PJSygIP0eesV6iOV9bSA
 sb/B32oxvvNkEOuf/+4zat7qcfOfqxpzqji4lotN5JPp6ATjXsk6yTA6UyKBGmH38zMieAV8DsE
 jeyxGxYU916OZctTn7CsnBJ/EaS9NhnwsvtI0Gp8VeBYS6AdvTBL8UkUXT/QQ2tGAiM2PFcXuBz
 czP5dJTlb2krm6mdRFXp/7Zs6OgGC45S9h1oK9pvxwp5UA73ohfkhg4/f87D6Wr9wv2d3Vq9nn+
 nEcExiMZGdh2wt/rjpILDQDBycJiKN/FWO8POtrF2w3AFA+6YxORycPUKMz/9DaasiLHCaoG5yC
 /BA4ccjFCH8/ycLcd7VGFSb/tRK3a8zoM0ilSPMpVahiIUN9QFNp1/1ZFyZA3aXqfoHeXdtrgXP
 rkP0g18Pe8GJwl96LpRgas3uUG0Jn+FuWoMdkaasUmNJtbjgqJq2g01n/qhAxaeFz6F3MoZdAkH
 y+UjR7eIjmfRpFpjvUiKPCKIA98R42RGJVlIdplsF+CdERgwQF2V2FHbA5nnRcbLph4OxA8T00O
 93KFIUcl1IO1UMfVHA691gjl/11QIvRk9fR2sLrNhkT/TBKH6Rsv8tV3SVolIYvx8jhMGJ3HNn6
 nA772RGyHavwIpQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX/Is8KwAhOTOJ
 e/AkNW7aV6AFjgA6ir9QmEaPHeR9OtnQ20GqgHRcox7ny1hBw8aAoJF7kJBt8OJU1yBxdJ3PT/A
 lsh5+MqFCqV0GZgJn9X1mZkkECPQkeSRHhHUOL3+uVUDoA03Ti3CM9ht7tF9cjKfRnclsCMJOFZ
 7Hi9PRyBiHAvee/oUdsi9Z6NO3lp0e5Rs3/9d/tuW1Ot4+nTKQYsONFchM7b2zrSn/6tktwY1Wu
 FfYb+BDoxyDLkGhnP6qX/Asf/QwdRP1WnYB8FS6u5KYXJah1LUleNUeXTVQEDUss4AlrTdJQs9X
 9eD2XhVVoUGaPUeX8RSHSX4K7o5TUuhAqwiXbI0EOUPxq1dqzn4B8ZIJ6w7FR5mmHCApBprn8JX
 CEqXKHoCkdbMqXKY47UB8v/6ef8VTTK5XlM6+ikDccflutWcx1wuxvmZEKZia1TlZ/m3+KYq30O
 NVEUNuKdKqVeUmj4Tpw==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a424292 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX1B9IieL6YweA
 0k91ELV+Hqz+wlNIKUiWNjktIpjnfdYQ2klBGBbSv1CdXnhwBHhXYWyktFKR9EH5eUZaRj4YHbX
 vrGUKrzSp/ycyCtRVMUSgwmQ3dVMMCA=
X-Proofpoint-ORIG-GUID: JkZq3KZP7r26wGMGuLiE52U1Uts6OrZE
X-Proofpoint-GUID: JkZq3KZP7r26wGMGuLiE52U1Uts6OrZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
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
	TAGGED_FROM(0.00)[bounces-114957-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 9F1806D8B5D

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ad37c2b8ae53a373bb248aff06c3b7946e8439a8..a0e2eadc3afd5f83e46724c8bc3e3690146b86ba 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -238,7 +238,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d1daa229361aa74da5d3d7bfe1bc8ab189761e38..d60efb5c26d88f8b0259b1dccc8724d0f75571c6 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -22,8 +23,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3


