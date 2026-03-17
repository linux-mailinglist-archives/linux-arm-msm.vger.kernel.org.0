Return-Path: <linux-arm-msm+bounces-98092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBM8LsAJuWk/ngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:58:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4F72A52B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11F34304C955
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 07:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB3338E11E;
	Tue, 17 Mar 2026 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhO1BVVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ioKglfqP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E673932CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734159; cv=none; b=D+BIgU619/GDqwWtcYGHkrqulNUdhyjDOB3aS+L288FydVgWTGJWAKvgBxU/BP9TTGNl03x0I/Q5KJgNdTYUM2wRhSQKO9ZQFO2TXWG3jm+9+VpU++Ej4t6TEvm8bleHJGEtKMhwe27Lp4Kd6kclI5Ixw6rSuYiKp/el9cMCqek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734159; c=relaxed/simple;
	bh=7yl3GR1QXQNjyAVCoO/3SZ9y7ZWUSE3qFHHNEg/K41M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h3zTCG4yz5JVqlH+nX1ec6/KHUBXjeWPHjjmAIsE8bP2KBMPq/phTVSzrXXXtTLn6tUAkeMTGZMhappeRjRZVrDujJtTlofG7TAglIrkSj4gmrmPK5LdoRnY47/r28Apk1eYGCBw7dw7JwymkUUiQOC9XwWOc7cJ45OlCSOdWGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OhO1BVVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ioKglfqP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H64lTe1623660
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h6bXcsSsuFPm/9XTcNuJ37Rt9YpYn4KJga2Hs9kBIOQ=; b=OhO1BVVMrmYI3lad
	vweazq9xe+9fd4oEaF61lzUDysZNBnz60lRNq1T5IA64SHPWerOUeMTgxeGzNo5S
	jTMZG6nMdkwMzCEDSzHmUBctheAQZw5KcAYChlRR+iZRgk1wo6wJV9u5hgAQRGCY
	l2B87nv2Px3qjCa22dJFVKWJGQ8KnrPBUIRqon9VVgTUbhzJc0sOyeEHzWX/rKWO
	LBnW+47NWy5yTuXOatF69hkRk5idNnU0egGl1L7fO8qiqshvnL3ool7Q8DHStRdS
	7ZAsNAGMXJQggrJifjTWzNYv5DCPQkmnu83R/j1u7PekeNMmffMMOi6EKgRvOCys
	9fPVZw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyekjh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 07:55:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b9894f9ceso2699858a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 00:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773734156; x=1774338956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6bXcsSsuFPm/9XTcNuJ37Rt9YpYn4KJga2Hs9kBIOQ=;
        b=ioKglfqPVENqhRyVN1+i/gPF+qQflNlAulkuWUNfn6lYk8aReIWrxRvZuzS7dqjfvE
         J8BAw3Rg/mShehIkZB36ftvQhK9OxYmfHOAhec21YMbtzF6ovXl00FR+/FSInpsy3L6j
         jhPrah9NR2okMo0YP3EPS21wmINcmqmErwG0jza/+bDyE6G6zZ8hlLxqtLOFxTpGkhx5
         xWKuDAu/4l13QFJV+SiMQMfQN6kPjg/RyAujHjIkebu7872wwS2e9i5viRBqe6HTnXV7
         RqYzWda5xfBrx2wIiLwgAyla1JSSQVlDKt4dVwwqfEUTIIaCbjhp17PpiGw8+lQQb/E+
         WB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773734156; x=1774338956;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6bXcsSsuFPm/9XTcNuJ37Rt9YpYn4KJga2Hs9kBIOQ=;
        b=WBKB7oYHuNw44Sn055DnAiGxLYjzkpcKeBIFbdShifpybUMyX4IV+H7ufSe/8jfX0S
         y+0BZeJtRejo4r8Xsb0URMU+g8yHJ0FHuODiBRHb3R3vIIW1odc2dP5L5tKO9k9hRM/F
         51434w8bT5aMRwNtEVy0cocpmqcBveCoiY6idwuKsan+ZkxfKe7diuXToy6XwSDylv5G
         W+Y47XU5+kX/t4yI8l+WvJZqgzd/DUnFlyBGmp5eb2uErnELPHVRpKcMIsdcqI+GNgKE
         /JAQQfdY8pmeC8pCwmaGfAOZRjGOYh970uU/qgfIkWfmUGe4bL4ZNWkJSshtvkY0sTcN
         rvUw==
X-Forwarded-Encrypted: i=1; AJvYcCVgR0Awhcz4xCQM9GcvY6AWnTpNbAHf0T5NIhI4HfAG9Ufj7dqczT0WFBsjayggGlAFrJWStI+7bmX1UDzH@vger.kernel.org
X-Gm-Message-State: AOJu0YxH1JM+iB3tLtWdDXM8sX9vBqq77ZUK39haw4fydM2lxaja4EV+
	36PRP+kSGQrCryRZKDzZ11whelMNB7hHiOIy4qeUKKU4qbkX1rto+Efij1fUtseaSPH3xQloRXF
	2FZwFmnU5wzIPM+N8aQ4ii3UitwPi8kZ/htpQPC90cEAdj+iobctddZ/4aKv4XBqGw1IB
X-Gm-Gg: ATEYQzy2YxUQFigeBvBlp+nTOtmRJMHAedkz+DcLF3cKyJ5gleKoftPyoJDh5UR6Rd5
	e24q4/2wh3uHyRXBUqlLlpacgRUwebP3sS6MjnoUMCRBYyJHGhxUPhaKascwTsjjoHBLsHndbWC
	51pUASqx6CqeYKeLIjHGwjQJSYTnD1ItN3+d4tDnpoADJPM13KuefjgxjqYYIa635NIPWQpP6Hu
	GXY5nIjXzWq0TmGbGtHkVrpBGswKpNXQ4l2z9+uHD6T+ZE6uZuWjnFQ6JPCIEooMAYkTo0yJ4KL
	1OPHV2QSplv1lZckJpX5nJVkthjMm0R+JvtU2smtSd3Kx4nmO69LDfzE0UgcXuo2hUWqFFVrqfS
	csNjElWsIvrFbNxKsvLOCCcSZdJQnZUcuq8hNkUBm77RJhsGu9JMFpQ==
X-Received: by 2002:a17:90b:4c90:b0:35b:a168:9671 with SMTP id 98e67ed59e1d1-35ba168a268mr5233520a91.32.1773734156462;
        Tue, 17 Mar 2026 00:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:4c90:b0:35b:a168:9671 with SMTP id 98e67ed59e1d1-35ba168a268mr5233504a91.32.1773734155993;
        Tue, 17 Mar 2026 00:55:55 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada47123sm2130189a91.8.2026.03.17.00.55.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 00:55:55 -0700 (PDT)
Message-ID: <78c138a5-6a56-0727-6edc-a6075d17b2a7@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:25:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/6] arm64: dts: qcom: hamoa: correct Iris corners for the
 MXC rail
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
 <20260313-iris-fix-corners-v1-1-32a393c25dda@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-fix-corners-v1-1-32a393c25dda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Z766TWL0rsLLb1mDFZqSDg4ujokqVe3b
X-Proofpoint-ORIG-GUID: Z766TWL0rsLLb1mDFZqSDg4ujokqVe3b
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b9090d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OQAnd7aFVPVlcVMD3vgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA2OCBTYWx0ZWRfX3R+fnPDamvxM
 b9Vpn5D/eiieXXS8D4tyXOLGJs+ae6Ol3z+yl4jwlkM7D0HN38vaQtOxvuQ8SrvtYCwXpN+QU6o
 UDv+BGgqymuMM4AJK80J5guLWwc0jSSslskk8ZPFvhr2jlVRgRL2YfJAsVKKSgPQn9QJqHA/ysD
 xKyg6ia1PbD9yUMewYgSRtsvlxRxqwo/q+OcFCx601GZuJsPAVg8BjR47bv9mkIxWhVuY1X7yRe
 clF/McUfqWsPNR5BU+e3krcrZZO+YIPfyWF0Id43QuOKZUU9rg2xhExGHwBPGtUQesPs+20poIl
 kQcUPJlEKhLNzlXl6QtqsC+6U/s5IYzVncPQVapQ5rGRge2GwmvVIUE2M2KFZlfahGIfvC8JaGe
 OXDuqJo7zXBFWkoSKLnLMwNgV8oCSqZWwPSQ9DlrhsSypJ+i19Wz8vB9wTLLcit6AFZrEQN13CA
 OQakBGL8D256XHlCkyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170068
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-98092-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B4F72A52B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 8:57 PM, Dmitry Baryshkov wrote:
> The corners of the MVS0 / MVS0C clocks on the MMCX rail don't always
> match the PLL corners on the MXC rail. Correct the performance corners
> for the MXC rail following the PLL documentation.
> 
> Fixes: 9065340ac04d ("arm64: dts: qcom: x1e80100: Add IRIS video codec")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index d7596ccf63b9..0866e9e2874d 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -5432,19 +5432,19 @@ opp-338000000 {
>  
>  				opp-366000000 {
>  					opp-hz = /bits/ 64 <366000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>,
> +					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_svs_l1>;
>  				};
>  
>  				opp-444000000 {
>  					opp-hz = /bits/ 64 <444000000>;
> -					required-opps = <&rpmhpd_opp_nom>,
> +					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_nom>;
>  				};
>  
>  				opp-481000000 {
>  					opp-hz = /bits/ 64 <481000000>;
> -					required-opps = <&rpmhpd_opp_turbo>,
> +					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_turbo>;
>  				};
>  			};
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

