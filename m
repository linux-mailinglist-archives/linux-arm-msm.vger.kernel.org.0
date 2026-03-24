Return-Path: <linux-arm-msm+bounces-99582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE+0BshawmnQbwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:35:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85968305A94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB19A31331B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC6E3DD50F;
	Tue, 24 Mar 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="miTAbO30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtJRPrpr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86BA3DDDDA
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344175; cv=none; b=nd3cR84PMopNa1JItUmzsscE+vlsPqRcNw/rjrzugRSTY8P6/Tx2bewVxQwe+fAriPabkRuQv40wmMUCFWLHsoU4QIMyKQM57+NMUYNnzm//3uvn3Dn7dJyd1De9aE/wQ/8GEJwlINgG+Iy8W+hcg+aMdxCd3yKNWYlaNloeTiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344175; c=relaxed/simple;
	bh=kkRxfV6Ja099eNBNfyWQ+upuon9G/3oU9DqP9SCnCS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxHJ09c6/K1IfSq52iXhWKglcV2CxlAZccCIY+VkF8CbHdLnclM+ZrY6TGBPsQlJS/7szeO4qF7kFJBczR2LMmeMJM8xbtX4VHMvNkEUkj7XP4YFTg4BA1UNuWYovCvE9Wel6yoLDhGTWzj6OyUdf0GWTIOjzdBQu1Oyks/ek0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miTAbO30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtJRPrpr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3Vh1N4059272
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zP3x5XBqrk0612p+N9oFLfTLt7PEBP1H2mw/MtuC6Y=; b=miTAbO30QcsETKWX
	+yvT2JL2akDYogslAmmTFRm3Yxw/Bl+5ajKEYLE2HXPOf8H/jF97Ut2sVEuzY2EE
	ZlL6FC624ntyXgVa/LIFc6fb2wa9waafdFRZ7gBVVRKBUYwq2ykRR2lXRB14zdAW
	Ygz87KrIlJfyLYpscL0voZk1DmzAeY80X01ZaBnk/ITYOCeXwoTQ90lqWwjK2lU3
	DWYQrgwLU3AMSYBun1JwB3ipGbZP7smeEHqHQxoxMlRXAATt2JRTbzoTAErmo7EX
	l/1ivZJiTNXXpHuaICaA46EDad8ZhCzk19OiDWTGFEXsSauLqTw5yafgnn1c1wAr
	yPxLaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jsks66b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:22:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb39de5c54so415073385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774344159; x=1774948959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zP3x5XBqrk0612p+N9oFLfTLt7PEBP1H2mw/MtuC6Y=;
        b=YtJRPrpr/4hk7LBIy9AsjWFAy9CraKH+D9C5mLXrT0xTzj510mii9D6+r8FHN07h6v
         UkyLaEprPLo4/JzUvpOG1I71/xxynXCnaE58CUmPYDD8UtFstGvlnb1i6xDYLp4AbDsl
         qijRVTL0IoNw4Ztcyt3yMm/4f1958AP9Yu6dvOwzaOIFLcSp8aPdv0ulLo5o9SSP+kz1
         rnCMVS/caCEYY8oj67vJnBHup6RiuFqXF7i+Vp8aSYZUbSFnTGXKp1p2PE/CvAQtXQkr
         2N/Uwv6EH6W2JsdcxrkKpoPDGDvclwXpS6o3mjiUFypdwGTSI0mN40sjkrlGL4NkLCbA
         WpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344159; x=1774948959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zP3x5XBqrk0612p+N9oFLfTLt7PEBP1H2mw/MtuC6Y=;
        b=MEj9tc35/LE7mmgxrn7gPJTB6NP0m02MwBS47hYxy5PENp4EmaiGC6ekjQBHiRyqOK
         0AgjGHnaqGw5IkyHI3dhncEMa3PxDjlGuMU/YgBPVv5rySeA/9LyXwxO4BDxvyEuLVfS
         ufPj8GmGxoNsZ/CyOyMxMTLrVvAyRW5CtmmvjViHUV7WwiFbvbqyD+2fUkuIvbtzScl9
         Gh9yBpo4mdidjKgQZaXiZ3hGdK2Tn6tuTs0QWIKRNAH9dM49EH2tJjmS0ryxV8r4rYdz
         zZcSbAoBaV53EqlVmikgZgV+H+5yyAn7VolXSpmDcdUWKBVDzZBUOYEQi7FT8SKcnHxI
         qtvw==
X-Forwarded-Encrypted: i=1; AJvYcCVKIeMl793Pw3H1dAB/LCOnSLaAU8IRvauUB0aUAWNifQCEieYoVOhGZX4hGNAb/7BBkXujXTep2SZELnq9@vger.kernel.org
X-Gm-Message-State: AOJu0YzM2WVdBjH74JfqKeeL9rr4Wu6ozemdLyvjo499uCVFDFhQ12Ll
	9F1Bzqo2O46f49UzmStLRMsI8HzNMVYQTdhTNQ4CiFsIwuPgyeIyW+N87LVinuU8vYRIdVkYCHA
	8DaUnfpQZFWtTtKaiLPZ/H5hRyuCieej8m9fvQyMuYBlBroBm+E5CXzeTsDnbJOkE8NSif8Y2nF
	sQ
X-Gm-Gg: ATEYQzz5rhaPoBbZegMLl7PKzX5L+pZYDQGx8F/Oez4MGWCa5wZkYieqhVIasc8JJzk
	QZ00x/rYjf0n5nHvh82PLLH4IRpY7RR0arYqlJHj88c2mnn+qkEEXKJkMKQPXtqyipTJ8IJU+3M
	ID21QnLmVnEmjitm/0M6h+gtlg0/FyJut3rIMY2/TycWWgIpXXlHOZ9mlhgLt7TSsB+1icr+6Sz
	pbHbu3V5a2qWdBTAxB9pDxR/xH90qYnf635RknqcM1C0FcFx09GZJCcIaEpJeI5X0e0+BlYJ+L8
	pDvvuusLdA+vi0AWpXfa7PCPlpcwxkHbGZMRxJmbAyUU8gaQYr1f+2+ORRd+UlKdfSvxmkzf17v
	M5wJtpl3hXhaZ8yFrHiYTn2u3eYkqTt0Vx6UrwpQ3TMJi5EH6ZRrf2AWVxKiqHVHu5pMalDijwk
	OyZzs=
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr172348861cf.9.1774344159338;
        Tue, 24 Mar 2026 02:22:39 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr172348711cf.9.1774344158858;
        Tue, 24 Mar 2026 02:22:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398d82dsm611474866b.62.2026.03.24.02.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:22:37 -0700 (PDT)
Message-ID: <ca88ed26-51a8-42dd-9b1c-3266a107c180@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:22:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
 <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com>
 <vonorgmssumelw3nkgd335lzi3eekinlslqb24k5lqwzil3tyh@epcgwiiu3xqu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vonorgmssumelw3nkgd335lzi3eekinlslqb24k5lqwzil3tyh@epcgwiiu3xqu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NCBTYWx0ZWRfX1D3f8p8aIyVE
 7riy8yLvtbiPkVsFvOhQHDJXbnHtsJmVVeFWxD+29omG8xRxSN8FmD/OXkBJeAIe63is8D1FBQv
 aBKPoZeuXIP9MhbXdBoAeSYU4oMOVcsbMtkblBwEO90HbXcxBFalohQ+4QddYxZXGTJvgjqHLTq
 nGerUgLltDjrVOOSDp21cdlk1ycTSCWUzNrNmo9tt0s2RV60hEXhJqB7hZhZ0f9pA4eOIyaWg4b
 GPpFVMHhd62xWKJvhiR/txvm31E3TRy967Bkmpg7qGoOLJUzNEI1tpf3iLgvgUBL7KFMWHOV5Qz
 W8ZGhnxOAhpvsVteMWH+NXagI90IHTTvM2OtNtO8SHVxx9z5STQ6p5yKoMlgXYOkXiaossMKEMt
 qUy5uvGkI5y/FJyJcoYzBANTwdH9AQqhaBbjniyLr0U2zPQdWF/Py7HYWtTQo8zAtzOB8YEvYA7
 2OibHWnAtEwX+FbMI7g==
X-Proofpoint-GUID: oIHilDXGtxhj0Et2xWy5XC8DYAGmkIHO
X-Proofpoint-ORIG-GUID: oIHilDXGtxhj0Et2xWy5XC8DYAGmkIHO
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c257e0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=qC_FGOx9AAAA:8 a=eV-8nqNh-aYkQHMPB9UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,codelinaro.org:url];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99582-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85968305A94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 8:23 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 01:54:29PM +0100, Konrad Dybcio wrote:
>> On 3/21/26 10:50 AM, Pengyu Luo wrote:
>>> Recently, when testing 10-bit dsi C-PHY panel, clks are different
>>> from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
>>> now (dsiclk_sel = 0)) And we failed to set dsiclk's children.
>>>
>>> dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000
>>>
>>> byteclk was set first to 108120000, so the vco rate was set to
>>> 108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
>>> 172992000 on mdss_pixel_clk_src later.
>>>
>>> Since there was no matched ratio, we failed to set it. And dsiclk
>>> divider ratio was set to 15:1 (wrong cached register value 0xf and
>>> didn't update), we finally got 50455997, apparently wrong.
>>>
>>>   dsi0vco_clk                1       1        0        756839941
>>>      dsi0_pll_out_div_clk    1       1        0        756839941
>>>         dsi0_pll_post_out_div_clk 0       0        0        216239983
>>>         dsi0_pll_bit_clk     2       2        0        756839941
>>>            dsi0_phy_pll_out_dsiclk 2       2        0        50455997
>>>               disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
>>>            dsi0_pll_by_2_bit_clk 0       0        0        378419970
>>>            dsi0_phy_pll_out_byteclk 2       2        0        108119991
>>>               disp_cc_mdss_byte1_clk_src 2       2        0        108119991
>>>
>>> Downstream clk_summary shows the mdss_pixel_clk_src support the
>>> ratio(35:16)
>>>
>>>  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
>>>      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
>>>  dsi0_phy_pll_out_byteclk            2       2        0        108120000
>>>      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
>>>
>>> After checking downstream source, 15:4 also seems to be supported,
>>> add them two.
>>
>> I don't see that, not even in the newest releases.. Is there even a reason
>> we have to list these divider pairs in the first place?
> 
> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/f7aec4359448d25c8a8d21ad8e8733d61f6b69ab

Ahh branching..

> We need those dividers to correctly program pclk RCG2 clocks.

I would assume that's the case, but perhaps the real answer is "because we
don't want to try all possible combinations"

Konrad

