Return-Path: <linux-arm-msm+bounces-87460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E40CF4025
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 15:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ECE7A3003FF2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 14:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21B7231A41;
	Mon,  5 Jan 2026 14:02:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E8E276046;
	Mon,  5 Jan 2026 14:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767621751; cv=none; b=AwusUtbqZlHHoSSksin654EqqCW1G81RrTOqz3H2d1BtJKJ9aOZhtFz6tSpXyRbmm1s//kbFxms3O+0+QI/D4vH7CObyP5KAQJLbbhIKi4XGQ8sUuHkcWTNOjeH0jjdCMYNXiGUKykFS2UnRjmIX7o9rQCmqNn+9xUodIsdsq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767621751; c=relaxed/simple;
	bh=lr9KRQvUSzishcVfoM3mkXrgrwXP51P7dZ69iITxYDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=inCdy/XNBzkJx3Z5QTgmGqLNOmw8yO/Zh4OePTFBoesH3LPqOAaey+Wz/lC1J3g+26lDJ/9fQR257bVkv0FfXM8VYIIOIZafkhn4uE2kPDenZ0IGHd7qn7XU+M+wBoig4KDH6VIvB6HG2D398D3z2OnGL3Uu2mSMyN7gBH+J/Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpsz20t1767621659t7d83f390
X-QQ-Originating-IP: 53eMKruBCBwdR5W5Egryq/zqXjgdWwfvH5WQniWkHZU=
Received: from [192.168.0.109] ( [121.207.53.173])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Jan 2026 22:00:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 19132313025302152
EX-QQ-RecipientCnt: 10
Message-ID: <64CBDD3CF274E966+d1faba44-e3aa-4c2f-9819-a24e4ddca468@radxa.com>
Date: Mon, 5 Jan 2026 22:00:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Add SCM storage interface
 support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Xilin Wu <sophon@radxa.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, Junhao Xie <bigfoot@radxa.com>
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <155C9F219E5A9219+20251218180205.930961-2-bigfoot@radxa.com>
 <kmdf2rws5yf2wcyqkoyredpyg2njqwxgjq5qbsqmmimlqktfli@cjthcl3zw4un>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <kmdf2rws5yf2wcyqkoyredpyg2njqwxgjq5qbsqmmimlqktfli@cjthcl3zw4un>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: Nty3yXuijLhXC0TiQzPiFOc5PeHCFklySlXc7ebC4GqMEIAZcHg5zSRV
	5zEX7foSRsnZZyM0XChQx6x3eLshB4yKXjGOUaukaXo5xv0oSe1lLz8KMwk8F6e61x3h5U4
	Y3l/zEALeMcaHDa7Vv59hgQh+63jCwamk0i4Wk6xo560Rp6yJKLdo8ljwXd0U3WnSPU63lo
	cVwaoC/vr9cvbMEm7bjcq4JsTDCGaYCtnMBjn91MxIR9HOnkIlUeMyfco93ozdHDFsJLk64
	qtv/DXy90ExtrWJvwvwLjx6udIzgQ7bb9B2cLs4D9i/F5BQKETXezE7iW+WPsCKqXW5paBt
	0ab8U6lBpF3PVOZCnKzQ2idYKrcJzASz/ifoLoKb9miFoBUtw/bs8Cp9fkCfjiPQPQdjc2b
	aD9OUj0J6dbzJscBKUkTEjNoCsC4qJRfKdsKmorzvCxv57ckOf9lv3gNVeT5hmW0VEw4gKB
	S6zt18+vJ6bpLPjZwWDsG4uIgyvyv+4y58v7IFQ/R2lwGzkXYI8rFuLUc1zCB4zXk9ARmSJ
	AoHzMm0Ts10cBbS4TsxhW8j/VsbieD7N5iRHOxiZxpNVZDHZ236RXP+4kH8iL7qfmvVzdIq
	cjCt4LTGfkm01fGj37mMRrVwlJNUg4T1KaYIcL9PtdkUyPJjmcW9lOYJB/b2uuKgOIXGjmv
	Tho+xKZKGwA5st3wcP13D594AE7onRIZTswtAjGyGaJJ+xCxS/AlY3FJXMi+p5igXv4Sd+o
	02vdlybuvZW+kHzkfY2vtcJt0LBo7YeIXTXJmzR84wL2w6Eg4Cqtjb+H4b2RuLLmhT2ZPES
	yWL4pefJ71iabaGxy4TckyMdZ8Wh4fbyJMAKKqxCqOgzfSq7MWbmDlEzA1dm2qAmDapfmb6
	7GJjQ98ZU1iTlm985wjUBWOqUEtWvcmQSXprIBIne/9+jRU7yCyM7vHWW5GVI7rP9LPOiq5
	bWERWSJtb/UYXPq2MWszKBDV+YtSTz6Rf9NhDkVV9GM+g31sIgSg7zpachr70RzUpOcVZeB
	6WBbSfjhH9jkNlsxwO
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

On 2026/1/4 1:22, Bjorn Andersson wrote:
> On Fri, Dec 19, 2025 at 02:02:04AM +0800, Junhao Xie wrote:
>> Add infrastructure to support accessing TrustZone-protected storage
>> devices through SCM (Secure Channel Manager) calls. Some Qualcomm
>> platforms protect their firmware storage (typically SPI NOR flash)
>> via TrustZone, making it inaccessible from the non-secure world.
>>
>> Currently allowlisted for Radxa Dragon Q6A (QCS6490) where it has been
>> validated. Additional platforms can be added as they are tested.
>>
> By adding the relevant compatible, I'm able to read something from the
> SPI-NOR on the SC8280XP CRD as well.
>
> This brings us to the next question, what data do you actually have in
> your SPI-NOR? In what way do you use the mtd device that is presented?
>
> On the laptop targets, the SPI-NOR is partitioned with a GPT partition
> table, and there's one of more partitions that would be of interest to
> parse/access from the kernel...

On the Radxa Dragon Q6A, the SPI-NOR stores boot firmware (XBL, TZ, etc.)
and is accessed via SCM only when the system is booted from SPI-NOR.

Earlier Q6A revisions used LE firmware, where the QSPI controller was
directly accessible from Linux. This platform is now transitioning to WP,
where QSPI is exclusively used by TZ and SPI-NOR can only be accessed via
SCM, similar to laptop platforms.

The exposed MTD device provides generic access to this storage. One of its
practical uses is firmware update and recovery. Since Q6A is a development
board, being able to update boot firmware directly from Linux (for example
using edl-ng together with this patch series) is preferred over EFI capsule
based flows.

>> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
>> Tested-by: Xilin Wu <sophon@radxa.com>
>> ---
>>   drivers/firmware/qcom/qcom_scm.c       | 183 +++++++++++++++++++++++++
>>   drivers/firmware/qcom/qcom_scm.h       |   3 +
>>   include/linux/firmware/qcom/qcom_scm.h |  47 +++++++
>>   3 files changed, 233 insertions(+)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 731074ca1ebbe..b117e1b58e363 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -66,6 +66,21 @@ struct qcom_scm_mem_map_info {
>>   	__le64 mem_size;
>>   };
>>   
>> +struct qcom_scm_storage_cmd {
>> +	__le64 storage_type;
>> +	__le64 slot_num;
>> +	__le64 lun;
>> +	__le64 guid_ptr;
>> +	__le64 storage_cmd;
>> +};
>> +
>> +struct qcom_scm_storage_cmd_details {
>> +	__le64 lba;
>> +	__le64 length;
>> +	__le64 data_ptr;
>> +	__le64 data_size;
>> +};
>> +
>>   /**
>>    * struct qcom_scm_qseecom_resp - QSEECOM SCM call response.
>>    * @result:    Result or status of the SCM call. See &enum qcom_scm_qseecom_result.
>> @@ -111,6 +126,15 @@ enum qcom_scm_qseecom_tz_cmd_info {
>>   	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
>>   };
>>   
>> +enum qcom_scm_storage_result {
> These aren't really "enumerations", they are specifically defined
> constants, please use #define.

I will convert them into macros.

>> +	STORAGE_RESULT_SUCCESS			= 0,
>> +	STORAGE_RESULT_NO_MEMORY		= 1,
>> +	STORAGE_RESULT_INVALID_PARAMETER	= 2,
>> +	STORAGE_RESULT_STORAGE_ERROR		= 3,
>> +	STORAGE_RESULT_ACCESS_DENIED		= 4,
>> +	STORAGE_RESULT_NOT_SUPPORTED		= 5,
>> +};
>> +
>>   #define QSEECOM_MAX_APP_NAME_SIZE		64
>>   #define SHMBRIDGE_RESULT_NOTSUPP		4
>>   
>> @@ -2214,6 +2238,159 @@ static void qcom_scm_qtee_init(struct qcom_scm *scm)
>>   	devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
>>   }
>>   
>> +#if IS_ENABLED(CONFIG_MTD_QCOM_SCM_STORAGE)
>> +
>> +int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
>> +			      enum qcom_scm_storage_cmd_id cmd_id,
>> +			      u64 lba, void *payload, size_t size)
>> +{
>> +	struct qcom_scm_res scm_res = {};
>> +	struct qcom_scm_desc desc = {};
>> +	struct qcom_scm_storage_cmd *cmd;
>> +	struct qcom_scm_storage_cmd_details *details;
>> +	size_t buf_size;
>> +	void *payload_buf;
>> +	int ret;
>> +
>> +	buf_size = sizeof(*cmd) + sizeof(*details);
>> +	if (payload)
>> +		buf_size += size;
>> +	void *data __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
>> +							 buf_size,
>> +							 GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +	memset(data, 0, buf_size);
>> +	if (payload) {
>> +		payload_buf = data + sizeof(*cmd) + sizeof(*details);
>> +		memcpy(payload_buf, payload, size);
>> +	}
>> +
>> +	cmd = data;
>> +	cmd->storage_type = storage_type;
> storage_type is CPU endian, cmd->storage_type is __le64, so all of these
> needs cpu_to_le64().

I will add the missing endian conversion for all le values.

>> +	cmd->storage_cmd = cmd_id;
>> +
>> +	details = data + sizeof(*cmd);
>> +	details->lba = lba;
[...]
>> +static bool qcom_scm_storage_machine_is_allowed(void)
>> +{
>> +	struct device_node *np;
>> +	bool match;
>> +
>> +	np = of_find_node_by_path("/");
>> +	if (!np)
>> +		return false;
>> +
>> +	match = of_match_node(qcom_scm_storage_allowlist, np);
>> +	of_node_put(np);
>> +
>> +	return match;
> This function can be rewritten as:
>
> 	return !!of_machine_device_match(qcom_scm_storage_allowlist);

I will replace this with a check using __qcom_scm_is_call_available(),
which avoids the need for a machine allowlist and provides a more
generic capability-based test, Thank you for your suggestion!

>> +}
>> +
[...]
>> --- a/include/linux/firmware/qcom/qcom_scm.h
>> +++ b/include/linux/firmware/qcom/qcom_scm.h
>> @@ -53,6 +53,36 @@ enum qcom_scm_ice_cipher {
>>   	QCOM_SCM_ICE_CIPHER_AES_256_CBC = 4,
>>   };
>>   
>> +enum qcom_scm_storage_cmd_id {
> As with qcom_scm_storage_result above, this isn't really an enumeration,
> but as it provides you with the type for the function parameters below,
> I think it's okay. So, feel free to leave this and qcom_scm_storage_type
> as is.
>
> Regards,
> Bjorn
>

Thank you for the review, I will incorporate these changes in v2.

Best regards,
Junhao Xie


