Return-Path: <linux-arm-msm+bounces-90936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGo8LHnheWm50gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:14:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 362579F4D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1BA18300382C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 10:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9CF2DCF6C;
	Wed, 28 Jan 2026 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAV5WuW3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4/HxNXI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C82D8764
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595253; cv=none; b=TfX1r2SIFFuZyH4CvaJuqIUYTNkNvOJQVJGpazcvtYzWiKpEwEKHy233QrgPQAuqw+xFKboC37I0d37FiAhOJnC5dlZ+MgUv+YbKz82ywgh6JMiApmD4/BI3nxXgrxO1xB8cY93p5Ufpz+jb4Pf1r2PZ3lOARf9iHr/4hFuO+X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595253; c=relaxed/simple;
	bh=buEGFL82JO8fTIAO2ycUIVJ8WjqCK/j0dMVra+EV6PM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PedtOa+l+i6uWzN1wre2V2iHQYW3piwnLKXXrdeRxP2Sv7lmH7TXF8TrNRnTlmESCReCC3Fb34QNiBF+EOQRMoApBrepks7GoI87DOg5dbmKwaFdelcxsqGxKcdFyd2g5DTi84VwJkc0ldaK+a5Mq8piYBh0zORBBKNAfWypsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAV5WuW3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4/HxNXI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S928mn811675
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B4T0/R/Sy8rbm8kzN/wI0qTxGCJL+5QCvhkl6NSkXMY=; b=aAV5WuW32jWevEVv
	07mo6a+oZT7dKZG3JmooinYySfnG1G09YkQER7C7Djh+Epg6EgJ0rkr/3E/GgU6p
	/EIpB9yFnHvw5YR3zL1lTHzMtQ2L0MdUmLlIJdcEzUGwhecbaWpYr5F3FOAY9mMW
	A6AZtCbE26WDs3jUFxxPNjJK3nsgYSUyZh/SWOx6QN6WXdx8qIFEIzlpm9T7eb4/
	NKVA0Di8dwgVbJ+SgEHYMTXMR27YTaJsV6PTMbMdp8tYv8ybap3OQ1DejyKrWCBX
	vavRSteTxgHMEGhEvVGGy7rxdKuHsMMLnB+oWqmIlm202w53zs8WOrhcLbF1SGQL
	dOnaDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbj0tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 10:14:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6d6b0f193so140251385a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 02:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769595249; x=1770200049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B4T0/R/Sy8rbm8kzN/wI0qTxGCJL+5QCvhkl6NSkXMY=;
        b=d4/HxNXIVGokp7mc777q6GZN02q0uX2QipUJ5d+HwDTG6kcPxQWWbpfMwsrMcEJskL
         Lt9BOxcnElYR4CLBdkYq8jTBUnE/fpV7GtFQhFfbYVC5EDyfOpiTLb3TWlCK3HnEeUpQ
         7EhPpRVb0slZO+iqXZCi6vtu1Lew6wlF0VvCABD+VMp1gaRbbGXPE8jJU3KswgQz9fyv
         FQFXZaQsvY+tzHgA3hWFZnN2NhxZ4rXfEqL9mxtV9X1VQIHcI+KD+h7/FQCmK3lSwlQI
         AbukJn1IX97RjjVvD7Rrrxm1SZ5qUZNp4+uw6OOnsaI3FbQkT6OegOODrWdewjumb9j+
         tRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769595249; x=1770200049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4T0/R/Sy8rbm8kzN/wI0qTxGCJL+5QCvhkl6NSkXMY=;
        b=AR32YIg3ZAEtRzRpD/pRJw4Vz+FBr1rusAiL7AURybb430sqNhXPGITB2TPm6phAQX
         Phdj0MOqc65Cj0s29q5HUS7h5gBT283r5aBbUK2XJo3r9mK4DA4fpeO9SSJ8ME53xeAL
         JO0u0KEjOjUOBkdl7b4vWZIHJXpAjIefTa6Ijrp7+753MaU1ZfRA7vrWFleCnpba+HYD
         J6u3suls8etWdbc7/aYbH7bWekxpQIzhj3sheEufN3nzhZix/kVUvS24Vnp26gHpyayt
         xBGV2OaZz4GSMp6aWhDBj0uJfy7rw2bApifl6MdCRZeT5XJK2hoTomn1K2hzMWnkj6oJ
         Wqsg==
X-Forwarded-Encrypted: i=1; AJvYcCXaaNSXC8C1YZFqLq7w4xiJNYUiPlRSU/pKzJumW6eWvGUgebS6//e5XJv4/XX/zqu1NSjbgGghcJMq3L3z@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2mvp27FEIobZtePPBXI8JDeQri4S61ixmNqOm/A9s+Mv2mhNE
	fwiRHFdoFUstAFePKyc0lOWhzqswUh6hZEsP4J4lv85qilCJdd7ujwz0QvcxG6fvfHitwLjGPvT
	hZqbPCbQvaFxfwrP6czQOIOUDFD4epX6/cC1jiTpF0yg1xeZqpqK0hwhBau/m0lEdYNum
X-Gm-Gg: AZuq6aIW/iqXiRPcknrtvzLL9vu4wUU7KQLGFDKhixYohN6VON9ojabykPL60hWkjs7
	rQAqRy7F1TSliLDOT+pKjoSEiqMBo3do7NlgD7w8KPLCSzHmbwkqb7Y/jR2VOfGaj+8+TwhVbS4
	9KDq8qNcoH/iuyqNYwtGiUuNKr3CbQaYTUv63/02B2T5c0/51xsiw0k3BqKWcByMekAX8gvFgCN
	NHaTehkX99IJhQ3PuRsxIfIGbDtnhqlc2iH14/nYLNuE+1x53p3PvCus5ENXoStELo37OgcQ/rM
	s2LfXxbeZM9gfXIZaYYTtJiKOw/r2x67TPiZIADjzO9AWk/ZPEQpA0PCpOWPad+Y0y+QSnw52k+
	S0uI7jUaa1LZL4S+YruWBOA2xTG0eKQfM1QuBwm7sGm2Kvr3Nko9bQaWSPxtFtVAoKf0=
X-Received: by 2002:a05:6214:4789:b0:890:7084:c6b4 with SMTP id 6a1803df08f44-894d78404a4mr9913686d6.3.1769595249298;
        Wed, 28 Jan 2026 02:14:09 -0800 (PST)
X-Received: by 2002:a05:6214:4789:b0:890:7084:c6b4 with SMTP id 6a1803df08f44-894d78404a4mr9913526d6.3.1769595248865;
        Wed, 28 Jan 2026 02:14:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ae22fsm1341731a12.35.2026.01.28.02.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:14:07 -0800 (PST)
Message-ID: <0dfafbc7-5623-4851-b1ee-112c4a97f7b2@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 11:14:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Wvgbo4JqIJnDcamKE807nRx5z6gD0pXq
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979e171 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LG3DDfy-6M914-NHDhAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Wvgbo4JqIJnDcamKE807nRx5z6gD0pXq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA4MyBTYWx0ZWRfX2uZ3dYhApnUb
 lhJtbbCEOF8NVI1dKI2Ho0Uu3Bx5bH3RTEmdJaSIjWLDOfoH+SzP2rhvTRsdSsOvOoc6HFnBjmW
 qLXiWPES3llEbWokgfmxdczBiON/QHD9h9LXLY3oXixLve+32yvsd354vT/ve0ybW05dyP4N5vU
 9BSzJ9z8Udq6mSHY4jAZUoi3dU3JruGLU79pw7axHdQtS0Vk09T5wnWU8GroltN5UjwrNYxse18
 1sd+v9U20yq+Dmaa7TZTF742KwOojqRnMGciPBTcJdIWcTXHmM2htYMi/zVc9KJ9WXspeETwdiI
 z04AsAIABKmrup+kEiBvb7YwEYXK3hxrh6oXQjGnN7wUiCJrofgHos+63bVZsDPsjJGbZjK5krS
 4Rn2FDQILPZnGCoSgyM8QpXbwV5fAZlAwvozYDjYf0M7cVs4t6Wih0Tl6HEcMQtpw2F2YY4xFj4
 AIHc8xqlk/0sX7M47qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90936-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 362579F4D6
X-Rspamd-Action: no action

On 1/27/26 8:26 PM, Jagadeesh Kona wrote:
> Add support for camera QDSS debug clocks on X1E80100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

