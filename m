Return-Path: <linux-arm-msm+bounces-83959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54776C974B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 13:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAC123A15A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 12:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E37EC30C372;
	Mon,  1 Dec 2025 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LChSIUUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JPUukAah"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E81030BB8D
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592290; cv=none; b=bUbuZHmHevuTF8HfATgFAmhVA3c94b+EGWjGF0DcXRye/Xzy2Wb54bzxRCYk9RVb6auZOcvHUycY9D7iq30QAX674K7h1oE3vZ47KckTfMZvRf20aNyU9fgeW7L1Ve5jT+Td6/LlXThmS1rN4HgTLltnQRp46YZPEKGYQr+gGbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592290; c=relaxed/simple;
	bh=Fcv32Om9jn4hLH5uR3XwBpDm+6V8+PF8YeKI1aV+3Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jiObgjWBrOnQfKyfvHvQprIkyVjz9CDiYZh/Nh4Fd/mkhjuRNp7YU/I7jAtKg0orv8O0PGJkgs9ZUdnfXerEiLZq+S/B6YPjrskxKTgRS2V/CqHDA1j1PDrhfLMkIneDC9tJQJEoZjO8ICjqmopJwdXj7gwa/4iIcxseORfLGD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LChSIUUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JPUukAah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B19MBcX3361635
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 12:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFiiUSydQHwhvq44lSnXlUK7s6RpMr3EPnopgXwwJyA=; b=LChSIUUJdoDpM5Rj
	l7zjbKdRV7VTVOPNJhAQNK/faA7f3SP+76CVAnblizuTPttarn1t1HPnieTrWZcl
	B7i++J+JL1tlpB8tgmsjE1UrJQ8w7Cy5ppRmpY8O7e+Vu1luTfpWtTrea92Sv1YG
	uxibL863JkFVdvUONQf7I42dG0eWWM1JM6FJdnqO3RKBuDUbpYhrx0ts+guz0hf3
	MqY23MKfZKi/sWHiaS9lRu+DnD4cuystt+jMmpCKuSPuK41ZGhXls9GoaV/1NPyK
	YrZlaC8tJvPgyznE/mMwbEFu0MEd+99U7VZS9ZpgUStdDDipATzITOVxX5MYaMCL
	kSgcKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as8b00h7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 12:31:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b227a71fc6so65802285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 04:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764592287; x=1765197087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QFiiUSydQHwhvq44lSnXlUK7s6RpMr3EPnopgXwwJyA=;
        b=JPUukAahtM8aKRDTBxRpDnTd7r1pYMqQb5krbhiJgb4gOyEZ99R+rOXSBz4hXz0/lo
         JsK/gIrRgfjKuAkHRBP2v6znETLiLwNPyluKznbBrCArdQ//wZYLkCfGozBe+xTc2VUQ
         NbCZqNaHA3nd5/93WBFYbr2Uh7iSzKxqNxeSXqnm1yx/Ptt+wprHvM9s1LgG3JYJ8s4i
         /2p9VMqco4Bypr6QFTkKVosk4fvPpGDTkEmE4o0+wWOxDCgpeG+gAHlGSQqI9Dq1hk8J
         vqT33FfMNg4Pfodx0ymXX5Tsox+iZOxP5XKPq2owMySdibhzE/y06s9dH1IGidoZGdZV
         wgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764592287; x=1765197087;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFiiUSydQHwhvq44lSnXlUK7s6RpMr3EPnopgXwwJyA=;
        b=mOTiTTt0S3DDi6BFfxLQP4hB4HIN3htCu9jWIZf3XfFCTiEr50HyU1dqgmGDb9d+mn
         HiQ09z86LtHCfXeVI2A7veqP1Vjx/45OUmreSlIb0KOgHAqu7sjE8yZF1RnUpbaBa51h
         I6agut+TZStWwFKG/Fl9vwX4moqyAhgXPEfsEXqoF4qEHIruLP2nV1PVPrQrulrQQrq+
         zuaoQEOzUyxsW0mPQSlwi4/szRyXV0tXel+k7aelWYVOGN7tVr2DWeUkupwDIfyNOgTd
         VFv7M4Q3bRFKvwCpw/M/Kd9Jekmbutv5zXHY+wWSyPMEeBP4rmZ9KNfJxEOFYgoDf2Yi
         hRag==
X-Gm-Message-State: AOJu0YwnTdyXiezofWKoLivuslIfwzeDfYJh/hjWqvFOa6iF++Md0Rp2
	9MwCCfS8f53597J6Nv2pyD02PJfGhHNMNNeDDC4/dDh+0TYOWhVGpCuniq+KntkoVRQXdgQyc5X
	jnKtgzBVeD+oMPkZfV7K1FQCzwv0a+yo0cyrL7NGXdP/8MJM4eoAvzNHmryMsXYVgvpTE
X-Gm-Gg: ASbGncsA+M9xTLyYDQAiiVhWpxJYzu4dh1CA1PuZPlPyPnsIcOCQ2J0pUgZC/VMcbR/
	aR4QV5GZzxQaryKItpq01ytOEp0fIyv/+8kydhU7hchy/1UhyPUNJDXwy1aiIVLyiHh2/ZN1LpX
	2Msiphd1A3bTVxBY8CF0K5rTds3hRsY76sUKaMZuVYpNm1iUhsENiYxa/UhQcGWTLKOnL7NDhCs
	zhdfq1mBikqPBvzekZKjDS+HhNE+vOWaWLtglRsdedAyGMIlH4REi5RFiusQVHGStDTgQ1Vw1TQ
	W2Kbn2emFr+mX7/rXjciJWUTNaWoYd7qd5zZmxdHOo6wxykgoCb5+7cO/2OXtRMoBhghIjbG2h4
	TvPyT3cRoYOu0fOVktC2aHe+RaAh0SJ6HzNfw0toKWVLuijJczDDIq9Cmj00NoEiOuvo=
X-Received: by 2002:ac8:5882:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4ee5890a538mr374815811cf.6.1764592287397;
        Mon, 01 Dec 2025 04:31:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpwNF01edgC882pXUrSsKgRLUqcWeG7+DxgnZMiMGExxupifZaEEnD1x9ZJ31p/N/CjpgtmQ==
X-Received: by 2002:ac8:5882:0:b0:4ee:4214:3226 with SMTP id d75a77b69052e-4ee5890a538mr374815391cf.6.1764592286863;
        Mon, 01 Dec 2025 04:31:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6eca9sm12158181a12.1.2025.12.01.04.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:31:26 -0800 (PST)
Message-ID: <526aa071-82d5-4d65-bdb8-648f6a82ecc4@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 13:31:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] arm64: dts: qcom: lemans-evk: Add OTG support for
 primary USB controller
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251128102507.3206169-1-krishna.kurapati@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128102507.3206169-1-krishna.kurapati@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TcKbdBQh c=1 sm=1 tr=0 ts=692d8aa0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FJIYxXr7j5wBFcyr7_sA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ODrTnngL9PLnBJsLIrmSUOCpjU2uT7OW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMiBTYWx0ZWRfX9+1/sR6Xepbk
 0CF6dPkYwSJnfoXqVXoy/9UXQZPOdod5EtcxhFt/2Wl03vTy5nAWQgq413kvKkuUpXzuwQw4bRu
 JWLlRXyWREQ8l3Le7UyODh//F/6ll8mwJ8t2Qj1soakb8LUO2p21nSQxkt9Afx3z1/VnrkunbMK
 MQMWUKK1W4lvaVi+mXozR54UIHQNYYJY6XgYyB8pU4Jhd51QcQpG+fPq3C+geqYnVD/79X7i30X
 7n+cqq+oBEZrNKxz1VGsJ8XAt5vfVrE/MVZVKTDhy+9dJafqzo1LEzN119BEWNj1o2rz27Wk3vL
 oyIUjqY600SJu23f4Rn86nzmKBSIlV3mItLpde//c7HHGhEEGDJlhPPWgKHWTWFyX/BTnL8BkLq
 Nq9DnYGOJtVamXGwytfHtpunTdRkgg==
X-Proofpoint-GUID: ODrTnngL9PLnBJsLIrmSUOCpjU2uT7OW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010102

On 11/28/25 11:25 AM, Krishna Kurapati wrote:
> Enable OTG support for primary USB controller on EVK Platform. Add
> HD3SS3220 Type-C port controller present between Type-C port and SoC
> that provides role switch notifications to controller.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

[...]

> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				usb0_con_hs_ep: endpoint {
> +					remote-endpoint = <&usb_0_dwc3_hs>;
> +				};
> +			};
> +			port@1 {

Bjorn, could you add a \n here while applying?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

