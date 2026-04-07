Return-Path: <linux-arm-msm+bounces-102081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NipIJ7K1GmHxgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:13:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2826B3ABC91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 837C5300F126
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69173A0B20;
	Tue,  7 Apr 2026 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwOTzdze";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ea+jMZII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6CE39C011
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775553165; cv=none; b=eWEVGISOZNMRWRV98Mrh61nVQ+tIyKMaLxFuQe3ZncbfMPBxg3oHocYq40ul6Zvgavc1LnL8+ODPHsUFM5lfIXtdyuJdF8MW6imp8ki43VBp09sb/LyOcPFtyzNF6hTO/IQ6Dfrkr1sfZSQSDTj8mOFdq1VS5pL3xCi4vBK0KLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775553165; c=relaxed/simple;
	bh=m4OOjO1VZrIFqaVj+/tWZtl2Q2KKnNTdWD448cP9p10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hEqXE1VitndyHakGM2jn/Z6Iz8WpvLjLU9ruepicHNk5hshRNi23Uw8AI0zpt2Vsxi7+wu4h/VU0MLPByCrxwNqma2vmfv1WViOkYm34vbzkbTkmDa4bfNMXIYjmYk/PlPbwVzJu+PITtp2cT8jLglJmWj6AL3QA+FrtZ9xLExc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwOTzdze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea+jMZII; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376HLXk1407039
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:12:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZH7NJeeL+W0a0G40QLryaXbsSTbVab4mx59PHbCSQMk=; b=mwOTzdzegibL1bSr
	r/heC0qre9CYMHscG2vVaL5iFH3flu0z/iRSiHX3GR3HS+PE5grXy80vnbf4xX5+
	p4wT+Q2Z4gghcMPJ0V9zbSrWVU5TwjO3Iff8KqDoV1vYy+34XkxwBaFnuD5fd4bc
	4ZayZbW8/zgtj1JF814Xiu+TsCbzOv8BCVA1mtiTBu8MW8u694zbqFLPqsT7nCdv
	M9m7gAp1lFaXYoE6jC971Srnmh3XDM2C2PLFwrV81eTPfHGea1SnMxVUHLtNes82
	/n1YkGfhs4G3DzqpfERK4V+nvevNVxH/qBadqmWCwSu0Idvh7dw3B6VOciDLY+PK
	8QlKAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrasynn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:12:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d63aeaaedaso80745485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775553162; x=1776157962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZH7NJeeL+W0a0G40QLryaXbsSTbVab4mx59PHbCSQMk=;
        b=Ea+jMZIIp8vt20on9d0VdK03PPqKu3zphrVEel6SFzAwP7gUJz+dxHQD+AMyeJu354
         GYDp2R5bbNZ245kuXRGDHTDbrml9YTbAfpGZkEIqly7YZPomNGUFiAPJteUDi8igs84r
         yAgkdM0FHtwlKeMGVyFKgZdJTTmD7OLdoBdYiY7ts6ZgcQ6vJzIZiUNM4FU6kB6ZuZs2
         22So9zniOFsVgtoqo9WLSwWr4ue5RpFIJ37CGd3g35pZbuh42jM1Mk0Lg6WMLcunUYSC
         l6H8GtJX/irVOI2H7P/FbQSnCi+3tIPc5oJLH5dFFUqbwLHw8bFYo9I54GRgsw0DEOiV
         tJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553162; x=1776157962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZH7NJeeL+W0a0G40QLryaXbsSTbVab4mx59PHbCSQMk=;
        b=mJH7EEgZZCVNnXMX3MQPieow4HnR4CYEh+1fBMweykvCbCgAaA9LM5s6bI+lZ6GSjc
         FxFmLvLjvqRXBjEZ2sWlLQUyIV/bXqBLKG+jRAwMYqZWUgVuL+z53NIhFG1QAV9Kyy6n
         p3qkBv9R6AMLnma+dmMt8yH/WwnokCBFQUIBrJEi9O3RnLTLlhL+XVAtrktV6NKx+S2i
         XQ7i6nf+EmHx4FxhisevH+8bMk54T80/5a80dLZ60Ma+I/ot9o9NRiETROwkZ3yrBM0I
         jlha+PVnnZ9e4SWY14J7sfXAvI08U3jagO0BiTfb3QFyMLyO8wnzrpGyGZBRcQ7Kh657
         fNng==
X-Gm-Message-State: AOJu0YyRJXPUBi8yMexMhZ6idHoBKTnOcu7OFW6BslMYIpyDl5eO7583
	rCnbinNrai38cDqRVLM+5y6g40amtyGfs2TowrblBKJTrJrLROsFtRJYVsjMI/bUrFC58LjrMUo
	9hy/uWVAoV+J7Q6nh86TaK2B+PA0vs5r72cTSTjZ2bwlt1vU1pmcSW0vkjhPDw0TvsBkX
X-Gm-Gg: AeBDiet6oPZ0l4YUzEluZkvIuo3to/30JsKyHt5eOMcmGuyZhDFPCeG5L/BhW5buZQb
	whC5fAEV9okXKNKjjrHtgF/y0K3TxBVMvrnNsQPw+W3K7xZkYYSwgzSLgESLg8+JyjWAaLvLuEs
	xxxt9yoxUCkJ1gmiyfbxJzMdvRtbHho10/n8SrmqPK8QjFo43HoXhpgoQRUPPY2rltquZcskg/K
	FKel5/CXQzo/MUz+xgiQai6jE1g42nKHYQlGorVQO2Ex41ZhZDmXtkfxCJagyvxtxA76hQBaZ7+
	WUo+7aFPVfw/zmR8AfdzOi3NXDqTBWkTxs1p8CzzCYIl67f9Fk39oID/9grvFyKal17e+gt+X9s
	sq87Z2mqn0DuxsPUxuXAcLkK8NkrePHPfUuYijtTd4iV027N0EGlJMROK7m8roqQK1tRqk52/lH
	Haexw=
X-Received: by 2002:ac8:5853:0:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50daae17569mr2878541cf.1.1775553162418;
        Tue, 07 Apr 2026 02:12:42 -0700 (PDT)
X-Received: by 2002:ac8:5853:0:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50daae17569mr2878061cf.1.1775553161873;
        Tue, 07 Apr 2026 02:12:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d0edd4264sm19703366b.36.2026.04.07.02.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:12:40 -0700 (PDT)
Message-ID: <d986e1b6-afa4-4e39-a586-2ca119ccd42c@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:12:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8750: Correct DPU VBIF address
 space size
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-7-daa54ab448a3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-7-daa54ab448a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wXAN7QwGOXh6OP7XWpC65gJpUZo69oFn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4MyBTYWx0ZWRfX+dfzBjQhLFQr
 GrM9iOCgB54rfrQ/mPEXuWd4fXfeXSvbjZp22ryRdTa2nDQ/fxdOmSzjzj5u22f43aUscBt+vWG
 08/4craIM7R+qpgwRXPXlvwWJZfiw0L5DPLUrHzZyRrE2jT1pM+ux9cEDgj92qJ771Yixhm21EA
 ZM7RMw7BII0lVkJtuFrfnMee0Z6As7FEYi38WY4+c6xWwDqvgQsnwoH8m+PHBj+EY0JhCp+K1Q6
 QwrrIIuw5oJ+lBcfQKbheNUMIduuzyZnnFAdBK2cykOD6adIl7oEVQJoyfOsXKwnyFnrsVVpRep
 5FmEcdVE4TWOdGc5X9tVfJdwxKtN97aZtrmOhSQ5S3TQb1l+AF+Evw5ok7A1z7Ks2ym9twsKK06
 GnT+qgZ8mDVfImT1PGMW52FgOpal91UVS2CoCppJqqttDFiaVJsyy2h3qkmYgBgp/AygL7SCN29
 NhNZwigljbAxSj/7qcw==
X-Proofpoint-GUID: wXAN7QwGOXh6OP7XWpC65gJpUZo69oFn
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d4ca8b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fzqTxgmSy3qf8bfLeY0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102081-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2826B3ABC91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/26 1:45 PM, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long, so correct the code even though
> missing part seems without practical impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

