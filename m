Return-Path: <linux-arm-msm+bounces-68311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A80B20573
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEAF516F3E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF5723BCED;
	Mon, 11 Aug 2025 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mG5tjr99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2E223A9A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908385; cv=none; b=IAPaK+KjBE3W6882ZyWo5BtDo7CQMWXGGsUkYw+XrUFm0nsMkMGrbzBxPtatmd9Ue6r2W/qa4dbCJNYZl4TxPYlGmC94SfLX9j2QEai0tZpy+1WPot+4MHNNhAGT98wmWcFa2xxhHkeFFAoQT3n3Rf8iJXp7cDRDb1DFPLycwmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908385; c=relaxed/simple;
	bh=aLfJkOIeEAJCZhqqFdhGsi7u4fwjQHYOZWwmnW4Phc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEGa+2rMArSX7etMm+WAEY0XaDDEDE2k8DAJM9RDx6PbyR0MCn6WlSr4mdMM2vSSGdFSgTMAJT7rZyfmN4C8fcbzklt/2s99WrBrjrSmMlOCzdoVGFUHp5bkAESzcNhs144RBi6c3GOED9ym8kp2XaQNsGYzwPSrwtRQWmEQ1S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mG5tjr99; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dFfX029260
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjMB/32U3IxFc2us9Kf8imiZjXbuMlwszLS0hiGM4m8=; b=mG5tjr99fG3HM/K+
	gsVYrKBFytzpoSkdOeGguGQlrImiIhoMQf8baomBjICJwRTkMzWsnrYB1CJd07hZ
	pxytLO3mYmtgZ5dRBni5OnBnw5wTdR9Ula19M0ukg7r6dYBzdJIyIfuhOiABPrI9
	FsbtTkPZHGr+N/VMZHYD32CBlOIub6nQDBFxCrOXLaUbDWqn563tUMhWUepmVSlq
	ZQbkqjbeTqCKhMGHjT0qyjT8FYA9rzffpL0WeNTB3WQvFJvrLDZEwXo7pjEZNgBW
	yKxZ15jdKRUrd2uhK+RoY5+5GhruKDnFdvue2NNnveLXnLtEwTWNmjkMour0Km1F
	auZOVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbydh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:33:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08f6edcedso12440311cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908380; x=1755513180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MjMB/32U3IxFc2us9Kf8imiZjXbuMlwszLS0hiGM4m8=;
        b=xEoTd2+82CMncRyJI0/n18zlQZoWdVySqnMOFT0JoCwQplVblTG6UGHv52VTEz8aux
         RiACrjwa7HM1+OD/RNOLMGOgI8bV8UmKNXHEzn0435DsWOWA6scd5FnN27JsdhKlR6x2
         zutswHbWzsvaJUdvZ2NG7M3wULFjKC7HmJZ31Hl+P/dwKViObKQ+ydfuIG12F3qmGE0m
         ka6znlIC92MQ3vpkU3oqaSIWrGYNpY3Km6Lw3+8s8wk4icCwTHtkfmg2TqOGBtMNW/Oa
         Ibnt4ZIj8U0qos2NmGarjZHKISw4f1xNa8wcd62aXtzIDO3BOZm8+LycME8ImJHMB3YM
         oYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqnSWG/Mr2Rc3xmHFR42umKwwMRXroNG3vhgSCmZo85N61VbrvRCv4rF34bNByzrWmgRwE//J+ZuWAa8El@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6iVieMxrl5MWCHi2zUtH8yFzWwYb5Ql8nqBTr2gdaa7gV4gOM
	8Aowo765Zi56csaikXfUgs8L5RdphmAkZO7dMD+5cUfIH+RNrZJXUMz21e/vd+Qprr/dl//1Rrj
	OIGHbaf+C3AjhcOAsY3mCAClaUe3eouCyJEE5DwPiGqSVksBUBZcfeBWVT43dQ7A7ioUm
X-Gm-Gg: ASbGncuHVD8l81aDVoI4KE6YSc5hw5xUfHj/QuLePjK2WoVDVPc4VT0b8tNMv/twzuT
	anyj26dGK3kgJE8YT8IGPQIPSCDZZykqMf65HpAUQaxLMv7zac5uH1xj7wbhr91h5AE8ktk16Kz
	NWe+HDXiEWWklJsRa73OPlk8EwEEcJhPCWYCqTgpX4VD7y5XPmWWtOabKV4UMHhM5271aS8kWjs
	88MGMVzDtxO919jJjWSPJ7f1LjshYEqbi9ATr4za3uFJk741Rv5/XK8B39ZFV5s98+FjLT/xQbO
	UG5HbFcjUXjh6ntTHZyIskTbHz3siiRFsCWcP3rSx4izWEqXXTlJcRBV1xzG0hCt37MoDRxnlZZ
	PZRvPuGhDqNv0fMHxpQ==
X-Received: by 2002:a05:622a:1ba1:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0beb027a8mr54331071cf.0.1754908380506;
        Mon, 11 Aug 2025 03:33:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHZ3U7a4gt2KHpyBD0mE2prizsWoPQrACXSYquI2KmbQ+tAz00IMulPe82iKcOcMiQR8P9Jg==
X-Received: by 2002:a05:622a:1ba1:b0:4ae:dc5b:5fee with SMTP id d75a77b69052e-4b0beb027a8mr54330881cf.0.1754908379877;
        Mon, 11 Aug 2025 03:32:59 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3361sm1997594266b.39.2025.08.11.03.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 03:32:59 -0700 (PDT)
Message-ID: <e410c5f5-227c-4852-9223-a935584fbb75@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 12:32:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] clk: qcom: apss-ipq5424: Add ipq5424 apss clock
 controller
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Md Sadre Alam <quic_mdalam@quicinc.com>
References: <20250811090954.2854440-1-quic_varada@quicinc.com>
 <20250811090954.2854440-3-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811090954.2854440-3-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX4Zka0Df+59pl
 RlzsDYNOLj4nEztcU8Gxrm/5+YpuLAaxhFcus627f/DeNJUhnyV8Le/8aHqkcCO1xYaHgXEQy9s
 Oa18bBUUVXX02w4ttDVJl2w+P2EzDNRGRkzC7SEB3Al1B2JiO7O+RMcoslhCMhp7jKkHEuOG3hy
 j5vhSfhJTYyOgPXLRo8P0/TgQIbZ+u0EIXpj03RVTBure3iaxdc8GzNxkLJGQ/4KiGeI2ndcw0b
 vbBtEX0nktvYdIOGmS/EzjUgdUkf2Kc3slqFYk5gHy/zv1Pr64V6TLTkX8Lu7EsFj8+JSvvc+op
 C0WO0FIwI0hHOa7+CUiPJu2EwNDfyw9mW2E9xgNhVmT5+RUa3q6H4eLBHHNhjvJleG2kEMazDPg
 Ce7sInht
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6899c6dd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=ZSjPvR6QFvROfIIkwVUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1bQqtfIwxlMUUkm_WrrlHe1k9jaF_Ndn
X-Proofpoint-ORIG-GUID: 1bQqtfIwxlMUUkm_WrrlHe1k9jaF_Ndn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On 8/11/25 11:09 AM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> CPU on Qualcomm ipq5424 is clocked by huayra PLL with RCG support.
> Add support for the APSS PLL, RCG and clock enable for ipq5424.
> The PLL, RCG register space are clubbed. Hence adding new APSS driver
> for both PLL and RCG/CBC control. Also the L3 cache has a separate pll
> and needs to be scaled along with the CPU and is modeled as an ICC clock.
> 
> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Removed clock notifier, moved L3 pll to icc-clk, used existing
> alpha pll structure ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

