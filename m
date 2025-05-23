Return-Path: <linux-arm-msm+bounces-59243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21009AC28D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3D124E8638
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B4E2989BF;
	Fri, 23 May 2025 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a1D0XGP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3A29711E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021697; cv=none; b=cdN7EUAE13SiMhjfb4FfhA2ya9OnoU2/RJbrz10yMYJAy4FYvGUXj2TCF6dquO0+kZTyosVYJAlPqtbOjbL1+2cr8LBm905tR984RVw33PaxdfnuhGhARqdOfyXXgqUREe0H5KmO40duBjhXKUsLBqjEz/2Hvj1zqiYhZwTWdow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021697; c=relaxed/simple;
	bh=0xH4DNFV3bBm5zPzPQGKn1kNIjsAFK+D2Oa6FLC58X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOcroduSQS+3/enosNK1tfAkmXLwhGT+eU8kcrYUJ2lhP/dy3KwHCRgxV0useqpNNU3qi3nPB0C34Fq114vZkhnoWIqCF/kstOlrMlak08JQoY8JYMO/RAoKejwGkry8jknm5lfWBLvSGZpbpKzbxXc4ZzZfs56NDs57PK9bHR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a1D0XGP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NEdb0m027677
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hpIQ2HIQmyKL9n0F1Us1KUdU
	nZl8RYntEsnVzXSr5aA=; b=a1D0XGP2KaesVBdU0VRMJ144x4SebuozMtfThx1p
	yrjweHxaMbZBkE1dqTXhokX4SdTX3z6pv6CXu8j/QdG8MsOuZpTh008cE9CHd8vV
	c5HHao2GOiqQg+pfiETGdQAKLOlqqGREb9Sc9xXp776F+wcqrSCA1t8aWT1N+8mz
	NpWnJjbf/4sbShnbJ1n7Qn9HUxswLqAk54CJfR7Kb/V9pK499XQ0jYvDn9F6FOGp
	LvP5g9AtWhHPjxxaKJxq6IXH9hK54sl2xdCJptUg4l10MGHDxpGQIh5B3TIyzcn6
	gPDBBjj1AUwikSpmUzmGFoiznUMucVhSc+Qv7tqDFTkU0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9jm1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:34:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c9305d29abso11177485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021693; x=1748626493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpIQ2HIQmyKL9n0F1Us1KUdUnZl8RYntEsnVzXSr5aA=;
        b=QQtHFaNxbLXVtxSpyy6bOV5YY4jKEinTuLqLS5+nO1jtrl34dkrVMPd0MH5akssWSe
         SVgbbFNtO7MGYuWpuaiOgdCjYH77wSYHEj+bAK0wcYtmO1Nc+3S9ACPFRfjOP0flpxdJ
         p9N+ukxXl6ll4du6V5ntBs8ASe9fInHJuAa11UA+ceP88nNWlRsrNYGKJcxwuoOtHWAU
         aFDC4SemSM3+ey1vbwvvVZHVe1GgjaAuO/gAK6avywERb6hUkX4CyeFroOzrITo9GOZ9
         kz0NBqj2U/4eIeMIjj951qaOH6Ara0gvF3wORNbxQ1A+H4OVf0i5URJXSDaGCsrtlfIa
         Kyyg==
X-Forwarded-Encrypted: i=1; AJvYcCU5DLefo7hA3r4vmgqR8LrwaFufRb2KzefKEelqjUaq2up4HQSMnrQzmnpDpydWSF8NpZPIQJQAs6u3Hdp0@vger.kernel.org
X-Gm-Message-State: AOJu0YyclMTYgjtjTZnw7J15YIFuU32tsnnzylAEdQnPmwg/CQklAVUP
	hfj+Ju5DIRqVfZsQ6BfpnYjKEIkuTBqMmysk6ygbcJNWHW+qgmTODczTCJ7KYF4s9woOupZXBMM
	0uHU+gbV9+NJM84/1s/CgbAyxUOy/0OMOLjhJj30AzEAdfVbs0lz+YDb65SrU/gn82PzjsdVcPU
	UGL9s=
X-Gm-Gg: ASbGncuQUVFjP6yDMs1w+EoGbLPjgF7gWf4LyG66GBugh6HMnKtTwWqG2BHVoCbaYfE
	ei7uq9rw203kFBQwzEdwXW9VPRFO02Unjg1IA0Tyr83CTk7PXsXe4RHZXDetthMGaSV17CeDxKr
	KiR85m1N0tTBpoPzDB785KSVBhCtILl/Cv/1Q4pBkuC8ss6CrQc48Ynm+rD8n2NsCbp5SRchemt
	RWRMWUn7aIGEWOfMFkY1qqAgqk8+ywWiUDJKQEf8m2LtfNEJkkD4IWY0Lct7+v9SQt/wTLzwddK
	iNSslS2AOBGFw1F8TlEe8w5Uce5I9zkK2vovvZwp4Z779ezaR5bb1fLxLQTQOhmNWx5X61n2Iio
	=
X-Received: by 2002:a05:6602:474b:b0:867:9af:812e with SMTP id ca18e2360f4ac-86cbb7e4163mr30604839f.5.1748021683039;
        Fri, 23 May 2025 10:34:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4mcSOTkbzzIaBttkmtFCaM96ugRwGpROWNL8PQZqldtcayekhbIB384QPkjqkoTId6vfA0A==
X-Received: by 2002:a05:6214:c6f:b0:6e8:f940:50af with SMTP id 6a1803df08f44-6fa9d2aea07mr4095916d6.44.1748021672378;
        Fri, 23 May 2025 10:34:32 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3280fe585cdsm35586281fa.71.2025.05.23.10.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:34:30 -0700 (PDT)
Date: Fri, 23 May 2025 20:34:28 +0300
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
Subject: Re: [PATCH 07/10] arm64: dts: qcom: sm6350: Explicitly describe the
 IPA IMEM slice
Message-ID: <v43htdhyjujepa7xfyavyeuo22snagy62ujr6cjvqeqsfnedfw@6lyo6osjphem>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-7-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-7-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: lmAximLzOKLrHm5wCYg3xqwbZw1ilpB3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfXyRfc9huQJ6mK
 7S+rgGP4I1B19fZZ5gvFpUF2nR55lDxtrRlLjdyX7jybOhGWEBlh4JRmkeMRN6gIx43UFg4s6GH
 I/ZVe0jYtR/C9luR7rtporRhaEYoI+J4fwyGYBK2LwmKkU57NF7daQwVDUtJg+8ZrCgVqLfVng1
 5IN/ojs8MV2rMB+7Rnw6557p8wBR207yOQcpdLuSIRuJZ6oKOnjtPNLZQQZQw2jSHSK2Vvfo7q9
 ZnUZspRfdiYxRKW7Qey1RwMKxb8oqihq8qjytZXCuqrk7sf3+bvuM8Jq2HTRecp5v6MLeWjZMYY
 rHpjMrJD0dCKIqB/gkifVC+hxf+wir/sqt91UZHIm+mf0584y/AcldyPIw9r0h64z8A7/PfpX+h
 gDBR9SB96qj1zV0mHY2B8YkJmLkMVe+611t2UDdWUXt1YwusViax3SJnD1PxKGKf+eP47n2j
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=6830b1be cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-1wTwS_U_3AHh5BLjrkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: lmAximLzOKLrHm5wCYg3xqwbZw1ilpB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=703 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:22AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

