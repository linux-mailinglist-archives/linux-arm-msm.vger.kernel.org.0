Return-Path: <linux-arm-msm+bounces-101909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKGdHqwF02kmdQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 03:00:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA23A0F4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 03:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB49830056F9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 01:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D091EE01A;
	Mon,  6 Apr 2026 01:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUkUmJ0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M6s0ZJq8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179FD2045AD
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Apr 2026 01:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775437219; cv=none; b=miOmq7PT3sRn3uOyAe8Y7DjaSJWyvIBYvCrU3UmsCWxHpan/gAoPzaCPyZDRPSm/3cnImYFtjNOwDM04rB3ifIfWH4dP3X7ArKv5iw7xpRdzlvybHabMHkvAc7uP9GnorBO2a6iqAYqt2eVH+57RnaekokjLDdMTArSVU9qkFsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775437219; c=relaxed/simple;
	bh=nKSD+rDb2HuVHLMljKNHX0Rpivy8lz6cvCHGTmKA0so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkjn90Hf3B42iMJlFh2MfzsLnPBKmAKcpHxSDjKgQyLWdHETR0ktR2qwdRxlaPglLGpOjaVf1ryPXLWiYlJYlfFKdP02vCtQZjIvMrK9WpPlLUksGcoPyF1EIjejsGYl1zP0xSIPh6q+TF+uv6+CY6kTBsxglWE5JFxwQ/TovLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUkUmJ0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M6s0ZJq8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635KnXkK2446987
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Apr 2026 01:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cZxF5REp94u5kL1p8dA+O2An
	Kkpz1KjKI2JPT67f56A=; b=KUkUmJ0p6LzrJN1Tex3g4B+6KhmAgpEes9/Gfedn
	xyqTJmMTh7E5aPVxY02iyLEf++ONsI2w7plI+C2IbojBqMYOCpwxEtBP22IuoOqv
	Y1J71FgGkDGSkRKq6tH/zmBdKBEHmNwDw+yKBlGURkgo/ZKCSAvO6+n89WpppkNe
	xqQM/EDgjQTH17K2bWA0LVmzZhSl5+HXQlVNnxL3MkAbXz3i+y3CxiIJendfGpVC
	Vlpy0wrdQ8d0izFHtwRkBGLGGCpZPAF77rV74w8fiq/RGDHB45LHQZoQGlMzU+kh
	188pGDUxqV5ZLPmCJl/FFq8XwMtJEb2hX4TMqeUf7yJD9g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfkq7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 01:00:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8a117472792so52336236d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Apr 2026 18:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775437216; x=1776042016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cZxF5REp94u5kL1p8dA+O2AnKkpz1KjKI2JPT67f56A=;
        b=M6s0ZJq8mAw6dFfsGESLkivAQvnRIXftnYOmGB7tooOMONxDuvugxkWS9kF8iHkcxF
         wS2PZbE8OPr+WHo71idfrwSxDHNBfoUk2wIOvp08Q/LIHXpsXJ+g2zJjk/k1Rzm2iw2T
         p89E1OhynJJbzp9d7fmHrUV6+KOAnYpjdpp+t9Siho3TiUoIMqDppOKG7zCu5RjDqCFC
         SQgMhlu5t4RGdfBIT+XmP5/9xga2Zbw40D4AHPEsosQi0JAuswHgjV4G0a2H8xf7SQkD
         78kPAE3/6x4Y8Mui+BajaYyZdKbSQQl5fdW7IWQ6c0b13KdPgo6QX9wy+PVsFy+cf+qs
         U8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775437216; x=1776042016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZxF5REp94u5kL1p8dA+O2AnKkpz1KjKI2JPT67f56A=;
        b=Tjz3/1N59EPm1OwOQlRINxkfRukjxuOWQFKen10aJ5sK4O5N401WWe2kpyrdjQeA9A
         drvBczbsb03Kug6f2SdsgWHt99OZS7HcJzx29k7//vqvPCObuPB1l1PqJzcPfFzxBCiD
         yRQijBCDwD4NqHAMHTKnEMQcOsi9PHU6dpklEAnM3KAVW7iTlTVr0YMG6awvywgWq7Ke
         oS3q6Gd4q0viTdG8rdNGASKH/AipM2w0iCnmiF1AIjRxuq2I1IA2gJ1j05PxLrFRcMqS
         i0PO6J0iVP9KTEvo6Ix4k9UflByTN0GddiKtATRHLOt2geuEq4HzsL9k5/KigXvp9SdK
         PSTg==
X-Forwarded-Encrypted: i=1; AJvYcCVUQClaUimx/L8XGbLKoInzouJ6dDl+jX34YAxg6oa1ZwBe+nhk1Gj7Yy6lf+uHPuTSbmga2jajvs7VdbuS@vger.kernel.org
X-Gm-Message-State: AOJu0YyVgvA8+C2oCcHQCpBvCH7Sz896Cbcig2wFdjTG5yAohfaV7Pni
	RNMp8B7yO4UxWSYzk+WD+VhejuKJN8NX37E+pDQhF64Jy05G4cMCWzFqKgDYp8J+ubD2AavxLmZ
	14zKpzC70afxYRBnP+e1FS09hw4ZEjjwl9yiv6SxcyyNiL8gkcLqjUxL2DUEYRROpStaS
X-Gm-Gg: AeBDietm/fMR81Jj0aeF8GC433BqNQ0FBuO1+roSLJE6mtZk6MDoLQzY0ofvgI2o8Kq
	sGuHQqEE0VChv/6MKFvjLjd0/riNzW3QpMDaiZaVG1wSWUz0ZRfPn/PyM+b4Y5bGnbgxt2EJ7lI
	PXVyW6gnqQoNFRBBa3ueR3sousub1w5+ccN4YWldFuWFXW3O6crXMGRRWAqW744Y2idPVuH6Hx7
	3zC8qn8bPb0bnUUT74CCc47168+esB4sUto6wgy4BEGto7U+UfR/9fY9olxyszBPiXbQEpjG245
	W970VUCXbudIzTX/Ul/92cwgKMy9quxhc4fXO/XGNEG81abHQ125mB6l1JJP8odeVy6XpyUTgyV
	Ry39H7DHgqI536/Q7mUgfhdJD4gUmktmlgFftq/Wsqn85zQQioxPIDGD5cOFIuP19yi7LOl2u22
	dul9C/heRiBMlxEkSA/UMW0nc1kFCsB1TUkik=
X-Received: by 2002:a05:622a:14c8:b0:50b:48a6:6ba4 with SMTP id d75a77b69052e-50d62b349b4mr159032561cf.48.1775437216409;
        Sun, 05 Apr 2026 18:00:16 -0700 (PDT)
X-Received: by 2002:a05:622a:14c8:b0:50b:48a6:6ba4 with SMTP id d75a77b69052e-50d62b349b4mr159031701cf.48.1775437215710;
        Sun, 05 Apr 2026 18:00:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5fa7sm2983778e87.45.2026.04.05.18.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 18:00:13 -0700 (PDT)
Date: Mon, 6 Apr 2026 04:00:10 +0300
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
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm8750: Correct DPU VBIF
 address space size
Message-ID: <qudsx5dveuuwhkdkm6akfe77hkchejjttph5f5r7kyldi7icnr@cnnfs4emy4ii>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-8-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405-dts-qcom-display-regs-v2-8-34f4024c65dc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDAwNyBTYWx0ZWRfXwxjOuwxzp3D2
 wNK0kmrZZi402wepmFtn3YwJwA1JwR6Na9ZnYvKqkidvSJWBNEGm707atEUoO8iFbudrcV/tbnW
 O9zYAdWdMQ2nGdjCtQnR3urnPs/AiTxOgndwJjhpN82JvFcp8zjrc0dirnYBCoATzWiEnwlBrxo
 yUwzVC6EIznXPGFXsWEvr4pp5RJhoeK4X6PKuh56qRzcrv3puWw0p3iKZyAV4o/TsRclJHxxHU7
 5a0MpvJJFDs6LQ3MsQ4vEEp7j3RvAx4cfx/Egm7KO5tW2iARf1lgr9vEr0lZ5fgdvjGI7OHyFUi
 swPvinoTLf6ugDn1iZjF8fc+nhP6ncSqy5R8phHXydWHx3Ldu8NMG82xvZKDa7kVBrKzKrC0INw
 l+okQ3dg8CA1qlsF1aAh9RbAs+inluluf/WQphzTY7c7EGAHgLHnAfGAsNOGJ6IpnLJQx3IRc6g
 Damk/bxVW+v00N7p0IQ==
X-Proofpoint-ORIG-GUID: FgNZEAyM7e_X2fZXGrG0PHtMKf316ykK
X-Proofpoint-GUID: FgNZEAyM7e_X2fZXGrG0PHtMKf316ykK
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d305a1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=fzqTxgmSy3qf8bfLeY0A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_08,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060007
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101909-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C9AA23A0F4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 04:34:04PM +0200, Krzysztof Kozlowski wrote:
> VBIF register range is 0x3000 long, so correct the code even though
> missing part seems without practical impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

