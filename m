Return-Path: <linux-arm-msm+bounces-59245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CCFAC28DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A85C1700A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADCE298249;
	Fri, 23 May 2025 17:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MbRw3+qH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9477C2980B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021848; cv=none; b=QqaCnr8aKI+RztBxuxZPFv/aSTdQC8xMnfqBSoO6URoPvZ+wthU/bV+qyyxHTSoi9MueETuwYaDuw0bqQWze7Z3ONFdXQcmeS6FZZywgwKl6IzlEuLt4Qpoy86OIM2x+MYQVm6JmB3zgtEgOF9+iot3Z00me7QEpyzLLajCAxbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021848; c=relaxed/simple;
	bh=03pShiNbAL8hdUAr6tcV+vAvJofXK7gi2r1TWKg8Nwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5ZomHDtW89aIWEdOS6hTGL2vSIHabWqJGFYc1DB3eNTovDcFmQSCbcuBfVo+jKw3nF3V1gMSoQcEiUVoLPPXndboBD/GIuSvb4xpjyrix7wgxGivzG0ppKbLcDmL08NK7T7xGkEorfpDLd1Ff7cfDTSFcYSD+5LWcK7Z0ej+Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MbRw3+qH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCXuwR001325
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lJD2lVdig7BMAjKoIkIMyquN
	SchIwDTfIsQ6MPP8qcw=; b=MbRw3+qHJpJyHuLlezwbfpLjFQCKtkV3Sx6fdaVs
	X1hl+kNMeNE+H/v/ur9yOMwwLPI829F5MjfGhSVAlGLaQs/CWj/+fL2VtePJuI4c
	4aNwj+dOoatPGYJjtgpQ2pEeJHT+3DLh9inHxX7MU3wQL1EHhyMRaVESzm8KXw1a
	FrKSEcJiIGSNNE9cMsmM7cZVm9e7tRvMrZOAkBZeRNl+bcBH6vH/YQ3kRFjVRJN2
	1RhI49X1EfcSKFmyVwizM9ltyn2pkDyqTgkF5xvYDvuQfB/sdRF17SOFNZJ3mLg4
	2r5hELZc/x7GUM8rbDgHwOIrHfYt5MAlpU37iHmQzTNtNg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95ts3g8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:37:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-52f1488ff81so75690e0c.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:37:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021844; x=1748626644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJD2lVdig7BMAjKoIkIMyquNSchIwDTfIsQ6MPP8qcw=;
        b=jE1ZYY9IqrjCETUbYVfhxDHZjwdH3J35mAg5f83vltV0QmhK70BoXPh6O15StKJ4UJ
         oMvy4rH34WS168lhIg9SpA0K4TPlMGbybK1/iJfq6iRroD8fs4tihKyXmSfXsXwlZgJb
         xBzxGEELab2kQ13Akt1sCFpwHrKELYZTFkrvBA4lUQjph5ATteYxTkI8kwRkWU6E8C9C
         88QO23FE6tXHsPBMrX+A9olkoQ74xNwiFIEgCKwuKbbANi86i45ipZs16aHMfSpcVjGC
         y+17eOHrKMj7Jb2dSxGUKwYFRk5A9IMBx/H2J8DqZzP0teZupd2uuMPYf7QWPdXRf6Yl
         EfLw==
X-Forwarded-Encrypted: i=1; AJvYcCXtWrXFdRyXzb63BWwVJDYhCuUyjAo/uLPL01uqoBDRNzJ0NKFZgO8wXIOSCltqz3+Gk1Nx/qC/hqHUMoSo@vger.kernel.org
X-Gm-Message-State: AOJu0YyfLwRQxFkqk57qitog1fKjCJ2WqCrQWvPgiSVnE4v9kDjWGNsq
	XwouVf/TcNkk/kxFgaB5ZL2nengvaq2D2nqfGdRyrI9pcgbWyfAotKRhxpiow4v2nd+8ZLPVcJl
	3r/M8IhQVZtuiwKowymtYt8FskCmx+ARyTdcNEsAV6oZLI9xhdgQ+nKR5hYrnb9n+k0qFjxPLN9
	kNGhA=
X-Gm-Gg: ASbGncsfhQiWlx04+prrwzNdoqCG7VKQ8m7DxHKwaUUuhQfAAcJral/09RJCZOzsWCl
	sgbvUoTkYi4MUKvGPJKEYawXWImZPuBPbvwPatlDgJSjiKISlT0+lA9gYMNnSptbaUEf+15rsrE
	uYfYpV27o4yqPRCvUJayQtFC8quOpudljNw+NqWKLeCuTihAvHPNr1BzF047+o7MW/rJ72Xsy6B
	NL5UHVc7iQXUwFA4PiClw4sea4jEnw3uusPVIvOg4d5CyrnJslY0cm9XdYkxhjus7nB/Lj0s1gD
	bk84S+wL78xKfaKpEMnAMlgsMNPLymamUojzhMZoljQuLpMzt9YBpYv3lxOfrgUnKrgXdanHLBs
	=
X-Received: by 2002:a05:6122:8cf:b0:52a:79fd:34bd with SMTP id 71dfb90a1353d-52f2c4d8f4emr300718e0c.4.1748021844283;
        Fri, 23 May 2025 10:37:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0EZu9lcZb+hOBPFTudkTJe6zE3Wo94qB00vk325UKK2EgDJLgfCJK+Y5h1ka3Bq7Givcqcg==
X-Received: by 2002:a05:6214:5c4:b0:6fa:9d5a:ae6e with SMTP id 6a1803df08f44-6fa9d5ab650mr1637906d6.6.1748021833528;
        Fri, 23 May 2025 10:37:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b908dsm38143901fa.72.2025.05.23.10.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:37:12 -0700 (PDT)
Date: Fri, 23 May 2025 20:37:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sm8650: Explicitly describe the
 IPA IMEM slice
Message-ID: <uj3w2kqaq6dri2nvl5be57hwe4sazlx4fhqrh7mcark4lltbqm@roalb3dmxg6q>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-10-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-10-f7aa94fac1ab@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830b255 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CQVN2WYv2dQaG0RyAuwA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: HnzJWrvqdIllbYex8dpo-2sdN1Yq0eHO
X-Proofpoint-GUID: HnzJWrvqdIllbYex8dpo-2sdN1Yq0eHO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfX7bswjDE2aW5j
 S3zcn94lOYILDaom6Z0Vv9IXbjFVTn6zi1iw1RlxHKC5CDU+tkgmJ0xFNa+WUXUPrZja7w8a8n4
 cFjtKAB0BOsXwVvvqznHizuRTzDuQqoHAon5DAuoHpAZaoCOde2Wu4aFE1J7CgTH4yddHuoJO25
 Z48kmxxSX6C8qrps+ve9TyZdU4Jz0RaWhhNB/5n9U2W31Gx+3sFKmcIbvLwoLKk2no7A0ti9EOa
 7Yyk6kEZ+zkhEjdT7BYnScPFY2lTkQRFuneZe13p0enOd9sIBaRpwYfkcTbvhPLuHX6CkFJxoGf
 n8wjcQXhEYayuoSwBUPgH3DMFC32jYIF6MjIiyskYuZSZrzbILAwHNfN7GSKkYP/tHHWHn9/Mj8
 w7ldizAYqSW7TAy6LbmiyJQZlkuD5T4yvse/gCNkZHN2Zg7uJ/ivcmqgNtG4j3qjbcDzppyX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=700 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:25AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

