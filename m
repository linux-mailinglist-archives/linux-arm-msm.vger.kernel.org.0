Return-Path: <linux-arm-msm+bounces-100883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBAcMgjGymmL/wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:50:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B835FF78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 20:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CC07B300BE22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805213DFC6A;
	Mon, 30 Mar 2026 18:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBt+Qo/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekGBAoY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE133DF017
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896642; cv=none; b=L/meQU3X6ynU71FwquVxTWUnz/jPxSLQTTLnlJwU3yiTBADSk7+qpYO6A65zPby3Niqt2ZKrj8a2WJGV3islfW3BB9HjFAhYPYE5uJB2gnfVXdOj5/mfKOebdpY9D7yGCPTiZeG6R5KjGh/Am1TsLl8c2JyqmUXrU2qnx5lXZ9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896642; c=relaxed/simple;
	bh=aLwIKh+N+N4xy8vnPz2VLHgag2upnEV/MBsHXSFhf9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxKu9CfrbhgVolWO9v7o08sovS+MDmUBnnXagQF1DMbs1jUodhdeKBEy6FZVz3xz6zLvhWQM5nCTh42Vrk0raFdUDmq5acdpqwX+Cjtmb3CmJvnj/at12VxPiK+a5MGJboJ6bC/a6vc8jVOS/rbIfzexjT5HTnjQBkSiCs6RLhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBt+Qo/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekGBAoY1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UHv7ks703759
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DE8Sw5kR9lGM4C3h602YOoTU
	pOjpbxDUO0a5++U3Gu0=; b=cBt+Qo/ExYBETSAhLuOmZVN0aPscA8YEqFre4PXg
	/hkz1of2A/QmjdxQK3B+xCXZOpaS1quq79IWwI+vQjA/dEGlz/+LRIVG8uGbmsEq
	3f/eB67dUSGUvgt8WkDQTOnK3SSzrEPh1odpOaFOCTw3I+CQcsi1ASSnwL76GpKg
	3KQz5WYh8Bb93fyBEHWJAU1MLUxwK/0Ew6UFDyG3Vd/2xbRSdyisPTZ2RWRoBXiY
	GaOBKHMDk845WDvlgvYQyiJCz6MWXL2M8uYE3yO03lDoVNoFkMeonF1qFiBGsX3O
	j8NpQeB/2aoahZJUGAyI1RbYLLOYklb16Ud9jl6Z1XsnOQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sansgne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 18:50:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so156907271cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896639; x=1775501439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DE8Sw5kR9lGM4C3h602YOoTUpOjpbxDUO0a5++U3Gu0=;
        b=ekGBAoY15TOSCB0NApcTbT7fP3yhoUwLRk82Tq/5T57TPr6aBc1UtM7VAUx/smvURw
         qcr+CIeo69e8CQhGC+gZFdvtdpsx2SP79K3GYCmwzx37q4K/OzpaCOrrJFWSvd/XyxF2
         i6hpH1TiD/dfUuFFyQg+J3SxZKCcaB6mnSZnG9BhPUr1ihTY98SUsBu0Uh79xKHo1ix4
         /1ZAhOO/z6UKrZl/jQX701Wa39QMtMjZCGm4/R6dITlqChPHwKiRZTP80JI4rPZ/bqgK
         hvJ3mb8PzSFm7+V6MJvE/IzGvCLlA9svzKhAM/1SNKjuXTvBslEawkEdSa/0NCMxVfzB
         D14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896639; x=1775501439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DE8Sw5kR9lGM4C3h602YOoTUpOjpbxDUO0a5++U3Gu0=;
        b=s1+1HUwGfzEhE0OrSER/iR+RMHuSi0gbWGxMj58f8fxguqyHIuC28KxoFRHKas0UJB
         YxGaFPpzrho0zcg8b0m/V3Fs2TpMAesilDMCNJiXiknmioawSWQE62o5QpfldXEZ8lHG
         sQ5GZgqxlp1NIr+Yr2hUDihH2Pg4LCS95q8+d3GmoYBib2qwypv2/8uxca6DEefpKnDq
         iBadZrmfCO8XuNYNJToSV8QyTbHc5SKNMT28HFXUoSwdGtU1gcqQNOW9Yz7hfEtV8dzs
         v2POi0IEVcGyhOtcF/E7i66kv+Ah/xPdsrgIQdit6G/0yIIEAqgcX3sNXkxzy5aFR1bn
         eEng==
X-Forwarded-Encrypted: i=1; AJvYcCX+ESs8JGLDd4GGFOpPMTHs3Qq4mQCXgCfIURx9ypVkERtA2vM/M9ZymET/NXB0sfUkMYyDqwm7arzaX/7z@vger.kernel.org
X-Gm-Message-State: AOJu0YycN4L8kKnS6tIa2O06kGke+PISqN7ZpNdacJ5now88F/f/fxs6
	7B6gx4+Co/tX9U1NsF/zBH6yQJtYbeiTirFiq/RcmHBEAzmcXXC1YOXgpVL11OEbWTHUOJIms3t
	WbIY7Z8k+kmmkkRwLsM81scoZyFQEiwvDy7YqL6kX9giXvPLXUm8lTsjmB4MKRWJM2+J5
X-Gm-Gg: ATEYQzzuzkAsDfsVKplYXjqK5Ct6TcvUY5H8l24M5I+IfI/k7tQPWSGe3ua5yrGnZBO
	LKVB+1jfLVFkkxP1UxTckKP8P42Vc3VovYa1/aJox4RkYv1rzzz0lyIJnNo3+jQopxXabkfEEFa
	ewUDB4y/tDlUpN9QaLCdA6A+1wNsHaIfwZsa2QY3X5Q3pjrMCVjD/+zwht2ZBvyMz7WGSqXr9pK
	3dL1LTRqoaSYz1jP+wusPKCHQwCc9XlPUCAqRHu3J1AfK/l9d332slLJz2hzd6fmgMxTNGI+Wb7
	nGka5z5IEbMyEDB6rYI+QKApx5vL9IePqjhSuKsrjHOTUvg+5J8n5+2aYs0OD5lPhZjQJgtl/MH
	cRqg6zy3Q5TAsc6I9Ro11Riy0DV8w2phXlvyFce9snxPzsPo+pjOXt8Ur7gh7a3SzUbw9Kp10lH
	H/5+raAeuCuyNoY+YDR7tqFoIaacpeSx4p4Tc=
X-Received: by 2002:ac8:5d05:0:b0:509:2053:ab5a with SMTP id d75a77b69052e-50ba39803eemr172246811cf.57.1774896639557;
        Mon, 30 Mar 2026 11:50:39 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:509:2053:ab5a with SMTP id d75a77b69052e-50ba39803eemr172246411cf.57.1774896638998;
        Mon, 30 Mar 2026 11:50:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4329sm1828151e87.3.2026.03.30.11.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:50:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:50:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: display/msm: qcm2290-mdss: Fix missing
 ranges in example
Message-ID: <wsf7oet6r7d55i7f6cdwgor4cqu3hzgqcv3r6lmyfsoivzgzls@v5z7bbea6fxe>
References: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
 <177488647743.633011.6769674149013868210.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177488647743.633011.6769674149013868210.b4-ty@kernel.org>
X-Proofpoint-GUID: 4BM1sN4RkcyJEovPcdvJAQ0jdg6dGjnJ
X-Proofpoint-ORIG-GUID: 4BM1sN4RkcyJEovPcdvJAQ0jdg6dGjnJ
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69cac600 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=q8DrNbCZZteTo-H5dVoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NyBTYWx0ZWRfXyReetouqXKxZ
 pehQwBcbd0Fg7wfcU1bxiVdQvBDMTfdnglsbab0NXeaNHR/fkJeCLtFRYjR+u1xPzOVybyPMBIr
 DcIWEi5MTgOgbDB53+NPvQ4Ez2/0UxotcRvnIrQat8LeL04hmck7/B7fv1474RXirm1gd28xJee
 q2U5NO0LBoAjCvC4oSRBdYRxbA0tl5fNm+fvHRDjDl3BUMVsZ0Cz4oiYs73/caqFQtm1gnCg4dK
 t7hnJNv3Mev5biyHJiia7VGGUzHJbtb23GuBj3/FpPjfumPOp4J2uP9Ha/l4NPB5ae/wCXuBU4u
 YOkNAV5fHD7ldX0eeEDWYlXhD3KPhcrALuOhvInTYiGAtUTI/QoWjDP5xTRJjm2EyDupguUPgWl
 ErYNlP4DTRqh69+gHiKBv9LURGP90K7myp08199o4HWOOVLtZ/Zo+Ee3nK9qbeGlNnlQwAOBiw8
 PvmJ+3sWD4lVZPcRSMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300157
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-100883-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C40B835FF78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 11:01:21AM -0500, Bjorn Andersson wrote:
> 
> On Wed, 25 Mar 2026 13:22:10 +0100, Krzysztof Kozlowski wrote:
> > Device node has children with MMIO addressing, so must have ranges:
> > 
> >   msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000 (qcom,qcm2290-mdss): 'ranges' is a required property
> > 
> > 
> 
> Applied, thanks!
> 
> [1/1] dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example
>       commit: 88bdac5443e5269bb39c4968d5ee0becbffe3f82

Hmm? I don't really mind, but...

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

-- 
With best wishes
Dmitry

