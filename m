Return-Path: <linux-arm-msm+bounces-112756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nw8xADqmKmqAuQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:12:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A7671B60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:12:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YKxjK0mF;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=EvpqSYIo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112756-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112756-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47BFA3041A05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C36A3EFFA0;
	Thu, 11 Jun 2026 12:12:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3174E3DA5AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:12:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179943; cv=none; b=C+8yTeFPMCUmyttGAa8TWOETloSvxEPnIuYELu6Yisp3NzLbR3189ztmnUhE8ZVZ0s8i1PbIO8b0RE7QU1ltV3x4xUNp0COFe327vlVGJEO6iyeaqjdP7omhGG73uJu5tFznrmYLceco2EUBLPdealRUStycqy2QNPkkVtA1S6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179943; c=relaxed/simple;
	bh=EA0AUAvk35NQY6LEzUqKFoDKZRbUWX0Uj3FBO1tYFHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H2PmRKRHcHmHEFEfO1r0FkWfmTfsO/ZTUZ5l0okxymnVwf9vg31Z1tFj8bliB9spVkEhcx3jHqZJpxVAqn1/+AIuSNmw8IUzV4C8z6lNUjqRmAqbouPVOtGhkv+IA+XF75G0XiuBx8zMmBgvUJAQ6A1YAVzCAuFmE3xxOjvieiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKxjK0mF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EvpqSYIo; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xpNu214471
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhpDgrlDLbFb+gFJWSuBHVMi+xPJTrQFLIJftKry41k=; b=YKxjK0mFYbpZHDzE
	GEyMKy8QPifImiJ5OX/OSrAmNm1Id0OPwHENm99gxOxfO2vjpGspb4R4Wbwv6Izi
	vsG9+PN4KhqkqEFju0YzWna11qHFt7XBFcmj7/BNyYi45IkaZ6Bhx9ibffn6tza8
	np7NXZT37f0dpgjIn84eKqT0ko9EtUTHiJ8PhEiUWFWEkTs5h8WRB/1iCCNcT7Kb
	vPtde36RHuCpcUcCdX/O88Yw6NH+a/FcaDzNpJFxbP3AnvV/EzeEYSNZ2yDcBuvs
	6Csg8VrjLvxsnjg5Cp4V5K9VMbVs1S4lu7NjrhgFMQdwXwCrd4IJusZtsMf4Lx37
	x5+OOQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6skcke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:12:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8421ffff8a3so9702211b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781179940; x=1781784740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QhpDgrlDLbFb+gFJWSuBHVMi+xPJTrQFLIJftKry41k=;
        b=EvpqSYIoCiDZW10fHKlaDIPBVn3JNe+b6YyCnhJzNoGy2YfruMd0SRQx457iJRh8Qk
         yV/Vr8gj9DnUbYb7o5zSTFscIaoDy8GdLwD6ED2tR12Q3rthgK1EimPs2ZhBjdcqxtfL
         AxVMBMCr9+tQKSmtsQTb8DZ7pMrGPNHsybgcaDRTW2s9Qp3fC9+Yh36g62qPoGZaxaed
         lhHiXnydz6jbXlKQEc15cROPS4moHnXrzK2rDAeZx7FDbGBQTWDOE3fFziQoKhGXnQEQ
         fXO09Ak8Urz1q0mmNDsLiptfeZUuOut7LpjF1CnlnRKT+qmh3EwrisLhpSJww1tMUhoV
         Lf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781179940; x=1781784740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhpDgrlDLbFb+gFJWSuBHVMi+xPJTrQFLIJftKry41k=;
        b=kTiMqkqqvDIUy7BhR8kEK/mIiXTXDDRkVTXrfbj20VBQKlR6eWK8iSLbjyIF3bSge5
         PxHlQBxZaCuzWq9+1Lqnp2UlVnpLfMUPxewB5QZkHAbq6t46Pyw0ryiq43KKRiUOmrJj
         j/DVBGuNidT12+P+Om8Nv+hzGJJmfvj379t604Bvtj6pI/eb77gN7pB3Hv8tT8qgt9xh
         iIQSIslty5s5j8qIfBHubkBw68Qz6RtRFz+qccN+LmqxDh38F6W5k/gWlHPM7L45ClYU
         Ecm+BeT0wU5hj4/M29xtLC677kcaGORfJ7fPna7OnzscQ5IQ5VBSLw2ouDcfrQk1YhEL
         4b8g==
X-Gm-Message-State: AOJu0Yxsu2X4gWr0V33iVb/wrBTdtT6tAiZwjWjMGl9OVj4bkiApJVE4
	5KIOvNMSIeg20Lmk4R2OikCozRLVHACa5cmYH1EruklgJHY3dyv/k2+aGpvbUV9Lxve5TK131co
	oelA2tA3bhlo2bMxQJ22OlIfA3yAz6rlgJ3frndta7j90NIEEp0F18BhsKYTDWGOqwZKk
X-Gm-Gg: Acq92OHJcyzyOesIteBt+tZVfFzj9dd7drHEv3w0gpZQuahuxTlmYNWWZuhYo7lTmWJ
	Zyakcjeui3XNhaHCgGL9KO+OjodZxDPWtZyKl1R0xwV6hLyjDNPhJ5sVC154gKlETkQIIvs5Xkw
	FjZgKQUsNa1jn6/5v1MEA/n7vQ6TExXCN53bOP5hJEB9flF5Kht9pQ6e2BFMyrXP1yODVA1fvr/
	clOQBxNufRUHOsFWlSwiybdOrGLppqLKUCggt8CJqNgcrjzpqimu+PZmMUoRJsMy9y+GcIelLkQ
	2SQE3KQl/KxfhL/shfsnSzFPbR5Ay/Kx8kh+MzqM4nm/uBJHnwPzq9W0LWI/W+XitGdLjZVRyeM
	IcBeq1N75J8G+tc4NCoIX8W35larpqvVZy0qO6uYaYWlATw6Fb2vErXW/m+s+ktU=
X-Received: by 2002:a05:6a00:1905:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-84336bdb046mr2759781b3a.39.1781179939970;
        Thu, 11 Jun 2026 05:12:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:1905:b0:841:dc8d:8066 with SMTP id d2e1a72fcca58-84336bdb046mr2759747b3a.39.1781179939535;
        Thu, 11 Jun 2026 05:12:19 -0700 (PDT)
Received: from [10.92.167.195] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bba740sm1926825b3a.23.2026.06.11.05.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:12:17 -0700 (PDT)
Message-ID: <184dfbd2-4781-4dc2-9165-66b3617bde0e@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 17:42:10 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
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
 <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2aa625 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=QRdWpJMrku1fmPn5X40A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 3bn4QjTBlcctRjfsgbjJzjf0XgFr-swC
X-Proofpoint-GUID: 3bn4QjTBlcctRjfsgbjJzjf0XgFr-swC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEyMSBTYWx0ZWRfX1F/x5RWG3bVq
 tY6uWh9FYJeWKqcjJf2hDaXhSLNTit/oToG5ZC/gkSmiAdX23op4mkNSqQylKX+nf2u67NeIwmm
 0o2QziePHCMdEQHaWnjsJOoT+jqlbiYZvRcxBOxcSD0/eD19JbUVeZ0eOioO9gFJJpFzp4jJO0B
 VrNl6QrqftYaPHXYHeb5RU0Egg3uSs4ABwgdtMtk6c6K4CQ7m/Oxnttl/mAcNE30/fir2iiRDEX
 mkYGCcsmtIhwywjrMXi6MqWglPZSRUWpzlWYZzBG7IU224BY80T7uBOt70FMBFB9Sso4ybvqaWy
 kby+W21LJhHSd3W9RMgIPe163zuHDIr5odi9uYA3Ye833o1tLIsObykcNZTNNxGBXCFy5tsaPlt
 EIqF1Hf9BH2VHaxz4Nj6wZVwj28wZvVJGNOUDd+amoZ7fdU0R0spinNN+zFDBOAJYn5GJF/0HMT
 wuZUQm/3bviKS01UgGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEyMSBTYWx0ZWRfXyM7r382cvK7Z
 IhXQPuNsmsbh5HXcO832V5typnXODgtxyudETXcOhQGZJMdlw8hGVBz/OPWj7Mw0z2GOcS70vPe
 a2BufugqCk1BSnOC4f7LvrmMiRI1J48=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112756-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B1A7671B60

On 09-06-2026 03:17, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
> platform.

s/eMMC/sdhc

> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index ecf4790f3415c46781c8e790d7892a41300ee7a0..cd76da7e49d8c664df6a60b5c18418c4e97a3ba4 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&rpmhpd SC7280_CX>;
> +
> +			operating-points-v2 = <&ice_mmc_opp_table>;

To align with sdhc_ice(as label name), can we rename to ice_sdhc_opp_table?

With this udpate,
Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


