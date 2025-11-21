Return-Path: <linux-arm-msm+bounces-82841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4956FC7903F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 13:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 858684ED36A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5D729E11E;
	Fri, 21 Nov 2025 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="efq8rV3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIXNYtlq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BEF23D7D8
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763727516; cv=none; b=Zu4LvOqda/DpFqwFoMRlqTp+iD749525udmWjgWiUd17x6XaL6Jc+dkipv3mTDfJXE1rcQQW1Qx1FEYUM76pyKlXC/1zFHb/QqIJznR3jA+9Tgr9SVBGQLD6Qur27+paHa3io4WhBgGKHeQBT39OtEvCyt4Oyo3uADsKaTmdI9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763727516; c=relaxed/simple;
	bh=Fg9RYwyeXN4OVmn3Wj443VX32ntNEs0MGPqRpxXDkfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TGWx8RICKYEflx8KFM4kcCB6FkyukZ6zaRKvZHrRHmrc5Kd9fkKAy7KsWOgTEJ+m/X802wcKq3qpkl/ZmDEUlHsTrPEyXhI1SMZ4/x2GMPENVVWjQS7SoeUgYFWFkWN5KW+aUkehXLWTNmahwgyFJQhl3RUUbRGajOryRJKAwWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=efq8rV3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIXNYtlq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL7cBMO1390827
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vOSrtt+w9WeFGMDtQdTtVsJl
	b2CwJFszneImKkYc5Z0=; b=efq8rV3xDbHBtLTQ7OweIS+4oADGfv/yqAoVzgwX
	Qugmja+fdjyprQXNEX3/GZSxAZ7ojM3uHHq25Wkz3Yj0U6Uq892VBr9ETSVYrbw6
	NNiipQS63BiPXBV5QtGZSAXSeuc4l7rh/VyGYwcE0iSrSLKTBgi5XLhPgD0aOqAX
	HV3lh3BWqiUcS0WtPFz387rkIJxCnrPlvXQcNRFVXvDPysWrCQqqCI6Pqzm1O9+I
	IlOVMu76A6m6byegylgRFVWORozdE+VzlIJFtS02OIYpFJT3gHML+IqNucE8R5k6
	yfUdVjjmeOcKaC8x71bGhmD4+DmXS7oB2kTIFlBOUF0aEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajb532ehv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:18:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b17194d321so245821185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 04:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763727511; x=1764332311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOSrtt+w9WeFGMDtQdTtVsJlb2CwJFszneImKkYc5Z0=;
        b=XIXNYtlq8gvvToQCh61W4vOPKYQeQq2AEnvVy0Zehsg9ir0DrJhAdh9yqYbcWxadBP
         7U0a1bson50zf4nsPeEA9qR8JUfNoR5bAMzZvFyIcYQg4y1tb4AdRTUeBCI3gVfoh4R8
         9lm/GDUHg3oXho7T121eNTbn44c0DT75OWSadRGMuaphpfg3OTIinhuUBY1JtBAjmfpw
         ehs2SP6qq20xXxJ3MOR144Kfirvsmv8rV/Q5mtrj2TeYgmTKbEH4eGJXba3to9nSaeLB
         +vxNa1WwERd0wTwnvLcqwGie1GkgKCdXc7uCz422329izfFNq3HkW4/Vyx4HMXxrlxcq
         XkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763727511; x=1764332311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOSrtt+w9WeFGMDtQdTtVsJlb2CwJFszneImKkYc5Z0=;
        b=srxrM8uaxTVCgl24MmLjxu/COV6Bz5GX5Ty+NFArXvaEj2b1LzNdrfxcZiwXRlKaC+
         bNDpO5Cs2fo3my0Jb6/wV6E8xYKbhVLt1h81Z/6YLgBVdfUMt2QMdnWIR12fcpxmn/Wi
         sgujCtyp7R+wHPuf5IVZMYlKrR9m2q22HQX9duM1Gz28vi7I4t8AHneoNDLwQuKEnG7f
         +efdRK/8aStpb/cEhEdl+KeohK5PlOsNzCE8b7rxxK1Z9yvan/waDyU4k93PLOs1h3gF
         Gc4fuVMXYCBJGLShQTNJmCHG6fUOzbZDet5GH6eblwvw8vByveQLqexahIFjX8K4AA/d
         ZvSA==
X-Forwarded-Encrypted: i=1; AJvYcCXYF5FdiftmXYvlXIlLENQiY1he/ZnRRXg73PW5FAvppXq/2wI5HwOkS6WK/jvLTI9HzS8W0rfTjYkmgnsn@vger.kernel.org
X-Gm-Message-State: AOJu0YzURkm7GXaFD0rv0a8hZV103zOyFOPB2i5JApM4cMpbW2/bBnkI
	Z+uUYw55NGHAoBJ1Z0/NQWCqjHH1bXU0Ti/MlAyn9wHZq2szKe+id8LHP0bGovTwuuchTzOGcA8
	vzaqAoSjdEdmPeNuUBdpIhleB7EUj32iyE0Z74FKxcM7d0LH3E8o4DXbQ5NsOBVW27pZV
X-Gm-Gg: ASbGncvCPTFJBM2Qee3j1WXP/F3OAESF/khgrTBHVDfr8B/4E6yAhGuy/zN9+DN7aSy
	V+nSpaN1HAiGeI+lNe0bzeYy0I9cSVjddkGmeD9tDaHRP4/T3BCkkjFiMNzKOYPBX9eyFbbProT
	znCnW3Ee23islCw+ke3JVez/rIVXqvhY/S1Tq4Ke/cJGf0T+xB9y/j1/HEFdjVVyy//szllhnrb
	DM8k2j2q5wz0bfIT5qvrSrQ03/gmsAWxLaJ2cWgUFGAst8BU6/1/IzVLLzwMifujbPnm6Eu1CIV
	ZCYrBLprjvO8YFo5+QrV9sacx75GefFycaeoe5G+OxGBNnNzbaBbrqhJxOvGaLO5kbS03LlkOOA
	eBZMlgod0UMuMfCy+9vSkGI6+ecGPDptNn26vEnVhJ7Ky9xz9NIoISanNWpaLp9UEcutDVFW5Yo
	Oh5Fcd06LjkNzhRl6+DMIKbO4=
X-Received: by 2002:a05:620a:19a9:b0:8a3:4887:227d with SMTP id af79cd13be357-8b33d1c4edcmr209666885a.5.1763727510897;
        Fri, 21 Nov 2025 04:18:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8VNb5N42yJ3DzHNO0jfJOWhbRrrQ59fMcXPkDlK12aOqkwZJFT2CXcNLs65mZKUQ//YAwxQ==
X-Received: by 2002:a05:620a:19a9:b0:8a3:4887:227d with SMTP id af79cd13be357-8b33d1c4edcmr209662285a.5.1763727510283;
        Fri, 21 Nov 2025 04:18:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6bcb813sm10604411fa.45.2025.11.21.04.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 04:18:29 -0800 (PST)
Date: Fri, 21 Nov 2025 14:18:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
Message-ID: <6ezhxrlisey2oooq2ukso3rutieryyxd4ynqke5em4cmd7yk67@bhjhznefpml3>
References: <10Ud2nacNpGLxEZdFk2VE6I40JkFU8f1S0lGFZayvkwiPgffhyV-gY3p_-AnMAAMckWDMVO__50mkrCB6NnyVg==@protonmail.internalid>
 <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
 <9c1afc08-e584-48a5-808d-16711c4ecd4a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c1afc08-e584-48a5-808d-16711c4ecd4a@kernel.org>
X-Proofpoint-GUID: AwAIbUwo3cdclCeQ2jP5XxNC11Gni1LX
X-Proofpoint-ORIG-GUID: AwAIbUwo3cdclCeQ2jP5XxNC11Gni1LX
X-Authority-Analysis: v=2.4 cv=Wugm8Nfv c=1 sm=1 tr=0 ts=6920589a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=02E4nJLxmT5TmznLg_sA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA5MiBTYWx0ZWRfX2TRceSdWrcu2
 gAmMVmHiJsQrfhHpatastArbVByQ9pRv+zbafy7F8JO6epRUsCLjsvu4//7kEFRDwBHTCaViREd
 soHgDhCdozkzWEJjYhBZfqyBzYQnfWVLdKfZnl7TkehYbw/6lh9tq2dfjdV6JJVBnmUXY5MSebK
 l3fAB5jhr1YvyS3y3tV0CAhtW7+mL9kzW+tvuulhVbmg1hQmK2YyZHmhvpJ1MChnnVkkBDryWUH
 SdQNtecfww7iCRQXCZ0kqoTzZR1nJQ+Wd8oFSLRaWIYha+sUS9i0h6UVBGJMCvy+ZdGFXqIhUMu
 Wy/HmhqCwd0blotRMDhy5fGOgB+7flxGm8CDN+Jwb7xOyLeGYC0h0OeaHcHpOaTdAUt/KW6bKp7
 BxeKTNox/tQUD7NZM2RoVfksvw+phQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210092

On Thu, Nov 20, 2025 at 09:58:18AM +0000, Bryan O'Donoghue wrote:
> On 19/11/2025 15:18, Dmitry Baryshkov wrote:
> > With the Iris and Venus driver having more or less feature parity for
> > "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> > switch. Use Iris by default for SM8250 and SC7280, the platforms which
> > are supported by both drivers, and use Venus only if Iris is not
> > compiled at all. Use IS_ENABLED to strip out the code and data
> > structures which are used by the disabled platforms.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > Note: then intention is to land this in 6.20, which might let us to
> > start dropping those platforms from the Venus driver in 6.21+.
> In principal this seems fine. I think we should have a metrics as opposed to
> vibes based criteria for the drop though i.e. an analysis of encoder/decoder
> features supported and test comparators to show either nop or benefit from
> the switch.

Agreed

-- 
With best wishes
Dmitry

