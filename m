Return-Path: <linux-arm-msm+bounces-13887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0846A878C18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 02:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6D501C20A1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 01:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382B2567D;
	Tue, 12 Mar 2024 01:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2W6YfP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D87C524F
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 01:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710205410; cv=none; b=gWUlQXKkT3YIPLp1cMRoX/qtKIO3Ggw7MlD6CIyF01u2OsnyAbfrvRVED2iu38mD0GMbNz/DPiR1SF7nFdhHjKdQ7fH79RwUEzeVS8Dk+cwOeQ3zvKBUbayvMnSrGugnYRo6cMrFgVkZc7vFpdtDkdSTc+LrE7fZ0LnH3Kvk24s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710205410; c=relaxed/simple;
	bh=mllAJVdUnscH65M6A/IFWXfzMztwOkscsI91LkruZpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pLu8orkd1Sr+skEYWTek8gTnXx5BPcB7tu2x0coOnC3Zij7Qy9NmzScEas/wac5QXdBxyCX2suAVPnpF1qKbEW6N7tAQd/5sXE1EBzOhNurEWQmBk8zc1ArAMqUIiqsJ3//BiG5KS0FOFYpp2pTW+gGI8+NnzCdHG4dnEriRtcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2W6YfP2; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dd045349d42so4612415276.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 18:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710205407; x=1710810207; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ws7LKeep8xs071G+zIEyu5NMNq4g7+CkOu+MrT6LYWg=;
        b=c2W6YfP26OTHUrF8R42hXL9bKkkeXj2BlY94TM4k7z3orfBIqcwV4+7wT5LH+zs0hE
         USFtmTAk0DzOKDaF1BycrkfHCrtFnJw3MNQFBKm3MIySfbOr6eHaAtF5gyeR2z7u0gO9
         bDYpsC2n8m3XESYOtZPzGekmbzOXpLL19prw771XoIeT7fWgmj84xmo2bPgntcI/6rLZ
         8Nwh3oO+cP+rwLdcfQJycOZO4GqrORnrkpBLrLon4OxvCKYMQL1Lb77NixC4NJQRTUz2
         akQOppuQNIBUIqYSnp4r6OHxwoS8DEHurbrS52m3D50IOMDExF3+8FXKDIVl1Z0t+wz7
         vpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710205407; x=1710810207;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ws7LKeep8xs071G+zIEyu5NMNq4g7+CkOu+MrT6LYWg=;
        b=oCuvlmzy2AQPD33zjQOnC9/lEUU8jVfcY+aGqSRPWo0Uz6NOVm7TALjVtY6tnD7WiN
         xvj9c0ZAAJki22V0laAbmB3AuEEyIjAw2TDn6BjsOxbClTPtK2fbp0Pb8BSsf2hqBMGj
         VkIjn1tz6PBCdf5YPg2z+MIYaRsv8X6Pd25jfvxWZBcwU6ODeSbNlGkJ3rU1c96o30oq
         neMO+2nGucJVpDuxyoIDbIOs0xa0pl3yrWEdzsBEymk3IZQKLkFHqn29RbITTL4rS4HP
         XWUt+V1z+Vhd5V5FAT9vZQA4nIlsxiwQTVcpQVjoN9f7/1Cjf+AQGfUfHooC8tjjfUtY
         UcPw==
X-Forwarded-Encrypted: i=1; AJvYcCXX5stvm5bR9Oj9zg6kG8J9xDSW+dL+0dwQHtpkMusoAnUXwEVogKBNAN6txbNQDDCossNxC1C/30UfHDHuVntSHB0pUSnXnYqhikQ1Mg==
X-Gm-Message-State: AOJu0Yyow9xu4wsm9WmpoqExMJ7IFhO2QZbhlN5KbORnrq6AT5zHHqe9
	tUKBwlfG/N3JMTQa8MEhLiuiWmL0sxFWuZM4df2WDwI7eb+M2G8WMLDzypEcLeO07pZ0uMaRXQ9
	OVxdGWngfS1pPF1IALhzu20S6jXUeuULN53CXuw==
X-Google-Smtp-Source: AGHT+IGnbKO6H0C20S0kebFSx0qWkvqE68K5N495YSoxog7GKNvUgRkw3+0e9zY2XmsTV7V2X6VEfkR4TsptJ1mwCpc=
X-Received: by 2002:a25:ad10:0:b0:dcc:9e88:b15 with SMTP id
 y16-20020a25ad10000000b00dcc9e880b15mr346522ybi.41.1710205407500; Mon, 11 Mar
 2024 18:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-2-24679cca5c24@linaro.org> <05b640a9-c5e4-4140-95dd-9b35269d85cd@linaro.org>
In-Reply-To: <05b640a9-c5e4-4140-95dd-9b35269d85cd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Mar 2024 03:03:17 +0200
Message-ID: <CAA8EJprNMGRXXY_sehehfSyZrHc3NN=C5fG6o5wYDpDzr4KQ=g@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] soc: qcom: qmi: add a way to remove running service
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Mar 2024 at 02:53, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 3/11/24 16:34, Dmitry Baryshkov wrote:
> > Add qmi_del_server(), a pair to qmi_add_server(), a way to remove
> > running server from the QMI socket. This is e.g. necessary for
> > pd-mapper, which needs to readd a server each time the DSP is started or
> > stopped.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/soc/qcom/qmi_interface.c | 67 ++++++++++++++++++++++++++++++++++++++++
> >   include/linux/soc/qcom/qmi.h     |  2 ++
> >   2 files changed, 69 insertions(+)
> >
> > diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
> > index bb98b06e87f8..18ff2015c682 100644
> > --- a/drivers/soc/qcom/qmi_interface.c
> > +++ b/drivers/soc/qcom/qmi_interface.c
> > @@ -289,6 +289,73 @@ int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
> >   }
> >   EXPORT_SYMBOL_GPL(qmi_add_server);
> >
> > +static void qmi_send_del_server(struct qmi_handle *qmi, struct qmi_service *svc)
> > +{
> > +     struct qrtr_ctrl_pkt pkt;
> > +     struct sockaddr_qrtr sq;
> > +     struct msghdr msg = { };
> > +     struct kvec iv = { &pkt, sizeof(pkt) };
> > +     int ret;
> > +
> > +     memset(&pkt, 0, sizeof(pkt));
>
> 0-init instead?
>
> > +     pkt.cmd = cpu_to_le32(QRTR_TYPE_DEL_SERVER);
> > +     pkt.server.service = cpu_to_le32(svc->service);
> > +     pkt.server.instance = cpu_to_le32(svc->version | svc->instance << 8);
> > +     pkt.server.node = cpu_to_le32(qmi->sq.sq_node);
> > +     pkt.server.port = cpu_to_le32(qmi->sq.sq_port);
>
> Or perhaps C99-init?

This follows 1:1 qcom_send_add_server(). I don't think we should use
new style just for this function.

>
> Konrad



-- 
With best wishes
Dmitry

