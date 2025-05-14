Return-Path: <linux-arm-msm+bounces-57944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0586AB74D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18BA68C5151
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B496289E03;
	Wed, 14 May 2025 18:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4leXMfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E85289820
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 18:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248840; cv=none; b=Y1+ljxhX1QNZhVsMtM6Td8BAirKNcwa/Npx88EBts6hS5B6amzNLYqbf0Pv2v7PGRhGdTurupvlrqTMaaoTWTsSlDLgt/kzSBi7ReiWs4Z8CUgrMGHUL+5OzWDquHlSQRygIV3/mTfnYhKWOAxGnSLHBFqp+5Ew86J1et2qFekk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248840; c=relaxed/simple;
	bh=pd5HZoQHlfDB83SHAm/UE0bw/g9vPOihPEKI0JSdAGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xl5Q9E6DaKPiv7h1VOOl96BOGzC8C7J0PL/bDsuSxkk0mQ/Xvea51xYH+dAqzkic2xZJFqA9+gvYRvwk9m8aQLoKmOTOSxx68vEwpe/1822yBaLYhLQh+py03wQondBvieKYZPUQq0BabX51ui08ePMF1ggJAcNpiUTGtr/nKUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4leXMfm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuxJp025457
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 18:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ukxaKAPGH9v83qxSoj+fTaY4
	WP0wtg7rtq1LrdGLlCI=; b=k4leXMfmKShYvUlRWlIAcHT6vvYmO+3MgDw9kMV3
	c0ujduf2W8AonT6GcQq7WIahWFnYu3nuKqkGxuHSlX21zFzQghNI67UgGkte0Izb
	2uIhnBFDYb9Txqk/i5DA8ZDYeH5I9aooNAR7xdkiU8kfl6gconGyijzHzB0fgle7
	Bs/NJKQsaSt2Y72SH0AbJB45F0hAoY2YO0wy4fTYuvZ7fmbnzNbaC56Cpp9j5sBA
	v5JiJS5mFo6B/nm8WKbhy94CdE6ZFle3D9blunpkPqP7kYlsIuNF2JnL55+b/Lgt
	RUZQzZKjbCbhiguBsVPI+XL+oBam7TlSijMpN6qmzL4vGw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew3ps5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 18:53:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so12733585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 11:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248836; x=1747853636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukxaKAPGH9v83qxSoj+fTaY4WP0wtg7rtq1LrdGLlCI=;
        b=oUDXMjgUcuJbkYeo3uG4qkatx+0QPLLYGABaeGjiUC+xMyiojy6m7iLhZNUVdOtOTO
         JI0ta6lYig6MwFwhLnuOEmAn6elmE94/BDLD4n5Zvy8fr0v+yrrzsPEVKN/cazafTwwK
         WT7Tve7RYe9E+Y9b7KAJuSzpL3bEKIfq+ienJbG1EnOjGsHUTB9EA3Fo4bJXXaP/NfGC
         idL1LhHQZyCJ8aQ2XlzWKjKXnukIwceW3ZgWCv7CslmkajVioOiF0RsUphn27N0MXBRX
         mtsMyhuoIz9cT6M7dvVWLt3lEwnEurjkTe7sEbDb0noR6igWuutiM9QhfQEikhMkIwHG
         WzZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmQPDMYYDv63wtL5swsfpjdHO1HffIgW3W6JiOJR4Ca61r7IUj6pRfQ4Q4L052DFQ9F6CdaV9Dxm4b/wJW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1gR5ef3NMsU4Z7OEhtwl1nNCZlTOQTjct7UTuw+4km0XEMUlp
	TW2soA20DGG072XfVEmC6kyQfe/5QCHDpN4y/oMgvCpYWfgr1qdESzuR0dEOSYKaecy6PJcX0mF
	RozI+r6uKo3eWSFil1gYB/Da0LSS02BR6Zr1nL57Hz4sNF/KubTTEll5nE7o421pt
X-Gm-Gg: ASbGncshbpY0ORYqWJuqlFSXciLwMH0rgAhmpXFirCi3czRFOP3G3qjd4ckzBkohl24
	G6isPVzNa/SG1Njdq4b6aOlQB66FRHjxP/K0Y6uxSC4Nxg1glYq94VoZLukexQRfyweBI5GiGf1
	ktXYcqMeUXRve/z1kt9h1mpv5QPozxAOgYW7JWd0ofTfh9AqTBQjbrZg6/9zoXre6jmknKcYRNe
	ZK3TkLcB42Sb8ahbCVEwYbbHH3zCHU1TvDKght0ar9Ne2gn/RSQMbRuoLvKZKG5TCoFyeTKT5+S
	AVsBJKIMx3NZ2vRQ6bEGTNPUXEg8hcoVEWXhxKs71dKUvMoxe7n1P0W3RCiAaxMx2/GxtieBsio
	=
X-Received: by 2002:a05:620a:24d1:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7cd287c02a2mr548794785a.10.1747248836199;
        Wed, 14 May 2025 11:53:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZUyH+Bec3Hx68QTyC0qyBJH9+IhT18JrntqcosT2qsSgZ65jrQYaHYNIwh0rsFUc/zM9n1w==
X-Received: by 2002:a05:620a:24d1:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7cd287c02a2mr548793185a.10.1747248835857;
        Wed, 14 May 2025 11:53:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cd23fsm2351009e87.249.2025.05.14.11.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 11:53:55 -0700 (PDT)
Date: Wed, 14 May 2025 21:53:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-romulus: Enable DP over Type-C
Message-ID: <ibnu4uouts4zbo37tsf5k75we2jovszi4gpsy5t7bezpmfdcel@cktq5hcgdhfw>
References: <20250514-topic-romu_dp-v1-1-6242d6acb5e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-romu_dp-v1-1-6242d6acb5e5@oss.qualcomm.com>
X-Proofpoint-GUID: roPpHSIRXPRPUYLVxz0a_qUoJFCTrQbN
X-Proofpoint-ORIG-GUID: roPpHSIRXPRPUYLVxz0a_qUoJFCTrQbN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MiBTYWx0ZWRfX6ERZ9DxNLLq4
 vQXMrUD+eadnJYWKXkfNwOh19cOZa3u2IF4WB4oopWqowTiZp5njaNsXzl056caJPv5O8/mBCr2
 eiDMyqiS/gkPhumgTpeBzKORsIxdoAUhwSCqmvsPw2nQx91vXJfCPdi80pwKqnbtCM/SE/m1iCq
 JaXlvLI8hKfV8quswXzv0fGDhdEcNtzDvvbPvYFkkmw/ohsvqii6IQ+YkO6xA+n8jK3bFTSbxkr
 f9IOeqF2lXGXfEQyZ4cecvpLhpCdJeIDfmTo7CUry7fSFblhsnMAr9czbEo6HPsK7R+9qTbSLkP
 Tvvmzg14xdsPoLtLn6QduKGwn/X37LKUJsooFRXHlFt0hjQaejEOZYVFDCQ7CeupIXMoyN+07Rk
 mwBfUh9L+jl6/p6VRjRwnf9SXSopve3vfWuoo3oQOsJoXcb6DOEO+e0ievDtid3iFQmQOLMF
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=6824e6c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=9E7FZHApTnMTk-4ZJboA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=772 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140172

On Wed, May 14, 2025 at 07:47:16PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Both ports seem to work, just like on other X1E laptops.
> 
> Tested with a Type-C-to-HDMI2.0 dock (translating into up to 2 DP lanes
> worth of bandwidth).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

