Return-Path: <linux-arm-msm+bounces-91460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePCfAfJ3gGmo8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:09:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D554CA987
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 11:09:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6AAD3019C92
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 10:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A6133A9DD;
	Mon,  2 Feb 2026 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bS9RDIdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAbMEZlt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3C12DE711
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026758; cv=none; b=h9kOXHxg4oR9vPTEhh8iwpkozJ62LZSmzT0nicatzDP0Nh77hNqSO+ZQPbAbTFz094z7hfHCDWh/RPyhJMUOJ7eWl60kFa9VbaD+cHR7PQtUffhC2asHdLlpCYr7LCmkHu8+niuxna8SuskTGXCr/t1pVHeLKpsLQ3SDO0ZDr5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026758; c=relaxed/simple;
	bh=htL1cVSiwon54WFPmT5nZ0fXBEdeRbIBIhR+cZygJRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FbQEd827qPlCjA+bufG7rMWYKJ3qsAnnycE9JqtCKqwLgxc5UxU3u1xOOwJfYd35av+Xf7BsWjDde6pa882E9pO8OKI2VSMItk4b7fuHBdh6SyMaBcMxwpZ4P+DvdcMg0sPSvhFH6Ot3I2+TfsBXu3ZUOZuLwUHOuPYeNNmZ+5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bS9RDIdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAbMEZlt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127DY78523538
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 10:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lE/lR/lqCoGkbnkAChtl6eTom0kKZQhHcUFHfJrocTA=; b=bS9RDIdj7SKOE0a6
	97fSo0GGr3Pjj5Z9G5OG6aFLssrH48qh+xCrMDAahJM8snkCTbMsqAxA2e8kNA58
	g4LuCoeRSkEXsdUnNykCgXLeTwY5cD3Df0zTQTmpGzgEl3cmNrqnTeSwN/RdHKl0
	c6suByNqSbfFSGNLbmID3UJUfOZ0IZKgbOdIdLMItgLmAWN/RpZTm09G6631/tF1
	bDQVCXb9FEgS+yAWd75p8DOwYziPPSZNhiePYcVk9mF8iEjHTkxR528We8OtSz0w
	7A1Wyti26AYp7EGR7KbK1FGLYA1HOgt61INi76JebCz05kxw8eY3SP9AkUEWM4xL
	EWiN4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awnw1eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 10:05:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6de73fab8so119410685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 02:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770026755; x=1770631555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lE/lR/lqCoGkbnkAChtl6eTom0kKZQhHcUFHfJrocTA=;
        b=gAbMEZltW1QSNApeHkM7IGnOWeTmaI0tJEnziMH6IWNYfSyBoumfpXcs4k3mPLVXnW
         GMS8Yrt3IFlE6Yb7Os69g/ks86POYQURorynN5QdkeatZzZ7Ob6zXAaq7XhaHmBFYzK7
         9Q0RfmeKtUWp2j6lS8IMRC0nyKpNeGcIj+B7UEtrtrng8iKnHtYomM9H8ZbTJjL7V4Rk
         QANJJpJ3YIk9uyyAPGfq/H8w+ArXtYeawpSlx9v9N2gRTNPzPk4wEeD1+X4Bb9hSJfVT
         XXpZIRBg0Il9vZbWAJfT9fLnnb3RZs/SanDzd59gyVxMj40icLhHW+UJsSqckas38Pq9
         YPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026755; x=1770631555;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lE/lR/lqCoGkbnkAChtl6eTom0kKZQhHcUFHfJrocTA=;
        b=PJvLcYPaTvE9AuyeFRMQi/sUV55VXoDjxub1shaHf1PmHbLSkp73MLbqHuMpwE1dB/
         DuWD+1C2K1tQI6F37rgA7W1QlctXeBvhO63Sl1hmKL42r/jh5mfVl8v8SgyDiRlRFeNm
         mhNI0eM+dETB96dXDAPBhFxt41+GNegv7x0C5z2bA6TfC/u28T/N33eP0mESwx7uywZz
         cM5eiRD894TQBARiAX3Hm5344EvdmOLdCZ4nN4o/j4KRlUDkYuBKHfKQNvL7xHPaNMim
         1+3Y+2auSFLQf/ZVdZCwqTDAMSFp4UgfhaCSfi7atbnJwCDpwLaLv4KfTJvbs2AxIbcD
         9Nug==
X-Gm-Message-State: AOJu0YxH86Atg13c7K4ceSrPbYobkEoben9e96zk48ga5PtVrwJhm0ZL
	O0+a9Iyw1oGskRjb0ThIGwsK8RRNdd9OQe6p7p7pTaL5PRomlFnRf8nlUF0uGl9guPpOI4PcP96
	9lkAue1V3mdurRoedosbPxDfZkzOWBh5O68YT7Wm8XWKL4j5mceerSNEXYmoJ9T6ZJErY
X-Gm-Gg: AZuq6aLfj3XdnpwJhmQIRNpHMoNdQjA7Wc+JsDL1vUTq7voXNruJm5Egj5HuWh8T/Cb
	oi5tX0rjyNWQrQK2AmFfNpRaBwLJbXjyCY07YxOkYv9ioVj0lai4fFqvAwhVrZpXA+1MP8+xKgu
	GYcpNOXjlC5C4WKsKdS59KxrWSienlfknkAv4RAkkYvN2x5yYl0N75L3iYkAMWJPLVWttWMht58
	1blDfIl7dm2mi1ioDxiWeyRMyAlK1X/gM0lzATE+tMdEYVq/wdtddSyqYAoKhvhjLpKw9uMqXgF
	t0uTY3pMs8yuO21E0Qn3RanR8X3KD2OeRHHs0kDLthbUQJKhDNn58dvB7eQHAdZws2iIQRaOD5+
	RKsBclvQgv/qS9p9z1CUbpaeX8j9SMnrRcp0EBxXPr5xH/kJuumWYLH0SieZM71byBE8=
X-Received: by 2002:a05:620a:4141:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c9eb2b920amr1083292785a.5.1770026755584;
        Mon, 02 Feb 2026 02:05:55 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c9eb2b920amr1083287685a.5.1770026755123;
        Mon, 02 Feb 2026 02:05:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469e45fsm7463972a12.24.2026.02.02.02.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:05:54 -0800 (PST)
Message-ID: <d8826de8-0535-40a3-9b1a-24c2d3fc5de8@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:05:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] media: dt-bindings: qcom,sm8250-venus: sort out
 power domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
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
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <20260201-iris-venus-fix-sm8250-v2-3-6f40d2605c89@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-3-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MNltWcZl c=1 sm=1 tr=0 ts=69807704 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ybeyijjueW2mqxUJa2YA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: GfKyNs5hqysmSFQkQRigS3u6keFmpoEU
X-Proofpoint-ORIG-GUID: GfKyNs5hqysmSFQkQRigS3u6keFmpoEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4NSBTYWx0ZWRfX+tl18cBDnyMz
 +lelc6rUsKuHRaqnaUzKb7+QBZ2TNKqDbSliJ1s6h2nGnAflA7kdQqgYkMaG+ppc6vmCoRtyIbE
 VjmCayDT3Nbuo73hON9aTl+mpEX1yD0nn530kpQMhyYVIbPJKpk04FLhdrxmJn3lIibTltNgKj8
 wwxhdzreFi6qkfLKxDlgmtX8cl/FVeeQFfdSH1zeHKHpBCWZy5n1EYHWhX6D8adcNAAAtlQ0a5L
 WPci0aPe2gJeW+twJ1h7nY1FPMohdMlRJiiCeMcorew70oZhp0CPoqk2rTU0nrI0WoU0U0S1P3I
 is0quKBTMUe3LgVqnmSzWEngBtHto0WEQruMVQ4Aoj5k8hEo45jH+N6DfxrY7x5cq3jGZV/ys0G
 Im1O2F5aibb2GpQuPNTHbRrJH5JXnuBL+16qiWeg0od3jdzbSgqaEnafEuKK4HJjgaJgPUS8Mlx
 yoDTBxJXTUh7kNrhheg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020085
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91460-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D554CA987
X-Rspamd-Action: no action

On 2/1/26 11:49 AM, Dmitry Baryshkov wrote:
> First of all, on SM8250 Iris (ex-Venus) core needs to scale clocks which
> are powered by the MMCX domain. Add MMCX domain to the list of the power
> domain to be used on this platform.
> 
> While we are at it, drop minItems from both power-domains and
> power-domains-names, it doesn't make sense from the hardware point of
> view. There are always 2 GDSCs and two power rails wired to the video
> clock controller and Venus. Disallow passing just two.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

