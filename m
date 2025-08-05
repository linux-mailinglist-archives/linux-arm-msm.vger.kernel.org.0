Return-Path: <linux-arm-msm+bounces-67766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FF9B1B197
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 11:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF4847A13FB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3F326B2A5;
	Tue,  5 Aug 2025 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/cKFDsv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BC1259CB9
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754387956; cv=none; b=SkGkgBE7JXnEmVSSkC02YWrt4+5730U+iSCpubHzRBMamT75vB1jZxtafTKrqon1dmsoOpK9Ogc8AeaGLh8RPF49jrDtilFLq8m8UdkcjapmBwXuaQT6WKMd750d/15yW3vb1186d+etGF82/23IWGdabYLDruHoe+lAaNK1urQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754387956; c=relaxed/simple;
	bh=6xnkcRjjaBCV9mGFQ39UJqLkd2ZbEMv3DHt3bw7xXVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ec18MoUCRW1kxp3j8SYqKS4VW17vWcSFbzFbJ0k1g1rVxb3KFgW7Wo3IYUEj3wvxn1iznOk0TahKPkk03YuUnJqyxB7yAKJi7aWqOkNqnxn4L2bqculRC8CGhIA9HTHuyLWF/KS81OyxP4gdlWvyTyBp1vzB3Ju5VeievVAQXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/cKFDsv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5755v8D6014583
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 09:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFkvM2HVsX9Y21JHEp/hCHiYryvffbqt4OmpC31gI6M=; b=a/cKFDsvjeknMpcV
	QDZ0r6yQBaPCNk7jNDdJ/aX+Ognr4LHk5faaMtRFv4C55saHwbzUGEp1Qph4yRkZ
	VwYJEEeeGhhxq+71m+g44x3hGmCrQr8tZZ7PjtN6YbQgq8gqKmgby/xaNM92ijom
	n6Nd+Eqp2AsqRvoaAQfOgDssOnNgQdcciVpVeFhyYeZ0OalpesYBLEyyb45qysGT
	Lu0WoFIbOzjhdFpOPH3DfrO2fG5HvOU1SHFb4wOfxO9Tvp9B+58q1znp8ZWZkzGy
	dElqQHtrPat2JrBWdD6epOg/jj7Ku9B+eHHi241DdozGQmn6TtNVWOIM08Nv6pBq
	nHVj1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc81ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 09:59:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70732006280so75074736d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 02:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387951; x=1754992751;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oFkvM2HVsX9Y21JHEp/hCHiYryvffbqt4OmpC31gI6M=;
        b=NJk6rnKD7vrY25AFqxseYOsb9x3aLML8hjbt9ksBTNJgPUIOBUbwu7/EB0d2ex+/6C
         1tB5aMa/IEku9R9vIgX/ACTIy6n2QbS9mDSOQFMo0HDz1TfiojeeKSS7RGRoAJYHZGaX
         FZ+vyMhSvx72PBHM8P6SK8jiUccwBbVHH0+Xyk/JkFxN3P+w00dyCFha0Doc58ylAIoc
         IFpvdY5lHuzbE2p30qyuYkv+2k7h2NmIfihCG3Mn1l36VRVkseb5UvhK0J4HGipxa30F
         WgKZNQKy6wnfmvvFCPsOUBVnFJkua+XlWKErsIfLBhd3m5hI3DpKNI4gGAwTcX1uMEYe
         /y0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxAUZd6MPhoqWtRUu1ZqfSZb4z4qMekIlymjheqjgYgY2EdyZi/mOSRE60zXOtm/W6TdSvRpnYQrLpfvQi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8u0DEmLj7UJadcRgQcOtsih6yqAa+FkObYQ57CdHycrzsezqH
	CcI0lg2+s93UZqPIqoVxpY5xkOG4imLZC8bG4GMZS9zxZ75NDUUsx/8AO2eMRFmUaLTgDnzKCEr
	xEF1IGFIGIy99nY5DZLEYJgoa61KM5CazvG0AX00S1bMHWNmYd3bc313Mb6zOEYIQnZxGqNXoAE
	O3JRHY9w==
X-Gm-Gg: ASbGnctNNLHxBLJlVEPV2J72QpyPe1/32NsQcG5u19dZ++7iZTXWXjPy4//pPkHdPTr
	bo/l+UiMECpGclEYf90BksDZ67JKfGTTVoZ8g+dAWZsIR4GfgFo0rdxKPVOiVqbhJXallIEL29q
	rKz/Pf0Qfjh81OOqs9+pf5iNksnX/lS79rgzGGz291Ei3hmHhZqMTPGGG2Q92iz1xVBIsDaJDV+
	v9HHNvcl2AnrCsWWdjF4YihhOeptiwfUn/G48EP9mPGBMHQ5oJf/jV5Lt80cKXL7JRXKEqXD8KJ
	tyaMqyB+sy8lcA84s02ypadfhq6Qcw1xMomI/zjiVINnQdw3UhfxQJHgeXgFMDYid8QJDKq5G4R
	aK3Es+GkEhtgSYTMZMfVhCt217+Ji4n8R2roLQqITbwr0/hn3hXQk
X-Received: by 2002:a05:6214:411:b0:706:de4c:fddf with SMTP id 6a1803df08f44-70935eeed18mr164933386d6.9.1754387951282;
        Tue, 05 Aug 2025 02:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGERL535Nj+LI6rztA9IAgnP+naoieBDZmsnatDeRA4g6lNmzXFHANW7lm0JicsfOzA4t0Pqg==
X-Received: by 2002:a05:6214:411:b0:706:de4c:fddf with SMTP id 6a1803df08f44-70935eeed18mr164933146d6.9.1754387950742;
        Tue, 05 Aug 2025 02:59:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-33238272ff7sm19726081fa.7.2025.08.05.02.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 02:59:09 -0700 (PDT)
Date: Tue, 5 Aug 2025 12:59:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
Message-ID: <lkjp2353athoi76h3j3bgkcxdwfn6akcyyweipt4g774ztmmer@vcw7ru5red3n>
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
 <20250801084518.2259767-5-quic_sartgarg@quicinc.com>
 <69f2807c-9a28-4b31-97cc-2756f0ab9fd4@kernel.org>
 <c7e36755-9255-4209-9d53-20077bd1d3ba@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7e36755-9255-4209-9d53-20077bd1d3ba@quicinc.com>
X-Proofpoint-ORIG-GUID: ufKzulZecKrVjUvMnfJDefCR4LJfu642
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6891d5f0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=kKDBy8IbGvpil11uj3cA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ufKzulZecKrVjUvMnfJDefCR4LJfu642
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA3MiBTYWx0ZWRfX8Gg/m6OaXima
 wpStRKTfLBPRHpMguB84QAk+gddNrdjzkTMrsX+rv+IVs9Kvd5dcIi080FquvqD8aHwrDvdXscy
 ACxNjEcGCOtvP/FTnKi70SfL2zAGEp35PbI3pARc0OQbVjxoNfCouJ52w/wcBxw+nqwIOfWRSxF
 98ZY4Mb2U6URIz4vLfI3OhHqlfEZvdqvimr0UYO3aByfHrXUDiR13Ru/RteRrb2HbyckDZwG47F
 OadPgQ+4GwGZq31q+z7g+/+9hq4RPIZ7wKNYXgvuPPoLkYEiVfcTw0TyaVY5lNRg25LPqPkjr08
 kHxn1dfdgz1eDO2NseolyPET2jYcIXBZY00PJ7bCtG9kElMg8o2NLDwDZpX56pqy5BuBVKIeI15
 BXUGgJjeSQSuTMzWfckZ8DUXRhC2S1aop1xMrKQfoeBQoH2RtOiG805efjuWq5zFyBWW8NsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=992 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050072

On Tue, Aug 05, 2025 at 02:49:29PM +0530, Sarthak Garg wrote:
> 
> 
> On 8/1/2025 2:32 PM, Krzysztof Kozlowski wrote:
> > On 01/08/2025 10:45, Sarthak Garg wrote:
> > > The kernel now handles level shifter limitations affecting SD card
> > > modes, making it unnecessary to explicitly disable SDR104 and SDR50
> > > capabilities in the device tree.
> > > 
> > > However, due to board-specific hardware constraints particularly related
> > > to level shifter in this case the maximum frequency for SD High-Speed
> > > (HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
> > > card in HS mode. This is achieved using the max-sd-hs-frequency property
> > > in the board DTS.
> > > 
> > > Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 +
> > >   arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 +
> > >   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 +
> > >   arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 3 ---

You missed several devices which use SM8550. Please fix that.

> > >   4 files changed, 3 insertions(+), 3 deletions(-)
> > > 
> > 
> > This will break MMC for all of the users and nothing in commit msg or
> > cover letter explains that or mentions merging strategy.
> > 
> > Exactly this case is covered by your internal guideline, no? Please read it.
> > 
> > Best regards,
> > Krzysztof
> 
> Just to make sure I’m addressing the right concern — are you primarily
> worried about the introduction of the max-sd-hs-frequency property in the
> board DTS files, or about the removal of the sdhci-caps-mask
> from the common sm8550.dtsi?

This patch requires all previous patches to work, so it can not be
applied in parallel. It should be applied after the previous patches are
merged by MMC maintainers and then available in the Bjorn's tree. This
requires either skipping a release for this patch or using an immutable
tag for the MMC patches. All these deteails should be explained in the
cover letter.

-- 
With best wishes
Dmitry

