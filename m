Return-Path: <linux-arm-msm+bounces-46642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2340A249D4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 16:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593C51884A7D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 15:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33DB1BD018;
	Sat,  1 Feb 2025 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNh6dXk/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8AB35953
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738423812; cv=none; b=mxaBFYKGHR3GwF8bgQ7jLfMfDDEffLWJi/JlawUKZBRu+ERw1qpMtwEHFjevIg55titOyx1gT1MPnGPfK6EmbdaeA/44aSi+XRh3SUP+/fxgXBuw+OTZBLo3SznurQBfA08vsVXlCXzt5Blu8C81zT7t3fBqB778JuOCd3LORPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738423812; c=relaxed/simple;
	bh=pneZuhBs75U2eZ3BgWmrLrinRinLHenz/os8RktLXi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tzdjwNNd7QF/iQ0BSylEwgAIgn+5Y2yxPRz1wJaN2771yqHxlg5nikAmEcwdTaEZG6WfhvdtFAJPjCnVlpvp/Upuv4ngbD+TWl5kk6vCSNhQQO5yXIUiM78xTXf55xOE0giL4q3BJYYv6uIEOzeKtbs+32MAO1wLHFrGI7E8rZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNh6dXk/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 511EjlwD001017
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Feb 2025 15:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKelcYug8dBYhF4bh8maGBSgnMFBhqrXrUszluVow6I=; b=VNh6dXk/e5B3bEBg
	11J57Jm2YcQUxLQgIlxA+esr9h/JCCwl6AobVeAlUF3m6BGo42y++YQijvU94/TY
	qf7voESjZu2y2P/DrNHQFTERk/UMpIbnQ2zZ2k6MsSSXNlkb90inAEnwJOrM8JZ/
	Nh0WueBnc0UsrrhCZwp7BUFKUivCHgmc6UtB/LXdgL17fPLPoW+3Mv8UCOg/mPA5
	hxdCV9sOhmJVwIiFKy2KwDeuakRSCn3KKAP62kft4yfhoD7TkYZCSG/MlF9GKWU9
	KiY+wfXT6qRqGYcmPFEuP9+798Obi4jLi7p6GCidkKbMEEetxtXH5trGxJQBcf+L
	mPzEzQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd7j12er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 15:30:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6fec2de27so81860285a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 07:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738423799; x=1739028599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mKelcYug8dBYhF4bh8maGBSgnMFBhqrXrUszluVow6I=;
        b=F4vpTs7PFEZMKYG4qFLdd2NCO68DUVW/Z+Gh8MJd9SSagpGdw2lxyafMP0K/QtkxSl
         c1jHLrr/wLxhK4eFG1s5L7RkNESn3WQSATALGFL7JC4VZm1AmhKbTL6M2qF5/2jV6HzZ
         ZSGG/jc7vTfmpvS+rUMm95NZbAboxk2mHZOAPENw9eXxoeB/rNL2q+4vqB7A0f9eWhIu
         S05Krn7m86l+ZREW7snxtI7BCHJyPOCmdYRHw9cO+61gphEcEXrgEK83wnr75VT9qX1g
         6HYv7H9alzXXRQB3dfSDadgMGbCijFHCxh+DJCUQdmt77mjzSi7Tr+oRm1VayZnd2Cb1
         kjRA==
X-Forwarded-Encrypted: i=1; AJvYcCUGUraY0ccVAwKCflZ7+WdypJTwuKrE26weF0UeKALU+2yoTK2Snzlh2mneLAA9IO0cafCVF+XxUcyPSQ6U@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbcruYejx9cscKn4oETCMGWGxtAdVZgjk6Szw8Ac4RTrBd2AU
	JI5N4NysR0ORgVVWRpSTLdHLvVT7nRU6l+7rbPYjpf4EEytiXvcduIoHmYfKUyCtWFcGZhy6o0l
	eo84A2yVPcO9/P/bqSbILVpKWsx1ipJP4Fu+z2L3hN13xRZkgx2qlkegr3dy720T1
X-Gm-Gg: ASbGncv75wIypiL6Uhc6cLgfGXhoN//Fqmg8hzEE7JP8Jala4DgtiSdLHpTY2SS0UOF
	7B5mfPo4BR4fmcE9GGJt4UpcYprzg/MkAycORMhQUa5JeKh5WFF9PbIlIkxasWZPuvrxPD3CTC4
	VGQq6PDHt/0g+/Pbw/6S/uLtUAMHBDU7SFe+ZHhBAzH/nnh6PXAfKk0xY+VggYwzA3jQZDX16jX
	FOEwKhFK2RlhOSCAwsXgFMX7B0/1ABz8yhhzldVqXvFjs8iomykyzZBXqwhuxRFAREfcb7rs7Fk
	P7LFCH/y9/gu/XARMTdgLsaVpvF0+sqFMUciviopzkwALEWI1l/1hNqxG3M=
X-Received: by 2002:a05:620a:198d:b0:7b6:d273:9b4b with SMTP id af79cd13be357-7bffcd8bd6emr806168185a.10.1738423798790;
        Sat, 01 Feb 2025 07:29:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUc5dgjKTTrm6WQg/PcNfDDzUg4H36GWDA5vbZTnei8HHKXGpzYGIi+fzUPgn4xgwUNRY6Uw==
X-Received: by 2002:a05:620a:198d:b0:7b6:d273:9b4b with SMTP id af79cd13be357-7bffcd8bd6emr806166685a.10.1738423798473;
        Sat, 01 Feb 2025 07:29:58 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc72404537sm4585702a12.35.2025.02.01.07.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:29:57 -0800 (PST)
Message-ID: <1850f3fb-bff6-4814-8f52-ea97ebef85b4@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:29:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qrb2210-rb1: add Bluetooth support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
 <20250201-rb1-bt-v1-4-ae896c4923d8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250201-rb1-bt-v1-4-ae896c4923d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hwcQbSc52Vw6IPrBJ6WSEsYkf8G8s_mk
X-Proofpoint-GUID: hwcQbSc52Vw6IPrBJ6WSEsYkf8G8s_mk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502010135

On 1.02.2025 10:18 AM, Dmitry Baryshkov wrote:
> Add support for the onboard WCN3950 BT/WiFi chip. Corresponding firmware
> has been merged to linux-firmware and should be available in the next
> release.
> 
> Bluetooth: hci0: setting up wcn399x
> Bluetooth: hci0: QCA Product ID   :0x0000000f
> Bluetooth: hci0: QCA SOC Version  :0x40070120
> Bluetooth: hci0: QCA ROM Version  :0x00000102
> Bluetooth: hci0: QCA Patch Version:0x00000001
> Bluetooth: hci0: QCA controller version 0x01200102
> Bluetooth: hci0: QCA Downloading qca/cmbtfw12.tlv
> Bluetooth: hci0: QCA Downloading qca/cmnv12.bin
> Bluetooth: hci0: QCA setup on UART is completed
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +&uart3 {
> +	interrupts-extended = <&intc GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 11 IRQ_TYPE_LEVEL_HIGH>;

You need to either /delete-property/ interrupts, or define
interrupts-extended in the base dt

Though thinking about it years after, I'm not super impresesed that
we have to hardcode what always is the UART_RX gpio manually, every time

> +	pinctrl-0 = <&uart3_default>;
> +	pinctrl-1 = <&uart3_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";

Please add a newline before status

Konrad

