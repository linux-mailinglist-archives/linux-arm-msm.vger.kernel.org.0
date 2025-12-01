Return-Path: <linux-arm-msm+bounces-83984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1424C97B9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 14:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E96F3A2877
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 13:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD93312835;
	Mon,  1 Dec 2025 13:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUxGGWty";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGmK0ZcR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5E031197E
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597159; cv=none; b=uVTVw9cXR9cF1ijWlHgf3Y33e6dQp7sfUXi2ijf64d8xTfcFIx9DJA9VHiHq7ruI9/fr/tMByYw4PptYy51bxdv4E4Bxl0Om9uJktw1oGBMS5t+hNxrbnWiVj5BWvqEggnK8nZpMgehpdDyhWMRbDEhgWlf0M+h+6ohi8cV/Tww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597159; c=relaxed/simple;
	bh=LJIjxIwLC2/Z7nIDj8v8nVaC/uJg9U2BzThmKdqEf7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUFPrQG9Mg5Kz4o/HadJVP5fOqw0WAT2q+ybeOVC/ihQjTkPP2JUHJFYGt8/lCZwN0FssKEh5YEwy1kvLtlUVsSroqwVQmzthnovUX3aIg2VGRrDqF2PnqRnUL8SbgmHjd1fvDv2syBLsjUknVxIAOJgRs+iyPXPMGRHic10QqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUxGGWty; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGmK0ZcR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18V3m42743827
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 13:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKjoTfmK5CNT1ZxbXv4duZphnPk0sq4/C0t8cEXPU+Q=; b=WUxGGWty6vdy17gn
	NFfDSGT3YT8lS4DjT9HIbzpYLLKkqgK+TJidMYT+MAHV/7c5EnrsoUEocmD5DHOw
	2odreJDS9aDoJgH8GCXCDGPTdWOi+8iXteglDSQh5h1Hg8emrLoX4umN4HTraD9I
	K3pVEdBkM+dxrdZTpxAbD4yrcCepz19IIUFn3VmUstCNceyEgelPsr8h/YuP7Lgy
	AbxtABKcoZwhaG6EwjBdOym3Xn2F6CK2b96t55wgTlijTUEZIredQlV09015+N+M
	WCqOLuqntQXMcxjyGcvz9D9YwSMRmZFGmXVo6kQrd4l03dYZpOJMbyPfH5e3pJnP
	6IhSvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4arwnvt5ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 13:52:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee07f794fcso8217991cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 05:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764597156; x=1765201956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hKjoTfmK5CNT1ZxbXv4duZphnPk0sq4/C0t8cEXPU+Q=;
        b=iGmK0ZcRDUhCfrjXb8N6+WBjG0FEbNN91S8T/PGazTOBu54dwNDL/WBdOMrfiku9Xp
         caZCSBt0hyGR+l5u26odbro3jLX0FILoPLNVF12NN/ryMP80Kq805leeK0xiXHfDvkBL
         yfsJxi/S8NqPa8zH7JD1PX4NbXMjPUWjkr72/WhKdUvwq/8fH8aOhZ1TUD+OOsmiWOaW
         +AA8yoIWU5mwr8r6kaIWMnOuZE6fq6uVue4Fa9RJHwNaAXMmxatApTztfvVnUBkw+T8z
         nlYXyyCC5mMNfpKv6CmAjMkM2COm7/SV6L6nObnUo3TZj3A3KOtX7uK2xmiYlRwa9IuO
         wL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764597156; x=1765201956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKjoTfmK5CNT1ZxbXv4duZphnPk0sq4/C0t8cEXPU+Q=;
        b=Lq74e7wIZT4a5TOUQ4Sl9NM/dGJMJV6O5r3IWNSdbDNrtGxkgWLZk0mshZ8w+bpsK3
         ftYa+hdfE/kFohGRm+jEOPfCa+1Tsh/+VMi4Mr2/V9AB9eFWh/D3FIV/yljB23z8HI39
         vcPzSES5rXQjnqVhUAO9CQT/XVnGpA5N/PSv5yraXvoxvMDCtPtCXsNN+Sj+4yQU6S5U
         dDzyk0mtjmK4zqsPqaGKtgoi4UQGRA3CSmnx8WRcKlllWau3zrsDrSiLVbB6zkAOwSnE
         9JrNEc5UlYtrYZTpBB9XIz+E1pgFC6RVzrOzgZRfAJhw+0capwrXHx6oYYFdotoqg7RV
         OYZQ==
X-Gm-Message-State: AOJu0YzC6Q0l8dj9fMDhieq69Zcu2Ree4S06CNk/7cCtwKxZ2faO0I6W
	/aoqPdsh9bVGAMWK7lpN7DMAfs8Y+luz3INzkGcfbZAvHX5dgiVCPoujZ4O5xfiyFE/sOYpapTf
	AiMfvduKhwXam/02KWkq7Q/oWichJHbLVLsjkYh8u3UmVw2WCDGJ9m7GyuuKpv3LpN9Jd
X-Gm-Gg: ASbGnctv+hduOtTuvetYpqLSGYRyd0UlNsN8c0Ik4Ok8fah83wGlTGNx+lA3Pm+WAAQ
	8fHWg9hu/D3U3R2sj6eRoqiV8FPNkVEKRgzaLU2ycEP49VBg5o5YZRrTjrNpCjx6DYRpkBDupwT
	QZbeWYYXj9JPHP7rUdlk061H2Khg0yOoCaAcMNTMGR5SEaDeDr5pKRAKjNDgIgLoD78n6PBVuvT
	FYKYDrigawHfB3Gft8TNBtt6yA56trBkpU8Pvw35bSkX4VKM3WwTPPc+zwVz+X2DdIN5/nsWbHg
	CpOgVJbnWJlMec8fkVGgqdqj/znU2+qa6I2WNuKLN0RpGYrjh/O8Yq9CQKqbkKKh1+f21tArvDA
	7IkRGS/mDl8KmppdZtzaXmdyP1w6yS/ePzES3DCebnQt+iCd3Yz31YuFO1eyw4eEzaz0=
X-Received: by 2002:a05:622a:144d:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ee58930d72mr408054861cf.9.1764597156456;
        Mon, 01 Dec 2025 05:52:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZHK7kWIJ2QSOGzFsqFDmFbZyxcExJNrXPc3ZJA23eiE3fEzbc0O3NQFEGjJy6sHtib7FH6Q==
X-Received: by 2002:a05:622a:144d:b0:4ee:2638:ea2 with SMTP id d75a77b69052e-4ee58930d72mr408054481cf.9.1764597156020;
        Mon, 01 Dec 2025 05:52:36 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a21cc9sm1218462566b.58.2025.12.01.05.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 05:52:35 -0800 (PST)
Message-ID: <11056c3c-452c-444e-84f2-318f9dec6831@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 14:52:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: ipq5332: Add CMN PLL node for networking
 hardware
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
 <20251128-qcom_ipq5332_cmnpll-v1-4-55127ba85613@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-4-55127ba85613@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1vngT1NSroJIC6DGJ9IjvmoNoqTeQ_ro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDExMyBTYWx0ZWRfX/YhySOQlal9d
 jM6T03E1JFVC5/4W2Tgj6B7f2UAJgXGbIWR5pC0gxY0cDdnhypWuGj2eyhfXSAWQgfxr7VyYsXh
 MseW0gvq5Glitkv46Or3ebLvZKPGFv6cwcHzCyFW+NaJL5Hegcjf6igZ4zuFXxaZUpoHvP2aeoT
 dwk7N33cGdAquxMuODfX5EyHqLe/H3IZAH77k/bXiRSt9mVUaeE4AXVkD8Oupo9L27lHf1GqmIE
 pQ2O/IlHBuIYJO7Um879/ai5oYAiIzMNDZ9qKo557inBJKDqL7np/OrIi5RGKaqv5+ht0YymaXR
 UXOtia1EDQ18fok9XZ0343oouM24TcbGNbobr2rMPujdPpFvvoLf0bo3mAaE6ie8Q2xAlSE2dgy
 BzST4v9wNNG6uM77NnShYSB+t+Bakw==
X-Authority-Analysis: v=2.4 cv=Urxu9uwB c=1 sm=1 tr=0 ts=692d9da5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rMzbURfg88p6aAaFaPgA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 1vngT1NSroJIC6DGJ9IjvmoNoqTeQ_ro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010113

On 11/28/25 9:40 AM, Luo Jie wrote:
> Add the CMN PLL node required for networking hardware operation on IPQ5332.
> The CMN PLL core runs at 6 GHz on this platform, differing from others like
> IPQ9574.
> 
> Configure the reference clock path where XO (48 MHz or 96 MHz) routes
> through the WiFi block's multiplier/divider to provide a stable 48 MHz
> reference to the CMN PLL.
> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)--> 48 MHZ to CMN PLL.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

[...]

> +		cmn_pll: clock-controller@9b000 {
> +			compatible = "qcom,ipq5332-cmn-pll";
> +			reg = <0x0009b000 0x800>;
> +			clocks = <&ref_48mhz_clk>,
> +				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
> +				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
> +			clock-names = "ref", "ahb", "sys";

1 a line, please

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

