Return-Path: <linux-arm-msm+bounces-79309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5818AC178CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 01:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A98C422ABF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 00:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD5B2C15AB;
	Wed, 29 Oct 2025 00:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b60cyLLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bj8s3Iot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9924226D0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761697851; cv=none; b=ejiyVQT20SB5NIAtEDiLBzTxVJGParq+H561dZMehHhSKRTIvQt6QuxnJj2W0nmu4xg+oW150oNv0hDJNm/TnYssfUDzmlOGud/3PxivV5CBaBJ9HUmhb+gruP3iARUS884yzhfnLXC+vhNP6u9bANhy6HZja3JmQQgZPUuR60E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761697851; c=relaxed/simple;
	bh=HEea6GKuDLgBltpRPJ3awQJ7bFld00ZKLZWALJGqglg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qzx6dMJZ+t/jBXweHxc7Hn/NOlufxX4TRqunOIJibwUY0IF2XATbpB91wreAVo6YIIaaEPAKt5dcfogudXMx312RaCPLGXauWx9ikgLVjc6cFHJd3ccGnn0FiGOunddTh27BrWCvVRUXeynI0SYXyWP6G5Su9/cu717lrx4Z6g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b60cyLLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bj8s3Iot; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SJlISe2616694
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VyEOF+aXLbKYv3f4NZ9fETHTP8oPsdMhgn4tmd3+uZs=; b=b60cyLLnGPIYVqY1
	y1eCbNRllbHQeqtZHhtrK38EbhJym4H3A2ltPD2NfqkktHucHZNlxli8Yo6YJZiG
	7z8vGY8DT7uwZdv9ejfy/B+ng13/Fw4XwVHq3RLhoZL1AKaipqzHWICk5ZoWLFt9
	17Ylf+gC3xnu5DPPTCEBj5XgNtORiUaiq5vDTzUWUlniATBjR7nwZolJ1Xu0oSGb
	yOqCnlxjzZL7hdge4liWmflOYiCtAypGzspZyTGYgw62oBQJ3nFjq1Eq3NgHWHRT
	pquXlVLSLDxNrv2yaxBIJ7VmiKCqDvAoDrC+r4wbX+3iTPf6mHi/Bsoj9FfD68zT
	UPBkXQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a349y0n1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 00:30:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c1cc5a75dso267485696d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761697847; x=1762302647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyEOF+aXLbKYv3f4NZ9fETHTP8oPsdMhgn4tmd3+uZs=;
        b=Bj8s3IotmFSlzlIhxgvH4z8c1cLLzr1UxGnWUwgQNYDaiqlJwN9jhuX2nRkTIl+n/J
         TbC1a+zUwpr4tHkMEtlHbqrmYl04EwV8gIaVQazZD30+FZFY6yGKoHlx7h+L4RZspxK5
         VH1K+pMzS9Zp2+4LP6NVuUEzSAjlGkLcuJfiSZdDGakhT93DbugUKfeUGC9LgWEaywFC
         9MroLWryPoW2zccula/+xmJPBDu81hdMUt6JlJw4rzkn1L2dZF8D31/7hio+5WY1sMOA
         ZnvcE3lgUwes302ooqHD893n+yiMwjhldu1GUDJH9/OzZzOUz05aMQYltTNusyV+kdcy
         /Dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761697847; x=1762302647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyEOF+aXLbKYv3f4NZ9fETHTP8oPsdMhgn4tmd3+uZs=;
        b=Ql9fYse5ySR4DHrcoKvvtc/5NFq3dFQAol1RzSsGWhq0N5Q0tCsR5vs1daZyL3oyuh
         oeoyca0fEUzKOn86bdMsPvavSFNbxk8Tbp1cDMC/PV8CBScjJw4AusYQhmvpgS5eH1In
         7b6xo95VZRe5aQ5nN51l3z97+U6WTdBi4fQXzWEqFX2ndDeVxIpT52OBlwFKzr1//99L
         FnXursE2KBr2OCI40suLCJ3HkeSTCKb0R77ApJLxw7DrplvveAk/KR3b0lLyhi3dtajo
         6D3FnaquRDSoto38IF/Nv8rb+HgGtNR0eglRuUC9sMcpxCvPhODxUC3bA2WBoLFrWZge
         Belg==
X-Gm-Message-State: AOJu0YxBfFC4y/UIAIJwxFMWB2D6tlvE4uSTuJhb55FoEPw83KHwibLW
	mZwg3NKuTa2hRu9DJSoX6jfE8tU8YH2rLfcp3vbnSNHmVrJQOX0Voi+18e39ox63VJXHxYNncHf
	4Ox6nTIO8/grHVa5vaEUMFgt5omnjRRxFJle+O5RNdScKiXv/k7DOwz9/jxZYROFVimrB
X-Gm-Gg: ASbGncubmKhQkuieKE7zYCuQpDBoAH4iLrhRxuVl7AnO++tmhf6D0hJBPd4M8+auHYU
	WmO5itTVFMEruGqqRzp7asl85ltAGYOSKt3QBDr+HRl1/rVRMg1pIO690rNq38EVTZaSIggPemZ
	NXWMGnKK9LUcP1PBBLRBR8ogGtH2XaZAbGa6tJRjjX7ZiJC4kcx7zu4neoVnx0A/QhYuFcKM80v
	k3FmK9XV0puXzEmoU/balq5DBhIjY+XMeA4tcK75/SDgkxVTPeFneO1eA1PckQlkDwp820XdD6Y
	ZTnqIFzgYNsG6QOtP5fDFdFFbD2kbxsQxtjoK7lE8V8wZ5mCwX/5VDN0BQOAuW1Kuoc9sy67wcw
	AqlOeAOEFghGER/uSn7gLKj/480ELvjHWoJcucNe8lovlr1ROk2dlVDDFrvTEtcfAcKNLuyvluF
	6COMcwFCsd0bB6
X-Received: by 2002:a05:6214:acc:b0:87c:1e27:f7b4 with SMTP id 6a1803df08f44-88009c3fb27mr16408936d6.67.1761697846991;
        Tue, 28 Oct 2025 17:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsBFnqbz/J7aBH99rrrrpjG36zD/8B0hEGORviQ9ZerRyWHsasvUR2RCXFVhnR2eDLiEUJxw==
X-Received: by 2002:a05:6214:acc:b0:87c:1e27:f7b4 with SMTP id 6a1803df08f44-88009c3fb27mr16408416d6.67.1761697846330;
        Tue, 28 Oct 2025 17:30:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee092042sm32141621fa.6.2025.10.28.17.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:30:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
Date: Wed, 29 Oct 2025 02:30:41 +0200
Message-ID: <176169780818.3761968.15179413078088034823.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
References: <20250923-modeclk-fix-v2-1-01fcd0b2465a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D8RK6/Rj c=1 sm=1 tr=0 ts=69016037 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=1bp3yVi2_WrJ7BMISZwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: rLmYtsFCLATy0MizSkf1JkJ_JF1bx-5z
X-Proofpoint-ORIG-GUID: rLmYtsFCLATy0MizSkf1JkJ_JF1bx-5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAwMSBTYWx0ZWRfX/eUnwW0ioL3M
 KLrLPWprI/PmniZPghjdzwhdSkhNKTtPsKBZb4EViEIa3s5Ku4MFbqr+foCehRfQJk5Mn3nE8x/
 UzNWPhMUdvxFyBlfuX1/4jOLs+qPfHRIgLPktI0G2pyQ4PMdouy0quT1Wh91sTpw13cDU+wnyTQ
 Xg9pnKfl7afsYYYFPnTmApaeJ8sKT0h7Y+orQOYqCkkhYG9LxqmjwdZ+uul9IGzJWrik13mrU7W
 EK+iz57E+ODOPirzp+4SBVkLEdNGIVBO/kDSJKT1mylFPfJ1YOsNle33RuAZg58Kmob6zznRSLt
 o58Acp45WhfUPMnev5qu/GFHN0NBCfc8Ojva6bTZ/Pa5L3os0QLnb/sdJO+HwOmGJk4n/ywoQE9
 E8pNyNosMFF1wnzvLDGOgjfHY850jg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_09,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510290001


On Tue, 23 Sep 2025 16:03:50 -0700, Jessica Zhang wrote:
> Since 3D merge allows for larger modes to be supported across 2 layer
> mixers, filter modes based on adjusted mode clock / 2 when 3d merge is
> supported.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f5d079564c44

Best regards,
-- 
With best wishes
Dmitry


