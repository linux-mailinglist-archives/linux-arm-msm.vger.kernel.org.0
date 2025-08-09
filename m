Return-Path: <linux-arm-msm+bounces-68167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAD8B1F2FF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 09:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A6C8173734
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Aug 2025 07:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283EE27CCEE;
	Sat,  9 Aug 2025 07:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O8wl1XtU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E7027A914
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Aug 2025 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754726268; cv=none; b=fGM8ETZUtakPqrIDr4ZOJm8I6izQmTalxIR24zSusz1/PYaAVfnlY4Y9Ht/dBuYt5gg16n8tsXpe7ktLuvzmF21MoUeLlWnNOiicysqB7098FjzEI8OwOMI1EmNj8T3RqXO7isF6A+v8O5mnniXnmh67nikj3oCRl8VEt8/S8M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754726268; c=relaxed/simple;
	bh=oh4gA+jRg2Y2t6H6ab0cfcQsi8u12BugRfmwasOQoC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SIiPzGfVcOyc7SY44YDIjIxH13lVKl9m/9uYYlNvqhDUrBTiN/4WWJozz5Q/QkYb74YdkPRcUDnLIQk0ktoTNkw4v3+G28xLLk7YoPStFOpP16nFr6wS6IiWvGGkm5LxLcrMs8oKL8dE/rffy5OeXryoYUabLWr/TFPI8JLf/hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O8wl1XtU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5794dolf009410
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Aug 2025 07:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MHkzIZBShOGt9MA7UVWK7LV6
	yMeWr/62GPPAqQE79tA=; b=O8wl1XtUkJSIBTGAs/rXFxl87pMLaVNnIkGRT89w
	xJrI3wYmKWuqGHbRJHA26CqzQ2X+kmk6apjFQeQNWIkMMU5Uj3/d3bZ1WiHA6lTd
	FHOa7PvEjU+45J514LX8sw8Y/FJPFDWZeGLxlyQ39OlBfWkPiAm8wmVFZKli4sCM
	w1chfhIpK+/pt2BoMByiNpDI6YbLsm6lWdjrw370lZ0Vex6unAudKZecPZ3MVwqZ
	9TpZXPVN1MPHnKsq4jq1R3JMLiF6EiaxuqCglsqvMCp/2kJCa12Z7EZZlc1jtQpn
	NV/6NfntYpTlo3fkLIhX5QFk5s/NCan4EiJUvVv2uUcjeA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygm87d4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 07:57:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b0680f6270so71915291cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Aug 2025 00:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754726264; x=1755331064;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHkzIZBShOGt9MA7UVWK7LV6yMeWr/62GPPAqQE79tA=;
        b=hSYeXX9LkfYw19QPyst2PrP9IiCo0b/pypHqoDU8tB/oUFjLGhXa+rqvcLrr98diX3
         AjgHTGmrpaCb1g3BwJXWHzWtN7SyDDak2OTJckKQx9Ccs3HJJjJCXm1JdGVd4mOSxaOP
         ONiSaPlSQH+1LRsFoVeqyosg73xXEYznhpv+WhqppJJ/dnFnPWBrze7nULdJVn/mf1sh
         40YBb+S/4KnTbjMQnL/JdNuC1vhu+9jfnBbVkgVY+cZzNomtNfcwkEWhGx+rGkmA02oh
         lVKxY0O3Mo2TN9VbFo2rXuanySFYqXr7IqOA8NnTeQznSQoUVDaVuBpiUmtotVJDkXoA
         5aNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxa7SP88RdxKn2b+Og8pifBfwxRWkzM1o27pfX34PHQJh2AVB7R5IdBZ6/7RSIlYEKcF1beL/qrUB158vy@vger.kernel.org
X-Gm-Message-State: AOJu0YxluBanKdFup/gwFoAYnIGbsPLKiKuB7pct7/8jC8pRAp3wb8z/
	zgViG3JbYGIDC8tE8mkY1tVouSJUZ91q1SgiIiJLiwFh3A2UiZ/KPwuKbm8/L9RVly/tA3PtTaa
	XBPWZ66KWsE1iRfE5kxzLuw+5dZ9WX/KZe6+f8DSu3CXlw29JPGIBd9g+xVlBKV1c8Gib
X-Gm-Gg: ASbGncvUpWFafDLDQBkmKY4HtRoyAkhydVy2OxceYXpL2oxfQ/eJ8nQkwqZdyVetkIA
	cJ0dx4seUv2j8T1M6qAPzyrVcwynEUz6CFZ4EaNcz4A4E3GKVS3PDitSyfcs9sn77qtZ9tT+v24
	Txm7cgoJjb2sgtNV/oa5sVGaOaxdfWx9w94EaVS+ilWF4xy6CaFTT49WNIRpVUnd192bgDtVu7G
	LOaeaQ+jtiWIRsNNAladI2Zq9BS2VDTW7xb9TRrHmFta+vMuzqJd6oN+ap+kYTxXaYAL5Ei7LAK
	D0r+awjAIY1DfYriwbybSbEXQqa9eb8H0GX9mivwcQ7l6CVdo1tVPUPMYJJVfLfBzpzKTD25cvb
	YDSu0SIhKrLZaIuzhQZsSaJfFAt+xwr1BOaap+0ttOnjuVHXAYoDj
X-Received: by 2002:ac8:5a09:0:b0:4af:12b0:57aa with SMTP id d75a77b69052e-4b0aec6fcbfmr80634441cf.16.1754726264342;
        Sat, 09 Aug 2025 00:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZcKxAQsU4y2qlurvBrtplQIY3fRhPoGV1bNNa+z2XGi+BVNOPWtwNB3/KnTtakgGNSGDEww==
X-Received: by 2002:ac8:5a09:0:b0:4af:12b0:57aa with SMTP id d75a77b69052e-4b0aec6fcbfmr80634201cf.16.1754726263912;
        Sat, 09 Aug 2025 00:57:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88caf6dcsm3327161e87.159.2025.08.09.00.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 00:57:43 -0700 (PDT)
Date: Sat, 9 Aug 2025 10:57:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/6] phy: qcom: qmp-combo: introduce QMPPHY_MODE
Message-ID: <pcmy74pebeskhfactygabzjinpbcfhluhdx7rlbx7kds5wynf7@hdlkfpkg4va7>
References: <20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com>
 <20250807-topic-4ln_dp_respin-v4-4-43272d6eca92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807-topic-4ln_dp_respin-v4-4-43272d6eca92@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfX31wCGhY2peH/
 SpnFT/zfFmvqFGQNC+kdE4K1ObGWKwTUK6CYIMpH2kJSJhU4/vAbVHoTjhGgth6rI1C/SM8DZ+O
 /IqsXIrLDClmacAFbrkZ/9x+SmzQpC9l+v1NuCIkjLGd9X37wiC1C8yI8lPRS41KRcY4BfvmnJa
 cuZ9jAw/lItj0E/+xKjRigz9dH0wjU3yTg/Twi/u+PwFZWfeFbHYizqGNl+Mw90ZrdchLl6L4E9
 spwTXPJupf53FQ0I/u19pHuSMs7LmrMxN3G/BkJ8Z/qdz1muJI3tYYldXLJEMFlLOAdFgNRWNQS
 hjmkLcByS2p5Kl16d2yRiSJvAcKU8/dqK4gTUxFO4auAIISPFpB83OO0g7TDvD4G3uDr9F2hKGH
 PkbZQSI9
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=6896ff79 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ruQs36HUC5Lhap_3HWYA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xav-URF_-87PdPqun5bUCpwtp3n337tu
X-Proofpoint-ORIG-GUID: xav-URF_-87PdPqun5bUCpwtp3n337tu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-09_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035

On Thu, Aug 07, 2025 at 06:33:22PM +0200, Konrad Dybcio wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Introduce an enum for the QMP Combo PHY modes, use it in the
> QMP commmon phy init function and default to COMBO mode.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> [konrad: some renaming and rewording]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 44 +++++++++++++++++++++++++++----
>  1 file changed, 39 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

