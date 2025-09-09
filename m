Return-Path: <linux-arm-msm+bounces-72704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2485DB4A5C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 086ED1622BF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 08:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB7626FA52;
	Tue,  9 Sep 2025 08:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hkE1o8KV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9532586E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757407542; cv=none; b=GHnFdKqXk3ShIt4FBLWtdR4dncZf1y8gBTLskOUGQY8bK2E9ZJKeS6J1AhSV1P+40B82XZw82lGIIlBjeEjvtSzAfcFREeffh+HzauPOucXOrbhkr1G5Jt2ykFr6rGqPl99BTgaGn8gHUUQqb6lSsrhXuHdth1qY48u5dUNjsPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757407542; c=relaxed/simple;
	bh=Pa+vz0KFh6DTaA/CGgHn960N3UQmZjnHgqQ+q8ywuVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOcuVDvCd5egp6ZU1yzfdRJyhtfxWSnCu0VKS4QIkFJf0vUcaTTwIIuJ5y8J6izobokzueOZz+L73aV1ZRTXwtxInqjL53p3REQxJzkxyqAewI61JVlM/D/mlhhwUksdUXpNBKL3jL5fnMzvN6kYkkgZ3M19S8YvrvsFkMfWSBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hkE1o8KV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SsJu029885
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 08:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fa2kQFxYmWf21zOyKAAlQ46RUigKSHEniPLTl0DpNvE=; b=hkE1o8KVzS1Y7pef
	cxBBP/fMEkMfU37evIwBNfO6mpmoR+fu/q4MVQqOETTeaWOZvwcHIEGZYwGRsTY0
	+cfHkxArRvympOPyHk0/rH/JkRJhWTmha9EMAUaQ2QDbfwyrCLPAZxZjhaCAgMln
	2mywVmvvhLHGmMcsyzvCZeB0VCDKjzaD72JNNwXCXbV49vGI6oJxagiYHL2CbLjo
	4TRzj9Lfn4QPcxPG6670XG8xGBYISDjkVhEmK2KU9eazuBVzRdc4Ri8Te/X0NjfU
	sPL1WeTQREDSNkuONoAGpZXWsPLvC58jjo151qQUWi00Nvj0r/NYA0sQTPFxkWPO
	sSJQaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kyeqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 08:45:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b34c87dad0so151718611cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 01:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757407539; x=1758012339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fa2kQFxYmWf21zOyKAAlQ46RUigKSHEniPLTl0DpNvE=;
        b=ujBzXS6MtLXMJtiQllqC1Ew4SkOYnXvrIfNpES9fEtnGHRBlh66/p164XPPgVKi+PE
         AG/W+7BB2S+G6a+jbBL6vm7OG74y8osCFYXbsgYCsqN6S7veQR7LhMCsiZUGuR9LsGvx
         4bL4XgIg/wfsZVZIu0tqlM0ZsoVoJQ3YSu4ROU/EN+z/6OdhdwEdEkCpLosISBUuraMO
         Bgv4DFaeGmmdR5mTS6rl0R5AMy/UB/zS0dIXaOFVqyBGfoJo8ap9Wyc5tvwXNWMgt9AE
         qnKRCcbKsg0fmtTGqK0NdYBr+UxTPHe+e2z5jGPFgnjA8wBfebYkfgyHtnP46VHId1R3
         3MVA==
X-Forwarded-Encrypted: i=1; AJvYcCUZzA6r2MvjtSP+MMHoO3TY4s1QD5qY7W1Wt83UBf3Mceaj1p++8MjBdhgnuE55j+muuIJrF8iG7kKr1zXb@vger.kernel.org
X-Gm-Message-State: AOJu0YxBrFO9asy594CPSgADKGPkCcAqNYJd0+VQ4ltThGkt+uQYuxAy
	oJW0Get0NCKr+2ejiFnlLHevqLw+HQUVMczEWOUwXa7zBjEQc4NEbQjnftzrJFnCFm0tRqkXvzx
	q7IAnO0dGxEJHCkqgmJkcarpCP6lkisDltbQKqFX5K+XtZJRuvkEGTE9TVdCpwZkhC0gE
X-Gm-Gg: ASbGncvXsGudc9UArpcBEW95kjzVEbmw4r1hR+9jyz88Ees9OYDUvXX04bdAB8JV7Uj
	bEzPNE2asN5536sZtN7Aq820HU4UkCvDh0MeI6SRCt10jp+5yduIrM89DiCee3DrA3xq/k7x9pB
	Xm+YB4eguaOw5GTKdLSeIyMArIRorhu4NcuuqKjO43AU7+RPWpucS8vGQQ/VaoYBtWRdPsv27RE
	+vrH8C7x4JDyVBrlCZlaF3cuMBgBMVaHeeu3OUiGbeyhPCwd9SfBA0DsXZMMrmYK3y5Nrmpral/
	JV8oPS8vv1t4adNO3GJrVEI64c6dIoMwC+3VIiTHitghKFgtZ28cJ+aQZTC7VuPmqGbF+Eo8x5/
	gDV7xx2RZxHKs0DVnszvLxWRAk88ZuQXgH2FM1ilTfCNtA21c8A7d
X-Received: by 2002:a05:622a:5e05:b0:4b6:236:3f32 with SMTP id d75a77b69052e-4b60236429amr79524341cf.77.1757407538513;
        Tue, 09 Sep 2025 01:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER5hHlXx5UTU+e+w4PLfk659mk/2aAhqRlis8BzleBfAkcCxzbcmgNq7E4vUzOfp7AF/REfw==
X-Received: by 2002:a05:622a:5e05:b0:4b6:236:3f32 with SMTP id d75a77b69052e-4b60236429amr79524091cf.77.1757407537960;
        Tue, 09 Sep 2025 01:45:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34715db904csm5157031fa.2.2025.09.09.01.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 01:45:37 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:45:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
Message-ID: <3zi57uvggw3zgrj4bfouzjnf56yywjnw46f5ru7krihyrw5bkc@c3xf73ianksa>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
 <xurpc3mk5kksx7lfpsdqgasov5gc4dpsmz6iv2hjhsp5tewbue@dvrupbjzgxle>
 <c4eeb8a8-2819-4ac5-8dc1-cce209d7cbc4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4eeb8a8-2819-4ac5-8dc1-cce209d7cbc4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX7OiynVDq1sJ6
 aK0gtqIIeGaY3X2Fxg5XQblGeyt0UmOvW7aBkKm33Y2MTE8t9ovHK0Ij39DjhrNPOCo5s4JKgbi
 wQEaXSYNCU3Qg2u74zTI6qvqUciHMBMpTlDUlBdeKBsa7+6Lbjy/wXHadnNaAwNeXgqu2TbnLpx
 KJgCw05rvMsPDhzXDEsCkjGOV3qVEuaft1hrx6MBniBdr4tDc4HxzhNiIEj2M7ZznraK6SrKaIH
 TSDq4boDfMETE65gJY31DqixyomTGWy74LNf5PKa/8yGR5qQIKApDdTvLHhK66fkiJIePJNkx+7
 tpv4r+9qLIj4ciEddlZHa3LEgv8kzcecciL1G6CYiZrRZmJZOrvyXT0NnqFpTeG71Ub+GIOnMc/
 kkaAuV7E
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bfe934 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TUuSr-ulYHZ9osfFkC4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 8HJ2Uuxf1L_amoAhsUHPCQQEC43nN4b9
X-Proofpoint-ORIG-GUID: 8HJ2Uuxf1L_amoAhsUHPCQQEC43nN4b9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

On Tue, Sep 09, 2025 at 04:39:26PM +0800, Xiangxu Yin wrote:
> 
> On 9/4/2025 8:34 AM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
> >> Add DisplayPort controller for Qualcomm SM6150 SoC.
> >> While SM6150 currently shares the same configuration as SC7180,
> >> its hardware capabilities differ. Explicitly listing it ensures clarity
> >> and avoids potential issues if SC7180 support evolves in the future.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> >> @@ -27,6 +27,7 @@ properties:
> >>            - qcom,sc8280xp-dp
> >>            - qcom,sc8280xp-edp
> >>            - qcom,sdm845-dp
> >> +          - qcom,sm6150-dp
> > The DP MST bindings were A-b'ed and R-b'ed by Rob, so I picked them up
> > into msm-next-lumag. Please rebase your patchset on top of it and
> > resend. At this point I'm interested in DP bindings and DP driver
> > patches, the PHY part can come up separately.
> >
> > As for the compatibilities, I think DP on SM6150 should be compatible
> > with either DP on SDM845 or DP on SM8350. Please choose one which suits
> > better.
> 
> 
> Sure, I’ll split out the DP binding and controller compatible parts into a 
> separate patch series.
> 
> SDM845 seems not support wide_bus, while SM8350 looks closer to SM6150.
> But I noticed SM8350 is still configured as SC7180 under dp_display in
> msm-next-lumag’s top, so this change will mainly about the binding, right?

Yes, it's only about the bindings for now. The driver support for DP MST
is still WIP.

> 
> 
> >>            - qcom,sm8350-dp
> >>            - qcom,sm8650-dp
> >>        - items:
> >>
> >> -- 
> >> 2.34.1
> >>

-- 
With best wishes
Dmitry

