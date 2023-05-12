Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53F470066F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 13:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240853AbjELLOZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 07:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241028AbjELLOY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 07:14:24 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8C3DD9D
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 04:14:21 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc0117683so17328645a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 04:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1683890060; x=1686482060;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubvb9p88+qXd6VOrp401GthxX4aOEOtnz4kgi/kUzHM=;
        b=0DxQHN51nTkhDMihJi78b3ohzJMoM2rXRuga1g6tw0P6qNiVS4sVaDavvwMIT5/iJ0
         Gyd4AtWdLZ5WJxMYmdxWl1sgVyeT/fA1AVb4pnZesPs4GAjkzKCCdzj13wDF3ZGCLXgP
         /cwdnqPJKz2mPmZYNAhyABgUXcoDYYThXQVYyJUox8JCl4sX4QDb29r863JZZN2x5CeK
         RKkhhEXl7XohTbmdb9Cms9xaWPK4UYp4HK4gfhE8VTjVlxxug2tdQhjIM10LhFv5XJkL
         XI+ANWqOR1T7qPIYvtmfC7JKuEzDCWvGXQ5LA0LBl7zQmc0N7GhgzmlhRA3//yPTDNA3
         znnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683890060; x=1686482060;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ubvb9p88+qXd6VOrp401GthxX4aOEOtnz4kgi/kUzHM=;
        b=OlP82Gdl6E86Vev3DRMT46tWpvvCUK75mX21s0md58LuU6WdF8gUw7/A3KuZ4A22gC
         ms2Cqwg+Tkzm4tL6qLSngvEaOEI1QkVM1/AufSKapvmv7IakpbAh8s4u9e0BcuO1oaW9
         rWbuxQ1uQ6+KNUMlYeMk+dldb4SH2ZDGkDX5N2iO60rKV2tdPSuEX7ryQQNR/fegQoC9
         tL254kBidjfDgozUND2V5knDh7EGQ5BWYV7qDKeMZ3vBhPzwMAgSeoF0UrQ0LdMj4Aoa
         WBJcnUYCevlIHVFzA+dIunuGBBRGq9Bw2Cz5msfvd0Lue4WwtTbqDIFxaRZ2JY5sKw19
         Ixog==
X-Gm-Message-State: AC+VfDwS/adRUueldwkUZlriM4FskV9b8RbK2ufbGplzXRZYllMB4gwa
        u1IY2RgeOrKNWYfPbFMZmkl6yQ==
X-Google-Smtp-Source: ACHHUZ52Czgk88thyOAzAK6r5gc3rGC6RgqVtFaULcxPliXgWW8mW3g/7ugZKJeeCj8A5U/8Lh8yPw==
X-Received: by 2002:a17:907:a0e:b0:94e:e6b9:fef2 with SMTP id bb14-20020a1709070a0e00b0094ee6b9fef2mr20395577ejc.67.1683890060020;
        Fri, 12 May 2023 04:14:20 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id l21-20020a1709062a9500b00969f44bbef3sm4734097eje.11.2023.05.12.04.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 04:14:19 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 12 May 2023 13:14:18 +0200
Message-Id: <CSK97HK2XBSR.1Q5K7TUE55HH7@otso>
Cc:     "David S. Miller" <davem@davemloft.net>,
        "Eric Dumazet" <edumazet@google.com>,
        "Jakub Kicinski" <kuba@kernel.org>,
        "Paolo Abeni" <pabeni@redhat.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Balakrishna Godavarthi" <bgodavar@codeaurora.org>,
        "Rocky Liao" <rjliao@codeaurora.org>,
        "Marcel Holtmann" <marcel@holtmann.org>,
        "Johan Hedberg" <johan.hedberg@gmail.com>,
        "Luiz Augusto von Dentz" <luiz.dentz@gmail.com>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH RFC 2/4] Bluetooth: btqca: Add WCN3988 support
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Simon Horman" <simon.horman@corigine.com>
X-Mailer: aerc 0.15.1
References: <20230421-fp4-bluetooth-v1-0-0430e3a7e0a2@fairphone.com>
 <20230421-fp4-bluetooth-v1-2-0430e3a7e0a2@fairphone.com>
 <ZE+6e7ZxJ2s9DHI1@corigine.com>
In-Reply-To: <ZE+6e7ZxJ2s9DHI1@corigine.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Simon,

On Mon May 1, 2023 at 3:11 PM CEST, Simon Horman wrote:
> On Fri, Apr 21, 2023 at 04:11:39PM +0200, Luca Weiss wrote:
> > Add support for the Bluetooth chip codenamed APACHE which is part of
> > WCN3988.
> >=20
> > The firmware for this chip has a slightly different naming scheme
> > compared to most others. For ROM Version 0x0200 we need to use
> > apbtfw10.tlv + apnv10.bin and for ROM version 0x201 apbtfw11.tlv +
> > apnv11.bin
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  drivers/bluetooth/btqca.c   | 13 +++++++++++--
> >  drivers/bluetooth/btqca.h   | 12 ++++++++++--
> >  drivers/bluetooth/hci_qca.c | 12 ++++++++++++
> >  3 files changed, 33 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> > index fd0941fe8608..3ee1ef88a640 100644
> > --- a/drivers/bluetooth/btqca.c
> > +++ b/drivers/bluetooth/btqca.c
> > @@ -594,14 +594,20 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t =
baudrate,
> >  	/* Firmware files to download are based on ROM version.
> >  	 * ROM version is derived from last two bytes of soc_ver.
> >  	 */
> > -	rom_ver =3D ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f)=
;
> > +	if (soc_type =3D=3D QCA_WCN3988)
> > +		rom_ver =3D ((soc_ver & 0x00000f00) >> 0x05) | (soc_ver & 0x0000000f=
);
> > +	else
> > +		rom_ver =3D ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f=
);
>
> Hi Luca,
>
> perhaps it's just me. But I was wondering if this can be improved on a li=
ttle.
>
> * Move the common portion outside of the conditional
> * And also, I think it's normal to use decimal for shift values.
>
> e.g.
> 	unsigned shift;
> 	...
>
> 	shift =3D soc_type =3D=3D QCA_WCN3988 ? 5 : 4;
> 	rom_ver =3D ((soc_ver & 0x00000f00) >> shift) | (soc_ver & 0x0000000f);
>
> Using some helpers such as GENMASK and FIELD_PREP might also be nice.

While I'm not opposed to the idea, I'm not sure it's worth making
beautiful macros for this since - to my eyes - how the mapping of
soc_ver to firmware name works is rather obscure since the sources from
Qualcomm just have a static lookup table of soc_ver to firmware name so
doing this dynamically like here is different.

And I haven't looked at other chips that are covered there to see if
there's a pattern to this, for the most part it seems the original
formula works for most chips and the one I added works for WCN3988 (and
the other "APACHE" chips, whatever they are).

If a third way is added then I would say for sure this line should be
made nicer but for now I think it's easier to keep this as I sent it
because we don't know what the future will hold.

>
> > =20
> >  	if (soc_type =3D=3D QCA_WCN6750)
> >  		qca_send_patch_config_cmd(hdev);
> > =20
> >  	/* Download rampatch file */
> >  	config.type =3D TLV_TYPE_PATCH;
> > -	if (qca_is_wcn399x(soc_type)) {
> > +	if (soc_type =3D=3D QCA_WCN3988) {
> > +		snprintf(config.fwname, sizeof(config.fwname),
> > +			 "qca/apbtfw%02x.tlv", rom_ver);
> > +	} else if (qca_is_wcn399x(soc_type)) {
> >  		snprintf(config.fwname, sizeof(config.fwname),
> >  			 "qca/crbtfw%02x.tlv", rom_ver);
> >  	} else if (soc_type =3D=3D QCA_QCA6390) {
> > @@ -636,6 +642,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t ba=
udrate,
> >  	if (firmware_name)
> >  		snprintf(config.fwname, sizeof(config.fwname),
> >  			 "qca/%s", firmware_name);
> > +	else if (soc_type =3D=3D QCA_WCN3988)
> > +		snprintf(config.fwname, sizeof(config.fwname),
> > +			 "qca/apnv%02x.bin", rom_ver);
> >  	else if (qca_is_wcn399x(soc_type)) {
> >  		if (ver.soc_id =3D=3D QCA_WCN3991_SOC_ID) {
>
> Not strictly related to this patch, but while reviewing this I noticed th=
at
> ver.soc_id is __le32 but QCA_WCN3991_SOC_ID is in host byteorder.
>
> Perhaps a cpu_to_le32() or le32_to_cpu() call is in order here?

Good catch, as you've seen I sent a patch separately to fix that. :)

Regards
Luca

>
> >  			snprintf(config.fwname, sizeof(config.fwname),
>
> ...

