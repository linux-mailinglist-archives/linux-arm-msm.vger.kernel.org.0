Return-Path: <linux-arm-msm+bounces-91336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /vi9NhIqfWlaQgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 23:00:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE64DBEED0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 23:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3AB5B3011C59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 22:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3AED329E67;
	Fri, 30 Jan 2026 22:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyIwcSPh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LsTZjpXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F072DECCB
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 22:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769810447; cv=none; b=g9FeggWYsoUiwKi4hoo5OgMcUtb6pKDZSFN17DRxdbTMNzo/+TnX5HBjaTgINS7O3dakgapRktnVFwhmGGh6+VUHqCe9g1LXfyuR3EQ+W9cZKq/GWcWiX2VYmV777Gt2fGnp/w0EKzsHHeZVDxuSuQrVvhtguHuW9GcJ5UYxsqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769810447; c=relaxed/simple;
	bh=MbavlqvK1fmzaUF2+UprJd0JaLbeKFThMIEwpsvBMtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUrYkamrTg1ABmMkADQihPXbUEjeI3/OtQv5g+4v2PTcsiNCrXNk+gw31ka2mxLiJ9vIarlJgtTnejj9e1d+rwQqdLeT74xlFZ95KKIHYW/BbxfUpjgdFRzXEj132sFH3XcVPX2xy21T/lKB6YDH2hFWBc2RweoLPscOWGEa7do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyIwcSPh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LsTZjpXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UJEWgt2930022
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 22:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4bW7txF+AdP7CLF1i2dmUA6Zdvs3NlrWrxgEROw2IJw=; b=YyIwcSPhtCgjmIZa
	NnoGrH04TnpOXBNOAFNUM4XIwthFpZOwGmty/pMaI4aXs91JrrU919335z1+4l2z
	nPpXp4fuhgdUuzIwlS4x6zcGR5s+WlE+po6NAC3PJbhu9OYgGqQzTnFnKokfIiq9
	o4EeHmw4DGn2dKHZzEpQxHqT2SYad9FIiB/6FSbKg4Vy0V2Vtk3zl2cN36fXHe+Y
	dnquCKxFkZqxLyMlTkwxTfRr4Pr9V4UD3WMrNhFTgMaY6j2gJH1xssUzxLnpaPgw
	qpH0a3fs5KCPX03Tcfxj5VrfxIc4sfWy6H4v/uO+x5pK317Jt0XOxlHAiL+Y39w/
	Ph+yEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c12mmgfmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 22:00:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c711251ac5so658288785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 14:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769810444; x=1770415244; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4bW7txF+AdP7CLF1i2dmUA6Zdvs3NlrWrxgEROw2IJw=;
        b=LsTZjpXHWPQ0Z2a9DN4t1DBwF3bajYno4YuoXERhprKSIPypJ+Xjgs2zBeJNpclIQu
         pn/oQmg3I5CcB6G85pDHZc+LTRwtlLKvKh+TXlc52+zd0CuNBBQ8WxvmUQTSrYGhgHXM
         bOTnW9Rh5mvRZLH65MQJaAyV6YlJbUF+63HcNaTD4koFj/h8TSOUamGh+/Nt3Li19bZP
         ClMBTpOZrnZCEO435Z5+lNSy64X48PzcurQ5U1mYZu81QW6SZF4b3NoChwu/lTElqQ6o
         CLctsEYY0KIjxMjsB8XGWISMaxDpoaA5IBr51gGGUv9DEMeN151CyznmpaHYw9SsFRI6
         2Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769810444; x=1770415244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4bW7txF+AdP7CLF1i2dmUA6Zdvs3NlrWrxgEROw2IJw=;
        b=mz4T+EvZko30vaGQq/ldPblIc49CpdBknxpW+eyR1WepK/LS+hDzBNr0MyHLBFIz8o
         yT2hz7jwp+eOyKyIgMoZjAFHKCcGRiBRzBg2EohGLWY1oJkAyhtZFESX8o1H5X6rpQFL
         ATo25Cawm7ZSps3toXNAzhpLi5jYXPA3itGrgUzh7sMcGfBkzznUAaydDkD8bvGhJ92v
         eFK+QPj+XThJdgRI5u9fFfOEhQynRCys3jjfAuFiithEabpYErilolWE55Uo8ur9M8nY
         cnf/8EMgNIj0yjrgJmCO2kg6Aiptcklrdtcd6aiC3kcDCTrBt2UHCdyksplAKR+j/oEn
         EMGg==
X-Forwarded-Encrypted: i=1; AJvYcCUthsCpJZZggkpNlAVUa77Qp0Q8WA8gPSZ2Gdt3Gaa1d5OyBRjPNbEGrIApVkVIx5p5FhmiSGqSOUZtodGb@vger.kernel.org
X-Gm-Message-State: AOJu0YyKiQ3yi06lisX6BZ5x5UXBV4O1JqMrK8FyiFHY5ayP9IoNh4fX
	IllzPji9ZbqiqFx60ecL/k76oCB3UZAk892WFJgMIXwRMRf7mDSGdOyafk69GLDXt3V0cYUhD3l
	KwyqiuTNTwx8Drt2nZUXd6IN/vxD1XU+y85YF+3KrsGzO1b4KIZOM5iL0UIgGX+kqki3ZWDEtT7
	Mj
X-Gm-Gg: AZuq6aLIPog5fdL3XZZIa0sED8C5IS4Hc1vfHTynGmpyvtGuiQQy4LKVm+b3u4Q5EXj
	wCEZ8K9iuDEgcBbwRPQ19TSmxFIMXJHuYJ53lhg/gluH4ohPG/6nWuSk/IGfCFkfYoivpes0TrO
	gJVd7CmxAbcI0Q2nkkyc6crGxvkn3tIDxW5CqLRrcSnpSOjJF0Id7YRXQsJkIxC3IrAe4JZJlNH
	D89hUsO57e6tIikbJJcQ+35+Thwwb+L7kFguh3KlcYwi1ixiIFmRTbXeSXStWvU0DVG7h0btqtI
	I1QXWNQ1TodFQfViNQi3/PZ5wUg7fQqmm3Mv2Gs1Z+c2/So77BtjreFm7C0erfoAwipcQUj+wlX
	CMjcbUIn6IGreSgaFXzqeu44H
X-Received: by 2002:a05:620a:4403:b0:865:916b:2751 with SMTP id af79cd13be357-8c9eb1fbefamr562472285a.14.1769810444387;
        Fri, 30 Jan 2026 14:00:44 -0800 (PST)
X-Received: by 2002:a05:620a:4403:b0:865:916b:2751 with SMTP id af79cd13be357-8c9eb1fbefamr562464685a.14.1769810443678;
        Fri, 30 Jan 2026 14:00:43 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm24120992f8f.17.2026.01.30.14.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 14:00:42 -0800 (PST)
Date: Sat, 31 Jan 2026 00:00:34 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v6 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <64x5xfzjik4qtvsxqvwqhf5mua3rpvh7nzw67v5sy7afoo5fzv@5vp3uvjk66if>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v6-3-245f408ed82a@oss.qualcomm.com>
 <2vqho236mjlsnraqif6ivic6ybblnsmk4litqw2sbfpjvrp2t2@eztnjrlsmrp6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2vqho236mjlsnraqif6ivic6ybblnsmk4litqw2sbfpjvrp2t2@eztnjrlsmrp6>
X-Proofpoint-GUID: tsWw6tDbHaJiI2CK0P2PD7Y9qLJ1hO6b
X-Proofpoint-ORIG-GUID: tsWw6tDbHaJiI2CK0P2PD7Y9qLJ1hO6b
X-Authority-Analysis: v=2.4 cv=fZKgCkQF c=1 sm=1 tr=0 ts=697d2a0d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=WFtovuVaATKEZaN-F30A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE4MCBTYWx0ZWRfXxYb2+b5wNJys
 fegHfN+1AUQXUEjQzvbDLB4PRg62JP2LF+hYSpkO535Ryna2nRC5gESDaFqMispUw7hXJqxc2rb
 pwZsd8DKvtYszcD1CsJir8X5v/RGFi8GiyoNFAbBHu6O1B6JOpbPM4EYPQsS+XweEqQDn/yDq3q
 IXE78DCDF1DdX8og3IBwnXH/63GUGj8NuPF/CpyTZmSl9KKFSlwUiApxba2Wv66AdvLUvoUR5P8
 Ga5lsK1P6CMoYq+hifW87PXYFSEQ+n+m3ahd8CJvP3tzILkRP6rjGa0IA3O2OhIpzYwCR6/j49n
 sjLE/HEhUabmqExK7MkfnKQ446q9WCYtGR1XJXfNgIHI3C0uf014tJEt+B2IdR5mLREO7SjL3sb
 n3gdp/7cQbV0gdkk1Ujlxa1tAxhRMogaz0MCCIeMObQCy/FdD9x1emhqOQA/qLquwIE6yJsCcC3
 nn+CL+dlJ5jjKtuKI0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300180
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91336-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,0.1.134.160:email,linaro.org:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE64DBEED0
X-Rspamd-Action: no action

On 26-01-30 23:44:43, Abel Vesa wrote:
> On 26-01-22 20:54:00, Pankaj Patil wrote:
> > Introduce the base device tree support for Glymur – Qualcomm's
> > next-generation compute SoC. The new glymur.dtsi describes the core SoC
> > components, including:
> > 
> > - CPUs and CPU topology
> > - Interrupt controller and TLMM
> > - GCC,DISPCC and RPMHCC clock controllers
> > - Reserved memory and interconnects
> > - APPS and PCIe SMMU and firmware SCM
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
> > PMH0110, PMIC's along with temp-alarm and GPIO nodes needed on Glymur
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
> >  arch/arm64/boot/dts/qcom/glymur.dtsi         | 5913 ++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |  187 +
> >  arch/arm64/boot/dts/qcom/pmh0101.dtsi        |   68 +
> >  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |  144 +
> >  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi |  144 +
> >  arch/arm64/boot/dts/qcom/pmk8850.dtsi        |   70 +
> >  arch/arm64/boot/dts/qcom/smb2370.dtsi        |   45 +
> >  7 files changed, 6571 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > new file mode 100644
> > index 000000000000..16a3c3ecf97a
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> 
> [...]
> 
> > +
> > +	soc: soc@0 {
> > +		compatible = "simple-bus";
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
> > +		dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
> > +
> > +		gcc: clock-controller@100000 {
> > +			compatible = "qcom,glymur-gcc";
> > +			reg = <0x0 0x00100000 0x0 0x1f9000>;
> > +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> > +				 <&rpmhcc RPMH_CXO_CLK_A>,
> > +				 <&sleep_clk>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <0>,
> > +				 <&pcie3b_phy>,
> > +				 <&pcie4_phy>,
> > +				 <&pcie5_phy>,
> > +				 <&pcie6_phy>,
> 
> I'm afraid these do not match the array from the driver.
> I think there is one more <0> before the pcie3b.

Actually, one less.

> 
> Please double check.
> 
> Thanks,
> Abel

