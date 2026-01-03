Return-Path: <linux-arm-msm+bounces-87323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC10CF034F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 18:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A7433000EBA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 17:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D171B394F;
	Sat,  3 Jan 2026 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zqyyrl+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72972744F;
	Sat,  3 Jan 2026 17:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767460924; cv=none; b=QhDzUBgdsC+4PlX2EN3L0m5PAk72kBu1NTPrQuzr1a+rko2GzX9Glvm40kzVaclmtToRH3UZo6tU/hxHkSWIdHjAvwCsmLRBDpdZs4qM7FEVSR5SOOy3Fxgki6s4m6u6aNpp0go0RiAHqMl7gKOLUiP14FIz4fFwV3WClqB1xo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767460924; c=relaxed/simple;
	bh=cxq0eS5NMjuJ68h3ON+M0YVTIPA5LFnQQvKn7hcQiJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z38xs3f0pYcZVjjQeOYf7rK0B3CCvH+N2brZQruoqt/POsngW7ZDu0OZ89Rfn4mmZeARNc5962DAwD1bJXkQ+bxVTfby7SrQwdOyBbifD0fJozVlbv6uXGTWBxvpG2W0814DT9WPkvtVLbdzWJKecf0nJsqUnwJzbpX6rKHJHF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zqyyrl+B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AD6C113D0;
	Sat,  3 Jan 2026 17:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767460924;
	bh=cxq0eS5NMjuJ68h3ON+M0YVTIPA5LFnQQvKn7hcQiJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zqyyrl+BJjZw/5fSPFEEqSVt9/Y3xIBJXs0+lRDhrQVgoaqyFVbS71a4//T6xpMeE
	 7U+PjLC0LAmRHXWRQpVo1lsAdY2cBPVgNpg9pClTQnfhlw4BgZSXc3SJajYjX6QKPH
	 kdvY96riNIFag+2CTEFkhIopfkvcAr+9Q08nwtCmHuZXu2PsO2zGpSfYladMawq+z0
	 U087TVFwYKQ7THXwId1+09Um7xrOrb7Ay8vV7Kmo/eaPX3WtECnNYB1FXVdZuqmRGx
	 HQ1qbhYtHdGB2sFokqQ9AEFUmITHgbEhKN3/KVRexAkGB9iqbIaS4ZYc9sFyJ10mlW
	 S1di6gxOk9RpQ==
Date: Sat, 3 Jan 2026 11:22:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Junhao Xie <bigfoot@radxa.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Xilin Wu <sophon@radxa.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tomas Winkler <tomasw@gmail.com>, Raag Jadav <raag.jadav@intel.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] firmware: qcom: scm: Add SCM storage interface
 support
Message-ID: <kmdf2rws5yf2wcyqkoyredpyg2njqwxgjq5qbsqmmimlqktfli@cjthcl3zw4un>
References: <20251218180205.930961-1-bigfoot@radxa.com>
 <155C9F219E5A9219+20251218180205.930961-2-bigfoot@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155C9F219E5A9219+20251218180205.930961-2-bigfoot@radxa.com>

On Fri, Dec 19, 2025 at 02:02:04AM +0800, Junhao Xie wrote:
> Add infrastructure to support accessing TrustZone-protected storage
> devices through SCM (Secure Channel Manager) calls. Some Qualcomm
> platforms protect their firmware storage (typically SPI NOR flash)
> via TrustZone, making it inaccessible from the non-secure world.
> 
> Currently allowlisted for Radxa Dragon Q6A (QCS6490) where it has been
> validated. Additional platforms can be added as they are tested.
> 

By adding the relevant compatible, I'm able to read something from the
SPI-NOR on the SC8280XP CRD as well.

This brings us to the next question, what data do you actually have in
your SPI-NOR? In what way do you use the mtd device that is presented?

On the laptop targets, the SPI-NOR is partitioned with a GPT partition
table, and there's one of more partitions that would be of interest to
parse/access from the kernel...

> Signed-off-by: Junhao Xie <bigfoot@radxa.com>
> Tested-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 183 +++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   3 +
>  include/linux/firmware/qcom/qcom_scm.h |  47 +++++++
>  3 files changed, 233 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 731074ca1ebbe..b117e1b58e363 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -66,6 +66,21 @@ struct qcom_scm_mem_map_info {
>  	__le64 mem_size;
>  };
>  
> +struct qcom_scm_storage_cmd {
> +	__le64 storage_type;
> +	__le64 slot_num;
> +	__le64 lun;
> +	__le64 guid_ptr;
> +	__le64 storage_cmd;
> +};
> +
> +struct qcom_scm_storage_cmd_details {
> +	__le64 lba;
> +	__le64 length;
> +	__le64 data_ptr;
> +	__le64 data_size;
> +};
> +
>  /**
>   * struct qcom_scm_qseecom_resp - QSEECOM SCM call response.
>   * @result:    Result or status of the SCM call. See &enum qcom_scm_qseecom_result.
> @@ -111,6 +126,15 @@ enum qcom_scm_qseecom_tz_cmd_info {
>  	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
>  };
>  
> +enum qcom_scm_storage_result {

These aren't really "enumerations", they are specifically defined
constants, please use #define.

> +	STORAGE_RESULT_SUCCESS			= 0,
> +	STORAGE_RESULT_NO_MEMORY		= 1,
> +	STORAGE_RESULT_INVALID_PARAMETER	= 2,
> +	STORAGE_RESULT_STORAGE_ERROR		= 3,
> +	STORAGE_RESULT_ACCESS_DENIED		= 4,
> +	STORAGE_RESULT_NOT_SUPPORTED		= 5,
> +};
> +
>  #define QSEECOM_MAX_APP_NAME_SIZE		64
>  #define SHMBRIDGE_RESULT_NOTSUPP		4
>  
> @@ -2214,6 +2238,159 @@ static void qcom_scm_qtee_init(struct qcom_scm *scm)
>  	devm_add_action_or_reset(scm->dev, qcom_scm_qtee_free, qtee_dev);
>  }
>  
> +#if IS_ENABLED(CONFIG_MTD_QCOM_SCM_STORAGE)
> +
> +int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
> +			      enum qcom_scm_storage_cmd_id cmd_id,
> +			      u64 lba, void *payload, size_t size)
> +{
> +	struct qcom_scm_res scm_res = {};
> +	struct qcom_scm_desc desc = {};
> +	struct qcom_scm_storage_cmd *cmd;
> +	struct qcom_scm_storage_cmd_details *details;
> +	size_t buf_size;
> +	void *payload_buf;
> +	int ret;
> +
> +	buf_size = sizeof(*cmd) + sizeof(*details);
> +	if (payload)
> +		buf_size += size;
> +	void *data __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
> +							 buf_size,
> +							 GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	memset(data, 0, buf_size);
> +	if (payload) {
> +		payload_buf = data + sizeof(*cmd) + sizeof(*details);
> +		memcpy(payload_buf, payload, size);
> +	}
> +
> +	cmd = data;
> +	cmd->storage_type = storage_type;

storage_type is CPU endian, cmd->storage_type is __le64, so all of these
needs cpu_to_le64().

> +	cmd->storage_cmd = cmd_id;
> +
> +	details = data + sizeof(*cmd);
> +	details->lba = lba;
> +	if (payload)
> +		details->data_ptr = qcom_tzmem_to_phys(payload_buf);
> +	details->length = size;
> +
> +	desc.svc = QCOM_SCM_SVC_STORAGE;
> +	desc.cmd = QCOM_SCM_STORAGE_CMD;
> +	desc.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_RO, QCOM_SCM_VAL,
> +				     QCOM_SCM_RW, QCOM_SCM_VAL);
> +	desc.args[0] = qcom_tzmem_to_phys(cmd);
> +	desc.args[1] = sizeof(*cmd);
> +	desc.args[2] = qcom_tzmem_to_phys(details);
> +	desc.args[3] = sizeof(*details);
> +	desc.owner = ARM_SMCCC_OWNER_SIP;
> +
> +	ret = qcom_scm_call(__scm->dev, &desc, &scm_res);
> +	if (ret)
> +		return ret;
> +
> +	if (payload)
> +		memcpy(payload, payload_buf, size);
> +
> +	switch (scm_res.result[0]) {
> +	case STORAGE_RESULT_SUCCESS:
> +		return 0;
> +	case STORAGE_RESULT_NO_MEMORY:
> +		return -ENOMEM;
> +	case STORAGE_RESULT_INVALID_PARAMETER:
> +		return -EINVAL;
> +	case STORAGE_RESULT_STORAGE_ERROR:
> +		return -EIO;
> +	case STORAGE_RESULT_ACCESS_DENIED:
> +		return -EACCES;
> +	case STORAGE_RESULT_NOT_SUPPORTED:
> +		return -EOPNOTSUPP;
> +	default:
> +		return -EIO;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_storage_send_cmd);
> +
> +/*
> + * Allowlist of platforms known to support and have tested SCM storage interface.
> + * This is a safety mechanism to prevent exposing potentially dangerous firmware
> + * access on untested platforms. New platforms should be added here after validation.
> + */
> +static const struct of_device_id qcom_scm_storage_allowlist[] = {
> +	{ .compatible = "radxa,dragon-q6a" },
> +	{ }
> +};
> +
> +static bool qcom_scm_storage_machine_is_allowed(void)
> +{
> +	struct device_node *np;
> +	bool match;
> +
> +	np = of_find_node_by_path("/");
> +	if (!np)
> +		return false;
> +
> +	match = of_match_node(qcom_scm_storage_allowlist, np);
> +	of_node_put(np);
> +
> +	return match;

This function can be rewritten as:

	return !!of_machine_device_match(qcom_scm_storage_allowlist);

> +}
> +
> +static void qcom_scm_storage_free(void *data)
> +{
> +	struct platform_device *storage_dev = data;
> +
> +	platform_device_unregister(storage_dev);
> +}
> +
> +static int qcom_scm_storage_init(struct qcom_scm *scm)
> +{
> +	struct qcom_scm_storage_info info;
> +	struct platform_device *storage_dev;
> +	int ret;
> +
> +	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +					QCOM_SCM_STORAGE_GET_INFO,
> +					0, &info, sizeof(info));
> +	if (ret < 0) {
> +		dev_info(scm->dev, "scm storage not available: %d\n", ret);
> +		return 0;
> +	}
> +
> +	if (!qcom_scm_storage_machine_is_allowed()) {
> +		dev_info(scm->dev, "scm storage untested, skipping\n");
> +		return 0;
> +	}
> +
> +	dev_info(scm->dev, "scm storage size %llu bytes\n",
> +		 info.total_blocks * info.block_size);
> +
> +	storage_dev = platform_device_alloc("qcom_scm_storage", -1);
> +	if (!storage_dev)
> +		return -ENOMEM;
> +
> +	storage_dev->dev.parent = scm->dev;
> +
> +	ret = platform_device_add(storage_dev);
> +	if (ret) {
> +		platform_device_put(storage_dev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(scm->dev, qcom_scm_storage_free,
> +					storage_dev);
> +}
> +
> +#else /* CONFIG_MTD_QCOM_SCM_STORAGE */
> +
> +static int qcom_scm_storage_init(struct qcom_scm *scm)
> +{
> +	return 0;
> +}
> +
> +#endif /* CONFIG_MTD_QCOM_SCM_STORAGE */
> +
>  /**
>   * qcom_scm_is_available() - Checks if SCM is available
>   */
> @@ -2449,6 +2626,12 @@ static int qcom_scm_probe(struct platform_device *pdev)
>  	/* Initialize the QTEE object interface. */
>  	qcom_scm_qtee_init(scm);
>  
> +	/*
> +	 * Initialize the SCM storage interface.
> +	 */
> +	ret = qcom_scm_storage_init(scm);
> +	WARN(ret < 0, "failed to initialize scm storage: %d\n", ret);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index a56c8212cc0c4..3b68b33c5ccc3 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -149,6 +149,9 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
>  #define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
>  
> +#define QCOM_SCM_SVC_STORAGE			0x1a
> +#define QCOM_SCM_STORAGE_CMD			0x01
> +
>  #define QCOM_SCM_SVC_WAITQ			0x24
>  #define QCOM_SCM_WAITQ_RESUME			0x02
>  #define QCOM_SCM_WAITQ_GET_WQ_CTX		0x03
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a55ca771286bf..41f799d8de54f 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -53,6 +53,36 @@ enum qcom_scm_ice_cipher {
>  	QCOM_SCM_ICE_CIPHER_AES_256_CBC = 4,
>  };
>  
> +enum qcom_scm_storage_cmd_id {

As with qcom_scm_storage_result above, this isn't really an enumeration,
but as it provides you with the type for the function parameters below,
I think it's okay. So, feel free to leave this and qcom_scm_storage_type
as is.

Regards,
Bjorn

> +	QCOM_SCM_STORAGE_INIT      = 0,
> +	QCOM_SCM_STORAGE_READ      = 1,
> +	QCOM_SCM_STORAGE_WRITE     = 2,
> +	QCOM_SCM_STORAGE_ERASE     = 3,
> +	QCOM_SCM_STORAGE_GET_INFO  = 4,
> +	QCOM_SCM_STORAGE_DEINIT    = 5,
> +};
> +
> +enum qcom_scm_storage_type {
> +	QCOM_SCM_STORAGE_NULL    = 0,
> +	QCOM_SCM_STORAGE_SPINOR  = 1,
> +};
> +
> +#define QCOM_SCM_STORAGE_FW_VER_LEN	32
> +#define QCOM_SCM_STORAGE_MEM_TYPE_LEN	5
> +#define QCOM_SCM_STORAGE_PROD_NAME_LEN	32
> +
> +struct qcom_scm_storage_info {
> +	u64 total_blocks;
> +	u32 block_size;
> +	u32 page_size;
> +	u32 num_physical;
> +	u64 manufacturer_id;
> +	u64 serial_num;
> +	char fw_version[QCOM_SCM_STORAGE_FW_VER_LEN];
> +	char memory_type[QCOM_SCM_STORAGE_MEM_TYPE_LEN];
> +	char product_name[QCOM_SCM_STORAGE_PROD_NAME_LEN];
> +} __packed;
> +
>  #define QCOM_SCM_PERM_READ       0x4
>  #define QCOM_SCM_PERM_WRITE      0x2
>  #define QCOM_SCM_PERM_EXEC       0x1
> @@ -181,4 +211,21 @@ int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,
>  int qcom_scm_qtee_callback_response(phys_addr_t buf, size_t buf_size,
>  				    u64 *result, u64 *response_type);
>  
> +#if IS_ENABLED(CONFIG_MTD_QCOM_SCM_STORAGE)
> +
> +int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
> +			      enum qcom_scm_storage_cmd_id cmd_id,
> +			      u64 lba, void *payload, size_t size);
> +
> +#else /* CONFIG_MTD_QCOM_SCM_STORAGE */
> +
> +static inline int qcom_scm_storage_send_cmd(enum qcom_scm_storage_type storage_type,
> +					    enum qcom_scm_storage_cmd_id cmd_id,
> +					    u64 lba, void *payload, size_t size)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +#endif /* CONFIG_MTD_QCOM_SCM_STORAGE */
> +
>  #endif
> -- 
> 2.51.2
> 

