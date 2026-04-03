Return-Path: <linux-arm-msm+bounces-101720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EfxAisW0GmV3AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:34:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7013397B0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 21:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26A2C300D758
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 19:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2F53D6491;
	Fri,  3 Apr 2026 19:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UGrO3P2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMPEYHoi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97F3D6CD0
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 19:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244826; cv=none; b=Mb7XbYlNuT/fT9VztXZotf5B8tD4kOaO54uBxo75WjP92E8x/NU2UsRIlSTQVuwJN92EyBJzdzagqyz5tjUogk1uZyFvME+pVW+mspmdNbHGdny8gIziJdBw1y8yaHBnTPbJCgv4geJvK8RnMDAKrGOr/aP1ChIEJtHHeYXxlTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244826; c=relaxed/simple;
	bh=IYipVv7qJiP2BZHkGsUK0L4UYMsBOF1i0tnR9r1ULJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W79YCH0eFyHma9TK6AUo/zWjHbaBwixz//MjDSZnefBgl96CF2ajBsSjxnZ2cfUiA0B8f4/e+TUtHzkQCMNafiWBhaPgEqgTWrQgbd8tcgYPbJ3lGPOUDnMnsm529FYnyQs1HUbm9PgcHmz2TJpxErpWh6v51hFThdkIqJWqzVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UGrO3P2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMPEYHoi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633EY5lY141947
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 19:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kZPUYs+b0mIU/ZhiroF9fq7z
	487yqQRqJHomPd4ooAg=; b=UGrO3P2r+r6lREb9nTHGY86LsAJi2v4vtUNIMr+P
	B83GBLnqnrEcPWhG8Xcjsxrs4u8qfhnziqy11jB7RZz+JnjhojA6HNaUriShUPi6
	pdpSnIF/NkXyzVRhNZ6YKCuFwT8fxy8JaUmUW3UUBjLvQdfdWY6OiS+wd1pmK/8H
	hhE98VOTkyPMSB2DZRdxQx5LX68pUOMOHAzL2YyOZmktBE7AGoog/hs2Ft+jsULi
	fGO2KxrAuhmJf4p45rvOA/Gm1zl6lHehaBfVK09D1mD3jDhexKB9erLJ2EpeMvN8
	iPFQxeB2Mdlmx1Dj7MwkxpFW63yzAaEgCq4q8dfoTZqQkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da83y25cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 19:33:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so38328901cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244823; x=1775849623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZPUYs+b0mIU/ZhiroF9fq7z487yqQRqJHomPd4ooAg=;
        b=GMPEYHoiwl0XyGd9B47Ar7lB4lM8jLXKpR4tEo3USdcCJxiUpIZC/Vu0sGB5R7bQlv
         wranQwq9nw5CxHgFz1Pn3gdyCYr0ZcRq5J36srUIQ17TKXv13VIB+H/mgFRHf1yqJ+XV
         GPHhO9djAfUFA4TyplucupepKAQ6mdG7fMq+JTD7EJ1TM5lBzIJER2f9L54vOvGTttWb
         QyXdm7iHeC2gGOsxUsSPaNNcHCAV8YaLRxso9zCcD9lSz6Yy+KFwSJvON93gIWDCT9mH
         MqHnd8nqsUEC8FuAQI4i8J5QDSN8d/ohtjBhkmUswRoKf0V0Vjl5XyOVDi/pq9gsxetG
         dr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244823; x=1775849623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZPUYs+b0mIU/ZhiroF9fq7z487yqQRqJHomPd4ooAg=;
        b=CMcS1TGAbyqIwXHZBEGf9a574/OOSAaGn34V8EEZCaTFwC7N4kXer0DeWzEL8zKWfS
         4bPArG97wiP+/mFc81wpyUgZ8MuOoyhbkwGJA4LbOmiQe9346n7fLgY6ySEZ+FGNeKV2
         icV4blAE+YxqISpmgjW5znn9BH2whMWC01VhGmWYOA4ZbOekT0Rk8EArhtOJP4Vp5NkI
         PKAnOqj6S/f6mLU+qbHcKkn/m5NkP10qvr5pvgI8JIDwzbKOv4ckEWY7HE70rLimr6km
         NDTpBO5BgqvLSDjvSW4Mia06QNxD+76GFwchV9iJ2rQ2A1WKNlghyHE/TlI+sUR5OPyK
         azsw==
X-Forwarded-Encrypted: i=1; AJvYcCUPisCTX9BETrVwwC0r8pL5JsiZXFIjILrOYor7BdjQJqZ7oNKh2nU57n4sxHMK1o1vlWLkYmous+ApkGae@vger.kernel.org
X-Gm-Message-State: AOJu0YyTJxDzTBJfihJlTvn+4YVnUFz8ZZOv+f1sY4K6OXd8ix7hJ8Lg
	aLpke8xcZwqEdT6YWwJ+2l0s1I8n+HFhXMRDgbhDsQlHVAzLSh63/bKrneuHl74PjQcT+WLsUow
	AnVpAEgNi3QponvwmKyxkWa+CdH5ng9ld7FkGRk5QLL2el3sCxV+OLYcHZg2oD4+rFlB1
X-Gm-Gg: ATEYQzzJ+3TIQL6F5c5xQmG5htBDu1aNr+zqZqlquFoHsFACWG+KMacHmMCrWxkp8Iu
	ZDZL8TeloNW/Jf5ZlBvV6k1XOSQMPtuy7OxtbYTzsa5pujI8VRE+daTk+HIlM8RZou7uRqwzHwa
	MsVN9yyeqBst1JuWzPereTMA1psCtHGYSdnBcmyhYDSYgCNYppSE7XzTGK4HIANtAC7776GRLDg
	4UWBjv2AfpB5jFFTp5MOSZsnW3FH7LfmeUzMYl/cE7INEnK7gx0yk84V8A1Z0J+m8UbNCqQA2h6
	oefDKT3t26xDEsnQNDKgNHtck4VDApUXy+n2ySRHrsNExw40/NFJ0Tcm5dRLTuZsCzhjrWtf2Oj
	3ieaCRyUaz9jnpMZbcxIt6kkfx/o9uMPfwILg+OG76lgHunt0Xw89b6OfAxISFGQW3G+2rSZDYU
	5j+BGLgptG1nXGftrO6NdFOBVXkrtGak6nJHo=
X-Received: by 2002:ac8:7d94:0:b0:509:1766:2f4f with SMTP id d75a77b69052e-50d62b24652mr60694571cf.54.1775244822837;
        Fri, 03 Apr 2026 12:33:42 -0700 (PDT)
X-Received: by 2002:ac8:7d94:0:b0:509:1766:2f4f with SMTP id d75a77b69052e-50d62b24652mr60694071cf.54.1775244822363;
        Fri, 03 Apr 2026 12:33:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd37b3sm1627417e87.78.2026.04.03.12.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:33:41 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:33:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
Message-ID: <cwhd2tcs3asdxqcjspq6sqefx4srixgkje37hf4fylc24glqey@nkxctkq32hwn>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ar6/yCZV c=1 sm=1 tr=0 ts=69d01617 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=NEyQqhXCQXLKNWlO9YcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: ys6U2HMAABO18PkO7mq095KAeeq4ZTjf
X-Proofpoint-GUID: ys6U2HMAABO18PkO7mq095KAeeq4ZTjf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3NCBTYWx0ZWRfX6AaIpn4v4/yM
 tZPu7BW3BGRfRSJj3/UiKzFsmUxx9PhjJ2IJzNzib5EOb4JuoF7v45tT9DoMRuse53hLeuPwfWs
 Yhc53YIGcRWTYWTzXIvt+PIjgf0Jn/0SUBs4LpnL4oYLgzHzWsIA5XQFrPKxDMK5+38LmUEz1eF
 lfTNvH9/PMn85M+mt8CW8oQujWrrhJxmPvY7+JFEJb6BtH6g1W7fgUBKMIZOpIWqU8fSrUliW/k
 y6sFPoa8EyAEyafxCItW5sP9CB0NT2W2X49NCDMPXYLUHybHMHsKuP5HDCOc/TZ3FgyOxlERUxl
 PIzgraN+j+pLXl1Ed/HytlafZpL2Bjp8Lr2Cs1yAnjEzgMoiGTM8A4ikHBlSEjoCWVU3jL1Uq+H
 AARzCbwvbskkBjIBOmCvyRnPNV6blQWG5o3Gc04YU4kdkHnBPtvM8zOSnHiaakISi/yx/GPaM1M
 3Lkt4SeUJ4/Jo4D9ZhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030174
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101720-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net,lists.sr.ht,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E7013397B0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:52:52PM +0200, Luca Weiss wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> 'clocks' to the PMU node to make Bluetooth work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>  1 file changed, 174 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

