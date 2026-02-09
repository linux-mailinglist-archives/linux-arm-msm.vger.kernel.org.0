Return-Path: <linux-arm-msm+bounces-92225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOpxMGifiWlU/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:48:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA0D10D2D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 09:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55E5330115A0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 08:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 640893242C8;
	Mon,  9 Feb 2026 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oK+sqqOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6fMDpo6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184ED242D91
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770626831; cv=none; b=cY+ii15P56kL0jD7TMklrewog7wmxxhFzNY0A9IOTYCu2bsGCo9dQetYQIMJwiEhL3r99Kus/m2G3JPCIzUOMB7C9ZKMKKf73y4m2UTKrP5QZZLC++Hv2bM1giQCZ67wiqF3yh6/Tjy/saB4DIjndP1sSQqRnYkIWw3ehwzlpKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770626831; c=relaxed/simple;
	bh=EVLGzhY/+vxGk8rPYzHxopjt+2ZHWMPVia/mAK3eOcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kK9Ih1g3OGeY0bR8ifCCGO1Ed34/gpPHpkBVFkkvkconO6bB2sNF8OXYXz1hRw2aU+QCqh6kqQ6CybShyEG6xruklSN6ePEJV64unCHjGTtzxSce1Q1jAg8ngdf+02U09UGGoOmlLJ8v6DLxrIc8EvJ1Ua3J+SU5ojMbfydI5Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oK+sqqOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6fMDpo6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6195NccN3347579
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 08:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXZgtXa39/CsxXGVgii7CPd9eEnYYHbZY4wT3BLJSgw=; b=oK+sqqOB/ZIuZrmB
	j/+emV79CTQyVFfF+0lPArsPTBwNSgV++tctmboLW12//cIDDZxLFYqnsagDgIdB
	T6IYgsM0nOHZjv/ec3IZGB7x5Zx+TdZ4g6cHbgDvkJLC+UHqqpCZNa7Hj9k1MnwA
	mCyq+2gO9+YDn62Jf5t3DC0lpHFatH6j6sKq1a0Ixo7u/QD+KpT8ZDddpQ+YeF7K
	iOO4G8WIcLpVNnjYBe0BOdm++U/MzLjiM9dMoqMXAj0D3b5I/Mx1OovNdg24hFgj
	zZRysW4APpjNQoA+lhCtbwEyWd9iUCMkReTx6e/FH9WpygJMD5eiVqgfx5LFZ80j
	0l9Emw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79cy0nym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 08:47:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a182d4e1so60743185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 00:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770626829; x=1771231629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rXZgtXa39/CsxXGVgii7CPd9eEnYYHbZY4wT3BLJSgw=;
        b=H6fMDpo6ph9Vn9n69chxCHj1EQky9QpkdNMgSs48WENWrlGbe7mKgDFtMykMRYJTWi
         bKi0zZOoJmAT2WI0fRbuTx1+vCBbJrYERvXANfryD8EusOlfV65k8LOrub91MrSxflUt
         0h2nrXCynFAp5w/CmegG158GeGpS2yRPxCgQz/AMX/JXC9dfNQlzHKQBvrlGdwt8Xap9
         b6Sh6q+jG2uBsbhdAKvSEXbndisSGIkyFDPC3LN4lTtGy51OuYUwwuvgRUrTutU8Z2cF
         lSK0TTqhQ6rtW7+VekPywkuHLCZgr1If9KOrtGp2ci6uwxUBlsO8Wkwii7He0mIFJr8E
         a8yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770626829; x=1771231629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXZgtXa39/CsxXGVgii7CPd9eEnYYHbZY4wT3BLJSgw=;
        b=CxR2GFzvEYNSpOQ1IEPCwJcndwX3OsT74WqQLi7aNjbjM5AqmwbIIPX0ybfqQ4TpkZ
         UmVN8IksG5/jzR3K/jeCs2d82IFoA+P32+7u8DWKyaX+47xd9rZHiv1Bev2y6+wSKVuA
         C2ZhkyxG0tgYn7xK+b9RfV31ODIEux1oP9hVlc6TQM0jXjUE6sJYgITRsyj5+lU7FGRd
         O7TNG7lF9iVSMo8QHcf4L3qr21x55AP5CfmA3FOxFrUK3lSnqjeaU/0nNZJXiOx0VnNj
         k+lmSEKQiMEw3Lq13xUpxMfJxdvOw9ean0Yblzz1uChn7YcLrl6C2ArUkzTRzzcjlIl3
         rfoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrL9skXZLSV8Gi6CpRoDWIXjqc/dbh7c+VZtcMt+sQwZcXaBxCyntCXLnPYrl+6o2Z2SEL1o7Z/sJ15Zbc@vger.kernel.org
X-Gm-Message-State: AOJu0YxWC4Qyi29IPipkT5UaP25EEhm26QzYFL7mI3ZtWDReRGWauLcP
	DH7TOiTIAvDl8ebKlKJXshActMen1gdfF5X6us7yGfrCOYjCy+dQdTz0BczBlztf1Tz2xdyQoTn
	xyEPb89WmYuLCXgTG2+nRlArWdBBgcnmfvH5YLnQFPQHV0+TG2d1lOWBl6OdHQ3Y+mxJM
X-Gm-Gg: AZuq6aLRYUeqN69PhHNPCZV3uNsYTpjS8dsMnfV/aX4uwfWchCLleIRua5B7XZpGfQ4
	H0T78FLr6xxK80eaCA1YrF27DxZX0HzbD9vwgMj+5l1d24h91Sm6qUu4db3NRLdnjoCejwG3vGD
	7qKZzI2AoK2/XTwMWmLNDcV5DZgEVcfUpRO9KnWgm1X1/j2gZu59ZLiW45FOHPgNiAX11nQdZVR
	1bXhBGeSBqcx/vDvccturMT75IAe/A1Vk5zVLsn7K9HcWa6IBtC/L5B3JbpFTpsj65tuN63AMWJ
	PLFddrmTdqzR0mpwW1DrZPO5mAz4iJ1+bSVDCHyVSMbE7OcCWPGKkSTBEPmBqhaHRppT70QJXVz
	lp9XuViSbdg5aWziCzZI2MOTzwR2jgyLaOhI1WsDpETvGFjaRC4Clqd2CfaPMw/p6Pzk=
X-Received: by 2002:a05:620a:4110:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8caf0d3d550mr1062521085a.8.1770626829326;
        Mon, 09 Feb 2026 00:47:09 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8caf0d3d550mr1062519785a.8.1770626828954;
        Mon, 09 Feb 2026 00:47:08 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb0015sm359157466b.44.2026.02.09.00.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 00:47:08 -0800 (PST)
Message-ID: <86444bf0-4672-4f64-89a1-9a830b04a5be@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:47:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Add PSCI SYSTEM_RESET2 types
To: Xin Liu <xin.liu@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com
References: <20260209042700.1186392-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260209042700.1186392-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZjCOs3J65stpQ6OSQmYnjPnljW5yG2kl
X-Proofpoint-GUID: ZjCOs3J65stpQ6OSQmYnjPnljW5yG2kl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MiBTYWx0ZWRfX4DpdIVMG0bsb
 nXdxe6dunXoH5iwVSji61blURGZMlEffILlVV0tTm6F3OdSlyFLAppkg2IvWQBXWrLXQwZMcfRp
 C2OsHLAielUttV3ORH8CCucAARhbPPxYf3Ee/0t4GGoloH3Lie1DGurw/pyMLIf7yut4rN1EOlG
 9PRo3HeN3zGAdzo0N7twWIj7diT/XvR6mLx0Q6iszeVWAlbqqDeiWfePf0VJvu5A6+wN0ddG1Zu
 1hcmFx//mxDEkjgE0BFELsODoSshEiGorVARlGf2IrmGSSzE1JPcc9xmLZrJjo4g6WAFCIlQmOr
 t7oDqZK56QFnViyUtFssvAlgzlQ0UO08QQi8t7YJ33hoiusqArRM7ZpJoAOo6/GBoyf056LABkK
 vWC7z6l1aDBcTBLiaS5zuKw7EBo+3MV3W/F+Bm52K7d2+j7hVDySJmJtSGUClizQzgghqf4JgWZ
 G4PgYPdh243xhZ3A4+A==
X-Authority-Analysis: v=2.4 cv=EtvfbCcA c=1 sm=1 tr=0 ts=69899f0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=U5OHXPGs9fPUQxsCYwcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92225-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6EA0D10D2D3
X-Rspamd-Action: no action

On 2/9/26 5:27 AM, Xin Liu wrote:
> Add support for SYSTEM_RESET2 vendor-specific resets as
> reboot-modes in the psci node.  Describe the resets: "bootloader"
> will cause device to reboot and stop in the bootloader's fastboot
> mode.  "edl" will cause device to reboot into "emergency download
> mode", which permits loading images via the Firehose protocol.
> 
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index db65c392e618..2a490e0a8b5d 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -450,6 +450,11 @@ system_pd: power-domain-system {
>  			#power-domain-cells = <0>;
>  			/* TODO: system-wide idle states */
>  		};
> +
> +		reboot-mode {
> +			mode-bootloader = <0x10001 0x2>;
> +			mode-edl = <0 0x1>;
> +		};

Will this work on any hamoa device, or is this dependent upon the
IoT firmware?

Konrad

