Return-Path: <linux-arm-msm+bounces-78907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B9C0DF22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 678A418932B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8319F25FA29;
	Mon, 27 Oct 2025 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjh+2Rii"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D608C2571D7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761570887; cv=none; b=Cl7y5VYoUpQ8lHd+EbvOpJNYWJ7NkHrTP/LXRLlXoTxwLIPxnLpDC91Rv68TyMxqHX6Wl8Xbj4abbQV+YH9aqrV8jxdR4/E8omobUcbPNnzLkto/LKAanx7qCAyhSdSlw9wxHAWRLVVBSM30742qp9ZHRU4m+I+6wLnnX1LMmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761570887; c=relaxed/simple;
	bh=yurVmvxSOFrWw32vD2Z36RTMlvMH+DXhPVbXI0Zm9yE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWNh1cK3LL5xPwLUYsPz+JsXLTCx+77UeG6sJT0J0nvbVU2mLKCvZE6CSnD5rX404z+I8XGhWfLosAj6MWEgpWZgdc+a3TGf67DNLcxwrPLMmw17WfmLD8/70wWi6XVzWbilqqZKD2Lxf2UyyfNF3TJp0P8BIMKN6kmjnpnZcuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjh+2Rii; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R8hu4Y890287
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nFyzKi5bv7XzhZEu4Cpk+WRY
	5dnAaHHoSnvN/ez9mr0=; b=pjh+2RiiyRIkOe3N+YJqN3TwoEj4CEejkjcAuiqg
	eTNuHP0Os9Sz7E6MkyxZ7yPTKOTbVK6TAJMmFrSCsjvC860dongX6tGYnABRWVzS
	wVYrnEqc9vFYFjjDuuYVIAXx3SVif6ZwmvJZwqvxE86/Q+LwSCYANe3T68ptbJrP
	v9lVlF5LWEBQm6lIWoPKAyuai8LKrkTxNuw7UizS7jBGk/ZKo45otfCbUXpxU3Tx
	gUH9KaOaJxEuNcrJ1+4zX1LQ3jHNlREa7Xz7JO3+5YVL/1GoYjbUcLmhYHDcpiBZ
	Eb1JL06WICkHrog0IZHMk4odthMZx6HQNWiniq32TGyhow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a0p4g4mt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:14:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ecf77618a5so34515091cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 06:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761570884; x=1762175684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFyzKi5bv7XzhZEu4Cpk+WRY5dnAaHHoSnvN/ez9mr0=;
        b=NiVAhC7bUpZfGLqF5FwxtsnnEP0J9cUzTu4KxLcRMHTwMgEObUbNMxBIM5+w6MjUL/
         HtnySB62K9aWbmNsKVHX3EbLIUNTQlQCGh+IiPRQe+2c24y/hMBU6d0cGJea4dpDNxDV
         0yjVOGY7S2s1yTNcfIeuftB2DMJ8y7+YTFE13TF4EkDKWi1NNpdpPdIlc60NdsXUgQKO
         F3Lad6HEr626tH5lcZw7L0PmDCdiMx+gqjUl/Lt82Wrf68V/GaQfHVSf34WXRhqTyImI
         WtbzE2P9MRpockvxMi68lkY7eyYeswInCrCPvHpZfP/9FVDizOrJLSI4SmNUdXRVO/O5
         GvDA==
X-Forwarded-Encrypted: i=1; AJvYcCX+F9xx7qExPsVwWpX3vU1QffbH8gGzwpOdUiI+saxF6ZGyzpa5n8CKF1a0EH7wkopXQMHma8tDaz2o/ohL@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVHXzsC4y7iD+nV8OZs2kZrMVn3DlmdAANj2+c0+xOxnP2BYh
	cU7SmsEuzHEOSG/Q6kBMfyRLhgyjB2bTIhKiuxa4JY85xWRkSqyhPem231lsUn6IOrZcnQNWcX3
	A/0kZ8ejmy9PrLZ4dBESTVFlo5PGmbEtQC9utrybgTp/I1wh3SJQHr5YrYtP6sf8xPqzy
X-Gm-Gg: ASbGncsfxdoTJrC5DYIgbvLy5QNHo8b/a/THKfNJv9sV6znkQxVAJaPhkNdscz0QbdL
	RwSteNHwLPAbaDIPIpjDSoJcEiAxpA3bDt0Ul2As/e7ikgy/et2toboegGqaSsN0BL6JNfCWEjG
	DRvuwmyT8LuWd/+syB1KendeOHLU6xz9CuiTVSzRkx5p4/B1GDs4cY1iZX+RJrmkyWHSn1qE9cw
	nln7Y4XY5PvO2YtK+8mu/1WGCOhBLs995d9cKvev0NWD4f5vFMuRzJLNf69w9fs0fLl4ug6/zev
	ImqFVYh81N+9HismZMdQFV9zi12ThYHUkhEOyRj8wya+2HPusTlSNrvyV0FGSXnWOM8NjOOWiFq
	pbJsbpID0sG9nGM0t2pjn8AVxbod6uqoZgjVunIiYiGj6iHL7LRiLBiqsrbg1lBasR1otJGi2zt
	ia25Nf1xXH+T28
X-Received: by 2002:a05:622a:1b28:b0:4ec:ef85:cfbd with SMTP id d75a77b69052e-4ecef85d368mr61632031cf.80.1761570884052;
        Mon, 27 Oct 2025 06:14:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvwWHynaMcFsCoJT3Ymx6akKgKGq+AVYZliRWBvt3fl/sJ+nyNZdGM11CdtSCxGsRp/Z4JPA==
X-Received: by 2002:a05:622a:1b28:b0:4ec:ef85:cfbd with SMTP id d75a77b69052e-4ecef85d368mr61631541cf.80.1761570883540;
        Mon, 27 Oct 2025 06:14:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0a5655sm19154971fa.21.2025.10.27.06.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:14:42 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:14:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Message-ID: <einog245dsbqtx3by2cojyzmyctk2fffpwndwoe24puwqq4fta@cu6iiidxqgr4>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
 <omlhiywjr46ik6bj2aiutgcf4aifen4vsvtlut7b44ayu4g4vl@zn4u3zkf6cqx>
 <ad906eb5-c08f-4b66-9e37-aaba99889ad4@oss.qualcomm.com>
 <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPryORKIuSwtXpon@yuanjiey.ap.qualcomm.com>
X-Proofpoint-GUID: XQEZbLWfBZgWOZHikyqRKO7eHMYP--QD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyMyBTYWx0ZWRfX8+Q0RlCPucD9
 sNTqHNBt6qemHxdFpoUHsrIJEDmNtar8q9ktaf7UXvQV6FQjvJ+6ZorCjp9xmxRMSZ+GUnkMiYu
 LPRNblkyFBd4AooKOfkUu7Wx6X8fsVqcq/3DIG0o8wcB0V6Mz82SIB32ufYAS+lDHbUsXjOIgkt
 hWONc0V6+gGv/LHUIa4tKc0wwcIgvNzyQi89bNLaMnW9gaxEDhq7lBp30fDoToPMju6Zf6Po6Hh
 PwlxQ3n6AFCcMR0tGWd19T5nImtX7xd1N97b7vMI6fvZ8RFSBC6ZWuUHXPqOuWPkGoOuWeWxXMt
 8rRJXpkrO6ImNnWw2N77fXKyWhqOGacmL9AjNuUYvfeaI3c0QsaI0zaGje5s30PwpfAdOBEfJdH
 VLiWMOimHp8RkPncnP5oZYUF2e5BJg==
X-Authority-Analysis: v=2.4 cv=L9YQguT8 c=1 sm=1 tr=0 ts=68ff7044 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ACmnMjwJHZESoQLvWlYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: XQEZbLWfBZgWOZHikyqRKO7eHMYP--QD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270123

On Fri, Oct 24, 2025 at 11:27:53AM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 02:02:45PM +0200, Konrad Dybcio wrote:
> > On 10/23/25 1:48 PM, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 03:53:50PM +0800, yuanjie yang wrote:
> > >> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >>
> > >> Add DSI PHY support for the Kaanapali platform.
> > >>
> > >> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > >> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > >> ---
> > 
> > [...]
> > 
> > >> +	.io_start = { 0x9ac1000, 0xae97000 },
> > > 
> > > These two addresses are very strange. Would you care to explain? Other
> > > than that there is no difference from SM8750 entry.
> > 
> > They're correct.
> > Although they correspond to DSI_0 and DSI_2..
> > 
> > Yuanjie, none of the DSI patches mention that v2.10.0 is packed with
> > new features. Please provide some more context and how that impacts
> > the hw description.
> 
> Thanks for your reminder.
> 
> Correct here:
> io_start = { 0x9ac1000, 0x9ac4000 }  DSI_Phy0 DSI_phy1
> 
> And v2.10.0 no clearly meaningful changes compared to v2.9.0.
> just some register address change.

Addition of DSI2 is a meaningful change, which needs to be handled both
in the core and in the DSI / DSI PHY drivers.

> 
> Thanks,
> Yuanjie
>  
> > Konrad

-- 
With best wishes
Dmitry

