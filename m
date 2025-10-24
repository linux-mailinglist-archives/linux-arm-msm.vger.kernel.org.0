Return-Path: <linux-arm-msm+bounces-78662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD85C04328
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 04:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97FB11AA2ECD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 02:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CFD265606;
	Fri, 24 Oct 2025 02:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eUrSOHyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF7972639
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761274764; cv=none; b=bw7IWxZSQiMJ97i82i9Fe4bLDGhhAeAK8mp2ZPVK2qeUi2QetenLeNvvkZPHo2blQ9maXYAvW1NS3Z6LyoCpnIbD+6d4yqGf+PDWHfa8wXw+rQngUXsiJWIdyNRzyRi/HXbwxWWTYoM7gN1JZlzDZHJ7AhAjZp5/yILRFMfbcMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761274764; c=relaxed/simple;
	bh=s/bxgWQ2osWXjwr2KotWn8dyknnYa2vRT9k+3Hb3BdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZSKvw34D4wN82ThMFqZG35k8OO0cioTlrLkkIHsFdWE4KarJLU5DvVXA38zVZ+iaQLWC2jYrsPGF72yjZ0ZsHhfJDfCA7nGPmwvzXFAYZFUHAC5PcR7SDfOaCHAgil3tZsbBkAT5WPWCiIcIt6/ptlIwlAAkGhGfenjLzrwP18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUrSOHyj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NEtMhZ022471
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=alHbWdl9Rj2RBorWf/yZSPFW
	VTNaKm9v1UuWbZYPNvQ=; b=eUrSOHyj7vWrS2OW5rC4UsVIJg5sxsso6QnHTwpF
	wsk6WgAezBockomuEiWMVZJ/Ihf9AqYUyJaiY1UUFMfD9BdifmOZySj2dh+//afH
	gl5O2dqNb5SskkfICscvFv8ZJ4PlEnmOe5U2oKoSoWO6h7lfNS2M/6gZ47aTpzHg
	ZcGUILrnS+M+WQNCkJVtrXNS/kcmeX3Hlj3dSpJgkxZUsu2V/QcgqeUNOT/EN4G3
	ViG3Lek8j9TvmY1EV8rgEtcwX2PwezOLkw373YD8UVQq1a6m1LwKGCz5FvbcQnTN
	LI/AVcYq93xWoPiwbNorIadVkXLW6L6/tfiXFh9Y/B9Prg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8ajwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 02:59:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-88f7eff9d5fso443409485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 19:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761274760; x=1761879560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alHbWdl9Rj2RBorWf/yZSPFWVTNaKm9v1UuWbZYPNvQ=;
        b=RdSyZ/a4owHuoXCabKPD0Sy5jCfqs7FNKX0CltGMC7JNIractszDjHcBXJmMkPi/f1
         PHChSM1KSmlpOgmcRFUeThkCSqUrB1PkxoiiPYvz09F4HOv432hItUwS9H0pDC2pJm02
         1QbOexqNCJ5f0MzxKw2AEXCk/bdkPOLXqB80Zkyb0X4vLn92HhyD7Kke0DyyhvccGHaB
         tac8PN4zsoNlZjxjc/S9OyR56LD8CZll9NvVuqhJw5KKrCXibZLSCJyEPVENcPDDKWzV
         YPszkrNs7CqXXuzFDKnJz47TEk51yOTITqXCOJc8e06FZTYOcJuo0Mf4KYI8eyHZX+Ji
         Ddfw==
X-Forwarded-Encrypted: i=1; AJvYcCVLWCTKhhsAweYzd3SpJzO1Vfx+2qA71+BGAqdl8k35SR7TCdupuPV9fPVcB7tU9JZ6inPPmI5aapg2twsU@vger.kernel.org
X-Gm-Message-State: AOJu0YyRlmgW94hkOPEV9Qsp8fMUmXsqaWpocRAM0/w6NwiHfcxu02H2
	ZdPjb9D/C8wN2owG8BWMq+n218L8XngK7YhxB0T1glfUv9hBqmJtbpaUkMkm1NszJDla91r2Vpi
	reNMfthGyZ0oMTGQ1PUQc/EW7GDYbdSs8AOHl+VFBAQt2iudyyW3WBqrfn+b8dUCICZSu
X-Gm-Gg: ASbGncvoS3P0G/TQcbDcs/76q6urMIXNeSu1/tziDJvyMohXCjZfJu/rxug5CbWds28
	74S9bAEZgWlgKjttfR/weSlN1X6zEabSdfe51CeuzQunz3lkTkjCGaTcqly2G7hWtoXlRm6TBci
	FxQVMiqm8OwaUkB8Rqt4TmUClC2ZV9qnVgNQ4pESPXRUkDLlrUz42S9Kh5DeQwJL1idzC/Sl1k8
	XlQc65wCVsogVjw8biNMbUMfQRPA6FzzB9YprP118CudPzfXeENEPCklSPk81vmecV39utwW0IX
	TaSKMM4AATeKlFVWOXwxcxDnGBruPqHQKqHfZZT3zVJMwhk4GGeSIisvhsVKyC1TiBxHB/KY0nW
	UHFZDNufXAWw0l+Br00UScLWoh7feAG3v496lbVk+qmX92Y2OpzEv96mwijXj
X-Received: by 2002:a05:620a:44d1:b0:89a:ad1c:5135 with SMTP id af79cd13be357-89aad1c5576mr1081386985a.0.1761274759958;
        Thu, 23 Oct 2025 19:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHu/QPO9m9brJvJf/IlDol46ZUfnhMKMfRAWUSM0GHftzDhJSrp/isYST7dyuvvS0TjSLd0GA==
X-Received: by 2002:a05:620a:44d1:b0:89a:ad1c:5135 with SMTP id af79cd13be357-89aad1c5576mr1081384785a.0.1761274759524;
        Thu, 23 Oct 2025 19:59:19 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89c1264383bsm291555585a.59.2025.10.23.19.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 19:59:19 -0700 (PDT)
Date: Fri, 24 Oct 2025 10:59:07 +0800
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
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfXwqoyQjINfX+P
 ql6Uh62Zl0g77J1+PO4rliCPunH17fQj37QjT6+DvitbcyRoNE/dtfUweV8/fiENLaKPMJgAtNq
 PWm4sVxUw2u/L9KxmImG92gIj6ktukry8WbiHj43cIfI+8yjMbZHNZmWwQISXwx9UWKoUrmQwaX
 KwF6MXfzm/98qGgmeNlWq3JDqjg8ffYBtKlLwUvAkqrI400g/bIQB5XDYQE5xqfABODbl8//k8l
 Ln5RjKjULTAfl4VtzQafMbLtKs/okDKF1xZUynForHxh4/MH2HVIXuo7H27Z9cpnvpV0p8sYse4
 b3LTw3pfRY1EfpE64TlZWlcVqDJZZknAE8pdhRGZTDOTffGRFo2YCmDktg7gt6kVhtmogkkUWed
 QXo46D4usBS4WX12hhf2O8rTLU3SZQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68faeb88 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EXeeq68Q20KqPfprLVgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: GmCxB-C9AI3G94otFMtNcN5oFMdBHgwm
X-Proofpoint-ORIG-GUID: GmCxB-C9AI3G94otFMtNcN5oFMdBHgwm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > DPU version 13 introduces changes to the interrupt register
> > layout. Update the driver to support these modifications for
> > proper interrupt handling.
> 
> So... Previous patch enabled support for the platform and it has been
> using wrong registers for interrupts? I think that's broken.

I want to express DPU 13 has different INTF register address, so need to add new
interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.

> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
> >  1 file changed, 88 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > index 49bd77a755aa..8d265581f6ec 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> > @@ -40,6 +40,15 @@
> >  #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
> >  #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
> >  
> > +#define MDP_INTF_REV_13xx_OFF(intf)			(0x18D000 + 0x1000 * (intf))
> 
> Lowercase hex
OK, will fix.

> > +#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
> > +#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
> > +#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
> > +#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18D800 + 0x1000 * (intf))
> > +#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
> > +#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
> > +#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
> > +
> >  /**
> >   * struct dpu_intr_reg - array of DPU register sets
> >   * @clr_off:	offset to CLEAR reg
> 
> -- 
> With best wishes
> Dmitry

Thanks,
Yuanjie

