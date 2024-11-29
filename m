Return-Path: <linux-arm-msm+bounces-39622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBB49DEB98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 18:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A876E2812FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 17:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E726B19884C;
	Fri, 29 Nov 2024 17:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1ncIYta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5166155325
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 17:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732900731; cv=none; b=jgh4cQ8c6iyATm1t3RXu6ac5loi2b5TMB6ZV8Hw/EjYL6ho5yY52y44Twg75yWXkgjaW+ax+reyNfNjjJGRYsY23+fAqBRZlxtBugq0THwVld+VHTnvZaCjdgz3SV5PF5QCU4wXRhgx+gUnmEk1LMNsC9/R+aJ3/OemQIjDs8aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732900731; c=relaxed/simple;
	bh=AXSqXCnn5ZWQ2ITDGJnO7noh/mcHnVy8kO6TV2h0CfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rT6f8yVgCuDhhfNA5ZdF8+IP0YtFrmRJIOH0AgBTmJZTNmOZ2jAyAbGv37bNdfnIZO/3pjxfQkLtNZlMsaFhfhptwaTz08fcIubcdR00eBupIEDkIQK/s+TxQx8YZIyWsxfYU9KNM26HaeaEdyVQ1QnNLDHeSaeDm+Jc4rM7WU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I1ncIYta; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53dd0cb9ce3so1792138e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 09:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732900728; x=1733505528; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wyX381SMwmLabyVIHfx3BS2RPaQ05Wv1cQlDWccDi6M=;
        b=I1ncIYta1RvZC545o2puzBO6tbslU9ExabIp8Pev/nBzmYyaAOcdFLzsEII5Z/0DJq
         bgxH+dLGb+YvZ4fRJJ1zS+cntQU9lojk51veuLd6pbtoRI8RJV040JUjY5J4WBOJFDqf
         N2XKrh497Q3Vm641v4Y80PYgamLXZi4B+LCrDo5z9bXlWqPZHrCJU9xbYi4IH50p2kmk
         k9jSNwa1wofw8qk4dyAKeIWwQvp+KRxXPszT23BVEbSud9JryBWgBJmoa2UrI75Mooa4
         alsN1pAXOFjUFqqLwcceKxTESgElFhHgqgz/N7lLPYozomBZtYZbeanAzB4QyLfE8cAL
         FBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732900728; x=1733505528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyX381SMwmLabyVIHfx3BS2RPaQ05Wv1cQlDWccDi6M=;
        b=gi0E92HdFgciZGiN2kK4uD4lz/insPU2m4VpaewOfam5ADUbrZD6r4XMIrWPZPeY5r
         9xQApskCfFZLMs+Sxo3wHZvuJcNcz1KNDQEApmtYBPHaRi56K3uMggGbHx93DndFJX1z
         jxgelP5lilDhcmdu3hG81xViQhX0Vsr9SCY2QHeE+yPzRwpJJpWDd1ruaxXOA3hD9EMH
         HVGN353b4zRUvk+lI7L4pYBuZK53sDKwfSACaMXJlZbcWFNk/0BFoPKRIi6qyvFsQFiz
         45+CHzNnMEs7g205fVKsBG5nnP0IDDeb/YF5ObyWNxPQbjukuK6EzB5v9tTNCixo96ID
         P1Bw==
X-Forwarded-Encrypted: i=1; AJvYcCW92Cs5R5E0FvLA6oD3rB+teXBsOs+WNmHs8TJkiM/KVpFjsWSmqM4bL2yCmAbBJms0p9VsntVUIAsIyXtN@vger.kernel.org
X-Gm-Message-State: AOJu0YzUGqyOt6d9vY3sTqz9eN2yMQ9XMrtkYcLxPRzEG/YHObxGVTYe
	1DEbZmH8wzk0Ym0JIco981Zz6grOKIdYthp7Mj+O7J5H3NsiTUIlhN211erSPEw=
X-Gm-Gg: ASbGnctNz9lBHjBOj6sA1mqkd5FA2MZWbtPJvdJu+N4k50DIu7aO8uMDs1esyRBxBBS
	wKI2rgmgT9TeNo2yOzWld3q5P8bQCRaE7e48Zmv/KkzpX8hOuOSPnftRAVRKdMbk7Q6tk8Z5T3o
	fOavMYp+6b71cjo3r90hLB4se+5EqKmNB/abXq2+syBezURFvnkQO1lMkVld5MDfIPmIi1u3FXz
	N7k/Fl4dWR6LOGO8LvmsrQilpRcCdcHDzsZBX7FqNzUO+NMUP3WMwIAKbk+hCcEqDyk27EHRrhr
	xWwKWUX7Z3Ci68vw0zfcFs4GkT2kfA==
X-Google-Smtp-Source: AGHT+IElQIHsWHgIj5U4Z3YFT+vTkGONM5gDUob+/LZBLZp5XWsd2hdSshIqqVDlvfsoijR+Kiq16Q==
X-Received: by 2002:a05:6512:acb:b0:53a:1a81:f006 with SMTP id 2adb3069b0e04-53df00ddd29mr4458373e87.31.1732900727582;
        Fri, 29 Nov 2024 09:18:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df643102asm530818e87.42.2024.11.29.09.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 09:18:47 -0800 (PST)
Date: Fri, 29 Nov 2024 19:18:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com, 
	quic_jiaymao@quicinc.com
Subject: Re: [PATCH v1 3/3] Bluetooth: btqca: Add QCA6698 support
Message-ID: <kjmmw7kcd52ctrpdq5vr2ykpujfh2piue7pyra45dmb2mafh7t@poec53d3lnhr>
References: <20241128120922.3518582-1-quic_chejiang@quicinc.com>
 <20241128120922.3518582-4-quic_chejiang@quicinc.com>
 <xb4jdkkssgy3pmgd2iwawthsbocginbfeb2sbuneztshjiksdl@zswbbijyhxk4>
 <413d9ee5-c46f-4fb8-8140-f1cb5dd9616c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <413d9ee5-c46f-4fb8-8140-f1cb5dd9616c@quicinc.com>

On Fri, Nov 29, 2024 at 10:05:30AM +0800, Cheng Jiang (IOE) wrote:
> Hi Dmitry,
> 
> On 11/28/2024 9:02 PM, Dmitry Baryshkov wrote:
> > On Thu, Nov 28, 2024 at 08:09:22PM +0800, Cheng Jiang wrote:
> >> Add support for the QCA6698 Bluetooth chip, which shares the same IP core
> >> as the WCN6855. However, it has different RF components and RAM sizes,
> >> requiring new firmware files. This patch adds support for loading QCA6698
> >> rampatch and NVM from a different directory.
> >>
> >> Due to variations in RF performance of QCA6698 chips from different
> >> foundries, different NVM configurations are used based on board ID.
> >>
> >> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> >> ---
> >>  drivers/bluetooth/btqca.c   | 47 ++++++++++++++++++++++++++++++++++++-
> >>  drivers/bluetooth/btqca.h   |  1 +
> >>  drivers/bluetooth/hci_qca.c | 36 ++++++++++++++++++++++++++--
> >>  3 files changed, 81 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> >> index dfbbac922..24bf00cac 100644
> >> --- a/drivers/bluetooth/btqca.c
> >> +++ b/drivers/bluetooth/btqca.c
> >> @@ -700,6 +700,21 @@ static int qca_check_bdaddr(struct hci_dev *hdev, const struct qca_fw_config *co
> >>  	return 0;
> >>  }
> >>  
> >> +int qca_check_firmware_exists(const char *name, struct hci_dev *hdev)
> >> +{
> >> +	const struct firmware *fw;
> >> +	int ret;
> >> +
> >> +	ret = firmware_request_nowarn(&fw, name, &hdev->dev);
> >> +	if (ret) {
> >> +		bt_dev_warn(hdev, "Firmware %s does not exist. Use default", name);
> > 
> > No useless warnings
> Ack.
> > 
> >> +		return 0;
> >> +	}
> >> +
> >> +	release_firmware(fw);
> >> +	return 1;
> >> +}
> >> +
> >>  static void qca_generate_hsp_nvm_name(char *fwname, size_t max_size,
> >>  		struct qca_btsoc_version ver, u8 rom_ver, u16 bid)
> >>  {
> >> @@ -730,6 +745,26 @@ static inline void qca_get_nvm_name_generic(struct qca_fw_config *cfg,
> >>  			 "qca/%snv%02x.b%02x", stem, rom_ver, bid);
> >>  }
> >>  
> >> +static void qca_get_qca6698_nvm_name(struct hci_dev *hdev, char *fwname,
> >> +		size_t max_size, struct qca_btsoc_version ver, u8 rom_ver, u16 bid)
> >> +{
> >> +	const char *variant;
> >> +
> >> +	/* hsp gf chip */
> >> +	if ((le32_to_cpu(ver.soc_id) & QCA_HSP_GF_SOC_MASK) == QCA_HSP_GF_SOC_ID)
> >> +		variant = "g";
> >> +	else
> >> +		variant = "";
> >> +
> >> +	if (bid != 0x0)
> >> +		snprintf(fwname, max_size, "qca/QCA6698/hpnv%02x%s.b%04x", rom_ver,
> >> +			 variant, bid);
> >> +
> >> +	/* if board id is 0 or the nvm file doesn't exisit, use the default */
> >> +	if (bid == 0x0 || !qca_check_firmware_exists(fwname, hdev))
> >> +		snprintf(fwname, max_size, "qca/QCA6698/hpnv%02x%s.bin", rom_ver, variant);
> > 
> > So, do you want to load the same firmware twice? You've asked for it
> > already, if it is present, use it.
> This is only used to check the nvm exists or not. Yes, it's loaded twice if the nvm exist.
> It's just to avoid too much changes of the firmware download on the current driver. 
> > 
> > Anyway, if you have followed previous discussions, you'd have known that
> > it has been recommended to use DT's firmware-name instead of pushing
> > everything to the driver.
> Sorry, I misunderstand the comment here. I thought it was to add a compact string. 
> "qcom,qca6698-bt", since both the meothods can solve our requriment. If use DT's
> firmware-name is perfered, I can provide a change based on it. 
> 
> "
> Need because of the product needs or need because of the existing
> firmware not working with the chip?
> Wait... your WiFi colleagues were more helpful and they wrote that "it
> has different RF,
> IPA, thermal, RAM size and etc, so new firmware files used." ([1]).
> Please include that information in your commit messages too to let
> reviewers understand  what is going on.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20241024002514.92290-1-quic_miaoqing@quicinc.com/
> 
> > Let me check if using
> > "firmware-name" allows us to omit the new soc type.
> > From the driver's perspective, the only change is the need to load a
> > different firmware.
> 
> If you want to emphasise that it is not just WCN6855, extend schema to
> use fallback compatibles:
> compat = "qcom,qca6698-bt", "qcom,wcn6855-bt"; No driver changes are
> necessary with this approach.
> "

Please learn how to quote messages. Anyway, it clearly says to use
firmware-name and two compat strings. If you have questions, please ask
them _before_  sending new iteration, not after.

> > 
> >> +}
> >> +
> >>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
> >>  		   const char *firmware_name)
> >> @@ -796,6 +831,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >>  			 "qca/hmtbtfw%02x.tlv", rom_ver);
> >>  		break;
> >> +	case QCA_QCA6698:
> >> +		snprintf(config.fwname, sizeof(config.fwname),
> >> +			 "qca/QCA6698/hpbtfw%02x.tlv", rom_ver);
> >> +		break;
> >>  	default:
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >>  			 "qca/rampatch_%08x.bin", soc_ver);
> >> @@ -810,7 +849,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	/* Give the controller some time to get ready to receive the NVM */
> >>  	msleep(10);
> >>  
> >> -	if (soc_type == QCA_QCA2066 || soc_type == QCA_WCN7850)
> >> +	if (soc_type == QCA_QCA2066 || soc_type == QCA_QCA6698)
> >>  		qca_read_fw_board_id(hdev, &boardid);
> >>  
> >>  	/* Download NVM configuration */
> >> @@ -854,6 +893,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  		case QCA_WCN7850:
> >>  			qca_get_nvm_name_generic(&config, "hmt", rom_ver, boardid);
> >>  			break;
> >> +		case QCA_QCA6698:
> >> +			qca_get_qca6698_nvm_name(hdev, config.fwname,
> >> +				sizeof(config.fwname), ver, rom_ver, boardid);
> >> +			break;
> >>  
> >>  		default:
> >>  			snprintf(config.fwname, sizeof(config.fwname),
> >> @@ -874,6 +917,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		err = qca_disable_soc_logging(hdev);
> >>  		if (err < 0)
> >>  			return err;
> >> @@ -909,6 +953,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		/* get fw build info */
> >>  		err = qca_read_fw_build_info(hdev);
> >>  		if (err < 0)
> >> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> >> index bb5207d7a..67c16d8f2 100644
> >> --- a/drivers/bluetooth/btqca.h
> >> +++ b/drivers/bluetooth/btqca.h
> >> @@ -151,6 +151,7 @@ enum qca_btsoc_type {
> >>  	QCA_WCN3991,
> >>  	QCA_QCA2066,
> >>  	QCA_QCA6390,
> >> +	QCA_QCA6698,
> >>  	QCA_WCN6750,
> >>  	QCA_WCN6855,
> >>  	QCA_WCN7850,
> >> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> >> index 37129e6cb..70bdc046c 100644
> >> --- a/drivers/bluetooth/hci_qca.c
> >> +++ b/drivers/bluetooth/hci_qca.c
> >> @@ -1361,6 +1361,7 @@ static int qca_set_baudrate(struct hci_dev *hdev, uint8_t baudrate)
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		usleep_range(1000, 10000);
> >>  		break;
> >>  
> >> @@ -1447,6 +1448,7 @@ static int qca_check_speeds(struct hci_uart *hu)
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		if (!qca_get_speed(hu, QCA_INIT_SPEED) &&
> >>  		    !qca_get_speed(hu, QCA_OPER_SPEED))
> >>  			return -EINVAL;
> >> @@ -1489,6 +1491,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
> >>  		case QCA_WCN6750:
> >>  		case QCA_WCN6855:
> >>  		case QCA_WCN7850:
> >> +		case QCA_QCA6698:
> >>  			hci_uart_set_flow_control(hu, true);
> >>  			break;
> >>  
> >> @@ -1523,6 +1526,7 @@ static int qca_set_speed(struct hci_uart *hu, enum qca_speed_type speed_type)
> >>  		case QCA_WCN6750:
> >>  		case QCA_WCN6855:
> >>  		case QCA_WCN7850:
> >> +		case QCA_QCA6698:
> >>  			hci_uart_set_flow_control(hu, false);
> >>  			break;
> >>  
> >> @@ -1803,6 +1807,7 @@ static int qca_power_on(struct hci_dev *hdev)
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >>  	case QCA_QCA6390:
> >> +	case QCA_QCA6698:
> >>  		ret = qca_regulator_init(hu);
> >>  		break;
> >>  
> >> @@ -1878,6 +1883,10 @@ static int qca_setup(struct hci_uart *hu)
> >>  		soc_name = "qca2066";
> >>  		break;
> >>  
> >> +	case QCA_QCA6698:
> >> +		soc_name = "qca6698";
> >> +		break;
> >> +
> >>  	case QCA_WCN3988:
> >>  	case QCA_WCN3990:
> >>  	case QCA_WCN3991:
> >> @@ -1919,6 +1928,7 @@ static int qca_setup(struct hci_uart *hu)
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		qcadev = serdev_device_get_drvdata(hu->serdev);
> >>  		if (qcadev->bdaddr_property_broken)
> >>  			set_bit(HCI_QUIRK_BDADDR_PROPERTY_BROKEN, &hdev->quirks);
> >> @@ -1952,6 +1962,7 @@ static int qca_setup(struct hci_uart *hu)
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		break;
> >>  
> >>  	default:
> >> @@ -2089,6 +2100,20 @@ static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
> >>  	.num_vregs = 0,
> >>  };
> >>  
> >> +static const struct qca_device_data qca_soc_data_qca6698 __maybe_unused = {
> >> +	.soc_type = QCA_QCA6698,
> > 
> > No. It's the same as WCN6855. You don't need extra SoC type for it.
> > 
> >> +	.vregs = (struct qca_vreg []) {
> >> +		{ "vddio", 5000 },
> >> +		{ "vddbtcxmx", 126000 },
> >> +		{ "vddrfacmn", 12500 },
> >> +		{ "vddrfa0p8", 102000 },
> >> +		{ "vddrfa1p7", 302000 },
> >> +		{ "vddrfa1p2", 257000 },
> >> +	},
> >> +	.num_vregs = 6,
> >> +	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
> >> +};
> >> +
> >>  static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
> >>  	.soc_type = QCA_WCN6750,
> >>  	.vregs = (struct qca_vreg []) {
> >> @@ -2179,6 +2204,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
> >>  
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >> +	case QCA_QCA6698:
> >>  		gpiod_set_value_cansleep(qcadev->bt_en, 0);
> >>  		msleep(100);
> >>  		qca_regulator_disable(qcadev);
> >> @@ -2333,6 +2359,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >>  	case QCA_QCA6390:
> >> +	case QCA_QCA6698:
> >>  		qcadev->bt_power = devm_kzalloc(&serdev->dev,
> >>  						sizeof(struct qca_power),
> >>  						GFP_KERNEL);
> >> @@ -2346,6 +2373,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> >>  	switch (qcadev->btsoc_type) {
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		if (!device_property_present(&serdev->dev, "enable-gpios")) {
> >>  			/*
> >>  			 * Backward compatibility with old DT sources. If the
> >> @@ -2380,7 +2408,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> >>  					       GPIOD_OUT_LOW);
> >>  		if (IS_ERR(qcadev->bt_en) &&
> >>  		    (data->soc_type == QCA_WCN6750 ||
> >> -		     data->soc_type == QCA_WCN6855)) {
> >> +		     data->soc_type == QCA_WCN6855 ||
> >> +		     data->soc_type == QCA_QCA6698)) {
> >>  			dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
> >>  			return PTR_ERR(qcadev->bt_en);
> >>  		}
> >> @@ -2393,7 +2422,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> >>  		if (IS_ERR(qcadev->sw_ctrl) &&
> >>  		    (data->soc_type == QCA_WCN6750 ||
> >>  		     data->soc_type == QCA_WCN6855 ||
> >> -		     data->soc_type == QCA_WCN7850)) {
> >> +		     data->soc_type == QCA_WCN7850 ||
> >> +		     data->soc_type == QCA_QCA6698)) {
> >>  			dev_err(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
> >>  			return PTR_ERR(qcadev->sw_ctrl);
> >>  		}
> >> @@ -2475,6 +2505,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
> >>  	case QCA_WCN6750:
> >>  	case QCA_WCN6855:
> >>  	case QCA_WCN7850:
> >> +	case QCA_QCA6698:
> >>  		if (power->vregs_on)
> >>  			qca_power_shutdown(&qcadev->serdev_hu);
> >>  		break;
> >> @@ -2669,6 +2700,7 @@ static const struct of_device_id qca_bluetooth_of_match[] = {
> >>  	{ .compatible = "qcom,qca2066-bt", .data = &qca_soc_data_qca2066},
> >>  	{ .compatible = "qcom,qca6174-bt" },
> >>  	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
> >> +	{ .compatible = "qcom,qca6698-bt", .data = &qca_soc_data_qca6698},
> >>  	{ .compatible = "qcom,qca9377-bt" },
> >>  	{ .compatible = "qcom,wcn3988-bt", .data = &qca_soc_data_wcn3988},
> >>  	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
> >> -- 
> >> 2.25.1
> >>
> > 
> 

-- 
With best wishes
Dmitry

