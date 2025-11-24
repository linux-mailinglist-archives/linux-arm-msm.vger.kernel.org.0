Return-Path: <linux-arm-msm+bounces-83007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE0CC7F1C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 07:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 742A04E1AC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 06:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26F92DF71D;
	Mon, 24 Nov 2025 06:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QsZZAuhj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AaXx1sfJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9242D0C64
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763966770; cv=none; b=USyWIuOtLTynBqg3PAxhkIxzupYP09Cebgy/1GC0AU9buzQ8pPgkDuWqbgw3xL14savu0CZTVQ21YUGtrl4mKDrzAYeU0ZOv1KKU/nz5oJvo+nOxSkc3AMfW6cmYp/o6bRSZ7rAvwCcVBNd786CvB1MfprUTKzfVGRWV2bUYEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763966770; c=relaxed/simple;
	bh=23YpPQP4CI1KPsjWwNPJhWoqp9i+7QjgCb/IpMeDpao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geSL5jRn/i/w/JwOErKmpJBlO2rX3qz4pgbASED1sU2Rdxr5pPWOR05Kodx4KJTBAiNcor+/fizwYNZXTH2Ci7FQY3xrOir2P3J6Lao7Axa0LgN+Vge1id/L0KncqK1EYOldkcwmPd/17EkY3rvB4TQ6+Ps7EbPJn0jsVDQ1CPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QsZZAuhj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AaXx1sfJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANLX6Sp2153781
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	By/ZQL1FuYeACCKtKvf6JW76324AdceNxDBN+D6hlTo=; b=QsZZAuhjtFkJaUWA
	IGZbFHvEXXN+U20t3G/C46HttkOJilVtAENXQ5CrzSUSXthrW+Re1yE//tG3mIqi
	IqLyFKxQBqcfvlP7KXsZcIudYwnGNc6hNFuqnZcqRyWrsQfljY3KnpoqmvuQ8R5M
	dD+KAhC5VibNnZapwaMz9T80KKVenL3qRKBnGSvmk/PqB15Iyyvs7SNBeFmJHMUY
	REWxdTvx/JFiTIHGC6ESQvjMmMhFnoRwW+1EYcaFExPpg3oW1/I86+T7OuHGKGYh
	SBAdrg/RN6PjHKJ1uwemwahewKJpXlSLktHNSN6joukyuvicgDwj5zxVYl03K9c7
	98SSnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak67x3wpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 06:46:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29848363458so96009775ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Nov 2025 22:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763966766; x=1764571566; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=By/ZQL1FuYeACCKtKvf6JW76324AdceNxDBN+D6hlTo=;
        b=AaXx1sfJfM+xumCHF3mZs3hvqzbMR/+S53MrwE9kbMhJzUIsy2gTuc3+evcgNFO1N8
         KcxG2j1GQfgHQOnLN6WG6BdICwZkuuqjxpwWpjypwanTDa+bzHtl6bKFTJ5xpqdtNJbs
         MxBw/ct8LfdV4ejbaz379JdIMnByBta7Yp5+x4wBdd3pcstZJmFmZbwhl1ngSWaSyUdL
         pz2+62J0VFdsqq55ZtIcWd5xXWOSoxCf1axoZ0i/RjUFHJKSakxasH43SlVUfDz8+Dpu
         nhxCviWpyF+vHK27dQJRR81l/OGjEeOmu0+954ZzXxlL/HsX9Di8wGvuJWonstv8SOjh
         9uGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763966766; x=1764571566;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=By/ZQL1FuYeACCKtKvf6JW76324AdceNxDBN+D6hlTo=;
        b=KC591qVhG/AArz6ctDuFjvME/pjIts0/HJ0HBY++yrZiA+H/fz72belcWmrk+3o3o8
         Dce6EqTQkUEA0gy5LMsS10AOOIlMexyJBicdrl2xjWWILaHcYe+ZkWyzzDuH/EpAaB+q
         +Zzy8pOX4CGBzGwi3ammQy76oiG5OCrXTTH08DTgeMkSh9xrP+sGFSRgRScayFW3te0K
         QHO9qF9u4iAuYO1GX+Ci71Lg1UZQucI30c+Kjuk9T8rP3xZB/V+GXga5CVrjNMx+r2rL
         U2wG1e2CYPpKr8D/qCJ39+bPM/jkumQgWN5yfD3EwPG9cxxweIjaXSmVoaJGzgP8yPVn
         qo3A==
X-Forwarded-Encrypted: i=1; AJvYcCWl3DTrkwb+XOeZ6QhRRTznCzXFbYeNkofjN+vo3z1SyqTXjBOyqVgZ+uG8mLy0RzbrZrk/ZtexwCCAdcvR@vger.kernel.org
X-Gm-Message-State: AOJu0YyxusL5bqiSt4/j0crKipXTU4toqxuixUjsBgpDmRy977iHGZiO
	WO0DbR283dTRPIfmdLUWB2lBfpbILOQKUvJaMTf8Yq2tPpbrSJXv4CcJwcoNWWOGXZiZY6g35Vp
	dQJDH3ph4wz+j6iG/S74mUseCb7CiANoJ0n2dRTtEvWeCczl9u5SOVhWlKyMy8hk2osS4
X-Gm-Gg: ASbGnctPASO+P8qUKQ+7m7BaW/IBljM62KA+S4psaKP2Mh7e+mkEki0MXWeNkw5hGPt
	75bmT7+Jba9vQTtiwlS1YYHcukNtROlQo9TBxGekiQRTl47177JBfp5omklXShrwPg/fbFkLLE3
	Zrd0kDUN5N90YmV+EX6xK/HPXXzAO3I1n8AyLAK0Vlxj/atw3A72L5Fr1SpuY7vtqMOKKM2Thgb
	k2y8JlE093VpNqV+sj/1dCnJnzEReDasLD0N2njBHhdWl79upD3xdSKFuSTWrzFnkVvSb0n8jKk
	7H/X0ZN/Uj0wqjQUIz4oIQZs0oCRLSELlU0bDeG+mkns8OpQ51Ssm3xAWBL+Sre8T52nlgi29P4
	MQgusDCNvTAQPQP10QGHrvgsvKx9i1Zhhv47m
X-Received: by 2002:a17:903:1b10:b0:298:485d:5576 with SMTP id d9443c01a7336-29b6be91657mr100486375ad.8.1763966765852;
        Sun, 23 Nov 2025 22:46:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtugpB93cxvDvAwOI6vRBpObZNJ1J+RRDzvCpY5YCuleJS0pa1DUKfMcah6KM61/9lkvmBHQ==
X-Received: by 2002:a17:903:1b10:b0:298:485d:5576 with SMTP id d9443c01a7336-29b6be91657mr100486155ad.8.1763966765128;
        Sun, 23 Nov 2025 22:46:05 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75e8b37f1sm12313992a12.14.2025.11.23.22.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 22:46:04 -0800 (PST)
Date: Mon, 24 Nov 2025 12:15:58 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20251124064558.aaartbglgvcj7w5r@hu-mojha-hyd.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <238adfbb-3773-4318-93d3-b23697aa4b18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <238adfbb-3773-4318-93d3-b23697aa4b18@oss.qualcomm.com>
X-Proofpoint-GUID: 5nqJB5VewRDt6uGs_1yd6DB7n5ApXoTl
X-Authority-Analysis: v=2.4 cv=AcC83nXG c=1 sm=1 tr=0 ts=6923ff2e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fNd15dL9NFL7uWwzahEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5nqJB5VewRDt6uGs_1yd6DB7n5ApXoTl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA1OSBTYWx0ZWRfX4F3/ZY8+0fys
 MYP/8gCV25gqBfAh5bhAL+QKWZ7c6Au/k0/b9eSP/sQHGzKO7vmgTMYbmCfYSc81Lnilt3zz+Pt
 uC+ec9jJon/0l6Waq24Y3KypS7MU6qHc10RIhXU7JSQsgvIrZ9FrAuBw9bLqAplNZnYb/+HN2zG
 CMnv0xPaU/Mfx+DHV0tm6jXC+IUlZ3E0l6IrVYFlDi9qktqq12hRDILsmoJa9CMx9j8P1cSDd0R
 bYSfyFn4+0627+YjkyzhJNzvnV5WdjXK6XkE4pBO5ISy78pP6f192lW/8vV/lT9/lOxrrb+c9Or
 nEuz7ODX8cxannvsEQpR+ozw+9IEYS7R0VsD6twThuCkIKYu/SdznFsJLvtPH8LL8sxtVISoaBA
 7+iB1Dug0fvWlaYytIKPheBjcie0uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240059

On Fri, Nov 21, 2025 at 04:08:36PM +0100, Konrad Dybcio wrote:
> On 11/21/25 12:37 PM, Mukesh Ojha wrote:
> > On Fri, Nov 21, 2025 at 11:27:57AM +0000, Bryan O'Donoghue wrote:
> >> On 21/11/2025 11:01, Mukesh Ojha wrote:
> >>> In May 2025, we discussed the challenges at Linaro Connect 2025 [1]
> >>> related to Secure PAS remoteproc enablement when Linux is running at EL2
> >>> for Qualcomm SoCs.
> >>>
> >>> [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> >>>
> >>> Below, is the summary of the discussion.
> >>>
> >>> Qualcomm is working to enable remote processors on the SA8775p SoC with
> >>> a Linux host running at EL2. In doing so, it has encountered several
> >>> challenges related to how the remoteproc framework is handled when Linux
> >>> runs at EL1.
> >>>
> >>> One of the main challenges arises from differences in how IOMMU
> >>> translation is currently managed on SoCs running the Qualcomm EL2
> >>> hypervisor (QHEE), where IOMMU translation for any device is entirely
> >>> owned by the hypervisor. Additionally, the firmware for remote
> >>> processors does not contain a resource table, which would typically
> >>> include the necessary IOMMU configuration settings.
> >>>
> >>> Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
> >>> Authentication Service (PAS) from TrustZone (TZ) firmware to securely
> >>> authenticate and reset remote processors via a single SMC call,
> >>> _auth_and_reset_. This call is first trapped by QHEE, which then invokes
> >>> TZ for authentication. Once authentication is complete, the call returns
> >>> to QHEE, which sets up the IOMMU translation scheme for the remote
> >>> processors and subsequently brings them out of reset. The design of the
> >>> Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> >>> is not permitted to configure IOMMU translation for remote processors,
> >>> and only a single-stage translation is configured.
> >>>
> >>> To make the remote processor bring-up (PAS) sequence
> >>> hypervisor-independent, the auth_and_reset SMC call is now handled
> >>> entirely by TZ. However, the issue of IOMMU configuration remains
> >>> unresolved, for example a scenario, when KVM host at EL2 has no
> >>> knowledge of the remote processors’ IOMMU settings.  This is being
> >>> addressed by overlaying the IOMMU properties when the SoC runs a Linux
> >>> host at EL2. SMC call is being provided from the TrustZone firmware to
> >>> retrieve the resource table for a given subsystem.
> >>>
> >>> There are also remote processors such as those for video, camera, and
> >>> graphics that do not use the remoteproc framework to manage their
> >>> lifecycle. Instead, they rely on the Qualcomm PAS service to
> >>> authenticate their firmware. These processors also need to be brought
> >>> out of reset when Linux is running at EL2. The client drivers for these
> >>> processors use the MDT loader function to load and authenticate
> >>> firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
> >>> to retrieve the resource table, create a shared memory bridge
> >>> (shmbridge), and map the resources before bringing the processors out of
> >>> reset.
> >>>
> >>> It is based on next-20251120 and tested on SA8775p which is now called
> >>> Lemans IOT platform and does not addresses DMA problem discussed at
> >>> [1] which is future scope of the series.
> >>>
> >>> Changes in v8: https://lore.kernel.org/lkml/20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com/
> >>>   - Addressed suggestion from Stephen which was regarding commit message(9/14),
> >>>     debug log(12/14) suggestion, and return type change(4/14).
> >>>   - Added R-b tag on 10/14 .
> >> Sorry.
> >>
> >> Did we actually come up with a cogent reason to omit the video firmware
> >> loading here ?
> >>
> >> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
> >> getting video stuff done and storing up trouble.
> >>
> >> What exactly is the blockage - is it something you want help with ?
> > 
> > I replied to you here[1] and given my reason..till something concluded on
> > "multi-cell IOMMU[2]", I can not add video and block what is working
> > already.
> > 
> > [1]
> > https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-hyd.qualcomm.com/
> > 
> > [2]
> > https://lore.kernel.org/lkml/cover.1762235099.git.charan.kalla@oss.qualcomm.com/
> 
> I see that the following files call qcom_scm_pas_auth_.*():
> 
> drivers/firmware/qcom/qcom_scm.c
> drivers/gpu/drm/msm/adreno/adreno_gpu.c
> drivers/media/platform/qcom/iris/iris_firmware.c
> drivers/media/platform/qcom/venus/firmware.c
> drivers/net/ipa/ipa_main.c
> drivers/net/wireless/ath/ath12k/ahb.c
> drivers/remoteproc/qcom_q6v5_pas.c
> drivers/remoteproc/qcom_wcnss.c
> 
> iris is difficult, rproc is done, adreno doesn't need it..
> 
> would ath12k_ahb or IPA be affected by this series as well?

Yes, they would be affected, and the modem as well, when Linux is
running at EL2. However, I do not see them present in any of the QLi and
targeted compute SoCs at the moment. Therefore, our firmware does not
support it yet.

> 
> Konrad

-- 
-Mukesh Ojha

