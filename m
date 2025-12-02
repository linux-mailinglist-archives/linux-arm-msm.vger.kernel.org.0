Return-Path: <linux-arm-msm+bounces-84053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D8C9AB59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 09:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C1C08344F98
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 08:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A72305978;
	Tue,  2 Dec 2025 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFqX+HK1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RNLc6ATG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1F830149C
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664621; cv=none; b=TcfwIjhC5Q3S/PmwP3Q/TMTHN7FwJtK68uu3PpS1zz/MfUV85jcvKeT6Vhq8Umuv19QPvITXcikou77qYi/Z0VNccXXbDrSCqYAa2LiemH+U89A+IzD6uz/kORJcxbqEwNwMxPXmivnt42ow2Zvv6Iv83u6kpto6KCW0KjGzyKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664621; c=relaxed/simple;
	bh=2f+oyT22R6+ufw0lsSoxkkFhzOSzFUApxscYiZJh5yM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oC/O6G26SqSJE37qKLDjDQb3NZ7JzQWjEMTi8wgPjDnlNFxRhHVm7//SDVB7HEEf4jqbx0TYHyvOZeehIjJ9kZm9qH4kEm63sGqp4yQAqqZkL2rJtXMOaH1rZ8R/4nvi0hiuFonJxsw10IKlDx2BmBZQy4Dn+ZRL+RZc8BX2JVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFqX+HK1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RNLc6ATG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B27LtES2692652
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 08:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cea5xRd2LAR6OP560Xpt2pLurPYWnXx5KGRmwEu0v84=; b=mFqX+HK1LRESWUFL
	dEfgw2n39YSmuvs9JElkewYEoc2EQ9t2BkXAusfKpZfnSbgIqoOBT/eZddLkSlMA
	TtK99/RmM4rZtenoMGtf1K8xamudSKOzafXR1HcoZ1zZs3MLWHuP0h34TZrzp7FL
	AzXAw9GWIsQmsUx0r9JyGnNh1UO4izMiKHj73zmkdKgRPLUIj8PJ/rHrEglLH4gz
	Mt0ywnkeDhr7v01zbByrxXY8BBcK3YTR146XxVs2xdx5EEgedcHdP0ACoTNGtZ/T
	zy4l/8/BbSjgGEfrbmuiZOEfnX1SLEzkQt6AnIaZtyY2Ctx7gXdZmttEo/SBjyqo
	yD1R3Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asun907js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 08:36:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7bb2303fe94so5154771b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 00:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764664618; x=1765269418; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cea5xRd2LAR6OP560Xpt2pLurPYWnXx5KGRmwEu0v84=;
        b=RNLc6ATGmjgLwrjqawWWK+LatoPTiZSGEJy3BcFFjEJsq94M4yjUwI0jMNHJIx/H9h
         celBTltrzR2rc40mguqkZ650UyqVgtP5y10y9AmSsE4rmhAs4qtYKAjWHmGRaJjm4ncO
         4ga0fmMfhGHSbX+8krKMI+SRzunDoZ7hXP7df+SJz0cJbEXTeaQ8zJDx87a1HZNQpZwZ
         lQXSbj/GLgun9bBWTHGUYnZXjkcXzjL4qYkT0P08Wc+rBmoTSCvOzYSUEBsfWOz0wZpf
         9eIym+brWZtsyewxsNkq41JOKaMbWr0gK3/w4679TAP/QPX2A6Ul70NFom0ecap/GsCo
         lyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764664618; x=1765269418;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cea5xRd2LAR6OP560Xpt2pLurPYWnXx5KGRmwEu0v84=;
        b=QamBAuCQ6+I44s7HClR9CCtgMUKRhVhZ/sz4H88in9OasJiPa2Eo4XMn4//46pwZNm
         UsKwyIylAdqGeo/ArRHq14pyoULL6vlTJsywtD3dWcDSvnh1PIbeMldqBvAY8agyjzil
         wkjKi3kJIWceGnU6lDQTfbty5+y+lJXA8tvuYckkuYkCqGHyBaFurCH2M5sogV2jwn7k
         hLhlOLwBPuamTHdh+lG9jfafMylTr3SL0+nrExkQ+Ofa1/TBcnGEdC/fnjpr66w2JfK1
         wxwmNNufF9ZSqda64oHJ0RfoU6hDaTWv+n8GrsAIq4QU9ir4GvG27mVUBwlhOsaPU/52
         yg7A==
X-Forwarded-Encrypted: i=1; AJvYcCVgdrGOLn+JN7aP1C4go2CydqHHZb5ogdZoFxHmihlvbtbtR1aBiYEqNlDgdSgKlE77Zq095PKMDzYlvONQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgtDpTlTWxb5FLDOORVEv2wbD780qi6SnEzvafY5EaJwHdhlg0
	JGxOUxwiDtL8CeZfBT6YswIPXzO7jMl7uQtZW9QaCzkSPHrGWJbECQH43iJgUaMLeV8OMXVFHTc
	/LsV5ujJiZuyTdJv3wAhwREVQa62B3NxWYqjZ/++xMAzw5xvGTQlZf5cZxzztZS61WHpU
X-Gm-Gg: ASbGncsOy+Km9VTj5nOeGo60XtYL5JIYeUPIIbLfJOX9hA3eSrKL4L5W8G4GEMzd0cd
	0p40yrlYXDnxmjS+kvKxYauN+zWwkwe5KYw+K4TmXNiShG2U91L567TXLRGTBTVjv/YstW0r0c3
	tYY41bGAaQiO8NE5DhhuCenJjZ0y4ucXbTfnUVWWRSGYp9calsfcS4yyfsOGOZDEvTqcObLoxi4
	m5HVTsB8KAd8C6uprlzQo2WRWDxGXeQViJMY6RRA8SQk7VMSOIjcoPg3g3EH83N4xh6w4+TdcRZ
	faJPX/Rx32K60dllNdPpscWlS4Xnxe94k+thSAfRl+d+TzZKEAWfS6yxFQzVYxt3m6GlMWLbuyN
	e4e0d+5p6VjBNXbGtVPC8eQRAdXUGUDfWRBko
X-Received: by 2002:a05:6a21:3395:b0:34e:e0ba:7bf with SMTP id adf61e73a8af0-36150e1fc24mr48387143637.1.1764664618253;
        Tue, 02 Dec 2025 00:36:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFfcyGB74lclpQ93vXWzJfbznVZKLqfP1ZJZEp1qLtVB0QSTSWqyEngdybDcfSBj3gxxXBGQ==
X-Received: by 2002:a05:6a21:3395:b0:34e:e0ba:7bf with SMTP id adf61e73a8af0-36150e1fc24mr48387111637.1.1764664617636;
        Tue, 02 Dec 2025 00:36:57 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b684d7sm16158039b3a.7.2025.12.02.00.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:36:57 -0800 (PST)
Date: Tue, 2 Dec 2025 14:06:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, vikash.garodia@oss.qualcomm.com
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <Ux4KioDAyhqgZYleT-eeeFKzuT_qadCIpP3RgyB40apZPX4I9_JwcfY9mebop4gmFcyh4LPw0KQvFzL4zzysJQ==@protonmail.internalid>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA2OCBTYWx0ZWRfXyUKVEWs+aroV
 cbr3Hmi2fT2FnZEQ1FwXYmlOKDBmgh5gDg3Po/fptLnpJDygjuTISN027i12FZQk23kRPukfgM/
 U3iBVZnYDNInSvfJpZ4W8BfbSjDJChnADjcdi0KYGdD0KN8Q+QkDdl7MQXwjSBd7O23A0v2hWGQ
 bpPZKR+VjJ78YcPv6uERqnnEeuX6ipEJTIZ7YKseXRUalS4nJwSNqaok/t4Enm3S1D+9xSjHKy+
 rfFxxW+XSGQqPx8BDFkOAekl0OyY66fHNuLbu7Wb+sQQIoBALC6dv5hi8Qs9hJ+WcBSjcCX/QQh
 qJ/xotf4UZJEbQD+mo2qXtCxVYsygKGBe2L3IgD70BqYRt4rgjonfqF7o7NtupWjbRp6WpI+Ktc
 hqCsAQLQr1WgiaG+EGmz0xl2FoIcWA==
X-Authority-Analysis: v=2.4 cv=DKOCIiNb c=1 sm=1 tr=0 ts=692ea52b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=uEwPF_Y-ILqiIyH3WEEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xyU22YUNdZRP8_r1zU8InySQsSAApXTz
X-Proofpoint-ORIG-GUID: xyU22YUNdZRP8_r1zU8InySQsSAApXTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020068

On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
> On 21/11/2025 11:37, Mukesh Ojha wrote:
> > > Sorry.
> > > 
> > > Did we actually come up with a cogent reason to omit the video firmware
> > > loading here ?
> > > 
> > > AFAIU it is required for Lemans and Glymur - leaving it out is blocking
> > > getting video stuff done and storing up trouble.
> > > 
> > > What exactly is the blockage - is it something you want help with ?
> > I replied to you here[1] and given my reason..till something concluded on
> > "multi-cell IOMMU[2]", I can not add video and block what is working
> > already.
> > 
> > [1]
> > https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
> > hyd.qualcomm.com/
> 
> Why though ?
> 
> You are mixing together the issue of multiple SIDs and the original loading
> of firmware which could easily reuse the venus method of
> 
> &iris {
> 	video-firmware {
> 		iommus = <&apss_smmu hex>;
> 	};
> };

I completely understand what you are saying, and it would be very easy
for me to do that if it gets accepted. However, I doubt that the people
who raised this concern would agree with the approach.

I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
banks separately. I’ll leave this to @Vikas to answer.

Also, I do not want the video PIL discussion to be part of this series, as it could
unnecessarily give the impression that this series depends on it.

> 
> That binding got dropped because it was unused in Iris.
> 
> https://lore.kernel.org/lkml/05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com/
> 
> I still fail to see why we are waiting for multi-cell IOMMU to land, when it
> is expected to and what the VPU enablement story is upstream in the
> meantime.
> 
> Blocked it seems.

No, it is ongoing, there will be next version coming.

> 
> ---
> bod

-- 
-Mukesh Ojha

