Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9DDFE5BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfKOTia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:38:30 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44967 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbfKOTia (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:38:30 -0500
Received: by mail-pf1-f194.google.com with SMTP id q26so7134780pfn.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=N3RglndAty+Q/Su9LZ87Avtb9ayjrGHyeAiCuksi9yI=;
        b=UtGcVOPwv+Sz7IoEtQf5f6u5Bwgm0baqY2Pm/LkCq5Y+myds1WEgPKSc/h4IFVnGfM
         4cJdrIwH0moWO54hBHgBqhBcFoRIB5Gi6eNmpMXxG108ONJdy3ibW5lS+7A3vvNUpUPU
         hnztaqL+IFnT/g0h1yPCraXD14WhOHqnkPB8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=N3RglndAty+Q/Su9LZ87Avtb9ayjrGHyeAiCuksi9yI=;
        b=jlepGqZNxQAIydcuLJFuWZpLJaZNNqtjFdp1DkR9l6oxk8lqlaM8gbbOdGOodLrSQ3
         9z4/+vbIUjxdSneX438yB2W9GqKkLWV5ESVLYiBpJKAiwWDvqfipDFU9HJi1x7cm4fla
         sfNzx2N+Pn1HvThx1o3//LIoi9d/YU7eFbeKOBpMQCLeCNVs6qPhyvWHoXm1qz+PByhQ
         TkZGvvfW31ncGotZ/MgHTA02PahblQgFbjZTivb9wpcEq5UNq6w/gd6LBsKHhxOCY/AS
         K+/95n4KuQBH3i08c2VuZIT7a+jKrFJzNRLg5GQujbYLVdvnQBLw3xnSR5k0X7cEudOg
         GzcA==
X-Gm-Message-State: APjAAAWSQqQqPyPeAfZyMvtKEJdNmde1tqIoTlbEsdE+IvYap8kdkzal
        /ogSro3VTt+oDC56VjsmeYk8FQ==
X-Google-Smtp-Source: APXvYqyIIQmbO8Jh5LsYVJAkG9qSWUVFtjTBJtmPW9PBcFmGXEA3YzAVQ7//IHl8Rf9YfaPCT7oA/A==
X-Received: by 2002:a63:395:: with SMTP id 143mr12694732pgd.93.1573846709916;
        Fri, 15 Nov 2019 11:38:29 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 82sm11338835pfa.115.2019.11.15.11.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:38:29 -0800 (PST)
Message-ID: <5dcefeb5.1c69fb81.757a7.0d4f@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <83394ae827ce7c123228b749bcae2a2c470e88a4.1573814758.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1573814758.git.saiprakash.ranjan@codeaurora.org> <83394ae827ce7c123228b749bcae2a2c470e88a4.1573814758.git.saiprakash.ranjan@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: msm: Rename cache-controller to system-cache-controller
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:38:28 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2019-11-15 02:59:11)
> DT schema checks for the node name 'cache-controller' and enforces
> that there has to be a cache-level associated with it. But LLCC is
> a system cache and does not have a cache-level property and hence
> the dt binding check fails. So let us rename the LLCC cache-controller
> to system-cache-controller which is the proper description and also
> makes the schema happy.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

