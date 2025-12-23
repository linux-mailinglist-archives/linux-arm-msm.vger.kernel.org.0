Return-Path: <linux-arm-msm+bounces-86431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 925A0CDABAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 23:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2BB7F3027DB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 22:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D53313537;
	Tue, 23 Dec 2025 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YFd29TVw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I87AxJ1+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013E7313277
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766527654; cv=none; b=S+xJOez9agOStkNDp+IvTDJ79y8jy7P5dILeK5typ7sUHfYh+oEb/wtMqzK4mIJ02i7Kmxz34w+vuwJbtOKaW4scM6shxN5GIZojGBaskN7fd5CnzJumK97xzHDKlWgTh27TUUgCXyPdpHu8vhPf6rK4ridJZW5xJwNkN7WTOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766527654; c=relaxed/simple;
	bh=kJ6A9Z6HvMZEUHbr7Q7XTfu57spQyEQe0OVGolSuK7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kfwmrmsjv+KaJqAp7DMmbFzHNPmuq0Nk4PRZoqNmn/s6DpvxPT8AKA0x1mkMSQOomnJ2BlOM5Lcza8b2882i3/PVOW0k3yZ39nCN/Tml2uG1kq8mtyEzBTg0n+G5FhmwD+XgofNmauhGxaa+MnBawih9K8M7sYkwerZfN0I5Xsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YFd29TVw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I87AxJ1+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNG8pN02747324
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LQuCfX8+rEyo1RCxaU925wq+
	S7hu1DiBkGOsodIaURU=; b=YFd29TVwTeNuJGTXNIMgMtmLe6Q8yt1q3nzThlPX
	8GDNoKAz9oXMTbACn2bUDLys4zoOHi8KUVVOQ9gBysj8r4kpnvbpGuOp4jnTULQZ
	Kx5IKj4mquEUcJ36ap83/BUDFZmn/JOKVUUjaVCG+CYYTNkHiaBDNibThNKpn1Dz
	nTEZnVihR1VgdEzxulRgVgtUtgKY95xLCTlKw0lqBo7g7aFIw4qTxiFeCl+ZpjpC
	5m/wDdJT9jEElJOQ7IHOuPTitYUza/opO6/TRBbYSeeVmepmK6caj6XBM3oGYTpJ
	2vS0mk14lqKk96/WWCYJwP1ATNSSyt7VbOxD4SiqsMvCSQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5curnk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 22:07:31 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5dfc0924912so3347940137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 14:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766527650; x=1767132450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LQuCfX8+rEyo1RCxaU925wq+S7hu1DiBkGOsodIaURU=;
        b=I87AxJ1+dOrDg/imcZuxA5eDg2LDRd1QYtIsrcpeecTcRhkBf/o4O26uaP+ALCc0nm
         Me/XHiReYGA2cF+3t/xP/ssl6UsUPU9+EMfnUAVL3jRuniqZviEjyY0pNf124GiNaA99
         7EeXhICi9/EH76uGP/zB8OFwaoBsS9fqenmavPVmC9S7X7Whjfgr7y2f7XkHyZqy7WN5
         2WTEJ19IyVhT1+h0IC6KBFlXL00E84L+fGj77Q8ztvbMLdVUY3t9X0XzQkQdLjsJLVeb
         +OJO/qXcpmqU2PR2zE9SkuVhGi+UYfZ+fOV+Aj1GJ3MfPDehb0E9WnrvhcbdcCJa2xhk
         JBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766527650; x=1767132450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQuCfX8+rEyo1RCxaU925wq+S7hu1DiBkGOsodIaURU=;
        b=OfpC5FVqfUYLmuficb45Dvk/QKbTefyKuQaR2bGOATmoKxrnxUCVhQXH2Mk5HNnPEs
         d46t9lLJAu4G7p8vWJfs4uwMOyKvHKWzq4kwkWovV6ReuwyUo115ZDvNy0cl3p0wkOKf
         K824UB1mDfiGh0Id3Pw3kTz2HY9roGkDm4f6ZG/KogJ3ryaOa2aof3d8RSqu1DYeAeoa
         mSJebFDF7F6neT8F13CQwgRvyzVWiDsQpGr2tmjVbq+EHI2GMNaSRAn0ELFwNPxRsWqY
         bGUxuqdX+vy+WeJKtEZZhQns5tYZjImNzXHCCfY1SuYzNTpjHCeXtlosn6WYNU1FSqmj
         A1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVBXpdEgndH5QB0oednrYjDQkMS+qKYQEyAB/bMtlB8W4ID/tahChehfqsw+DdXl7c0JZl5eEQ1YNvAmBGu@vger.kernel.org
X-Gm-Message-State: AOJu0YxcOc4Ka7GmUeNwyt7W38Ce3QZ9mde61Phc/xtPFnSSK4Sze/tw
	Od8siSwJAqP0VLM7iAKSmvxAZ8CRJzUDP7DNilgbfJMu5Buvc6P98N6iMMVFImH7r1jdFUdKDdl
	sW7eRBICO+IXyaWUaOm/JYATIGLiKqSkIKHheFEC78n/vXWhHyg8NZMX3Oh4HEAueW4Gm
X-Gm-Gg: AY/fxX7NZfdWiRu0JOvukIVfs+qox/GG2mqW9bh7TPFuoiM28VY1FvM25Ofn6s/zV55
	YCw+v6qp37zRuMkMVsrsKQ0I1Z4ivNmcR1XRtz+5Bv9XegYA4iUIj2Y5r577sn+i69hckJ4S5Hq
	jvtvEJC49LoFmRo5s7veiFzd+d9j/GmymrEzNpq0+4PIf4CnD5Vn+yLt0TH0IZ8cxfn9dz4Gfav
	1R3iDbDm1qEpiLqLqzTMWMIHwKnfkiUw4d12aB+X3eBiGzDsTn8x0+QMqLEKxxq4V9P7WSTDcWv
	EdHaXJ6xUM21Kca8ngrLC7t/iPSVk15aC8pm7wEfxXAIkIHBn1s9XAnlGkp4EJsqpS+uLjhOqsn
	KOnupe7tNuBjQb6tyXjzOiU1XGBwLkWh19DNP3asdYdhMA791SYv8vBVyLifOxZLogQFIleUtg7
	um6v05gs6YDWNNnlMkQkVwEGk=
X-Received: by 2002:a05:6102:f0d:b0:5e4:9555:8968 with SMTP id ada2fe7eead31-5eb1a7ff4dfmr4609665137.29.1766527650060;
        Tue, 23 Dec 2025 14:07:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu+G5dBnDuhFvzI2rn5XiaQBY0vWWn4SzQu+3LHZShFfiM4GYL5ET6iXeBx4NgKCbF+3iVrQ==
X-Received: by 2002:a05:6102:f0d:b0:5e4:9555:8968 with SMTP id ada2fe7eead31-5eb1a7ff4dfmr4609654137.29.1766527649584;
        Tue, 23 Dec 2025 14:07:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812267b184sm36534601fa.43.2025.12.23.14.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 14:07:28 -0800 (PST)
Date: Wed, 24 Dec 2025 00:07:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845-oneplus: Update firmware
 paths
Message-ID: <vif3wnb5zbfsz6hpy3fcesiuav2hcc2cwflnzxjk67ysfiuwfj@sktqfukjjuog>
References: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
 <20251222-oneplus6-new-fw-path-v1-1-a2d366f9eb89@ixit.cz>
 <a8cc09c0-6acd-409a-a907-c3809b4f4db3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8cc09c0-6acd-409a-a907-c3809b4f4db3@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE4NSBTYWx0ZWRfXwPgrgAY6sE6d
 3zqNnMKH3AeitfINzzny/uuNeDgy030fQtWqmYvwA0umpqyBqLNvgyiG5Xs/6OPCN9vGOXvlUOs
 oeMhp9F0jVoo86svID9jaz2e6qOBiGMgkCtxLLmonFL215ebsl8ctzUUSJgneCq1sQYxcEgeQLA
 L6NtmvMd+f4WdNHYOSVuMOAsvmOVjDFJP1OVrG+E/C9SBL0ffpW/sttT9dMvHpnEDygjArQkYyK
 11JrVqXcW8RhbbEkrNIlQ6cIYBb85uvX32cca7QNRx+Yiw8FBwcnawvM06ohH6PoymGAnApAz5D
 GGeOzWvLakV54C5jH0A+IYxvYGp1jKfoH+7znvg6rsrRw6muyseGb2yibSI/iOPb09uc2z7kSig
 7fJJYObGUV8iOlsKiBpS+1dM+Bx14OkLckEyBdjm7C1f9QAYzyFnI6Tf2Po8ljM2ULF9FdyvaN/
 c3lj5Vb0zyKQ5zz80qQ==
X-Proofpoint-ORIG-GUID: fZ5tKtdDOoNVE3wbyEkrLRn6PwMLCYMt
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694b12a3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=P4tgLtp6-QdJW8cC12YA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: fZ5tKtdDOoNVE3wbyEkrLRn6PwMLCYMt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230185

On Tue, Dec 23, 2025 at 01:01:42AM +0530, Akhil P Oommen wrote:
> On 12/23/2025 12:35 AM, David Heidelberg via B4 Relay wrote:
> > From: David Heidelberg <david@ixit.cz>
> > 
> > Conform to the new firmware path scheme.
> > Includes cosmetic cleanups.
> > 
> > Signed-off-by: David Heidelberg <david@ixit.cz>
> > ---
> >  .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 23 ++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > index db6dd04c51bb5..f1c63794db979 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> > @@ -181,8 +181,9 @@ panel_vddi_poc_1p8: panel-vddi-poc-regulator {
> >  };
> >  
> >  &adsp_pas {
> > +	firmware-name = "qcom/sdm845/OnePlus/enchilada/adsp.mbn";
> > +
> >  	status = "okay";
> > -	firmware-name = "qcom/sdm845/oneplus6/adsp.mbn";
> >  };
> >  
> >  &apps_rsc {
> > @@ -353,8 +354,9 @@ vreg_s3c_0p6: smps3 {
> >  };
> >  
> >  &cdsp_pas {
> > +	firmware-name = "qcom/sdm845/OnePlus/enchilada/cdsp.mbn";
> > +
> >  	status = "okay";
> > -	firmware-name = "qcom/sdm845/oneplus6/cdsp.mbn";
> >  };
> >  
> >  &gcc {
> > @@ -370,7 +372,7 @@ &gpu {
> >  };
> >  
> >  &gpu_zap_shader {
> > -	firmware-name = "qcom/sdm845/oneplus6/a630_zap.mbn";
> > +	firmware-name = "qcom/sdm845/OnePlus/enchilada/a630_zap.mbn";
> 
> I believe this is considered as breaking backward compatibility. How
> about creating a symlink in linux-firmware instead.

OnePlus is not supported in linux-firmware.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

