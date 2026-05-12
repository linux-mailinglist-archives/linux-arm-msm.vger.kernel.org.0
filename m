Return-Path: <linux-arm-msm+bounces-107076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCX1Cl77AmpOzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 12:05:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD88E51E3D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 12:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C5F3306D94C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6A94C77A5;
	Tue, 12 May 2026 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kR7zxMTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S71nK84u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EE64C6EF3
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580110; cv=none; b=KGqGIZYr51RiUL6GttkpLF8U9jzxUw0zTdRlQCr5ZhxZUCf1M30yEX3CP1vzVJK3RZQ2SIkp+htzY+2XosbnMTyzELp5iSC+I+jt7lmBOdtf77IbcampFCFw6Agd3dcOVinJhbaorKZ+L2yPy4N97pfUpW0o7csclJtCXABk1gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580110; c=relaxed/simple;
	bh=M4MGfksm2KJNKz2SopLwjPKXAvHbsbcD2AS/jpfC2rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=feQZmc9lrH5AI8frvBecXeB91Oz94oxMa2iRBjNrYb0Sq7/8IwJuQYbq937rA55dzObSQUbNIznzRBlPRcBcqIiVrh8u9Ie+H10OmD+sZv5K1cMmlPWWLPdTMXKmTOuXsP5q6J3InBS/CJDD72y4oMPF78sHbY7AKSdIk4hJTIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kR7zxMTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S71nK84u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5J0e82573861
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=; b=kR7zxMTPFYJQouA3
	p4DGnZeq2/EBw6uokAjZBrAa5nUZ6Mi3Kv3DQrbc59yc7W7qZ4HZ+xZTVUMxsk1B
	oEoyy+azEPCOx78k/Yp2Nmoq30gk4JODkltXyltyrjUBQc1KYMvX1Jn0vcIj0dBu
	YG0FcxAIskVG4+AFcERwbuBaHJquZZZHCjBy00e001lhkdi8S2Exg+fDXqsG4mOu
	NdI5ySOTUP8Y5lImAiYmg950I/HDfab+vSkp7YeTe987hItDG5goSgJ59DrHM04k
	sKW/eiufLRj1UKFwNsXbpVUt2hG76jfY2FZSPgCKA15m9NI9/MZh4UHzQvI8dv3Q
	QrriaA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2amex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 10:01:46 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95ce849ad82so220514241.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 03:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778580106; x=1779184906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=;
        b=S71nK84uxIthK45lfq2uYXeWbKd0tbFtDvgDLJR/NmwyQE0mZbW3zZ/QcVAbx8/GE1
         Z6A0hQyzos05az/8KbGEy9DAbdUWcjeWMk5bmyUzD8+trvZEZMlhdmseSu2bu3G2jovc
         oWmnBCmVxhffgpgqbnlMyTSR46oQYvEHYKbQkiW7JexbvgaqBWk8Gen95+HxYizmTna+
         oGFbQCFCOyFlPeaM5tRQMVNZekLiL37WPlS2LAvmR4YtUdtwlZH0bTH8OlBTI2QOmh52
         IOjqeYL35So39JKOec15xzKwwxvTmpLD9giJEaGcfnmKiNL2MLXGDHk/3RaSONXbQhQd
         A5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580106; x=1779184906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC45lzfOu9qu5qz2K1SWlBa+7CSSxkc0TaGyvTJJ1vA=;
        b=qeh4uMewLNMbB256XyS9oy9WHFpMI06UeLSWhjfvfKFwzpd2yG5U9vb7YD9sjuJxI9
         QLpDNNo8SgHXVNWz2osj+a77zQ7IiSy/tLLOJEByQhAdx8HN4inhknjm4pb+CXQtRSUo
         +fxCVtmGtK8x39ZM5+ZhjA3+/pupJut1Z4SCglpDmNlAl1dbDSsx1UupR6JtygBuzlkr
         jCRe+15SPKdwdRWxzSJZgfoNa8ScVWfC0e02AcuWhZ1uQHqxWo38fr4WMKmBmj+0su2T
         UHLNl5u0oXL9jyT4buJzlx6KqQ46Vx4vTewWMcxTJHbcI/rb6b5t7xS/n4oq1ik1QdGT
         oIAg==
X-Forwarded-Encrypted: i=1; AFNElJ8zioILbyq8W2o5v9EzUOL0l8LZ3tYMCag8oQPn2Ccz07Nk8sR596Sf0b/LpwkDIZOhV6G8B3v4iOFC+BI8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz//7B5OW7F5GP9Co0FBOmj4amZ1ztDomc0Q9nAHAeQDUwJ6h9h
	dAPBmKm1W1RvYHfi/nwR+LCEKLmMIb5D4hfVicXA+bs/TTOthBkm7PyBPxcFU/07YsmpvN5buKh
	pC8HKf1pAN9zEpOfaY9Z/wHQ3m1EzDMqh+NxVS3Y9jKXzXGkyajgNH5vfNR/oWHjxWKHZ
X-Gm-Gg: Acq92OF07pTegWBVjv07D5SzJjtHySJcjJ2otIJxBcKkDLcwR2Ltk2HKLToXYI12MLV
	g0sBgHRbxta/efcBveyW42XuJvOTT3g5l9DZTJfpIxIMWNS3qFeBn2PxSYnl8UPcgtmA/EmUUHc
	3WrDR1AylocF1057KvB2oq92JyFXUXK4wVA2yaPSEhogOp10G9ejg9laCEFTeXdlyNNvCNAfj01
	exuU/3voSvIfKTPFtKff2baYpTVRlaru4+AZU1RPmJNxpzjymZiw0n7sG3rbQdORha4GgnP1qnw
	mBKNj2b2FtKO9cuz8WWfdMBgJvw8McxfPqnVmH9uDSvt97JMeD6WJ0jfHn0NVx6wUb2/Y2/GUKv
	aKbZnDjqeNJHFgSu3zLcoYzqpHfNcFIjQyFm6WoLW+1lz99jU2ms2aBsj0I9MknB1c+M3oXLoep
	P0RxA=
X-Received: by 2002:ac5:c807:0:b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-57599d9db41mr1781357e0c.1.1778580105613;
        Tue, 12 May 2026 03:01:45 -0700 (PDT)
X-Received: by 2002:ac5:c807:0:b0:575:99d9:cd15 with SMTP id 71dfb90a1353d-57599d9db41mr1781318e0c.1.1778580105090;
        Tue, 12 May 2026 03:01:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcc57c12799sm492515666b.47.2026.05.12.03.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 03:01:44 -0700 (PDT)
Message-ID: <08d1fd7a-c782-4d8b-85ee-1b46868db343@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Erikas Bitovtas <xerikasxx@gmail.com>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
 <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-5-e69465375900@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a02fa8a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=alOFDL0nBBd-F9mXlB8A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: fuQdEgYTqZdMR-r-mvzkJgu9voek43vH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEwMSBTYWx0ZWRfX8Md17pNwPcoM
 C1SeKlZaPsgaAtaUKcHCy5dSI8NHAKOUwJTQlqnscO+Z5eABEo7GHHuF8hVvvH0VsXCLsA0QYV/
 Y8Xg/PrWisYdV74Sjwy3rhtdwAP0iTDR8QZYceLJzamuUpMgnl7yDk47HC0YWUEz8FPseLf1iXY
 haeEC2lt6m441ICM9tinaUzAnOgDKgU2K6RH8GXaTyKNUxF1UkaSEJWLizzc1G9XKPK7Xg/9UsP
 Xu4a9oQIh8OVj55bHNAam7ShD6EnfB5GiT/VQx7AlpJ7nRdwRKbxd0gjxnN7DnnDSQiLgJwZp/+
 hRfZeVvv/nzMKQA2OUalwDUZ8rQeWGpQ74BXdxbWC/cmkQ5J+SfIWsf8uTGYSko8KyZiyeHDIk9
 8+VJ8opHuNV+WJgWgcpr3i8hDXmXXiBe6AC6G8ABuXwG9P+BAo31bxb6F72/5C6MKyfBmDwLWSW
 Pq1efGHgqCK5l1KS8pA==
X-Proofpoint-ORIG-GUID: fuQdEgYTqZdMR-r-mvzkJgu9voek43vH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120101
X-Rspamd-Queue-Id: DD88E51E3D9
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
	TAGGED_FROM(0.00)[bounces-107076-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,oss.qualcomm.com,apitzsch.eu,baylibre.com,redhat.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/10/26 11:47 AM, Erikas Bitovtas wrote:
> Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
> device tree property "qcom,supports-hw-trigger", add a HW_CTRL flag
> to these GDSCs to pass their control to hardware.
> 
> Venus core clock cannot be enabled if Venus core GDSCs are switched off.

The downstream device tree suggests the reverse - the venus_coreN GDSCs
refer to venus0_coreN_vcodec0_clk (and venus_gdsc lists
clk_gcc_venus0_axi_clk and clk_gcc_venus0_vcodec0_clk)

> But since they are set to be hardware controlled, they can be switched
> off at any moment. Vote for the Venus core clock to enable it later when
> GDSCs get turned on.

I understand these words but I can't see how they reflect the change

> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
> index 45193b3d714b..420997b00ae0 100644
> --- a/drivers/clk/qcom/gcc-msm8939.c
> +++ b/drivers/clk/qcom/gcc-msm8939.c
> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>  
>  static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>  	.halt_reg = 0x4c02c,
> +	.halt_check = BRANCH_HALT_SKIP,
>  	.clkr = {
>  		.enable_reg = 0x4c02c,
>  		.enable_mask = BIT(0),
> @@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>  
>  static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
>  	.halt_reg = 0x4c034,
> +	.halt_check = BRANCH_HALT_SKIP,
>  	.clkr = {
>  		.enable_reg = 0x4c034,
>  		.enable_mask = BIT(0),
> @@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
>  	.pd = {
>  		.name = "venus_core0",
>  	},
> +	.flags = HW_CTRL,
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> @@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
>  	.pd = {
>  		.name = "venus_core1",
>  	},
> +	.flags = HW_CTRL,

This should be HW_CTRL_TRIGGER, paired with a change to call
dev_pm_genpd_set_hwmode() in the driver - this currently only happens
in vcodec_control_v4().

Konrad

