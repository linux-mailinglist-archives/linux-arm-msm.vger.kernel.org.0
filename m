Return-Path: <linux-arm-msm+bounces-73671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A66B59368
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 12:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F0217B49DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54AC27CCEE;
	Tue, 16 Sep 2025 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oD6gwrt7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2C32E8DE2
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018167; cv=none; b=ZbbL5KOW34tB3OxsK0+QwW9hiYbzDesduis8Shig4RNuC2cE+KNMvM1fzUHNbD7TYuTr2Q0O7IZ+CkBc+FH7yXJgasSvp+fJwKqfucK6kUmP4id4SvanlA3mp+2LyJGECcYd5jqDPruhpbL36wiwWhUjmB7NvEmVKmVyNZMYFQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018167; c=relaxed/simple;
	bh=LzZojb8/MP/ud/lu3eiFwzOTg0vcJ9FUBYQHsGJbXuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKu+zFTO1G1f24OwvHpGS8H6HFWsQ7A1qEXG2YcoGsvv5y5YEKejzoQuSaOrzlm0K0qj9uRijf36CkX8O8Rvt11s8qd0tfdC2sSKBomZHLkX5Po6ZpXJLvtTka0BzwljsCm9QJ2/Pxq/5EYrOQaja+mJ6PWnPojTNFDU6sxtc8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oD6gwrt7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA1eMP012549
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dsUOBXT5fPZdjovhyA0wRCif
	VQsPU7vYwfY5SFsZzbo=; b=oD6gwrt7ciUJllEv81O9W7uKYMyG/zXIQnn6C1OG
	cY40DALBKYR5oWNLzLIHdoRJaoio5HW2upCbuR9IQaVQB6FBE07CA7AL7JWS0xIP
	5FZM/24W6bQB4b6Qccb53Nmw0JxexMzmBSafkcOKvXaDOwJseDpFNb38qrvAtvtl
	6B3VwIAyPmIlsTBQU9StRYXs2ZcZoOcYtRWBPQppRv2KFGTeYelqvMYlfkXxWYRk
	vHFjJ/n2f5+dikPZdYooBZyeoZHas2qU8HU8V32XCGtjy3TzzDejvsLEidZnpUoE
	2wa9JQKkrNqLjLeZZX4orM6xbOo6pkkD4zRsoWBEZTP8WA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495072rg9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 10:22:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b49715fdfbso175930111cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 03:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758018164; x=1758622964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsUOBXT5fPZdjovhyA0wRCifVQsPU7vYwfY5SFsZzbo=;
        b=doLahtCe61hmI3mkswQAF5wrYi8tjCf1Mh8fy6yA+ZI9+JI7CznwceN5E44lrVP2xY
         y8W7aIo5dy1TULDZ8lBu4ARSgWvhIHaHSVsPtUEtdA/IVVubvTzjimOo9ZvNLOBHlL3H
         thptGMobtR8GJIdMmEJkFkPOF51FLopNDLHrQmNe2+57T9rhDfqIo7N+agYr5LHLHm1f
         K5F9PnpCGJbhMbtL7TOB3JuDWbT/Px/BHzpuS1V4TI44e+mruYAXCOj0Be1nduKQSTgA
         Dlslh+JZ2DV8dm57OIhGllEsg0QGwY4HPiay75BQxAFfWRLRyuqUDSBpD9fKIurSE4kg
         0Otw==
X-Forwarded-Encrypted: i=1; AJvYcCXXP/BuKHqbM0e8fUitBNGmq/DItVPWUG9MUAX7XRP8XePD1hxt0l0tSjsgnvs54+KLjvPDNU+Qe6s1e4gV@vger.kernel.org
X-Gm-Message-State: AOJu0YxF2k6OOu8O1YGlaeMG93uTHJq2Me7g99NVyJ/RQcQLd7qz3zWb
	J4fEWPLzz+P/6XdhOcRC0JDItC5swnrm6KNYLmQrJsdvkq4RbfunDlij+2Kj0HfuWLpcos0qr2G
	joBPA6AeC00zI2tGzfaXcbmSBsQd49Rd/BQbzqI55+XoCcQD4xPcxTXo5GE2pib3wQUAP
X-Gm-Gg: ASbGncunAWeFoj0pjmQwwFeeX++YLeRHqQ8BHIZxX7lNHu9xqlebMPbC52TQvOKHs7L
	BkweQ+jNihSCnWl5WtaPfc9oPKn0ZHwFC/YCE1Kvi2aF4qohiWEdSOfxT4q0Ih3VSthc8fGQ9+N
	kx9fUuBYuxbrLuBm6sQDXFGVy2V/2n7hCj/kyx0aD7CpNMr5HRK6+C3thbXBQNNLKTUAryDcOM/
	ui7zGENSIe7d2I0rIqZhy+lomPDQiMd+kkeHtAGHl3tMAavVl7K0dS1Vy7pEX6Ah3j55Pnn0Dkm
	Icb1tGTecJuJm2OPiPGVY8WaZLB+mvfp2uexTabGW8zcfZsMmFcDYLb4aspTnnHHWQp6ah+wkSI
	0exwvuC/bUW+/+niCknatdXx8F5I+1RfzEL+p5yiD5iIwy1PH4oDK
X-Received: by 2002:ac8:7d0f:0:b0:4ab:7f61:4339 with SMTP id d75a77b69052e-4b77d043018mr173775351cf.31.1758018163955;
        Tue, 16 Sep 2025 03:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmt1N76y524zCMYAdzsEX4rsQJe+HhKzBcwZrhZwRUGHsN/sSmGe8IqeLhMm02zuV2vMtz1w==
X-Received: by 2002:ac8:7d0f:0:b0:4ab:7f61:4339 with SMTP id d75a77b69052e-4b77d043018mr173774961cf.31.1758018163402;
        Tue, 16 Sep 2025 03:22:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e65a31cf5sm4237309e87.137.2025.09.16.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:22:42 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:22:40 +0300
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
References: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX/gBkBwtfWqar
 saJdkIoo7aInXeg2zUtCe1BUQPPIWecL6ycWCa2hbZsoYwAJnof0Mglu6tvhiNjRcwlzUkjKMSv
 YGZWExxJZCHjWMU8KlEBiGzse469yVgtiMsPNlIqQVD7wdEyuXwCbXhjqAg+bk6cH1SJop/cEKY
 U8m1X0c34tjndl+nMteUYYH2gzExFO70rXS+sV+3feNVzW67GS40AW3gWIzSO/5IK8ZsfIYvuVg
 MmDHEV4kSkE2Q4c7Bnkniz3tnE072BFTQeUqNFVMBmqCzLQVtwKHYkUwQysWu3gP4+Hx9pxklqc
 /bPPOWgnQVUGAbTUDB2flzq/n59aKY0TzvgP2FD+FRGTvP7PR6oix1ihASOhcDPp5m9yaGfSh0p
 oLbKj9Eg
X-Proofpoint-GUID: lVBSfmATEjMV8UCdSnCt9s5wvBX6rKCY
X-Authority-Analysis: v=2.4 cv=WcsMa1hX c=1 sm=1 tr=0 ts=68c93a74 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hSxh5nLx1FgLBnIhuNEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: lVBSfmATEjMV8UCdSnCt9s5wvBX6rKCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130025

On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
> for consistency with existing bindings and to ensure correct matching and
> future clarity.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
> This series splits the SM6150 dp-controller definition from the
> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> 
> The devicetree modification for DisplayPort on SM6150 will be provided
> in a future patch.
> ---
> Changes in v2:
> - Update commit message and binding with fallback configuration. [Dmitry]
> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -46,6 +46,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sar2130p-dp
> +              - qcom,sm6150-dp


In the review to the previos iteration I think I was a bit explicit:
"qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
agree to it. Now you didn't implemet that. Why?

>                - qcom,sm7150-dp
>                - qcom,sm8150-dp
>                - qcom,sm8250-dp
> 
> ---
> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
> 
> Best regards,
> -- 
> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

