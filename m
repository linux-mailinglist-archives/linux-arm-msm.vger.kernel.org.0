Return-Path: <linux-arm-msm+bounces-60464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F91AD003F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 12:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D71716FE9A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 10:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505DF27F75A;
	Fri,  6 Jun 2025 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/8NzpW0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A33538FB9
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jun 2025 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749205077; cv=none; b=jERR9mpFeKS+xgjoKJ8X49v4BuhU1TPSCj/yoVBYAhLXZkagqUJJcQXc4L/uz/Nv46R7qmcMRnSybW5zQFaJvYbsw6BW6msySFcC09LUKPuwl1lpUEHMjyq+/S9u8LY0+q+0oA0E9k8LWHxFRI3UDtJ1Mpcob0pFfwkkZT2DzAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749205077; c=relaxed/simple;
	bh=SVMCfylbwM5vuiB3Wx+PhHek76Iz+RwCcFIRJVgYp/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdXeSQs80JGqZ4/4QXM/U8eoqg+2SE9Glhyj0IxoGr68ji0ARI5WP2UwWvdUTugaYS/oFKIzZ7HxaS0A3ivzTSFJcwqHH6yNPcQr8xA0wc4qzKpNXbb+kBZ/FjIOAh7+TywzXvjMAylxaNmLKdCe3pdA2T9Ik653V1Oe/jts+S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/8NzpW0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5569iqLJ030292
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Jun 2025 10:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MUm770nsjTk7RKaqGJXS/UXM
	bcC3CLIfXaIBHht8qoo=; b=W/8NzpW0F9AfIenOSQKcaHAtJd6pwGHnLQ78YdyZ
	VRa0/MQkCsHkOd05mCswdst64V2qpJjZbOf0Hqh3w1gjcq4siRG8fCEIn3blroMS
	AkU6oTlRt+c8EZI67XOllofobWQ7GAizeV2l0rhhTYLVFLBgoR9AeS+wYaGtjIZs
	GKv7HFBC3/J0UBIqyRIUkIwcTf9VnkN80hEc31kIUThXYYeJaXqWN7oUSgKMSGQG
	V0VvQfcTJUMkssvLnMV5MO337dGkbpNd8wFQom6S+aZeqHf/JYdAaNeTDY8zq3mM
	rofkJBm+IznBjcgn34id9RcF4n79GuZ8Thl6QmmicpyZaA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be87yyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 10:17:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23505adcac8so18249115ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jun 2025 03:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205073; x=1749809873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUm770nsjTk7RKaqGJXS/UXMbcC3CLIfXaIBHht8qoo=;
        b=Y/iyznVCFLOrHxvS575ketPVrt3P06xubb6Y2Zuln9bjCFOav6uToaYmMquqHQqLz4
         cFYpTBGbk5gs8FQW/8D3EZphCBxqIQRrANjWgBHJhgD9nkYFjVswLfmhpVtwG9L54HSn
         wEh/koq4wA3t0hNwmps7eqnJjZauf8U5/zM5XRYYalOdsKXmVCGxSETKN1uyPnKVnTfD
         ku2RwX4Z4I1Qgz0hZ3xflAWG01UtB9qYssrF0t3AzJ2agq2tQSwCy6jfvAexlTV2cvEX
         3kbYdP4k1w5sVDcFwUvrglvmQAC4uLaZUGKOt3ylFZvGBSR6s59XZSOAnPzYldTY1VG2
         CtFw==
X-Forwarded-Encrypted: i=1; AJvYcCXoiAeF0M+EhlbTjFcEwvj467XXs9O72l+dav2MnIJoIaxAwoA2t9U7XKtW3wtIurPADql0VpV9zOyML7pY@vger.kernel.org
X-Gm-Message-State: AOJu0YxawNv6Cfv7Lv12g/MdA0705Gis23pady/SRVuXZXS2GXDEKXQj
	r+kL1iadqvSdQyvNVIWEI7W9un/YSBqLdduczUo2qDwEpRnmGTT3yezMUMvDbRIfV5i5Q231SGe
	3jLQPMOo54K5iKfg2H1FhaFz2PX4svbgkIfL4Nk6DF0Qo1+ZF95dv41O4crB10WQYmDyD
X-Gm-Gg: ASbGncuGsoHqjBcXK83T18R+5+YYyBJCa9hNhuWgserUnmVYD0fY8baJ0cDjQA8PyLd
	/fon5J5t8TMc05Ufv+HA2MdnS/xsa8/bA9/JsqjIJP42gBrKjBbFz7Bnz0UYAy/ZgpLpJT2mag7
	fZ41sb9VA5nSnuVYrvmB9QYSOCuRjnVKgQPWHr7Uau7G3kZMMoL0uxA7zDPjDdISix2CLeUAjfT
	C2oUcpJxtK0lwmj59dr/52ZVx9pTokQjb+Cz3R6TMwqTpz0qv7I/9H7vXvHPfcz6lPB2NHfuF/T
	eNvKGf7+6Iq6GroF+1X0abMkpdJqyIbNb8mt90fql/+mxmThQpWsUFhcJ6yluSncM8RXEw==
X-Received: by 2002:a17:902:e5cf:b0:234:d7b2:2ab4 with SMTP id d9443c01a7336-23601d038c2mr38586495ad.17.1749205073610;
        Fri, 06 Jun 2025 03:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWEq5utuN+xciTxdEM9oY6Q/JAcry9JQaMjmy2DyusLiUkQ5pFcrFEA1HGQcbYN9+4KF154A==
X-Received: by 2002:a17:902:e5cf:b0:234:d7b2:2ab4 with SMTP id d9443c01a7336-23601d038c2mr38586135ad.17.1749205073233;
        Fri, 06 Jun 2025 03:17:53 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077e9dsm9466565ad.1.2025.06.06.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:17:52 -0700 (PDT)
Date: Fri, 6 Jun 2025 03:17:50 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        quic_cang@quicinc.com, Johan Hovold <johan+linaro@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v4 5/5] phy: qcom: qmp-pcie: add x1e80100 qref supplies
Message-ID: <aELATuLue/Vs8lHz@hu-qianyu-lv.qualcomm.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
 <20250604080237.494014-6-quic_wenbyao@quicinc.com>
 <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEBh2xHu3QDtUrxe@hovoldconsulting.com>
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6842c052 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Kn45tV52aVggcf7Ks3EA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=xwnAI6pc5liRhupp6brZ:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ia7xHNMbWK6Ju_8IRZ1yzECdqNq9umat
X-Proofpoint-ORIG-GUID: ia7xHNMbWK6Ju_8IRZ1yzECdqNq9umat
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5MyBTYWx0ZWRfXyBcbazjyI7+Y
 7oHQRogEBJloyfsdJXkc5mKPnIGAi46+cDi5BQBDFKpiGukujE96xZj7TUPSREbDlEP4B4EuZWb
 fBGLNA7xtKM7z6vZzzhasW2/EYij8wkP17vd4dRFnfx3owHR3c2/Po9sMTy4IOsDyx4Ttp6yMVx
 EU0pfBmdhs10PEqdhatpObTx6be5oGicYv97trQMxUydjVCqX1xWYAtFQ6SJUpuQbtpof6Yl5zK
 pweA/41Yxo7X6QM87GUffjYxmeLV1hnye0ekEOxT1f5GRWRS5mpdHLboYHMQMLv8ZdXRlYW+pKI
 oGuAoCH9CrHBUDQO/v+Nioqkp0JeSWSUjwNREuQUOzDyi+oal2HP5vUKrTCVgUM+NcZ8WKS0xGU
 nBv/Di2y/0rXzZfNW6AqdvgwwAF+yXyVhq7jP5RTBfG+HM/nRNs+IKm4aCpmUCKjsah5xJva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=997 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060093

On Wed, Jun 04, 2025 at 05:10:19PM +0200, Johan Hovold wrote:
> On Wed, Jun 04, 2025 at 04:02:37PM +0800, Wenbin Yao wrote:
> > From: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > 
> > All PCIe PHYs on the X1E80100 SOC require the vdda-qref, which feeds QREF
> > clocks provided by the TCSR device.
> 
> As I just mentioned in the thread where this is still being discussed:
> 
> 	https://lore.kernel.org/all/aEBfV2M-ZqDF7aRz@hovoldconsulting.com
> 
> you need to provide a lot more detail on why you think modelling these
> supplies as PHY supplies (which they are not) is the right thing to do.
> 

TCSR_PCIE_xx_CLKREF_EN is not always in TCSR, they're custom
bits to enable pieces of the distribution network. We always classify them
as "TCSR" even though they're not always in that module.

So even if we put the QREF supplies in tscr device tree node, it still
doesn't describe the hardware correctly as the hardware itself does't have
a unified structure.

Since the TCSR_PCIE_xx_CLKREF_EN is only required by PCIe, why can't we
model these supplies consumed by TCSR_PCIE_xx_CLKREF_EN as PHY supplies,
treating PCIe PHY and TCSR_PCIE_xx_CLKREF_EN as a whole.

> Also please answer the question I've asked three times now on how the
> QREF supplies map to PHY supplies on X1E as no one will be able to use
> this binding unless this is documented somewhere (and similar for other
> SoCs).
>

PCIe3,
VDD_A_QREFS_0P875_0,
VDD_A_QREFS_0P875_B,
VDD_A_QREFS_1P2_B,

PCIe4,
VDD_A_QREFS_0P875_B,
VDD_A_QREFS_1P2_B

PCIe5,
VDD_A_QREFS_0P875_2,
VDD_A_QREFS_0P875_B,
VDD_A_QREFS_1P2_B,

PCIe6
VDD_A_QREFS_0P875_A,
VDD_A_QREFS_1P2_A

> The fact that you so far have not been able to provide an answer
> seems to suggest that these supplies need to be managed by the TCSR
> clock driver which can handle the mapping.
> 
> > Hence, restore the vdda-qref request for the 6th and the 3th PCIe instance
> > by reverting commit 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100
> > qref supplies") and commit eb7a22f830f6("phy: qcom: qmp-pcie: drop bogus
> > x1e80100 qref supply"). For the 4th PCIe instance (Gen3 x2), add a new
> > driver data entry, namely x1e80100_qmp_gen3x2_pciephy_cfg, which is a copy
> > of sm8550_qmp_gen3x2_pciephy_cfg but uses sm8550_qmp_phy_vreg_l instead.
> > 
> > Fixes: eb7a22f830f6 ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> > Fixes: 031b46b4729b ("phy: qcom: qmp-pcie: drop bogus x1e80100 qref supplies")
> > Fixes: 606060ce8fd0 ("phy: qcom-qmp-pcie: Add support for X1E80100 g3x2 and g4x2 PCIE")
> > Cc: Johan Hovold <johan+linaro@kernel.org>
> > Cc: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> 
> NAK, for now, and please don't post any new revisions of this patch
> until this has been resolved.

OK, I will remove this patch from the series if other patches require
updates and submit it separately when it is required.

- Qiang Yu

> 
> Johan

