Return-Path: <linux-arm-msm+bounces-99415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCzCGua7wWm/UwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:17:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA752FE2A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DB3D303DD79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D9538236D;
	Mon, 23 Mar 2026 22:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGRv4RPi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FHldqD9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139CF3822A6
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774304042; cv=none; b=NjzGqH3n0KUSLF/INXz5sc7WfTd8NJiyfD8mHrTZ8SU8RwyPFQCJuv+xSjwaANewPClqbPp2YVecH8xlAU3UQpiPdBySUtSvvZYxaRS2EK3fe+pX8LF0VNgpqIkBzdzV3zX6d/rliF9W0TtRqA0wi1tcuzRq6qjb5KUKi9FK0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774304042; c=relaxed/simple;
	bh=lh6B8bAK/G0Rf35K12CO6wGGToV6Ja1D9X6uvV20i0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XNKdYMcdCgpUsIfcFfZAKcDA8MFiG0UaDn3hwKL1cFW8vlH+3B+WJOhlz8/ZLIa0DbEJuemI2OFzd5fEHM7jiwxC8HIHz9ONSumBKxWVt2blLhhKiLDihb3F05198cwCm0K3tmSLmBGm38dFJbzKuFPErlP00i9MtcThgDKHtuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGRv4RPi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FHldqD9R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NIZVMf1910729
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dq4WugyVxIXqcqDiAoenq+fof3XUEe5Rj0U0/uKDZ8s=; b=HGRv4RPiQNmsd1lE
	ukkXrXhU1yLPOlBfOJL8xB9jpFZbpyqABX60JHE6Nalz3lOkpK07Rb26J7K/pT46
	2mKix00o1u80aK0PVzZRM/BAcSxKqH/uEXl5qILbYN/n9586ybjqMnZMMUuRLq+2
	/qhuqwXcLVp54IhtEC0E+uV5Hlfvs+XU1stleWbyG876hMI3w7SpTDb/UeyekAk2
	fx8XJz51bcKai+reyFwhdQ5B44DPjQu1dRmRDxZMnTr6AmRZDdZONeOItjeFJmFs
	lnlN7GUGgZsIWfd5h1x7lY86inc2mib0IzSvm/CpEfmEn3urjW8FhBHj1OcUhAW0
	XDvj2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awyrkvw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:14:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2cbe7223so35876281cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774304039; x=1774908839; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dq4WugyVxIXqcqDiAoenq+fof3XUEe5Rj0U0/uKDZ8s=;
        b=FHldqD9RsyicpFJvvIrJgkT/6ph9wQyrzevnbvLlSkSF07NpWRGFFcB39w70ekt+jl
         tAbVpYPjKmsrit6nWVFTqUDOThroP4PlYqIfAFdmyoXngmdgGF2sitFeb61gKN/q7nxE
         rOeZ1opzAjeLiAzFPfjvgNi+usdA6Xer4PIK8WHf6iflMviZ/qUX/6Bb7GJLe9HqLjzP
         AxA0d4EaMuI6NXf0p3cGUI10vx4Bh3dV7gi0R0JHYYRQPZJ2S1ToKCpVDLF3isvdtBtw
         V3uhuWyzh1IMx7+PIt/WbwSS28QXqOEGypYu9PGcROeYMHqfPkP2ZBt8oustCkPZoGvi
         MqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774304039; x=1774908839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq4WugyVxIXqcqDiAoenq+fof3XUEe5Rj0U0/uKDZ8s=;
        b=qYWN5vOu2K4JbZJ1AytvwP8TQfVMezqODic6LGbseFGDBvxJAp+iNgOHKVUhRJPSLd
         8tGZXXICtKvN1Efg7nvNdjQe6UXE773QdYNCcI+gFDd1HM5RZzkxt5oIDzJ606vtM2U0
         y5ALu3uNGS729qSiPAt2X50HlJij7Xt0kb71lBer1toSIvG5n7RQjtpvUZjiXS9eymV4
         Riw/VANaIfFvjNShbNm94vzLYGl+qT4+chtuNJ8lstXNYje2P9UZCeUxkoh/+aihO6tF
         /An3NKZI49XlBhdPZKJxDaCpYhWZIOHNZRtzSmsKTXDgKpx86bk5SrhFLuWHVi+pU7ey
         /9bw==
X-Forwarded-Encrypted: i=1; AJvYcCXOM7hsu6LB5FJhXksit/bD0NLZh371zBWGbFjJajb64J8xT8eqKx1ovlFCDY36DuODP0r+Ow4jsXZE7NVl@vger.kernel.org
X-Gm-Message-State: AOJu0YwxU0y8yrVlNyI/V/QM62S0c0E8Ws2VboXu6yN+n9hsqA9Z0COo
	bgq7gHh4m5nUMPbVYk/KVyupYO2708dZrtLOm+GBVQfu+/+cwiOoMSIOw7zXS8n+AmYrExzikWD
	tWeKvStKDEoQjfczcunLRXE53zrDuXjZyXcR3yrGdnYxmw+JDzOWO+t00Xd2yqjR9SJkL
X-Gm-Gg: ATEYQzwphLb1ACZk0JtXOMTLyAlRxsWCvud5THhvTdsDRt2HyPNXX0MlVvEtJMWLVsh
	X3tKT+AqoqmSWk8/uMM/vCe9+rt55MWOf6c/YUXNoeS0zonIfGVsV/d6Q3O+fJCRhe6hBo45ZGB
	gEb47hU7gsmBTQ/eWC9d9On+cLgZNNwzh23UyKxFPnk/K45gScLMGHbQIifULTBo01mi+bfE2vk
	OxQ11gO+Q9/S7NmNyMfEnSd4h15R4ZO33Nqepo3MWKOTeo2lGHToXaQsspTqa3337ONsgUHpkMV
	pxpHe+v+qKrm0w6ERnFdpqBe2uXU6AdDIiek/s99buE1STOWsEvfvCk2WicqTgz/eoeK7QL4Xrl
	OHyenXQRo9WZOsIszZV94bHqhfBGwYUVGguxwc4lPizzUhHYd
X-Received: by 2002:a05:622a:47:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b3be70c14mr198193901cf.37.1774304039468;
        Mon, 23 Mar 2026 15:13:59 -0700 (PDT)
X-Received: by 2002:a05:622a:47:b0:50b:3be7:b16 with SMTP id d75a77b69052e-50b3be70c14mr198193511cf.37.1774304039008;
        Mon, 23 Mar 2026 15:13:59 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4871105d35fsm2838765e9.19.2026.03.23.15.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 15:13:58 -0700 (PDT)
Message-ID: <7856055a-7c97-45ad-8571-75e51cc92567@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 22:13:57 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: glymur: Add LPASS macro codecs and
 pinctrl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260311124230.2241781-3-srinivas.kandagatla@oss.qualcomm.com>
 <c50b8a91-ebda-4ba0-984e-b4121a55adf3@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <c50b8a91-ebda-4ba0-984e-b4121a55adf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MyBTYWx0ZWRfX0wVFHziAw5cY
 F4/1pCm2UUMOmrI7aes4Q3Zu3HD4N1j58A8hpUChNCd0kt/xvfxbkn/1oWhTSAtTQpuPML2qtbY
 gwwYI+erzhm5Za6nvQLEKs3z2sRN/kqBF6GGTx3gAOK/zVCXIZWRp0/c/cS+nwIUCenCSliAUeO
 Td6FZq73lHuXyxEVZtj4RJjLQum5++i/4r3mHC4ddnQ7yHDARkgQL9VgoTwLJir9iPVDjiq3eI5
 S3jKM92vt0TwK40P3ndCk6JyT9Pxu8f6jrK53hs5KdD1zH3b4TG5TST/kAkbJUHfh/ej/jfBES1
 PiW5LKwN+BYBr1TBDEFIXN5ntnCerkVNsrwyTY0WK8A/2UkzF1AVpO//bZmq5A/TG7OthgbTDRc
 uHNPeLtuJYB4pZ/HhNbJN9AY2VRbSOv8fHbVFnAbyX3aZDTr/yVBTSCMraGgmdpaGJogJRkU9Kq
 xNZByV+70b03aJYcVuA==
X-Proofpoint-ORIG-GUID: _VUyQQNCZYxgUbK9f9Pu2jSQOaeTIc9g
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c1bb28 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lgBHRGTc4hejgcBBOYkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: _VUyQQNCZYxgUbK9f9Pu2jSQOaeTIc9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230163
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-99415-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.116.225.224:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,6cb0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BFA752FE2A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 10:36 AM, Konrad Dybcio wrote:
> On 3/11/26 1:42 PM, Srinivas Kandagatla wrote:
>> Add LPASS macro codecs and LPASS TLMM pin controller on Qualcomm glymur.
>> for proper sound support.
>>
>> Also add GPR(Generic Pack router) node along with
>> APM(Audio Process Manager) and PRM(Proxy resource
>> Manager) audio services.
>>
>> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +		lpass_wsamacro: codec@6c90000 {
>> +			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
>> +			reg = <0 0x06c90000 0 0x1000>;
> 
> sz = 0x10_000 (no difference but for completeness)
> 
> [...]
> 
>> +		lpass_wsa2macro: codec@6cb0000 {
>> +			compatible = "qcom,glymur-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
>> +			reg = <0 0x06cb0000 0 0x1000>;
> 
> same here
> 
> [...]
> 
>> +		lpass_tlmm: pinctrl@6e80000 {
> 
> unit address doesn't match (reg is correct)
> 
>> +			compatible = "qcom,glymur-lpass-lpi-pinctrl", "qcom,sm8650-lpass-lpi-pinctrl";
>> +			reg = <0 0x07760000 0 0x20000>;
> 
> 0 -> 0x0
> 
>> +		lpass_vamacro: codec@7660000 {
>> +			compatible = "qcom,glymur-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
>> +			reg = <0 0x07660000 0 0x1000>;
> 
> _at least_ 0x2000, I don't know if the following registers are also
> related

Sure, will take a look at it and update it in next spin.

--srini
> 
> Konrad


