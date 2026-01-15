Return-Path: <linux-arm-msm+bounces-89120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D41D22C03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13FA03010744
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657FE216E24;
	Thu, 15 Jan 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwPMmi86";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZOocEM+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294BB1DEFE8
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768461218; cv=none; b=VB3wX5SmCFT+bJmlaLgdOQSsj75MXU2DMblShFUIro0Wj4GQKyqdvBTE53+0B+wADjUk7rCEAoVrbXvBjebzrrUtahDDGfm0RkY1QX0m0lt2nt8/R2iFFn64tcTW5AhJp8n0Fs6xl+CTgf+BGwVsJndo/ye9hV0x1zen+aVgIQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768461218; c=relaxed/simple;
	bh=yBmb1w4ygoAnN+jTj6OLmmaCL8u8xl/1Kad52GRhhgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPvSLjl6dTcqZXvbxy2z7mNTt7Dhd7ZXtt+4fhrQ+1fqlUoR/dPXi330TR/wEvxg58JSVwdy/4AuKYv9XWUqy0x97V+c/pSwcw0QnodO/DCqUpwGm09dSwExKHFPxT5RnN1Pxc47k8OIenXPHFN4o8P6j58yTuTVZfoqlwMhJz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwPMmi86; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZOocEM+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6funh1582092
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R+ejjWVZ2PbIRK5cb5+0gfue
	6ycDWTZC5kWuP9g8otk=; b=EwPMmi86puKYXH+4fOWgOrBAD4I+49UVXWT0fSkW
	vCgBlM6ROGR575O8DbbaOSJkBA2uArYy2gzNSJxs9kOVPhq+O8Pldv5MbkaItByb
	/J75l6Y/foHHhhTfO7n9BGqEkMTgP8kz8eRIJVB6jao2Oj9U1LES2JjRtvmIgDDv
	2kL/r+TLdfaq98Mye5MIsUfFK4vOMrdjs4aUuQuDod+Dy1Mt8K1GBks1a566qLtq
	3+uB78H7M/A4sHqXSCchurAYO1V8/Z6gPd43nigm81FWRpas0EEzvuU412z0qreZ
	3wwMCPGVXZjvVHE8AAaZYuyGtLc1mhNTC8gGKLmbGQX+Xw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpj1psjse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:13:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5e166fb75so160205685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768461215; x=1769066015; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+ejjWVZ2PbIRK5cb5+0gfue6ycDWTZC5kWuP9g8otk=;
        b=ZOocEM+1ex2DvKQmjIdWcb+WitZDVgOPeK0A3yQjYcX6+4epbz0+lLSgVIIkjehtXh
         Yr6hOnoBgoGmqIzeM5scnw42REP4tUw0LmDb3IIlo6B9YSo2LDbWlr2a1E33UHPRAWcf
         qxKOA6laflCDacX36QICXqUpd1I8xULXAjh1GU7HQsyaD4rqvt9w5E4F1jKEk9/VdbgG
         LJE9TbuYxZzyrqmTvlP6C5IqO+u2WIXJ0VUWXvs6PHMal0FRqqjFsfhrYvUIWxbZ8itu
         64Pzh7oGdzTMX0z8CtveWvfYCF2mh3WTlsagtHIcu6PXks/cRZve3YI1uYsLbGIuWnKN
         w1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768461215; x=1769066015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ejjWVZ2PbIRK5cb5+0gfue6ycDWTZC5kWuP9g8otk=;
        b=qkz2M1pfBV4fuq7o+ZKrfEYW8bIXN+OvR15/5VyUEhvGttebs0tyXiRd5bniIoWAn9
         E9dNMzjA9hkO7T0Fnf/erPHOVvOU4qlUbdCRdM6/GFP5iu+tdMNB6U+yeKse6t/wQkSl
         /o0Srl4atdXpSVZ3iV/LkhMqgRO8+YjzcKPx7wO77RsvMpBpiQO2RdkB+t/nS6meGPVX
         IbNyarGaITUWzqPFWpSRBENEsqof3sPGivjWywtQ+MKxMq7EiIEHEPbQiPlfmktoKthh
         tXjNXiH9o/sO9loIa2Qz23TQqa09Hu5Vp6fag/8A2rR8043e2+usjUl9iD7opJ7LNaQI
         eauQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUcNx5RYMeJCmQCmRK9lSn7kvB+gBTdNslskOHC5ncVqWvO2YwNB7+Dsg5rI2XwIdhjQmOa/8Oq5SBjM2q@vger.kernel.org
X-Gm-Message-State: AOJu0YwmTmpo2H+JwgPZFbEGMq74jt3Up4d+37kkxTegwimK7RMo1Tbo
	ZYp5umzH8mRn/ORHvYE7buWX6cZ4Wnf8FwWPG4rNIjZy2gOg9S7V+7JMNnfYqssuPjWj6+Tdt2L
	vNnYsk/CIRep1DVbhAHdrgD35SyUwCEeOTlefphKRyf8mQ209h0yQpr1fRUTS7ka3UfId
X-Gm-Gg: AY/fxX7/vm09bGKbaCEImp0ZgzoRtw/Vbi3VtRxb6aFfqUo3GWKX7fhujggGqBevHmS
	2iyAzM8TwCIRgRs4LSR8gLWfm4bNxw4QfQy1vmxweX/InLwNQDlSkx0Jhgf5kXVKaSmiMmUZq/H
	BQx3XhxrMtbka7Fl9jArutlhFKP2JNCtuwXlX/NihUXp7AMMnP5EtWzeMQwqTprSGvnAYQOIlAM
	Ns8wOESzH4CHcUyNcULJnMw/hezJW7U6a44YwN7wUjYA+qLY2SvDBf0tJK6iXQqT33DD1U6Ykf+
	dHEjRcId4s7MlezRqhZBQwTPoAf76B3nsEhDxrPPfzfgVExNn6EbgkRKfS3UyUVs7ZvNutGjTaa
	Nyw/9RSaKpay6c4OVyCD8YaNraZbeyB3wgK1kOtHnPT19pRRj2PG87a4FO8Z8jS8Ioui9MIGfuy
	2aLQUvqHHlKZnVOF5dzo+2zf4=
X-Received: by 2002:a05:620a:1a25:b0:8bb:a037:fd94 with SMTP id af79cd13be357-8c5316a74f6mr591416385a.38.1768461215559;
        Wed, 14 Jan 2026 23:13:35 -0800 (PST)
X-Received: by 2002:a05:620a:1a25:b0:8bb:a037:fd94 with SMTP id af79cd13be357-8c5316a74f6mr591413885a.38.1768461215160;
        Wed, 14 Jan 2026 23:13:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba101bd2fsm1457699e87.11.2026.01.14.23.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:13:34 -0800 (PST)
Date: Thu, 15 Jan 2026 09:13:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com
Subject: Re: [PATCH v3 06/10] arm64: dts: qcom: kaanapali-mtp: Enable ADSP
 and CDSP
Message-ID: <o652whod5flz4k5qy3lpltmdyecgn7q7vbi77wpcqtpurqtyrh@kqkifqj2ntpu>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
 <20260114-knp-dts-misc-v3-6-a6cc9e45de93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-knp-dts-misc-v3-6-a6cc9e45de93@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0NiBTYWx0ZWRfX+o5ggUv7VX3Y
 ueyWir7jWa4xRuQT6pVjcmdeGKaVfwZexBbP77C06UYbFKWGVKRGv4z25ZQYblaY8jdQq8/5UGK
 jNYbbLOLdUE1RIYIoJpSQsXzu3xI+qImEDBpm8Zkh1pJ+LyebiJ4UsIN27UNIqn+GRmHjxdqnm+
 IuBELWDJI0fOPhkQCPK/foEq7CKoVioOESbyMs2ouYrtsas34iCj4UecymTvZPgKnAUHYhqrFl2
 JEt/EeqTlAtPnb7zuq3Shv4EVEFju31bK4ktl6slOhv8wckpOfH4qKBM1PWwfarr5CA6hVf0ApE
 Y3/c0Qlh3krg4e8AmjOoxNc3f2VqRFHrfV5PYby0P3B8Aslol5fICn8tSHMtyELBOXQ+aTzpnKg
 QDmY4bJaVxiukO3+7BNqJZX1PYAzRT9hSkO4/Zuk3bijfbWVrnSXrtr38fgwsoIR1B2QeKZEgNa
 7NeJ1bHvq2CPsVZYo5w==
X-Authority-Analysis: v=2.4 cv=J+KnLQnS c=1 sm=1 tr=0 ts=696893a0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9hHB8HAiLHfe-cDyoLQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: i93tDq3StINrX6TGOK7DRDVnMp9C1Vbj
X-Proofpoint-ORIG-GUID: i93tDq3StINrX6TGOK7DRDVnMp9C1Vbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150046

On Wed, Jan 14, 2026 at 10:49:08PM -0800, Jingyi Wang wrote:
> Enable ADSP and CDSP on Kaanapali MTP board.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

