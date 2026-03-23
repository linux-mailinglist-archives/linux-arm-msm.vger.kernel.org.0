Return-Path: <linux-arm-msm+bounces-99229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFkkJNYywWm7RQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:32:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BD62F1F4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 13:32:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF91B3035A83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116D539C010;
	Mon, 23 Mar 2026 12:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqyXUA+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gv4iBN1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB8739DBC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268871; cv=none; b=pU3d/6OUaujdm/Urf6SlU2SGtHQc67r6b5dDKABvBZp/bUO91+HSanW+5E7It5auYxJbBB6apurgVxN7a1711uJCe+0h2AydvSc95/R902sbXks634aJyDrknwTH5yZBbgdCBqgI1RFXUvfdQRw3+SEX7R9vGgYW9N/SpP0D1B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268871; c=relaxed/simple;
	bh=WugqA9yyDrviBAh0oWni+13P4SXt1aezRSrY3nIa230=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOElNIw3hrr7TAjN/9c/Bg+YjtjU1kVYXVDwsfdo33Rtt1xfZezf7aE04NPV04Re5JQDdwuFgAMS7r5D4BS2U/VywuxbpXCL1thoY6Jxiq0xbRak6NMfCAejk5D1qP1EpRzy3sxB8Se2zGZKWzSF1CH9ZuLQuj9u4fSBX7ra2XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqyXUA+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gv4iBN1M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBM0r12758828
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:27:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5X6SCCrZlhH0x7gW7E0uH0Hbsvi0PHB4OLS3xzpkYs=; b=oqyXUA+eQddQwFEZ
	F06Q3nB093RH9ixHXHtfqBcpobMOMhWInd0ug2SJgr2WdTffxYbLKocnlvPt+qqL
	mNu2Mm4Fkzk22fqpgQxZklSdL1KIJ5yk99mRutwwC0zHxilhEMM7jO+XQ6PRIO/W
	4zZWydokO2GgcM2AjTGfI9hOVlYzxIk/NPWO2RQGA4jUVzaKut61KI6MQmrJ4pdi
	pAC2bk9rTQpCczMvoFAYXnqEUljesYw0jROycVtyX8kV4cihuSs0ts0IdJFylRTz
	eVJaqDMkapL6y9mDf13idd+rK127kAPZ47i9IIFnjnQEqjbQr0heyMxYVKbc62sp
	/yRX1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4g6h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 12:27:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b32feb719so27136861cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 05:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774268868; x=1774873668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5X6SCCrZlhH0x7gW7E0uH0Hbsvi0PHB4OLS3xzpkYs=;
        b=gv4iBN1MkLTbWsF2zkwndOfI3gUimIU2fcANH1tCWfk1hcrOUjMMSoceExlyfcdlAx
         myuDaW7W8jMdsqPwkTatvhQvE98njKjziUVlLRZ1G4utQTmLHfxv8M+rb9QhGB3SNy4f
         Cgex3CF2XX3rZsTM+1MIg1Ol9cwSZYp7ZJrkAlh1QLWndiTXJt28hGI0qfCl+BwP8/XI
         dky3zP/hjHTLiTaYBOvl6A6YXNNnTEPJbUVOWKJWzPcotPOrX58U2edQGQzBGw/QwlOq
         IWejv+ihZtzzeGxJaC3GMPeJwW4DC+v5LTG3LZiScJeS66sYQQz/dbJtlvHlX2+akVso
         xTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774268868; x=1774873668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5X6SCCrZlhH0x7gW7E0uH0Hbsvi0PHB4OLS3xzpkYs=;
        b=I1U+3igYgENxR8npBOfIug+jh4I0cACca4x/0zlAnP7zPZcGCe0CElsDcRx7nrMGgm
         ipivxXSvneOAOzpSQlAKG/6ixPIsE7D8R89UVCQqYASHP8cMp7xYLUafQtAmdyQv+b+/
         BgC4rZxRcXBtmCRq0O6NmELsW9xPaW2cPdpiMau7h26Wop/e4bryLyVtUlCenZTBhNfW
         q8onZkdCc7q9h4yWGbh/xcXl4o2WS1YaKEjjZymqc3fVkMBlqQ7JuGcC4jl0L9lEAfh8
         SUEjV4LRpZyfpwZccxRrObXvZ7inPdLmBMcckTY2y8LcxEfEHim76ZreUs/JZJuJgFRq
         wvxA==
X-Forwarded-Encrypted: i=1; AJvYcCXQAXnzSSEo0wa2daay1oVANTf2dj65JJ2ZJ8CpGtBZ7916AJQ54oa8d+kgXASx0bgkKyHZ9Obh5JHr0SSE@vger.kernel.org
X-Gm-Message-State: AOJu0YxdOPW/QI6jF96JGtMsXZFRs97mYiyQXr2RVM/HiypHle1JSlKP
	OSHs8/+5ZWfH7k5j5EIQkxHqmPTe5wn0O1UiuwhhpY969vzkZRMW6Y7AbKm1EEU5rzguGF/VNln
	NpGFTtAZiLrO815FaNHieD/DRGoW58A1BEl6hRLtX8Hgu7SfPOTG/107DWZTfA2+RO9ys
X-Gm-Gg: ATEYQzz/beZPZnwtNBQokvhOo4Y5q11Z0Bg0qmyLMW21piQOtzWkzNdk0AbEeXuNvKI
	Gc9H71Xd16PYeTSgb3CC6SF6rrfXn8FmUZe7Hg5pa5GMXOaWSsb/pJIYlGvybNn4STqJagYGKPw
	r6QCXvxuQk9iQlsdK4tqH5fwBjzdGfvnFnNiHNgJosLJjvLjDOTYofl9jabGMK6yIe57gaq2vyk
	jU7sEK0TTZkglxOCCci3Lro7Xmikz+TubBde6n2JCNJfllp2dy+ng158bkOM7fB307sFt4n+8Kn
	CSVCJ+WEapbxF+6vNotp6HzxExwMYVl7vn2bfNlBEiX4BYlMLzAm8OeeiBQ7Ir5Hj1FKGIvL01x
	78mkyJTfQ4RL4+p5in20UWenqw26Xx1PFS60gCo18UquYrQRyfWnTJalmqeJcxmR+U/eoFXzAqw
	Ntjhc=
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr144815071cf.3.1774268867902;
        Mon, 23 Mar 2026 05:27:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1992:b0:509:d76:fe73 with SMTP id d75a77b69052e-50b373d748amr144814541cf.3.1774268867450;
        Mon, 23 Mar 2026 05:27:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398c16esm487370966b.61.2026.03.23.05.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:27:46 -0700 (PDT)
Message-ID: <632d2e2d-82c1-4e4f-b477-96c5e75767bd@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:27:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] soc: qcom: ice: Allow explicit votes on 'iface'
 clock for ICE
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
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-2-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vFXBIV_3pKrPhXMaYE21w5J_zduxmmiH
X-Proofpoint-ORIG-GUID: vFXBIV_3pKrPhXMaYE21w5J_zduxmmiH
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c131c5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=SBCaeXWvHhY2KLIX7PwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5NiBTYWx0ZWRfX/vnwrNRilqd8
 dh+C895vWSIUNYO+6yIc3iNJ9yGxx/WX66oCtIcPS1QbuXZXB8SaHiHLfoIZYvn6cceck+NJAPy
 y16ph+2bBzJiX7Wm6HD5n7BMg0MtWjwI4KUV6wUZT3goMSxxZJRl4FSiMGl3onAL2drUNyhwWsb
 ZBTsLt9U9ZzTcvAPAxxZHKsmc44vWcfMwywSzlODh31Vn/n26W/5OzMoltoq6/cR+h9H7H+yoUY
 9oN8yDO6Fia0ewrzrdMN5nbPgWICyvdGhPJ8utqaPTA0K93VNLm9XhTK9nMETLeRpWGg5yfF/Ut
 D0S9/LwgKOMZE1WS/redplb1DahrV34uJPIhMFpQD3Sv2X1XE6AuFXoIBBKuV7Knr9eKsl8PcXB
 UD9WzE/jX5mziuvhgfyqN29FfVljhYYkiAhXfIFNz31BJkHaOSr1jBf4EIEsDhEaTsMSMk7AdZN
 kU2FylWiczL7zOsCzug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230096
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99229-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 33BD62F1F4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 10:17 AM, Harshal Dev wrote:
> Since Qualcomm inline-crypto engine (ICE) is now a dedicated driver
> de-coupled from the QCOM UFS driver, it explicitly votes for its required
> clocks during probe. For scenarios where the 'clk_ignore_unused' flag is
> not passed on the kernel command line, to avoid potential unclocked ICE
> hardware register access during probe the ICE driver should additionally
> vote on the 'iface' clock.
> Also update the suspend and resume callbacks to handle un-voting and voting
> on the 'iface' clock.
> 
> Fixes: 2afbf43a4aec6 ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicated driver")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---

[...]


> +	if (!engine->core_clk)
> +		engine->core_clk = devm_clk_get_optional_enabled(dev, "core");

This change is a little sneaky given the commit message but I don't mind

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

