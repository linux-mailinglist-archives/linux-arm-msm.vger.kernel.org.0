Return-Path: <linux-arm-msm+bounces-74664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8317EB9BBA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 21:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCD237AA1A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 19:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01FF26D4C6;
	Wed, 24 Sep 2025 19:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IeD45TIx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F9A502BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742510; cv=none; b=QGcx7BRPBlTF4iY+EIJ8EMjnozSkjLltnlgJiEQJqXDpAC1adhSUllfFL8fuoJHE1EBCiofc1/+Ung0l/k96lyqa9Icmbt/+uHbg9b3MZU7RkBGe255KD3aU7qp7qM1RkTfgepdwUgx5/qJ0fSty/ooCBrT4X8nwIT4H/ZJwbDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742510; c=relaxed/simple;
	bh=JVhXArOWemQPLrAxDExGAeOdw8F8ud5AdjfE9pP8bKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2r/gAoYfsMILQ6jCfmkdasZuUArwVk4fh+s3wU4NQ4B2abWabis9PZ7Er0Fck+8G4YWVo2ehpJqVhZ5Ml3cr+0a0i+y0h518BLElXrAghTa/TxBID/6doxCJ6P6DyDmzcXLJRsQ6Y4RfSIm6JlViVOMW6Pq/hWjNgSdZQeXSWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IeD45TIx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCu49x018033
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TNlc6/vrXO2HQmuvBAOIMDlW
	uUXokEx/akryGttD9H0=; b=IeD45TIxGK67Oq3ViacGVuBJFVBuF42Wn0vhGcj4
	aBCYkK2Fn4ukG2I6lUs7WQEhixz1/n4JRWc63TKbN40BQUbCOMGn2gHWnVCoNkoU
	mvLKIag/mqWRpMS2LSj6n9ZKLJfdvPm6H9SZpi0fjsc9njzDa/06l3MlzDa8lKg4
	FQauxHQCRCNdVtjbWG/h+G/czDv4mtKnVkgRHXq4gsPHoq0ChRwUawh5U+X+cooP
	VyiBKijFkq0IFT0g6oIqehmZ/6fkmTGsV5Ub3mdJUA6IOiSmJbdbxDRYeBM2Q/kt
	wIqYw+MO+smiNOgbgLhfqj42TquAbkPhlY7DSFAloL9xAw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk9ghe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:35:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d6a82099cfso4343771cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 12:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742507; x=1759347307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNlc6/vrXO2HQmuvBAOIMDlWuUXokEx/akryGttD9H0=;
        b=IzOWH1cdbEfZKjm2ZtW5coBFyScbDqu3xvKcMhkE9Fb5ZauJlU86t2SWrxFV+nGa0r
         0qPvNLbQ0NkwrWr7L98D0iTARlNmdlAYdXBBuOl+it4CToVd29821Qnqb7bp5vQxexR9
         k+D7fKSAqpNid3m+YhWx9zXPAPJVY/o11YZ/uHXIruj5jdYNKpLlBRsdrCNwdXmRotCN
         BwKUTxoocgIX9OPJ6wjWnm537q4qWTp7AoQ0cLLLamEgGAm4HxNDAnHFWUTPCRSESk2X
         hwtO5inYB3Cy94phFSeaWHo0PkloBaeIGg8H4NG4WsM9RL01VBVg2+5GSZqQxaIDV7zD
         SEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmEWhL1sw8aaURQ68Mx/8tiqN+HIZX7MEnpt3gG2xxpU8wJwnUkqD8nPUr79FFhg4XXWJW/Q7H1zNlcNgX@vger.kernel.org
X-Gm-Message-State: AOJu0YzItDzVOZ3tKp/teJDG0l0B5/aY4TL1kH3HHitQwySvslbXz9Tb
	kpK0eyEVDpXbRTDIY4W8I9CM/gNiobPKm9n+Lj6Er6d0/i2F4VocEiNZ4k8I0BoUZqfLUhNbqc3
	AZDpze56e9cA0k+ll2BdoGU6RC1iXSfJH08QCQMpKEvyKSbFncYadrKR6e8Re4Imf5slY
X-Gm-Gg: ASbGnctxsrtlh8nan9YvrhEopbDrHPjDxpbmRdfrKgq84KsgASqlbAs+hHRw4v70RFB
	uKju3rl54eJ7hH5yrvYIUWJICHesHMe77JCkW9nB7AU6SKWfeul9/aMD9vP6xrgg6kxaz13UfvD
	8W8D4EPBLc3ANCRp6SExLwAlKJCHe/0J/jTmnE7lhSYy59vQ3fYsXttaVxnYRbXl82RVa3rQd0L
	R3iSDqMgJ9F7+xPrTEwXMDHHeoFy2ePZBgY0+iWWAE5Ha9UxJUSCQtaD7gC4iY54Sukq+CJh+54
	8QEXDKcM2iXpK2e1H1oDVdZ43V9bfsNhSqGUcGcRAxhHbrHjMJl+Puy0mq/7tmxsyYhZKrpKf7M
	IGAzsGUt1qy4YBtFrryyHP66FqUVPnThHxhWqM0tppyURyntnkiZQ
X-Received: by 2002:a05:622a:5c85:b0:4b7:9abe:e1e4 with SMTP id d75a77b69052e-4da4e56e355mr14523431cf.82.1758742507164;
        Wed, 24 Sep 2025 12:35:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvunyYwlMrtpEhJRVotUbghi/QPDvwX9pX5ZtFUlvPG3ImxRAdBB7QbYV0goF20BESh/Jo/A==
X-Received: by 2002:a05:622a:5c85:b0:4b7:9abe:e1e4 with SMTP id d75a77b69052e-4da4e56e355mr14522991cf.82.1758742506719;
        Wed, 24 Sep 2025 12:35:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a8f57156sm45081381fa.37.2025.09.24.12.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:35:05 -0700 (PDT)
Date: Wed, 24 Sep 2025 22:35:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: lemans-evk: Add firmware-name to
 QUPv3 nodes
Message-ID: <uudcntpurhydj454jemum43a5wizrg3efbqb6h4co3cvyqvn4g@qighmntbkr5s>
References: <20250924035409.3976652-1-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924035409.3976652-1-viken.dadhaniya@oss.qualcomm.com>
X-Proofpoint-GUID: jX_HcIYpKoeJPyN6lr-V5PJFdQiyWZVy
X-Proofpoint-ORIG-GUID: jX_HcIYpKoeJPyN6lr-V5PJFdQiyWZVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX0KXS+2BK7ibF
 0wqGW2MXlb1SloWE6sFWfQOsjH55sq8aBn8qhn4PieMREts7HyxPpQXATQR6xu80zvXUtrH/SjG
 i5X+acUuOG0wkzcvuyjqhCzZcQ6L/Q4rhPACFCN/aak5h4EdR9tCd+hfKaFD5OvDc9pZYNyIHG1
 5CKxdD9dsiLk92Ip6YS1nfxj6djiSWDVFL/6T6rTZ4Wg77lG4uQqpDEhN72COF5NWO/FGRyiXe5
 TPfGCLBY0iAwmqX3WvBR+5QITsRa3puAM9lVXdJyu44Uf65V8wfvhmrsb7jws3a9utl/gNcMXu/
 hZx8uqeUiTEHRW1Js5TdN/HCkM20aKo0TKBnTPLiDDW5BfUQfOyO0SWnmjTVsjJR7caubrmAUf8
 PbUl4xkQ
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d447ec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B4HikTB3W-0rk1GVoTwA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_06,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On Wed, Sep 24, 2025 at 09:24:09AM +0530, Viken Dadhaniya wrote:
> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
> ensures secure SE assignment and access control, it limits flexibility for
> developers who need to enable various protocols on different SEs.
> 
> Add the firmware-name property to QUPv3 nodes in the device tree to enable
> firmware loading from the Linux environment. Handle SE assignments and
> access control permissions directly within Linux, removing the dependency
> on TrustZone.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

