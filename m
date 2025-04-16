Return-Path: <linux-arm-msm+bounces-54503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0250A8B8A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:14:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B81117DB00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8E623D296;
	Wed, 16 Apr 2025 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XvuYr27O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEF82472BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805648; cv=none; b=Z/UQTjo2xV3ZuO5laJCGDnIMn8rlbaryTtX8bkEfQ5/QVOy1l944pq0NYRsfBaGJGjLfC/nICOYwspjAawBtNtYUFS7Z0Xo8euNcsoJscE2VT2iHb8PVf6TSq+cHrtqvamncHQBSbSquQhoefSrlYlD9NASmcKDc1WZB8435QBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805648; c=relaxed/simple;
	bh=8ZR2LD+reQ/Dz1RzU5SYkbXhaZByyYvQbKVpzYuVc1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUgN34ihWqmTLHKMBj51/xzt4sH61pd/jaOrd6KlzV4TnSb3PaltMHM3eYwlbteV1mqGs3OSIKSc+D//Qr08cFP3qMweUr+8JBGKLrTY3oU2raMSClshTu5V7kLhpGn6WSB0qI06Zs4G3tLPmr8lVREVCzGzbbBoMWy9Gr0WHTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XvuYr27O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mHd5020815
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hoicvJayGfRbnVNr+kDnUFXz
	fuMtcH6jdsL2r7v/8DQ=; b=XvuYr27OqXZK4noaP6C9iJspNwv7GtnmKDByE1+k
	lCem9xCUKbOJPxbBHJMGuQfqUEtCH7cuNUFlGk7PvXertbejzlTdW+cZKNMdZ2HD
	z0PrUKrB2GFUOqF25conwqWsHMxQpQdLsJkzUBTtlRr0iZVV0V9eNWvOGfcNtcEa
	EW9yDN+qLyawJjjQcgamwDXjqq28hzpJ6ivWHXk3NyNEkYqfh5EjotxZZ+xHeM0a
	/LPYDjGRlu/wc6KCmpIC/WYhgnvxVUiyEyUuqxYhQvbgmbrgk5+7Q22Fpfq9Ao14
	g9g8llaHSbon3/WiW5+L7xhsYDiifiq/Una4P8IuNtaj9Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wkes8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:14:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af8e645a1d1so4577675a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 05:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805643; x=1745410443;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoicvJayGfRbnVNr+kDnUFXzfuMtcH6jdsL2r7v/8DQ=;
        b=geaXk/uFTq/eQhC+UDTiebD9cQ9/tB3E2T3g6O6xdyYoEdS4wDJXAgImqwRrzn5a1J
         u7KNJyPGaXJbx3zHG8l/ezvAcGjxGLui8zJNC/JdXrZ0el35uiAN/88o/CSZ5i7rJ59F
         v3plSBZc5azXnXGjafyHCX7djgrRohY7sGU05R3aiox72+GKB3a48l6euo+g2ZwHNq0Q
         LAfBu/hnCYdET+41s6P16/nGJWe9yEFpY48cFVcRzKYaUMzERWwsrFUpOBTFM0qnA+B9
         EgEjwpPPG117fIrBPxT041CXS3S+DXP7RVw8/qIcKVRFeMrpAprJwol6v1wurKxEBoXl
         0SvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCcH3jFtD3Gi5ABBZ4VJ/tLxZH9K7l8OMnfAb8cXXtam3iMZOR4ov+RnXuS41sCFidU5jiRMCaKrpxkYZ8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5OrnmHmgw6KIo2JFHzo6VUFuj0d387jP9eilI3XqT3EW//Zm
	9WG90X9ej/ljsxWdCY83cCwjRzfxwTB/rW5tpVjPFhYsXUgJSrEXHSLQX633vQYiyvjVl1WK8S4
	Wzf7JVTI5CgLhVpxwcBKo5i9zbVkEaw5SL/9xIsvWf+Fw7TPL5m0TvHUCN004rp39WzYPy/HocU
	ODgROrTurTtbqcX1iBXWsY3T8sjrdv9wb+xtHx+O8=
X-Gm-Gg: ASbGncsxxYcX10dhJtZPuhO3WUARzU4xl6tZFKPBN1Fv7Ipeag1TNWpF1A2ceCJfgeM
	9P0YXB+8WhKIhuFhI6vuSSWZuPrh9xe//U9senlBSbtFeOp5Ws3JdURDAAwUoH1YsZJMLxPuTBe
	f0pP738gU57hlmXMHRyfu8J3tc
X-Received: by 2002:a17:90b:498b:b0:2fe:a336:fe63 with SMTP id 98e67ed59e1d1-3086415ea28mr2431958a91.24.1744805643292;
        Wed, 16 Apr 2025 05:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBAO/IXJsIRD6bGBDFHb/vhg2Pt0r5xCrzct5z2vNsXzqxMqL9va5fjULmWQG3bJv/Ec3+IT1w+RLtSRXwQS4=
X-Received: by 2002:a17:90b:498b:b0:2fe:a336:fe63 with SMTP id
 98e67ed59e1d1-3086415ea28mr2431917a91.24.1744805642822; Wed, 16 Apr 2025
 05:14:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com> <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
 <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com> <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
 <2820908b-4548-4e0a-94b2-6065cb5ff1f3@quicinc.com> <c2ec6b7c-421d-43c3-8c0a-de4f7bdd867c@oss.qualcomm.com>
 <a24ff510-2afd-4aa7-a026-199fb6d87287@quicinc.com>
In-Reply-To: <a24ff510-2afd-4aa7-a026-199fb6d87287@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 15:13:51 +0300
X-Gm-Features: ATxdqUGiC1BHfSn5Eklp7gKFpyWYSjnAPEw8Fg9jZzGqaxHriewAs1J3z4zxcto
Message-ID: <CAO9ioeUDzYLMvqmsOQ-VfgLQLavHqn=QVYxyHzetjSfmhjKFjw@mail.gmail.com>
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=67ff9f0c cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=E4AxlzQU9QZxWW8QZIgA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GthxfiPrSu94_DCDJfDsHPaMkCNc_DNI
X-Proofpoint-GUID: GthxfiPrSu94_DCDJfDsHPaMkCNc_DNI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160100

On Wed, 16 Apr 2025 at 12:08, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>
>
>
> On 4/15/2025 2:59 PM, Dmitry Baryshkov wrote:
> > On 14/04/2025 23:34, Nitin Rawat wrote:
> >>
> >>
> >> On 4/11/2025 4:38 PM, Dmitry Baryshkov wrote:
> >>> On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com>
> >>> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
> >>>>> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
> >>>>>> Refactor the UFS PHY reset handling to parse the reset logic only
> >>>>>> once
> >>>>>> during probe, instead of every resume.
> >>>>>>
> >>>>>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
> >>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume.
> >>>>>
> >>>>> How did you solve the circular dependency issue being noted below?
> >>>>
> >>>> Hi Dmitry,
> >>>> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
> >>>> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
> >>>> about the circular dependency issue and whether if it still exists.
> >>>
> >>> It surely does. The reset controller is registered in the beginning of
> >>> ufs_qcom_init() and the PHY is acquired only a few lines below. It
> >>> creates a very small window for PHY driver to probe.
> >>> Which means, NAK, this patch doesn't look acceptable.
> >>
> >> Hi Dmitry,
> >>
> >> Thanks for pointing this out. I agree that it leaves very little time
> >> for the PHY to probe, which may cause issues with targets where
> >> no_pcs_sw_reset is set to true.
> >>
> >> As an experiment, I kept no_pcs_sw_reset set to true for the SM8750,
> >> and it caused bootup probe issues in some of the iterations I ran.
> >>
> >> To address this, I propose updating the patch to move the
> >> qmp_ufs_get_phy_reset call to phy_calibrate, just before the
> >> reset_control_assert call.
> >
> > Will it cause an issue if we move it to phy_init() instead of
> > phy_calibrate()?
>
> Hi Dmitry,
>
> Thanks for suggestion.
> Phy_init is invoked before phy_set_mode_ext and ufs_qcom_phy_power_on,
> whereas calibrate is called after ufs_qcom_phy_power_on. Keeping the UFS
> PHY reset in phy_calibrate introduces relatively more delay, providing
> more buffer time for the PHY driver probe, ensuring the UFS PHY reset is
> handled correctly the first time.

We are requesting the PHY anyway, so the PHY driver should have probed
well before phy_init() call. I don't get this comment.

>
> Moving the calibration to phy_init shouldn't cause any issues. However,
> since we currently don't have an initialization operations registered
> for init, we would need to add a new PHY initialization ops if we decide
> to move it to phy_init.

Yes. I don't see it as a problem. Is there any kind of an issue there?

>
> Please let me know if this looks fine to you, or if you have any
> suggestions. I am open to your suggestions.

phy_init() callback

-- 
With best wishes
Dmitry

