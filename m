Return-Path: <linux-arm-msm+bounces-55349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2EA9A8A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF7AA923CD1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B27221578;
	Thu, 24 Apr 2025 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoW2u4ci"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A86221551
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487373; cv=none; b=oe2TR3t/QlqWa0HP5V3myqzcouwF8SvXRKiBECTRBnWWf21syJMPz4ml2bOpVDGANwZY0iBtLSmGeU19AMdaO0NmejN+q5ZSlH06Du/ryotfnjB06FEYKvcoQs2CEUsr33ZG2n141UzclyLSNnQ6N9ubR4cVN7UgNXHWVvcEV40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487373; c=relaxed/simple;
	bh=oD/+NuKhlsyZZ5I1Sx7aCzJ6/bahEhBp9YFkWTPs/G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jz9qkoCnsXCWo5ypNJ4yWo52lRtjOZq4oSUDfTxUSxIDq+9qzqvgGWhRMjNe6yTIkKAFX5M2/YfKbQmr8mU9uvonN1gUuzLpIQ8Z6guKuzS39uam89FRKgC7pm6pxUsh862jlSYaSeH2VqzFmpqYbfsGjCb+aB8Uld9/skgyOvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoW2u4ci; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7cN010142
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ki0WMJZKSmFmQy9e7rjeB45X
	grpCTsnp8UNMzxotgak=; b=ZoW2u4ciuCgGFbFUggKAC4FR9QHdfrqdT7adpV0H
	oQ3a7gUMOG5EvWREIOcQ+B/1LpXMwIw97yuw6lqFdE2BQPs6z+fagMsRGn1T7jjB
	6nAccwXImbAz/kgD1xdqjAlkzM++ojkAyY1el+WIt13tL0d50x4nSuxsj97/8CLV
	i3deGLaAnaHo8m0HCrvG2cjqgz12urviY+Kp1t9Te1P4CR0r7zcDefn/+QoMbEXR
	DpQQmkvBXnQXuWq1DI3LLVQHW35DFtBhHrWEXMgJks7nSO3vVuXrqOqtBaPzOYzq
	bJZ6u3+vqjOsoLJTK3zt8TS4zF6oBcsqRVhtQMF3ODcmAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0d21m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:36:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0c1025adbso170417085a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487370; x=1746092170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ki0WMJZKSmFmQy9e7rjeB45XgrpCTsnp8UNMzxotgak=;
        b=Ybz4gg/SsKur3zpnRvdfuVoakMA/msGJZKp/y1ghijwZ+tjir8RrGtrieidUEhE644
         Qy5nAgTElh+IP+FVje3Ktb+AQXyzet1Zz5xsdWVwpA+6ubGpakIIsCLdjNn9qk/ooJGu
         1klzCcumi7+38oQ1U28ETrfzKbQWLfmbu42fpPY2jAA7OyxQl+X1QR6bMwVR+yBEmNi0
         etmfyYkulztV6znGDPayKe3WE+An0TngdQdr4Li7STYXN+PokPM/zpaSd8PuWXNf0gv3
         UPsaEfqyAWn4BWcdXn2m0xtLlM9ZJv148kCKjpLKaqNhMfO0gAAUZardkXdzc0rTBFcg
         h98g==
X-Forwarded-Encrypted: i=1; AJvYcCVvDBXiDf3oRAYFqnyuJC3IgisKGOg0KiKC6iCLk4na/vxC943yAxgDvC5Gl/1g9eXKU9ZZheQ2ZtHvQKBr@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZMRyr+ExkwxlMArGPbBtrsYP4zVNjOzsNF5FiKFePcY7gGSJ
	zujr3Z6R1isMZsN0VML77k4RjEGkgLV+3LYzOma6VyCbXmIsE11NpbDC4/sqayF2L3kl2xvlNi4
	FdRqEkzmG22YxsiAEd5qjQT543xa03E7jTSbn4U8UWzzVCjiBzN2mhKeBH/AMBCNf
X-Gm-Gg: ASbGncuFOUPuilU7xIK2T1n4tPogJxt8KvvNUylmpbfdjwW7hfKUBJcqeud7EljCrXT
	ChN33/mXlGjgpnoDIV+tZmEO+X6U4T1IzY/xvDVAoASBW3m2Dqk9nhrn2b6K3bY7XkCcvmuN3Pu
	92LXQl+rx9ACBMiAoDcC079vm2kmbLth1kgOytw+z6r9ZYu0lSnBiC13OVbM/rPE/GiRC2DRRhP
	mbUmTyzRZNH4GV4FJELIpTPJLTiyTfNb2kDbW3ZtokEZ+Da15pkybjLP5T3Dd4z9ETTjuYNe33o
	imYx6iZgzQZH1Zp0eK5qbMf4hFP3liCVr7vCYtG5pIJs2IFTX8o3uIpvPnhgxbJ/eoFRdIyy3XY
	=
X-Received: by 2002:a05:620a:268c:b0:7c5:4463:29a8 with SMTP id af79cd13be357-7c956e8ee8emr286192785a.11.1745487370267;
        Thu, 24 Apr 2025 02:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ3XpknWBRjJVyY9U395kjM4TMXYtQ89RY/LCEXTfiRyw5qhDQDDxCNr+1yx1C+oNIUZPNCw==
X-Received: by 2002:a05:620a:268c:b0:7c5:4463:29a8 with SMTP id af79cd13be357-7c956e8ee8emr286188885a.11.1745487369953;
        Thu, 24 Apr 2025 02:36:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8387sm164282e87.244.2025.04.24.02.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:36:09 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:36:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v5 00/10] phy: qcom: Introduce USB support for SM8750
Message-ID: <kpub5pyyqb36aajcu2qchcjq7ypqvx4zywxusuvvlq7e7hr32k@ytbygrzwlfqs>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
X-Proofpoint-GUID: 75_yC3P_OOVBHhBeQYerH7ZQUEPvoE7w
X-Proofpoint-ORIG-GUID: 75_yC3P_OOVBHhBeQYerH7ZQUEPvoE7w
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680a060b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=spWr5J_MtH7HAiET_ysA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX8XohzlMXGmdI lf/6VLojx3oAT4JJsNbHhJgNjJuvkGlY2wQsxKlHmQQ19r+drSpnmn5a4SrxU1bnpfuTU8cZscG Hq4imJMubGVjQ9MxovJNg9YlkkIa2kvcF3DHeUvWWuCBLbKIYMwhIhgvFbVMa0IFXEejfruGwvN
 8CYBiTRt3BV4OOJ0ycWPj9DhgY8bxFMTMkNjeBrgviMp3+PtY+FOUUUmUkbp78YAidpemDNhjQ/ QlOGj3FQ1ERf6E7suojgyWDNIntPbCopvWJCv1z2pYG8jKA+beQCTxZH4W6EPdBb6GmMyu6mIrJ nyd4WZGxVWBaY9f8xZTfYiSaFipYTC4U26/0JGYatqiXcKHRh1azMxR1ns8J5VH9SH6FTkzttAi
 BZ43qr/LI1SKO+Meks8dZp/UnKf6rvIenbd0gYezgTcT95Zlp4rq37KDV/yHIva3f9dAmmTr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=592 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

On Mon, Apr 21, 2025 at 03:00:07PM -0700, Melody Olvera wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 
> ---
> Changes in v5:
> - Removed refclk_src from the QMP PHY driver as that is no longer used.
> - The decision to move the TCSR clkref property from controller --> phy
> node was made in v4, and the refclk_src was a lingering change that was
> meant to be removed.  CXO is the parent clock for TCSR clkref, so CXO
> clk will be voted for as well.
> - Relocate the SM8750 compatible within the qcom,dwc3 bindings.  This is
> to take into account the change in clock list.
> - Link to v4: https://lore.kernel.org/r/20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com
> 
> Changes in v4:
> - Made some fixups to the M31 eUSB2 driver

Which fixups?

> - Moved TCSR refclk_en to the QMP PHY DT node
> - Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com
> 

-- 
With best wishes
Dmitry

