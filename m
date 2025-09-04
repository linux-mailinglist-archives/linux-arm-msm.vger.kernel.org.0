Return-Path: <linux-arm-msm+bounces-72062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FFB43DEB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C05F3B24C3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 14:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE25305043;
	Thu,  4 Sep 2025 14:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aiQ840y1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B4022172D
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994415; cv=none; b=TViarQ2G7nGKdWQdp1LRKIsoeudGU8VEzqM+P08EAq2+jlYTeeNWMSkvFl5p5Nhw0nTeVwq3Ve9/cyermScdIBRNesdAzJ47JaXflfxCxrdw5CKw526L0RXcHSX2o5D1x+SeFBhikMQQ7XSdsprYLCmRVXin2q71ReyP8qWtYiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994415; c=relaxed/simple;
	bh=vu/lR54XEDQQa3fvTSvkK9DY3Ceu5L9G0y9ysxDeew8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRhG2Mys0w3M28kW+b9O6adwObY/y3NaD79JymmA1U7h9mWYwyQ5+FYI+H1W7o4n7s0Pb5XMKWAJg4nWxXdFFFYAmk20WvT9Qs3YRmXku5nk2caIlDVwjL73i9zhLlwMcnw74Q5Me+mrXNzAuaoeYIckeHXWDwBwC5eZtAhjiCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aiQ840y1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7Hv022973
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 14:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uptw0dRl7YW+LaH6Bz8q8rzE
	zjyijfxJOm8LQWhCZ+U=; b=aiQ840y1T4XIi0S9YmR2pzI+Yz3y8dKMPxBebvek
	wIUG6dCbgwaViWfPR1j8EU0JQ6AzbT9R8BxsUo/OueC6QbyX7hO1J0TqW/xA8CSR
	CnbnkLaf98zcuT5n+6ShATUibRun6f9t4dnkhx1VOoRUni4HxHtqgMgrNfQ1YShJ
	DWLaytyN0omLp0xHm7Z9dDlSjKg/69yswSYYojRxK4/KvaoB69ux3VWc3aSfvmfD
	NOOrkxqmPjFwtItj80HfU6lh7KI0l/LK46dw0Zrrfd4PmzaKH5OP0VuDJTunxZpq
	B6m8bP2pBeK8DU3p28btNpVtsloLUBsQW9B2gFq19DFFjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0eqtk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 14:00:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b29cdc7417so19899231cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:00:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994411; x=1757599211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uptw0dRl7YW+LaH6Bz8q8rzEzjyijfxJOm8LQWhCZ+U=;
        b=P4ykmDflBQAH8bYCeakSmwcTVr6+hDsT0F8GjNKLeVS8delTWall5DLzocfxeyl11M
         rl2bi3dHvBqGDiQul4ZXVoymkfKgWcLQPA1kgIqKM3pPaoHaI8Cr5JGfMt3sKhd3jQ0L
         eMkI6UPL+d0ccfED105ragZIyZqYnW2xMm26FaZ7q5fGLJLvdNDsswhc3FlLVn0KTK/4
         mlHUf2xfQzyeV8cMTRjmRPnaRA91s0tk3m+UQzhm//egnGak/ZOdzexn59BdIuQwvH0B
         B8YVrxv0BtSWpr6CZAujFdwWSoxloqMyrT807GI2kG/n2hbXq0suVPXvAQ8lm1P7T2c+
         tCWA==
X-Forwarded-Encrypted: i=1; AJvYcCV6givSDafghUQHJqhbCaHXsJtK99aCdCqhtUNvUkzdOE6uKpkkNS322mLknWmdJCKYT5rN3n4A7hi1pKY/@vger.kernel.org
X-Gm-Message-State: AOJu0YxN5ZWORa9abWTA7mNloA2GStDrLvEFTg20pCqOWi/7MESE0L9v
	6etkXOESCzCDqbR28/cedDVLPCup8So5gbnUMl3TvcJrFbwjk6ojt1OSBH+rT/IHLAu7U0dpDgJ
	TzQz2qoAxorM2JZ5xOU4Lm9bMXC5oUmH9tL3iiWPJRS+wK+lqfBdoCB+O+U60CkBdYj8lKDzT9/
	RQ
X-Gm-Gg: ASbGncsC6JA7pgHO+8a5+Dk9C+PoMHLIiHy/qqnlC1L64gVqo063p4IatVFBg/q82d1
	4VkuzEti5LOK/iads6iSHKqAzK66ZnRqV8CngeAJFyLSAbhRZ+BBIGrypCmeeRKZ0kQFnguGLAp
	VXHOLrhk2XR28W+1jcjl9ObKwPlI9zYOPFHg7T42+qrTJ2FP/3LSOnxElP3EWDV0D1IVLv3WJwB
	tcODWIQJm4uds7/CfU+1Xr3rrBmopX9+JpaCzh6mlJimPRL1ed6XTmpdShs6ik+7mX9+4/24TJR
	Ss5CrmcxykdM6Pr+JO5rRWnuTD0Bacvl+ZLVB/AAybgBgw9tKp+9QFNeNdhTg4McnQpumsyWMgZ
	cxnDEawCWDa+jWTOx6HyqpasPYpAEVw3Fn5uhFWXHDwy4dbqCOymh
X-Received: by 2002:a05:622a:5a0e:b0:4b4:94e7:72ff with SMTP id d75a77b69052e-4b494e77707mr66824461cf.30.1756994410404;
        Thu, 04 Sep 2025 07:00:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwARaMkXqyukGrdjdAD2h8y2fUXhI65qlFW8+laMCPTiKqFhNTFQRZKJrHyCepIok7qk4PTA==
X-Received: by 2002:a05:622a:5a0e:b0:4b4:94e7:72ff with SMTP id d75a77b69052e-4b494e77707mr66823511cf.30.1756994409513;
        Thu, 04 Sep 2025 07:00:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5dd03sm1244263e87.28.2025.09.04.07.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:00:08 -0700 (PDT)
Date: Thu, 4 Sep 2025 17:00:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: apq8016-sbc: Correct HDMI bridge
 #sound-dai-cells
Message-ID: <h2fb4pz62uol24jmf44nopmq4h7jw2prnpttgfs62znkztosdz@hbzc73urm6ze>
References: <20250904084421.82985-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904084421.82985-3-krzysztof.kozlowski@linaro.org>
X-Proofpoint-GUID: aFc5SdDMWN_-g-hKxOEYvIvGnpa6pi2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX+3WcgqN9oOdK
 NJT0TYXYBapAONUxTW7uvrzoXgYYyZKmGTUcQcfRuiCh2e2JOdgOLAMq7+eHPxI0ztxOxr4tA+a
 XiMmPNd08QTUZ2gWEGnK1PF3JhZDpofe74+g+eGTFvwYOuZkK4CaJz3IlcKe+3Z8OpIlubYb1SG
 7Q7YXv/8lF4GEeE//5qODXa1HHUKxKSXhfBbuxEVuw8y/3wct6DakEQIywTJc9uE6nt8Bd6gH4I
 oM7Ubse6TSsBNpXKVp2jSMZ+vDW6uZCKAwmKXXngBFP0XMXyB3ffIfnmbVG1yk3unjFc9r/ZbEm
 jAK6+aIgxaUXraT3wjKjo3l8f2s1/gvJSxUeCn5D4L8+k97BB22IUro4xAm/M3iXMpWLeUb4IKC
 1GNNnu+S
X-Proofpoint-ORIG-GUID: aFc5SdDMWN_-g-hKxOEYvIvGnpa6pi2j
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b99b6c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=zNhK7oAxo_OHXOIITUgA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

On Thu, Sep 04, 2025 at 10:44:22AM +0200, Krzysztof Kozlowski wrote:
> HDMI bridge has only one sound DAI and bindings already expect that
> (dtbs_check):
> 
>   apq8016-sbc.dtb: bridge@39 (adi,adv7533): #sound-dai-cells: 0 was expected
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

