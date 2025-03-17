Return-Path: <linux-arm-msm+bounces-51611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D227DA64CDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 12:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C58FF1891F2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 11:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BF32356C1;
	Mon, 17 Mar 2025 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z92P8Xu/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A60199E8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211355; cv=none; b=A0JfqwCHIzmZFe6SYmjeb7RiKpETRx1t2P+gnPJhEqWPUPLjE+1kTueq3SNLSAkqbMc+LqmFxgSktYBZPxWKF2tXOg4Lbl+i7lQ5jz/TRHYMWt63VIfQrnzBHNpl7V8llI4XUaq9ZHYvP+uuaVStfllCKC1y524qxbzriw5UpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211355; c=relaxed/simple;
	bh=RM2aWheGFTEiP5CencPK+KRuBgC9sTlR8heuyxHCrx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlfADm19DSuTqi/tj+tcPTt3tF214HENUPT/+Fe3YKzuEXwo3ifw7bDMrke6N8DpCF6gEkkIomRB7jdKcMKb9lMs/DGm+QL61Tw+ipv3F5YVKjCLuLIcmaIp3ExIiFP6Yt7KTEB5Bn8H0W4axj01Nks+K9KMulUQT6IyhWFmerc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z92P8Xu/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA4hDt001103
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZKjBKi4N44vAWb7GaOsiz8am
	NoXoDaSs3Gdz1ZC6mk0=; b=Z92P8Xu/uUWgz1M8Mm+EKfY25Dk8/dqDgJdYUIU/
	a78MfeEK2LcdozmC8YJX3KAlAzl6P5KK8R3umbTkfT8tUHIpm7P7NRPtgvUMOLSx
	C36dnBRX9ZjVrHr39gCCHc6N4Nh4Hnx+2lbZati741Bp+L5zWbpcifERb/YGpP4M
	ym04+KlV2FmNdjsFrERZL3cGMtUWhpkDUFJWj0Za9N6G6Cy9RnJFn30DFT68zqd6
	a3C86V/CJ/6Ci5CwaISDiq4CVOc8jPB01spRvs1g9qfoFlNSQrsV6wpzRCrZG1Bs
	JG/icjxdr6zmWo1LB0Hh274MQ+NB/Bw8bKR7bEUGLoquVw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1t4mhyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 11:35:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8ec18a29aso55438906d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 04:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211352; x=1742816152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKjBKi4N44vAWb7GaOsiz8amNoXoDaSs3Gdz1ZC6mk0=;
        b=qUww0vOkieP1KraCGROteh6l9qj2oig6Q+QheRWjJf6cPeNAyXZxzZVx3RANM+9wJT
         2hMJUduvwKKceoF9YXWjSNlfm6bESaBNIzkIbIIh/o3c/B2wsm0vN12XsL7VPPHANY3g
         +PkP+xccnBUHsNGPNpQq4jJEIEjLx4ALFBk1SzwWM/6gR/w5MLVoqSBRVr+rUv65aza5
         TsxRBvCeSzLwSEFusDUStVnZ2f6kdlvvPr4l7xHqRpyZsNOvPqfyrYZaEOZESkh5SBSV
         zQfdYuEElknfoI6ynUAxHGTOQJxKFFDNA1OFVejVIelisNCDXyapUo1VleFBbhmz38dF
         z8AA==
X-Forwarded-Encrypted: i=1; AJvYcCU5p3ZwSu2QbuYoGr0e9O8A7Qnc4Yd4Un0Or74bPTifdJInBU9RWXPKoULlHnoguS6XPaDAyhG2fzIVLDpN@vger.kernel.org
X-Gm-Message-State: AOJu0YxuQ9SqexuGsmohx8gi5/r6F3iCU/2pS7uFWQDgJEjznZDz8yT2
	wy4T3YnBE3F6iwr2f4bm1UwjZGSrYxN3OxqZOpLUBlV5EBQHK5JePNfmIOqQck0b8IhaN5Q9QRr
	p38CQ4ICshNb+6pJbZisEA+TaDriCmIbA8cV+ZVYsrhmPow3FEi8D5QuiLgZ6i5SR
X-Gm-Gg: ASbGncvbSCL+a3fw6PxiHn1RJhOhaCOAgdeQjKThXmnAytggPYTCyw49+KBNX9QTb/Y
	57Dfal+HOPO12bkB1gYKGi/2C3AKHpLVvPqBZYU5G2vdgBm0BNgqH3UosnTgieRmvthVYGTJKoU
	Hri8dAXAJyFlsLosY9wod/plFGD/M7Y6iwTKUmX6rAmBcy/3lAihzk74MheXSYHq+977vLlyf53
	Egct+9VGj+4dR6EoW2xMjJpK0vY4qSCqJ6MFiPOzZoAz5jwiYVviLuBsf+dqeo0Am1drOFyGCfk
	xqrMdk2LaV9wPq+5sr2rOT6z+orjCJAlGYvZTeTvoQygaz8B86B9pKYEY0OMegOK5nl9J+2pdGn
	kagI=
X-Received: by 2002:a05:6214:ca3:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6eaeaaaa3d0mr166856776d6.34.1742211351674;
        Mon, 17 Mar 2025 04:35:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi7u1+6oOF6kRLSdXuOdhvUJZuTnvRZ0dzc49rlKpl+4woAu16VtEh7LEFMuGygqkOmGokNA==
X-Received: by 2002:a05:6214:ca3:b0:6ea:d604:9e49 with SMTP id 6a1803df08f44-6eaeaaaa3d0mr166856416d6.34.1742211351325;
        Mon, 17 Mar 2025 04:35:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a85c7sm1324137e87.6.2025.03.17.04.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:35:49 -0700 (PDT)
Date: Mon, 17 Mar 2025 13:35:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks
 list
Message-ID: <wfk3eskuh5is7vo25iovr3fi3s7txw7td26gjgddvcyvrvc3gc@jkxrqgeun27f>
References: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
 <174218015889.1913428.6253597207467825890.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174218015889.1913428.6253597207467825890.b4-ty@kernel.org>
X-Authority-Analysis: v=2.4 cv=VLPdn8PX c=1 sm=1 tr=0 ts=67d80918 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=OCxXj6oIJvzydDHKYDcA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 9M4cpOBwmBiHBVPTjg9O5zJSPKvabfm9
X-Proofpoint-GUID: 9M4cpOBwmBiHBVPTjg9O5zJSPKvabfm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_04,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=794 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170085

On Sun, Mar 16, 2025 at 09:55:57PM -0500, Bjorn Andersson wrote:
> 
> On Thu, 06 Feb 2025 15:43:21 +0530, Taniya Das wrote:
> > Certain clocks are not accessible on QCM6490-IDP board,
> > thus mark them as protected.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/1] arm64: dts: qcom: qcm6490-idp: Update protected clocks list
>       commit: d40da533a701ef9e22f89e5ceee1ab48150daa30

I thought that you wrote that the list of clocks is incorrect...

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

-- 
With best wishes
Dmitry

