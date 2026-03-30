Return-Path: <linux-arm-msm+bounces-100722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAbRDyBEymmu7AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:36:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF7A358487
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 327413007286
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774953B0AD0;
	Mon, 30 Mar 2026 09:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHc51k4T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/T4s7eL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D03B38B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863254; cv=none; b=G/517McvfawIMiL7UiCziOquTTR3VhU8xk0tzsBIOp+SfjeoODruVGxS3FmFDH6Dmv7cOAndUeX6DnE5VDDHjxmGPat6N0COSjegUsf8MjHPqJKAqTzAGBxvFokyLPPQcZmpjoxhtTnEPm/U5pgR5YIH8f9d3QpAQwP+DpxvvEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863254; c=relaxed/simple;
	bh=5uJprBWt5bWW0ogVM2lNsXTOrmrzNW+syWto8Ndsu38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j5FszhiT1Qpk2x74wVJUTu9PMtgn7W48ZiBpKmXaDNFi5Uj3xcGKJ0DPz6NTcF8EZo/47/7M5Eg1qdqICV710JNMiE2krxMsBLHxH2ITSpeSiuAypMVOnqkuLThvAfkGTX0H2ef91suLe+jy+mKJl3bqFi//he5Uqo8BFsg5OLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHc51k4T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/T4s7eL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U75mCa2117066
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzA9qbXia9AY9WuzIn0BQSgRJyalnkbzGUH+5nSi/fg=; b=IHc51k4Tovggj73r
	cE6dORyMuQm08PVxSs46bhMiCVXv6fUmbAGclEBlc8TkhNT8QV6QJeB0Q9e7SiNG
	tv+5ADwwOq+5qt6pCzpY/G5Le3QoJh/q6lAU/GVQk7iaIWmxuPpDDaFPHowbHTsc
	1Q/mONWOTLmjOKvb+3cuTa5lL5ojV58+6M3EGzhC7OZx1fSb3dv/HCqmh+gaNk7o
	VGC7WZ0DIdIZVOaAZXHY0DR75ZrjvzWK4R972JjZYykRnE5OnG8JsJ22mhR2XJXd
	ivyj36UDEATC5TC66HLTkzdIAJs6P8cTFaxylFE95IWRN9lBVMBP/4oc1AhJUv1n
	5URx/A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d67c7dg2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:34:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a18178713cso2494136d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774863251; x=1775468051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XzA9qbXia9AY9WuzIn0BQSgRJyalnkbzGUH+5nSi/fg=;
        b=R/T4s7eLkQbnfZpAF2EKr23w+1wDU7ZGyyEm3xuAs+M8CevvB5j//6EpLGky9VIS8L
         bfo1VrmZUZGyzHOebJtJhWgwBIY5jwmEAZUEJSNn0li0EjImCgyYOZYkWZoVtojuKl1D
         H/A7K1CtNbt0K9p/UrLc6stVdJBD8ccQpIN/kajI1kyB7jLPbrGzZPBR+6Y/yoE5QjNS
         3yI7zq7fr30iUxo0u+hruiWB+2tBClt6QQhRGaqbqO6Gq8SLssGzz+ogWDKwmqACraWT
         YMd+w0mpI/DMwNYenzBW010GG38Ts0XUmHTxPR3RaxN7cyXdNrHHa3H2p1U81ijonwNg
         66DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863251; x=1775468051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzA9qbXia9AY9WuzIn0BQSgRJyalnkbzGUH+5nSi/fg=;
        b=m2fo1WGso6MxWEBFozjmsKUwbcoBQNN49c24yHv4m1HZho1rv72nrUN3p028fHJZfB
         U3jLMG3y682GUX3fBC+fRmralJMjgBF88Q73JAyZmVl9Q3gdQLKZW488KeL3+IaZmpdR
         NlwXbybG2m+Uz6wCeudugTQVuMtlmpednpIXJEjgxW//jwEaXjQWs7tLeW0EXxseg93F
         vOwukV8G3qgqOk9/YnEVKYJnc4KUvUUB7GkLbMNg+U6b4Gjl4LOMrtdkC/IUnasCvT7n
         hEV8/gN6NRNo+GpRbpF+qYcBHHTLmKKARHXnA5IxKLExK14RCYT8aMwxa3BEaFJcGtMb
         UEbQ==
X-Gm-Message-State: AOJu0YzP07OQ5PQ0RUF3XvFm3YCe7UU2/xxNhhOM5hKlk8+u5hmCoH95
	1svU768O0VO864tq7y7IS2GRQDhZeRP4ExLdzp3J/VPKpHDD4bTxSJOVGHysGCfRzepK2ej0cYv
	IoG+cPngLuXUvWlAVLBf+8xrU8IFj95PdoQd69f0Z3/BcBQgjNA0xVeUZIHKFicT811OL
X-Gm-Gg: ATEYQzyYAGisgrC7pZktViwxDxHiYisZWT+49O36Rb12qjVBJJYwy12dtanPlcTkqkV
	3qxb/HvdMSHCeFsSGi+b+aix2BXcYoipt4haQIXHoFFHVtb2nnBY8yWrWSmIBIbi26LP0DXSfMa
	WYigAq+fLFUVfQ6ZrNfFpSy4aXQWw0tW9CqcSQhWrcb2IMfgzIeSgtjr7ZfUlOFxY2xc4SPbdXJ
	yLlEQztx0c+TGeC/CH42jcrezan2QczcFKNsAoiqSNs6MoskyXVCVnTUa7ZF5vn2/mOCoKHeooz
	Y2o5/b7rLUIOyiCL/grOy9YrGb0oitz+sLo1VqGrMmVVcdHgBjQQChxcCL8PUpat81r/EVqtuqX
	HmDFAkFpy+Yp0RB3NLogOwA0uA9zPU/n27hTxD0H8dOkxYnl8LAdjDr2I5y/A9D+jzGBxCzFqsz
	hWPvc=
X-Received: by 2002:a05:6214:2a84:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-89ce8f9a2bfmr137820616d6.6.1774863251553;
        Mon, 30 Mar 2026 02:34:11 -0700 (PDT)
X-Received: by 2002:a05:6214:2a84:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-89ce8f9a2bfmr137820286d6.6.1774863251121;
        Mon, 30 Mar 2026 02:34:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23dfesm267894766b.13.2026.03.30.02.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:34:09 -0700 (PDT)
Message-ID: <31dce358-face-483c-bd8c-ebd473b9e562@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:34:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm670-google-common: enable
 debug uart
To: pabloyoyoista@postmarketos.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
 <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-3-53abd9db8f0a@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-3-53abd9db8f0a@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=69ca4394 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=x0-Ntm4DP0gVEan9CnAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: C3FKL138VB9hYJVm7Hmchyk7vtZdN-M4
X-Proofpoint-ORIG-GUID: C3FKL138VB9hYJVm7Hmchyk7vtZdN-M4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3NCBTYWx0ZWRfXy17xKf5Y+KOS
 wZQsCzCZAFKnZsdDyHvTVQ1L6ru8oJVeB+VZt+WG9FC+aQ2blaZVqccfryzYXV4E7PIMG4bSmhZ
 +aO+ir+mIcYFsdlSAwG7jet0AOFjZKu8/hrCnJriuBdx/GsUFuzhczlzWhG5WSZQnRk2zPrDBhf
 asfPi3BJIbLWFDYF3Afcskxn/jq2/ZG/Dk4CB79p2h4tMdKIII2bU4tBFPGZx4Qf7zEF49a9tRP
 Wrqg/Kjim+JJovZ0CNvF5T+JDoeVochJH7TBsMaOrdfs0jsn+DAZqavUyXHwQz+4dszWV0lmByk
 Weo4GtmbgcwRpddo6L/ge2DjEfEf2gxm+KF8ox59OY6gDsourvz30nUuZ3r1ZM3abAT1C4vmtzj
 4z0NPAOZOYvJm/RzGLp0P86MBSGfQgqDa2sW/X0hsVlZkZ0v4karaIzrDNunaH87YfgvX3iBVIV
 1KLt5fpSZeoRccQWw4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sr.ht];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100722-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FF7A358487
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/28/26 11:58 PM, Pablo Correa Gómez via B4 Relay wrote:
> From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> 
> This has been tested on the Pixel 3a with USB Cereal board
> 
> Depends on
> https://lore.kernel.org/all/20260310002606.16413-5-mailingradian@gmail.com/
> 
> Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

