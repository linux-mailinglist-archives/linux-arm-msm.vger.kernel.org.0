Return-Path: <linux-arm-msm+bounces-83397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205FC88B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 09:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E7A944E47D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 08:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0AD431AF16;
	Wed, 26 Nov 2025 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jItJ64sM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kbue/Nez"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0765F31A57B
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764146675; cv=none; b=prRJo00MxNOeOBY5jHdapoPBEI3yHnNIgf0gNpd0kjAaD0D0vwUH0DE9RFqwObtcsRLRT8dfkjwScWGYaXRknoMOiKiZS8kPNVz8tG5buDlb+mjBdT+SUVg0Teo9rRkrxPD3UF7AVIQvh08942ZExgHTjdBEq48pHjny6su7hvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764146675; c=relaxed/simple;
	bh=HvNXYh//mQGXf6QEF4QL0rD5XPTMfG3as24EUV0OFGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XTAkr8SPoiYby8IwTfNY8IXPGclqwgA5E7Q4RCheuU91DYAVaraJwPuN8LW09My2jcE5LW09FlOK927VmL0R5DnZtJBJx3u3wchjqzNz+9MhpwrV4/0LzvK5ffGPZ4Cl7U1uO/9L9Ccm2sjygcjsec1tr9MUMiETlMiGib2s6h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jItJ64sM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kbue/Nez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ8Esms3255887
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y4IQ58ZVPziIOKzmlGQsvDpH
	xpdq9N/xPcgK6RCY9i4=; b=jItJ64sMtFvybon91vxQsa6HtBJODnPveFq8VW4D
	R4tqop1s90px+mVGv5WicfJ96Qz3GR1an8AeEGsl26oFW7vDQf5T3UOov9UEH6U9
	lXmA/S1zgdcKUhV8blEWx0Q8DTic78jLwBqZGjjR+W/ezWgrv+iyqu5Bx1vTdxdC
	zCDt5E5pJiP3rJcqH24RXxPNtsFjBdW7MTvJoYZXOmC8GfwlF0/qs6cthL1whCiH
	ftDzxypMI3ErKPaJwT9j2uZ0meyqf4VV9oA6GCwTglZmHBXT+quJ4rgcrxtduUuR
	6brOGvneCDWstXulu+KKMsEPFYgYUc+dx4Sm0TCz0fVd3Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anb9c35md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 08:44:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed79dd4a47so152437351cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 00:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764146671; x=1764751471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4IQ58ZVPziIOKzmlGQsvDpHxpdq9N/xPcgK6RCY9i4=;
        b=kbue/NezHxBKJ9d9V9MnndI2R9vziybYuDNTXlOGa1PPhNULztAY1DwKfs0eumxH9E
         Xe5Bgu6CzNHcfPON1EoB81MyIATIpDV9IMwISMxEKcFWHXd5z6/o5ipEMyzCE1N45l+8
         x9T8RBqcVLB5LCnU/H1VFMN2lW84CzEuNckQQXYLf+wQjImqbtMc/BvYPFNqb0wa5FGn
         ZSfcq7BXUzA6ZmsHpwAJ4JQ0IVhG/IBntJcoONt7y5paP8/Akc0oYJqV1giN5x9CWJEx
         H09u0hp2inQKnHke8k/+sjKYaY+AdUhVwbMA66Zs4MuVAb3Vfap5IHRWYToni39L4nCP
         Y/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764146671; x=1764751471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4IQ58ZVPziIOKzmlGQsvDpHxpdq9N/xPcgK6RCY9i4=;
        b=so1xTG9P5JxwGAk82P10zOdepYjXsoT4Kioq4PyIgidtC33ebTOhmo2Y80TeHnNMut
         VaDxlKAG0ZOsPXTtczdhs2i/qei2nmCYNn152Ut7NooiM7rd2f9Q2brhKWOGbewCwbJu
         13a6oJ47rZ3PSc8RM4VZF35hU2OFS+6AF3hPVCi8M6vMXGKKl8qzbxxQ+kzV3C8l2Es0
         hogfT2OR4+9EhAVPpgBZ/uDCWaJ5KntQgO6LvsxcMNVHPAJXBYK5BC1w5jGBwVeYbU3i
         1Qu2Lz6ZxHo/PKnCia2KFoch0zz6w5mG2mqCMxIT4khVXSk8gXHC7HR7K0V7NGDGAFp1
         nI1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWY7+Ezkk9A6Mwpr85WpaQVYZl0V8+Cya7RBMzRn1oAL7C34AQbn6mUn26eDtLOxH3sPQwIaBvyqAjAnDN8@vger.kernel.org
X-Gm-Message-State: AOJu0YxbZJMWiHIZtsT11/I/pKT452mY67QuD2bn9qPosRoBT9rSZ1N+
	JY194Zy2acpGD7fLkTO0SOJ84HO4ZhI5tTryfAgLtf+w/uoMcNg0EZU0XfOzCGPV9h/DmB/XYk/
	9YOm4cMK3iUExUN93E5fQGSsrehO5DJZwmmcDJKV/GgLSH3vxSAsg3xtImQUtiSoDKBVb
X-Gm-Gg: ASbGncvGnwIBgkOR/f/KBFX5rSOj38QaYEYCcxW2oSR6BPt4hiMC+PXrehWXmlu82Mx
	2bZSPPJNicwkwx/kamkJSlcwQxX54rZU2hhw3lyvGisJCuSyjnjrdcFgo6cGO1NZYGx9/YsUaTf
	deabcYcDoSSmzwMlgGZKFCrVfXJUbKxzBIqNt2xk741bYe5qAjSRlFJDiNW+RO2lDUMOH+1Gr8+
	vEHxZtZTFOt4AOHAUHCrxe9pz8EWplSmRs09qzmYU0rxJaF3sUOvvUtIiomJ1eFd1GXmwRA2iLN
	aaAdWMB7q79X/lHQPFfH5c5BBZmnJPrb9TQOTaVgF2MmThja/JisSi/l4MdYqM3OqFyTfmsSlH/
	MLBIZ6g94SNW2COIImSLeOlp8w7S3yoT5FjZymCJxGzBGmw5KDhFFaY2wb7W/ucH8DYoFsn3lCA
	I9Ofy8f943c2IPIOnXGfU/3po=
X-Received: by 2002:a05:622a:2d3:b0:4ee:11bc:bc98 with SMTP id d75a77b69052e-4ee5892e190mr195381131cf.56.1764146671356;
        Wed, 26 Nov 2025 00:44:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFchfpqe6tmsaM891d6sYtBdBKuLLdRyR71Sxq+UwKsBvTdv02l28hIQTG1NoqZ9BTJlPK1zQ==
X-Received: by 2002:a05:622a:2d3:b0:4ee:11bc:bc98 with SMTP id d75a77b69052e-4ee5892e190mr195380901cf.56.1764146670925;
        Wed, 26 Nov 2025 00:44:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db86bb3sm5682578e87.29.2025.11.26.00.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:44:30 -0800 (PST)
Date: Wed, 26 Nov 2025 10:44:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] clk: qcom: gcc-milos: Update the SDCC RCGs to use
 shared_floor_ops
Message-ID: <fiwdrwhicd5fpzlfgxim3lhmkfju5qbplbbbsvlgypjure3vms@vhzxwabde2wr>
References: <20251126-sdcc_shared_floor_ops-v1-0-9038430dfed4@oss.qualcomm.com>
 <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdcc_shared_floor_ops-v1-5-9038430dfed4@oss.qualcomm.com>
X-Proofpoint-GUID: AMgPkhV47wez2xpffuV_J6rRfETRCLn8
X-Proofpoint-ORIG-GUID: AMgPkhV47wez2xpffuV_J6rRfETRCLn8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA3MCBTYWx0ZWRfX2+4QTiDR6ozC
 pxPT5l4QLyaUMzm2UGKVY8LcIXAoOvJUOYyMDPu/nB/iFpiyWeuofDnfzCRbG0Rb3Zdpo5QdFQS
 pZOUHsvwpjRv7juW2Sp9UZRNvvUBomTqprnTtcf7xincS9LqGPt5iDjcf6uRT74L6c8Q1h/hUtL
 5WA/EmtscYdUOpm9SNsJXXixW2DTLzp9ouB9yw8herUzuH8VAbAC7zCh6sS7DUw+BDpUpPoCRX1
 pspDT4blxSRN/z+c1OW1ahQTp1cE4/lWMFOgiJcnAWIoCyyskisk5OFDvb0Gak3do9SzjtT8cve
 MHgUDPMcJbmFLMCm4qtRCXTi42MEARw0aUKTujkOYiDRFOyD4CP7wWo/A7iraZ7VgqxO5wi10zz
 /oooSeENJnEGGXwC0j9laPRX3Z5AtQ==
X-Authority-Analysis: v=2.4 cv=VKbQXtPX c=1 sm=1 tr=0 ts=6926bdef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=9PM8q560xgosQWX9dScA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260070

On Wed, Nov 26, 2025 at 09:45:54AM +0530, Jagadeesh Kona wrote:
> Use shared_floor_ops for the SDCC RCGs to avoid any overclocking
> issues in SDCC usecases.
> 
> Fixes: 88174d5d9422 ("clk: qcom: Add Global Clock controller (GCC) driver for Milos")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-milos.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

