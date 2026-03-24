Return-Path: <linux-arm-msm+bounces-99618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMjDL9BtwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:56:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2079306D91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:56:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C8AF230467F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A533ACF18;
	Tue, 24 Mar 2026 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAfNLS4a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCfAgllE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88F1A5B9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349268; cv=none; b=cpqQ8XEll/wMvTvjnDEdNoVsqf/TFfCbKNqalLL5ZNzbk/nbcyE/cBzEIH43na3Lb18o+6fyOJGmT1muw50Ey9aZV4rhp63a8BJZcYWiQGHHkq41/KzzFCu4bZ91We1jHugIVaD3vz8tl5tLXXgXW6BiCPU3OfJRGXmDEmruXKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349268; c=relaxed/simple;
	bh=vm4vFae9KZ5peWjo+7ETJQKYic+heVZYLQ7TwB1BY34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ANpi5YhiN/GtqyVoIi0+WirqazkcIjM7F23H0JYo7K0nPq8GAx3MuWt4hM9Jq12UUK1bffgGYvgFz2TFxj09z3AETrfpetoWFzHsuWtde5lYuR8eQx4A1xP2TshFm69hJatCUU/qAsl/3iQiySQaKRX9gEnuiNYZUc39WerWAJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAfNLS4a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCfAgllE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9mm73890470
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONXmRW2mp05oYjjVFdlwD8Q0MPE75jtjxRhE/bOb+IM=; b=hAfNLS4altDF8hya
	jqkl7yyUCNlgQmwtS6TTY46R4SqlwWUNcs+NR03AwfpJ3+iCwUD+mNoF5rAr+LRB
	pM6xTJJ2HgU7ReaCDOwk0zQXeItc6gsohTZBQOCEzD4tH1L48MEeMEJTmIncnVz+
	WwoHJZ9f8jbb3CTpYzWI2Qu/ab5cJY63MRcYd18QL8KRRDtnRmhLeqNVDqZ+up40
	ajw3ySK+wujFj2Raa2wuB5XdjgyK1LA+8WlIwOs8mt9/TZ9EqOP1lKvmpbttYh7L
	UpwcdD4NM5H+0EjMYFwXY3GT7iQHInRn7dxq3PeMLhS65LI4gQw5lwzsQ8fyG7bn
	WKHv4A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1x9epw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:47:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b079b4a8c3so35508355ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349263; x=1774954063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ONXmRW2mp05oYjjVFdlwD8Q0MPE75jtjxRhE/bOb+IM=;
        b=jCfAgllE9+A+DH1Qv98HSkeHYYSwMlslH4Mi1c7sQTNVT1eG8q/kxuCdaXJSXbPcs7
         AgwqdKZ2Uo3bi17WzLnEv6+30riyyHnkkiMcwqLLsANb+V0HM1d4/gEciEfzaIYmkCZ+
         2PJthqj3jEuo/5bIOf9ixvv5Lot7RhOxU1ccnmHexOPvgk495WYwGNNpfB+/Zu9/v50M
         qyNFsO5goSr7z7L4tHcwsufCqEzreQi1LlDYwJT2b8xOpzMrK3ae0gqckIGuV2OvjC60
         LM0Fo1UAWPStgTGYeznPTWKLhCVwn4vEFCgw7BEBlNSi1VPfkMz3koqTutKJVJ7fQaTP
         OpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349263; x=1774954063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONXmRW2mp05oYjjVFdlwD8Q0MPE75jtjxRhE/bOb+IM=;
        b=aCQj532+8MA0oQgb1tMnhtvsuc/x9DSBcptp6tm27+T2KyJCNsHMhkmfHNyCrK2gnp
         RzN6hNh9FaaUL4KvQBn6l0JGonYcPq0Ih/XA+CNMHtyFasCsrYd1XthBXrCmqxU6Udkq
         DSJ+lb7ljVchW+/Qx0Qyne8YdpXDmjHAdfNQg1rnHuKSH4kNrFkazvVtBfmayWbak5xW
         HMrV1I/sq5A+24WZkwXbY81Tp7sYdfCD878U9u2eS6kPmoT1sE/vAjJwJTMh3FylZVn7
         mCQf0yORjtIFzXVHDpRg92IGwcqi/THwbXyvdmOUB87s40LU2rjG0LbVIEbacXIJXjkR
         LBTw==
X-Forwarded-Encrypted: i=1; AJvYcCW89KvxMzg9CUkLAeieCDRrYCdTsi3Ip7SMJDz3CDRSuFeM8v/7cwSZM20ETv+TeUNcWWBsOWWBCAu1Kqzj@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt3tNfytNYZ9IkLTklHIyPDtbQ9BD/pPISR91G+MPr4BrxcyrV
	AIcxifmWigBKE4ytoNFxF4SxhDlSprWbyLm3/jVMplpJtSqGekaJFGX892Mu0XsGhNYPKQvnN/m
	8uFs4kRCc6vJS2oZ4E7h4VZAYZ8akUR3KhI7GKHl7IA3VjUvqxjI6w8wf7dUaaiguQxks
X-Gm-Gg: ATEYQzxRiIAUDj3Me7Pm8AHt69U4VSK2w7GoQvRq3vAwgdtMP/VMtFZFO5/kcbKsrsF
	Ksqt31y67CwJRHtNnLaHJnfSf6Oxk7RsPeD12o5e99ljCRPZrkLKfw23CdwdpKUnoi61dUEhGmY
	4d/fib1qFjEPe+t9Noyu3+YOcgnXo8uKxzIqevvUlXq/sT3PDQaVILc6/5ICr6uajNJ8Rq4N26w
	/1mg5FrwYp7/zvRdKkQP60MZykVa9GfIe94+5jandr4m1qrdcVwvqoUal/SnzOExFickE6/pBzl
	0xvVGhsawpVLIgnyCIZFywWbAlFE/Sn5+g2EhCwDwIoco4x5NnFs4rMbJa3Ji2U3+6UN6B92yv6
	HXaX24FNXxrayYnMfhwJnH1YvgdlRxv7fFERdbOQ1EToNuBh4mbfK
X-Received: by 2002:a17:902:d512:b0:2ad:e521:28cd with SMTP id d9443c01a7336-2b0827a92cdmr151443745ad.36.1774349263481;
        Tue, 24 Mar 2026 03:47:43 -0700 (PDT)
X-Received: by 2002:a17:902:d512:b0:2ad:e521:28cd with SMTP id d9443c01a7336-2b0827a92cdmr151443455ad.36.1774349263045;
        Tue, 24 Mar 2026 03:47:43 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08351675esm183655315ad.14.2026.03.24.03.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:47:42 -0700 (PDT)
Message-ID: <47d83a5b-78f6-4354-8543-440ea06b8ffd@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:17:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/11] arm64: dts: qcom: sm8750: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-11-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-11-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfX1zn9kKYLvRs5
 rWx69RVbVrngY6aGKKmCJD4kio16qIDie0076Mv8x0wuxZnSosmv8eZrXUVfg3ny0ZXjEUGNnKO
 8mYS/TtalIrCw72nLnZs2ZsYHfYx5UwD/q9BbPJf+mWvV0cy0RTWdLOFJzzzzwzRqV6GzsRUlGX
 RPD0RyFaA8gI85hm3AAY+dczAVTcB7WGcDYaCa0VYsGMGm7KLDnmyBdmA+XXP0a8F49yHn2AfSz
 RUqo6UV2+hJSrT8wvVWgHy6XFh/F9QJK15yQn4zJ9lPmVPJBldLb1/Y5X9Sfzto7xrFpkE6hrhH
 COkVGrYbSm3iBxBrzScJ3cRBi8Mr+1mu53dIFg+MDYb7nDsPIB0OdWhauiQdlDoKOGU+k7oLDaz
 Xv5pvGWaxN7DSR7n4ag7cYrl82Yf0uY9FhTalOJu/2tbOXf/FKRWwTg79eTcKi8JY9PvP4k1OKn
 RyLHj7SvmFtP1q8an7Q==
X-Proofpoint-ORIG-GUID: mqHCn3r1MtsypDrzzt2nvP_X3rZlH3x4
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c26bd0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: mqHCn3r1MtsypDrzzt2nvP_X3rZlH3x4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99618-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2079306D91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 2:48 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the GCC_UFS_PHY_GDSC power domain is enabled. Specify both the
> GCC_UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for
> sm8750.
> 
> Fixes: b1dac789c650a ("arm64: dts: qcom: sm8750: Add ICE nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>


-- 
Regards
Kuldeep


