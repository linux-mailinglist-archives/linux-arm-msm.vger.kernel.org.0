Return-Path: <linux-arm-msm+bounces-99245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN5BCrg4wWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:57:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 927162F2541
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA4F13012C9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45F93A961E;
	Mon, 23 Mar 2026 12:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvjGpNCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUxqTapg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15A93A4F51
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270475; cv=none; b=LZvl2WzAiM4NYutMXnIMEUaso+HEbQUFGwZEu7BFizJ9Fi+jQsd9y2DPosip2J3Wgw/l2vvDXgLRSfi2n/CagOyHfjaoTQjayNHGq9YVv7pkUDGgUMpn3y7K/HHOjOKsYcACMImvMPkIFHNdBCNr8d3X32TQ062vyeAFc/XcHqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270475; c=relaxed/simple;
	bh=42Bi2Tiolyl0DNGLiZgnp2ZLiezpRkGGA1VfOAw5hgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rL+nrm7EVsSr/ilfI6AQzuN97VPKxjcDzdzeMKn0sZKGQmuOFOGHe+v4jqGxPC56MqjuR2KzK3mZm4qYPVAAQhLQvgot/56L0aIuFhBvFNjbiC9+ik1bUnUGlrCHiTM1ToAFVBcMuyZCXrKOAgGWGm42oMuX3LsWMf1XYdmt0E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nvjGpNCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUxqTapg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N83sK11364318
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PDi7dYPMM8oIqhQZ36mNWkJLjpIhXHLBK1wB8peKIA4=; b=nvjGpNCy1ai55xOV
	BB0ocrah0SNK4BDdwrY1l/0TPzFfXWgp3jbP6eiqSwoHR7lwGxbb8lbj9OdnkXN5
	OX8bDJguiNYdAtH9DSnIGeU3XDhRub/5vluf1qnoml/vbqwluIC2dQanlEoQmE4+
	VZCowHnaF7JxcYr28NkH/NbHjIvMpnc6M45FWvRCe/z1f5e35GZta84a0YbDKvVY
	1OwQ0v7T/pn+dnSnt9wixRekbKlCCcVmo4DSikvJignq0amRzD0FoTlYwKshnESM
	/yu0lVGPU1UiilG4xiOX7f9ng02XWelzYMcdDXOUsA1Vr7cR7NsSGJNrc04gt4dV
	DBsabQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p790t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:54:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b317c4041so27598641cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270473; x=1774875273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PDi7dYPMM8oIqhQZ36mNWkJLjpIhXHLBK1wB8peKIA4=;
        b=eUxqTapgl5GZkx4E/29L2eIl2W2bgSV9c0ue6HNg1EbNddy9ZWrPSO8xSEQUHPsNtn
         GqH/JBg/A0BVLmcGXG3hHtgVzixrrSGJ6yBFLSmokeAAHZjgm2d37QtLBLIrYjyTmIQz
         HS83G+qia+jnb+yXtaaIZBxiQk16gkheJXJeJNSA1nKJzPdQXgxOOigmVkmXVHafCg62
         gKVf1wUnb3THmOU055iYoksJQSTlG9JNXVqn+4p8k62kqzUcBQfCOx5kO/f1NZB0T0WC
         5/wfCYulod5XMoAsr6e6p2OAQUghDf+3ouC623RvMJofAQeXikdyyFEp69gN7wu6x1ce
         SYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270473; x=1774875273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDi7dYPMM8oIqhQZ36mNWkJLjpIhXHLBK1wB8peKIA4=;
        b=VMa1KWP6hAyOOLH98UGAx3tUXdo0Gm/VWbTWmZSXyxwsuerhOmDHjIRS815KdD2VBb
         cbuTcxxDDHFCCw5KHsFL7WHNSEox1sdDqUuUODke7QkdtLpq19ZLPrkCPWEUok7k+/tz
         SmkPrxa4tCeF9FvFqo9JvxoS/amiAlKJvUcQ2eS1OJI7JQMxkxivoj7f52fXUwUAg7jq
         0R3dVp9Bb2ggpleXHgwBkKCfT1e5ZTBdEGjgmfW6TjTr4sP9qPA9pmJL79smQIgWoDcc
         udlXpH6fW0TgCAXW5WTtA3xvBdPPu2DGM4sMfZiFj1SsVI27EQvOoK+YQLraQVsxFyiz
         ti4g==
X-Gm-Message-State: AOJu0YzLFb7GhvubtEtogC2DldtNqqszIVlxoZPOUQmbLD+Py3uOGOgU
	d/ONGu9/zFhVt+9Gi5cYjPpS1ByUKIiVER3t9wIpBlGmzdLY/vGcPeDk4Xqpc5h1Df6szCzcJ0e
	i8JaiBgzW9HyG2ty6Dy8I7oNW6JU90MNoKeze/538M82SqBk24zZmfnQUozUuKrXyCMIG
X-Gm-Gg: ATEYQzxIgjg5V5Y/DN6i7hlbICHcdbX/AzgsR9lyrgiMul6ZblAs/9o+YohFT5CEXZz
	/dwgYZSKzvs+EfmqtWvwaboyX/5v6r0k+srsEUTvxosBee9iaDjktSu+WpHlpSPY4S1PogeIQGB
	U0shjjEwMB+QocDi0tA/VkIepluNUCG1mkLmSjNNYRhIFNR8WukVbT6OnIhDIYvEYYhHqlTe0W6
	9XZ/fqS2QYDb9MYCtWyYyPQdIv63KX6oSVX/OJEPzNkckGDZVYQi5uFTMM6E5UwRxs2WkrP+SMr
	e5b56A+VJp9zn3X65PfGj+KWy1675cmr5HcRT93HjLJaOnNFGxoMBVhnwsUyPLD1+1akpyURl++
	5P/3JLD2Fnirrdj5FX5AFlYOOtOz8QAcxChNKxs5A/hrPVC9/08xDZ+Yjy1lGCVqSrLT6+3LR+6
	3v7Tc=
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr136605771cf.9.1774270472882;
        Mon, 23 Mar 2026 05:54:32 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr136605451cf.9.1774270472186;
        Mon, 23 Mar 2026 05:54:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de0b2sm492167866b.34.2026.03.23.05.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:54:31 -0700 (PDT)
Message-ID: <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:54:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c13809 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=sfQP4rS8fwbn5X_sSroA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: h0gqCYMhFetJP5B4GQtw48OS271EcQ2y
X-Proofpoint-GUID: h0gqCYMhFetJP5B4GQtw48OS271EcQ2y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX2fEzoyEKPYTB
 OKfc9KcGnMFc7xtvnz9SobY3e0iWPA+A40x7q8eMXQrDCJ0HcXdwMU+rKqzH5cFBSF+7AO/BHDM
 G1/ivN0tlO/zJcxK+/gfRj3fga/CQCl96KWl16c9l2gmyHawab8LJrBRgEErSp3xJeCn17OAroe
 uv1xj4lvgI3CV9cxcV+Mu9zj6N/vDQrk39z8BMGKi7IQkw3eH0Tseju9BAsHlVidQ1QUpwo3vU4
 q1+ZH2ukOvAjrO7UFszwnMkjL9F7a44OT98GQ2IcSg7dcJkm+l68UdjopaVcyq9yMeuo2hm0jnT
 U4GqekSRDVQL18FrF3oW7Mxi1fYx7peAt3ewQezRJUsSZz/IvSQfV76bHCBFgjuNjSYL14Zk11S
 1I0idmnFNNzC58VadJcSVBh0flMbSdqk3gltd5Kir3N1riNE5uXGBqfxt68IdhNJVg7HeJTtiBa
 XInequ8bzoJDnZHkMPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99245-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 927162F2541
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/21/26 10:50 AM, Pengyu Luo wrote:
> Recently, when testing 10-bit dsi C-PHY panel, clks are different
> from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
> now (dsiclk_sel = 0)) And we failed to set dsiclk's children.
> 
> dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000
> 
> byteclk was set first to 108120000, so the vco rate was set to
> 108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
> 172992000 on mdss_pixel_clk_src later.
> 
> Since there was no matched ratio, we failed to set it. And dsiclk
> divider ratio was set to 15:1 (wrong cached register value 0xf and
> didn't update), we finally got 50455997, apparently wrong.
> 
>   dsi0vco_clk                1       1        0        756839941
>      dsi0_pll_out_div_clk    1       1        0        756839941
>         dsi0_pll_post_out_div_clk 0       0        0        216239983
>         dsi0_pll_bit_clk     2       2        0        756839941
>            dsi0_phy_pll_out_dsiclk 2       2        0        50455997
>               disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
>            dsi0_pll_by_2_bit_clk 0       0        0        378419970
>            dsi0_phy_pll_out_byteclk 2       2        0        108119991
>               disp_cc_mdss_byte1_clk_src 2       2        0        108119991
> 
> Downstream clk_summary shows the mdss_pixel_clk_src support the
> ratio(35:16)
> 
>  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
>      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
>  dsi0_phy_pll_out_byteclk            2       2        0        108120000
>      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
> 
> After checking downstream source, 15:4 also seems to be supported,
> add them two.

I don't see that, not even in the newest releases.. Is there even a reason
we have to list these divider pairs in the first place?

Konrad

