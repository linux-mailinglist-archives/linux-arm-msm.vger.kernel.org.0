Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B201D1EF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 21:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389392AbgEMTXj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 May 2020 15:23:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732218AbgEMTXi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 May 2020 15:23:38 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A0AC061A0C;
        Wed, 13 May 2020 12:23:38 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id y13so488532vsk.8;
        Wed, 13 May 2020 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l9LOmi1FClcA2kgCQwSp0wwAurkQavNcjS11HRo573c=;
        b=bXpbM4HARv+IR69tEdMBePQDqpUntoIXklRB8G3jAiuzkcStg27HJgO4osKE5rNZR5
         1t7IEmZvOA8kFiRMNn/1PXp7K+w2JSWKyjO2tQm8zMhpcUfHknzSb37ESnG3QRtf1vTE
         XP5iG6huLyMbPkCgZgkfMQYB/IeJZyElFB52sjNsTkaxwBng5MBd89yQ5fneeKQr3oDm
         qRmrv4GyxedmaUOFG502OsQlMsXGi0wq/jSJVj29cc/dASgbWY1zl5YeV/50gHdbpxsi
         IputVNspCvZkTR+U7g0qyQonjFSd244obrNeFIFAf63TcNutvWGi9zYR8I2tf45clrj7
         Vf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l9LOmi1FClcA2kgCQwSp0wwAurkQavNcjS11HRo573c=;
        b=kmTvQ1TxzbgjNZLMLNXrmHoJxeRTVIdTNKxCOYaACwRx+ydB71RoKfHwpX/4AiWn+5
         da6euTZMbKxWkhJulioRnwBE5I22YmeUsvBsGhSEZzdjBqvJrLm9ohOVZ1TGllfrJBxh
         bILeZ3PwRP/DyLUIR+LhAiFulrIwdvLwGIQDH4XEcZs2uiCdcpwaA1c2cCKQaUBLDlu0
         axEfXSoUWU8eZM0xG/E1cY+GNB9GVx+ddqnw9KPmyzTgDA+V4PCOE0EegvMG4kc9JvTF
         ligJ5ea8mlF0BpmX4DYqeP7Pxmkh5ChsjVADqpCHzX6qgwcwFKFGUnj/lIqSMo0e32+D
         ChJw==
X-Gm-Message-State: AOAM530fAFGjXqBe92/guiapHAxFbVcsuA65Sc1u0lZzGQATyRsQk1qq
        goo/sk+M5sG1Oa6F2WbyF9DkDiPW3OoZK0rTWok=
X-Google-Smtp-Source: ABdhPJxWcSNEKTv7uy73/j+Ujirn/4dpBdQ87rlQk8AlPgGKlTI8AYTQBkRRLaiCVRtk2Z6LA3kEZYR6d0/m5dspTUQ=
X-Received: by 2002:a67:de0a:: with SMTP id q10mr691472vsk.138.1589397817330;
 Wed, 13 May 2020 12:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200513100533.42996-1-vkoul@kernel.org> <20200513100533.42996-4-vkoul@kernel.org>
In-Reply-To: <20200513100533.42996-4-vkoul@kernel.org>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Wed, 13 May 2020 20:20:56 +0100
Message-ID: <CACvgo502+8YroB5QtnGYFeSu92s_vpe_M3cPFeuC77u9xpanXQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/bridge: Introduce LT9611 DSI to HDMI bridge
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        devicetree <devicetree@vger.kernel.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

Few high-level comments:
 - handful of functions always return 0 and the return value is never
checked - switch to return void
 - annotate all (nearly) arrays as static const
 - consistently use multi_reg_write - in some cases non-const array
will be fine, overwriting a few entries as needed
 - there is very partial comments about the registers/values - missing docs or?

Personally I'm in favour of using symbolic names, instead of
hex+comment. Considering how partial the comments are, current
approach is perfectly fine.

On Wed, 13 May 2020 at 11:06, Vinod Koul <vkoul@kernel.org> wrote:
>
> Lontium Lt9611 is a DSI to HDMI bridge which supports two DSI ports and
> I2S port as an input and HDMI port as output
>
> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/lt9611.c

Please add a vendor prefix to the filename.

> @@ -0,0 +1,1113 @@

> +struct lt9611_mode {
> +       u16 hdisplay;
> +       u16 vdisplay;
> +       u8 fps;
We all enjoy the odd fps game, but let's use vrefresh here.

> +       u8 lanes;
> +       u8 intfs;
> +};
> +


> +static int lt9611_mipi_input_digital(struct lt9611 *lt9611,
> +                                    const struct drm_display_mode *mode)
> +{
> +       regmap_write(lt9611->regmap, 0x8300, LT9611_4LANES);
> +
> +       if (mode->hdisplay == 3840)
> +               regmap_write(lt9611->regmap, 0x830a, 0x03);
> +       else
> +               regmap_write(lt9611->regmap, 0x830a, 0x00);
> +
> +       regmap_write(lt9611->regmap, 0x824f, 0x80);
> +       regmap_write(lt9611->regmap, 0x8250, 0x10);
> +       regmap_write(lt9611->regmap, 0x8302, 0x0a);
> +       regmap_write(lt9611->regmap, 0x8306, 0x0a);
Create an (non-const) array, overwriting the [1] entry for 3840 mode?

> +
> +       return 0;
Kill return type.

> +}

> +static int lt9611_pcr_setup(struct lt9611 *lt9611,
> +                           const struct drm_display_mode *mode)
> +{
> +       struct reg_sequence reg_cfg[] = {
static const?

> +               { 0x830b, 0x01 },
> +               { 0x830c, 0x10 },
> +               { 0x8348, 0x00 },
> +               { 0x8349, 0x81 },
> +
> +               /* stage 1 */
> +               { 0x8321, 0x4a },
> +               { 0x8324, 0x71 },
> +               { 0x8325, 0x30 },
> +               { 0x832a, 0x01 },
> +
> +               /* stage 2 */
> +               { 0x834a, 0x40 },
> +               { 0x831d, 0x10 },
> +
> +               /* MK limit */
> +               { 0x832d, 0x38 },
> +               { 0x8331, 0x08 },
> +       };
> +
> +       regmap_multi_reg_write(lt9611->regmap, reg_cfg, ARRAY_SIZE(reg_cfg));
> +
> +       switch (mode->hdisplay) {
> +       case 640:
> +               regmap_write(lt9611->regmap, 0x8326, 0x14);
> +               break;
> +       case 1920:
> +               regmap_write(lt9611->regmap, 0x8326, 0x37);
> +               break;
> +       case 3840:
> +               regmap_write(lt9611->regmap, 0x830b, 0x03);
> +               regmap_write(lt9611->regmap, 0x830c, 0xd0);
> +               regmap_write(lt9611->regmap, 0x8348, 0x03);
> +               regmap_write(lt9611->regmap, 0x8349, 0xe0);
> +               regmap_write(lt9611->regmap, 0x8324, 0x72);
> +               regmap_write(lt9611->regmap, 0x8325, 0x00);
> +               regmap_write(lt9611->regmap, 0x832a, 0x01);
> +               regmap_write(lt9611->regmap, 0x834a, 0x10);
> +               regmap_write(lt9611->regmap, 0x831d, 0x10);
> +               regmap_write(lt9611->regmap, 0x8326, 0x37);
Throw this in another const array?

> +               break;
> +       }
> +
> +       /* pcr rst */
> +       regmap_write(lt9611->regmap, 0x8011, 0x5a);
> +       regmap_write(lt9611->regmap, 0x8011, 0xfa);
> +
> +       return 0;
> +}


> +       regmap_write(lt9611->regmap, 0x82e3, pclk >> 17); /* pclk[19:16] */
> +       regmap_write(lt9611->regmap, 0x82e4, pclk >> 9);  /* pclk[15:8]  */
> +       regmap_write(lt9611->regmap, 0x82e5, pclk >> 1);  /* pclk[7:0]   */
Comment does not match the code.
We're discarding the LSB, so we cannot realistically be writing
pclk[7:0]. Similar applies for the other two.


> +       /* v_act */
> +       ret = regmap_read(lt9611->regmap, 0x8282, &temp);
> +       if (ret)
> +               goto end;
> +
> +       v_act = temp << 8;
> +       ret = regmap_read(lt9611->regmap, 0x8283, &temp);
> +       if (ret)
> +               goto end;
> +       v_act = v_act + temp;
> +
Having a helper for the above "result = read(x) << 8 | read(x+1)"
would be great.
This way one doesn't have to repeat the pattern 4-5 times.


> +static int lt9611_read_edid(struct lt9611 *lt9611)
> +{
> +       unsigned int temp;
> +       int ret = 0;
> +       int i, j;
> +
> +       memset(lt9611->edid_buf, 0, EDID_SEG_SIZE);
How about:
  memset(lt9611->edid_buf, 0, sizeof(lt9611->edid_buf));

Then again, do we need the memset()? We are allocating the memory with
devm_kzalloc()

> +
> +       regmap_write(lt9611->regmap, 0x8503, 0xc9);
> +
> +       /* 0xA0 is EDID device address */
> +       regmap_write(lt9611->regmap, 0x8504, 0xa0);
> +       /* 0x00 is EDID offset address */
> +       regmap_write(lt9611->regmap, 0x8505, 0x00);
> +       /* length for read */
> +       regmap_write(lt9611->regmap, 0x8506, 0x20);
Is this the same 32 as seen in the loops below? #define and use consistently?

> +       regmap_write(lt9611->regmap, 0x8514, 0x7f);
> +
> +       for (i = 0 ; i < 8 ; i++) {
Add a #define for the magic 8

> +               /* offset address */
> +               regmap_write(lt9611->regmap, 0x8505, i * 32);
> +               regmap_write(lt9611->regmap, 0x8507, 0x36);
> +               regmap_write(lt9611->regmap, 0x8507, 0x31);
> +               regmap_write(lt9611->regmap, 0x8507, 0x37);
> +               usleep_range(5000, 10000);
> +
> +               regmap_read(lt9611->regmap, 0x8540, &temp);
> +
> +               if (temp & 0x02) {  /*KEY_DDC_ACCS_DONE=1*/
Use #define KEY_DDC_ACCS_DONE 0x02

> +                       for (j = 0; j < 32; j++) {
Another #define for 32

> +                               regmap_read(lt9611->regmap, 0x8583, &temp);
> +                               lt9611->edid_buf[i * 32 + j] = temp;
> +                       }
> +               } else if (temp & 0x50) { /* DDC No Ack or Abitration lost */
> +                       dev_err(lt9611->dev, "read edid failed: no ack\n");
> +                       ret = -EIO;
> +                       goto end;
> +               } else {
> +                       dev_err(lt9611->dev,
> +                               "read edid failed: access not done\n");
> +                       ret = -EIO;
> +                       goto end;
> +               }
> +       }
> +
> +       dev_dbg(lt9611->dev, "read edid succeeded, checksum = 0x%x\n",
> +               lt9611->edid_buf[255]);
> +
> +end:
> +       regmap_write(lt9611->regmap, 0x8507, 0x1f);
> +       return ret;
> +}


> +
> +/* TODO: add support for more extension blocks */
> +static int
> +lt9611_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
> +{
> +       struct lt9611 *lt9611 = data;
> +       int ret;
> +
> +       dev_dbg(lt9611->dev, "get edid block: block=%d, len=%d\n",
> +               block, (int)len);
> +
> +       if (len > 128)
> +               return -EINVAL;
> +
> +       /* support up to 1 extension block */
Move the TODO here?

> +       if (block > 1)
> +               return -EINVAL;
> +
> +       if (block == 0) {
> +               /* always read 2 edid blocks once */
Please mention why that's a good idea. From memory - there aren't many
other drivers that do this.

> +               ret = lt9611_read_edid(lt9611);
> +               if (ret) {
> +                       dev_err(lt9611->dev, "edid read failed\n");
> +                       return ret;
> +               }
> +       }
> +
> +       if (block % 2 == 0)
> +               memcpy(buf, lt9611->edid_buf, len);
> +       else
> +               memcpy(buf, lt9611->edid_buf + 128, len);
The above can be written as:
   memcpy(buf, lt9611->edid_buf + (block * 128), len);

> +
> +       return 0;
> +}
> +

> +static int lt9611_bridge_attach(struct drm_bridge *bridge,
> +                               enum drm_bridge_attach_flags flags)
> +{

> +       /* Attach secondary DSI, if specified */
> +       if (lt9611->dsi1_node) {
> +               lt9611->dsi1 = lt9611_attach_dsi(lt9611, lt9611->dsi1_node);
> +               if (IS_ERR(lt9611->dsi1)) {
> +                       ret = PTR_ERR(lt9611->dsi1);
> +                       goto err_unregister_dsi0;
> +               }
> +       }
> +
> +       return 0;
> +
> +err_unregister_dsi0:
Missing detach? If possible directly use lt9611_bridge_detach().

> +       mipi_dsi_device_unregister(lt9611->dsi0);
> +
> +       return ret;
> +}
> +


> +static int lt9611_read_device_rev(struct lt9611 *lt9611)
> +{
> +       unsigned int rev;
> +       int ret;
> +
> +       regmap_write(lt9611->regmap, 0x80ee, 0x01);
> +       ret = regmap_read(lt9611->regmap, 0x8002, &rev);
> +       if (ret)
> +               dev_err(lt9611->dev, "failed to read revision: %d\n", ret);
> +
The "failed" message will be followed by printing random kernel memory.
Initialize rev to some dummy number or omit the dev_info.

> +       dev_info(lt9611->dev, "LT9611 revision: 0x%x\n", rev);
> +
> +       return ret;
> +}
> +
> +static int lt9611_probe(struct i2c_client *client,
> +                       const struct i2c_device_id *id)
> +{

> +       ret = lt9611_parse_dt(&client->dev, lt9611);
> +       if (ret) {
> +               dev_err(dev, "failed to parse device tree\n");
> +               return ret;
> +       }
> +
> +       ret = lt9611_gpio_init(lt9611);
> +       if (ret < 0)
Missing of_node_put() here and for the next few error paths.

> +               return ret;
> +
> +       ret = lt9611_regulator_init(lt9611);
> +       if (ret < 0)
> +               return ret;
> +
> +       lt9611_assert_5v(lt9611);
> +
> +       ret = lt9611_regulator_enable(lt9611);
> +       if (ret)
> +               return ret;
> +

> +       return 0;
> +
> +err_disable_regulators:
> +       regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);
> +
> +       of_node_put(lt9611->dsi0_node);
> +       of_node_put(lt9611->dsi1_node);
Use the inverse order wrt the get() operation.

> +
> +       return ret;
> +}
> +
> +static int lt9611_remove(struct i2c_client *client)
> +{
> +       struct lt9611 *lt9611 = i2c_get_clientdata(client);
> +
> +       disable_irq(client->irq);
> +       drm_bridge_remove(&lt9611->bridge);
> +
> +       regulator_bulk_disable(ARRAY_SIZE(lt9611->supplies), lt9611->supplies);
> +
> +       of_node_put(lt9611->dsi0_node);
> +       of_node_put(lt9611->dsi1_node);
Flip the order - dsi1, then dsi0

> +
> +       return 0;
> +}
> +
> +static struct i2c_device_id lt9611_id[] = {
> +       { "lontium,lt9611", 0},
> +       {}
> +};
> +
> +static const struct of_device_id lt9611_match_table[] = {
> +       {.compatible = "lontium,lt9611"},
In the above two - add space after { and before }. Pretty sure
./scripts/checkpatch.pl will complain about those.
Might want to double-check for other issues reported by said tool.


-Emil
