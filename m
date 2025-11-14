Return-Path: <linux-arm-msm+bounces-81885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9CC5DA1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 932D03630AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06F3329361;
	Fri, 14 Nov 2025 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqL1QxTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MgZbSok4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442BB32863D
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130409; cv=none; b=LKbeCfDfDkwoh116EcEcIerIOl/0puCWkY0xvcnJuHeEw/YJDhEOCbGACNCNB35H/Brg88kPYY7ZwzsyOE9tSwvRMlCmdubr65fVbo2oepK9W8L0UBXjbG83eZUeDN/ktbw4KngzLpr2svbR/IGtdo7Um2Ma09E3nYtIbpeLWKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130409; c=relaxed/simple;
	bh=4eKzME9PSmfG+xV6VrDrJr6jBckK4YxG4A88q7xkXyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kb0efq5AYYNrBh/mLkHGX6WQy0vqoyy+F7RjJNeCtLZWZFQrd9/x157wOifIrCUA4k8TJisTaM7voNYGU1nstwgfIvTMhZoFk0ZR636qwXy9U/fAqeDoAJXV+SVNglbqJFGuHZ/qpmJD5zfKGctt6c4+J2DxTm8dAwT2e/01bOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqL1QxTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MgZbSok4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEDtrLj4123111
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUtZTR/LX8xkNad3zOXNntb+ZjNzmULI6QNHH4u1910=; b=OqL1QxTFd7Rl8e/v
	ayPe7X835uwAcXp2YY1fUtP6/80nOY/RlY5caWAgKFOAjhtAMtT3UWJaPiNmiDE3
	ND8AdAvjes3opZknWLkwM/U1BmZ1lMOfp57q7osKudbRYg4vgF9FjzS1jM/tWiK+
	wYqC3vMZcTzfT819kODmY2WjR4tSz87R5KIiFZm5xHTFifkGAmdbn5OSjm3NyUJ8
	ejz4AcbdQlcEVxlre/zDX3u/3OFjnrMO9OuLzhnUTCJpdCa83nSxs1XlZVx8qUB3
	yCugXlzowM6Uvvu0tKYAxgDVL/MwX7+R2jJ3fuD7XLrQ3sZQApmsxdi76hXQ+JKp
	AamNvA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae5r7r2x3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8916e8d4aso81432681cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763130406; x=1763735206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUtZTR/LX8xkNad3zOXNntb+ZjNzmULI6QNHH4u1910=;
        b=MgZbSok4MONx2QwbWO+RLp8VFJoSS6j2fNx1bQqMT4DgSgHAqylFcbw4hFbEJLLJVz
         XLSMwiWi7b0m4eogyxysHK4HatkwiEOMTO9gro2bu004I8bhUrMWcwYfeTw1LyWzfYyl
         Rr6Pf2hV2okePbUKmtXTXK9s+v038SZ/gjdOGCFjxDQ2eTcW0gvLVvCSirVMGiGgfRHu
         J4kqDg1IiwIaKvKeYGpX/7ICxpBrqiTtV9YShyYUqHtvsKfYE6LKGqtyPRVJoFfq/f/K
         aXcHpOi8CZ5X5JmIoxTLT05xC2DvdCQ4DFqlcRGnNwMWM0D0Bs8hWzVpDndayJhmqR9K
         X90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130406; x=1763735206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUtZTR/LX8xkNad3zOXNntb+ZjNzmULI6QNHH4u1910=;
        b=FjzC1oTwxtEKyfE8rq15ORdsWFoJFFehxnWsCl5SiqlNj3kNjumOcBw7MUECEJkXqm
         ZHI/tvwb5K8kCJkeTIkpWSFk0z0+U8gb42iPNqxdHhAGifENw2nNORbcY8bYc4Xqajtl
         VHgyR8+DEWel5DgY4Yk5U7Lr4FIcd3gQQqA7fCWWdghloVQyBRE6/ydIomXjBgY11lIq
         4f/Ab9FhVX8dI6lWnEQ+pptVW+7OJ2dHqLLtjHThfTR+6RJVvJj5vegcC5vCVFDZZH40
         dFj2fJaa3P/a8xyBxix2gwxczVXM8lkgAMmo2QVdQjySimId7A4tKAM7n1NQsdAlhm+1
         3hUA==
X-Gm-Message-State: AOJu0YwlqY+E/wNa+zt20/HnYt4guamgs/SUFnXvbbYxj074YBBrGiS+
	OJl2Z6xef7kLrLpO4ssjgQ1eV8YRnajk9bkE8t5OJo1K7Zqr7C9R5RkR7Das52YJubo2+3GdGEm
	7mXxW03ZkGuN3DMCNXS/ZicERPl7unPaJuV6KKV2V+xpGCLftkPJA8gR9ZjX0leEqqnRD
X-Gm-Gg: ASbGncsf8uXA2unoAETTfVzN+f/t2dNF/cSwIQEOWpHyzzFXEtatY6Zz8QeNyjk/hm7
	5w3uk055eRoaO0RCc3llXfw4mME2k0ZtvjOETBJn/NXLE6ztpMJjjNrgw3moGu682k1tGJXztd7
	F2NdqzMMlKlCt5z5nXUMh81i21t4sf/PSY5BCBWbygNNZzWN1Db090Nb4uKdhfVrmEMTGXN+xOZ
	+FLXWvXxF4xfPUUWP4zgEp+UkhMkjdIdGaDRKe3OJAFJXmJ7SGE9Hatla6w0AyJ6GmBRYL5TUw+
	2Kt9+KNJLwkKFusG/k/U+0ZxrXtFK/21rX4vHo4J0PKHzfr6OlydC2NJj2551I1VHx4x068S7u6
	/pkJudQ6YMYom8CdrAkzrWt4JEDJolw89D5tqiX7cGbSf/Ys0h0w94TxPUdYIajQTLofe/tZlbc
	F+lqCc1Nq3saIh
X-Received: by 2002:a05:622a:58c:b0:4e8:a332:ba93 with SMTP id d75a77b69052e-4edf2142ac7mr47937121cf.76.1763130406242;
        Fri, 14 Nov 2025 06:26:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7ZNsO/1TvO1h0/niYYuelt3zWYP6cQK//e3LNf7oVm47FCgH3fT1GElj2eHRDmKTUxYXD0w==
X-Received: by 2002:a05:622a:58c:b0:4e8:a332:ba93 with SMTP id d75a77b69052e-4edf2142ac7mr47936021cf.76.1763130404998;
        Fri, 14 Nov 2025 06:26:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v7 00/14] Add DisplayPort support for QCS615 platform
Date: Fri, 14 Nov 2025 16:26:35 +0200
Message-ID: <176312947282.1737000.4785941412056554129.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX6PBhBx20uwCn
 kc8aoix13hHKAr1vwpeVP0IVsO9nyOzYxtY2G7rCnCK+567qQ2yYhuid8UuMFCdmYiCZB1stkh8
 mkQ31G9P3s80FlYJdX9FRSd+1ju9CGZszRS42Vhth1E3wPYBDSRNPL/9LpGvUbn8hGd0Xp2z4wi
 TNfAS/yq+1RXaQ1P8kiSH0JGZIfw7oCStgxM3f/kKMoquKqRkVmNgXUsX1Yuws1m4N3zic6v8Q5
 SwFgV0t0UNb6Kos2Gw0ZGqrrIMmjR04/HgNEowBBTnZGAgmSeaDiJIhiggovwgcdf3WvnzjMV8n
 MN8qhPPAQJjLEUhXtdddDqYo33vUDeyI3XVo7bpPCiwBefXJlJIlbxvZnm1DrAXatjg76XBdU2Z
 OkJKRBe0yo9DSXNdQzJV39P+0IB01w==
X-Proofpoint-ORIG-GUID: bCYKxBcHm00EsNcw0xFciWSIzJgSLH0p
X-Authority-Analysis: v=2.4 cv=BJO+bVQG c=1 sm=1 tr=0 ts=69173c27 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=BS4b-AKSgWLh6_M-HIAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: bCYKxBcHm00EsNcw0xFciWSIzJgSLH0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140116

On Fri, 26 Sep 2025 15:25:36 +0800, Xiangxu Yin wrote:
> This series aims to extend the USB-C PHY to support DP mode and enable
> DisplayPort on the Qualcomm QCS615 platform.
> 
> The devicetree modification for DisplayPort on QCS615 will be provided
> in a future patch.
> 
> 
> [...]

Applied to msm-next, thanks!

[13/14] drm/msm/dp: move link-specific parsing from dp_panel to dp_link
        https://gitlab.freedesktop.org/lumag/msm/-/commit/866aad5cfb55
[14/14] drm/msm/dp: Add support for lane mapping configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/36d978701203

Best regards,
-- 
With best wishes
Dmitry



