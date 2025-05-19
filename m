Return-Path: <linux-arm-msm+bounces-58467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 709D0ABC037
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A5903AD6F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 14:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFC2284B3C;
	Mon, 19 May 2025 14:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tarx5S7D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7063E283CB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663465; cv=none; b=PZbKIv4zwGXThc4BOnZ6REi2hebxP18OEGFwz9WLeMGAjC4Y39jaTruCOHyIsmih7v/SznhIVM5ZtZBOKvqROs26DKEJV3xLdO0ccfWCCyw7DQnL5ua3KmkllV3H3Ebx21FNlNelPze7W1lGKgt0aqvL2s1hap1p2qMVEeia5nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663465; c=relaxed/simple;
	bh=mTV4BK2qfjbUtqotPH31b3r0RSBtimJqNdwrEbp6QFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkMuxDq41iWzFL0BQFPkG3cO1wJIgRlMxkCjiGerQMJIBQ5p/i5BVKosFJ6b4MJLVHDRXU7ndSL0HBVPqmWG/z+sHdgcCk5F7JC250bAGu9yD0wLdzqS12wFOAe+qK/OiKxrFe+yS8l6oV0N/kSEP/wC3OyqjWMIKe6eZ7SCs04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tarx5S7D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9W9x4026158
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 14:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kkHo6XHPeTMOyNCSzAjow0H/
	jYOdseS2973aNB14vqU=; b=Tarx5S7D7AXAHXZFO+mQn2m316NJRSaqZrbLHVKX
	ljvTLTHt9lk4EMcow8w3XdGDgT6UuHhuPvXMSpVb8MAr+X5fCXjXYLK8yfVqZqO0
	doPbVozq+QfJKzzoAl281oXWEzN2b21RHgZosEV5FhkSZOChpn+JuaKxXjDM3g4A
	wdUPAeq8g26lLFrgJLYzimvxUTux2zPzIOb97GcWajTf/G9PVMJ2ltughO7hypZp
	Xk/OkUzoQSRR64kyihud3B5q8PWplVklsW2MsnKXl8yOI+3Wq1vhi+7bTN3Zx4GE
	gdzZqiLYqd89cwsJ0YazyDCLgwkkshuKUZBCbn07iYCSBg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7cj9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 14:04:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7394772635dso3259741b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 07:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663460; x=1748268260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kkHo6XHPeTMOyNCSzAjow0H/jYOdseS2973aNB14vqU=;
        b=V4HfEfuGYE8DheXHS4M/2m3bJRma5zQLidn8fDlLQzxXOcVX35PCFOdIP5IPoYfMRR
         YBuGV4k0Y6RlPQZ5wrKW8V2ywFmbinzvawQUxptjinYNOwR7QkBGdl9v0s/9SOulnDfv
         QCD2b7iILsMycl5ngslegdSZWRUSjbKj/YLy2QiJAdF0cWha8ncyWDkkIvw8mFTS9HWN
         8vrIP1MdCyk31zt+AaDiZk6tvhERyjwCVg4f9KfzXI5QOAWkGehi0zLR+N4CCKWXpzwq
         urmWagacQBibKFqi2FemI35GpPg8h8PWzWx3rvD1dFKSdevat5z7ukQXqBQIJUyAQoNw
         wCXg==
X-Forwarded-Encrypted: i=1; AJvYcCUI/bfqtS4aZQMK3CZUKHcHEM+FzvxOu0OPfrznk/vrwoEWqcyVffxp25S3b0oPgLqW51qtJ+FYgn7IUV30@vger.kernel.org
X-Gm-Message-State: AOJu0YzBIZQRvSphey73JbhbVzQIaugpbIf8OVpvaXTVD2AwfCeR/l8J
	AZcAGjKc21avq1PeK7jsptgfQOqeYLsIpnY5HH8vOOkszV1XLMQygyr3Gq+We2gZ4B4dV1eFPuc
	NU/cYd6KXTMcFSqfoGn0NyoSfzvwWrrfhnSaUQq9HpJ1rXYOYeatoMVFBJa/vbnk2OoKeoBncL0
	qn
X-Gm-Gg: ASbGncuMxZzpytyrAZ0LAkVmjnK/FMH1SVczBsS3zL8hDuDltreu/ksnmOHFqTtRaK/
	krXNDjtv+x6JNb6d+g5/0til4bD4+OU+ekEdJXFnnLfZ2vlcRrHOcQzKDKs5Gs+/Oc0k9rzzgO9
	m8/zAp4emKAnt1WtjWPUcJQ2/nEdB5kUCYSnXDldtnOskkrUG1CT0dPS1+XmYyfGF846TsmSeKG
	id05E3sU8wxyen7T1VWMdcejdZpNZehtjTlRfUwwbmHdOSJBCThNOCE2mAcwtTyAAP7KFPc0UQ6
	AvbHFFF+MW0hSHnZbJU8STKRNKGVIalqYpoMS7qjQnpIVM6UvQ+yzQKNyli2dvA38zn5nh9KTeY
	=
X-Received: by 2002:a05:6a20:6a28:b0:215:f6ab:cf78 with SMTP id adf61e73a8af0-2170cdf123amr19638871637.28.1747663459992;
        Mon, 19 May 2025 07:04:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGunqExUmPIanvU5qmKhM8zQx7HqoTyCSd4dzk6qSGPCbuorQvpI3kFvR+d6JyY1cXPKu80pw==
X-Received: by 2002:a05:6a20:6a28:b0:215:f6ab:cf78 with SMTP id adf61e73a8af0-2170cdf123amr19638813637.28.1747663459443;
        Mon, 19 May 2025 07:04:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701812esm1869721e87.112.2025.05.19.07.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:04:18 -0700 (PDT)
Date: Mon, 19 May 2025 17:04:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: Add support to retrieve TME build
 details
Message-ID: <wcmz26zuregrhq37lu7bpbcteatnyuhio6m6a3h4gfoqlyj4g5@dx3kxnwrm3pt>
References: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b3a65 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=hASR2W6MItGKdFUF1uMA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: pVuvK1eZUGyPjqzEfcaDYmi1OFglk-hG
X-Proofpoint-GUID: pVuvK1eZUGyPjqzEfcaDYmi1OFglk-hG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEzMSBTYWx0ZWRfX1vdTTz/n3VCW
 MlWQiCvGHLcAnsAn68KKJMAkTuQ/bHXMbxKCAgMM7owAkgwJvLYPeupjZraS2vFM7p1iE73CzRm
 9aR40n3cY2nx4cB9rnL39rgVe2a2TS4RaC9ah+KxQl7PP/6zDmq1LMRogsMmAWr2FEq+/uLXkaZ
 fof00oHMPmSJ/WdJF9Bo6lmX3uAj3H6BLqjQGu26bv4N3vhkakLaMgQcvt9wdtBQeB4M4jxSFGU
 C+SvIoCnHCoaWQwqxkCu+JhdtOTF0bxBnEWYPxb01AzhK0wrHRyiny2RHY0t7P+J7L/88SkFjsD
 i0SczPJXIiDUApuX/4uGdA4xDLLH/rAW8HLsOTf7bce4K/jVRJYL1zZjA0d9jQiYGNYOerWdfni
 1sAlww2GFTQn/cIX9+xoAAW0f4mAYNM2eZXXEcj5A6lR7/Nb7P7kSv+LrNubbKJooyc4U7fj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=657 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190131

On Mon, May 19, 2025 at 07:14:01PM +0530, Kathiravan Thirumoorthy wrote:
> Add support to retrieve Trust Management Engine (TME) image details
> from SMEM, which is present in the IPQ5424 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Note: On IPQ SoCs, the Trust Management Engine is referred to as TME-L
> (Lite). Other SoCs from different business units may use variants like
> TME-M. For consistency, the image name is retained as "TME".
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

