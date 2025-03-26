Return-Path: <linux-arm-msm+bounces-52539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA596A718AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 15:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CAE7189C728
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 14:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7BA1DDC2C;
	Wed, 26 Mar 2025 14:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bucX4Nzb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9438026AD0
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 14:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742999743; cv=none; b=l7t+jqYDwi7QDKvwr5ZkAOpRTLHveic5rgOJrBH+fPBjqnC0lx7EnIucJfRtid0NDB0fWxQ6dlGcOmztfJP9i7boVw6uIPv6qWdpThNWWSHrZAjxcftrTDR5nQrN9BF0ZrCGgmuy2FiDT9XoSmrA6Ke7ondTB1COZzsRzjKTbwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742999743; c=relaxed/simple;
	bh=uTWEOiRebzK1HpCztN7qLyQNV8AB5yFfQg/jL7Wglms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmESwqNiqasA3iCXwcdROnUYegUGaYdGJmDYhRFdTjZ15NNNMZttYlG+ori80MrnzHEle4/lYNppuiQakv/75u1KuqRyHrOlprUc9Jiy19pjPJoorWAURz6NFKJk2d2HNvBi9AZHP6lD2z4LEaqW47bR56yFEtYaz5OCAoUfxvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bucX4Nzb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73HR9013132
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 14:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a3LBv2dL/fjVHNDpQ8LXA7nk
	O+aChHlItG4zFaoX6Rw=; b=bucX4Nzbhs4E4B5QrJ5dJaDhiNM9BgRijA+Pc+bV
	LtOk5jD7GuaoSUEJfM8zxasBnL3L5u3Z8ChYD3inN4DBljATvrM5fPbKXLO1ydcb
	Zuuu+mmy0Tn5y0lvj1GpDqt2wvCQITabvngMEjRtDFx2j7GSga9pQefR0Bus9Ky+
	qgcJFRkvBF/Xg2TLtlq0nM8B3NqaMfmFmyN4v9AnFECMeBcVvKq8FyU3Jtgucx+9
	TKW38q8PFrbeSilfqmoPWeMAEUfoAi55x7gbOJB0v2imXednWPQFF67FQv0n5RFY
	2obZXx+/NJrvWbZwooFIlC4MiGP6AGP4Iyq9BMAWFDaDbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9k2m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 14:35:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0c1025adbso157497185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 07:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742999739; x=1743604539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3LBv2dL/fjVHNDpQ8LXA7nkO+aChHlItG4zFaoX6Rw=;
        b=m+Uw2NjwB+RWDee0XQCL2DY4L7bkp7GzAjp4h7I59dBgwaMmyBcdU5qi6CGr114s0S
         YaWQk7dfNyeCCYJftPGtf8mgjZTe54ZflYW+fdqPnu2h5h1/CA5UbVSppSH/vBcnQte/
         /8xYujyBdN7511B0RISlVAnTdVzdUWJQ/ou7WLm/yAT74N4QzTUwyZy6b6J3FVrPUXwd
         WpzqAi2TcONMFdSzJLGSF5YBfh4DL5cKBgGDeEfTYFnBaNyBu11JpuJCQlLtlpHslb+0
         wxv4Kkn4ATy9hnsAxA7SCKpObUvlTA/o5hOWhz5t5/RWZ9BT6iGbTxz3prgAJxILxzFe
         Ig3A==
X-Forwarded-Encrypted: i=1; AJvYcCUnb68WmFw/eVzqmVol0PYA1xo7rsdBEEglhOsV+azNE3E7kJWSa1YhMEDCEo+eW96ETfpWz/6xllw3QCV5@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtj63eHpA+fVHsQLi1ofbtcrDXMBPb3oW6VEzwC0Pjxr/qsq5
	qoPQtFebkeSjqrA64JXK8c/Rmz/sAHF8sHKuAnYPUXHNZ22l7pvaAwEZPZVKVT3+YCKrjVw6irq
	gvyE1+/7WfabO81DQ65nN9HcbWA1N6cq27xTu7fhUI19ofYLj1vR6WHnUiPw6KuLZ
X-Gm-Gg: ASbGncu2PXCC4bIsZkqYksPGGmVKytuhUIOH/2IE1L2Fn3OG49i4FBkVTlbSGE9ssyy
	thYKPl5YXePHxaRo+LDwxdyIsoOKHQYB3tbKXwmU6VSmhYejHk+kW1nFYG0u1GXW8Qm/g6UeB3o
	2ELc7D+TXS81p3qieeLIz5XatHzWd9ZaAj3Z6PIPKuDwkKMCD7SDtrme5oqjyvH24/DDl6oywzU
	jl9Igsa3cS5MobxBEIvyeioju0F7RHLFXHOJhMt1kPgDrPIgO83jBXx7r0a1t7nDvEP2tdNCn6n
	FeZMgGf6eazN+m+WPVaPUvvMTZZlYeixp6g/FM+XkZBIJjj6FvRHZa+lFuG38syhAyn/n/aDroF
	TUMc=
X-Received: by 2002:a05:620a:1995:b0:7c5:3b8d:9f34 with SMTP id af79cd13be357-7c5ba190732mr2254546885a.34.1742999739221;
        Wed, 26 Mar 2025 07:35:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs46zlTmPxSPGBWjaeuOLf0lsuPSVQruFQsyK0XBUrWy53Jjrx2JCfX0d2UmjavDBdWj800A==
X-Received: by 2002:a05:620a:1995:b0:7c5:3b8d:9f34 with SMTP id af79cd13be357-7c5ba190732mr2254541885a.34.1742999738705;
        Wed, 26 Mar 2025 07:35:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7fea69sm21494631fa.59.2025.03.26.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 07:35:37 -0700 (PDT)
Date: Wed, 26 Mar 2025 16:35:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Prashanth K <prashanth.k@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] Add snps,dis_u3_susphy_quirk for some QC targets
Message-ID: <vy62ivsp7ibgotyczg7tzmxtirwwhx7kwhkatsltsprtsoqinb@5ctysskl76rj>
References: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
 <ee0848ea-7a06-4f4e-9115-5e3c0ab8bf95@oss.qualcomm.com>
 <7029a455-47be-475d-b429-98031d227653@oss.qualcomm.com>
 <gyeppjlzfpmazj5seohhab75mbhv5kyzdbxh7iqddd33dnah3n@w2tpd5gme2rq>
 <9a4c51a3-ebae-486c-b8ea-44035ae5e616@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a4c51a3-ebae-486c-b8ea-44035ae5e616@oss.qualcomm.com>
X-Proofpoint-GUID: -UzP5h1PA6LxwHleOWiBlqWbMfGJbtes
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e410bc cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=-bij7ddDyyIky5GfeWYA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -UzP5h1PA6LxwHleOWiBlqWbMfGJbtes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=706 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260088

On Wed, Mar 26, 2025 at 10:52:46AM +0530, Krishna Kurapati wrote:
> 
> 
> On 3/26/2025 5:51 AM, Dmitry Baryshkov wrote:
> > On Tue, Mar 25, 2025 at 08:31:55PM +0530, Prashanth K wrote:
> > > 
> > > 
> > > On 25-03-25 08:11 pm, Konrad Dybcio wrote:
> > > > On 3/25/25 1:30 PM, Prashanth K wrote:
> > > > > During device mode initialization on certain QC targets, before the
> > > > > runstop bit is set, sometimes it's observed that the GEVNTADR{LO/HI}
> > > > > register write fails. As a result, GEVTADDR registers are still 0x0.
> > > > > Upon setting runstop bit, DWC3 controller attempts to write the new
> > > > > events to address 0x0, causing an SMMU fault and system crash. More
> > > > > info about the crash at [1].
> > > > > 
> > > > > This was initially observed on SM8450 and later reported on few
> > > > > other targets as well. As suggested by Qualcomm HW team, clearing
> > > > > the GUSB3PIPECTL.SUSPHY bit resolves the issue by preventing register
> > > > > write failures. Address this by setting the snps,dis_u3_susphy_quirk
> > > > > to keep the GUSB3PIPECTL.SUSPHY bit cleared. This change was tested
> > > > > on multiple targets (SM8350, SM8450 QCS615 etc.) for over an year
> > > > > and hasn't exhibited any side effects.
> > > > > 
> > > > > [1]: https://lore.kernel.org/all/fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com/
> > > > > 
> > > > > Prashanth K (3):
> > > > >    arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
> > > > >    arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
> > > > >    arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk
> > 
> > It is hard to belive that this quirk is to be set for SM8150, SM8350,
> > SM8450, but not SM8250.
> > 
> 
> At the moment we wanted to add this quirk for targets where issue has shown
> up either internal to QC or at customer's end. But the issue didn't come up
> on SM8250/ SM8550/ SM8650 so far either from customer end or ours. Would
> like to update for other targets on need basis.

I'm not questioning SM8[56]50, but not seeing SM8250 here is really
doubtful.

-- 
With best wishes
Dmitry

