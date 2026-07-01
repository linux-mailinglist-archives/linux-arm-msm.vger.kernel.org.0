Return-Path: <linux-arm-msm+bounces-115675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q6sdC4P0RGrn3woAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:05:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B436EC8A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 13:05:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T8oSw9ns;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c2YLTaSj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115675-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115675-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 986E230535AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 11:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB81438FE7;
	Wed,  1 Jul 2026 11:03:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2AC3FBB66
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 11:03:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903815; cv=none; b=glRn9cjCXJxL7Ts4W1iJZy3GHhiMG6BUPJII0olJ5y81GGs5OzLAsNYMMVMEn/X6Sf2peJa7uPZLxPzbp1FuCGC4BwNSQGQOUmNzW/AH+S7H1pTbntF+Rd3ebNH+hoXzeG1WR/JX8R94xO3YCZUuShSi6Py0iMz7cRn9FjVrwbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903815; c=relaxed/simple;
	bh=duc1lVQTPIuOy349IWTViqjX5kD6JpIT3NU5S8FU3ZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQLsuUsHGs3RDm5g1Xq43ZFbE/4EsY+7jkfrwN5dnCD6s9GiRb0zxvOkOLJZgMqWBMxEWrH4ruQk/uXLNYQ57OcUBZ0/35lIVFV9ZQR640d/WDgV6T1oHSlvBKkCeNcHCzubb7sqFuBcO9K0+RmaReXwYwnOA88PR/NgY/4QMiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T8oSw9ns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c2YLTaSj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8Wjh761663
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 11:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YtjHfrwONC8ND7jApAqtB0mekFLCMG+hunm8CdIxnnA=; b=T8oSw9nsa3l8NB4B
	rxmSt79A++quCYOMmyg/4KlP0j70G5bi/hjGWcmm3leiWzzcyTMT3MwOxbZZ8kcP
	imB7YkNTuPvOMgQdGY049Rh2rgUdiqY7RNzeBHT0N0s7x3+pFS1bPsY5ngXvb7Zf
	bpgmwJzajMxEcirTYbcp1kesurebWhN4ebRqZX6MmsGLHqndRIfA31lkYcdzM8C5
	nFc7t68wafhPsZ5iZ35Q6T+co6HATWTBiourZJnCnh8o1ItuMdZYKmAGgz1E7F/e
	yT0Zht6/o68AF88/BO+hM5fq6+gRrg/jc36bU6QCV87AsjWUbK/TYtfIW9el/t9M
	XJpzyQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw3pk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 11:03:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-847902a694cso749942b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782903812; x=1783508612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YtjHfrwONC8ND7jApAqtB0mekFLCMG+hunm8CdIxnnA=;
        b=c2YLTaSj8oBaLG9ZSb82MjOWNNFOcun9UZ3h8xO4ysFasdKZWmeQN5cJ5cUVLMpGMS
         0XvHWFZbaNRmMiEt8Ee8H7eKNRm89LG17SySq0eDj+Xs+kAgiRqIhkRB7GcHozp/tLLU
         tIpYVjjxEoEP+nGxkgOkEwWQ+LQw9GoNPtzlLW/pq57jo6knnHOYNGnZEmzFeBOOCT17
         lP6YgFM7uEuTj0UQTaK56LR96dxPk2OIFFcfEoET/yOvwc2qz5XMT7OhRON3Vnw3hkPl
         vFi937h049au590vmiZQCn3TZM78/dBgyUnv01cwM71oRJ3YeKmMgzWOeZ8K5UJibm9S
         J3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782903812; x=1783508612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtjHfrwONC8ND7jApAqtB0mekFLCMG+hunm8CdIxnnA=;
        b=AggC0tAqMuJhJpW+e7BTjhznG2X0/CGIgExJOJXgQ+H1ZqX2npiA2Iz/dz21MYH8lg
         IMQZkrmMqscDIl+snYkWb3pYYgBiwO6tRjTHsAexELkw3h2j/+NS7vFQWfJ45uylKLUH
         0XLiOvU/dzha5A9mPgfRSzCFMgNmCpafkq8AcJPBeyTRwpICX92+xlf049lo+Zo/VYyc
         frQ72RU1tGKtzZYjuQiUXKu9ASTbwLGUmoNaRT3Rufn6+PEyR/o8dpDf1BcW6GVzdNcw
         fEDWB2WaI0qfTXVU2S3QAbJVWn2uCxBlyLpFj2XvZ1AV5CVUzNc0roYmzvIWETRmXYXG
         /8vg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3g1yIhJJ6mp1AfiFG030YWrNt+hRWWlu0+bu8/9581VQmPEbKJE6pWOiWAtFpiSdPTIbjVNhyswMP2/j2@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl5ufl9C66BtU1QrwnY8HLXV6pjNwQVoMKy9jmg+BtTScD1UFE
	XaDok/9RSFwrjZIOqtydobf4VQGgxVUm7JwsTJgWkTYB7YQNO+SWHx2zeO6JKBRoqLyjFoI74iF
	KPe6eWj++0EoSpajXyM15mMLoHhwTSMqQm0Z4lMLfD6PPMjUk9nzJ3sRUSTxmkpxuWdpk
X-Gm-Gg: AfdE7cm9Jc+idjhx9qPrFCO2+YJtpGRz+nwovRI1ykIX1zLv4KsZApcIjdI4D5kWOau
	suSoNm+8p3zfeFSHL2yEDXtRjSrANjzahXi+e0sXsREiBzM/ktL3PQ+EzkmUI7QrXrTA9CdDdtD
	oSpSKl6hyAGh9xSoM8t//eAloMJU0IgKJrvGMohRoAtkrTusVZsE5yofqI0OevOU/6KrtEKIulg
	GkMQpFpW1Mr/i2VFziteeKZJ8nnDo44bKmKonqYFsjE0/4DxO/tlEMZmb0yZgRRgK0sTQ7gHRZB
	HHR39MmgX4GO3PegQ/JGABaJp0L8vohWarZDuWL8jcitd9PpPgj2P9F0QraN9RdfnPTgc0SlVuY
	fisFPPvGjCiZxye1M/raZmGmUU0xKduKSv/Dd6hJrlg==
X-Received: by 2002:a05:6a00:4294:b0:846:2f5b:c00 with SMTP id d2e1a72fcca58-847c08f548dmr1073479b3a.54.1782903812448;
        Wed, 01 Jul 2026 04:03:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:4294:b0:846:2f5b:c00 with SMTP id d2e1a72fcca58-847c08f548dmr1073416b3a.54.1782903811899;
        Wed, 01 Jul 2026 04:03:31 -0700 (PDT)
Received: from [10.206.103.168] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm3710047b3a.33.2026.07.01.04.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 04:03:31 -0700 (PDT)
Message-ID: <3bdb4ba0-4309-4377-9528-936ee616e3f6@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 16:33:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add memory-region for audio PD
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a44f405 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BqbkvxNZUh3vXpf7O68A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: in28kjuwU_jX0imoeoVL6x3TwYMhwsh0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfX/KnkSsbb4AOM
 MTRo+nTqFvizGbnRzhFmA7DFslBNrIYeOSH4G61HB9CjnoW87TzjrsKWqfbs5rT2qWZj7MRz8sh
 2e8aenfW41HLqe9DUy1eW5jtKTThZPU=
X-Proofpoint-GUID: in28kjuwU_jX0imoeoVL6x3TwYMhwsh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExNiBTYWx0ZWRfX922CS97B4rgV
 YhEiziAuc0wtAjgvYKVjdoMB9XUASSdr055Yng56DQT98bygBSxiCGJczE35f0ytnfWHNuzC34p
 3d5U9hFKDBg6cTRQZkz8bqzOq9SlCIMy45UPiFB+5apHCI9vLEMypu99LTKWA8ryYZMvY4bLcIv
 D2PdjtsDDKoskbmkqoDuf+SyGleDqkgeGq66OIta8gakYh/SUELRkUqr7EK2BFj/dLUljbNs0oa
 lzyaMUHMRqEQreJqTnciwnNVD3w8MTpVRxIT9+ZgYxAnu4WimKHrzOo/ydzu/530vdaP1grzX7b
 qTrsSWGXg/Y7zvFYxddHbTdlBE5oJ4sQiWtlty1E7mzKjdP2FMOv7YiSaT3tHeLypyr1ZhuC1L3
 rLs1hT8meFz4D+jagI1ajuu/Iy/xznjpn0AMl11kKQ/MOc1+JRzG82QkdxH3XKmAgqsuB8+P/1a
 VdjLoIrSisBfLnfbpYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115675-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vinayak.katoch@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5B436EC8A6

On 01-07-2026 15:35, Vinayak Katoch wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index 20b49af7298e..f403f542aa00 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/firmware/qcom,scm.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interconnect/qcom,icc.h>
>  #include <dt-bindings/interconnect/qcom,glymur-rpmh.h>
> @@ -663,6 +664,14 @@ smem_mem: smem@ffe00000 {
>  			hwlocks = <&tcsr_mutex 3>;
>  			no-map;
>  		};
> +
> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
> +			reusable;
> +			alignment = <0x0 0x400000>;
> +			size = <0x0 0x800000>;
> +		};
>  	};
>  
>  	smp2p-adsp {
> @@ -3845,6 +3854,9 @@ fastrpc {
>  					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
>  					qcom,glink-channels = "fastrpcglink-apps-dsp";
>  					label = "adsp";
> +					memory-region = <&adsp_rpc_remote_heap_mem>;
> +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> +						      QCOM_SCM_VMID_ADSP_HEAP>;
>  					#address-cells = <1>;
>  					#size-cells = <0>;
> 
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

> 
> ---
> base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
> change-id: 20260701-glymur-audio-83621043d143
> 
> Best regards,


