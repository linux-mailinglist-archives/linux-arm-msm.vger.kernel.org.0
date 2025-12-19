Return-Path: <linux-arm-msm+bounces-85940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA71ACD11BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:20:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA2C0302CF45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A23285419;
	Fri, 19 Dec 2025 17:17:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBEE2BF3D7;
	Fri, 19 Dec 2025 17:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164674; cv=none; b=lncMwpDD4qf6dF1SE/SqeOj5CL5U2RQJZFl7Kl34k+0OYq9SgNi66yJls78wdSZVn7XfbAVkydC1lfR1YZWM3Iiosu9EdGaWJcX8vok0ChC3LoPdhjwQlQTQ10iFPb0Nsd9bbJkstrq3DxolmGxLHimmGRNwBrguO8yb/i+JEH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164674; c=relaxed/simple;
	bh=wbc3qkYjRJEXz8H33tjyjNTmPGzMeBKSFPFNbaUg8Is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ccKdUQ5xGhtalmPPfhrhy0BuO2lBbGrRDk/AYOgOSfY1Uid9XntNq4A/UZTx8LzH7Lg87LTEDriNRWb6ppT7anSXgKNolosUJK7+SumONS1/ExnQomudfJbEB+ACQRURjMdvccEh6zyOfyCyTCTKMNQl4u4U9DHMmK8IwSLuvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz7t1766164578ta021a727
X-QQ-Originating-IP: VIgD7Km41FaSeRiB8jcnBs9POC/pzWkFGEuKG8sOYs0=
Received: from [192.168.0.160] ( [120.40.108.137])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 20 Dec 2025 01:16:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6853239046305480175
EX-QQ-RecipientCnt: 11
Message-ID: <8DD9C595B061AB97+b0f78150-3930-43ac-ac56-b57f24afb5d9@radxa.com>
Date: Sat, 20 Dec 2025 01:16:17 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Add SCM storage interface
 support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Xilin Wu <sophon@radxa.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, Junhao Xie <bigfoot@radxa.com>
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <155C9F219E5A9219+20251218180205.930961-2-bigfoot@radxa.com>
 <84be5656-b22e-4fa7-8732-b355ba0c86ed@oss.qualcomm.com>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <84be5656-b22e-4fa7-8732-b355ba0c86ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: OEyOu662Vd1NRVX/uYi9DmkCzw5ACdSkeHr3NdUBYDSBeyc3gp0uTmcI
	Yz/DtozMQj1p82xp27h1C6k+6ybijEthXCMcVf4uG9odv8kdJ+oYrrovdGRReK1UyD0pn3y
	5mQ+SBoogNqgOCQNsE5eNrbuK7w6lkO5dWFWd4EbDIT5JEJk+Cniv1GV2OAB6QQomTV/HZy
	4sUUrERFhDPCGCA7cmi0lsi+6ezFVj9T8ML4v76c/JFY9/JWAPxQAqGYWbg1+jRmVXecA1+
	rGNzXKiQHEXg3xF2vVdxrSkIYR86HRwWY+BwgCWgnQcbB5Hq3y1O38047UtVJxKxiZbqpag
	4HABn9VLyAjpYh9D0MxsVA2TmpIFEy5Wou+7d7lJvlOdo7WuV7QUoL3zFrlH471l3p8G2hQ
	JZIc/0pYdiunMADlAa49+3AXMBNjI6oBVUItOGc8mO3L/eqI4LqXuB4jTx9dv5A264XZ1nv
	je7WmZrabMxgCBbaqm15j9K3BB3SFsCBEmGn1CdnGHR0QnqWbFVATxdtCEzx4mAt9QFzVvb
	C+YcddOelue/TwEsv037rYxHtg/KZJ+KUsRXdj2SY49nWBwOdfL9o+FyECCeZAP+fQVszcZ
	6k9o4ApP333BfTOuhSza1BaXn53AzvAXBCIZWGbZLgCdqMQiRz9oe/51b4gVxelKQZr26In
	ROfwAMCd8MfY+IifO1xWYHYfhOd/wuPRg2faa414BpRBr9XbwcD0C3U1pQ0UrrzPz1rdGQI
	mP5UrRU/69AEnoA7eqGcFZyylvqpzCvSclA6TmobaQ03vrBsBjmIyLZNnJiDOtZKp1/j9Vn
	AnwE3JVyN6LpstUGoP1OxAxbF0pMp0343PMzXiZpKjJ1WlqkzDLqtJmjp2XssucPuBQFFmg
	fxFuSv+Rp2k870ZZBKG0dWVQ7BdBCrx2MKmM190L5is1hRrG45FXremqPkhcypNKtcWmw5S
	PPn94eTg1g5yAtgDLwIsP5oSU3Sl8MILn5QrmfIQJTbft1WLtYUWBGo9eV4N7vfCJXM73pk
	cnN0eXWKCrpwKzzdB96Zq+mLdTFsEl1weHL7i3z20DCMQtlgBaezd4bHg9Se5qM4g0cWQk4
	Q==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On 2025/12/19 19:45, Konrad Dybcio wrote:
> On 12/18/25 7:02 PM, Junhao Xie wrote:
>> Add infrastructure to support accessing TrustZone-protected storage
>> devices through SCM (Secure Channel Manager) calls. Some Qualcomm
>> platforms protect their firmware storage (typically SPI NOR flash)
>> via TrustZone, making it inaccessible from the non-secure world.
>>
>> Currently allowlisted for Radxa Dragon Q6A (QCS6490) where it has been
>> validated. Additional platforms can be added as they are tested.
>>
>> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
>> Tested-by: Xilin Wu <sophon@radxa.com>
>> ---
>>  drivers/firmware/qcom/qcom_scm.c       | 183 +++++++++++++++++++++++++
>>  drivers/firmware/qcom/qcom_scm.h       |   3 +
>>  include/linux/firmware/qcom/qcom_scm.h |  47 +++++++
>>  3 files changed, 233 insertions(+)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index 731074ca1ebbe..b117e1b58e363 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -66,6 +66,21 @@ struct qcom_scm_mem_map_info {
>>  	__le64 mem_size;
>>  };
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
> Let's make them __packed if only to denote that they're shared structures
> (no change to the compiler output because it's n*u64)

I will add the missing __packed to qcom_scm_storage_cmd and
qcom_scm_storage_cmd_details.

> [...]
>
>> +#if IS_ENABLED(CONFIG_MTD_QCOM_SCM_STORAGE)
> I would vouch for this to be always compiled-in

I mimicked CONFIG_QCOM_QSEECOM here, but it seems unneeded. I will remove this macro check.

>> +int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
>> +			      enum qcom_scm_storage_cmd_id cmd_id,
>> +			      u64 lba, void *payload, size_t size)
> Please align the parameter whitespace (checkpatch, maybe w/ --strict
> should point that out)
>

I have already aligned the parameter, but mix of tabs and spaces
causes leading plus in diff to make them appear misaligned?
(checkpatch --strict doesn't report any errors or warnings.)

>> +{
>> +	struct qcom_scm_res scm_res = {};
>> +	struct qcom_scm_desc desc = {};
>> +	struct qcom_scm_storage_cmd *cmd;
>> +	struct qcom_scm_storage_cmd_details *details;
>> +	size_t buf_size;
>> +	void *payload_buf;
>> +	int ret;
> Reverse-Christmas-tree would be neat (it's in a week!)

Thanks, I will fix it.

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
>> +	cmd->storage_cmd = cmd_id;
>> +
>> +	details = data + sizeof(*cmd);
>> +	details->lba = lba;
> I'm debating whether adding something like:
>
> struct qcom_scm_storage_payload {
> 	struct qcom_scm_storage_cmd *cmd;
> 	struct qcom_scm_storage_cmd_details *details;
> 	void *data[];
> };
>
> would improve readability, but perhaps for just 3 items it's simply not
> worth the boilerplate

Thanks for the suggestion, I will rework this for better readability in v2.

> [...]
>
>> +static int qcom_scm_storage_init(struct qcom_scm *scm)
>> +{
>> +	struct qcom_scm_storage_info info;
>> +	struct platform_device *storage_dev;
>> +	int ret;
>> +
>> +	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
>> +					QCOM_SCM_STORAGE_GET_INFO,
>> +					0, &info, sizeof(info));
>> +	if (ret < 0) {
>> +		dev_info(scm->dev, "scm storage not available: %d\n", ret);
>> +		return 0;
>> +	}
> You can first call __qcom_scm_is_call_available for even more robustness
>
>> +
>> +	if (!qcom_scm_storage_machine_is_allowed()) {
>> +		dev_info(scm->dev, "scm storage untested, skipping\n");
>> +		return 0;
>> +	}
> FWIW UEFI uses these APIs, so if the implementation is correct, I see no
> reason to worry

I will switch to __qcom_scm_is_call_available instead of qcom_scm_storage_machine_is_allowed,
Thank you for your suggestion!

>> +
>> +	dev_info(scm->dev, "scm storage size %llu bytes\n",
>> +		 info.total_blocks * info.block_size);
> dev_dbg?

I will change to use dev_dbg.

>
>> +
>> +	storage_dev = platform_device_alloc("qcom_scm_storage", -1);
>> +	if (!storage_dev)
>> +		return -ENOMEM;
>> +
>> +	storage_dev->dev.parent = scm->dev;
>> +
>> +	ret = platform_device_add(storage_dev);
>> +	if (ret) {
>> +		platform_device_put(storage_dev);
>> +		return ret;
>> +	}
>> +
>> +	return devm_add_action_or_reset(scm->dev, qcom_scm_storage_free,
>> +					storage_dev);
> fauxbus?

For consistency with the existing code in this file,
I will stick to platform_device_add.

>> +}
>> +
>> +#else /* CONFIG_MTD_QCOM_SCM_STORAGE */
>> +
>> +static int qcom_scm_storage_init(struct qcom_scm *scm)
>> +{
>> +	return 0;
>> +}
>> +
>> +#endif /* CONFIG_MTD_QCOM_SCM_STORAGE */
>> +
>>  /**
>>   * qcom_scm_is_available() - Checks if SCM is available
>>   */
>> @@ -2449,6 +2626,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
>>  	/* Initialize the QTEE object interface. */
>>  	qcom_scm_qtee_init(scm);
>>  
>> +	/*
>> +	 * Initialize the SCM storage interface.
>> +	 */
> /* This fits in a single-line comment */

Thanks, I will fix it.

>> +	ret = qcom_scm_storage_init(scm);
>> +	WARN(ret < 0, "failed to initialize scm storage: %d\n", ret);
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
>> index a56c8212cc0c4..3b68b33c5ccc3 100644
>> --- a/drivers/firmware/qcom/qcom_scm.h
>> +++ b/drivers/firmware/qcom/qcom_scm.h
>> @@ -149,6 +149,9 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>>  #define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
>>  #define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
>>  
>> +#define QCOM_SCM_SVC_STORAGE			0x1a
>> +#define QCOM_SCM_STORAGE_CMD			0x01
>> +
>>  #define QCOM_SCM_SVC_WAITQ			0x24
>>  #define QCOM_SCM_WAITQ_RESUME			0x02
>>  #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
>> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
>> index a55ca771286bf..41f799d8de54f 100644
>> --- a/include/linux/firmware/qcom/qcom_scm.h
>> +++ b/include/linux/firmware/qcom/qcom_scm.h
>> @@ -53,6 +53,36 @@ enum qcom_scm_ice_cipher {
>>  	QCOM_SCM_ICE_CIPHER_AES_256_CBC = 4,
>>  };
>>  
>> +enum qcom_scm_storage_cmd_id {
>> +	QCOM_SCM_STORAGE_INIT      = 0,
>> +	QCOM_SCM_STORAGE_READ      = 1,
>> +	QCOM_SCM_STORAGE_WRITE     = 2,
>> +	QCOM_SCM_STORAGE_ERASE     = 3,
>> +	QCOM_SCM_STORAGE_GET_INFO  = 4,
>> +	QCOM_SCM_STORAGE_DEINIT    = 5,
> 6 -> _MAC_MISMATCH -> EBADMSG? (invalid data hash)
> 7 -> _ALREADY_RUNNING -> -EALREADY
> 8 -> _PARTITION_NOT_FOUND -> -ENOENT?
> 9 -> _READONLY -> -EROFS

Thank you for your addition, I will add these codes to qcom_scm_storage_result.

>> +};
>> +
>> +enum qcom_scm_storage_type {
>> +	QCOM_SCM_STORAGE_NULL    = 0,
>> +	QCOM_SCM_STORAGE_SPINOR  = 1,
>> +};
>> +
>> +#define QCOM_SCM_STORAGE_FW_VER_LEN	32
>> +#define QCOM_SCM_STORAGE_MEM_TYPE_LEN	5
>> +#define QCOM_SCM_STORAGE_PROD_NAME_LEN	32
>> +
>> +struct qcom_scm_storage_info {
>> +	u64 total_blocks;
>> +	u32 block_size;
>> +	u32 page_size;
>> +	u32 num_physical;
>> +	u64 manufacturer_id;
>> +	u64 serial_num;
>> +	char fw_version[QCOM_SCM_STORAGE_FW_VER_LEN];
>> +	char memory_type[QCOM_SCM_STORAGE_MEM_TYPE_LEN];
>> +	char product_name[QCOM_SCM_STORAGE_PROD_NAME_LEN];
> I would strongly assume all variables here are little-endian as well

I will change to using __le64 and __le32.

> Konrad
>

Thank you for the review, I will incorporate these changes in v2.

Best regards,
Junhao Xie

