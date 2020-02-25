Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3ACF16EDDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 19:21:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731504AbgBYSU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 13:20:57 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39724 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727983AbgBYSU5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 13:20:57 -0500
Received: by mail-pl1-f194.google.com with SMTP id g6so125328plp.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2020 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=hLhapTDfld6iYI26Uu6G+l7v9cDuHGrJIIJjSJQbaF0=;
        b=JwVcQCUPFlIUvWpdOmzQ8TWSzcPecioUjGp6wuHwhYsuzyG4T2wTKmoMS+zgE8OZUp
         eB6hqXY7/01wMsuCD/Py+7SA3imsfiVDKSUnX/JqS6Y4lmYTswLbXV0ZDVc0vlMIFpL4
         mKUI+5C9c9n6rvb+ts/lABP89VoluYjZ5+cJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=hLhapTDfld6iYI26Uu6G+l7v9cDuHGrJIIJjSJQbaF0=;
        b=AVuomCElZ/SGFQksdMvqqArrZuG6py+TGiTH6QdaweWN4+jXr0cc5hbwQ0zMpeXoZe
         4q2QDqALs3sQucIAQ3v2fOACXx0godEzfZFY44cxoN2PISf++EvGiwX7TGXd6JcWk89J
         bQx6AY/8Mn5abPfp7+Xp2SdMTXeEzaCJzyG3Rec2RReZwi18m8doQ2Fu+UaCgPbXjfa3
         1JgTHq3VW5L+oI209uQ9imR6v2q8FPEAUTWMzJkQprBrakgWye6J1/96Tp204/CaGMVe
         4TSusxMOGiedRNYjwF/i6F2QX3U5nS52+xHecnbUTYkJTiaH/T2fGTBp5weOygY+0axZ
         JhYw==
X-Gm-Message-State: APjAAAV/u+E9nOFs2fc1ixaqdBaGaMSlANrVbJ+IS14dbMHIJog7KyZ3
        wGW7j/Zmy3YdU3/IHcLSQDMvIKQ6Mgk=
X-Google-Smtp-Source: APXvYqw7MPpCUgHd0aakZ48hbazK/k6ob6ZjUXGFwU1wNp1VvIIRJhEPmczKQIjk0wSyeSfyNcREjw==
X-Received: by 2002:a17:90a:f88:: with SMTP id 8mr331916pjz.72.1582654856135;
        Tue, 25 Feb 2020 10:20:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c15sm8175668pgk.66.2020.02.25.10.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 10:20:55 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581932212-19469-2-git-send-email-akashast@codeaurora.org>
References: <1581932212-19469-1-git-send-email-akashast@codeaurora.org> <1581932212-19469-2-git-send-email-akashast@codeaurora.org>
Subject: Re: [PATCH V4 1/3] dt-bindings: geni-se: Convert QUP geni-se bindings to YAML
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, agross@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Date:   Tue, 25 Feb 2020 10:20:54 -0800
Message-ID: <158265485474.177367.9818999192157425774@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2020-02-17 01:36:50)
> Convert QUP geni-se bindings to DT schema format using json-schema.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
