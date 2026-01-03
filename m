Return-Path: <linux-arm-msm+bounces-87325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B837CF0391
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 18:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DD05300F337
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 17:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E8130BBBD;
	Sat,  3 Jan 2026 17:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+JvZ4So";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gB7Xv/4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF3330BBAB
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 17:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767462234; cv=none; b=GOIvETfdYDjTyW5CD53+/PulRtHd2QDXEdYkC1CzzjAsl9jNuN1xqSE8KTOFMy+rtsjOOoaUvNJxunU/Leos53iFCE+yS5lSb54IYxl6gu/fht2PlxxsSNjTXd5Q9BvtQ1Cto9+nL3xya5IA7ynrcB3t0wqG+5kRexpdmzk6j0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767462234; c=relaxed/simple;
	bh=nVp3ve6WsSdfXSJQx3RyHS2X+Izng6dTbi/l/8Qy78I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9beXpIZB3lgL/lXOd+pLlhSoz6KDrFSlNkC3KNgP/Weo7qog3hXM/ewHXMz7e6y4LhoUJMtflccJB/QctOqPmJepa1HatfujQ7wMbZf3kLHnFPSo8RQq193LhMyJRy7JI09B0QPxdILPe1hB3ngxnEbuPHBKZ96BfRS8hoDuQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+JvZ4So; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gB7Xv/4Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 603HS0OY1905844
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 17:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yLdE/xpQGwzsU4ls530DdxAu
	84A+AsHGU44NHX+SLHs=; b=E+JvZ4SoCL2o9QkE37CfUUI150wEl5S30h7hx0uk
	WZ4dxSoepoh8UK6cp8EuYtKGtVD23wPLW/tnMNwPJ13GVWbRHN4KAjh+PzHklJWp
	BWBWrn68vZTBsfIIRIpwY1fpfaRjIlZx/oAUWwBeGS4b550oXOfPGcEXPswjzNfI
	5eX/WmCMhPVoBTIqfmT0KinF0KPiaSRzob1idhM+qJUciBQYPmIRVqG6VCZkha4o
	3ixJZ5cjYz3WF3DPotVpUAMXRY/lAI61EGfunseKQ4wtgoZdhzbF0FHaDJa6m0v8
	3cGGo+Y9J8keVrJEkWAljGMPYdcfAGI5s22lKoVdRVmk+A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bev9h8syx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 17:43:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-890586c53e0so23848086d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 09:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767462225; x=1768067025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yLdE/xpQGwzsU4ls530DdxAu84A+AsHGU44NHX+SLHs=;
        b=gB7Xv/4QPbF2R68JuOaDFxsa5QQ4trq1JN8Xlw//FZcMt67H/iKpEM4ZfbU5Qtq3Y6
         nnS2tlVLN05nLUZmo8CfWs0HQwWR68sXKI8bVPIH1RBphvDOcZmCL+9ApkzhxslGZpjO
         24Vy6Npl0kteFvks6RLyER1JXd6en5OOwFx7w+orhCrjp17PKBwVPSRiQHStH1Lb7Kbq
         Owaz5UZGTiaNBaVZ4uvN0KXIDZ8HwAd+CiqqHh/GQm0Do+F80fpwry486dZimrK2HiC7
         rL8/cEgP2yc93+4bA00Q/Zr8VDM8895REv8e2gVFeU56p2jD+uLcI67glCbBbTM9LnJE
         PDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767462225; x=1768067025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLdE/xpQGwzsU4ls530DdxAu84A+AsHGU44NHX+SLHs=;
        b=eICd3Uj/0ik3GURIc2DWEV8+Op7NFLfRcZ5vY9943COFn8YI3Fe2n3V5PDfREh3Kh6
         2fxQHxgUBuWltqnCtl6GVY4LDUetwMhHoGjThfsX2ilYhhtDX6lL12RgNEGtYjjYXRM1
         7OAJXpHfUdCeJl8tW8oG9RRPqFqZst2HKzfd8v8W2CkCtoRYy0HNTR8UvpDbpAk3BVCV
         u+XNK0uhQA5uwfOlp3m60mlQDg+41G0zirQViHYmJpJE9qRP3UGcgSq8pcfP89ADU3nt
         m/j1K1Y6SGNdHVXrKPKukDGJIWlm13DI/+PVyGj/euhBv0LKQ8DVdOCE6aFIG9B9ZlMb
         h4tw==
X-Forwarded-Encrypted: i=1; AJvYcCWlbIkY4u/Y9kP/Rm58Vu6X+WyZPSFnYjeosq11IMJVWgG8vJvZMc+e/I3mfWGds+Z68gmlX4TdVNhymU8Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2iH+iCzIVvUmsyz3AJmUeu5Ry5FdZoMNPxUhBTIA4i5IAdlnE
	PDuzMcWljF6bRkEnhVzE3CW4UrwPFcoPMN5EFb3rnLSCh7Bv7uXVlTCJxin0QQGxLnft4Wo7yFy
	SW6iCt70PQfPbki1U7RQwyKXVgmJT7g+XOMHCH7oetyY1wFmVS5ZG6MBY/YkVqMRCTnAs
X-Gm-Gg: AY/fxX59075iv/GQiLs3wfH0kJSoqbXR8/q5A8qOp2E3myLYZOX+cdCO9PGCjpJjgCV
	sARzJmcW9nna4b5Qu8JcB7uFO4VEa3HFen+w4N3HfbLbvK6CRf1erD/jtK10QRkK1vFsQskpDA7
	cUPHENsJUJxBi2cMc9KJv//fUF4pUfmZBqVWLGNDsOxnrH2gPG06TdC5+TlCzY7I7gTg9OVgXln
	Hyu3eveBOvd6EnmDQ61W8bpQ//Yg+qQ4GHa71ctkmTp4v/cy15g27m44q6MDCiYX6kPzRcIom7q
	NPsD1MSDUBi3BjjZF0nmtCYMn0wYDIQZs7ahErikUtqnW3YSVD7k9dQc+XylU1sSAHvc33Kri7g
	p5wNgGk3YVBXS3r7jMK7RryJxnfJwhCYDiE5rENgTU/GbUXUhhtMNAl+AewflWSOv+y9f2Gh2kW
	TEHII9nDuHzhpyy+5xMyAiehE=
X-Received: by 2002:a05:6214:2f0e:b0:888:8140:d74b with SMTP id 6a1803df08f44-88d82de98ecmr688853166d6.31.1767462225167;
        Sat, 03 Jan 2026 09:43:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvBh4buUXwH8hHCMxyMxBVnvpmL2p+DmVAH2UujN9uNS/mkyrJroH4Q34OXeUeb4lhlonEPg==
X-Received: by 2002:a05:6214:2f0e:b0:888:8140:d74b with SMTP id 6a1803df08f44-88d82de98ecmr688852936d6.31.1767462224736;
        Sat, 03 Jan 2026 09:43:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185ea248sm12893915e87.43.2026.01.03.09.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 09:43:43 -0800 (PST)
Date: Sat, 3 Jan 2026 19:43:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
Message-ID: <dw3zx6m3xcavzz24w42jnunh6s36neemst43w375pfhdvdscoi@ap4cprx65rbf>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
 <B215717DE5B3F973+806cb099-b491-464b-b9a8-fd12f2cd1e27@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B215717DE5B3F973+806cb099-b491-464b-b9a8-fd12f2cd1e27@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDE2MSBTYWx0ZWRfX9elIj4GdZ4c8
 sXlCjyj+svmcMeTfmTV3CJDtiBVW8rfbrJWrd1pINHgXmSxO362Z36u9OZQs7P6ShaBVnHyGXrN
 4zf+2H2jOKRwB3Mz37M57WSJhvO70fAsBcssfKI9U8wXF1klgFIE37OsPt/00g4+TVg+IbMhoPF
 DZEbAK/pW5ZomCXYcLZV4UvRBxcu0F3Zk9zcr+8nDITUOQ9+dckPotmioWx/KpvaPDeEV5aqjQH
 SipeC98AJq96QL8Ae64aSJoAdOOsFU5/VgoyyOc9tiSjl57+hy252gXdy2aI9ApU6cJwLj+/dD4
 lLKdRhCL/ICyR1FURBo5Ej8J75uNE99gKH3UWX9m83z8UcXwHqIRy2J3ObHhP+DWOLDKKfboxDG
 qLSFHBI/kekey8lXC0x7n03mfU9foBEyMnjowHUTrqyh7Bd9L5aF6BwlEdSSBG/Xzh37Qs+BoIr
 /TjLsKj4Ae14dFKN9sw==
X-Proofpoint-GUID: 1SF-MEXV7OdWIzq0ljxEka-AK_OGaj3y
X-Authority-Analysis: v=2.4 cv=RrbI7SmK c=1 sm=1 tr=0 ts=69595552 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=9oT6GacGq5yXGAd4HY4A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: 1SF-MEXV7OdWIzq0ljxEka-AK_OGaj3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030161

On Wed, Dec 31, 2025 at 04:30:33PM +0800, Xilin Wu wrote:
> On 5/15/2025 7:52 AM, Jessica Zhang wrote:
> > Validate requested mode and topology based on the PINGPONG or DSC encoder
> > max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
> > off of PINGPONG or DSC encoder max width
> > 
> > As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
> > for PINGPONG_0, there is some additional logic that needs to be added to
> > the resource manager to specifically try and reserve PINGPONG_0 for
> > modes that are greater than 5k.
> > 
> > Since this is out of the scope of this series, add a helper that will
> > get the overall minimum PINGPONG max linewidth for a given chipset.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
> >   1 file changed, 39 insertions(+), 7 deletions(-)
> > 
> Thanks for the patches! With patch 2&3 applied on top of v6.18, I'm able to
> get DSI panel and DP monitor working simultaneously on qcs6490.
> 
> Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a

I've updated the series, would you be able to test it, please:

https://lore.kernel.org/linux-arm-msm/20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com/

-- 
With best wishes
Dmitry

