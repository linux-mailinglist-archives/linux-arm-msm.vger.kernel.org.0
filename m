Return-Path: <linux-arm-msm+bounces-35991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A29E89B1706
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 12:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A9AA283A62
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 10:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7093A1D1F76;
	Sat, 26 Oct 2024 10:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMQ/r5Zc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6DE1CF7C7
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729938493; cv=none; b=j06G805itcQo15FFQHKka8GEXB685p0aMI3B/7c0P+ByJ55H1eQ+ngMlve6HGMWdU2rr6kxUxvquXVPkr0Hv02lfeJYVGWwhzj3ZMu3lXHlSR5e7OrJ6orG3Nj+qWs53VEMtKdKunM3eYLzhJ0mod0zAHCrRHqXiAt2r5NGvUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729938493; c=relaxed/simple;
	bh=7ZAm5QtGo8TAgXa+E9WOGdCxBAIqDVbFeTqV5SxCGTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G3BFROazB58uBI824/amsCTtjRMytVydKVHLq8GOzZuGJGPNlcMyNJlVn5Qpi5Lti9ODAu76Ml1zdBJX7OYKAtHE+DatXV52E0luoYWxMTxcVjfMDdRbpcUjwda2Ni74mO74jIym8jOG8eQ4U+gbkfx8vt+F/R8+BSYxvfYlKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMQ/r5Zc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q4e3Ix023387
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4CKBaqfBb2ArU4IJn9Gp02L0YwUyeac5G6rXHuq+Xg=; b=EMQ/r5Zcs0YMF0lC
	t5m8GYFuampdv+d3a6b5zMb3GdLBKK8oGqhZADD7Xv4rxutmvvNCh6A9Zp345XcH
	0vT6AA0IlsC66cbHpTA2LyzXR+GTrcqHuD9bsjhxyMlqcGHEvjZ1rfVcnKbuzTbw
	/HQx30Q7sYUhvTrvtVr70Gxp8NhieFsEmWIlFhG9PGDWr9RqS7d4jH8D7X+ihql1
	BbR395doabB4wwtfqHdNsIBcrwjdpAB6oUpqf7phY7kf3G/ryuAI1YRjiKmUMzTd
	zjx/rF9TdBnZ1Loi+37eHb9d4LTh7r+EFGLLbrVfdqQ1/xrEussRHmcKHUpRSKLI
	jAccYA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gskjrn95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 10:28:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbe40565feso7856496d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 03:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729938489; x=1730543289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h4CKBaqfBb2ArU4IJn9Gp02L0YwUyeac5G6rXHuq+Xg=;
        b=pAphUCdZVw8WLKBSLzcjpHHB8IsvdChiCEJv/p4sBPeUeK8ADHsrM7mD870zSh4+c7
         Qr4H+QIqOdIHN01yByZa6zM52IB53NPqPZdYH/GVYQKL1dJlvO58X4MEr1gkRUfwnri+
         BUxwPRU5PZt5yy3R+SPDUlScHSstuoN3d0CeGv47Mv6vEvYCXkUSm/w33n46GWm3yd4l
         PPC44yJKELyitZQjId7A8wTi25dRxohipPVo3/gtfiyKracwqPB2pHvC/UfRKh8K7UAi
         4VVXFKiTE9F5CpyYEtwl9mieV4+DWP928s7sk89m+/5CtMINDVaJnbVR+y8MB2FylQIn
         617g==
X-Gm-Message-State: AOJu0YyAlnSToOVCs+kaQvqppc8GgD0AXImpuWYjBEdGvRenGMNe5Ut4
	T+SSiUJslq77xyj9nVQAQwuYuiZLF9MZBTpaotJfT4SI2QJ8N+YfVcQ2qQ1EbGiw0Qs0Wap5uM7
	0IGWTMmGYxdo7xU6Kxg3s02ZfuudGkh94P0q3D2yEi/Rzu1ViPEj9jzgK4SE1VpUo
X-Received: by 2002:ad4:4ee8:0:b0:6cb:99ff:23d8 with SMTP id 6a1803df08f44-6d1856669bamr15545146d6.2.1729938489591;
        Sat, 26 Oct 2024 03:28:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXCLXCoV7YP8afBjH8WSHTqbclIpPPNASBb3TBzakQC+aQCnvB/bI1jAnQJapdRnkiOq80uA==
X-Received: by 2002:ad4:4ee8:0:b0:6cb:99ff:23d8 with SMTP id 6a1803df08f44-6d1856669bamr15544926d6.2.1729938489275;
        Sat, 26 Oct 2024 03:28:09 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb631a24dsm1423236a12.74.2024.10.26.03.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:28:08 -0700 (PDT)
Message-ID: <19937b9a-b1b9-44d5-b1ca-8da5fc40c9fb@oss.qualcomm.com>
Date: Sat, 26 Oct 2024 12:28:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 introduce touchscreen support
To: foss@joelselvaraj.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Joel Selvaraj <jo@jsfamily.in>
References: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
 <20241007-pocof1-touchscreen-support-v1-2-db31b21818c5@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241007-pocof1-touchscreen-support-v1-2-db31b21818c5@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xLuuKr93SKCGZkbUgMLWmvBpkh4FkykD
X-Proofpoint-ORIG-GUID: xLuuKr93SKCGZkbUgMLWmvBpkh4FkykD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=600 bulkscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410260087

On 8.10.2024 4:59 AM, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <jo@jsfamily.in>
> 
> Enable the Novatek NT36672A touchscreen controller used in the Poco F1
> (Tianma) panel variant.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

