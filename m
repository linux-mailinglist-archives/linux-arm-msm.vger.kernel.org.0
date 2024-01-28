Return-Path: <linux-arm-msm+bounces-8680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2FF83F422
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 06:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FD6D1C212C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 05:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DCA2D51A;
	Sun, 28 Jan 2024 05:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IaOGoWzz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0C2D50F
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 05:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706420366; cv=none; b=LskU2TzptG+mr/GoPUtWPgpjK8NUNYgbbM019mmBDWFJRkKNohopV609KNJ9AMi7wutoYc5XxuqWzUfKpCNnPAZf+Nm22/4IJy11jj+UGedGP57dy5a9woabCJR96bItjnooKXQi6FDL9Y13nMNhH1JdjoR34C2FYF4TagY5qWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706420366; c=relaxed/simple;
	bh=I7jBECL0756V+IRohJ968sfpim24qZQWQY3Kb2FVXOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kj4mdChsch+jliLl621V1pytZicqUpFP0uFuxnHi7dvv/e7BEu6ws9x90Y4TEggeGMY2ZCgFGvPhhCqEKC1lLJUY0F/fItX9p2ws0X5g1nPIDgffK4fzIjmL8GlIlJ/NgKaglr/kMGSidIpDVHDJz3zx5rg/4MZZn66NuxPp9w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IaOGoWzz; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so1411704276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 21:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706420363; x=1707025163; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UD7q/y/zZ/nesDJ3qv83TUDsiRY8bFKW1PYUjUz0t/M=;
        b=IaOGoWzzQdRQftC4WQp9OZSAYZ0G507cb6/2OkQk39PdJe9Zs8bQS1Mi+STxR7FP59
         Eqt046TFxhOHs8cD0HRsGiOJqK6cJ6iIUsBX9U9d8jPF4brzGUzg2bb6kqrgSruTVQ4O
         ZDFWH1l5HKCbV3k+LZjqsvp8zj2lJsGYDKeThAUveFKTXEs7onSchmyy1pvee0avW0La
         ymlGckjWCEyLRehKq5pAGQZtM3/Nxaw4aBmU13ktu5t+hrWHzi19jkPRbiTrfYTnOcsv
         KPOzcOuOjeYD5tu6MpkxzeVvZbknO+Xad7aCuJ8qIgToczbT05uY02nitoQ0woznWI7D
         7TTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706420363; x=1707025163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UD7q/y/zZ/nesDJ3qv83TUDsiRY8bFKW1PYUjUz0t/M=;
        b=Aj6ZPOp/ADiAsp3fHauGBDsWR1UTyKCkmooZdVV3o0thTBI2xr6g+mQ1wnlocoRfL0
         42I4mrG3CLiaRSKf+Zt3bSwTKP/3qjnpBtNs3cfakkJTYcPwjQdfYbi3VQVcOqPO7jKu
         vIdiu1fymUm7z9zIYpQwjwwFbp3pKpU27NynR+lEPLdt9I6++GrMpsuyPJXvlm7VQRU6
         IE3o1aBQ3rCX8Yu3eq7ra/7OpATlzUZtJ9QeZ+xnBDDNFo9ll5H+M5Red82bHcOfNYvN
         lbtpaiOkx0XW7TqwAh7oQrEpYC5x4HVp70j5s4LEd7P7b1PsgWb1tmeN5orYlclD20o/
         bmEQ==
X-Gm-Message-State: AOJu0YyQdBQm8Vwl/4ftB8tEyZeyKwEkPgkS8Cx+Si2JCNXf3bqMicOw
	EX1EiKeoPtZ2hZFWt2ljG9LM+xbzCx5KdUzjQlkYs2QFbt4NWvn6/bbIOxMgrTSwdBxjo4GD2QC
	C/s5wnAsdl6r7767eKIaOBOA7mn2lxPbhYIFQVw==
X-Google-Smtp-Source: AGHT+IHsWcaq/dNOaxDY7WHKON/tOZyo1ojshd+Sjx1ojPyQuaFFT+9OG3UV9udL8JToW8vmgktisZ6HA2+oIx3ttPc=
X-Received: by 2002:a0d:e68f:0:b0:602:9c33:f315 with SMTP id
 p137-20020a0de68f000000b006029c33f315mr1793167ywe.82.1706420363152; Sat, 27
 Jan 2024 21:39:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-12-quic_parellan@quicinc.com> <d94434ec-00fd-489f-98f2-8c811522ff82@linaro.org>
 <11c6fdbe-f85a-088d-92df-abd8405c966b@quicinc.com>
In-Reply-To: <11c6fdbe-f85a-088d-92df-abd8405c966b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 07:39:12 +0200
Message-ID: <CAA8EJprPziRHhxVK9mAdQZNEeon9q95ZMKSBhs-s95O-7W10NA@mail.gmail.com>
Subject: Re: [PATCH 11/17] drm/msm/dp: add VSC SDP support for YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
	swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
	quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
	neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 07:34, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
>
> On 1/25/2024 1:48 PM, Dmitry Baryshkov wrote:
> > On 25/01/2024 21:38, Paloma Arellano wrote:
> >> Add support to pack and send the VSC SDP packet for DP. This therefore
> >> allows the transmision of format information to the sinks which is
> >> needed for YUV420 support over DP.
> >>
> >> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_catalog.c | 147 ++++++++++++++++++++++++++++
> >>   drivers/gpu/drm/msm/dp/dp_catalog.h |   4 +
> >>   drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
> >>   drivers/gpu/drm/msm/dp/dp_panel.c   |  47 +++++++++
> >>   drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
> >>   5 files changed, 205 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> index c025786170ba5..7e4c68be23e56 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >> @@ -29,6 +29,9 @@
> >>     #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
> >>   +#define DP_GENERIC0_6_YUV_8_BPC        BIT(0)
> >> +#define DP_GENERIC0_6_YUV_10_BPC    BIT(1)
> >> +
> >>   #define DP_INTERRUPT_STATUS1 \
> >>       (DP_INTR_AUX_XFER_DONE| \
> >>       DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
> >> @@ -907,6 +910,150 @@ int dp_catalog_panel_timing_cfg(struct
> >> dp_catalog *dp_catalog)
> >>       return 0;
> >>   }
> >>   +static void dp_catalog_panel_setup_vsc_sdp(struct dp_catalog
> >> *dp_catalog)
> >> +{
> >> +    struct dp_catalog_private *catalog;
> >> +    u32 header, parity, data;
> >> +    u8 bpc, off = 0;
> >> +    u8 buf[SZ_128];
> >> +
> >> +    if (!dp_catalog) {
> >> +        pr_err("invalid input\n");
> >> +        return;
> >> +    }
> >> +
> >> +    catalog = container_of(dp_catalog, struct dp_catalog_private,
> >> dp_catalog);
> >> +
> >> +    /* HEADER BYTE 1 */
> >> +    header = dp_catalog->sdp.sdp_header.HB1;
> >> +    parity = dp_catalog_calculate_parity(header);
> >> +    data   = ((header << HEADER_BYTE_1_BIT) | (parity <<
> >> PARITY_BYTE_1_BIT));
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_0, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    /* HEADER BYTE 2 */
> >> +    header = dp_catalog->sdp.sdp_header.HB2;
> >> +    parity = dp_catalog_calculate_parity(header);
> >> +    data   = ((header << HEADER_BYTE_2_BIT) | (parity <<
> >> PARITY_BYTE_2_BIT));
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
> >> +
> >> +    /* HEADER BYTE 3 */
> >> +    header = dp_catalog->sdp.sdp_header.HB3;
> >> +    parity = dp_catalog_calculate_parity(header);
> >> +    data   = ((header << HEADER_BYTE_3_BIT) | (parity <<
> >> PARITY_BYTE_3_BIT));
> >> +    data |= dp_read_link(catalog, MMSS_DP_GENERIC0_1);
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >
> > This seems to be common with the dp_audio code. Please extract this
> > header writing too.
> These are two different sdp's. audio and vsc, are different with
> different registers being written to and different amount of registers
> being set. Can you please clarify since in audio we only need 3
> registers to write to, and in vsc we need 10.

Bitmagic with the header is the same. Then the rest of the data is
written one dword per register, if I'm not mistaken.

> >
> >> +
> >> +    data = 0;
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_2, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >
> > Generally this is not how these functions are expected to be written.
> > Please take a look at drivers/video/hdmi.c. It should be split into:
> > - generic function that packs the C structure into a flat byte buffer,
> > - driver-specific function that formats and writes the buffer to the
> > hardware.
> >
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_3, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_4, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_5, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    switch (dp_catalog->vsc_sdp_data.bpc) {
> >> +    case 10:
> >> +        bpc = DP_GENERIC0_6_YUV_10_BPC;
> >> +        break;
> >> +    case 8:
> >> +    default:
> >> +        bpc = DP_GENERIC0_6_YUV_8_BPC;
> >> +        break;
> >> +    }
> >> +
> >> +    /* VSC SDP payload as per table 2-117 of DP 1.4 specification */
> >> +    data = (dp_catalog->vsc_sdp_data.colorimetry & 0xF) |
> >> +           ((dp_catalog->vsc_sdp_data.pixelformat & 0xF) << 4) |
> >> +           (bpc << 8) |
> >> +           ((dp_catalog->vsc_sdp_data.dynamic_range & 0x1) << 15) |
> >> +           ((dp_catalog->vsc_sdp_data.content_type & 0x7) << 16);
> >> +
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_6, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    data = 0;
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_7, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);
> >> +
> >> +    dp_write_link(catalog, MMSS_DP_GENERIC0_8, data);
> >> +    memcpy(buf + off, &data, sizeof(data));
> >> +    off += sizeof(data);


-- 
With best wishes
Dmitry

