Return-Path: <linux-arm-msm+bounces-73450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D47B56D17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EA7B18991C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 00:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B8A4C85;
	Mon, 15 Sep 2025 00:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pANlLx+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC021A295
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757894622; cv=none; b=GCeFclHB2f1iScSEPggpRPgyxL4HVYZOe5aOyLIGLC6vf4G5TUn0CNTqBw3I97NCl9Zbeg9Z/qltDIM8pXJnMAfHGTc2ReZcW0LYK7+p7vyehbTMRBOxEJUOVX6f/Lk39vawAiIUo7Qfoy7niB9YB6VkMxkDfu/R053lWcXQdls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757894622; c=relaxed/simple;
	bh=2Ljq9TrPgOnJLOGBCkDSJsvuJeZQmaKb9drSAQUZTW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbqFMcIWgyeP3eP/r0HWtkbarcRyIY5BDgfKFUHpvDBcaLDbIC6TMLTgLkdFdlL2IdABBA9RWFN6aYWIeGtVjuuGwEojYsNkPqvv0GZJrLc4C6+bNze1p7H2KsTABuiuUkgA/+SOpFsHA7/widSEj557dZuOHbeUo81T6S4F3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pANlLx+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ENSBrY012501
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G1/nzps+RiSdN+G23dzIrLGr
	J3N7Ua8T6tj2YeHkdOw=; b=pANlLx+1g4xmrMy1/EoCSm09DRtxsj1Xh+nMO4GQ
	GnYXL1kJDM9co3FLyxH9Wp0UoXMsPe+vxCFEmb9eX+DeBpD43e/lMjA+PCa3hBnN
	sPWel+HEF5vpQRQP7/2AKkgqD89WKJpRZ1+dX/4OhZxT/mm6wXtt3PU3F/4PBTvG
	/QbPgyX3c9dwBUx8/wGD/Yte2nY1uDg5W3dVSzs6XYKg2U6IQg3uimBTer/5JLx0
	cdHG/0H87kbX1AH554MpickKh1YzcdpLAldq3RucyhuUTrHoCBUakN2GzmtN3+aM
	m6QEyXud7+jumx6pGkvu7c4ENORKd09HDa0pkeANYMwq/g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 495eqpsrnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 00:03:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-81678866c0cso710396685a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 17:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757894618; x=1758499418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1/nzps+RiSdN+G23dzIrLGrJ3N7Ua8T6tj2YeHkdOw=;
        b=qT/Jn6GeMHpDnYCA9khf9q93BkbzqGnRble+tuL6KqkJ4QTjh19kA2c+cNtq5rlkCO
         Lit1o7jXPFloeqFmmwt+ivC4m94c/ymt0cHpHfAy8QbnyAl1wk8Lusud5cVCZ+B+UkW3
         qzBti1vPJNsMM46J+D0D7haDg3uHnJQNlyva0zJl9bhFFwAp2lVUKRzYVs9+dQWrEpAX
         9nxde6m+7tZatfuV/qTnMVGPdnTkHa16fQLJnvLTUKTCGltT+SnyLM851CRe67dcLfd5
         UGDEwSyfnfuJ+fZBaYQeppRyWRQRaU38/SpJNuwa3/uZlWFg7z8nUsx8boOuykF0jZXr
         qrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCU76+6YilMoyCxQYcJVzzjZvk7avD4zsprSkmrKrTuVgk3un5iE0tMS4RlJWk5njXpZ0a4FPHN9eR61rJBP@vger.kernel.org
X-Gm-Message-State: AOJu0YzA5ISKRhVG6Mhoc5dtvt1J2UcmbfgVKFlULiyCKpw+pK/fQhtX
	Ja+AJ6rBToQhFU9cQuowKtZyYsJbuafClmuRbNQVVDT9URTaeiUfhO4AtTUrkNzmsA7s5ZWPfTx
	0w7phCfZ66D39PmaKcQOoMr01yAqw27J0/Lx+HvCH92a4ZLiG8MKQXU/3/QTfb8nrm63e
X-Gm-Gg: ASbGnctDkvrPnpfLg+SELNPTTT/UGUwB/PDtnfCDLpvSHT+ZQkQfon8XPKv9a5VRBt7
	HOhfQIvMvrzuC8YEAxvMAVdFhO7eBYIWhTaRsVsSnC58+i669uHkwqd4hGFMQ8hKYRqz9cVkpEM
	aCGhpnObTlrrcFS68KddXfuOPSEgLK45aGjm71x8webQ0UvOBdINcDyG33jakMVdVI6JEHwXD34
	GfRUVaew+0CqoH9EIJNqvHMuTcvHSg+JcHBUfgHLocdCCKWlLrvzKibEXcY7NGrWdR+/msZMDW7
	FUIkYnFPtity+HYM4dV3XsVp/23klep/NSSYFqfmYRjO2dJ38adITKrMN8TJ0TSTREFInnoQr7o
	HTp1R+Dcj0gIsk+CcxsFBIUC0Rp+14sGO3LP4NTnUKHXomWl8Ya6p
X-Received: by 2002:a05:6214:ac7:b0:77d:bc4e:e0e5 with SMTP id 6a1803df08f44-77dbc4ee296mr35056366d6.14.1757894618584;
        Sun, 14 Sep 2025 17:03:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEd9XJDUHsxXiEWsvt2wRNO48cVLBLKY5tingp0pyD38cgQv6RiAe8g3fhFzooP4xBQyxvz/g==
X-Received: by 2002:a05:6214:ac7:b0:77d:bc4e:e0e5 with SMTP id 6a1803df08f44-77dbc4ee296mr35055926d6.14.1757894618134;
        Sun, 14 Sep 2025 17:03:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1a8212d8sm23244261fa.36.2025.09.14.17.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 17:03:36 -0700 (PDT)
Date: Mon, 15 Sep 2025 03:03:33 +0300
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
Subject: Re: [PATCH 2/6] ARM: dts: qcom: msm8960: inline
 qcom-msm8960-pins.dtsi
Message-ID: <57nmwdragh5sw55ji26v3ao6ekxvgj4y2okbarlsw3646adjq5@zmlu5dg7huhe>
References: <20250915-msm8960-reorder-v1-0-84cadcd7c6e3@smankusors.com>
 <20250915-msm8960-reorder-v1-2-84cadcd7c6e3@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-msm8960-reorder-v1-2-84cadcd7c6e3@smankusors.com>
X-Proofpoint-GUID: 9lumxNXhNNIEs9YghvjRgeCYkq-GstoA
X-Proofpoint-ORIG-GUID: 9lumxNXhNNIEs9YghvjRgeCYkq-GstoA
X-Authority-Analysis: v=2.4 cv=XJIwSRhE c=1 sm=1 tr=0 ts=68c757db cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=kbTPNbk5bq0GMcXo2L8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE4NiBTYWx0ZWRfX/yH7LpgWC1A+
 nkt3lMgC7YIgwzm4OsjzPN6goTuM6UX+aBUhVBGvX6bRiDtDrgVquSAWrrnxMxVcAxya3h8+8Xt
 PUoj5GSMgRBOKavX0Bw8cdTWYct8t/e+WmT6c9jKmTppoQ95DcsewIzALq+QgEztEF8djZ4SJ5D
 5sAy8Fgx1fD4ZrfzrSJ7jdhu8sHdXCH2lZbbW0yaHWvZiI8OdS4tJvRW7OUFoMJeVgw2FcaHEIs
 5R3AV+At9GxVSHNbI9+WVi9g6iOAOpZFKslLFEDvsH/OEE1JcaeH1ZpvxlegKRz+DmkY7l0X+V/
 Ltd6fauM4bYee49aXeC6cE24hbgQb0A/47DMsXg96p7kJoQkxjfU4vPXdlv3hdufxojoBelrzYz
 2gcI7Xwy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_08,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130186

On Sun, Sep 14, 2025 at 06:34:47PM +0000, Antony Kurniawan Soemardi wrote:
> Inline qcom-msm8960-pins.dtsi into the main SoC dtsi. Most Qualcomm
> SoCs embed their TLMM definitions directly, with only msm8960 and
> apq8064 using a separate pins file. After this change, only apq8064
> remains split.
> 
> This is a cosmetic change only, with no functional impact.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Tested-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960-pins.dtsi | 59 ---------------------------
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      | 57 +++++++++++++++++++++++++-
>  2 files changed, 56 insertions(+), 60 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

