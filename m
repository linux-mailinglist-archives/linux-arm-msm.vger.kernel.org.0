Return-Path: <linux-arm-msm+bounces-36952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A96AD9BB748
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 15:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D387283499
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 14:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C68903398B;
	Mon,  4 Nov 2024 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1HnT3jP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA212231C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730729719; cv=none; b=ueocXzHpV5nG4HNIuqbfOF4qzKuCzPoXYO8Ocdum73hOIBIz2GddJGfxBV2LSgh9+9Mgmll9mnfcfTnScao18yiHpunwnBF9HgFnxRHkI8/YGrOloyV1riehtVOLBhVkADeeQqE9ItKL6ubeYmZhzItHQrEv7Jh/ERHsSQvhSFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730729719; c=relaxed/simple;
	bh=WmBXEupmtM8Q9AltIoqywvW+F90VNzrMzVzsJOELilY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAdQ6pRpTfVqAennHAqcc//WxRMmX2j6YpNjpT1AdveWhxjsyG72ADnXT9P4PN9JwHjS+1BeObqZMXeibKxA5woXWdQ7Di6KWwFjTMr7k6WFEX93Dl3G13gEhHrYNPYZUcJGMA7UXvcpMd8MzJQeDDN6YmQZe4x6iEpjlJDIHYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1HnT3jP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Bjp9e005276
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Nov 2024 14:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqoIwtujkhfAAOgoHLEE0EEhIIqjSy1D+L10XQtFSJE=; b=U1HnT3jPJYbw5MKd
	xLgj6q6tl3OrWQMptHzUjv8goCH2O0MVPnrTEPnFQ2cBgp1p7ZdWDgUsdIreLBiw
	rXFoapPNKtbX45Bau3eTNT5lmVPfgZivkD8XsO6NH/G56xSn14Kf/UvwrDar2isF
	bPui32bxVYUkzt9eubMDyCqWzclUYnZoNuyV9nVxD1WM3hopTEwH+yk5V3nTGZlz
	+KHBPE6yZHteT5dDPYoSHQ7yr6vIYZQdFAiiJCukK2N5+5bpIjyaNmzuFgLF3t4N
	gE4BAuj6h2k7Rb1TsiX04bez5kx9SOPSEkcrMU/BokeY0g+cboO/POWGsDpmTP0s
	Yxdbrw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd284h04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 14:15:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-460f924d8bcso9875271cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 06:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730729716; x=1731334516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IqoIwtujkhfAAOgoHLEE0EEhIIqjSy1D+L10XQtFSJE=;
        b=Nj/rBr9zjDOdXeS7gMgkbPz7IZv5/HSLleBpcbDoyTI/jkGw99581+pPXB55+XjtF+
         RvrdXFwlBqE4zeu/gvMkIJFDT7banz2q0iNkUtnhA1wf75WWNrvdpE6xVPM61v1KJpmp
         jum0RCgdgtoUDxcuWMqjWtH73PoHgcfOVvZJkoy3mhstTC3pzcyKyfFR+iJvv9js2diK
         k2C/Cwcs6B5NNW6XXCUeNwbL+TAAvpjXkrdo3pnzbEEUwU0FS8rjYWurnirTYegaZc+R
         YgOdxS5jVSX8n2CgYVYcYzRf28dW7sXi8pdsoGLqimB+ptO7NAkVPS2Owk6jAyFIXyIp
         m6bw==
X-Gm-Message-State: AOJu0YzSw11RNdMZZE7Kq36tSggvbj0FGu4OXRSSCCoU1PcjpJheGyt7
	OADgxfMrWeVjyKTWd0IjL4UDQuf0NMly2sR3E27SGR+vhivqpL6g/q9Nl14euJNUzcb7r0ZFSYE
	vUL4URnqVNHmqw/mf7QClGxH9QjQRLtPdNjVUyavCEKTQE1bX62cTNRNV5dfR4Y/J
X-Received: by 2002:a05:622a:156:b0:461:2416:13c3 with SMTP id d75a77b69052e-4613c1e51bfmr193819961cf.15.1730729716338;
        Mon, 04 Nov 2024 06:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDOSOCG2LFj9NXKlT9QQjwge9d2l8AqzVkV1gSOkX9wHMuy75okXlhwq7d5WmBKF+L/3Olfg==
X-Received: by 2002:a05:622a:156:b0:461:2416:13c3 with SMTP id d75a77b69052e-4613c1e51bfmr193819681cf.15.1730729716047;
        Mon, 04 Nov 2024 06:15:16 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac789bf2sm4244956a12.45.2024.11.04.06.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:15:14 -0800 (PST)
Message-ID: <ee668cbf-54e0-4c0a-b690-8606cb3785b7@oss.qualcomm.com>
Date: Mon, 4 Nov 2024 15:15:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/12] arm64: dts: qcom: sdm845-starqltechn: add
 display PMIC
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
 <20241008-starqltechn_integration_upstream-v6-8-5445365d3052@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-8-5445365d3052@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aB1wl8gGCXz9npHLDxxaAFBrKhkTe8Nc
X-Proofpoint-GUID: aB1wl8gGCXz9npHLDxxaAFBrKhkTe8Nc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=863
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040123

On 8.10.2024 6:51 PM, Dzmitry Sankouski wrote:
> Add support for s2dos05 display / touchscreen PMIC
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
> Changes in v6:
> - refactor: s/starqltechn/sdm845-starqltechn in subject
> - refactor: 'i' < 'm', so put tlmm i2c node before motor*

Now you have 'i'2c21 before 'g'pio-regulator :/

> 
> Changes in v5:
> - simplify regulator names
> - remove single buck index
> ---

[...]

>  
> +	i2c21 {
> +		compatible = "i2c-gpio";

I'm not sure this has been asked before - is the GENI SE for I2C21
disabled? Or are there reasons to use i2c-gpio instead?

Konrad

