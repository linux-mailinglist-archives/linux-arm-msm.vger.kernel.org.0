Return-Path: <linux-arm-msm+bounces-48979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DDAA3FF26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 19:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A79705A18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4C32512FE;
	Fri, 21 Feb 2025 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="REPiqKEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5122512FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740164333; cv=none; b=CtUuAts/ihke3Q4z6vXQxOUYv0KJD0sweu9PDGebMHPWKqJ+WWHzEBRQ1MPZ2YhpVEmYkGPkexAPzLGTcytReGbc2qEoQ3Hu8jncYsrdaq2DEI5w6teHjY8USy04mYYt731g/wK59B+dnMqpq0DfIRoSpvTzNYpve3Q4fDGknaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740164333; c=relaxed/simple;
	bh=cAHIOldwwFNo/wAZhPUz57LxWBpil7EujySEEBgkP2U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAQYcEB+lemYQgG61BGGA+EZ95/bt6Zyw67Uqi9gAVwQZ7J0Dk8ipMD9B52CwisbSknqHGrWFZM+RNGQsBWsbDk2AhzFXjE8eL7y4ih1nKFWn6SWs7xqHvqmEDsjrFwiHOoX8Lsk/xYjhOqbmSi2E8lzOwlXShlbNgp6GNmST14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REPiqKEh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LEjIvK002702
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EzV2o4eyTRfwYhyLT+w9P16JkkzT3HqrChTdrDEUE9U=; b=REPiqKEhhs+LdFQY
	hSz3lOjsRSwlCbqBi9sF1End6d7GNX9uK3QSB0bTU5HtJgJp6HU69u9f6Ty47snI
	Na2NsjWKUnRUof6L3c+4AK6ue+gRevvzw+i7FkXVKJzGgwx4Mpl0fSeYHj2swm1a
	3NHAMWO39LSI7n3tSmzZv42NURMVNV91VCNolbTjRX2BnybiIi7t1ZcyaGugHl8g
	lAYLrMySLtcrM7mjayAgpWaQcOKB0uV+SNGfbVIG1QPUqv8Rlc+qWSEV69QCs0e+
	SoLEvfVxXfZp4t0Dxhigql8jsZRcD1/Oxs4g9zXQ0xz79MDspbrgiG3ECMCph80H
	rJUMVA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2jxte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 18:58:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e4546f8c47so3585316d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 10:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740164330; x=1740769130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EzV2o4eyTRfwYhyLT+w9P16JkkzT3HqrChTdrDEUE9U=;
        b=dBClikqenv/lffp6UArkibcEVxMaINpNShbOhvG1vL2HnsXFRajuq864GQCDqIpl7+
         JdUtTT+zSt0GxTgJ9F3wugFGTGzTdve6qsQRR951+FSVDHbWP4Pdgcqf72w3XOlIQUDn
         sLbMqZb6T5Vkl+tRz6lDiUDCNiip8q+0AgjI1DqhkqMxWnZk8nzJiC1eHwgZr67yDP4i
         1EgfwkaXvRA3wupZabvakhhv4abRmDcHP6WUV2LiRvVpag8vgYvGP7NK1wmmOWu7B7/0
         HgyA7z///px/GNCHZx1jWLDbC1EOsM/CMsomGXk9t57btsARaYyXO9sHz2LYu+AAMVhB
         Mssw==
X-Forwarded-Encrypted: i=1; AJvYcCWM2T450uW8E8ximY5JQjDXsmIjmHkNwgltkI/Yl5g2HmurjepxZEkxJu3ZfQlzNr8gx4RU9JIEktBb1dRg@vger.kernel.org
X-Gm-Message-State: AOJu0YzEp4+k960NFRBYFE393v8LHFdMAeg6NqlIlIz3K9+wQ2hQW5Va
	ZfPGcehWpQEIVXBjYa3SASbQIXXxayex6jvPw1pc8YQYXCKx9PyOxOmvfWLTf4gELTBDoocjSYs
	73Llh5JU93kG546nmnFlzw+Xn4IKb1z2YyFjoO9paszjpLockx9xYpNUBo5KV//vK
X-Gm-Gg: ASbGncsWMBIw/tJAcrWk29XY54NYN9uSze8tKXOBsSpFxfJpnzdMPLA4BgEv/f+QEpQ
	mh327p+dx34a+YWvXLm4QiwcWHLeVnWx3DpefY7QeIMRG3t3LzJOHLucnZ8TEln4R/aqZqMHsNO
	GYe+tlw0SbLDXC3YJ6fJ+inAfnA1hHPZ8vFQuqMmLoeL8KsxsaVlE/51bjqPlc1c4Oea3yYYxEX
	7rWyGosoQ40l/BToFzZPnmvUn+9j2O1lCSKRD51wysO5noLdZBXty3qDJYLM1mo0EbQHGO5w4dB
	7Oyq2B3K4+5SnscZFxiRVYeJcBllpUCmr3o7ENMtGacH2MOrMjDq/eckXhOxIdOYAB8ZFQ==
X-Received: by 2002:a05:6214:e64:b0:6d8:b169:dcd1 with SMTP id 6a1803df08f44-6e6ae9ffd9bmr19075656d6.11.1740164330002;
        Fri, 21 Feb 2025 10:58:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDMKRFaHc4D4Ja2PLy4N1h1xcVjFyYawh08UFrwgsskejYut5579S4YNCx1aQqtDmho2zVhw==
X-Received: by 2002:a05:6214:e64:b0:6d8:b169:dcd1 with SMTP id 6a1803df08f44-6e6ae9ffd9bmr19075416d6.11.1740164329513;
        Fri, 21 Feb 2025 10:58:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece271223sm14404266a12.59.2025.02.21.10.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 10:58:49 -0800 (PST)
Message-ID: <103f33ed-595a-422b-ad13-13d9c1f0ee78@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 19:58:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] arm64: dts: qcom: qcs6490-rb3gen: add and enable
 BT node
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        quic_anubhavg@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250221171014.120946-1-quic_janathot@quicinc.com>
 <20250221171014.120946-2-quic_janathot@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250221171014.120946-2-quic_janathot@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hKpkhGBYEsBlqaUh1eDobDn6RvezOkfP
X-Proofpoint-GUID: hKpkhGBYEsBlqaUh1eDobDn6RvezOkfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=890
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210131

On 21.02.2025 6:10 PM, Janaki Ramaiah Thota wrote:
> Add the PMU node for WCN6750 present on the qcs6490-rb3gen
> board and assign its power outputs to the Bluetooth module.
> 
> In WCN6750 module sw_ctrl and wifi-enable pins are handled
> in the wifi controller firmware. Therefore, it is not required
> to have those pins' entries in the PMU node.
> 
> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

