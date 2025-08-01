Return-Path: <linux-arm-msm+bounces-67299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F3DB17D8A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6261E622C4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 07:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D36E2192EE;
	Fri,  1 Aug 2025 07:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1uFdYDQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928D520D50C
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 07:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754033334; cv=none; b=lhIeLqzZrjVoNwCVYXsKiXdiuBUHDN6maz0Fy/AXCxXwccHuHanRo//qgK9DGLfPpzzIz1MITOsWLR162hQ5XaNAySRDG/+6iW6mzeKKLkFutUzdEh+Lxvd7U0F4vKNL1ofoaHLu7IPX3apP8JXcd69ug1RKYfkeQksVfa1njgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754033334; c=relaxed/simple;
	bh=uje34Clhxc9ed3OvxabKenVPdmt0CPXcdy8D3hIZoOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGkBHNlpqg3kHBRO0uZbI/toWOvE/P+bAG1XTNnFIt2Urk2oT0RZYeRyvDWjL+IbUsA6iIW3VS7+SziFLQ5ovSTrKRVBjPU+L6MX5yubQhaLE3aG8OyI3kwOnQABb7g58XJOGj23I8HsJ5NhkPjW5uqyUpjZgFSlEYQ55JKKfj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1uFdYDQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5710RFEK005243
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 Aug 2025 07:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SEaURvMuhrpISmuLvcJOsmjb
	sYKo7gxuFeBHJJuHpIs=; b=O1uFdYDQUFjkt3tWSJopVDpW4gHMl3YUg3/ZmnCp
	vyXVwxKHRaaXtxLH6QGyC5SsEg8RstRJXYyDchnCnX2smDhEwBg3RPBb5kjbmODF
	OiCvdSTp261A82wqCsLMdQ3VjSxPY2F405rtwCCnIjInzuTxKKzc5HLFery3SBRf
	01NNE2JjX+ItOyjW8BA3LKPbAC4t1TdLDI9oe2zc9t4Mdnaw0WGFMKWGELFQNmto
	J+xw8Vd6aenmrluBIVwcDNNssypSTSLQdsPnq+5AQLb3CNp0Xez98GyP5sK/VJYg
	7MKH8I4z58tHQEmW5FjSHVbrXWyypimjJQlop4wseOFR3Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86b5v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 07:28:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7073834cda0so24907646d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 00:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754033330; x=1754638130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEaURvMuhrpISmuLvcJOsmjbsYKo7gxuFeBHJJuHpIs=;
        b=AaalDD5Z97GBf19bh/MuZsHI0ABUJAmifJurmNO+hK8ANS6Y2VSAtzMTiK/W8TKuGq
         gABYRvnixI8D3rvaqlF0s5+FZLqRKdyXjCNd/S4C1x1D4unc9cUfQMKSupgd5ggE5LX6
         SpLDh79EX04mKKW99Jm39OmShVodj7NlHVl9fwBJ6+o9dpxIzcAKrVVEEALoDM/xS4A4
         CSDcWU3i2OB7gIX70IXTLV10Uw2rETVUYjY0aLLQcVdnOLsBmHtico9ZkblsDKX4rlXP
         HR9Uy+JQKu85vPRQQix5pXjFrS2fXQDqIcx/E9+H1UANoE1YQfd0GteHkYt9AkuGrC0u
         ftQw==
X-Forwarded-Encrypted: i=1; AJvYcCUfz76wNQGvrzXVlPNO1G21TbFXS1HhyouJhxJWTyXbNUSKG4PfkRA1T8hIBQm+sdSdcn9Fh4EFLS18oMuh@vger.kernel.org
X-Gm-Message-State: AOJu0YyXTpKQhN6ui0H4YQzwqb8Cy8uOKL/5wzdzjOuEWv8an78x46MU
	goTvbqDj2Hcg2wUKg3c9S4w4Li6DTesp/2VaPUAB3YELdmszoFLcH00S8ZE/gZVvGiOPipadWA1
	owhl33MScSyH98geTs2plRWvNkUlVZVXRROuey2GWCMkWd5V5adM/d4SRTJK1KGtERkFJ
X-Gm-Gg: ASbGncup4hecoKITmGs2a6YTtWjiUFcNy1jzJcrq5KFe/0N1tYd8McTPysIOvlhlsAt
	AOrwmv+C4S0sTdMjL95WzaM5z7rT/MTgI/jM1eN0E+GK2yNc4lbly0C6qrMfiZMMRBo7OYsIkyM
	+OYDL3E1ctqlUcmlpYuCl9tfqydSY+XZT0foYIja3qR7hdfZ/zbfFfwUnhu97bGetVSl2IWuIgh
	6QS1QN1Ro1BeadO+N+vhYPJ5St0EklO8sZ08kUsFjpvm9AsNczlloQgwGC2qiiRwfEdmHAUKvqW
	1TxJFhFKLve0UnUq6zHHeHYplhhUWGgdtVnhJyG0L0O+kwN34LkMSVBqPMtf9HGrdsb5Ffr1MzI
	SmA77UeMuBlwTpNCnoKGwbOiBGOR/pbPnWM5okabn8fqfePlFDWLo
X-Received: by 2002:a05:6214:5014:b0:707:5ff2:ae87 with SMTP id 6a1803df08f44-70766fd9ee7mr145991146d6.18.1754033330126;
        Fri, 01 Aug 2025 00:28:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrm4INQ8xRvxOiPxAKfgqSB4rKDWYbtrN2Ds4wiRVfGNrMLXg9m6Lrslh3Tkn/TEPfHOs1iQ==
X-Received: by 2002:a05:6214:5014:b0:707:5ff2:ae87 with SMTP id 6a1803df08f44-70766fd9ee7mr145990906d6.18.1754033329694;
        Fri, 01 Aug 2025 00:28:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898becdsm489500e87.37.2025.08.01.00.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 00:28:48 -0700 (PDT)
Date: Fri, 1 Aug 2025 10:28:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kernel@oss.qualcomm.com,
        Pankaj Patil <quic_pankpati@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: qcom: Document the Glymur
 TCSR Clock Controller
Message-ID: <xkjmukefiaiect3x7b56dsn4zrddl2fvlgqtfa6yelanak4tih@owimyvx5qlf3>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-2-227cfe5c8ef4@oss.qualcomm.com>
 <20250730-mottled-myrtle-bull-3ae03c@kuoka>
 <9cb06263-2a61-4acd-a9cc-157abb832d62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cb06263-2a61-4acd-a9cc-157abb832d62@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA1MCBTYWx0ZWRfX5JzUgbPxj45j
 kp8V5e2g70wMPTsJNinNhzClJOcoKt5p3HttFFBVqT0vKYBSW+vluKRx9hjpkwRjOI+JzwN2WhO
 szK8RyyPghY6BZ8YMno42E5/YxxubVI3VIKHSyjffX95onEs3RqytMVMH4rKaXSHCxNNMeZG0lz
 LvviQd8YcLz3bd+UlsEGGm7fBazf4c+plx5TiVU9H2da7ewTt1FFfqTCYBtK6D4QUqYvjjc4iuE
 dqe3CxmF1/OUIXkje7N2U2Cw+YFyHU1vDYdUMclbEkFsOEpVEFf2oHdg2lE99KxwjPyTLatNaAt
 o2t+7S6tTuDgV+6K7Cr0wyVDxHJDdFb81aOcfCsAGLSixi4RFZs8zVsd71CD9cNK+ghHCR+8qpb
 DyyDGFDEvqD9sgOAahGsYEn74NZ7MiX5tFPSca6g9ZC1PN7+CDjcWkUIIOd0odzSTxRpxZHF
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688c6cb3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=6kVuSvOnKxEqxX6I_6UA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Jz_RJG6v-tRhE0JI2ZL6ivZ9P5SkTwy2
X-Proofpoint-GUID: Jz_RJG6v-tRhE0JI2ZL6ivZ9P5SkTwy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010050

On Fri, Aug 01, 2025 at 09:44:47AM +0530, Taniya Das wrote:
> 
> 
> On 7/30/2025 12:47 PM, Krzysztof Kozlowski wrote:
> > On Tue, Jul 29, 2025 at 11:12:36AM +0530, Taniya Das wrote:
> >> Add bindings documentation for the Glymur TCSR Clock Controller.
> > 
> > Same question as for v1, what is Glymur?
> 
> Glymur is the Qualcomm's next gen compute SoC.

This question means that the 'Glymur' name should be explained in the
commit message / cover letter.

> 
> > 
> > Where is any DTS using this (or explanation of lack of DTS)?
> > 
> 
> Krzysztof, the DTS will be posted separately once the driver and
> bindings are reviewed.

Same here.

> 
> 
> > Best regards,
> > Krzysztof
> > 
> 
> -- 
> Thanks,
> Taniya Das
> 

-- 
With best wishes
Dmitry

