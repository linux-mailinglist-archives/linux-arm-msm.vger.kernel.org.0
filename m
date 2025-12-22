Return-Path: <linux-arm-msm+bounces-86197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64969CD57D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 11:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEC60301296D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6FA3148C5;
	Mon, 22 Dec 2025 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2pOedhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0c0Av+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DB1313E36
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398284; cv=none; b=RidL56pySpzUaDDpyfumoptOHkwmtJFeIm2ycMPi6V3j1lzvTkeSJG61fL66VLUc3eH18UFw3yhtEYJKvUryWDZW9By0rkQpWcXL52mB+7PKlcbK3RqFuCYPntfsVpGW1aHZP1DCII+Z0VYgQClmK5MUGhYf8QsN7tQ7FmQKHA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398284; c=relaxed/simple;
	bh=6nEzGlpUVj1Rv1a+bKeOYGuJ64knxyEFoHZZ814na7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7PlaeNmhy7AJrYD5oMQTo/rvRx3E3axTqrfPMYjX8ZhlcNFVvnFL47z2e2cmfwMSq6DtgcSiPL8+rMQngEAdcD87861cfxDNWrddfKrZSfzugV0m3ISiallcwuMSSavcS+wkT4WZIIaODS6S6C156NhnbRstZDQtiSNn9dhZPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2pOedhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0c0Av+g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8ZnvI3962357
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHypJlQwZZu8LL+8Mm/KrbMDUzERPi3aY6spWVjTCx8=; b=T2pOedhnaptcd+ZF
	fv7qDQiwTlj6ixipoWbRdq/+n1sVs2S6IlqiDG2nbrUZDsRWsOyL+53j4TG4eIo1
	5SJ2T4gGGRORxbXPsV8mb717t5uAEXeUbs7CE3TF+N0aSrpTfzRM+qCx1OuFs/ww
	P7duHoK31pYQPiSYwtQh1MsGxfMoJer/BNuO9nFPU6exe1fE7F7B1+JKwKIbcjsa
	q2XCvp1OSaAEp/stJgYlBco2ZL7epMQoWJnCeWd3P2BUBoJBfMmiCiiFr2hzyhls
	KkMoF7TiPOJffylD92jd5FHCwR9mq5IMGlwuCr1/Vu9dakKB1r2+Jh69aqB/PDQt
	AgI8Lw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6hbn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 10:11:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9ef46df43so4506167b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 02:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766398281; x=1767003081; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YHypJlQwZZu8LL+8Mm/KrbMDUzERPi3aY6spWVjTCx8=;
        b=I0c0Av+g0Ws3K0ix+8wsocB/jJ9sxvLF7RhsBZ+KdFyuPNUB8ZDTzgjQpQT16SW5jD
         kBRQveYbui3aCsISsybjBdV9m7IkbTVjLlZkhp8E3Oc7R2l4tMMvMjmJ5K3ywI4V49Q3
         yoNCObeekRdu8CHG5qmgc37JiHnywbnks0gmNZf+R9SGee9kWk8ai2reXuBVqUtq7CDb
         bJ00G31TG3YbBP8VNsVEDXRld2/tGch+MSjoY8HQas3MKUgJwZaqOdCiC4CEVNhIeFr7
         BWb/bxpTgBYa9OqR1FU/q3hLAcLTmdmNZK5Ct27vO/fCSxSH4KFkNA9lcMqKh5zlYKp6
         FuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398281; x=1767003081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YHypJlQwZZu8LL+8Mm/KrbMDUzERPi3aY6spWVjTCx8=;
        b=H8uRglj2ztG1DhyY02IlqQZQvlkuhMfAib9mtyJ0HiDyuLBaFcxsbVx8LxwvImrwcH
         +9h/V3VTVtpuyT2tKAXmuPBcUPOeu+BGF9eGnigKQ3JfIBJttEx/8xiPNfLA+i0HaYnH
         HaBqArYDSEh92UJad2V15ApEOx5RFDPIVodQqSB590GHH81r+8EsmYNoyz+GEvNkBPfD
         WMLTU/LN/BipqRTElmDAYHIY/2CbkBrVBeNJDBBEE5FWJsmtyNpY2+V2HrknInEn1wbH
         9NgSDHxURHXtBOvG6V2pwMHZiv+xcH2vMMi6J1KNKL0a93uriNL4Us8ObNxMXySJrPOD
         Ff+g==
X-Forwarded-Encrypted: i=1; AJvYcCUTvhviXq0rdopBbP3O5q5LSsUS64ULLpausyqXvNHJ5k9cinvDr7SSKlRB7HX9tD+6lQQnTF/rcZAQ2P23@vger.kernel.org
X-Gm-Message-State: AOJu0YzfyM+VfFMnVYPrgHx54UUxG3xETxPfz2tc362VLgHFJESI2xpg
	MFDQWsvqSZb3AJUbE2+OLhd9P+owrL3M/0hXwNOUJmRNcYyEqaIvfRZDRDMlkDfLABfmm5lKLuV
	WR8OEmu33SYvA/CNY7nlyz55wBwPICKsfcI4Y6fvR7YCWjlbvxx8VbLTc2DTIjBL9zcrk
X-Gm-Gg: AY/fxX4j2qEuhpmknm0Gx8RLbMfhXlP2Cd8sqyh78+56Ru7Po0Y4ESWh9+11YUz7Xzl
	BaXg4PBYP02W0VdJcwGDID8o5GlbllUeCHGWlbpoMRKG2MNUBnJzVblJB2YW3X2Pnb+H5A6c7FZ
	+8scx3MfkP4xYsq+FWYX2/7LLzEKs+1Fhm/nrHVZwqiGUMzx5iEI9HLDjDAP3m7fqVs7WJ1kX+y
	q8cpPlM7sWJijlkbPuCfLXYHIEDndmHxwD9VKIl1KaLy6G6yz4AF3DIG9qu/b7ZJZY0wuTdVKGe
	oouKAFB7L4vfXSa/+nyoZg0ACjodKyCkJDMhvp0aE98aI3QuDm5P7dfhEPtQzdjzxmlV4jb2iNq
	hBCTMPFK004Fz+XWrKQg+5GLlwcNwOtDALl2oEcA=
X-Received: by 2002:a05:6a20:748e:b0:361:4fa2:9757 with SMTP id adf61e73a8af0-376a9ccbab3mr9993575637.55.1766398280718;
        Mon, 22 Dec 2025 02:11:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu3LBxDwGs0rYx8+Fs+WdQ0lnbkGkcW4M1/5kxQeL41sTSXUSkDxaTY9zeAmbRE8zygFT5Pw==
X-Received: by 2002:a05:6a20:748e:b0:361:4fa2:9757 with SMTP id adf61e73a8af0-376a9ccbab3mr9993545637.55.1766398280177;
        Mon, 22 Dec 2025 02:11:20 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c530f72sm8753709a12.29.2025.12.22.02.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 02:11:19 -0800 (PST)
Date: Mon, 22 Dec 2025 15:41:12 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        rajendra.nayak@oss.qualcomm.com, sibi.sankar@oss.qualcomm.com,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <20251222101112.aprpyfalend6jkhr@hu-kamalw-hyd.qualcomm.com>
References: <20251219-upstream_v3_glymur_introduction-v3-0-32271f1f685d@oss.qualcomm.com>
 <20251219-upstream_v3_glymur_introduction-v3-3-32271f1f685d@oss.qualcomm.com>
 <5mxpioeokzvn22oirgvp4gwjxvn6acvwfe65sch24fpapklvl2@x2rd3b4nrbx3>
 <rqjl2tqvqourjc5qowehxdemgge3idfy7icmipc7oltkj7tuet@ypsdpbm3gvkp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rqjl2tqvqourjc5qowehxdemgge3idfy7icmipc7oltkj7tuet@ypsdpbm3gvkp>
X-Proofpoint-ORIG-GUID: 0jLggzq8uB450iOHt445_v7PT4uWnxTC
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69491949 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=re_HsZogAqmYq7xTWKEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MiBTYWx0ZWRfX2GCAIEXphzhR
 Qaw83C1HMUn91v9kvnzZMG/k1U5CVxOh+LHRqcloA1OPYTFczoeKRDlp19gznO0ptOTR/P/1jad
 mGauG7Zya/9X+/wlX+p7mZJ7sK/ufGiWmNhO7RWwX06iI++YtBUWNjdKzdJCXL9e6UJCJ9+oYnt
 d1sDdFic6hNA8LxMu+l0ssE9ZRHmeY6uIYAPB+P1jzVagStJsvWopX8STXEAUYoZqs6eu80tmYM
 9iKcf6bELhPIJQL93M8wzIz6qCUYUpoOb0JSh12lRNJBmMXRovcRNZvBlrxI+m0q5fZXHC9THW2
 p+oCBNtDw1Cq4kK2ycfYEKz0B3+ik8HQW81tXt705A9a2GAjyEuXBar+KNb0tvoOULqn26qr+fQ
 /8kKko9FMmHAvXUY5fB54j+j7YACKhK6jiwxLUlAvVA0RfK/caswctwBg/EUXYuEiFdtyvpWdJN
 KVCvTK2eTjl+S8hxhHg==
X-Proofpoint-GUID: 0jLggzq8uB450iOHt445_v7PT4uWnxTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220092

Hi Bjorn,

On Sun, Dec 21, 2025 at 09:36:19PM -0600, Bjorn Andersson wrote:
> On Sun, Dec 21, 2025 at 05:17:34PM +0200, Abel Vesa wrote:
> > On 25-12-19 20:16:56, Pankaj Patil wrote:
> > > Introduce the base device tree support for Glymur – Qualcomm's
> > > next-generation compute SoC. The new glymur.dtsi describes the core SoC
> > > components, including:
> > > 
> > > - CPUs and CPU topology
> > > - Interrupt controller and TLMM
> > > - GCC,DISPCC and RPMHCC clock controllers
> > > - Reserved memory and interconnects
> > > - SMMU and firmware SCM
> > > - Watchdog, RPMHPD, APPS RSC and SRAM
> > > - PSCI and PMU nodes
> > > - QUPv3 serial engines
> > > - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
> > > - PDP0 mailbox, IPCC and AOSS
> > > - Display clock controller
> > > - SPMI PMIC arbiter with SPMI0/1/2 buses
> > > - SMP2P nodes
> > > - TSENS and thermal zones (8 instances, 92 sensors)
> > > 
> > > Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
> > > PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
> > > 
> > > Add glmur-pmics.dtsi file for all the pmics enabled
> > > 
> > > Enabled PCIe controllers and associated PHY to support boot to
> > > shell with nvme storage,
> > > List of PCIe instances enabled:
> > > 
> > > - PCIe3b
> > > - PCIe4
> > > - PCIe5
> > > - PCIe6
> > > 
> > > Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > > Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> > > Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > > Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > > Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > > Co-developed-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > > Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> > > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > > Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> > > Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> > > Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> > > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/glymur-pmics.dtsi   |   11 +
> > 
> > Separate patch for each file, please.
> > 
> 
> Why? We just told folks that we want the introduction of a new platform
> consolidated into 2-3 patches.
> And this would give us 6 small patches each one adding a trivial (and
> presumably incomplete) pmic files.
> 
> What I don't know though is why we have pmh0104-glymur.dtsi and
> pmh0110-glymur.dtsi, why are these "-glymur" ones? And why do we have
> glymur-pmics.dtsi? The times we've done <soc>-pmic.dtsi, we've put all
> the pmics in that one file, not just 6 includes...

Actually, we got this suggestion in the first series.
https://lore.kernel.org/all/b784387b-5744-422e-92f5-3d575a24d01c@kernel.org/ 
and at that time glymur-pmics.dtsi was still there.

Main reason for this was that Glymur has lot of PMICs and some of them are
as-is shared with Kaanapali (like pmk8850.dtsi & pmh0101.dtsi), and some have
been moved to different SID on Glymur (compared to Kaanapali) which needed the
-glymur.dtsi postfix and having the glymur-pmics.dtsi helps us in quickly
checking all that in one place.

We would prefer to have the pmic files seperate (then to have all in one
-pmics.dtsi) to get a clearer sense of the "leverage" between different chips.
In future too, we expect we will have lot of sharing of older pmic files in
future as well. So having seperate DT will be preferable for us.

That being said, if you want we can do away with the glymur-pmic.dtsi, and have
all the 6 includes directly in glymur-crd.dts? or if we can get a waiver? we
can keep the same approch ( having <soc>-pmics.dtsi and pmic.dtsi) going
forward on all future targets.

> 
> Regards,
> Bjorn
> 
> > Abel

Regards,
Kamal


