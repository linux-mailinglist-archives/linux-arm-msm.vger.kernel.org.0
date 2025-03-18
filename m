Return-Path: <linux-arm-msm+bounces-51834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C962A67EA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0C4423F78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 21:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118BA1DED7B;
	Tue, 18 Mar 2025 21:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKD8esFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DCF17A304
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742333548; cv=none; b=PreBthRWesIoSY1Qe0T9R4X+hV2jpTennKb2EwWg0HI1OyBY7Tx31dlhAZ5wjb1mBZMe4XgC+T14SqlvHp1icdUeXcqKi6v75raHPqXXO9fMBsPLIKAZwCISFazAIEzRYqye5ZLwwo+r1awksaBVfGWqv3JOfceK+Qd4qPzYkNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742333548; c=relaxed/simple;
	bh=xCefQxY5eX5TyNCZN3Ts5F4MHBnzagPkrKVWljYA6ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUUfR7hQmAhCZm+XEQOVhZZx8kA/I/LNTj6HgnVRglR9bA66veOskNTiGEpmwGRmfdiuZl4AQrB4DPDnMKBFynEUlzXV2TBqKXVGDv558lEcdLSWxYrkED9rO7NegyTSoDWGFEIjAk3ch5qCJw0aiinlthrLTr3dHgZEnk89CqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKD8esFq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IHCoqg004678
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gPOW806eFczV4bEYj1EqtuH0
	iSacm+l0DRcJzd65XIw=; b=WKD8esFqZrV95QoSeR3zdxinsFLgvlt0u8ZV3+e+
	jxfwffHHsek43tma6P/I41dD/v8OtZUKnhgTotqISLh1foCrVGsJ/xbJOk7YdguR
	ZWPcz+hKACRRSJxCPSAQ7aAp2bIJi4fJ52ZUOt7U9eJ+SZt1qOSQDAgl9eJqcVC3
	8HwaBYbNM9XMsgB+bYyADwQliMETakQf86XyHxJq87EqET5V23ZbFsz01Ath3O8/
	t8sahk7Ay7npnjNrcwkQ4G3tTvaZuvFFnLSTigy1fWPtVQdUcItb+nGC+n3t9oSZ
	o7qPwWV9i2lUAlsJU6irZmIsxJmeH2OtN6jpeOsosljoFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45fd1dgjfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:32:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c549ea7166so1006928885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742333544; x=1742938344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gPOW806eFczV4bEYj1EqtuH0iSacm+l0DRcJzd65XIw=;
        b=EntbldcY4UP/7mZ+8+Ow/Kwz6KLZc9wazDafgnpU82MIpaln3+boA3IQRI3VbgX2gC
         ridYzCiQ/PP1E6DaUOaw6mMhmWgqJeyyTg50KrbTgptOsL5KnUO+/1Od1J86OHX1JpKV
         rCZh1TbpAck+u8Uc8GgFgkcb2k580Y7xsJsUyx3G2OHvKxxTbzhsXnU1BFC5tUmDs6Ba
         JSpEe/Yys+j490uAc+RN/3uXVuarkkfZgvOIAedIlQGXOohE/7z6KDIWFKd3hfLJ/I5p
         Okfw3+BPDM6HUeZKAZTN4mK/ICwdrDTyQcCf/+KFMk1ahBm8finIrNLgK+6RC8jFyAhC
         gZgA==
X-Forwarded-Encrypted: i=1; AJvYcCWua1IIQ8jPGmxfSyUlUqfx7bZnXYjH76vhpnY02x576jO6Vj2IBCOjmoqNtQEuigBrM3cuCrtMRXNOWu1Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbz9In/kU7JQTpHNKq3uf37BapB1Xwz5obItKaW3gd/dRzri1I
	c8AO4qhPM2GxlgS3GG5lCIp9fB7DmmIr3NgW4eUJm63u/5+nwEUFPwj99XC5ARN0l5t7rNt2MyS
	DvCWWPq9b7Z547ieHhUc29SLn9nNZfiAYyZWI+XUkupIK+mMWFpcBNHINryDH8zpm
X-Gm-Gg: ASbGncu9Q52kEevC4wPFVT/nuMYaEU6+qH86xCOqWmvM6omcUWeRKK1TfaEfvKVkSey
	+Khv5wijOjVmb2TS/cnVjmHrlFEhCkvPYxjr8FuSGNkP9cHvTCeQijPDCbUVbq4P0ty7x63lkvT
	CN4OCv6KGs/MpCizBo3E9l5a9Rb3ZjOIANn15QUyyRth2jKN/NyLcgEK//LZZuFpPk115d4HTUq
	nKuqAjX8Nxy6DxQNhgFx8/wFXrl+3R4RDZ9VuwF+kg1DR40zWCpHIMoRTdw1ihlTdDJ58qx3py4
	b0RQ+PUNTYEKvz4aVNNb/tBCSyaJ8poJruJcqJgWpj2XijmqfeknJP+rl63Rupang3+keJvvCAD
	1td8=
X-Received: by 2002:a05:620a:1a90:b0:7c5:5343:8c2c with SMTP id af79cd13be357-7c5a83d1517mr35364585a.27.1742333544242;
        Tue, 18 Mar 2025 14:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMdxu78my2UQBc4VCvzpYeoYb898Sl+qrEPDXLGkA8XwpYzSSkbR6Z5orjrN/urRBvEFLanA==
X-Received: by 2002:a05:620a:1a90:b0:7c5:5343:8c2c with SMTP id af79cd13be357-7c5a83d1517mr35361185a.27.1742333543863;
        Tue, 18 Mar 2025 14:32:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7bee7fsm1774919e87.54.2025.03.18.14.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 14:32:22 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:32:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: msm8998: Remove mdss_hdmi_phy
 phandle argument
Message-ID: <pxnpqoolslizrgvjvr3mblxz5hhedwx22xkhrwck56g7cdlmjt@3r7l5cmmqn65>
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
 <20250318-topic-more_dt_bindings_fixes-v1-4-cb36882ea9cc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-topic-more_dt_bindings_fixes-v1-4-cb36882ea9cc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7WSRhAMaTCQCHn4OPIb6kSlKYEC7y3FX
X-Proofpoint-GUID: 7WSRhAMaTCQCHn4OPIb6kSlKYEC7y3FX
X-Authority-Analysis: v=2.4 cv=T52MT+KQ c=1 sm=1 tr=0 ts=67d9e669 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=flz5pWXUi7tf7Cl3TxAA:9 a=CjuIK1q_8ugA:10 a=f-3eBOmM0es_zl1mbYjY:22
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=430 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180155

On Tue, Mar 18, 2025 at 07:35:17PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The node has #clock-cells = <0>, as it only provides a single clock
> output.
> 
> This leads to a turbo sneaky bug, where the dt checker shows that we
> have additional clocks in the array:
> 
> clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1],
> [156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]]
> is too long
> 
> ..which happens due to dtc interpreting <&mdss_hdmi_phy 0> as
> <&mdss_hdmi_phy>, <0> after taking cells into account.
> 
> Remove the superfluous argument to both silence the warning and fix
> the index-based lookup of subsequent entries in "clocks".
> 
> Fixes: 2150c87db80c ("arm64: dts: qcom: msm8998: add HDMI nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

