Return-Path: <linux-arm-msm+bounces-78926-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D15C0E287
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:51:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 65D2B4F2F20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5EB7494;
	Mon, 27 Oct 2025 13:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3Wo2sjU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC02C9D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761572805; cv=none; b=HqGTgYf4ZY/wmNDeAvN4LbJGoSUEZ9z/Zk6sEszvCnzXVNQn03L01J1aH8jYrZlTd60ZI40gdFB2BwG0/Ch3e2y5f8My8iZfZtLU/R0o0SrKkExT93gPZs1zIjW/fOqN4CGoTPzmMACtkheDmmF4S/RPdRovfxEqcOr6jg4ImAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761572805; c=relaxed/simple;
	bh=Cp8lEsqEQQ9fcPbG0nH+LtTIUvD8bKC6Pxf1o+voE3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbkRkdzFy/rlRZSB98CSxvBKE4nT3Jim/2893mximcdZj6wz3C57qsres67fJaLZc32GIudWZrRLoUbLvWUwYo6iQzGteGvp+OQs65BMownFTurHNtp7UotkgsJQybufN4tR7IeU0UYr4snrshTJB38VEZCxMgO6s0a+3tlVgc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3Wo2sjU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RCL50x2752398
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i35dGP+d/0dkL0iLpgcnTIbC
	n7co3QE46vuJ/cBPHB8=; b=V3Wo2sjUAO8NHRkWMT81g+mImu8ocvYH1QzGV/lz
	ckcrE62YXcyWO2z0g2/MzO+mNVR2Z6rnB1oomvm0AF2Kegzo6ODpXebkoNU30kFU
	ifbDHLLzEEEVXTvKm+Un/UXNrV/dT1uQG2sduvvAxwckV/lcc6VKGYrhkxmrO3SH
	BUJboaFkKvPYEHctPdqFZm1TxPhUUdxVAPJ4YK0gwX4CddMu4EUmxvbpOUWFRq8y
	pVEaj+jaEnQhL76wxJIXf6DhKxpIkEh0JSc6QHW0uLm7iGso/nnjGiSnjaTIAEdB
	Omujr0+0p5XQoxSHEkGsb6lkJUrMVDu0Cmvc9I5+66H39g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28nsr7ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:46:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e892f776d0so223261561cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761572803; x=1762177603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i35dGP+d/0dkL0iLpgcnTIbCn7co3QE46vuJ/cBPHB8=;
        b=GVDo+v/pMTFVWmGtertlY70M2retvoj8orm6ss18tU1q+nSp0jDI8pMTR+B1K6INai
         6wgL3abe8HBqXM6xQM2I88FB/R5t0wva/abrkopubNWQge3WOuB2jf1z0RvYyP8Njqul
         wtcCGWWxq+oHJd0G64BLK6a8KtB3Adm/nX8NM9uLvQlQ+Qu7ivSzyhy8FzSq3lYJgBll
         ZjWzWz3kzlvfLDcXzR0FGbK0uVzO+AepbfgHtEPsCHlV62R5uAIbM7PBFw6qDZu3LKs/
         mCK//d/Eq5K0btikl/FF4pBm50cPMt/T6npwkPcjFMyHOLfD6PwV+ws2Q+KBGLiH02d2
         24HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdcAYi3vmJ+4TwlSu4cS08Ao0xkNZYPs6kF2EfrEYVkViJS4SVPpyX5c3pyfjlSjOi9jx/zxeQxvrs0xWU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy56CYcu8Zgvq3WHoIu/PH+PfA9GyLbtZVjqkDzBJQJEBK+LVXC
	2r8hvVWiy2QEoZ4Z8gzy7nC8fZ6aKmK/fjza/HVZB6UGFMOXfBdMChOADHeTrHZfWEwlPH5qwGQ
	u5Y34uoS2mglHimh3oe9+zb+sQMl29lWoh3MVAwxwEitZYsjXcUFrmxO8zAiQdIFeKAe7
X-Gm-Gg: ASbGnctby5dgcs7UxCyMRbBJRA83Gq6ZZdWwe4KP59dH2ad/bzrgvUIf32cHRYKx4mG
	wtfFVqCOjybXu7Ax12XmuXDVApsYZuxYN4mAeGXGCT3TyNGREg/xpMyCQLewCjSCkijQM2V5yS5
	q8CKNGn5Wn7F/MrfhJtrqs0MWvqxRyMAFwy8xpyypNN4uHOCP9d1cbrAmAF40fmFptP4MK7k4Dh
	NnJuM353WAhJD1BqK756jz9uOIGfE/57m+VF8GmRMgylOVBa6ocz67y67+hJN3XX1JM6OwWa9ok
	CSfwa9tcssBzgdJh7k2heTc48Dxew4cvbX+4Fu1bOcuYgSewjmdTkRkC8VsKU5uNt/ma4lodSEW
	3e2pm1JgnJsN1RrbcZ5yFj+YgnSWgG8zoFaf+TnFBcteI6DhCgxZhbNx/rpevMDsnWdNDpGsUAx
	IfGLUEx3b6VHfc
X-Received: by 2002:a05:622a:481a:b0:4ed:14b:a654 with SMTP id d75a77b69052e-4ed014ba734mr18171801cf.19.1761572167953;
        Mon, 27 Oct 2025 06:36:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSA/sQgxBWrfN3yrs9iaFXpBMGNK/JjKUCLuabLCZo3BMcmoJ0EqI8OAXaO8cxld/gWmQocA==
X-Received: by 2002:a05:622a:481a:b0:4ed:14b:a654 with SMTP id d75a77b69052e-4ed014ba734mr18170961cf.19.1761572167217;
        Mon, 27 Oct 2025 06:36:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59302a2420dsm2222513e87.72.2025.10.27.06.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:36:06 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:36:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Vinod Koul <vkoul@kernel.org>, Sinan Kaya <okaya@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@amd.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Md Sadre Alam <quic_mdalam@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        Abin Joseph <abin.joseph@amd.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] dmaengine: qcom: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <wl26pbhmquwuavfch2vj2s2uispcelthn3eg7umx2dboz4ntry@uqtpzhuj4gji>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
 <20251027133232.392898-3-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027133232.392898-3-sakari.ailus@linux.intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyOCBTYWx0ZWRfXz8NNNLsrp/FM
 7zEZnPxclTbyhKTuSSUj3/hRfkY4WmzXYPUffUszdInK8cvMf8qxmxM0l2Yc5pZfRsUmmfRBwhd
 V9XaO2yufAm3v0+toMLveWBRvpd95x+xSU1DWbBW6AayiZvagnuhIZimuJALIBdwJImzRUJSY2w
 9aa/zp1kKHRIsUV9prVKb9M579QYnrES/PVY/u8SyAy70Y4uEfYoAt8Gmn++tfY2Wi+MM4mguwT
 k1/yyUqGmyKpxdWJ+IDhfB8UILFLSgNvjXdijkL4n6VxMbSAdXHCgT2AJOw78Zcm8Gy1k5kZLMj
 h3XJps27BcjpubBUXHyG/2M9KV9x1Oadg4+aF3Hnr/5SOK83uABOjgKkomxiPFFA8RkvXg/XpUt
 CLEpyDJj4wHxdV1/rcezMvhJUaGUxA==
X-Authority-Analysis: v=2.4 cv=RIW+3oi+ c=1 sm=1 tr=0 ts=68ff77c3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=QXuSEnVgnoAJZhOi9yIA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Q5K8zGSjyxccmuu5aE38R3MLl4Xhw74E
X-Proofpoint-GUID: Q5K8zGSjyxccmuu5aE38R3MLl4Xhw74E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270128

On Mon, Oct 27, 2025 at 03:32:29PM +0200, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/dma/qcom/bam_dma.c    |  5 -----
>  drivers/dma/qcom/hidma.c      | 12 +-----------
>  drivers/dma/qcom/hidma_dbg.c  |  1 -
>  drivers/dma/qcom/hidma_mgmt.c |  2 --
>  4 files changed, 1 insertion(+), 19 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

