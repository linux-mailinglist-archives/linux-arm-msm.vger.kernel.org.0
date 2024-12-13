Return-Path: <linux-arm-msm+bounces-42202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4329F1B2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3888A16338C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D5D1F1917;
	Fri, 13 Dec 2024 23:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MYNvWB6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C11E0DB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734134267; cv=none; b=X6GP9Fr5JyH6hmqXrvbAOgxiZIbvGvOmknhXKM6zowfb0KxRs5nxMuX7Ge/d7WhaBHAjKWjv3jkWkmshHlTnI/gXhZI5+Fo4dhgYSf0I6wAS/bwAyMKDJfhL/aoM46IEmNNxI4FNY0+AMCGskIcsqCGgJMcYilhRN3B5ag4c0yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734134267; c=relaxed/simple;
	bh=LYdPQGswu8DVIF+KYEYRGj/aA+V4ms+9iQMh2rqG9ds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBNNnXH2KdzqeSfz6NZafAGKsOiRhIRBcHfQpc7dnGqxdCmfyNA37RVlbl+llVqSoriG/dv4rtSVxrJkky4XR8HDqVzrldmTbG0cscR9bJtO/VxxS0oaDS8tVMJ17xLXc0LSYI/pSTMbaVM6tfKI8IY/X8aWYXRviz3eU8Skwok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MYNvWB6p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDNEaPe018424
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+UpY+SzgpLuXHX5fnR2cKEgGvVPipA5R3mDTkxv6gI=; b=MYNvWB6pqzA8YBtB
	U80Hl76jUF9GzAkU861jk1vHXCRQRGEX0Gup3B80NtMqA15PnzZtKonWPnDxxa9p
	WBvaakAOGAP3PHUh3ucFIaVhNtLSDcO3bOhp2GTe02FjqppNSkOhK0rTccxHWfiC
	xAjreDceXuGIICi2dDGKh7nGtf8mUqnwVLmIBDMakrAes8fykOTY3V91MIG3QM8r
	Z27cr2U8JzXU3uNR2j5bQnoF8EVgvR0C7erAxPZX+l+2ejYEVtKBj7G+3Zk+/Rig
	q3GtxHiltpHPShWsuWduZhNILVFu7F17M9xKRc0gIXlTyv3FOahcFxWARwOyukCA
	ZOuHdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjnb1x98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 23:57:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4678aa83043so5811661cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734134263; x=1734739063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+UpY+SzgpLuXHX5fnR2cKEgGvVPipA5R3mDTkxv6gI=;
        b=dpTG7tfp1CV4jk9A4TKabsFsN2KkUqC38vuQQruQDm3Vd1YOXvVl//0IsWIIg0HQ9H
         Jb9abH/KZDOQBKYG7bV2ziuMgZ4tJl6IMGsFC2fSKCIGb3TO4LKLc1r1qwIQjYG4uBbH
         nFBVV9lzGhJeB6XufgjcwUbyMw62LftmzsfXjhB8fH1eKETyLoPcAcii6Vz+UchTqPUG
         LdISc2qBpiG2l83ZFjOqZmMflUXKD+xjj9+7UC2uAQjuAabW0cw6IiXSpxaV/H27WOAa
         9inV7lJNHuKzxh0BxppsKxFA9LbKxHO5jM013vozYSNCVgGg6kp0R6Eh1Qsu8M4E/7e7
         Jq8g==
X-Gm-Message-State: AOJu0YxrfyveB5nS/D0ElDaenxq+/G7yuAtvXaH64rFGWglxqSJGJRkF
	I3RwjKE6+0TZHH7Ru4mgh+f+J4KWTXKWNFlzx4m0zlFct+jedqo6oGWmltnnh1CpmFodUUw9HIT
	yfL+07utMyVL1jSAVu4Z/JOWdV8I/ySFMC7OMN6TQ5Q6K+/PonPxNkvRhH1/ly0mW
X-Gm-Gg: ASbGnctGG/0Hc1/smk9AVwHep4v4etJrCxSjn6ddTcPynwWInlslj0Rs+rE7+NUXJ9/
	Y+r5kA4/uPbhCsHGjiWHQkYChp4915n8+pJQS1920umXdoxdY+XSVQcGx5QTsy1Z52rnXLNZmPH
	Thc0hSd6alCi5Rq8JR+RbByPnV/Rsl6+8QSEGYsB63cox0U/JY9pjbyyH2X+FLQ45gAmwsI+dCc
	TSi6Ix7zHyu42/tXMQnhNBoExp1V0UsAJ/hBJ80u16I/re6myKXlo+UJRcPRTrceFVJVtTw6+3Y
	XvZTdJ6egYozcB8nI2T2DOgGGmOPpBbViWE=
X-Received: by 2002:ac8:7dd3:0:b0:460:ab1b:5ab7 with SMTP id d75a77b69052e-467a5802b48mr30420291cf.12.1734134263192;
        Fri, 13 Dec 2024 15:57:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdf07u75lgXuB8ZdoFrHC5spOJU69BJNvJrmuLa08Zpi6Yb/7k7QK1DNmiKZHesJkLk+XaRA==
X-Received: by 2002:ac8:7dd3:0:b0:460:ab1b:5ab7 with SMTP id d75a77b69052e-467a5802b48mr30420191cf.12.1734134262883;
        Fri, 13 Dec 2024 15:57:42 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae11e2sm329712a12.39.2024.12.13.15.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:57:41 -0800 (PST)
Message-ID: <db6ec08a-7810-4624-92b1-ea922a2ee103@oss.qualcomm.com>
Date: Sat, 14 Dec 2024 00:57:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] arm64: dts: qcom: sdm845-starqltechn: add
 max77705 PMIC
To: Dzmitry Sankouski <dsankouski@gmail.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241209-starqltechn_integration_upstream-v8-0-ec604481d691@gmail.com>
 <20241209-starqltechn_integration_upstream-v8-9-ec604481d691@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-9-ec604481d691@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sC6_3d1eGiVxvKBQArLJB0dCtq38Z4ys
X-Proofpoint-GUID: sC6_3d1eGiVxvKBQArLJB0dCtq38Z4ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=718 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130171

On 9.12.2024 1:09 PM, Dzmitry Sankouski wrote:
> Add support for max77705 MFD device. Supported sub-devices:
>  charger, fuelgauge, haptic, led
> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

