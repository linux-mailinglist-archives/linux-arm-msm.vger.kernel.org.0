Return-Path: <linux-arm-msm+bounces-81888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D239C5DAC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 485B8354991
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B201D90AD;
	Fri, 14 Nov 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dS7q16wn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ADw/SfTa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D427C2FE063
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131173; cv=none; b=bfh1H+7VIYl9jnWiJKXcmDcAiQrujLS6yZRpWWYJCf1Z/F96063wom5QpbnzeC6goJU+mqmc8hvH7/iw5tNY8coRxvFWRKIKFGgevsAmBqyf3lRqgEagjw3vIJDrcp4L7vOvB41ls6mDMjI8FbVhlhDvsadKQw4LYKhVWq1L7+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131173; c=relaxed/simple;
	bh=Wy7/eW15lmCUSUdRjyNKFfs3KNjmc6N2cChd2p139YM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDLg98ufb8ltbFyoopt1YiZm18iVx38wt3GSNywn/NmUaCIcLDg+H/LedhUQYT3XkUXgZUpz9uhQZnttrb6RAIWV7i7qYOTqKPpdFDuKuoL2sQP0zTKyOmTwLkricKxdxvrHUYgR139YdX/eYU88Bnr7RL7ixN4aIBP9XPPg4oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dS7q16wn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ADw/SfTa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEBi34n3370017
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4EsW+1nGdAeSSGtBuZuhNLO3vZUOsv37M1jtdJjYvwk=; b=dS7q16wnLd7iT/V3
	FisIduZEwA3xpsrWi//qFrErgYdFsdjFbfIOY7cT2h01IH3s9XWx3wkJCrDHgbic
	GMOy1KwH2nAfZ+KLvHJ+Zv05qsqIcexx1jIlUqEGLXhVzTfTpYIEh74cOPLNwm6V
	lBwkNj5IHf0pqlCHPqNNUShpR44cG3ynfS9KwmfMLOpoXDx4ePfcNWE6GI2WdMve
	x/R2E8X/KUhUKKew/ILD+K3tk4NBgy2FVIIsUcXb9A/zCCqlTFQ1txSpmJMEh3CJ
	l/easeOiKau6/hmjlfxYz2LZj3FOweDVg3xZUx6kOdzbRzdJq58UiGHiK8/sPlla
	z+KR2Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae3t9rewx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:39:30 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45066f4a4ecso3725641b6e.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763131170; x=1763735970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EsW+1nGdAeSSGtBuZuhNLO3vZUOsv37M1jtdJjYvwk=;
        b=ADw/SfTaisTrHBXGQn+BI7KjNp5tY5IPUOqNm9QgGmNcK00oojbvL/YO1fbsvgwtdB
         y85IK8020izXLNRmHMISuL4CNSnYEw5PlIiT2ZU9+BokbwjGKvwpHyaTem5AKOtJdmkG
         rDH+bv31HUdiUbiVIn/+PEJQZf2R6+9c5yc/nxh8M7BD2GCCIDUFI1bSXyLEOU6/e92M
         BT1mLua6H9K1JYDOdQTEH0g8lW/8V7kY50aanprXvi1u2Z4AIgetdSGhfvnEtj2xuvKX
         EDFcpE4PDQIcHfJr9lBgNl+JWjCY2WrjTdCvq/C5ij4ONKwQCtJZUfwb29TBDk3r8dGD
         Ru0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763131170; x=1763735970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4EsW+1nGdAeSSGtBuZuhNLO3vZUOsv37M1jtdJjYvwk=;
        b=fCvU4+rdidsrVKz60otdisAMc5HnNIGU5YNEp9ouBtuipuGbGbRi+tu+ctmruorzhj
         rbmVeXBhpY7hwfFU2WiOGKp20aum+Y+omQ/iDK3hrio0b/IB/X5aDQHMXOl6Qs+K/06p
         tJp9xruG0K09TpxN4DreSXfic+T9hXIBOz0nh4K1KV6W1SyRouj+xTVLsqbXR+MzxkW8
         /1tmJG8e7Os0ORHrHbdaqDepk/b8GHQoWnctcxPacr/2VQKd6bBEDmg7H7gjdpK6Wpz+
         60KMEGh1bweQG5282UbYp9/IJVSp3p5uVCRC/UtIJZbf48vuE30xt3i+zXiLBVSfYCF9
         Hncw==
X-Gm-Message-State: AOJu0YwbEjm+xix54i96MS/Z0qthov667iol2lAqUxyZumcurK7x2yUI
	ndISZv0uxVGDjbgO4s4OEZiZs5MV4Hi6IYcOvlgGzm+eiF7ckDbS5EFtBM8znkEuh1HeOPBHwYX
	GD1jYuSsWYutCCBEz/jddKAEQbf/jauuLs29iTyyKM18K00ZsjNP7nm6a1suOBqjNjnkL
X-Gm-Gg: ASbGncseNMQjz8mZlQUyBxuMmLjusiHznjsU8voAPo37GAbsqsRdkRV/23tEr4G6Ls7
	0+aQIlm3/2zrBCQbDj4axjr7uebDUaA2947kpu75rrQXdG4arQdDsOWK8+9DczRDcnfzQwlflnF
	fj3vrNwT8Mi3eeUUB80nTqgo+vO96MWfhWecCDh3qNl6dMXIanshpEiXFSeGvPEnqNzX9Iyyp5U
	5/oRX2Ntaofn8aw0P0NrFsy3GmbK5Md5XmmDX1ta0GfsCzL89tIJFKbgt0pGtabhGY+30j1LDPf
	MAmGznOwc9+uNInhPMigkhgJ1Qc+Lx1veqXN9WRHewIBXTimXR3uu32agF/vrpTsK0lBQsuymXa
	/WEXpO8SQWqyj1+QiguNgTXjzcWlDCZsombgbpN3XkPeMhhdRCEfPehl3txZXncrGTR2v2i0/DS
	BSOMvT3JeiFavU
X-Received: by 2002:a05:622a:1455:b0:4eb:7574:65f6 with SMTP id d75a77b69052e-4edf2064024mr47931781cf.7.1763130399342;
        Fri, 14 Nov 2025 06:26:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1KBUfVirzD+NxHR8BcC6E12q6efxuXfJyY9Gp/GWoVvFTtMpU4YGPyfRbSGcbhMc1pkayfg==
X-Received: by 2002:a05:622a:1455:b0:4eb:7574:65f6 with SMTP id d75a77b69052e-4edf2064024mr47929971cf.7.1763130397390;
        Fri, 14 Nov 2025 06:26:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Jun Nie <jun.nie@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 00/10] drm/msm/dpu: Support quad pipe with dual-interface
Date: Fri, 14 Nov 2025 16:26:30 +0200
Message-ID: <176312947285.1737000.3658283659221081352.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IOAPywvG c=1 sm=1 tr=0 ts=69173f22 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=Gj-FGaxKOcyxjj5NLC0A:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExOCBTYWx0ZWRfX4Tt4nnYtMbXV
 D3j4/QHYquhyphJEFWZh5gnSWqf6wfW8zHX7KRsiwkHbK8aOvAwkYcn9uDjJlRPfY55m+u1dO5o
 iZW0xbP/RIC4nXJX1oCdr6AVMJNmGkgAI3TMCP4YomqBoImoJF9FV7hcIAavRGof+KMgaNnGmSA
 NHwsqMnMxXaMuxshrVzjTcbxyrqIE1W1TzhrJX4PapSA2hIuPl3xW2PRR6khlFBzaTWnBrvb/2q
 NzzftYayM8eb8i6q22QHWfBpsuv42t3BZBSmY34E6UhrdIEYBl3TsIpPqYn61gZdi3dWpsavpdl
 9sA1gHg6DAqsoWYwpSKFZia9bTsWO3ZeSiBGF1dJjlp4fM+y5eQZTB7cFVTYxWL0mzgFyVN/LDZ
 /sLtNcPTsDba/Kk7TuOR1uNz+1gA8w==
X-Proofpoint-GUID: loyoIQRwyxMJBLdomjKc6fcdYzDYZERz
X-Proofpoint-ORIG-GUID: loyoIQRwyxMJBLdomjKc6fcdYzDYZERz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140118

On Thu, 18 Sep 2025 21:28:52 +0800, Jun Nie wrote:
> 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> And 4 DSC are preferred for power optimal in this case due to width
> limitation of SSPP and MDP clock rate constrain. This patch set
> extends number of pipes to 4 and revise related mixer blending logic
> to support quad pipe. All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
> 
> [...]

Applied to msm-next, thanks!

[01/10] drm/msm/dpu: fix mixer number counter on allocation
        https://gitlab.freedesktop.org/lumag/msm/-/commit/74c4efe691e7
[02/10] drm/msm/dpu: bind correct pingpong for quad pipe
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e4f87fdd911e
[03/10] drm/msm/dpu: Add pipe as trace argument
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2c94547e0ced
[04/10] drm/msm/dpu: handle pipes as array
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fb4c972b638f
[05/10] drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5d45171e262e
[06/10] drm/msm/dpu: Use dedicated WB number definition
        https://gitlab.freedesktop.org/lumag/msm/-/commit/aed75641425c
[07/10] drm/msm/dpu: blend pipes per mixer pairs config
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c11684cce9e5
[08/10] drm/msm/dpu: support SSPP assignment for quad-pipe case
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cf63d61337c3
[09/10] drm/msm/dpu: support plane splitting in quad-pipe case
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5978864e34b6
[10/10] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cd432dfed2ab

Best regards,
-- 
With best wishes
Dmitry



