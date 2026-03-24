Return-Path: <linux-arm-msm+bounces-99621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAKfGJhtwmmncwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:55:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCC9306D46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:55:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4504F3158731
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACF937CD2C;
	Tue, 24 Mar 2026 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuJiuQMW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rn5iEzUy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0B368263
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349329; cv=none; b=sWLRQBPo3m5jNwK5fxSdmSbv+x1CKH9UOn2+QQ+2GO/1ZG+tlaflgBjbGdLisgnsmBCNzB4C2rNWVjeQ9uTpmbDovzpfRoN1pir1aBFelmtbGHlLBkfyHR/u3o9ZPKo/awrLvySjmRu9PwmpGc4h04BtNXx2eRlB83hFG7FUD0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349329; c=relaxed/simple;
	bh=TIDLuJixDy7nE6oj0Vl00rtDfXrGu4PvCUbC5ZIRtOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jaLvdHrj+ZicpJaG9FE0sCfP9gSgYnsJljz96tpMsbrAxjmuXdNs/vUCGzPCabWCjp9fvFq8jzcQWtZ9UO0q/Ai8618tcY456NYGAhtdDh905re0CY6mqGUw63qpPy78uKS0Gz/mJwzuKuG9fGyPtdgNCOCWBE5pnK4ygbF+Gks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FuJiuQMW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rn5iEzUy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OAT9KO3634290
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GLVuENRko+ibijIwPTOuvDEu/CuRGqmpW5X9Mq+oXc4=; b=FuJiuQMWTeRoiC6d
	IPC9SZ16Yi2AWasuZzvvZERkFxUuG1oX25BZw91cqZ5dZVGDzHD+ChD1RnTYG+aU
	7jARArRqzAAoloXhdLNlPdtOUn0BYX3/BjfP1NyWou5AjSUWBTMh4GD4iL23/pvu
	+B9MdjL11IHsVx0q8lY9BFz6Lk8UOp1kL8wwRUvRtipzWh2djXky6sGdBIl9mwi6
	IG1SjKlPbga+eonl6o/93X+hpjC3yErkIYGlNcQ68LhHx2BW4XA5qZ85VGgj9PO+
	oKoBuSpYTLKxMkGr1kHXlaUpXMcONcwJo6JTnGnQv1oUZlwMvBWpz6Q5tm67KB40
	updIQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4mncw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:48:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35641c14663so6800298a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774349325; x=1774954125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLVuENRko+ibijIwPTOuvDEu/CuRGqmpW5X9Mq+oXc4=;
        b=Rn5iEzUyjotMu68IKTHdqbYXeEi61TeWPAb5XSctMrZJcmuY0j5Ge/TOT4F3wE0egw
         qcIqz/RNTdp6rLrdszKfRPYDNxDZjl7FJZ8C1lqmAVUJEJSxIawXrQuvGR+f8Ub/VAxN
         vtQ0HbDbPEFzau9BLJ45bsejdWy5YxwPMC4aYGGetH1WqbTqYCVLWU4OSq0Bfx1zwt1E
         /JrcePfoa2jiHGeR2nWWbDfPWO5NOx7xYIP97PYTW4jFo0r0PlH1Req81hrQw9Us+RRf
         iujcp5wnREiksO9lYkUHm4s/T/5xsMjunMZtpgPPme8cmVh5UWQc+/MyRyqOgxgJNPqc
         XDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349325; x=1774954125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GLVuENRko+ibijIwPTOuvDEu/CuRGqmpW5X9Mq+oXc4=;
        b=QM//91CkMYvjQOqFRmHP4nu0sFfcMr4u8Qlb0mIE6a1Azh5JxU4nBLjeREg2/wJW42
         hn1fGlsNRN28dPxt93KXjsOD/Pve8uzc7yrxZ+YXe5uuUNmVRaoxotHF7POq/F5qstCF
         +FNx8YGOOorqeaM/ffOWw8DpblMWX4sZbBkr3yWnr4x2CtuVO6wUEXGxxZAQm49Ny+1r
         S/McXtdib3VSU3WJXWVoapq+Eo8n1dTgsOETedfQrG+kdjRcrO8aENhORerddguV/rKP
         YxCLS1X73ZSX4vn66G1FOeKzik8sA1VgOMU2Dvv3ytqQp9/HyX90slLCjZmA9iVXb1/I
         jAqA==
X-Forwarded-Encrypted: i=1; AJvYcCX/qEs8jCwh0Q6T8ksw2GV5vfBhix25t6CTpaRSxE59pufTV+DaDGwuf6rqXNPL+SdcZRmIsBI9fb4lbWTd@vger.kernel.org
X-Gm-Message-State: AOJu0YyUMuIYz1J/DJ6zLdj6soeiQkCzhImI0IsUA27Im27ITIrccoPM
	0tql/iSZa3cU/9x9eVZo9oNa11B54b2zaDbFXDwx0hmpkgcgk/AtpqltbGQLJ0X/X/o1y+KbOSH
	G6KI5sq0KPYAcNjnMrLX9Ci9sVIJSg9QOBGDbALIYH2GWeY1Pxe+I5tyZx62ajgPyc/cf
X-Gm-Gg: ATEYQzxOkWoCOhuJ5h0Oh6HzvVo93hdEdzPzdDgxt9FVy4Kgm87SNwIwnS+idCxxYN8
	JC1l50whSGM4wtz+seRS9a8ESBrKY9wcaMpzFzSQ8WO4COPqklYMdhk9vG2MBp/bpr74bO3rjGL
	SKyBlhtQH4jKselHSgdzGzXE6pynRU7gGcPZ5R1fL7d/qMtPVtXngs2mnu4zyOBPxYHKbs/7bk4
	CpwBCP0N1JgiG1CmXHMpBN1MWvWMgMTRxv+Z9TkiJgejnkiCAKM2x/zl5cYDJBuQNoabmpSurxQ
	mTmoUDv0ygHnR8AzpwZM4qeyAqFCSM7jDHcnES7hEMc2nDkj3T2He8wpvH9OGXCx0uA7sepAqvU
	EMrIJyGAZW5zUfR32T4NM9fp3h32YIcXisek7i2ciKxa0cyNSumSM
X-Received: by 2002:a17:90b:4c4a:b0:35b:929f:7e8f with SMTP id 98e67ed59e1d1-35bd2bfdf2cmr14076707a91.13.1774349325258;
        Tue, 24 Mar 2026 03:48:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4a:b0:35b:929f:7e8f with SMTP id 98e67ed59e1d1-35bd2bfdf2cmr14076682a91.13.1774349324733;
        Tue, 24 Mar 2026 03:48:44 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516b96sm180029935ad.7.2026.03.24.03.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:48:43 -0700 (PDT)
Message-ID: <1abe2b24-dcb4-40b0-a32e-94cf5cbcc7aa@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:18:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] arm64: dts: qcom: sc7180: Add power-domain and
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
 <20260323-qcom_ice_power_and_clk_vote-v4-6-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-6-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TCues8_6wpIITOxfXUBb8xapL74pINds
X-Proofpoint-ORIG-GUID: TCues8_6wpIITOxfXUBb8xapL74pINds
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c26c0d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NiBTYWx0ZWRfXxQQQfWREgzqS
 8s2V5bLZxs15D8wBqlxmJI4/4W0fGvobgReI90Ds1qzDqNfR/vRsDEc9UPhiC61obTJ8g3o/0hI
 FU3sq6YlaTqpyDI7tIuR6kJJk3v2Pc+4e87dD+iLLc1SwV4UhbKVYp/4fKn6i9bwjlLdiIESUHl
 JC/6E/u1mBrP8g5HHZ10DifW5Avn1SPsF3xnWMK3ApRdSY9ge8ETFme2F3EE3l9g0MFNUUBOFoK
 BpI4YYsPTTeIHSMj8S8BcThpbzBZVRHbN0a7cO9PsTmzYXut9937DmR6LDxKnDsymJcfsFAVxd8
 XMgEf4KlsV4kYjrg0uf6g0pXk/jdbh8p5jLb/b2YX9yD0RolFVoGz720jQDgBSWK1t+xZW+LxvV
 meZrjFEKeYAGN8wju4qfJk9eAzG8H7mrPNAVZsJSwXQFGBEcgetUCu0O1B6tBHhznppkKvr7p4b
 WBEOAniZo2l7MRV/+fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240086
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99621-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: DCCC9306D46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 2:47 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sc7180.
> 
> Fixes: 858536d9dc946 ("arm64: dts: qcom: sc7180: Add UFS nodes")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


