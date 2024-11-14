Return-Path: <linux-arm-msm+bounces-37923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E549C8E9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 16:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA1C3B36A3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 15:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A950B133987;
	Thu, 14 Nov 2024 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEwiPNUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D79C3B784
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731598155; cv=none; b=qIUglcnoPPKi6YHTl7nU59Q9tXPN7h15krWyBrehIBdbYgvZWo8b/lSOVfkzvnHP0wyIqCfzvF0/T+Gof9Yv5RotOeYhnECCZOu61bPgyEDbtfs1tIkAZzjT2pXta1aLP/GLZw1Lf5xp4UYWJFaAp+Gm+fGw/2bqzO+yA/sKDtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731598155; c=relaxed/simple;
	bh=bE9ya1RXOSv45mYNTbfSviaB6LQsDaWb7GhTrficu9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WpNpn2FPBW/rPeLjLWOvNpUCDRvvtRgYdXC6vrH3+Qcaw2PjGYUFEJii4ra70kgL1wSAzv++WBSQ7bRdhKs9+5HYqqMqu2yrvS8Vt+w2z4uUJXjUeQXeYaJhXO0Pg6MGOD6J+ZxhTlqsBSWZ/ZcveQFzUOPw5sUcyHcY1rFu4m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEwiPNUn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEFPior001037
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXBrz+/0G25+LJ+SXkHmz63KUpm1o0hCtcmntt7esso=; b=jEwiPNUncUgRXwGN
	9pqFK4BwGY+fF0rSx+aNopQxohgTR0XKigQ502qf8N6u3G3XqFNuq0Rf7qEF3F9q
	Ia7VB3HbDXiti0/4l9dGLFQKQFnkF2zplPYLwCnu21ksDAIf6GXY8wgduaySaZJ4
	iKxomAGmP3hx6ukuurF70WZ0EVAqYpuZJYqx9aqr3GUABMCE35SBdxAjCs4Olx2I
	0EDvQvRozuefsDoURH+JHw9ZxKLwCbWKHX6i1gAkWb3FVDj+H1rxmidwHWrNf9km
	IsRZRQIbgrHn97FCbJmu4+DBU4q/79ijujNktm3pP72vTw4defWSyY+7FWi9YWUO
	tmbSWg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vqbm5v1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 15:29:13 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-71a6b4ca89dso141197a34.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 07:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731598152; x=1732202952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXBrz+/0G25+LJ+SXkHmz63KUpm1o0hCtcmntt7esso=;
        b=scq2K4cpjX/XSAeDpjwkpxENJiNbTcERoRRR8nXtEeAThMxr/eGJ+MOMk/USc8kXcX
         y1mkP8HeT1uDhOXqgOuwBQT4LhPzUVQAcY8/04ZSaQ/DjJljOS9hoBt/FeUpF+3cce1H
         OgdfNeZGE0qfDTkTUwtw1+6y3xklzKZZ8NkTqXVMW4V9bMH2zhDwCUpkUeYUsW2C/pwX
         AWUtt/Ljl05C80IDixv1c/9IAMnfrdeVu+RmZk5rJEPyX3yoCnxA676FAj9lwQZx3GfS
         OXdWS4FdnVu9gPrXeSgNVn/GlkCrAkOJoeR2eifN1M9J6GNLGP9P5q5XO710JRJ8WH4B
         8Z9g==
X-Forwarded-Encrypted: i=1; AJvYcCXsNokdSfwsiL6dmDYnaVjGJXpDARt9UeTDQb8fND6oQL2Mka1FQ1zsoonhGRFEYFhAl+Q5ga+tC4AOPnns@vger.kernel.org
X-Gm-Message-State: AOJu0YzPZ4l9b0RG8XJFr0gFmX9JeGVc3EEipWXhmfkEa/xdC/tTDQgd
	Tl4KWgSP7oNJyqVYIAhWwV1ejLLBMbXv4oanAVNEqSiOJe8gserkwGntMd6x5o83/cWHgQ3393B
	gW5I8HXGoD8HgRYu57UG5HvWoZk1aMVpgJrL4TJMYl6JkRI4X4pFNQk6wHiFn5YPI
X-Gm-Gg: ASbGncuB/SjcHKA0rcAuehOVOxUluTpwieRr8EMNjVMz7Dh77oy702rweLi3aXHyvCa
	g9sNyiwbvm5XTVUwzhlQr07psWlJgfT5WHeH1oheWGXKkUKq4sZSs8c0cQK7zv9j+4IBAw4TyNA
	BCVtNPf+CgTfo2Qa7dBcMFLk2IDGjKgxt1Q4J7L+YXeNCY28DS/SfgB+87Qz67VTYF6acH/arWX
	W/GIdi0kS0m6QWUDuvgL1GhvjPINJ70ejvVDcs025UnbUZaj6DU9F+Vvi8Essn0diOaHP/xTo0n
	dP/V269h+FdP+EoCXGSqL7jHDZE6z9w=
X-Received: by 2002:a05:6830:f93:b0:715:4e38:a184 with SMTP id 46e09a7af769-71a1c2ad1d8mr4911696a34.6.1731598152324;
        Thu, 14 Nov 2024 07:29:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8OL2IwD5N25m9J0VulyHZMbS6mvVT/pmKgZVeuZW649n2XIjjE4zIVCKhCkS3RdEm5Oaiyg==
X-Received: by 2002:a05:6830:f93:b0:715:4e38:a184 with SMTP id 46e09a7af769-71a1c2ad1d8mr4911687a34.6.1731598151914;
        Thu, 14 Nov 2024 07:29:11 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e0869a1sm73980366b.194.2024.11.14.07.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 07:29:10 -0800 (PST)
Message-ID: <e1e33f9e-5425-48b8-aad7-8f2936b2e218@oss.qualcomm.com>
Date: Thu, 14 Nov 2024 16:29:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: Add support for usb nodes on
 QCS8300
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_jackp@quicinc.com
References: <20241114055152.1562116-1-quic_kriskura@quicinc.com>
 <20241114055152.1562116-2-quic_kriskura@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241114055152.1562116-2-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BodRevqvpfRvrGjC2kI0swsOR2I-QHYe
X-Proofpoint-GUID: BodRevqvpfRvrGjC2kI0swsOR2I-QHYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=784
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140120

On 14.11.2024 6:51 AM, Krishna Kurapati wrote:
> Add support for USB controllers on QCS8300. The second
> controller is only High Speed capable.
> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

