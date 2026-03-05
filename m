Return-Path: <linux-arm-msm+bounces-95504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCXsEmMfqWmg2QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:14:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E436B20B4AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 07:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9B08F306501D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 06:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8FD29ACDD;
	Thu,  5 Mar 2026 06:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYPtjXOZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVwGxuxN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E651F29A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Mar 2026 06:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772691206; cv=none; b=EIa6UdsIOII85ssj69IP8sLzOWw/LdpvoTBzWQRSrNxQwNJgjpMaT9w25mSZmSptRUMILE2OA/8XkvDIAOkkE4YkxeZo0wp+xmfBCsY5Ck5vM9H/u6sZCMUDMjMFfeLBuRSSlcTcIv0SN6+2jdzKrbj/clDxlP7kIiYPrgLfLwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772691206; c=relaxed/simple;
	bh=vhrvQ9dwq0ppIGuIa309wg4+kuzVIOdkYprPCJQPGJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myO1pzSWcfIjqZQ5n2alsK6Z0pkgL2DiBJFM800h7IPg5G/NytNC5ACMz5FKVFo1fPC5N99wnIeO/g6stt1O9tKpWyfphpWavvXm5WzYV2a+m79x/nW1boqJ2kctyjquGxl59ieiL6CzqxxJilQtlRNPmylrc5QQ6YnQlsKVc6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYPtjXOZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVwGxuxN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6253AJOs865569
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Mar 2026 06:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8TIHuv4Fnv6rdxui6Fmzo4+u4z36yJPLBHyAOUxU9hk=; b=pYPtjXOZIek0kWUd
	fUty2YMRt5qNAlUvL+tteCLxkJuQi6aOGgGmAfwW08Zo4BHaiHbtt9Xjz5Z1KE+z
	p9jekd0UdThbDo1E5SxYteGw7Eyuv+WYEg/46aHNpX/TaPkQARl7NkPV2ZqsUJC7
	oa0BGNb03zWRXH2PuTJx8neLF2gcOMc8JLPT4rXbrq20TxYUAFg/8y1Nss3DYQL6
	vQSNkeOiVEQMnFzySOE0j+iY45aGfqYsRkYuINE5c5yR+KztLPM756bdjcsk+hIy
	/Yi2Bl9Zz5UDx036pNMMmya1CF25UShd4TtHYb6Aw/GB7hsCJUDdVbB7TVDiE0TH
	yrJswg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk0fpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Mar 2026 06:13:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae59e057f1so44443775ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 22:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772691203; x=1773296003; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8TIHuv4Fnv6rdxui6Fmzo4+u4z36yJPLBHyAOUxU9hk=;
        b=TVwGxuxNlF4R0KDC6CLPWpKL+CcHRampNt6GAmk2txJG6CMVJojYIjArzKxNs5Rnid
         EQv4ok/dWqZnGwpnxgQjcwzGnvjc9ENg/gn2iX83xa8fQRJebIFp1F2fiSl23o9hi6I1
         SHMm2N3+S/vrfkLNDAqMfW2ssYlGLEM/bg+PwkNrKBW8jkR018Y+EEeG5JB1QPKDR2qc
         g/pc/xDd8fFLn13ol0SbaY/leVjJSmCmCSVZA54BinKeE4ODwsrFWnpralZH1Gqs++ZX
         rA3tnaIfZWiOzcrEhi43O2Pv7mtsIF3cEK4j/yErq85cTK8ntJ6G+ZKE/64pSTzXMbOv
         R8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772691203; x=1773296003;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TIHuv4Fnv6rdxui6Fmzo4+u4z36yJPLBHyAOUxU9hk=;
        b=X6EO/8duM/zFj7m3dF7Ak4fhb3jWUbFGZb32NUdbvw4D+xPPhwzvjpyzTPDDSzKeil
         QPZwF5GhT2H5aCpfiJXg9wc04U2TIrRv/qbymolW6rz0tFUyd5neP2VfFnbRT0ylXtlk
         DNeaLUPNFPt4ioTw7SMn/g4Il26ALFkLsL8TEsXEAA6/RBD4Va4o7NGIzPDt5p5K/SCH
         IZ0hIoRzTT5Glysa0XhnGYFefQC7uStV6bhUJjl45Z6aJ6ERkYvTrm9pD9FsD3OTmQBg
         pDsP6Vrjvp7CPdeHkQ631Pd2xBNrw8Wy69TfpDUOOwsep/MpnjqViPLMWRQWyW/fWLIA
         b9+A==
X-Gm-Message-State: AOJu0Yxy4t56J2hR/OOyvzATtzrryrsSvs6cNJoE1NtPMq7nZv5JIISX
	w4ZsAqzN+jGdxQ9IeFxLzHjd/569plYEJvVHUbVqrsdmkXhRLGq9wrGXeqzO3x7gMvt/Kq37XlZ
	L8VgHxaUHufzhjnWeqk9Bqh2i82rPsim3NPRd8C4aM38PtXhEsoZ0TdDQHiOP0aVF3Zji
X-Gm-Gg: ATEYQzxvxRr5SOsmycrXouSa96LIaYVvktecnGmrOpBWm1Nfk012+ISya1NdAVGaQnP
	W9cCsURx2r9rc4oUR3GYshMgS1SlF4D18gFT+FN2/+n6p4cNnod3A1XYNa7mOLpEpgjPJtc3akx
	/0UO+cWls3uBLQcl7663vbjbKYz/KlKyuAvuemweIl6AA9lm9GG+0bvG++p9Ld25MFkuAv16EZN
	4Q0P/hDFxVb6AojEhDu6bDJye0yAd7p1bRbh0Wt1V4bIu6BwQ3oxjK7oPlgPeEpeFbxBOdJVEMg
	Y1uVh+ObzPDwOqINfctKB7D3jjlBUopTLmy54FutbQjhl81hNjG+qmHWoquw6VZVjCSNpj6Xf4d
	xdfFaMsgAUCWSAM2AA8L04/jmet4j86SMT8S8AJG+HI9SWKGWhw==
X-Received: by 2002:a17:903:2ace:b0:2ae:6b54:27b1 with SMTP id d9443c01a7336-2ae6b542ec2mr49745705ad.40.1772691202864;
        Wed, 04 Mar 2026 22:13:22 -0800 (PST)
X-Received: by 2002:a17:903:2ace:b0:2ae:6b54:27b1 with SMTP id d9443c01a7336-2ae6b542ec2mr49745435ad.40.1772691202331;
        Wed, 04 Mar 2026 22:13:22 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69f283sm213061495ad.49.2026.03.04.22.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 22:13:22 -0800 (PST)
Message-ID: <828866b0-d36a-4818-b070-221b63bc0d0f@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:43:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: dispcc-kaanapali: Fix DSI byte clock rate
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
 <20260304-topic-dsi_byte_fixup-v1-2-b79b29f83176@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260304-topic-dsi_byte_fixup-v1-2-b79b29f83176@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: uR1UumG2NrgUfcb_-9cP7VmGXrEvhtaM
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a91f03 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=L1D1Xunng2Nf-P3W2EkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: uR1UumG2NrgUfcb_-9cP7VmGXrEvhtaM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA0NiBTYWx0ZWRfX9tcc4dK4tJm0
 p8EvWC7YH7G6XnaJ+CkP9obu7swj5bzFyIbhDVVnPwgO857+HR/FFLfUkQXz8ctvZxwZUgqrI8l
 PEaw9oXlzPf56P5v4OWdd1bKjPSHIMa3gpq/YoZGeYHNnRVC/pkhmG7sGpuixK+taRUcy4oeZxn
 mkllEh9h8WIi69OM4E6e41ICLqzmxtFxp9wICrjxsS/EehBKmNxxCSgMseLdPguQSQBFmpFayqI
 PmV/gI3AXMTpOBDcN2nVuO5MImuWXkOTrk/+9PcB81qVuUEFUlzu/UdQVAs2lCAfvV93E11MHNx
 xHviG0Uk6VE+Xgv5O3YQ38z9wuAngr4lajVz3Me8a9lH5miHdC9yYHE9r+o5QR8nsI1jo+VB3qd
 xXfA/N0NBdQKkBRgYruQVW6/8czrz0mcingqNQDcjY+3oi8HX9o/s6YdIhPCy28b8hLK9r3G1g/
 zDvhHQKsZI8IkVG2g2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_01,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050046
X-Rspamd-Queue-Id: E436B20B4AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-95504-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 3/4/2026 7:18 PM, Konrad Dybcio wrote:
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
> index baae2ec1f72a..c1578cd07041 100644
> --- a/drivers/clk/qcom/dispcc-kaanapali.c
> +++ b/drivers/clk/qcom/dispcc-kaanapali.c
> @@ -800,7 +800,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
>  			&disp_cc_mdss_byte0_clk_src.clkr.hw,
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_regmap_div_ops,
>  	},
>  };
> @@ -815,7 +814,6 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
>  			&disp_cc_mdss_byte1_clk_src.clkr.hw,
>  		},
>  		.num_parents = 1,
> -		.flags = CLK_SET_RATE_PARENT,
>  		.ops = &clk_regmap_div_ops,
>  	},
>  };


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


