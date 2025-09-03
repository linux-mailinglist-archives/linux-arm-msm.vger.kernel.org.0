Return-Path: <linux-arm-msm+bounces-71809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A5B41C87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 083865463E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B776C2F3C18;
	Wed,  3 Sep 2025 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfhIxdYS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B172F39D3
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756897314; cv=none; b=sxFit+7fUY/lcJpPSxD9mKbgxaH957L+p1hqOfsNFhErwBELZrTHsFeCOk2Mrx/jN2AXT35jXo7q7uC+sJplWQYEsLVg+4c0Tl/K5aKt/J0UrGZapalWKD7UWWU2uQ6e8OVO9DHli3p19InrwJ55Ya78fB5iB3XUzf7hFaLYZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756897314; c=relaxed/simple;
	bh=7+79JLZEdYdW7EsjOhd3wHHBOMun7TICIG2s/RhNN5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6kQhYE/yF3w4ZDsA714WETROqdBWPCJW29sQ24OsqAzcHUb+6KFR9ej5eSF07Ul3R5E9aaWq65QhsaoMzb1+ebQC3HNb/FLZ2EOUwad/t5NzrHtbsdYVgF0J0wbxc/eIaaWg02D8a0A2XX7PJigS/M5AJZCtTcl3rfFaa3Mwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfhIxdYS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AVf7T005780
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qLaUOnzcULpuGK96TIq7/Q8T
	lONrYTUZzrvCBlNYoKY=; b=gfhIxdYSD9hWSM17gi+nZEvE52tAge7mklgZUiSY
	RLVdZzhQsHPS09GiP+kqkYxKLgAeirHepKwknoqHGs5nje3t9V4akj8L3kjmLHHB
	7023mAAhkSjr3xJltUO9uF2//Jaluaco1C4GIgcqWWgR/vJHWYvKC8ueBBqHhEDT
	GTjUhGFhKbTUVn/Xfkqp0y3m6x7bgCpnpDWPvGE1ox7Q68dHuu3iWKNr8nwp2uyY
	xKWPHR+6MMOOtqQrFlchmtcUuaUnhguJ3XfORaVQWFi6iDmlm4nivcLEYoFgk4Ql
	ZDASV69+YBO/fTtnqKaJ1h+CbAhW8MJ+GDgzDoWWE+u8Nw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjkayu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:01:52 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-745957b766aso257313a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756897311; x=1757502111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLaUOnzcULpuGK96TIq7/Q8TlONrYTUZzrvCBlNYoKY=;
        b=akqWDcDndvtKn0lTwjGUyN22ZaQC3gkrVrnTesXRkc6gupR8+hIXAFlofAHtB5wwBP
         RcJXMzRiVbev7JNo52VnbGhlV2YE0lb/JcSwrGve9m5KqPGpG+YUJvU/zz4fkei59Df5
         Fb/5Up0GaYen/FG0lSH06k0gEO3020BoiCKrO+5Aee2ZEwVZ8omcvVEqQBugp3+Dsnd4
         uqNvB2XipkDM+KUE7h+4qj6Ie9DItG/n5ivs6TpS46T7g8fPq6GmW26xB2rgdTM//2kU
         HVcn8VEqFoQUaVl0e+oKwm2mN6h30IvQVQRZ6w/LXeqCJL2JtGNmxgZSN4eKQ3lz5mZY
         SqXw==
X-Forwarded-Encrypted: i=1; AJvYcCUjdTZDmlS5qnB5cKlwnDyg80USHjITpLVDm5iGq1YK+nXKUDjShOEOMnK2Ja38TsXUIxL4yXVTi0b7dVwh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2FYog/vG0fLq/ZugHVsxT000aOd7oB7yVU7btMQDg0RccWKBT
	441hnybPwsn+INDYneJ0Epe569u7+qfx7/4KVH8MheJsYiU0+gR/ZPDBcpWieIG4pZhw5xW8LRR
	rDmx7Or+Jv0/p6PTgQx6t1jKrT5iVgIRsoyhOyaLcs88FAzd8N0QW2qXgvXDRCBBAfL8A
X-Gm-Gg: ASbGncuPxEIdkDjaBa/Pr4rrB/JvO6nFsuQyWbbGPPT5GChb7ccN3gZX5zxRtFihhOh
	IOXH3ZYBYhc3vvdg34dGxtqymkKmSIff+KbAZLE4MhSMDt6uWealXVAchYCT01xsMV7EDb+HiXE
	Q6m+fdAAMZVLCN5C01UXmyiY09AyZjjSKNPGQWq0rNhtDcaPMyogDUZz1B/sy2dhlvxy25bJ3Ps
	SgkxKe3CiKuEU011Snx2rSvErJcjAPqM/94p13YfLArGMHkwhL5LV9WFnEG8d2MWA9N8XkVf5gL
	41idmqQFkSrp303iMqUe3zRLFKO0INqqVqAVvNToZoHCJcCaBeEMbJkI+mUICvWwM/ZmCTZO3ar
	1F9www1hxCjuPwn2p7zF4ooc0zuT4fF2qYltSorjDkGsC0hBZMbGB
X-Received: by 2002:a05:6830:6d2e:b0:744:f112:e537 with SMTP id 46e09a7af769-74569ec96f4mr9524831a34.30.1756897311164;
        Wed, 03 Sep 2025 04:01:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdiePyT62civ6LFTn3goLcy8YW+L9JeKgsjo9tX5PgEGNj1cvGwn1XZZFaj5wacomXsnH2IA==
X-Received: by 2002:a05:6830:6d2e:b0:744:f112:e537 with SMTP id 46e09a7af769-74569ec96f4mr9524761a34.30.1756897310292;
        Wed, 03 Sep 2025 04:01:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad52b4dsm434598e87.152.2025.09.03.04.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:01:49 -0700 (PDT)
Date: Wed, 3 Sep 2025 14:01:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rajendra.nayak@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
Message-ID: <d35s5ldfswavajxkj7cg3erd75s2pcyv725iblyfya4mk4ds4g@hekhirg4fz65>
References: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
 <20250813065533.3959018-2-pankaj.patil@oss.qualcomm.com>
 <bdfb09a2-0053-4a07-85d6-5e15b8bc126a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdfb09a2-0053-4a07-85d6-5e15b8bc126a@kernel.org>
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b82020 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=FCd5T-TvBLVYlDZUGUwA:9
 a=CjuIK1q_8ugA:10 a=EXS-LbY8YePsIyqnH6vw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: mur_DstHoQCJ0THZ5h0ojfA0Qwe4t_1X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfXxoGhh4efNdLo
 m7S0sLg63d6jUBayscEikHx/vRiDke0YV1PvD0QAKPKIbkF18mW9dfuIpE3ox2bCIeSZS34gPNV
 +z6JqhZHIMfTFlpliU9kgqUWPVSG6EF4JJnQljROVBiKYxOuBXgM6pS+Gxb/5Gj/NIwnah7gH2N
 tjyn/Zex3mxU5VlTQqewBtW1Xs45eptYQ0N6tsdSb9LPcgfcrIlqGF7wwP7nRKB/lNHpU5TMFuI
 1Eu/UbBQCxqhoWN1f9zuVgKrqAUUEuFH9DMpMcvck/FupztuScwl3ThTlBMfDN4V0YVCwn+t1tQ
 FdP1/Z01+SNnd54KZtVMEk3ttqIPjNT8AfYFVDJrRm/Ig7fhqWeV6uSYKOLXJG8g8SlnOGpeyOs
 MjMiBFNv
X-Proofpoint-ORIG-GUID: mur_DstHoQCJ0THZ5h0ojfA0Qwe4t_1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

On Wed, Sep 03, 2025 at 12:08:27PM +0200, Krzysztof Kozlowski wrote:
> On 13/08/2025 08:55, Pankaj Patil wrote:
> > Add DeviceTree binding for Glymur SoC TLMM block
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> > 
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> > Changes in v5:
> > Rebased on top of v6.17-rc1
> 
> 
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,glymur-tlmm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  gpio-reserved-ranges:
> > +    minItems: 1
> > +    maxItems: 119
> 
> 124, I guess
> 
> 
> > +
> > +  gpio-line-names:
> > +    maxItems: 250
> > +
> > +patternProperties:
> > +  "-state$":
> > +    oneOf:
> > +      - $ref: "#/$defs/qcom-glymur-tlmm-state"
> > +      - patternProperties:
> > +          "-pins$":
> > +            $ref: "#/$defs/qcom-glymur-tlmm-state"
> > +        additionalProperties: false
> > +
> > +$defs:
> > +  qcom-glymur-tlmm-state:
> > +    type: object
> > +    description:
> > +      Pinctrl node's client devices use subnodes for desired pin configuration.
> > +      Client device subnodes use below standard properties.
> > +    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          List of gpio pins affected by the properties specified in this
> > +          subnode.
> > +        items:
> > +          oneOf:
> > +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9])$"

If it's up to 124, then this pattern is incorrect.

> > +            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
> > +        minItems: 1
> > +        maxItems: 36
> > +

-- 
With best wishes
Dmitry

