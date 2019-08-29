Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0872AA1E11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 16:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbfH2O4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 10:56:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727662AbfH2O4q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 10:56:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C34B20644;
        Thu, 29 Aug 2019 14:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567090605;
        bh=+nvHSOdZr4xJ1e5vinkq3VTdhsvZDsCz3QUZnrSaWxk=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=RSF0QQcmiJyPsbHJK/wncWN8sRBCAIMxUuTW/UqrHQ8kA/YekY8cAkavKQ9YameXT
         ldxr38waevN5+qvU4bttJfzpZ9CfmmIoXFMjUbsluEe4sipmulTXluGU18n6iZM0mB
         BPlfhJhG5JV4JejpxfMMMTmvKJiMn9m/GQ9yf/LQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190829082759.6256-3-jorge.ramirez-ortiz@linaro.org>
References: <20190829082759.6256-1-jorge.ramirez-ortiz@linaro.org> <20190829082759.6256-3-jorge.ramirez-ortiz@linaro.org>
Cc:     niklas.cassel@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mbox: qcom: replace integer with valid macro
To:     agross@kernel.org, jassisinghbrar@gmail.com,
        jorge.ramirez-ortiz@linaro.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 29 Aug 2019 07:56:44 -0700
Message-Id: <20190829145645.9C34B20644@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jorge Ramirez-Ortiz (2019-08-29 01:27:59)
> Use the correct macro when registering the platform device.
>=20
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

