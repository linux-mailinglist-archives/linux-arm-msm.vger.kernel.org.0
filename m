Return-Path: <linux-arm-msm+bounces-76406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4705BC50D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 14:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D10E319E357C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 12:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF595261B76;
	Wed,  8 Oct 2025 12:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9Pi6ndI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6DD248F77
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928277; cv=none; b=c6MGfYm0JiLxbeZRNvMXlFZ14IqjBy+DXcXveOJwtb+8gfA5geAgjLJRJtxV0hFGt+cy26+fe3PL1B5AO/Ckyraz8gkk//mKH1P5MHq6avkfHZcdH5scN+pSClVJjlpstKLONiPEWqeDnpJMvweFCW3zvS+NgUSJFGXCCg3+sgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928277; c=relaxed/simple;
	bh=+v/rypylBH4oBhnJs+np/xDCpUOmLe/7JWcPYhHbIXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUgvV+Jrp2+kY74vHlYW/ipj5OWI3v6WZnb1+T5+fuud1zrjuiPTbQh1IIJKZ2i03IQGxhmbdZbsqSXUmulD85JLb5mqephmytcGFSb7r/ez+oz/9HW2PSm6xsF+HnIZko+MZZq5jHMz18//5ym/STXI4fYmIXRkXZJOSvipkCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9Pi6ndI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890oG2010212
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 12:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zFb02Y25ke3gxp+QmVEaLQ1A
	ZPsdmeNsL3BSvt29jbs=; b=R9Pi6ndIzcQw/g6FVr/PqDlpIUnX8IvNePJVy5tV
	hcP69WQ80nsUC6IC6+pw1spvPz0gMSNkPQp1hxu0B8mFp7XQLvVu3k3IDFIwTwSs
	tHJv1vYiLieqDvd9EzyRlNkWdy8NZaFG5Nk+LHWc2PX7N/Vz4EytjqdtJUx7QhK7
	KVhePjy0kqS3I4S7ZuVdSs8LQJiMZfkBuynwpKBuQV9fldTR3E/ee/5teEZ130Zh
	tKgk9fkl+poGeF8HeY/CjgldsNdwoDV2zVf6CGdgWl2z/htqOM4Fw2Y54VGghsqD
	Zl2I8m2olY0Kzu7dayEe8SBd/5U88PPFYAof27k9Z7f3PQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junuak0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:57:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d6a82099cfso199248231cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 05:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928273; x=1760533073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFb02Y25ke3gxp+QmVEaLQ1AZPsdmeNsL3BSvt29jbs=;
        b=H6H5jkROofbSU286mPUth+Y44pSNpOvcg9W2UWF+mcMd0ECIBhnWnSXv7mqciFWQaO
         X41D0evULSS107K6t0jsesJi5bs/AA7REvyk/xT/BDQNnpTwTs8U1CcNirwxXPQks6OR
         mThDtyI8/rE3+hpPPSYms2SEhQj2JRc9GsZ+9Ccqr8966uqGfhpYhHn6F7vpobhScELK
         mqA6xpQIo3Axb/VQ7kXuEbEogiG39ZxqX4XtGq9YTUTzEE5z/Vdl2DxSrhztdyFS3lX5
         XJU/eSO0wBJxmNKa/TM5xSZoyP7NmV8VCAdGIviEU4VhFR9yACQYCreN45vNpz/DP0fF
         F+bA==
X-Forwarded-Encrypted: i=1; AJvYcCWfN6R1UiEi7XrkZXEgapXcMYlBUsTvPUx2Hl2eU1myBXw98NtRc8Cfn3FYJ41gbyWMGn438qVZ/UBOUo/6@vger.kernel.org
X-Gm-Message-State: AOJu0YwSwTIDqDmJBCDXeP7h1JUhsQQCkjTAlCcuHnSpIwzQRJvbo43N
	bwhxNqcyVR6yhz3AjjSB646bg3pnsFQWZqf07RSd1Ajg+50O52UmWu5+xRJYWg1oWN9w10dLNpS
	3YELmpTBxbU+MFl99GMYFoVuNayQmSxzglT7HLPB6pCG5eEJ6ShfeNw3eAaPKtVj2pD5M
X-Gm-Gg: ASbGncsT2mniRuJolyMO39hQ7nEiDMqoxl+ZUW3+Czg8yKHBan+sBP0EkeMXJ6ZH0dR
	gaP+3acRw7szPRnYGf7H2nPPA9XYJlGbDZuwzUmRBVmrmBJUhl0JCdIcJuNOV5RhJqwmA3fjsAk
	IRACUm3ks8HCgEkaN2ZP8wxNXKkUs9ZTYN3ChDFbrK4OXubudbufj2XmxTirt+P7QVdz/rV3xc9
	hOkuaQkaETPteWcDxiUHZgpyAYAGziJalSrz2QwvwbT05is5UaOYJJ6o12wHxO+gWwDQakObyho
	0iHUUKTZRYr/bUGvDm3PfKwscpR/2czgo/Cgl8Nrudy86Q+e7P4XBh51+gQ3TvYpguPaxmKQ4eX
	EWYZhT0k7BwR7jBLLth5QlW7LUDAXLegZ52KrzO5xEbQ+sOFMIXrcoiTe1w==
X-Received: by 2002:a05:622a:4c1b:b0:4b5:e7c3:1dee with SMTP id d75a77b69052e-4e6ead54342mr41671631cf.47.1759928273179;
        Wed, 08 Oct 2025 05:57:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV/5Su9ZdMKI4CWmNqq4+T6K2gUd3n5lsYdeglyyNSBPSQUQCzIjG40ACDqXMHlfDXvWtfUA==
X-Received: by 2002:a05:622a:4c1b:b0:4b5:e7c3:1dee with SMTP id d75a77b69052e-4e6ead54342mr41671141cf.47.1759928272409;
        Wed, 08 Oct 2025 05:57:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d263sm7204971e87.74.2025.10.08.05.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 05:57:51 -0700 (PDT)
Date: Wed, 8 Oct 2025 15:57:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
Message-ID: <5ba7245mhdfa7ni6g4coaktg7fadkznft3s4ogulywwjujbj6i@gddfftavxvwd>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <e3400ab5-c4ea-455a-b8ea-d4fba2ece85d@oss.qualcomm.com>
 <6uo2w4lscjlx5mtio2xw3xgyyu6kem6kavtdxtu7cbyix6kews@h2ou2awbppzy>
 <b14ca601-56d8-4ecc-8813-b9b642646a0c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b14ca601-56d8-4ecc-8813-b9b642646a0c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xOVGv00n26wSWYfoohi6CPbnwa_6H5ie
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX7kgagYHQX174
 J2ioOYvkQLoFSfVxgWWVpL3qTH/1/XNa4BE3aas1FWorkogObF+dbYrVH7WQXmiptN8rrACmlau
 Po58oQ/YRD8AijzvD6eEl35ONxFPEm/s4q03mgsx5zAON6hY7YAm/4mxQkdvpOQP+YWzN/PfZyC
 JHnlf+KNkzb+MfYLGsh2DUwKPffg6UjQegCwxWq0kJzKd2UHyNeCxBff+ummEWYN16ToZc+w0s/
 S1iZnPgqyorMNdZNuKWYSNVa3d8YDKGuJ6NXz+ncvkdInC5Jm40zuLb2gJfQRzbXDqVA/S/6Mml
 lpLb+CEkFvz1VmBwV+czkcTmQQiN3oRKLSg4byh0JO6bsDA78/D9ESAdTetN4Al2PB+2GOA8CFf
 g/oZmO89tiTl0WV+iW+OZCBcySajoQ==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e65fd2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=UNeRqKPLT5YhSiDNm34A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xOVGv00n26wSWYfoohi6CPbnwa_6H5ie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On Wed, Oct 08, 2025 at 02:50:45PM +0200, Konrad Dybcio wrote:
> On 10/8/25 2:49 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 08, 2025 at 02:40:35PM +0200, Konrad Dybcio wrote:
> >> On 9/26/25 10:59 AM, Mani Chandana Ballary Kuntumalla wrote:
> >>> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
> >>> with their corresponding PHYs.
> >>>
> >>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> >>> ---
> >>
> >> [...]
> >>
> >>> +			mdss1_dp0: displayport-controller@22154000 {
> >>> +				compatible = "qcom,sa8775p-dp";
> >>> +
> >>> +				reg = <0x0 0x22154000 0x0 0x104>,
> >>
> >> sz = 0x200
> > 
> > Hmm, why? I think the memory map specifies these sizes.
> 
> Yeah and I went in line with the allocated region size (not last register)

And this goes against the practice used for DP controllers on other
platforms (or other DP controllers on this platform FWIW).

> 
> [...]
> 
> >>>  		dispcc1: clock-controller@22100000 {
> >>> @@ -6872,6 +7115,8 @@ dispcc1: clock-controller@22100000 {
> >>>  				 <&rpmhcc RPMH_CXO_CLK>,
> >>>  				 <&rpmhcc RPMH_CXO_CLK_A>,
> >>>  				 <&sleep_clk>,
> >>> +				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
> >>> +				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
> >>>  				 <0>, <0>, <0>, <0>,
> >>
> >> You need to remove the same amount of zeroes that you added
> > 
> > Nice catch. Which means that somebody was sending untested patches.
> 
> It would work.. until someone tried to add DSI to the second row of zeroes
> instead of the first one

I meant tested against bindings.

-- 
With best wishes
Dmitry

