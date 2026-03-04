Return-Path: <linux-arm-msm+bounces-95245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDFvN1Kop2kqjAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 04:34:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4556B1FA696
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 04:34:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEA703055D57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 03:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E82F366822;
	Wed,  4 Mar 2026 03:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzLuD51l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ty9BL/WR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B3336655E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 03:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772595207; cv=none; b=pz4iBnoO/Od64xzbnef2stTH0OUqVwlMK7THOO8LBPIzgsTRNJohh/LN2/mwoosPm/6H3Wi9lt4pGjMtvSLwFSenCC7GvkZyUNQDt6gZYAxO1jSiYVES6jBuY89UmP3Wc6a87tF7rIbGot9auBVX78jXYBcV9H7k2ZDSCYVciIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772595207; c=relaxed/simple;
	bh=bQf3n/4vXD2J88Qu3FkZsjYMnc+uJ66dzjrpMzKD1m4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S725tuZ0bePYTpDvspQPMGkbUfJWZjzR8x2goqj5Is5BWuQQ5qgp85cw0+Y7nKhKvSBnJEUAX3/2TfNQMKp+vQ46Kh3KLkMDoZkq0BlbcU022kY1b6W2vgTeMwBa4Qr2oSUknUNyHbLD3F+a0FlRkygbV2ihbs9Sqbz/kY/G0QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzLuD51l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ty9BL/WR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6243XP3l822780
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 03:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iqphSR8gbO1MF8lISTqHPzSh
	VfwJQqTLFAllpN+xsG8=; b=BzLuD51lTEKD0XYqWIjUVNJoid0+g+UFcuUmHkJv
	iyn7ly9h2zfByOB/Vhe2xzIbPqea/3TX9FuBVuAhtAAgFlGWNNIaS/BG7ZXJK+d9
	HH0lbDtD9kMtMbFrWygQDCAPIWX6xkuh9fOQGMX6v2t062MbQg7aG9z6z/slqs+O
	JyMyiYvWUggX5gp2EGcvkyHFWipSA5e36vK6yyEx/fh5mCxWahWNVHORkv6IxUfW
	+2WrbwqFXJPiRlOFRfAMGGZqp36SXvXYkylLO9BT4XL8Q+IZTAU5LFra+IXdj1dO
	sswVSN1kDOjJW/dQcQVaCGu647P8BBobnKd4D54DeG2ihA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpcxfg007-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:33:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899f671ceb2so225529166d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 19:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772595204; x=1773200004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iqphSR8gbO1MF8lISTqHPzShVfwJQqTLFAllpN+xsG8=;
        b=Ty9BL/WRKo6KiCDuiTAQHesy8uqcfh+XllFYT2wjhRFqCk7laZcykIir/vnL9kstgY
         0QErHJbqkX5UZ8KORqsyE0X4vDwxwUitCN4X8mMaV0r6KB1icObhZBLSYrh+DLzC9nNk
         EIpsDkwa+0LVDBWkseL7enR4EItswp9jaQvF6LcmHnJ0kOK6+DCnnwp7VNGrnsl/Tk4V
         cf5fH5n4sK2Qgw1+ZnTgfhhIxkbpynlvFrTKFEsbPnPCS77FNKT3ByrT/Rt11PrVVas8
         B+CLzldVMayy/ac5z6bld/lEbGAT33cPVdKgsVMLwulVNwaZg8FZvLcFhE1BMgagTm+H
         gqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595204; x=1773200004;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqphSR8gbO1MF8lISTqHPzShVfwJQqTLFAllpN+xsG8=;
        b=s6Un5O9ei5NfU8unG6lfVuygOAAmQzHpNSmjevQPy4n7BeWNgVYnReGtZFp8yThfxF
         eb2MM4R5hASV6h5AaJRJTCXbA//ln9zsRDz3N1P4tnVox+n4H11MEDXWvsIxbw4bnMZt
         6K954YPuGAwY44lnpP5T0HFC7r8/jVIeXE6lKrzc+zJ9p0RWVqGy/roVoEbn1BXkN4gH
         QVRExx9XJBgYt7W08MZeYoza9BsvQV978nv0HPojPI5g04pHmJh2RvHwKxKSnRClPKoF
         TVOmbxJ5o3fOH2imYa76A48tNKeonw9Fm337H9jizJwprM/LkqjnXrqJkMAURXKD1y0r
         1RNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwpm5AQGJsU4qSe2/dHRKsImt/pfpEErMwCaEjZzALVPNWDbha0kFgXDaxyN+1Es3dVc1XNdN2kasCtpTJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwICroj3ArNNkUBjuBqvOo58us2gj12nPrl/f7w307ts29b5QoP
	0ninMvd7d9oXDTMhvCuyfQVaBsQpaT21U6MAO8TDFfYloAXeFIiMpXDw2kNyYabXbZNKNwMbxEc
	kQulSXKTVEP+WmNcKtY8JuKNC+iN0bSobt3Fr4yTAfrNVRoUVqzF4Jj1pr7S7sx9rhE8S
X-Gm-Gg: ATEYQzxhKPZG2T1TLC3mDH4vj1cOfNLfzDXlqD7WgQSVraYvfu3L7aj3alixNZWXR/B
	8Aa0QG6eigcDCunKiVcd5ytsSZfBa+8QsOwej6pIiS2VmiipjLQHwL8jEmFFFeN7Zh4QyXOJdkh
	GvPs796PMAHvFNVD5MiNRr59iTXfH67O5+SFH+cykhWWktudLcKJLG/uduBB3j1jYxYLP4pIura
	/LFK8PSAdrAy8017iPmG756lVkJhVzhvS7/5SVfjeToCIrfC78rVNH5bSEzxFBFhB56v9bSPsGb
	xLGHAhH8UM2aMgguI0Z5TvC62N+t6fxglDaiwGqSHJdX9MXRH24peAd0ZrsthGmC071w73RZPUm
	dMVafEnU3UaOOvYrsLqFV2/gwz+0GKKbcERQyLmRTIKURjJBP+QkA8gV1c4syjkOENyQ8SDfTZS
	i8JqYzzOW49CAxxnCIzyAbv3j2jnPnukGGu3c=
X-Received: by 2002:a05:620a:d8d:b0:8ca:3175:cc72 with SMTP id af79cd13be357-8cd5aecbd14mr89469985a.15.1772595204171;
        Tue, 03 Mar 2026 19:33:24 -0800 (PST)
X-Received: by 2002:a05:620a:d8d:b0:8ca:3175:cc72 with SMTP id af79cd13be357-8cd5aecbd14mr89468485a.15.1772595203788;
        Tue, 03 Mar 2026 19:33:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123588ffcsm974426e87.5.2026.03.03.19.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:33:21 -0800 (PST)
Date: Wed, 4 Mar 2026 05:33:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        White Lewis <liu224806@gmail.com>
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
Message-ID: <xvrggm5uhoocly3souofyql6yhcchrzvfmvko6t4r3nlxsdfhc@qvsjqmrrxxye>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303115550.9279-1-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: cWnulwtg3YXSlTvTkGJODrvyQnoFp8LC
X-Authority-Analysis: v=2.4 cv=R4gO2NRX c=1 sm=1 tr=0 ts=69a7a805 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=r64ZnLUNze7Q9b7ZCxUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDAyOCBTYWx0ZWRfX3Lmb0j0F0CWl
 9oJQtevLv2E3ge09kwNZUr3pHZsuQpuV3L6Fmei7l7eW98chU4Ex/UCtJGZB0j/eGHZv6AAK8+1
 ZbXMhDHhuWsuCSVXecyvgogjFECy9y33RAI7hVjoVKzhUHLcJo0EAVIPy68PP6K4QCQc3PnKD0k
 Y1e4/oTWRZf8Kpxya/sj2DyjrTB8mFBwsaEM1/LZccshOypzQhJYS28iC0osU68IhYXpUB2traW
 tORJxB9xXmjJYdmKEH5lplNFPvf4we9HU9nX674ExzK8QSJl5jzWW/rM3FD5+lQsLP2wZlhJPtY
 Bd5xJqnw1sGEa8sKs//UshyavWUXcPKfdTYQMpWTFvWUYWjHzYWDEAxF8F5cmVWIPj2PHWDx5R/
 puKcwgwRYeLLcP9sLgfIhaB/ftrMoRskVplAyDBKavyxno5zPUceExXo0TJyM+IlnfYxswMNLMH
 OFObnyAZ1gpWk7XCZZA==
X-Proofpoint-GUID: cWnulwtg3YXSlTvTkGJODrvyQnoFp8LC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_01,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040028
X-Rspamd-Queue-Id: 4556B1FA696
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95245-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 07:55:50PM +0800, Pengyu Luo wrote:
> From: White Lewis <liu224806@gmail.com>
> 
> The four byte_div_clk_src dividers (disp{0,1}_cc_mdss_byte{0,1}_div_clk_src)
> had CLK_SET_RATE_PARENT set. When the DSI driver calls clk_set_rate() on
> byte_intf_clk, the rate-change propagates through the divider up to the
> parent PLL (byte_clk_src), halving the byte clock rate.
> 
> A simiar issue had been also encountered on SM8750.
> b8501febdc51 ("clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent").
> 
> Likewise, remove CLK_SET_RATE_PARENT from all four byte divider clocks
> so that clk_set_rate() on the divider adjusts only the divider ratio,
> leaving the parent PLL untouched.
> 
> Fixes: 4a66e76fdb6d ("clk: qcom: Add SC8280XP display clock controller")
> Signed-off-by: White Lewis <liu224806@gmail.com>
> [pengyu: reword]
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/clk/qcom/dispcc-sc8280xp.c | 4 ----
>  1 file changed, 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

