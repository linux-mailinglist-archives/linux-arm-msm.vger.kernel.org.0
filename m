Return-Path: <linux-arm-msm+bounces-79940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0116DC25CDD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 16:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08BDF3ACC71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 15:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBD7299947;
	Fri, 31 Oct 2025 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUQI39Pu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6179288C2D
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 15:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761923898; cv=none; b=IouEONej0ioN6f9MezniCvyks9W1HPNVEkHFuxamJ6kwV5EulzeEizER4kuUlFxUYZP9t2/dlocO4gxs5nxyY7jfqEBsxX7LnJDLm+inUde1A7tyMUPvAwHsdkkzpG/9PIHuAxL62FtgEXRUy426XOC3RCKGPfUDr/p6O3eM3dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761923898; c=relaxed/simple;
	bh=On3cALU8nBb0+4ieggXOsWPvMWQU83j2ni/F0KAU+8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoMIUWUET4vmCpADB1g4gvF9eGdoxY2K7X6Xby5l/q6iEPgUntscmnkc9fBorvDYVgEUWPUcU+WeDzDj6c5oHCkz9CtvhZhhIfiKqPYGaMZaDPkCPRFm2BtZ+1uhXbbfFjoxXb1jNPaJyLo0w190Y3Z5h6qHhI3I04Gp2pMXoF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUQI39Pu; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-378d246f0f1so25774791fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 08:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761923895; x=1762528695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWTZKkOkYcn9N/iXeT7lTpb6wx5Kgm29lLrZZWz6S0Y=;
        b=NUQI39PutpnQtcrVBQp3FC3sNqrkkV7ZC8PAzdjeWSW8gfiVVE3+EiLjGsssBFCjws
         LXnO8PNgfkuqWzFGVKbeRJNYFT11TqWxdk0M8UG6MKeV7Og+6X2JYcSp8Bhx7WnCBBx7
         wV2gkxe7ZfAwsopmHY4JP34khkX8W38eFFIh1L/fBb95oV/WA6Lq7aNPZ7/RszRfh6Hb
         47pxXkqCistkPkkcAgZg+QVeL51px149xmU9DWYCm41+ZdAtUkfRtY047mv/hPgftfTd
         5qtZ1eUXuGPG1wQExkKtFega/oWWB9SDKmZlIdqY18RoNyRbufXpOnxfL+Srb0LjUEKF
         +lJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761923895; x=1762528695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWTZKkOkYcn9N/iXeT7lTpb6wx5Kgm29lLrZZWz6S0Y=;
        b=usfVyGk/Q59n9mG1QFd3m71Q7PDpcLAkpt7Cfp4VvuJAFu7NkbhWDqzkGajoX8bu2d
         oxpOCKiTDWwNBYUU6aOOrJcvjJZqmXdd7v4mwFVg1zsk5KwtiSdkID6VQj75IuMSRErY
         MvBo9jS56DA2zgbLIEtp1/b4Jr5rtRFTaHDnLdixfg4CqOGvLCmp2eojv1aIkmps4HJn
         0YpsIFyjRw0GIQzc3tCtocPJJcMp6knu6YMDvRqvtOlU1XTWK09ujVG2EZjeYuMFtd6W
         DrtocLiwAW839KKAVlJUNrIvfE5U4mbOT/zZBPtZyhXulDm8fJNvgrr164I65yjwOx4Q
         1/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKRFGGw+HIWZMCklqc7i5buBkxnFC3qQAud1U0sxSKbDuG1981XEbmBf8Kn71tHfQ9ANaGbwGL+9/seYYd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9z34ND6FGHdeHBhoyNoARn48avK4zg9t0fPfa2hqfWE9fIMQ2
	8g0MNyrQsQ/cvF1ciF0Mou+UdBBeE/rPGLYzI343t1HC2c+6fXyHPXd6lqQOs9uqWQSbzQr5Izq
	Qdwz2I+94wiVPndypVVf7tR0Mg5X++Lk=
X-Gm-Gg: ASbGncvQsUylN6+/UN6R/dZI4nr6kZzkPePTRywu8J+69hWgDxrUcAZ86vHn7uWbnLO
	8JeDvpcE5S9DoEqtT7+H/fLtuI5kt/5QvYo/Z/kdweSpj7MQvmjPc1GMDRo9EayD4dsiZ8qNU4c
	22Icup2oOpdWRUWBRiRgnhBVcS2iwqZXbQsSQI3fBdvYXNfgpaLOAnJL5n1/HBWuNWo+I6qibrz
	ITAdrojFBEqikn8Z+S1idLw1EdicFckPfYMlNmcnc+Jl5kQMICReUt0us5Oleis7IYn1w==
X-Google-Smtp-Source: AGHT+IHhCyX5WgD/BnEfxs9+rDfxqdatiMXwvRpqYTj0+QM5LEWR/Zg4MlR9SQpm0sfZglZhrIAAIz4nl5FkspVBkEw=
X-Received: by 2002:a05:651c:2209:b0:336:9232:fb91 with SMTP id
 38308e7fff4ca-37a18d84e13mr14682981fa.4.1761923894307; Fri, 31 Oct 2025
 08:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029022955.827475-1-quic_shuaz@quicinc.com> <20251029022955.827475-2-quic_shuaz@quicinc.com>
In-Reply-To: <20251029022955.827475-2-quic_shuaz@quicinc.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 31 Oct 2025 11:18:02 -0400
X-Gm-Features: AWmQ_bnmEoXSHQbwofIVHDVHm8UazbPDGWMN_lWJ04lJ7qFjiRa0BctPyX2rqPk
Message-ID: <CABBYNZKh5_Ed0Jm-rjpPZKEf26zo3Lz-ZZrEKAJJWkZWQy3o7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Bluetooth: btusb: add default nvm file
To: Shuai Zhang <quic_shuaz@quicinc.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, marcel@holtmann.org, 
	linux-bluetooth@vger.kernel.org, stable@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_chejiang@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 28, 2025 at 10:30=E2=80=AFPM Shuai Zhang <quic_shuaz@quicinc.co=
m> wrote:
>
> If no NVM file matches the board_id, load the default NVM file.
>
> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/bluetooth/btusb.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index dcbff7641..6903606d3 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3482,15 +3482,14 @@ static int btusb_setup_qca_load_rampatch(struct h=
ci_dev *hdev,
>  }
>
>  static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
> -                                       const struct qca_version *ver)
> +                                       const struct qca_version *ver,
> +                                       u16 board_id)
>  {
>         u32 rom_version =3D le32_to_cpu(ver->rom_version);
>         const char *variant, *fw_subdir;
>         int len;
> -       u16 board_id;
>
>         fw_subdir =3D qca_get_fw_subdirectory(ver);
> -       board_id =3D qca_extract_board_id(ver);
>
>         switch (le32_to_cpu(ver->ram_version)) {
>         case WCN6855_2_0_RAM_VERSION_GF:
> @@ -3522,14 +3521,28 @@ static int btusb_setup_qca_load_nvm(struct hci_de=
v *hdev,
>         const struct firmware *fw;
>         char fwname[80];
>         int err;
> +       u16 board_id =3D 0;
>
> -       btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver);
> +       board_id =3D qca_extract_board_id(ver);
>
> +retry:
> +       btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver, board_id=
);
>         err =3D request_firmware(&fw, fwname, &hdev->dev);
>         if (err) {
> +               if (err =3D=3D -EINVAL) {
> +                       bt_dev_err(hdev, "QCOM BT firmware file request f=
ailed (%d)", err);
> +                       return err;
> +               }
> +
>                 bt_dev_err(hdev, "failed to request NVM file: %s (%d)",
>                            fwname, err);
> -               return err;
> +               if (err =3D=3D -ENOENT && board_id !=3D 0) {
> +                       board_id =3D 0;
> +                       goto retry;

goto backwards is asking for trouble, just split the required code
into its own function and then call it again with board set to 0.

> +               } else {
> +                       bt_dev_err(hdev, "QCOM BT firmware file request f=
ailed (%d)", err);
> +                       return err;
> +               }
>         }
>
>         bt_dev_info(hdev, "using NVM file: %s", fwname);
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz

