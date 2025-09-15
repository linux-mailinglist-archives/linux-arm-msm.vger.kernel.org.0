Return-Path: <linux-arm-msm+bounces-73452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890DCB56D21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B04C1644B7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DB55227;
	Mon, 15 Sep 2025 00:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pc3IGBQ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15541CA84
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757894826; cv=none; b=EG2eTPOWhOa5+g/pqAv96+IJEQIM4RwoP5tgtI7DE7SwY3fzjxPDUTM7QU6o/PEIBmcxBee0ekUArCLgy6jAZnfyQvSPovYzr15dcoR2zZqtgHdmtWCWtN+DE4Xd/AIwmdT9BFTzq6yWsjRzV60NX1ynSfOtcdvDq4sRtXvDrLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757894826; c=relaxed/simple;
	bh=CzHNrfktlaS/4ODUMT4RaYAOMeg6Qil5XWqJ4rs6Ovw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9jMbawrtTS5pAO3nskVY2onJxLhz63pMUZQpZbIqFBGP8obV6QaWLQhydxJGDYablc0FeU7GcEVzphtejTxLfMKlz2Wkw8VrSg6a3kM3+sazsovg1avIDJ5e+SLSap4HOmYEJd0bbRPG2yrsmdNXjQfEGk8iDZoAUyOkr+nqJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pc3IGBQ2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EN02XC007451
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mh5sherNX0Q7001jFm5e3R/a
	R9MYR1zMB5/R6VlH5zY=; b=pc3IGBQ2F+XOHk6PRzPPKJgl/CGbDJNc9BPjW5mq
	uWN5lngUkmgaMjIdxdaFP95j5HFm5cVAKvmgd76MGHTJH62XkHGKKrrsAmWOqyk2
	q6KYuOingaxaPdb/VrAaac4/klQmDkUODhkTfcbronq/Zp60Y9rqWf6GzhJcjNcO
	LIDd2uHkCRPqRGg/chmBi+2pdEw3TrppmTAl6d6ph5MWJJnwNVpH8SjFYROmGk6N
	DwXvlgk7r+iWpTKfcx4XLOwNuLxKJEf4x+OI8DMnEnbu/dXJn8+w3KgVlt7IrmVO
	aPu70eumA8CQNPbUrQPn3lPX5RVkq18JFCOwMyC1xQx1Ag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv2xjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:07:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b5fb61d80dso105687271cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757894822; x=1758499622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mh5sherNX0Q7001jFm5e3R/aR9MYR1zMB5/R6VlH5zY=;
        b=g/M5ucfjluo9J3a3gAZSwxNgtKuJii4W+0UQUx5Nse50lJ1kdZ1ycOSWbxvP5s27oy
         VFdF7NXjJsNVbR3mEqxcP6ePWwZTCNs3YWTGkQDy1jdeldBtv/rTDAzuDULj4dPEkW6q
         IGuFmhR3C+Z6+56d9g1cfEs5EezqfRC/wK53ZDEd7T5q2DHHKzP8yhH6HmrJ71HHuXcr
         +mO/gUt/UrMox50EnfjUC5MzMU8o0uZN/b3LrRtCrJNnB08gHSyXdG/mp7fyuCG/1o0b
         8KvnOBL3ZLPffVwaYpcghhM6NuitB4gWG+Ll+9vJHzDrkNA/1KaYGZqGID3cqKX/5Tuk
         rKQg==
X-Forwarded-Encrypted: i=1; AJvYcCWwPyt3p6IRBF1W7reb3wqAO5kfRIy9AkBNxRibphB0RoFaDwoWbb6pfz07FMtzbUmyteraBTxkozNGYfhh@vger.kernel.org
X-Gm-Message-State: AOJu0YymqJaTpLat1eOKpKaE3lkZR7cD5zgtawu0fov+NE/7c+7quxvZ
	ijn0vJnlLqGeuXvs1MOyLLa0aOjtSr02+tYFcClMGbNX+4wLpgU/7OHFdFesyXVkz5o+6X95w2Q
	/OB7M1AbP2jJAcM7DGn44AFP+M+ynMQ8/i2F/jGslvCOOydVs9Sf/pbUrCWfHvBiXEmX4
X-Gm-Gg: ASbGncu6n8uG96LWTct+yz1XxIQwmFBfAEJZ9rNxxVEnmK7kdXtmpqgOL1NBpw4Sb2J
	0a8WeI2eWYyDKouHG/QSSw5XZeAYBStkTWbuv9r794nDjtTHPYb7zDmOaJk97MZYbg/pqGnzbls
	lSkzSwcWl0pU87wFObVxABh5Iw5wEHTVkdp2wLmkceOk7Nb+iwjRGCbeTKrmaVZEV90A/NoAylR
	7ubUfeWMs7pYRtI2Pdl0hmA9LcJAomeJWqOaY+qrItdUU8faevHNej9PqijxHoafJr0F2Ce8UgC
	J0/0u3ZUyV9oA2aBuu83Gl3/Am9Tlw33j42D+bU7P4PRTJc7g9AZkUqFKnJrYA3z/2xqwqEnK0K
	lhsuCnxLPgOTIREVASuMQ86umjGEDpgfAtBzhAKOuLxxKOOnLzK0f
X-Received: by 2002:a05:622a:4cf:b0:4b3:4c51:6434 with SMTP id d75a77b69052e-4b77cfded57mr125964581cf.20.1757894822527;
        Sun, 14 Sep 2025 17:07:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsW542Cjhva67Azk2KlVPzEQFGIEU+WTmFXy6f0ObUGTCHrlb+05YBOXy7VDLH+4P8nX23BA==
X-Received: by 2002:a05:622a:4cf:b0:4b3:4c51:6434 with SMTP id d75a77b69052e-4b77cfded57mr125964301cf.20.1757894822072;
        Sun, 14 Sep 2025 17:07:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e63c63ff4sm3220354e87.84.2025.09.14.17.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:07:01 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:06:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-gpio@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>,
        Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH 4/6] ARM: dts: qcom: msm8960: add I2C nodes for gsbi1 and
 gsbi8
Message-ID: <kiawbx7uoz4bs3esiyraeess6vva5f4fwwqh25xrgae6j35gn5@4eoereuoumhb>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
 <20250915-msm8960-reorder-v1-4-84cadcd7c6e3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-msm8960-reorder-v1-4-84cadcd7c6e3@smankusors.com>
X-Proofpoint-ORIG-GUID: yuNrBPWcKEqWvXf8bLLdBe2_5qKmiOLL
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c758a7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=t1JXzLs-izEPKbqAoeQA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: yuNrBPWcKEqWvXf8bLLdBe2_5qKmiOLL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfX4ovzl7wl247G
 A9J/HqXiXL8YmH0Wl6f4pqgtqNJW4RxMOdJ8vSO4R4zTAzDzxWGWWSQH6IfoZZ+Tb8iUN4zm3g9
 Y9+ORI24nqkwKY3b+1oXtPLBE00UEz06nQgm9y7G+aoNDzOBQcsY6/AkDJXxPauEgmw7UvoZvT9
 KTj1ZxC/uZYqe2b0NSoC9TKsJY9lZOe2ncCXPWzWwXwfRKXZ8E68LvpcFih6kOtbvMuJ6h0dG99
 +ZfBnrG+84GlwAxuOmXzQ5fdZ/+0+26KnIf9IigqP+3AzR5GIJi28Fxz+siyJ2JrqMYzk4WbNyB
 XRx6PqOCozpP1D7FBYAxuuBKYI4omHm93F2GwWJtDLj0f/tTvFoUePfVccEK43Vs+K96w/R98Ed
 NpKhsszo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029

On Sun, Sep 14, 2025 at 06:34:55PM +0000, Antony Kurniawan Soemardi wrote:
> These are present on msm8960 and are required for devices such as the
> Casio G'zOne, which has NFC wired to gsbi1 and audio amplifier wired to
> gsbi8.
> 
> The nodes are added disabled by default.
> 
> Co-developed-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 68 ++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

