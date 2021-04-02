Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16DB53524B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 02:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233870AbhDBAum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 20:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233849AbhDBAul (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 20:50:41 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65A16C06178A
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 17:50:41 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id c204so2630401pfc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 17:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=zdktSwchFSboaBqEuqtV3+3dzGZphF0+Oj1BTU7ioco=;
        b=BZvz8eqSSrf3c0ECoTcsde49xUb8HcYYXq9LoxwzYeeTKH4pNE9MNRmvio0+pZitx3
         BiskEPtHTdlZawCF66kP6KqdNzyO2YL+HSd/fIHF6zSFQNtUeNDg0SP6lb0Qq1WV7aVJ
         QLR21CLgNNn5e4e+TzKHShB1tqfYXxmf90WtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=zdktSwchFSboaBqEuqtV3+3dzGZphF0+Oj1BTU7ioco=;
        b=T+HKqrPSzwkksPvfxFexsruG7EIkyQL/5h+3XGElVS5B/fVHjSZs7CuwH/eevsO/zL
         ipJR3NSo8KF2yQnPNxt71PJDLrrshPsRNIMJvJqyVow5F9Yz2OT8wP4631s/PiuP/xg/
         wTN1w7jdNiLS+YWADTucDmPNytD/1ujisZYEdSa/yNR3zFYphtt+2VEoFpWQ/ySvVdLs
         NTAV9JTiQql4z6OITBzNYvbHhrb8TIK8QxCINT8Z8xwD7Z8+88mYaO+ROehapFaSU738
         kxDvD9C1CkcL8UF0mVSPvFYCgI3uDgmzDYXLC7AIHjHFNRRNUaZKk1O5cwx3IaDOTw/L
         75Cw==
X-Gm-Message-State: AOAM531502dTpDIDdypMelDJWQ72xSiVrd1W5joVJFL/DkNpVe2oXaUD
        8UHV4/4qtxXWKdKiRj1+UbJk56fehmnvxA==
X-Google-Smtp-Source: ABdhPJwKwvpel8DWpoky99VHW3S9BdUssReEoPqpOgNcTckoZYDEcEmMak13iPP/AjC+LOHroYI14g==
X-Received: by 2002:a63:5a48:: with SMTP id k8mr9830070pgm.308.1617324640692;
        Thu, 01 Apr 2021 17:50:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:450:f2a9:b3ca:879f])
        by smtp.gmail.com with ESMTPSA id t6sm6454560pjs.26.2021.04.01.17.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 17:50:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <326da78181b566ee7d48683d68bb89d7@codeaurora.org>
References: <cover.1616651305.git.schowdhu@codeaurora.org> <dc058ed6d05f1aec4e97fee6d4c007abdf3b54a0.1616651305.git.schowdhu@codeaurora.org> <161704834593.3012082.17486072850156076295@swboyd.mtv.corp.google.com> <326da78181b566ee7d48683d68bb89d7@codeaurora.org>
Subject: Re: [PATCH V2 2/5] soc: qcom: dcc: Add driver support for Data Capture and Compare unit(DCC)
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
To:     schowdhu@codeaurora.org
Date:   Thu, 01 Apr 2021 17:50:38 -0700
Message-ID: <161732463842.2260335.16117110131113613939@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting schowdhu@codeaurora.org (2021-04-01 07:04:07)
> On 2021-03-30 01:35, Stephen Boyd wrote:
> > Quoting Souradeep Chowdhury (2021-03-25 01:02:33)
> >> diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
> >> new file mode 100644
> >> index 0000000..a55d8ca7
> >> --- /dev/null
> >> +++ b/drivers/soc/qcom/dcc.c
> >> @@ -0,0 +1,1549 @@
[..]
> >=20
> >> +       void __iomem            *base;
> >> +       u32                     reg_size;
> >> +       struct device           *dev;
> >> +       struct mutex            mutex;
> >=20
> > In particular what this mutex is protecting.
>=20
> Ack. The mutex is used to protect the access as well as manipulation of=20
> the main instance of dcc_drvdata structure
> initialized during probe time. This structure contains the useful driver =

> data information and is set using the call
> platform_set_drvdata(pdev, drvdata) which links this data to the=20
> platform device and hence needs to be protected via
> mutex locks. The same convention is followed across other similar=20
> drivers exposing userspace like the llcc driver.

The region that the mutex is protecting seems quite large. That's
probably because I don't understand the driver.

> >=20
> >> +
> >> +       mutex_lock(&drvdata->mutex);
> >> +
> >> +       for (curr_list =3D 0; curr_list < drvdata->nr_link_list;=20
> >> curr_list++) {
> >> +               if (!drvdata->enable[curr_list])
> >> +                       continue;
> >> +               ll_cfg =3D dcc_readl(drvdata, DCC_LL_CFG(curr_list));
> >> +               tmp_ll_cfg =3D ll_cfg & ~BIT(9);
> >> +               dcc_writel(drvdata, tmp_ll_cfg,=20
> >> DCC_LL_CFG(curr_list));
> >> +               dcc_writel(drvdata, 1, DCC_LL_SW_TRIGGER(curr_list));
> >> +               dcc_writel(drvdata, ll_cfg, DCC_LL_CFG(curr_list));
> >> +       }
> >=20
> > Does the mutex need to be held while waiting for ready?
>=20
> Yes, to maintain consistency because inside the dcc_ready function,=20
> there is access to dcc_drvdata structure set
> on the platform device.

Is the drvdata going to be modified somewhere else?

> >> +
> >> +               dev_info(drvdata->dev, "All values written to=20
> >> enable.\n");
> >=20
> > Debug print?
>=20
> Ack
>=20
> >=20
> >> +               /* Make sure all config is written in sram */
> >> +               mb();
> >=20
> > This won't work as intended.
>=20
> This was called to prevent instruction reordering if the driver runs on=20
> multiple
> CPU cores. As the hardware manipulation has to be done sequentially=20
> before the
> trigger is set. Kindly let me know the concern in this case.

Device I/O with the proper accessors is sequential even if the process
moves to a different CPU. Is that what you're worried about? The comment
says "make sure it is written to sram", which should be achieved by
reading some register back from the device after all the writes so that
the driver knows the writes have been posted to the device. I believe
this mb() is doing nothing.

>=20
> >=20
> >> +
> >> +               drvdata->enable[list] =3D true;
> >> +
> >> +               /* 5. Configure trigger */
> >> +               dcc_writel(drvdata, BIT(9), DCC_LL_CFG(list));
> >> +       }
> >> +
> >> +err:
> >> +       mutex_unlock(&drvdata->mutex);
> >> +       return ret;
> >> +}
> >> +
> >> +static void dcc_disable(struct dcc_drvdata *drvdata)
> >> +{
> >> +       int curr_list;
> >> +
> >> +       mutex_lock(&drvdata->mutex);
> >> +
> >> +       if (!dcc_ready(drvdata))
> >> +               dev_err(drvdata->dev, "DCC is not ready Disabling=20
> >> DCC...\n");
> >=20
> > Is that two sentences? And a debug print?
>=20
> Ack.
>=20
> >=20
> >> +
> >> +       for (curr_list =3D 0; curr_list < drvdata->nr_link_list;=20
> >> curr_list++) {
> >> +               if (!drvdata->enable[curr_list])
> >> +                       continue;
> >> +               dcc_writel(drvdata, 0, DCC_LL_CFG(curr_list));
> >> +               dcc_writel(drvdata, 0, DCC_LL_BASE(curr_list));
> >> +               dcc_writel(drvdata, 0, DCC_FD_BASE(curr_list));
> >> +               dcc_writel(drvdata, 0, DCC_LL_LOCK(curr_list));
> >> +               drvdata->enable[curr_list] =3D false;
> >> +       }
> >> +       memset_io(drvdata->ram_base, 0, drvdata->ram_size);
> >> +       drvdata->ram_cfg =3D 0;
> >> +       drvdata->ram_start =3D 0;
> >> +       mutex_unlock(&drvdata->mutex);
> >> +}
> >> +
> >> +static ssize_t curr_list_show(struct device *dev,
> >> +       struct device_attribute *attr, char *buf)
> >> +{
> >> +       int ret;
> >> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> >> +
> >> +       mutex_lock(&drvdata->mutex);
> >> +       if (drvdata->curr_list =3D=3D DCC_INVALID_LINK_LIST) {
> >> +               dev_err(dev, "curr_list is not set.\n");
> >> +               ret =3D -EINVAL;
> >> +               goto err;
> >> +       }
> >> +
> >> +       ret =3D scnprintf(buf, PAGE_SIZE, "%d\n", drvdata->curr_list);
> >> +err:
> >> +       mutex_unlock(&drvdata->mutex);
> >> +       return ret;
> >> +}
> >> +
> >> +static ssize_t curr_list_store(struct device *dev,
> >> +                                               struct=20
> >> device_attribute *attr,
> >> +                                               const char *buf,=20
> >> size_t size)
> >> +{
> >> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> >> +       unsigned long val;
> >> +       u32 lock_reg;
> >> +       bool dcc_enable =3D false;
> >> +
> >> +       if (kstrtoul(buf, 16, &val))
> >> +               return -EINVAL;
> >> +
> >> +       if (val >=3D drvdata->nr_link_list)
> >> +               return -EINVAL;
> >> +
> >> +       mutex_lock(&drvdata->mutex);
> >> +
> >> +       dcc_enable =3D is_dcc_enabled(drvdata);
> >> +       if (drvdata->curr_list !=3D DCC_INVALID_LINK_LIST && dcc_enabl=
e)=20
> >> {
> >> +               dev_err(drvdata->dev, "DCC is enabled, please disable =

> >> it first.\n");
> >> +               mutex_unlock(&drvdata->mutex);
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       lock_reg =3D dcc_readl(drvdata, DCC_LL_LOCK(val));
> >> +       if (lock_reg & 0x1) {
> >> +               dev_err(drvdata->dev, "DCC linked list is already=20
> >> configured\n");
> >> +               mutex_unlock(&drvdata->mutex);
> >> +               return -EINVAL;
> >> +       }
> >> +       drvdata->curr_list =3D val;
> >> +       mutex_unlock(&drvdata->mutex);
> >> +
> >> +       return size;
> >> +}
> >> +
> >> +static DEVICE_ATTR_RW(curr_list);
> >> +
> >> +
> >> +static ssize_t trigger_store(struct device *dev,
> >> +                                       struct device_attribute *attr,
> >> +                                       const char *buf, size_t size)
> >> +{
> >> +       int ret =3D 0;
> >> +       unsigned long val;
> >> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> >> +
> >> +       if (kstrtoul(buf, 16, &val))
> >> +               return -EINVAL;
> >> +       if (val !=3D 1)
> >> +               return -EINVAL;
> >> +
> >> +       ret =3D dcc_sw_trigger(drvdata);
> >> +       if (!ret)
> >> +               ret =3D size;
> >> +
> >> +       return ret;
> >> +}
> >> +static DEVICE_ATTR_WO(trigger);
> >> +
> >> +static ssize_t enable_show(struct device *dev,
> >> +       struct device_attribute *attr, char *buf)
> >> +{
> >> +       int ret;
> >> +       bool dcc_enable =3D false;
> >> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> >> +
> >> +       mutex_lock(&drvdata->mutex);
> >> +       if (drvdata->curr_list >=3D drvdata->nr_link_list) {
> >> +               dev_err(dev, "Select link list to program using=20
> >> curr_list\n");
> >> +               ret =3D -EINVAL;
> >> +               goto err;
> >> +       }
> >> +
> >> +       dcc_enable =3D is_dcc_enabled(drvdata);
> >> +
> >> +       ret =3D scnprintf(buf, PAGE_SIZE, "%u\n",
> >> +                               (unsigned int)dcc_enable);
> >> +err:
> >> +       mutex_unlock(&drvdata->mutex);
> >=20
> > What does the mutex being held serve here?
>=20
> As mentioned earlier, the mutex has been used while accessing=20
> dcc_drvdata structure.
>=20

And what purpose does it serve? I suppose curr_list can be modified? But
then when this function returns it could be disabled before userspace
sees the value so I'm still lost why we care to hold the lock this long.

> >=20
> >> +       return ret;
> >> +}
> >> +
> >> +static ssize_t enable_store(struct device *dev,
> >> +                               struct device_attribute *attr,
> >> +                               const char *buf, size_t size)
> >> +{
> >> +       int ret =3D 0;
> >> +       unsigned long val;
> >> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> >> +
> >> +       if (kstrtoul(buf, 16, &val))
> >> +               return -EINVAL;
> >> +
> >> +       if (val)
> >> +               ret =3D dcc_enable(drvdata);
> >> +       else
> >> +               dcc_disable(drvdata);
> >> +
> >> +       if (!ret)
> >> +               ret =3D size;
> >> +
> >> +       return ret;
> >> +
> >> +}
> >> +
> >> +static DEVICE_ATTR_RW(enable);
> >> +
> >> +static ssize_t config_show(struct device *dev,
> >> +       struct device_attribute *attr, char *buf)
> >> +{
> >> +       struct dcc_drvdata *drvdata =3D dev_get_drvdata(dev);
> >> +       struct dcc_config_entry *entry;
> >> +       char local_buf[64];
> >> +       int len =3D 0, count =3D 0;
> >> +
> >> +       buf[0] =3D '\0';
> >=20
> > Why?
>=20
> The strlcat function is used here to concatenate the buffer with the=20
> config values.
> The strlcat function in C needs a NULL terminated string both as it's=20
> source and
> destination. That's why this has been initialized with NULL termination.
>=20

sysfs files shall be one value per file, i.e. something that a machine
reads. This function looks like a debugfs function.

>=20
> >=20
> >> +
> >> +       mutex_lock(&drvdata->mutex);
> >> +       if (drvdata->curr_list >=3D drvdata->nr_link_list) {
> >> +               dev_err(dev, "Select link list to program using=20
> >> curr_list\n");
> >> +               count =3D -EINVAL;
> >> +               goto err;
> >> +       }
> >> +
> >> +       list_for_each_entry(entry,
> >> +       &drvdata->cfg_head[drvdata->curr_list], list) {
> >> +               switch (entry->desc_type) {
> >> +               case DCC_READ_WRITE_TYPE:
> >> +                       len =3D snprintf(local_buf, 64, "Index: 0x%x, =

> >> mask: 0x%x, val: 0x%x\n",
> >> +                               entry->index, entry->mask,=20
> >> entry->write_val);
> >> +                       break;
> >> +               case DCC_LOOP_TYPE:
> >> +                       len =3D snprintf(local_buf, 64, "Index: 0x%x, =

> >> Loop: %d\n",
> >> +                               entry->index, entry->loop_cnt);
> >> +                       break;
> >> +               case DCC_WRITE_TYPE:
> >> +                       len =3D snprintf(local_buf, 64,
> >> +                               "Write Index: 0x%x, Base: 0x%x,=20
> >> Offset: 0x%x, len: 0x%x APB: %d\n",
> >> +                               entry->index, entry->base,=20
> >> entry->offset, entry->len,
> >> +                               entry->apb_bus);
> >> +                       break;
> >> +               default:
> >> +                       len =3D snprintf(local_buf, 64,
> >> +                               "Read Index: 0x%x, Base: 0x%x, Offset:=
=20
> >> 0x%x, len: 0x%x APB: %d\n",
> >> +                               entry->index, entry->base,=20
> >> entry->offset,
> >> +                               entry->len, entry->apb_bus);
> >> +               }
> >> +
> >> +               if ((count + len) > PAGE_SIZE) {
> >> +                       dev_err(dev, "DCC: Couldn't write complete=20
> >> config\n");
> >> +                       break;
> >> +               }
> >> +               strlcat(buf, local_buf, PAGE_SIZE);
> >> +               count +=3D len;
> >> +       }
> >> +
> >> +err:
> >> +       mutex_unlock(&drvdata->mutex);
> >> +       return count;
> >> +}
> >=20
> >> +
> >> +       /* EOF check */
> >> +       if (drvdata->ram_size <=3D *ppos)
> >> +               return 0;
> >> +
> >> +       if ((*ppos + len) > drvdata->ram_size)
> >> +               len =3D (drvdata->ram_size - *ppos);
> >> +
> >> +       buf =3D kzalloc(len, GFP_KERNEL);
> >> +       if (!buf)
> >> +               return -ENOMEM;
> >> +
> >> +       memcpy_fromio(buf, drvdata->ram_base + *ppos, len);
> >> +
> >> +       if (copy_to_user(data, buf, len)) {
> >=20
> > Is there any sort of memcpy_fromio_to_user() API? That would avoid the
> > extra buffer allocation by copying to userspace in the readl loop.
>=20
> No. For directly copying io data to userspace we need to use direct I/O=20
> which is used for
> special cases like tape drivers. In this case the complexity of using it =

> outweighs it's
> advantages. Also this is a fixed transfer of data in the form of=20
> dcc_sram content rather
> than bulk transfers.

Tape drivers? Huh? Can you please look into adding a
memcpy_fromio_to_user() API that does this without allocating memory for
a buffer?

>=20
> >=20
> >> +               dcc->loopoff =3D DCC_FIX_LOOP_OFFSET;
> >> +       else
> >> +               dcc->loopoff =3D get_bitmask_order((dcc->ram_size +
> >> +                               dcc->ram_offset) / 4 - 1);
> >> +
> >> +       mutex_init(&dcc->mutex);
> >> +       dcc->enable =3D devm_kcalloc(dev, dcc->nr_link_list,
> >> +                       sizeof(bool), GFP_KERNEL);
> >> +       if (!dcc->enable)
> >> +               return -ENOMEM;
> >> +
> >> +       dcc->configured =3D devm_kcalloc(dev, dcc->nr_link_list,
> >> +                       sizeof(bool), GFP_KERNEL);
> >> +       if (!dcc->configured)
> >> +               return -ENOMEM;
> >> +
> >> +       dcc->nr_config =3D devm_kcalloc(dev, dcc->nr_link_list,
> >> +                       sizeof(u32), GFP_KERNEL);
> >> +       if (!dcc->nr_config)
> >> +               return -ENOMEM;
> >> +
> >> +       dcc->cfg_head =3D devm_kcalloc(dev, dcc->nr_link_list,
> >> +                       sizeof(struct list_head), GFP_KERNEL);
> >> +       if (!dcc->cfg_head)
> >> +               return -ENOMEM;
> >=20
> > These are a lot of allocations. Any chance we can do one instead of=20
> > this
> > many?
>=20
> All these variable have predefined requirement of sizes
> so they need to be allocated separately.

Gather requirements, do some addition, and then allocate one chunk of
memory?
