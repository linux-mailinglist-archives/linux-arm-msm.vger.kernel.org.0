Return-Path: <linux-arm-msm+bounces-91335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ISpC1omfWkGQgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 22:44:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E09BEDBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 22:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 769BE300E272
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 21:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691C6350A38;
	Fri, 30 Jan 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBftqW2l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuqBM+lq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16C4349AFC
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 21:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769809493; cv=none; b=qTlxY59cuSNaBjX6VLdgl1wNyeA4fsRbxCtCkw/jin2W66tYKuyKmb0PhMi2JsTmZHc5ydXzr2SYSHTWdewvVRKE7SXbQE77JWbzanA9CDW366h97KLoiqrPMzffrgjqhPMTwDgHss+DVd7aqxK0uS3Qu8koXPoBzQdpwc1ZDhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769809493; c=relaxed/simple;
	bh=qXQg2y/d2o6uYu1gS5By3iAcvkqzafnFo1F6Lxcxgno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDVVsUgrPQ5ShIwNuMQeOXyIT86U3SLNRhcKm2AbTgKBSr9+UufyXEruU+g+wBSje3PSY4ul+OqgJCkcVG8zb8fSzEmj9Cx1/1tCiKUzyXn8y74q8o7mNrDgeq3scrQs9zH9OU83Cgq5oWg+HIqvT8IbP6rkXuEBIoNCHfadsVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBftqW2l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuqBM+lq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UJEW5d2930025
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 21:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LtEj9II9/M1aLm1RTC1VllQoW2Yjzu7fOoRqZyTBgCs=; b=oBftqW2l4LySOmEy
	GoGlU/8KplYiRUZALnDDJVe8HToa5uLoYhbqYiyL23DuPB+N9S6t0klHnsF/7Uoq
	g9qsxHFXBex9IKDRpT//HDDeeDDT9F/wiEkqykIYbN2fNomwAubt6p/6LqK7sbuw
	Lcb5X+6hSwcIsU8XwDySlYus4YSAvoNUk78kJlw4FzciXdvRcf5TPJZtGALS/2f9
	if9ojkM1CdrviiHWqzzrUD2cFMGAVGlznZljgG01+Ye5APF6BETcu09K+Ep0e1Ah
	w8potS+3j/L/r0TalVdOPz9iiyf7iiHPYfpNDi4ggmYF09zGQqurHeIwurwnhXWP
	iFw4HQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c12mmgdys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 21:44:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c711251ac5so654855285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 13:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769809490; x=1770414290; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LtEj9II9/M1aLm1RTC1VllQoW2Yjzu7fOoRqZyTBgCs=;
        b=fuqBM+lqF/w5hlsLlTQNyxUoOVhm7wrQYvIRH6qYqTxo2rpD2dU1243Dtgl+JAVqN3
         acLnl5VuuZ9eTwrm68preUkePZMqtpdNK+7wrPVdvc9T+bM9eJVNVJSGKEoBfTWFALiN
         OnEQjIBtFFboc0Vit9RevP+uOcnNnkJxl/DQb2ymspVTddhAddoO7SNNlB9R7Ar756F1
         WHZQXQYHxYBn98lxMqdP7mRSvxETRHJY/F006Y9UCw/Qrl0YS21Wg6vEx1y9gJBGENqa
         ny0pD8kvrz05n10TAh+tgkMLGnbZz5zRMTtln8J/ogXzmlusCEmYwRvdCrNGjI3voq/u
         32og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769809490; x=1770414290;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LtEj9II9/M1aLm1RTC1VllQoW2Yjzu7fOoRqZyTBgCs=;
        b=OOkg5ctqaWAv9//knCnDgSYrjpwMlqdHcLe4lsqvP89H32VDc4iTbxSYMXyiJoTFI1
         wpx5n6nEY8gvekmRtodPyl3J0DGf4i6c7ffka96GgUDDhLuLbTmy9vbLJVWlSbZijojz
         Xq6JRctVWNgCiL73lASN9R2RrR/vQK6KvwTYw99OOOXvI6Obz9X2UTMxl1AIRK7bS4md
         m/XPoNplM0qYPoxibdiSrXp51pWviexP1pBjMFp36An74wvFfND1+3CwZkxf5DF4YYCk
         vHy6Vi3qVGxFWGGtuZw1bNXQdlVBi7xxPZocNeaV2Ze8Nb1MrvsvLrTBOUcnK+aV0tW/
         yzZA==
X-Forwarded-Encrypted: i=1; AJvYcCWducVp2kIA+4wqmokELlYJ/9sKsl9eZnUouH9hq6r+R99K+yzeLCHUN3AlsMqbdSl7rriBI+2Ag1dhqmYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDVB0zdGy9FeB9miGK18SmwKBesRuCcfUvoqTeTHqCTbZY05hr
	0xYs06QmbK4ohKKtU9rKv+GAgPcUXg0N17c09w/c5EbxuWgEphPjQiq/PPE/ECR0YG+U/LS6HNU
	ZzEaIiy+peL+7ebImr7iVfNpNENy07x4ootAEDCsYEqEhu7jvhmzPPKj3D2JdowrUHj3C
X-Gm-Gg: AZuq6aL3/y+/7q9QMhRopEuaF72Y8WBXSA4mHx+3e8bu4/yKqPnWCiRDIGeEVmr+DHt
	VAJLGtptEzsou0UgoOpc8BKr1q1PcBSflAongQdFMVX898QJ57vOXEUq5y+MPh6agMgdHe4bypH
	dq7StLtRdvFB0qIdxqckhrSoEjtuQDUq5otU7KOfAIQtjs904oPCgK/1tkkK4c3bQSRuRKvpH7z
	FrYdhX3DDaHKE6JBJA67wt7k/3gEUtmrtPKK+DMypsB43Odps7MQ0hDYgzaIo6cnku9d5JE482f
	HECKtzonTaCwBoAsDqqpCRtPyeUcUaFLaji7N+oOEsUYJCuM6a3VkZ4B0hiw16PzcSk+UpErJLO
	QRRByMbeTXHnM02hDONDPwEWM
X-Received: by 2002:a05:620a:3910:b0:8c9:ea70:aa4 with SMTP id af79cd13be357-8c9eb23dabbmr587320585a.22.1769809489905;
        Fri, 30 Jan 2026 13:44:49 -0800 (PST)
X-Received: by 2002:a05:620a:3910:b0:8c9:ea70:aa4 with SMTP id af79cd13be357-8c9eb23dabbmr587318085a.22.1769809489274;
        Fri, 30 Jan 2026 13:44:49 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbd3953esm34541875e9.4.2026.01.30.13.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 13:44:48 -0800 (PST)
Date: Fri, 30 Jan 2026 23:44:43 +0200
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
Message-ID: <2vqho236mjlsnraqif6ivic6ybblnsmk4litqw2sbfpjvrp2t2@eztnjrlsmrp6>
References: <20260122-upstream_v3_glymur_introduction-v6-0-245f408ed82a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v6-3-245f408ed82a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122-upstream_v3_glymur_introduction-v6-3-245f408ed82a@oss.qualcomm.com>
X-Proofpoint-GUID: 0-0R9eu9r95YS2AHt4ZARbQplo-YJwtw
X-Proofpoint-ORIG-GUID: 0-0R9eu9r95YS2AHt4ZARbQplo-YJwtw
X-Authority-Analysis: v=2.4 cv=fZKgCkQF c=1 sm=1 tr=0 ts=697d2652 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=wwj1QbHfqlsupVj5eVEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE3OCBTYWx0ZWRfX/dt8xDoQONLs
 ZcOYjTaHvi0ol+cOkiJinKUzkTPJeEOookh8ENTGtUGw57xUXjNAY8mmadrO1yKKC7896JOQxci
 n5MwsUCAjrZUhopmhtlTtzw0UP3Yrr4rz3nD2o4dTc0BPD8pl9A/w2yPnQWUYSnUlGvVuq1ZYvU
 Q1tv1+kT6YuIgv0Q6UD8WocUJOnCH10IZLnlRZfyVJVLmdmvxcFWpeoVblirDXDemzG0QeKzIyM
 XntoprV3RAoD9jM7ZwPAiiXMAMy2MWXX3VHOVwPZ7Hqd4JI4hFgCK5x6M+KfSFm9iAKBD70ij5Y
 ajXUqfQI1dq20N3QlPsx5n5Mi7A9D5Ztbj3E12li9Oe/G1+z7kgVggNAlObwoONm/oxowmB71TE
 ozDnjX1Yk5aAidqP19kfKxRswQcYmWFqoe+XXFduOCC80A6avvYGu2RaRTL61w6giGd3qiylkKV
 AhMUHqZLjlT0zKORurg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300178
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91335-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,0.1.134.160:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 86E09BEDBD
X-Rspamd-Action: no action

On 26-01-22 20:54:00, Pankaj Patil wrote:
> Introduce the base device tree support for Glymur – Qualcomm's
> next-generation compute SoC. The new glymur.dtsi describes the core SoC
> components, including:
> 
> - CPUs and CPU topology
> - Interrupt controller and TLMM
> - GCC,DISPCC and RPMHCC clock controllers
> - Reserved memory and interconnects
> - APPS and PCIe SMMU and firmware SCM
> - Watchdog, RPMHPD, APPS RSC and SRAM
> - PSCI and PMU nodes
> - QUPv3 serial engines
> - CPU power domains and idle states, plus SCMI/ SRAM pieces for CPU DVFS
> - PDP0 mailbox, IPCC and AOSS
> - Display clock controller
> - SPMI PMIC arbiter with SPMI0/1/2 buses
> - SMP2P nodes
> - TSENS and thermal zones (8 instances, 92 sensors)
> 
> Add dtsi files for PMH0101, PMK8850, PMCX0102, SMB2370, PMH0104,
> PMH0110, PMIC's along with temp-alarm and GPIO nodes needed on Glymur
> 
> Enabled PCIe controllers and associated PHY to support boot to
> shell with nvme storage,
> List of PCIe instances enabled:
> 
> - PCIe3b
> - PCIe4
> - PCIe5
> - PCIe6
> 
> Co-developed-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> Co-developed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Co-developed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Co-developed-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi         | 5913 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |  187 +
>  arch/arm64/boot/dts/qcom/pmh0101.dtsi        |   68 +
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |  144 +
>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi |  144 +
>  arch/arm64/boot/dts/qcom/pmk8850.dtsi        |   70 +
>  arch/arm64/boot/dts/qcom/smb2370.dtsi        |   45 +
>  7 files changed, 6571 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> new file mode 100644
> index 000000000000..16a3c3ecf97a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi

[...]

> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
> +		dma-ranges = <0x0 0x0 0x0 0x0 0x100 0x0>;
> +
> +		gcc: clock-controller@100000 {
> +			compatible = "qcom,glymur-gcc";
> +			reg = <0x0 0x00100000 0x0 0x1f9000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <0>,
> +				 <&pcie3b_phy>,
> +				 <&pcie4_phy>,
> +				 <&pcie5_phy>,
> +				 <&pcie6_phy>,

I'm afraid these do not match the array from the driver.
I think there is one more <0> before the pcie3b.

Please double check.

Thanks,
Abel

