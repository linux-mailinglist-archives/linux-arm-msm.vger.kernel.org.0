Return-Path: <linux-arm-msm+bounces-91798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP0zDZk6g2ngjwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:24:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C91FDE5BEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 13:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B06EC30058CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 12:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B306B3D523E;
	Wed,  4 Feb 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kC1SZTu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RM7VGpNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED0368290
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 12:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770207893; cv=none; b=hx5ddQH/yKiGJP4ehT2/u0hx0az3xxkuL9Du+vji0K+xidGDIyEbprPb3QsJLaNoAwAl5bOIrMcXl1wVEz+1zcVG0bR7aHBt7GfgsATqHs8Andez6AFTfVWSDP3d/s6Cz5ayLPdFh4ALbNi0UXx1WKKBlXzEXk4OksAea5ANiCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770207893; c=relaxed/simple;
	bh=qMQadl2rnblOT8gLyMIB1TqD7Ybe4e3X33SWCp24Y9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pm2zK0Li43JjDDncQqb85ZfoA7RsZLngKNC4Ub9+TzQj/dg9Q2XpTaYf1NCIUBv7tYlm/gpqDdIJavFdU3LpvWx9HwQc+R6tdCsaY9U4kuD7jewKi2elvY70xikXhNkYWHsbz/zfVzBbbM3AY2egFUX5UoBGo+5a4CMkcqhuR8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kC1SZTu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RM7VGpNa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CINjM096042
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 12:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gStHw4Pb525PgjQ6MQOQm4La5fEOEM8mxRFebyrAtpE=; b=kC1SZTu1oblzgJEY
	XEniWVwviac0YLKZHW43oVvHsBD9UYm+I8g648bayrdkBmBfrpsDXz0/+qhR3s5v
	OZhUojzcA/+wGi/sccIAurDWMvxKGgvEjumoHBjFmZoDgpcb4C9K39Bg1+UoIN6F
	V3jGqbDRCxJ7P07vNm9DGTskafWlKjsUfaW0U8hDTshuENq1gerMzvbmU40FCq/n
	tFESUAFQa/Pdu1Y/ePaEOgdVXGv13nW9CvnYF4sSCJ3jiib7ie8JrfNTtLslDoUy
	x0VH1RTT8TiTCRUggrZSYeh/KehWBglXhlAlghBgakIuQrtwPBZS5jGC0jBkPTYa
	Qz5n7g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c44kbg8vw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 12:24:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c53892a195so118142885a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 04:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770207892; x=1770812692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gStHw4Pb525PgjQ6MQOQm4La5fEOEM8mxRFebyrAtpE=;
        b=RM7VGpNaiAI1v0NzOU9W6JkfrUT5+d1onJPUbML8UNUIqk4U7zWv2SkFxXhFwh/5H1
         VvxH/aAcAEtXtD0ak7+PmOAC32fhM8mMr1Xe82KtjBc6pg8bDA75p9hDzGfqTtbSzlRx
         rutbCB4TF4Q5M928FBaO0ksKpOnx8VLWWZ/kZDXTgh5+K3aIqcsWiYzQRtE5SIT+z9CP
         S87zwCX5Qm85arQjYmonKL02ALv+xxlg/Qv2FWeQkBLMgkhEcnY5DvOlJqYQa+D0Ac39
         qTEhwUt8s9t2tKrqAU2cpIiM/2BL5forUSaGou5irw8R0WmX8p9GoNKR6FxxKkZ2EulE
         kBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770207892; x=1770812692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gStHw4Pb525PgjQ6MQOQm4La5fEOEM8mxRFebyrAtpE=;
        b=cuqVUJswBOtMpAP9b4FyRseJytnqFZ7E010aVoj6RLMnVa7FpPaU5xclZGN5PJhEYx
         kS4xAKx43qJ+Xs13BVjOuephs4ObcTIXxY8Glv/7VfDr1EL2U6MJuDf+LnLylbUfk+zr
         MBWFFxxEMOCkMZFUxDGIKuCxjRoqggS8ou+gKvbIyjDrK1dZz9PIXNnOz6/oYirAWqDy
         6ZURk+dgde5fiZagkZAdiyM3L4crwO+d+b870ZyQX9IyE3RCK2K5ulFMOGb8T1Fbh2fk
         FaURSkU/FjAkQGpnKFKCoyX3DvC7DyTmrLYbEgWE1cq9i571NE0UcUFj0f/j6F28hAUp
         PQVQ==
X-Gm-Message-State: AOJu0YzyK9xi8X8XKU6sH0g3kxWDyzO+r9TrSkV4LYoMpAAwhHdNsKQl
	LEul2mK2yWDzzig650GPNVOnDBfbjqLTTbtoogtGxuqYoE/tX6/qTA3pNfKGtM4q31rta+yjLXD
	lzlvhLI+UVcoMCWDlXQPTPmGAk392RVQAwo+veYbuRpBDf2e8FsvmfGxhQCOJ9KsZDz3x
X-Gm-Gg: AZuq6aIMxy3rFLwl0on0c27ngV1/2Uh8ePF4blBn7CaUjbP80MRX3PDaNSLpxsiQ3f9
	wOWXTyYli6IMqOdEJvRuWkA31GBuVdP5qYMSbQeV/i85zmJaSqTzMY7RY/hfn8BmwDc8CVLUlIt
	kqrUW+bBUwg5PKcO5PQn5dGCmUDAVR2129oRrwFGV4CWOiAa2hODHLGyLcKl0U0Wip0PZ4ZOUg3
	GjAjzEUmoyxUVlCQJHx4esRRYfgTZtKOOMNJBMN79Wq4hBDYCL6zhJ3h6arURV0OydNztU5e6an
	ySyi6D9bLK88UPESTwikQkcce70MXIuA7RTSWENhrshB6MHUPyIN6an372wkfgUIz1Xg1MeKFp/
	0IrFfp32d3R64uZTiFjLAaya72HJ8we4upB40qIWWlNxpLXZjZsolV1BLM0hIuEyDoHw=
X-Received: by 2002:a05:620a:288d:b0:8c0:c999:df5a with SMTP id af79cd13be357-8ca3311995dmr157022385a.6.1770207891797;
        Wed, 04 Feb 2026 04:24:51 -0800 (PST)
X-Received: by 2002:a05:620a:288d:b0:8c0:c999:df5a with SMTP id af79cd13be357-8ca3311995dmr157020285a.6.1770207891314;
        Wed, 04 Feb 2026 04:24:51 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea0024583sm114368166b.51.2026.02.04.04.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 04:24:50 -0800 (PST)
Message-ID: <3ed170d0-3291-4cfb-b092-f4a1b2b0f96b@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 13:24:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 3/6] arm64: dts: qcom: ipq6018: add pwm node
To: george.moussalem@outlook.com,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Baruch Siach <baruch@tkos.co.il>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Devi Priya <quic_devipriy@quicinc.com>,
        Baruch Siach
 <baruch.siach@siklu.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260204-ipq-pwm-v20-0-91733011a3d1@outlook.com>
 <20260204-ipq-pwm-v20-3-91733011a3d1@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260204-ipq-pwm-v20-3-91733011a3d1@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v3P6KF_vkdQIeQrqGvtEUBsKfz8n7fmJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5MyBTYWx0ZWRfX9/rD3mOdAApJ
 nY23RADB6Hh51Fh3bvlMyr2aSqYXKJeUprflJBzelQOjhGELA0UPgNFT/zePpoozEsivh6l58XL
 ofiZTbIB6PMa77+yrUxIYSs2nF8diVR6XUekMBX8cpRylOIAZPgj6SX7nvR74miKSKlZnVWhuQL
 DHF0Ix4KOT9/wYskxwdvUviO8KVMss/smYjQo8I5i9x8JweYEpV0Ynq6MxPv/xf9ojgDwpmomNj
 VoD31qMFnWSplpq08jpGp4VaiYUl6XmRg78uchquvfWe5FkNkJOmAbKul0AkAmArt9kI1A8f64t
 ZIX6F6/3JugOpzzfqWMqCxVEcHP1aOPogRHSDli8aQQ9aw5pCojp0M9EQFOvigj1GviTvL4bp73
 RRagcbY4+FH6EsEZPPQZI+1Ph4haftootT3Gz572uypce8fCfJ/9ZRhIInu9+1znr8w2cFerV7+
 0jkjgqLpb+kidzOgnKQ==
X-Proofpoint-GUID: v3P6KF_vkdQIeQrqGvtEUBsKfz8n7fmJ
X-Authority-Analysis: v=2.4 cv=HN7O14tv c=1 sm=1 tr=0 ts=69833a94 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=Lh10uZTOAAAA:8
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=HU31luCS42qLushI0i8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
 a=h7PWpkqlkWt1jHQZSjMD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_03,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91798-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,outlook.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,siklu.com:email,quicinc.com:email,0.29.142.104:email,0.29.158.18:email];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org,tkos.co.il];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C91FDE5BEF
X-Rspamd-Action: no action

On 2/4/26 12:25 PM, George Moussalem via B4 Relay wrote:
> From: Devi Priya <quic_devipriy@quicinc.com>
> 
> Describe the PWM block on IPQ6018.
> 
> Although PWM is in the TCSR area, make pwm its own node as simple-mfd
> has been removed from the bindings and as such hardware components
> should have its own node.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Co-developed-by: Baruch Siach <baruch.siach@siklu.com>
> Signed-off-by: Baruch Siach <baruch.siach@siklu.com>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 40f1c262126eff3761430a47472b52d27f961040..7866844cc09fd2c2c2f512ce2c8fa7826fabc7aa 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -413,6 +413,16 @@ tcsr: syscon@1937000 {
>  			reg = <0x0 0x01937000 0x0 0x21000>;
>  		};
>  
> +		pwm: pwm@1941010 {
> +			compatible = "qcom,ipq6018-pwm";
> +			reg = <0x0 0x01941010 0x0 0x20>;
> +			clocks = <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
> +			assigned-clock-rates = <100000000>;
> +			#pwm-cells = <3>;
> +			status = "disabled";

I don't think there's a reason to disable it by default, but given the
version this patchset is on, I'll be happy to see a post-merge fixup

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

