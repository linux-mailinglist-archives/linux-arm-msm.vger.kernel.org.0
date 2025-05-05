Return-Path: <linux-arm-msm+bounces-56767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C61AA9022
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEA487A1B97
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 09:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29FF31DED49;
	Mon,  5 May 2025 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wk/2+gmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF9170A37
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 09:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438820; cv=none; b=dBOROhJlLzH3rtLJNgm7e1mgWLeroCNeKeuIQMa/TVtLr5XEzT0SEFbbTEQ7ubYVu1dpJnKopxu7W0BXFtH5H4rhTS5jY9QZSiSz+5a9Xkh5D76AhTNguS8fkQca1fSG1vIvGv+FI+XF3y4JPqINEzKYhFlJLbAwfYD8GuMXUsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438820; c=relaxed/simple;
	bh=H9jMukHJdPSZlcGNf5Jwgc1yMCgTBWLycd8M56kK8Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bP8QILvgBTWHfe/ZL506cNLfeoonI6D058E2VZXKmI1kr+YbiLMXtTencAtOcE72A1mL+kZoX8IxOIsfRIQkWbfXTyhR+DhZwheh2i5gIAiSs6gbdYTbqnwCmtReIuF9o9k9BRhNxpb4aa8NX8RJJEXG2/Eg+c2hJD9G8bBUf20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wk/2+gmc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NQKjS015626
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 09:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w7RU+ij51cnyT8d/3rqZU8Xc
	2V1EFU/KaR2DDyIFqE4=; b=Wk/2+gmcV59wvQtbyQG63pVEADs5M2tNYSXLIEsU
	AbcdbWyMK0k0LDqsPY3Bhdn6E0LNXz0kkbV/6qR1Eo5jgd8e1jk0GVdYQladusZR
	9oD5shPxcP0YYLBUS4vw20sdAZCbw+FfxvYTHw7ajPNFIvLHlk0gaPm0/WwceSHI
	wETRJfQ+dHgSshjqkUvqYUmvIjrdk9TAfXwWS0PSb9XyK6zsuJA7gD4OW02ckTin
	L87ZGq40q1XKHC9C0ARkGGihkFYPUTBsM+5fR5FGyfeDKpeq6jLTXZA0Ep141jT3
	Y21o6RcAP8mHe4tD/G4Npr/vf7X4C83aB17MB9iTzei7iQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfkka6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 09:53:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b94827so686275185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 02:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746438816; x=1747043616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7RU+ij51cnyT8d/3rqZU8Xc2V1EFU/KaR2DDyIFqE4=;
        b=SD+300lLeuev4FV2ZSf/w7DlI8jyFUomuON0gvRqE9waglIRke11iUiRKaoqz0lk5q
         jJFfbPm+/+YHRxR+Lwdjwb0gXI4L/aSIq5Vkwbpun+ueMu2CplcAQYg12U9OkSG1/2ak
         UZ1AMCpzukXfvXSbLDTxWMYFTmn+wE+FKxC7cuuesp9JCXG3VVsrDbUKd1fLlFplBR7S
         8ayljbiPiapNS+5FcHGgVf9ifIZ2jUWUcwhHKNArEm7lrRFxc4QcdCB4f8YjZHvUiFG4
         Yi12M3BleB4YR+YgZvXG/w2DpZ7zzCWtHi7zFYAQH/OIaRx4eobIoajU4KdvsdMi/UYF
         P3Vg==
X-Gm-Message-State: AOJu0YxpHtHuefyikrPYLGZfeJrARk1ERCQkOrcBS2jMcQajphuN214f
	UHqrtqTiVT35rxZTVqswHaF0juMECJdLx9DAsHfw17B01Gotvx7UNsNSov8nnPIZHGqErCFEeFO
	Zxx74zr9Vf9qlu5RQa97BkLFD/BiKxJlRBQd2QX3j3f+0V/zh0ydUIOzpQuDgXgjrVIXOXBn+
X-Gm-Gg: ASbGncsczZvQOxg2DZQ97u8lpwuy0RYYYFz6IUx+SuFv+dFf/5Afuqr4gWaVT3+//9S
	uggg7EsPLcJg5fAfpZGTuXW6WOvMj6E7Hp2SCJwRvT/nePUrD5kesfAR7l+b3/fNYibnuD4mUS7
	8Y+W2GNzqn5qCvXs7Iv1zleDOvThnBEPeJVLpjWELaYBWCyDbl2PcZd+TzNpOS4o7Lnj7eRSUVZ
	5Sy+lQSTjU5WbyPr0K65/pB+tMEZdcZe9XZXeYoF63qgQFDa6CEI14Ht3nVm3XMzgrrLPsmE3Tt
	xepQMcorlDM7cBzHIj3XCDpgM87ci+BHDpNFqbV7EZ/yAnHW/I9eRqRYRjrXrhI+rEcOT7TExqM
	=
X-Received: by 2002:a05:620a:44ce:b0:7c5:3b4a:a61e with SMTP id af79cd13be357-7cad5b384a1mr1400070185a.24.1746438815914;
        Mon, 05 May 2025 02:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4nSiBTxb3IhP9Q2xiL9GQgS/oQXIljveihA1O1seCSBGBXnW2ydcuIUmZWFs6RCr82a58yQ==
X-Received: by 2002:a05:620a:44ce:b0:7c5:3b4a:a61e with SMTP id af79cd13be357-7cad5b384a1mr1400067385a.24.1746438815544;
        Mon, 05 May 2025 02:53:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5594sm1641909e87.87.2025.05.05.02.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:53:34 -0700 (PDT)
Date: Mon, 5 May 2025 12:53:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v6 00/11] Add DSI display support for SA8775P target
Message-ID: <gnmpt7evnmf2y7qu4o7pslg7cwhzxp274ky45drkgfxwpajbhs@bh4szrlfbnhr>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
X-Proofpoint-ORIG-GUID: tZCvZPA0oYCA8xOKGNXq7Tclw1TOLwwe
X-Proofpoint-GUID: tZCvZPA0oYCA8xOKGNXq7Tclw1TOLwwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5NCBTYWx0ZWRfXxx6ZTX+GqB9a
 qDqmh5BdaHJsGIfRBMwRcyOwKuKtDWCxfyXZ/P8p8KoR172pJPUtSARTuAYH22egNdmJqT3T04s
 jZdivQsxAtwZPewK2yUijUtmag8CBR5oWtMVwJTlBTZ0wNxwzL3nQN9nKXo4hJx2y4BR091WFxw
 m1rnSlKx8HICovtSklplPu3nMF/J25yFAwF09B+TgnlrqSPVWZHix8xzkabV9b6Sq5EiHoTB4E6
 tmW0JNSipIqUwDpGW2wz3KDXwn+D58cofAh4HGl0Z0un6DICLw5HIKZlh91NHABXQ+hCzCPIX+E
 6iQsSjuBezRvOIg/AyatUS+6NAXU6NwOSydwTO8wOzHKs46ta8poc2qec4e//5Qf9TOzbcPF6bV
 1fbYTwRINo6wlEWSyJaTUxygFejIKjQ7drzOciZJKzmRWC+F/vpSXk2oKIGzFEMlxqAp8hoJ
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=68188aa1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=2aRMNYBirawqYizlNqkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050094

On Mon, May 05, 2025 at 03:12:39PM +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 
> ---
> This patch depends on following series:
> https://lore.kernel.org/linux-arm-msm/20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org/
> (ARM / arm64: dts: qcom: Use the header with DSI phy clock IDs)
> 
> Changes in v6: Fixed the review comments from konard.
>     - Added the reference voltage in patch 7 for vph-pwr. [Konard]
>     - Patches from 1 to 5 of version 5 of the series are accepted.
>       So removed from here.

Now patchwork instances will treat your series as incomplete. There is
no need to be that fancy. In future rebase on top of linux-next (you are
using linux-next as a baseline, are you not?) and post remaining
patches.

Please don't repost anything now, I'll probably pick up anx7625 patches
today.

>     - Link to v5 : https://lore.kernel.org/all/20250424062431.2040692-1-quic_amakhija@quicinc.com/ 
> 
> Changes in v5: Fixed review comments from Dmitry
>     - Added reset gpio for io_expander(tca9539) in patch 7. [Dmitry]
>     - Updated the commit text of patch 10 for eDP configuration. [Dmitry]
>     - Link to v4 : https://lore.kernel.org/all/20250417053909.1051416-1-amakhija@qti.qualcomm.com/
> 
> Changes in v4: Fixed review comments from Dmirty, Krzysztof and konard
>     - Add only single compatible string in dsi ctrl pattern properties
>       in patch 3. [Krzysztof/Dmitry]
>     - Move the io_expander RESET and INTR pinctrls from i2c18 node to
>       io_expander node in patch 7. [Dmitry]
>     - Remove the gpio-hogs from io_expander node, as we are already
>       configuring them under anx7625 bridge nodes. [Dmitry/Konard]
>     - Updated the commit message based on hpd_enable() and
>       hpd_disabled() recommendation in patch 8. [Dmitry]
>     - Split the patch 9 of vesrion 3 into two separate patches. [Dmirty]
>     - Updated the commit message and commit text in patch 9 and 
>       patch 10.
>     - Link to v3 : https://lore.kernel.org/all/20250404115539.1151201-1-quic_amakhija@quicinc.com/
> 
> Changes in v3: Fixed review comments from Dmitry and Krzysztof
>     - Added qcom,sa8775p-dsi-ctrl compatible based on the set of clocks
>       which are associated with it in patch 2. [Krzysztof]
>     - Drop the blank line and add contains instead of items in pattern
>       properties of dsi ctrl and phy in patch 3. [Krzysztof]
>     - Updated the node name from anx7625@58 to bridge@58 for anx7625
>       dsi-dp bridge in patch 7. [Dmitry/Krzysztof]
>     - Updated endpoint label name for input output ports of analogix bridge chip in patch 7. 
>     - Check the DP or eDP confiuration based on the aux node in patch 9. [Dmitry]
>     - Link to v2 : https://lore.kernel.org/all/20250311122445.3597100-1-quic_amakhija@quicinc.com/
> 
> Changes in v2: Fixed review comments from Rob, konard, Dmitry and Krzysztof
>     - Added additionalProperities in dsi and phy patternProperties in patch 3. [Rob's bot]
>     - Updated example in qcom,sa8775p-mdss.yaml of patch 3:
>         - Added port1 and port2 inside mdss0 ports.
>         - Renamed dsi ports from mdss_dsi0_in to mdss0_dsi0_in and mdss_dsi1_in to mdss0_dsi1_in.
>     - Updated the init load value for vdds supply of DSI PHY from
>       150000uA to 48000uA as per chipset power grid in patch 4. [Dmitry]
>     - Updated the init load value for vdda supply for DSI ctrl
>       from 30100uA to 8300uA as per chipset power grid in patch 5.[Dmitry]
>     - Rebase the series to use the header with DSI phy clock IDs to make code more
>       readable in patch 6. [konard]
>     - Added the interrupts-extended in patch 7. [konard]
>     - Fixed the warning from DT checker against DT binding in patch 7. [Krzysztof]
>     - Changed the connector node name from dsi0-connector to dp-dsi0-connector and dsi1-connector to dp-dsi1-connector
>       respectively in patch 7. [Dmitry]
>     - Added the vph_pwr for anx7625 vdda10, vdds18 and vdda33 supply to fix the warnings from DT checker in
>       patch 7. [Rob's bot]
>     - Addressed device tree comments in patch 7. [Konard]
>     - Squash the DT patch 8 into DT patch 7. [Dmitry]
>     - Added hpd_enable() and hpd_disable() bridge funcs in patch 9. [Dmitry]
>     - Update hpd detection bridge op flags logic based on eDP connector in patch 10. [Dmitry]
>     - Link to v1 : https://lore.kernel.org/linux-arm-msm/20250225121824.3869719-1-quic_amakhija@quicinc.com/
> 
> Ayushi Makhija (11):
>   dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
>   dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
>   dt-bindings: display: msm: document DSI controller and phy on SA8775P
>   drm/msm/dsi: add DSI PHY configuration on SA8775P
>   drm/msm/dsi: add DSI support for SA8775P
>   arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
>   arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes
>   drm/bridge: anx7625: enable HPD interrupts
>   drm/bridge: anx7625: fix drm_bridge ops flags to support hot-plugging
>   drm/bridge: anx7625: fix anx7625_sink_detect() to return correct hpd
>     status
>   drm/bridge: anx7625: change the gpiod_set_value API
> 
>  .../display/msm/dsi-controller-main.yaml      |   2 +
>  .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 181 ++++++++++++++++-
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 183 +++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 186 +++++++++++++++++-
>  drivers/gpu/drm/bridge/analogix/anx7625.c     |  34 +++-
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  18 ++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  27 +++
>  11 files changed, 624 insertions(+), 12 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

