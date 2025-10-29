Return-Path: <linux-arm-msm+bounces-79324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA1FC18182
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 03:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DE35B4E6550
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 02:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF482EA749;
	Wed, 29 Oct 2025 02:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ut/oCb8h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6p8hIuk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27F82EB5BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761706188; cv=none; b=oa8m1P0r/dmYxubj9JXB3PnWFGHHros5ihFDJmuHLskPSPJzlLgL6ZK4s4CNiVmXdAQ9BbEbacjbQwZaHCAYHmZRHrQZ0Q2LDwPvuG0plMrjTb/TencUaCj7wGcDUL38Fu8cSTqx4MDVJVfNJcaSqdOR9Can3MeLEWZdCqdG3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761706188; c=relaxed/simple;
	bh=wvRS8VPUuvKAreHwF1pR5TrD0CYRn4BR4E1ITJN738s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRubzq0lmfos0sxDHDq8pBHV5lV+zeJSNKDe+zYZS33JiclIhvfssNOBcw0iqMWs0HDuxJdl9pytd36wWoK4RLQdXSMyYPjy+fXTsVi571/VGn/2b+PWTlHJNfqD/szfyyOhrQgFaIww7VHw1+xMAa7OteqHWRzmRUTpZjbeHF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ut/oCb8h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6p8hIuk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlOca2609708
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+IF6cvldBL9/Hg1NTLulnIyX
	YhW7ryKIv8gV0TonztQ=; b=Ut/oCb8hisq9FyFWEkT0jllUIZYdbai2V+ps1h0k
	aGtXDkRhVsBxB/mDmyd+tQmyp/nd1l7Xw5+DHlng12DW22mW/Xgay6H23BNq9Z1T
	dWsdAWrzIRHpR+CbZkIGphG34TDVgWKLU1ft3ibaaFgch1WGK3dW6Mz9O0f052wa
	ovT0GjPPO0wPK2AdRdGFKoBDSVmrXpc7KRbF4+tNE/lss+bl21Y4+vVG30cfo1qu
	RCmA0Rh+mkCC4Xz2nr1VB5RXFpbEMuU0iu1G8Y3uCHCl7ekbY7dsvjPBlQfRlGVM
	vGblmYFPjP6EoXsJk2xJCd5WZMeMjx1TgIBQGu+OE2gdhw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a00y44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 02:49:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-87c1f18cbc6so277158046d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 19:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761706185; x=1762310985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+IF6cvldBL9/Hg1NTLulnIyXYhW7ryKIv8gV0TonztQ=;
        b=c6p8hIukrzPkarcRdCLVV4TR5+g8DtxPjaYz/1U/pmG0T43NXIA2i3VK35NvMwV1f7
         2P9QZGmRDMN0l1LgVFBtkVflrrOGyY2nZgfO8lWnANQPg2LHswp01PtM5gVIDHKcmzsb
         yRTXDVNIsqhWkiczjAfRqK8yWmlxbJCnHdtQSJmUsda8McNd7CnfQayU2E3Ku/PToYqx
         B4CWkz3bsCqesA6jFxsZeVEOPeB2RNuLVgV3VOV1B55RWmlbANp03vGyAMCh4/+4jN5P
         o2VvreRJm/vggsMGmayzEe+yoEtf9e1CZAVCFjnJKdhFG+8N+fo8fpiHfZudPSHYqzy0
         g2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706185; x=1762310985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IF6cvldBL9/Hg1NTLulnIyXYhW7ryKIv8gV0TonztQ=;
        b=nBdzEukf0lFmp/k+qFm+geEHWmCk5HHl8YvsfAOrzVZjVGIiN2J57drSx3M8t6FLFe
         refM6jmizLjJbCUpwF2KUWsMs/6k4YJM+xrP7sPB/ky0AKxN0QRknsmt0dwzfhhHicoj
         31RvYcuJNmySFtTAdlFovc5Ay68BX1H5xK/UV3NGDRTkYJDA/RkNgsBbTkrT6/ZdLRRT
         riixDKlNcs/hzNfxx4aL+VQ+TsH3yZEA/p8+3vJAsUhVY4QE87LdcvSZuqPQfqryQo3q
         AtYbNnCtXux/MhshNbxGjHndYAUoxfXTOVE3xjuXSs/fwhqEzbAROXAiJov+CSm2AIvM
         uwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWukPhFp1u4RVdg5M79Ca2sElYe0hT9ROfiE+JhBzRDgXJDB69m2t6F6wgKKk/vG5g5OKlD0pAdtfEZZbyS@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ5HkO4Aw3pM2uDFa9d2yuyNlUh1gkGlbVv0OhC+oIZBUjziwW
	9LhT1L0FLt/wXLleFTN0aFQhS0kL94SppyY6miza6JFU1x4/SztQmxsX7csUequP567m/kYhcwq
	YklD50tjvHbWs5kUZjnVakAXBNEi0/eCqsFpkJvFvNqf4MvBu3qECFR2SvmFucKMNi72b
X-Gm-Gg: ASbGncv8wGmsVAEJ3BOVyDL5CsQfycHIWBQHNAygaLOjQieM3x6Ek1IoOz0DlenWKuw
	lhwpZcpi+eR6W9oyZrVti8OZeqv6i9kdwX5ZhSEMVaqBqPULZfPuLUvUvxpNcrbdHr2/Rb4i0zh
	oqsIo+4dkEImc67t4KBVG/uRX85s9qkUYASyW0pYASlapN/JeKn7Wx8LSQkv2esNiADTlXwm6hA
	inI4LWYAooRYCvy3+QKauQHyOijmq5nux6aS1FYTcJee/sBAMerPqXnPQyCK6sh/d4PHdUHRH+w
	Dnbyt85E9sD0BIG38M7cx4Z8fpfYnpzljK1NqjEKrXdLj8/gKSzBtfopGvhGaJ4H76CroBaHntf
	ViHdl2c0rhN8ze8eiI02CufzuOTGIGbN00UEdukdfe33zbXzutdg1iE5Tw0EzQdjL
X-Received: by 2002:ad4:4ea8:0:b0:87c:2282:993e with SMTP id 6a1803df08f44-88009aee75amr19409816d6.2.1761706185118;
        Tue, 28 Oct 2025 19:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxLVn+gGv7wMn67kYf9uALNr3Oz46eoit5eH5w2JkzMEJGDyTOwUBUpSX+Ha8pY+Y9GCwLJg==
X-Received: by 2002:ad4:4ea8:0:b0:87c:2282:993e with SMTP id 6a1803df08f44-88009aee75amr19409646d6.2.1761706184710;
        Tue, 28 Oct 2025 19:49:44 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48a8812sm93936406d6.11.2025.10.28.19.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:49:44 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:49:32 +0800
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
Message-ID: <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
 <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyMSBTYWx0ZWRfX/O3FRgSzuOs6
 MAMxLlRUObU1hKrqq6S/+MQmV85adwQGM2mO1YDLf/1SkeDuE5ijnNmVdUhiCYLKzuUe0ENNkd0
 E6FJoWfdvaeDmyf5NwBhIyG3AiItvWsJdOdmjwjwDppwjZwayDLO/2lPaeQ8f/ShMNNMo6IXdet
 L9A7cDDvvXGqwvj2Yl86+hl57X3+LoL3c7XPAlT9A8sNfHDQlK0FDvJKzsdsy7rzyRsnLK128Ot
 QurJdT735ph19PLF/8gMSaytYp7LAx41ZyAnbyCyXaQQqFWDoZlVQWLi8AI3eGBSKBzDm8plvXP
 1RdlFzvr0lf+A2FXU36y3wu2I1iB3br/BGnJZPA4OIPBoLHU+EbktvEPieorzjxARm810hs3QSE
 rd4xmsuFaE/KZWwCg9bSCNnpNjNYiQ==
X-Proofpoint-GUID: 7GV3MVe2FvwpQlRfbgnSZKH_qSxXRKmm
X-Proofpoint-ORIG-GUID: 7GV3MVe2FvwpQlRfbgnSZKH_qSxXRKmm
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=690180ca cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6MqEXzQhl84AYe3cEQYA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290021

On Mon, Oct 27, 2025 at 03:21:33PM +0200, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> > On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > 
> > > > DPU version 13 introduces changes to the interrupt register
> > > > layout. Update the driver to support these modifications for
> > > > proper interrupt handling.
> > > 
> > > So... Previous patch enabled support for the platform and it has been
> > > using wrong registers for interrupts? I think that's broken.
> > 
> > I want to express DPU 13 has different INTF register address, so need to add new
> > interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.
> 
> Make sure that patches are structured logically. You can not enable
> support for the hardware if the interrupts are not (yet) handled.

Kaanapali Dpu interrupts: 
INTR_IDX_VSYNC,
INTR_IDX_PINGPONG,
INTR_IDX_UNDERRUN,
INTR_IDX_CTL_START,
INTR_IDX_RDPTR,
INTR_IDX_WB_DONE,

are handled by irq handler, so here enable dpu_intr_set_13xx. 


Thanks,
Yuanjie
 
> 
> -- 
> With best wishes
> Dmitry

