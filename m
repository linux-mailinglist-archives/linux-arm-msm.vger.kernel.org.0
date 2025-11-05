Return-Path: <linux-arm-msm+bounces-80383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94304C33908
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 01:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F25103A7CC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 00:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9267523C512;
	Wed,  5 Nov 2025 00:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7bZM9HY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K1jCIegw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30EA184540
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 00:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762304109; cv=none; b=M8Umdr44sSdwo4YX4eGm8h3J21F5Smd3ZTvP3oLFRkZrzZavubbriqb9n6C4tyVOWbJeF9ezKDEuais7hko85PwjZCnWb+QHDUKuhJiKJByzPY+Qn62YjSgVfDjhioux5VLHnZI0PtslYIHgXJS55byQU87txDYYe6nts6pTg6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762304109; c=relaxed/simple;
	bh=WMtxXg6HXmX8zM7j02YQAbCGdgTWB8jnjJp35wcDprg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXnVudhYJp/8GXyd9FRtXeG09d3bhVM3coLyw+v4OaAf152tTTKI/eg+33rJTJHbcbVKDp0Q8tYm+glEYskyYD4eCDy12O5yDyAtnT6OP9RwVEYODKUREDeBLx7QvyyCnBRljKPglyyRFdM8hOs0Xv5wsaQgzBIttUxelclII1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7bZM9HY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K1jCIegw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4LA2W23090437
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 00:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ADOlbA/MeXRPk9nFlkw4G84
	15r9Bnyhb0LknOuL9V0=; b=I7bZM9HY10F5/GmUHmO4M81orXypz+0HnoGDjVke
	xukl33suuLsKLPZVAhzwXstnM65gkGDZ4p/ZJOvdJZvb2UtX7fiyG1oTr93fqr/T
	/zfRT6jE0ZcvZ6uBiTa7Qc0S0HL2+wG5mxPHPHPResg6SNHhOBeFL+wqMaLiegf/
	YW5geElDoK7n1j16WtdjJK+kLIAZ8NmkRtsW42Xcc8xBmBCoLgKiHa8u3WGJ6iPi
	a9CeyLMAch9cWC/gP+deVxRE25TwEJuuyQkMbjHQLnSWoNtq1w73Ca1fiVoX+YV/
	tk72Sd0cwkiP2AGz7TTQAnaL3IWz38lt4QfdStI7ctXu2A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7s5e8kgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 00:55:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88f81cf8244so2543402785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 16:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762304106; x=1762908906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ADOlbA/MeXRPk9nFlkw4G8415r9Bnyhb0LknOuL9V0=;
        b=K1jCIegwThv11w7Mu4oEm7K0LQSHeValvLfD+tvPyqoD5WHPsGc5yqUXdTHW9dYWJc
         OBYgWnS3gP4OjeAOILbuWFZc4Mi51l2RLc9M451QSXvzllQqGVyy+4BaM2kWzSlliwfC
         ttokLO2uugMG6AInWAC57ioCs9LV3ozZqQmwXKJ74F49cde42lUMndfMZ20kR1QFS9b0
         csqUfk/QccYwTmu92WrzKlkajhb7d9t5bA4LHoJvxD8mfRJEt6QWW2vGwLmpmivePCB4
         E+6j9MXSVIuwYdQHLWuOzIp7hXoczxyyzBUcnJwZqyj1EzGlWezeZb/MgVN46LXjXbXh
         8ylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762304106; x=1762908906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ADOlbA/MeXRPk9nFlkw4G8415r9Bnyhb0LknOuL9V0=;
        b=T6NNEMu5mLP59tZ8Iqfv+GX7mfo26fBcwFOK1Hl/evUPdWfW72emT1iElQB8tllChR
         tWfVSEwo4lqGYB1ge8bBNTNS3FKiD/VWMnvDIx1S++NhLUwQCV28j+k+E2l+RzDBM+87
         MzCkw8CsWTCH129oQDB+p3A6NwmNNmv+YLS5avtRHqwTGhTvbvBpliWNaCvdGDEp6j/M
         AM+v9ldU/Doa6VOMVdYyh9mDD3ocKauHCOJbO3yGpjO0DzZlOtfOUrZKxBYr5GBOX2rq
         i5jI7nZdggexr/lOKFiUWYtcMDOZrR5dtSJUGUEoGuWO/1Qwv5YeEkZ2NSVgroXyW5et
         oC9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQ2lC21WkSFVw2ccUch3lVEVJ0Mn/qf6iAv5AdeH1ROsRe+vI9fchjT4i0McvT0CfUiO7YSPO+LnzL434e@vger.kernel.org
X-Gm-Message-State: AOJu0YzUVbfroFt85XRBlk14ZDy6YjpWMXVkp1GCes/kcNOqTxzoKLlA
	TWwiKRoTDuJY4+5hT4oRQ1yg5henH+LLvE14dokq3syEhlLhVJONNqGnH/L4D8an8JSBo47GZZH
	l5EK3GJkSTXhQj0fBGC2rMPfH/ENsNevO3XDMSbdgOXiRhqtl8LlnMBP7VrOZltgJ4Pc2
X-Gm-Gg: ASbGncv8BT8MYo4Ce1NkHSl77DSZ5oHt8k9b0mghTbL1OdyFG1S4NKUHIBmxCvVBUyb
	bV/S6Pdztn6HI+odTPP9OF1uBv80wTDfgH5GANPicTp8cNt8Rj4vpOvRLzmtTqAoej6RXH5fWfY
	QPX2YllDx9c/A/PifjV0WDLgi7m7mOzdmpkQeLe+JcJWQnfctFYLBRZMnd+gFcXVDbNvIRyvlM8
	o+rPxcZaQz6GUh16iwchd6hpNaRfRHPin0T4WJGzFb3hbjhA9CBQqai1H0n/n3lpQbBVbxIMDk6
	08u1DldEbFPYZ4Besrkx9jPx2amLURTew3cuDLshvhiuV9jttEGl1cLJcVxSyptonAs6CBGg/Vh
	WJmdiQ9Zwy3ejmS2eqKENUMVmrSkmJ6cWxWz5SlSXNfCC3iLjfu52ycZTaT5lxvsAlCGuWOjUOn
	AXswRqCg4YLH2O
X-Received: by 2002:a05:620a:28c9:b0:8a0:8627:30b8 with SMTP id af79cd13be357-8b220b9566cmr215544785a.59.1762304106166;
        Tue, 04 Nov 2025 16:55:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFl2T8MaBy02VcjmjrLLsEC09nXbRPXngYX5Uir3OVPaxk5ZvRsK2epgIV03aGzl6YxHlPzXQ==
X-Received: by 2002:a05:620a:28c9:b0:8a0:8627:30b8 with SMTP id af79cd13be357-8b220b9566cmr215541285a.59.1762304105532;
        Tue, 04 Nov 2025 16:55:05 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594343911bdsm1169861e87.33.2025.11.04.16.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 16:55:04 -0800 (PST)
Date: Wed, 5 Nov 2025 02:55:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 02/12] arch: arm64: qcom: sdm845-enchilada: Specify panel
 name within the compatible
Message-ID: <neykh5ldiksowcyqomqlx7wwdo3jrofpn7cyndgsic5ckcemik@gngyem6bmdsy>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
 <20251104-sofef00-rebuild-v1-2-dfcfa17eb176@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-sofef00-rebuild-v1-2-dfcfa17eb176@ixit.cz>
X-Proofpoint-GUID: NMQaNsRv-znIGW9U4gGVDV4O_9-mPFQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwNSBTYWx0ZWRfX8+1/daup33Dm
 1f+ZWW9yM0BCztKNrHtkhpCEgZNbgkHQo0KBMyr5nQ9gejbcknb8D7Lkt8lWQ3+laafSmWdx0w1
 Xqcv9I2/poiRrHqutSL4OWIFGM6s3jw24hMxg5DgGf248mfnpJReDrfe6oUHTmOoCW7mAiZcZHt
 lO2QalNaAsfBpRuqWjUbz7iq5OrrjORU6R1sMl0LuMbkEJIuS3+xZg3zssPUjUvYfklaFz0BXnw
 NdPko2Pxdg4lJwPG/kki/Gq/AkabUHp82p+2y1DjL0YRt8vANORybX6IqYneqG5/E9J3WWCsdQa
 8UL5REAxevpae+GaUUoouRpMAQEezgsL6o9bVLaAxIcBiS7KmHkaYNO0KShzYaJdAWKhLySBR0z
 gxLE20NjeW4ic+v1sb8hRlQS/iGIKw==
X-Authority-Analysis: v=2.4 cv=OayVzxTY c=1 sm=1 tr=0 ts=690aa06a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QsaZCVNBrwfq_IZkOpQA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: NMQaNsRv-znIGW9U4gGVDV4O_9-mPFQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050005

On Tue, Nov 04, 2025 at 11:16:10PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> sofef00 is name of the DDIC, it doesn't contain name of the panel used.
> The DDIC is also paired with other panels, so make clear which panel is
> used.
> 
> cosmetic: sort the node.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> index a259eb9d45ae0..8aead6dc25e00 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> @@ -31,9 +31,9 @@ battery: battery {
>  };
>  
>  &display_panel {
> -	status = "okay";
> +	compatible = "samsung,sofef00-ams628nw01", "samsung,sofef00";

This breaks the ABI. Please describe, why it is sensible. Other patches
should describe whether the old DTs will continue to work or not.

>  
> -	compatible = "samsung,sofef00";
> +	status = "okay";
>  };
>  
>  &bq27441_fg {
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

