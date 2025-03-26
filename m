Return-Path: <linux-arm-msm+bounces-52549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5242DA71D72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A4C616B398
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 17:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91CB23E32A;
	Wed, 26 Mar 2025 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UARbOku2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E3A219A90
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010900; cv=none; b=MGULzI5TyfllYmCCa5cic4iPOhTkRqjzbTL9oD9IXFf7ZMtJqtdLWmPD4Hm8LVS2u7ojcS4j0Qhou78JK9iUcC6FfpNMEJBrha8ssbVJBi+WPAULR2xT6mSUtCsyh44jCc88d7cY2foz2aPEeFu4g/zGZj1j/3SJYz7zKDvhQ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010900; c=relaxed/simple;
	bh=dPZgitgsGwSsjuUHxo7G7lYI6fjnEbCeZqlMQtm+0Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qeky8Mq9HRgHA47w3YvKtOO+hNksT93eevC1CTdXLrHVYwWZEU8HBA3MJ7BKV5L9DWCr6WwJ0ZImC8BqKMz172WgwdGg30NcCZn6gOSbxPLsgwJkT6YhpYjrMPqTs0Z98KPnrzeCoS2wcBNU/T295u3DGShO+OU+qhnLxN5xFqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UARbOku2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QA1mNF025407
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0e0BEB4eko8NvNN495XsFKzx
	AAwQjYeFziRudbDnS3g=; b=UARbOku2Gc5sIx+hapZo/JURDT+HpDOE1F0w+3ug
	sobUY5/w6QT7dQ8A3mrAUyd90pF6tMIaZSQ2BxpB0257f82g4YVBbF5GUDP4nLSx
	uedLj0jOFXOPnsB5607PhZF0e4+xVcQgVwiLCZspdjP5Tk/P91mdNT74wT346cHn
	QtUWef1Kq1ft2sqp6w22MzBRqfRv8C+wKSyMFAwvsP9NdwXsmiwHrmewc+omgb3u
	fVrUR1Mb9mbDq0AvxC3NnGFIOUAgBSOJqaQfpOxRuR3mvpg0gWj8BJNtaxpsSQhn
	tKAcCgoun8tDn5VuncXQWcMJVy47SamyzHnhZ9S0aBmh9g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcha20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 17:41:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47699e92ab0so1796611cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 10:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743010897; x=1743615697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0e0BEB4eko8NvNN495XsFKzxAAwQjYeFziRudbDnS3g=;
        b=X2Oqs3fLnq086zrlyvpG/fDTwG6G3u1Mp7EMoHQa205dqquIGCYsM3lBC9vMIWCP1u
         Yv8X2BvrINSalauJI8XBaq7z6zxIOi2hws8NY7M436KBE//TrXsQE7OvecpPu/LkMO9h
         yPVyJNqbX8laKqJyq0149EOpNaqCqzmWuoLg+FmkYg8UVgZZMQoRcoSmcNJ5yUDwwIsO
         mmlP986g+p7PYWfriCweYz+F0acGi+vXli0JsVkA6mpCsVDvV5habvI4dZIDHYQrX5Gv
         6Dz/OwDJux8obkJjfBO/ewJQ/QlnOWJdnF3M+renFItfi6bAvYLlqPYeHIhrDcuPwLqc
         tDfA==
X-Forwarded-Encrypted: i=1; AJvYcCWok9rHpvV1xteu2ivyKvYr0XLeUDycpYSJExd8Ai4PKlKK82dn4M+HanJp7gFufcgiGW3RqLsh/IptWvuj@vger.kernel.org
X-Gm-Message-State: AOJu0YzAtLkbji/Xe7SpSIW2Igjb/Uzo2oSFxk6CYF+fe3aIohYzdps4
	Or2Io4zmyMwhZPmtCzSK8d0VwAq9gd/uyq9zSPxB5z84OGWH7LgX95DOxbNUHHmGDSOvjWx6pg/
	HGYrC9uKRO2U14+R9dlwE99iQA3bGmzMI0U7G+GRsgqUOf8MR4jPBaX1aIuuAEETC
X-Gm-Gg: ASbGncs3ZpxHvwd6rAL1DaUR3zvtVbv8auTggzLqH0F/qtkazOvlCzvYECWhkFENl5i
	jBnCKtesasAZak6OY4/vnJipKrvToj6qhWgn9MF+8KXtkKhRx0/dc7sUgW0drz+7XUHKAyc7isK
	kgROqM79Ts56t5JP5+jzba+ZioQG+YG1VbBEq1frAMsdp7r8fsXqL9urZ5mc2FPQshaKXIeHX3I
	8GTytr6XneKbNDOSnSPNLN7Auub/Qz2d2/7ZvuKAWYK8ipjneHR7kMh8PXma3GkIMyqSeyznEQy
	TVNQgQOTL3teb4G4h9RtHyd4fCGN7dDpbme0jQ7xyu3R4RELgWFJmmN9BVhTDuosvqetdr02gEJ
	7dj0=
X-Received: by 2002:a05:622a:1e89:b0:476:a03b:96e1 with SMTP id d75a77b69052e-4776e21bfdemr8187651cf.52.1743010896855;
        Wed, 26 Mar 2025 10:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElZlPHzzeXuOhqUTtRJ08UHmrzkaRjY0W7vKQkAdgIF7PW8h3Tr/mClGH5KbRXI9kzx8/sVQ==
X-Received: by 2002:a05:622a:1e89:b0:476:a03b:96e1 with SMTP id d75a77b69052e-4776e21bfdemr8187181cf.52.1743010896364;
        Wed, 26 Mar 2025 10:41:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad646872fsm1847854e87.9.2025.03.26.10.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:41:34 -0700 (PDT)
Date: Wed, 26 Mar 2025 19:41:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 4/7] interconnect: qcom: icc-rpmh: Add dynamic icc
 node id support
Message-ID: <qmzskuz7h5pqmhemk6kdky7rpoocppemq4stuhl36nqlvqt5pn@uvrxxoakynhu>
References: <20250324183203.30127-1-quic_rlaggysh@quicinc.com>
 <20250324183203.30127-5-quic_rlaggysh@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324183203.30127-5-quic_rlaggysh@quicinc.com>
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e43c51 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7MvtbgVdnMJevg9Cfp0A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: JoDfA79NyYvu75ex9rxUBJROEqEsl6NP
X-Proofpoint-ORIG-GUID: JoDfA79NyYvu75ex9rxUBJROEqEsl6NP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_08,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=736 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260108

On Mon, Mar 24, 2025 at 06:32:00PM +0000, Raviteja Laggyshetty wrote:
> Interconnect framework relies on static IDs for creating,
> linking and maintaning the topology. This dependency on static
> IDs prevents creating two instances of same provider. To overcome
> the dependency on static IDs, dynamic ID support is being added.
> To facilitate dynamic node ID support, the driver now uses
> node pointers for links instead of static node IDs and icc_node
> pointer is added as member in qcom_icc_node structure to track
> the node creation.
> 
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> ---
>  drivers/interconnect/qcom/icc-rpmh.c | 17 ++++++++++++++---
>  drivers/interconnect/qcom/icc-rpmh.h |  5 +++++
>  2 files changed, 19 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

