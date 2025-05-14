Return-Path: <linux-arm-msm+bounces-58003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFD9AB77CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B02C1BA0038
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257B229616D;
	Wed, 14 May 2025 21:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqoKUfxl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D096221F0E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257760; cv=none; b=rbyxJF772opE1IoDlbFCZe0lFZOweI0huL3XUXpdXMwnAnSSfaWIwa6Cc+hLiOoZJLXqdlGUN9LBkdxdJwVo/64izV5du3RhisdsF407YG9vTQNEv8Be5j/1xadt0QIVLTgG/lmgpNvP1hEigYg/1Kc8KviFFkFKTmJ4cfxQ6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257760; c=relaxed/simple;
	bh=j7WsjS00K3b+a97k61GU+JejilHZrixnSaC0OSTnvJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sec9aMEk/iHgNqJTSY/5eEFWdcHnhx5dw8Fp4LAcWkcPYYzDXZUtDRG6h0zju/5NtGhEn3AzAZGqbpwYNI86bDFeNNIs1pGHhBGxzkq9ztRbKSpiqY6Tt5EdA1cYuaYbeEQ1VUkq4/BMKSyh+TCUoDl1akkBXRm/pn2hFnVYoPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqoKUfxl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKokCJ015190
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NqN08L1o+DsIhnbifR4SWbDh
	2bpcoXr6Sqa16WdTVB4=; b=YqoKUfxlX6LrSNvIv4VpXjnzsCWs3vI0wHuJ+41e
	NQ7VVxMRHGI2+snTiktM8tPbIu+Dc7MZZyKEF0cDwoRGQLp92G+umcrISJBTpDww
	N4/qwrEwuFqjX+HRdHTHrMZ40WdYV59CV11ow7dd3UVdt6vdmBFo+nnCf3TpdjPO
	wwqh3jYjMDG0kb8NehkFNpFIUEpWp7CH8Y7R5MO38FxgFNDc2CcwD493LxTYxpa0
	6FgDNm9d8hAwWnCa5qZrV5jJ+Irw5BHMTLO84FmSr3w9SGijQQ6UUorTeazBak9e
	LFyK5XIIGjuZ59+FMAdeyvLanHhB5jTEyQqWCLOCZT8+Eg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr415b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:22:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c95556f824so22805385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 14:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257756; x=1747862556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqN08L1o+DsIhnbifR4SWbDh2bpcoXr6Sqa16WdTVB4=;
        b=KGI4QA9PwecU70LskCOFb2KRE1hFBIKgJhz/HTnFYTlTkag7M/vOPrRZCUoewhDabk
         T0b1ZySGVUb+KiLANkzLQ6ZsT6gLK1/OVp9iKwn7LHWcD6ehEzKtR6xTCSxeGNNNrRr2
         9d82ZhtneYwUyzNpQ7O78LUBdM31iEIVqggRNKGGvZ3tRXrHf+rp7drSb898fUWK/bJP
         6stBl8/0tStAPgiN+DLaX0mtrgxl/UPjOsTCZIvnL/rVIBRmkhLBROanGsU1OC3m/hqs
         WslRW5X8JavBMYd+2EpjC3aRMlgEwP5gtmebZzOxZE0ygxbnpiKDqsSpTakYo2cb9Urr
         0Szg==
X-Forwarded-Encrypted: i=1; AJvYcCVR1Xk7+kfJfxwf8JJjzpUi2rVc16E/XXHhirdcpGEHJOUgkAACoIapvC1c3duGD7yp7+nka5omakJ/hbFZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp89pER8tqKq49iNFw10dffxdJO+Ce9A3ZfuyBa1NdrH9S5Gg2
	N8tsdCt216+q/5fEDtk8+7sFXh7/F2EIW70uPMRHaovSTo45nr1Sb8zmu+N5BmSz8SRU5U+c2mU
	gC7zVMl4oyCs1IeNaphYTgA6ONmnLiQIH9Ypjx+DEIPG4N3B16rHdaYtx0liz9sqX
X-Gm-Gg: ASbGncuXmnxEfc4QvwIxFIQCioFbadSP8Vr1ZdfG4f2lupItfavJ5Mvxc4+qyCEMUf0
	skTkCPjyuE5XZifU2XPDobINv0MdiNym5McqOCK2S5DU5GXkRuLcrcF1gNmvshd58y5ejeHgRNn
	N7pyjXOTeWJBMhL6rnkh6Er4nyNSCQdo3kltw2oXBVM0+dksYV91OUD8rfItlVoIJ4l1Bb5gzEK
	i+H9f6eDV5XLmStJsZc4V5Xx7meWa/XazmIPF7feDBCxT1OyqpZiqVh4yktYQ5N+fdvX/bei179
	mapTQA8OP2XzrUZP1586p2r7qNOihv4B2MjiMPGs4aPJXZRK23BcsLv6U1HclJu10Jge6/N3qGg
	=
X-Received: by 2002:a05:620a:3915:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7cd28830017mr670164585a.25.1747257756533;
        Wed, 14 May 2025 14:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3j8ZrN0KQo365y2Sc8Bjn+p8W6FoHjqjWpPbd0tLd2YG4QSuAxdOrqQ6cIDMVlXolfagIsw==
X-Received: by 2002:a05:620a:3915:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7cd28830017mr670161785a.25.1747257756170;
        Wed, 14 May 2025 14:22:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fcbfsm2377737e87.50.2025.05.14.14.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:22:35 -0700 (PDT)
Date: Thu, 15 May 2025 00:22:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 11/18] clk: qcom: camcc-sm8650: Move PLL & clk
 configuration to really probe
Message-ID: <n6sgzqmwcyadr7l4fwek4nq6zhgj3wcv3dxx7jwmmszwmwiw7c@d7a7qnd3cv4m>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-11-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-11-571c63297d01@quicinc.com>
X-Proofpoint-ORIG-GUID: RQdAADLMoxG-NgxVP7F7Qo91QWMoVKJS
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6825099d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=R-MJ-YjwOO2PQHfhffwA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RQdAADLMoxG-NgxVP7F7Qo91QWMoVKJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5NiBTYWx0ZWRfXwqJ06m1ABTXA
 0egQJsi8qvTT155jt8wh2Jw/ACTP09FWT4vvC0lFNKowilzI+CO7KBH31BHm4O9fzaEetO7FZ2E
 3ZEUbZyDQObPc8uPUsoSSfK/rgRgf6m+tu5Zi9twCuiUnQiMwxLpRQaqT3dYE4T8bCECa/q2yXL
 /sHbu/mqvNg4i1Erl6JaTJVmvCMLhpj/nHNm8pzEp8JpmHLISpBK0G94j2+O3UUllyo73Wc710y
 /5PFrN4Dw7hRDQXxbxRCAoUf3e7MiiiyFWEXDgO26iL5h6hVP1df58recxD+s/vYUKcRpiVZrvV
 zxaVcUpbuscCOaX9mdF8pP8gEya83cbVRRGUVYxpXFW9Zho6FkeY0OxF/IAdVuVBC/bF0CAxDO5
 z53FcBPojoDB5srKDHpFP4ZlUX2oygGbed0withmIt+5LHJf7YNfQwWziB8UeyrOwSuab0+f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140196

On Thu, May 15, 2025 at 12:38:56AM +0530, Jagadeesh Kona wrote:
> Camera PLLs on SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/camcc-sm8650.c | 83 +++++++++++++++++++++--------------------
>  1 file changed, 42 insertions(+), 41 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

