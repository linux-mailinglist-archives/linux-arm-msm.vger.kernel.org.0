Return-Path: <linux-arm-msm+bounces-55139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B17A98B42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC80218846C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 806B1199FAF;
	Wed, 23 Apr 2025 13:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbwdTD0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F409C19D09C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415303; cv=none; b=fy/+OWZfOjya8xJVYDvk0J7X2Et84pW4BY8TMqbb/y3Cmes87F0ViEUHUg2P0fFrNnXV1GAfi+PskenzA8h/rY/jSROpTKeOLb1AxdeZhGGC2KQid7khgzTKg6aD16KpGVI24kESxNzD7/2AYMtx5w9CfnZzgLdpiI3dE8z+fz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415303; c=relaxed/simple;
	bh=x1xM099k58e962H/jec7C2ksEWH7T+h7cL/fb7TmtjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQHuQhykGnE7JRkjA9nTSM5YXLZWawwAbe9ciuJnCfLGsf6Y9//Omp+vB/8N/TjghkSAudwZrAFw2R8VKXfXhqEfKv4gmk08Nr/l6690QzN0jqguIdWFz9h/duiOBfdDfkdz+1d7Z6gGKVLoDBze41UlIvwvQtqozj287BxuACg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbwdTD0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NBEsJr014367
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gesSST3I2MpEnFmeJa5ypS5I
	NGFvjsE/z3/d2bgX7FA=; b=mbwdTD0gUiHIlzwNnGcBQa9jIH7BinPCACO9hTfS
	z8O+fZDwmsUffir2JzHl2CLmdqpMbDLmWun6cj9bVdLc33PFLLFds7Ys8OG1BkmL
	IoFmNBLeRmHs2NZqKVEwyGj1lauclEzAuPHcRPm9NtwQKYWF9XQWIE/1pdqM/NTk
	Qh9aYR+Wwge19cj31Sr4y/G9KQtEUg7uos3yyWwdH1SDn/46xwVcFhuGsBiQaR6+
	r0BhQ3Fn6xJvHufcvKJNiIQXAtCq5GdO7O1wu6Tnvlyo+r3G6OsjLQE78N2N+36L
	rHwpcejcoQLoV2X895FprXVLJfB6Zglm9dvA2yv+B89gxQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a8c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 13:35:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so1092792185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 06:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415300; x=1746020100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gesSST3I2MpEnFmeJa5ypS5INGFvjsE/z3/d2bgX7FA=;
        b=GxS9cXNOr694egO7LFnQoZEdyqFzAP5HnzFvls1eFzpwefI6pEMdSs0Iq720IkTggO
         zZ2euAMH4bR2vvt0TY2s+45tzPgSFuBzHPxBSg1NhmlcpBYxwqkLWxSLFfCoqZOfeofq
         Dq5Zv0sYbVQuIfOYaoJdvil8WkhLIecQMPymMRtRzQj6WUs68yvQwnBjThlfrI3rY6gD
         PolBwbwEoNdYQJgsxlYF05FVZsV1rnILnXdH1fh1uoM+VeRd8uzHKGmQUxvRsHNOyETV
         s/uVaHkcHs/kwfQBEKcABkLXJQ09fLg0hmE6PA6DOvthUfybXKkvzA8wgCHpAF/hxK02
         UDrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcJXfKsa7UfhK7JDCXpC6i6c5QwNi4uJ4flYN3jsmTHVOlxhWGBqlo2zFOLydnTMKx8yD3DytQTjiBX6ys@vger.kernel.org
X-Gm-Message-State: AOJu0YyMK2bJEI6gtv9z+DjUISFu4cEu4Kw9GQxl3Z5O8gWStXK+JKuD
	16okqwN0C7dHtYQlD25OpOifgIWgeQX64PGAJeMNeO5ZaU4oVQOc7+0dESc0daxifBLxc/yfp4N
	N6/irRuadJy5G993kvMWstr8QPQDD5pk+6owi3Xt+KPDvJZIzARViTM+JKoMz+Uqi
X-Gm-Gg: ASbGncsFKgIHrxxXqCGjfusbOb9U4dXuuHq/2oWvT4fdKHp2BJ9rsgmg47zs3MuWCTF
	LB41/xLuMoY3YAWOFggIIg/uBeqQY8GahgUraUTzMxQoJmh3rwdSA5BE5CDw6OyRRd0beGe3Oxh
	wL4DeSxdX20KD07zRw3FfH3kyHj2qeWaJxftavB+kg7rQwOOYK9PAi5FYjBAIq7hzAHtfMNHZAI
	/rVwHgmerNyTFhKhnjS3d/ZSuqG1tfr9AHqDL0eNrorEE1YhgIn3ZQhKFdSzW4Yo6RnjzPyOCwm
	BafeZ3ogc3esv/Ag9ur+yvJ4TQb/IBsedFHquUHfaxrAFma5vwUNl1fUefZ4FpSiKov/e2eavEI
	=
X-Received: by 2002:a05:620a:3908:b0:7c7:b4ba:ebf9 with SMTP id af79cd13be357-7c927f98e4dmr3123333685a.22.1745415299645;
        Wed, 23 Apr 2025 06:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSwjmlcZib7gDeiGUVw/szN/iy8E/BLJscu+dW5fLmscxF+J7iPAozkJczfQ5JeB0jI4FQ8A==
X-Received: by 2002:a05:620a:3908:b0:7c7:b4ba:ebf9 with SMTP id af79cd13be357-7c927f98e4dmr3123327885a.22.1745415299093;
        Wed, 23 Apr 2025 06:34:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f61a1sm1563103e87.241.2025.04.23.06.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:34:58 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:34:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 5/9] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
Message-ID: <w2fuv2xnvszlbwdlxvakkex6sce2mm32uslft5ma2zvz2gscvd@chgzsflkgxvs>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-6-quic_nitirawa@quicinc.com>
 <zvc3gf7mek7u46wlcrjak3j2hihj4vfgdwpdzjhvnxxowuyvsr@hlra5bmz5ign>
 <4557abf9-bcd2-4a06-8161-43ad5047b277@quicinc.com>
 <CAO9ioeXyDWOhe1cbGO_tR=ppZd1aC0GSdeMzQjir4XmDRMQ3Jg@mail.gmail.com>
 <64216a90-e2e0-435c-87bc-388c72a702c0@quicinc.com>
 <sajcoh34gyfcvhik3yairil65guvp2rt2xdmbmlpmlcjvst5ci@qojbxhmrnrxj>
 <0d763853-5b1a-433e-9fa1-23ea0184b9bb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d763853-5b1a-433e-9fa1-23ea0184b9bb@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfX/dXBeqBWQvvN wSqdpuUYWCholPxRCYLmmh0h/9YHrvR1Df9aa3jl2odiZ0IEoVkTIWJBR24psU/qumD1q6674le LYZJ9+BzvRbL9nlvrawinBVrUw3f3DJwb/yYmSY5kJuQtgEukkAmKZ2C1NKNYlCea1cH7Y/BTIl
 cwGYz8R3FssfAgVi4NRx+egehIbHCDa81BVghlR0Cb+T691buJrk9NpUdHMecyE7XbDeTjcLYiy ZxqhhBiymqWdco0joi1Z1uiq8sXtWfUOpETBo24hOMEVpO2TwyQXznbExFsBDp+Z9RafEPiL5ym nx3D5RTB3rf3JsMpuLD9j84Mzl55wWFYlVutKa0TZrz2jUwN5SGf9PalHiqDGtoSHTWbMyZwUbr
 2QCoDfZwYuDmTNWN09EDc+gzeDALl4shCFdG2AMt/95ecwauK1g+3hfnfG1yuPVoG+PnT2d/
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808ec84 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aCPLThnsKnsU9gi7CwAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bEmo0j7FSF857c223RKgFq5RmOWhd5En
X-Proofpoint-GUID: bEmo0j7FSF857c223RKgFq5RmOWhd5En
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Sun, Apr 20, 2025 at 01:38:40AM +0530, Nitin Rawat wrote:
> 
> 
> On 4/14/2025 1:13 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 14, 2025 at 12:58:48PM +0530, Nitin Rawat wrote:
> > > 
> > > 
> > > On 4/11/2025 4:26 PM, Dmitry Baryshkov wrote:
> > > > On Fri, 11 Apr 2025 at 13:42, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 4/11/2025 1:39 AM, Dmitry Baryshkov wrote:
> > > > > > On Thu, Apr 10, 2025 at 02:30:58PM +0530, Nitin Rawat wrote:
> > > > > > > Simplify the qcom ufs phy driver by inlining qmp_ufs_com_init() into
> > > > > > > qmp_ufs_power_on(). This change removes unnecessary function calls and
> > > > > > > ensures that the initialization logic is directly within the power-on
> > > > > > > routine, maintaining the same functionality.
> > > > > > 
> > > > > > Which problem is this patch trying to solve?
> > > > > 
> > > > > Hi Dmitry,
> > > > > 
> > > > > As part of the patch, I simplified the code by moving qmp_ufs_com_init
> > > > > inline to qmp_ufs_power_on, since qmp_ufs_power_on was merely calling
> > > > > qmp_ufs_com_init. This change eliminates unnecessary function call.
> > > > 
> > > > You again are describing what you did. Please start by stating the
> > > > problem or the issue.
> > > > 
> > > > > 
> > > Hi Dmitry,
> > > 
> > > Sure, will update the commit with "problem" first in the next patchset when
> > > I post.
> > 
> > Before posting the next iteration, maybe you can respond inline? It well
> > might be that there is no problem to solve.a
> 
> Hi Dmitry,
> 
> Apologies for late reply , I just realized I missed responding to your
> comment on this patch.
> 
> 
> There is no functional "problem" here.
> ===================================================================
> The qmp_ufs_power_on() function acts as a wrapper, solely invoking
> qmp_ufs_com_init(). Additionally, the code within qmp_ufs_com_init() does
> not correspond well with its name.
> 
> Therefore, to enhance the readability and eliminate unnecessary function
> call inline qmp_ufs_com_init() into qmp_ufs_power_on().
> 
> There is no change to the functionality.
> ==================================================================
> 
> 
> I agree with you that there isn't a significant issue here. If you insist,
> I'm okay with skipping this patch. Let me know your thoughts.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

