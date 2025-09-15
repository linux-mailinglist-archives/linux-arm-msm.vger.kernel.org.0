Return-Path: <linux-arm-msm+bounces-73466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 512D3B56D70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797DC188FB72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432681BD4F7;
	Mon, 15 Sep 2025 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InJyrGx7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB63E288D6
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757896498; cv=none; b=iE3hcFXbRPUjbuPeN8TZMRgg08phAm+XkMo/CuBcArulmR7G8/N9AJa515kIs5IeX7c54pxm20TRIhM8wtnhEJUxLcQdmB8Zd6yhWIZHE0LTRiMkfsXiTpJ4tD5+FOgs3iPzC+OT883rPHRjTX6rPcPcZi/ahGiIi51PNyfd5vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757896498; c=relaxed/simple;
	bh=Ap6BvAu67TPOd/kk2f3cFFCFX5r8s8b09wUwhreYot4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ5sU9HbICFpgfrzbv8XvFeVufLb2SWagPbxBBQ2v+QMB2K+P26G32ul8fon0RIHuJDblU75rwbZ2r0ADxySBfPvBIsZfYs+NhtrvGFZHuID46X8GFohTdvOfKd1KeAECaBUmWDLQlA+IkexGW2npdLMMPg/SArAHp04bR8j2ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InJyrGx7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EItwvX003695
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lGewii8KU16KWNh30RwGnFP7
	62rCSny6t/W4YZ9CFUM=; b=InJyrGx7hsia05YukjgpX0Kjo736Trmhb+FKJ3Jw
	eu7YlLQ7erqwWnii0FRAqhmLRU2XTGI9atIEoqYRaz7LBzwMT8vjEijf/lfL3G8H
	r5HOG+8LeuiygPpnTRE4Ep+7Kq8VUTEX2QI+SVBI5Gh/1mPh/RBSSSvqQ6zhgc6Z
	5QQwxuMPdV7uKQlrkJVxoL+oXi70N7NdSwD3lhtKI9aISHpXmM03kE1d3tb/wkYV
	aDfJq7wg1VSQSYbwEskUJcQTErASM3r1q/0XRJ24TOUXF4lNTjozdLuVMEc7z4Pv
	6ebPMBCdfonWmQrVC2kQzruXgGb6XLrQHPFz2fe7UJOUHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u52xt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:34:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b793b04fe0so29182431cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757896494; x=1758501294;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGewii8KU16KWNh30RwGnFP762rCSny6t/W4YZ9CFUM=;
        b=sc/cOPECgqDg/7WJaBTsjTnEzijuPFLN6C4I8sF+surdXY0DzCC7Iz8R/ghidRXTRn
         CXzTpXWa7o6CY2JOMnY8rPLTNqvkwRnYSjJ07Sq6x/VeA9XI+df8de52kE/Clrl9BjkW
         xUZPPVCs/E2LxFzhjKnTUt5/8Z0FjA0OAR+j/taLFAc2dnRZAVUEoIF//uklFx6Mbcsp
         ylH3mr36Nib2m+h/FRndjLn3MXGrs3b7O6tgqdFkcWnianU7KVmhzR5tWUDhDwmSHtBr
         8Yb4Hk8mD72RVtiY6U71r/hphQ0AjeqYB2c1SiWsMHJ+NeIex4l49IOt08m0HaE8ej3a
         ZUsg==
X-Forwarded-Encrypted: i=1; AJvYcCV3AJ/2dmZjqUI9Z72764uDmrxFjP+mp1vdTw0mP2ieX0xPd61SNgpwglnRfIuL+rwYV8tdadZatHzZB8c2@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHu+1T0zBDU++DdUp1oSIfiufUkFhpdF7m9psAgcSevuQ39PK
	3YCxXKsQAW6sqO1E4N8yAm1vdUD5PLwbHSE/taLcVsv44xJ7Q3PZHTJQ5Fbwk9n8V90GBO+lsUN
	W32dBS5jr75ZrwrycgC7g1eOqsyvY1KwhIz8c09nvJIAVcWQv2zrW/lAq33rAY82v4XzS
X-Gm-Gg: ASbGncsV6jPp/QWP7MADrEW+DiuYq75Nt0xhp3dsVoOF0EIvDhHCXN87yYeb0oNUvnF
	SwQVstpvIxkUKChmeC/a9uKX5ZixeWay9A6MYR5Zb25NdN2c3VPRTwyXWDg44kAVFwXg/eASBLg
	MWmUCxNB+kqDNB8SH0U71eLWgcWkT95N/YXCNlaGEF/B4DGGjRGWTah0R1CJR0W95qC0MAAfoQH
	OmOsjPOWUhtVD64Io8M7ax/UsDJSyb7zjams6N3nejswOlbuFBQynf3huu0njlDQD57mzOTUgNE
	vJfL8JxjlrLeTcxzlxMTOWfpI/2g1A7r24pRi51usveIQwB7jC7kT3L80TWBs8ZyFFS2u2wMnaC
	ZSYkEo0TG49yzQ18E2gMdayc4bGSgexOeDcGFQlV35+dEvv9L+Qez
X-Received: by 2002:a05:622a:424b:b0:4b7:9972:1d80 with SMTP id d75a77b69052e-4b79beb2e36mr41318441cf.59.1757896494616;
        Sun, 14 Sep 2025 17:34:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK17MhvQUFlGwF5rLwpdOVGDSuvWgdkehTixyi7M88M9ljpaUk6U27iQhobiT/FdRmhff5SQ==
X-Received: by 2002:a05:622a:424b:b0:4b7:9972:1d80 with SMTP id d75a77b69052e-4b79beb2e36mr41318201cf.59.1757896494167;
        Sun, 14 Sep 2025 17:34:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1c014ca6sm25669561fa.61.2025.09.14.17.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:34:53 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:34:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sdm845-lg-common: Add
 chassis-type
Message-ID: <ywzzmigvtlimmnhhk7pw4vjzbyqx4v2o33g75nmowg6t67kxgb@ptwjrg5i2zgs>
References: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
 <20250913-judyln-dts-v1-9-23b4b7790dce@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250913-judyln-dts-v1-9-23b4b7790dce@postmarketos.org>
X-Proofpoint-GUID: B7tqL2cwkvTjbIEImKvpviht5vQ9_5d6
X-Proofpoint-ORIG-GUID: B7tqL2cwkvTjbIEImKvpviht5vQ9_5d6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX9zr56RLT++Nw
 ua799Ulf1YFSTp4c7+BG49omxql1xwTJdYBMNq4kurECkgdEFVZge8bZsPT+eSx8yqVO2hFByt7
 vUmhIG0vAVvZyrYIKBnIKdZzO89bCxcVrjoqF33NPqoiSVhe4kKhvJqANklzbxyRo7je9QSBdEy
 IjG1jjqnc8seBttaNycuqbFzjrsRG7BH2AShzApZZiISBr0fVoOQ7ABCOqnKFZp0RMBWWmsTG6s
 lz93+3w7oOL2SLd1I3RMzbkkRR3g6/R2JT2BqckD8cAnEggHbbX4rQ2QFM3L8s2KDhmVbyrqu58
 lxDw9tQ/reUUnVemlHvv0fAKyrk/xSfQco/GdjvhdOwJbKY0oNvMydYKj4iyWDmet8n26Y9db8m
 meiODrRJ
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c75f2f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=xpcYJZ5K4HInNErYrfIA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031

On Sat, Sep 13, 2025 at 04:56:42PM -0700, Paul Sajna wrote:
> The sdm845-lg devices are all phones, therefore handset chassis
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

