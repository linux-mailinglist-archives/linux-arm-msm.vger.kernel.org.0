Return-Path: <linux-arm-msm+bounces-72546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDEAB48984
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 12:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 375DC342083
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9E02F90CC;
	Mon,  8 Sep 2025 10:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jti3dHSM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA5B2F9991
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 10:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325854; cv=none; b=qUVRaCsbiXzO4Y01ReQRxUQaaNH1VUN94RQDuwegKNi2/LRgDpXhfxUq4V2ePuHbnKFBiBCDMR7Rzuq3WQssuCDcJUUe7SRf3UyG4LMnOVm0cwUnaogzJS/LM1NKJ+KzmMmxu7UR3IOyou2ll+Sc4EDTSO2eH8wB0QA/6YTIDbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325854; c=relaxed/simple;
	bh=UvI5DUAlT0z8CKf3kn52UY+6vAHjxKfjlmUOkBZnsCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZEJneBUyVihZtgP/UoRoUgH1BsTTt+5ZFLHo+65HR1ab8PB5ouazUOl2SlZTxTremypUU4hBEU2nOtLJsNN7m37DMAi0b5CZllnaAvVLs5tL8xL795EHYcay7pSdZZ9WnGf++KZEr3NVln2aR+tPxuiPTKh+ZHNai+12wiObOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jti3dHSM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888xdFV006860
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 10:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUCQQaCIPPEbbTPsTsrcgsfo9TDR5bbHwDO1+w8BQ9A=; b=jti3dHSMhzULG8Nj
	wCZiRdihhFxxIy1SsTTyx3LzZWw6KjQuj3M3tFnG8aDGyKq3AHH+NgAOANyq02fR
	UfdzzQ1TRTMpkmBRr4bZN49OgiZGjiR02V4fZdFV1DjwlGgJ1PCSgNjJQc7PUhFI
	mVLIfyLvBdNzamnMEdjBeyNrK9lLW72r4mYaSptG53R3QQ60V2FnMQZI8RpYjZ1l
	BLpLrIY1oUN2SnS0NpOrcGX2kbk+N2ptO3YW9E/5ppy0hhdaJJ3rwfbH+c7IEuJq
	nKG6q+R3BRfAgP3YE4dJtmpRq63HxzG9exP+3c8Y3TJK0PiyBzxI+17Lce6ndUrB
	PzZacg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8c6cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 10:04:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-728a71d8fd9so137606296d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 03:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325851; x=1757930651;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TUCQQaCIPPEbbTPsTsrcgsfo9TDR5bbHwDO1+w8BQ9A=;
        b=jDf/45+joNP8fTcUmRIcjHf0fONFhwN1zxkNnpZcaqmoHNFH+gzQ+dSgCvAtbdO87b
         kaC3o62nEVZwc0hN/LNKd3t7G3Kf8CcfsbZuQu4ePoc4c2vG/SUUM8iT/JKfnItbnRi0
         W+C7/HzMrdWRhI52ixSrEGi2uSqrqeNc9roq/qFb+GeSOLm0H4/BhPd+1ucB6LKZXhtL
         aqlYHx+sPi+r4m4eje4k/JwpYeM0oNQnzS7RpJqA01JGmlJnoO9YhXqHS8jWfspYGY25
         hMNOfwRTesyDMnmZEZi/EoesPoqZnzAGOfBifuwIdABwT3i5p66RYDZ+m4TN5aPRBc5W
         hFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwYgIsfUVU3RR3wRSIQS2lqXhIqCxQHnllwj+hIq2ewB2Sn4DkpeEtRSdjwu2VMR/rHzoI03xWrnIVy8dV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcb2gldEQ9c8XhPfSMBa7U9ecDoY1KBGluVz+Fl3w0onSZxJZd
	DVadjyZYYygzhRs1kKWduNI4f7JdxE7W74TTW8o/u3y7qYcNa6jQgj5fGFlkfBQ588yHNby206i
	+adlMJbXEqImbUMCIowBez6NNuQBVpSgBf7TM+2DzvZJ3QvcHmqxoQ1J0XtJ/DUAWVNzy
X-Gm-Gg: ASbGncsaBIE7/d3Xik+i+lnpYWvQjJppIDsaaQVpGvfmXa8mtO1aZ02zNZzsyOTak2g
	dO7MUSnLdUTO8kDore2iZFsPPD/91yBA4v7QJ/qorbmjbsYQVjduop2Mox63QwOBoOP6HC5mh4i
	vYVN9gDVAWsC/73A22AuZW1NiaHWl1jhTmlbkZqXPANBJx8DaH3Ayd1Cjy26vvVZ83YReDqAHFF
	TFFc/04dMYWTgg6vIk4RPN4omcCSdXFUHigaVuLPhZGuazHDr3bld9vjx3ij5U/L0AYYhbfqSDW
	BGPoGGFKseDX+bMT/e831NcCBTonxvZc2lQcEaVQUhZNCniwv4i2nUN56mOlw4ErNTjH/mxtFtQ
	wDR1UaA81OZZBASHDtyq9G+p+bDM4J8urzgRdjMOsFZylyFbRF65E
X-Received: by 2002:a05:6214:c2e:b0:70f:a8e4:9de with SMTP id 6a1803df08f44-739322f8babmr88180256d6.27.1757325851110;
        Mon, 08 Sep 2025 03:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTM2Aa+Miz0K6s7xyeRR6TpR0YSRPsezwYwrqqCf24cX0g/PXlLkfxbUOlt6qGOF4asGVuOg==
X-Received: by 2002:a05:6214:c2e:b0:70f:a8e4:9de with SMTP id 6a1803df08f44-739322f8babmr88179646d6.27.1757325850389;
        Mon, 08 Sep 2025 03:04:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9cb5sm3498239e87.95.2025.09.08.03.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:04:09 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:04:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <pwbmqjspoyj2n7gchyaycxfp7ge46pyvm5dntkk7awkr6pblmi@wun2jdt5iehq>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
 <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
 <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
 <jdbwncstextusng5boqg4v5r7krbnjts6f3zgd65cu4rrst7ay@kkod7ihbgfrp>
 <69219cdd-bcca-4673-9a81-084184fda6db@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69219cdd-bcca-4673-9a81-084184fda6db@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX8192UBCZgchU
 V6UqF5ioLr/QI8dipk/rbo+GLOi6M1EzDoZfzlUu7PRF3g/85oA7xIENVOzArses6QRbSoRMnkF
 Uj7OVLDkMFAPgUhLmLBxhz16hMfh9nI2Agi0AJCBKcArHpCmZzBAIgxW5JvURAKIeODyQ0iXo3p
 HP0Q+M77j7SZ3iZUfXfhZVMrkAIZI1bzWD6ckSvm/+KsofdBOE4LymlXecA1SumMdiSRow86YWg
 Gu2cLxoV1f4AvM+EUe6PCfg6Ncqk3eyC+zE7kHAR3QC74L/IED3oF/8nWoA3y3jTZWEgS/7ut0g
 JBmKLNyvBg56s2OArzFNjgPRGgwpUWeoKbCG/mc1xdC8OkUAimbAHso7TIu0yjk9iztOSewiC2t
 nf4UCJVC
X-Proofpoint-ORIG-GUID: 0HAyNTjJqhrQVzuHm56vSs-nhMnvHVcE
X-Proofpoint-GUID: 0HAyNTjJqhrQVzuHm56vSs-nhMnvHVcE
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68beaa1c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KvANTHea1ihHQiRrGRIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On Mon, Sep 08, 2025 at 05:46:30PM +0800, Yongxing Mou wrote:
> 
> 
> On 9/5/2025 9:48 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
> > > > > Add compatible string for the DisplayPort controller found on the
> > > > > Qualcomm QCS8300 SoC.
> > > > > 
> > > > > The Qualcomm QCS8300 platform comes with one DisplayPort controller
> > > > > that supports 4 MST streams.
> > > > > 
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
> > > > >    1 file changed, 22 insertions(+)
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > > > index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
> > > > > --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> > > > > @@ -18,6 +18,7 @@ properties:
> > > > >      compatible:
> > > > >        oneOf:
> > > > >          - enum:
> > > > > +          - qcom,qcs8300-dp
> > > > 
> > > > Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
> > > > new one?
> > > > 
> > > I think we can not use fallback to sa8775p, since we don't have DP1
> > > controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
> > > really used). So in the hardware, i think it is different with SA8775P and
> > > we need a new one.>>             - qcom,sa8775p-dp
> > 
> > The DP controller is the same as the one present on SA8775P.
> > 
> Yes, it is same.. I just want to confirm again—even if we only need DP0 for
> QCS8300, we can also use sa8775p as fallback, right?

What makes you think that we can't? Let me repharse the question: which
part of DP controller (single one) on QCS8300 is incompatible with the
DP controller on SA8775P?

> 
> static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
>     { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported
> = true },
>     { .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported
> = true },
>     { .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported
> = true },
>     { .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported
> = true },
>     {}
> };
> .mst_streams = 4 is suitable for both QCS8300 and SA8775P DP 0 here.
> 
> Previously, my understanding here was that we might need a new compatible
> for QCS8300.
> 
> Thanks~~>>>>              - qcom,sc7180-dp
> > > > >              - qcom,sc7280-dp
> > 
> 

-- 
With best wishes
Dmitry

