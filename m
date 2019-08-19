Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9164C94C37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2019 19:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbfHSR7i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Aug 2019 13:59:38 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32950 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbfHSR7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Aug 2019 13:59:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id g2so1610484pfq.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2019 10:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=SJOOj6olxFQRqjrRfjeJgYnys/AXxatkSyB1FQQ9L/Q=;
        b=XR6mmmgNNI2WavLy9/anETqmroNgKCK8LiC4+iFowHiVpZgmWbqyiEYy9IPM1CcHDK
         bHb3Kgtya/1X7BARqYZEzum94Cj+ENuckx2Ja7F71V9iahCof6NgLEyzxBnu3Ia0hFeH
         IGHW1m15ZLmZdnJmziTSdGSEmVpcxmMARdMdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=SJOOj6olxFQRqjrRfjeJgYnys/AXxatkSyB1FQQ9L/Q=;
        b=MlcPnQK7804rA017T/rCJpeCQtwDzLnSJEA6QOMDmy7ZMMl4lH5aMArLS76h9di8Pw
         KQU/ThEw0+vQ+fdJYHcKrCcbCNPOdGQOJXlWIDRzDi0uApdtoi9QrPL4heZvYfaRAoFF
         7YPmuj1rjlHtMqGGpNo11GL72Ik7+qVWugDyogu7fZlXrWUhgPpBO0qq8RCeaRoUNh9Q
         Tn82nenvKw77NYx+2v9xwGSiQtUxbyDpA0EPeWhGNGgeiPh/hf5vhWQZt/5Hmc513lds
         x6o48HVjRLuhEKCAJV6kmkNrN++hRr75bJdkK77JHjYQB8x+H00r837fki49rV+R+UtQ
         tTRw==
X-Gm-Message-State: APjAAAVB43MQY2U7pAWQlM6ZaaGrPCCkJlrruiC5GKinOyVa6oekEIBR
        o4o/RQwPgPUQMhqyybCQihD13R8EzTZhog==
X-Google-Smtp-Source: APXvYqzTOYVM7Zk78xk9eKa8c8LP/wSZ2lxqVDb2CVkjo0gNjyjiFXmm7q3184wtTzkvQK+Otp9tCw==
X-Received: by 2002:a17:90a:c20e:: with SMTP id e14mr23074735pjt.0.1566237578018;
        Mon, 19 Aug 2019 10:59:38 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id ck8sm13839498pjb.25.2019.08.19.10.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 10:59:37 -0700 (PDT)
Message-ID: <5d5ae389.1c69fb81.cb730.3225@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190819100957.17095-1-niklas.cassel@linaro.org>
References: <20190725104144.22924-7-niklas.cassel@linaro.org> <20190819100957.17095-1-niklas.cassel@linaro.org>
Subject: Re: [PATCH v3 06/14] dt-bindings: cpufreq: qcom-nvmem: Support pstates provided by a power domain
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Nishanth Menon <nm@ti.com>, Viresh Kumar <vireshk@kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 19 Aug 2019 10:59:36 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Niklas Cassel (2019-08-19 03:09:57)
> +
> +soc {
> +....
> +       cprpd: cpr@b018000 {

Maybe node name should be 'avs' for the industry standard adaptive
voltage scaling acronym?


> +               compatible =3D "qcom,qcs404-cpr", "qcom,cpr";
> +               reg =3D <0x0b018000 0x1000>;
> +               ....
> +               vdd-apc-supply =3D <&pms405_s3>;
> +               #power-domain-cells =3D <0>;
