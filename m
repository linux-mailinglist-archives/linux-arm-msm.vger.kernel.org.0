Return-Path: <linux-arm-msm+bounces-78657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB8C041FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 04:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F0063B3EF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 02:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F2A258CD9;
	Fri, 24 Oct 2025 02:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ei+CveU6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD271A9F94
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761273169; cv=none; b=UjDduWpT3SPWVjBNDcBwmidR+dVXzsVOqDEsL7lz7yytH8dEUnvAcBoPxI1fB9zsbm2BfzJ7d0iZeDHSFac0Pnh7MxGq6ygYWp3rKOLsYimBVdf3C+YIHdo/BZ5ZbkawA5GOnwhwSIB4PBQhnO20A0bpt5KJdvFtpTIgR4tLc3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761273169; c=relaxed/simple;
	bh=Fmyb8/uY0fVcZFJrkmU4Ph3E9829amQmCC9ZWilJrIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3M0aLzekuNagcwwovHDHwBPuawESy41g5C9f4WUHtPKUsKAloCmVlHYcv1ytgfRgjlROdF2oxwPPOg+0uUYCjnwl8BZhyz0jV/uLqhMmhvIdrUTZ0A1ZvfN216tw6DpnhKgT4KxQcHBotasnMXZEBcWCt8jNaG0HPum3MO8Fc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ei+CveU6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEsoqu011761
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K8n4jQJ0OSelSp8GbDvqIHis
	YCrNm03CqsfjSom7lUs=; b=ei+CveU6DUojLyPgBThAtXMSMw1ukexnV7Y1Kbuv
	/oKwWUCmC2Ig4HRts6V3s6+L7yzD1KSuChwZqPGWrnVttXdd2+s2xkMp23AM+N2b
	hyBOULPPFdvIL+PJRqoyrOL8nuolzMNJzyEELU0S2c1oXgYJuRQjE+J5fTM0PXo3
	GTQg6zmgbzpqBJW8aYZoS+84+8TdFn63ne/xLAqu9SyAXHoUlw7y7vRWdO2aKd6y
	bVYOir0kZirfceU0onX6Uwy72XFyQma2jPraEj3lL5q8+WNoh+Vfogc9luDInfg9
	2+OCWBpbYTnHIi6I4wvOTFnXP1uZNByHgUKm44dArZ95JQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524cqw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:32:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8b15de40fso69750701cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 19:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761273165; x=1761877965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8n4jQJ0OSelSp8GbDvqIHisYCrNm03CqsfjSom7lUs=;
        b=cAX8e6Ua5hjOVIVmNKm+Qnax8nRbxpT2q4a/te72Cg8A9SCwNuaxNCwIOvhUsmj/8J
         gxnvvOp/oBe444Ru4og2kFl/5Mt14i/FQKbCYXwFZFQ38IWciLuOCLLE4wX/+HiF5lXm
         xBERj4U4K0Q7shcdW0P4x0UpDudNLgilHbAhWkWrMAEDiawcSJNXJ4tLPxTKtl0ARQq0
         qxv3X/3ojvtsSNnnlCMwP62ftThxAFBiKWVBWLkeOrtFYDyBpQ4siPkqWRtACn06VTg4
         fAT/KJ0pL+vHt1/BMBt8VFFO6w5dpXStHO655jz+cpSYJDtVh2yxxuJxXPKf0NZjOroF
         ZyWg==
X-Forwarded-Encrypted: i=1; AJvYcCW/CUEvIelM/IvbG3YlLi6UgEjH2pIRZeHVYEDwxYAql8iGet/zpNt2Eyb3crpykpOuyKycF6JRKcbk6Zw9@vger.kernel.org
X-Gm-Message-State: AOJu0YzCr8cXbPL4Li9O0psLnWH0IpDPDidJFak/LzxXIDgCsmL/gSSe
	+dDYmNfnOFlVcFDDfx8NLpKrZvcxpeDzchvTAD887Qa7zCnqluNhqPT1ugjbovI8GG34nyVeBLX
	GiX34D+SQycgk3sujfYqo8LlqSaWpcpCjq6H9otc8yg93kFESdaeSGB+GRdFfMWlcdpev
X-Gm-Gg: ASbGncv72L03VRXl6wZ6TGiXXLB/bHfx1jz5wTCmK+TaSrlF+CCUp/uDMdf+AaNInry
	ppDcU44LwiuFodFH60Ohx8QvUCuQ5cYh6KJSYnQTPqcl76b+3I2Sf5j3glv6x+r3co7mcShoc3k
	spwjySAlomrKhGSL/OGWrjAfGfo8KpV+Gzgrygx9WCMvVnN9RWwAYVE4M0HNi4DqI3MURZcUwrH
	0zecRe1Uyc8ZJWQgXHLTGbGWafSGdHxGMVoVTtygq2Lq4OeU+cdgQESjck8Ng004Stg2aDCecEB
	PqhUE9As7rSYmHWmj4uBOxsT6PxqFtDR5tVYNWV0lMx8DgWMWD/u4U5IrLlTOIAbvZvaCtfMkNI
	eyKm3QeXf783ZNcTGpxVtVQa48Hj+BLfX9V3E1dsK0nTIjlYhnh7EmBMcLvAp
X-Received: by 2002:ac8:5a46:0:b0:4b3:3b2:2b4b with SMTP id d75a77b69052e-4e89d0507eemr299680291cf.0.1761273165119;
        Thu, 23 Oct 2025 19:32:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8RJLrpZlLDIekUoulVf3HkGeQaD97twoWzv+nd9iE5tF9H+Ujsga2U2zLGTAjXkx/iNwf2w==
X-Received: by 2002:ac8:5a46:0:b0:4b3:3b2:2b4b with SMTP id d75a77b69052e-4e89d0507eemr299679691cf.0.1761273163987;
        Thu, 23 Oct 2025 19:32:43 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89c12056aefsm284098785a.48.2025.10.23.19.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 19:32:43 -0700 (PDT)
Date: Fri, 24 Oct 2025 10:32:31 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 00/12] drm/msm: Add support for Kaanapali
Message-ID: <aPrlP+vtLTt/j23E@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <r6kjuxajnimaqazeimzc5gscv2qxudjzkyooxumzakjzojibbl@2jiw6duxfbtz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r6kjuxajnimaqazeimzc5gscv2qxudjzkyooxumzakjzojibbl@2jiw6duxfbtz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfXye4vxur+bj5e
 EM0FifxvGFeVg3/7NWKV7J5T93pw0Ek5NbiYNipcAyExP2lfomb14DwW6dL/ORJ8rYGIOiIC/Mf
 qxMyOWi2xevueLDN33Ez8npjustY/2vzMgfxnzttnPaZiRhexnBbj5XrzWq0KRNzfSlBhlctQ1C
 0+uWT0vqxMTKIEMZLtZ8gjbYWEileB9uLJS9nKZMqDvfq08nC4asyyWoL49y9Aq6aF0LfX4xUYI
 8BrK/fBELtJjxsFduXjzFfk6HmC51CoWda82cc0AMFs7ntrN8uJrZrvdR6Lbv8EO9grmTLJt6lt
 w/701pty0th3ykHyXfHvv9ko9zvcomHaxxuwFWavKyqhpccAksq2x7XsyH98k946NAqFyDHxoOT
 0APV2PTpryq7YZkzNXoLHGzRi+EGuA==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fae54e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8 a=sB9pjYolMnSuqpLAuykA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: LbaxM8eGvmEkfPK1aUV_MwwFYFVyjMWL
X-Proofpoint-ORIG-GUID: LbaxM8eGvmEkfPK1aUV_MwwFYFVyjMWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On Thu, Oct 23, 2025 at 02:46:10PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 03:53:49PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> > - DSI PHY/DSI base address have some changes.
> > - DPU 13.0:
> >   - SSPP layout has a great change.
> >   - interrupt INTF layout has some changes.
> > 
> > This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> > in addition to the driver changes.
> > 
> > We have already tested the display functionality using the Kaanapali-mtp
> > device on the Kaanapali branch of kernel-qcom repository.
> > Test command: "modetest -r -v"
> > kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> > Yuanjie Yang (12):
> >   drm/msm/dsi/phy: Add support for Kaanapali
> >   drm/msm/dpu: Add support for Kaanapali DPU
> >   drm/msm/dpu: Compatible with Kaanapali interrupt register
> >   drm/msm/mdss: Add support for Kaanapali
> >   drm/msm/dsi: Add support for Kaanapali
> >   drm/msm/dpu: Add Kaanapali SSPP sub-block support
> >   drm/panel: Set sufficient voltage for panel nt37801
> >   arm64: defconfig: Enable NT37801 DSI panel driver
> >   dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
> >   dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSi PHY
> >   dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
> >   dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali

OK, get it, will fix.

Thanks,
Yuanjie
 
> The order is wrong:
> 
> - bindings
> - driver changes
> - DT changes
> 
> 
> -- 
> With best wishes
> Dmitry

