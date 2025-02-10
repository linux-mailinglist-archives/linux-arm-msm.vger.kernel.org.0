Return-Path: <linux-arm-msm+bounces-47474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C65A2F828
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 20:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A9F4164982
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 19:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22328255E53;
	Mon, 10 Feb 2025 19:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgDvTwgD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BE0191F77
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 19:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214266; cv=none; b=UuWUFsitj/I75LZl810xWEMHNN8kIyHCHpbz54TOxsrEZEWGczD5AlLGbPPFGU+irNj4eR0Y+EBwzI9ZQuicWqtLA8IkgFiKn3CayW7nSFhmDgdxb/FGrDfAX9/fhiIzaR0o9x4HSsQ+jWVUBFZbLSNWOU7k9DleLup6S8W6koU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214266; c=relaxed/simple;
	bh=otnMfEoJ50BUrz5F1H3BI9VskK7/uYP+f4Kw4mOss9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZznljC5gkXl7EQJghQrpFOXihLJpPyrqAA7GMu+XW9DnhPala3skuZ5EwhpiWBRg2j1llBnSMoWPB8E0Kf3u2MIzpVvZKFEm7cLh4mUSgXnE4XttTLLYUN/9JoPO3bU3TThp0aq+imadJWqZKEQLPYHCMRkilrEzfa4GWguf7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GgDvTwgD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AHsPGE006184
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 19:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULiUDIHrPVxs/sIa64WDRw1W1vqL9P74tM+t3ydYJvs=; b=GgDvTwgDxWNsu2rH
	Hb7+ppoKmNQV+PMGK711RL3iWVEnMkAPLbcD8VidYD25wPg1E7Er5PC05t1IWB/N
	s1C6t7rOphU5X2HJBRDYxSr7dggPiiv0PRsjG+mxC9u6cB/gH2LC5VsGx9LgJ1I2
	lphtRJs2cHe80ErUkKIbIR3+4osVRQiVXvlHFTKrcWP9pGfD16SChkfnITMInntl
	uDtr6b2UAOmLtK/UaPdByM8XRu9cuV5EssNGXOal9ffxbaxO4Uxh7QQydWZEEbiJ
	nW6Fj4WjLY8uAaZwgi0g6nf3ZddOQHxDkG5ConjpjaKk2HB6dKKInEchPtI1Bxwz
	BlcolQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mspnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 19:04:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4719173db00so2669231cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 11:04:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739214261; x=1739819061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULiUDIHrPVxs/sIa64WDRw1W1vqL9P74tM+t3ydYJvs=;
        b=gyrDRhRHBMuHP4jrC4SWD4ot1L4EuUJjuFz7yDnobZJnq52FetwJ6drjDRQqdP52uA
         ZJvONgx4DN/+JYsAyz8uVCWqpP+vZaif8mjGLtN9XjEroD+Ri3Ra9GebCDILxaxHxjzA
         bSdIrcLRVMT63UClMeSqbhHHej3AvwiWTZxkDb+O4Imx23JbvaGTQUHo2xdPWtODlQCH
         xVPVF3iS0c1y1ofucDYddzNA0I87PSya+pWFhxPNwGBD+3tLKu3EoYI2Xli61Q8j2CvB
         so3/fMsAx32NTFJjCG1AbnET4OI84T0mC3H+587phj9lkWWneqbFznQ3pAiRixcT3cqi
         lDmA==
X-Forwarded-Encrypted: i=1; AJvYcCXqXGWtNA62jBz/Ebo9kkiUdacUmkBFcXJeMO1vcRWUIGckyNVmpRelI3btg/Ub6gi6Zul4EV5F6wQJFwbg@vger.kernel.org
X-Gm-Message-State: AOJu0YwjQA4l+taPmdtNPOg5/ibdDrXYqOwdmDIEQp6csHgQ7K3vnTZf
	wSv/nV2g/EUSlqC0lgRllX/O5hADkNAqNboPjmAg3fmPgNbyOPqiPyreqGJFSlNhBrU6kHHj/8g
	gHY3pD1T74vYCdi8PeH2R7P99o4cF/lmJipXC/27fJgpCbwjOEaPTSjE3IL7kna0R
X-Gm-Gg: ASbGnct/PBGBeVhkeVRllcjEBHtq1JFfcWvQDlYL9BA9sT9PaLzv9Jy6s5wfHpWkIHp
	3VjMgJRTXxHYKYCR7lbaOPONEAM6CuY2ZpESJXdoHXCs2vfXQ59NTa1n/UB/WWkqZQbZiVz9IKV
	/uNOgPYyvExpiitFNgPGYOqyWAzGauXQcvkGVJKapjzfsCUnVVELW6jXDfr1OtsaNN8QR/B/acL
	bAsgW+QaKsc39pT+igxfObP31vDypYgLK26d+fb2JVgCcBm7pj84bOMmfhdAhWlO7rUOmGPihfd
	Ftz4ruitGzUEup5uXJCMR1UCpHmONpdUNS7PRnmly6D8ombg8v1p7pR6+WY=
X-Received: by 2002:a05:622a:81:b0:467:6283:3c99 with SMTP id d75a77b69052e-471679defe2mr85720261cf.4.1739214261077;
        Mon, 10 Feb 2025 11:04:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVfYtHXfdFSMk2gWT+jb40I/JkWq1xYtRWJ1JXxoyZm338bTGOoDaw3URdqS8zs1Y2u7qz+A==
X-Received: by 2002:a05:622a:81:b0:467:6283:3c99 with SMTP id d75a77b69052e-471679defe2mr85720061cf.4.1739214260647;
        Mon, 10 Feb 2025 11:04:20 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7cf46bf57sm132470566b.165.2025.02.10.11.04.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 11:04:19 -0800 (PST)
Message-ID: <d0ea6c3e-ca5a-48ce-bc67-0622b0d891b2@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 20:04:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] arm64: dts: qcom: sc7280: Add support for camss
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250208165232.2371889-1-quic_vikramsa@quicinc.com>
 <20250208165232.2371889-2-quic_vikramsa@quicinc.com>
 <4ah6z6lsgxgpjdiuyrkkcebpwrqrfpmumklga24immz5mvmgp3@z7bplsu3q6yl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4ah6z6lsgxgpjdiuyrkkcebpwrqrfpmumklga24immz5mvmgp3@z7bplsu3q6yl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IC89hHEtpVfErjGnq11zMsgM46BA_yZ_
X-Proofpoint-ORIG-GUID: IC89hHEtpVfErjGnq11zMsgM46BA_yZ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100153

On 8.02.2025 11:16 PM, Dmitry Baryshkov wrote:
> On Sat, Feb 08, 2025 at 10:22:31PM +0530, Vikram Sharma wrote:
>> Add changes to support the camera subsystem on the SC7280.
>>
>> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
>> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> It was impossible to get these tags in this way. I'm not sure what
> happened, but please review them and drop incorrect tags.

It was my mistake. I used the wrong copypasta.

Konrad

