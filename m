Return-Path: <linux-arm-msm+bounces-65127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6D9B06CED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 07:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECEEA5663AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 05:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93E11D90DD;
	Wed, 16 Jul 2025 05:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x1jONwPB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC31811CA9;
	Wed, 16 Jul 2025 05:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752642375; cv=none; b=hsjk3WrQO4JmzQHYA+nmCuAQ14twbBAA7G1oAn6UPq1G+UzQ1QfMEVsqAwsyzUHD0WteUwE4pUbvBKTYgrHCXPt6Cfd3vTRBmCwt8G/VH52582BHw3ArUlBsGUIpaeKgsgMzs/UeCFkd+E4QgEBZW0LenGHmuxvLit6nST39/5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752642375; c=relaxed/simple;
	bh=CTmVn5puh9AqZ7nUWiS0Yw0f6SqZbMRAbF3CgIDV0kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucPJld0vWwiL5/gvJmLq3+9y2UW39BtjuqX2FqQ/vO00oFY3IoCHcBR8TA1Q9TULPviJIXdr1a+JoQos7WvV0uviI06nKLGBXSDvpw4DPR0xZCpz7c3u7rhBdt+2KKhtPOaGKkGHO3reAIrNI58g/GJq4/WJrJTzn+S6Y8LBGTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=x1jONwPB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92A5C4CEF0;
	Wed, 16 Jul 2025 05:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1752642375;
	bh=CTmVn5puh9AqZ7nUWiS0Yw0f6SqZbMRAbF3CgIDV0kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x1jONwPBZhQwilY1jRcBQiyRmTCDiyA0/KxwkXGj7W2mXKcSoQx675bwn4DcmhLrN
	 NryIN7p09VCCNplqQvKvK358qFGi9HqcECQg272qZVvZJgSvQBS3PgGpDOBDgzal0Q
	 XqAWPhlwHp3HcFu1T7RG0Ny5p5DX0P5ed6dSkxwY=
Date: Wed, 16 Jul 2025 07:06:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: heikki.krogerus@linux.intel.com, lumag@kernel.org,
	neil.armstrong@linaro.org, johan+linaro@kernel.org,
	quic_bjorande@quicinc.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: ucsi_glink: Increase buffer size to
 support UCSI v2
Message-ID: <2025071600-configure-ambush-c139@gregkh>
References: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716005224.312155-1-anjelique.melendez@oss.qualcomm.com>

On Tue, Jul 15, 2025 at 05:52:24PM -0700, Anjelique Melendez wrote:
> UCSI v2 specification has increased the MSG_IN and MSG_OUT size from
> 16 bytes to 256 bytes each for the message exchange between OPM and PPM
> This makes the total buffer size increase from 48 bytes to 528 bytes.
> Update the buffer size to support this increase.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
> Changes since v1:
>  - Defined buf size in terms of other UCSI defines
>  - Removed UCSI_BUF_SIZE and used the explicit v1 or v2 buffer size macros
>  - Removed Qualcomm copyright
>  - link: https://lore.kernel.org/all/20250624222922.2010820-1-anjelique.melendez@oss.qualcomm.com/
> ---
>  drivers/usb/typec/ucsi/ucsi_glink.c | 58 ++++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> index 8af79101a2fc..2918c88e54d2 100644
> --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> @@ -16,10 +16,10 @@
>  
>  #define PMIC_GLINK_MAX_PORTS		3
>  
> -#define UCSI_BUF_SIZE                   48
> +#define UCSI_BUF_V1_SIZE               (UCSI_MESSAGE_OUT + (UCSI_MESSAGE_OUT - UCSI_MESSAGE_IN))
> +#define UCSI_BUF_V2_SIZE               (UCSIv2_MESSAGE_OUT + (UCSIv2_MESSAGE_OUT - UCSI_MESSAGE_IN))
>  
>  #define MSG_TYPE_REQ_RESP               1
> -#define UCSI_BUF_SIZE                   48
>  
>  #define UC_NOTIFY_RECEIVER_UCSI         0x0
>  #define UC_UCSI_READ_BUF_REQ            0x11
> @@ -32,13 +32,25 @@ struct ucsi_read_buf_req_msg {
>  
>  struct ucsi_read_buf_resp_msg {
>  	struct pmic_glink_hdr   hdr;
> -	u8                      buf[UCSI_BUF_SIZE];
> +	u8                      buf[UCSI_BUF_V1_SIZE];
> +	u32                     ret_code;

What is the endian-ness of ret_code as it comes from the device?

> +};
> +
> +struct ucsi_v2_read_buf_resp_msg {
> +	struct pmic_glink_hdr   hdr;
> +	u8                      buf[UCSI_BUF_V2_SIZE];
>  	u32                     ret_code;
>  };
>  
>  struct ucsi_write_buf_req_msg {
>  	struct pmic_glink_hdr   hdr;
> -	u8                      buf[UCSI_BUF_SIZE];
> +	u8                      buf[UCSI_BUF_V1_SIZE];
> +	u32                     reserved;

What is "reserved" for?  What is it set to?  Where is it tested to
ensure it is set properly?

> +};
> +
> +struct ucsi_v2_write_buf_req_msg {
> +	struct pmic_glink_hdr   hdr;
> +	u8                      buf[UCSI_BUF_V2_SIZE];
>  	u32                     reserved;
>  };

And for all of these structures, are you sure there are not "holes" in
them?  As you are using sizeof(), don't they need to be packed?

>  
> @@ -72,7 +84,7 @@ struct pmic_glink_ucsi {
>  	bool ucsi_registered;
>  	bool pd_running;
>  
> -	u8 read_buf[UCSI_BUF_SIZE];
> +	u8 read_buf[UCSI_BUF_V2_SIZE];

Why is this one just v2 and not also v1?

>  };
>  
>  static int pmic_glink_ucsi_read(struct ucsi *__ucsi, unsigned int offset,
> @@ -131,8 +143,9 @@ static int pmic_glink_ucsi_read_message_in(struct ucsi *ucsi, void *val, size_t
>  static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned int offset,
>  					const void *val, size_t val_len)
>  {
> -	struct ucsi_write_buf_req_msg req = {};
> +	struct ucsi_v2_write_buf_req_msg req = {};
>  	unsigned long left;
> +	size_t len;
>  	int ret;
>  
>  	req.hdr.owner = PMIC_GLINK_OWNER_USBC;
> @@ -142,7 +155,18 @@ static int pmic_glink_ucsi_locked_write(struct pmic_glink_ucsi *ucsi, unsigned i
>  
>  	reinit_completion(&ucsi->write_ack);
>  
> -	ret = pmic_glink_send(ucsi->client, &req, sizeof(req));
> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
> +		/* If UCSI version is unknown, use the maximum buffer size */
> +		len = sizeof(req);
> +	} else {
> +		/*
> +		 * If UCSI V1, buffer size should be UCSI_BUF_V1_SIZE so update
> +		 * len accordingly
> +		 */
> +		len = sizeof(struct ucsi_write_buf_req_msg);
> +	}
> +
> +	ret = pmic_glink_send(ucsi->client, &req, len);
>  	if (ret < 0) {
>  		dev_err(ucsi->dev, "failed to send UCSI write request: %d\n", ret);
>  		return ret;
> @@ -216,12 +240,26 @@ static const struct ucsi_operations pmic_glink_ucsi_ops = {
>  
>  static void pmic_glink_ucsi_read_ack(struct pmic_glink_ucsi *ucsi, const void *data, int len)
>  {
> -	const struct ucsi_read_buf_resp_msg *resp = data;
> +	const struct ucsi_v2_read_buf_resp_msg *resp = data;
> +	u32 ret_code, buffer_len;
> +
> +	if (!ucsi->ucsi->version || ucsi->ucsi->version >= UCSI_VERSION_2_1) {
> +		/* If UCSI version is unknown, use the maximum buffer size */
> +		ret_code = resp->ret_code;

No endian change?

> +		buffer_len = UCSI_BUF_V2_SIZE;

Shouldn't you warn about this?  Doesn't the version have to be set?


> +	} else {
> +		/*
> +		 * If UCSI V1, use UCSI_BUF_V1_SIZE buffer size and
> +		 * update ret_code offset accordingly
> +		 */
> +		ret_code = ((struct ucsi_read_buf_resp_msg *)data)->ret_code;

Are you sure the buffer was that big?  Where was that checked?

> +		buffer_len = UCSI_BUF_V1_SIZE;
> +	}
>  
> -	if (resp->ret_code)
> +	if (ret_code)
>  		return;
>  
> -	memcpy(ucsi->read_buf, resp->buf, UCSI_BUF_SIZE);
> +	memcpy(ucsi->read_buf, resp->buf, buffer_len);

Where is the length checked against the "real" length of the buffer
passed in here?  What happens if the device lies?

thanks,

greg k-h

