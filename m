Return-Path: <linux-arm-msm+bounces-95503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBQ2MqUfqWnI2QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:16:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE020B524
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A52213058EBD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 06:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED9B329B79B;
	Thu,  5 Mar 2026 06:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQzpt9Zu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xn+ntWCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11028850D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 06:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691177; cv=none; b=K7Ay8OQGwVE/K3R24z2pinV7tZVz9/oWaT/q7k6EiyaN2C5pGakQ9TEEKITHGjUmRXNR44TMD/qbns0C+yH11kAfIRbEaytmRsNitJRfFQkbO36JgAvxlUSj3F56vRmQmFdWxWvIGEj9jzSgxaCLEKI9MF27BXgVghts8m9/yno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691177; c=relaxed/simple;
	bh=WVCOymDn+Y5cdjRdxWYnxZvicoc+0ERolPNnNAc+PmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=USa43EY2869vHqcf4gnUxxXT/lyKV31qLDH0hYWqzzuawCzn4Fe/84gHabm2NBSUlJmxb8/+L8i0VGEN+L1efU2KyGW4mXxYP0yTW2+TFGAw20LfIl1Kg5ijeWXW8YhNMA8V0h7PMlUete2EDNy7zovcfHJ/y2AGvwpIqvalhnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQzpt9Zu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xn+ntWCk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251BkBa628676
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 06:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LTCPNyRG3DuUYizweQ1ELZW96whpOeRUL1Ipe3ag0fU=; b=BQzpt9ZuYY/FGFhx
	Vyum5D4X5FyLiYvq4CY8wTkIZrRHsznCctKY7ix/VCeo/q6eLL0UH6Kfwq8/wuBJ
	XbDAVBftoZN93+6F0/u1RhJoKXgDjk1UkHwg3koSsIPCJMWR9bsQgR0C8LjUvUvv
	rHWG3zxQdX5kaYaN3rwFUgopqNgxpKatGSEsbTiE/2hDDMSoHjsmVgnlO1268xj3
	TDu/+ouwP6DuydmhMwZFEwb2+a0bbzmhw9DqJaSL8jmhD9lM9Xhv4idGVOeyKi55
	d0wOqAHHl+1l7mqXK3Hokk/SBp+11ZPuVfx9N37h3ryrAsopnmOTm6RZld3o35wU
	ij6A4Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m21nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:12:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3598f4fbb13so3903041a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 22:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691174; x=1773295974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LTCPNyRG3DuUYizweQ1ELZW96whpOeRUL1Ipe3ag0fU=;
        b=Xn+ntWCkxv7BY8B/Q+bFe3PGGJ/Y8QTCHQ9Gxkk64hOvQ9QQeI083wToH0VXFVy84o
         MNXBR5DGwD1Zgk3euUmrlC9FpI4v8zcZDc25mfWiCbjS4ByEoVUeZEL9KIc5p2+4wp7E
         I5otFczFfgrKpbXE6Np/rDP3Nk1isJiN5OfGvFHbrAxBwR5L7+fPgR6EIslMS3jFAkon
         cCkzMZJvInkXLBKEr9JxBV65adl9KzMGZIXmPS/OYoMN6daGhbYMLMlJAb6MVEO15V0v
         pPdGA2nP2Ii+xd13BOAYmCG4hi5r8gJNP2YLsnm5WoWdke0iOmSY0jDB5PMDVxYLYjrY
         2Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691174; x=1773295974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTCPNyRG3DuUYizweQ1ELZW96whpOeRUL1Ipe3ag0fU=;
        b=nPWmKcCQGe5nYoTVfTHwRpED3sBYL8Rd4eQfLF9+hgubXrlDKaYOrFRXB/h9BY7nMk
         x4vteU4GacR88DW4y0Cp4A7HfRbjeBrUMCltJh/PyliTVHPXDE3XKWoU5vtVSJiDry0H
         UYgqeNxYXnOOJt9JVcdkOguocSx4gDa7Grr5OxuXraQsmGqpXrKcmkTatt0BOOXnio3u
         r/FYWPkUtqCMga1uf7fbVLHtGS8yW4MP1Id3YMhcofX0zRv+2VmLcGqHRHyAkflU1DJf
         U25v9ZCTGFx1tUy+p2l8AeN7drXJVLNAA6hm+LZa+EbXz4SKMlumH3Gb+jj7guzo8xMl
         gu6Q==
X-Gm-Message-State: AOJu0YxWxyOoCPXbBw+b4MRNqvgBTWM20EbRxBeoB+P5flbnYEV1EQk8
	xhyAjdCgv205EXrtZ00Pel8In7P3PRCk0Lt8JatTBTtWzqruB2UV/ZUU/NdO5vuQkAvgU+Jfor1
	J7M/XgHLQMFYc1HXc2RWVTfJHZTOh7Q5WwB48LX238E1qAjqB65/30+OlEmK5WigXiIQ3
X-Gm-Gg: ATEYQzwBh05Pf0uf/HRntt9iOe4uC4KgqXt0jRs+N1uo3y8JZPQHgkxlCHg1lb3ZGHh
	j/44VhI039D+wDsuQRbjglzrguIl/RWe4kGmsIioAUOgoSsWLHlkV16Zf/9dxqR87mDUg0GPHS3
	hGBvGIUkpZJfMWbxN73utlIF4c6kUsq1/Ynzm1OA+N2nJ8IM3GG2+ErozpuWJpDhsw9wnoSSMjw
	Pp9Ysnj1UdHmIdZVytWmbYRa/IlO4C5K4n2d62TE0+5MpkE68i7FrTVuxnY52VoA0pZ70pPgiMQ
	LVQveJWLhNHt0WrhxCHqGsCCcZL4ZDb3NOh7jucx5kOpDodz0UWr0kqbH4JLrBWuxsdSGkyG0vl
	NwV3YZkLK1EufiBL+veoF1h2fXN6kJepowxTR/SKawIQAODUdVA==
X-Received: by 2002:a17:90b:2883:b0:353:6373:590b with SMTP id 98e67ed59e1d1-359a69b55bdmr3946253a91.7.1772691174443;
        Wed, 04 Mar 2026 22:12:54 -0800 (PST)
X-Received: by 2002:a17:90b:2883:b0:353:6373:590b with SMTP id 98e67ed59e1d1-359a69b55bdmr3946233a91.7.1772691173940;
        Wed, 04 Mar 2026 22:12:53 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d2b187sm981141a91.2.2026.03.04.22.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:12:53 -0800 (PST)
Message-ID: <fa38dc8b-fbfc-42ce-81ba-9431af1a8f4c@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:42:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] clk: qcom: dispcc-glymur: Fix DSI byte clock rate
 setting
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-1-b79b29f83176@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-1-b79b29f83176@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a91ee7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LxZnbXQGLr2tCt7RAxkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: g9uHtZELVWQ0926ny9XYAF8GsXcUdI6m
X-Proofpoint-GUID: g9uHtZELVWQ0926ny9XYAF8GsXcUdI6m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NiBTYWx0ZWRfX9YMMxo3ViDtj
 rCmcNxHyiCHHG/GDTHxgP8DTXhduo9dbYU6L43FsU/A8ChCPv91hXA2zcGEdQxFV9c0GC1HK/r6
 3uI/CDQQQRpc9NahoTezKZIvZiyH5MHAqleEOoevhvJCxhMo1SHKE+QqZbWyojvAmn3V0Z5cD4V
 tsYVeCDxJJ9ZNWhAyvh5vmT7YxXk54uFN8nGtEn6HI25zsF5Zhjxi8Veiz0M+g9plbmWNQYpmRM
 rqu5UIZQCloYGyD9BCQ1wgUM+Ofyx9MmGN/6X9S03JciafFSpC+ov0B/8qCotkAjgk9Z6zbv+yL
 hdBKprRzHjGeY9NQIvt7VoqDQvMHzoZdBbvjHA3xlLtZXY8VAQ1PozCABpG8cYjMQ4NyqAj/U4l
 ZC6XiytXkdL40MZP4hxYJ0Tw9g1L2hLAu5QbtlPIFjXyZLqm7aHHwXNH6IFdRueJOJCV1XI4k+6
 PXLYs642MPY0eLJI/lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050046
X-Rspamd-Queue-Id: DBFE020B524
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95503-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


> diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
> index 94053452e871..a8c3cbf591d1 100644
> --- a/drivers/clk/qcom/dispcc-glymur.c
> +++ b/drivers/clk/qcom/dispcc-glymur.c
> @@ -747,7 +747,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>  			&disp_cc_mdss_byte0_clk_src.clkr.hw,
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_regmap_div_ops,
>  	},
>  };
> @@ -762,7 +761,6 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
>  			&disp_cc_mdss_byte1_clk_src.clkr.hw,
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_regmap_div_ops,
>  	},
>  };
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


