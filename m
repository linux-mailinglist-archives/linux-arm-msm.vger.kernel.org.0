Return-Path: <linux-arm-msm+bounces-69413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF950B28803
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 23:53:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9069E72520C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 21:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D0025B2E7;
	Fri, 15 Aug 2025 21:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dSsfgeBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED73255F31
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 21:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755294771; cv=none; b=GMWS6Dds45UwxEq7NQOEalCpQDlA5gYWkb7XYZvrO73snrzEt8BLpPeXFLPqKeMnYBr/UnEmOo4Z3Q+GZZUnTnQkVrAbIoVLKWQTdb/vEG55sjo3mOqKsWZ0preFeiWowlI50lAmZNbBRSMh+TkeQc/5QczBS5dSpOEZOOwCV1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755294771; c=relaxed/simple;
	bh=gSjoCkpGQO2hO7lhbivtChUUCThBql0jPA14fGQjWzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4he1kn6IvDiCIFjwe22Tdxvh9T5m+oUIW4sgX+iqUVVaW7HF+DwIyxq5eO7qEueHRmP9jVSIsR6gnjLSScbl97DoDm91gl8KSb9SfTySRcUVQM7qnCOM0b+V/AtM+yy0SscxBDAwM2gYTjJyVfe3Ogf0xt8MlheKurf64vJaaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dSsfgeBq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJbLi027878
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 21:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+ucY422Zv59eyle/8tIZ1eTA
	qJLZoYCyEZljqLnbYhE=; b=dSsfgeBqib3EBhRt3kCVLvF94VAfd6AttarohzKV
	HK8kwYNAjZHr/WFdDzsar1Tra8fUJp0w2rMBGVvcRUmgogsDaB5wEQr+mIbRQ7z6
	S9cOhsQVStI4TFY4GypCDxtBkZgYitxH97DI1aWTrDyQSVDJlAR+Nw9dsw8fgmsP
	YuGo2q8QOqYUXygBX9lRKXhDXZ/m8y0KOl0mRsXYDQvutj3GFbjbWFzEFPcUQh/B
	rdxfmIqKm+hvuHK3/pCnnOCbuObrYg5c3zqiHmHN7C7c7RIyEfAXO2blQhJvqw+X
	oFatoJMO6mdwjqq5M2NJvcznsaabWhEzZLAOh/dSflNtNw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9t4gje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 21:52:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a927f4090so50894666d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755294767; x=1755899567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ucY422Zv59eyle/8tIZ1eTAqJLZoYCyEZljqLnbYhE=;
        b=RVs4n0bcY7++XHAZbCOWDuFYXjxU+vr02uoZN8NH7Y5rGCm73TBb6A39jQ9cSStpHk
         6/Y5/jU8pXW1NaHbLg1bENuysuWZ/2+I5U9qGSqfeQlWW1Ii5SA+f6PPceGVUYwUp5pO
         2bReP3PiMoThZYoKtU6EnmOZkqhOoyDSRo6p5zWS6eLm+f5k3nCypELAujhhho8P+v/w
         NQj2rBOeMaGY+g8DXcGg43tHvZh0GMl30jX0X4x9Xi/qjggBqTSBg3vsuzrGwlMBE13K
         z+bNzNS2gecDW7vDJVOskZ/AoJUY//SHxmfN8g3UfFp9Fg1yZ02CWBLB2Iea7mGB2Ler
         JqpA==
X-Forwarded-Encrypted: i=1; AJvYcCXOqEAVZDw4PTHAmBr6QSSlTs3Bx7j3Pr7G656HtYgKRCHjLwoaQW7N0R6m2gOYB1Sy6Ktto/UifxnOB3XN@vger.kernel.org
X-Gm-Message-State: AOJu0YwWg1mey7COVeDiG8XOILNQdBYqM64FmnajXJ6vzufxRJcfNiyl
	3LRC/HkatS+aiVKHWWRPWZ3GR5TKweSfWesfMs9nqU7aIh/Ry42A553td/79+6ZGwsJvyFr7tsY
	zLNOGJD4LbtkOk/gG97YIbdIWbeUEuM3DLwxHqRcAlSdbGS2Yv1EMXgvCAjX/tmvltbXL51/iNX
	k1
X-Gm-Gg: ASbGncvZM1hZd4SL0b01hvc56WQt9zQOzqlnQM8ybOvbftM7eVGI6c0oMwzS/2fLOoA
	xRUOQqS7udyP7MATsu4u9PL8o4KJFeiMONZlAKubtE7GL6KbOiLrPhLb0nObUgbszNqVSDauHwA
	eQfuz1H6zeKVbK26rOoxo4QQLo+jNim9hd5mFQs9r/p1/mnTt7JP3rY49nfIDD1Xwx/KMFwITpX
	bUp3rsllOub6iODcUw51QAgArlhFPAwaYQLb5DKW5jVtbWT+zB4Se7G8G9p3+UJbGf/qb3fni+M
	OchlCzXYYWxRDIe8bVy1husouot+WAYozPXE1ZkgGZj2Wd5NT5md7jt+Ia/53zR5EhH+RFQbr+K
	79vT6lwauRBnJCwPZP7LH35tEGLSXgzsNeKE9vbGuY5xtdF9UF/JQ
X-Received: by 2002:a05:6214:c8b:b0:707:a430:e01b with SMTP id 6a1803df08f44-70ba7a5ebe0mr42596396d6.3.1755294766978;
        Fri, 15 Aug 2025 14:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyBgvbgFRklSHyhj3CH97naQZBMoVWHYIh+7R80r7kXCtbNHUMb1dOMvYdSmX8rEDFDg6bNQ==
X-Received: by 2002:a05:6214:c8b:b0:707:a430:e01b with SMTP id 6a1803df08f44-70ba7a5ebe0mr42596136d6.3.1755294766500;
        Fri, 15 Aug 2025 14:52:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3ffb0esm495523e87.135.2025.08.15.14.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 14:52:45 -0700 (PDT)
Date: Sat, 16 Aug 2025 00:52:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: setotau@yandex.ru
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sdm660: Add missing LPASS/CDSP vote
 clocks
Message-ID: <gg3pzvlxgvcfqkl4ko65dgyf4jv7umsdthcpyrb3orgmix6xfm@3obaewnzgat2>
References: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-0-c5a8af040093@yandex.ru>
 <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-2-c5a8af040093@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-gcc-sdm660-vote-clocks-and-gdscs-v1-2-c5a8af040093@yandex.ru>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689fac30 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=vaJtXVxTAAAA:8 a=EUspDBNiAAAA:8 a=FM-fRCrO_02lKpoybmcA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: h3mYYPu70h6kCMytJ-0yI5diTEWMbAHr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfXxSw11ZyQzKqL
 4kNjo5ZJV2AQkPsPcucJP9rPtrDXgITkCHZOXRCwdtb75Kzk5UyCz4rsc2vuv+1TSzY5loxX4QC
 c4IhrF8ZVAtLHG/fuplYyMymiZbU8SCafrR5A3aLZTgmhpFW3GqnxwlJnoRV6OvJYSJmNHXSi0W
 s0ZBPyd5Xhsi+ITnnRbmth5W+8OP8oTFu+BJBz1ljUZpfW2v0h7uIlzy7G9onDvJuvkOv0OagXw
 R0XUGTjuFtSZfAFm4jeoQUsDAWTpcG3VJDu+OJfkvztytNf3rOVxXQ8TjDk2H3Qq68Ecg59Fc4B
 ZpeE5Zf1vODiqBBF5g6wPKcr1QiG2S8s4b5Qowj0AEBQawLT/Bv8GRoZWXjSh24xitbAVA/dXki
 GU1dzUAq
X-Proofpoint-GUID: h3mYYPu70h6kCMytJ-0yI5diTEWMbAHr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_08,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Fri, Aug 15, 2025 at 07:56:52PM +0300, Nickolay Goppen via B4 Relay wrote:
> From: Nickolay Goppen <setotau@yandex.ru>
> 
> For the proper functioning of SMMUs related to the audio/compute DSPs,
> it makes sense that the clocks and power domains they rely on for
> communication should be online.
> 
> Add the vote clocks & GDSCs that, when enabled, ensure all such
> requirements are met, through various internal mechanisms.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
> ---
>  drivers/clk/qcom/gcc-sdm660.c | 72 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

