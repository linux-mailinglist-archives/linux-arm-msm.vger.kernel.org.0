Return-Path: <linux-arm-msm+bounces-69206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F6CB26430
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EEF19E7836
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAD52F0C6E;
	Thu, 14 Aug 2025 11:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U8Lzcoi0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB93D222566
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755170775; cv=none; b=mhc3vHgRSxuZakionBw30HWHOR7gQYfwb+c9meXFfrhPgwTOe+8I29sK+rM6UKjy/l8e3PTS+rLY4UgBCtMWAucdQb8SxnrWEP05rVvkpxGeYKnjRmbdlTyJYlSGkCZJ/+5uoGVsXezuzHjZ86aIMt9IYjT0ohoBcd5FOmZmKvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755170775; c=relaxed/simple;
	bh=TXbSNiEB3R/2ieN7xtCoarUmorqxnfg3YNjh0dqu3+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEjuCvW4S+pPYq/1xQEW1+Lc/ckB/vscuakHHUiDicQjVAQsirgiErB6FfkDa3HJts6lqn5cr74pEa70sbAtRx5H/gbQR4FyZuRmwPP6/D6DTQHqeaIfpGtaVeywpYeXnHe6nTfSEjf2ZsOuFu8W50NFDhlcN6QNSLA5MGn+UY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U8Lzcoi0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9IRct023974
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9l5Xf7ay6Os+hJPhNXMLzGQB
	mPfNGIe/A5XHYvxm8IY=; b=U8Lzcoi0K2t2nPu4CVPuCIGWaldrI1vDN/RMfRyw
	6fj6vqz+Ek+TPMf9b+QSMIPbHaW1cZheiHo3aglRKRBiTSdCNEgcN2827vSTNZHG
	j2NiTMCv0Ain6uCeKl5ytRi9zqa/1j0dqwt0jaMWPlFAr0WOcTrCQoxBqamteMNt
	CCyz08J73RhTlx7Jq5JrUuRB1lJUFX9yNttjvu8eRXmPp4V2wgWf9wywfC551VTZ
	M+ClCLiDqKsLT5WrRNXHQY2pzoDqAHkb3ndybAAd9IbUiIa+Nt5605T9NX8CQGnr
	3OmuuCwBBMEeC/VQGQIM88fmFg8xwUtjkupwJsGyQJplVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rv4wd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 11:26:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109bc5ecaso23433461cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 04:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755170771; x=1755775571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9l5Xf7ay6Os+hJPhNXMLzGQBmPfNGIe/A5XHYvxm8IY=;
        b=tnqp6K5nColwAHyS3Ge/YmOSeF+7J8Oq8QTqzcBn88XxdOrwawPiRMQhAoYERtGbUi
         orlFaol6jGEb4m2VQXX7sSxVh7Y7MCBtdnVCO+ubnlOChXBTLworf9Hj5Gkn8h0CWgLK
         w9la8owZrltbIjXoqRs11JJpG/9GljWzdMkKQ0G7OEa+4UaKGV5gFTF70vJQ9bJcRzX1
         kWjqaPq6EBGzUDaILwFgT6mpVi+XVmRB0CJbjyU80fiWRl3RBC0I4QKLOw3t0B/OBg4v
         a+7bwg/gtyg27ABpc5GKMDNcwH3HGgQUwFnr2hWgqKUWovFDrW3jVRpNAXvF9LkhUsOy
         hJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuUZvAH8FO923S9lfp4EEt4bPYaHTQ6ZAzfSQCyNW2uOTXKDFq47GnA/L9LJgjwp7croVT90Ii+CnlaV9F@vger.kernel.org
X-Gm-Message-State: AOJu0YxaqkFnp1HD4otSvNcJOJwJVghEkrmjtch2V654282m9GXlLx0T
	z/+qCAXxywpm68/0wTVH7ZgiSXqUj0yUY5rq8OcKwplDJptx3HZHt5MtmaAP8q1gnAT1BOfxGKw
	DCvDSd5z49G99yJtFbzQ53RhfXcI9BM6w3dn6ov5Rt+2BIqc6bC+jcpjhxvuWgr6sOyM/
X-Gm-Gg: ASbGnctZ+RYoM6QL9msT+OJ+VjGXK1SjPOPP3y1XcAswBQ/udlWjRFOyvGuCswjQ1Or
	KmtbMnpHybHfnJ7WmYZLy1XDpr3fSGXQ1qIRg5GEp46uFaGJFtaugciLWD4EvWgb6ZDJXX+tEPJ
	Gc5lwpH060XBQhhCAphHFHPqZzOdOIXHxwbJdApepumwONSzYBt0KzH7YANYny7KB1RErFTXgwP
	Joe+zqs35R2gPAe3+/+nQ15ilUze6ccPDI6FfpS1XIo3lcJ4/A4G/RuPgWjwUbBWC15mxNjiQMh
	qix5HGd9QI2q86mECQfqZ9nT0FERTseNLsSJmpZIVQ+eoPLvAwYQgNMNxpgFjrpVqCaSaB00G7z
	0o+Bhg9ZGA4Z46p+IS4Fltw9Foo2Li0Gx4OF6mVRR14dE1npJpuRf
X-Received: by 2002:a05:622a:511:b0:4b1:dd3:e399 with SMTP id d75a77b69052e-4b10dd3eb4fmr18484711cf.64.1755170771067;
        Thu, 14 Aug 2025 04:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtN6pLL60KSnafzV8jSq1qMtlj0g/UPMsEkwHvO3oPzQWBiZQja+mqbp1z25h70yy7INfOYg==
X-Received: by 2002:a05:622a:511:b0:4b1:dd3:e399 with SMTP id d75a77b69052e-4b10dd3eb4fmr18484171cf.64.1755170770552;
        Thu, 14 Aug 2025 04:26:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88caf0ebsm5610119e87.154.2025.08.14.04.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:26:09 -0700 (PDT)
Date: Thu, 14 Aug 2025 14:26:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>, marcus@nazgul.ch,
        kirill@korins.ky, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 3/3] dts: describe x1e80100 ufs
Message-ID: <25c5vwdgrfar6rz657nyijan7ozo5nzyyxb2w26wf5rvxftkvm@wy2fbsi77prj>
References: <20250814005904.39173-1-harrison.vanderbyl@gmail.com>
 <20250814005904.39173-4-harrison.vanderbyl@gmail.com>
 <tlkv63ccpnti367am47ymhaw3agjnyuonqstgtfaazhhptvgsp@q4wzuzdph323>
 <57ce520f-a562-471f-b6b4-44f0766a7556@kernel.org>
 <aa0ed59a-4eb6-4f7f-b430-4976ee9724d8@oss.qualcomm.com>
 <433e1189-e2b6-4299-9fa7-13e7994ec89c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <433e1189-e2b6-4299-9fa7-13e7994ec89c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX2hiveTnT0EUP
 tzl365NkYEx6O+WEa8V0Kdsun1DNdJ0b4Fy+nVnwCxDRh9zd6mAOtazr6ttrxfDXQcT9xDFEIx2
 r3bNP7YNMNe3chj73n1S8zifu/m4chs69KwpQ4GKGh2igfIQ1c2TM7atbk/Hsq17YGOdC73UwHJ
 dy9vkB0UBV10ruTouKd1iAtj0F/ptPeNXVDnGdhPTgutKBmKuB63d5mq5EEHQ/L6zqW5U7VYE2G
 sZLMAFwJQtOuHDuyRPVaW8n+TePTMg7k9e/9c/azUxcbJs9XSlmX+a6r4+wcFXRv2NdM/5wV9Bj
 GEe+yajd6tM2JsCw7gTJAsFk4Udt8bvQvm/swE5uRXKQ7zt4WdHBAGoHmCT1Lk9nQuqEa44oN5v
 13oxBi3a
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689dc7d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=4zz7r-QmOHHUCVnHuw4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3dyWwiahHji929ESbZg0Srh0y-b3OT60
X-Proofpoint-GUID: 3dyWwiahHji929ESbZg0Srh0y-b3OT60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On Thu, Aug 14, 2025 at 01:18:46PM +0200, Krzysztof Kozlowski wrote:
> On 14/08/2025 11:46, Konrad Dybcio wrote:
> > On 8/14/25 8:59 AM, Krzysztof Kozlowski wrote:
> >> On 14/08/2025 04:42, Bjorn Andersson wrote:
> >>> On Thu, Aug 14, 2025 at 10:59:04AM +1000, Harrison Vanderbyl wrote:
> >>>
> >>> Welcome to LKML, Harrison. Some small things to improve.
> >>>
> >>> Please extend the subject prefix to match other changes in the files of
> >>> each patch, e.g. this one would be "arm64: dts: qcom: x1e80100: ".
> >>>
> >>> "git log --oneline -- file" is your friend here.
> >>>
> >>>> Describe device tree entry for x1e80100 ufs device
> >>
> >> This is duplicating earlier patches:
> >> https://lore.kernel.org/all/szudb2teaacchrp4kn4swkqkoplgi5lbw7vbqtu5vhds4qat62@2tciswvelbmu/
> > 
> > (that submitter clearly expressed lack of interest in proceeding)
> > 
> 
> Sure, would be good though to reflect that - provide summary of previous
> discussions, changelogs or at least give links.

... Also keep authorship and SoB chain.

-- 
With best wishes
Dmitry

