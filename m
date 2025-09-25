Return-Path: <linux-arm-msm+bounces-75194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA04BA16E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 22:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA5C83A5864
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 20:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E15E320CD8;
	Thu, 25 Sep 2025 20:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXUzJHpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AB44204E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 20:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758833515; cv=none; b=JFsZUMDL/IK4ARTVXIe0YRh0p1oJh8fd7TioqIUFMKZCyj1j/x1bG+URUUDwr/dXEr27wtAQ834W2vyaCl+E4ztAFIQkfsr/JXz0QuUZT+1sF1TBWNLkMKjGmcaRQiGOSQ2Tc4vRg/tIrZDmny5nzHYtg2R1VRcv5d4CqulFOkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758833515; c=relaxed/simple;
	bh=60h+PvBhk9ZCE1dSaYvz/x8//Zfi4LUenDLYPEMUE7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtjN89cy98rFrILOyrYmpLzObe+oRfx45rAwdZ6fo1iBEorLemTWcqqkkrFSFFJV5tHcWFo1lBw7bGKBasdOUYmHCux9OS1+tjXJuBJFz/PU5sWlUf6khIqyPaN2/Ac7AmoGLe64JccaG/KfKvP/U9QmhYL/lxdqH/KBL9iJWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXUzJHpY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPle4027784
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 20:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B1RTyPEbqMfs/M5EeZCCAWjw
	5x88kEh2vuNN32oz2GY=; b=FXUzJHpYu348w/mgaXf8/0uvnYFcbJEqSliTBTPt
	zTGCstM0WZVIM7M8GrsGavu+lwOCgZ/RF0wpVXNtVOT5x+r7/DEdr71Par6LH1Gh
	wKnwwtqE6YlVQ5A2LBbUaivNBJ/RMNq03Cn7ci2B/wK092g/UovboP903xs4Du+r
	K1v6KOiz0OvuvGVoYoHHTwiHSXjUU4VDbmTFSHTAihcks3Ly9BR4Yu2ksZ+SPp0v
	vrXw7MMUHizrjugYAkjEyWVBsYldc91QbYbqYPE5JyTayRa3fESYAyTzpz60J/xy
	rNFin6fnuwYKPWnqaWk+ml3DbqIl5q90wFYbde4byiqMIw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q0bxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 20:51:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b60d5eca3aso44211001cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 13:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758833512; x=1759438312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1RTyPEbqMfs/M5EeZCCAWjw5x88kEh2vuNN32oz2GY=;
        b=b9fOyQlgRUy4nRUTLNsU0AVfkZVu6CZK4IhYI04Oj/VV1LQs65KqrdMA+auPBuR2OU
         g6/dsB1TK9SgGS8OFqWanl60qkud7WvHp+SfulrWMl1ZdzMNJ8KCG47/uP5rsbZJ5RPl
         894+eqoR0Gq3HsdmRfDaeSYuxO6pI130VlkSLEJLfMmxxfA3EXEBTOg8XcA43AlTndRX
         W4naRQu/VMcrdFxXWpClK/5cACFzKmOtkHUeRZKbeuOK6Ndsf06l9zbrxvqLCVZu88y0
         ksLiaVMaZSxQFC8y/5He0CHNAAZgYVNK264vy8xJP/8AVLwKTAnwxdQA7KfhG0STLLbu
         03eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8ySbYEWtqCdjH98B1crETYehyq7C+x0laaln/VelpnSD389WWvHaJk4w79nJL9OsRSLoxEAdRnKJC/St8@vger.kernel.org
X-Gm-Message-State: AOJu0YzAInrYIjtKDZ91NWsWPG3AEH71yqyhybBhW7bISupyEERpqXkq
	urUR9Pl2impFhrmPmEzsD6q2ccH+utkZGdbGcI/EjVpFUowembz8BR9kURjnLruhaoPayXNmXC8
	LCI+aqg+wPXbOYOza4X5RBQtYSYsc/mneYsRoRxUAwbOrNRcA1p+XephOeMgNS4IPwTKI
X-Gm-Gg: ASbGncuqUiLE7SPaGtJ0gK0W30zdiQyJByG3cvsZs1C+2qOLCmlonEzMthfBNFUxxTt
	1/17fxYGey9+10li0FedcULVOpcMzxTcy06UIPntAvSNHD3DYOk6tPiB/qeAstfg+ib/ccgoIkT
	dqz6lP7UNSXVPF+jzFpLcILwpy+1xHyC2xqRgTXw0LuxbcAbK+z+N3PfuxmhKK2b/GNWm5kqUqj
	aIyqbAbNgwLo+xjr614qvdbs+1kbKIojTP0tiWC4H7g4mb+0QhtpDUkH/r/q12u/2r0F98jgV3l
	lx2lgAaHf6kmXDqOV2hcXdRP5IPMAywyztU4VNwOM7yjUdxJI3Buxytxx9WD+PG6y6jwttOXSEB
	YF4eTeWqlbOHHn5I5En/L8rMASk2ZvaMtK5f4vZkyJ/tBm4O+mvTh
X-Received: by 2002:a05:622a:14:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4da4cb59235mr61629711cf.58.1758833511673;
        Thu, 25 Sep 2025 13:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKR5yjoppC91j/VvrgzF8NVXXjanhDCZEwgkr9/7TQbyr8UNZPPV3fhtTNkrc+EffTq5DWqw==
X-Received: by 2002:a05:622a:14:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4da4cb59235mr61629311cf.58.1758833511042;
        Thu, 25 Sep 2025 13:51:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58316a31e48sm1076929e87.110.2025.09.25.13.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 13:51:48 -0700 (PDT)
Date: Thu, 25 Sep 2025 23:51:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/8] dt-bindings: display: panel-simple-dsi: Remove
 Samsung S6E3FC2 compatible
Message-ID: <mdgdqm4qurstamxyt4nvkrabf2k57sf6so7qp7plmhtpqh4qtk@vohj4ofwhyt7>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-2-9293016768f7@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-2-9293016768f7@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7qtYTRnQK3h9
 OE/YFVnfuxBLIZ31x7x4O0HBAE6ElDfTwK3ohe8ekZcL7Aq+4GWShBOvfudZ0yueyCcFIeaRKTP
 qsXuMgMTvqYkdYGkLvXUdQDwrNxKARXsZStvg8tIzk0QGaqdXE0vC+R0PmF4uN3G8E+kRMqb5vy
 gI8PoaVkkcIw+hlVyS2ZWYDYT6CrqJYIq1HGFFgAFzuUxK1cRLJsyAsDexawTVYJYd1lXlnq/yc
 wjiLsxCx/x0MyclBQRgrcwI2XD0lAFo73wAJC3hVt+hfE8GHAtg4N3+2T5kpxvBosCUTPIkkyzP
 aSIVH6VaIpMtHZb6wJrX36whZeYWcqh/sBbwsh5+W85ZhkZq39iVYJLrxq4OvvIgGWDwEcO27pL
 3zH0RRAP9hXesf3o1SMUeZv1eqmEcw==
X-Proofpoint-GUID: VG8vntOiTUrAiSNMsT5Kmiu_B2MUIZFE
X-Proofpoint-ORIG-GUID: VG8vntOiTUrAiSNMsT5Kmiu_B2MUIZFE
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d5ab69 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=RREAxZkodCCEBgaENwQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 11:12:48AM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Follow up commit introduce the proper device tree definition for the DDIC.

And the reason being?

> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index 9b92a05791ccf99061ab7a1e01937bb832a96fe6..6c1249a224c8a170b33fd3f331f985f16914cb2c 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -56,8 +56,6 @@ properties:
>        - panasonic,vvx10f034n00
>          # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
>        - samsung,s6e3fa7-ams559nk06
> -        # Samsung s6e3fc2x01 1080x2340 AMOLED panel
> -      - samsung,s6e3fc2x01
>          # Samsung sofef00 1080x2280 AMOLED panel
>        - samsung,sofef00
>          # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
> 
> -- 
> 2.51.0
> 
> 

-- 
With best wishes
Dmitry

