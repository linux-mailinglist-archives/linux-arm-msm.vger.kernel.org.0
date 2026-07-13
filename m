Return-Path: <linux-arm-msm+bounces-118775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1bI3BknjVGoRggAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:08:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6536574B500
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 15:08:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Dr8id1fb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="WxhK89/8";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118775-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118775-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B60D348D67C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52CB41C2E8;
	Mon, 13 Jul 2026 13:01:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF01C413D82
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947708; cv=none; b=lP+x2jUIvIKwSPRUnB1FoRiBWknyh1uYXvkGlVQan4dZyfs0IUgBbGWbp/mRno8DEvqdzsAgisXB7l/gv2XD9RBTpxepZW8Bf20iSs0n487vWhg3CUjwVC3a6SLyiEAwihe4LBtoFB2nUg1rH9WJupUUd1AbhB5cCjm6RCSfjxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947708; c=relaxed/simple;
	bh=zHIuoWgA0JNzB45qmsTvX1DiRfFAkkbG2L0hbAcWpaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GLUlLaQiicexU0oPZqYQurp3q7Bx7Cj7A4xFe9s7DNtpgtnkTEUro8jZMHxlkwQtXQV546vF0FPPyEnGbDe8dE5ox4ZnaVcawVunP98Od5vu1NRpKHXNBVqTMUz3XYTW54MPPgG7wAxHvlbwh+Vp0P05y0jHLn6anlV7vQeL2ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dr8id1fb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxhK89/8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE4cj1561461
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=Dr8id1fbqQe0mNys
	bDRxf66KIWEKPjeeJ8XwNjYo/t3irvtChuVaq0aNn/TsugRGyygYjTsdye7NCGZI
	bMaFovRNSLO9jG8rzE6+I0oYU0IbsKamMwKBWXfeb/hYK9OeXhaxJv6+EHCLi8u6
	kxSZZ314+LXRlHtAng+nbCRofqcehn78SgHJoI7FJ9qpuAReKcnJ/jUyhAi2vz+g
	qWjE1qysPOhmjWDwtO+MGkR/F2tCGQbwVabZTcTnV72qOfYcOK5EQi3xOEa1dnL/
	fuV70a/DSTdkpv91VrS2joaMOzdxdh4+QF1QIbAwobQ0nn+Uvdv0Lm+QGdpgjULq
	Lb9uLA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3akgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 13:01:45 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e6b59d85dcso4926362a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 06:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947705; x=1784552505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=WxhK89/8Q0Qb6dRY0eMRjsRCUaP+QPsHghXyizX9rUHEKgfI0vbwBnIolWzT66A3uv
         eQUaK6ABHc+2hTOqz1bzh3IUbZ95Ca6LPm1qpxMQ4vLH05xxXDYXzBzab5eAwGY56Z6F
         0tdWskP2llNHoUqqI6/8vIz+Kkueaq2Xk6EU8oMLkJSL8G2K6UaJfYhu+KRUcHw1rSI0
         ISacl0KD8aFXg9q2aP8G2XQvAJikzv7kP8C0yNUtXXE64uCgpny26KLbI7njMj/HXB7a
         uk03wpPm6A+oloDfO2f2LGvZl5yFrXcGnDQ6nsjNhgi/TDGc+en8vrQc+ARefGpsktja
         Gkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947705; x=1784552505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=esSlrd/dGgIhxl2Q1JJy2petlwuXh9i0CMTwNQmjYZ4PFFwFmnjn4x6PailqWfeQ/c
         EeQVNysHLwiy4ecznR83au7N+iEPDis5PLzhohdtuz4ecC2Wj65xIX+49NphC0kNayPO
         IvBG7YnTHEsadg/HGYtIENsCIQPWIo7W+1pXDVntS2UlegpQIGQeHY5XdpsguPSbFG/F
         a8wpaacb8o2HZUF9n2PFIKMvmHHsAXalC2eP5BJvKBPafyytJ/SC1RzbW3p4f/Pa/SXm
         5284U1R95nMMzB0WgnBgcKa3RPpgAspsW4b+jFLjyxXWCs/EZw86wWoyw1pmg9nhmFMX
         Tzmw==
X-Forwarded-Encrypted: i=1; AFNElJ+JkeohtHJ3nlvuTVpbw/uryfduhQqtu8S8X/1P+TUxOicJZjCTnF5Xk4neGiQ2jesnH562Jx/Zx8Btv2F7@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZE1xJGujGGpx6xKyg0w+TE3dAQUAXZCiBiEwPRS5B//1x9W8
	5gfph0oT1RYLFxq6J3ENJrC5Z0b/9Qxo/Bv5ypdB9L3mJf4d18QgAz2ggd4PDC3HfzuqgHoBLfP
	kjTIzSwwdX63KZVdL7+Swq8G5am5SLowFNa9hEI+tzr4VO/S5U7V8tPp72UAbFPM2cXaU
X-Gm-Gg: AfdE7ckGzcOVUSBnbeipYpo1c3pt6KeeMCQQ3m9f/+Ym2YI0ZGwQuym7gYm5kyWXzQZ
	SfQiOm4GPN68aRUgMRxJzL8lbszoOl/0O632/N0chzdUM0utZV/+Q6iegbRTwV4R7/fLXuFdZX8
	9c71v8ronaPX540aQGdrHW/QN4NGcBbHWYIXKisSEyQAhSipsx98jfm3WbPk76mK9Tcvi83YgXA
	gy8EIkdCEk4j+F5phn5shMs2IShxTzPAmDYAfVqujt3Y6lH+C4Ek2pw5rv8GmZUWbIDyypqpmym
	aV147B113IXTXywaIkG+1qOc+JxHy1HBU3rMb4v5tCf4GUt+/0yTgsY3KE9LNzjTI5zssbPysXC
	3VSmGzqI5anazp+WNsvjIyha2EXriMCaRaDsvTkbu
X-Received: by 2002:a4a:ee84:0:b0:6a3:80b9:d7aa with SMTP id 006d021491bc7-6a39a6cd4d3mr5189796eaf.34.1783947703023;
        Mon, 13 Jul 2026 06:01:43 -0700 (PDT)
X-Received: by 2002:a4a:ee84:0:b0:6a3:80b9:d7aa with SMTP id 006d021491bc7-6a39a6cd4d3mr5189750eaf.34.1783947702509;
        Mon, 13 Jul 2026 06:01:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:06 +0200
Subject: [PATCH v21 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-5-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8sCOVL39BX2AFiqeGpscXeG1puX7rtAOjEFEhJGJOUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGaPsc0Fa7oCOUveANJ60kMxtnneAWu+40XI
 sHiKYzzr1CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThmgAKCRAFnS7L/zaE
 wzQ+D/4y8gxcLmowoTwpYu6/hbyBFcOrtC7x5BDbiLFBPjw8I/IW0TFnJ+GNhGJQX0rglPvFUGk
 E7Dt1oHIW+5lFWTJc5kgUdyCRZHTLY4Li23JVCxFj/cf1a1VF6fJC9rWpod3vmr3j0+pF+OFNMn
 boxzJHPB/pcJF+YiFEb2ZKmOG8LSPKhXnjWUTSyJI+D90cfyqLC8T8hTzIaNs7GUmeivuZaEIp8
 ykxseEOkwZ5iV3LDhkInSNXDwoegrdxf8bBiJLMw2aasSx/8DZeVmulN+6EP2bQxmvwKMzIlaVV
 tbFGw8MmR6KCFFROM9Ew7a+aBNcDVklXTs4bwKjMtZuBO4fl96oTLWi685Kdpf4CTuRZMECeU9I
 RQxMk4Tn1+j7gtHSq2QkLcNUPHnSblikm/wl4n2QNgmREo/nTzIFDuiS/7qObgC8SdGmjNIpol4
 DZ6m+yx/THlh/c0RMsfBev3a6ipc0zOXf0MDkqig/XW7SwFIickz0gL2foQAgrrv6bwIZLuI7iu
 p/cwEC0JBQN5OwY6R9R5KlY+Zv2esWxK0LI6V4Q8dm5APmI0vSAaidEczpSkeNQWzhWGDAYOtUp
 CO/n+FNteqnrNMOz+WTd0A3Hvvlkffb6siLl/Zl/hbBDnMRnNBDjRDTQMjUHsXXpwbZX+eHrORQ
 hP8dkSZdbgPBmBw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX7fLVhICkoptg
 j1t2keav8Ko125F/HxpyT1I1XjsU2sRvmdf/nWWNKtL3312mIRJoWPyTpoyxS5bEOA9vpEyg/HT
 cglqbw6UtywWMM/UICjDmZilq3qRRAltmgPoGlTSolIH8cjf60tb9OZ2xdhBe6oD6yuawAKWYhF
 o8wbLKuOu0wrtsjX9jUfaY/cvc5EWtO2kuON8LH8vnGpuqvtVUWMIjtXyLMLv1WRXFE15y6ZmBA
 G7GKNqi8QGDzk+EcuVgHa59Sye4Dp6FiV95mcfiEHralIsfwJci8EhkDSksyRmUClsp4lqsn0Kc
 w91k8skSvQfjUZSmpHds9C7AOg62aYOpDt/SyqgxrzFBVf2jzqqwdqCNGIthBdS7mBrl7s/txmj
 vXP7/6fwwXQLDR105WFv6sGME9gSKfT+3uK0Qz71wMdCZzXEfqjQAqacOjIpqWuEQzchel63sWd
 XyaYfmjn5n+zT2Ohn9A==
X-Proofpoint-ORIG-GUID: d0fnffl61K4wprSUjDrVFw3fhxCdY0jm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX4MLF6VrZhaPo
 UwMUGWa9uZkV0Xj1Wvt93AwLsosnAQVYtBmYdIPAlrqGPvDSOMmC9ZzYMHLN//xR9FjhfCjYtc8
 S52EXbsKiVpqBxcQiBNUwEj+6EteHNg=
X-Proofpoint-GUID: d0fnffl61K4wprSUjDrVFw3fhxCdY0jm
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54e1b9 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
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
	TAGGED_FROM(0.00)[bounces-118775-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,gmail.com,gondor.apana.org.au,davemloft.net,quicinc.com,qti.qualcomm.com,linaro.org,amd.com,codeaurora.org];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:corbet@lwn.net,m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:quic_utiwari@quicinc.com,m:mdalam@qti.qualcomm.com,m:lumag@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:andersson@kernel.org,m:peter.ujfalusi@gmail.com,m:michal.simek@amd.com,m:Frank.Li@kernel.org,m:agross@codeaurora.org,m:neil.armstrong@linaro.org,m:dmaengine@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:brgl@kernel.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:tharagopinath@gmail.com,m:peterujfalusi@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 6536574B500

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8ce0fe085c5fea6cc614edd692b5cfd264b94d5a..f3e713a5259c2c7c24cfdcec094814eb1202971a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
@@ -247,6 +250,7 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 
 static const struct bam_device_data bam_v2_0_data = {
 	.reg_info = bam_v2_0_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


