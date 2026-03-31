Return-Path: <linux-arm-msm+bounces-100992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABoGIfiQy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:16:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79452366DA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4AD353008D0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B353DEFE8;
	Tue, 31 Mar 2026 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FbxAnk8Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCO3aVdx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F24219CD1D
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948216; cv=none; b=pTbmLA/5u7m6ythW4wlfuKegFgQdmvNXR7XMCFFJUMGfT8IWBKLA3nptRHxQXi5IpMC/W4dOBwgJjsX2915+f23HcsLnDJ2+iscJzlLaRI9fxonMzigvMLnw4vMHDYy2os4YZjQ4hG4VpECRHtqUeX+sEhVldT0TFRWB4VqR5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948216; c=relaxed/simple;
	bh=W6f2/brHu57FxwFBNFjV6ofetOPfVwCRNfQoK+jYaKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rHXK4C53CyhiFVOvahVD22mAqkTuueq/E2KtvQOsin8O37UHi52vDpEPZtlqV9hSsoDHrCAgs64AvjJ7jgBIYr4GWHZqKcq3kyBr7HzztrTzCq61i52OJAHXN5pMvPQneJDfyG3+4pGa6dFZO/xcbGVAnYMw7n2YFuywXXy6Nbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FbxAnk8Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCO3aVdx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V6xt882164257
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z4SE2VJGw0Sj6G7Ihm7UUx/mCU5Skr+1IWCE4i3UPs8=; b=FbxAnk8ZLojmMEd4
	S420RzF2f7meVR3I/frxA0WMsAehVUoEHNsp+q9LzmbLCYYk+askcP/t8WeXds/k
	pKsWqa5FxoiVYle4DnIb+MbAtjyYNPU6gP4UQyK3/G7FEoj/1XwkYJQYOuQXeIy2
	KIzSMidCVISXdgTd6RkN2l83mQu6vjgTyQfD0r6aP5Bi3sT7x4kJPSs4fCM7na42
	Iz0rTLX9p9fme4oqx79JEuC5a7hy0IMh71WVgxCYc8MQok5l+NQcnrfDrhjtVFlG
	/W515ns7wtqDlYQHZbdbsbf9wjybi+jxyBW1tlsvbp5yf1wSD0LWkP02l6gebLPb
	pM7mFQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d89ga0j9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:10:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35da37203d2so6079434a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 02:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774948214; x=1775553014; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z4SE2VJGw0Sj6G7Ihm7UUx/mCU5Skr+1IWCE4i3UPs8=;
        b=UCO3aVdxHLqROXThGBm/6RH29r0efRlwZJb/Y2F3uG8pVtFqeEXnpEjF1K+urfHrfD
         +DCm66Y5C0W3uppfhxu/Ohy1WUtPzwwEITlebe5ahszFe+5GzPkCXS65aCOeMpKXvb44
         Bx3guw2DgklEC8IXrC4oC5G5s99ubBY4+6K/v+S8y6FeRWYA3E3LZqWpwdagbqMao+Fe
         GST7HBD3WqQ+mOzowE1YvNOb6LgLQNu/8tzLwEQYVnT2xWuEQhfm7eQY9h2bKrpeHV2V
         gdlsa+GAhJb81sWsFw96MS2BbkbSUHoJvkVC3VwQyPYfXuojPjNnI819GhMmGG6gY2hc
         zjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948214; x=1775553014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4SE2VJGw0Sj6G7Ihm7UUx/mCU5Skr+1IWCE4i3UPs8=;
        b=RzlU4K72xtgB9iVqYY3eaLs7v4BPRnxyjBsxTkET0yJSbgEo8ggGkTtNBhnfIxtxf5
         ezDdzV0y6yn9/NYP5vi338t+qjrpsHA3/igLzXoeZoFpdHur3YlfJdiNZtQIRQwtq2on
         1jWd63mJlNBYtUW/JdtlnZlSXJskaILesz0uvebJYr17yyM1ZNO3iBjZ4uFk3gh3A5Ll
         1X5sU3quMXb1XLRXqLAjnHb1Jw6OTknoJY+Erd99YrGiEefByJGARcL2B5gb1J+xxL3F
         ImkWfMztYrVb0KFdMSyxGURJ7Xe5hlEmE10S+PFtu/2a8D5E00zjiulWhILAmnno6yvp
         tRVA==
X-Gm-Message-State: AOJu0Yx7Xr2ukt1hzGwWSB3wzWcTBnNmuakbZs7v2Hw3/Updphnhbwit
	MjyNQ5I0HpV+jgxPBwnRrTuG75Pd62pXsGedJutSxcaQ17j5f26eHVfETF/NHB95Ug5pIpcPsfg
	/xxwjQ/USUvbhCRm3ttjrg8Bq7FJnnRj8Gg1YL8we/5P47SWvmnU0SURcMUCd7EbEo2y7
X-Gm-Gg: ATEYQzzgqaLZEkm/k2SyFX5RLYbp5CysU/xjX9GddMaGlf6v8BrLjUc5b+fMvV72agA
	IgPj6/P5jpK8IZGCa/duurZHfZuO4NFHWtlzx2WrarriyWVoW961qSMZHG0rn3yzbf26GVqvlKx
	uZULfxqs7jpHCjrNLYuoQZvF8CF84wAoiFZD5RrLKXn34NspinlXdMb2cIE3CTwg/ai/k7jxFWI
	uQWrAF3cAhVkclOrcfyHO1kIeuag0LXV8/uQcO2pTc4fY+JF/L5R8HAjN6kHgZ6qIZOU7mM0kkn
	7X8E9gnUG6eVpXqitJO1RSRgAELNKFWZic4/g9UjhbimgeIPTOD2XrWRgJsLhJzE9I3PPFEtWh2
	L2YzW8LXPSlfs+OlZBbKuv3M/a6vmRHuP52d04bh3Pu3KwS9gOA==
X-Received: by 2002:a17:90b:558d:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35c2ffa8265mr14652342a91.5.1774948214113;
        Tue, 31 Mar 2026 02:10:14 -0700 (PDT)
X-Received: by 2002:a17:90b:558d:b0:35b:9720:98d0 with SMTP id 98e67ed59e1d1-35c2ffa8265mr14652306a91.5.1774948213675;
        Tue, 31 Mar 2026 02:10:13 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2426896edsm105916705ad.34.2026.03.31.02.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:10:13 -0700 (PDT)
Message-ID: <d16efa5d-2213-4875-9351-de08adf903e3@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:40:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] clk: qcom: clk-alpha-pll: Add support for Taycan
 EHA_T PLL
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20260330-clk-hawi-v1-0-c2a663e1d35b@oss.qualcomm.com>
 <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260330-clk-hawi-v1-6-c2a663e1d35b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KJpXzVFo c=1 sm=1 tr=0 ts=69cb8f76 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ejiLYX5kVw-NK1-vaKUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: GI63hlhyJm-7AXtdgV9aAmYKyZWtZ-CH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4NiBTYWx0ZWRfX3zZXdS+SjolN
 HlVtnjFBf2X2z2RkwXBzpIiLqeMPmaRGNzrMqcebHnMxpB3DfRXreTgoghr9tYLsJ5syHDvMg8b
 6tlQmv+bzxg4szsxQ8ZCRBKO6GhE4+uqqOah92khH6DBzTsOqXtoAhFcfAwFj0fxHP85SA0TFjp
 LROQROgljgGLMaAIidIBO5OgTks3LhjpUHufymUS/+A8I7WsNafGb0MsAH+cAdsChaYOHHrtbH9
 2HaOUn6DOBp3SO9lcFOQ4EodeLPoDWVB+9V888Q+3djLpSxqYRfRNFaNDNKfJWldfGQGE8oD7ZS
 EP3tZqsCyyWMiAtVuhSoe0+lJWq8qPE9gDkRzhnjqE0AtPAlPLMBRt0viz2L3IH85A4AK0npKND
 05aZT/ESiHk8Gsr/F8WPSdaoaujxXTVwYPR2Bd7RBxX9yKcTpLrhUFlrvG+ug71lQMkZ4hNbhIZ
 v14FL7t/1zycR7XRl1g==
X-Proofpoint-ORIG-GUID: GI63hlhyJm-7AXtdgV9aAmYKyZWtZ-CH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100992-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79452366DA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/31/2026 6:05 AM, Vivek Aknurwar wrote:
> Add clock operations and register offsets to enable control of the Taycan
> EHA_T PLL, allowing for proper configuration and management of the PLL.
> 
> Signed-off-by: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


