Return-Path: <linux-arm-msm+bounces-39900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00659E05A3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 770D128D16E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 14:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697F7209F5E;
	Mon,  2 Dec 2024 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gLNzZeHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE318209F54
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 14:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150954; cv=none; b=l3Fj9FlhKSUoloL+EZDM7pvTijywN/T3gldphXin8acurWdezhZ8jBcYykKbQdgfmJewKJW/gjFPHA8Gv0sJokx/DAs7aMkEP/nydeG4bYz9UykJ7EahzNMv1NUfOy1x0vHb6GPmscrFX41x0sHje+e/zH0yrYdnqXKmRsZweGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150954; c=relaxed/simple;
	bh=lV9lMTRE+rP1GquD6QBJiIY+TgHJs5KZUV4RhHhEU/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dW1TjVa7A9Fdr46Rpwk6Btz+gd1z19IfRRNlTvHjZRk5CyzdpcIC3kegw5FZykug/ALH9ZbifLKwKzEZTUglkMqzZM/1w/zwGu1abnMkcvpLQBS8Fgbl1/zUveMVL1jiOwDVhPEWp7/lzXHSkT42iSCLPxYRNYF5rEe89p0pr7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gLNzZeHa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28NxIi017303
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Dec 2024 14:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmeCm5aFHseUzMvIfpcFK6WQhteQllJVpw+JfUL/Cq8=; b=gLNzZeHaaPvRCpkB
	MPwOZODo9pA9Fkx4Lpamj1wVPhSUQs9r/p+Dt9KxKSLHH7UC1xrL/Tw3Nc8hMTjd
	AJtfc0LTply28tozixQyIDuxnVu+ELWZb1DrHpKCaWjQnMKWIFKzUM0AHs4C8vvb
	cDl+HR8SPcca6kw107EoCbpmoxiX6Yzn1GhcPTacxegdJZZhXW1QW2oz1B/mSRhm
	ETDG95Q9Pr9qr96Uf6Ra5G1gN4cjHLN9ps6P/uVswRbm6wibWLMX131Q/X5FR1rm
	hlQ4VWHlqlqFh8YIgn55wGWKrUuN2Z5VKdk9sWj/nLV3AsdXSqQtlaYKa1PMEL28
	23Z7gQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437r2mwc01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 14:49:11 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8824c96cdso13346816d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 06:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150951; x=1733755751;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmeCm5aFHseUzMvIfpcFK6WQhteQllJVpw+JfUL/Cq8=;
        b=OG2CtDPcuSnjJ23a4NUV/OcdfPYnvEXVlHZwYmtGC+Yknv6g6m7InQhIO0xvCiME0e
         BnEtQUIzmfbeGvlBVM59vQr8JdK+A1vkVACyjfSrggfxhSJxk/oWL/gb1+54POus0Lm+
         CirHYjwJ3gMy4weniUBYYugkojW8WTjM0xb/8mm7OzPTEBe3Y5tnVJf7I/drdx91Xq/8
         B2jZ/gMO3AoZpW71ua9Jspq1TR4CZr45LcBtEDpPaMmeE9xNO2SwFlg1KVZw48HEYxcB
         9OIyk9XECKXNuqUipaew1yInuAEo3gem65BtnuCQFoAQ2lfysnapjGIwxLmIQurRdY1O
         4cAw==
X-Forwarded-Encrypted: i=1; AJvYcCUt5YrnLZflvL9rEx+LnIElaRXVjO9p8xDIHNQIXKhPXdEaaKH/P282BD/SpXbAQIZHPMEtDBe0zMDo1qY3@vger.kernel.org
X-Gm-Message-State: AOJu0YwExlxzfcnOqjPxt/ghHO9sN2vv1WuxlKs1TJ/+ZbKobdVzN4ui
	8WkB7/FKXXUEzDLbrsvnAnshpLVsKNufPTfJnmQk46OlLAoA3JPbn/VpuBixJ3gS3fO11i4Di6c
	9E81L6pnhfTOMqU+/SYJ8a9dGeaOeMrlx05eaBRx9/yXMDM3/LcPZQRHP4ybv1Fap
X-Gm-Gg: ASbGnct2n3CI/p6W8fewkl7AEOkho9oncrm6lZTKD6UgduHz1qNm4MvJeXiRKhsDOP5
	/fpFVhhadMs3Hcza//XQFdrCh8zG4+OAQcgKPHcFjgdpDBeihDPWb3NHAighk6chASofpcwwVrN
	tJT3AIYQNTkIaprMsMAAeH0RvCoyIRAMvBHx+EzFgvCnF2b2rLGpQ41Brrys/SgigGPfFCFokn4
	13sofyhwGNmm/rV0A6VBQNEb1dz86/H1wX1/NXAlRB0L2Noqk3qkJ9k/y6fd+92YwnS/XH0Ucpx
	i+76m+UTbfSdZ224AdO6a05vkj+7t4c=
X-Received: by 2002:a05:622a:19a3:b0:458:21b2:4905 with SMTP id d75a77b69052e-466b3697eb0mr170854641cf.15.1733150950977;
        Mon, 02 Dec 2024 06:49:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY/b2Xr5JSD6hv2ERHwLqk3dGl+X1CZfzk8QAzncEpwURPmtvtEf2h1Zi+fW0WrnFt+XNHrw==
X-Received: by 2002:a05:622a:19a3:b0:458:21b2:4905 with SMTP id d75a77b69052e-466b3697eb0mr170854451cf.15.1733150950482;
        Mon, 02 Dec 2024 06:49:10 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a3fsm518659266b.119.2024.12.02.06.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:49:10 -0800 (PST)
Message-ID: <891bdd31-6b5b-4b6c-9c63-eb0b3d1389e4@oss.qualcomm.com>
Date: Mon, 2 Dec 2024 15:49:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Fix USB 0 and 1 PHY GDSC pwrsts
 flags
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240801-x1e80100-clk-gcc-fix-usb-phy-gdscs-pwrsts-v1-1-8df016768a0f@linaro.org>
 <172375444790.1011236.4126358525646189263.b4-ty@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <172375444790.1011236.4126358525646189263.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SeoIGpK1rUzqtdUcTDtvMhjRTD_TNrPX
X-Proofpoint-GUID: SeoIGpK1rUzqtdUcTDtvMhjRTD_TNrPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=789 clxscore=1015 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020127

On 15.08.2024 10:40 PM, Bjorn Andersson wrote:
> 
> On Thu, 01 Aug 2024 13:21:07 +0300, Abel Vesa wrote:
>> Allowing these GDSCs to collapse makes the QMP combo PHYs lose their
>> configuration on machine suspend. Currently, the QMP combo PHY driver
>> doesn't reinitialise the HW on resume. Under such conditions, the USB
>> SuperSpeed support is broken. To avoid this, mark the pwrsts flags with
>> RET_ON. This is in line with USB 2 PHY GDSC config.

Your commit text suggests adding simple system pm ops which
essentially re-run phy_init would fix the issue as well.

The docs say the PHY can retain state even throughout a CX
collapse, so this seems like a band-aid over a small cut.

Konrad

