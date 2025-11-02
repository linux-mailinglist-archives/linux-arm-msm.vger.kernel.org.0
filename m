Return-Path: <linux-arm-msm+bounces-80048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E35C8C2985A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 23:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B94DF4E20CB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 22:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA461DE8AF;
	Sun,  2 Nov 2025 22:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ccdr8S4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KbHtvm+t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C156157493
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Nov 2025 22:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762121868; cv=none; b=nVb1QcQwQlSL76IeCCFB8P/lzITQO+qAm8fowfvghMxmVxpA5wRL6CK+CXqLglGBL5dAXkl/V2Oj6KjuuLSQ2LK92nGzNt42tb+PloWXkEE0yjwpA8iPKSAW6ATPv8tpzcya92dKfRnJ90C3j568nDjmqWxcp89KwTLtRnCY7TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762121868; c=relaxed/simple;
	bh=tQZW9+dDgSbYnIuhOWigTzdfgTz+kJ/K7hAWC2M2Ack=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyNneHPhHQL4+4CmjpmSYG7g1PogsH1NZjYcfVGBS2cgRPjWhsNrUg2jt2Xukh5e85jmH9rth58mMUH0LNd9gK5pAZO4377R34SVgQmBREqH4BqvCSyolu9N++zV8Ze6C2pTloUrUMmnGqOQrIlwKjA41vhBBAiZpD9dAZ9JZoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ccdr8S4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KbHtvm+t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2LcuAf1285105
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Nov 2025 22:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6JQo7wed00v6G2v2l/AOp2Cj
	244tmHQ6AbEypOtyoak=; b=Ccdr8S4jtGVwRZB1EqCZyOcZD45Ja1v8ZN2CFM2N
	WX+KrauHW/7Bf5rvzBmZpdS9jDxCqZWrhDXKQzBr3c3ZIramL2vIGwyBSmzYe1Pz
	MfIfpfX5U+hWZPouAfVq+4s98Nv/I38HLBzXGF4ExkKHDiw8Eiv/HWxJzD9r0bDm
	UjfknwDWyUNx3YxIcazRJHIiYr+VUnjQhghJ15F/W2BDkX4nGvbBmVwSFVOi/lvq
	ZnCDCIFYU8xh6wrTPGxmiCtLPRfDbQ4rvCEfoLbHX6H6FodbBgFoavdeg1/QgzLI
	1d9iJ9mb1fGLnGmeeDf9+wvb0ExSTt5ke9qpxx9QJszMug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5pj3hr45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 22:17:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e88ddf3cd0so104668391cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 14:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762121865; x=1762726665; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6JQo7wed00v6G2v2l/AOp2Cj244tmHQ6AbEypOtyoak=;
        b=KbHtvm+teL7hEtUhqa2tWwTpJgL8EUjgsXlIfdsAroDliTTXkBqWxxyoazJLfQDLN0
         4peQQTKCA/kWMSmt25leM7m7953d+gvb2ExogqX6HOpODF2YevRrI8n3f050iZuYtHSA
         4eIHW4ZSZQGq6dRUQ1RWLjWN//56LJ5a1a5NuWmB5mo5VjDyRSpeWsVqAhRNUpqHPEyQ
         hbCjmJfruaoTIe7tL27uFJ3qZcB0nYDn/BWluhSyF24qMkcpn3luzRO44GIRadd1QCLr
         Cy5c5BDUk5szNcB3ZtIk1K5oFPAr9Ggo1ngEiFlzPYhu0IGaTP2RrbiGig0QQPwH6iKu
         0Z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762121865; x=1762726665;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JQo7wed00v6G2v2l/AOp2Cj244tmHQ6AbEypOtyoak=;
        b=Al4rTAznlkRfnRiBRIwBfPqFCHF/Oc0ZumR226nNzOY4bsPgMxX7jtxnsqouI2FFdO
         mnqJoqU1+MoPtqthOuJ2jZ0u52vDyRDPukQlShII9hccPuMyoE8NGV0deA2QYLOEVd94
         BpGvBt8yojHTyopL96qa9hSD0jU9PkYOApvKa8/PP2TSaSQIADD4mX94acZ6+i0o6w/W
         bysrtBUg1BOybPYY4u05pti6vu5/VIAsqmkoVtx8N+Vu5/YYln9+Qqgg5j41eIBFZ/Ln
         qJol200jh7ePlI/5p3CemgltxFFtvXXO00RD9KYRw6W1w3Y5azsQ/Rrr2Cf6TFW2UOwc
         RJjg==
X-Forwarded-Encrypted: i=1; AJvYcCU5cdvClccQcg1ES1+AWPQK2K4ZfISPRd79+TKi3Wa6dp9EAVuN28AITLTmKaKxLNKZkm0oEGkVRNQMbrgF@vger.kernel.org
X-Gm-Message-State: AOJu0YzG63PnESGqpz94GFG33JuFvMFotr3AQi20IqjeS9qLqYGAvDZf
	n5+0fNsmg7EyWvg//FNvJ0pao1VrJjQy1RvW56yXtE1ZPXZl2hBSUrtSYCoAsuwQhuwL5/d4y76
	L5U8ur+cCvbDZfta0XYGY2Iwim2WvnqqVuzbHF1gL7694c3WKSgbuNt+DtZ6V7s00t5sR
X-Gm-Gg: ASbGncuQZ/YQIg98FtX0mS/9HhgO8AJI9erWQXbYtS3dX3qBz6+0qOYdCk4uj0lFpJI
	HaF46cGNL1RUxuLIpFtouogiuCJhKt1HhGbeSgw7jjCEEj3CccZVJLWrBD0YVmTNCe60U4kiDHQ
	qsBcO93YwVqfT/tUBJuoM3AaXd5C+2g0ZpUH9420HQLSqNDBUP06ERAaNjieY55FI+t0loudyqs
	/d57AMAWvuLpJBDOwHYITQgfkO/DKpdtcPnBO4t+PhTEzeFrYaQHD7/yZn7wrBulbpx2/W+BMQv
	lxYzPC1//TlvVhInPg/dUQCpoH682RyWu0eBtWD3gtsQ6HtIo2TkWudVLm6iCeERT7FMLfKKO26
	q3kqEojHvbgl6Dt8VSNVS+xvIrtalMJPLPs8inYGxx4FoGWviTzBmNv/4K3IcKF6jCe/AdEQ3c8
	Ht/ZxxI1U7dIJy
X-Received: by 2002:a05:622a:1b8b:b0:4eb:e283:9262 with SMTP id d75a77b69052e-4ed310a7896mr128716981cf.80.1762121865370;
        Sun, 02 Nov 2025 14:17:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmAKJhop+j7hdlHiiGqRfXCjewIexYqqgeYXYic+LYuBAAh0RBy2NHdip4iwrCy+CDUQyPUw==
X-Received: by 2002:a05:622a:1b8b:b0:4eb:e283:9262 with SMTP id d75a77b69052e-4ed310a7896mr128716761cf.80.1762121864960;
        Sun, 02 Nov 2025 14:17:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59425f77cfbsm1328091e87.100.2025.11.02.14.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 14:17:42 -0800 (PST)
Date: Mon, 3 Nov 2025 00:17:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: maud_spierings@hotmail.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS
Message-ID: <d54z4j34qqguyqmlvgfy5uj5vuhlow5gk5zdk2xjbyrzh3gbvl@jbn7xyis5njx>
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
 <20251101-asus_usbc_dp-v1-6-9fd4eb9935e8@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101-asus_usbc_dp-v1-6-9fd4eb9935e8@hotmail.com>
X-Authority-Analysis: v=2.4 cv=ItsTsb/g c=1 sm=1 tr=0 ts=6907d88a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=69EAbJreAAAA:8 a=EUspDBNiAAAA:8 a=GX_lnnJ6PiQ3Sj9TFooA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: AmEpVh7cC7haFbmRwlkHnAc7eC_rBPyR
X-Proofpoint-ORIG-GUID: AmEpVh7cC7haFbmRwlkHnAc7eC_rBPyR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDIwNyBTYWx0ZWRfX1JAWlzahmRtj
 gx96rihPc84DvZjcji1Sl20s7OKJMdn7qZHiHThgnu8dY3rmTgShiTpqHylm8+NnpLUofBnSDgY
 j3MJbR/LYQjpMu2ZqM5+Ko+C0JW0kvpqeKPuwxhau2Xyl5pgAnzyYH/PNnGD3xs05OifnmUcOHj
 xe+dxuPNo/IlCLZNzXD21I0IXgrMToFAjpa5isfaeZ7wb/PPi+gkh2IT32m5XN7Eh2Qr1m0p6IO
 HBguUN3vW21ahDuquNgUO+/p/BS6C5YgUX55FNm5aOSZ6Fk8dN0SKdaiCGupeCAdNLOXzhBBDW6
 w8tEnc0yfebGeEtF1H8bsW4t0JduxOac6Tmch5eKfCGpDTLd7UMOIPRHV33taOZz+4MZEB7UdG4
 B0xIWsQRTEkmjKqIwLmL5cYAu63NIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020207

On Sat, Nov 01, 2025 at 01:54:17PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Enable IRIS to allow using the hardware-accelerated video codecs. The
> firmware is not upstream in linux-firmware yet, so users need to copy it
> from Windows to qcom/x1e80100/ASUSTeK/vivobook-s15/qcvss8380.mbn (just like
> GPU/ADSP/CDSP firmware).
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

