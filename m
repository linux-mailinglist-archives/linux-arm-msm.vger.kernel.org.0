Return-Path: <linux-arm-msm+bounces-93072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG0dFc4elGk1AAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:54:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A14FB1496E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B64D3020A61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7302C3257;
	Tue, 17 Feb 2026 07:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eoNd65aD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OfRJcshw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6DF2D4801
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314833; cv=none; b=nmC0B7XpPKm1qcjuDiVeeNNmcZ6gVxSZbwDGZmDQY5/5FPhxnaGPIxIDTnbU6RzAr8/O+wMTBb9MT4wvyRpFPNbmDKvXr6qWpmoLkyrjvP8VEsjA1A851mW9/H5ZcX/cfYC75KEZ0IwWv3ZrL6eHxGW/wxsWfo/4/miVCRkxGuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314833; c=relaxed/simple;
	bh=vIRc+aGvC5spoZAU1zWkxPmqhURGVoAgXdHZHqwpr+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihIGi35oJtxQeehpFFvx5rgLLm/FM36eGzagMOHd9HBR3NFDleS20qFdro/1M1517+t13ASVALLkSupAC9SU/l28wnqRg8CM3lLT0fx6mXucLSdBNbQ5B3A8Bk7uK1Q4g0crjWQ/SFpWpHjeclByGWvFiUlKk58UTgvmGEBK+HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eoNd65aD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OfRJcshw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7f3J1613301
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0zFHBuXbo6RN12Rzb8ZHK7Cw
	J5slf+7BRiCC/hFamtk=; b=eoNd65aDGeAuINBgoJaRrOVog2I+dd6gNnflstqW
	puYPiivriWUKatj4Qt+LFpvBQIFQOj588O5kyLxuGjsHzojVn37gur3L1haE/wtD
	NLZXkcLS48RniFbBjTR5qsQ8kfha4OEvTu/cLD4RKCiCmGCInJoMTsqZY4YxVJp3
	1zR0/DHjqVz9wgAbBKWBKY+1/jewFb/DMXmfFEnm6YVNB+at7tsENEtWnLl0RwxU
	AOB8ZD5HU70sTsdOlOsyDxe/Alau5f1U/EE6wja8USre/RmcrIXLcf0DfruP01/c
	xet/YCIA/oiIOZdj74se1kRDJfhBBHIUCDaMxXB1HZCnGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662sk99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:53:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c881d0c617so2430449985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314831; x=1771919631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0zFHBuXbo6RN12Rzb8ZHK7CwJ5slf+7BRiCC/hFamtk=;
        b=OfRJcshwzBFXN+v3MUbTkBSx07+tFG1xDnMgGlK8S4owyiyKPOXNQR+JxZ/59xvSE7
         +zy85GmCKRGscZ3g3r//iqqqllXkrS0lEH9CJh7xtnbrAV8T3jNkgghzj2b2k5wRz/Zq
         5hx7QJQV+rbfESTfkTQ8cmPGkQLMFvSmDMmEzgwMWP38yvNSmsRIJmdqG/7s9hk05I6Y
         wBHgau4Hv/NupqbZMW0kzQ4K0cAxS1Wu6PNqs4ayyosoCmAJQpM15U7Qo+WSK4pCucAc
         Oj21aVNmgItqpA5eECaiQ64ojGxyVzYgsSFnHj+4XGLbBhDVDOynzeJ1/nbgvf0qmTx0
         Nf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314831; x=1771919631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zFHBuXbo6RN12Rzb8ZHK7CwJ5slf+7BRiCC/hFamtk=;
        b=TbUJzWMi3/mXnWXzSitX6Q7dzy6RaXtRae4VeG2ywg/VCQz8wsJRx8eOmqY/h8U6rX
         yrEo28syaTmKvj+ciN+/oMDwJBnIwTsu3zU1O1v9D1t1JBlYrTs7nB1j7G/fv5nxWItG
         SJ2oB7TIPLSJKd9Zpp2OkiVRJaLlDNp4pMxGszz7aEMcS7x+SFZ1Yg6zGHnVFevmhP9X
         UPYD8gtgSWM3/jwse7URfwskJCxJjeHKaZB+e/t/9V/t1VoeSg+9MtB8na/obihsYMUy
         0rMdIeRrDfu6Isf3+azy67sXwOtWIJZwvcw9LGGRor8xKuDn8mE90CuT9BkI1KAl05r3
         QjOA==
X-Forwarded-Encrypted: i=1; AJvYcCUWH4r3U889Rul00PmmPfgwqk+0qgJH03PxxRXzH0BarFcmgEuEoEXvSEC9nGCBwc4nWS2t0kkUlaoWqjEy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ehJfKNjyiFAxTgxpHiI6ti9Q4tU3w+FjYlbnnPRuSzOcgykI
	Xoc6yPLjZssrvEbzXHihXIisD2MYV11WkGK0xfQYow1YS4ZawHqT0deYwvWNyzIDc5cp5ZKK5Xu
	kbRS+l2fcY3GL9lrYkQYNGlvIa5du6umGBlGzsarZkbzaE2A7DQAnJtN/kYfHhb0lPsBi
X-Gm-Gg: AZuq6aLGyx+lnu0NC9QZo0B7UNKtOJFMlKJ66TBBquBwNFNT8Eow0fs3xz7k085PRSt
	K8Fgm+bXTaq1gqZ/J+ATAicYnbv4ODfeQlxkrSHIiEa+Lk9RG8Lu9YLV99mTQIHsd4ZklalljF+
	s28ZGuP8EZr/QyKuG+cGA40W73ebys883frCEgJLEp4zH9mTe8mD0LCbYE63nPmyKo1GMw5mplj
	cQ3NAac62HJZSECrEPtbBkLOt8/AKz3kd2ul0a4ZJDWEhPZhcsozCczGVfx7AL68MDe2GZO8q2W
	YCGjlnjY8VKDRWDwPMM1/hMUX4Z+iuWUBd0hOJ2Fz6+RclsOJSgp/Tp2k74j1XGqO1hIEFYSOmy
	SuDLqMPmuwcSMFSDfbMjzlsqUVLiRhsBAgCRq
X-Received: by 2002:a05:620a:1a23:b0:8c2:e8b3:7c3a with SMTP id af79cd13be357-8cb4c039d26mr1344996385a.87.1771314830841;
        Mon, 16 Feb 2026 23:53:50 -0800 (PST)
X-Received: by 2002:a05:620a:1a23:b0:8c2:e8b3:7c3a with SMTP id af79cd13be357-8cb4c039d26mr1344994785a.87.1771314830354;
        Mon, 16 Feb 2026 23:53:50 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad0166sm33350255f8f.35.2026.02.16.23.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:53:49 -0800 (PST)
Date: Tue, 17 Feb 2026 09:53:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: kernel test robot <lkp@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <iifc6qoejdk5bohdqdy2qqsi5bm2w2vo5hwvinju3kxhzvadsa@6sblw2k2w5en>
References: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
 <202602171020.eP0Y69zD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602171020.eP0Y69zD-lkp@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfX27pEtoCDv7mH
 loebzOp2PmnGpkn8iXPSqPLT5PiOaWYLfMjnQLvBVLKnaAA3oK5WTwDCAVaX3Xl9KXecv4e2wIO
 e0BVM7V2rR/bRWxAZNQ3cuU9hEgkGH6epGxUpyGAh36m4ToR9oqydmfDzz5o+M2TLS0AODzfPN7
 VxE4hA0rU5fspPaK0On9RFZNG0/N/egGMzosaWrOhH5s4dJDoAdRDF3Te9Omdu3/2Z9hfoHlssE
 zCRBdcwoeIKm5SFPZRpW4FjGAvPP0BVO/l3D23rQj3BTdAkds/woI3EzEG35381mqH1GFEbtpsm
 8MZYc8Py0Wpu17a/BbsblQMDYr9I+0g0kiSOyarNnFZqojxwxvxZVOrarCg2LuQi55eMdID8SID
 Q+Yn+t49kRA1ITDIX/GPefaZ16Q4d4uDROQyeB5BSD3+iV42zp+Vd4mRnnSeQbCV76S8sHJ3TtJ
 6Z3AR07boAt9lCeyHog==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69941e8f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=gSbDSvPH9l2sfEXJlosA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: XMgWN9lGuAHJtmslHj6Ir6CJtim7n5S9
X-Proofpoint-ORIG-GUID: XMgWN9lGuAHJtmslHj6Ir6CJtim7n5S9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93072-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,01.org:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A14FB1496E5
X-Rspamd-Action: no action

On 26-02-17 10:10:16, kernel test robot wrote:
> Hi Abel,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 635c467cc14ebdffab3f77610217c1dacaf88e8c]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-clock-qcom-document-the-Eliza-Global-Clock-Controller/20260216-215148
> base:   635c467cc14ebdffab3f77610217c1dacaf88e8c
> patch link:    https://lore.kernel.org/r/20260216-eliza-clocks-v3-6-8afc5a7e3a98%40oss.qualcomm.com
> patch subject: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171020.eP0Y69zD-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171020.eP0Y69zD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602171020.eP0Y69zD-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/qcom/tcsrcc-eliza.c:126:10: error: 'TCSR_HDMI_CLKREF_EN' undeclared here (not in a function); did you mean 'TCSR_UFS_CLKREF_EN'?
>      126 |         [TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
>          |          ^~~~~~~~~~~~~~~~~~~
>          |          TCSR_UFS_CLKREF_EN
> >> drivers/clk/qcom/tcsrcc-eliza.c:126:10: error: array index in initializer not of integer type
>    drivers/clk/qcom/tcsrcc-eliza.c:126:10: note: (near initialization for 'tcsr_cc_eliza_clocks')
>    drivers/clk/qcom/tcsrcc-eliza.c:127:35: warning: initialized field overwritten [-Woverride-init]
>      127 |         [TCSR_PCIE_0_CLKREF_EN] = &tcsr_pcie_0_clkref_en.clkr,
>          |                                   ^
>    drivers/clk/qcom/tcsrcc-eliza.c:127:35: note: (near initialization for 'tcsr_cc_eliza_clocks[0]')
> >> drivers/clk/qcom/tcsrcc-eliza.c:128:10: error: 'TCSR_PCIE_1_CLKREF_EN' undeclared here (not in a function); did you mean 'TCSR_PCIE_0_CLKREF_EN'?
>      128 |         [TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
>          |          ^~~~~~~~~~~~~~~~~~~~~
>          |          TCSR_PCIE_0_CLKREF_EN
>    drivers/clk/qcom/tcsrcc-eliza.c:128:10: error: array index in initializer not of integer type
>    drivers/clk/qcom/tcsrcc-eliza.c:128:10: note: (near initialization for 'tcsr_cc_eliza_clocks')
>    drivers/clk/qcom/tcsrcc-eliza.c:129:32: warning: initialized field overwritten [-Woverride-init]
>      129 |         [TCSR_UFS_CLKREF_EN] = &tcsr_ufs_clkref_en.clkr,
>          |                                ^
>    drivers/clk/qcom/tcsrcc-eliza.c:129:32: note: (near initialization for 'tcsr_cc_eliza_clocks[1]')

Fixed in v4.

