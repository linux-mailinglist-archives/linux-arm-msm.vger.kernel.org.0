Return-Path: <linux-arm-msm+bounces-71298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD8B3CFE7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 00:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77D51201F4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 22:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7EC216E32;
	Sat, 30 Aug 2025 22:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IilZchI7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA21F4717
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 22:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756593140; cv=none; b=QpHxUH7mLeGgm/NYkPyBC0gmUIHhA235kBfWkebX0OSdtBtPE+Ht3f5mQ17Axn3QGGnLkoQD2WF+O++dqV7dFt57fpXXSLNkGoZH5GRtLaWCH/k0DOFx3gi5nE+XDDLAlZLqufHXXvNS4qH79GIKkFL966DyCX6dD6UESbjpFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756593140; c=relaxed/simple;
	bh=us7sRr8yLEdHvWlleTM+BBqy1U2+fJ2VNFkbnU3OltY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjeOjBrKabW9KnXn0bINI5dCDHUp1a0vQpAdS39xpHA+wEbN0qU56sUtzvhEdCax1lg1sunCNXoMy5Lf7LZKu9GoRmgZbA91dnGaNnkPV81XbxFh2tOzzirIsYAeJvrJQ/n8EioVy9Ayi1LYPPHgHMdmcu6FTvFBsuM746n/tYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IilZchI7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ULRF1e001768
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 22:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOk2Fr4etXqQXWWu31+aCsK5bvdOnYg2L2JTOXhsW8k=; b=IilZchI7fwzK45sv
	6CSw0jKZI/ndE+4w/eUCgnpqt0zlgxidPaGtbEAJbrAbynjUZ4uRIv3xoHzXjGUG
	+uPGmJow/gxmNlFAUMVa+Ip+goGEEwvmot0BHYb6tDLLTsALdShWZHZz3wQA5Ned
	Tivt3swz3mWTkiZdq3GWqlTN1cvHZonhDBMia+si2FWBIGPza7cR16YWhHBOBcCK
	6A+z8Xlo2TiDht8v2cJUbTqRqI74wB36exG1y2xicByn2bPQwEbkfM0HmjieSYH/
	8r65lN6OV450D1ZX/n2U8gxlyZmOoYxVnlqJeWslrYHfca9olQgV6qcgVodUFGla
	BaUHww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utfk9570-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 22:32:17 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70dfd87a495so51519006d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 15:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756593136; x=1757197936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOk2Fr4etXqQXWWu31+aCsK5bvdOnYg2L2JTOXhsW8k=;
        b=PL5P12ZhSfC5CtLgnFhWCAAAopPeRqiv09BEBi4wb1D4ugaz0xxwuCWCjiW7rZ8qA+
         ilMRWQ8ImSCEC2LZ5/l6lJrH28yScMVGsY9Z38Xsr0Z2TfG5kIa1oXLYMyblI4udSBj+
         HbTAgEyMHJwm3JMb3xOaI3yHKKZA0U4bTm+1PRDEbg+zIiODcvBjpvAd/Tm4E08ZU15e
         9uf93nr9Z3273gq8WGI7R8oNgY2GPviy7KVnydbnqxj5LBQ8606ke9BImHDLMI3y4P/R
         utI4bPVfs5YiepKlkWE5ztWLhnoyY/NYpg7NNUnYQGfHwIlV7wtyu5PG8AO20sQO68I1
         EQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFpptOws2H2cJ0afrsNFDQO0/bhiMBR8DpnYaRvxWiGSzH/fSuZU12gSP1hK+pZYwpmaOjR8H9vwU5JCZY@vger.kernel.org
X-Gm-Message-State: AOJu0YyDSXTAHDKWPAbazr0LhAkMf/sOGrSzv2JYO1mleD2fMC60jcPv
	0sJyEV9Qt/rZp5NpO0EpUjftq+/X/XOsgQWeHdpskAgZJpN723ZIu998q8olYtlWGGtvfbeMtfA
	Gzi/jOU23TwbojsnwjLnrFHffmE5px6oBH9KY4fqnDHJqYuGI08q6IjK5JY0Dmwqiyi5A
X-Gm-Gg: ASbGncubv9fLZyicKnGUKA6UhBewjGe1NPIRoKP4b72I8vvYcU63w5mAtLaYsdh8KQH
	/rwBRBFJ76D4ky34wePZ4mqtb0WEsrKe5s89LhcuMYxU9J3xHK6aRYD+gHnpqaYmtix9ZAJDDND
	3bxk8hI3GzxJcELDRzELUgVObLZb2X9lNqdyzaZ+n9ajfTb/19omdQRsV6QocRd459DYIeh3foY
	snYBJigFw3twt/n10WYH00l8I3SahvkXrMBKXYmKhpDZCdj2JLVy5XBZ/qDu+IfVTHXbIzXh3fI
	8fu405tE3RFAAyoX08yCZySZn5rnuE8eDpkX38kE8V8KxVEyxWDkPRvEeUKn735qNMfKZvHGbRE
	zOoTZFPAN7rexcT7CqnY/fj2maAXIRU68467NNq34O8rWEiUsKYEs
X-Received: by 2002:ad4:5765:0:b0:70b:afbb:d667 with SMTP id 6a1803df08f44-70fac702598mr42924216d6.7.1756593136412;
        Sat, 30 Aug 2025 15:32:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR9Jdct+dl5bztXAQ7MPjTRcDYv2SEdv5r5sALsU5a5Isqo/P5kseYL+FWDWZOGBYsglJD0g==
X-Received: by 2002:ad4:5765:0:b0:70b:afbb:d667 with SMTP id 6a1803df08f44-70fac702598mr42923966d6.7.1756593135939;
        Sat, 30 Aug 2025 15:32:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336d0cb4793sm4700091fa.30.2025.08.30.15.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 15:32:15 -0700 (PDT)
Date: Sun, 31 Aug 2025 01:32:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH] arch: arm64: dts: qcom: sdm845-shift-axolotl: set
 chassis type
Message-ID: <322qbrll5nwg6prpj2uwiqjvk7lmboibq6vlklguxtfpw7547j@44df3kxleua2>
References: <3e04efc06a795a32b0080b2f23a138e139057b02.1756569434.git.agx@sigxcpu.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e04efc06a795a32b0080b2f23a138e139057b02.1756569434.git.agx@sigxcpu.org>
X-Authority-Analysis: v=2.4 cv=eaQ9f6EH c=1 sm=1 tr=0 ts=68b37bf1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8 a=zp4TkvOl8oPtFYFRJokA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-ORIG-GUID: 5huQxQaMCWqhoSyo4lM54cti5d87dgTj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MCBTYWx0ZWRfX2QEsoDvJbM+u
 kkm+MgQdkK3qqMi5ykfu1vaiYuexpwPddNpgmp/MN6XRyjG2DfeZUMLsI4BzFldoZffXeIpH4Ve
 ImTmGVP7OABD9QfG9ZRYCiDdEIFq3WSnw83Zi0qXRLHzQ3l569F43074bviIAE0chpiEYMSBUpP
 rrmANDQF6qlk6kNDfpMZOSvWZwmtjwFaDax3oj8ZVGwqyxXBBc+c7mBIlZE8mvA95llE17Az5Iy
 nG/QntdwSh1/oxgs5m4jeFx5B2uSHkykeuXHDxHFUODZLiHkbBAfz8RFf1pOe8G5ov2fiKnzlaM
 0LK4XmPgUyv5J09YnSl+stqY/qTRH3CHdZSv/M+nF8rAEX6xY80VzYZvASWEwnUmjErrEFJKqM6
 8tv9VEKg
X-Proofpoint-GUID: 5huQxQaMCWqhoSyo4lM54cti5d87dgTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300040

On Sat, Aug 30, 2025 at 05:57:29PM +0200, Guido Günther wrote:
> It's a handset.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry

