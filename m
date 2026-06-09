Return-Path: <linux-arm-msm+bounces-112006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f6uuE+2oJ2o00QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:47:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E265C891
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:47:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=B5VhKDm8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=B2HolZLq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112006-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112006-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6561D301B1C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 05:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18B4318BB3;
	Tue,  9 Jun 2026 05:47:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1037DEB6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 05:47:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984035; cv=none; b=SyBMrwcmBgMQNCkDosWVIasHSzb8p/gf15dNeY+7+0wGSg94PNUx/RPWhFPXEHQGLslEsScT54+uHfz/5QcjsdkgcCXH7IvEpoB4UEjMfQQ1xcvYufXfbWswXFubJPMTX2vICBeN0LFBPoR2fvs5wyESRN1oYO+ceNPP0pGXd/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984035; c=relaxed/simple;
	bh=so1zBd3nO45nJIzTPGgrERW8Lcd2s/vTZUV+2uG8ilI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QtY3ZoUdR0FkyRbO5s9hzEme3NJ/rpWZn1PH2LUHd9b0R1NuhkCybVyf2RsCZ9NWjQ0c/3TH5c781+fEeJJswewJIFOZdtZh7NAm5vvN1KKNRpvteV5ew1rQDbmyK/2+imjf7xeFiHIoncJSiIPnqCIr9B9VxlCCr94n0ljIrAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B5VhKDm8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2HolZLq; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wth51026305
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 05:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=; b=B5VhKDm87MQusmw9
	aryygQpzC5UfGLdTFQP3AXlVg1nPZ70WRUQuR/xLLxw5/XXUVeWyj9YdVVgN2c3S
	hkAhV1TYrYpyqJ94WIr3k+xcOl0Pa56Ta1CYXrQM5477hX25T54VhOyrcMSKs6+p
	IdaJY9wOKB2meZVgwCUFoRuBFDqrpFJzeGll+wA+Lq1vUbFvzHFTeXRj5UEcm45e
	8fIyEUNf/cg2XfOnNUGP5XRBJ6jd+zMlX1/vJsg9nuUHMgzPsdS5VhTLK+OYGrp9
	NlrEZn97usI6cdIctjyAjeS+i+Ki3YgU2imXk1PWbVgOAoDvalbVwma/KpsIOOUp
	JhrBqg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enunacm2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:47:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2befec3fd8fso35833875ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 22:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780984033; x=1781588833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=;
        b=B2HolZLq66K1a6e5QDZ8HZnhnDnrrt9uNl40ZAjlFxdtOxbBE9IsVu93IGNsRO6cct
         0S2tUuUEEa0dPSMg9oZTo3tEPdVqhPUJ5jZ8DS0oFMRNuowUHFltJE6FnqU5Ud5ebS6o
         3eQSJjHb/xF5WNBTWHFo24kjv6aROga7cpjneRjUzrCNd+BmdY332Goa0d/zK5HJ9Elj
         SfpajvugvvRimo+972NHb1n7yqzpuzuDbchcsou+S8G3q0o+53zniL4vG1RN4Vev/6Lj
         f59Pcoqvk8gh5M5Zahts3d9whWKs8IOC1v4p/i4g/KWisnHBEr5RpStssg0c+vMn8NId
         cXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984033; x=1781588833;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ngbOWDMjIN8EWkgDlORz4DJk7K8eQHzIas+4rhC1DVU=;
        b=nT1YlMdhUZmyNqjHKAgZlConzQ7BohMyNsQnk6yKL2hThruAZHRiZVtrfqBl0gzHWZ
         1UenroxaQmmzzHGIjjAnMlydlTKAqIDu6dMOTUmq7mD+uyFvvmv2aAPdPer+/HX36Xvv
         jU2jDvuGvEkFfJKpWVA0vB5HQi5Vn5U4y8Y98Uq8QkoxhxgolSHg3QkPxsKixXS/eXhf
         Nw1WiB1KcDM5ZnaEeiQSloFonwpVMkKZIKgNr5dgkxtjc04cA5f5F6ilCpIbsIms7sDY
         NNnsi7ZQ3Zf0RUqOHXthA5CvAXoiyAEDbq2y9z773ea4+T7tPw/YIaXniETLQunuD5aR
         zLiA==
X-Gm-Message-State: AOJu0Yx3Pk2bYZTh6bbQV0pc1hymIPOa0OAb9dbZn4roJ3IdocE72plC
	73HbG0YhebGFxwmztQR7v84BUJMlQYiHAZ1YtGCQYkHi7ejM70Yz8iJfGoZiVRV3z3GSq+WKUXS
	4KAe50ahCcyxBEHY2+BQ5R2RJq2Ucjlz+JTtWfHJOjDW2/kpLLkKUU6++9+slNBNul8lP
X-Gm-Gg: Acq92OG85UMbM4szg7otX0WniKPlW9nT0mcm+0Yf2lcnRyisTANGD8rfzi5HcL6XAA1
	MyryYV8KNgH/RW16KbEuxMeFgbwe91JW0sCU+rh9L/JhzmMkoGLQG5OCzkHrYWjuR0IJ5pWE9VI
	H1g8tv78yYAnRgO/iW4Qe9TmF5iNo4IAO4Tl24y18yIlCb0T/wc/GMIXu3K9CK9cb0EUaz2fhWS
	WbLyrE3B39qBdwERJn2asAiLRK34tIOlTDx4HpZdB4vCpWjvZBsg3gdgNXBwwyUXd/sfgsSSiYp
	ZP/4jVsGVMcfj+f14ZzQ6mRIL0vxB+rWw2B85jMswK5qBWWRhWjIEEAhCLFN1QrEPlCjkW2/pHZ
	snuYSMIJt/tmXY1ESVtcjbLOZFQeRmqiV6bwbPOFXZ7FpjUUMyUDvevqLYvSe0Eca
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr222076415ad.3.1780984033338;
        Mon, 08 Jun 2026 22:47:13 -0700 (PDT)
X-Received: by 2002:a17:902:e848:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c1e79e29ebmr222076015ad.3.1780984032810;
        Mon, 08 Jun 2026 22:47:12 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664950aesm192056405ad.69.2026.06.08.22.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:47:12 -0700 (PDT)
Message-ID: <44671f38-88d0-55f1-0a54-3997f37c5a60@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:17:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-2-7bd2f0e5bae8@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-2-7bd2f0e5bae8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1MSBTYWx0ZWRfX8W8kkMnHFi9w
 eHDQlkqDhtB8nGmpa35pyRUNB2eXrbOjRV3nG8tQe06wUk7/ACjXiskJyMLo5OQlLGOo3pqjQss
 leN0d/MBqVPXw5OmzJyIumuHrZdjXA17ulvJvXoFVYeAjNFGUzNKitxLnCSltMsdTNNR0v+yOUB
 FvFlE69K2EOIfb1paVxZI4u18QeX56YnQj2RQyNMv5ZeARL3JCwm3RaoOYLduIRt2nHjaZhmGH0
 zPeIts2Q2QNYJ81IGHhMk4FkxWcI8IVofIUMbS8V9CYVvu7lAWYN3bU2kmrgwtD6SagHlOi0OI9
 IrSeYTUAs+kMmrA31IAUGFFgoy+Wnl+EvHTcefInb55Lxuki5WjPL4a0ous1Av1Y8ASsjJV34cc
 4FfHZ3fhvUXxtkTy9dIVrUQmOgW20/ezEl74l4cYf3nd2URCyUSPXTNb9lOl/CkrE3Q3tSVZ+3p
 PgzbB09avghJHeQAmtg==
X-Authority-Analysis: v=2.4 cv=RfugzVtv c=1 sm=1 tr=0 ts=6a27a8e2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2OYgVc-5B2WHko4x-TYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: tBSIMuabz2SnI5BxCb5HWLheG2pTk0z5
X-Proofpoint-GUID: tBSIMuabz2SnI5BxCb5HWLheG2pTk0z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090051
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112006-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EF6E265C891


On 6/4/2026 9:52 PM, Dmitry Baryshkov wrote:
> The OPP table for the Iris core is wrong, it copies the VDD table from
> the downstream kernel, but that table is written for the
> video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
> rate setting (which is clk_src divided by 3). Specify correct
> frequencies in the OPP table.
>
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 6150380795b8..f6044bfaef87 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4355,26 +4355,26 @@ venus: video-codec@aa00000 {
>  			venus_opp_table: opp-table {
>  				compatible = "operating-points-v2";
>  
> -				opp-720000000 {
> -					opp-hz = /bits/ 64 <720000000>;
> +				opp-240000000 {
> +					opp-hz = /bits/ 64 <240000000>;
>  					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_low_svs>;
>  				};
>  
> -				opp-1014000000 {
> -					opp-hz = /bits/ 64 <1014000000>;
> +				opp-338000000 {
> +					opp-hz = /bits/ 64 <338000000>;
>  					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_svs>;
>  				};
>  
> -				opp-1098000000 {
> -					opp-hz = /bits/ 64 <1098000000>;
> +				opp-366000000 {
> +					opp-hz = /bits/ 64 <366000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_svs_l1>;
>  				};
>  
> -				opp-1332000000 {
> -					opp-hz = /bits/ 64 <1332000000>;
> +				opp-444000000 {
> +					opp-hz = /bits/ 64 <444000000>;
>  					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_nom>;
>  				};

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>


