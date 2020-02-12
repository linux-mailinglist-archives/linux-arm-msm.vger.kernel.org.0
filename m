Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79DC815B36C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 23:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgBLWMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 17:12:33 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:36537 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbgBLWMd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 17:12:33 -0500
Received: by mail-il1-f193.google.com with SMTP id b15so3184706iln.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 14:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wdP0ovbmvDZYICvamxtqlMozHNpRomdhcvqsRnXUQX4=;
        b=VresCRs7yf8cbcowW6xFfScuoMordtYPvocPOGgkt/bPIgpHRVM/9mqFXzeGqUPm8B
         fzEbCFsUglJPKjsqx1S+BS2RbwUajDAmEnKKl9Ck+uVdICJs6q7yyT6ZJNI04OFcVZ6A
         af7oFXo7sM8ftd8b6CgpWgE4Gq2fNYTpdbWKf9KQMSBAatHRH4GED2NwxqIghtxCeo5E
         KuG9TSJldrgGFrWBi3KNzAdtka2zX09Z7JRzKzYLF4WCL9PJ5/GICJjfyTabuMD1LxbC
         /7HhEfbYYRx7CnvW1t5gusqLs2iuymJBqUw7d+wq2nfmY7QBae3V8YekmU3mdfyhR8+N
         yP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wdP0ovbmvDZYICvamxtqlMozHNpRomdhcvqsRnXUQX4=;
        b=FIehMJ/XfAyWmu50S4gwOC/2YwqUvVrd53FrHzvP/JwpNJSNWF+SZezOL6SHiOf3aR
         bXGFEl+dZcjuCSduyAfkJRICQv3G3RFFN3jPFo5SaL21FT3uxq0JIP3WThr2TFxM+H9F
         +7yXLbj1P4nB9lMH/wV8I0bnF7Neu19H4shUR8dXW/PARD8ltu1ZrXmbKpZ7z0hr97mh
         Y3CfywBtXNgGoehhyCWNiLQq2a1PC8S6YEtEufo/2hE4Em/eVoKrv0qS5w6mtrNJLIL1
         WZ8t8PXFAG4nhM1EsZM7CRng0knEQ0cKpmqbCt3ilVhWoV8IR7lXeWUDAuGmxZqa9FbS
         uVSA==
X-Gm-Message-State: APjAAAXEo2QudEYzU+zbII7u/4YBeqY1VOsltrAztGVqGRolDTO5Ahnh
        RWAiIZXczjtJffmUB9bvrHvcyN1fXMqM1Oz80vPszg==
X-Google-Smtp-Source: APXvYqypi6T4y7kMEvHg1Wp3t1NjZK6kQRjwYnUxOcPiraf/Rq4rl1Q7RmE+/7ISPHkiwPO2rJG+YhCvwacW4+TI/18=
X-Received: by 2002:a92:9f1a:: with SMTP id u26mr13534880ili.72.1581545552462;
 Wed, 12 Feb 2020 14:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20200210213924.20037-1-mike.leach@linaro.org> <20200210213924.20037-12-mike.leach@linaro.org>
 <20200211115852.GA52147@bogus>
In-Reply-To: <20200211115852.GA52147@bogus>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Wed, 12 Feb 2020 15:12:21 -0700
Message-ID: <CANLsYkxOK+21JutM7ryz1ux0gHBTa51q5r-9i18kFLvMKouShA@mail.gmail.com>
Subject: Re: [PATCH v9 11/15] dt-bindings: arm: Juno platform - add CTI
 entries to device tree.
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>, maxime@cerno.tech,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>, Jon Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 Feb 2020 at 04:59, Sudeep Holla <sudeep.holla@arm.com> wrote:
>
> On Mon, Feb 10, 2020 at 09:39:20PM +0000, Mike Leach wrote:
> > Add in CTI entries for Juno r0, r1 and r2 to device tree entries.
> >
>
> I can take this patch alone unless you have plans to take all in go.

Please hang on to it for the moment.  I'll get back to you if/when we
decide to move forward with this set.

Thanks,
Mathieu

>
> --
> Regards,
> Sudeep
