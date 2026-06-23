Return-Path: <linux-arm-msm+bounces-114238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m2qoHlirOmreDAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:50:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A36B8718
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 17:50:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OD3Wuu9R;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PtjLiWUc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114238-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114238-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E24E306F518
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560072F8EBF;
	Tue, 23 Jun 2026 15:50:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A232EEE78
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:50:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229826; cv=none; b=esFrtGmFERjnHce/lukig7OpTzvFyeOPVvShL9WAgpFIBFhHfINJgHQri0o8EbFfIenDggwiprzpdTZbwu0pvcEk5/ea6AKbvxiW522uiK+QLbkmNXlnZdHh6r05GxuUqIEgcb63JPk69vP4mMlswYnRz5ME5dzI/07kkjveIwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229826; c=relaxed/simple;
	bh=q7Jc1YY3GrhcgpyOUs/OqzKf0RPP3KjpisQthhPq/3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ou7P1gSQztoR+S+pyCbJJhU3P66gP5SQJYr1JjSai1F/c9woVLvOUcmcdCQBrSUbU6T31yXtXdkQdQwbvSZ9+ATL0kNxf63e/p97kC8A2cWlh5UAyH9ZVMkPba/fVcM/Bupj+zeKik8l8JIEfhMZfPQkOE4K3LK/XUIP7vIFu+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OD3Wuu9R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtjLiWUc; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBXsCh3753699
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ym3P2gofeeAjlRIrGWhUFZ53iCiesVQBX5oel0MUm0k=; b=OD3Wuu9RehYOeWG5
	bVAJExNQBqYVK7WKimu8zDrs5acO+dqSR484E7mTf83B8QfCuu++cnDHuiQb137h
	slxiyjceb0ZgqgSIJQ78vIBLFEpaRHEirTsX/jJONZeLMprlV1U3MfgpuEkHG9KC
	0RJMz8uYKLADBxv2DRtBC9y44X002FiqsSEWe/kaAyUJLVyH9N0ayIl2WbAf+UXO
	7OtcvSiU70021CbFo+IAp+kcj6pLAG15QSBPTJ0/Xu/eeBSFGsGy8ght9iGJhKFa
	6WrpZS81aFmwFl1jqRmxjuoQ7uVLL8T8A8Ohj2otvR9pSDCMUk7aguiw3RBBoKAg
	Tpx0Ow==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29j1qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 15:50:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8dd70b510a3so185986d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 08:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782229823; x=1782834623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ym3P2gofeeAjlRIrGWhUFZ53iCiesVQBX5oel0MUm0k=;
        b=PtjLiWUcap99AMdj0FklGyHJy8koBU6m1ulHOVxQOB1dxlcPU0F3xAttejIiTu3ttr
         xujSaxB9Jv21Xlxpdm/AzHPC3YcZXIqZgMzvUo82VTteEsAFlZeVL2G8GB9E8VKkBVlt
         pUnHgr7Inm/GY0FiQLqus7bYYliPc0T4Yzx1hIWQj9qL0D4IJRiuwuezf+ocZH4WBLaz
         FIgwbYz+Toc1xeWZEey5Xvv1uD7qORJE5xein4Mk5JRMwAjBCGoqjxUzEAnquNuYNm8P
         bmi/8guy9TlW0Ge005M+2iSmzJL3oYvyGoPk/BCWxAkuXQyloTi9TIfU4UXbkWjPs24X
         AD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229823; x=1782834623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ym3P2gofeeAjlRIrGWhUFZ53iCiesVQBX5oel0MUm0k=;
        b=NZPcBYs4xReYkw5J8IxLvT2K9pYCABiBm1797YRKH4pGrul+ClaORpCIVbRYvYJBVV
         STybsR/R6+oiUsxKs5O5QWumDergI6qDOCOBFql7FdO2pgVHCcDH/YTcU7OZNkwQB0Jt
         RXvaT9mRyq1hWdR7Hj42bEVvd93keavlV+0uKa5d7KMyx3jOEwgox16etNaY5kVi500D
         83oyXfds+PkVu3o69HngMvDgSOtR+T2AK9F+9zYAQWyA1aalxCfk0qXDjFCTIqM0XM0w
         sgSPIoA1QDJHMjwExgEr6KyTCbHcg9WTDNT01gwO8lSfcd1cFAJ+5AguynLxlUVxqsIz
         xYdw==
X-Gm-Message-State: AOJu0YyaiuF/RCYV3J4bkyp0yTwAgfIhLgIJ/XFvMJY0JOqcyNgrdc6F
	d6gaGnJA1vqphTkHcUrin5NrwElBjcfYPZwAoriWr26r6zP3UTyyhirMJ+APCFoC9Bwuu+9H/BM
	XBY9qfIpEWv87gOOM/VZFpx76cXy35QMDKRYsXUyHKpA0D2vKvtK9JyQbhTtaHnwXXPrHJ4cCu8
	JQ
X-Gm-Gg: AfdE7ckbg2OnIzyhkiH6DG1ak+27O1IZ4ArMo6+fyMrF8DM3KDSu2ibxgeEVeDtc2eX
	aqLRuchaSx6zq1JWnUacTeazDJExunnYZdwcltbeus0xPESlmdXBEbdvvg+ZGyFaXDVN9Xulbuj
	gipqeF3W0CBuNLwLnaDTNux8ktciYmZrH7CWWF3qsTRXSFBGwiKD7JJCy0pjf4TDd+18xaL683t
	tYQ5rbeqT28p1et8Y6OMci0UMwHiqY9zaAWNIbDDLkxBQXNJ8PJXaF+U8jKkZf0PR8/MGdBZICx
	T7IPy27g9hiV7aj2XDNVXWGvPvu8nZciwwdzw+zdXO12q3QKG1qLWozOg9Za5pipd5epriUhewF
	XdiR1rGwvsPO1CN/zOGm/TJ46QG6RKyY1DSA=
X-Received: by 2002:ac8:7e8a:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51a4f4d4c47mr51048441cf.6.1782229822775;
        Tue, 23 Jun 2026 08:50:22 -0700 (PDT)
X-Received: by 2002:ac8:7e8a:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-51a4f4d4c47mr51047741cf.6.1782229822025;
        Tue, 23 Jun 2026 08:50:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697ee52f216sm32857a12.3.2026.06.23.08.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 08:50:21 -0700 (PDT)
Message-ID: <65873506-1a9a-40ec-ac67-60f61a0b4b4c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:50:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3aab3f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=1aW_qPit1WSy-zhaZFYA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: zDFhJNxxwLhm3lzZQHqHKbnJUwVsN6jJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEzMCBTYWx0ZWRfXzliSWLXwK8sK
 +xmqIWm/NK0907LPSxTkn8atrQ/JyHJymhOioA2DVhW6jf8A8o5o4Arz65GvvXB7LrkjEq0CIbP
 j1/uPXRHXILlBrQ5v4eOnxIZ0kgPn7k=
X-Proofpoint-ORIG-GUID: zDFhJNxxwLhm3lzZQHqHKbnJUwVsN6jJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEzMCBTYWx0ZWRfX7unzdlH4HpSo
 NcsQdHQP01dsaYuoQlcmMe7wNo+067MLaQxTvRfS2HyMN9bxfEvDgFEkSxe+7V596bTY6fMfPQA
 0d/pEetr6Fb9Ocg2GykHu1kf89WSYQOFpkDeHmrcBe8BlfPzCMT/10vL8t6iN6lN+KqQUeVhN5s
 jv8ZoqvXO8QDAsq+Ko5nQPJf4caZpcyWK/hnIh6VPYOJwN2ANN7YLMdeZLPOs9c0pz4R2hztj74
 H2xTKG4P4rRUUsPB8wbJJgUbSMV0IL2vNIXyHC8jtQd4vyp5DDcI+SI/T/NWUcvsUIBOozDjcmm
 aUbFrQUkTsBGzFtg0mgYIsibs9xrcxV5HAGFdAS//BJnrGsHwIzO3O5uKl70Tf6fiyhq0WD81Yw
 iDYMwsZXG8byzgl8FHS5N5mHPgvN1RWYJoFfma2BbBoHElznf5l2KI5a3kei5zoJ6aY8qpFmo30
 6tdKiwyBRE5PVo/U8OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230130
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
	TAGGED_FROM(0.00)[bounces-114238-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,proton.me:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:esteuwu@proton.me,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 202A36B8718

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> Both of these changes allow the framebuffer to show upon boot and let
> the mdss driver take over afterwards.
> Before, none of these actions were possible. Only mdss takeover was
> possible, but screen had to be turned off first.
> 
> OLE configuration may have been a misinterpretation... that's not
> something that's done on the downstream driver.
> 
> Changing disp_cc_mdss_mdp_clk_src from clk_rcg2_shared_ops to
> clk_rcg2_shared_no_init_park_ops fixes this warning as well:

[...]

>  drivers/clk/qcom/dispcc-sm8450.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
> index 2e91332dd92a..b99d3eb5e195 100644
> --- a/drivers/clk/qcom/dispcc-sm8450.c
> +++ b/drivers/clk/qcom/dispcc-sm8450.c
> @@ -614,7 +614,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
>  		.parent_data = disp_cc_parent_data_5,
>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_shared_ops,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
>  	},
>  };
>  
> @@ -1824,8 +1824,8 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
>  		disp_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
>  		disp_cc_pll1.clkr.hw.init = &sm8475_disp_cc_pll1_init;
>  
> -		clk_lucid_ole_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
> -		clk_lucid_ole_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
> +		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &sm8475_disp_cc_pll0_config);
> +		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &sm8475_disp_cc_pll1_config);
>  	} else {
>  		clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>  		clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);

This can also be fixed by migrating to use qcom_cc_driver_data,
which takes a list of alpha PLLs to be configured, and thenthere's
a switch-statement in clk-alpha-pll.c that always assigns the 
correct function

Konrad

