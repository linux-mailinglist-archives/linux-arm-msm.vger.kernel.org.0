Return-Path: <linux-arm-msm+bounces-68259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F92B20051
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 09:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D328E189B658
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 07:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7942DA762;
	Mon, 11 Aug 2025 07:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VapAIphb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435572DA753
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 07:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754897420; cv=none; b=sWz3nIWdy/QkN4brB55ETGqpt5jXvpF7uhuZo1KfeBI9JiObUtmFOIWHzuE6K2Ei2RcL58MKFZz+a188P9cfOTqJk1YLgf+r0587xoLKTxosWcLS/0jahJ9OKMTwjWCe4mdCaFkD+g7IYsD9PdfgS2u/9cyPSG308jqEjgwCuc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754897420; c=relaxed/simple;
	bh=lckde+jMQk66xn8OaUk0PP30d4mhLqwl/Duo1sMYROs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=batPH8xMltYntSGb+1QNKWILvbq+F0hCf55k9Xul80P3SOFQga6QdolQ8E3dz/cGVW/TMHxYmOM/hR38eID1yyvTuo2O8uWhKfw6hMkqXJjf/KV5HWL1nuRw/AWQTc4ihIs0NhmtQ/EvNaVOp2DxcIc+UYR9QYOWBfe6ebR0sEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VapAIphb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ALfUF7024133
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 07:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OcP8VyIXvYe2IEmI7Z5YRpFJhorfq3DAeG+V0H/cwMw=; b=VapAIphbd8bN8TYF
	KwQSuuSb3hiRYQTYuLISG6SZfskrWNw6Y2pgFpEbB6BBiDhnOzKFlZIXPQE7x91f
	yiCK8qaiHN4f7Z/ZBBc8IxtiMo0KpinwBS1Uj+uujrvhAuHJy2yJjmVN6m674Q7l
	fVm98d+K1AYJsop9feoQeqGixCsh7tYiVlHM/b04Oq3K6NS77sreOqYBjJg5mmTm
	WmrYuaB/3Zt88OHfrkMZFNL/u1tv49W9ugzONqGiVbYGe35EH4ugRmwRbZ2SemuR
	m6haRxxUuP8MPAa9zo7icgn36bIc/AhoamaKy2MA7R6VqbFEz1Y2k7A+OL9fzPdO
	T4jqXQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dygmbe8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 07:30:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76c0039e0f6so4275191b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 00:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897417; x=1755502217;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcP8VyIXvYe2IEmI7Z5YRpFJhorfq3DAeG+V0H/cwMw=;
        b=NKhINtf4H66Fh9bSTCuAkUmL250mqic6RegjouZ+rTCnidmSZ3RZJTDb4F/i1rIh5z
         A4HVprUVYt5FHGyf44Pgv51E3QnVQaRam2i2dGoE14dlYEe4KKYrC8xUsWIeaSj9mH2V
         /T9DcMBPv7VgANaY/Rb3BDzlDWwSVMOcVJoNiiqOfpxuHE48SfhoisqQkii6Zc0PD885
         Yfgh0yjbRy6/ibkJ0Y56ZNB9OTjl542JyH3iBt2NZBUi3vwc0rqM7yy6yQwmhLqCAVBO
         fYFaoHA8v5PvcoDSnP4xVayvAk4qhzgF02y7bQuwgsbFkWp8DyGn3+xgy1001aWPP6Mf
         ZRLw==
X-Gm-Message-State: AOJu0YzNlWEDfHgDjoq9OzBzNJJtndGztDYcDEtETm0pyR75de6vlnjY
	Hzkprwk7AxLGd2dEsg6UPuZoDFjS/HKBQPjh8Lpf+iaX1331pTBMnhH1mFvwI4CQZTkreWvSKKL
	tDADUvuZErXACLL3fwIAm9s6x6U4a2b/O14NKh8cRRZKzfFx3jSql+OLAI4v8e8guZsvo
X-Gm-Gg: ASbGncux22YFcS61dfeg2ye4nMazy9gtrAPXftfg62jQHVG3KcIHhuE5wsRNPLTqGOA
	EtQG9HLZY0xEOtBWUTTX/wrQ8MnYY1ujVOGeZpTyh1LYw1Hsh8etPGUY3LtxGNwgAGDiOKfqcEt
	OvqKZ0SU/rOwdZoXzVvzvmM+VUvJkV1qU0UcssMG/18ecuJEEeQJc7sCKmkZNWztvR37UX7mQf8
	GWmegoxsu98SY2yP/Od/6PwHQnIemZ4Suc8ZKSZsQ/i5UdDnBq/U0cCKPVynzzav4k+9OWRSqGp
	HEJjBt2YclrYQbPEsYWLEQNJ7Yc0m2lk/a+pFPRb8BVfmHbiX2+/N7V5eMWgvjIQN00BL+DovAq
	UkWevhC7VX3NJa56XyaQRrjgUyJBd
X-Received: by 2002:a05:6a00:b85:b0:76b:c9b9:a11b with SMTP id d2e1a72fcca58-76c46088bc4mr19460942b3a.3.1754897417500;
        Mon, 11 Aug 2025 00:30:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcltBUJ0g3R1fj2EUKLW6qYXdOXJ4NHnBg4nb4hNe0riHVIhAk6EPyUknxW89lXsGXleL63A==
X-Received: by 2002:a05:6a00:b85:b0:76b:c9b9:a11b with SMTP id d2e1a72fcca58-76c46088bc4mr19460907b3a.3.1754897417066;
        Mon, 11 Aug 2025 00:30:17 -0700 (PDT)
Received: from [10.133.33.12] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfd8ebbsm26141096b3a.102.2025.08.11.00.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 00:30:16 -0700 (PDT)
Message-ID: <e9e77527-202c-411e-add2-2af9d82b8e8d@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 15:30:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] pci: qcom: Add QCS615 PCIe support
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, jingoohan1@gmail.com,
        mani@kernel.org, lpieralisi@kernel.org, kwilczynski@kernel.org,
        bhelgaas@google.com, johan+linaro@kernel.org, vkoul@kernel.org,
        kishon@kernel.org, neil.armstrong@linaro.org, abel.vesa@linaro.org,
        kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250725112346.614316-1-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
In-Reply-To: <20250725112346.614316-1-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzNSBTYWx0ZWRfXzyscAFOv/2jl
 ab62vNt55lK3/M+l9IMURYTZL2E+eaGxCH/kftWfj5PbolCrYighOzixvg8bgCZo4PX9s498mhA
 pGCivwqV3ZcxFSSKuJ/Jwkpj70y/LEpjB7vBFAnmqAQQUKJ8WnqGq9Xs+7C6TMUvOVwTY1Ay4SP
 VVXNutJuSJSF3ClaSGHSlscCIOamjeBzuGCH545JxLtObkuLU/i5bo4CcGSvl46kt+rZcpsgjQz
 5E3nIKbmGflxB2YsXparL9mAzNrzYFg+G0hgH6bYVhy3yuHHBu8B467I7fDkbx7NJ3P6OGJ1r6M
 R8VIdZi2dF2sFKIwllK75ZoBbmEF3OQ4x1gNaNu0oxydjVGKZJ0ZyueOnJw63qPHzSu+OVVMUxH
 3KB/Os1A
X-Authority-Analysis: v=2.4 cv=FvMF/3rq c=1 sm=1 tr=0 ts=68999c0a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=0rveLjV9VWli9pvRdbwA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Ilee58uIzLI7hkumqF_PCyYTuAVUZjzm
X-Proofpoint-ORIG-GUID: Ilee58uIzLI7hkumqF_PCyYTuAVUZjzm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090035


On 7/25/2025 7:23 PM, Ziyue Zhang wrote:
> This series adds document, phy, configs support for PCIe in QCS615.
>
> This series depend on the dt-bindings change
> https://lore.kernel.org/all/20250521-topic-8150_pcie_drop_clocks-v1-0-3d42e84f6453@oss.qualcomm.com/
>
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---
> Have following changes:
> 	- Add a new Document the QCS615 PCIe Controller
> 	- Add configurations in devicetree for PCIe, including registers, clocks, interrupts and phy setting sequence.
> 	- Add configurations in devicetree for PCIe, platform related gpios, PMIC regulators, etc.
>
> Changes in v9:
> - Patch rebased
> - Link to v8: https://lore.kernel.org/all/20250703095630.669044-1-ziyue.zhang@oss.qualcomm.com/
>
> Changes in v8:
> - Fix scripts/checkpatch.pl error (Krzystof)
> - Link to v7: https://lore.kernel.org/all/20250702103549.712039-1-ziyue.zhang@oss.qualcomm.com/
>
> Changes in v7:
> - Add Fixes tag to phy bindings patch (Johan)
> - QCS615 is Gen3 controller but Gen2 phy, so limited max link speed to Gen2.
> - Remove eq-presets-8gts and oppopp-8000000 for only support Gen2.
> - Link to v6: https://lore.kernel.org/all/t6bwkld55a2dcozxz7rxnvdgpjis6oveqzkh4s7nvxgikws4rl@fn2sd7zlabhe/
>
> Changes in v6:
> - Change PCIe equalization setting to one lane
> - Add reviewed by tags
> - Link to v5: https://lore.kernel.org/all/t6bwkld55a2dcozxz7rxnvdgpjis6oveqzkh4s7nvxgikws4rl@fn2sd7zlabhe/
>
> Changes in v5:
> - Drop qcs615-pcie.yaml and use sm8150, as qcs615 is the downgraded
>    version of sm8150, which can share the same yaml.
> - Drop compatible enrty in driver and use sm8150's enrty (Krzysztof)
> - Fix the DT format problem (Konrad)
> - Link to v4: https://lore.kernel.org/all/20250507031559.4085159-1-quic_ziyuzhan@quicinc.com/
>
> Changes in v4:
> - Fixed compile error found by kernel test robot(Krzysztof)
> - Update DT format (Konrad & Krzysztof)
> - Remove QCS8550 compatible use QCS615 compatible only (Konrad)
> - Update phy dt bindings to fix the dtb check errors.
> - Link to v3: https://lore.kernel.org/all/20250310065613.151598-1-quic_ziyuzhan@quicinc.com/
>
> Changes in v3:
> - Update qcs615 dt-bindings to fit the qcom-soc.yaml (Krzysztof & Dmitry)
> - Removed the driver patch and using fallback method (Mani)
> - Update DT format, keep it same with the x1e801000.dtsi (Konrad)
> - Update DT commit message (Bojor)
> - Link to v2: https://lore.kernel.org/all/20241122023314.1616353-1-quic_ziyuzhan@quicinc.com/
>
> Changes in v2:
> - Update commit message for qcs615 phy
> - Update qcs615 phy, using lowercase hex
> - Removed redundant function
> - split the soc dtsi and the platform dts into two changes
> - Link to v1: https://lore.kernel.org/all/20241118082619.177201-1-quic_ziyuzhan@quicinc.com/
>
>
> Krishna chaitanya chundru (2):
>    arm64: dts: qcom: qcs615: enable pcie
>    arm64: dts: qcom: qcs615-ride: Enable PCIe interface
>
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts |  42 +++++++
>   arch/arm64/boot/dts/qcom/sm6150.dtsi     | 138 +++++++++++++++++++++++
>   2 files changed, 180 insertions(+)
>
>
> base-commit: d7af19298454ed155f5cf67201a70f5cf836c842
Hi Maintainers,

It seems the patches get reviewed tag for a long time, can you give this

series further comment or help me to merge them ?
Thanks very much.

BRs
Ziyue

