Return-Path: <linux-arm-msm+bounces-66273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EBEB0F11F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:26:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F2E27A3DEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 11:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075C92DD5E2;
	Wed, 23 Jul 2025 11:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqbvgm4z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65450283FF7
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753270011; cv=none; b=HqOyjheKxZ4j+Ibm4QC0MsT8Sz4QflwfAy7emK+gRRG+l8ZUUSTrnwgG9hiH79iJp0LmFcGdS/0bma9v2OBIEu0YFWP1PJT95NAHdIOaMsA7bke3BSCWFNcwvB5z8E9o3ZFlylFGbGfpn5ijyY1NfOFchCz4gis8JEsMsvFg7mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753270011; c=relaxed/simple;
	bh=DVfLmPAW/+LES4M6qfek/cSAyxf+7zdrYqLo2qRajDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeRwJfWEtYwGSBIA+W+YD5YP62awYU1GVkWixOn4mXIGlUouKDhZDWjXNwLf64r0bX5bQvrPjcqQZfF7uEbYMz4Sb8mVsF+Z3GMc7VcxJJ+mI0vTIUuQMJfsnBryeR9IU0AZND3YS81y1HRZrZeYVh76hkyewyE4frsX31/RD3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqbvgm4z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9ZSiM027816
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjEm6Yo2vInyDtUzOUPiHjkggFV+IfkNgBwObWNLpNA=; b=nqbvgm4zYdqaje1L
	dGb0gBUarxAyxSdWc5FcOT3gjjhsomAOcMoYEC2I826g+eQtidVcKfzNG4sgdK7V
	xMoXVQwPTy5tnPAhzcuulBDrLeMb9LlozghHM4BD7D1FOVJN1IfN49tgX/83z8hg
	7SAgn3wO4WLQNnYeEG/b4lb6MaJUKChAf/s8udJd/6nQIHW/wdM/o6JQrthrevcJ
	9Wadp6UUL6SJOtQc92j5DSv0v8YLV7UkpTZ22PsqI2C2GBFkvQwGrzDph3ukdYni
	aCspHXki0oRxkmrH7dQfanhfbXRuNBkb/koHoV/a1mXwKWL9VDJukwRWFQm9wH/7
	rBVaVw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048s4yea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 11:26:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-706efc88653so36469356d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 04:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270008; x=1753874808;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qjEm6Yo2vInyDtUzOUPiHjkggFV+IfkNgBwObWNLpNA=;
        b=dA7Hut+HO7GPXxd/e7nscj0X3TRQfRuDf+7Xej7DI1EvAhhvNhCElEb7PNbgQSZr/r
         O04DGm6of5dWHfFfp7QF9kBgNY5sK4Zt9WE5TNgTXmkqDQAcT64EMRjiBNIIcwpPQhsz
         JggguHBr4CNVZ/ZBM3igYFc//U1C4t4vRxML5+5qDiC/1qnLHOPmN9SSbJjFkr2dVHzV
         4Ioc5IwbLI0INfQvMY9cPe/4NY6pXxgm7i6xxVm9P2ZV60AR7QlNTlxXQA5R7imdnmlQ
         EWfqkMvA4P+eJu+uJ2oXdAJeQCiTymd0Ttpi3uTp34ln08cwuf5KZciz0Q9rYXgPTRMj
         +J7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzfI3VsjClWFL/zW8VgIDDl25belGguoIDUF56FpawoYt8FekLfcNL/Tawc+mSzg8Jp4aMPDjPRmsLjzZ+@vger.kernel.org
X-Gm-Message-State: AOJu0YxCJaoUALLg/tDuXqBh0YoQytJjBOD3GKMkTnqZTVlOA8qHLBv8
	p4IKUqTah6pJhUK/PQoQZNCLxtJi0aSOod6VP+nMtUXMfH6LvYxcySbWeRodPReUulAPorubBye
	uN+KtZKWGUWDAkKKzMJag/mEEGU34rYGxuCwbpSqEx/NBPMoQ3BJlrM1Ngtps26rNMgHw
X-Gm-Gg: ASbGncv2FLeqgNSeVvy4rLwTtNRlEd314nV+5J4B73x+1rPQFwD06vEPE+2x4iq7dQP
	DUfe0rYdnpAM3wFxmyUlSNQZk8ItrI703gaChRpPIVPPZv+IwSXpjpyZSDnoKl2vt8XdyIuI4nC
	XC8SfPZL5lA8u4Nyatva0Bb7V09MCP1PAy8sTE9VXTrTVwaw2j1kWqGK8U9rDqVkuLaFSpus5Pt
	F2LbmgS0hcxLrO4+8U6b4aSnE6jFCq2tWYrK3+Lqeuh2CkUXsgLfJdUfgBdDZNvXn821+SMhZpS
	guvwgPIktZIbDhFJBc3JzARObAKnWH8QoE8m9jc/sORY9nWIQUwWBOOSfbS1YFGlD4oH8fLqBmd
	oU69NtjCepoupR2JkI0EaN3msCURs4TS4FxVAtpoxMjNqclLGnzku
X-Received: by 2002:a05:6214:2623:b0:704:9b5d:ef4b with SMTP id 6a1803df08f44-70700644a0cmr37371866d6.26.1753270008095;
        Wed, 23 Jul 2025 04:26:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC9uMg2OkvtHo4eZpZkc4XSkLC06Egfy/kS8G4tkWNRgwyZcA3jTH31NhXhbsVPCWqL9XHfw==
X-Received: by 2002:a05:6214:2623:b0:704:9b5d:ef4b with SMTP id 6a1803df08f44-70700644a0cmr37371506d6.26.1753270007671;
        Wed, 23 Jul 2025 04:26:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a4be6fc33sm487064e87.209.2025.07.23.04.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 04:26:46 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:26:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
Message-ID: <miiod6ft7iavg64q4f3uwcnztamgvt46gcguean5atsqi5d5us@xrwlzznsgx2z>
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
 <20250716-hamoa_initial-v1-3-f6f5d0f9a163@oss.qualcomm.com>
 <0f9eebfe-21f8-48b8-9b49-a35126aa6dd1@kernel.org>
 <67ca3b6f-3cd3-430e-886a-0443f6d630dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67ca3b6f-3cd3-430e-886a-0443f6d630dc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NyBTYWx0ZWRfX6gqS7j14MpP1
 Z4851iJz3lQdIQEMrjUZBfK9qLOLfg8RTroOLz8CYpTdPQIsjUe+tqEA6wm2Uu/2peJNL3o5p9p
 g1jJUlspW2rVAaWGXe6uERzai8Bzi4RWlIw4tPuJ8AV8caaOPvcjmZwYp4PcXIAFQOGD45x4Dc5
 8v3QnwGhP4kXPPNfQCxJYBgymNb6QtBunqXGZEWTFI4V2maV1zx+4Uv3xeA/s11yjofr1x0O4hj
 Voh8Wbp7WrRRSF12dwTiIzzqMLl1edgh3EU7yV79MKJ+EHlCTviN4PIcEoFkd4rqI/uMUomfG49
 fcQqOGfnvYX+N0w5IYPrGPi43YiGY+mci5ecMJTywwfqANiYuzwIcYbDMtOxhnZN1SD5PXDOJoZ
 n0w9dE/Pt8YFKCOaL79skGzuMFRNO0Hr0Z3zuO+l6/X9EnLszZqPxSCMwbLoBr++4HgWBjOw
X-Proofpoint-ORIG-GUID: V6FgDAV-_T88TN23moPeNeZLz9Aor3fp
X-Proofpoint-GUID: V6FgDAV-_T88TN23moPeNeZLz9Aor3fp
X-Authority-Analysis: v=2.4 cv=OPUn3TaB c=1 sm=1 tr=0 ts=6880c6f9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KIACOVvSgbhCfpt34z0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230097

On Wed, Jul 23, 2025 at 02:44:14PM +0800, Yijie Yang wrote:
> 
> 
> On 2025-07-23 14:28, Krzysztof Kozlowski wrote:
> > On 16/07/2025 11:08, Yijie Yang wrote:
> > > The HAMOA-IOT-SOM is a compact computing module that integrates a System
> > > on Chip (SoC) — specifically the x1e80100 — along with essential
> > > components optimized for IoT applications. It is designed to be mounted on
> > > carrier boards, enabling the development of complete embedded systems.
> > > 
> > > This change enables and overlays the following components:
> > > - Regulators on the SOM
> > > - Reserved memory regions
> > > - PCIe6a and its PHY
> > > - PCIe4 and its PHY
> > > - USB0 through USB6 and their PHYs
> > > - ADSP, CDSP
> > > - WLAN, Bluetooth (M.2 interface)
> > > 
> > > Written with contributions from Yingying Tang (added PCIe4 and its PHY to
> > > enable WLAN).
> > > 
> > > Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> > > ---
> > 
> > As pointed out by "arm64: dts: qcom: hamoa-iot-evk: Enable display
> > support" this is incomplete. Adding new SoM or board is one commit. Not
> > two. Don't split board DTS, which is already prepared/ready, into
> > multiple fake commits. This is not a release early approach. This is
> > opposite!
> 
> The inclusion of display support was not intended in the initial patch, and
> it was not ready at the time this series was submitted. Since the display
> patch set was not submitted by me, its timing could not be controlled. If
> preferred, the display-related changes can be merged into this patch in the
> next revision to maintain consistency.

This is neither merged nor accepted. Please squash display (and any
other possible forthcoming changes) into this patchset before reposting

-- 
With best wishes
Dmitry

