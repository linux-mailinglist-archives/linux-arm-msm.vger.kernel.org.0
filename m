Return-Path: <linux-arm-msm+bounces-52660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2EA7354C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 16:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03AC97A2630
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948FB1537C6;
	Thu, 27 Mar 2025 15:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PjBW2NkD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3915278E
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087985; cv=none; b=dimFZJWOZDuXyCSiTk16sq8bBlSh+y+baGjsmEHWiW+AOLyrTXUoUM7U9VUOHgmqwoKtq3GPvqKK+SVpfh4nu4FeBK/FZ8lztoaO9hYBtCdo/2zuwvCqzPPAZNyN+E1JiZi0BJmsSmheLKd0x/ZBNTMkJ8wndAQsAonwDo0Wek8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087985; c=relaxed/simple;
	bh=oL7hddb8pSaL/X5YLvbgpsuKPSqXlv5kikYSpG3nZB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxC2H47lntgjDDBv8cs1Eyn729STNviKNAdDwr4BbltKOhny2kqWDeuU6XOMDQldPijajI6nooHrWtS9FW5zDP/qcMIVimGLgT5CixEez1Kjjonj4t4/GWQJXuJbAw11zbdmo87eZEPTlehwAmTUXfM6tIYuqg0591MifwL6Xyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PjBW2NkD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RElBKA013803
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKFntSHCTGPKcQhIqy1arMAJ
	cgI7btxBYC/rwfIx7Vg=; b=PjBW2NkDyXAwzk32YYPee/g+NfnL3lhxpNyU00TQ
	zsa38pBFNK7Q2lTp27z/CQZbNWUi+syhvS1hC59mgfH2QMPc6WElPh7/Rtj9rCdP
	7EpV/AuwgrNFeRKFNabTzHuGxdUapLQBAsgF6/y3uZgiuuYnkI4DQO1aUScj3fi3
	HRYFsRITcz9u8V5ONlgka1Ypy9f0+U8rxBJb9B/hDPgV8j8t+N7xKE1cNUW1jVbM
	R94k4zrLbzlisAAmzCqh+A1y1NyXA9dxKNhg39hbO+vjQwVgmIiHvUzWeph93cuP
	8hYdebfv7gS/EYbV608WazLXNta71iB1c78G78VdgP3BHQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcmcca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:06:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c82c6d72so217908085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743087982; x=1743692782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKFntSHCTGPKcQhIqy1arMAJcgI7btxBYC/rwfIx7Vg=;
        b=t5NBxmbep+EOdOxwEaWu1HYDX9hcoA3nmEgeDl2HoVtB7EDkittvctgHiToy81xrqa
         qa9/freO8YTPTZDhR7Y47o09lqQkKBlAOVlSbyW4VjcTLJTRq3VGrttXhQMofnOzbSKI
         xdOjPFJUZ8fm/iAcad7NUQv9lRuIEhioEyaYEA2c1pFh/tAKo6lFVdvHYfRPh+EE1aZl
         xyugaxnUfQ6BtKU+nvazATWC0h6txzQF0d3W2Y5S04kl5luKoHpc/qzZQWS/umfTwFO4
         AUUiz5jNhnC9US5HJrNJRHhIr1loFmkk7RNQMemHdxV0obpajlC7+1da8Vw27Hg+7H2k
         NUUw==
X-Forwarded-Encrypted: i=1; AJvYcCXbq5xL06EkKb7zVPyDYPFPPT+Mu5uSVxDXz+Mkbb/K3MIFe23mkcu38NBvGXFXEG5P2LwtQtFIL2ZPplRG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg8SbVky2UuTP1X9Ijku3HxUn3gc04ZPmudwBszth63NC+c5Vg
	NWjywNXMCv6DXjy0SiK4wb4NgQbQCoGOxSjYVKUn4oAd5cfeNS7K6qKxIcqulQGmsKVTDoEi/Z1
	IeSYeBrmUgLuHjyp2NMdONa9wT0Nt8BLBRHr6XDxcBOH/nb2OZjIVBBlWsAh+7Dao
X-Gm-Gg: ASbGncu8EzRShR614qRRGSayHqf4URyhHRomo+NiUpUMTc9furj8YfBNsJe0E9JjAi7
	TWNoOL30Gg64vmaNhsHWu+1e3V8L8Qw5mivvdyZ2T8n/62eO22iqKtgnCNTx0tL2Y01DqzX0gmM
	8ip8fThqz5LsoVW8ypC8746lNpybeLOsPxLfjPjSKTkVLQAIIyJqsjd1xBsFq4HOS/jxp645il5
	t67h4Pk6zEmQemc9w4VifQuR8+hDN0zDEtmGvi7FdOjsfJDrqs9B1NMjjiiV75b5Sy/Aeq9gd8c
	f71TKowppTN1wUEbJ0bmfgVPVPgnwz4OdYfTFH7wI9+U8WflgGfG3TgUTsiDTLFd8nxWwELvGG/
	CXoI=
X-Received: by 2002:a05:620a:2492:b0:7c5:ad3c:8478 with SMTP id af79cd13be357-7c5ed9f4f9cmr517570085a.16.1743087981679;
        Thu, 27 Mar 2025 08:06:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhuNSAPU6HEIo9bahrZTEHK4yVoTqrYVjH2/T9oNoAmTxgLhnWKjqSSISPHOseE28eYCJQuw==
X-Received: by 2002:a05:620a:2492:b0:7c5:ad3c:8478 with SMTP id af79cd13be357-7c5ed9f4f9cmr517565685a.16.1743087981179;
        Thu, 27 Mar 2025 08:06:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64fbe00sm2106702e87.146.2025.03.27.08.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:06:20 -0700 (PDT)
Date: Thu, 27 Mar 2025 17:06:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 10/18] clk: qcom: camcc-sm8550: Move PLL & clk
 configuration to really probe
Message-ID: <ycplfyrtunsp6k2cuszsynljihk5obhzl3bau6lt7geouabuwh@ssbbduiaz5nm>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-10-895fafd62627@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-10-895fafd62627@quicinc.com>
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e5696e cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=OU1JASuMovj745rkUKUA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: tGEmltVKXa6Q4GRrTmrvo-mtl40Pa-sL
X-Proofpoint-ORIG-GUID: tGEmltVKXa6Q4GRrTmrvo-mtl40Pa-sL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270103

On Thu, Mar 27, 2025 at 03:22:30PM +0530, Jagadeesh Kona wrote:
> Camera PLLs on SM8550 require both MMCX and MXC rails to be kept ON to
> configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enabling critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-sm8550.c | 81 ++++++++++++++++++++---------------------
>  1 file changed, 40 insertions(+), 41 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

