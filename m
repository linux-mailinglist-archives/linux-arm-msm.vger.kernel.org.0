Return-Path: <linux-arm-msm+bounces-81216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E08C4D23F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27EB618952BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01E034F490;
	Tue, 11 Nov 2025 10:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ddEgJPr4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYYFiDmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242B34B191
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857885; cv=none; b=LALuB1dSs9W9Iw61pldrgz/+X3I1uMrK4ujjUTP8r2QtB9sM8sWw2EDRH+nNfDGuYtYH9huZJh6Eu4dr07ypnT9HrOE7zhSvSClBc5P6fcycyDhQmSO3jMlRri6S1GyY32zHJczuRJfyfFGXcMSvEhI6KGPo0/GOOcTfEhk7h9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857885; c=relaxed/simple;
	bh=l4qzGLhBtZKVvPYErMopQnMHCiy48JJYZt1HwzSfHkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDtDpucsSlHYUGpUvSDSzPKguCybLC15FDbJAXUEDHkZ13ZjeTsOFzflqGmyLmXnQREXIp8jBs48CpzzsqL/dfGia08Gxn+e6a7X0aSD1zIm2sLbr1SXI4PYyDrVIHgWnIKya34ORAaoZBEkkzHCcg55h5Fih53Xifr7i0i4n6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ddEgJPr4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYYFiDmP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB45mY51009317
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+gJidX2jSCTw9eZSYR/rAxIe
	j1PUV2obwbP3TFa0zzM=; b=ddEgJPr4+Li/XCH84jYJ1+ok/h+JR9UGWG5P9mkv
	Urou+0Sajpsw7p08VbkUZ5OBHU/xZNEWI/mjR3rPcSTCjb4VWz0iz8/vj5vCSI07
	NrYxKT8YpyO/GewDTXt6sR/4Khn2q875EZ50t0QhCc0WWuCxQ9hypZS+YKsuyau7
	cl/+ptGvmEsa7JJ1pWGh0+b8rEjWOwNcyZxoyjXeYBMqcS96sC0i5Cb7iNOxVUWJ
	kujpsruh4eIw26qmjxXL7LvwrrBbynND0gnBIgm6SAR4mKRorgGP4X9fsCbp+Kli
	ZXvv8O+sIAkRIAlowtI8DVlxLjXV15mo8oZKT9SaOf81mw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abwtj94cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 10:44:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8804b991a54so16314696d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 02:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762857883; x=1763462683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+gJidX2jSCTw9eZSYR/rAxIej1PUV2obwbP3TFa0zzM=;
        b=XYYFiDmPo1Qs5Q84T1jIOMUjGdwOS3GQjZOz/JzWosKQWbTqKm3ABZ/7ymX2adQDK3
         vNAt93xE8bgW9ljP4DHwwYUVucXHiRJWGTq99IQsYumJWlIZ/L+XT7NDfEWaHZ38ZBLL
         yfXyGv56pBYqHHlmXhD2VJ8WBQ0ACHbybW3QxiFxhCVuy3lMG/eoXajcGZ/oWR7BCKXT
         llDwJfQFWw4CGfTeLYQsZj63pfC4FgxmLxzgh8M1Ls1X35kVWOjNXoZIkgMgM3b9QFiH
         WY3Mv1Q7S9FwiWOVi6VueDme1b0pdKFrk7wbdRVotJJnDpWHMtE+o41X1rZhkxizUP/6
         PRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857883; x=1763462683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gJidX2jSCTw9eZSYR/rAxIej1PUV2obwbP3TFa0zzM=;
        b=NpS7AozbbpPzm/B/GtBRL6sbnahW9GWoURxipyuf0PQslRP823XXNH7C99M1sAfNsV
         Ami05DTnLwCcY6snRlUSkfSEr5pzK5hqdq5mqodB81augrdGxPH8M2HTBsuyTph9CTEm
         I24Kg3YhlqbfoUWWFcJ7sx14thBURsAoW99DOWJAdfnlasuCynBG6B9X3bR6DgP++l1v
         J1Bty2nFquCiT/0HloqKYNVpigCbwVTo9twiLuq/u9/qXgfmf1H54xPNUxZqEhLp025q
         Yb9cUuLmf/hlYgOnJI1NROQI5hSIgn6GxHpcv0tAbb0lJf9zJh8RhzjR5V4kiJtaV4+H
         DJtA==
X-Forwarded-Encrypted: i=1; AJvYcCXDlZDHyEGgxnbvIs/a3M66H9piA44dHbCveNbntwyXUyq5mvWw3kj68dv7I885jzce0UkIiWdKXKvkJd2J@vger.kernel.org
X-Gm-Message-State: AOJu0YzvT+Hfth0LNdwPaYPe/EFoXNPWUBBpBRmo4N6Hd7zzju6hIhq+
	wpqStrl7uYN+j0wqIWcrucH7wMVnaHy2EQ2UNHwlL+EvZ9oif0j3TjwGXx0s5AMOp5qEXcredkw
	G06VOr0J3b4BlGoHuydY24JpKcvhhQQ0RlAejyfM0Bph4colM2TdiLgUrWCgPRIMunPu1
X-Gm-Gg: ASbGncu1OjV/oHgKLTXtQOgWT3Tq3t2FPkJi4ua1IduEO0N+GZ7pGNOPKQzd7Fud5BO
	JysJAMQ4wj+q4LckT028Adl8AlpuUArFA1KAI+FiFwYxAkL5NkBev3qYUlwFVw8s+KM3Eog+WJR
	/tyqOfkm2aH+wwMhdjoWWcpdAm6txsm4XJgHoxUgxyn4Rr0ZzftmLJKPBnzMC6cDwxEBWU6tTpC
	HhhgVQr6v1AWmuDG3/oK6HMFOeIaiCn4dzZb7wBEbNt2ylS01YU/VJOqn7WNAN+poBrwh8221eR
	3IJHaQBePC5rKCLjlhgWnnbI/8ThjmGYZvorMYr1cOqNsm3BLEhCWimlSpuv2dA/WYAPfpf6Ipi
	/2dbTPKeSjnIonz3y2uX//J4ehoga7D1zQtaQLrYIsmEDQ8P040jKvcXEyDrCikGxmOO6ch2J4o
	+/8L5Z8pmvIuhQ
X-Received: by 2002:ad4:5d4e:0:b0:882:42e6:171a with SMTP id 6a1803df08f44-88242e619damr150475716d6.29.1762857882623;
        Tue, 11 Nov 2025 02:44:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAM+mG75Loc7VIPw8+rq7J3/vIHcL1Ua0krlGhv88BOq+sMjlUEwkZCEO/qmQc1KkRImTrhg==
X-Received: by 2002:ad4:5d4e:0:b0:882:42e6:171a with SMTP id 6a1803df08f44-88242e619damr150475456d6.29.1762857882152;
        Tue, 11 Nov 2025 02:44:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0dd168sm41817181fa.33.2025.11.11.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:44:41 -0800 (PST)
Date: Tue, 11 Nov 2025 12:44:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/6] Add support for Clock controllers for Kaanapali
Message-ID: <cl25p2tnh4stqxyaxfbuob2iaxb6f2nc6exvcobhpcrs77it4c@n3d4afm226fn>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA4NCBTYWx0ZWRfX7yayM11QJV9B
 V/qN7CaFKwW3R7RUh2d4APbqLFcA93tDy/q0hmYkhgGC1Rr35vbvjLzL3HqDEavGMe0grXFBC26
 9U1YLQ04LiUThRglKcQ30KWpeayQ//WhTIuga0uutzNmAZw4rCE3PXLowa1NN43Oj6dFDH47edi
 5FT12uCWwCHoyAIxkGPkYWLL63yiW/eZFZTZuBzZe1AECLeFytKb46TcdLOoS6RtAH47FUr0jb6
 GgqEWH9isOmUW37JJywV7wTUuBYsujbnnyWOw1fDxjM/BzZUe+1QQtyQiiz3coM/HnLr+Eu13Yd
 TS0tiE0DQ7ohKcHoWOhGOqNi1NIibZSdbDNt+7v7OpKjNsCoFqwF7ODVkTjt3ea3WUZDR1UC9+m
 tc6ESK/uI480d6NkgK0eUoIvwNT2pg==
X-Proofpoint-GUID: ndSLMDYe8vrzwdW0pZjvSzVZYFgO7KCS
X-Proofpoint-ORIG-GUID: ndSLMDYe8vrzwdW0pZjvSzVZYFgO7KCS
X-Authority-Analysis: v=2.4 cv=UI3Q3Sfy c=1 sm=1 tr=0 ts=6913139b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=nWbYhlpG0vUMga3LwYgA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110084

On Thu, Oct 30, 2025 at 04:39:03PM +0530, Taniya Das wrote:
> Add support for Global clock controller(GCC), TCSR and the RPMH clock
> controller for the Qualcomm Kaanapali SoC.
> 
> Kaanapali(Snapdragon SoC from Qualcomm):
> https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> 
> Changes in v2:
>   - Update the commit message for all dt-bindings to incorporate
>     "SoC/platform" inplace of drivers [Krzysztof]
>   - Add RB tag from [Krzysztof] for dt-bindings
>   - Split the TCSRCC to a new driver instead of reusing the SM8750
>     driver with offset updates [Dmitry]
>   - Update the new RPMH clocks to use 'clkN' convention [Dmitry]

This didn't happen

>   - Add RB tag from [Dmitry] for GCC
>   - This series does not have any strict PLL code dependencies [Bjorn], thus
>     drop them and will be added in the Multimedia clock controller
>     series. Drop the following patches.
> 	- Update the PLL support for cal_l
> 	- Add support for controlling Pongo EKO_T PLL
> 	- Add support for controlling Rivian PLL
>   - Link to v1: https://lore.kernel.org/lkml/20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com/
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Taniya Das (6):
>       dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Kaanapali
>       dt-bindings: clock: qcom: Document the Kaanapali TCSR Clock Controller
>       dt-bindings: clock: qcom: Add Kaanapali Global clock controller
>       clk: qcom: rpmh: Add support for Kaanapali rpmh clocks
>       clk: qcom: Add TCSR clock driver for Kaanapali
>       clk: qcom: Add support for Global clock controller on Kaanapali
> 
>  .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
>  .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
>  .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |    8 +-
>  drivers/clk/qcom/Kconfig                           |   17 +
>  drivers/clk/qcom/Makefile                          |    2 +
>  drivers/clk/qcom/clk-rpmh.c                        |   42 +
>  drivers/clk/qcom/gcc-kaanapali.c                   | 3541 ++++++++++++++++++++
>  drivers/clk/qcom/tcsrcc-kaanapali.c                |  141 +
>  include/dt-bindings/clock/qcom,kaanapali-gcc.h     |  241 ++
>  9 files changed, 3992 insertions(+), 2 deletions(-)
> ---
> base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
> change-id: 20251027-gcc_kaanapali-v2-901def0e1a52
> 
> Best regards,
> -- 
> Taniya Das <taniya.das@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

