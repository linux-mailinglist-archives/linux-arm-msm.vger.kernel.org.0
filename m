Return-Path: <linux-arm-msm+bounces-86058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE8CD39DD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 03:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B39E8300B830
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Dec 2025 02:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515C07262F;
	Sun, 21 Dec 2025 02:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtNb3Qky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcRo12+J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A11922F5
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 02:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766285380; cv=none; b=SIVsvurj49lvUD6IRgdwcji6Tb74HrtYwMcSkjSFCO4NJQDFSmKBfcqEyL4fiK2+pmDXB1mvmc/SgHrzF1qi87NB5DnRZ4MVZ/eVVYkMIE9fxSYm+mjhg+KKribCjl0Rhzg4rCpTv9hwplK7blne+hD8GjR8tucEpYHllDsbC70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766285380; c=relaxed/simple;
	bh=mzk94kIzSujB7dQvrYTp/NHiRF13McZ+MPxW1Ar+eY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zw1yiTNec9mbGem891nryTJKyi0djIuMPcqZuo1CMphveFtCtAym+riVIV5esUui5mUe4G02fz4dMC3Cuci7v1h1CZUrrxiWe/TELge+YrELwKJNd/Z1oNh7rqxStebQ0/ad9ORHlOH38/aZOCGFycmOW2DPfvEB6FGNIKUT/lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtNb3Qky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcRo12+J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BL2eEDe1424691
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 02:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVZJW41TZp6+fAYmqTMXyEc4r3MSxV9tznZleL5a39U=; b=CtNb3QkyvsNVnxXa
	dN43y7iZqfkspf4fU+DsV/HKXZbpKeYqjJ7j0jRW/HM6zhXJr/R0CA7RCjt1d/xY
	sHbfPSQ/sxGCY/BmVly7MNsJA2FBBQ15QfFBZR+Q4qN+YJEh+DRdfZtE2CJ8WZVI
	+Tsdoims0PJ4by6ofRh3ct8lO8B4fir4YftHMhyF/IXDTi7diZ1/j+FyUJjF723d
	zGrw/E+2Hnt7b1aloQnNnracuzlAMgkpwrIdK+OF3xK5xIZYL0winpuZmTlHshGN
	YzFs43KtcOkLQIHbPukOxssasas2OgcO86UTiNgInjzWsrpmtR+oDhdPP5g5Zhah
	/BYmCQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru1pfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 02:49:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a2cc5b548so93513536d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 18:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766285377; x=1766890177; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AVZJW41TZp6+fAYmqTMXyEc4r3MSxV9tznZleL5a39U=;
        b=NcRo12+JpqGGU0orJrnXyTV3az/dqfVvmOL3ittslossaq7VbKHqBY6GlKGbZ7K+s7
         gg5kp1xXz1rHqFSFDT+PGVSUHAqC2h7hnvo6SNWewaqOEppazw91KKy7MY6O08nu2ZQ6
         1diYi0jBKSWNdGtvEQN8VQvnYXKlyAs08+cxHlxeWOfBA3jSMBw+dVhlnru4tiLhBPJI
         pgx7Fiu2PMNN+Zf0DLxOQjndNlDbcp6JSUsk/slwZEjmz1MI50wrSzQv51nf/gfu38ri
         ftkSmjqxm4/Lzc/UebLBZMME4FaJoVHKALcK+sllQF5QHx76d7pWIMo50X9sZ4RNL8YZ
         Whjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766285377; x=1766890177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVZJW41TZp6+fAYmqTMXyEc4r3MSxV9tznZleL5a39U=;
        b=P4pxKledf5B8wLeITWUerT1t3S+cucqgRsfCe+AGBzq/THYxcPD4z0jNDQn9605SMK
         ydjJjLhNFf5D5CoRfxhEv2b5LY4AumNu+I11NG82xhDqDg4sTjnA65wlXdpbF/pwyRHx
         VUYsw5aqqFpIgxbeaM/1T4V1qin5i76yPeCyHJPIFeKHyt/hEyWTMW57vZ4fKb2z9tVg
         NoGvCrDWfoDmJovNZHBTG6jygD/p31e9j6Ns81NBoL7B7KHwjdGYnF+mZNvli8I93M5G
         f+MKwv18MohAe40fx5WXeC7swWfSEx/owQam8mTE8s+L55Qv0A/Jgkl6sie0zelg1YZI
         7cXg==
X-Forwarded-Encrypted: i=1; AJvYcCW0WEGD0iYsMPP3IfGDQXZ1OpydEdlXuaFM75LJdCeNy627Ew9+KtGkgqRPqlRnW+A86TfRxvTNjdSYXvW7@vger.kernel.org
X-Gm-Message-State: AOJu0YxyDgBb5QCavAIjzHr8KYyv9TtBbR1VQKW1bfQ8ivsm/mhCG4Zj
	C3X5GzOm9T5WVksXj9GngFRxJtBh9B0OvYa/7f4qLaCr9uZdKSc/hleEDQteW2YdZefcZ1KfAfM
	rCVLqoJcRWz5udf+hQvSaEdly9PIGEM8Z0abh98BuKH4Gd9ZhaWRaXK1nQ9hmSWVw5mrT
X-Gm-Gg: AY/fxX6n3da7n9K45IOWv22Dpv7BPTyoTkTFE15mobcVBT+AerI0k0+dLu8G7ePaNaH
	IuY+SRpS0zE3keBrQxZZqId/hSTz9IzZfGt1kLCJOD2xdwehnBaHwdF8WMkqPI8yH3a3ylf3rp6
	5VfdxSlp5jr56CkuGRDA+GxziKAJNDfgXdlicHY/1EmIIHyvQ3OSm9MqPXsVilTMizr+fUaQFzN
	m27VJNK700uLZSXnvFu/jYn+BIPeTjl/O4yJ8fl/VOAgWJrck+w/u9BqA7GcoTLQXwLh6r81SiQ
	1J9LEiMrHG0aULrZs7t4wDqoobC7nZplA6oURC2OSKh5Pa/fdGEEhgG5ZFb++wAXp/22vna29UK
	wMfn5kQEUVCW5IfUTJ6NkvVXGO1jLT++vsye49icU+z6qB5m3W8zUjqP1fg4TTc/yk3KlnPbgDF
	QjWrsnfigojmMyAjnEy2nOk0A=
X-Received: by 2002:a05:6214:54c5:b0:888:5a84:b5e3 with SMTP id 6a1803df08f44-88d81963b2fmr111225426d6.8.1766285376711;
        Sat, 20 Dec 2025 18:49:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF6agPyE3z6STbay9VKsAWB87wt1r8yDbchJLWNZYxpHXlzpLtOaV7ox/u1t8o3BSwI10kAdQ==
X-Received: by 2002:a05:6214:54c5:b0:888:5a84:b5e3 with SMTP id 6a1803df08f44-88d81963b2fmr111225116d6.8.1766285376261;
        Sat, 20 Dec 2025 18:49:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186f957asm1920848e87.28.2025.12.20.18.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 18:49:35 -0800 (PST)
Date: Sun, 21 Dec 2025 04:49:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <6wwgg44t5ocakherrqjnzb4tx6tus4mitrwfkbu66o57ogzuaa@g6ghhl6zkfn3>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-3-32271f1f685d@oss.qualcomm.com>
 <k5b7rixvjtfxwatsg7ahmrutcruuxa4rxecprnbni3kvtfbcuo@26falgq6n24s>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <k5b7rixvjtfxwatsg7ahmrutcruuxa4rxecprnbni3kvtfbcuo@26falgq6n24s>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIxMDAyMyBTYWx0ZWRfXz+51B1PE+c9e
 CtkGCjtNRAb5qk88a6i5lUrC4rERdv4AQUJgHWVQ+nTQE/XvPi4teWGA2XuqOwCEmBz16ywaebF
 kVoPBk+GbQULgP2xuxMqRr9X1Y4sCHtcipDFIK9+vJQUwno7yBbHFVvYItN2B+Y6L2eP1j6JTzC
 6u5jzR6SwLDoT0zuozbLB1n7eCNo1/9jeaTEEqSV7W2b1UgLDpSALmxocihOBZvq/cMdz2H5Ib+
 CIwUlZsA9yzX6K6Tj0pYnuzAoBqoy9kzJnx2Qrhl/zeQtBgkf3uRav7ZFCltsEhDrN5PFaxwpXo
 BnYa5bsIjch+7ULXHJT+WQ5pk2Z72iC0thO0JI+jWMuM10K0CRDHkkNJFrn7HPN0BLpL+GlMwiE
 kIcg/5pTj+h2nBZ/Y7t6YnXM1+mFEVhIYq49mWTnvzE362cUrtA/LyzR+zYDOK+fahB5YEIsFgm
 nOm4pOjClg8cElj/UoQ==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=69476041 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=hm8W9egFaIkRQvLw3_0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3yne98YR78vbhbDVXKnTSiat86QpZ98i
X-Proofpoint-GUID: 3yne98YR78vbhbDVXKnTSiat86QpZ98i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_01,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512210023

On Sat, Dec 20, 2025 at 08:46:31PM +0200, Dmitry Baryshkov wrote:
> On Fri, Dec 19, 2025 at 08:16:56PM +0530, Pankaj Patil wrote:
> > Introduce the base device tree support for Glymur – Qualcomm's
> > next-generation compute SoC. The new glymur.dtsi describes the core SoC
> > components, including:
> > 
> > - CPUs and CPU topology
> > - Interrupt controller and TLMM
> > - GCC,DISPCC and RPMHCC clock controllers
> > - Reserved memory and interconnects
> > - SMMU and firmware SCM
> > - Watchdog, RPMHPD, APPS RSC and SRAM
> > - PSCI and PMU nodes
> > - QUPv3 serial engines
> > - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
> > - PDP0 mailbox, IPCC and AOSS
> > - Display clock controller
> > - SPMI PMIC arbiter with SPMI0/1/2 buses
> > - SMP2P nodes
> > - TSENS and thermal zones (8 instances, 92 sensors)
> > 
> > Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
> > PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
> > 
> > Add glmur-pmics.dtsi file for all the pmics enabled
> > 
> > Enabled PCIe controllers and associated PHY to support boot to
> > shell with nvme storage,
> > List of PCIe instances enabled:
> > 
> > - PCIe3b
> > - PCIe4
> > - PCIe5
> > - PCIe6
> > 
> > Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > Co-developed-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> > Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur-pmics.dtsi   |   11 +
> >  arch/arm64/boot/dts/qcom/glymur.dtsi         | 5700 ++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |  132 +
> >  arch/arm64/boot/dts/qcom/pmh0101.dtsi        |   45 +
> >  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |   83 +
> >  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi |   83 +
> >  arch/arm64/boot/dts/qcom/pmk8850.dtsi        |   70 +
> >  arch/arm64/boot/dts/qcom/smb2370.dtsi        |   45 +
> >  8 files changed, 6169 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi b/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi
> > new file mode 100644
> > index 000000000000..677dd1b74db0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/glymur-pmics.dtsi
> > @@ -0,0 +1,11 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include "pmk8850.dtsi"		/* SPMI0: SID-0				*/
> > +#include "pmh0101.dtsi"		/* SPMI0: SID-1				*/
> > +#include "pmcx0102.dtsi"	/* SPMI0: SID-2/3	SPMI1: SID-2/3	*/
> > +#include "pmh0110-glymur.dtsi"	/* SPMI0: SID-5/7	SPMI1: SID-5	*/
> > +#include "pmh0104-glymur.dtsi"	/* SPMI0: SID-8/9	SPMI1: SID-11	*/
> > +#include "smb2370.dtsi"		/* SPMI2: SID-9/10/11			*/
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > new file mode 100644
> > index 000000000000..eb042541cfe1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -0,0 +1,5700 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#include <dt-bindings/clock/qcom,glymur-dispcc.h>
> > +#include <dt-bindings/clock/qcom,glymur-gcc.h>
> > +#include <dt-bindings/clock/qcom,glymur-tcsr.h>
> > +#include <dt-bindings/clock/qcom,rpmh.h>
> > +#include <dt-bindings/dma/qcom-gpi.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interconnect/qcom,icc.h>
> > +#include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/mailbox/qcom-ipcc.h>
> > +#include <dt-bindings/phy/phy-qcom-qmp.h>
> > +#include <dt-bindings/power/qcom,rpmhpd.h>
> > +#include <dt-bindings/power/qcom-rpmpd.h>
> > +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +
> > +#include "glymur-ipcc.h"
> 
> What is it and why is it being included this way?
> 

Missed that IPCC headers are defined this way, you can ignore this
comment.

-- 
With best wishes
Dmitry

