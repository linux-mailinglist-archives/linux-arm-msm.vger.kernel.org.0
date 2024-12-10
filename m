Return-Path: <linux-arm-msm+bounces-41291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E07A49EAF9A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 12:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB15D16427E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 11:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203972080F3;
	Tue, 10 Dec 2024 11:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1gF6xR/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DBC212D83
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 11:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733829181; cv=none; b=Zz7Hir59GJdZY+N3QIntZbwC3T43vPu2IHONLqYgzah/rA+Ji3EFotk72TkXHP5lWN06Oot5aD0Rrvo9cEEL4OkCvmWTXqBMwO851TOYmvw2xPY0GB/i3PRmT2A5VWTxTMjaeMxDVljLNclCq6mOiXkl+1+Ri5Y5Jn3QfCkZppM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733829181; c=relaxed/simple;
	bh=1ez6JKpbc19hr5G+vxzfMtuWoR/oAEwd1qBGWFeo8GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwSyac5kZpku9suD4TvkbufwcsZfFzrnXmGgkeD6J2zUFZFBdhyTC/RrOdNYCa4DRhj9601rv7QGfh6iEmNFpgLG/oeKS7a3QhhQX8S13+izRy7W5WKC2qI2qHS7PmT0yXEmYneRy81JzpO12m9F10IQyBzPKfcpoKIHhi4dix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n1gF6xR/; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso4105566e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 03:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733829177; x=1734433977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jM2UJEgjc8RBmLmsAyCqR8R3DpIhNsSpaN8ovhxmvb4=;
        b=n1gF6xR/+prxE/0fGcQDRDBUS3ALe+pCaUrJgu9kOOX2AViW0WpvJN2rrNA4/iSZAC
         77XoB+V3NyuKZjZsOVnbKbP9ojQ3Y92K5dfqBWzEg9e5MvUoA8hyo3ZufOHZFpsyTEo6
         ynIxJL/bd2YquAZjq/FLnNizkaQIbXP+VVyQmudLnXk5ENT1yxicphykyCUejyUQdZkC
         j6Ab5yGGbiizFeQpCMOyJl3tye4y24QcMW7wEGTS4/DW6+VsJB75ao8TSTYP/Nlw5trI
         gZRfrUDLqAa14GKrS19zFNiRDgi4FaIfM3mE1ZnEqk7DSXS3xED+EmgP9o8ypsgVyzwk
         tiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733829177; x=1734433977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jM2UJEgjc8RBmLmsAyCqR8R3DpIhNsSpaN8ovhxmvb4=;
        b=NEzW6ZnWRhNg0oWXmvzVkiZdAipeDWJH5XRjskNcxlDBx6tHDEwwf7ZNte5D0zDjyk
         YrNTelUSQeLr1CRDUw+hi0YTE9JDyTIXN/QIROibq6NH5grz7vFae+ZS/9c0z2V0sfsz
         vW+P7AID7pZPQ+5U5asbuSfioqdWGaN+Ik74i/3PW53mWL1ZTDEJRk3vbpIReRgdAK/s
         wDjyAvezE711uxGKGE4DyGZas+acAdWWBSj5fTY2aCHvKrGco2F4A7i8v4UDLzNDF2Am
         J02Hbno2vMXn9K0XHYfqFwXIwTAV3ijCope5WZl7wRP8Zk5FGyXoJo7YrWT7uwsmXDb/
         fV5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvrNhA4RuaUrhdKsHsbee79KcH7M0yx+QWudwSWcIqMGqQe+skLmOUlxDoqhxu3Zr9d/lZ+AOfLylLbKZW@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgwinq290KYHOAfu2VinvA50W+3tzyQhOTce6D2tHi640sXImJ
	KSgfRUXNhKYYQejhhvj+dssilyoROlrQ/4WYRlgc/q3gA5Nbd489Gz9BkK407kc=
X-Gm-Gg: ASbGncuwzURsFLNLPNDsDohbjrOw1vZy1+EP7cMQJLtlYWqXyw8XXPt2pKCLbkIAGEB
	9NNHXvI5FXBUqdBIqbKZU0/Lpvky+AwsGU4xoJLVS2fr7Z180oaXB+ECqHsLP8+COGeGcVivLdL
	GbLOgVdHUUrKXqlZ+MCHqaxTBeeSPf5qN3rta52JIIue/rzgO+PZnNR1RYlF3IrcAALWMS7hfxA
	UbMxjzVgTKGEA3nZGY0VpaFr6uxnEu3VNxXd3JFpgCvlPzWDZVZmxYq+PfYhsGXm/1cRJsl9OOg
	vYNvp1iilO4R5cQekBOo900mHsllVfFzdA==
X-Google-Smtp-Source: AGHT+IHPCSnrDauNjnHW1FedAONmhH37jtKICkQNI/YwVBNvFHQEUYDTNkhvkHVwFeENoFrPZbIvxQ==
X-Received: by 2002:a05:6512:3b85:b0:53d:d0c5:4ca9 with SMTP id 2adb3069b0e04-53e2c2bea7bmr6727347e87.26.1733829176821;
        Tue, 10 Dec 2024 03:12:56 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5402542edf0sm231753e87.126.2024.12.10.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 03:12:54 -0800 (PST)
Date: Tue, 10 Dec 2024 13:12:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com, 
	quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: Re: [PATCH v3 2/3] Bluetooth: qca: Expand firmware-name to load
 specific nvm and rampatch
Message-ID: <h7a537yfel7oq4hh4lz5mo4qt6bsy5az6xl4crusxlmoa5een3@iuvk5ckcta2y>
References: <20241205102213.1281865-1-quic_chejiang@quicinc.com>
 <20241205102213.1281865-3-quic_chejiang@quicinc.com>
 <w7r4itwyrh3jva3rx3kmsm4kqtawqkgkneqrlin4hpjkqb3deo@2qmjd3ijzqn3>
 <541a5682-5b99-4793-84ee-a7c9168cb9a0@quicinc.com>
 <CAA8EJppmTSovZKTPb+syrc0Vvfu8U=HoP18tW072OEZ5nYyOgg@mail.gmail.com>
 <4ef61f91-f1ae-4593-9522-2229680a9707@quicinc.com>
 <fb7exdibh4f5r3io6m34i7lqqe7qo2kk357bfdzcdbie6cppui@mqwwq5w4c57j>
 <f7dd3758-c1c8-43bb-9a5c-4674077a5e1b@quicinc.com>
 <CAA8EJpqRAqH-+3xYpSyF3cqFoF9bDbEKSqx5o5XrLZMgati41A@mail.gmail.com>
 <1e0fc6f8-9f5d-4f62-a379-ea9b0161fc84@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e0fc6f8-9f5d-4f62-a379-ea9b0161fc84@quicinc.com>

On Tue, Dec 10, 2024 at 10:00:51AM +0800, Cheng Jiang (IOE) wrote:
> Hi Dmitry,
> 
> On 12/10/2024 12:04 AM, Dmitry Baryshkov wrote:
> > On Mon, 9 Dec 2024 at 15:59, Cheng Jiang (IOE)
> > <quic_chejiang@quicinc.com> wrote:
> >>
> >> Hi Dmitry,
> >>
> >> On 12/9/2024 6:49 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Dec 09, 2024 at 05:03:55PM +0800, Cheng Jiang (IOE) wrote:
> >>>> Hi Dmitry,
> >>>>
> >>>> On 12/6/2024 4:34 PM, Dmitry Baryshkov wrote:
> >>>>> On Fri, 6 Dec 2024 at 05:05, Cheng Jiang (IOE)
> >>>>> <quic_chejiang@quicinc.com> wrote:
> >>>>>>
> >>>>>> Hi Dmitry,
> >>>>>>
> >>>>>> On 12/5/2024 8:00 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Dec 05, 2024 at 06:22:12PM +0800, Cheng Jiang wrote:
> >>>>>>>> The firmware-name property has been expanded to specify the names of NVM
> >>>>>>>> and rampatch firmware for certain chips, such as the QCA6698 Bluetooth
> >>>>>>>> chip. Although it shares the same IP core as the WCN6855, the QCA6698
> >>>>>>>> has different RF components and RAM sizes, necessitating new firmware
> >>>>>>>> files. This change allows for the configuration of NVM and rampatch in
> >>>>>>>> DT.
> >>>>>>>>
> >>>>>>>> Different connectivity boards may be attached to the same platform. For
> >>>>>>>> example, QCA6698-based boards can support either a two-antenna or
> >>>>>>>> three-antenna solution, both of which work on the sa8775p-ride platform.
> >>>>>>>> Due to differences in connectivity boards and variations in RF
> >>>>>>>> performance from different foundries, different NVM configurations are
> >>>>>>>> used based on the board ID.
> >>>>>>>
> >>>>>>> Two separate commits, one for NVM, another one for RAM patch.
> >>>>>>>
> >>>>>> Ack.
> >>>>>>>>
> >>>>>>>> Therefore, in the firmware-name property, if the NVM file has an
> >>>>>>>> extension, the NVM file will be used. Otherwise, the system will first
> >>>>>>>> try the .bNN (board ID) file, and if that fails, it will fall back to
> >>>>>>>> the .bin file.
> >>>>>>>>
> >>>>>>>> Possible configurations:
> >>>>>>>> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
> >>>>>>>> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
> >>>>>>>> firmware-name = "QCA6698/hpnv21.bin";
> >>>>>>>>
> >>>>>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
> >>>>>>>> ---
> >>>>>>>>  drivers/bluetooth/btqca.c   | 154 ++++++++++++++++++++++++++----------
> >>>>>>>>  drivers/bluetooth/btqca.h   |   5 +-
> >>>>>>>>  drivers/bluetooth/hci_qca.c |  21 ++++-
> >>>>>>>>  3 files changed, 134 insertions(+), 46 deletions(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> >>>>>>>> index dfbbac922..e8b89b8cc 100644
> >>>>>>>> --- a/drivers/bluetooth/btqca.c
> >>>>>>>> +++ b/drivers/bluetooth/btqca.c
> >>>>>>>> @@ -272,6 +272,31 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
> >>>>>>>>  }
> >>>>>>>>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
> >>>>>>>>
> >>>>>>>> +static int qca_get_alt_nvm_path(char *path, size_t max_size)
> >>>>>>>
> >>>>>>> int is usually for errors, the code suggests bool return type.
> >>>>>>>
> >>>>>> Ack.
> >>>>>>>> +{
> >>>>>>>> +    char fwname[64];
> >>>>>>>> +    const char *suffix;
> >>>>>>>> +
> >>>>>>>> +    suffix = strrchr(path, '.');
> >>>>>>>> +
> >>>>>>>> +    if (!suffix)
> >>>>>>>> +            return 0;
> >>>>>>>> +
> >>>>>>>> +    strscpy(fwname, path, strlen(path));
> >>>>>>>
> >>>>>>> 64 bytes ought to be enough for anybody, correct?
> >>>>>>>
> >>>>>> Yes, in current driver, the max f/w path length is 64.
> >>>>>>
> >>>>>>>> +    fwname[suffix - path] = 0;
> >>>>>>>
> >>>>>>> with path = "qcom/sc7180/Oh.My.Device/name" this is broken.
> >>>>>>>
> >>>>>> Let me test this and fix in next patch.
> >>>>>>>> +
> >>>>>>>> +    snprintf(fwname, sizeof(fwname), "%s.bin", fwname);
> >>>>>>>> +
> >>>>>>>> +    /* If nvm file is already the default one, return false to
> >>>>>>>> +     * skip the retry.
> >>>>>>>> +     */
> >>>>>>>> +    if (strcmp(fwname, path) == 0)
> >>>>>>>> +            return 0;
> >>>>>>>> +
> >>>>>>>> +    snprintf(path, max_size, "%s", fwname);
> >>>>>>>> +    return 1;
> >>>>>>>> +}
> >>>>>>>> +
> >>>>>>>>  static int qca_tlv_check_data(struct hci_dev *hdev,
> >>>>>>>>                             struct qca_fw_config *config,
> >>>>>>>>                             u8 *fw_data, size_t fw_size,
> >>>>>>>> @@ -564,6 +589,19 @@ static int qca_download_firmware(struct hci_dev *hdev,
> >>>>>>>>                                         config->fwname, ret);
> >>>>>>>>                              return ret;
> >>>>>>>>                      }
> >>>>>>>> +            }
> >>>>>>>> +            /* For nvm, if desired nvm file is not present and it's not the
> >>>>>>>> +             * default nvm file(ends with .bin), try to load the default nvm.
> >>>>>>>> +             */
> >>>>>>>> +            else if (config->type == TLV_TYPE_NVM &&
> >>>>>>>> +                     qca_get_alt_nvm_path(config->fwname, sizeof(config->fwname))) {
> >>>>>>>
> >>>>>>> Please, don't rewrite the config. The file may be not present now, but
> >>>>>>> it will reappear later (e.g. when rootfs gets mounted).
> >>>>>>>
> >>>>>> This tries to load a default NVM file if the board-specific NVM is not found.
> >>>>>> It is called when request_firmware fails. It's safe to rewrite the config->fwname
> >>>>>> here since we have already tried to load the board-specific NVM. The config
> >>>>>> is a local variable in qca_uart_setup and will return after downloading the NVM.
> >>>>>
> >>>>> Please read my question before answering it.
> >>>>>
> >>>> Sorry, I'm not clear about your question. Could you please explain it in more detail?
> >>>> I'm not quite sure how the situation you mentioned affects this code flow if you mean
> >>>> not downloading another NVM file.
> >>>>
> >>>> The board-specific NVM and the default NVM should be in the same folder and should
> >>>> appear simultaneously.
> >>>>
> >>>> From the Bluetooth firmware load flow perspective, the firmware is loaded either
> >>>> when the kernel module is inserted (insmod) or when Bluetooth is turned off and
> >>>> then on again via a user-space command. If the firmware is not found at this time,
> >>>> the ROM code is used instead. It does not attempt to load the firmware automatically,
> >>>> even if the firmware appears later.
> >>>
> >>> I was thinking about the following scenario:
> >>>
> >>> - BT firmware is attempted to load during driver probe, /lib/firmware is
> >>>   not fully populated, so the config is rewritten to use the default
> >>> - rootfs is fully mounted and populated with the board-specific file
> >>> - BT interface is being turned on. It is expected that the
> >>>   board-specific file will be loaded, however because the config was
> >>>   changed in one of the previous steps, the driver still loads the
> >>>   default one.
> >>>
> >>> That said, the driver should perform the fallback, etc, but the config
> >>> should stay intact even in the fallback case.
> >>>
> >> Thank you for the detail explanation. Current flow of BT enable in driver
> >> likes this:
> >>
> >> Enable the soc(Assert BT_EN) -->  read the SOC info --> Change baud rate -->
> >> get rampatch file name (based on soc info or dts) --> download rampatch -->
> >> get nvm file name(based on soc info or dts) --> download nvm file -->
> >> download default nvm (if the board-specific file not found).
> >>
> >> Every time the driver probe or the BT interface is turned on, it follows the
> >> flow described above. The rampatch and NVM file names are reconstructed by
> >> the SoC information each time, so the driver always attempts to download the
> >> board-specific file first.
> >>
> >> Here is the log, there is no hpnv21.b206 and re-insmod the driver.
> > 
> > You are re-insmodding the driver. I was talking about a different scenario:
> > - there is no BDF
> > - modprobe the driver
> > - wait for the hci0 to become available
> > - hciconfig hci0 down
> > - provide BDF
> > - hciconfig hci0 up
> > 
> > Check the dmesg. If everything is implemented correctly, second
> > hciconfig command should load the firmware files again (because BT was
> > unpowered in between). Second time it should load the proper board
> > file instead of loading the default or falling back to the ROM.
> > 
> Yes, the 'hciconfig hci0 up' will load the proper board file, since it also follows 
> the flow described above. 
> 
> Here is the dmesg:
> 
> sh-5.1# mv hpnv21.b206 hpnv21.b2069                 -- Remove the board specific nvm
> sh-5.1# rmmod hci_uart
> sh-5.1# insmod /lib/modules/6.6.52-dirty/kernel/drivers/bluetooth/hci_uart.ko
> sh-5.1# dmesg|grep -i bluetooth
> 
> [54781.019527] Bluetooth: HCI UART driver ver 2.3
> [54781.019538] Bluetooth: HCI UART protocol H4 registered
> [54781.019589] Bluetooth: HCI UART protocol LL registered
> [54781.019612] Bluetooth: HCI UART protocol QCA registered
> [54781.020893] Bluetooth: hci0: setting up wcn6855
> [54781.087027] Bluetooth: hci0: QCA Product ID   :0x00000013
> [54781.087037] Bluetooth: hci0: QCA SOC Version  :0x400c0210
> [54781.087039] Bluetooth: hci0: QCA ROM Version  :0x00000201
> [54781.087042] Bluetooth: hci0: QCA Patch Version:0x000038e6
> [54781.104087] Bluetooth: hci0: QCA controller version 0x02100201
> [54781.104097] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpbtfw21.tlv
> [54781.794628] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpnv21.b206
> [54781.794671] bluetooth hci0: Direct firmware load for qca/QCA6698/hpnv21.b206 failed with error -2
> [54781.794677] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpnv21.bin
> [54781.958319] Bluetooth: hci0: QCA setup on UART is completed
> [54781.981490] Bluetooth: MGMT ver 1.22
> 
> No board specific nvm found, use the default one.
> Disable hci0 and add the board specific nvm, then enable hci0.
> 
> sh-5.1# hciconfig hci0 down
> sh-5.1# mv hpnv21.b2069 hpnv21.b206
> sh-5.1# hciconfig hci0 up
> sh-5.1# dmesg|grep -i bluetooth
> [54834.686170] Bluetooth: hci0: setting up wcn6855
> [54834.750997] Bluetooth: hci0: QCA Product ID   :0x00000013
> [54834.751006] Bluetooth: hci0: QCA SOC Version  :0x400c0210
> [54834.751010] Bluetooth: hci0: QCA ROM Version  :0x00000201
> [54834.751013] Bluetooth: hci0: QCA Patch Version:0x000038e6
> [54834.761826] Bluetooth: hci0: QCA controller version 0x02100201
> [54834.761833] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpbtfw21.tlv
> [54835.450621] Bluetooth: hci0: QCA Downloading qca/QCA6698/hpnv21.b206
> [54835.614015] Bluetooth: hci0: QCA setup on UART is completed
> 
> Load the board-specific nvm when enable hci0.

Ack, thanks for the confirmation.

Please post the next iteration, I'll R-B it.

-- 
With best wishes
Dmitry

