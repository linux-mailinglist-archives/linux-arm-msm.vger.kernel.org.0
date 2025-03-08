Return-Path: <linux-arm-msm+bounces-50712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC10A57BEA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 17:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A7563AE7D7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 16:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CF31E5218;
	Sat,  8 Mar 2025 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmxRPK9X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032421E51E1
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Mar 2025 16:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741451194; cv=none; b=ZE+XqYJqRFZ9fTeb7yZlBkNLK4J6aUmKwBYW44026aITmbVLz/qAgtpuL6fm+7o+zlJglFDZeKOK9xDJhLZTKKfNDwE1vDfWv95FGxgQjQ4YJKVC71tzxQNXmKT9bGyZPHHyyGsZ1m9UBBB1wKQS7Y6MNo/5KpDnVBVktQnytqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741451194; c=relaxed/simple;
	bh=K6OvlFv2ilB/bf9v6jL7fF3XQUvusT1PsMsb3L5jSNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OeWeGPfJWokHjkOI7i+t9Nkit0v97UBRrF289snQNNMu99Lk4oYvHw8kUzNEtirxpiw11RFgSP3F5dmBRaw0NqA8uWt9b2+DCy9K/f4OmmBdTnINajg5RXqfDKF+XtuRp3Z4xV3yhsXijQ0jQpOtiqMCNbOYzmTBpJNdnnKvrxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmxRPK9X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528GCtEr018285
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Mar 2025 16:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f0w+ScQCtSviZG1uk2mU7/xP4LvwPhugNerbJJtxysU=; b=SmxRPK9X3BAONvsx
	78L2vmLAKRw5GppofeN/vzNEcRjzD6GVrh7tY1uII13pwR4/AKZ8O/0NvKkD86uI
	TsPkkzqGsL6648Q72/GThJkfMkcrGu9+2MVc5Xo0EtS0AZsVy+r9tu7AhBV6Zpo0
	0YBJ70yhc5sVx+EP38dUClU9wnNyR21o7flWdQGuJPWSUjlA2g/qbZua7fblK9HO
	KS4yNz4UlAX+bd2yt+EnVPtsD/Hps1XgFhofrwAlUHTEKciSUZYT/0eWB4xEC0fW
	I/A9dND8VdI32yUKTtIn2q/ffZAQ4BOAO6fzSJo75pxgUMWSxEXpB+h30r7C2otr
	uZpBNw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ex6rtsd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 16:26:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476786e50d9so270161cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Mar 2025 08:26:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741451189; x=1742055989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0w+ScQCtSviZG1uk2mU7/xP4LvwPhugNerbJJtxysU=;
        b=OFT++rdPscgisPbpGNKYiLwdHw8/TTJWQnYwclpzQcrutqcOYwbxvB6MhZdQwob8WI
         OVRe297LRXz8Qv54SLZ2XlHoKWQbTeXHRsUIejGp9v8PVVunwee6nOTBz7NRQi73Imd8
         TkCOldXtmyMi77zSGuXEFbqFTB5zzQZ7CJE1bm7IU1mFdo7n2oq4LUv6ATrnFQPou8Ho
         g1x/q9oGdJDnKbpk8HkeQbrXkIX1x4pamC28X3LIUheHZvPxyOK4FxgaoykWH9f3R6Bn
         7vq055kshfltG+eO6/nkHUca9855sPM/k/GRfL7tWZtMerzyHnC3h2X+IKk2ixZG52cL
         uOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV70wV3TJNsiEr+iszF3lNWz2TNnK+PFTqEJ6GXUNl++U8F2/fqmyHVItqx2zQJYGrKxb49M34zVXzGjH8s@vger.kernel.org
X-Gm-Message-State: AOJu0Yw60uVfXI3Ap0oVL9qZbIfBf7S0REq3jvCX+WwOsxUqurnUa3aT
	WoUSxqiyQUjACpjiRBBbk2JVQbsPYapDXbTynk1BaGYlzK+OqqUHw9M+Q5N/mlDlxV85KqnQr7s
	REaSzbfiVdNREj6o7QOTdNaEvoXIj0C7gVLQKTZS9YBVFRIENSwHhNW4CgYzbmv8m/IDzKCk6
X-Gm-Gg: ASbGncuz6TuqpVcvpzVw3cXdJ/rXuzAKFkP7LsatWKM7d6Lz9OAwaOsf+OIfUf8xfUo
	34SyXR3hdovw+fF7k589lv+tpraPZJAR+chut+lSw8Ln4Ai6bH42fBFk9tYL6nWYy280lWJrIFi
	ACLCHhFKz89FqdqriQ9jDuMwsEqyNGnirxEP/5hzFQQcyj1FZPwnvY5h6YfexROc1BYviTxVej7
	reb1cfZTLYiEZqLgNerzJFjilNpntnotzdTALN/ibJpdFVPJZHaz8cyDqby6U/tCbutvpBlhHJw
	qIhgSl9TZVLwosT5he1bAs4vR32mnkeaNxF433Aslqq6pbeh33I04KD/IgfWECAxd4XMIA==
X-Received: by 2002:a05:622a:540e:b0:471:f5a4:546 with SMTP id d75a77b69052e-4766653779amr16020421cf.3.1741451189656;
        Sat, 08 Mar 2025 08:26:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFl4XqI0lWyDyRNq3gZHSZIDy7dUW6o4D9tgOlarTTNp9iYzlS9nfhahkvoMzCo+ZgvwoHyJQ==
X-Received: by 2002:a05:622a:540e:b0:471:f5a4:546 with SMTP id d75a77b69052e-4766653779amr16020241cf.3.1741451189206;
        Sat, 08 Mar 2025 08:26:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c768d1d8sm4051772a12.67.2025.03.08.08.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 08:26:28 -0800 (PST)
Message-ID: <2aac1aff-694f-41f6-8849-f1dfe802a1f4@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 17:26:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-crd: add support for volume-up
 key
To: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250307171036.7276-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250307171036.7276-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8bmE8k5 c=1 sm=1 tr=0 ts=67cc6fb7 cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=e8pAc4c1KHpoNycVxwEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 5DTk3dKzAgYXifKMRTF4M8PdDsatOy_V
X-Proofpoint-ORIG-GUID: 5DTk3dKzAgYXifKMRTF4M8PdDsatOy_V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_06,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080124

On 7.03.2025 6:10 PM, Johan Hovold wrote:
> Add support for the keypad volume-up key on the debug extension board.
> 
> This is useful to have when testing PMIC interrupt handling, and the key
> can also be used to wake up from deep suspend states (CX shutdown).
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

I'm lukewarm about this since there is no "actual" button for that.
Does the power button not work here?

If systemd induces a shutdown, try setting

HandlePowerKey=ignore

in /etc/systemd/logind.conf

Konrad

