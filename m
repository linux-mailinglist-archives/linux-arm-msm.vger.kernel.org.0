Return-Path: <linux-arm-msm+bounces-96710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM54N6IrsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:33:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 492A42520E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D997349F42C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F35397E9E;
	Tue, 10 Mar 2026 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AV/e0rwm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPKahM39"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51222391E77
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773152037; cv=none; b=YsF18/ErPfsXbB/bg3KpiI/nsjRkZBJBOwk4roRKiE2ehk7PMnYF+ZoAfbR/PeApAbpY6w6M2eqeIbjEfjALS1nVKpropXCSeHUBujKqNKxVZBB3QoDs9tgon1hR/l6i3hwkqCL6BQv0oA769h/5ba4F3mCUl9kHlPzqPO/8Ts8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773152037; c=relaxed/simple;
	bh=TgyjPvdRcam0qo8VsSYVIapChIfqCnvkFJzQeUg7kf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p/7qpN6Y4ATyprTliv5+bC4DemJphIfKS/M0uDayhS6tSUwn8Mg1CrUem7xhguU/U2rP4fSTpVV5BoVNRN8if+L4km64hulx7uIuW6XcTrMUPdlpv81Cewm5hoKiKEkR/ExU/3mX5fwHsvKCezj/eFi4tN9R9I0NTQiLLVFz/4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AV/e0rwm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPKahM39; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaphs790196
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa+gULIzj+R2VtMLbbQ8yLiDMiRWe09PKwmLNCGVTQs=; b=AV/e0rwmZSB3iqAR
	IfFGhVgsnZmsZK5nYHmca/HF6ZW8kMEnIgvLePHBd7XnoA8nKYmZGQU2edBK6oHJ
	a1nbytXTBaI9zlrZc/dtrAqSWc6Yw6GauTn1ziUfJw+ciNMaiU7TFsfe7CSCzzaI
	Fcl3Xstxstn3NKblz4ZYMmFoaAVaId0E/nhiT8nhojHcxp6BQTgXnnnKXak5nIyz
	ZvSVGb6tTNPY3uYqxIZG9hmHKIuX6TjO2PqjOFt9E0ATX5ZXCxhFjPecLrkgkWk2
	Xlxh2CCK2IlehMYAA1AciToYNEA1J9xmalZOm7TWm9DH8gRmQlWYIR5wTe8DYcb5
	xMdyNQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekv7an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 14:13:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8954b9b5da7so5462826d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 07:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773152035; x=1773756835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sa+gULIzj+R2VtMLbbQ8yLiDMiRWe09PKwmLNCGVTQs=;
        b=LPKahM39lgzYLdE90SbBFizZAKPsimZrJieBl6MDtpCwZbK6pBayaRfFcyizhB6FWs
         btobqroS4P9UlXup8M+igZPmOnIzLE0SyYw5iTfDDJMHaBHrNiQeLN68x1KVzCFW9HxU
         SzfPWGf5tDliXFlXqordcEH1ik/v/7rl9CdGWcxT6gYNvvyYfv1VOIMw2KVrgtkwFXam
         ckvk6LdvhisAysWTHN7U7e5pTlFJjaFtnzS2BYuAVyFpnKxvDG34UldMNpg4cjhsxSj8
         vX28nvxp8b5xfrdXcMdKvm36UtIz4YhEQRWBmY0W1KT8180jUmbnkm9SBn/rcOxGsAvy
         phvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773152035; x=1773756835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sa+gULIzj+R2VtMLbbQ8yLiDMiRWe09PKwmLNCGVTQs=;
        b=TQ14WaVVJBsZF99FlQanWmT3KbEPPOp/04ncd3CTyf5pjJvEmhybx0bWa8pFSiSQnN
         hE17LMF2ElsWq4ocdso+r1l2OYVoeRg5SnxAlpbaRJnWv+o7/3YWSzH0qIEKQvi55J1Q
         Z2rvNzATXpS42XN4cxi3SIb/J38e4pqq9WPJm5tQGSGgruGQtmXVtUl8KHWX9YC2mAPS
         AHP2WzkkWTbLrsxWrPPkdPJPSONSZIucz9dHhOxzUsq6FN5Sz9YZ2yWlEP3UH6B1xD8R
         CK04pcTJcXt8t4qjUsLdCxyECldBmHvBch8F24XaoQdYDE5GotenJeeik+MkcWCpeIot
         2flw==
X-Forwarded-Encrypted: i=1; AJvYcCUGCcgeMzySi5coWrW0hdVcQKBxLwUgu5HA9MnRb9A+YCSV9OneecgLdUbm6jcBJsZBMBJNjv04X5TLFOHL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6VBpgrI66Eox+yfwTa89OXQ9kGlM8Z3/RtzeuilNmmZ1YEnTw
	6xTwHLTR3loibygt8hmi8wqzCzHGuv2kCJE6mTX7z42jNKSX2p7bDDxawp2vBjfbwnxXxGgtLQJ
	N2n3Zssw70b3u9zCY2uHvr/Fapiy+iFx/0/EUoQXVucBWjIlL9fh4nqxN7QnTArMbn70z
X-Gm-Gg: ATEYQzx1bHeKw9whc+fM9AtRf4QIAKefILOhaqnlv+TQ5A3Y3WdiUMo9SR0iJEspZUp
	PqS4+A3h2Z1lp2427Us/Z+k2Z0SSxbGLNdJgdP9X/KwGsTv2skNTX+FcYc6N22+ixSTCKjjAqaB
	3k/AI3Jcu+nZA4wIctYR3gdobnMdHNJZG7oDyBh1uPs0cjZwGYHB7qbt3a2M5cL0Xg0fCvvbfTS
	rv67FMyBSq2lgT7mrOEKVzFyL/VmbgyPWIdOV9NahiAd6bU1QuL1kO00umkVR5eqsmsBpXnWinC
	CjMC8OmB79tyiaQy7tg0OrIjfvT9dJ4UjLUO03Ll06wJ8dxesVORWTKwr4/8QJaNqSmScfA3dQu
	kTpFoN0edtrX01Df8hmngTMe3cqLzEivToDw0LKPQXueH5JpoB1SD+q6KDxzPwkIfWTbuamiH9r
	lHmnA=
X-Received: by 2002:a05:620a:45a0:b0:8cd:8d50:16a0 with SMTP id af79cd13be357-8cd8d501f65mr624307485a.3.1773152034692;
        Tue, 10 Mar 2026 07:13:54 -0700 (PDT)
X-Received: by 2002:a05:620a:45a0:b0:8cd:8d50:16a0 with SMTP id af79cd13be357-8cd8d501f65mr624300385a.3.1773152034121;
        Tue, 10 Mar 2026 07:13:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd67f1sm4239660a12.22.2026.03.10.07.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 07:13:53 -0700 (PDT)
Message-ID: <a92cbf85-5937-4aef-985e-a5d12031d4e0@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 15:13:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: crypto: qcom,ice: Allow
 power-domain and iface clk
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
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260310-qcom_ice_power_and_clk_vote-v2-0-b9c2a5471d9e@oss.qualcomm.com>
 <20260310-qcom_ice_power_and_clk_vote-v2-1-b9c2a5471d9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260310-qcom_ice_power_and_clk_vote-v2-1-b9c2a5471d9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: daNzN9Q0y1ClgSydAH_2gv9EEFJ0iZKG
X-Proofpoint-ORIG-GUID: daNzN9Q0y1ClgSydAH_2gv9EEFJ0iZKG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEyNCBTYWx0ZWRfX5XF1fUp2X8cX
 L+rRdmnUN/J0YR06z5B2ZTQmNub0LJKF2Ght80GUTukNSJFaSZ9oGJ22WgEcoCDGIXDIvI+qlji
 NkzcMu7pdQOaCTWWNaMWvKQWpw/Tp4PobKGRpWsLQw+96kKvd4g8VCp2J1XgdO+b82W/u89UQ3V
 B4B0UdL4YpcJHi5BjFeJhwngPv8K3CeSskkCYjmN5vHBdQRvBGWy995k2Sr9ZKKfYq0v7N3kmMX
 LQLjbHdn5JBcNwpB/ChxkkXtf5rxc96xPlCjCnXkTHaWeo5Bo2j8lqYRL27GFu3kS7dhAH5twWu
 r6wKgywO7Y5ZIpC/bweIU4Ety4Rwoeg27Kkbr21s45J5h2UaFLBgEt3fInMOq31tTZbIs3C30Y2
 Mrocb+jXFgZDAfdBrFqP+SAYyNocgt93EmOXFa+OUVTCZNpjc2ZUC2oo8A/zBARw/E1APVe3HlR
 1sgH8+KktUEXYdqhQ5g==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b02723 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=T5VBltHwqSPm6ePZaXsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100124
X-Rspamd-Queue-Id: 492A42520E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96710-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,quicinc.com,gmail.com,fairphone.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
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
X-Rspamd-Action: no action

On 3/10/26 9:06 AM, Harshal Dev wrote:
> Update the inline-crypto engine DT binding to allow specifying up to two
> clocks along with their names and associated power-domain. When the
> 'clk_ignore_unused' flag is not passed on the kernel command line
> occasional unclocked ICE hardware register access are observed during ICE
> driver probe based on the relative timing between the probe and the kernel
> disabling the unused clocks. On the other hand, when the 'pd_ignore_unused'
> flag is not passed on the command line, clock 'stuck' issues are
> observed if the power-domain required by ICE hardware is unused and thus
> disabled before ICE probe. To avoid these scenarios, the 'iface' clock and
> the associated power-domain should be specified in the ICE device tree node
> and the 'iface' clock should be voted on by the ICE driver during probe.
> 
> Fixes: f6ff91a47ac57 ("dt-bindings: crypto: Add Qualcomm Inline Crypto Engine")
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> ---
>  .../bindings/crypto/qcom,inline-crypto-engine.yaml       | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> index c3408dcf5d20..d9a0a8adf645 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
> @@ -28,6 +28,16 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: ice_core_clk
> +      - const: iface_clk

Trim the "_clk", we know they're clocks, because they come under.. you
know.. the 'clocks' property! :D

Konrad

