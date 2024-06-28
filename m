Return-Path: <linux-arm-msm+bounces-24658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3C091C453
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 19:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFC301C22E0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 17:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5A31CB317;
	Fri, 28 Jun 2024 17:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pKlde5qG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C8E1C6896;
	Fri, 28 Jun 2024 17:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719594134; cv=none; b=JbblJ9modYEph3dZ5WxKW36J6Kd7BLbweEq79blceTfpePx941SjcLUIfxA9TNoNUHVjz6/AG13aOjMyTOYjjHTLw58+Kx0I9whJTicXT329DYxde1wJ+dUPTjbKyxIPesuqK6VzX7/mjPZ2mLN1DewVHW3dLa2oZ9Str95CKfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719594134; c=relaxed/simple;
	bh=vwFwTQV48aYpE6GXaofwnwQW04OlGBZebmf2i8Cjc6k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axa7TN/y5BrX8lP2YT1HrEPlMJC7cEYDVkOMK3G+gnV/XW+hei0lUnCE+j6/MCwnMziu9z1JUdOClT0Voq3cOJDPKT6G7ATldbXt3d7xXKnRC0BI6uYWa6G16g05M4sCCdDKcIAvpgglkV/GbicHER2hmU9U0/KL9hIRS63D0z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pKlde5qG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SBijb8030331;
	Fri, 28 Jun 2024 17:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T2iHfQgqBKB49Z7Ubgr9yl+9
	aU6gW0Oqr3pHdQRM57s=; b=pKlde5qGKFeSzkYl7XLDPqtEstCZ4Ar+h2eBkgcv
	iIQ6ldd1VD8pqHwBT8AYi3MF2Te45ZRbEsy4r5KJqn1OapkMKVnw6QPIXyuEpKFI
	AdAUho7TfseRBZ66HIabIcADzWuZnpharJxmwVixSptg9QCtD5iylOSJ8f5mteyE
	vwkJAb2bEwzRC+QKyrjnGQ1uiMa+S6ZTKiWGGYZzpsLTKACkkqKMFOQFoct8uz0d
	ISl69g+4vHWuuamJAem5D5/bid/PD5HFpn4BK3S1DGYvbbqj93S1gl+nxQmYfVkH
	310vW84BzWPqeWLFWPiQBS06G/c+qLH7Q9y0jKxMLY/ZdQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm32ag9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 17:02:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SH26ba022884
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 17:02:06 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 10:02:06 -0700
Date: Fri, 28 Jun 2024 10:02:06 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: <wuxilin123@gmail.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Johan
 Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH RESEND 0/2] Introduce ASUS Vivobook S 15
Message-ID: <20240628095747249-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MB07XhkiPxCkAR7hCDhOhs8qJyp5HE3Q
X-Proofpoint-GUID: MB07XhkiPxCkAR7hCDhOhs8qJyp5HE3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_12,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280126

On Fri, Jun 28, 2024 at 07:49:33PM +0800, Xilin Wu via B4 Relay wrote:
> ASUS Vivobook S 15 is a laptop based on the Qualcomm Snapdragon X Elite
> SoC (X1E78100). This series adds initial support for the device.
> 
> Currently working features:
> 
> - CPU frequency scaling up to 3.4GHz
> - NVMe storage on PCIe 6a (capable of Gen4x4, currently limited to Gen4x2)
> - Keyboard and touchpad
> - WCN7850 Wi-Fi
> - Two Type-C ports on the left side
> - internal eDP display
> - ADSP and CDSP remoteprocs
> 
> Some features which can get working with out of tree patches:
> 
> - GPU [1]
> - Bluetooth [2]
> 
> Notably not working features:
> 
> - Battery monitoring via battmgr
> - Orientation switching and altmode on the Type-C ports (USB4 retimer driver needed?)
> - Two USB Type-A ports on the right side (dwc3 multiport controller)
> - Front camera
> - SD card slot
> - HDMI connector (using a Parade PS186 DP 1.4 to HDMI 2.0 converter) 
> - USB4 and the retimer (Parade PS8830?)
> - Anything using the EC
> 
> Dump of the ACPI tables could be found here: [3]
> 
> [1] https://lore.kernel.org/all/20240623110753.141400-1-quic_akhilpo@quicinc.com/
> [2] https://git.codelinaro.org/abel.vesa/linux/-/commits/topic/b4/x1e80100-bt
> [3] https://github.com/aarch64-laptops/build/pull/103
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Please update with comment about fixing the makefile, it is v2 and not
RESEND. (don't send v3 now, but please fix in future version)

> - Link to v1: https://lore.kernel.org/r/20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com
> 
> ---
> Xilin Wu (2):
>       dt-bindings: arm: qcom: Add ASUS Vivobook S 15
>       arm64: dts: qcom: Add device tree for ASUS Vivobook S 15
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 613 +++++++++++++++++++++
>  3 files changed, 615 insertions(+)
> ---
> base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
> change-id: 20240628-asus-vivobook-s15-72a497863168
> 
> Best regards,
> -- 
> Xilin Wu <wuxilin123@gmail.com>
> 
> 
> 

