Return-Path: <linux-arm-msm+bounces-84863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0D7CB1D91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 05:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 49EAC301D77D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 04:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050F623C8AE;
	Wed, 10 Dec 2025 04:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLNkKbDK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGDR3mlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7212079DA
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339231; cv=none; b=UFTn/RJqC85lTYoJUyVekkmiUUNoZotph7bu/fttMR/El2B4eSaRYn0k8PsrcFyxx7NLSKBopA+TCj8jgugvyH8U9X86ExIL33pmToYtRSIvUblHuAqpuqAXWwrAzih+r1xYPf7qqLRxT+fQU6ohenDJYBjsD3xn2DS7+yZgrAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339231; c=relaxed/simple;
	bh=k6u1C8Qj3YHkNv034/IKfYniHPKbmkjXD6jqdtosiRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaUVsjPIWAO7ZMjxHMfxBeDpY8seK3GHzAOy2FqNQ0M9H9WeWORwVbuGebwok9UqmIZ8cw9sKe531P/cxiL9oJT4tg/K8BzJ2WI1/foIF5Ce/TYixiOs61KZ3E7CEIj19R1tsMR7n8aTaRIy1YDb09k1FKGN0p6pCChe2L+VimU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLNkKbDK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGDR3mlF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LM052095202
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6numdDDWlOF4BEoGQaJktoTO
	bWSx4NQ6AWfsAvI5qTE=; b=fLNkKbDKcPDCwsl547vCG16XT8vWJAx/DHewJIkC
	fF00JaEC4Ywf0H6ksO1/2vxoOr5Dug1biqsM+PPoNFTPI92Vb95/LOuWfF3gLcy8
	x+9XHeHMRNoVFXpTHwnP7S6WFonEUcC3rjvBZfWnx7+xKhwtSEJxiiE4Cmjm8VwQ
	C2WtWns3DmG/ro+UNlPmEDG03CXc4WpoCDqZDrzg5qjHkMJYNryfnGN0lDMQ+ASc
	cfeqI3Ax6c2JXoLEF3ysIsIAQ41EVxdK16YsMCCyk4D14B8gpp8NTxvt75ZRbL37
	gjdOs1QBg4p7xY8ap2/TlVt3aXveE85br/sQK9+XKrjn2Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqu59wd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:00:29 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9375f8d5f1cso3397907241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 20:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765339228; x=1765944028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6numdDDWlOF4BEoGQaJktoTObWSx4NQ6AWfsAvI5qTE=;
        b=NGDR3mlFpy1logJ/JjIO3yN6iSUb/JCl6hhIUKfersicltbivxBX+eh6Qdhl5lOlEA
         T82P/7gV16pTSfptvuGrJo87onEM6IX13DJ92wUhlFyQ1FtifQeQUQwMQQ6oYlj5Us7v
         UbyhvUPx4iXmZk2h+BTew6kaHDFvLKRPXVhQovV65TcaymVLOr7HrjGOqC2NuBeBVpEL
         V23sE14HW5PGbRN+cSzFyEL+rFFpnhca0zWehTeMwBINAeSXzECaHfKZZMNOcSuDAznj
         BO6gSIEgK7k8EdVqDv93BYNSVEfmMRcZvTwW5PT/ZHR1aI6lbwN3h7LGXaMekkhNHDK8
         r5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339228; x=1765944028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6numdDDWlOF4BEoGQaJktoTObWSx4NQ6AWfsAvI5qTE=;
        b=IshMFWxfwdCdAJhjLMkeGA/FZcqVz85ccvjEuGR/c/DR5+35KKcmThTcPl3ZQNzo7x
         EGhLQR7+IYQM3Ne2EOi+WH7jaWkeDkIAztpiFdckCERA61bbAhBhiokxJgzJCCMnC3y0
         F6C0wUSl6b2EMtF55NeXW/YFaj8CPRYgCghy0gFppNplhcUNEYP35TlxQklsBRMvHzf8
         q4KUrF0YCBKVKhdKCTFw8uY7RTP6O3D6eBAQST5UFykZ0UxpSng4ZZxkgnSq7yJ6Rh1J
         9PnXVlXJH4m+0vC8pnifOrn3x+f/tVP6MlsqiMU4cTwHx/zkYJVZL2752Q+n4+wDokh+
         xASQ==
X-Forwarded-Encrypted: i=1; AJvYcCWetQ8RJg//wh8g4Rh3csYBBjv9baaXBEF8dg1Zijc12U+hTzJ513TRIcjdsr4ZsTeKI+muBnLl7ORFdB/z@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJC+Gqx43Iw4YEwXmARqthy1XmC+Mhfax7YOA2rUzi5o4hGI4
	n114c1UFYAHEjz6G9igMYv8XySjX8uaDAjU0ISKxBA4/I0DdtwtrFLZ/zW61IsQt0BqjCcUNTEP
	VpGi8ozw58RcS/GXsY00nfpsP/oEIJguB+ZE/7Gdxld9tyeOyVxuzWVKyKUrqANrLk04T
X-Gm-Gg: AY/fxX54WF6R1M1EUsw999ujNGENM27L7qE4yeMdEW1OnNqaB/Cc3RXOqVevRJoPsMu
	y/B/wfM6/lfwB497WNfFABwk43zcOqDho/rgxSGwecG+D6vp/BJOUzqA5LE44mUuv8GSV2YvtWa
	+fZ8ybn46ZX8Ct8t0IXpQL6TOSUsKUDtzbH7Z1WJBytKwyb0iaptUHBVcFmYuQgYq0Ei1cRdKQR
	VTpWrEvmpBLnGrHS7zCrbmr2VlP3XAv0uu576uA01PvYfwfh2bYoCstWfpbI4PVa+R4Yj0Z5Cbc
	Xk2W0vE3yMaEqXRNdf7OmXYz++2nCjnUk7mQuD72vr0jjhlmh9tKOD5Prq3IHr5HpGULNrOYkXt
	LHzz/JhX+qOWwStePpYgew4q6+kW9pQTnVvgb+9M4X7oh6NTW1yQWorK0xFjeqPPGSOuhhIt/SV
	1e4D3rKu2tFhW0CnUQhw+S4Es=
X-Received: by 2002:a05:6122:8286:b0:552:2c5a:c057 with SMTP id 71dfb90a1353d-55fcfc1369amr338183e0c.13.1765339228565;
        Tue, 09 Dec 2025 20:00:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjTjEp1NQ8eIsuOt0q0tQ1yjMV7eA0kBY/m32fSx6Pcjv+vj2YCZ6S/QaxPkjRnXLROkpk6w==
X-Received: by 2002:a05:6122:8286:b0:552:2c5a:c057 with SMTP id 71dfb90a1353d-55fcfc1369amr338178e0c.13.1765339228116;
        Tue, 09 Dec 2025 20:00:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37faa888507sm10765051fa.28.2025.12.09.20.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:00:27 -0800 (PST)
Date: Wed, 10 Dec 2025 06:00:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v4 8/9] arm64: dts: qcom: Add initial Milos dtsi
Message-ID: <bv2ojys2zgnd7bx4e6yunyjewqtkobxanpzd63bxrus6373vru@r7rsfbeh46cj>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-8-b05fddd8b45c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-sm7635-fp6-initial-v4-8-b05fddd8b45c@fairphone.com>
X-Proofpoint-GUID: Pegx-W1TINjwpbEwF_b-UIG-vdgp2mSi
X-Authority-Analysis: v=2.4 cv=Y7/1cxeN c=1 sm=1 tr=0 ts=6938f05d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WSIVeowOIUgBBEAWWbIA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: Pegx-W1TINjwpbEwF_b-UIG-vdgp2mSi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzMiBTYWx0ZWRfX00+hJaFXQOfN
 uqIma32rQWz2+/Mn+k1mGrbBazolNG72BX+ofLi0U8deQVz53E95EZTZm4uM0Ets7sBu4onZZAi
 hDVoV9PbkujnSl7+wmgpnRS5f91/vGPBRZPWXA9I4bnWF/Mk3jUfVIej/qP1u/HqM2RXpSvxoNV
 bkNBC0W+g+Y/bIg7Ee34x0oFDt2PqM9ZGb6k4NNPKDoh8UAv5aNgoZqkAz9RWUZ9hVK+j1/uH+x
 wDmzGYrwK7zsFNic1E42FwIs5VL6q3KppyBz7dSUiqmKjYXFI9224TZCBCXWVWihzw+nMQgdIYP
 ky/mg4IHhQTHqgVXd9uV3wGyM//YEB2cfWu3nBLgq+AG+VHAZK5+iBkXNjVOsVHWNW53fCfAqeu
 jqdwaSdi9kL4ofBpRJPAoZTgBGkBWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100032

On Wed, Dec 10, 2025 at 10:43:32AM +0900, Luca Weiss wrote:
> Add a devicetree description for the Milos SoC, which is for example
> Snapdragon 7s Gen 3 (SM7635).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 2633 +++++++++++++++++++++++++++++++++++
>  1 file changed, 2633 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

