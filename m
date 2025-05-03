Return-Path: <linux-arm-msm+bounces-56606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 666A3AA7E40
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 05:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EACFF98853E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 03:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25B517A303;
	Sat,  3 May 2025 03:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqNimg8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B7513AA2A
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 03:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746242661; cv=none; b=l5a6b7ampmEfX+Wx/KUbVXymKSD4n4FsB5e14dLPRhWoiMriFrT1KZCzRbuZDl5ooh9ykk/YD/OFoJ3Cyp/+GP5Ehqeyf0H36pFeXdPkwr/aT3+4N0FRyZHL2RPN+1NwdpSbvIUZUa/iNF1md2r9BE3BifazEXt/brnz9vuN7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746242661; c=relaxed/simple;
	bh=asD1cQeH0eQOO58d/pOB17xBmMSPNOrOhM3NhDyg1SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWxEMD5Dmek1DwUOqKkW7NqBo4NbB9bnJtSIQho1+xKV3i7dZyqom34pQGXYGStgTOwHRJNPca4yAFg5T34hu3Fb+nJDEX55UgnOiax13BXceTR7O2NUAhUJkFN3xDOWIv7lYyEO8UaGDgdwr9DbDKc6+SF2LD5Hm5WAbAZwvYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqNimg8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5431cxGs020883
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 03:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HNn11L6/OJdqL1KxlXTIOqrP
	MSyd/4d85l4dZRszfNE=; b=mqNimg8FgKNPkxiVarAAUTad7ddxgTRQAYpKfGG6
	sXGc0i203ddz+WMgaLCFslK9m0A6rZrgnKmebT86cvlZxQzAZQWHJYtG5uCQFNBm
	7pOuqW9VXfvsmR74jnKhOMr5a1nvjVzZDHTmYtGTIVAOWqkCCh1/mIEFIpEdToOY
	6zOWhw8ejDWM6TFYiayelzkzmtrapr3Fwp4oAUEiVgEO5JG+zNvYEWCHp2zJrFoV
	cVukF5AU5O8dCQdzhqLyzB4tK4gmULwGFtsJy7aVIfiCexma6J4LWntq4kzFDTHS
	3WEsIE1HmirLiuWqXB8N1klupAEOFU7Q5q33a9qUBKIRoQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nqg3ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 03:24:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c95556f824so262415685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 20:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746242656; x=1746847456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNn11L6/OJdqL1KxlXTIOqrPMSyd/4d85l4dZRszfNE=;
        b=plwQrHtVld8nG9q6JsNzK26KYTJWRU/6+6YlpLMdFU6dXrrAv/qDzTMqa3NxpxU69b
         pXX31ZGozk3j50WS2pYWigAyXAE9eVvbhnKfCKwown0uTcsxO8KZHiLqGcZ+Alr5BXf8
         sqI/UsNT6/HWL08Ph6blV4ByRzIfJgw6t2fqFjRKssSfsOhUuffw8YMjrrLmNWQRkUDs
         PrCh+loxP0+6FDBG9VYwrEtdoqH/w6bd3N0Wmyn/LNe9NFSTs/FruURJ2gvno9qCM6U0
         rEHHgKP32im4lhFyhhbq/54pkbfM7/TuuX5g8dEC1noWQYa0ksOA5M6gWv+sBhBt1EEp
         DACQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4jOnP9GRXGwcTrKPbekZABDq1TVHw7RLIjwRGmwzHvpucqAQlOtvtpjBeoCT7D8ZjmiMPmr5S6i6zi26y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5wmdbaGXGmXYfVtTjSSn0n7E8YLdh10P9sLyInHANwp2ur+oM
	B1HnMTi0UYubCXMOQHk70bPQ0v2XQfItt/7TMWF8ZFguT23U5gPhR+9jZ+0i4+GKbZy6Gnn/OA5
	AO7B2gpxKFRj57g9GDdvlC3ysyHHR+3z2Y2pRAr9wm+RBPZ7pA2fM5GZ/wSIUpues
X-Gm-Gg: ASbGncsohYDtVq0BMovkTW9hN11igstOTFu8uocLRMUOY/dpGHScTk7EpQYvgfOTkqC
	6UAWaCtcUsM/5CXzUA3a4UuL0p3hy//T0cEsAhPLGyP50CEDBXtLxMPHaPec2WYG9wXyVxYv4AE
	PIimtrtVDS8Wwfx34ucdDSg5xzsflG1L/gqzRfZcp6mdMXxAk/U+DCXNlQbU8sepqhYxTOF/mOX
	u7IF4Y8KzOEwhu2kQWbzvnzQsPcFh3xwv6IjR8muAgALGZN2o8kE6ssnxTXPvIR7PDh7wEkq1QJ
	L4iJTAQsPARycTTCNXbSERvnN7HD+2dvePNNG2Zui6loO96p0vci0lQVc+uVe5tUxZn/5o4qcm0
	=
X-Received: by 2002:a05:622a:418c:b0:48a:c90f:ce6f with SMTP id d75a77b69052e-48c30d80333mr98285641cf.4.1746242656406;
        Fri, 02 May 2025 20:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4Nh9w5WVGC3RST0VkgGNMJID+vfLETSNmPjq/gLaq5uaPvrEtf8fnY9OXH5/qZ29zeu9ZRg==
X-Received: by 2002:a05:622a:418c:b0:48a:c90f:ce6f with SMTP id d75a77b69052e-48c30d80333mr98285261cf.4.1746242655974;
        Fri, 02 May 2025 20:24:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6a9fsm605856e87.234.2025.05.02.20.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 20:24:13 -0700 (PDT)
Date: Sat, 3 May 2025 06:24:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/4] drm/msm/dp: Fix support of LTTPR initialization
Message-ID: <nxft5c4fi3pmm3r6y46cx7nigto75g3j74qmtcyyaysebegvh7@vseouireocc3>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-2-alex.vinarskis@gmail.com>
 <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
 <bax6ropbymr2jqwlqvvmetgvsh35s7veevtj4sdwoh5jqghdwb@yrikyb5z3dkn>
 <b3e9650d-906f-4b03-82dc-9e8c09cab226@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3e9650d-906f-4b03-82dc-9e8c09cab226@quicinc.com>
X-Authority-Analysis: v=2.4 cv=W744VQWk c=1 sm=1 tr=0 ts=68158c61 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=H_hWaF1uyuAelWpSFMAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: GuXjxAr2sFs6GGiS4P2oZTLttkxkvk7g
X-Proofpoint-ORIG-GUID: GuXjxAr2sFs6GGiS4P2oZTLttkxkvk7g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAyNSBTYWx0ZWRfX+YXC25AOGLLc
 a1cSFgOpnYDrUq9mD7oaXTFVs7mbxSrXoPE0+SzhfMId9qPg8j7ARa21YF5r0PwPg0PQUlM0twk
 w45IiXfs7wTUpiOreqfWuEsHC+66Aqe3WYVHUlXBrOyYIKrJleqvE15TwzX29k8/9FDzE0A6wkc
 x83YKTg8vvIzCOPcKrTCqoTOr7kSTGwFIICZ1wKt0R4hhkP/R1kfxqlLD1Dub12w/HxSyp14ocQ
 JwZwXAb0gGuYBdEaIElRA7R0EBCPSaboHbeFWCyRdNbo20L2JP4UhroVxgt/RQjtT5UUC/Fde57
 AN0c2cnyGM6dJnw2U7p0H5695RNk7nQfpWpnU6tWRn7hvdS75fRA2h+3CkQyGYf2Bb50KIXmnN7
 Zz31jgxAF59IYkLMfQD838km0K1eDY0LR8IZuunZk30UYrQ55Gc8qgSXT1x9XJw8sVxGIp24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030025

On Fri, May 02, 2025 at 04:01:35PM -0700, Jessica Zhang wrote:
> 
> 
> On 5/2/2025 2:54 PM, Dmitry Baryshkov wrote:
> > On Fri, May 02, 2025 at 10:41:41AM -0700, Jessica Zhang wrote:
> > > 
> > > 
> > > On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> > > > Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> > > > (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> > > > Section 3.6.7.6.1.
> > > > 
> > > > Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Tested-by: Rob Clark <robdclark@gmail.com>
> > > 
> > > Hi Aleksandrs,
> > > 
> > > For this patch and the rest of the series:
> > > 
> > > Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
> > 
> > Were you testing in a setup with LTTPRs?
> 
> Hi Dmitry,
> 
> No, I have a setup with MST so I re-verified SST and MST with these changes.

Ack, thank you. I was hoping that you have some interesting dock setup.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> 

-- 
With best wishes
Dmitry

