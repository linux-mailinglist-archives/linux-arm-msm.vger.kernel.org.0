Return-Path: <linux-arm-msm+bounces-71524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69E0B3FA3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 11:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6182C4E1BF6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BE6221F09;
	Tue,  2 Sep 2025 09:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iifSQy9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74EA2E06ED
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805016; cv=none; b=njT/Bp3eLRXlehscmXNZdG2TGJlAM0v5W5Z+1w7P02PdY/wWiUMf3EvZJa82xI/vD6dNspZKbiaI/JSreq/WKk7DvyQGGe1BY9X7q1Pwhbu3ps7cSBUqAlDgVrW+fe7Vn/2BLIkn3KT+HjXrgUD+BMUoaQCeFa98yF3phhQKj6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805016; c=relaxed/simple;
	bh=tX3BCUzFmHYIg0myhvow09MB4ccfm98eYBIQHxNimfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hviapveNRhZIsP1ogkMGN765r3UZ3dccPRiXCdjxiAY37aUFCAN5t0AZiC+xbmafUpZObBp9hshJaem6qYWZ4JP//Lo4h7ua6xmYBJvh64fIyZCX3MunroL9GpElqSCFsAQeKqd/peIgFEZ5oPMucgOOaPMWkNUPEaMrVqLLPBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iifSQy9p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S1uT022183
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 09:23:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ch/LhY4Ftoj00uev1yGdlcFF
	tJHZQ9xg8w0D9kgtUtE=; b=iifSQy9p3IEu5hNQ/ysGtvHwuEFAAtMxJbSFFxCS
	1HDtjhOMn4NA5Wwok95SBz9wNOiakQBHMMAtX9eObaDZT7dnRahZoOHXnTrMyVQD
	+zKZ7DKnPxghc4nF5imAfu1x+SY6qI6m3CBSh7V0QqIMgWeOJhFBFqUWUBmN/chX
	vRCgSRsi6u0n6lXU9UbuO+Iyz8cw/xKJg2lNUscGlabDJlZt9Va4jKcW3u/TO6ow
	d/MAq2L9C+wAXlY2vU5r3M+bj3qmjfb0oDEEDJdGRWvmbt8olJacHDFZCYwB6oLS
	Oh3G0mT8xmIm9jo3HG/t305jCNRGdvOVrvyBdH/7+KGb5A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnp7e0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 09:23:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b320a0a542so51318811cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 02:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805013; x=1757409813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch/LhY4Ftoj00uev1yGdlcFFtJHZQ9xg8w0D9kgtUtE=;
        b=EiAGwYL06QQY703d1V5hEmrtY3gE7B9VwJ3rKJA31xzhvkwr/0GfE20sM2aRMdcZkt
         03lkF7a67Ul5ujauwwlRB3HWXIIlv17p6IRw6iGg+LqT2F7R0lzTE+lOShRYKHVWCxao
         8sDVtHnZuYu+MtloQK5qJ2EDTmJyY+WGscG31/XYN9xbWQyAPR9yFk4TTSFn2XY+5xt4
         u0UCiSGc6wguMtJinWnQaYxFQ27wVG1Gw1f21sblk8IGxu9BHlJURl0i66PNzth/jbtA
         i91Zn+oJ1vB6sXrf9aLCxaoMJJVeEiqcMqIeqXS5thwbYACHsFXVQpHXP4xmy20ao/BQ
         cKQA==
X-Forwarded-Encrypted: i=1; AJvYcCU71hz3jW3z8KDwacJUqtzC7kpcZ0AM+HjYuZy86ngUTSppeoZEgyfZI6e6tY6ZovczhROxfq4kKKQMDpqs@vger.kernel.org
X-Gm-Message-State: AOJu0YxRZkQNWA21wpdop5NsiVCASne9eO4AqsotBogT8LhHc6/WCVdV
	B6NGyly1u41tq0YSbBdUueUbjSPDNgrfyoEVU8BxSUeYlrZ0z8EhJk7Ih0+ssFcGpqbT/nsDhOg
	RFiwv0WvSh1cm2ztCpHaHxVukxSJiipubWCYq6wIutbELcr1AGqjXK9GufCoSVipb/LkI
X-Gm-Gg: ASbGnctCHYwaM/OXOOgMBQNL0kDLuElq0MveuQHCYnsomYyADSgeztTYWZskMLNwWgv
	Qfs5Y5ngnUbs3sa6ljVf8XOlSONSmR4MCTakro0fIzzU+B5lLFkP+pCyKLGt0miL0rFECICEkYi
	V+I5uoQJsobHunw5Hn5apQoksOnz1FnNubfW4FEvCOUeNB+kJ3lW2s7eOvaUzQ6r0HBGM90azTM
	biARVDRUoD2FrRe/J8Gfq/6Yyy+cYO2JiBYgQtkYLiGjATLnsI9TEVDrmdWNGWGMKFEeo012SIn
	pz09f5M2/X4lcA1Gl5y3vpY1wOGHnJLLwYU3Xwq9r6VjanWvquPy3TkT+gNhUC4WQ9UysRFmgx9
	5su/fJJLUm+5xl/ZTsP0u3Ir1xhISMs5hr4CMyOe/hNMPHVJI/Gb+
X-Received: by 2002:a05:622a:104:b0:4b2:9bd2:8176 with SMTP id d75a77b69052e-4b31d84444emr121691141cf.27.1756805012784;
        Tue, 02 Sep 2025 02:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECcy5unw6WFIHBHq5iOWTGUfamDps6b170cwBunY645CsFBbNJrcuVd5piaxYGqW0iNZ5IXg==
X-Received: by 2002:a05:622a:104:b0:4b2:9bd2:8176 with SMTP id d75a77b69052e-4b31d84444emr121690831cf.27.1756805012345;
        Tue, 02 Sep 2025 02:23:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608279ceb6sm546116e87.100.2025.09.02.02.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:23:31 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:23:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 2/5] drm/bridge: simple: add Realtek RTD2171
 DP-to-HDMI bridge
Message-ID: <w7lf26lyltduionxhckld76xhi4dsxzhmyfzz5notzt7cu3ixi@xns65dvdejb6>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-2-f4ccf0ef79ab@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-2-f4ccf0ef79ab@linaro.org>
X-Proofpoint-GUID: fJ2ZfXcg9AzbdgsGY3ofMigmk1KSWLzS
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b6b795 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eHZZoxIKThfaNsFTWoEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fJ2ZfXcg9AzbdgsGY3ofMigmk1KSWLzS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX9Qm9tTflXWom
 vLoA7siXHSJnbH8Gvgrl+XngqDHNDgyV08vSKeZWRj7TPq57k4NQPNbcj43G5xzfTIMl3M+X55N
 OfP2SRYlFo9jTXP8WEkop3+dsbQZng3M4fSuIQ6QcLnwB+PPTvvhNmjXO3UhgekK8krFhJ0yGms
 L+UFOwTBNF52U7YWFF337uhHtUqdJwmeIFr1AQI0IaG/TMYyZqiUteFUQVy0LU73ldVoEhuuio/
 GPBWI5oPcPE3UbaMLBShlL9fiuevo+3q1LnbTcS8h4Cnb9hJF63lhr1co6m/adjecVaOFhnCfeq
 butJipGEZXCTHyT15P6rbAXGiPMgf230rZ1ykZx6QGSp0jV7+fWr+C7zBWUG8ugLdY1NX80vyXd
 uTkkyJQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

On Tue, Sep 02, 2025 at 11:00:29AM +0200, Neil Armstrong wrote:
> Add support for the transparent Realtek RTD2171 DP-to-HDMI bridge.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

