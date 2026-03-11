Return-Path: <linux-arm-msm+bounces-97002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mMrILnlwsWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:39:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38453264B07
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 533DB3098599
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873F531F9A3;
	Wed, 11 Mar 2026 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKrXsoTB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wwf7Zg7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525BB31E83B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236137; cv=none; b=u/pO8sbrr9zOnBMBT/pR1RwR11Y074LcOwt4LOJ6XEEcorfHjyJvcqGVCGV3NcUlNrjWB8V5BjNpSzuL2DxO0IPd5XHJyrqUrWm5h2crl9xGWtfa7yUM4/6nc22WJThWDZU2eK3dwKKZnZtmHLCCLiR6PD8lg43O1IzZNhvt6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236137; c=relaxed/simple;
	bh=7/ObD/TJUlmT4t94k68IR0en3VvGQzGl60rNU9IjKuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bKOzLePLUapuL8CVtg6BIzp4lC4jH+OtIlzXK2Y9suiZa+4VH/6crU2kscyHZQTOyBceS8Laf6iovpqxWyn3wCKUABaVIA34MNAQVCx41SEnVeP6Da7Y4H1Q8aOV814YdVp+iT9OiTZR6PlpRiaKoDMcNd8TWf2S5dIOu3pGXtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKrXsoTB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wwf7Zg7m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B8wIPn1572930
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzmA2I1G6+goprv8ITZ/YpJdoF5jLQr22ZNjDJ9ewuo=; b=oKrXsoTBBKnRv/1a
	T+hVmuun+zVPIfbP32DKBj93LkGGiGQrmhGzIrqCqEpt8o/zIWHsV4MJC+qWV75n
	RsORO/uVjWUAfhLNdKJNI1dLI/crG/MlcNyw2cwdigX5JWdGGi93SisPjhIp2yzT
	wYZ4piBCBXn4EobHYO8rCwJOMxylGPK6XjoWG9iIUdlyp3QfgwJAhZxdk9clT2FJ
	yytwqO46PFH+/cHfRXPnJay2EUu/An7nk6YH/eDCKS/N/k+MsqSFQvn0B3Je0cYi
	PzMVNosMmxvRo5IgQOEp8xJuQB3TAEaK/675wocfQDbgtQiT2bkYzHt1u3L/INbu
	3ZKfUw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkbsdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 13:35:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50910ca6ccaso48104741cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773236135; x=1773840935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EzmA2I1G6+goprv8ITZ/YpJdoF5jLQr22ZNjDJ9ewuo=;
        b=Wwf7Zg7m+B4FwdhFGCko5F1qrtbqfWgpqNYR63JA6ZwcgQHXm7larVjSPSWWuwQuQV
         F+d/ADqWM2FYMD9LLI69ETppBuvyi6StX4o1GcJA8Or6yF6nY+MsqSQSdVEWESMRgbZJ
         qB7GCF5xJfZeRbYWcWYJZpTg2buoQMbRsX9xKSuLZiXyOiOHTFcih/1gTLZ7VVIsO+m5
         +bmOI2zUUXdFmG3Sg/zbQXDsOFgTEctq9Cyw+o4DvRmQ5fzfuuWpeAd6k5+CQ/I0XGbS
         UCQekH0lHu0fwxDFRIiINF2iky0x1T9OkQW34Plui5fdx/0PRD6ZdlVswwnCJ/urpPYq
         iETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236135; x=1773840935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzmA2I1G6+goprv8ITZ/YpJdoF5jLQr22ZNjDJ9ewuo=;
        b=vzScaCB6Qq6FzPLT/08wNwCrOS8JJhqRi+pr4xhzldWV0EL6iIdrkxSXQ6NOzVIUVf
         y0MwaH1AH01Bz9muLbgUEm/vA76J8nH/h6+M+X61wu98qUO/XMlHj8yDNGUiLUfxJtCX
         0KFkFPrBMmkKTzoeaVZ5LiVXX+bxKrqYd4borABs/v8WKTboomuOktNnbSGTMJagmfkS
         v4cEquvp1OL5af/1PzDsudVH6zwN+v+ZB5KAa7pJLLWGVOgOl9so42dNN1pmxEi7tByW
         tHQWUA2QxLpe2VOu2qJAVr25zqaHjFxO+wmNJ7rUJsm7gHnbOmVZx9sxPJpC5vAbmFKH
         GJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCWOzrvCeI0AX72CbXloU1KMOqTz7St6RSGkZgyr5p2uf90h9G5+vz0Ty8ZZBkmAr/xxrdlnAXUAGocgXm8D@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ65tC4uzekXz5wNsvvyoPzz/HnUmjVak3hSpm3fwcVJRADQdb
	Q3ZaQMg4UTDQuQX0e4dYBxBF0T4xcq2/InASRJfYFLSqTnHgcuNwo2GOhU1YeiaNUPJngqU9zbJ
	RWxgMTu59w5qCr0O4nn2f6yOuUI/1IvpQZXrjYfCgceqo8riyv/U7kpQ9pE0g5bqFCh+B
X-Gm-Gg: ATEYQzzV0TgNBoUrXuCkmjwpEk8f1A+Xnhtl3COIB1gDYuGedY6BTnAIaCsbpL/JrUO
	CFTJgrmVlWNUlGaIQiWNnKdfWK60/xceLeciWKsuki4sr9N4b7SBn3yPlGO1Bfu4xUzn2g78I6X
	A6yLL55TpRTZ+E+MCRdMvk18zfWB1IXaUe8krDijEn/KPgcymPvgCsfVzdS+6OXbxXf8+5WfM46
	6DfKQGZO7m6nATMLDwYT3WprEx0Lj07lPOr5ePr3E+Nf8iqkQBVpOnjqhqUkci8NTLaKs8+LGrY
	GWyXMwFmySS7i4rg0+TNNfhgffzNAmV4EETIZn+qPFcyLyXyEaFAx5Ko/agSzymDzA+ti/IWAmG
	jLWOLzwUVMAyK6wFEm23/l3ugUabWHq3TAN9mCVU6xX+/vgzFd5CK3brRpAGc0T4OXSEX+t+07v
	I9rX4=
X-Received: by 2002:a05:620a:1a1d:b0:8cd:85e1:e1fe with SMTP id af79cd13be357-8cda1a855a2mr240653185a.10.1773236134680;
        Wed, 11 Mar 2026 06:35:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1d:b0:8cd:85e1:e1fe with SMTP id af79cd13be357-8cda1a855a2mr240647485a.10.1773236134147;
        Wed, 11 Mar 2026 06:35:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97307dde54sm47202866b.11.2026.03.11.06.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:35:33 -0700 (PDT)
Message-ID: <eb3b95fe-977c-42b0-a588-cd77cf8d38b2@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 14:35:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] soc: qcom: geni-se: Introduce helper APIs for
 performance control
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
References: <20260227061544.1785978-1-praveen.talari@oss.qualcomm.com>
 <20260227061544.1785978-8-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227061544.1785978-8-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XGKOGa2o5uCMGmwBQe9zBx6-Bar2-kAU
X-Proofpoint-ORIG-GUID: XGKOGa2o5uCMGmwBQe9zBx6-Bar2-kAU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDExNCBTYWx0ZWRfX2ESR0+X/fBJH
 mcCgyWwpaob82LzOM71WgehUTZXX7dAMdXTUlp1exPp0wXSHKiCctJgS8HtQfiACiwBYZW+tmy7
 p4kCQVTh2K4GpzFNjYPw8zE7JdQR7wTDI6f2pdBLnEh5QU57pPM0LDHyDUwMuTk41efnkoGAKg/
 UTbd2usib98wwtdzoDAtR/DZL5vKAekIx7TInUZOOoVkxXS1fphWA+H5CJc0jMIGhQQlyzNIUKd
 PSSSfxnIq1KmxT5/NQvwb14AJEhF8uQHaEpycg8W35k4rCqoW68aJALPeyEMZmF9dryhjKCwYrs
 K2oZjT3FdfRFz+eg2SonKPhNvxaLWjxgMqyzC8wxXHFqw2aygcS0Hd0an+wTCG1mruQVhCa7O9D
 y6SVQECMoQxXru2UJ2LYSE826SZFPymCiNmNhH7LuWYASAOwBwuDipxK/Ad9kK9F1eJ8/WXRRhc
 odwatgBxCrr3NUU2b4w==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b16fa7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=u5jh5CAnnMYg5Z_R0xkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110114
X-Rspamd-Queue-Id: 38453264B07
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-97002-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 2/27/26 7:15 AM, Praveen Talari wrote:
> The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
> manage performance levels and operating points directly. This resulting
> in code duplication across drivers. such as configuring a specific level
> or find and apply an OPP based on a clock frequency.
> 
> Introduce two new helper APIs, geni_se_set_perf_level() and
> geni_se_set_perf_opp(), addresses this issue by providing a streamlined
> method for the GENI Serial Engine (SE) drivers to find and set the OPP
> based on the desired performance level, thereby eliminating redundancy.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

