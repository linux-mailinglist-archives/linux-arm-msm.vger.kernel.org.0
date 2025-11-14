Return-Path: <linux-arm-msm+bounces-81881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2664AC5D97C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16B873AABE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21834326D6F;
	Fri, 14 Nov 2025 14:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLlLy3pa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DNPbV/aV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D15D326947
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130404; cv=none; b=ZI4t/OVis42rkuv28X64kl8R5pt33MwMtnqCpDwlMk98e/hyfsVSXC84lr21RwEKOtOoc+g0pUgf4zJYakYz7QY9GOQaqFYS+eVPa3oqHz6iFMUN/y/6anp0UnQ/1C8OmehoxtRXIUevPNccpQIHDGrK/YL2/BChcDSO4+LYhC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130404; c=relaxed/simple;
	bh=+bJwZR6lr2Vy4fAx7gtqQUTh/oL+svCD5T0NSxHqQmI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UXiCYvyRlxI+z4D37O3ETuqYOMcp6omzPaPdbAtKMLns6lUHeMnpnOn8NRYE+/3XqJNjdWXvUdw673iGHzDow/iYZts95llNdjmkJW4h5mQOywsM6C1TAfO51lSJVNc1m/ZR/XWqKTCvhsCq9TmIBNpmR1GOAUrtIk7IjkejZSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLlLy3pa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DNPbV/aV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE8WJdX1620299
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N7lLyrVazxmxh0VMg9OnWGdTYdsEX1P3McdO903iSkk=; b=lLlLy3pa/0oPh88T
	N4IRDkueP0JPSpzFc9me6FoeuFZlhcIsd+18Wd+dx7kGs1cqozEehv3ikffFNdSv
	/PCa4oOZ0xoaXBo2+ICEqkuj1sXA1yto43G011Q8HBWEO9xUk65KdIiHxCtMpKAS
	2crrO7u9VAG1jF+WjIZpFfSQCDoSnLTU4w1ugHux7ifSOuaC74j75VCNXkw2GPqb
	+vrOdEPg1LcLDf8QAjgDkMCqEZovY4jZmltuvYhHN7oB8hRPLe2PaAUN0IkEVD9z
	DgO6lqyKjfxIen7Hmb5zpLkR5hGMebKZWWCvUXiKpqpLU9U5e+iD1PklZRL/u+Z3
	VPy4hw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h2dwv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:26:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb35b1147so52958741cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 06:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763130401; x=1763735201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7lLyrVazxmxh0VMg9OnWGdTYdsEX1P3McdO903iSkk=;
        b=DNPbV/aVpe5Z/VCEZsupHH7GBM39cI5qagjvQC0U1daq6zwJKYkm+O3YSrg7UNNrKO
         bMT5TpO2ML2V3iOutoDDALufVmbQA76JZT215iJCzSatc7iOlF+95xO1y0whaSS8g0Vu
         dGnOGCLyu6FiSzUMApEpy1CeyLoYoOTw8HyQZ1Gnx6NI5EqltQpELPLbXAnLKTsBwEGs
         +z1VLAc4j9+p8HhmL+1zVNoKElYFgpfhdXnzzHxN0UxcQ4ZWwfiu8gPv9lRWQCNLv1hu
         EUGoOT1Xfm8JiWnv7c3B2GHr7G5b9XTRhJTYypvg2umcFItX+Tw9KbjP6bpAo/1q8Oqf
         Tqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130401; x=1763735201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N7lLyrVazxmxh0VMg9OnWGdTYdsEX1P3McdO903iSkk=;
        b=w1lRUtjtScJDwQnQAUgSljUIMR+dbKpx3/iW4ih52T3L07q8DPTj96Lrbn1DVs9nwT
         whLCKlFrW1G/V+05153IAa+ACnyWXjUkidWmnQoebnsLywwG4PSWrCkZV0YMfygZ/uY+
         lf+s1zJ+RkMRutLeYo84eQXVDw5VRQBtpKKAivCbBnQqKyeMlU23R4NIEqc/FaC3xtuS
         u1hPvIt5fL/SsRlvYJT3UaBHAcofkaPKWSWfoJaSfi8tM6i4RmfEC1KK95GoYMurq2fh
         iPXaLXF5BQrMWVY3jjJ6132ZmrKV4pCVnb1lt616Nzp5f9+PcFujX5BkwIz80TGhS1Ah
         8flg==
X-Forwarded-Encrypted: i=1; AJvYcCUZG7aduJ9rehmTH/z/pY9M24QGbuCgaEnVzAEFlzPyenuiJsbZzCQthYtsYNu6aqotYLX7B9BP3hAs7fsr@vger.kernel.org
X-Gm-Message-State: AOJu0YzFbDU5jHZ3ALGoUonGFNuN/Iu1HhMWaTc54CiPoC0PqzjMYKrw
	J+ipCkicvsr7usvD1Oh7k9INk8NH6A5ZEolGdvzOSxLcJy3z/5449xVjmtqmaRQapUQ+7l15fKa
	NxCNJmr4qcZdPlsHHceRLafowdFzBrf0KSfzuQZVNtDdznCJtbSoUs+4/MXQrS7CIfvBf
X-Gm-Gg: ASbGncuGb6HcFG1RLbYx6cAGV4uqYaz4OWfc7bzVA3zlCMLgqUIN00c10B6DUoPWDVy
	I2JUQZ0Qzh6J4jAy8G6KdMpEKuiw1NppON2ph4htzNL0TUYUrVUkyLyDfxoUR+rQwPcTggR9vDE
	ann2rA5yQxRZkE2KlyR4imEPPRGHAuyJGXvhI91oQiK0cuA37zoVAipHKYVG7Rwit2vZWMJcV63
	3XZ6UHBAL50488/HQ5cINMuSDLOtV16CAc+Fa5p/QaYLIfK6lUfUK2PhSuN/sSTXBnjlKBI8eVF
	oPsX8nIv9hd5QABqxEnJomXvkasL3nbzk8dAqbjqEO6F3D7CZ6Y/544GEESNHeXcyGA6tvOJk4e
	nGv+T13VPmmcFcQRXIQLtqrN+H0YwWCu9HpgRN7mZJ3chK4pp/hRGvHMKEP/YEL4JTEoNl2JvOv
	HXrb6cCgkG6VFe
X-Received: by 2002:a05:622a:199c:b0:4ec:efdd:938e with SMTP id d75a77b69052e-4edf20480fcmr52130621cf.11.1763130400768;
        Fri, 14 Nov 2025 06:26:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbcH9zzsrqHSq4+dSl0dRGmoS3/QGOx/7GRhtG2RrVtk+FqMmOeboWeMMmkXnDPOqFtSlstQ==
X-Received: by 2002:a05:622a:199c:b0:4ec:efdd:938e with SMTP id d75a77b69052e-4edf20480fcmr52129901cf.11.1763130400126;
        Fri, 14 Nov 2025 06:26:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:26:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: Reference DAI schema for DAI properties
Date: Fri, 14 Nov 2025 16:26:31 +0200
Message-ID: <176312947285.1737000.12844638893324731858.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9TC0zBKjuf9qNgafYsXvbE1d8RtHn1W9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfXz2M5VJ5M+78b
 6JhyC7TV2V5blJle4xEOXUQeiBMFewRC5BgCQs1X9f4evbefIdZS9+ASbqnoADxBWgR1O8r7qGf
 1YJHoOo/Lbgc5Cm4Pvcv3yxvBSW8a4jxM7bDH/LA1ZvdcNIcAlPiOsr8UBN9QoKCLYTfSC6uVtQ
 uFFTQiBJzylx2cNOMqeRjz+Bb3eTKPH1xA66hCKD2kEgeoxYdTMpYa08lNp+Y0fr76SK+RO6CRU
 Ggiuat8zBcaPL0h0J46Hf+dVzQ1pV35NB2aiAa6AM/Ex+8zeLdPa5nIQzm9nSysE0Mo+UfuOvCu
 +58muJwggMy/zFvf9jxtSf4ctA6kUIWHsj/P5tlRAmkXdUOkH14ihlHEQ/yW61LcAt/C3eVZyYX
 lfFWXESUguLYZUenBLkm9g8IJcXqJg==
X-Proofpoint-GUID: 9TC0zBKjuf9qNgafYsXvbE1d8RtHn1W9
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=69173c21 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=76GXk1XwVRG-H1p1aUoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140116

On Tue, 21 Oct 2025 13:10:51 +0200, Krzysztof Kozlowski wrote:
> DisplayPort nodes are DAIs (Digital Audio Interfaces): they have already
> 'sound-dai-cells'.  Reference the common DAI schema to bring common
> properties for them, which allows also customizing DAI name prefix.
> 
> 

Applied to msm-next, thanks!

[1/2] dt-bindings: display/msm: Reference DAI schema for DAI properties
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a4b9c1acf401
[2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback over DisplayPort
      (no commit info)

Best regards,
-- 
With best wishes
Dmitry



