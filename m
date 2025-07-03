Return-Path: <linux-arm-msm+bounces-63579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D453AF82A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 23:28:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 641601C88635
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 21:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661462BE7C6;
	Thu,  3 Jul 2025 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BGrvMhL0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A899B2BEFF6
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 21:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751578070; cv=none; b=NE2hHhOAucv0uxL+ALlqVvrEtyt18I3WdP+DS/xNou4nWcZwPU86uA7brb+CCmD/QI1GKnH8Vy0mNEUD5GAfEVeI1sYBnVswLv3167QICd0gk+8aDKqIoV5GLE6zMOfehVKYFC1N+U06lTW1N3WTzhRDlR+AAY/RLsGxaaToQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751578070; c=relaxed/simple;
	bh=hsKqc1H3xGcl+DxIItk2mPeela+BueStEwEV1bhT4OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JxlD4834HxT37umhEOP2lEDoDh81uFt3i8OX8C6jmux0fJvbAO2nr5lhcrONtwC4rRn/aGQoI9dOqYnxUXUdtGcD1rNAW3MaOz4NTYPtN0su5XAzUQZEwRKCBpeFyielwhBaKQIYXdX+VS9Lzyopm9tYUO6jYxebOKqNwW5t7+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BGrvMhL0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563F51QV018851
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Jul 2025 21:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B8EhHwVKYpVrPJqxIdjJWt6i
	mKVtstqw6FBfSw5Dfcs=; b=BGrvMhL0TDNFCs2LhwEFqzu7QOyx7f+cCW2mp+kZ
	0wLWqk+5N17jvzzu1Ejzhf6b5Rn5C4e8oNlufBfaxIEAiv6ngFCB8Uoui1q2PqP7
	larACg6xkL6YsWwjNraGORUubtDCBCWV/64XJ5Yg8dVetIFaNAO10I/WdIYmNkoY
	ZhvNxY5PnPdLW3+AYQrEYb8Ftu6+WtnUYzQ9zMhK3jSzheM04/qjbaVX2g97YAin
	KLdDNnC+7V7hW4zi1gbXwYC2uza1NUhPNB0YI0EWgdJczDQ/35bUTDtLe+y4gaVW
	7Ul3qtUlNrw3LTZ0km0RYzuTt3fjoGcN8jZ606Mm+xYJpw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxstj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 21:27:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d4576e83cdso65900485a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 14:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751578067; x=1752182867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8EhHwVKYpVrPJqxIdjJWt6imKVtstqw6FBfSw5Dfcs=;
        b=mj5VXekoYjfYFSf5gtWlMEq2+1CayTkRlLeuocreXE1FsR07tkEYDcwnaQoX1qQai+
         Vp3iDwNb3yM3NHLn+sIhXYucuKifcBeAAhncrq//nU85YXzJiX+bPBmoWDC/tTCZlZSU
         S6rSaOCUIVAxQpFcjHgkHKCWYOZ8s8zsJpPk2mepHAxZu3DRJLdbz4gB7HodwkFo+c7k
         vLKLwmuQrdFFLvIq7ve+97KJZqkefK3n2PUFcVmU02xtoWo6sD+hP2SnfVuh7lnF2cMQ
         OYANjMfiFtq8K1+tMLICmDY95s+3ZemSSz2vsT0hfkEQrumSJUFrsKrjgfb0ZGbGM+Wi
         sgWA==
X-Forwarded-Encrypted: i=1; AJvYcCX3DcR4iJRaV+mJ4HQCixnfdDHTjSizS+ksTBVrX12oZiAab60jXl2IGXKjOaAeTKg+d82wrt1n6o30FC6d@vger.kernel.org
X-Gm-Message-State: AOJu0YwRVFUi5e0OsvdYqBgU0llF4u49zR5YGlxasqS8T2loEEy3iKxO
	PnZ3wJvpQJYIheYijj5MET3eXWCYN+1XBHsYP+f1C5MQxpSfV4QF1ug0WD9O/ch3vxY5ItfyAX3
	f8HaW74hwelOChv22iI1/Pof02XZTr/ThzC4f8Gn5vQHDghO2qUbYbmXFFI/HNweeZby7
X-Gm-Gg: ASbGncuo5S5B6lB0GSC/k0t6ZuPK4RAtAeGZceedWDd9xxj7DOd7kn143IhcLlxWtFm
	qAL00dJWdZkiEQMR++ulQu8dgbo9iB0VJJscHgjZofUv+wHdwCW99cs6aBRWB/6/a+BKYW8WsUw
	n2iFucOuEzjqQp6/+YsIXJ2zKrzo+7/oU12+ABLwZb1C3ikpZUaGXWEdS6hE7hWDHvsOF5fCuQl
	FZxVp1vh1E9LXgdXMw/M4uFOng+lWfb0MRHdvEtJtC+aJfz4FkhhFsYJXG9Zt/8T6ckPS1wJwJ2
	L2TWoXFDyS6LZktyPk/B1ZLzh0b6G5xEgFw8RV9/XiB2yeleOLWmAxFqxKXBQShGyvJ/goxUq1l
	h5MtwT1HDXQvUVcGuSOFci54AgdxH/43ebP0=
X-Received: by 2002:a05:620a:3d86:b0:7d5:ca37:79a0 with SMTP id af79cd13be357-7d5ddae521cmr2891785a.18.1751578066814;
        Thu, 03 Jul 2025 14:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMJrZqqPZZas9zZzBzoVxAUKC2qdaPz2216jh1dVtgBGxiblPPM6KkbjiAzq0lqA6zcxM0YQ==
X-Received: by 2002:a05:620a:3d86:b0:7d5:ca37:79a0 with SMTP id af79cd13be357-7d5ddae521cmr2888085a.18.1751578066366;
        Thu, 03 Jul 2025 14:27:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494f6dsm72675e87.123.2025.07.03.14.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:27:44 -0700 (PDT)
Date: Fri, 4 Jul 2025 00:27:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
        dri-devel@lists.freedesktop.org, dianders@chromium.org,
        jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
        p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
        rfoss@kernel.org, chunkuang.hu@kernel.org,
        cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: Pass down connector to drm bridge
 detect hook
Message-ID: <chznjpcx6p2vn3i5jt52peikhipzjiwzlr74gx6mzp3wjstr6p@6zhhknnl3zek>
References: <20250703125027.311109-1-andyshrk@163.com>
 <20250703125027.311109-3-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703125027.311109-3-andyshrk@163.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE3NyBTYWx0ZWRfXx7BNljub5nGK
 +xvpqrJaKsMicqVlBrRAkrAJJ3IGS/Th8tVF3xi6k7MZrUljrAxLcx8NTusJFGkzcp4RAoc3AYi
 Hs3WSR921qyKhcpu1/128jEOT8PGztApZEbPbnbZuIWXBPjLam52239KfEy6nfZFMauMpAftWNQ
 3WIqWthhft47olAlhRhLsdb3jsFh46mktBazNc5FdyssSa6p+RE7+LzGISb0wuYzV9Kkj8QKsAa
 GNa+lIWKbbfreE5PWcVfSBvisXRD1wcQAdYXPVSEuNXmLCb7zncEDPEBTJ3gMpKgk+X5Q0HwKPC
 4eyeQVBEDGxMWld8BtxD2EzqisVwvZZwPomGNXGubDDB6Cb27O4hGAHGnEQpyXM3XzCVulNhfQZ
 OxVfyRWvsA/7QmCHqt2YRGnGTQ9SZrXmom8E4QTfWX7+tExx0ri/UykOA8zCHDTB0rfzMt4f
X-Proofpoint-GUID: gBbRV573G5LQ0C2EwOdivWVQMgnTpK2p
X-Proofpoint-ORIG-GUID: gBbRV573G5LQ0C2EwOdivWVQMgnTpK2p
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6866f5d3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=nJWoAq30JnpefaDr-ZMA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=763 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030177

On Thu, Jul 03, 2025 at 08:49:53PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
> 
> In most cases, we can get the connector by drm_atomic_get_connector_for_encoder
> if the encoder attached to the bridge is enabled, however there will
> still be some scenarios where the detect hook of the bridge is called
> but the corresponding encoder has not been enabled yet. For instance,
> this occurs when the device is hot plug in for the first time.
> 
> Since the call to bridge's detect is initiated by the connector, passing
> down the corresponding connector directly will make things simpler.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

