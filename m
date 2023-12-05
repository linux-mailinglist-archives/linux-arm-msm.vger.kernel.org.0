Return-Path: <linux-arm-msm+bounces-3442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E0A80534D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 12:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65442B20AF8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 11:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D36F5789C;
	Tue,  5 Dec 2023 11:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dwluM7bJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5B2697A3;
	Tue,  5 Dec 2023 11:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BC6C433C8;
	Tue,  5 Dec 2023 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701776816;
	bh=/pO6pOloy1pC9HuVjzn7MuPfwdbOmMGzkM3HpUEuFbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dwluM7bJoMJJMnJsHnMR88lmHEgvdB2NbOq2vUw6NMqvUWA7ki1dUcA9cb7DXTDzD
	 C3ewA26Z6bLKMhfdAsJY0v4Mnr335G2bAhBAgw2e3FehNq+4kMRyaLanBm7cplYdDR
	 /buDjuJYD0pD4dwD1gmkPTuVih/5GMup2FkKv5SYGNAm03nXxbQa9S3W9CGM8Klmka
	 fCUlFGa7Yff8rnpoGbmmcvT5U+yXG5jZgkJZvrmAFXxXVD6sBkegBNGEbsu3kO3W+6
	 8DbNkldBeYlN0Hwst1pYOgi5/AMa4Gan4BlgRxbDdpZYMuy3eq9m7oahV952C6HOlr
	 VxRtLLSzcL3Tg==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rATts-00005m-29;
	Tue, 05 Dec 2023 12:47:40 +0100
Date: Tue, 5 Dec 2023 12:47:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] Bluetooth: qca: run the power-on/off sequence for
 QCA6390 too
Message-ID: <ZW8N3BHQTUGtIx_W@hovoldconsulting.com>
References: <20231205110903.68898-1-brgl@bgdev.pl>
 <20231205110903.68898-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205110903.68898-2-brgl@bgdev.pl>

On Tue, Dec 05, 2023 at 12:09:03PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The Bluetooth module on QCA6390 needs to be powered-on by enabling the
> relevant regulators and driving the enable GPIO high. We can reuse the
> power sequence for the WNC models.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/bluetooth/hci_qca.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7f25931a946e..351ba904c8c2 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1788,6 +1788,7 @@ static int qca_power_on(struct hci_dev *hdev)
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_QCA6390:
>  		ret = qca_regulator_init(hu);
>  		break;
>  
> @@ -2137,6 +2138,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
>  
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
> +	case QCA_QCA6390:
>  		gpiod_set_value_cansleep(qcadev->bt_en, 0);
>  		msleep(100);
>  		qca_regulator_disable(qcadev);
> @@ -2284,6 +2286,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_QCA6390:
>  		qcadev->bt_power = devm_kzalloc(&serdev->dev,
>  						sizeof(struct qca_power),
>  						GFP_KERNEL);
> @@ -2394,6 +2397,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>  	case QCA_WCN6750:
>  	case QCA_WCN6855:
>  	case QCA_WCN7850:
> +	case QCA_QCA6390:
>  		if (power->vregs_on) {
>  			qca_power_shutdown(&qcadev->serdev_hu);
>  			break;

These two patches should also be squashed into one. Makes no sense to
separate them.

Johan

