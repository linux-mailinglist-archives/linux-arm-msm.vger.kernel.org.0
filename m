Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 890C314FB76
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2020 05:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgBBEl4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Feb 2020 23:41:56 -0500
Received: from mail-pf1-f176.google.com ([209.85.210.176]:45914 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgBBEl4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Feb 2020 23:41:56 -0500
Received: by mail-pf1-f176.google.com with SMTP id 2so5660221pfg.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2020 20:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:subject:to:cc:user-agent:date;
        bh=H12+mHAIL3bb+dr51PEHEZZsNDqvfJx+5YVGqZOlIqM=;
        b=W5dSLRFIZDasi2ZLWn6GgNC7sX8MGtmEFZNWKCJEsFT6QnVU5QO/HMBRn3UmnFMwah
         0c0UqKk4IJA0yKpbuKsWSPeBYdmgJVIL5EqGxl4qjIuEM1YkvfyR+5+scSlJvdK6HSUZ
         SYc4puNrwGTpUmg8BQtNAfjxntKMuVlTW8H5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:subject:to:cc
         :user-agent:date;
        bh=H12+mHAIL3bb+dr51PEHEZZsNDqvfJx+5YVGqZOlIqM=;
        b=FdeBaolYJatY8Y7CE/pmHlO+2z2Xo4M9uoMjyCNRwhsIE6naQ3Mi+/sAcM3vtZtqrf
         7AJ6QNmZjdn2LoXS8SnNU5CAkM24lcXoJe4TSP08VHdUbgQ96vz5cDv5nYOio8/vO7O3
         Ws5Cq9ZC+r92jFqCN+Z9vUqByFXL2M69/cdyMVGUKGyp4RmK3KCYmetY1yQCwPabnz/H
         sfL68vEc2pqr1INEfJM7lzvlzVXZpVSTjyMIrlgFMp+0/h9b0HGW840g5Uxt01pqUfp+
         3y6SQLXfCK8fqHRMOCUgCjVgHgfIKKyRbOasCiRVOO06ol/3Z0fvZ3sVDJY8wyXba+CR
         9pzA==
X-Gm-Message-State: APjAAAUrS7W0dh6IfCut9627PyBO+gfNY/qC/wdlIgOfQ0hj7J4KBVSS
        RagMzlhnhs7pQtEdTf4N8QypN+6uS2OiRA==
X-Google-Smtp-Source: APXvYqxWj4RW/5Bk7AHjnHF/W7VHqk96YwJGSAMNrtEvaEZ6lz2Ds+BjrwBXQxmcbz0eS8CS+qsqjg==
X-Received: by 2002:aa7:96b6:: with SMTP id g22mr5878006pfk.206.1580618515603;
        Sat, 01 Feb 2020 20:41:55 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q21sm15215761pff.105.2020.02.01.20.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2020 20:41:55 -0800 (PST)
Message-ID: <5e365313.1c69fb81.5bf81.9c29@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2edca4b54ee6b33493e0427c17de983d3ce3012f.1580570160.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org> <2edca4b54ee6b33493e0427c17de983d3ce3012f.1580570160.git.saiprakash.ranjan@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCHv2 1/2] dt-bindings: watchdog: Convert QCOM watchdog timer bindings to YAML
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        devicetree@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Sat, 01 Feb 2020 20:41:54 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2020-02-01 07:29:48)
> Convert QCOM watchdog timer bindings to DT schema format using
> json-schema.
>=20
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

