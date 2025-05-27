Return-Path: <linux-arm-msm+bounces-59608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B0CAC5B23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 22:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7151C1BC01BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 20:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2641F460B;
	Tue, 27 May 2025 20:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPtrrEcz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412E2199924
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 20:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748376022; cv=none; b=CnDPggG3WW/NE39I0OVhnyDhGc+8p7+e7YEqN82oeJn2Ayyi1eT6vi1rjWGRANDWyOxY/7MrfvAYQqV9yOmbPj9y94CCTOdj0/sZeYwo/8IxcvuRpTwwoKRELkk8Mkk9Z77lMERAIb/Rise7taq6skC+WfxDlOiehJSjqCEXWvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748376022; c=relaxed/simple;
	bh=r+r3Ev0TVh+OQFJHNFQ5imeQ6CgXND4LddHcuerf/BY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdgGVsv9FNyggPg43biXiV/uI/Agn2GFMLGO+uXDMnEofU5xrUDvrEugKe2ZedSpwmlC6V05cW67Pgh1/P0KXIqeY/NauNXgnobX0J32E3lq8E6jU3XbMAFKpLjawYh3byGWmBu2tPFwjWd961Y+x0j8jXsfFgEW6wtkMQsDWsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPtrrEcz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RHTYpf028888
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 20:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/hQzHID9K/GQqrpL0xslyVn1
	e1R+sKoEQ9p0RvNHIao=; b=XPtrrEczWNZc+3TmBNXkgqvIqvOKxVnS/0AQ3ZPH
	XMgJRg1r34Z6DBtpxSM9Pz1pG8iLX9lNwPBHxK4BOfgh1Pb1w04JKx0oLQdwEotc
	kWD7sGtWnQ1WkudY7SeN9WsXHG9XOQau2SYv4yL3b9HSIH5lU+x/pOgoYO8VFent
	LVcZBxFQSwsNOPZnhr5TgDDl6ZEVW04G0EwWKG6ZPA8NsAW8ISOSUpOv+hdoqH41
	hj6HH2g91BTQbljwJRK5mze89cqjsvsfHmheoztx/+CzAYhwzob+23tRw3v8AkUB
	4cQiSf02XRlz3osHdJFit17gkaqfMeAOCFIWFOeW0bJUbw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf0ec9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 20:00:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faacebc952so41249886d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748376019; x=1748980819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hQzHID9K/GQqrpL0xslyVn1e1R+sKoEQ9p0RvNHIao=;
        b=UhKe7JIWb6OAoU8PdpwusIhgMluwc66kGbw22ZiJn+qcp5pdp7b5axCHkDltEmItBO
         VzgOZJxp9Ya8fWIDfec4fD/kPD1br1jqJR4LlYT8laqO1LNoueVIs8Fgz/ibsmONb8IH
         dI4XBnmT11MtDfQsX+atC8IHkjSMUkGw4fnars5igwVZlxJP8738QrmtTUt1PZV1KwZ6
         veU0hOySc1ClzxvedNMhQoyNmfBBxoSUlxX5bbdiZL9tnikwnP2V/Vm6tCYRKAAMqc+Q
         3txxGxLotq8wWq9eqKNKx30MP4BWPd4kjlwHtOCjB5hNYUGBSQGW66FLiy+bLKQ0FrDN
         Scog==
X-Forwarded-Encrypted: i=1; AJvYcCW01EaXCpOf6A1XGXEQJWnxBnihLa0dBMLI3UUsVt11ftutUq2ogLzsLCy8v0OQLz9oTkLT1O3YQRNVU0Hn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+RV4lzzoea08mB1q48q7wdqkqVX37RzFIyu4kpVT/bBOq0IW+
	Q4rcu0/GHO6sZE/zR6PT/oi7EZUX5WOLFroT87BJ2+x/FesU+B3lLbxR6EfGTwIsU0lxsu0X4xP
	d/feppdcQ9taAoq+qIzd0GzekgYOvqh7i+DlZCDQ9MDo5X8+Va++wtLIdGy3Fe++NV8XD
X-Gm-Gg: ASbGncu4AF0ojodgmm9aMQUh9QsKlGx3ABs/XYwi4OcKyOmFRI9aZjyt7E1d4LyMfrk
	+16Fb9OG07E7Cjtt7a/PC/2J2hLPRAnyaOAZq4vY6p0iIdPWhVj2IFuGhru52PuJWmoOavj/+TA
	eushuCSxFBnNKxsZuwaDa7v6owKcLKZzTbG/qhKz9VysvAAgwtAleVuBVKWuaOapngqKaJMQee9
	EJ3JnTgc/iy39laft2XvSqg6L0/sPsuW6KVi/ay/5b+wo+Mxh9Ue9c3ZFsGdUiq90nHg3Oq2SFP
	A4VIh5cVEPogv7K/Oi+TFtTRLxXA7q1f1ghYr/AUMeWr+95Hr2oIfeB6SyDuHjrOl+h/OE0Blnw
	=
X-Received: by 2002:a05:6214:764:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6fa9d287827mr222638116d6.29.1748376018691;
        Tue, 27 May 2025 13:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIadGV3qXoRtlRWm4E/ppziPIKI08C68tushmJjy66kSMJ7emHgGlulrNCKBk7DuSuJ0hw0g==
X-Received: by 2002:a05:6214:764:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6fa9d287827mr222635146d6.29.1748376016581;
        Tue, 27 May 2025 13:00:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532ee57cacsm5746e87.120.2025.05.27.13.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 13:00:15 -0700 (PDT)
Date: Tue, 27 May 2025 23:00:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add interconnect to primary
 USB3 controller
Message-ID: <sgm2ya5h3dp2rnsowhjxzmdby4qxljnxq3eyalo4fieorkfnh2@u6ili3stvwjn>
References: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-topic-x1e_usb_icc-v1-1-43b604cb0609@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=683619d4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=vqQ__KNFWrN3ZOIeZgIA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: kbx2S_1hkNDI7D8p2sQS-Mdvw6msvOlt
X-Proofpoint-GUID: kbx2S_1hkNDI7D8p2sQS-Mdvw6msvOlt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE2OCBTYWx0ZWRfX87SJaSfJRNen
 o0btGJKlF6KyVb/KNeB9v/wxHKADwDjDT4+wYjkolV1ILIFSuAp6oPabyCCm4Zh4ETVq3iluJcr
 YwTcdBrD9heLAFZa1YFOPUD4fcWuNnZ1RTh7GzeRC8J+OrxCkXSystGfX/7q7r2ld42kJvosPjC
 m9HY16m9u+6cNr4nwQLFQQSARMerN06MXaZ1uJmmyJkEFtSGePOAH2JSvutEbUr+grfp7N1B8tS
 Y/4Ku8ywqOUkwWzHOOCNcR2pmOIYFbF1m/bdpm+WKfB+KjZCTzZ2EYL0vfkgoiS1BG+zbc8Kj+9
 bdER4a8F3ocFu87nw/kU1CstiYivSYVXB4xsu/UvgDOu3Jnknb/tquDdL4m0INiSSJoHTffEnpo
 acOZmg93aKjQ2zbCzxBBtD+3Q0wWLZFrRGxbHDIdx7AaMW7BLrWfvZtQy2EjzUFgQR4NCOfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=726 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270168

On Tue, May 27, 2025 at 09:26:17PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This seems to have been omitted during the initial bringup.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

