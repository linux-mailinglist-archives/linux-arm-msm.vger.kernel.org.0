Return-Path: <linux-arm-msm+bounces-93071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM8rDZMelGk1AAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:53:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F01149666
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:53:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0166302263A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D052DAFB5;
	Tue, 17 Feb 2026 07:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh/DgkVM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLV2MubH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248992D8798
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314816; cv=none; b=eSDvAvdgSDnGJYwZ1vz+BeGGuqPxcZ85VWaxPUA6JTWRu9zb/SxwdrkZFSvwcbmcVr0XLFqRsGS/eXRmo60qTJuybi5PWDVx4x5/0hqaI09kfEEwxOL0MS5fnVi6gpXiM6LgFWShtj3gTYEsKIUhhHoZd3jW2das1/yl0EktsPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314816; c=relaxed/simple;
	bh=u10W0dZQkXKK92GV/cpGKMrlxzSLCDLg8iUDPQNa+Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiqmi6wcTnOAuX1N2olAfKzvuVWAmPgW4tzPHUsVI4mEXRHfyI5vSxk0ihyEuKrncE/bTsGadMFvEBg8a4QjWbQGNncl4jJ8R/nwl4HhA3lJhh9VIVPaBW+yQTQlM7LK7VhEWl/NVi6+x+ck9G7pducOp/WLkzCJTOz2f14xcWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh/DgkVM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLV2MubH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GIGxRb2804570
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HlyIZEog6J3u33MMe7AFXbsT
	oOYrvaz+iKp7UgWrFA0=; b=kh/DgkVMfTUv94MQxfiFtIZvNho6Sio2iEoAmdwt
	p9wU7zr1g7ZzxgGBXfXYlLjq3TPOM3hJ8D/b9aSchRwQxwjF3e1rthYMJutvF2vt
	EDvweYnq4avWV8HWeNz8wQPR0a6rjvhP/Gy9m78DqnJoDvhWhNwFPzf6cYjloITR
	WlRrIBZZkeKKGf1mPDdDqAGO1R0Pv4FdvTQ5K3zENBUVBmxKAovlQVsrsCZtT5Zr
	ZFCsnc5h5NmVAks3u2iFAGJ/DgN8EtQRvlauC9OFjC1wQ0CdmcrOqwmQf4/WAy8u
	PQcuvuH07hVls331ZoxcCkHIK7kDNjmeAsIsWRdN9UFYdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujn2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 07:53:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so2540869185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771314813; x=1771919613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HlyIZEog6J3u33MMe7AFXbsToOYrvaz+iKp7UgWrFA0=;
        b=hLV2MubHHGNpXXu0NdTusfSivPpCktMv8rbTF220RlT835/K5Yu1fwg9a+mrD74jZv
         T8CRJiofPZtUm60Lhx3aFVqbIVB8R5DGRcRDuL6IsCPViuj6zQXv8aockljC6Z2fmROl
         TqBP2BIsIQeDpmOcxNbHtoe54iFbR67ax8zAhbk667R5HiWtytcycbEvJj/CE4MictVs
         wBP/IlDFdCO8xubx4Mfs3db29+0/iH493bbZmJ/AQoJLVyCx7RhqoFeliyn0GzP1aVib
         jfe+O2v4rzXxq4x7DJ6U/fDgUh3vCQsuxlS7KcUp5u2qGjyMpc3tNZIGitKlFSPcIPQZ
         GcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771314813; x=1771919613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlyIZEog6J3u33MMe7AFXbsToOYrvaz+iKp7UgWrFA0=;
        b=kULF29WMvCPnp3zbX+OtA0Sz3Sj2gRDwjwyuF2Hy44ot5TSP57/1y3dGayAZ0bB7Qx
         MCzm0/ml9wzqIakpGQFllZ7q4qsr0hoACgqWU6aM9HgQ4KyO9KJ51ue4OUopfEZZWre/
         b1VBe7e3NgV49ZyHpdsATMG9jQm8OFWwUtAzq9TVcuPLiAnGqWWrRCr8DIAxxR8dKyvF
         lN33uZBSqipFd/vIz98V3fJxGfGkE6rc86FUg7Yp4m7xbTjZTOGMZOzmGCfe3LMfAkPH
         +k42qqZnVwoLv6CiQWWVeix+kA6MbuX1wpDJauX++3293KrjK08q9ThGnvqPdIASPhNj
         M91A==
X-Forwarded-Encrypted: i=1; AJvYcCWfR0mh+PZQqGYcuEnmatTIfPwzh6ws+9mGlTFciO7HEtej9Jbv83xcV6pkaiCrfT8OVMzvqBO566pTm1co@vger.kernel.org
X-Gm-Message-State: AOJu0YyWieB0POJzj9hI0mGdGoUAJ6uQNw/wE3jU1SgSAhx79/YycyPB
	0gx2dFkObHOl5HjjHgGnNEi3n9JbkppauTePSughuBb2b76Tgoaw5eZrZ3m442zwOrJ4ez6RpzJ
	N3Ac2g0kralqRPVczIFnvjDwvCvg4sXAl3sW0OVH+v83OEMnP+++bNERSXlXlhvRMowws
X-Gm-Gg: AZuq6aIPkz2DYZaa+TkTOqcj28JW5AvKAtzET3Y+Ki4YZzYyXjEjGY0BLCCGw0JSePh
	BgnjlszW/f+geco5pHU6SQF7+9WVUfItYsPp+2pBSX8ihaXaK/sT49VXLov8v7Z+ffLTV5On8nP
	ws8uCHJxwDqsmRpe2GZHIBotHO1PMdYeJQbJrT4oxKnn7CMVfi4LAJJcEi3OaxCyaPSR0kjKc1p
	hCpqNe+g4N3vNt4DkjJzsa6W/aqJOH/jGIgS4DK2G2Lbf//BF+pn+gRsOPp8k8CsVjNlybBjh+S
	RrN7x4H4iUTOugQvFpKnYoDTWdLAKM0BEa2MRtLzM8iW5SH71gFMTjelTIG55Emm+OyOxnKSWMa
	6y5dQscmtxiJ3CMB/2rwmUyy4N6HXEPZ/GiLw
X-Received: by 2002:a05:620a:1728:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb4225fdb1mr1520261485a.2.1771314813336;
        Mon, 16 Feb 2026 23:53:33 -0800 (PST)
X-Received: by 2002:a05:620a:1728:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8cb4225fdb1mr1520259285a.2.1771314812848;
        Mon, 16 Feb 2026 23:53:32 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac9d77sm29866948f8f.33.2026.02.16.23.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 23:53:30 -0800 (PST)
Date: Tue, 17 Feb 2026 09:53:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: kernel test robot <lkp@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 6/6] clk: qcom: Add TCSR clock driver for Eliza
Message-ID: <ckfybgx4suqpm2hjkm3zgdssxh4rmy4dxxjy35yqarg2ybu6fk@fl77gdnzvnhy>
References: <20260216-eliza-clocks-v3-6-8afc5a7e3a98@oss.qualcomm.com>
 <202602171002.SP54PXRC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602171002.SP54PXRC-lkp@intel.com>
X-Proofpoint-GUID: 8CWE1LYrl6dri5s8w3ODtl4zQCcq17QH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA2NCBTYWx0ZWRfXwBOrJMuBwHMs
 v+jUFroVihfgd5iVTJsjuteszMhVDjkiqLQYI5C9BuSH95XvN9MxA6MVcl56hTL3uRZD8VHavhe
 ChxSWYyvNBJeysy8PbwtDetDJD/64YPkuzpyBmOOouIadHi0SPtVn5E1T0HDK6hTKLzMC6ioeiB
 UIuSYBxT3HXSvKqQ4W5Y9LBvjQ70djVBYF4OpMA81gMcORwExk171SoteXOX536Alct/8kVJx7e
 J14BWrkx4k2+VRMTYMbAW+IiZWqqmu0mnLp21fLHqU6ZENnRmRgbZfblPSBaT1avCeylvnBl5OU
 EZS0NoPrRboy+GoFCapO3eE41t/th/FSS3afu2ZNabAues25z5geIFfPKkSbfsnT0bvCRXz0yAd
 lU9a3FAsmwxRr8BuXMF/RyQPWvJ23nasldq9mXOgJ0CseJdNqMqzWp9mBL6ZI/sZKpllKWjjqeR
 ACexu2z8vgwqFc0jphQ==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69941e7e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=gSbDSvPH9l2sfEXJlosA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: 8CWE1LYrl6dri5s8w3ODtl4zQCcq17QH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170064
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93071-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.qualcomm.com:dkim,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D1F01149666
X-Rspamd-Action: no action

On 26-02-17 10:31:45, kernel test robot wrote:
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
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260217/202602171002.SP54PXRC-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171002.SP54PXRC-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602171002.SP54PXRC-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/clk/qcom/tcsrcc-eliza.c:126:3: error: use of undeclared identifier 'TCSR_HDMI_CLKREF_EN'
>      126 |         [TCSR_HDMI_CLKREF_EN] = &tcsr_hdmi_clkref_en.clkr,
>          |          ^
> >> drivers/clk/qcom/tcsrcc-eliza.c:128:3: error: use of undeclared identifier 'TCSR_PCIE_1_CLKREF_EN'
>      128 |         [TCSR_PCIE_1_CLKREF_EN] = &tcsr_pcie_1_clkref_en.clkr,
>          |          ^
> >> drivers/clk/qcom/tcsrcc-eliza.c:145:14: error: invalid application of 'sizeof' to an incomplete type 'struct clk_regmap *[]'
>      145 |         .num_clks = ARRAY_SIZE(tcsr_cc_eliza_clocks),
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
>       11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>          |                                ^~~~~
>    3 errors generated.

Fixed in v4.

