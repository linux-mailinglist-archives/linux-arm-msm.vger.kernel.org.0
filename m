Return-Path: <linux-arm-msm+bounces-95346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFpqJU1FqGlOrwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:44:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDDD201D6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 15:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8AC8B30A2E7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 14:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F1537474D;
	Wed,  4 Mar 2026 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4awoh13";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ni5UKYug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55200389101
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634446; cv=none; b=VGidP9FPnlJDwZmmMUfEB5CGJk3OyzY+BcOoYbchLA1ErixVY+z9VU+fROlPQpHoxYUXau6iN5rS/194bk+y1RGnKkXFvNQCuqHZW5SlTVvzAuybyrHGVoo99gT4pXHkACzG34m9QPC6wY60neaOngive0wLf1PY1Rp8oExXImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634446; c=relaxed/simple;
	bh=X3ZaJ0LNZVNI76xxVzwU2RW9kMNSkYt18E0qUs9W0c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fx9wNuzg6kKRNUz8nCDO7Y/J92XT3fPevzdV5ObZf/Fy41/SjdvTHvs2hPRUgkF+AqJOvQuFsBMq+aio1ozkrc0IfeImOgENG5bUUwE9XhgHhMoJfkawGHasaZMmIs41Yh8k4611Q3QPttkDkL0R1V0JZvExOU/vRriFDwDNk6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4awoh13; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ni5UKYug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CmsZ5957059
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 14:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNr9JA5YuNaCKrbAutm8L2NMYLudyOtYm2CQ8UJlx3M=; b=o4awoh13uF4S9GcW
	pdX2qIT1Nml38lTfW0evqvYezh+8OGzVQe3sydGxBL9xklRJgU5AkGnq0808Xo8D
	Q5XmfYGNV0HttakPDdo9VUhozYyr+fX/D/nGh9HKK6Mb7wjbmIL7Q8bmiQEolitU
	8w9NtyMeZJyuMeVaJmVss6vh4Usd6iA8Fj0kPwMX5lmn+tQG7eeDavDfaHsGjvWd
	LO0/sXHkdsEA7sndqCAiWnMjgrA1SGz6LTuB53QFqOr/Ko4ou9rG+3RGi2mPXPfx
	AhgO0dUAIq0K8lYL24oqEp5bL0zv5w6WxAW6T/bQogNHrtoLe+cUvF3GpRv5sqF0
	IJT5Ow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp6qgb5ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 14:27:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb37db8b79so5089491885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 06:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772634443; x=1773239243; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNr9JA5YuNaCKrbAutm8L2NMYLudyOtYm2CQ8UJlx3M=;
        b=Ni5UKYugHc+zouzMi1U63iYzlcygmfDO1jvepkFhA2sUVLrRgrASzYJgbZE4xbjmph
         XPNTAoQLHMJFfi/v3/s3XupcEwNMGvdJ5ED0elfH7jdNOxRMSXyM6z887xDM9JdCrQ21
         bM8LLnRR5MOzaAlOPKfhbwNFHYtYz86kDoJnK3UV/N+Dj8LRXuc7i9y3sG4A9qb2g6tS
         67KLh7yjSSGvL2cHMn1yV1+CtZe+dImVC2DTrqdFzMC++M+t12zoUCVLS+VzNj/D2UYA
         j2mKfgDXkUBECp4ZSfxNGvVjZDCHLaUmsrBi7ufRP/AixSixc1n9FkknjOZH2fq0BrXN
         g9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634443; x=1773239243;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNr9JA5YuNaCKrbAutm8L2NMYLudyOtYm2CQ8UJlx3M=;
        b=UReJrZi1aOZfwAyl3i45cBXCyH3b5jNAeklzBWQR0wOWymdXGGgF8fHlQMjcpGFsR0
         0PgVMsUNqv65+Mug6rEV5bikhrXU8c51t/vXgZpD6NFb3EsVT3XeaoEs7/KOcjULgXf3
         Gf58GX5z4w0VPV7BKXb9q6r6zoH5iz+XOo+fjEbLJDWVAbHzy9h5dZQ1gnO4UKcWpHYp
         M9xG0RvZs6yu34oE4kO+WIWD/eGAXoquTAIUtGHiHrP8gjX2PthP+oQfTvLwzl+UFEN1
         hnciZvHKyQN820nJE9VhKDCDb+PGbYp7klwjMMbhm3PFYGWiStZW8y3aX9iZ0YzMSM6u
         Km4w==
X-Forwarded-Encrypted: i=1; AJvYcCXQpuNsMzCniqI06gmMg46PjQqh9orhEivSLZrMH+qie6YfCgGu8EYhZvD2kBfXsU01zCw6/lDtxVadVuSb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1kHFfjGDb7sP5d/kSXQka+pBlBXtzAtWF3e853xGPt7+ZpYzn
	3mRDWocrCLhQBH7RsGg7eu6e74Cn9WKj+hdoL3R+GBFT12aRHXv8TD2U6QUCpz937ihRnLydzVM
	TAloQ/8VaWuqBNvPZ/fmD5WaUNovxMt3HHwanlK9/zB+U/jbZPIbKrJDd3o5wPBmO4eeu
X-Gm-Gg: ATEYQzz+dkxpwEUlewdYmPfekxMVrGW6Swk3YysZY4uv18MXXazB5lAIG2g5/gQWIAW
	jh/lYodBe9QN5+CO0ViIfKJ1QFacpubzr4o5DmWcHLenKmBxnasntlcbpAB975hE7Y2DwSmme5F
	ls87bLSIevCAWrNXqyPQBkJOpCeV5l6NUuddwMJ/oGKTxxTtIsodSNLphJWI2oaZou3KOqT0kMk
	+cbKvvFKazI+LZTXaHjMgGvKmXjCvGz7WDEC2cYJpay3YLQ3/4QAZKZnPkAO507afJL1wh5ajNg
	l/UVT1NkKRQHTDj6XqCCzTUWYNYSyzxHjUzzje3scv2G/pgFRcuzCfjDVv1mkmtljPfHdjk1WMv
	JnoDeMO2ITXryTBHuSFBGR2R+/aapsaBAfp3i49uQiSCIOJCZl8h/FGFrehycsCS3hh6mzIA7fG
	K1oQD94t6ro/AktYL3CJNJUcjQpsN0QLM8CNk=
X-Received: by 2002:a05:620a:44c2:b0:8c9:fb26:dc78 with SMTP id af79cd13be357-8cd5af7ab1cmr249590385a.40.1772634443531;
        Wed, 04 Mar 2026 06:27:23 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:8c9:fb26:dc78 with SMTP id af79cd13be357-8cd5af7ab1cmr249585585a.40.1772634443033;
        Wed, 04 Mar 2026 06:27:23 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a2ecd6596sm2363821fa.5.2026.03.04.06.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:27:22 -0800 (PST)
Date: Wed, 4 Mar 2026 16:27:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] clk: qcom: dispcc-sm4450: Fix DSI byte clock rate
 setting
Message-ID: <failhjdmtrtns6h54qwzd4w4aun6hjhao5uirv2636kazqqfki@brumrojsc7id>
References: <20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com>
 <20260304-topic-dsi_byte_fixup-v1-4-b79b29f83176@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-4-b79b29f83176@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExNiBTYWx0ZWRfX4od7o41My3v+
 wZspJqQtRWpYVPi5zD9w/h8i2wpeM/ZIGjKxasGXmQPaYXKwOqE3fPVo9uAYfnDRhtnhuDo8deG
 pbAHagdrwnFzgL0FnCM95PWJKQMtwiznFFstEqsuCefWUc4fXHW0z/zr4FOcnvCK7jm225nm1qX
 xa+Px3gCDnOABnSWjuka6wjKLQj7FDNw43GxkB5aN5jrDDsBwiXnz4twMEyg32IU9RXT+YdL/f7
 ulFVUDgsu9Ss9m46q7Pm/ZBE9U9Bos1MOM1fMRVZWTdMvtuWV+ShetuC3VGU5ds4iCaWArax+Hx
 rnAxfdAgrnqIhdSLYWa50rckInT7bjT31q+AfvlMtscy+rVZ3lxTt4xisB6IFSoZSYZB0Jqz0fs
 RoTOSrxsUCJrvcZ1m9mSu9Ck+0qit0ckul0TNqclpLqJ8rCAbwCsK++aEaY5iys+Ng7ew1+uMMU
 jg1i6P3yn0b2cNNBTzA==
X-Authority-Analysis: v=2.4 cv=UJ3Q3Sfy c=1 sm=1 tr=0 ts=69a8414c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=P6JgDz5pW-ke-mV79CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1S12DgCfoFTGWT7yGpMHBO1AGhRpV7L5
X-Proofpoint-GUID: 1S12DgCfoFTGWT7yGpMHBO1AGhRpV7L5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040116
X-Rspamd-Queue-Id: 8FDDD201D6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95346-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:48:30PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clock tree for byte_clk_src is as follows:
> 
>    ┌──────byte0_clk_src─────┐
>    │                        │
> byte0_clk            byte0_div_clk_src
>                             │
>                      byte0_intf_clk
> 
> If both of its direct children have CLK_SET_RATE_PARENT with different
> requests, byte0_clk_src (and its parent) will be reconfigured. In this
> case, byte0_intf should strictly follow the rate of byte0_clk (with
> some adjustments based on PHY mode).
> 
> Remove CLK_SET_RATE_PARENT from byte0_div_clk_src to avoid this issue.
> 
> Fixes: 76f05f1ec766 ("clk: qcom: Add DISPCC driver support for SM4450")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sm4450.c | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

