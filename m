Return-Path: <linux-arm-msm+bounces-93586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA8aClz5m2mp+QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:53:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8732117265E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 07:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 262CF300954F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 06:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B48E34889A;
	Mon, 23 Feb 2026 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGO8AH7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzHIf3Hw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E18B1E9B3F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771829563; cv=none; b=jR4I7FOOPvw6vPBsNUHyQHbM13m/LwDJaSHf5KGKboMDVUqANqL2ylgQIUu+0BLJmlI0XhWmNn6QqUcVuS9NYjuNM5zn3rSDRwI5Q/UrYPtT1os0Mavi5CwCCEjUNnVI9FxtprvenL+DAS8RjqufEN8uHbIqOpwlJvbW4mSSXO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771829563; c=relaxed/simple;
	bh=vgv7ctsXao7MtpeMlJOO8LY74fMmbAGGboEA/HTpTFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWlzE2imQmbM3WlSPKcPcxxyZi5LkAHgSmjlhg7esP0w0DTEqiv8bD185/wl7wzDHPJpvrtIycKQ7McUDqBqDupwi9U3RB0lnm/UPcXVWCRKALH7rQ0hnrMU1usPoKN0hVvbbieXfrcQig8c9SFNZZwra98S83F0gNHgV0eEjNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGO8AH7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzHIf3Hw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MIk5EM1249093
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlEQGExZJthoT/VEf/UL37LX4l0sLu2KIeC5U9Do/WI=; b=eGO8AH7xfImiiqMp
	F9aSGBz7DQ2D1BHalll6+MBUsQYCWmd+fjr2wcuB5bgcTHhj3pQX+mngS08IDDAG
	lTmHJzxrks3A/rln6cM0TwNIAQJ+hFJ73uR0nAWzwMgRxKAC9tNkB39OXgHvIncY
	zJl92IVj/S579oxyQ6xAqvwDoJrhQOu4vTvI4drRQpQAFYPCouiGU5Jn+KG5GTDH
	z6MzPtv2CvNouVuKBy5PUgpfbe0Im9Li4UmHQWw1ca2yuggFCf9BRWHc1lW1bqFc
	Gt8sDsVsrAjGqZQiD+omPxbg0GPtaE0WeWqg1AXikAWELsfFKHmpPB6CR1ZptZwa
	HB+L2g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9upyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:52:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a8c273332cso395000845ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Feb 2026 22:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829559; x=1772434359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RlEQGExZJthoT/VEf/UL37LX4l0sLu2KIeC5U9Do/WI=;
        b=DzHIf3Hw25BDrsgsNWOOc4EHnlgUAQvkeuS6Q1ZB4giLa130gKf351BMcqx19ZMIuh
         Sjf+U6A8CmfdEBnrEo4+a61twzkRxNKfcOwEnMc/VDFPHYbSYC3VdkbNUH0eblXNrh7L
         zbYV5QHHIQQ49MB18qK9sJMsdYYHDTzf/up48Shn8lV1XF4+crCF/t7942Eaj8SD7smK
         4b83q6itdplHDBjKPq8F8JqQ4xJwxQv1grHe+4SpG48igJcBmPg+0wR6hrv5IWOdfsQd
         GPg1lnK5AYd7ZRLc3R5LPwECZaxcmU/HpVVzmG1QpsopGEdA0MYM01p4ktHYPk+lybC4
         DIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829559; x=1772434359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RlEQGExZJthoT/VEf/UL37LX4l0sLu2KIeC5U9Do/WI=;
        b=Sf7dTMxylG8kr6RAr35Xnm+FJDnqPH0XH4MzJJspX7xsCjMHHKk1EKebpmPbXKfnNs
         2P9e9SYaAPcBSg9+uqKZOAXQZCTFz79Zrkc3X1S3TGZ2uE763FXuTKDgn7+i6uqdgOLG
         1+uiTXbJImM6K/SVQN0SAN8Va7+ijcg1gDGZ+SriehEqcU7TaAcbY3VBpR4Pkt/rexGO
         6S+SIgMvg7d8e4ra1PMklxNkWspYEEthbffyNl+vLyg+Pwln4lCPK5fvqQ7a3CjKrA7A
         +hUiM0lecig0jZ9l/daPj9FsLy4CHyzGffLkFz/4Otu9B40MC95cZmdWmV1daNCKf9bR
         euNw==
X-Forwarded-Encrypted: i=1; AJvYcCXQmuDFW5+R+aVdme0qqteV/NciE03GPZ1fsz9u5UuqtnHbROIUjmX93jJ2eVBtjYO1o+/McGtHIW8as2R8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt9Rq8HB8MAWsv7vKuDxeSO5AGi/c/6TRfmDrOUt3n+zzJv36e
	sxbWlRDQTrGKD7FbC3pJDD3Vd0UZpibktIfENPwIF+0UUbmwdy/0Y/zquzQ0iBZYGYMVrC5TfcF
	exvJd3FMIyQdwEExymHIutNiGXtg4uwLiPTVSIZISwzxHI1/Qn5fLeQEOFm+Mw9FxoKV6
X-Gm-Gg: ATEYQzz0bq+byg9i24Fxz7J2sQv8RYAfvTtWlNE5u2XP6tx66WfoIeEiQYVw9928Dfl
	0/QeCfqHID8zvsECCkXNu+c1oYejDSwWQF+H4JjnVv1r5GiG1wqiuvUvMHjN1pQ2j6k1rz69/Ka
	Ma7sYWaimhgHwlHGt9cxPveRMkSRHa76l+5DO0ycsK9J0UOKPPYsHSrO73JVsmFEXN50x7UqyOk
	96MZBypPclhYF4c+WSVmD+EltMqdVqhme/Yz13l9AcxMOFfurNLAjBTzrg/JZG2soSqLtfcrV5F
	HCPlRyA/w5e4Qicc6LKtZ1ZnEiAC/gRJHYon4pw5IFDa1BKnuBFe5uuOhCgYpgw4W/E9rVV4j3x
	ARxVhQs7hXwc0vuG3M3aAl+FCgUHMopFLIn0qtJ2YBfK9v92Z1hJOJGja8LpTV5BUcO1da+qPLv
	9mt92aP/xtNA==
X-Received: by 2002:a17:903:2305:b0:2a8:ac0f:9aec with SMTP id d9443c01a7336-2ad7455a045mr74685195ad.49.1771829559234;
        Sun, 22 Feb 2026 22:52:39 -0800 (PST)
X-Received: by 2002:a17:903:2305:b0:2a8:ac0f:9aec with SMTP id d9443c01a7336-2ad7455a045mr74685005ad.49.1771829558746;
        Sun, 22 Feb 2026 22:52:38 -0800 (PST)
Received: from [10.133.33.86] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f4a4sm61374135ad.79.2026.02.22.22.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 22:52:38 -0800 (PST)
Message-ID: <776799b1-0af9-4b7d-b04d-29e84e18c4f3@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:52:28 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <Mike.Leach@arm.com>, James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mike Leach <mike.leach@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfXxHmfCh9OqjRT
 JWLIU1Qj1b3LmIiUD1ySrSA47+e6FdPownC8lHOpwxWVT9E0B5cakC8PRYkXOvrAatgqaTg3ubs
 6fDVaUvj51ZqEzQnLKwaSUevLj2jTlTxbrcS6zID2f4Si11DYhQfpI+1d2U6/AzF8MQHGfI/rxa
 /uyqc6T4982NMSODBhTmjRKY9lPOXCBuDiG6Ddq7Z3Z5IEpgsThxkYcmGkpJytsRSdjlGUr0lqv
 B3mv4ZJQTBPkJEjam75yB5ONIjVZUMy/VbZ4Geaqm6UfVLhC08lXtPkXILnA4rJiYGkO9ZqRx8a
 OxukioROyP16KQ3f3Mhgg5bQXVIAc/j0w9t6YLUlqicmpCctC5px5bTndbR8cay6lezDXgxaJm0
 iRaZsJ+ptoTubknRQTUSlVoyg/tFgfBhlZORXXuXZK931IJi5Bhdrvxw68YPPkAKXJxRgLlmyTw
 AOaOd8/mKJlMBPEyQsA==
X-Proofpoint-GUID: kcbcmzKytDv6m54ZUK4192bBTvYOwPxj
X-Proofpoint-ORIG-GUID: kcbcmzKytDv6m54ZUK4192bBTvYOwPxj
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699bf938 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=SasFknx-FDtbUUtTut4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93586-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8732117265E
X-Rspamd-Action: no action


Hi,

Please ignore this patch series, it was sent with the wrong 
version(should be V13).

Sorry for the noise.

I will re-send the patch series with the correct Version.

Thanks,
Jie


On 2/23/2026 2:44 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is triggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 
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
> echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_threshold0
> 
> ---
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
> To: Mike Leach <Mike.Leach@arm.com>
> To: James Clark <james.clark@linaro.org>
> To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
> To: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
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
> Jie Gan (8):
>        coresight: core: Refactoring ctcu_get_active_port and make it generic
>        coresight: tmc: add create/clean functions for etr_buf_list
>        coresight: tmc: Introduce tmc_sysfs_ops to wrap sysfs read operations
>        coresight: etr: add a new function to retrieve the CTCU device
>        dt-bindings: arm: add an interrupt property for Coresight CTCU
>        coresight: ctcu: enable byte-cntr for TMC ETR devices
>        coresight: tmc: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
>        arm64: dts: qcom: lemans: add interrupts to CTCU device
> 
>   .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   8 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
>   arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
>   drivers/hwtracing/coresight/Makefile               |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c       |  24 ++
>   .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 367 +++++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu-core.c  | 122 +++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h       |  77 ++++-
>   drivers/hwtracing/coresight/coresight-priv.h       |   2 +
>   drivers/hwtracing/coresight/coresight-tmc-core.c   | 103 ++++--
>   drivers/hwtracing/coresight/coresight-tmc-etr.c    | 136 ++++++++
>   drivers/hwtracing/coresight/coresight-tmc.h        |  36 ++
>   12 files changed, 830 insertions(+), 60 deletions(-)
> ---
> base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
> change-id: 20260223-enable-byte-cntr-for-ctcu-9ce7487b3a76
> 
> Best regards,


