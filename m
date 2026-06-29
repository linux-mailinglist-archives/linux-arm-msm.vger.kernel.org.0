Return-Path: <linux-arm-msm+bounces-114955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V7TjF/ZCQmro2wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:03:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1083C6D89B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 12:03:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=S9OAkwAI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jCpWVBod;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114955-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114955-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45A643024941
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B257E4014B1;
	Mon, 29 Jun 2026 10:01:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4B1400E0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727313; cv=none; b=GEJxrVPOtKuw8w4z7BLNaneigYclsM3NY1aOhBxjoeVH7BE2vU1md3gdtZTdpfpvpXY1uv2iKnY+rsxAIHxsMj6Az+AhhfhJn/3Ke73nqgHly6QaR58+tSDgph+msmatJWvE7jRg69A+dlIfb93YfdJllHK9tMjj9ISC9/AM9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727313; c=relaxed/simple;
	bh=czoxItsxxVvFFRsK/bUJo7zI9PxP/5bmJEdhhzZ9wNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PpYwtnv6k5qVgqY9iKxoyoWOuyH6A4kgVv0mN+p8d9ln6ZDGmMdNkFqMvOodqFSf8XrTXpBc2TpWXBwvH6hHfnT2Az8aLVs33ITOOOTH23HVyYZ9vgen0f+ISprJSzKCN86f93xfN8hO0fhvyqmQmdt+41xF4AiZ9xbwO2x3uyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9OAkwAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCpWVBod; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T91N982400847
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=S9OAkwAIYEUAKT0X
	XLf4xVUVvaEN3iAINq/viZfv+lfc5YKX41m2dzKgUfDAgU0J5wkw2bEjlpUwTi/e
	/xtu5eI2Qb4QcOgI34TYD65OO41Yapkbtz7Tj4okHqx7ETJY8s471qm/h1UViPz/
	8SW/42sMOorSWWoNocJ2EI1kzb5z/MmAhWcrlu0HzlJrNMWquOGQd2R+WEH1oWf/
	1R2kzmleYqHygnByGYc5Fv0kCGVQnC362hgzGTnj1sAt87Ev4dWL0Go9QQmjMprd
	kWEUzkwZzxb6QOlKr7FjjrZrdQ+bwYjgrcsU4limihaFggreztoT7KUape3ctTF2
	pAmDZA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq888ct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 10:01:51 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-737cd7b76ceso465334137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727310; x=1783332110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=jCpWVBodwZc0OzMSG6zgo8ouyIxE7ZNShuNnN+OULkVQ0gA8eCW3MgjLVvg1XXuKA3
         WJep4oaimGsth5s4Hl9j+CfHgF26afSpcbtd3KYDeVNGVg7Lsg+RXGf1Vv6SqwjnxV2u
         LIqL+PiXC6jp1EgP3wj9qwu9sSFt00dcglnh3Px690Whp+10N3UZCBrulSMcuiYt88oS
         cdhUhBw3+cYuUJFfQOPZF3v7gx4niPzOwEJOYd0h1bIl49YGLed1AOXvv9G0JQzERoBP
         2dGcCmk/FlfAGjfRZxP1rMVzVp+ZcZ3mWv2z0pI7ztOKmzou3kNCFHvBHbCzQyFxpsRz
         QJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727310; x=1783332110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=HR658jv6v0QVA9IaJQTxAlbPWDFsUvIkR0jOvy5R59Nbi+wfa0SAf61woVVi2fsIU4
         4lcDhd1xJksas+H0W6WdKZzZbgdlLkKFa5+Z5ZLOd+gOsJUaw7bxS1vL/l2+K8LN4A0A
         pUNOsVhqA7tzTbiA1JK5bx86S4cI3vnRLV4PJYprHkcypOQxgqQ5umFnNjwvwdgSfXqO
         DdYnUX7vxdrsw3P8S7aQYDVstrWgzxH7iegkUF/V/PLjGPGy7K0164q/UszfyPAqUHLV
         Pfy6GAJdwoyAOAl7xM4qbKxHT/cqNz5U7RVievsMmTZDY4tDDwvLEW7nV6rozgfodC5p
         eQgQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqa8E7mLE1C4+fNu2SHFdD/OXHMVwS7ig03wTVKRqs/P0O5PgcUmD284Vlo4jnlHfZNaufaDNEFlCuoaP5v@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsb0B4WCP+kCPvrxe45bTAALOWElYO+iW+5mc8JLdWs4abITw/
	w0o7Egc+cOzLktf8Dm2w74we1d5xDuVSP3pXEUTCQnIjqBhxF0s0i682BoOS2j5BPPzNnErGSyR
	KsGCGhK6pFzrjClx/2ZGSdjaZ4qYXl1bzARCsZvVaypFyFFrM3ROKTgIepx/W0I6OF8wX
X-Gm-Gg: AfdE7ckHt7nq/GxcbgMPyy69aanEU3dHOJsyuFNV+CX19kwbrJQPQFek3m6rKFKyx4A
	mCGHQ4NL07nTAiYx2xIZKUmSh0HdBxhfT5yxwRKlgQ9BrIXXjUVOzXWFUKaVjwDoVnwGaODY2jK
	K/BE5GMOlkqqcRvS0WuGSvatZnmdmkYSljGmuuZ1g4O5RlxH/NtDXaEn6flssTfB/AXT4pJFdqp
	bOuJw9w5rG5+5vHaxGJkiSqM+VLLzEFnUjcK+FII7b3wJW/94q7XB+z72jBYpAeaFaizx0BoVya
	eGW3chF6RpSZm7th21dW7sQ/Pw94bskq9DGZIPvVyI4wcFNEYtCfRJ9IN63sdW2N+ZI9XU2F7Vc
	pgDPtNXAQ4AVExiZGdTgS4PvMeVuHIqqJ1MuGXGg9
X-Received: by 2002:a05:6102:145b:10b0:737:491:5e49 with SMTP id ada2fe7eead31-73704917be2mr1657427137.18.1782727310008;
        Mon, 29 Jun 2026 03:01:50 -0700 (PDT)
X-Received: by 2002:a05:6102:145b:10b0:737:491:5e49 with SMTP id ada2fe7eead31-73704917be2mr1657345137.18.1782727309443;
        Mon, 29 Jun 2026 03:01:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:13 +0200
Subject: [PATCH v20 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-11-56f67da84c05@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJyHpUyHCZ5FJJ/hRQlsQgITkeHIvkKWPNaV
 KbuBe5DCf6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcgAKCRAFnS7L/zaE
 w0yoD/938nKtrLvcmNtwPBvQtvk16CDWCuP+LKzIDoJ1pGVJuQZ/RvpKJoJ8IvGuihPKpm0npV6
 yRFy/B5DKLO9uzMWhMP3sujf9UP5DvaoF1AvufRc+loKUGDuCdSwYfajZk5ohDrCcHviFV13IFc
 d9kul3oI9n56O1vJ0vGK7j9i0qV+JCGgIVqVqnKUqMA2E3Wox5tNJD9z4uujuZ5l+i1Rw3j088r
 A9iz8vt2sxv2ruvHdGVttLBBAnOyM8kfK/iQEKG8wS5gy1P6COTsx0LMM/vYDasLvidz30/HnDI
 tsMjZXFPjERU0/jMVLUu7a10Y7Jxs0w0LNPdHbszxUgVCSMyIKpZ+9NLVuoWUYoAkMt8lphYCGc
 Pqbz7qnZnQK26j9PCS9GS4J3ZosO+Mh5lfRYDLsk2feOukRMj6CCNSb2nF3e0IMYUKWwhQh/P3w
 LxM/x32vxOsQJPd+NJcrSUq55HiEufJkcsFaz33fiC45FX87y4GrH1ge5HS2K25DldCNNz0BmZG
 ViLggdvXwRdxttzZpuuZXmGG11bRiEg1IxqsZXjvRAlp8AntAdHaDkzYxUf74Zc21W5LDOdUaC5
 PBWZErdoh0wAyRxPKZsv8TAj5UtvSgQYmBubpQaeOvytNOxgwND0igJaYpcMDkUjf/2jGDyELiL
 KhucIneY8ymMNEA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0z2YGoBOLLGHBx3bbgsYeKy_-NF5u4gI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX1tuL/i3giIoG
 BZOm8Jcm1wVrjIk7U4rb0mwx3LX9zjCayhiU+iuuxf3rKPG780NmGynGxbDOMv6CjV+ORQadgn2
 y6Tej0Qjo4accGNPnlIzKPd+lbAABqs=
X-Proofpoint-ORIG-GUID: 0z2YGoBOLLGHBx3bbgsYeKy_-NF5u4gI
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a42428f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX1qAqaI1pGoda
 t9B/CwuGJNF660273vW4R+kEKD3K7e+yZwZDkBnYrR/UztA7PwV8xMEwd9BmQztNe2A75DUBgDK
 AhZp+0AbGbgj0aBCB8sWOigpXdjtji/vRwga8kGardsRKXg4gxAFnVUboDLgdPYhzyzy1g3EHE0
 ddi3xM3Q+zcVmMUuQQYChHqKD6RpF/pPxIBnzXC23ZBGBlXnK+ZCZKDeB3GsNjkyebf9lM+Gwdi
 G4ImoNEmBa874JhVtgVvNVu5taJTtQVBbTW68OOjxhu9+Kje3zsmrtSPLZDUFvkbzDa6CdqZxys
 lbEF5xErRvlW05NLr5uvfcXv287sPdTrCCxuZ0hqk9kl+JCqObWS48nvxCwqIG5M+tzDbCDek+T
 h0zNrbZeQhMbro1pcgmLlw+n36KeeP6SRe0Q7ToItF8H2NCg2ZO7JAvfRSrbzqjNyuDGSxJrK/f
 qdSA81eghAPVCuJaXlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114955-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 1083C6D89B4

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d60efb5c26d88f8b0259b1dccc8724d0f75571c6..26347e9fc078adede712722107e74958538accdf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,49 +12,34 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
+static void qce_dma_terminate(void *data)
 {
 	struct qce_dma_data *dma = data;
 
 	dmaengine_terminate_sync(dma->txchan);
 	dmaengine_terminate_sync(dma->rxchan);
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
 }
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
 struct scatterlist *

-- 
2.47.3


