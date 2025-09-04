Return-Path: <linux-arm-msm+bounces-71990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD73CB434BC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 09:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FB091C80965
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 07:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE9512BD5B3;
	Thu,  4 Sep 2025 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDkYR0fy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5595029D287
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 07:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756972546; cv=none; b=KGxmLYBvLVH8o0PeSTALeWp4IoqsMtJS1pYoTsMNE7/ZRKd2i1TIkzvHQ/PZya7oFoyYhG+KeE8spWMrhuURpMbkzbWWED4iAqAszPU3zzFE/axUgGnBUp71bPpHeJp7ph6CczpQAdee15GB2aZdrZbTRfX/6pH+Xh4xvFVlYoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756972546; c=relaxed/simple;
	bh=GjGpCzyPiuSjGPyb9UPenD9KpTrvGljLZW3AXFjK5D8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DaA8EHezvBK5joiluAcHQwbCawSFa4fpkUvg4x9MDOgSpxzyNABJLvYxYuF97UxBoFe4qPCW2jtAMiWpOp5w1+WQxFH92M/2MR97x52acTAz8zK61cvxqcUDKPvKk056FG8HAhov3R3UmuUA6OTBrm25vMZI29MPM0vT5C5kdlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDkYR0fy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5840vvej020914
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 07:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6U8740q6b2q81UoWm1W0NI1456v8vFqKf/K5+7yws4=; b=oDkYR0fyAbdu0PrJ
	fAYQQGXB0VUxKHrsagJNiSy/tt+ErCQ8yfOIVDjnblYluOB1sQJBblFPh1pyTObl
	3+At74nYyQhEEgwB9By+cVSduKCGTj6kb1njHoPNCysCXEJB28ieSQz0Rtxy8uhW
	HLYaLvSjRqEl20JIgZWADRG7+KFou5LHZdK5wBUrWQkm/qO+ij6hUtT0S60rf6dc
	9jX55d+892YNfT09egIRDIXFqoJTYUBbUMAegf5qhaADvq06bWs3qNQevmzrdEGu
	MUdGb/3PS11r+y7rXlzD/mpRrlxgvXp0AkYy1DTWz3rXZ5H6Nbycwg92e/z8DQor
	isYrhQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fpj88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 07:55:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b471737e673so873297a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 00:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756972542; x=1757577342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6U8740q6b2q81UoWm1W0NI1456v8vFqKf/K5+7yws4=;
        b=ot/75hNVq9esBvJuMKX5cGswBR+SaBfwC/C3QHRv8+ralYXeUI+s7JBsLMpsDhDfBo
         5zIBOXwqOzcyztNx4kti7Xe1Pe77F0HTwdpWegbeScvV4+YAoTDtNP4JNOwDHBXbA8/h
         AJ/QrEwVtcc31eicAPYvfZnkLzDie08UGvnhmxrAKU6QGCW+nCpQqJm/46Iakka0Nl3A
         AhSfZMaIubAiGuiPsKVhuiGojemDt93QvoDI2OfT46zK0tpztWLy/7UWOGVwWhkZp59N
         LJ/Ufl+YItsNwRxRUhOEMsPnwHsi21mE42+SD/WL8savor8SgYCKsFsu7hCyuzZrSix0
         hOow==
X-Gm-Message-State: AOJu0YzBTKtKNIrDR4pC8P88fkNDuJkpdrhZtJ/owoFJoKm0nRSsQOO4
	8aTZljt+9v9s2n+xgGTZ+nyT+DILSpV0AVQN3vZItrOrxg7Gn+KT7Ohvee4irJI0m8p95QV1kRZ
	ROSJ0W9tQZNHxhGKDDLRsSNDPNFbqMOhywEoa46Qz1QsVytmc0/l9VTNdCBkEk5pO8DVo
X-Gm-Gg: ASbGncu8kSNMa5usMJD3E35XX/qMVswT7H4x98uniGoYQP7+5MvGWhcrcOxCtW6ogYy
	xS+RnF/ITgAGQ4NbLkX6y49BxW8JpdtFp7Naw+lI9JnEr8zHjv59iSSOCFHSXrT9mbU1yoZfhK4
	EM163wCnTrytxl+p8b3DK+c8yDamSI576h4Igd21qAJKv5QK9ljOY6SeWiRLfzWb9PEMztT3DB5
	O0Zprysz79CtNltsgVh6QCs51VYRGWbJdq7oAnQqNZoaOXGVDcwTxCmkst7yJMH/Kds/rxEGqu7
	QOvVuQrn/Oe4GZKwEJORQjNmPZh8FDkSMBtwtQVWHy/OIYooDc02drSAn3CmffNxJWXVQjkBTJm
	AoSLKhRW7Gvnsu+U+KpPp7nFWZ8bFOQ==
X-Received: by 2002:a05:6a20:7d9d:b0:243:b7af:b3ed with SMTP id adf61e73a8af0-243d6f8a47cmr24533918637.60.1756972541784;
        Thu, 04 Sep 2025 00:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEArKzYsjq88Az+VJss/WDpiv91njmABsN0YRt6Ut7vvdTj1OjZ5gqoJ6hpHtCKjVIZrEQwtw==
X-Received: by 2002:a05:6a20:7d9d:b0:243:b7af:b3ed with SMTP id adf61e73a8af0-243d6f8a47cmr24533858637.60.1756972541193;
        Thu, 04 Sep 2025 00:55:41 -0700 (PDT)
Received: from [10.133.33.41] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b4e27902dsm5386315a91.12.2025.09.04.00.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 00:55:40 -0700 (PDT)
Message-ID: <5bc0203c-21a1-4948-96ff-8eae844bfb93@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 15:55:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/6] Display enablement changes for Qualcomm QCS8300
 platform
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXxcJitlJvKT7g
 F6/rnJMn4umiv+uNWrx/etKgFvEUouufbMYJe5OlGZ1qbzx4c0XHThd/wGiWXyN8C/Vvgtr3APi
 L2cjnbGYvh3IAtz5o/WHBc/cxHkT+hu0TNgUpNVPXzKoEG41DoGslwkSipsX7Pa7XhPfKuAuffn
 RBJnUauL3SuibnaSDBTjjoCrAsaiyzE0hDMwMSwNy77rlHnSfOaW2Y1nr8fS75ZTEgpMnXlQa2V
 loUcspfTfMp6pg4gpTjg0FEA6T9PNob7RDhWnwLlP0LxXyZ8XfOfUzLKrUKUe7r3yX53G+bua41
 2JmNz5SHvvZlLkSfH/PEcXMXHa4KFA2EwjXgAtNmnHkvotUm31FJ5kPZqxwu5isyulR+CVI8eK+
 yvWkZ7JS
X-Proofpoint-ORIG-GUID: 3lvNM3XnfiV-xNPgPaLiCQ8T38wL7vXw
X-Proofpoint-GUID: 3lvNM3XnfiV-xNPgPaLiCQ8T38wL7vXw
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b94600 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=0Mr4oj-IvmkEL2bjxJwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038



On 9/4/2025 3:22 PM, Yongxing Mou wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> , Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
> QCS8300 target. It includes the addition of the hardware catalog, compatible
> string, and their YAML bindings.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
> Changes in v11: Fixed review comments from Dmitry.
> - Rebase to MST bindings V8.
> - Update the clocks-name for QCS8300 in dp-controller.
> - Link to v10: https://lore.kernel.org/r/20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com
> 
> Changes in v10:
> - Rebase to MST bindings V7.
> - Update the P2/P3/MST2LINK/MST3LINK regions in MDSS yaml.
> - Link to v9: https://lore.kernel.org/r/20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com
> 
> Changes in v9: Fixed review comments from Dmitry.
> - Updated the description of dp-controller DT binding.
> - Add new clause only work for QCS8300(one DP controller with 4 streams).
> - Link to v8: https://lore.kernel.org/r/20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com
> 
> Changes in v8: Fixed review comments from Krzysztof, Dmitry.
> - Fixed incorrect description for dp-controller in driver/dt-binding.[Krzysztof][Dmitry]
> - Fixed incorrect description for ubwc change.[Dmitry]
> - Link to v7: https://lore.kernel.org/r/20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com
> 
> Changes in v7: Fixed review comments from Dmitry.
> - Rebase to next-20250818 and 4 pixel stream series V6.
> - Add more description for the dp-controller dt-bingding change.[Dmitry]
> - Reorder the MDSS change and UBWC change.[Dmitry]
> - Switch to the OSS email.
> - Link to v6: https://lore.kernel.org/r/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com
> 
> Changes in v6: Fixed review comments from Konrad, Dmitry.
> - Rewrite commit msg in dp-controller dt-binding change.[Dmitry]
> - Optimize the description in MDSS dt-binding.[Dmitry]
> - Pass the sc8280xp_data as fallback in the UBWC change.[Konrad]
> - Add the DP controller driver change.
> - Link to v5: https://lore.kernel.org/r/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com
> 
> Changes in v5:Fixed review comments from Krzysztof, Dmitry.
> - Rebase to next-20250717.
> - Change DP compatible to qcs8300-dp due to add 4 streams support.
> - Add QCS8300 UBWC config change due to rebase.
> - Add 4 streams clk and phy in the mdss yaml.
> - Link to v4: https://lore.kernel.org/r/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com
> 
> Changes in v4:Fixed review comments from Krzysztof, Dmitry.
> - Use the common style for the dt-bindings commits.[Dmitry]
> - Update the commits msg for the mdss binding patch, explain why they
>    reuse different platform drivers.[Krzysztof]
> - Link to v3: https://lore.kernel.org/r/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com
> 
> Changes in v3:Fixed review comments from Krzysztof, Dmitry.
> - Fix the missing space issue in commit message.[Krzysztof]
> - Separate the patch for the phy from this series.[Dmitry]
> - Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
> - Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com
> 
> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
> - Correct formatting errors and remove unnecessary status in MDSS
>    bindings.[Krzysztof]
> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>    20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
> - Package the DisplayPort controller and eDP PHY bindings document to
>    this patch series.
> - Collecting MDSS changes reviewd-by Dmitry.
> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
> ---
> This series depend on 4 pixel streams dt-binding series:
> https://lore.kernel.org/all/20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com/
> 
> and separate eDP PHY binding:
> https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/
> 
> ---
> Yongxing Mou (6):
>        dt-bindings: display/msm: Document the DPU for QCS8300
>        dt-bindings: display/msm: dp-controller: document QCS8300 compatible
>        dt-bindings: display/msm: Document MDSS on QCS8300
>        soc: qcom: ubwc: Add QCS8300 UBWC cfg
>        drm/msm: mdss: Add QCS8300 support
>        drm/msm/dp: Add DisplayPort controller for QCS8300
> 
>   .../bindings/display/msm/dp-controller.yaml        |  22 ++
>   .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 286 +++++++++++++++++++++
>   .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
>   drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
>   drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
>   drivers/soc/qcom/ubwc_config.c                     |   1 +
>   6 files changed, 321 insertions(+), 5 deletions(-)
> ---
> base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> change-id: 20250818-qcs8300_mdss-a363f0d0ba0b
> prerequisite-message-id: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
> prerequisite-patch-id: ffeeb0739a4b3d310912f4bb6c0bd17802818879
> prerequisite-patch-id: cdc3f4515ab23a8b2ce719bbdbcb56043803d03f
> prerequisite-patch-id: 048b11765f49af4a728db1525fef1eb8ad48bf88
> prerequisite-patch-id: f0f92109d1bfffa6a1142f2aaecbd72a29b858c0
> prerequisite-patch-id: a8185cf3ddd85b9058691500b8dc0c57c8226e97
> prerequisite-patch-id: a389a2e4eca44bf62bb2c861c96596368be7a021
> prerequisite-patch-id: 09ec7f51de0a65c68c2c781750177017f32747ba
> prerequisite-patch-id: f76ab0ae189df14acc851fa52f8f8e8faed9a505
> prerequisite-patch-id: 983fc8a7bea459505c5b27db1a1ef7581936555c
> prerequisite-message-id: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
> prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d
> 
> Best regards,

Hi, maintainers:
sorry for the inconvenience caused. This series is missing patch 5 and 
patch 6 due to network issues. May I resend it? The missed two changes 
are identical to V10.

