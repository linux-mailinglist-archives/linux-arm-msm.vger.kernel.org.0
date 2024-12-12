Return-Path: <linux-arm-msm+bounces-41797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B0D9EF4D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63CF017BAB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3CB239BC8;
	Thu, 12 Dec 2024 16:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lHgFMnCa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5DA2253E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734022027; cv=none; b=SewDsDsttT6Con/5QM/BfMnmtUH0DXQz09DrEHzlj0nqrpHSbFqv20wjGSnrbi5BHHbrQgiX+Wtkj1yOVPW4neoQMlm5/RXPoEt5DjGqtO5X9swuk7eUsPxR+QDd2Bxl2SA9ugSQwkoxgsluFTDg3ukGwPUY2rjHljsL4sQddLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734022027; c=relaxed/simple;
	bh=gakp5Aj3FEv816mtcgel/jdY/v/jGPkhjk+8fdyuKqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cIy5o4LEB1sJR+bt2mqMmJSVsPN7nxdeOT4s+lib0X5QG6budfP//h5WssbFe/KHdpgheNv6nnY0Hx0Nrgl/VfgFdp4Lc3lJYx3arXVTEYv5goOTDpM8gPy2Vg83582n/y7nXiTtsVWNhC4l3trFv7ZBAgbaiU5lie3FNWTmGZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lHgFMnCa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7kx0a014909
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4OtdDfHtUd2K5YuFPJH9FsYSx7IvdHrXF4yoTvVqjQ=; b=lHgFMnCaTEpWxUcT
	nc+bvY+Y6RoafPPoduGjjTFdoLoXzZHh4Iy7caYmn0uGPuFZ79woF07U9ANdioi4
	tvcTIQrcztcZCof6X6yVDA5HbAlf1sT55m8PyDBLSWHFnsJX2hAVQqS6+kOXZGck
	ThsqK1HmdJBjgJbh4wbUTqYxIAxhmI70y6qxOahsKF89L8qAJwYaqWbBDN8pHhCs
	E33Dm7QMfxKLwW7VccjlIalndkM7CxbNLW+vjbcjCRey0DAHcyBT5ovRG04AgnPL
	bLbm0llXi0Vy+Nur4boAi3HnF0B6MOTwc5TWfqfg3ujAVd2+RgATNk+/BzB0+tQp
	tJjgCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f7dpmwg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:47:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4679d6f9587so1541041cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734022024; x=1734626824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4OtdDfHtUd2K5YuFPJH9FsYSx7IvdHrXF4yoTvVqjQ=;
        b=VrpdrDFqZ4TI+uu7HzpiQAaFuKVjF33vbyBkpece4ps4/+FDEsDuF97d5x7tetViEc
         W4LMRK6a9KVELfKr6WQ8zaiT+CyBM9NpfmmGuAnEPC0Kwyy7FGKRiSckoLTVsuMTXZy/
         QYX+Irh7JZD+FIeubvJJd4HZSAVV1xwxynIyUbFpNBcO5fPTCF6YvsyiT2mN1s9lGINf
         luJnFJjsiYumRzcRoR9ZSBAKc+KoFZ50RzR1PqOhx1M8KcqR2cKotw8PHS6TjqHx99VP
         IeMz48Sjexb2qfgDdXqXFdSV4nOUyGecx8824qIhRzmDyY08xrJZs8eqkAxIW2jvheKI
         aE8A==
X-Gm-Message-State: AOJu0YzmuKegpiWlztxRFsNLyn4+NZwNgA9oTU9cvGLlMwfuc0fugfCl
	RfoePfp/OTkq7XXh2KyoGffVoErTpb6XmG4HWO+cNsmlnFhwt/wI+sTGNspIryFiBhJriMKlB2g
	j7liXdx/iG6KpRC6Mg8iHYgReQPbwxmuLpRoASuuhD0WsfzjfNGb0cbYwK0WJLz1F
X-Gm-Gg: ASbGncuExHfrbInNBir6QUsZVvsZifNMzx9TabGNuLXh4/+0gJVJ2l6GKSvC5sLtjEs
	PgsCjF09awQgfzDbx5v5ppawKRPvdjIFCFlPOTCOVPZFAtTvuHXOo35ton9vH6qTVZ2dBL7spcy
	NZz7QRmQEH6p6mmoY9pCrVn448bi3/WLBnBi5ycDzhik467w377i34CkHxpQVNLIWEdyIX8Epb+
	z/DpWeZWRFKMfrNCpgsaid4Z1bFLDMp843OCy80H7BKtSMHKETZ4NCVi8Qdxb67ObVKbKOOTLfe
	NwO/Bdy38Fq2XzhdUICA5ROQQ4N0pFx+7hZw0w==
X-Received: by 2002:a05:622a:110a:b0:461:1fc9:61a3 with SMTP id d75a77b69052e-467a1556cdcmr6368821cf.9.1734022024031;
        Thu, 12 Dec 2024 08:47:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbmP4pXDhW5EBpXexeneOeQ1H0OIhDr8GB0bZnmXl6AR8XFHt2k4+lrHiAsVPutnSuge9M8A==
X-Received: by 2002:a05:622a:110a:b0:461:1fc9:61a3 with SMTP id d75a77b69052e-467a1556cdcmr6368521cf.9.1734022023575;
        Thu, 12 Dec 2024 08:47:03 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6ab7fe8bdsm311763466b.160.2024.12.12.08.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 08:47:03 -0800 (PST)
Message-ID: <1777f0c7-7cea-43d6-a7c0-4777bfb3f1f1@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 17:47:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] arm64: dts: qcom:
 sdm845-db845c-navigation-mezzanine: remove disabled ov7251 camera
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241211-topic-misc-dt-fixes-v3-0-010ac10529b1@linaro.org>
 <20241211-topic-misc-dt-fixes-v3-2-010ac10529b1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241211-topic-misc-dt-fixes-v3-2-010ac10529b1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xS3gZs3_SDs1scRhguPjvVXqKuM--2kN
X-Proofpoint-ORIG-GUID: xS3gZs3_SDs1scRhguPjvVXqKuM--2kN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=964 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120120

On 11.12.2024 9:03 AM, Neil Armstrong wrote:
> The ov7251node has bindings check errors in the endpoint, and the
> camera node was disabled since the beginning. Even when switching the
> node to okay, the endpoint description to the csiphy is missing along
> with the csiphy parameters.
> 
> Drop the ov7251 camera entirely until it's properly described.
> 
> This obviously fixes:
> sdm845-db845c-navigation-mezzanine.dtso: camera@60: port:endpoint:data-lanes: [0, 1] is too long
> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov7251.yaml#
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Since:

* nobody cared for so many years
* there don't seem to be (m)any active users of DB845c left
* /\, even less with this specific mezz and usecase

I'm happy to see it gone

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

