Return-Path: <linux-arm-msm+bounces-68749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F0AB22508
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F5483A1E9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139D52EBDE1;
	Tue, 12 Aug 2025 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQxRcwv/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF242EBDEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996138; cv=none; b=SIrF5H1zY9lP4kx9FSIecxzAOMDfuK/3RZNFW6xtqDxCgY/MgKRW5Y0klipDCC7CPndFO5KIWHARr23zuPDI0yS7BUKYsSjKDAGTUUilceQ7sVYOjGfSf3olJA9p3vthrwuwQq3m77OOiEuIDVKwyxQUBwYiDhe1XKJMGP2hrPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996138; c=relaxed/simple;
	bh=Pj8Bgqn/mXPWbTZeeeQ/TfBZEKt2UzEfDdrBFxMjh2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6jGb/HF8yqF6RZL8YwTiMHZ/lUvc4wBgtu+mLO1Oe2FHIAzFvCpq2MFAibTOyYyqVc2iMdGNt7IYEOh6T9gRKFsxMJTFNF9MqFNSdW8Nq/S7acOwwSIcPGJOA88QTdlcDbW/v1+ef5cyXpPJVfF6IcqbqSArVkW3MnzOsxPYW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQxRcwv/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C3x8Ch029349
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0t0Mj4fJK1eduZrrGo955CBD
	djHdqYbc7uk+hDghtMI=; b=FQxRcwv/Jtq65zYoMJp1XXGg99XP5yZw44pjw5X4
	okbeZ3Wr3iwqmISso1e0lE0U6fkUucuxT4PQWUqchm2aZKu1BHsMppmg5ePGZJ/e
	3T/Xa+FSocO/y+idJUIKmHzkouxHiDEBL7H7s69grwHW9Sqj6kGd13A6E7jTXxms
	c9fXUr5iunJ+wgxQnfvmwtppHSMEvKfnV/lm9OLguD1foB6cEgJVZ2SJeOCJ5BFA
	5lwmW9IVkZoHEFHY9liXSqJONTJdZWGV0bCHfQCk1mIhUYkMtUS4JZjGwF6I5NVB
	fabFvDexyPnW1ZAJcqWplY2agMO31rmyvRTM7opr+gUdTA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sr0t4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 10:55:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-707648b885aso105034686d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 03:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754996119; x=1755600919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0t0Mj4fJK1eduZrrGo955CBDdjHdqYbc7uk+hDghtMI=;
        b=NTg2/oLjlAI1hd7q4awp6jSaFfuLRXZkMLfyWFy8/lLzrrTc7fiLomBdSQfdgo2k5l
         rlOlsDsSWuES+ELJttwdsdOxzW+z12d5MBLrKHmUxi9WqdOgWTl2uLBwrsaCzD3ameIm
         4xA+xyih/n/J0eqJzRGQsBuAR66LjXMR/SE33XjLJNOS7p5Kti5/Jzm88qoHRqRl1lmM
         vWW6T1BS4/2g+w47aSt34BzBs3lEz9gCSLIQd+2WAMlLVKrBYlCiaWf7wWTEOpDhEbYz
         SysYlGTOEweD0r8aCVmgMORV7fq+Te0jB5X9nwEGF5BfWO8aOqZ5MRksI1guVmaDxAb4
         AU3w==
X-Forwarded-Encrypted: i=1; AJvYcCUJ5CEp69m8q5bL5gCVOFJYpReX749sQYBlxaHV8vcnYrqivfyAtzXY1bpS5xwODtx1b9boE6FsAfuNNqki@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw5dv9wasNdqj6ehG+8zrzbc4Pmd5g6T8/SkM3HcgzqEHoCOvR
	nCtag/vv7NS3G2okMfpCzWb1JFcIKz49kY83b3UNSiY5NlHSLTKGfppS4Gcz2xN1k/WYhltvKiL
	7xmUh+vwxIwJVqjuIjdcwICnWPodbFp4QrDru3Woz4ldAGkXrzFNElw3+RZTyjVYMJMhF
X-Gm-Gg: ASbGncsGcRzptUAyylMuX7j+hpy4wzeZ4cRmEs1WGtenFziK1LNNCCKmVltFhR7PN+4
	Ttf5Cr+OzZuI8yu+l0FpwZAfpqvlp8HFIfzl8RpTJlUPf6Jr5UWiL5yxn/fR19d8/x8Vum981cI
	1APuq3ols7Zcn3W/mgXQr+1vrhHyAdSTNcor/0Mlr3fkKZOdiq6/iWWPt0nYtnXlaViGrxkgyxG
	+4bavbRPOvHz7n2kUz0tex9AoDraUyIkOjePqvI3FXYjzKmTfrtHVyxpYrPL3+thpAmYEyiK8J8
	TZjcNkLcfi7J407NvUmhvPskLjH1QoKGMvoMkkNUFXp15mqsV5oziAdcGR2ife1IeaZ2m1GixOo
	dA9SWiP/205f76wVbh4q8/ebx4/cWz5vMRzaHNvmSNMPn8GL66M22
X-Received: by 2002:a05:6214:2aaf:b0:707:49ae:cd47 with SMTP id 6a1803df08f44-7099a332e69mr182468466d6.30.1754996118893;
        Tue, 12 Aug 2025 03:55:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdkhFnmwSU74jKtHq9bp9+uokwPAB0k/r84R0m1BGkqTHSLqHpUTQQ7XgYD2WVUetchlW7gw==
X-Received: by 2002:a05:6214:2aaf:b0:707:49ae:cd47 with SMTP id 6a1803df08f44-7099a332e69mr182468246d6.30.1754996118482;
        Tue, 12 Aug 2025 03:55:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cce15c5casm1342803e87.112.2025.08.12.03.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:55:16 -0700 (PDT)
Date: Tue, 12 Aug 2025 13:55:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, agross@kernel.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/4] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
Message-ID: <27qmlr3lie54lyigl5v434yzvbes5twy6zgtkqb52ycfh23vsp@zdg57ifh7kog>
References: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
 <20250811143139.16422-3-quic_rdwivedi@quicinc.com>
 <67aedb2a-3ccc-4440-b2ff-b3dbedf5e25c@kernel.org>
 <9ff100b4-a3a5-4364-8172-1ccb5566e50c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ff100b4-a3a5-4364-8172-1ccb5566e50c@quicinc.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689b1da7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VZigEyOcwVUUxk4fBhcA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KWJiBkebqw4yu8oNS2UlpdB_fVaQR_VQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX3lyFbqq3u6ct
 Ei/Jqrkk3eAxxyEklk6OhiS18dd14k1ymDMTh8/dC8dNXLGGH1oq5h4gCmRMEpcwHqhLv5c+996
 nU+7rQOcL1ITuAbUTYXPXMvZcaQBd+Ap3WoVwGOzrPGa8flb8ZjXxyk8TBIi7BMD41k7MeIe+Ma
 i62g4cummfrE1n5uAtmu+Rj+dumJX86vDgSY4Flg6ECS4AFUzkju455OqEG9UOw3AKAy1up4P1f
 BRoq2IM0nufJkILASHI0bGrllq1xTLM5GCG1D26iWrEEKd2RMSjiAfZgcrg3ve0zcYpR+mjgZRe
 6EhBWIfjI1Nfp6+iw1INd2H9kT/ab8T8N11bR8eyyXRz8DyCleeKRN37ASk74/+e7DrpCGuXpMC
 Q/Zs2wWL
X-Proofpoint-GUID: KWJiBkebqw4yu8oNS2UlpdB_fVaQR_VQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015

On Mon, Aug 11, 2025 at 10:24:29PM +0530, Ram Kumar Dwivedi wrote:
> 
> 
> On 11-Aug-25 8:13 PM, Krzysztof Kozlowski wrote:
> > On 11/08/2025 16:31, Ram Kumar Dwivedi wrote:
> >> Enable Multi-Circular Queue (MCQ) support for the UFS host controller
> >> on the Qualcomm SM8650 platform by updating the device tree node. This
> >> includes adding new register region for MCQ and specifying the MSI parent
> >> required for MCQ operation.
> >>
> >> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 ++++++-
> >>  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > Way you organize your patchset is confusing. Why DTS is in the middle?
> > It suggests dependency and this would be strong objection from me.
> 
> Hi Krzysztof,
> 
> My current patch submission order is as follows:
> 
> 1.DT binding
> 2.Device tree
> 3.Driver changes
> 
> Please let me know if you'd prefer to rearrange the order and place the driver patch in the middle.

THe recommended way is opposite:

- DT bindings
- Driver changes
- DT changes

This lets maintainers to pick up their parts with less troubles.

> 
> 
> Regards,
> Ram
> > 
> > Please read carefully writing bindings, submitting patches in DT and SoC
> > maintainer profile.
> > 
> > Best regards,
> > Krzysztof
> 

-- 
With best wishes
Dmitry

