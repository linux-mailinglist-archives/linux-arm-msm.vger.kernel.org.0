Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D56AA549C76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jun 2022 20:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbiFMS7V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jun 2022 14:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346082AbiFMS6g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jun 2022 14:58:36 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADEB88DDD8;
        Mon, 13 Jun 2022 09:09:36 -0700 (PDT)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0ED2261EA192C;
        Mon, 13 Jun 2022 18:09:34 +0200 (CEST)
Message-ID: <9d8238ba-500e-3490-8a25-e7b72bab175f@molgen.mpg.de>
Date:   Mon, 13 Jun 2022 18:09:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] Bluetooth: btqcomsmd: Fix command timeout after setting
 BD address
Content-Language: en-US
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
References: <20220613110745.3778356-1-stephan.gerhold@kernkonzept.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220613110745.3778356-1-stephan.gerhold@kernkonzept.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dear Stephan,


Thank you for the patch.

Am 13.06.22 um 13:07 schrieb Stephan Gerhold:
> The Bluetooth firmware seems to become unresponsive for a while after

Please mention the device with the problematic firmware.

> setting the BD address. At least on recent kernel versions this often

The commit referenced in the Fixes tag is in Linux 4.9. Can you please 
name the oldest Linux kernel version you experienced the problem with.

> causes timeouts for subsequent commands, e.g. the HCI reset sent by
> the Bluetooth core during initialization:
> 
> 	Bluetooth: hci0: Opcode 0x c03 failed: -110
> 
> Unfortunately this behavior does not seem to be documented anywhere.
> Experimentation suggests that the minimum necessary delay to avoid
> the problem is ~150us. However, to be sure add a sleep for > 1ms
> in case it is a bit longer on other firmware versions.
> 
> Fixes: 1511cc750c3d ("Bluetooth: Introduce Qualcomm WCNSS SMD based HCI driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
> I tested this using a script that reboots repeatedly and checks for the
> error. With this patch, BT shows up successfully for 100+ consecutive
> boots. Without this patch it usually fails after 1-5 boots (or even
> always on some boards).
> ---
>   drivers/bluetooth/btqcomsmd.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btqcomsmd.c b/drivers/bluetooth/btqcomsmd.c
> index 2acb719e596f..11c7e04bf394 100644
> --- a/drivers/bluetooth/btqcomsmd.c
> +++ b/drivers/bluetooth/btqcomsmd.c
> @@ -122,6 +122,21 @@ static int btqcomsmd_setup(struct hci_dev *hdev)
>   	return 0;
>   }
>   
> +static int btqcomsmd_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)
> +{
> +	int ret;
> +
> +	ret = qca_set_bdaddr_rome(hdev, bdaddr);
> +	if (ret)
> +		return ret;
> +
> +	/* The firmware stops responding for a while after setting the bdaddr,
> +	 * causing timeouts for subsequent commands. Sleep a bit to avoid this.
> +	 */
> +	usleep_range(1000, 10000);
> +	return 0;
> +}
> +
>   static int btqcomsmd_probe(struct platform_device *pdev)
>   {
>   	struct btqcomsmd *btq;
> @@ -162,7 +177,7 @@ static int btqcomsmd_probe(struct platform_device *pdev)
>   	hdev->close = btqcomsmd_close;
>   	hdev->send = btqcomsmd_send;
>   	hdev->setup = btqcomsmd_setup;
> -	hdev->set_bdaddr = qca_set_bdaddr_rome;
> +	hdev->set_bdaddr = btqcomsmd_set_bdaddr;
>   
>   	ret = hci_register_dev(hdev);
>   	if (ret < 0)


Kind regards,

Paul
