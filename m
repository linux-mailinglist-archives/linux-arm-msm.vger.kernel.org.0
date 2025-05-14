Return-Path: <linux-arm-msm+bounces-58006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C04AB77DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 23:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 132F73AD45A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF35296704;
	Wed, 14 May 2025 21:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLebyzUa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD7A295511
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257821; cv=none; b=TT7iBZ83lBvoyGOlggOgzC1Lb0ePgqxuX6Eb4yLfQ0iNj+fcRVWfkzHTc3QzEQC26JmfTFsYPrZDzMezeKYDD8WFoh15+SiaVhj68gJG2iLPmKZLxzWu+JIw72cSVah15j5Oz3S/LN3w06th4PG7KjXj7y5lzf1ztGMkdU0kfEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257821; c=relaxed/simple;
	bh=BUTPCdxYE0KBSr9Fr+4DkW6Crfw+tCtmVXfSMC+Z33I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSnlBn84bmwVNW2mg0C/34GgAi1su+IAF6XFoyNimqaVcQeZTafgb3j9ivxUJQ+xDZchDcFSCH02TMajtLrQnO9Lta2Zoi9+bX8JVhw7mYJwXVNY9GLJhVWtoduWUqCFawn+z/6y7xRfBINT2OXiYUzWRJ9Hg9tUB9EyqNsVf+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLebyzUa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKCZ3q009094
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vaaYWPBvIHzxnTRnla3Zb3Vn
	Q4iu9qj3qxbcJAJI5CQ=; b=CLebyzUaTFAHK5pzea73BO1Vs7S5P39S5JrVgMVh
	EzzBrre5Of5EEAn2Tb/IfbwknI8g6Ar00GRkEA2JLSMWDpgbpeJP0kO1R2R37C4X
	ghfyat5MNDmBNlN5G3VdRqdf8rVU8WL6mgZ7Ax8SicF8yMwxPn7DQ+9/j+917sb+
	hN1Oa4FHKGdYE6+wMLvKFwtWdiLJtulROtQraGZA5X/Or1Ddi+K0+LLpJ/whj0Qn
	NEpvuhexLuWU10OyFxbJ1W1YLdZlwIRfZw3SCVRzw6wrQAgYqXtlHeYKfjOVGQZi
	7yDJdMUz4xI5fRFFHrI8Dy+fScc4Lhp/BJ9YAH5sA6ZXpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpv4ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 21:23:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c95556f824so22898985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 14:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257818; x=1747862618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaaYWPBvIHzxnTRnla3Zb3VnQ4iu9qj3qxbcJAJI5CQ=;
        b=jNMV0Xe4eEpboQ5vhH26UOwMRWdaOJowSbokwqKSPT8zhDuJyheNS7g0sp9ZA0U2Y2
         qhgFm+LWP+vx39RopQtmsnSOGSRkcDMmzmFloAe2Ci6IYlHchSN7oTd6ryBZHzwZBw1a
         GHSmCvjUJyuJRDudgPcDvfFS/vzLajkWdRA83Ak3+GJ/cD6MkLcDbifZuw76HsUDaoD6
         V1A9p+gb6UNOzBzEMDZ+fwhH9pPnXxVMtkBUr0XQiwY8KmPWNmlYYtX9v+5GSSxkVJ2J
         BVAqUnAib95kUgZIfW8zYtVcYd7WpnmV01i7KXi6jW7Vcv3veFjurPBz/ADzHamWRdsd
         bwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJotsu05iC55MYuMw189uvj7/nDx6Gz+Z2psUwzVJ25dOChANTgATAK8ADjhWEa9Otn6na8eLY/rp/92Jr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0MYifxqOpNHgiDDI+l7xstgUGy/Dutjvpb9I4az0pEzN408et
	nsaHA6WNbBT02dDLbZTQwCDmlBWZ5OrhIsXp8CupqL20nVc7hU9b6E0A201Q/Duzj4yyEBLJ3oN
	YYoU4mQUst7KcIMKzju3APzR/3caeTiaiOmxswIWBVtXSgeyEWnqEpiErsOICWI9l
X-Gm-Gg: ASbGncsT42lAMlubQuu2dWJDOIqaLAbsueOZDQyBvrr+zndg/29+hj5WfMoKMUuZbjF
	ZGf6cnxYAOhzLMqGz7cUlHDVylbxF9tG3hmoADencj1aOamkk3UwhBc8QDeP+atAhfKCkNIHsLp
	ngRuAJ2s/adFTBgwt3o3YYlbR7EWGkI/TlByPXe6HBhlvF5tgAnlcIOz8ZczVRyhQkWW3r8hYIx
	F6oJzbPZBIy4j7eppOw/w7EK721gm47Waflg1llAjhYLlKvZA/XDLSh2PIb3oS3I67vnO1tgWYU
	T0I+K7N2fdctMdFtBPYId4upSRJ3comWhCcyiJGxrIBUm3XH8g12Ds7ybAalhr4z6h2bIXlENDw
	=
X-Received: by 2002:a05:620a:f0e:b0:7ca:f41a:4844 with SMTP id af79cd13be357-7cd2888fad9mr834860585a.53.1747257818075;
        Wed, 14 May 2025 14:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKk/aEqt1gPJl+u51T5UjY95/XJdn9iYDGEHP11yzCdYiBQxpQ5KUK8fADScjUo9PVc62aHg==
X-Received: by 2002:a05:620a:f0e:b0:7ca:f41a:4844 with SMTP id af79cd13be357-7cd2888fad9mr834857285a.53.1747257817673;
        Wed, 14 May 2025 14:23:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bf8ecsm2380641e87.187.2025.05.14.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:23:35 -0700 (PDT)
Date: Thu, 15 May 2025 00:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 17/18] arm64: dts: qcom: sm8550: Additionally manage
 MXC power domain in camcc
Message-ID: <7csmi64osxghv3mkcxwfhxlwodzwvpbull36htrkmcjzngbgk4@go4wmvfvhqst>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-17-571c63297d01@quicinc.com>
X-Proofpoint-GUID: NW0Coq_uVBiYxS0NjrYEiWET30ik33vX
X-Proofpoint-ORIG-GUID: NW0Coq_uVBiYxS0NjrYEiWET30ik33vX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfX4QGMsBd2UsM3
 A6407iy5dcmldYyl4FuoTahWwyxixyXGCdXe1cMc0TuH+ZIo/f19nPgJbMW6nEORGZxy+c4Gj1O
 2kQB9pVNA4+s/e/Dfv/LizxsQQ+g3gnRrvb5ISf+KMvv31VY2OdgNK6sWXOVIi4nLJGxNFSRQAZ
 hqTB2HutDcBW9+8n7YWC4BelrnywJJQ9AL8t3ijRka+q2bqM30sJaaDj6SzbNtNehOQ4l4sCd6S
 KlXGJkWgT0mm5NaAi4mjjyWOy4Yl3JnCSMehEjPqSukESSA+9oQQXWcu8zobpFiSRTowj85JtR3
 x0q1Tz667WUtROmNTp77koO+2YFrTNQnKwWMuoICmVaeSrQs+hl7M5ghdoHi0sV6OFH9TMjDaQV
 JMUB4xpDKRk1PVsIxD+zFsTuX5RZkIUiByOSkcO/MdslulErnLxhdvsXPVDNfImsfVK085YL
X-Authority-Analysis: v=2.4 cv=KcvSsRYD c=1 sm=1 tr=0 ts=682509da cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=9YvV8F1douotiZniFPIA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=544 spamscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140198

On Thu, May 15, 2025 at 12:39:02AM +0530, Jagadeesh Kona wrote:
> From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8550 platform. Hence add MXC power domain to
> camcc node on SM8550. While at it, update SM8550_MMCX macro to RPMHPD_MMCX
> to align towards common macros.
> 
> Fixes: e271b59e39a6f ("arm64: dts: qcom: sm8550: Add camera clock controller")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry

