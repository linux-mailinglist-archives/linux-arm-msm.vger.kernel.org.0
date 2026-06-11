Return-Path: <linux-arm-msm+bounces-112757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oQGHDwuoKmr3uQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:20:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFBB671C39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:20:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A6OBpqGq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fUhNIafw;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112757-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112757-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47C2430098AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A663BCD34;
	Thu, 11 Jun 2026 12:20:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EEC357CFB
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:20:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180423; cv=none; b=kEFC7k0kumY0RcyO7Yoix6aMC/7Ihb/qWuZeREfWTrIHc5F4zFcJf1BnYdww7X1sqHyCPmnxV//YHmjTXu+Ze/RlafRP3NbeVunOQhJwKUgRA50xm5ZOth5GJmxJpKVuzl1XLF6Dqx7VnYuVzWaLDipwHSgCS4ln8BkS5PbFZVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180423; c=relaxed/simple;
	bh=LD5koep+nrii/XuykvR3Msykmd/YE6bxJye9b/iheAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cylv9ZPY+FwJCjVlDLgn6aCX6d3IdzXTv0wzlgmu4kM6Jy5NFKyGrmDQH49QSJw61NHnQmGObUT7F3f0FVo5iiWdJZYl/v8ynrL6xwJ/MZfZ2abY34T24ZBJToWU4J/YFTEroHsSwAUIKpgV3V/x/hwYX2Uh3nrDopaAkZtcKVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6OBpqGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fUhNIafw; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xRGF174158
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvUdbixww6CTGMe6OrNevndOOKL7ZNzp2IY7YAuE0kI=; b=A6OBpqGqmEZMzkZL
	aNeAZ7SbvyzaXDBfI0tUe5+HWCBd68U5xPpN71bLr8J1GQxpNmHQuEzHvdYBcms+
	O0ND70Ndjsba0YqlURI6SmLFLMVvVMNBL/7o1eWkHDqHIdJBJVFBKBAKk3MmPc59
	OEZuANvEsvSK2TRiC1Sd+Gu0CQua2XoGWWavBNe3AnXHFceCu1jDobQDSNPkOpYg
	NYxUJwxmqqngkK5jIelEsIwNcM+HODQveriYrLQ1yedKC464i7wtLwD27RBNKPDN
	c16zsSUeMNttXyZzBCZK05AMvDr35iXKNrPOHrgbMWhDwMw0wYdlL3JA1kRfl1oh
	6xLl6A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vb914-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:20:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso4761065a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781180421; x=1781785221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvUdbixww6CTGMe6OrNevndOOKL7ZNzp2IY7YAuE0kI=;
        b=fUhNIafw/M4Bb6p5Pr2nh+J0f/GdaYGD/uIMh9lZUw73fsiMKJpPm3g3e5I/LxylJg
         G9kC12jLmCKoEJZaJuGWaDLSmdI4z7w7y0UpuegwJ4bw0YceUH/wY6FTUVJvSwG3UpqK
         8EA5SpXdTzlFBODPncV/RrOVhmEzcguo6jFgYTbRVKzrG9Mix4b9e/YqHLT1pQ2F0Zx4
         4zIvCpXgVC4/G+70k/4d7uIDmCI98+CgyYxMf2tKGg9H0cAC4F2wa2pw93PUAttsZ2VZ
         h2o4jmylWRmKYRDPUiBfEvAa/CNJWWEZXEi31fDD7caU0OSsiH80dXje2lSq1BpfRitk
         3wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180421; x=1781785221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvUdbixww6CTGMe6OrNevndOOKL7ZNzp2IY7YAuE0kI=;
        b=VyEwGyPSbET4hpYu4eqXdTCEKWlCMt9DVzKkBTHASt9bdFBycADartzwHEoIt0F2Sk
         57Y5WGOob7Ld9/WRHzTDL+ADuh0gPy4j030CJ0Fr0o96hGRa9LlhZCgJuVbFojyVhFbj
         AK31GO78Ed9OxQjlLRvObJv/NDKloeuomqrFHpRE9X/umW//8YJmrchrBG4cPcCGQLpr
         mdp3tcLwOxpzBJwiSWyysu03+QcroniR9LYi3foYJiS3ddE548khUYmuLxVBDrt4OIG0
         Rlfg/rma79cTwA6oh+g8DqhGb2MWfZcCpxVRWB2FKt7pK/AdOpq+ZUQfHV6VHvz/hVUX
         MR9Q==
X-Gm-Message-State: AOJu0YyRKgVWFkVgOAZfMSq9gRzisE5j8oO12fhkoO+h+ZW9x96cPz2q
	avegqdgZzld69plEwZxA17TzBbfiRhMFyBpnj9MF4Ibgbrj4tjNO5j4/K07QtOyBLLaMT52XLKq
	jgeav7xMu/u08CiCP9U841WM6JSp32ag0kpvZ+BcwTAf3a1GB2noMiyfW8Hia8qTwMlrQ
X-Gm-Gg: Acq92OEeQ5aCtGe82UKUk/hszNPljxqM+zR+B8kf5EEiUPEAxWDw8iQSALQwhY/HTE5
	PDvgXkBw6x+xs6durnt36S4+fyYArvLOR8Ubmrm8sZFVGKMDX8+rBiLx0zOM3sSKoLhWJIt75/L
	iReU6Jtc9oDmEKfzChKZxp3zp29jqxetJKdAqxuLlnAUhJXJknq0/5zHr+tLQXA884pvXyRBkRj
	icvfloTlODagiAHQBdh3sQ0c4Qnvpz0v3+xeje5AMUFOOG0OcJXht005bxayPmQt/s4NUVARiv7
	/wjcrmuJWg8keaAE2bmwVV8S7PL9rTPwjRGzlxN5rIXKJYztGzCE6fzJFP3lIcdSr0DJhC3ndu8
	T9/VM6pXPf3c1/yx13FgHlI809LdTuaanvsPiILak5PL9nILLqBq4AcwKdV224go=
X-Received: by 2002:a05:6a20:7fa1:b0:3b3:fce3:a7f8 with SMTP id adf61e73a8af0-3b5e31f33efmr3104335637.15.1781180420575;
        Thu, 11 Jun 2026 05:20:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa1:b0:3b3:fce3:a7f8 with SMTP id adf61e73a8af0-3b5e31f33efmr3104280637.15.1781180420116;
        Thu, 11 Jun 2026 05:20:20 -0700 (PDT)
Received: from [10.92.167.195] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865880cc87sm1827061a12.23.2026.06.11.05.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:20:19 -0700 (PDT)
Message-ID: <7c94758c-1100-43d9-a0a4-2cb7df947cc9@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 17:50:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rcAMXPLcPcQgEF64JHWhVvrhFMF90dM_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyNCBTYWx0ZWRfXxyluhORNyVL5
 vv023yK4UOuaq0d+3msbu9lXkWXwOZ/OJS2/KbSK7pl1jNSKbld9p3fv7ITZO7dUYr9gBLMjLu5
 ipv9aMAjZY4opJI9/wOelsIdLzjiIZ0=
X-Proofpoint-GUID: rcAMXPLcPcQgEF64JHWhVvrhFMF90dM_
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2aa805 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QRdWpJMrku1fmPn5X40A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyNCBTYWx0ZWRfX3aV5NhLx5Pc+
 AVxMp+BmpWGLc6LWP38IlNHe0N5UzE+QDJgN0BkISwlvClSx8NREj4x1/eNsZPwpZW6wyf9y57B
 nfSsbSm+K+kY/tS38RdUjtUKyHzaRfLUhYdYvlm2BVT9yOdqofdwpH0YKefhhWtSbv2HE5tT6b6
 Ss2b/13qxg60WJ3RMiHRRayVvSJUDzCPkOXr5NKfqesc7rFESSF+Yo1PyWqXgpY+YDd/Ohk0WQp
 iz36kGU4VrMP9U7kGCnBO8O8MbZcgxpAVTxAzCEvT79k4F9adMLYnlpS2semZdphlouZP4b7I8s
 YT2XqDFnqvz+/yg90J6tMt8vCSyleArVUuoneNVb+GXf8cLl6fKNfRWjL/mbm3YzcI6GeIa/vwe
 rkWmgWl5OXxNsE92YZu77b4vvXwT0jIRmlvkp9pTCdd4CRlqWg5slm2ewMdpQQxptpCN9fHJXsF
 EDg3FL6+RvLL7ztNM5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110124
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112757-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCFBB671C39

On 09-06-2026 03:17, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
> platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
> index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
> @@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
> +
> +			operating-points-v2 = <&ice_opp_table>;
> +
> +			ice_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-75000000 {
> +					opp-hz = /bits/ 64 <75000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-201600000 {
> +					opp-hz = /bits/ 64 <201600000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-403200000 {
> +					opp-hz = /bits/ 64 <403200000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +			};
>  		};
>  
>  		crypto: crypto@1dfa000 {
> @@ -4878,6 +4899,22 @@ sdhc_ice: crypto@87c8000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&rpmhpd RPMHPD_CX>;
> +
> +			operating-points-v2 = <&ice_mmc_opp_table>;

s/ice_mmc_opp_table/sdhc_ice_opp_table?

-- 
Regards
Kuldeep


