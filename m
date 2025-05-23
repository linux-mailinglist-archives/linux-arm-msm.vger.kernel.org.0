Return-Path: <linux-arm-msm+bounces-59244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A63B6AC28DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69C144E86DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A64298261;
	Fri, 23 May 2025 17:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQe79jb5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A116B223DED
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021823; cv=none; b=AUOVaOHnj4PMi47Y4MNI63MWdYCqnB5N47VFDg2MGMbwP0RzwG7QaPUHuj/U3IpmyLSrZha9aU2Dlq5bxDeS0+kIiNjNiFRMkQ8s8GzI3xpH4qGJPfk/88N5Tlyi3NAuxUe5xZG7tswDerXPkiZGIKp4WwlegpRvM42lu77zdbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021823; c=relaxed/simple;
	bh=uklTHHHpR9OHc6R1SjPzRKkbwTijx2VjJZFqlc+3wI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOCfWP+M+ZGucG2tevRXbLku0mOqgY3Zf1r6EMq+wyAc8CXyShnuYH2LpTWfG75nWrtyL4PMbcUY2GhYpvJT9BQUkNJ+XQ/aO2iFRmmuqYYUCbOCfGfYtYdCelhO3rRZv3WPDaHCayo8inHAODQEiVag+Rx5ZDyl3pc5DGDitaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQe79jb5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFJq3k017045
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BUrC3k7kyjySXl2SGtXOi5di
	wM+mqnx/F7T+adiFi9A=; b=nQe79jb5XJofAbH2wa/UIVWqI8UzhTUGp9KtpI/A
	wKHDhi2MZJOKA5AvaY4xolYNmaAjIRiL/qK3DSs6atL2Dl1yZMWjlenS9R50qYyY
	/1juZNkDeTUS6ixTH6AM9hqWWl4x6nbV71TywAxVdBnrHdkA3dsfLn1XIuHhmVCk
	aXkLIvRGY9qUE9kNpW+87bZlTsHAmNsAexk9Sf/+ZLURdsbCEnoOFX5TSSZMIzzK
	eD1NX7ERKutIr2/uf0IAjN6yP+MpIogjGpEQv2jbC+YxPWXmwefEbYhOnJGNYyvR
	ZrbWKDPiOeQ+8C8CUjzzEYJNUxeHBkqOGdukxiPiVqemww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9jm77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:36:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d0c8e917so667986d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021818; x=1748626618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUrC3k7kyjySXl2SGtXOi5diwM+mqnx/F7T+adiFi9A=;
        b=DCCCfbDFUHT4NKoo216S0fwwDDKI/2RJm+F0gIeSj32XDEStbLVPKH/1co8MnmrUAA
         K5LOzsAIyrOHS2MUoIqG/yWmxCiX5A7xMQM/XUM/A09IlKl4mQbs2bY1cwSuaW81LfSj
         lFd/NHnq4JkGYxQRi1fG3nzAh2t0wWxvtwBKs/yNXe7WHMH+1+iKu8oPGKc5K9482lhm
         +kAcA8KSzhK1qUUWTrn4NPUhE+SUqHgqQMANElJuc273P2gTF8v4wAmV7gsqnuWgRLrg
         txwMFeJ8WOr1PKnOTFMvkS/QU6cWZ2rndYhQE3kzvO43l1L2nmSjRBttoQF4Bav1y/fI
         Jh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/wH5yX6Di/LdJlJkpszEA1RzoVYgxHWLn2IvaxN86MoHCa6L2Ov30+9LCgvJErxjQtGMp0eAtvlypbdms@vger.kernel.org
X-Gm-Message-State: AOJu0YzfBKmm+U+SWkXLrEMrEgEfhtgVTmP/noqMHml/xRCSSaIz9X8e
	8S7TOkxa87Ovi6a+JLWV2aBNGItlWIjO8B81ZOB0dks7DG48XhHnJwIEcGc7GPavMG9dDJkZzAB
	c1m910vXt0LtMo8vmSV2HAc74qCdKCDXk3AJZANb+Cb/OW4UDXvwQ8J07tVN+OvfDNlZH
X-Gm-Gg: ASbGnct9duTjlVrkv7NrmXcYJCSWy0giYXS1jPTdg3fGaV3rBnjhHEakE7Lgnhs3+0i
	YdUBGbZdBqzLpRnr7+cYgjb5b1FGTy2lwl0r7plXmSVj5wlZrBPF0pUS1+VTMXtAk1UZcWEAqiF
	IoHeWGBoYlWJGOcP69uZ/3bz08zlwTuwLUioh2BLSqIoEq34rY50SbubpGamX1+LQEE9TCQhEAr
	dk1Mt9spsCr7oSI6N1tUZXS1odocHGgT7BQF2KZsbcOK/q51P5UIlHLSfjJT7zoGYdFcCgyiggx
	GZ3BuGinJGFZEazoQrAzoXDU94ssKwum86UA4Um1MWSD6PaLyNMChIVdMVNZMkpiPqctnTkVg7s
	=
X-Received: by 2002:a05:6214:21a3:b0:6e8:ddf6:d136 with SMTP id 6a1803df08f44-6fa9d2e862cmr5068226d6.45.1748021818540;
        Fri, 23 May 2025 10:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyp2KHfgGDHOTpGgJ89pgVjld2+39k1RlwidUUIOx0KxFXi2heVZjvt33HGvuCTN8EZpD5Ig==
X-Received: by 2002:a05:6214:21a3:b0:6e8:ddf6:d136 with SMTP id 6a1803df08f44-6fa9d2e862cmr5067796d6.45.1748021818087;
        Fri, 23 May 2025 10:36:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b46e3sm37750261fa.13.2025.05.23.10.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:36:57 -0700 (PDT)
Date: Fri, 23 May 2025 20:36:55 +0300
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
Subject: Re: [PATCH 09/10] arm64: dts: qcom: sm8550: Explicitly describe the
 IPA IMEM slice
Message-ID: <wbwxxwvflh7dc5cupcl6g2krqfv5fp367qzq7es4sawjpid4ny@yxtukiguidi6>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-9-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-9-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ay59trE0u1II1_yxFbEF0i4WWFTbjDUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfXx3NRxLF6TgbW
 aG1arZT2XzijE0hY3upFqZHo1QzcFN3XnhURgT3NkwcDaIeGn6Lx5MmFqlQoOp6764j1rqp0m5G
 blkiR5GhexnGw/24v5gPjLV1xrOoVIaHUDY1WsGPk9jcaC+wnn7EVmYSV9CmN0KnKneQwFQpl8a
 Ehk9mH5TcMUkQMLGx1WZFvbZ5jBhPNZMJdwbksbTkG8iKwmzFGDUqpnyWn8+82Uco1GuKSLcXuA
 zVWVP9ofViKNGKO17onY7nx4wV7u8gDTgETAWgud3cBzHS9q3hgQdTbSSbPR048w6zUujdzr+jB
 UoljcOrpEB3nzckW5tWP9kbMtkoDGO+McA/glWdO+JC7vj/X3r/VS/3tNCQYMf5IGJsvGHJNfWc
 FiZvO4y4J/XoHKv94PzsZ6BnlaEj0DoMKsvKbFK0ys9nkmgI+ZkDM7JUNYuRsHbQMvYDwlzP
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=6830b23b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CQVN2WYv2dQaG0RyAuwA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ay59trE0u1II1_yxFbEF0i4WWFTbjDUC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=703 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:24AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

