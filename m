Return-Path: <linux-arm-msm+bounces-94099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C7MEQninmmCXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:50:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26083196E28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB3C73016EE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2039394460;
	Wed, 25 Feb 2026 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z99Nak8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R8/p4nvF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88C117BB21
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772020227; cv=none; b=oKCu6n9o2CsCPxuG5IJS2yyicr/6NhNOlQU5NypcK1HrI5AjLVZCXNIJvnHwCvuXK58EDPI0oqeSsXvZLknubr7mqTaPCqEKSX8Vb7wqnk5lRC62p2lS8TryBbgMKDeKijyLv8gddaRioVn2BVrqDC9WZ6fmqEGIYJoR2DBGopQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772020227; c=relaxed/simple;
	bh=uqMvQY9WyfUPDdKkarYUIypR280e/K/qCPwiIymsp2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BqHjPoPKDVsUNW6OKnZivfCniC/aFuOu8KSRFn806S7ri4b2exBxNIhFhjhKQBmO9TOvexNUyMpfkYH/pUaKQqU2iBLBEd0+mzgl6HoZjspQ1EbpPrsghH+E7Zw8L79RWarKNGc3st4II+nmvQOJHRTRKzG02JtDPToNIg3Y8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z99Nak8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R8/p4nvF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SCTn806821
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+78rA94PT3W1jpfuknZR2JGZiaj4yrwUHLE5tMG7LQ=; b=Z99Nak8TCWNDcsji
	goA7LEpe7euQ7GnuEvcIuTeJ4EOWrR970/i5hcNnownrBrCthQjNwdVwQP2wXGl9
	iGCD2SeIerez+63ukE7/OPC/Ij7BPVpZWUAdgUOd+wR/0FXb4vv9e51WcXWucNBH
	JfZh1TKz7BhcWlIGDwrfqa71AfgzR0TmYjVtkWOoAQf6BusJk7+ydL40Qa4PvOup
	YJm98U7KJ+7rBpI0iuL2wnOqQKvrItMNm7i1+c5zCzVrt69TFGigr4AZH+d876Md
	oDEEHkPaqv75i2kDeyjd0ap7vLbN1+wNK0wOlb3AlkEeMmGhvauscHOOiFMATQNW
	khtPDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chr5p9fyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 11:50:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4025302aso539239485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 03:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772020225; x=1772625025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+78rA94PT3W1jpfuknZR2JGZiaj4yrwUHLE5tMG7LQ=;
        b=R8/p4nvF0wC1esvmb0e68TpHw6mjGuItP3PL0Sh9A59G8V9NoXuL7H9Iveck3EIQV1
         A9rDt2EM9UT8vFKIPFcUTXvLcrP8CiBBDmrZ4U0nOZFv6eO6LlYuQUn4j+QZQfxubnIB
         4suw0PDZUTfzQia/Sa4x27PVCc60ZmoNnBje0mv7NhyhpPUsIqPuBG0vABIDKrteS0Z8
         R0f++S+9eGENGi6C1Amv4jF6+B5gL0ET45/NsQ6VaRtn9dFzLhuspwqMN7ZRM+9d8fnX
         0ZoxqHbG75/d1qS2FUmGLU2lMe5aDoYNl20m+qhj1ngiNFpfnX7kwEJ40PjK1EiM3LYc
         6mSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772020225; x=1772625025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+78rA94PT3W1jpfuknZR2JGZiaj4yrwUHLE5tMG7LQ=;
        b=QyyYFz9o8D0aTXkJhjLCqmXSvt79MbXBCakTimTt+/Rxp2Jk0nXhMo7PAP0GfkTgTT
         r/C1wYj8haD9DtzRactbpFJfese3RD+Fbgn5Ed7HiWkWGbQ4WnmuPrVAYVMn+RCU+v6z
         1DG08km+dgmBBnvgosAL6idQrjgiUrLlU16/z1x47DEU0RskXfu+0RzZXY9UHxZ4+XmH
         +1ka6K3//2Qpf3b/gA3deTvWr7JGwL40Bey3wYog/D/gBvB53kZvEaD/iK/rHUgh9t3E
         hFREgLVDI/PJgyKjZxamuaOuzesthQxHTyPJiU0DfMRvUZVEZF9k9gQ0eyTW0BFWxijL
         XmCg==
X-Forwarded-Encrypted: i=1; AJvYcCW7vKub0Lv+6EMgbVmHPX/bw3nkQ+wqxkWohSAScgDHotfx/5GE8hMbw/QWsnWR0U2OzJfZYxOtCo6AT+S1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9mZBQerylwkHVlfny5ohst6ne87ilMGoSuVj/i/MFMEJB9OM8
	zMJWSdYZ0/OUa2ez/6XeGjPIwtl7Jy7fn9OD93PlK7iXoBusmy/eYdYWHqrAT7NSXV8nIhIH39w
	BLZV7pHJxXwC4ERd9X/qf3d7H3suQUb2gW7C0daLHaolUGDQuUwe8ksIr5AH2nwNsM0Cs
X-Gm-Gg: ATEYQzwEk1dMyadDdbjFBE8fGYjD4JEhrnRmFLUUiUUuL1GkZ9mlIQfT0Bgo7obpL4R
	hwdHAGMPzYFNWcpMaMqBKtHZph/RCwN1RKAAF9ukjcVJvZ/8ruXRltJ4ouwqxhPDct7Bi6TLutx
	rsUeBOTacMDR2mU7Mcj7uJwczq5ptrGrxeZADu0Vi7BFDXcYw2mcRim8t9gVkbNuTcHwFtl98AU
	cc6CYah0neBkXhOGfF2KbsXSI1AKyvfV20a1WB8ODriTqX0K2/LVDRlwJ3uAmUOb/8ao0TbgmJU
	Z8c9bOjpw8TGmxHfXrpIwRIdud0B1/pQZXCEONRnRSy4HpaWK+BDYP0dUxCpM9auE7KIsfNMuHL
	qGjVFF+CQo885Zb4ubNo9o0HQoYjEacK18G3LPGW8/wx/x5qb3gr9mRXryhoLk1pDY8kisjJ7je
	t+hKg=
X-Received: by 2002:a05:620a:198a:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cb8c94f65dmr1557769785a.0.1772020224950;
        Wed, 25 Feb 2026 03:50:24 -0800 (PST)
X-Received: by 2002:a05:620a:198a:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cb8c94f65dmr1557767785a.0.1772020224482;
        Wed, 25 Feb 2026 03:50:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65eab9a08edsm4194196a12.5.2026.02.25.03.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 03:50:23 -0800 (PST)
Message-ID: <872fddf3-959a-4fd4-8f93-cafdf8414ef7@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:50:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add support for the Samsung S6E8FCO display panel
To: Yedaya Katsman <yedaya.ka@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?Q?Kamil_Go=C5=82da?=
 <kamil.golda@protonmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExNiBTYWx0ZWRfX7aU8vvjV5s9a
 Kk5kIEamfa0zFwArkYgAM7C88vSlzW3EvVyZqDJVk4BYN4QzSVenqUx1+hKIirvj13r336jiR0B
 ulRPwI9O4/axOIp3BneGPXl9rv7lwBAJwLFCYl97LnO87jod4zkGxUhi0LEBxpEnh+qb5WUpJMW
 ENyBGKOJuqmE5f8T8+SYWAka8Ni5f/neUwP4y9wy1PJTzjKo5cBWb2vfMihC9V0VPovATNuo4F0
 e9OeG9sb97yEpM1i5UuUb2I5vbMDyXKMhnwCHVaeLsP7g5YGOG7Fe5OBS8tv8ZtWpto4fWIyBol
 ANAs00qbPEkRKLpdA3CNvvNVXWxUVgGnaqKANE+/5CutkdQW41sv9DGygkz7li9Ee4Go76hBNI5
 TlokCdoXH2DQhJaLjj1fqpXsyjyjbUrjMlHkr+xw5HBCS3I7p6mTNDu2qBZ5zNSaJ842vyZqzPl
 qZBziFK4OZO6DDkXttg==
X-Authority-Analysis: v=2.4 cv=GstPO01C c=1 sm=1 tr=0 ts=699ee201 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=Gbw9aFdXAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=y4KI_ShnAeI64LbocBgA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 05apfxjlAc7NKeTCnRNiC8cmFwA1Xv6V
X-Proofpoint-ORIG-GUID: 05apfxjlAc7NKeTCnRNiC8cmFwA1Xv6V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250116
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94099-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26083196E28
X-Rspamd-Action: no action

On 2/23/26 9:26 PM, Yedaya Katsman wrote:
> This adds a driver to support the Samsung S6E8FCO display panel found in Xiaomi
> Mi A3 (xiaomi-laurel). The driver is generated using
> linux-mdss-dsi-panel-driver-generator[0].
> 
> The mdss reset dependency makes the screen work more reliably.
> 
> [0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
> Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel
> 
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
> Changes in v2:
> - Changed commit title like Dmitry asked

You got more comments for patch 3 from Dmitry

https://lore.kernel.org/linux-arm-msm/dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme/

Konrad

