Return-Path: <linux-arm-msm+bounces-91282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJYcLECPfGkQNwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:00:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F22B9A83
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 43B4D3002F67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF1B36A03C;
	Fri, 30 Jan 2026 11:00:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A183E378810;
	Fri, 30 Jan 2026 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769770811; cv=none; b=tCJ8qA/dEWi2L70GPVXQLaeAYuJTiPsZKfbwJxREZj/vcgK2GglYWcy1vwYHDGULCKjPoBE5FsWl54xY7dmTSOq5+uwAaOxHB0oVI9b755XtQDhRfEk5xEmg7JyW7h1vVlCgzsHMI2qAB/j7PahfTMlXzEizde+qkiGfstydCos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769770811; c=relaxed/simple;
	bh=+eszfBPXEs3kGT4bJSC5o7KZyL2rWuV/7j8BvWt4FP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RE0ZTQDSgpWPJrTAOnPrx07BNPVVb875DTWWaVi7qoOQ0FDfcLKzC3cne/F+3l6H+SVYxs7/LsoIysiU//xzM8q7b+CV2vSv8ByqZDP3jWy56e2BNuEnZap3zcen4B7xieVvJ38GowMbK1n9sfKq8W5xZJ/9y8wNeLp2AI2kwic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz10t1769770732t176c8529
X-QQ-Originating-IP: L8IWA4HbVRjeQKViajbYKiM5sBQL3YPX8P/SIJYiBOs=
Received: from [192.168.0.109] ( [110.81.94.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Jan 2026 18:58:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3412299832332157637
EX-QQ-RecipientCnt: 11
Message-ID: <A87E0D60BEDCA22F+511dd411-a9a2-4894-8848-0c92ddf1a3ec@radxa.com>
Date: Fri, 30 Jan 2026 18:58:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Add SCM storage interface
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>,
 Junhao Xie <bigfoot@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <20260126-scm-storage-v2-v2-1-fa045c7e7699@radxa.com>
 <2d28b5d0-c5f4-4085-b2d0-18128b021416@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <2d28b5d0-c5f4-4085-b2d0-18128b021416@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Nx/b/ZER74yjVCCUvuY+g2WK/FESO45tChVmi5fuZcJrt04ObKWNvmHh
	HAgg42i7s6U9Gpgb7kbcZjo5auoiM7+LHsTetbrBkipVGTmG7m4e/VV3WA56lED0OBDJIgT
	At51sY8pnVJCd7twV06FvcOgq9epND6X94gCycyXJ+v7qT85WhmZSFBU7c9pABjMxynVwHD
	2TZyqCcDq74drgBobEo6/7nR8Se8dNzSOcz1F8dGP8aFUPFtvb8wPEBO5/9kB8fjJpPx99G
	h9xk1QkKkx9tMJzFkjXMjB3LTYX5ygTWXBHltf0yx8qcuqF8hTBrtW1dPR6gP6QXs0CgoSX
	gtOUiiLj6uC71FSx6Ko2nGYK+e2P1XLXcw88On84qjxzOaKB017w+UaxIBh1LuxKlrw5dur
	ToekkGoSwlUlBilL4lQjGldUEq9S+Yrmh6IGU80wYisRtagV+QEklSA0Ng6G+E/kBGsMeao
	76bxbahvbfS9Yo0zwrYBEBEDIUY7uVW/gwBmLAcmFYUBIehWKAyPiBo1hUV5wrDJFOtPLyW
	twoDHKcLCtw5JkNFTESlCTtgJ5wRWbNVdOtmDL6WriD1Isc07ivCZao669AqbI0jcHvLyK8
	Wp2OFLiobbxzA0rdlI4UGb5Ug97QhG90FJ/VmC9SPI+zAuOm0UxHgaKBjIuobk2N7jXYRst
	ZDQQAqh68sQZWd8/gl0t17lfPCT9ULH12KRhp/fHFHHaBK7nP2fO1L6/A4CuuTpfLTb7/4s
	xozbxu/qt9hw6JAqterowEcu13BfDlwoX4cMGbzXlHH566w1ummx5bM8i+KSBdj/2Nan4Do
	fnbM9TyM4CL0TnIImFlB2J24bzGSXqLjpvGGZMsUed1NIAauV8peC0TTAdakabHp23kpPXB
	wVRVpFtQoEhiISKt+GHIp7CniBuyuH/1dBjMS2hwxCLzj2SuHlCRiviAK9MXGHA9+Japetf
	FzFIGaWaOJTJm7rbpa30HhgTvtLFCYXsnuiLpW5xOKyABv310aznmjPTIB2ItRPDLkU+aXb
	mavk631aQJ/ENqtA03
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91282-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigfoot@radxa.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D8F22B9A83
X-Rspamd-Action: no action

On 2026/1/28 21:39, Konrad Dybcio wrote:
> On 1/26/26 12:44 PM, Junhao Xie wrote:
>> Add infrastructure to support accessing TrustZone-protected storage
>> devices through SCM (Secure Channel Manager) calls. Some Qualcomm
>> platforms protect their firmware storage (typically SPI NOR flash)
>> via TrustZone, making it inaccessible from the non-secure world.
>>
>> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
>> Tested-by: Xilin Wu <sophon@radxa.com>
>> ---
> [...]
>
>> +int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
>> +			      enum qcom_scm_storage_cmd_id cmd_id,
>> +			      u64 lba, void *data, size_t size)
> Please add kerneldoc, as this is an exported function

I will add kerneldoc for qcom_scm_storage_send_cmd in v3

>> +{
>> +	struct qcom_scm_storage_payload *payload __free(qcom_tzmem) = NULL;
>> +	struct qcom_scm_res scm_res = {};
>> +	struct qcom_scm_desc desc = {};
>> +	phys_addr_t payload_addr;
>> +	size_t buf_size;
>> +	int ret;
>> +
>> +	buf_size = sizeof(*payload);
>> +	if (data)
>> +		buf_size += size;
>> +
>> +	payload = qcom_tzmem_alloc(__scm->mempool, buf_size, GFP_KERNEL);
>> +	if (!payload)
>> +		return -ENOMEM;
>> +
>> +	memset(payload, 0, buf_size);
> You're overwriting the data part a line below, let's just zero out the
> cmd+details (sizeof(*payload)) part
>
>> +	if (data)
> (please add a \n above - normally
>
> foo = xyz;
> if (abc)
> 	...
>
> implies the condition takes into account the previous line)

I will fix them in v3.

> [...]
>
>> +	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_STORAGE,
>> +					 QCOM_SCM_STORAGE_CMD))
>> +		return;
>> +
>> +	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
>> +					QCOM_SCM_STORAGE_GET_INFO,
>> +					0, &info, sizeof(info));
> I'm curious what happens if the call is available but SPINOR is not
> populated onboard..
>
> I thiiiink it should return STORAGE_RESULT_INVALID_PARAMETER but I'm not
> a 100% sure. Guess we'll see down the road.

Yes, on platforms I tested (QCS6490 LE), it returns 
STORAGE_RESULT_INVALID_PARAMETER.

>> +	if (ret < 0) {
>> +		dev_warn(scm->dev, "scm storage get info failed: %d\n", ret);
>> +		return;
>> +	}
>> +
>> +	total_blocks = le64_to_cpu(info.total_blocks);
>> +	block_size = le32_to_cpu(info.block_size);
>> +
>> +	dev_dbg(scm->dev, "scm storage size %llu bytes\n",
>> +		total_blocks * block_size);
>> +
>> +	storage_dev = platform_device_alloc("qcom_scm_storage", -1);
> -1 is PLATFORM_DEVID_NONE
>
> Let's use PLATFORM_DEVID_AUTO to allow potentially multiple instances of
> this driver being spawned down the road

I will change it to PLATFORM_DEVID_AUTO.
But will they really have multiple instances?

> Konrad

Thank you for the review, I will incorporate these changes in v3.

Best regards,
Junhao Xie


