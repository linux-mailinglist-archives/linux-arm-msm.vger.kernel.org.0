Return-Path: <linux-arm-msm+bounces-84099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AE641C9BFBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 16:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2EF47348F9F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 15:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4379326773C;
	Tue,  2 Dec 2025 15:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNymD01f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HvLkqij1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E61A263F4E
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764689836; cv=none; b=gK5A9uB3KMqmZAQrjnzXY0tzBbxs6bWBWvgmR1DzWsMsxsI5tfsBpLFKM+XyJi4YRMpDwCxLDJORbcWdzOzlzGxR9KXPXP1wMjhWgZKBWoK/ZA1fPUGv43vBz0FSDaolbOlePWURApHsM/WkrjxvEOdPUmN1DGxbKC36OIS/+W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764689836; c=relaxed/simple;
	bh=j7IN6GMzwOkUHFNWSKKlQeV8ehCPMjJxrWIutIewhVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rIxirBdkwzPngcHfd6i41lViiMgsYgcZ4sBhn4r7Wl/MvS+JqcMXKrrFsw65W4UKIWOqB3rVuyKEIjxVqLkStsayFrHcn8N8rf+cLPevdjSXvqDBTZW0Owqna5LvSgfo7K0iFwv+HzzWC4e4/ScAXmfu2ZsjVOTke25TYEg1w34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNymD01f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HvLkqij1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2B4PfV3310271
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 15:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=; b=MNymD01fnkARBFE8
	f30Xj0Twb7f0JXMlzRlh1AWQmjzx6HXA4kbWVbK+kojTuHMCdOgSwJC7x3FlFDhe
	p1ESF91lcGvnoxNH0/gj4x7PtME5E7FoImmhRbx5eW/g0vIOxoTCLH9055hEy/fh
	0AiWHa+CYoT3drJcb7auPKuIH7TSlsk13BkfeZIC+MrPgsThZ1UDNEwxPEvSVc0p
	34TPvYZFldyEZiLjuYPBJ6yxT5ZfovBKNWWImGCGPXG0srgNI5VlMaZo6F05W3/m
	5BPOlySCNw8R4I3UFXUQzibHm7/xDr6VU/tKzbnSdqEFXbP/wyn+lxIquSuqBPHe
	pAjkiQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asxwwgtae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 15:37:13 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-937271bb17dso182227241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764689833; x=1765294633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=;
        b=HvLkqij1FNp6evzAnLDbwDETR2GC4G30fLfHxp/Gx75BwfwIIOyxHif6+FLK8NEkJM
         1DJkqdEcfTIHFE7fsX0YIPyvo2i8pveqOVZInCFjJedMJGIH9y32EIgMhCmIVDTRit7g
         zniZgncZyeUYLySdadjyAEWf3CQgDR0q7+7lev5ln0S1KOZ5/VESVT+OWots+WTW9Rfk
         YgHry7oAzdVbfRIyEAw5rQUbugwt3S/yohJWPa9qNvHLUnkWWul9BiucKtalwOqr4Heo
         sw7MHvsjY3oF4rxWjHJLrL8jrRxa/tuqxI3g/n/O2gaz7QqXaKRk0+WMyDMh3wLHevnv
         5tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764689833; x=1765294633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dvI4jnmIBSLqBzEmGJJZVq3e4u/zHX94LqpdnMLiDQ=;
        b=V0T0O22XgONvbRabNjCt6UBS/bvvMkQzXcc2Hc2WWECd+F601wFX8uHAJ4ax0QIgQu
         8TFDvPrZfFm+67VN80czKxT4JUwmkkS8oHRL/6TRMyZQPORFjrVKD7yhD0Q9sC7Hnyap
         xqRn5S9S3RkrawfMLlZQSkNY+lKaFAClodDb/Ovw+3Aa011xR7TCGbBzYQRRLcdcBADH
         tN+carQvMvsNa40yTu/GDV8wKkpLS3J6KfNcTHpq106T3b6gp6gFCV4+qYgKx0NrL+Li
         RZCsV04wBNwKaXCfSUCsKF8z7BOyODnPzW8Lg+KZQy23DWA8XA1b+qPMHawbWi+SijbG
         wUgA==
X-Forwarded-Encrypted: i=1; AJvYcCV9IqbED5vHAf4yfveQwbw4giKF0/S+eszsqGaTtddmvcSKIIc5/BD4Wd64FI6463YF8G/gmrnbD5XVSp5n@vger.kernel.org
X-Gm-Message-State: AOJu0YznJn93rcMnC9PPR86CLrZeq7UFSNrdXAn73qlRI6A0jn9i0h37
	5Gz79NnHaziKTohxIGO3AJITwlVP1oTH6JFv+qJyLx3Uopa8L8vEgXb4HN/CZPwwfuqnkg8se+n
	4Jf+VB59oWIf0N6+Lxgl8UU7ay2l8NxGiY2cxspqsgIcz74U5cNOC9/INhZnciVcavP5R
X-Gm-Gg: ASbGnctrNkKjqZh80hxp6VDWFBhdXv1Oj1+8EzZUlb7DcFz1jLA98cKPfVzM4AnThRS
	+C0j30xl4392E/8sul9ySZK8z+KecdgCLyG7LbuGyr3os31QAi6xw8rEyPRPIqt88RWPx9xAXo5
	5IYWebEau4an3kyL3MYAXt0auhrTxb1DPkNS1hzQTSfCyg7YwspS4IUa4+srlzFxC7p/k0hDr5w
	nvkF4H3EtX/SniqFRCBkou2pS39a0NFr/TESl37tIMujRXPQRN0Muk2MqY/NArQE9CO+LN0gCsO
	2WM8BYDaFllS0syOozSCLaonH2Z7VwpSVM047shBQqnRvQpEXe4pWbhbytc8sOr01eNaBxEVUEi
	/fLR3QgnJen5FInKrxtb93xTi7wJYRnqPSVFFJph8xFS6Z8310x1XZG+6vjtNuFMQ2w==
X-Received: by 2002:a05:6102:5ccc:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5e1de57c9c5mr9556589137.8.1764689832777;
        Tue, 02 Dec 2025 07:37:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvD45845hdbmhM+YS7Wjjhg3RBweI2ZE3krzHTkcYizMtoYHA/7UWe6Faae0ZvkArgVzbYoA==
X-Received: by 2002:a05:6102:5ccc:b0:5db:d7a5:ba2e with SMTP id ada2fe7eead31-5e1de57c9c5mr9556563137.8.1764689832343;
        Tue, 02 Dec 2025 07:37:12 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b926sm1544786066b.68.2025.12.02.07.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 07:37:11 -0800 (PST)
Message-ID: <f7609d19-5254-4419-a600-d0904d92d525@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 16:37:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] clk: qcom: clk-alpha-pll: Add support for Rivian ELU
 PLL
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
 <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251202-sm8750_camcc-v1-1-b3f7ef6723f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JbyxbEKV c=1 sm=1 tr=0 ts=692f07a9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5mhmk1EvtyQYLrneLBIA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: XpCae5UXZb2cKp8NxZo1prEHPmAH56Jo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDEyNSBTYWx0ZWRfX/T3j8sSNTDg+
 seWU9hIJQ2cf6iFi6GrdvbdQXgd//oIT1S4bb4RKM3dlrfeFb2a0emg3TCU+7yIbrHfYSVTiaFM
 Cd7aecptaS2uH99CCVsxzQzHJi+guS+BtzTBJI4gzH+VgukUfgJ/U6Zwmj30LrtxCKzzF8ZXzrn
 RWHfNNGvCNwrtKXEzYOY+XtzCISwNs50ns2OScTfzXkqLfqqJLh4n+5EL/XnO1eeX1vNSyy7V/B
 wOJHRJInea3tGFzacTt5soR7nzctrl9SUjPc5UYrj3tr0B2fb2HykcqW1hI+t83PWaN72sndeyv
 hdQspGxrSEN0O5wr8ljD/fhNvvnBOcaAZfcCDjOmA4+o3JO29bFFm/Qtmi8EdciFQ3dhRwa5lAk
 y1ktWwSNriKqIyNTP41IUwwY2FMvwg==
X-Proofpoint-GUID: XpCae5UXZb2cKp8NxZo1prEHPmAH56Jo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020125

On 12/2/25 11:26 AM, Taniya Das wrote:
> Add clock ops for Rivian ELU PLL, add the register offsets for supporting
> the PLL.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Matches downstream

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

