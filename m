Return-Path: <linux-arm-msm+bounces-96618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKshLEoCsGnOeQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:36:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB6724B192
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:36:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45F30312517C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A8438A73B;
	Tue, 10 Mar 2026 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSr+R3od";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sehy8Xqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CB338A700
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142077; cv=none; b=TSyWjM36sSjIu4hFJynMH/cJC9iEayhzwil/lXNq/0oj8/DZ77bPzzQ3r3DUaMnX7tihcvdceom2R+VsJ0Fa5+JmRqi/T4UqlHFervYuu05lQo4mKCEu9E9J+TJjIR6vDDl7+L32Ccez1o1cPne2k1tQalZrW0RzC+hRLpGiTjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142077; c=relaxed/simple;
	bh=L7soDEWoTulREELcHcldAeoLN6DlEDFzdxCDd5np/yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8oT6O1fQagApaeuJJeOLYr+qFIo7VgBlhV6qcFAVPKQ+xGN8zlegifPy7sW2kme753B8DNaLRdWbZeuCqOkmRouZ4IkJZevmjzPlhCV8FwfnSmY2f1ItNWLMzz5ee37BlbaDWU7ZpxKmtsDCrwD4zZzobsPjqd93iOxiQiYNhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSr+R3od; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sehy8Xqp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8tmrI3754749
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qq0Xw8EQWByHsDU0TPAVQ9YxBAplfjKJxgDA++MRTJ4=; b=lSr+R3odS8Wpofc0
	PxbZxvHDYvG9BR40bYlmZe3EgS4d9FcaYS4YeIZvptjerCGEUBFfMxl+1v3cM8mg
	I8QHIwQPep/xJgM8oPy9rDcEBFB0tCPYpd4iY7AIjTd0c5uSZmtll4RYB9Tvnl/l
	cHxjsMxd0LFjM2P5SLcXYQgBMTHoY2sQDcCSgQMvVWhN999edqck2l6d6BUZ7ooP
	+GmskV82dOHoxJXi2qqRZCDpkBKFvrnE4uNVpt6qUiB+Nq6JpNVegz50hWpyRVWX
	bAzH00zz56ygdUCImGFNCKiI2wJF8/+Qu3sIfKK7aXK8LgnFdTxj5rk3X9m+8Ov7
	ndQRdQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477jxqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:27:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a1be41f9dso34105786d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773142074; x=1773746874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qq0Xw8EQWByHsDU0TPAVQ9YxBAplfjKJxgDA++MRTJ4=;
        b=Sehy8XqpIVFauXM7rKc7I56mFgYDXVe1slgSOzPS9+CyqnI7fdy3hq1Okd0DQGQQ+R
         N7ywcGANY0l3A9xiuiL2q2oFrZV5CBtXVdvEu7Fu6BzKKYTcFhg45LuA8duLfrrJgXTs
         HWbDeKEnH0b5abCJW0mD3NaeN4CZBDsfXgc2TYEeLGVhcVM250Frm3W4/GVQJ/Yr4Mce
         3FgyuM7FpDPrQEKel+UJVFL616jXNUpmXKrG46K6hRCvaNjr6mGxACP8lZrQ6b+UDpgz
         hI+r40jWs9EPB1a22JaAlLNvEwlfYScBveYD5S0ct/aYr5sL5PrYSZtOnsCIngjE17y/
         Hb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773142074; x=1773746874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq0Xw8EQWByHsDU0TPAVQ9YxBAplfjKJxgDA++MRTJ4=;
        b=gTJZSb6Pi9GM2ge+Snkd+P9g4vJhhxUNgToCzPs41AtDrKHwW0FJZcoVwKUPZ7Yqik
         4kLDU0yeD0EDdBtJWow4WMgkzx5zezxi5AtdR6aZE6hrCQlj7BvLmvDF1Qh4m1DDvVnt
         HDgG9+w9T9e+G8o3Z5kxDPKTZYvCyM7rdMYuqKK1cDmWlD1koKCrtkC9XP55mIaojo64
         YK0ex+5C63JrH1Q8VXmirgZltt2B6gcyc2AjXjjXr+7LhmP9MiMuqmpdf+Qc4ThKIdDn
         f5q7pcw9oEfY4k8Pr8k6m8XazgOGICnQRc+6Htfpal+QPTipZv1HERfOSZjqmAastIh3
         ZMPw==
X-Forwarded-Encrypted: i=1; AJvYcCU2ffmQVhADL++bRd2kD80PAAk3ibZsq1qEPAvLrsiOkJ40Sj0eSYTarzM7qjOwSBOIf3z2TgAPsW25WnDg@vger.kernel.org
X-Gm-Message-State: AOJu0YzbC89RRV9lBw1srdNF/kMK1oIn1LHLjNXlXajN/rwdUoRbs8Qh
	1YYv9XaP2f4g986rNj78l/Hcz0p7bg3XBq9U+MTgNzQoxtkJznybKz4pBBZJ/Tl1pKG5ql8wOTD
	qEn2bgpLmTFfYZDTs+izW/zqu3KWX9uKmZZ9O37arn2dyXLO985FPhhwypDyCcMlaOlvPd+NI8c
	fx
X-Gm-Gg: ATEYQzzdXNm1A61S8Xh/jzCX0xENAl1PjmWcWHjTTPhAB7MlgQhY6475a4yi9Cs2B24
	Vxip4RA7TD61p/vr43+W95g+fDNt+OoSQVhjMNCDg7q7xXQRHNLirfvVK9FgZ+Ti+07LqxxDE7V
	KxQzMQJwYNLefm4qDrR/lLPdhjUTskk4kcpzSHU56XtXOPxbZJVce47qTAo6N1MAVYzatn3DLbY
	TLNHz8upfeYqGZL870OlFZsnbgZ8fAOqw0D4aLZ1ouJW6mTe8RKhuGscYTqpMUgLumVOUyr1tX7
	/s4PimAznbGEQOLeQtBuC+8sYp0zX/U/3T1a4Gm0Ib78dFCS3b0SnwdzYJNWSqJT0QttM/Qi5R9
	DFIy1Ffdkj4JU0tEBAS426FJLT32bztpK6v3IPfFGzdwBWp176WsNlheJ0Llec80OkT4E5g9x9B
	6pch0=
X-Received: by 2002:a05:6214:4709:b0:89a:5ebf:2cf with SMTP id 6a1803df08f44-89a5ebf083bmr8351796d6.3.1773142074426;
        Tue, 10 Mar 2026 04:27:54 -0700 (PDT)
X-Received: by 2002:a05:6214:4709:b0:89a:5ebf:2cf with SMTP id 6a1803df08f44-89a5ebf083bmr8351436d6.3.1773142073962;
        Tue, 10 Mar 2026 04:27:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8b7dbsm458129066b.24.2026.03.10.04.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:27:52 -0700 (PDT)
Message-ID: <f309905e-6f7f-440e-b463-7bda54298164@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:27:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
 <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OSBTYWx0ZWRfXyc5Jeq/XYPc4
 IEHo9Ib9lhB/bIs6pR0+PScPljiChK00/Jb2cnB7fdhC3/jluQ7J49a3/86uyoW5cxm8P57TiMG
 2O9cF9yRJvc8kjkYyy6GaPwgVGgyHrrqSzzAINyZmRHidaDvVUfKXY5zBNUyVsDJm2zhS5pt+Vt
 XgdZ/X/fUvugDyDazu3ETfDyMgpajx4L30WOulvVg8ieIz5Sx7NTcQcGBf/3mdlwGzMqYE+wZKK
 2fhRSaf4Skpx1atjZG3bhtkydtCN3mbgrxdV/Yrm4yDnnu4uz2YH0WpiDml82SJTJu5JIntZReH
 TR2U7l8rllX7ru0u2682fA1mFxz8srCyeLkjAInDvIfJtxD5x75b29d+7r3sZkqdvW1WrfDuXNy
 kipk6ILwkZH3GlfMfRDDglBjBI4/jI1gzFznH+FkF1oMk5/b/aFNxGMu0E5XIS1D78gRpvvJh+f
 TXi/QaHoeEgr3ZcU1Pw==
X-Proofpoint-GUID: dzx1me6UoI2z3l0-KT8AIzhTsz_6i7jr
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b0003b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sfOm8-O8AAAA:8 a=yvbgvs5-uoTajdXvgSQA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: dzx1me6UoI2z3l0-KT8AIzhTsz_6i7jr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100099
X-Rspamd-Queue-Id: 4FB6724B192
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96618-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,protonmail.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/8/26 4:01 PM, Dmitry Baryshkov wrote:
> On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4 Relay wrote:
>> From: Cristian Cozzolino <cristian_ci@protonmail.com>
>>
>> Add the description for the display panel found on this phone.
>> And with this done we can also enable the GPU and set the zap shader
>> firmware path.
>>
>> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
>> ---
>>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 ++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>
>> +
>> +&mdss_dsi0 {
>> +	vdda-supply = <&pm8953_s3>;
>> +	vddio-supply = <&pm8953_l6>;
>> +
>> +	pinctrl-0 = <&mdss_default>;
>> +	pinctrl-1 = <&mdss_sleep>;
>> +	pinctrl-names = "default", "sleep";
> 
> It might be better to move pinctrl nodes to the panel device, because
> they control the panel reset pin (rather than some kind if DSI-related
> pin).

+1, perhaps let's rename that pin to panel_reset while at it

Konrad

