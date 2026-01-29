Return-Path: <linux-arm-msm+bounces-91209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNtyKLque2lOHwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 20:02:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BCAB3C3D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 20:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 504A5303A915
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 19:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF92B30B50F;
	Thu, 29 Jan 2026 19:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W6sG3Nl1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976F130EF7F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 19:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769713287; cv=none; b=dz95l8BY3ZuCFHtzb9f6hySiNjyjViFlQnioj+ybbCla/yHhbd5lqaETuQtHEOEfw/Th2IQ/56Zefzn6ilLuhvaNm4ABD9K9vYuE6FmvQEyApfwRomUGTq4ugpCt/vvAe68eEasu4UcCwf7LV8i9l0cV6aoYToLD0+W+9WEu5Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769713287; c=relaxed/simple;
	bh=W4oiW3ZCreBFKnt1WN4t37yUfwwWI+rWsckbWFsLrZA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aAw7P+oKY25gUYVzXBR/u4Ul+BJxjwWQvJ4f1o6xvcIN6Dr/Smcn2GC6pzsST7px8cwEgwvoJ0SqWfHfRj3gdx7XfoGn6LE4PagChnEaon5w4LgwomkrqSPXb7FQt0EpCOq37Sengail7QrMdEp8W2UR1Jj6qwW9KZ+O96aDYmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W6sG3Nl1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 645C6C22F4C;
	Thu, 29 Jan 2026 19:01:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4300B60746;
	Thu, 29 Jan 2026 19:01:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69B46119A880F;
	Thu, 29 Jan 2026 20:01:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769713279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R3bTYiE5fmpx2hKk+ij/xNGunlQDmY23LY/sHyFCZyM=;
	b=W6sG3Nl1IURGhJrQDPhEb6hFjjFnVg/wK5hJxzooruVb0xYppeZtsNqWhZykDVhuNC4mFK
	772UVOkszbjzC41lJE5koR+krq3ooTxFgdxEMJm30e2qMhrrkOEZNNyX4Ni/sdlXju9BHQ
	2Uz9tnuQ8OoGuYJMRbIQvuWruQAdg/vvxIasozv4XB2l/kEnALQw2CE231VwWZmizceTDG
	u34EdPCIjgeb5erQg1BkBF4ePuMr4YSSx8dfxUvbbzEg2qCaS7ZAmHodMa7m/3VnH0/6BB
	sVO5fwcZ6qczQfx1wZ753Mv7WRGVojypwDCpi7E7UGc7ZKzFsU3g0qnEm3PJmQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Junhao Xie <bigfoot@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konradybcio@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-arm-msm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  Xilin Wu
 <sophon@radxa.com>
Subject: Re: [PATCH v2 2/2] mtd: devices: Add Qualcomm SCM storage driver
In-Reply-To: <20260126-scm-storage-v2-v2-2-fa045c7e7699@radxa.com> (Junhao
	Xie's message of "Mon, 26 Jan 2026 19:44:52 +0800")
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
	<20260126-scm-storage-v2-v2-2-fa045c7e7699@radxa.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 29 Jan 2026 20:01:12 +0100
Message-ID: <87a4xwkzuv.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_FROM(0.00)[bounces-91209-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Queue-Id: 08BCAB3C3D
X-Rspamd-Action: no action

Hello Junhao,

> +static int qcom_scm_storage_erase(struct mtd_info *mtd,
> +				  struct erase_info *instr)
> +{
> +	struct qcom_scm_storage *host =3D mtd->priv;
> +	size_t block_size;
> +
> +	if (instr->addr % host->mtd.erasesize ||
> +	    instr->len % host->mtd.erasesize)
> +		return -EINVAL;

Can theses situations realistically happen? Erases are in theory
eraseblock aligned, so I doubt this case shall be checked in device drivers.

> +
> +	block_size =3D le32_to_cpu(host->info.block_size);

You seem to store the SCM info structure as-is and always make
conversions on the fly. May I suggest to store the fields you need
directly in the correct format/endianness?

> +
> +	guard(mutex)(&host->lock);
> +
> +	return qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +					 QCOM_SCM_STORAGE_ERASE,
> +					 instr->addr / block_size,

Actually what you need instead of block_size is to use mtd->erasesize
directly, no need to store "block_size" in your structure, you already
have it.

> +					 0, instr->len);
> +}
> +
> +static int qcom_scm_storage_read(struct mtd_info *mtd,
> +				 loff_t from, size_t len,
> +				 size_t *retlen, u_char *buf)

u_char? Can we use a more common type?

> +{
> +	struct qcom_scm_storage *host =3D mtd->priv;
> +	loff_t block_start, block_off, lba;
> +	size_t block_size, chunk, to_read;
> +	int ret;
> +
> +	if (retlen)
> +		*retlen =3D 0;

Are there cases where retlen can be absent?

> +
> +	if (from + len > mtd->size)
> +		return -EINVAL;

This check should be done at the core level already.

> +	if (len =3D=3D 0)
> +		return 0;

Ditto (see mtdchar_read()).

> +	block_size =3D le32_to_cpu(host->info.block_size);
> +
> +	guard(mutex)(&host->lock);
> +
> +	while (len > 0) {
> +		block_start =3D round_down(from, block_size);
> +		block_off =3D from - block_start;
> +		lba =3D block_start / block_size;
> +
> +		if (block_off || len < block_size) {
> +			chunk =3D min_t(size_t, block_size - block_off, len);
> +			to_read =3D block_size;
> +		} else {
> +			chunk =3D round_down(len, block_size);
> +			chunk =3D min_t(size_t, chunk, host->buffer_size);
> +			to_read =3D chunk;
> +		}
> +
> +		ret =3D qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +						QCOM_SCM_STORAGE_READ,
> +						lba, host->buffer,
> +						to_read);
> +		if (ret)
> +			return ret;
> +
> +		memcpy(buf, host->buffer + block_off, chunk);
> +
> +		buf +=3D chunk;
> +		from +=3D chunk;
> +		len -=3D chunk;
> +		if (retlen)
> +			*retlen +=3D chunk;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_scm_storage_write(struct mtd_info *mtd,
> +				  loff_t to, size_t len,
> +				  size_t *retlen, const u_char *buf)
> +{
> +	struct qcom_scm_storage *host =3D mtd->priv;
> +	loff_t block_start, block_off, lba;
> +	size_t block_size, chunk, to_write;
> +	int ret;
> +
> +	if (retlen)
> +		*retlen =3D 0;
> +
> +	if (to + len > mtd->size)
> +		return -EINVAL;
> +
> +	if (len =3D=3D 0)
> +		return 0;
> +
> +	block_size =3D le32_to_cpu(host->info.block_size);
> +
> +	guard(mutex)(&host->lock);
> +
> +	while (len > 0) {
> +		block_start =3D round_down(to, block_size);
> +		block_off =3D to - block_start;
> +		lba =3D block_start / block_size;
> +
> +		if (block_off || len < block_size) {
> +			chunk =3D min_t(size_t, block_size - block_off, len);
> +			to_write =3D block_size;
> +
> +			ret =3D qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +							QCOM_SCM_STORAGE_READ,
> +							lba, host->buffer,
> +							block_size);

This is strange. Does it really work? My understanding: you're trying to
handle a non aligned write access (I'm not even sure this is possible as
you set writesize =3D=3D erasesize) by reading the existing data before
writing. If that's what you intend to do, you'll forcibly get 1s instead
of actual data because erases are mandatory before writes, which means
your read will happen too late.

I might be totally wrong, but I believe this approach is
incorrect. Please explain what you're trying to do otherwise.

> +			if (ret)
> +				return ret;
> +		} else {
> +			chunk =3D round_down(len, block_size);
> +			chunk =3D min_t(size_t, chunk, host->buffer_size);
> +			to_write =3D chunk;
> +		}
> +
> +		memcpy(host->buffer + block_off, buf, chunk);
> +
> +		ret =3D qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +						QCOM_SCM_STORAGE_WRITE,
> +						lba, host->buffer,
> +						to_write);
> +		if (ret)
> +			return ret;
> +
> +		buf +=3D chunk;
> +		to +=3D chunk;
> +		len -=3D chunk;
> +		if (retlen)
> +			*retlen +=3D chunk;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_scm_storage_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct qcom_scm_storage *host;
> +	u64 total_blocks, serial_num;
> +	u32 block_size;
> +	int ret;
> +
> +	host =3D devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +	if (!host)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, host);
> +	host->dev =3D dev;
> +
> +	ret =3D devm_mutex_init(dev, &host->lock);
> +	if (ret)
> +		return ret;
> +
> +	host->buffer_size =3D SZ_256K;
> +	host->buffer =3D devm_kzalloc(dev, host->buffer_size, GFP_KERNEL);

Do you really need 256K of adjacent memory? If this is a DMA-able
buffer, then yes. Also, the check (block_size vs. buffer_size) should
happen before this allocation, and you should not need to allocate 256k
blindly, just use the NOR geometry knowledge.

> +	if (!host->buffer)
> +		return -ENOMEM;
> +
> +	ret =3D qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
> +					QCOM_SCM_STORAGE_GET_INFO,
> +					0, &host->info,
> +					sizeof(host->info));
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get storage info\n");

Maybe this print can be enhanced, it may also mean the firmware does not
implement the required system call?

> +
> +	total_blocks =3D le64_to_cpu(host->info.total_blocks);
> +	serial_num =3D le64_to_cpu(host->info.serial_num);
> +	block_size =3D le32_to_cpu(host->info.block_size);
> +
> +	if (!block_size || !total_blocks)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "invalid storage geometry\n");
> +
> +	if (block_size > host->buffer_size)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "block size %u exceeds buffer size\n",
> +				     block_size);

I am now in favour of reducing logs in the kernel, maybe you can group
these two prints into one, indicating the info you get from firmware is
incorrect? Also, what is the point of using dev_err_probe() here, as you
cannot have an EPROBE_DEFER?

> +
> +	host->mtd.priv =3D host;
> +	host->mtd.name =3D dev_name(dev);
> +	host->mtd.owner =3D THIS_MODULE;
> +	host->mtd.dev.parent =3D dev;
> +	host->mtd.size =3D total_blocks * block_size;
> +	host->mtd.erasesize =3D block_size;
> +	host->mtd.writesize =3D block_size;
> +	host->mtd.writebufsize =3D block_size;
> +	host->mtd.type =3D MTD_NORFLASH;
> +	host->mtd.flags =3D MTD_WRITEABLE;
> +	host->mtd._erase =3D qcom_scm_storage_erase;
> +	host->mtd._read =3D qcom_scm_storage_read;
> +	host->mtd._write =3D qcom_scm_storage_write;
> +
> +	dev_info(dev, "scm storage 0x%llx registered with size %llu bytes\n",
> +		 serial_num, host->mtd.size);

Please drop this message, it is not useful.

...

> +static struct platform_driver qcom_scm_storage_driver =3D {
> +	.probe	=3D qcom_scm_storage_probe,
> +	.remove	=3D qcom_scm_storage_remove,
> +	.driver =3D {
> +		.name	=3D "qcom_scm_storage",
> +	},
> +	.id_table =3D qcom_scm_storage_ids,

I am surprised you have an id_table here, this is likely not for an OF
based platform, do you confirm?

Thanks,
Miqu=C3=A8l

