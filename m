Return-Path: <linux-arm-msm+bounces-60205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F15FACDADF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 11:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23C743A1AD4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 09:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147B728C5CE;
	Wed,  4 Jun 2025 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS3dH206"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7151C287506
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028899; cv=none; b=LEx951XctLkMDSMWbpBkJFRLda5kPaMr5E7P+4P87PlQ9wnbnPAer+UdsADi5OzxEIaGYqD2SZeuwNJOYPmywEQr1RZLBFb2wuruTtVQlrWPI5ifKRkjoCrcxFBuw/QCj8hVtgtTPZtdERYxC8umhjcCl29fBTbcYiVfb5y4Zqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028899; c=relaxed/simple;
	bh=iMlClG97yiqR3GPY8UpwCOs8GVYHJRmskTZc6hJT0No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD8EmM1m8+lo59n7eXE2q9uOkWCg9rIdZBm4XDhavhsfcb0g1bx/a1rPyJsYojQ99dnJzP9RbqU0/Sdn6UzWGyYn/w9p3Z0ULmlQKUJyuLSAcSSVUdNTJhB/+u95MXnaFjEjFq7JFd87qf9oHrLeliv+y4RfSWZJe7BFJlt6Tos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS3dH206; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547xMe4028362
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Jun 2025 09:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R+aLR+kiZ1KGuKrMttuGRYAV
	lykWWo5RCnMa4dfVWY0=; b=TS3dH206MqEG9+qEEwvj+nlq2yphj1svKGBNCcNU
	V5QqVwdA7Bs0eMwXb67r5swmHRRLbHFbZwdNmWxnHq7jvRLIPUv0173H4tikgNil
	cQZsq0sDS+yfCvmJU5j+B73XQiGlo7//F9VFBq3KOAxqUoUDcg2C+2wvNHgtWuC9
	/89vOfS/mJSRkzt3csbEwVussOwuUVPeIU36NL8vPs8PZWUCJOp9p697q7Ljkn8/
	jgt1GwqumbEsFJFqAMFwi0Humk9CKuifAJqHFOXcsWMUjzDLoATSTQVjmvQDWZCO
	JlHMRUjlepSX81A14oHXMAo83SyoZ/aF6eQ8SnbjIc3NoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8twjm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 09:21:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so128035385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 02:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028895; x=1749633695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+aLR+kiZ1KGuKrMttuGRYAVlykWWo5RCnMa4dfVWY0=;
        b=eE+IwHfob/ZG1exVGGOKf23HTmOuIttrLiCd6hoszOYPSDnrlUiIu5LtkXHLw1iQCH
         hLUT3PzP0CpjRogYHVy0C6oS/vPZZDj5enLloYTa5z7fFwqAXWE5/sqYOPZvygsEy1MR
         4r+ZiBfCRdyFBbgqCIA7u67TfB4wSlWqHBo2SVKUwkAQCbRsSaPH+OP/Nu+EFGTnrGwH
         jRctDl7DFifVz4aD8UmwmzwWged8L1DnxiRueyUrI6ubUzDNxFdvJHPdLpJIbYJ9FgeE
         yv20j0EV8RW0kppZ7oPKs8+AzLUMxgA3T4UeklhrMGXSAlzowQh5Z6dosu/1qiSj/ueB
         lRWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFtzett2oowkCLSFa8AD4FL4zMEdDM+RRW0nPMFp20fkkI0DF2IwucZb+eqzjx1IDnQ7U3wW8lRv9/+kr2@vger.kernel.org
X-Gm-Message-State: AOJu0YxLHFFWFbmAuDx1ZmNslL3Z700HnScclEe9qSN1TT/FNkyuiRFt
	ah8S/WAze0UW8LQDGg2clLAaUvzaEahxGr78WWJmxgDr1YfAAWC3rgzkJ6g6HEuo3wb6IJFIrOx
	eLB1y0qsk1KCJY+ErHta3ynTyBMoVYK/o7YvaaHtpV0MtJmfER3UZJmk+/Vl0e1oXxpyU
X-Gm-Gg: ASbGncvAcRpQCqVsz7M/Ns0rxjaZOjzKX0e7r3mGXXBSjH4Rh2WUVXR+Vy+9h0UFmgw
	jxgp0q93jPa8QwAjKOA7zX/E2oX7EBUXkXle+DYkRyBHqqP8ce2Wmgar35FPn9y5XXC899BH67s
	1JZ2Vao/20zeYac24GSxKltbreyK9OWzJN3RJeY3NfrFIVF9rXooFwK+BUNeBebcVOfrlf/O/65
	DaGtr8zLTpuFT1/92JLeja4ZJtysILC6Ylrzug7oSNGXLYgZzsCWYyXXnJnZ+GzgUPdMFI2cg6U
	dEBDwvLQFX4KzCbk6Pv0G10TG+yBJ37c8KvPCsECJyETUNMtseqdlrV/iXoa3Kw+qzc9t6/RdFA
	=
X-Received: by 2002:a05:620a:4496:b0:7ce:ed0e:423c with SMTP id af79cd13be357-7d21155b3damr900236885a.9.1749028895489;
        Wed, 04 Jun 2025 02:21:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMv6RZWeZ/LQ6eNRt+X3KctomnYvePpW2ORiBuP4HN5BXynMs9rse1yUNywIc6fLSS3qR1Sg==
X-Received: by 2002:a05:620a:4496:b0:7ce:ed0e:423c with SMTP id af79cd13be357-7d21155b3damr900233085a.9.1749028895133;
        Wed, 04 Jun 2025 02:21:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b1b549sm21837981fa.10.2025.06.04.02.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:21:34 -0700 (PDT)
Date: Wed, 4 Jun 2025 12:21:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
Subject: Re: [PATCH v4 1/2] phy: qcom: qmp-pcie: Update PHY settings for
 QCS8300 & SA8775P
Message-ID: <p3qlrehr73i6aj43jwnavhlmm6brnkjkyos3h44bg7p6ozmgd3@ejqlcy2rpwcs>
References: <20250604-update_phy-v4-0-d04b12bb89f2@quicinc.com>
 <20250604-update_phy-v4-1-d04b12bb89f2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-update_phy-v4-1-d04b12bb89f2@quicinc.com>
X-Proofpoint-GUID: NoxFO2P8qfLwOLRdwU9uNhgGyHEyyXnw
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=68401020 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=FU6otyn0G4FSvijP6mMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2OCBTYWx0ZWRfXzm00cAviDw0O
 VAWZNB1gwTHDlJpotEMHBEdz48YtTyK6Q2Vak/pLdVbVscsuJ7admJJaB3ZWM68U2gi70lzeg7p
 VENcznhGfA4u9ealwi38Ttd5AOFuKuTMWrcYOBmQN1xtpzqlgP6tI+hTgE9KCbrSIAOXIDIgjU9
 pOiLASRVEoPp5d0LVRx/LeXDhXKGFNg2s1BT92E2O5I5LyZnJA+jYm9HNOniA6Xlu+TND7lSAH/
 +SuelLA9P2v4dLeqyCkkbt7tTy3h9bgaFmtTtHKyl4rYUqCAHkNjI+/3Jw8DSgXTIatSxaIpCzJ
 pFQyaGJhpokertAXgELr6Z1O7Z4uNm1GzmY4EYyzOek8FGpCK+M8bVLe7fxUlBqED3p2YNcGqfa
 ESih0dsi+mWnpiiTfY5CfGrVkD8ClBnXqkhpcxAkvOzglseR5xy10CdMnRoRqhCuwJTF8qPh
X-Proofpoint-ORIG-GUID: NoxFO2P8qfLwOLRdwU9uNhgGyHEyyXnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=974
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040068

On Wed, Jun 04, 2025 at 12:05:57PM +0530, Mrinmay Sarkar wrote:
> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> 
> Make changes to update the PHY settings to align with the latest

Don't 'Make changes'. Just 'Update'.

> PCIe PHY Hardware Programming Guide for both PCIe controllers
> on the SA8775P platform.
> 
> Add the ln_shrd region for SA8775P, incorporating new register
> writes as specified in the updated Hardware Programming Guide.
> 
> Update pcs table for QCS8300, since both QCS8300 and SA8775P are
> closely related and share same pcs settings.
> 
> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
>  5 files changed, 66 insertions(+), 41 deletions(-)
> 

The patch LGTM. With the commit message updated:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

