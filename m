Return-Path: <linux-arm-msm+bounces-114346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YPHbM3jbO2ogeQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:28:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0155D6BE9B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 15:28:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d2mAbR1X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XN6b3dcg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114346-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114346-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3B11304EAE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 13:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40223B8D78;
	Wed, 24 Jun 2026 13:25:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0073B8D50
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:25:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307506; cv=none; b=iWfQaJ3xXr/oRYH4tnjaJ3hgFH8r6t20Zc0HsdfX5cbU9u9geigUi50V4okk15n0pUvqO1GjeXNizdqoA4a4LsLX/FqMAJMOYgDYTggtaYOaO6V3Zl9T/A7NXaaRJfIneWCS+aN6ZOW6c/OPBODK/voc+DWMYdcX4q0SxWamrMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307506; c=relaxed/simple;
	bh=kDhyzIRUSFY4DaoQod9y772gfD8arw+oLPaldgVNaxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSXUjmo7A14d/mPpiMjRpDaTQWgRDVX/pH2LXsnr6V/p2sg/fn0RZeNPedaGLrxlBB0Eo5hxVHw2NbTnHCk7ZERaPwpxi+DSZzwnqwJEgJ+JlTIOkTFyI4VwXpbSGr+KMhEC5d7Im9m5a4oocqva7mkih5TTaxdZxFi9ZG8v60Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d2mAbR1X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XN6b3dcg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OAO24K2845789
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:25:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jcb1svJI3NBPH8EE+KZbtpFM7FrNUN4sf06BtjB1g94=; b=d2mAbR1XGCpRFcrQ
	K/++46i9yRqy56WlEFmEddZOdTp1EnhOD27snfQNx8Ti4zXVYcRm2C1C0QNTfRJ5
	+YUGZ1FbYLjmG9Nknd+WXemnt6G4OrH94+kBZnsMOAmm1PcDrpAdwTw/czOf6bdu
	Yqts3S0VCH8FBiozXh4Zh0QzQojjFmZmLKPpu8Nz6tyXt9er34Mkqa15Ibap+5Py
	WVS4jeNuzl7aw9YFlV4YIQt/mj488azZ4/0YfsuFxckrLUVXhWlcNmIWOlbRk1yb
	4B6KIKwqM/+9BwkKZlEvtiSpQWV40+Gm4TxykvE53l7sO90lDoe2gMl1UHpxuefG
	Ik316g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f004p3b60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 13:25:03 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-966d1aa6688so25020241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 06:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782307502; x=1782912302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jcb1svJI3NBPH8EE+KZbtpFM7FrNUN4sf06BtjB1g94=;
        b=XN6b3dcgvyAytuW4VUomD0+ICF06GT3nfAIp7NxFv9tKRkvV3UmokglbW0nOZASlaL
         zPfa3vEWKWwt7ocNnZNSHbX5kaL0pAevlvVg14i8fXFW9qxGTGGPADxj0tlLEKdlVctl
         BZzMNtw2LMoBX/O5LXj4rNyHl9JsrV8wI4tCVApE5NRBe3/gntkhtDfs7YVVJjFVYtPv
         2LKt2ktarKqQhpe9ydw5/HqjaeAOL0jBOgDL3Ksc6Nh1sC/fM+0lx4b/e4tkVWf9FKqP
         fvcM/dcMjpyoKfU5TqR93W/hxA7XT9pNiDj5HwkwAwITqC8gSkgS0/h9xDCWsaO95q4C
         nb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782307502; x=1782912302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcb1svJI3NBPH8EE+KZbtpFM7FrNUN4sf06BtjB1g94=;
        b=pcLGj7KUG8VYh2V8bHxccLdYg6oF54C3lRu7BrSKfu4gcF9nOl0p3tYmtSweeOMIP3
         THmgp+94EWnZzSFNNlHgI8hF2tKPSbrZB10JUM/weeRNJKcDVyhCsmMz6FdygZcOGLFM
         K/mL8t9LEonZkJO5ahecfJg5JcATOTAzWTHYhavSd4e8TrmxEmkhK9eEJeyHbtVinjNJ
         1BWCWNDdowDO8R6krlp0mac7yfxTePV4RcseR+LzftU/QUfbO67F7Lv7lVnhyIcSXr6E
         B2ANXF9h1WlajPvBfSSsz2VTDNw8VGJYffbqDsbM19VUOyu0Ugt/UtgqNIcwMaVzIu3A
         wlhA==
X-Forwarded-Encrypted: i=1; AHgh+RquD1BmKusUWtuislRr2RH8MUwEaEWZJdSgkPGKohPvxC6EE1P7Wni8Unc7/Sb01Z6IMfZi23b4kEfYC/1x@vger.kernel.org
X-Gm-Message-State: AOJu0YyxNrPvJxKQCmceh/3mdJtFhRx5SxWWh/5HvGN8xBPUoP9p9zM+
	5RdFv5wp4+iFvnEj0tUTtjHRaweSC5NWJx0T8XQ+RodI1kl8Ln4KMNX9Db2O7JaoBpkjE41SLeF
	A+K/1VLZctfTwEWtKtnOivkNR3iwM5Kl4o0lEnxqMc5JyGRYK6/uAPbDSEvdvFYbB2gc5
X-Gm-Gg: AfdE7clYP4oaVZGT6GggFSz6E80JHNq0hSCUYz1hAIRWdajv8TumjgbKcvZNS1MH5K6
	MXzuvqjs0DwhU8AptVq6/RZXNKNI2zV3ijMQxfMZA4UqpoUtZagNrM2o537XdP0q/zZQuwgeopD
	Y/7CY7fkE2QlcUgteO9q5nlzLow0kdcMhP59PQn1xpk0o7J/hMcPZhvRFSeKI4U3AIn1wwMDoUW
	LOO1sG5c8map/wUy/KBPeu7C/KWBOKNeDfa7Fc4Tesb/vsLPv3/kcW71ZJhm6KU5bwV0R8EhYUy
	AyWXLZW2M3Io05CBqmqXg4RcgzGwgzEGkwCjJGlUU7iq5aOB/moLgre9dRXvaYlLbUYMKnsof0U
	rLLl2LMNx3aRaIaUa4IUWqcZ+EONxBCL/Ijg=
X-Received: by 2002:a05:6102:5801:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-72f3ac9a4b6mr2035017137.7.1782307502630;
        Wed, 24 Jun 2026 06:25:02 -0700 (PDT)
X-Received: by 2002:a05:6102:5801:b0:60f:77ad:4bed with SMTP id ada2fe7eead31-72f3ac9a4b6mr2034948137.7.1782307498715;
        Wed, 24 Jun 2026 06:24:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3999b182a84sm35757741fa.32.2026.06.24.06.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:24:57 -0700 (PDT)
Message-ID: <160afe5e-f85a-46cb-9ed4-195bd267a46c@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 15:24:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: Add Vicharak Axon Mini
To: Ajit Singh <blfizzyy@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260624125443.18729-1-blfizzyy@gmail.com>
 <20260624125443.18729-4-blfizzyy@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624125443.18729-4-blfizzyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX/+iHH+ZILnwT
 FFRtwvN0a22kN1QNBkZp5zAam+F2hK6ZeovPc+bWPR1luaHfn2T4BlGvxW7UXqFxKo5e+vq2cjl
 eujpeQL/ps6ZrfGWBG3rMS0sfTwwYkA=
X-Proofpoint-ORIG-GUID: 9U8_FS7tdbWe0Yiyl_fyUzv4oOjmHHy5
X-Proofpoint-GUID: 9U8_FS7tdbWe0Yiyl_fyUzv4oOjmHHy5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDExMSBTYWx0ZWRfX5GfovD2O4bHs
 mltP+iV92ZQ/D8QMx5lp/KEMlrzTVMSY7KzOXlyFuny6ppqyBzdjRs5sbCuE3AATy56D/x8xAQC
 5H0HfR+C2kXE93TdV5mKzNZTjCZ0zi/Hr6DATXKzyYK3cuZibQYGrVe5Au5R2l6PjbjNc6UoDq0
 SUODoStum8vKCxjRPyRGGn0ehtwQ4VmYJxHFD/uCRnByzGCuYnK9xFAayXVLxW7itciX5ijbQfQ
 +HM3fib/S4R4Epb07MYEI25b2/aoWvwiNvHL4Y1XVoJUfrEnsuOGjKsTHCbnYQ34oiQ5kkv+GYQ
 tlXF09fYmrPYxWs0mxFdVoGsWXcoHDhLmfqMnibrhxC1fYMRKzQC3t5/ru0OVi6tP4RnE0nz+eN
 rhwJE8qieU+Hfdypoz0kz4k+RWPSJIiQsJT5AbUK1W3EJIQ2MSFQ9fZQk8kI0VQKHxK+GY3Nv3C
 Du8OUi9qst7pOH23F0A==
X-Authority-Analysis: v=2.4 cv=Q9TiJY2a c=1 sm=1 tr=0 ts=6a3bdaaf cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=K_x56oIxuJ97mMCJ5C4A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114346-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:blfizzyy@gmail.com,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0155D6BE9B9

On 6/24/26 2:54 PM, Ajit Singh wrote:
> Add DTS for the Vicharak Axon Mini board based on the Qualcomm
> QCS6490 SoC.
> 
> This adds debug UART, eMMC, UFS, SDIO WLAN, USB 2.0 host, PCIe
> support along with regulators.
> 
> The UFS ICE block is kept disabled because enabling it currently causes
> an SError during qcom_ice_create() on this board. UFS works without ICE.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


