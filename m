Return-Path: <linux-arm-msm+bounces-99037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bXHrE8QRv2lXswMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 22:46:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC682E757E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 22:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1080D300BCB0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 21:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978331FDA61;
	Sat, 21 Mar 2026 21:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJA9isfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bvQ2l1zc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2DF1A6807
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774129601; cv=none; b=ZRdJFq75wV0LYu62b3iNXJ03PHiSVa8Jox4DeYoUqPX1a2WoNbyKe+bFQlcEREzp8dtqa0UJqPorSRYwfTI+uROmurjh/TconXLpJTYjuWUcc5Q93qbI8CCK+Ykhlinv+vjUIIXjmqUmCt7KfdJUu2zhMKhWqP/WflNDoa1os9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774129601; c=relaxed/simple;
	bh=LEFMguF+qG5N8F642XdSIeqCsB3bL6blBnSbKzP0fUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LruYERaoT7gD1cNOExF7rqzTJQhGYmMrF6iPCkwneUClafbgsSte4g6n6sYm/7StR/oaMnC3DE6QLb//dDWKAsREFqnM24zNdpsf1Jzo8uXOSTb5AcostiVq2+SfNg0Xr9SZQT9Gxob0n/PvzHEkWq3m8WNWhBKYTlxsyymzqcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJA9isfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bvQ2l1zc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62LEWHvZ788056
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 21:46:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O2W/D1As9V+GAyDQuSk8no56
	Cq6Ur63o9kQfhxnl+R8=; b=BJA9isfhEDfagRUBrY/c4MMRsoUQGYzpHL7sUjw8
	wjOLAOSGdr6Ue140rmQKDgh6P0qqV19vosewDRVbzRxPjZpTgG5WgD26vMyIAimJ
	FuEdvB3GXLx7fXuOwUCd2PjjznHd4yJammoCRcU4fwERDGHgDNYLdfKkTg6rgIbC
	l0oZ3KySIlk1HlhjtLrLcMgLnkccQjFTgEj/JNZS8Ibp8yAroNt7Urt4qJM1Ccg6
	O6aPsP8E4QgXgX3G+M+aejGxwlcZS6Pisi7fctbCuO6c+RJJbTxIfXC3FvTJOSUe
	QlP9W8Whukvc63S1BfQc8xoRQe38xDJgozFmnY4RvWlO9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kj1haq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 21:46:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509070bda13so227613251cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Mar 2026 14:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774129599; x=1774734399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O2W/D1As9V+GAyDQuSk8no56Cq6Ur63o9kQfhxnl+R8=;
        b=bvQ2l1zcnbBO5knM1sgoRrH8JHrLdVG1HIF96bjymWSQvMm+0ctZpZxuiXoBWS2rI5
         namfWAfrs4fYwavq/IoxgU/iR0oYoMTgt5zEw2/tmbMzp5hpkj1FIDAut4iqJR2NIamg
         yO/iqK+MwwjB3ba24T36UG4GUKof9UXon/OF+mpiM/wJMGsQ3TOOAbyEHJhPUx9LZRQ5
         IMfyRcv6a657nx4mgpZGBHt76yBn8AZZLQG3ACtcGMpLt7ZxVC/9FFBA/BqMmp/1CynU
         Y+N5CbniIs1yw0quRbgzBvXqlzi4QB4BeZRluiOedgzkaCdyCDZ1+a38AligcQaNPbJh
         9KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774129599; x=1774734399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O2W/D1As9V+GAyDQuSk8no56Cq6Ur63o9kQfhxnl+R8=;
        b=i0CBYZUYm3O+JlwUXwjso+Mpx+OPiYHM1MwkRL+I7Q05PuCU9Tg42oT1fyHfH7OEjO
         I/KDTk+MS6kCBMHW3OiwgwgPKL9h941K22qfroSCiPd1D61Br5evLQWayfJ8rGCKoEwp
         P4Yiha6gFTyQZnOAaioIVlPmYerrPs0GjzVm3OAQhIz54iJCCvrcojOyJUdnHPaInxnb
         vwrcf1TISJOXIGNvzQpyBHSNUNHNa9NQmxmzmp6GYs6DLHBLRRl14j5OPa/ZmIVVBzkG
         IEy4TOdHscC0Xe92Si6CGvjnKUze39iElPgcNpd6xlB4ktJzXs2+D325hR7S2LLN3/uq
         URlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpiSzR44pQtEcXG0Tn5TkvDNfJCkZhZz4celwvAFPP5AgPJbHF5a0SehAoWChzCV2IaCeOEz9eRmzej2tB@vger.kernel.org
X-Gm-Message-State: AOJu0YzrATXqMm6ZUzRb2Hsqi+TIWrveGjbLTjT1VbQpBp+rNkSTKx2U
	GcBtZtbL94oisFQB2PWHzqXANjWov68LLbIjMLdk7NXJh/tEogkx1jOffOazK3tSYkEP89n7tfH
	Kng611kRG+g8X6VoJAZRGt3mIJETu9CWRJ84MJ+m+Shd3VDqQ2lRMh2UjTH1KUvvZ3Ktp
X-Gm-Gg: ATEYQzykw9snKwg0WDcc4mPwoGtPmqwS7AzsSUEdhQq3T6G6DTAHt6wxSaDOKJd0I8T
	3I4qWGOnWi6OIpDEzIlodsaJS8rh+8nmqndAoP/jkMnQv7VuR1i/SoJ8sZgcrFKmACaruAvQlfL
	92u1WHGfXPd3zjhkI53aXmGgXzCciUDNjATTyrP5JgUvWNdxvOjqsc2+B8D7W9x7X64E4Lh97/m
	k2d5VRLocpVwUq4oeKpkALTm305X1G8w8ZgiycDSlglqpCvyiC320xY9ELAwbm/6Oqnfh1hKoKP
	tZtalm5ckruRsUH10Ych4/cEx4kxzFl11CRraxhtliZQwJpZeimbcMJcC5whftf47tBLGZqPbGy
	4W+JfSc7imeG14w5evS53cWccGYDtUMSQMlBmJVujMvQYMIW3HOz5EVgaKdvPJHi0w8j2RDyVGI
	NSm7klwPNDYfyXV2PtDhqY1deW/liLd+idNgQ=
X-Received: by 2002:a05:622a:4acb:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50b292d9b47mr142255461cf.42.1774129598605;
        Sat, 21 Mar 2026 14:46:38 -0700 (PDT)
X-Received: by 2002:a05:622a:4acb:b0:50b:292d:94e3 with SMTP id d75a77b69052e-50b292d9b47mr142255301cf.42.1774129598156;
        Sat, 21 Mar 2026 14:46:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm14278441fa.19.2026.03.21.14.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 14:46:35 -0700 (PDT)
Date: Sat, 21 Mar 2026 23:46:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
Message-ID: <sptw3chzws7hxfp5lsn56cy7onl67pewjh3psi5kvvfttotq5d@o6edngztk5jy>
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321095029.2259489-1-mitltlatltl@gmail.com>
X-Proofpoint-GUID: IlCGIXAhK6eCvJjCh46yPx3XTCTXzMo5
X-Proofpoint-ORIG-GUID: IlCGIXAhK6eCvJjCh46yPx3XTCTXzMo5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDE4OCBTYWx0ZWRfX5hdsXvRS9H6x
 Wee94avxIpjH+moRXcVyUitUAAiJp9vEMvIjQHHxmnLfGxXzQ3MY56s6NnqYZ4CWzqZOOpGm/T4
 NDTj3dL+1SS1je1i/7sj8Lmq8y4vFGoIZO4wt02K6Ek95q2RQR/6wakmAi6NxZSj9vaJsVp/3hx
 Ln1WmH/0CXxw/qNvuIHMBEnjTNzeVU0WjfoxQLCvElor3Tm/D/lrbOzdkRgMtlxyFdd03oPv6Dh
 GeIyJYow+5i+ZPx83gbMpsZhNkDk16PYDK1sKVna/gSCKf0MnOsUx1n73LJLy3VcOvAfRYGx1sB
 RLkAlb550QnMdnpjKfz/QdAL+AZCcZT9nBsHtO6AX52xVqhWNfwRvmGBiRvEuer+9aCrXwuoA2v
 2Jkw0ls4ejRoxIXiRM7R5VvkD8CefvB9Gxo7p9v/Ahbz70dYOcq07+fBpKrRmRg8EjBtoIkMjv9
 ykgzJ2+s+zL+suNseyw==
X-Authority-Analysis: v=2.4 cv=dYiNHHXe c=1 sm=1 tr=0 ts=69bf11bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=tAPiZv5cLaP3UTzMh9gA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603210188
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99037-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6AC682E757E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 21, 2026 at 05:50:28PM +0800, Pengyu Luo wrote:
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
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

