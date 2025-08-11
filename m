Return-Path: <linux-arm-msm+bounces-68308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DC8B2055D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28C518A2089
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFCB1B0F19;
	Mon, 11 Aug 2025 10:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxd7ThhG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6917F7263F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908275; cv=none; b=k4O1JPoF+AQz1SjBmABkl0S89rsxaJa4NWpECSRMdvOjs0nEmMH39S+xy8SlKFCpi4i53zrwP2BfjUWWCH/LE6AjTcfDQFl+LCD3rbGu8DcF7h2Vo8XQuPY69T9oC28AzBEd3ryxO4vlvrhv/i7MiiBXX117D0Dl+jXBG2PW6Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908275; c=relaxed/simple;
	bh=TmbORZlcCKPc40wFUS1pF0fgoG26pzs8CG8rViTLwDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pD5W1U0xiGhfN6lHbwOOasMXFf0M12Y6KdctZDwLoTs8eoX+UFLLYoI9nv0HOcoeFb36DE9u1SDx0H5WBJE2+tNYRm0HlMi3FXyPXF9c1swtS35TdFXrKiEVfbG/MAv2zdfpO+qL1DhkDGvJV7VkQ4F5CsTec0xYB38Mx2zr/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxd7ThhG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dABR013094
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/ucSKnN0VabkHBeCyUPOOAp0
	1IU9Td+bmPEMlaDwwOU=; b=nxd7ThhG8UiO8u4+aSNd9NxDhUvou3BAn+kuDkqC
	0g12KNcGvPLBzZnLa922+aQAbCjy1re5GA0N2LweBkFOLRA+D8uL/VfU3tYcp05c
	MVYswdGvFgzsWqtoWc90iiEXIOHc2EOv7V2sEd0ekyqZQiohlxdbKUAdzWgib9SS
	dT96BvYp3AopY15+Xc64JZgnvcudlWTfSJzFvPSDrLbMD06Zp6y9IqlbdiBaRdxB
	xvpbFvtoFJuFPhFmy22IsFXejAVmNxgtkLd5hw6Ilu4ccGPcecZAlprtTxcdwVPS
	Yvs61NKR1WVjdbsB8Wm0jz+TrDKP9OGP1NN7OyfQjOeJHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmm576-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:31:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b08898f776so106832791cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908271; x=1755513071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ucSKnN0VabkHBeCyUPOOAp01IU9Td+bmPEMlaDwwOU=;
        b=o7PxSdY3vuvfoKMcAaAVL7sx79v+v68OpZdLvwI3ApGB0qJNlzYV8YshxM4B0t61cq
         881UQfLNMG7guN8ON/zVN3mY+C/c5xCTFa75W6HJe8Bb6F8PYZVkTuQ3qiaLF04mhCTz
         KhQOjqv9znOzT+eNWuyPvjwY3gWUTFHOPmBYZBrv8uv9XjPZNXzigX8hGIhCZABPcAuf
         X97QW414lckbIjkvQ2INGtD6YGJlu7AAH6poMFiIrgmuQDsJ+2M989R/9bNDCQ1FLlmE
         /Da411zn/yytime7tvq8Fux2J3CfAeqjBfcpiZU9birN7lL8d5eHm/orx20h72TICiez
         0/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCW32V9V0eHUiBhFadPacvnLZ0SQ5aT1h+1MvUxJKqVJoiZXvjMXzTY4lWLciSOFPAYiSynaePbOX96CMZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyCKQHR1tZd+1WnO/SjYaIkI82voTDahNdw23IFZzQds2T8gD4C
	oTHX3tAG+9IcMUFVJb0zEEJIZh16mDksXg0OATBkq32/jLYVzZm+kMAleXffINjJO5po8v6jESk
	W2UhHEqFvPQ5oZSdrKjwv4qv9+qf6nu/ufmnrTrijKFoj1NErjipx0WXDwceNmwHR1Psq
X-Gm-Gg: ASbGncs4n5X2adMLMjm0QqlK2Vab0HIC6HCWRXejvUhLKViN6vO/oUmjpeRP51oFFTZ
	RG7o1O6V6VwhL0ad2bedpZFR22yRWUJd+CcgK3vBfZmATKOHzpIcV+k2cZflz8tRENZXWvrz71I
	6vYVdPtHj0InIswzJy+1camnFwm52CoXma35PxZDQ06dwp5ALzjsmtDdYEfnll2tpAIF7btGicV
	3FuCexxGPbafX+SMyT/Ds5IwC4hK4Rr1gp6vzFAYt5Ee16ATI9xyYz3poH1L7CGP9OXhcAVCAa+
	0Cm6N1f0DnOlCARYrjd76L2okqkSr3oHTlpVppVPZJNzFkAgoUqh3rHfpSMn1j9csnPKbmgMzjc
	SwsPqofj5nKTtPRUY39MmW4I541LdP9mjCpwsKudOxduQ9k9PEwsv
X-Received: by 2002:ac8:5956:0:b0:4b0:7581:4dbf with SMTP id d75a77b69052e-4b0aec7e670mr172487711cf.18.1754908271521;
        Mon, 11 Aug 2025 03:31:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcBbTdZISUt9SKxmEFAT76YcvHLLyKJL2uxyoSRdkuIyPT1U4jZXtxIgMb19xtPh+M9uOHug==
X-Received: by 2002:ac8:5956:0:b0:4b0:7581:4dbf with SMTP id d75a77b69052e-4b0aec7e670mr172487341cf.18.1754908271099;
        Mon, 11 Aug 2025 03:31:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88caf0ebsm4214962e87.154.2025.08.11.03.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:31:10 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:31:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] drm/msm/dsi_phy_14nm: convert from round_rate()
 to determine_rate()
Message-ID: <23yejfrhz3qmi67r63ni7zawmpsawrb3jzn37r4h75s2ax5gki@6ngyqpqlqdez>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
 <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-2-0fd1f7979c83@redhat.com>
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6899c670 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: I2gdgllCTUgjxsT3YvvUuCfl0cYZHSKo
X-Proofpoint-ORIG-GUID: I2gdgllCTUgjxsT3YvvUuCfl0cYZHSKo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfXz+5CMTPZZK/S
 cPQRWtPnHNaBdGFD/PN2uwZAc1rUyNxX3cBX0i/oTA2+0QvfbW6lZ8gFH7KVggCsJSPfJCSkU34
 5EUxIqCSIcgr9leOYbLai3nl82L8Uwfor1TPd22UDb4TROSTHnhHXVaevspTb1MFA5YqtD8MTVU
 UU6qmw5OlFl25+MZXkRhgVcSYbNdX2fzAASsfisbe7NEwinDcByvDTdNOhMrfMeB4JvThKI2ZnF
 bixQTM8l9KhL7aQc48yWqHxgf/yZyXuvGIF4ObimoUMRZsW0IS3uD1wFrZu2KfkPKEekLnmwKN6
 iVny9OUqJW3RJkG2mv3btAp+OiaNVEiSq/AUKR9kNyPOFlz7cRlV+vXs7PCP62AEr41b9SOAOBt
 nJKUhYkr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

On Sun, Aug 10, 2025 at 06:57:26PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series. The change to use clamp_t() was
> done manually.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 34 +++++++++++++++---------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

