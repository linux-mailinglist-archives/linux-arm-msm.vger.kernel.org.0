Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD56466B394
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jan 2023 20:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbjAOTKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Jan 2023 14:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbjAOTKb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Jan 2023 14:10:31 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84B9B12874
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 11:10:27 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id mp20so16876636ejc.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 11:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3lL4aejO0UvKZckyCwZSuB19Y0TmYTGUbBVOU3AupJ4=;
        b=BBykYwO6+2mTH42sX2N9CVODRJqbCKVvboEGxJY4LB79TysH+GGb0blo97TThWnkKs
         3KDBsG7/qh5982/ZiZ31ojxZjDE7EcCWwz6xU7HzcY7MWr6cjegrOwTVaisO0kAYejjY
         RZ+QotC82mntHWAsiXNgtbXEeJbyOzPzFy0dP29S/kQqO4p26MhVqRx9mW41pP0XKIvy
         jN7ffN4NbBy9t3Q9+dF7NqtRcp6HO7/hNGXT9zT1fuIUevIyGjTZYRCn6Bb8s1NEZHtN
         rdSSH8XlyxqHsNq0G+u6C/1K3En26m4JfZ5JcH3Jk1t1H113DulP+dCnK6vXDSXRmCv4
         bjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lL4aejO0UvKZckyCwZSuB19Y0TmYTGUbBVOU3AupJ4=;
        b=cshIEa6afkJLYv7WqF5jJE+g6nbVky7NI0RbvTDVa6sQRK2NYkl/uQ5hx9Ar+TLomh
         DIC6X6GCIQcX1RoivHfqdEyLfUbeI16vqP6mnRpu1ZckEwLQO41V56Tn4IzWEPBZB8Xr
         pIwJhdBjM0or8Xb57X5qamb79Z7c3qKuRuRMytMmvxH0sAE1f0ZQq53bJrCD3eVa+jPB
         vItqrcNR4L9UhJVH9q4CpXuFhNerq7P8XOSG1SqSoB032hPH0+3zhhxSznjxrCFHZ2xA
         X6o30EcSjLVntQcl4whqFiUZsXetoCTZvfg/3e1N5z7qyO3Igwbmz9qTByDFKRsYxQxP
         ZfKg==
X-Gm-Message-State: AFqh2krxby7HnB8onPTV/Qi5g90m5NlaHFC3bCNIqQY0G7QehKtuAIoI
        YG0UdgOeQTyBzZTSOwr7ooYmN2VpElXZjiA8C9leiQ==
X-Google-Smtp-Source: AMrXdXtXomJwrp4hyKiMvQ8rE9Rajr6wc5EVahlmbfkBRMWHtRLw27AT3ZHge6rQjT016sL6+RBGIGTFy44Lz+4VnGo=
X-Received: by 2002:a17:906:99c8:b0:870:323c:aa31 with SMTP id
 s8-20020a17090699c800b00870323caa31mr100278ejn.389.1673809825941; Sun, 15 Jan
 2023 11:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20230113041132.4189268-1-quic_bjorande@quicinc.com> <20230113041132.4189268-4-quic_bjorande@quicinc.com>
In-Reply-To: <20230113041132.4189268-4-quic_bjorande@quicinc.com>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Sun, 15 Jan 2023 13:10:14 -0600
Message-ID: <CAKXuJqhAFc=YQOYw7tKW5D0AW9S+QfutwgxD3sK2M9+HNtOqfQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] soc: qcom: pmic_glink: Introduce altmode support
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 12, 2023 at 10:13 PM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> With the PMIC GLINK service, the host OS subscribes to USB-C altmode
> messages, which are sent by the firmware to notify the host OS about
> state updates and HPD interrupts.
>
> The pmic_glink_altmode driver registers for these notifications and
> propagates the notifications as typec_mux, typec_switch and DRM OOB
> notifications as necessary to implement DisplayPort altmode support.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>
> Changes since v1:
> - None
>
> Johan reported a NULL pointer dereference in
> drm_kms_helper_hotplug_event() for HPD event being reported while the
> MSM DRM driver is still being initalized, a separate fix has been sent
> in hope to remidy this race condition in the MSM driver.
>
>  drivers/soc/qcom/Makefile             |   1 +
>  drivers/soc/qcom/pmic_glink_altmode.c | 477 ++++++++++++++++++++++++++
>  2 files changed, 478 insertions(+)
>  create mode 100644 drivers/soc/qcom/pmic_glink_altmode.c
>
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 29cccac472f3..f30552bf4da7 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_QCOM_MDT_LOADER) += mdt_loader.o
>  obj-$(CONFIG_QCOM_OCMEM)       += ocmem.o
>  obj-$(CONFIG_QCOM_PDR_HELPERS) += pdr_interface.o
>  obj-$(CONFIG_QCOM_PMIC_GLINK)  += pmic_glink.o
> +obj-$(CONFIG_QCOM_PMIC_GLINK)  += pmic_glink_altmode.o
>  obj-$(CONFIG_QCOM_QMI_HELPERS) += qmi_helpers.o
>  qmi_helpers-y  += qmi_encdec.o qmi_interface.o
>  obj-$(CONFIG_QCOM_RAMP_CTRL)   += ramp_controller.o
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> new file mode 100644
> index 000000000000..8d2d563cb756
> --- /dev/null
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -0,0 +1,477 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2022, Linaro Ltd
> + */
> +#include <linux/auxiliary_bus.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/mutex.h>
> +#include <linux/property.h>
> +#include <linux/soc/qcom/pdr.h>
> +#include <drm/drm_bridge.h>
> +
> +#include <linux/usb/typec_altmode.h>
> +#include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_mux.h>
> +
> +#include <linux/soc/qcom/pmic_glink.h>
> +
> +#define PMIC_GLINK_MAX_PORTS   2
> +
> +#define USBC_SC8180X_NOTIFY_IND        0x13
> +#define USBC_CMD_WRITE_REQ      0x15
> +#define USBC_NOTIFY_IND                0x16
> +
> +#define ALTMODE_PAN_EN         0x10
> +#define ALTMODE_PAN_ACK                0x11
> +
> +struct usbc_write_req {
> +       struct pmic_glink_hdr   hdr;
> +       __le32 cmd;
> +       __le32 arg;
> +       __le32 reserved;
> +};
> +
> +#define NOTIFY_PAYLOAD_SIZE 16
> +struct usbc_notify {
> +       struct pmic_glink_hdr hdr;
> +       char payload[NOTIFY_PAYLOAD_SIZE];
> +       u32 reserved;
> +};
> +
> +struct usbc_sc8180x_notify {
> +       struct pmic_glink_hdr hdr;
> +       __le32 notification;
> +       __le32 reserved[2];
> +};
> +
> +enum pmic_glink_altmode_pin_assignment {
> +       DPAM_HPD_OUT,
> +       DPAM_HPD_A,
> +       DPAM_HPD_B,
> +       DPAM_HPD_C,
> +       DPAM_HPD_D,
> +       DPAM_HPD_E,
> +       DPAM_HPD_F,
> +};
> +
> +struct pmic_glink_altmode;
> +
> +#define work_to_altmode_port(w) container_of((w), struct pmic_glink_altmode_port, work)
> +
> +struct pmic_glink_altmode_port {
> +       struct pmic_glink_altmode *altmode;
> +       unsigned int index;
> +
> +       struct typec_switch *typec_switch;
> +       struct typec_mux *typec_mux;
> +       struct typec_mux_state state;
> +       struct typec_altmode dp_alt;
> +
> +       struct work_struct work;
> +
> +       struct drm_bridge bridge;
> +
> +       enum typec_orientation orientation;
> +       u16 svid;
> +       u8 dp_data;
> +       u8 mode;
> +       u8 hpd_state;
> +       u8 hpd_irq;
> +};
> +
> +#define work_to_altmode(w) container_of((w), struct pmic_glink_altmode, enable_work)
> +
> +struct pmic_glink_altmode {
> +       struct device *dev;
> +
> +       unsigned int owner_id;
> +
> +       /* To synchronize WRITE_REQ acks */
> +       struct mutex lock;
> +
> +       struct completion pan_ack;
> +       struct pmic_glink_client *client;
> +
> +       struct work_struct enable_work;
> +
> +       struct pmic_glink_altmode_port ports[PMIC_GLINK_MAX_PORTS];
> +};
> +
> +static int pmic_glink_altmode_request(struct pmic_glink_altmode *altmode, u32 cmd, u32 arg)
> +{
> +       struct usbc_write_req req = {};
> +       unsigned long left;
> +       int ret;
> +
> +       /*
> +        * The USBC_CMD_WRITE_REQ ack doesn't identify the request, so wait for
> +        * one ack at a time.
> +        */
> +       mutex_lock(&altmode->lock);
> +
> +       req.hdr.owner = cpu_to_le32(altmode->owner_id);
> +       req.hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP);
> +       req.hdr.opcode = cpu_to_le32(USBC_CMD_WRITE_REQ);
> +       req.cmd = cpu_to_le32(cmd);
> +       req.arg = cpu_to_le32(arg);
> +
> +       ret = pmic_glink_send(altmode->client, &req, sizeof(req));
> +       if (ret) {
> +               dev_err(altmode->dev, "failed to send altmode request: %#x (%d)\n", cmd, ret);
> +               goto out_unlock;
> +       }
> +
> +       left = wait_for_completion_timeout(&altmode->pan_ack, 5 * HZ);
> +       if (!left) {
> +               dev_err(altmode->dev, "timeout waiting for altmode request ack for: %#x\n", cmd);
> +               ret = -ETIMEDOUT;
> +       }
> +
> +out_unlock:
> +       mutex_unlock(&altmode->lock);
> +       return ret;
> +}
> +
> +static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
> +                                        struct pmic_glink_altmode_port *port,
> +                                        u8 mode, bool hpd_state,
> +                                        bool hpd_irq)
> +{
> +       struct typec_displayport_data dp_data = {};
> +       int ret;
> +
> +       dp_data.status = DP_STATUS_ENABLED;
> +       if (hpd_state)
> +               dp_data.status |= DP_STATUS_HPD_STATE;
> +       if (hpd_irq)
> +               dp_data.status |= DP_STATUS_IRQ_HPD;
> +       dp_data.conf = DP_CONF_SET_PIN_ASSIGN(mode);
> +
> +       port->state.alt = &port->dp_alt;
> +       port->state.data = &dp_data;
> +       port->state.mode = TYPEC_MODAL_STATE(mode);
> +
> +       ret = typec_mux_set(port->typec_mux, &port->state);
> +       if (ret)
> +               dev_err(altmode->dev, "failed to switch mux to DP\n");
> +}
> +
> +static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *altmode,
> +                                         struct pmic_glink_altmode_port *port)
> +{
> +       int ret;
> +
> +       port->state.alt = NULL;
> +       port->state.data = NULL;
> +       port->state.mode = TYPEC_STATE_USB;
> +
> +       ret = typec_mux_set(port->typec_mux, &port->state);
> +       if (ret)
> +               dev_err(altmode->dev, "failed to switch mux to USB\n");
> +}
> +
> +static void pmic_glink_altmode_worker(struct work_struct *work)
> +{
> +       struct pmic_glink_altmode_port *alt_port = work_to_altmode_port(work);
> +       struct pmic_glink_altmode *altmode = alt_port->altmode;
> +
> +       typec_switch_set(alt_port->typec_switch, alt_port->orientation);
> +
> +       if (alt_port->svid == USB_TYPEC_DP_SID)
> +               pmic_glink_altmode_enable_dp(altmode, alt_port, alt_port->mode,
> +                                            alt_port->hpd_state, alt_port->hpd_irq);
> +       else
> +               pmic_glink_altmode_enable_usb(altmode, alt_port);
> +
> +       if (alt_port->hpd_state)
> +               drm_bridge_hpd_notify(&alt_port->bridge, connector_status_connected);
> +       else
> +               drm_bridge_hpd_notify(&alt_port->bridge, connector_status_disconnected);
> +
> +       pmic_glink_altmode_request(altmode, ALTMODE_PAN_ACK, alt_port->index);
> +};
> +
> +static enum typec_orientation pmic_glink_altmode_orientation(unsigned int orientation)
> +{
> +       if (orientation == 0)
> +               return TYPEC_ORIENTATION_NORMAL;
> +       else if (orientation == 1)
> +               return TYPEC_ORIENTATION_REVERSE;
> +       else
> +               return TYPEC_ORIENTATION_NONE;
> +}
> +
> +#define SC8180X_PORT_MASK              0x000000ff
> +#define SC8180X_ORIENTATION_MASK       0x0000ff00
> +#define SC8180X_MUX_MASK               0x00ff0000
> +#define SC8180X_MODE_MASK              0x3f000000
> +#define SC8180X_HPD_STATE_MASK         0x40000000
> +#define SC8180X_HPD_IRQ_MASK           0x80000000
> +
> +static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmode,
> +                                              const void *data, size_t len)
> +{
> +       struct pmic_glink_altmode_port *alt_port;
> +       const struct usbc_sc8180x_notify *msg;
> +       u32 notification;
> +       u8 orientation;
> +       u8 hpd_state;
> +       u8 hpd_irq;
> +       u16 svid;
> +       u8 port;
> +       u8 mode;
> +       u8 mux;
> +
> +       if (len != sizeof(*msg)) {
> +               dev_warn(altmode->dev, "invalid length of USBC_NOTIFY indication: %zd\n", len);
> +               return;
> +       }
> +
> +       msg = data;
> +       notification = le32_to_cpu(msg->notification);
> +       port = FIELD_GET(SC8180X_PORT_MASK, notification);
> +       orientation = FIELD_GET(SC8180X_ORIENTATION_MASK, notification);
> +       mux = FIELD_GET(SC8180X_MUX_MASK, notification);
> +       mode = FIELD_GET(SC8180X_MODE_MASK, notification);
> +       hpd_state = FIELD_GET(SC8180X_HPD_STATE_MASK, notification);
> +       hpd_irq = FIELD_GET(SC8180X_HPD_IRQ_MASK, notification);
> +
The kernel test robot keeps complaining about these FIELD_GET because
there is no #include <linux/bitfield.h>

> +       svid = mux == 2 ? USB_TYPEC_DP_SID : 0;
> +
> +       if (!altmode->ports[port].altmode) {
> +               dev_dbg(altmode->dev, "notification on undefined port %d\n", port);
> +               return;
> +       }
> +
> +       alt_port = &altmode->ports[port];
> +       alt_port->orientation = pmic_glink_altmode_orientation(orientation);
> +       alt_port->svid = mux == 2 ? USB_TYPEC_DP_SID : 0;
> +       alt_port->mode = mode;
> +       alt_port->hpd_state = hpd_state;
> +       alt_port->hpd_irq = hpd_irq;
> +       schedule_work(&alt_port->work);
> +}
> +
> +#define SC8280XP_DPAM_MASK     0x3f
> +#define SC8280XP_HPD_STATE_MASK BIT(6)
> +#define SC8280XP_HPD_IRQ_MASK  BIT(7)
> +
> +static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmode,
> +                                              u16 svid, const void *data, size_t len)
> +{
> +       struct pmic_glink_altmode_port *alt_port;
> +       const struct usbc_notify *notify;
> +       u8 orientation;
> +       u8 hpd_state;
> +       u8 hpd_irq;
> +       u8 mode;
> +       u8 port;
> +
> +       if (len != sizeof(*notify)) {
> +               dev_warn(altmode->dev, "invalid length USBC_NOTIFY_IND: %zd\n",
> +                        len);
> +               return;
> +       }
> +
> +       notify = data;
> +
> +       port = notify->payload[0];
> +       orientation = notify->payload[1];
> +       mode = FIELD_GET(SC8280XP_DPAM_MASK, notify->payload[8]) - DPAM_HPD_A;
> +       hpd_state = FIELD_GET(SC8280XP_HPD_STATE_MASK, notify->payload[8]);
> +       hpd_irq = FIELD_GET(SC8280XP_HPD_IRQ_MASK, notify->payload[8]);
> +
> +       if (!altmode->ports[port].altmode) {
> +               dev_dbg(altmode->dev, "notification on undefined port %d\n", port);
> +               return;
> +       }
> +
> +       alt_port = &altmode->ports[port];
> +       alt_port->orientation = pmic_glink_altmode_orientation(orientation);
> +       alt_port->svid = svid;
> +       alt_port->mode = mode;
> +       alt_port->hpd_state = hpd_state;
> +       alt_port->hpd_irq = hpd_irq;
> +       schedule_work(&alt_port->work);
> +}
> +
> +static void pmic_glink_altmode_callback(const void *data, size_t len, void *priv)
> +{
> +       struct pmic_glink_altmode *altmode = priv;
> +       const struct pmic_glink_hdr *hdr = data;
> +       u16 opcode;
> +       u16 svid;
> +
> +       opcode = le32_to_cpu(hdr->opcode) & 0xff;
> +       svid = le32_to_cpu(hdr->opcode) >> 16;
> +
> +       switch (opcode) {
> +       case USBC_CMD_WRITE_REQ:
> +               complete(&altmode->pan_ack);
> +               break;
> +       case USBC_NOTIFY_IND:
> +               pmic_glink_altmode_sc8280xp_notify(altmode, svid, data, len);
> +               break;
> +       case USBC_SC8180X_NOTIFY_IND:
> +               pmic_glink_altmode_sc8180xp_notify(altmode, data, len);
> +               break;
> +       }
> +}
> +
> +static int pmic_glink_altmode_attach(struct drm_bridge *bridge,
> +                                    enum drm_bridge_attach_flags flags)
> +{
> +       return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
> +}
> +
> +static const struct drm_bridge_funcs pmic_glink_altmode_bridge_funcs = {
> +       .attach = pmic_glink_altmode_attach,
> +};
> +
> +static void pmic_glink_altmode_put_mux(void *data)
> +{
> +       typec_mux_put(data);
> +}
> +
> +static void pmic_glink_altmode_put_switch(void *data)
> +{
> +       typec_switch_put(data);
> +}
> +
> +static void pmic_glink_altmode_enable_worker(struct work_struct *work)
> +{
> +       struct pmic_glink_altmode *altmode = work_to_altmode(work);
> +       int ret;
> +
> +       ret = pmic_glink_altmode_request(altmode, ALTMODE_PAN_EN, 0);
> +       if (ret)
> +               dev_err(altmode->dev, "failed to request altmode notifications\n");
> +}
> +
> +static void pmic_glink_altmode_pdr_notify(void *priv, int state)
> +{
> +       struct pmic_glink_altmode *altmode = priv;
> +
> +       if (state == SERVREG_SERVICE_STATE_UP)
> +               schedule_work(&altmode->enable_work);
> +}
> +
> +static const struct of_device_id pmic_glink_altmode_of_quirks[] = {
> +       { .compatible = "qcom,sc8180x-pmic-glink", .data = (void *)PMIC_GLINK_OWNER_USBC },
> +       {}
> +};
> +
> +static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
> +                                   const struct auxiliary_device_id *id)
> +{
> +       struct pmic_glink_altmode_port *alt_port;
> +       struct pmic_glink_altmode *altmode;
> +       struct typec_altmode_desc mux_desc = {};
> +       const struct of_device_id *match;
> +       struct fwnode_handle *fwnode;
> +       struct device *dev = &adev->dev;
> +       u32 port;
> +       int ret;
> +
> +       altmode = devm_kzalloc(dev, sizeof(*altmode), GFP_KERNEL);
> +       if (!altmode)
> +               return -ENOMEM;
> +
> +       altmode->dev = dev;
> +
> +       match = of_match_device(pmic_glink_altmode_of_quirks, dev->parent);
> +       if (match)
> +               altmode->owner_id = (unsigned long)match->data;
> +       else
> +               altmode->owner_id = PMIC_GLINK_OWNER_USBC_PAN;
> +
> +       INIT_WORK(&altmode->enable_work, pmic_glink_altmode_enable_worker);
> +       init_completion(&altmode->pan_ack);
> +       mutex_init(&altmode->lock);
> +
> +       device_for_each_child_node(dev, fwnode) {
> +               ret = fwnode_property_read_u32(fwnode, "reg", &port);
> +               if (ret < 0) {
> +                       dev_err(dev, "missing reg property of %pOFn\n", fwnode);
> +                       return ret;
> +               }
> +
> +               if (port >= ARRAY_SIZE(altmode->ports)) {
> +                       dev_warn(dev, "invalid connector number, ignoring\n");
> +                       continue;
> +               }
> +
> +               if (altmode->ports[port].altmode) {
> +                       dev_err(dev, "multiple connector definition for port %u\n", port);
> +                       return -EINVAL;
> +               }
> +
> +               alt_port = &altmode->ports[port];
> +               alt_port->altmode = altmode;
> +               alt_port->index = port;
> +               INIT_WORK(&alt_port->work, pmic_glink_altmode_worker);
> +
> +               alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
> +               alt_port->bridge.of_node = to_of_node(fwnode);
> +               alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
> +               alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
> +
> +               ret = devm_drm_bridge_add(dev, &alt_port->bridge);
> +               if (ret)
> +                       return ret;
> +
> +               alt_port->dp_alt.svid = USB_TYPEC_DP_SID;
> +               alt_port->dp_alt.mode = USB_TYPEC_DP_MODE;
> +               alt_port->dp_alt.active = 1;
> +
> +               mux_desc.svid = USB_TYPEC_DP_SID;
> +               mux_desc.mode = USB_TYPEC_DP_MODE;
> +               alt_port->typec_mux = fwnode_typec_mux_get(fwnode, &mux_desc);
> +               if (IS_ERR(alt_port->typec_mux))
> +                       return dev_err_probe(dev, PTR_ERR(alt_port->typec_mux),
> +                                            "failed to acquire mode-switch for port: %d\n",
> +                                            port);
> +
> +               ret = devm_add_action_or_reset(dev, pmic_glink_altmode_put_mux,
> +                                              alt_port->typec_mux);
> +               if (ret)
> +                       return ret;
> +
> +               alt_port->typec_switch = fwnode_typec_switch_get(fwnode);
> +               if (IS_ERR(alt_port->typec_switch))
> +                       return dev_err_probe(dev, PTR_ERR(alt_port->typec_switch),
> +                                            "failed to acquire orientation-switch for port: %d\n",
> +                                            port);
> +
> +               ret = devm_add_action_or_reset(dev, pmic_glink_altmode_put_switch,
> +                                              alt_port->typec_switch);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       altmode->client = devm_pmic_glink_register_client(dev,
> +                                                         altmode->owner_id,
> +                                                         pmic_glink_altmode_callback,
> +                                                         pmic_glink_altmode_pdr_notify,
> +                                                         altmode);
> +       return PTR_ERR_OR_ZERO(altmode->client);
> +}
> +
> +static const struct auxiliary_device_id pmic_glink_altmode_id_table[] = {
> +       { .name = "pmic_glink.altmode", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, pmic_glink_altmode_id_table);
> +
> +static struct auxiliary_driver pmic_glink_altmode_driver = {
> +       .name = "pmic_glink_altmode",
> +       .probe = pmic_glink_altmode_probe,
> +       .id_table = pmic_glink_altmode_id_table,
> +};
> +
> +module_auxiliary_driver(pmic_glink_altmode_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm PMIC GLINK Altmode driver");
> +MODULE_LICENSE("GPL");
> --
> 2.37.3
>
