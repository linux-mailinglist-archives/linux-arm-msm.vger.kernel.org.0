Return-Path: <linux-arm-msm+bounces-43652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E45FE9FE743
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 15:48:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B00B91881FF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B944B194A60;
	Mon, 30 Dec 2024 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cgtr6WdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45751136341
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735570134; cv=none; b=uXjnJ2x3UV9Lz/4/tjWMZNEufkhp2rJ6JMF6u4v/TstEke4hYNyLdQ6BS4+beSB3hri9b7oGqeqK7T+y2kTHRus5tiaW+EEcpMLfecADdZLKcvfmG3Goqm/0pcvGXHYo2hGuEg3qiuZsLtW3igWPYWZ3zeC7zODJrb80fJ/4F4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735570134; c=relaxed/simple;
	bh=59a2dZJMjmjt/NytiCFCEYeCUsm/hHLSksCdv2r40eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAIDWMkKb3iS2wkB3IziYA8+8/Zlsy01KXJOVq18sYoQS7Bps9zm/ZCPFUc2tE1DmHhnQ1mHfOMjNPsm5/0QFnWrT2s8BHUQA30LwkGefr4h0nwnxZlUDNmtRceD/dDRKJT/pfomiAlVjYGNfIxbjjV2xIo/E5cuB8Gj85icrfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cgtr6WdO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU9LG5R024765
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6lQo1xlx+vLS9+8GPG23HG4garAcRuStXizh5mIHCwU=; b=cgtr6WdOOIhPTr0e
	VLzA/VpqE34dhcvdslyCz/+RzQwjYmy/uq98cl+3RBrsJgb/M3McwzamXiQlJqln
	m+jf9x/fV7MU+N43c5R+boHaClrVBy6AKCMMv7Srl4/L5eB+Cig/jtLhZeu8nW5C
	RpcHKwmkxDdTNqpZX2tSw7zeSTbQKGfrp1Y9rl8xv1am1GgjaxtDdxIq+mCCY8+M
	P7C+zKzE4/rRbJHmfsGbyIJEpxJ7jKBcBY67cvQMRzEakQw6LMF31vVcJTgjpzX5
	wEaYZImKbT/RpxrswpkwiNkoMuivYBNl1uUgvgmiW6+L2sMU6LiBY/p/wRRWgmQQ
	HsohGQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43urt88nvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 14:48:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8e7016630so26058416d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 06:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735570131; x=1736174931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6lQo1xlx+vLS9+8GPG23HG4garAcRuStXizh5mIHCwU=;
        b=XVZavLAs2T7qwZpEvRaaJpxqxq47u3FxlBoQdfVmHf3+Vu6REeVerugwNL8ZVJS8S9
         2UaZySx0Wh4Z7oh0uF0BnhMzCG/FyrGqqvUIedRRpFpJxNPu0vCH7HEiWS4Jv5aNWyzS
         oG3BHuvqF8VzRpqaVTTS9im/v5Z37SjZfG6SKJRIu1j0S3xjRSZP47JlJ64UI+gob51c
         0mlSmuHmnLeG+vvdVdjMIAF45MQNLRLSVlptH2InoMYTCpgTHOwWgrqiuQ5Kp1SRNlqe
         ueDO3nRB8TkpeY9b6iR0Vn3jeu7n5ljjiUh4XG0AEy1ohk6lA5uznf9hRaa8YC3Q7OAA
         nfhA==
X-Forwarded-Encrypted: i=1; AJvYcCWeYkReO3W+KytQ89OJDrgu/6sVtkMDXifP8s+6/KfZejCeDJEtsOiqZGWpEcsijF+2jZ+5oqUtVQ5jiY4D@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh8oYxSd3TJQKkj8iaD6R+lpNAC3VDXIE34d4g2whnuXmSjG5f
	Aqld1XTlCUfA6wVSzMOe6eSax/rg6XRHYjLo0IhTo2Q6rwM7MXNFfye8G3TrXQ/+dxYC9hQC6lU
	oW16O+IvzS5PauV3CE0nWHOFM210OylqGFSa0iebXwZS+IohKdgIUm4Iok62SR3Id
X-Gm-Gg: ASbGncvPnplu0nuqZbJru80rLdjyuuE3FD/BNP47Vrloo1pTBcoznipzQnGAiczYk45
	J7m7lES5yUO8ipP1ACnTnV7cim7qpfz67A46TwOHCxSe86wL2kASS/o2tSzxLfSAL4uGimXsVw1
	VUqs5L5MU6OyIze8LPMpZpUdYlZEv3Tf2p/T0XT/7WuIwBAxS+ReScbG9xKMFXbVmebu1/Ldvjj
	6fjl18vmMttvVeGHKVUUQsa4v2ab1Cs6XFkFPh81aYITpvfgJxj4IVwSI1DFXbpWWXKMugxDazU
	wGl2RK6vM1msMNqIK9qXjiMhSW4QpSxJESQ=
X-Received: by 2002:a05:6214:4113:b0:6d4:216a:2768 with SMTP id 6a1803df08f44-6dd233b0bb8mr230801766d6.12.1735570131271;
        Mon, 30 Dec 2024 06:48:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkzFSsRN5um9eUj3rNbYTIHXKG6grUSJsO4t9eufpIQQjVKlFGOMHCEgKi1n9+N8wVNY72qw==
X-Received: by 2002:a05:6214:4113:b0:6d4:216a:2768 with SMTP id 6a1803df08f44-6dd233b0bb8mr230801616d6.12.1735570130962;
        Mon, 30 Dec 2024 06:48:50 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d848b5c19dsm12067896a12.11.2024.12.30.06.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Dec 2024 06:48:49 -0800 (PST)
Message-ID: <f72ccb48-a70d-4fea-9cae-e7825538bdb4@oss.qualcomm.com>
Date: Mon, 30 Dec 2024 15:48:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] arm64: dts: qcom: add Linksys EA9350 V3
To: Karl Chan <exxxxkc@getgoogleoff.me>, linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20241002232804.3867-1-exxxxkc@getgoogleoff.me>
 <20241002232804.3867-3-exxxxkc@getgoogleoff.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241002232804.3867-3-exxxxkc@getgoogleoff.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: voWqygE9EYIPLhju87ylEhHlpoi6rLwe
X-Proofpoint-ORIG-GUID: voWqygE9EYIPLhju87ylEhHlpoi6rLwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=853
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300128

On 3.10.2024 1:28 AM, Karl Chan wrote:
> Add device tree source for Linksys EA9350 V3 which is a WiFi router based on the IPQ5018 SoC.
> 
> As of now , only the UART,USB,USB LED,buttons is working.The front PWM LED require the IPQ PWM driver.Therefore the PWM LED isn't configed in the tree.
> 
> Also The original firmware from Linksys can only boot ARM32 kernels.
> 
> As of now There seems to be no way to boot ARM64 kernels on those device.
> 
> However, it is possible to use this device tree by compiling an ARM32 kernel instead.
> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
> ---

Karl, have you had any luck trying out the 64bit u-boot referenced in
other messages in this thread?

Konrad

