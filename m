Return-Path: <linux-arm-msm+bounces-99094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P1TOqTAwGmfKgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 05:25:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CBF2EC6D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 05:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D84DE300DF5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 04:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F41D29E0FD;
	Mon, 23 Mar 2026 04:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uvpz+XbS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRvnotX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F284229C327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774239897; cv=none; b=kp1YX8ShnABy7ZwIlqZ1+pRaUNa1Y62zIdAtlIMtZYse8S0bjPE6TB30NC+KaflrBRr15DQZ8eEz2gXewQLn/IFgYZgze+Dqgz7B5QRZ/Y25I0idCB6zbrPXGNmivT+l6eBHqkOS+jagfCWofQdWD0hRxulxWfskYoSa3BzDCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774239897; c=relaxed/simple;
	bh=sStt4KH26WfiPlJ8xKUxjjO/or5H8BrxBwHyGMcoceU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TrX795QPeo6EXHbUJWvuI+4gHReFHCi1TkRvv9rXUBaLKGC9GO318t9sLEaU6t/U2fSEgc7a4i5svbpPkY75/T+Lj0GyneqqsFpxRGV8boEDL6eQhM4+234k5D5utkFWbKRZUgL6v4XUQVvqVihf3AgG0eF6PgomF8qj/CBRMJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uvpz+XbS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRvnotX9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MDtaoV3292715
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=; b=Uvpz+XbSeYJnlE6C
	g/sZez5/t3XbfjiuJ+OyHMSVS7uRdSZjq6PO5GF1lrTnWYG2ybEpr1Dg2AEifJTt
	9e0aJaYMmgAnlz9S13QeTmtzcUtguc7BB8nFDU4snHX67qTmfh4mFvt5CKvRrUZL
	YjRBGrc9CT79luTbV0jTDgnEau9Aiou2z0dAXJbS5sFLknmMS00kJUQUzg48nJ12
	EYiurYrMjMzlv+44pho5Amvl+FYC6TZEgkFkmQsizcs0JzGC+jjF6/h3p33eKZvR
	7a82C6vOLSkV+BukwuyFlXIDPGe+kKaUFUvz1tuyMuZnAEMzKtgCOC5EL54tTsf6
	NsQQsQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1gpk3vnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:24:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0601ff3d9so52515455ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 21:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774239894; x=1774844694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=;
        b=KRvnotX9DGayzrsXcySxJLaC5bxBU79QzbnGM5lKgdtu7XlfwgRGAMWeCRaunRvvln
         m9rTNQZqWfNWJRgDnKqDNQf7sRbXbRKcEdDKJ//d7Jj0JmeOsHUAwNtNacKotesUOb8m
         fnqh3hTGAcuSwcHT3ItGJNSIV/2qQASn+YybnEJTF3cgQP3h6kjbyTlHQvzGucmx+jb8
         Ps91pqln3RX3H+VU4W3M7rnrdRH8ki0v8gXTCUOnOUicDDyu9XiOVJduyNUjH/CdL+17
         RhBJMu7oqOfaY6XZAW1fHQBHcoRjz/K7DI3ianHU1pZXl2ZvnkteopvCKnfxE+eJhpNP
         ZS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774239894; x=1774844694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRRVKNDXEQsGrhprFUNiXI2k4AxAlepHlKddZZm9Hv0=;
        b=YTVPLgatfj489cfkoTi89BnU9uVL2PvqpQWqTh6DD7Mkio332/x5vJFmrHcIdnCPrS
         prls2RaYeJyoEpm5qrRwZlaiZ9WA4Lhe9pIJqvj+fa/ZkJalVoUm24qroH34rpb1T4O0
         UDNQlMP+Mb1xYcY953tSNTM/+JbiB84XH2rePe4Ab8cJwqK7r9c4Muw/LlBswHZYTKDe
         1qJii4i1WcQQuOJ6ZpmAEJto7nMyC7SZptwVdfD6EhoisA9/4y5KTf+iZKiOQ6iNNT0y
         YZZrKlPUVP1vYe5I+ckVmEujd2OE9Ni4PlDq7xqXVqxdFh28XaN570Z/zpCk5kslhImg
         WmMQ==
X-Gm-Message-State: AOJu0YwMQNCKHrg1qApe6g0X4QVsePApjbqPeQsjxbN7cuFzQ6H75rwx
	ecQhgcHVjPOtrNEXnb5mrZu5WtkR5/ypgbY3yRmPokyJQmGJG/sLBdzcHAAS6Ad9G2fC3/74VhV
	2nEf+KmDhn9xmo5Pxjrzqhks+2qhv1D1vNintGj8dlSVoYFlaLLIREwxNY2uy2b8g+G+V
X-Gm-Gg: ATEYQzwCO5Bwj/LckekLJ27f8th0GUVpobUnALsMrufUxyTAO5AWow6b3i/nz3ONIEf
	YRXC1SGTr8tfzOvZ0IML6elQcgadbZlkFpAP5ZtYm7/8IJXcWxUa86fJCL0i3tNCLS2C6ffCv/G
	Hp/dYYnlFupGJMY8bAy8izbsGwTVmvEHh/DmQEceBEkA4EtnL0x04D/O9C6EGZl3u9CdQWWOFNG
	9Tkg3ud4C4uK3/EPi6rzZB20BhMzSoVLklGc/60Qt4VkdB7iMIH3vCEzS4Vj5zO8jgEvZgvMkZO
	9knUIQCadg9/M/9rAF9k7fwLDURq1D+X3L6PKNMNsyTenD5Dw5xBVCjFE4EhQIg5vVwGEJjGJcj
	v4LVeydKbLCQtYgn3HWo+1OC3LDtBJmNd/jP+gPG0bRl4US+Wfw==
X-Received: by 2002:a17:903:124f:b0:2ad:cede:3a1a with SMTP id d9443c01a7336-2b0827b3f6dmr111605655ad.39.1774239893821;
        Sun, 22 Mar 2026 21:24:53 -0700 (PDT)
X-Received: by 2002:a17:903:124f:b0:2ad:cede:3a1a with SMTP id d9443c01a7336-2b0827b3f6dmr111605455ad.39.1774239893344;
        Sun, 22 Mar 2026 21:24:53 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ab1sm120016865ad.5.2026.03.22.21.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 21:24:53 -0700 (PDT)
Message-ID: <100b51e4-b6d5-4d17-8721-b2ea1ee747e0@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 09:54:49 +0530
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
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8Yk30GCGrK9xkidcaGxYGXRJyvStRcwO
X-Proofpoint-GUID: 8Yk30GCGrK9xkidcaGxYGXRJyvStRcwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAzMCBTYWx0ZWRfX0CD6MotwSdn8
 CD7jDx4IWfAE4LNldMXToPvWJxqfcUU+zYVNZZOVa2o2jXOcnAp1VZEfcO1OPodTTGyV6Xt8Itr
 FDj1FzamTav2DoK/dD4hILBGoaruVRJk2oWKHelOtPkHOCfBbfj6JGU9gY8OCA1lGSbQjlRKqZ6
 od30tpJEQLxxCXY6lLjyMVHPUFFC5j4E5YM8nlGUhrfYataCzJv2ly5rN9g7J0BCsa08SMY6DzS
 6PBEBjJCL9GSVnk1Ttkj0HxsS6cofdKhlR0+dKvxo/4MxvTa/nIKitR1hiGXtD4JBjfwq12+OO0
 C1bAT6qpNxIvtkfjJcKQduQwVwcyMMSCzi71MW8jFiLbAlDpFrSF2XG0TiJ1JCVhhm2xHmMhQ5C
 mqrpE4xHjMGus5lNkUymIK6v9cMQPUwHzkEeZM6hCnPkKuLIAP3MlSTXWB1BA/GvS4/4oL5gpDI
 aosDzIRq+kR7UlgJ6sQ==
X-Authority-Analysis: v=2.4 cv=QKhlhwLL c=1 sm=1 tr=0 ts=69c0c096 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=XrWBrngNrbSfp6LsIOQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230030
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99094-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,baylibre.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 56CBF2EC6D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/21/2026 3:20 PM, Pengyu Luo wrote:
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
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index fc696b66cc..6064a0e17d 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1117,6 +1117,8 @@ static const struct frac_entry frac_table_pixel[] = {
>  	{ 4, 9 },
>  	{ 1, 1 },
>  	{ 2, 3 },
> +	{ 16, 35},
> +	{ 4, 15},
>  	{ }
>  };
>  

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
-- 
Thanks,
Taniya Das


