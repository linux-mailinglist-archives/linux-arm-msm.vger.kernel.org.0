Return-Path: <linux-arm-msm+bounces-90095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JNSJtB7cWm0HwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:22:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D884D60478
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 528DB68B7AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 01:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CC634EEF9;
	Thu, 22 Jan 2026 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O777Nvcd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IFPgWkeO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C11330668
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769044935; cv=none; b=Cr8wQvQ1oQIALHmIPhMLcQJPqEuMET+IYJg1CG34V+4PLoO1ljEH06ooYKhMJplLBEFm7AsPlUInjZ/OxkHoAiUvidAp6/aiWR4D0V7SFL5PSjDYlrAnJL5iSmjXTgGdsNn8kN2fGFow0teeal1jeLpB6Cqk2wFdzGv211ogHwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769044935; c=relaxed/simple;
	bh=IJpye2ZSjDSFvA3vIutKWKKL6jBfIdG0bBPWhPiDk2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1JA8BlK21JXTIMilca280hmFE1o/b9jgvWMoo8wAQGJgPsbfR5PeqkW/A0YQTkVVx8CpazorTkDLJKiBYYxZQv7jfcUP3xvWSUA87REIhKgS0ofJRteVrCfUeEsZApamteCl2xiOCEaFpR3wqDjilYFElvktLfnAQzLV2ZYTUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O777Nvcd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IFPgWkeO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LJ1S0A3902101
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6N3XpqNLxBK2CAf6KcJ5efxaB+ErQWCrL4MhdjpILf8=; b=O777NvcdCRONLlwc
	KBrw86rVTskoct+BaniYz/O/9Jp4Icx2eL1YQY9GAHd8OOAOpBhODyA7jxJlBday
	BLNAfkr3K60kXzBiReOXf5UH2G+I2cp4tJw8C+z3Dim1ilUaB44gD5E/KPaFcHGw
	A/cf7h0KABnrEUxc35rWDrc/xsFA3LB5mcnhIz6EgN7p+6D98JmZmTUi+4tHq4hI
	Yz3eKHV57PM1d6k11bTiegz+ilS1Xj2Nn2LyjO6n7xtxiLXhjnmvCOyQhXZWAkV+
	Jrne3NHZp48UzSZfC+HN4r0KmuVoZ9TCS1Bb/HlhJ912D0vqtLVbZR7RvSF+9Cd1
	gR2Leg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu4khgx9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 01:22:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c53919fbfcso107076785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 17:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769044931; x=1769649731; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6N3XpqNLxBK2CAf6KcJ5efxaB+ErQWCrL4MhdjpILf8=;
        b=IFPgWkeOj4ykRVAZ05wptX0GOAGmZQwg0n7JvEdqPL8K8vAi8JXO7HgQUdB1I5nZT9
         p+3qSBd3f5x8lszhlwHOtO0oO9vP293j/rMIxy96lrm4q4/3wB8roBmNZlqvEpQ1vt/5
         bNuBSPm3JBYP7onlXy3MYjwg2mAYe/83MVN7biXOWchNzBbYp6Ha2cfu4f2mUZr1gQrM
         XUuyCRWfTmThkq8TMK3/T06/H50nyG788gW3obWJwtjWl7mNVsLnMq1x/MdSlfm2jBCV
         7tcfhUHamCv6X4o848hWMPZmmYeK1yz10KdiKPIcjiWEx8UP4ufW/FRdyBX4i0ubVqwN
         7iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769044931; x=1769649731;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6N3XpqNLxBK2CAf6KcJ5efxaB+ErQWCrL4MhdjpILf8=;
        b=wOWZFZvTsi45bLv70zwqfIPK5aPHrBsPd7zXfed6PwwmJIEtJatq6+4t64XykiRqFf
         3I+lfEdwFfqRmb7R8/0OwKwnOHjB2nVUHRapcUktJdi+inPrkzO8Nft17SyJOvAfSsWi
         p0TylyChwAoysvnigwSHS6dkodpcXXgjTlmFmWB9ddt4uO7p+FLLTXUHqfrBAs43kez7
         cdpry5XvlvP8bH37X1CG2M6Y2zm4sOKlvXijgb2rHr9iSQ0zQazsqZRF0/FDQFV+Bu6l
         kpeoHi17Z/eVPLWXeHflUxuztUxLpOwmvmhSlJMO3FGOU4hjDb6fSRM17rLkHgjFOt63
         feTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4TCapEetOCYxeoHLFy9y31idrOuaI+UCXypG3fjV9xN37tPwywK/IGw1cjy+yuYcdf1qoS+tmT3XJ0U7G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2lok7+iVqBDpYzL5sQmURnE6YTAdSdlYgCIvYvqfSH3borvJc
	oke5QwEqQiQjiz7gk/ppHJyW4StVC/c//gnIj1mH/Fmrc6iPCbUChsQvmjCsqKYaDefd9s1t3Sl
	U8qvSMZt/i55KBeM6x6IXM8iwGcj1Axyn+I/e0WC8N0Vs4y9StyIDlVLz37gQO7xfWupJ
X-Gm-Gg: AZuq6aJY6KfwCVT0GhbnsVaSMaYzH1RD/FGLYlC+hntTK4LJtePomBmF8uNthm8jnTj
	EBBy582S2gfDnF3KLLQYfc8QEndJdDUlyJHiy9A55lrFw7wtu4m0KEJGTGcL/7yUpfGONblAgsI
	gWqbUqx4uSK50L5z0vnzgE/6O+t5koNCUctnyMGns9HFO/C9lsBhd58WKT5iZEtrpZ7s++f34BI
	S0HASteymYNwhMe5SixK9ZhttgTmcpG/JN5L3gzx+HwwDKWU1pQ4z6nKH9DbWAeq/ZHZXZwyG1Q
	LrMSbpTssgON6OaKEBSzjf+QIP/mpifwM9kb06ZVtCQxqZVzit9aQpwKMn4UoIzEWachFfk9sIL
	P4pcUO8cAuWkuYHJXY6nW+kajWqP8ke+tOASQsXnLLOn826oqVUwFkRVHZsUn7m52cR6ltfxCrz
	tWYlM0TTcYIzJP512nyR+oE+M=
X-Received: by 2002:a05:620a:7102:b0:8a7:2373:1c75 with SMTP id af79cd13be357-8c6a675aee6mr2553711285a.49.1769044931377;
        Wed, 21 Jan 2026 17:22:11 -0800 (PST)
X-Received: by 2002:a05:620a:7102:b0:8a7:2373:1c75 with SMTP id af79cd13be357-8c6a675aee6mr2553710085a.49.1769044930872;
        Wed, 21 Jan 2026 17:22:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf39c02fsm5054567e87.86.2026.01.21.17.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 17:22:08 -0800 (PST)
Date: Thu, 22 Jan 2026 03:22:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: Introduce Glymur base dtsi
Message-ID: <pmkxaslxodh2cnxbxy6wnyalb4zl64xek5l4cfhtw3k3ywatfk@hyzhbh7wzzji>
References: <20260122-upstream_v3_glymur_introduction-v5-0-8ba76c354e9a@oss.qualcomm.com>
 <20260122-upstream_v3_glymur_introduction-v5-3-8ba76c354e9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122-upstream_v3_glymur_introduction-v5-3-8ba76c354e9a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAwOSBTYWx0ZWRfXw1FTl24juFfK
 GN3u3wmFZRfqq7tez396SUnG1VISG4MZNTKHTrSniDD/4JcNemQ2Ted/nNac7YK0J1X++TDumhi
 wY05/xKkqn2UldNhu/YONa/Vv+lBUizvaJOfRVS8no1ZSFwKLmMmXkhn/iKmDVGCCeL6VhRmWX/
 M+OKYgpPUaTDRcuNGdFpkMkn3es9BTd92282wMZwm1RTCAOvtWS+qjcMQ9UYnTpXn3U2iAqfwO5
 sIPbNaC8L4cA9QUg+Lw/zZrn3NyOWDb9et7FwUBeSVM9fA1WgoUYA80MnIhN/yhx6dYABEV0Gtg
 /lAJ0WUc+JEdbvn65BVky5VNvoW1wVK7AidzJNU/aZUwm6TWdkuk/sio4kOx3NjNiuQYJIQaGpy
 XIobAotGg0V8xHRbAE1XIBRsd+cTfPQJIVhbNIuh6jO770JiT4B8+pRqNNpRqfwbB69iC0MbjSi
 oyzp5Y6i8DccWwPQb5A==
X-Proofpoint-ORIG-GUID: gjBLQD3wLSH17341HzrhL_Hjch31QCoa
X-Authority-Analysis: v=2.4 cv=UOjQ3Sfy c=1 sm=1 tr=0 ts=69717bc4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=-JAtPEll0wwCws6h7MkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gjBLQD3wLSH17341HzrhL_Hjch31QCoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220009
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90095-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D884D60478
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:05:13AM +0530, Pankaj Patil wrote:
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
> PMH0110 along with temp-alarm and GPIO nodes needed on Glymur
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
>  arch/arm64/boot/dts/qcom/glymur.dtsi         | 6122 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmcx0102.dtsi       |  107 +
>  arch/arm64/boot/dts/qcom/pmh0101.dtsi        |   45 +
>  arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi |   83 +
>  arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi |   83 +
>  arch/arm64/boot/dts/qcom/pmk8850.dtsi        |   70 +
>  arch/arm64/boot/dts/qcom/smb2370.dtsi        |   45 +
>  7 files changed, 6555 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> new file mode 100644
> index 000000000000..c0ecc64202c7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> +
> +		pmh0101-thermal {

Why do we have PMIC thermal zones as a part of SoC DTSI?

> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmh0101_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pmcx0102-c0-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmcx0102_c_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pmcx0102-d0-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmcx0102_d_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pmcx0102-c1-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmcx0102_c_e1_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pmcx0102-d1-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmcx0102_d_e1_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pmh0110-f0-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmh0110_f_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pmh0110-h0-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmh0110_h_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pmh0110-f1-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmh0110_f_e1_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pmh0104-i0-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmh0104_i_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pmh0104-j0-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmh0104_j_e0_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		pmh0104-l1-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmh0104_l_e1_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +};

-- 
With best wishes
Dmitry

