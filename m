Return-Path: <linux-arm-msm+bounces-61904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA83DAE21E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 20:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64FC54C06C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 18:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0602EB5A9;
	Fri, 20 Jun 2025 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qk8zULvM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785782EAB68
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443247; cv=none; b=dHWn/Hcmbwl7ayUWTxvnhGGu6dUnyspIBzgbELP8T6sVwE0L0xxeFhPZB40P6bgZRRNzSK4A6nV3rsYKN13MCCxjOfvbogY6DMC10RyMjuMUNVo2j5V4jDSPQ0FqzKrnK19MkJS9SlhADs+5FgEawtJCpuWOs0Z9ig56OpkctEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443247; c=relaxed/simple;
	bh=VBzjB5WjT6RDIp5iUAI5YjGn6ndaHXTTJuvdvNseLKI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ecZN1T40kuOo3ujONhxFza6YvbKRPOM99c4G7JCiSuYblkd/SgNCD9aNVjvCvZS8uMcqIIl188gh8mbrvrSNerNiPOpMqW6PozwdyQTBxmReBqndCD7HqHLrUfaujKencejZoxymouzJ4gNmrGAD2laC/dirk57tcx8pVxYOwjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qk8zULvM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFRV1c024303
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 18:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVc7A8xrMHlaIP4yJolGlsjNwADCMbUKZl/ABsd4jtk=; b=Qk8zULvMyRlrQu9v
	Sx2Or7V8X6C89vR74Y/LH3FGphJ+F/3IE2Mt7D57ZjK7y9CyrMb1Q4TdjjUoeN/O
	Pt6Oyekff1vNYFvcEwwcnSgb/nkWyNkTrZRC8qvuuS9dow6CfWqVyvC6I4B6/L24
	mIRUj6te82cSxJ4w1fd/pbgOZkwMJxYIX57hRiROW+7gU0nijDM+8QuZ/KMHWPRj
	oAVCHfnKmlQSZ+fDFS+g6dr5azg1peKZi63bxGvBeOSVd+4cfz6lPkqojQSLX0gH
	qHlDiSgKS22uWQnfQQWasRg/sw6/b5trBk/gdLRobsRb32azWi2gGGna+5lWrJgD
	jlbv/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47daa4renc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 18:14:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3e90c3a81so180526585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 11:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443244; x=1751048044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVc7A8xrMHlaIP4yJolGlsjNwADCMbUKZl/ABsd4jtk=;
        b=Wqht8IWBLeuknjr9lduMWQv2PhfDlvHNqp1/J5UpYnqjzLTdNAMpO4+yYP6zjBZkfA
         N/zHEDh2g2vhUh/d+YZWyUZL3WNG4uCDXfLv3We8m5klycORii50BNiVQoecNh7syG5u
         19AtiDCJmKXzXHP3t+qwefAOum2U9lx3jPSNPlrl9UrtUcPSUCUBTonbbX4o+Rr08qL5
         Kj3rNHhnFP7gtP1zSuTs3d5sjAfrKkQHYxyXZUU5tL+su4ZI6btZsJ0dbS0xKh6oA7qI
         SIcGWI8uNANBUTeh+eRUD7fu8vfosh+8jumhCtZU1WKYJVojgPA6YlaVhsPsckC0C5/a
         DXOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeNChwvizWVLOfljFxNw1s6VvRpTp66NOKkm+bpv6VU/LcDv8e3Tb/XAk/zpFZ1jWacL5QLq9hyWfBsxQ2@vger.kernel.org
X-Gm-Message-State: AOJu0YzuQtyr6NP5xw1HyzAdEwR65twHr2oZ7z5Uy0auZ55yH2wyxP6B
	cShyZSgqjB33KppcrEQGeqmYZF5hmWPZFF0yCefNidoxseBFYhBaFiPH7hs/LFPHRXC7Ih0SW5R
	fGbKu1fgxl0pPxmdaGg70DaCdAgwE9lRY/fDYo4XtSIbFDt4BVRtF6lQXwenzI6eP86Pn
X-Gm-Gg: ASbGncuzKcwL75geRmWzGOkbyakQCY+4C55VuBS4jT6FB9p5MXWU79LJD3CAJBhHbKK
	jpa0GfX58W93bjkqzO4bO5e9FmSdmADhYxBegQECcC12HzR7fs9gV1n33kZW8369BkeimzWUy4e
	XC7Zug3xD8x0/6FyuPIYz4ZHq8sVxR2sf8quUURxDVPCMpcAlhB7GG1m2iaiFw4pomQUUWI7FZb
	W+yHSAGk2u71oPvdGYbNrZCjl3DXV5vbSGQJgL/4LIZtqYCRi5ycQO+YwO9NSBXbFcAmeGvFlw8
	nfqEhaKEgnQTkndSw1MfcsNGO8HJ+JS4s1ZGzVRSTsiDj8Nu7uypw3ZL9JabHJ7CI9VL8F+Cv3Y
	3kaEs8pq0ngIoElgjDAzyr/+n89l1+u12c+s=
X-Received: by 2002:a05:620a:4707:b0:7d3:e8b4:3386 with SMTP id af79cd13be357-7d3f982d109mr467394485a.0.1750443244516;
        Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYRug5gJS078hOPt3466yq98+p4r3R9GxsncNqHjb/+sLWrB1qjkQE/6D68L+cdn2aDAgI0A==
X-Received: by 2002:a05:620a:4707:b0:7d3:e8b4:3386 with SMTP id af79cd13be357-7d3f982d109mr467390685a.0.1750443244082;
        Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:14:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
Date: Fri, 20 Jun 2025 21:13:53 +0300
Message-Id: <175044313809.2014621.13604308903491514079.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
References: <20250610-topic-dpu_8180_mpl-v1-1-f480cd22f11c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yt5Dl6RuEmgjdtCXW7MWZj1nI1XrEGEj
X-Proofpoint-ORIG-GUID: yt5Dl6RuEmgjdtCXW7MWZj1nI1XrEGEj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX2ah2Dc4kE/z7
 tnfxifhV6BxOPibkm4p46pYgu0gCkqQcuo9ITfb+eOrCS1TdFgIei+ZgvASSIA+sVXzeraVm674
 gGAKyUwrc8V4y6JV2xjM7sMg922tygFgKO9wBmmf60djhIlSHGHSSEuE2fzNMXOviKCMmMRCHKk
 MUBUYucw6XUkL5QiviK1eFv5/T4EkoAi2pZtwd8pSLgtUuZKDYz9/rpdmNIKkY1NJWRTUyIM6nV
 Rc5G67GWYLpdZh5qAIb9NCNuDNFOAROG1Mm1yv3OFCGLUPiqrUiB+ovST38yc3gTFqiDXB9EYcJ
 qBxDIAdLhivBzj5kT3S4nb9RD9yU+utgneKSiVlDJl6jccaBCw7nesllNNJ2ywjZLCWZwbA/QJa
 rwI9O0Rlc6EE9WahVOCCKpUX55eqfhgTKMbYIcNjMzztOBaI8m6xie+UxGC5nsTrmT0725E3
X-Authority-Analysis: v=2.4 cv=KphN2XWN c=1 sm=1 tr=0 ts=6855a4ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=yxMiGmJVoxqqM-PvpN8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=702 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127


On Tue, 10 Jun 2025 14:50:03 +0200, Konrad Dybcio wrote:
> Based on the downstream release, predictably same value as for SM8150.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Fill in min_prefill_lines for SC8180X
      https://gitlab.freedesktop.org/lumag/msm/-/commit/457fad6dee5e

Best regards,
-- 
With best wishes
Dmitry


