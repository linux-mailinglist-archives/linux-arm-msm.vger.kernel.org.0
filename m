Return-Path: <linux-arm-msm+bounces-54624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1FFA91996
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 12:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C9881762E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 10:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE2C22DF8D;
	Thu, 17 Apr 2025 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6Mwf05P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6510111A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744886655; cv=none; b=LywtEA9R102XdLKpqq5/BBVMLNj+bLUoYqCQ3aYEJb1EnTCZx/l7WpZNcbd0a4nYmSioq5TqAbM3Wigd1JrXQ8qXvgSkBiwdqgBKBSagPqgQ2keBMMD3U7nfyWDeOW0XKSWbmJ1EwLdNpXwR2wq2qdoYbMCoJKmZQfQuf0DfjhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744886655; c=relaxed/simple;
	bh=WesLeWSC6maCYBoRNiLzzlOfb0VfPk8Wj7c+MIM8sIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhK0XWvusXiMdn6x+jDoD4PEAnRYOMfaIJ4/w/2itKQ4dg+g3BVXUYWcrT0UdlpCNV3I7WvbKqLOhYh6UxHh389btwLEFDgFuqoL0nDvH00rs2PYDooq1HfTu2MUlsgagSSnNtrXMkJwRcSEQBftj13iIBxwRT7pNoQ6psj1sKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6Mwf05P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l4ao009289
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 10:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ppWs9/kYd+Q7yQxJO3DvRjoy
	waOVkrLIFLA17j6xOGA=; b=O6Mwf05P4kGfqD5bTvxKVJ9Df3yOj2jKW9796z87
	3DAhnrNJM+2l6xeAAS+jxraUunychdF+WIlUHtfpu8BNy+roR6Ca1rbImIOH8bZM
	2cfq2l+9JQnKvEStXnJuUy0Vm1CQGHp+ArI7+iK33EpW2y/YqnGxHcJlCEsY/6fD
	LECvHVaa+xnma99jzj1liXPReQpqknMfpyq7zOt6CWGvu3IXcAMzO15Un2JVxb6+
	6rGffgz87Xx1GTXHkhqWcakd43A9SDZmsY0UIJI0zLxOclQ9/nNHSFdg9+fxVW3p
	E8g5XhMFTlIfJoqctsmUwTrk1am0cQ2FiQqlIn97Md2HDg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rvbunp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 10:44:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f99a9524so18369486d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 03:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744886651; x=1745491451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppWs9/kYd+Q7yQxJO3DvRjoywaOVkrLIFLA17j6xOGA=;
        b=akpKaWh4AAWD/ihzy0Wo8upBLrIBnB1i/wBRO3QuODZLFAvMp0pHmr8FLXwsxXX7uN
         El7GpbHZlMg0L0PJNKz0gFs/876yEw/vOFvtF5PjNYYjidaavh25mA/1e0wCu7w4oIQ9
         uwworDuFp0vxe7Vw8UNLGX4PgfJ2cmaojlvbRQn7Ea0QJ3H1fyVXMCk/AgEjQ+jYJ2KJ
         aXkrMbAjMD8TlTlrgBGWCwqua1+1oIJ+Yh4AqttVvqZyVzn54izru2Zm8U32GXMZbI9B
         IreKhFk6M0KtiWiq46H0kZibF6R87aP0V2vPE53gLQrtjwfMQgxhw93F3aQki2smeztr
         zFRw==
X-Gm-Message-State: AOJu0Yz/RTiLshI+WGLQXFRXfpMQv2bm813hZzTe41/CTypKhHi/zdvR
	pJl+7Xy3DNxG1rR06bvuKqq4OTsgmWCD6tvQ4elU8Dlgkj3XhQgI2YVTQQS2GzGN4h3vOGBgSfT
	VZK4W0uQGDa78ZU51m5nTWzoM4wEP90FOIoCox9grLyddSajG2k3x/wC4sJ6fIdmR
X-Gm-Gg: ASbGncthoH75D/k/0FY6s2I1XWVog3EtsgayTMUb4XFKH10+QnnxMY/TfHyb6jboyDw
	wkDM5FtUz3kqMzOMWSoqPBB4mBaCyyQ3DDbHEbpQwv8k8iFOrrHUsCt8MRUlYe1ubgBPRhjgIyf
	0xAnRbLZMEbZdd6VNDMYyFxhSZzaqwx0hDPwinSKB8hoWDPnsiWInVP5yuagPnJ18CVlRW3wyp2
	TYH3tsx1o9e5CTCFmhsB8q+DgHceg8WYwrZz7JmtfD7e3n7ZR5vIvlhRCUWkjvgnP7jo89+sLZ1
	1o0TDeuSxVdErBK4KbSULy5w/5ky1I3+33v0CC3lMgxm26e0tNgRPYOSDVSXBVb/INFfbWi4j2g
	=
X-Received: by 2002:ad4:5766:0:b0:6e6:6c18:3ab7 with SMTP id 6a1803df08f44-6f2b2f5fb3bmr87154576d6.27.1744886651473;
        Thu, 17 Apr 2025 03:44:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqQ/KLp/IVSmaGp6NzSaGXvhrK11Hurnr+RjFchMqCJQpnKTKhboZA08HmNSeTGf/pdOABqQ==
X-Received: by 2002:ad4:5766:0:b0:6e6:6c18:3ab7 with SMTP id 6a1803df08f44-6f2b2f5fb3bmr87154306d6.27.1744886651159;
        Thu, 17 Apr 2025 03:44:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510914sm1896321e87.196.2025.04.17.03.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:44:10 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:44:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
        robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v4 10/11] drm/bridge: anx7625: fix anx7625_sink_detect()
 to return correct hpd status
Message-ID: <g5mrn6o2arkbt356xtisszqtiokxm4oq4gkwa23y3f3aaahbfr@umcg5ikf5qjb>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
 <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
X-Proofpoint-ORIG-GUID: cNK9f9yf5kH---YDO1b-z36zGfqof6_E
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=6800db7c cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JL1rjniFVyafwILi9_cA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cNK9f9yf5kH---YDO1b-z36zGfqof6_E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170080

On Thu, Apr 17, 2025 at 11:09:08AM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> In the anx7625_sink_detect(), the device is checked to see
> if it is a panel bridge, and it always sends a "connected"
> status to the connector. When adding the DP port on port 1 of the
> anx7625, it incorrectly treats it as a panel bridge and sends an
> always "connected" status. Instead of checking the status on the
> panel bridge, it's better to check the hpd_status for connectors
> that supports hot-plugging. This way, it verifies the hpd_status
> variable before sending the status to the connector.

Does this work if the Analogix bridge is connected to an eDP panel? In
such a case it should report 'connected' even before powering up the
panel (which might mean HPD pin being low).

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index a32ebe1fa0cd..365d1c871028 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
>  
> -	if (ctx->pdata.panel_bridge)
> -		return connector_status_connected;
> -
>  	return ctx->hpd_status ? connector_status_connected :
>  				     connector_status_disconnected;
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

