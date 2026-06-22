Return-Path: <linux-arm-msm+bounces-114018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YEGlMYZAOWpQpQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:02:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2D36B020E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 16:02:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RGKqufGd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=a9CuYkb6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114018-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114018-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C30430407E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 14:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9130C3B7B7B;
	Mon, 22 Jun 2026 14:00:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C629C3B7757
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:00:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782136826; cv=none; b=C6uXTkLCDPAWpWMNl2wznOC3FKl/UwpMxcOshja6Y6+GE/j2ZRY22MbbN0AGGV0WcS/RPJKWgFuY7mcO/JFmYO+wZgMfe+Z640jxHMFsP6VT7iklklnTk74DeMx9g5ZskRIRw1GAY9RSvzlt+8L9cYdND7J0nS12SatVHiNdXXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782136826; c=relaxed/simple;
	bh=MdOeSIf8JKpQmOWa+YfZ6n0lbp36wLghMNUwe5mqJd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kso3F+TwmeFNe0FkV6Lju6SdGyzDSb/EupOONLycRZ79BEpM70Y2nkW3TMITxERLSBQvuA/6lFGsDEHzpaCsDUz93XumhjVtKr1RpQW8HFbzR80Zc4o4RhEETiWPdAX+V2FdNQWUiB97yWcerGy7EE1t1sRKiQqsjeoXF9d8vF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGKqufGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a9CuYkb6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDG7GI2386977
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y7USYdDcnIwSaPcutTPXYOBMfqHeBI2HwN0WtO8AXvM=; b=RGKqufGdxxcuu7Hm
	RAhsMkSYb3YPfHltO0ZoQfW4IZ7ZBASt4jXjvQafCBSbpiVFzuv8kpziZDCqovT1
	wdE3UKVuHmD85EJcx8rEIhzkCegRLuilmiMWCyzIeTwWxIn94za3r8/Aa78rmhYQ
	XSbuvnJil9900aCytL9wCRsVndr+T+PH3qud0FD+otX3Wn9XGLj0mLsxgkJQ8je6
	DGYVxuZFBAOTo4ovcyMMBFI+QhAjnteUdwhlo6aPZzIHaK9ZXIiQVdHF9TG4JHQj
	M7noSqsIizD7Z0GwNEL6MgeaRkR9+UqgxW22qQATv6gqI/67xjbYXm6gwgg2ueit
	Opa27w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5sn04u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 14:00:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9156dc90fdaso69511785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 07:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782136823; x=1782741623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7USYdDcnIwSaPcutTPXYOBMfqHeBI2HwN0WtO8AXvM=;
        b=a9CuYkb6QTiEUj9qTKkEBhAjGzfqfXLhZSds3uxOPf3zo0cXam6gHsAFR/XKnMmMNs
         S9q1ZnpwPA+0BUdmI55dY8wjZIlinhtCnnK29D7BqoQao2FbN3IipKuflkIfN7BjVori
         JLqsJEUCcO5r1Knuv0gcY2onGxvyiKTq5mhIPu6iqIEcE6GI9CFx0/RcJ4Jnt3jYYA1w
         8YUd/ue7SAlyckh888E71edBQKUXtPkw87lVey6gyXp7vK0BTZ17pDRcMxbly6+JGVJ+
         zm4Y5uGAPMjwHkTSZBvRfM4tA3g2pxequpIqwID8jtZrP+axkazu6vXa//ZK2fJjFUjQ
         O4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782136823; x=1782741623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7USYdDcnIwSaPcutTPXYOBMfqHeBI2HwN0WtO8AXvM=;
        b=ryX2XwyW1Hin2d1bAC9jBTlPcwWsoNKDukAVWQqAk5x+k+8DK1PRiR/+wa2FyxTeQw
         zc8Z2X3Z79sqQyRZrX2SZ+68BBOXBMpO7/6oE8F0Xe9AAoUBw4l/eLCZ0E7/sfZOsUWy
         9iv7gcSDYlgdzduyfzXxD7mfxRsLigJMbbU6cNsY6XY5hQi5kwVUDnVlcY5+55dpMSgJ
         Yc1JNg5ySbkzVWv/9joEjXoB1DBTBblTbXgnB+4UaT4CKlYR+oQuUtszaS021UElvlMr
         iBZVpIf2wqNBBag1w54R0JTueAheFkTJcA9kTsL1MLtSHIzN7VgOc4BNJyx7lyapbV6/
         +Kcg==
X-Forwarded-Encrypted: i=1; AFNElJ/EgDHkFJ65yS9bw8QzjMvlsqJRVqHurwSiRNUNIf1Wu+HMPQF3xG6OYkjKYLn7WxoiEPra8jywg4VlxFqn@vger.kernel.org
X-Gm-Message-State: AOJu0YxtwXrzPQ7G3wE1WraBqX6uRadbdFm8/xuoa0PgMMAyFpk/uGqA
	ukdtQoiYPc7bgajiPMTbabaLPBHUb5EHXc2u8lGo73YfjZ2XPF/oWygM5mik49VXYMK9arT6Fw9
	TKR5IigYggwHgcGeEDc/SIbQUk+0yHjZeRy7mdnw2ckVhEn5FvrOO3GUP8AOYrXaTJaMc
X-Gm-Gg: AfdE7ckchxq3/R+kgCn3XqdRdarIThekaVDvgpUK7BSCEk9BF4SMfU3kp9wLKFxLNYV
	7Hv0Guhc1vKlwuvHUMgX0d7K5mFViujUxqa3JgZROP+wCAVgQQNCFbGyfMWo+65pjFz7eewh1+b
	RiftKeHJSPSnfPEdi6fEAULm4myrgVjuDlEErKxIAElYjUrY9APcPK1cLY7LvJP9pRd88BhiGC3
	bHJvnHAjC2wMFTZjyf4Skl5+d4WpyQupNHnHX9DZau9b1/nxgIkxMSU136iEIoalHhTpO5Wu4Ij
	ziM8p+Nu8dwjxuQMN2y9YSTaeh1UlU3SBEoivgeJawgKxM8wy5hWBJzN0aNd/0tujT4f1DDuNeU
	uG7EUPgKo5DqyADnppNt8jgTX5c7sBkfwc+4=
X-Received: by 2002:a05:620a:19a9:b0:8cf:d953:b4ec with SMTP id af79cd13be357-925c8fc4599mr53174185a.3.1782136822940;
        Mon, 22 Jun 2026 07:00:22 -0700 (PDT)
X-Received: by 2002:a05:620a:19a9:b0:8cf:d953:b4ec with SMTP id af79cd13be357-925c8fc4599mr53163685a.3.1782136822247;
        Mon, 22 Jun 2026 07:00:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e4a14d4sm368028166b.7.2026.06.22.07.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 07:00:21 -0700 (PDT)
Message-ID: <62cfb2ec-f069-4012-88a1-8667d3f3e5e9@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 16:00:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: gcc-hawi: Add support for global clock
 controller on Maili
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
 <20260618-maili_initial_clock-v1-4-d6ede0352113@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-4-d6ede0352113@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wc1DVoWibzYiUJIoU41CU8deSKsYlVm2
X-Proofpoint-ORIG-GUID: wc1DVoWibzYiUJIoU41CU8deSKsYlVm2
X-Authority-Analysis: v=2.4 cv=PuKjqQM3 c=1 sm=1 tr=0 ts=6a393ff8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=uYmEc_XH6j7-nL-_3AgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfXwT3G7wm6LhRu
 KxV4ESEaYiyXPKb4A6onkcZDbPFgx5xscnvl5UMYZSvuLIsLlzoiPLaYTQprr5tZJco4yPArB8V
 JR+BtA59KcSPiAcq4/qQaL/sN6cjqDU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEzOSBTYWx0ZWRfX4gGnTuX1GcGM
 XQXLCOGzZTJxZvmhn1pa2mzrmJzBGFyvY6XXygZL8nSgD9GGTc6tY8+bnJvpDN/wkYvOuYjiWXn
 YMg59LbVrGtn7m5VGhrCSYlO2P/ojXVzFZRy0e6GWdIuyi4JsU2VPQN1IS+l2Rqagch8ILfCONf
 I2NQ4tLyxa/D1gvlLI874bbvAO0U8Kw8HBH6kvH6DBAwvI8O/aeWnvO/2bMkfmvmGwvnb52jMxy
 1DsAB00zi05HnMNCqwv9czmxgbr6vqG654See/xpq9Ypow9PhPHQKvjqAS6foQNZdVXmouHUGDE
 AnndCjTDZ8XF+OdbJRrioqudBTBuQMN2xYfnAMSwuU/4b3t7BUxNECLnVDS0L9RCztsXaqfQv7r
 ae1RVA/Z7dkAhqLCRzfSfuSyEdq+n9BkbKNl/aqfLJWK76oA9vRGJpNdgYtJSjL7TnFqAl5NKTg
 yBoAJO+yM5C5Y5Ph14g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114018-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BE2D36B020E

On 6/18/26 7:21 PM, Taniya Das wrote:
> Add support for the global clock controller (GCC) on the Qualcomm Maili
> SoC by extending the Hawi global clock controller since Maili is identical
> to Hawi and has few additional clocks.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

[...]

> @@ -3485,6 +3617,11 @@ static struct clk_regmap *gcc_hawi_clocks[] = {
>  	[GCC_USB3_PRIM_PHY_PIPE_CLK_SRC] = &gcc_usb3_prim_phy_pipe_clk_src.clkr,
>  	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
>  	[GCC_VIDEO_AXI0C_CLK] = &gcc_video_axi0c_clk.clkr,
> +	/*
> +	 * Maili-only clocks: NULL here to size the array to the highest Maili
> +	 * clock index.
> +	 */
> +	[GCC_QUPV3_WRAP_5_S_AHB_CLK] = NULL,

we have:

--- common.c
qcom_cc_really_probe():

...
cc->rclks = rclks; // desc->clks
cc->num_rclks = num_clks; // desc->num_clks
...

 -> devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);

and qcom_cc_clk_hw_get() has:

if (idx >= cc->num_rclks) {
	pr_err("%s: invalid index %u\n", __func__, idx);
	return ERR_PTR(-EINVAL);
}

so I think this should be unnecessary

Besides, is that new set of clocks actually unique to Maili, or
is it bound to a QSPI usecase on the specific QUP?

Konrad


