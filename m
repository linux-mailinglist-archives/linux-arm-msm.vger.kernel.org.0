Return-Path: <linux-arm-msm+bounces-109597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGpLB7MRFGpeJQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:09:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAD65C85B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 11:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 444E63008D39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92D03E51D7;
	Mon, 25 May 2026 09:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuhYTEZ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fkK23DW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FEC3DF003
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699857; cv=none; b=REZKhgMLVkMbYcEN40pyPuNY5zxWjPpmpdJbL+tYbgr1j9dXpr+/oIDBf9CMokMzWa5mWTMGWiYdZHG6qU/UtQ4nNrGWHAFcCHvHjf08ndDPPkX4FByj4Afmt28GXLKG8OgBpgOBt27he2tICRYLnFqg4fDm5ByydG1gyIle4i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699857; c=relaxed/simple;
	bh=Ei24HmwGxvcVHrSm6iH99cNPnBzZFpyo6LO6IfY7aOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMEms0uv6FiMKo6sX4rZQFLtVFocA0577C1ziJ/vkRX2S0ORG3x6yOqcYRlzFxOdezuk68kZr2jpsz4MWfNzBW2myV2xk2iyaBsHRFLDdc3r4721gzskylQq0xQswWx0zvMIa7R7QSjojShNe70hFuUeiuQpbIMWosu911dMn4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuhYTEZ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fkK23DW3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P8Fw013962875
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ea/v7IKq0gouae4dvCfpQj1nDmVXPJv14x4ipLxCBw=; b=TuhYTEZ88xON1YW1
	siwQh6zUDHkshSgYd2Bt6Ap5S49xWm9ZrHCW3hkhOXZbqm1pKxBZv20L3xtYN2XZ
	1MqqDs6OrdRoJwuQaI3x/YJukxjqF6I3m1Ns0O5GFklgwbTKsbFY26dlOAyjnEZ8
	drnpKvzzCfp2Blc6iHXSfvNI9WaoFT8TCRpER5w/gdI5aXqYw1xiT93O0wFo/Y6S
	h+sNBgdcGjHOc8rxrPdijaQqL+AyuhoCYCDA0DEBEWRzLQa/T8Relh648j5xmfQc
	Tsr0QSCw4szFKc3M74U89G2bvK0eQYPlUDIesTNaCdN0uTXv1BcgmCKeyOS69fdw
	yECz2w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb36t638w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 09:04:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9fe2d6793so209767005ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 02:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779699854; x=1780304654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Ea/v7IKq0gouae4dvCfpQj1nDmVXPJv14x4ipLxCBw=;
        b=fkK23DW3euENe3lmSSFBq9gaMzq9OpAv+MZiz6XewLOwtiM9tC+2SRkn/HaRBYUr/3
         iGNEJAIkobvWm9p7JrcUbGD68F5H3u4Cz7gcAxacYIQ3hiFwkCDbabAHZ+r7ERQqS2uE
         UrBPQjA563e5oUsLgD8abFi/jN7pgkQpUYptP0whHHToPH4tn/juOTevx202deqQRZaT
         CXoqY35di4dGw0olH4gL8KhKpBB1faYCP6/ZH6VUg/0lXHxLt6U1vYIO8Pk/cBIk4N8M
         YYLZxAXrrAFiuxx5O0L7vlMbuNbs2P+qrnXX9qyX4T1fCysaOj8zM5oIyaO+qIGF48B5
         TbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779699854; x=1780304654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Ea/v7IKq0gouae4dvCfpQj1nDmVXPJv14x4ipLxCBw=;
        b=I2VNZhsKBlgMm7J7ztxXyuWvxaRqWTeIBj+r6eRjsrmj4Av5jYaDB9ln/wGu2N049j
         xNtzemW3gc6IvK7PNThDpIkL5F4cE1Yok3coq0TRIiRJQ9W/k/rph8rFL310R36CQLlm
         qo1jPXiXOBVzWsP3tsIyPjwwwc6xDMt2pZkSUvnI5pCKDaF1iAy4WJH6TkvN3bjKQSHJ
         nLkPS6rE1q68MC2ufDGRLPBl6RXcAZloexrpJZdx3iUC8GDN+DUZUFjgNJvafUSC2Q6e
         khiqwWKcoNoP/Nq91zeD84nnZzJUEL7y38IOtCLZ0K+K53lzn9VEsTLhe2KopyI0QiOF
         yTMw==
X-Forwarded-Encrypted: i=1; AFNElJ9fHElmTpOnhp92waPIbxT1ZuSoqZb5mxGp59goXfJuvy9qmaPoGV4vm6SoDrfMbhoJzl3pplWKTWsD9T+L@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/gFCK4skVFuxTxdQIzjmTPQ4ruc4ka2oqhz0kaNQzw7LjNgy1
	7nN4CTPuLUmqrIPVpz2xPTpyFIN7zpaXvaudrwu9jR9fXosCoEsUrOsuQv+7XnaWT/W2TC8oFKi
	1RiRLdHl2EIh5NDjl7Kj81bHUJBf5INbfXeSUulZDMan+gg+VBvKpKcB0tijus7TWP/Kn
X-Gm-Gg: Acq92OHx/OaCEjtea73lkRKHK75bm6aCIERNw+UKyU/XVarluIfweH9FrzxzhkVh+En
	Lnjk9K69Grx9WrQu0Iopl6sKn2ixvP0HrMfniEoJr1SiFIYJQ521udCOqQoknJ1sUrtUj+C6vhd
	vAOP7VfByQddqptX/6JnjDBI9j0FJMpZxTr5JdLPyOPHlPLPQIdGkIlpF92ycU3u3RqvKBH2zIr
	iS/Krl6493Q9dtzagR2Z/PQpO9hVjMRyweYMtA/HddZuTS3ei4vmwFOol6Nn8Hp66lPihalTC23
	n8mpLCL192VAejb+VDpsqoD6Dvkx7PFoZ6tbz/jzmCyV2T9nX4iLRcce/W5Ep/FXthLo9wvzY3b
	352IsIW4k8h+k9oApIEjVlz+iuTk0o1ovbWwF6vI4I+bAHYtCjeUKaWnDChigkSon0Y7HV/BeEc
	5OlAHutXvmZyc=
X-Received: by 2002:a17:903:1b43:b0:2ba:83f8:7b7b with SMTP id d9443c01a7336-2beb0758c00mr140605675ad.33.1779699854409;
        Mon, 25 May 2026 02:04:14 -0700 (PDT)
X-Received: by 2002:a17:903:1b43:b0:2ba:83f8:7b7b with SMTP id d9443c01a7336-2beb0758c00mr140605195ad.33.1779699853898;
        Mon, 25 May 2026 02:04:13 -0700 (PDT)
Received: from [10.133.33.193] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58db336sm86040165ad.68.2026.05.25.02.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:04:13 -0700 (PDT)
Message-ID: <6ffadf33-ce24-4564-8c70-34113482b13a@oss.qualcomm.com>
Date: Mon, 25 May 2026 17:04:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/7] coresight: ctcu: Enable byte-cntr function for
 TMC ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Qc7fg3MJf0d9q-xN4sPukb_aWucLizlg
X-Authority-Analysis: v=2.4 cv=Fto1OWrq c=1 sm=1 tr=0 ts=6a14108f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=S0-iGdAQsZdNEWGIu3sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: Qc7fg3MJf0d9q-xN4sPukb_aWucLizlg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5MCBTYWx0ZWRfX19/EGaR1mWTN
 b7sRE1cg4uJH2RGcaSyo2jlv4qapJ1UrXll3yOA2X9lOffbFiODZeOH4XILlOYu7M2+onYygjou
 uYFXCvfBNqAUIUGvwNOHHOljHqHXtjVUoHhDjg2U904egZEffOMiXHqgwkJx8LK/KRXAo1zl05I
 38dd82vyqyYv3+ckEJ7VBQ+0CL7d0DIoQEw3lmeN4K3tlbBBakIYQcW7ZzdJg8H17YR25YasvWa
 fsr58RO2/vueSGrBAUk44TbyxuHjVMpS4sfhe7Xk8CAvErb1BFDvxQ6R+YLCTr13+o2xVqjEeuq
 DuvwG8+NB5sRCk8GmTxT2t88qPQ/xGvOq1xFq68BUUWyBSZJUbR9z/f7slj1W/7qWI2RiVL1qSC
 G6Vhih+7m+5gXVDIIqScHG5qLvzcaBSpIJNapjc96CsLVGeat7Wq2awz3DL/QU9jX+GqkSPzwXf
 VJygMHb+CBc4FILeVTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250090
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109597-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FAD65C85B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/7/2026 10:11 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 

Gentle ping.

I would be grateful if you could review this patch series when you have 
time.


> Based on this concept, the irq_cnt can be used to determine whether
> the etr_buf is full. The ETR device will be disabled when the active
> etr_buf is nearly full or a timeout occurs. The nearly full buffer will
> be switched to background after synced. A new buffer will be picked from
> the etr_buf_list, then restart the ETR device.
> 
> The byte-cntr reading functions can access data from the synced and
> deactivated buffer, transferring trace data from the etr_buf to userspace
> without stopping the ETR device.
> 
> The byte-cntr read operation has integrated with the file node tmc_etr,
> for example:
> /dev/tmc_etr0
> /dev/tmc_etr1
> 
> There are two scenarios for the tmc_etr file node with byte-cntr function:
> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
> 
> Shell commands to enable byte-cntr reading for etr0:
> echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
> 
> Test Report:
> === Module setup ===
>    CONFIG_CORESIGHT=y (built-in, no action needed)
>    CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y (built-in, no action needed)
>    coresight-ctcu: not loaded, running modprobe...
>    coresight-ctcu: loaded
> CTCU byte-cntr test
>    CTCU   : ctcu0
>    ETR    : tmc_etr0
>    source : etm0
>    chardev: /dev/tmc_etr0
>    module : coresight-ctcu
> 
> === T1: device presence ===
>    PASS: CTCU device found: ctcu0
>    PASS: TMC ETR device found: tmc_etr0
> 
> === T2: irq_enabled sysfs attributes ===
>    PASS: irq_enabled0 attribute exists
>    PASS: irq_enabled0 readable, value=0
>    PASS: irq_enabled1 attribute exists
>    PASS: irq_enabled1 readable, value=0
> 
> === T3: irq_enabled write/read round-trip ===
>    PASS: irq_enabled0: write 1 -> read back 1
>    PASS: irq_enabled0: write 0 -> read back 0
>    PASS: irq_enabled1: write 1 -> read back 1
>    PASS: irq_enabled1: write 0 -> read back 0
> 
> === T4: byte-cntr read with active trace ===
>    [step] cleanup: byte_cntr_disable
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
>    [step] byte_cntr_enable
>    [step] set irq_enabled0 = 1
>    [step] set buffer_size = 0x2000000
>    [step] enable_sink = 1 (tmc_etr0)
>    [step] enable_source = 1 (etm0)
>    [step] byte_cntr_enable done
>    [step] cat /dev/tmc_etr0 > /tmp/tmc_etr0.bin &
>    [step] sleep 5 (accumulate trace data)
>    [step] byte_cntr_disable
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
>    PASS: T4: cat exited naturally after source disabled (EOF delivered)
>    PASS: byte-cntr read returned 35333968 bytes -> /tmp/tmc_etr0.bin
>    PASS: no kernel warnings/oops after: byte-cntr read
> 
> === T5: EBUSY on concurrent open while byte-cntr reading ===
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
>    [step] set irq_enabled0 = 1
>    [step] set buffer_size = 0x2000000
>    [step] enable_sink = 1 (tmc_etr0)
>    [step] enable_source = 1 (etm0)
>    [step] byte_cntr_enable done
>    PASS: T5: second open correctly refused (EBUSY)
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
>    PASS: no kernel warnings/oops after: concurrent open test
> 
> === T6: rmmod while byte-cntr read is active ===
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
>    [step] set irq_enabled0 = 1
>    [step] set buffer_size = 0x2000000
>    [step] enable_sink = 1 (tmc_etr0)
>    [step] enable_source = 1 (etm0)
>    [step] byte_cntr_enable done
>    PASS: T6: rmmod returned non-zero (device busy), no panic
>    PASS: no kernel warnings/oops after: rmmod while reading
>    [step] enable_source = 0 (etm0)
>    [step] enable_sink = 0 (tmc_etr0)
>    [step] set irq_enabled0 = 0
>    [step] byte_cntr_disable done
> 
> === T7: insmod after rmmod and re-probe sanity ===
>    [step] module still loaded after T6, retrying rmmod
>    PASS: T7: modprobe coresight-ctcu succeeded
>    PASS: T7: CTCU device reappeared: ctcu0
>    PASS: no kernel warnings/oops after: insmod / re-probe
> 
> ===================================
> ===================================
> 
> Results: PASS=20  FAIL=0  SKIP=0
> ---
> Changes in v18:
> 1. add a NULL check for the in_conns instance in patch 1.
> 2. fix a bug in patch 2: the tmc_alloc_etr_buf never return NULL and the
>     previous check for the return value is incorrect.
> 3. add more kernel_doc description for tmc_clean_etr_buf_list function
>     in patch 2
> - Link to v17: https://lore.kernel.org/r/20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com
> 
> Changes in v17:
> 1. fix race issue during allocat buffer.
> 2. fix user after free issue observed when remove module.
> - Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com
> 
> Changes in v16:
> 1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list" because we are allocating/freeing memory.
> - Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com
> 
> Changes in v15:
> 1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
>     functions for etr_buf_list"
> 2. optimize tmc_clean_etr_buf_list function
> 3. optimize the patch "enable byte-cntr for TMC ETR devices" according
>     to Suzuki's comments
>     - call byte_cntr_sysfs_ops from etr_sysfs_ops
>     - optimize the lock usage in all functions
>     - remove the buf_node parameter in etr_drvdata, move it to
>       byte_cntr_data
>     - move the tmc_reset_sysfs_buf function to tmc-etr.c
>     - add a read flag to struct etr_buf_node to allow updating pos while
>       traversing etr_buf_list during data reads.
> Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com
> 
> Changes in V14:
> 1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
> 2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
>     function and restore etr_sysfs_ops in byte_cntr_unprepare function.
> 3. Remove redundant checks in byte‑cntr functions.
> Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/
> 
> Changes in v13:
> 1. initilize the byte_cntr_data->raw_spin_lock before using.
> 2. replace kzalloc with kzalloc_obj.
> Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/
> 
> Changes in v12:
> 1. Add a new function for retrieving the CTCU's coresight_dev instead of
>     refactor the existing function.
> Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com
> 
> Changes in v11:
> 1. Correct the description in patch1 for the function coresight_get_in_port.
> 2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
> Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com
> 
> Changes in v10:
> 1. fix a free memory issue that is reported by robot for patch 2.
> Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com
> 
> Changes in v9:
> 1. Drop the patch: add a new API to retrieve the helper device
> 2. Add a new patch to refactor the tmc_etr_get_catu_device function,
>     making it generic to support all types of helper devices associated with ETR.
> 3. Optimizing the code for creating irq_threshold sysfs node.
> 4. Remove interrupt-name property and obtain the IRQ based on the
>     in-port number.
> Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com
> 
> Changes in V8:
> 1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
> 2. Combine the patch 3 and patch 4 together.
> 3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
> Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/
> 
> Changes in V7:
> 1. rebased on tag next-20251010
> 2. updated info for sysfs node document
> Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/
> 
> Changes in V6:
> 1. rebased on next-20250905.
> 2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
>     lemans.dtsi.
> 3. fixed some minor issues about comments.
> Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V5:
> 1. Add Mike's reviewed-by tag for patchset 1,2,5.
> 2. Remove the function pointer added to helper_ops according to Mike's
>     comment, it also results the patchset has been removed.
> 3. Optimizing the paired create/clean functions for etr_buf_list.
> 4. Remove the unneeded parameter "reading" from the etr_buf_node.
> Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V4:
> 1. Rename the function to coresight_get_in_port_dest regarding to Mike's
> comment (patch 1/10).
> 2. Add lock to protect the connections regarding to Mike's comment
> (patch 2/10).
> 3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
> 4. Add tmc_read_ops to wrap all read operations for TMC device.
> 5. Add a function in helper_ops to check whether the byte-cntr is
> enabkled.
> 6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
> from the sysfs node.
> Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3 resend:
> 1. rebased on next-20250711.
> Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V3:
> 1. The previous solution has been deprecated.
> 2. Add a etr_buf_list to manage allcated etr buffers.
> 3. Add a logic to switch buffer for ETR.
> 4. Add read functions to read trace data from synced etr buffer.
> Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>     node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>     suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
> 
> To: Suzuki K Poulose <suzuki.poulose@arm.com>
> To: Mike Leach <mike.leach@arm.com>
> To: James Clark <james.clark@linaro.org>
> To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> Cc: coresight@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> ---
> Jie Gan (7):
>        coresight: core: refactor ctcu_get_active_port and make it generic
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
>        coresight: etr: add a new function to retrieve the CTCU device
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        arm64: dts: qcom: lemans: add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  27 ++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 304 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 146 ++++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 243 +++++++++++++++-
>   drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
>   12 files changed, 850 insertions(+), 72 deletions(-)
> ---
> base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
> change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f
> 
> Best regards,


