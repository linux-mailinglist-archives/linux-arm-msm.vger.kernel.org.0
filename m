Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 035F9F1E42
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 20:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731866AbfKFTK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 14:10:56 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37906 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731529AbfKFTKz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 14:10:55 -0500
Received: by mail-pg1-f194.google.com with SMTP id 15so4605411pgh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Nov 2019 11:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:to:cc:user-agent:date;
        bh=bvzyaeqQgm+ODV2zn40NLUNXtHBkt8JdlUL5UNv0l4w=;
        b=I1Z9vGAwk25jlQ11dQZp3amW+1dHSKt8UAg1cVjghjAnP4X5P59EHC1lm3jAKHU/p/
         V6achbPb6JpUnOhCVoWt+ITiJ1+2q/5WeovtoXNJQpBXFXEqRfhyawEotr9dlCcEACJV
         VUW313cPgbNYZhABbSZ7DgkvoyCQgvDLA3prs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:to:cc
         :user-agent:date;
        bh=bvzyaeqQgm+ODV2zn40NLUNXtHBkt8JdlUL5UNv0l4w=;
        b=o+BMR1AoHEjGkHAN/Ypo3xUVltM8kKqV7Cu8M99VIvbvrkx+Bw9IQ/GJDKDc6kmxir
         KAlwAVEzy0fqyigzUUv0jpRy0I/i6BSApm4Jlqu9IiylT9tgcZmHEURVoJc6j46iooR2
         S8LROTjxoTGnvCeXznbCCPTnXvVLDelmxF3I8PcbJoWgUDEnc7HpuIraI5fbtHCzLzhk
         G9Rsv+WPkUYbVfMPidrQNSMIDa0AcJ9GUq4JVzXApc9ufmJ4G5pEen+Wq7SKvB2V0AVY
         bhW2WU/1KYBgfQigCIzE8BhdVN7PHq5f38A5jmqdN/uVNPgekpV1D6JivzJ8Qfdfok7b
         8J7Q==
X-Gm-Message-State: APjAAAWK2i6N0K9jQcisXTcXbODsfxvNo/msUD0LOxJI8dtmdWr/f/f9
        rnUSLLqHB63hgPFdZU+uv8U7KA==
X-Google-Smtp-Source: APXvYqySU0SqbmsExE8w0VMB5UDSw5bGW97FD8SWOT1NMVBReEti1N8fzmDu5SWW9saMQ0Muy549Qg==
X-Received: by 2002:a63:1743:: with SMTP id 3mr4910114pgx.161.1573067455077;
        Wed, 06 Nov 2019 11:10:55 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q13sm3841834pjq.0.2019.11.06.11.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 11:10:54 -0800 (PST)
Message-ID: <5dc31abe.1c69fb81.1da16.a8b4@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191106065017.22144-8-rnayak@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org> <20191106065017.22144-8-rnayak@codeaurora.org>
Subject: Re: [PATCH v4 07/14] drivers: irqchip: qcom-pdc: Move to an SoC independent compatible
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Marc Zyngier <maz@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 11:10:53 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajendra Nayak (2019-11-05 22:50:10)
> Remove the sdm845 SoC specific compatible to make the driver
> easily reusable across other SoC's with the same IP block.
> This will reduce further churn adding any SoC specific
> compatibles unless really needed.
>=20
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

