Return-Path: <linux-arm-msm+bounces-101825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0AtjIEma0WnqLgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 01:10:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2702339CD5B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 01:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6198E3003D1B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 23:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF137342538;
	Sat,  4 Apr 2026 23:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FNdjwAqv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e2X9wq6G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAEC2DECBA
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 23:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775344197; cv=none; b=NGajyDk+xmT0iEn9qP4aIJA2ltORpXd7F2cNBlQWU7Lx2aXo2yfgECTzmijX/ogT0qCmBsCXHGTQifm3uXkuTRi6dd8cjbUL4gpscEmLkgUwgEjrv44d9lp6Nah4ueuciAAE0Jn8XfzqN0mmc76GCL6G+ejeomVQJs1mui9enjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775344197; c=relaxed/simple;
	bh=yINCXZPezpQRjRXbC2fID+SBYn3Q4fpgJBxMZhHsppU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KRBvmt5fvK81gRSghebZra9sFIDtkrQrN2Oa7D24gvtTUy3Vuw/C+pRAcTD5A6FuZyf4NwTj2Rge8Nkknxqb2TyOG4ZseOMVyBAAUD2+FsVToG9cM1EDOXrZdYT6up6mTu2LkXNRS3cR42LjYaL7fYsQglIF5shtYMyHOhdPq3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FNdjwAqv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e2X9wq6G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634ICRaR4057775
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 23:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r/VeTwFFRyvu6ZUF2V1QEPhF
	MDfPfnRtBJNKVU2xZmQ=; b=FNdjwAqvN9I+adb7YdHR5/mir4KjVHccFxSJllN+
	te7rSsBDRy98rz44MRj9RjjuW2soTnrAtJtJalAHKGfD6UJsxryCmVObc8Qi6QFo
	t8zh6E0NXjwxHVG8MumDWJldL7Ka9RK+0ITWCjyMv/een+Y8nPlBJPACVP5TYTBF
	V8lxkFZAUDOBKj/3F7GbPLsr2geNBYukINUwHy6fAMrKMmHfdl+/fmNg0tiJzAfP
	TjR1aWVA994e0MYuqAix5IyjG3lR5wSdzJ2DrL2BJRpdkupbC4wo1GEAc3NA7+b0
	MfGIDbfx7zYFLyqQF6CiojfodmOXrLJNtfFzmjk/9T+Vzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7u9p28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 23:09:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so75970631cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775344195; x=1775948995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r/VeTwFFRyvu6ZUF2V1QEPhFMDfPfnRtBJNKVU2xZmQ=;
        b=e2X9wq6Gm6T0HD6qqgIWyC130/aA1fSgXduWT16N7EfsbdzOGtfshIo2ouHKBBw2/L
         auo/fDtYJgWk6NSCVhItUFuhb3yrcb1LMpV5VpMcEbeblj8vRPYqF9aPHcL7xtbjxQIW
         dUTdelL/6p1skBl2IqQliGRAQu9PeWIhmJIC7al622cLdxRzf3pQZ1+CRIAqlnHUp99x
         0Qy3oFh+sZqJ3JAAL9i+DttomveXfX1Q7Y7FQZ1pRkHWHLdAXaZQ8L7K6CW5REyWG3wt
         OAsE69fXYWu82i5qC5TAJNHJomTq0hhhRgYo6Pyh0tAGq38S9VP8D5pj70F7GeRZAq7J
         uptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775344195; x=1775948995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/VeTwFFRyvu6ZUF2V1QEPhFMDfPfnRtBJNKVU2xZmQ=;
        b=c+MRai/S9v133vxgjNdHwSqXo6zvNv1NOpq35rwj92P9/iV0Sk+gyJx8UfTy43bAjs
         Z7DtaiscBVK+33Yx8dlRXOHhKWxgn6/EUHD0VPSc25kf56oy+qsrMvEssOY//FtEOezN
         5jFTgMyCCzBzdZQGK4UWENGWUjah9kwtAF27mPKOPEYpSfGxdj8m+t+EuLsftcvyZWyZ
         DIveUyGp0gkG14RxAdLYLwqJO6wbU1OGyzmiV87PQXIZQXrxn6n0GXm+ApyyRaJiNrw+
         mprmpDfoT5B31M2pRyAVwzWsvr68MtWMsuhyjr11naYCmogN3/HUQpZBDUHgvVfHxPEl
         lmTA==
X-Forwarded-Encrypted: i=1; AJvYcCWe1tPz5EYBvmrrEsRfAvxhveZgTdkVZUeH/AFMzsGwxrtiao+MfjhLk9C5nQfzRwNK+LsMfS+/meKps4Hz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+dHhXVcUkbvMKgz4BCeR9skAwd/NJ4WaflmC/ibyMsKsvJ/eb
	aF3OtpnrEPEe/FF5wD3RH7nhSelxkwoLcmptmhTTYu9JPmY8dvy6Ycja7bMgMb2OZo/MGJ2PTIJ
	4N8JEwtk3J5QCfgkI2J1taAJnMM2nVKEXpqmURa8gT7DgUSfNrUIEEySKQQqLxdIinkHq
X-Gm-Gg: AeBDievA3anFSBFFLoU/TGoe/nXnH1n/0/GphTa4G9OA+GN/am3sm0ruqrk/r4Ej20K
	WdfgrMPcK0aoXijDd9BWvd0FBCh3FIWS8Gh5IfuO9BOyrq3/65oDBArFga90gZlq8zTyF89ml7T
	Y4T0YEHK3F2ikj109SK2f4nRRutIFeAGdKulMAF2nVlg3L7d79SkgdmYXkpuwR9JJ3YZyjWWZdo
	gllb6wBkwRObRu/svrTh8ZCpg+EhsCABTgYnDWj+LZ34qtc3vflwcDJvBIwzvFsia5lmCnhjp9L
	lZGMY/RX7qQISgV5cjiIP4i9zfhWUhkXuwGiJoYETioSrFtKUG5hZOvGYRCIzm3SyBQ9ZTZmrAT
	KgxxmPgnwdB1j+JdhsVwglUUUDz3qL4rtb1I67tfoGlL8gvgQHaA6xdOQ7xlRSQ8bpNRJbX4JmU
	9pAGaQp4f0y2v0+iEfdAkZqNkxTexR2Iwg/+o=
X-Received: by 2002:a05:622a:7:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50d4faa4f03mr151112331cf.14.1775344195029;
        Sat, 04 Apr 2026 16:09:55 -0700 (PDT)
X-Received: by 2002:a05:622a:7:b0:4ee:1bdb:a547 with SMTP id d75a77b69052e-50d4faa4f03mr151111861cf.14.1775344194624;
        Sat, 04 Apr 2026 16:09:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc60e1sm2321657e87.51.2026.04.04.16.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 16:09:53 -0700 (PDT)
Date: Sun, 5 Apr 2026 02:09:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8650: Correct and complete DP
 address spaces
Message-ID: <3a5fgah7dpyc2jvcsccnhfwl3oakrd2mkyxrpa2rpg63ew27rm@3xuaz3t2n3am>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
 <20260402-dts-qcom-display-regs-v1-5-daa54ab448a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-dts-qcom-display-regs-v1-5-daa54ab448a3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIyMCBTYWx0ZWRfX9psvn333/c3z
 I8flIdLmbgHV27Q+bwCe51jBnzmK5jpR4f1OzzbZvZcUEXP3UR4oS5qwSNZ7VMIOerZA5ZE63re
 vmG/hlbG5RqZowyXXyW5fU5fgsZzbdua9JKoTSamuRQ2aTuVRtqY2Sr5Spq4neu/uSguQOaZLFm
 /g8kZbjOeW3UwnprqB7/nVGcqTmbjDTT5TeP9L2+WDsj1XOEHzLc2onE1YHynNIcW3DA60aHek6
 JySVUdAJuQRFcjfdqfqdEoror7bhUm1vDzd4XHCfCEZ+42sbA3CVlfImn91NrJBgFJRz+vEWXZe
 e0aeouDi47fABFfKcrIfnnfQi4kAms3DSP66vFT8055BqI+hxtNnKRu4aKr5gkuxI0NfYMa88Vi
 FiQ/5cszrABaKE7nNT4SDZEMW50BAHj4NM6fCdsPNjV7w73ciTVOwNgZZomfP1Es0yctX2TotNX
 rUYYNKOimTSRuStmZ1Q==
X-Proofpoint-GUID: eh_s0ddGlAc_HTkklHt2BvgPt5iMVCIV
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d19a43 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=EqZgH2Tm9vfPv3d_J88A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: eh_s0ddGlAc_HTkklHt2BvgPt5iMVCIV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040220
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
	TAGGED_FROM(0.00)[bounces-101825-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 2702339CD5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 01:45:16PM +0200, Krzysztof Kozlowski wrote:
> DisplayPort block on Qualcomm SM8650 has few too short address space
> ranges and misses four more spaces.  Complete the hardware description,
> which in the future might be important for full feature support.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> dtbs_check success depends on the binding change (first commit).
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

