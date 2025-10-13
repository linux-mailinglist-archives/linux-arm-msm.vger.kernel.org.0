Return-Path: <linux-arm-msm+bounces-77005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3311DBD2FEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AEAF734BA92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 12:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52343270576;
	Mon, 13 Oct 2025 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHKE6Szt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CBD24A06B
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358877; cv=none; b=HgXktAhM4eSr4BoLOTPKqf2R1LFpQmDy2gsyfjGYYvBTjBMRPfYFNC2JnwNgaYr2Lo8Brgvn/v2w7crGVwmI/0nN/qh+moVPDRMpk3sg4q3EpJd2cKCH3P2qkDGhH9Y8kdgDZ87yhrowXibAC7lO1XbT2hzsMeMeb/fJVb5wxUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358877; c=relaxed/simple;
	bh=O5IBxsN6ic5oG/r8QyaBfjvgKnYuqZyVcNxtNddUJ8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TEAUY5zIxIHlku/J8OFEClLH7N+l5Pjs/WkxzWS9pdKwKZgAL6Ps+yoeBM1z622sfCUdyAjnhcwmCNOc2a6WS1NPWRiHGQ6KFgr1AbxoYBuLdQcY7410fqfKKm+xQdRRy6FYvH6SvoiiRp3GCsPRNR/CsXpjJ1Th9MbVHX+DfDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHKE6Szt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAcD1r011098
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0c/YLYaDMoEGnP2p+UDoLSwW
	bwVJnzjUv4KnwNKCfEY=; b=cHKE6Szt423RB8gknU+LDvdj0Cuw4qswyTZSaxAw
	3Vln1wH/aKoGO3yopYn8nbYnpcw2S5NHX7Sm79VwKwLYqcQLc+ZXI9mJfef7hziV
	AKyPZ2BlBcuN5v238ZNwTY7D5BQ55vFbmhOXJXLfe40w7C6yQPCZFlJkWD+9Scay
	ynngzBZIK4MUfj9Pj6V8NhLYw4l6QgLJ27bWbS19Ao6+8gDR/kWDmmWrjCyZLQJS
	Drz4A2m+5QZP+VC6nw07jEHuiMMqSvOsKt+L4sJGzjlqmM7rq0O7DHaJwuV9FO5I
	WjOXqD+QR0hcatHH0bdFdVzbAjOv4iTSBuOaVcQi0GtIuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0bvfjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 12:34:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-872d2ad9572so2361468485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 05:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760358873; x=1760963673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c/YLYaDMoEGnP2p+UDoLSwWbwVJnzjUv4KnwNKCfEY=;
        b=EFIcI2xuaDyE5lCEXek81a8GkZfT7YcMxZLd2yJFtd4msTd7Apfnyg191CfBieGY09
         nplCIkHmGtrEsNoJpKQ5iFythdNjwYBxdXPzdsl6C6PuhytuMnB5kM78tJtQJ6Tsu8s9
         iDd7q4A4uiv+9btXCjsq3Ueqeer3+tikYgwkDNJ17iiQecalQvftPSSgnorMkD53Os6k
         4VX4HwqQmdPE6LWoWBU0r6tariZWKXJS6ArSigNzEauaZYY+d7rwGPv3jgWcFDXk68sB
         GZC8DLJao1qiOAxJDRep5ZXXYxE1iW9Jl//UUknjsxPXOrd7ptVtnZVcl7Or228KUcU8
         9RFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbikEQRsTl36CQYheAQDwMnZAT8YH1R2CYV9CBVUWpoX2+S4NpZRpHfU2ndi+bC6EcLt32KQhz0SFjazqd@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0z/jkFDS7cyy6MFXK9N/ZVsylZDps22i51Re9xxlLqWcRiZm
	7azrVX0BzwSns4AZiJ479rl5UNlclOt08KHN0rUhJOXOoR8mLvr5qtYAV5Y4tDkvHad8Joh1Qfk
	WNLpjN77a2nI6D2WVSXblWtetpkgnIMAdpADpoyHJCy7q9N/KVWNl+6tpeWRpoOXcWipw
X-Gm-Gg: ASbGnctUvXt0n5FUiIqoyfjLtWhs0a2Ub3RyOewMm+747lDiSHnIDpu1TvFZ1o8euhr
	aXorzmxB9S0dA0XHXSBVeNaXkWih2CzmA8Q9OjXC9elJxJFqPG2Dm135u2ylYdAfVUpNW6G1B5/
	bYGLj4CJSNXtgO4dSGuAE2SAxs440l6HeZPURwfH+xW8c0f6gFs1lONVr7PzIs7lBazO8Fswejl
	SfMsbUlM+OxT9fEtPl1gj5+oDG1guNCv2Jv3HM7F75eGGShz+eegjqcqRFWRrtWgeQ/0L76iqIg
	6TgRa7DauoUXZdeKOpMTn7QBpcStWDGIIwmw8jVO88lfMOoMJXjjL6h5C6gNARTsTvYgvN5IgMo
	Ej3xLvTxnvPgEYr8tkraHmc9QRhRqOBp4/0yLh3dHsdSs41c5nPfF
X-Received: by 2002:ac8:5d46:0:b0:4ce:9cdc:6f2f with SMTP id d75a77b69052e-4e72122afacmr71752711cf.13.1760358873414;
        Mon, 13 Oct 2025 05:34:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNbh12YwL4Iy4NRipEsFChMHtKqDe+smfm+D7B0YFilvKsxmQIYfhkB/7L1zjAmITtmN+oiA==
X-Received: by 2002:ac8:5d46:0:b0:4ce:9cdc:6f2f with SMTP id d75a77b69052e-4e72122afacmr71751921cf.13.1760358872891;
        Mon, 13 Oct 2025 05:34:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881f862asm4116608e87.27.2025.10.13.05.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:34:32 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ritesh Kumar <quic_riteshk@quicinc.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, mani@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        vkoul@kernel.org, kishon@kernel.org,
        cros-qcom-dts-watchers@chromium.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 0/3] Add edp reference clock for lemans
Message-ID: <7jmk3txdrnit6zn7ufra7davmomggd3graizdu6wqonp3lljza@mfnxt2owpknq>
References: <20251013104806.6599-1-quic_riteshk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013104806.6599-1-quic_riteshk@quicinc.com>
X-Proofpoint-GUID: epSVURHSF75oidWnASxPFKmKA5Cm8jox
X-Proofpoint-ORIG-GUID: epSVURHSF75oidWnASxPFKmKA5Cm8jox
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ecf1da cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=sf-Njp88EExxdhEklOUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX/YpCz5G0gp3w
 5vtMv10Y8DG8bTJ6LGwfJNfj4yWGtQk9IFB2zZHlg9zS1SNuuKFmyHWgYKplemz6btCIT/Fu+++
 HdAsXMkhZruDoPQetsb1akNI+bcUTR3KgJ7PsAgbsjrwlrTTD5QN1D78eYbqvZP/4YLBfgL/gon
 YloM8bcTf9fcr3XQliqFEVtEZQ49XmN5prWGPYCudURRi6yjembawy6NgoESvA0EoTzk4GrMrUV
 /KFzqXJiD+fDxV1ul0GejIPjw1BKK/LkAqDjs+bhQP1c0DGO3QSSeYRFrXxTkAiQdFtH2ZOYxeO
 8z2tLwJxoTe563nCk93oOjxrnwm8DIOoMy/emV5KmkOfFG3SlY50hYxVMJC051+Vt+QAvTcFhQs
 iGV5d6jTvwamVPbvgG8x64oQ0mOfNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

On Mon, Oct 13, 2025 at 04:18:03PM +0530, Ritesh Kumar wrote:
> On lemans chipset, edp reference clock is being voted by ufs mem phy
> (ufs_mem_phy: phy@1d87000). But after commit 77d2fa54a9457
> ("scsi: ufs: qcom : Refactor phy_power_on/off calls") edp reference
> clock is getting turned off, leading to below phy poweron failure on
> lemans edp phy.

How does UFS turn on eDP reference clock?


-- 
With best wishes
Dmitry

