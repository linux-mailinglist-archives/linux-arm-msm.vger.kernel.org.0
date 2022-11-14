Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB59A6277F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 09:40:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236587AbiKNIkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 03:40:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236595AbiKNIkM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 03:40:12 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 417D51C128;
        Mon, 14 Nov 2022 00:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1668415030;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Fdzji2ULixgnjflPg6rEtbWAJEIuwOyBu5+qeCT4SJI=;
    b=n3FbW+IxO87ovNz43XhQO/gO1Pgvy/zAPXjFlydfAlvK9K3/lzSiLhrI5mu8g2zZEO
    JOYtTR66jszMm8Mezb6Ajb7b98GxbZc0v53NN4btralHMJuwwAzGOS6Y8HQFyykAc0s+
    mvjK2ac0LV0CnI97UGZ24KbsfEZPSQI0kaY7oR/BDEjIfGIf0tbElIsYi0+jdjKAwG6m
    qerVQwWmvyCjOX1YjEcUUDEypOy9wLW4mVnJKlmrfkNMLyn5+qDAZG500R7jpGKzHLSt
    /K/iRsfKhJ+HrdTZ87pFMZveLw2jAQj3Fta4ng3vUT27PiqhBx//So7OHtRvWqpVzUh+
    Jn7g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJAhdlWwvqttQ=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id Yce349yAE8b95Xg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 14 Nov 2022 09:37:09 +0100 (CET)
Date:   Mon, 14 Nov 2022 09:36:59 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH RESEND v2] Bluetooth: btqcomsmd: Fix command timeout
 after setting BD address
Message-ID: <Y3H+K/6LWVcxdNK/@gerhold.net>
References: <20221018085431.2913217-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018085431.2913217-1-stephan.gerhold@kernkonzept.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Luiz,

It looks like this patch will get archived again in patchwork end of
this week. Is there anything I can change to make it acceptable?

This is a fairly important fix to have Bluetooth working on these
devices, since it fails to initialize most of the times without it.

Thanks!
Stephan

On Tue, Oct 18, 2022 at 10:54:31AM +0200, Stephan Gerhold wrote:
> On most devices using the btqcomsmd driver (e.g. the DragonBoard 410c
> and other devices based on the Qualcomm MSM8916/MSM8909/... SoCs)
> the Bluetooth firmware seems to become unresponsive for a while after
> setting the BD address. On recent kernel versions (at least 5.17+)
> this often causes timeouts for subsequent commands, e.g. the HCI reset
> sent by the Bluetooth core during initialization:
> 
>     Bluetooth: hci0: Opcode 0x c03 failed: -110
> 
> Unfortunately this behavior does not seem to be documented anywhere.
> Experimentation suggests that the minimum necessary delay to avoid
> the problem is ~150us. However, to be sure add a sleep for > 1ms
> in case it is a bit longer on other firmware versions.
> 
> Older kernel versions are likely also affected, although perhaps with
> slightly different errors or less probability. Side effects can easily
> hide the issue in most cases, e.g. unrelated incoming interrupts that
> cause the necessary delay.
> 
> Fixes: 1511cc750c3d ("Bluetooth: Introduce Qualcomm WCNSS SMD based HCI driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
> (Unmodified resend of the v2 I sent back in June, it seems to have
>  disappeared from patchwork)
> 
> I tested this using a script that reboots repeatedly and checks for the
> error. With this patch, BT shows up successfully for 100+ consecutive
> boots. Without this patch it usually fails after 1-5 boots (or even
> always on some boards).
> 
> Changes in v2:
>   - Clarify commit message: Add affected devices and kernel versions
> ---
>  drivers/bluetooth/btqcomsmd.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btqcomsmd.c b/drivers/bluetooth/btqcomsmd.c
> index 2acb719e596f..11c7e04bf394 100644
> --- a/drivers/bluetooth/btqcomsmd.c
> +++ b/drivers/bluetooth/btqcomsmd.c
> @@ -122,6 +122,21 @@ static int btqcomsmd_setup(struct hci_dev *hdev)
>  	return 0;
>  }
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
>  static int btqcomsmd_probe(struct platform_device *pdev)
>  {
>  	struct btqcomsmd *btq;
> @@ -162,7 +177,7 @@ static int btqcomsmd_probe(struct platform_device *pdev)
>  	hdev->close = btqcomsmd_close;
>  	hdev->send = btqcomsmd_send;
>  	hdev->setup = btqcomsmd_setup;
> -	hdev->set_bdaddr = qca_set_bdaddr_rome;
> +	hdev->set_bdaddr = btqcomsmd_set_bdaddr;
>  
>  	ret = hci_register_dev(hdev);
>  	if (ret < 0)
> -- 
> 2.30.2
> 
