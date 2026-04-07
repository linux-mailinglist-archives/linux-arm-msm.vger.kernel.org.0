Return-Path: <linux-arm-msm+bounces-102172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOSuJmAH1WnMzgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:32:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E9F3AF306
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFC02302075E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C6B3B777F;
	Tue,  7 Apr 2026 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxGcSRL2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gw6GQvV1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC633B7B76
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568591; cv=none; b=VJ5wbSUYn+dcvx2sNNVbMNthjvTiU7Qk+py7H+c/qquDZVQZcK7JdIweTWxMjdbFC1Kuxo1xi5HluhaDY67fu5AgWv0x3yUPWJDZehg8O3mnsQ53/ljwbXZR+iPZTncwciwfnaiqmIMK7e3/N5PccqB1arldVmFW1q3OqUb4DkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568591; c=relaxed/simple;
	bh=24winHpEP6yCscClPL7a8tX85b5mr13n6/UAWQd2++Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fpHC4ZzWpIoheSplJX7hTno5E4V58Xnk2zDzQ8W19hckIyJ4bLRNvKOEgkmhihnNQFGyBM63GOdhYM2TFgjw6XbtGbJHpg7eaSi0pOgbwHpx1HunvAtobGcPmsgl7uTBggJmlQRTiJNl5ycEgXT45hMNSuI5kaUeV5zU8dHDigA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxGcSRL2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gw6GQvV1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637D9c171584282
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uV0jgDOoisJMOeCaLNDInlnDVtS4gJ+3iRPk9zVjquw=; b=pxGcSRL2NmGi/noF
	OUKrEHMW+pcnSB+djaGN2gAe5g9XH4Zsdg+6Grp08r0jG4SsV8N+7+OvWDz0H6E0
	LWmz4ybvUXF5l9fdVG4zHwYWzrSfyo/22Sk6vwRtkKos0MiSLRzJ/Mp5WPvu54Ko
	gkRZo81ja7XBpjKpirTQKGs5zBv3jBZMJ817F24aqCrwzUfxKS0H1uRwpGEa9l/f
	bTrvkOQN8YqQuloIyiczkyP01gmnlzCEXoyeFP7YLas1KeUy8zYncj7CAdOu/VYk
	SvIv31nBnLYxpLYerZfmy60Pok0HGPFRUOHG3ajZqMDyrMfTdj4Cjt/EHpMn9qv1
	/d+zww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr9twe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:29:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b32feb719so6676971cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568588; x=1776173388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uV0jgDOoisJMOeCaLNDInlnDVtS4gJ+3iRPk9zVjquw=;
        b=Gw6GQvV1jqSbWkqq8xvmxNKbwDRciRmqoPRAhAfMtL6kfa0Us5kOd6HPv8ahRKtBMQ
         NaNKs9nu5njOEQ60ZD9FGY4xD/BCkpeCtXjyhQwfBwbXSA+rOfwJUEGnyANB7CZkCDrP
         9JpdgbS+qhihvQ+w4zrUu1Q9fXohkdkz2oKLqIKHU6zMRaQDpE1sqtFcXl/V2ihUbhrE
         YGKNQ4CmghU+Tvy9vAutIgNGmhlnM4m4HBb1Jx4yarZKKGCfLa9v3/Kyv8H6fOwJppOa
         NjMlDv340sZ1ehdKP0t4ugLgS+rXh6RqeX6fFkO6VlZE+cY8qRtCqzqcFjJYPOD6cwT7
         0thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568588; x=1776173388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uV0jgDOoisJMOeCaLNDInlnDVtS4gJ+3iRPk9zVjquw=;
        b=olGS2b3gdQ9+tNtkWLfU+i8aeevP/s2d/ZmKWYSXsSRd6GKA2TxWHUVpBlSt1KUzR0
         1gnJgUiP9m1i7ZmZOS1AIBUOQD9Tf/CSH58hOAmEXvZkllRlKBQC+rFM/bxdFjpUcd0d
         RlASwMNsxJOlt8I5AzzvkmBC878qaIvc4U5EW5+6fxWidhA31D7sdYJvBjrxqd41FzAb
         c0l51yzhQffbBwOxRlBX2Hn5JdsolONGG6gBb3usuZAblOujnvHKUmFtNk0QZOz8okv8
         GgvBME5iPtkIXy61vtmyxSOsFN0qBe4gNbzlo+nQrqGkOfSjCp9iwGERcczZh7gVWUFk
         qFiw==
X-Gm-Message-State: AOJu0Yz0GUlZRC1HC5Csz1Rcu3gXcS4ywbsL5kymyN06M+S0VTpaJHpi
	1Xudta6FHa+PV7M2yYnH/KmHNnY/iOuqTIXSAmiZeCEKRl5VB+ClfJ+r4bGwc70Ta4dtdpqKgG4
	Oaq/mMz3mxc6/qYtzyMoaFf/lVF4EHy7P81ZT0UukVYSPXR1shP73ko59Tk1jaCzgk1iYnEVIcA
	4t
X-Gm-Gg: AeBDieuirAs6BW2g7e+dLno3YZ7R0996i2dJdpyxmyku/Y+9EjWxkFfgdXPlQxduUqQ
	n/NIrNwwYrlS0aX7L7S53hx6UaJpLP8EtY+pG+atOqLaUtTGjWSkRT/bldp3bC1lR7PlNklcfuf
	fuKhsLIbMWRjZB5VQZrphFVI2LUj7ICX/5zmSMWtgA9m4806uym6SoS7A8+qEtJ81LdgA4Z4kv9
	4Xeu6IsMbqN/Zj4qdXE6I/YeEi9FVWKGTLeZdVWKtXRX3S0pO1KYJY/bD84/kBUpyoMhF5oB3Ch
	65YbDvkyT9elB6/C98JF0xYEdvdfUruFH4ufAwnnDyLWvmwPaJncGbCslp9bYbGxc1J7RndGmKW
	g2vW5RqM0IeSr7wqGgd7zh0dlAhJV4yEfp/q+Ecb5XRtV/xaI7UyOF8XZe/78c0m1zoYzUIQUhS
	NtTBs=
X-Received: by 2002:a05:622a:60c:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d62c8442bmr161891371cf.3.1775568587982;
        Tue, 07 Apr 2026 06:29:47 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:509:d76:fe73 with SMTP id d75a77b69052e-50d62c8442bmr161890971cf.3.1775568587439;
        Tue, 07 Apr 2026 06:29:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff131csm557563666b.52.2026.04.07.06.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:29:46 -0700 (PDT)
Message-ID: <4be1efbe-ec76-458d-9abf-c24b80a6da4b@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:29:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] clk: qcom: gcc-sc7280: switch GP clocks to
 clk_rcg2_gp_ops
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260407-gcc-gpclk-sc7280-v1-1-2445c2f7a539@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-gcc-gpclk-sc7280-v1-1-2445c2f7a539@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SMdykuvH c=1 sm=1 tr=0 ts=69d506cd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=ksxQWNrZAAAA:8 a=Moh2RT2aINYzgBBivQcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfX1AISrxY56Zsp
 MCnsROsO5lCkxQ2LjalD7sepY0N0gRATtjpbcMK2aAbMFZMRE66TcNAzXXNGRcHJNJEL7+7Fce3
 Tqya5AY6JlgD4Ldsdr1zeq2gUar2JQua3zuCZ2bU7qL5mEvJ0r6ABLozEAmq3PKhDGRmKtWfEdZ
 fcIzZigVclLleq5kvD7bSdYnYKzvOliSiVYah+5OWTy2uYOADHfyyMbluwtdmf43XVFOD+m0WWg
 j9J1Y23cKREnHlxDcENwgpWwQ05JgoD3fTN5XJR+xjwVpJoKhonYez5q8Wx8YQ5j9iCWAgcU3/9
 odFsmgNDA+vMH+HWmUpJ034yLj1JA9FhyjEdLQ6YhYvUQmTMWFzJMwGqfx8II0fub2AuWF9mZkh
 bAE/3xxTA3KXV4Gw0Vo8G0wels0q/Wv1hC+lRMzTztYMtj8ybA3itcyTmToupdz0B3GJbVbMO1s
 XLDTJvBtYqGsy8SsE7w==
X-Proofpoint-GUID: RCrgdJlyWB_FFUTtOZwqz1-yrEycVYkD
X-Proofpoint-ORIG-GUID: RCrgdJlyWB_FFUTtOZwqz1-yrEycVYkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070126
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,radxa.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102172-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 70E9F3AF306
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 6:00 PM, Xilin Wu wrote:
> The GP1/GP2/GP3 clock sources are general-purpose timer/PWM clocks
> that require runtime-computed MND divider values and duty cycle
> control. They are currently using clk_rcg2_ops with a frequency table
> containing only a few fixed entries (50/100/200 MHz), which:
> 
> - Cannot produce arbitrary frequencies needed for PWM periods
> - Bypasses the MND divider (m=0, n=0), making duty cycle control
>   impossible (MND is in bypass mode, set_duty_cycle returns -EINVAL)
> 
> Switch to clk_rcg2_gp_ops which uses clk_rcg2_calc_mnd() to
> dynamically compute optimal M/N/pre_div values from any requested
> frequency, and empty the frequency table since it is not used by the
> GP ops path.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
> Sending this as RFC, because I'm not sure if all other gcc drivers require
> the same change.

Possibly!

It's only been introduced recently, so it may be that we do a mass update

However

The introductory commit notes:

 Limitations:
	- The driver doesn't select a parent clock (it may be selected by client
	in device tree with assigned-clocks, assigned-clock-parents properties)

which could potentially break some existing users that rely on the clock
provider to do it..

> ---
>  drivers/clk/qcom/gcc-sc7280.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
> index 4502926a2691..e7748c468721 100644
> --- a/drivers/clk/qcom/gcc-sc7280.c
> +++ b/drivers/clk/qcom/gcc-sc7280.c
> @@ -457,9 +457,6 @@ static struct clk_regmap_mux gcc_usb3_sec_phy_pipe_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
> -	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
> -	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
> -	F(200000000, P_GCC_GPLL0_OUT_ODD, 1, 0, 0),
>  	{ }
>  };

I don't think any of the rcg2_gp ops use the frequency table, you
should be able to simply remove it

Konrad

