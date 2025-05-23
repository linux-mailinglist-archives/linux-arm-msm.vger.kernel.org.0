Return-Path: <linux-arm-msm+bounces-59238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A34AC289F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 19:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9E891BC3CBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 17:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55493297B69;
	Fri, 23 May 2025 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WMiJikqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB5C29290A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021345; cv=none; b=qLX4bMQJGQ5HsHAr1E/cMVxFjpAawYAZFXCp5auTfKzIOSGsLK7tVh7ZBK+fH/MML5f9vj4PppnkykABFD7C5zU29cS9yc/wdJoYcJViB6+RXuZyQSMkzq6V1tsByc7dj5W7OYjlp8MzWdxJBc3YICXsU1q9HcT+h7ObH+ugl0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021345; c=relaxed/simple;
	bh=YE9iOCasxPJapt7KcW93oC/yS0GUZhvFXPD7y43bNBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8X62RJ3qw550OXuBrrsEuYZE7LfWK2tCdZaMRycTsxSz3iyo07IlNkmhYd1pwJ4BP6KNJ/yekeKD6jHAD30qy79ik7wjtcxb1sZbHwsrkgAk/RbXsK7DNJLoPrq8YZBv0yDJHT0fYkMGXLBQtUtt8mWKVdSxmcLsTCPBaIDyFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WMiJikqt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCRVqW024764
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wFa0vdA/IRTpVTPty2QP+/P6
	az8rnekAbo9UM4G7jm4=; b=WMiJikqti+OEnzKlXLAL8harbintk1VTQiGB7xG1
	8/cHuWXt/X92OIdkvhwY/k9SV8ExfuIpPtxsCqCJyvX6dXNi7wUvQKYyiSfcqf05
	RaeKt7hw5hyarWPJHKddrG7SDsnKXs2fzyhMjsmbALZrm7ktzR/tdPao5liOQg20
	dK+gdjDr0PW77wHYU5kz/dGE5Oc6fntm/p5dFu1e65Fa2aeihL5hENUGuG4mLZd3
	fWuBF6Slb9Zip6GXLUS19/k08KyQlO8ygl6s8RIaNMI0+Jf/9S1nE9FIRTmRpXSR
	JIFGkfJ7QIQQHaNHmQ8N7YbM1Pp+QEPg06QsIARmD87KrQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf52p7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 17:29:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d8f77d4fso1433286d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 May 2025 10:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021342; x=1748626142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFa0vdA/IRTpVTPty2QP+/P6az8rnekAbo9UM4G7jm4=;
        b=jjORiz9/mOGcB6tRbqnMkGV1ZHTKKZZ/ev+EyOCyXP9og240v4EHd+2WaDU4MV9RbI
         WBHWwngKCBMk8lw1LyFvpjs62dZHPfJQ/CIc784V7d6YUBJlqWJznu6SGdZ9QYUAFEJd
         BRTs0E4w16Qhe1htYgKIOtUjB5fyVUYWYE+0DW1eLtZhFh7JrtBYRi1uDRlRv6dfVjEr
         Z+LFkJyjmkf8N/slVyyj3nIIGy1Qop2oOipi5f3EbdO74tOaMHs/02FweCWBrDlBl8hl
         ggq3n4+dSD9CMiL8VKD3VCOT/GJamZeYigVrBUhnmRr/4K02ntrMPwE45amyryRHf2vT
         dUpw==
X-Forwarded-Encrypted: i=1; AJvYcCVqOWRKhWDEwdRGn3jdVmgCQsmPQ4b88GUgv7RWT6ti3YXHEkYjAZI5SFFJrg0Oy0KiNekE3zM4nSPHu2cI@vger.kernel.org
X-Gm-Message-State: AOJu0YxPn5dJz6q/6tcA2Vcon6s++ArA2E1lUHObDosBpO+fQK3GyH03
	7GkBnWErctP8FFO/QqO6E/dW8kwyIJjuHmjBsr4Zd6xEmdKYw0Mx3ZZXq0TcvTW9ou8M/WVfHuP
	qsCrQtYnPC++5MDOiAYztdrVo0rW39NJyOZbsGmMy3lu+cM8DX8GHzfrH3POBZ/sba2wz
X-Gm-Gg: ASbGncvOP3vCmtvcDPQ56qAo5Uex/bp6/ktNv4BSR8qQIK/YL4jcCqh9JxJpTG5G+HG
	v1qpw1yGAGXuvxcLbJJXsg/7XhcJHR9sdyxBAfyCbI1cKKUwo5g+S2HgOIUOAK0bUpZ4Z14k/i4
	qdHj2RqxzleRBvWEqOvB6u6gHd+x8ZvpZMnZGxPdt6zp5FBg2TG0PNqu9wDiWTNNsKOBP3hf5ej
	BRRkL4PQLMGkH/rOh7P8knZafA4Bluq8a1z2bQ+gkomPbteJW4Z/xkrjAgoYgwFhmMjkHBrECKM
	3LolOKgfO/8MD9M9oItaDeLVgXpCBSMgxF4Gi1GYmNcCxWVLwdDHKTmAscuX3svPK1UGJkPzm/s
	=
X-Received: by 2002:ad4:5ce8:0:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6fa9d13380fmr4709826d6.26.1748021341967;
        Fri, 23 May 2025 10:29:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYa7Skl7n8kgzImuglUnL40cCJvrlZBl66a+j2go4me6lwztDNnIag5vwQhcV+q08HK0c0VQ==
X-Received: by 2002:ad4:5ce8:0:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6fa9d13380fmr4709566d6.26.1748021341671;
        Fri, 23 May 2025 10:29:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550ee87a795sm3549913e87.220.2025.05.23.10.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:29:00 -0700 (PDT)
Date: Fri, 23 May 2025 20:28:59 +0300
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
Subject: Re: [PATCH 04/10] arm64: dts: qcom: sc7180: Explicitly describe the
 IPA IMEM slice
Message-ID: <nm245key56zcfgmo353bfiw6zrf6lymxnx7evqxzimvs7muxpj@e3yts2awiwkk>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-4-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-4-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-GUID: mIug1rOipXN3yj0lLZ3R_EwbnEaH-zLK
X-Proofpoint-ORIG-GUID: mIug1rOipXN3yj0lLZ3R_EwbnEaH-zLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MCBTYWx0ZWRfX60aQLW/hSC5O
 TERvjyz+PLriJF2cpQcjCUFX8M4t33g+ERZMerCVYtFXG2IBInJhw0mXyclNGw7FvFmJXXFAk8N
 t0WbNuOY4NbdfgDjXh5mIctiX11hwIDQvXu6y0YD+nFq0/DUDY+Nc3oB70U9S+SRNHOB+jJ1YKv
 R5oTlQzbb9to3Gl1Ll+O312PPFNt+VCF6J7KX7CGOsEWGlqNBITGxlhB9La4whv1juNh4OKRbSH
 iwJf1YxnvREA7ognQgQXrsLdRo0GJkjrlWULDhM1SLhHEdCQuZY3aPigDEVd7Cez4e3NrB1CRZJ
 P7K5M+grxLgt4fPbK5FLUeDM/+6fokQq68IAOz1IjzotK1a9yMRT5jWsJxsvoI2G2+ZiDCQ25Lg
 d2DQWoA64ccopxJNH2kF+WubyleDVkt7bSPup/zy0ZTlfuUE1M6pHQ0bwxawIhUTOlUBepGK
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=6830b05e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CQVN2WYv2dQaG0RyAuwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=703 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230160

On Fri, May 23, 2025 at 01:18:19AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

