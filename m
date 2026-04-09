Return-Path: <linux-arm-msm+bounces-102563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKifEeYZ2GmSXggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:28:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF753CFF06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 23:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 955693009B12
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 21:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBD33793DA;
	Thu,  9 Apr 2026 21:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PuTXtdBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWjHkiJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7266833FE06
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770083; cv=none; b=n/SH6TTn48UO5QkhlXgU/0poAmhBpBdWKi8kzkF0ssxx1e7GoOGTmGDl4SHVl7Z///j5BNjCkym1CM+GjrBa+Ai7dsgWLQfrOAW08HQd/l/W27P41mBHc7D54aV4jQkEqxHuv6q9GtzNXRLOQ3w9nZ8BplZXr8BvopPX3RLQ/5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770083; c=relaxed/simple;
	bh=l4cI7hA5CWVnZg8+3fOXH9WY7OmJIb+53y5zfDCG+aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cHueXEH+fMdzvXRhKoFYDDliU1fYTBiZ9OrRZ0cHMemQ7aHdwjSy5x4oEbEX4gUoLQQxVzSuHSIf/Oy2fRGwPPHKx8cs+TiyCu3qZ4ffU7XcSwavN2Hq/0t0MrCEb9S6hBcYO272eiAmB4OpMiNF8OKteace8Vs7susDSn+URiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PuTXtdBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWjHkiJh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1Rrn1972532
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 21:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+Qz551vlVnzXmqr6x8LCPyptEWu8XeslSycSwIXDS0=; b=PuTXtdBdrRm4p5Io
	AzyyiocfRYzsHY684LKJzl9effClSgcO0/zSLt2WOK8ZUOQmOkaaIRGkSu8XrANU
	ew0sEEeUPmsheH6XUi8tA/G97/b8N5YG6HQrNmfytdllqTZaq9zcxj1Cfj1g4Teg
	Kbo2foua2kYDxCXyzJcNcvpgNenDSMCy1ViiesHBkeh1/xiwdXYHeGBVBm+q+Pwr
	60LExhvQ1dUabwXa7PCU4zOWfkoOsvNYvLBxYwUzozVoPOdYjPCUYyEIAFwElIMD
	BJjsztjs5Tc82EiNgQE2tnxc9t6zrMR5G35jmUJhY1cB0FCHKSM1quavTrLjIpXA
	DeFyJw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms1r6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 21:28:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso1596543eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775770081; x=1776374881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X+Qz551vlVnzXmqr6x8LCPyptEWu8XeslSycSwIXDS0=;
        b=WWjHkiJhHLyKN8uvYLE8xczLD7ZCxl+Eh0WCewG7zWzymfNZo6LYLhpDz+mHszaHHV
         3DwNMbddeEv0cumSx1sbuOVjBHtbix+53MoUI0/x/UQjMoNwHj1e7sJMimFkb42br53U
         ntjx7y5fLShG06rSU/hU082JzDZTz7bytpR8AQKpyY3GFBBadP+/lv42M67O3PUzW3Au
         MSq41enZjCC8U8ENj2rJ5/fyQAw4vnxZoTpowwWla7+oEMbL1Br5Wq2xJ6jIwL2fIUGq
         urpXVzacM/noE11/OCnmSM0knKTiml+Cyi/tQQPLjKGkgAKfMWoXMeP4HKApmPfxs8V4
         v3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770081; x=1776374881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X+Qz551vlVnzXmqr6x8LCPyptEWu8XeslSycSwIXDS0=;
        b=cpXzF9vCMv6UmyYBucefL8ZrW8e/ZQ1H8SMkPIeIVDOu02PZOC1lpTMQGAivyD9shS
         Ojmh7Cz7tG9a4ucpWSovy9haLDG+R7lY5YdPGLZMTwygwfHEQxKYFY0WwvQj80IEK+Wi
         6oKLdJWV0FwqomcbWExlfkqStZigh4U3y9ADDCBtWkej06Icega3t/aqmXIIj/5d5yFD
         QDJC3dSEkyyUeSmaE7HwhGutp16+j1DPhskOrCOOTwdFs0BafSTtB/M/eR9Z6zVLuspk
         CsfSxqeELfLqTS9XCmoPePlzS2zsnAIK6cUyHnIxXEd2KVYR59ZEgxASFqFJJakaXcdH
         LBBA==
X-Forwarded-Encrypted: i=1; AJvYcCVMapFrBt0cSumX5wA8VcJ48MqhjQJPMHGJ9Ev0mCWL7NRJeGTCPkfs0HNMN9Hpo7tWAjpPo+FYth3G2LMK@vger.kernel.org
X-Gm-Message-State: AOJu0YwMF+EoR1v+4A/vvcspzkAz732lsGR83ugqZxeXxuW/SwQbZEUo
	Uu3i6bZaodqm+RhET1L2R7Yk+wPna+iQiwQSOfT8bqkdhYPrEAtB213h8nklIXiT596NgaRnAOU
	+NayLtZ05xXWZrTsbqV5+IwEQIPsuH2wkzQPH27ADoOWs2twnSJAtBuI6nHWPmx/50PFB
X-Gm-Gg: AeBDietsdo8nNmERlIRRH8Gc+PTMOjpVMqR8K64JveSmTi3SVJMYvnAO97gtEFo2u8c
	jj3aUgvMccDktBRI2Xz9xcesLkdGs4c7FIQTz/qJD1bdE8eJaikSp1zAubQ+BZHYGvQDx9ogg0r
	WvLW4Fd6EQe1FwEUi1IQE+0BctgdqOiSq1ZaQIn+JsKcSsgkHNz7eTgFTJsHi4PPQ4ld5HS5dxy
	FNKVHx34uGojVBySou++HoUeaJxNi0/hVToQjNs0dQKc5VVK6aUOokpaHD3sOvjS5MJNR3TS3bD
	x5w1bGtx/I2WEBG60deL1GuToWsJdc7J3Ttlm/Tdkv7VQG7oX7MPC+iYisszVfDLU6rT27SwlQp
	x6UBTntqWlyzooJ/6wGXLzv7wnerQaOIbptjgPYJiu5UruVzr7z32w9a0RPuDB0LcMoC5fw9oFg
	E=
X-Received: by 2002:a05:693c:3005:b0:2c1:7ea5:ec29 with SMTP id 5a478bee46e88-2d586eaa366mr441794eec.4.1775770080856;
        Thu, 09 Apr 2026 14:28:00 -0700 (PDT)
X-Received: by 2002:a05:693c:3005:b0:2c1:7ea5:ec29 with SMTP id 5a478bee46e88-2d586eaa366mr441778eec.4.1775770080326;
        Thu, 09 Apr 2026 14:28:00 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa571csm1665997eec.10.2026.04.09.14.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 14:27:59 -0700 (PDT)
Message-ID: <031702af-5976-438a-841a-48e95f41eb03@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 15:27:58 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] bus: mhi: Capture DDR training data using command
 mode
To: Kishore Batta <kishore.batta@oss.qualcomm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
 <20260319-sahara_protocol_new_v2-v4-7-47ad79308762@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-7-47ad79308762@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eOVTC9m5xG_cJFoGCeJdfqzDmb6uB1xU
X-Proofpoint-GUID: eOVTC9m5xG_cJFoGCeJdfqzDmb6uB1xU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5OCBTYWx0ZWRfX6W7SgZ2+Ui7o
 AmDKzDfQqTPe2pZkSKjtdaU0V8aaBqdVJWoegjsSy4mnl4HVGm6lfmyVqp03X/8Yt+moFJikPP/
 VfarDLlUP6CigGVwuFP+aqPzI10BxEdjJ+RuE2yosy7iqPvrpOMVKm/aAH/EuEQR5bEHcUYhQlO
 QEiofiS+ff+Pe7Z2FEExhoR7rh5bmH97CLrJHTaOOTghqhekcYpxr4yNuUysRY5PEsJhOtj0vK7
 g04Om1m9pHnGn3u1MpMDsHECI85TV0Ef4AUcGjADxTypIXQlf5EpXkUB0BvIUjTjq+WaM5Or/0G
 akmue+IEZyCCF15e4eLGPEEK68zGgiEi1HIaNPWOb6s9CAfPxw4U3o/DHt1TZF854FAqt4No0oA
 ABI23pO7h09mcxKpaitL1gGsctG43ShybNar/4vQl2W9VSsuxG53XGegKD52jujG93T1m+PcGZG
 xolpjP17LSYmqyx3kWw==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d819e1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=U35_I10QZVw-_bRh5h4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-102563-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AFF753CFF06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/2026 12:31 AM, Kishore Batta wrote:
> During early boot, devices may perform DDR training and produce training
> data that can be reused on subsequent boots to reduce initialization
> time. The sahara protocol provides a command mode flow to transfer this

Sahara

> training data to the host, but the driver currently does not handle
> command mode and drops the training payload.
> 
> Add Sahara command mode support to retrieve DDR training data from the
> device. When the device enters command mode and sends CMD_READY, query
> the support command list and request DDR training data using EXECUTE and
> EXECUTE_DATA. Allocate receive buffers based on the reported response
> size and copy the raw payload directly from the MHI DL completion
> callback.
> 
> Store the captured training data in controller-scoped memory using devres,
> so it remains available after sahara channel teardown. Also distinguish

Sahara

> raw payload completion from control packets in the DL callback, avoiding
> misinterpretation of training data as protocol messages, and requeue
> the RX buffer after switching back to IMAGE_TX_PENDING to allow the
> boot flow to continue.
> 
> Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
> ---
>   drivers/bus/mhi/sahara/sahara.c | 328 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 320 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/sahara/sahara.c b/drivers/bus/mhi/sahara/sahara.c
> index 0a0f578aaa47ab2c4ca0765666b392fb9936ddd5..c88f1220199ac4373d3552167870c19a0d5f23b9 100644
> --- a/drivers/bus/mhi/sahara/sahara.c
> +++ b/drivers/bus/mhi/sahara/sahara.c
> @@ -5,11 +5,14 @@
>    */
>   
>   #include <linux/devcoredump.h>
> +#include <linux/device.h>
> +#include <linux/device/devres.h>
>   #include <linux/firmware.h>
>   #include <linux/limits.h>
>   #include <linux/mhi.h>
>   #include <linux/minmax.h>
>   #include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
>   #include <linux/overflow.h>
>   #include <linux/sahara.h>
>   #include <linux/types.h>
> @@ -60,8 +63,16 @@
>   #define SAHARA_RESET_LENGTH		0x8
>   #define SAHARA_MEM_DEBUG64_LENGTH	0x18
>   #define SAHARA_MEM_READ64_LENGTH	0x18
> -
> +#define SAHARA_COMMAND_READY_LENGTH	0x8
> +#define SAHARA_COMMAND_EXEC_RESP_LENGTH	0x10
> +#define SAHARA_COMMAND_EXECUTE_LENGTH	0xc
> +#define SAHARA_COMMAND_EXEC_DATA_LENGTH	0xc
> +#define SAHARA_SWITCH_MODE_LENGTH	0xc
> +
> +#define SAHARA_EXEC_CMD_GET_COMMAND_ID_LIST	0x8
> +#define SAHARA_EXEC_CMD_GET_TRAINING_DATA	0x9
>   #define SAHARA_DDR_TRAINING_IMG_ID	34

Why is the indentation of this line messed up?

> +#define SAHARA_NUM_CMD_BUF		SAHARA_NUM_TX_BUF
>   
>   struct sahara_packet {
>   	__le32 cmd;
> @@ -97,6 +108,19 @@ struct sahara_packet {
>   			__le64 memory_address;
>   			__le64 memory_length;
>   		} memory_read64;
> +		struct {
> +			__le32 client_command;
> +		} command_execute;
> +		struct {
> +			__le32 client_command;
> +			__le32 response_length;
> +		} command_execute_resp;
> +		struct {
> +			__le32 client_command;
> +		} command_exec_data;
> +		struct {
> +			__le32 mode;
> +		} mode_switch;
>   	};
>   };
>   
> @@ -163,6 +187,7 @@ struct sahara_context {
>   	struct work_struct		fw_work;
>   	struct work_struct		dump_work;
>   	struct work_struct		read_data_work;
> +	struct work_struct		cmd_work;
>   	struct mhi_device		*mhi_dev;
>   	const char * const		*image_table;
>   	u32				table_size;
> @@ -183,6 +208,24 @@ struct sahara_context {
>   	bool				is_mem_dump_mode;
>   	bool				non_streaming;
>   	const char			*fw_folder;
> +	bool				is_cmd_mode;
> +	bool				receiving_trng_data;

You already spell out "receiving", spell out "training".  I don't recall 
seeing "trng" before so it seems like a really uncommon shortform.

> +	size_t				trng_size;
> +	size_t				trng_rcvd;
> +	u32				trng_nbuf;
> +	char				*cmd_buff[SAHARA_NUM_CMD_BUF];
> +};

