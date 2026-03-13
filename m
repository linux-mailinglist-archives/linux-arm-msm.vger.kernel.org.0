Return-Path: <linux-arm-msm+bounces-97471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BqgC0IEtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:34:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D69D1283122
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFDB130BF157
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205AE394474;
	Fri, 13 Mar 2026 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkxRwMPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGd94D1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486503932CD
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405104; cv=none; b=C04z1R5ZZ3jxquSSfv1H3iSVkr2SFCCDtKOhLGdSZJ/EgoQjKxQCG/9H3lBSftGysKyla7buAZYhITeXUQFRYaFrvlPbZa7KVbSEVdKShKNijkX5l0xA1BPPeeUOu/mJrQmk35w36oRXyIDJSc7v9hEPa2eO3vpN9YlapbKIy2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405104; c=relaxed/simple;
	bh=8Ry2ynb+KiDywGGrzqZU68G1uv5eiQWYIw5qNed/54E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WN4nNDh6OND2o5fg62oLfO+zDghGRXB/pMgV5mcyMGD9OjphempxWHi/NpwWNN4cgRAOiGLPgU9J6FL9+qYuXMHLNrAPoZ9cMr7z4+9C2hb3E5TABDtcaN2U5GBXodVrxuZklgkT+ZoeeU67FIxHxC1x2PkI6j/8uT91Bn8dhs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkxRwMPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGd94D1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tj0c3342938
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3PwyZkGlsHck9FR5zvi65O/ZN6g4iz4HcJAeyFJ0uu4=; b=JkxRwMPDj1Wx1qJL
	XRRrxPpmchMpJBhGmQundROj4xY9HjdpCj5g5TuvfC85plqHShZHGf8X4q9Nlzkp
	RHR8eqSqbfcr0K6HueXLLhCrq+4llCwfijV9Fsk0jN0q/biIeBYD//UNqqCFRICD
	2P+VIF34e3Lq6D6U8QF85vfXgA+eXM9DLrXQ1cklYS7AnW/1uNAr/JtfsBAkEafb
	kNffXk26Zj9YvlJF0gyvTDYeHzce/r32Mtfb9IxPuBhSxoKjW2mpKqsZJximNA35
	FIFe+c8rTv8jV3VmEnYIWc3uRLNDS3FcazxD4Xr4qLE7epr0/vxNCusDcPaW8Xj/
	278s4w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4rdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:31:41 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94abae6fee7so336531241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773405100; x=1774009900; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3PwyZkGlsHck9FR5zvi65O/ZN6g4iz4HcJAeyFJ0uu4=;
        b=fGd94D1XhZC52y8FxQ+6kS9oPbNSJz8XjhGkezZ+iPFJwGA3WaVFwl/y7YXnHoaD/a
         0HiaBpuFY2UMDjEH84za2t9jKnHfKSJ+Rxz6kLu8C9UDVaiy41aXBV4AZiiusUnM/Sky
         7kt4Ow2ruGsntVLcJ5KcWP69Zt2cUXiA5bBAq4HmsVluhBYaCJ4cuJb5ONxgN6Kgsz6P
         4MbhDd+IS/Uq/Yn3jk9h7FkWiDbHnO61Hu+AJmfXw+2IBCjyoxLNTGIaCJ75zhOIrgxs
         uG6GnYkdb15op4hQXLjEZlZgh3tZD3+xZcAkvkfFUQffubG2qm0iz+57l2moRAqpGue1
         wAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773405100; x=1774009900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3PwyZkGlsHck9FR5zvi65O/ZN6g4iz4HcJAeyFJ0uu4=;
        b=YBsBHFXD1SZ3gw+EKfNBD4gG2Vk0sQJT99MmHXBUVE2dIXGBhwwpP4M3HkfZTFO7hN
         8K1iITjI1/+Pw494v0rrdipIa/0tpgT0YKQUEl3zvUV01Ac9XWMPbniJH0JFb+cC1OtB
         67hcZ7BSLZk6YbQPptHhdGjN9wNXWn4Sy1soAqIzoL/Lo51D3bv7RvdB8hBCy5txBTVD
         Vksd6e0rXID1MPlGWV2jqmg6YDM0X9gt0vBIWvqJSCmOYvQ9G1UZtieppfHRrdmGNKGU
         l6GPocf2rhi7G8VIJ78jdzO8TrCkvRHxVlhKqg4feNDMgNH8YU9yddug3PCzasLDXjnY
         Q92w==
X-Forwarded-Encrypted: i=1; AJvYcCW/SxNJP5FYYCwWM6GJaC7HiwGGIIXMEu/1AQV5WKtoFSHYoG2cTjlnHFtjUwAAE5fElQKRCRAA9+pfxvbZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzArjZJ+D0kcUOv1BavDnUqUijsrPCApQCcBJ+4U3yNklFp9xEb
	TxdQh2lnSSSGzhCC3kqp3sWZjtSrp5URF0xbIWdXT+lYTfFg155hMJS1SXXllrUb6wHFiwvsNrZ
	OCjKcPLzNG45MbvlfTC3iKtY2jsfxgjZ1ao0s1bQoVpbrNIRDJ/gTtV6UN0vELZmX4+gDp8hB4l
	lh
X-Gm-Gg: ATEYQzzex+MV8jVNyNXLB16Xf/W09vWFeD0cKUUhPCHOCniAVLoesdS4IARHINSewbs
	6e0tlg5QOsMHS4LqS7qQJ8L/9I1OHKJ49nRkE9/3BbppdaUqMyctwGDf8y5HvnWQ21RgjoZHL3f
	CkWYApwNoO1/rf/MNMVM0CVfH0iXYYF9Wggy2pP7VO2eu8DvcHxbRBNF0wAgcPQQzvFnzOIrf/m
	pbLsaW6hfFGnWsDtLKOlcJFITOPQTESTUfKGfnNvvleTtuPqTxdFTg5+rCOy1JOP8zc1FL2UTol
	wsTvzEpinUg7K84oV6YbSbcmvIu8XzH8oFihcSgW9IfnuTL0BrV3ZXKN9kBE7EVq1/hDRzU9gMg
	Bd0wf3VCS0j1EkRCJ6hkdufq2pGE0UmUiiBkgeSxs8vKfLmq14oF2PcMt5jBnM/hIPD0mDLubON
	R85UA=
X-Received: by 2002:a05:6102:4423:b0:5ff:c831:b99f with SMTP id ada2fe7eead31-6020e20fcb6mr601840137.1.1773405100321;
        Fri, 13 Mar 2026 05:31:40 -0700 (PDT)
X-Received: by 2002:a05:6102:4423:b0:5ff:c831:b99f with SMTP id ada2fe7eead31-6020e20fcb6mr601816137.1.1773405099867;
        Fri, 13 Mar 2026 05:31:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d096d4dsm43030166b.64.2026.03.13.05.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:31:38 -0700 (PDT)
Message-ID: <b924aa1d-c66b-4451-916f-d66735c61958@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:31:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: sc8280xp: Add Iris core
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260312-iris-sc8280xp-v4-0-a047ef1e3c7d@oss.qualcomm.com>
 <20260312-iris-sc8280xp-v4-3-a047ef1e3c7d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260312-iris-sc8280xp-v4-3-a047ef1e3c7d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SIizKBsmE70Rt8_dJcKbqH3xAv4eJ74m
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b403ad cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=NfRDy27ELDDfuPPzlmwA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5OSBTYWx0ZWRfX4BlldcrVOvNm
 C3aihbJHsYr0kC44qCqb7dZQt7W0H8qBvedoYRXycmC1huoEPvwqBQpSeyYLWsL60zqONBMP7f3
 AJLGVHaP3NLKSsehDbotX6DvTdFoOJBLaOA1iXoNrAN+R3ILZHHQ74rGbE0RwKEIKoTej/KfZpV
 TE3Q4Xt9oijgFjDgF5r3ZW8vaGykvccZRYoFDicVV6xqX15HUCfe/ySGRcv3DW0sMntsDLgctYt
 0bJxJ7jbrDKr7jhKdkYdDodwoMr6kxALlUYOp4Q1PxfBPUkICjLJbsCaCca9k0fHBy18UBmf7mO
 oISc4Jleao9VRBuPbYJmvZpeTMOp4u6ORrqrpzi/cNgoUpblWh98y7UQ4LDNqFvXFliB1uUOgTx
 YM4Yk8B4qwA7JflLyQLofe6A917B9EQJbVwzM01JuwONTsR8+We5nJmJpsoYnbdNX91q8PRROtJ
 Sxhqpx+3YB/aZEsSgIw==
X-Proofpoint-ORIG-GUID: SIizKBsmE70Rt8_dJcKbqH3xAv4eJ74m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130099
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97471-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D69D1283122
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 4:14 PM, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add the required nodes to enable Iris core on SC8280XP.
> 
> [ bod: added interconnect tags ]
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> [ johan: use sm8350 videocc defines ]
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> [ bod: dropped video encoder/decoder declarations ]
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> [ db: dropped llcc icc, switched to sc8280xp compat, corrected OPP table ]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---


> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
> +				};
> +
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;

Interesting differences.. but we talked about it last time and
I assume you got to the bottom of it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

