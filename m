Return-Path: <linux-arm-msm+bounces-59718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F29AC6D9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 18:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E42DA7B2E8E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 16:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 913BF288C03;
	Wed, 28 May 2025 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwxdCW0X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA55928315B
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748448801; cv=none; b=HxSTeD0VOPcubLWnj6zs9+4IFF7wQFmuwoziukz1c4YPIcZX1Xx8QllRs8xIEwYMyC/YoqMEQmdC8mXxxRyD7GUjSUTp5loBPUTApyMJHdkdPJiBIzi345wwpD9XjQEJWLPWUbmGsgsQAeDsBeU5aB4f67BtB4cfE5Vz8AspNqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748448801; c=relaxed/simple;
	bh=gwVBGi4hIbsXrhbuodfR4lQNHnOhvVdJ0YA7YukPmJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MESdXZczW6sUylPMn8b09gergokC4O68CfvyZ346EJsfs9tDFJ2t3yEK9ktTssEhryI7LjmCD81LgKdzDtv3YSodDVjipL2TNc0HNPV0dfbApjmejxyNXSUFJOEmjLRBy9jdohi+8d5vI0FvDmAdbZMXGNTU5YzfysGKMZJ9GlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwxdCW0X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SA72ew005281
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9+Mg2L1QBDl92rjfoNAlCPsR
	ORQMv0jh6Aoaq4vKOlQ=; b=UwxdCW0XgvFtVccaGS3wRZ6akRXte2qSsXmoqoS3
	CltOgng+fdZ+KZBEyB+3rwrxvI1kx9hWfzVucFNG0jG+1P/3/YfAgBNOnsCuwPAn
	NoircCYqIk/Ho9mJ4V0Bnjb1lJO8uKPUjGEc/a5LA6G34uJOEzzPbjIYN0bS05EH
	acwSqBHb9nbin9wykrzk8bQWysYBmn77CnJlsHDrhZsFPKs2i1GSu+CWt1EzV67X
	gzSBuCrpzSgH2GSGfNirvmfCSqVWv3b7n6XhfRM9IfU4Nb7zkXTAnKyswsnjTLSB
	1hwh1gzQeW1oWJaL9oVceakOvOdG/hZCIfNDITan6IAs6w==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79pauub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 16:13:18 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-60bad575560so2733577eaf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748448797; x=1749053597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+Mg2L1QBDl92rjfoNAlCPsRORQMv0jh6Aoaq4vKOlQ=;
        b=Xr1+gVMIcsXOqI1Qur6x0O5azQSxrJk/ccaHYyjkD+tLMosBfODg4QZtUzI6n/Tsz5
         ZQx09bwbYsWx4AaN1DkOr7ANDl86UpCCKMrzpx5SOiXUXPZ3Dnnx5hokJG6+YC5QsE08
         hpVK1MLCdBVsaPCKEMzPTkSTd+OF7pjZfLbYiK9bipeUYtJdmpE4lvNkFTN6G1cWWphE
         aEwB08oSa61X3B6wl1dveQGAXft/EcXyGjOaVijpdQEJMfqr5TTq+15Lb0rYeu4jaajL
         2y36up9v6onhL4F1Ds5IVH4/pGvBLuDLUp9iUtYgw8h5QboBTDVmShrXa9b2VQkX1dB+
         emOA==
X-Forwarded-Encrypted: i=1; AJvYcCXlE2IGl7r73ZxMqFNzhx0Laur/CQpqlFyn9zTWpj+S/yhEgzDeqGEgyjoFxqswIL51reBdemsUbrB2EL+P@vger.kernel.org
X-Gm-Message-State: AOJu0YyrDFEHixsd/NKfgw+GE3oVEoDtUFy+Ues4wSmEBkS9cHR+8kT2
	7HaaznvElJlMBexftLQVBTDl62GhZxrOgfKODSko4sPtvLpogOuFnVmt9tXb9GN1QNJ8fBdCuvg
	6cb9iiqYmoJoFqO+29cGDvW915zYrGYUEHgzSMVXUdfbK3a0zKqtjruTKRaCczDz3NHI9
X-Gm-Gg: ASbGnctAjemwsRygV5Zlq8jEicIdiQgkpD6xVbTgFLQDqLHxbPXmQ8VPSrVBG2fSdAA
	DpwovDyEghQ0WO6/gDGDeYyCccGf0d9KDeNA6pZzGN1NVazNVpCmdvEOKvXIqDoS9+lIoKqX2QP
	0h9Ez1tj57VBTXQeCPTuvdXLStD9kIr1fCZmkM7cH7mCcz4Nxv2Jwsf8KkkwsvVzWfb+wO2av+r
	Gr923eRM+7eszeAttyRhGV+FprhoXPFsSBZ1uinB/tv4jcG0ZPzCfHrt9vb6dvAKreuSoUY3JsC
	GtuBBZ20AEEFf0Nb1H14Iqt2d89YAv/zkY23d+nx26nKeYklt1zIIy27+n+l0qC4A7rTUz4vLGo
	=
X-Received: by 2002:a05:6808:11d1:b0:406:67b7:8b62 with SMTP id 5614622812f47-40667b79907mr1137206b6e.38.1748448797370;
        Wed, 28 May 2025 09:13:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7kOaXTktpHw46oOtWRKpilwDLDgGTq8IbcVMN13DgegxQWs9io4EyuZpQO8J6P6zyCxUueg==
X-Received: by 2002:a05:6808:11d1:b0:406:67b7:8b62 with SMTP id 5614622812f47-40667b79907mr1137186b6e.38.1748448796931;
        Wed, 28 May 2025 09:13:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79e9a765sm3031921fa.10.2025.05.28.09.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 09:13:16 -0700 (PDT)
Date: Wed, 28 May 2025 19:13:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 05/45] drm/msm/dp: add a helper to read mst caps for
 dp_panel
Message-ID: <abxm6ppegxbesl6wztyxg46elhanh2mo5kxn43olbucw37cyon@aeqikyr4ord5>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-5-f8618d42a99a@quicinc.com>
 <aksnudxy2oyojjzwm73i4mulftcxccdsnddcdamypmscn6skpq@ijtp7x76m3pt>
 <df3807e5-c381-4440-be64-9bd49a2ecd9d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df3807e5-c381-4440-be64-9bd49a2ecd9d@quicinc.com>
X-Proofpoint-GUID: eFYLq4CnyUnMYpDIBB_NcnFrU-gv76U1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0MSBTYWx0ZWRfX2uqjrEjknSgt
 MelzzTtmxShUo5eIFpkcdgVvQNafGPrqLlv79h9GmS49dyPONIyzFV/Ez040eOxMS1WAWGoM3WN
 U3tdWg4LcCTeyxCTKET1UdsgPzU9CfY29dfIF7lWilYdUVA+wsBMdD2l+qhNjUZk6F0V4s4s4QD
 4r+1qgs10G1et9otEdansOV9TpGtGfgspXzoNmtzXVri4qo1cmsn9nbd6vj26cgPThF6GaaBn1+
 +jkzfbc8dOueQvJjI5R5YzjVyezbvjz4oR/EK2aSqPZ9pOye614hT+zzBAu2Tbo8Umvum/gp9ic
 A24PrRTh3pLPPDF6TqTAOCKB+IrytnJqVRE6AhS31Ee8ECyhxDJr/TnBo+10SMAudjqiZVDyi6n
 P30YSS1xfI8nfPEeiIKL/LYLMInMOPQa0y+XDjtYBock3+NQdPmWXfRkn1Qqaidkz5Cj5JCK
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6837361e cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=_S4K8tOYiQSLrvZx2BEA:9 a=CjuIK1q_8ugA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eFYLq4CnyUnMYpDIBB_NcnFrU-gv76U1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280141

On Mon, May 26, 2025 at 08:26:47PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 16:52, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:36PM -0800, Abhinav Kumar wrote:
> > > Add a helper to check whether a dp_panel is mst capable.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_aux.h   |  1 +
> > >   drivers/gpu/drm/msm/dp/dp_panel.c | 14 ++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_panel.h |  1 +
> > >   3 files changed, 16 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
> > > index 39c5b4c8596ab28d822493a6b4d479f5f786cdee..cb97a73cdd6ea74b612053bec578247a42214f23 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> > > @@ -8,6 +8,7 @@
> > >   #include "dp_catalog.h"
> > >   #include <drm/display/drm_dp_helper.h>
> > > +#include <drm/display/drm_dp_mst_helper.h>
> > >   int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
> > >   void msm_dp_aux_unregister(struct drm_dp_aux *msm_dp_aux);
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > index d277e9b2cbc03688976b6aa481ee724b186bab51..172de804dec445cb08ad8e3f058407f483cd6684 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > > @@ -108,6 +108,20 @@ static u32 msm_dp_panel_get_supported_bpp(struct msm_dp_panel *msm_dp_panel,
> > >   	return min_supported_bpp;
> > >   }
> > > +bool msm_dp_panel_read_mst_cap(struct msm_dp_panel *msm_dp_panel)
> > > +{
> > > +	struct msm_dp_panel_private *panel;
> > > +
> > > +	if (!msm_dp_panel) {
> > > +		DRM_ERROR("invalid input\n");
> > > +		return 0;
> > > +	}
> > > +
> > > +	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> > > +
> > > +	return drm_dp_read_mst_cap(panel->aux, msm_dp_panel->dpcd);
> > 
> > So, it's a one-line wrapper. Do we actually need it?
> It beacuse the point of aux is in msm_dp_panel_private, so if we want to
> call drm_dp_read_mst_cap in other file, we need this wrapper.

It is being used from dp_display, which also ->aux pointer.

> > 
> > > +}
> > > +
> > >   int msm_dp_panel_read_link_caps(struct msm_dp_panel *msm_dp_panel,
> > >   				struct drm_connector *connector)
> > >   {
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> > > index 7a38655c443af597c84fb78c6702b2a3ef9822ed..363b416e4cbe290f9c0e6171d6c0c5170f9fea62 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> > > +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> > > @@ -67,6 +67,7 @@ int msm_dp_panel_get_modes(struct msm_dp_panel *msm_dp_panel,
> > >   		struct drm_connector *connector);
> > >   void msm_dp_panel_handle_sink_request(struct msm_dp_panel *msm_dp_panel);
> > >   void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable);
> > > +bool msm_dp_panel_read_mst_cap(struct msm_dp_panel *dp_panel);
> > >   /**
> > >    * is_link_rate_valid() - validates the link rate
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

