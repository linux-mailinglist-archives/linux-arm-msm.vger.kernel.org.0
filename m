Return-Path: <linux-arm-msm+bounces-59660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A77ABAC64B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 10:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 688A8167F3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 08:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADC5246796;
	Wed, 28 May 2025 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYX8fy24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48A8272E44
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 08:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422013; cv=none; b=pj9N6t8bC6PtqZ/OciEImAjqs/GJqJD/Gnsho8xY5TFxF8xuGS///hUJi1dXbV1XvNjjhhXoZTJUNrtfa97uIM0C6UpdyED9oLSf64TjLnOpeHWQJnTdt2hP2cWBhM5Yas3NdVLRypBznJv2MRN4E5QbvhivDM6uOlnRvqAu7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422013; c=relaxed/simple;
	bh=Fi+QiGSJC8uF2K0X5kt8vPGp5bckmVAYGE46xxU1R40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Me8iov4QRANRRrbf1s2HOOjCtmTpkRDLFbTF9WNulHg4aY3mHudgAosYefCmRkcAdTJXnBm5ZmwREEoR5C5tdJMt0g4R1xfX4At/URSW9DdehD0BFQhy0qsvOlo22CQbkR38QeSCtyeWP/t8koCW4IQzqwFGWYlSQDpqTLveII4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYX8fy24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RKSe6M018926
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRzWkDK3ft+iwkKji/GjVMzB
	ocQDwCbSuP5DIc/EUys=; b=NYX8fy24OEESH86jLxZM9FLzbN+nsk41j6+K93rW
	ueBNg7KgmhdpslFMbhhc4lTXjuX2liHHDZxYeQ/+t5uz9RssxOwPIu4W9c2tZM+J
	CGtb5ziTFEhYj5WTXFiQn5KrflxgZV78v52nlevTu5N0Jjc4c+qYaCk8LOv+Tn+X
	X9OkFAJ3pBEtSkNYly3WQ2nZCCsEO0I5MNBO/kIJSpabr4MU67xuXpVyT/mgYo2N
	NHHOxlvQLJOx7rtO0uWJ3xj2jV7gU37aeb1yVu/1aXV7A4de+16hUocYKszCct8r
	MsQgCFogJEUBfWNdmeQitrcpH8XZeyPrbMesdFQBdkqzXA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcx38y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 08:46:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8e23d6657so72300736d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 01:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422009; x=1749026809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRzWkDK3ft+iwkKji/GjVMzBocQDwCbSuP5DIc/EUys=;
        b=eoWKkngrZTdJ8RuQltbnvSBKlRzkr5U3yNaZG9YqJtD6ZTEhiV3IHTaZCYdxFONh8Y
         ZzSmkrsz+NEKmBJNos+TEP6zGX3S17HUQdCQaErYYQVOye/1encpqYeXfcH5QRFHVTXx
         BN7F51WTEuoTgtVDhkhhhMEbShdvtHuJOxnFLR1cO4fB2CSV5vwEP7AfF2YcjvSyzllO
         Pqxi2pNz6AlGtlySuxV69KQXtAtBjoqQbQPJJlEKtC3lsWSqFYqQCWM7cuM2IdtwOeZo
         XtufDSAmASI/x0ik1Djym3C8gG9P2p3BGQ8kJCyqDzdtCv8AFpVF5CdYUk+pNddPEFJQ
         znEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4n3GnOa73275EV3LwFa2fLkWCYrCkX1J8K5+76evWJ7kOHeJw1VE/TYxIlGZ1gcPqS/7HxAKvfd9lywJz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+fAOyG38AjLh0jwCs8qPl3lQGbS2x4fW0luq7H+SueJEM5iJk
	V6Vq3XNbKLdaB2BclBE/Qq6YRqFSNY8YnJTVvPBMJhy3pUo8BaWNizQGklHsqqf6Zig+VBhdmCq
	a/TYLeG/3cwfZL1/snzDMh1KtalpiIPzT/F6jTKauHKWzeNaMsYTEaqrCrKlz5x6r5JKm
X-Gm-Gg: ASbGnctDdDaSevUKaV/6iZEEonLb4dpHBkSj4vCGfiT043+CJdIZwnQiAVeH7wToZti
	Ol4gQAggSnv84a4AE9nZYRsBUo1vQWy0m2rxZKTLf/41U5wqKq/PYiX8sZFyYzIfCrns992I+cW
	i+ucNc1TblcHp1L6f2pwADmpdWec1I1nxZCmZJuK02HAoQVDpSg7I5uzEhkQgpZevlThntGjnUQ
	Tzoel34FXnsoUUalGQsvaO7Yaj15+K6+NJ9kAj3RpVi7hIT19xAxTg8ozgl6mL3Me7NAgE1QM+1
	RMKQwJTo/Q7Zoa06NgWv4LIKXSSrGqJcyz9u3rffGK7EeCeUBzFy9Q+F+IFeF5YMAKCgy9Y+LbE
	=
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008726d6.23.1748422008965;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo9qqoQrF01ykPGF/17EjYHoPs6gmbavsSE2zy6sawKd53Clq0hMx0BlOXLpAzfgtNG6M5ag==
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008336d6.23.1748422008535;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3e3asm182752e87.234.2025.05.28.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:46:47 -0700 (PDT)
Date: Wed, 28 May 2025 11:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <vjtgxpbpaowlz7ftryudf44f35jyaislvkckuzrzlpj25z25cf@vytjvui65gec>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
 <20250527082446.2265500-7-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527082446.2265500-7-aichao@kylinos.cn>
X-Proofpoint-ORIG-GUID: _qoKJ9AEx6GiiD5t8loLkTUtQUBCiFIZ
X-Proofpoint-GUID: _qoKJ9AEx6GiiD5t8loLkTUtQUBCiFIZ
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6836cd79 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=uJ6pKfArofpzZCl0i4YA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3NSBTYWx0ZWRfX9Y2jAMMcMZP1
 H62Xx+m1URvN98xiLENNDwwksrf3/1WGiefjb+pXSkkH1NUooi5WHP7bUn1FrXhK69GhaLGTaqw
 zgubbOMz13EHlJwzMcnF2BUh45s/0EzAbI5cfLqhReEi2wfMW3QWuJuTL5VBqG99CSQNsmqKt0A
 dSMFkGboZZQneCCMlPep7NzD30tjrHrsFTVCBPd3Pi5Xi/FOyQRMbhN/BRtb0+HLcL1UZZbZOv3
 EMdmI+f5S06CirbUZOKTwQZopJJRbdfbdBueYrkW5b8n7gz89HDCqQrztDAGVwZPCmvK55LEKYJ
 xpVOZXr/0POLm+gyrqcDHZoYjoqysjXZwlhxpiT23n5znIR2z08psFmC7/c4wBsQ+18i1qlXNug
 r18MBLVt8Ni9G3CSzV1S8tpwmJOO2WpgN++U08RLOgZ7IgKVtN1hnD35l0DBkmNvN3c3gZVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=476 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280075

On Tue, May 27, 2025 at 04:24:46PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

There are no calls to put the node. In the patched files the nodes are
already automatically put by the looping macro, there is nothing to
cleanup. Please stop sending this patch.

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

