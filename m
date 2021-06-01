Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5283979F5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 20:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbhFASXP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 14:23:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:39392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234669AbhFASXO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 14:23:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22F8A613D1;
        Tue,  1 Jun 2021 18:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622571692;
        bh=WCvmopvn8NKTLZa7yvI8fd++Q5lcQwPG9i++6GaJ9Ro=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JFVNRSnvSudGB38z/iVFL4Uyq9bUhrF8OlUlKlSgWkt56ZutI7l9FPbAwyA6zyfrQ
         i5rLDmG5ZKGiQ9kxpdpHwwOUOKFJKFnNUvHe8GnK1BPlBEqO6iOBG/FutyhY7ZLq0Y
         7C06Ij+1X1fFAUzsHY9AZ4f7PkxHMitcaFzXuygumiC9OuCjrpNlTllZYzxMeQYXvt
         sdBLw656sjezjaXXDTujRoYdQM1miGuQw5ezZ/gs7oV/s1wVGwE1Pm7UoL7LUng/hG
         yPBdAcf3tTUE3P5St6OmIcIitoGGX9IqjIphJhI/1yFe0kBnUwz9mcCg1+W921FBkA
         jtnYpWYmHHzXQ==
From:   Will Deacon <will@kernel.org>
To:     bjorn.andersson@linaro.org, mark.rutland@arm.com,
        agross@kernel.org, YueHaibing <yuehaibing@huawei.com>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH -next] perf: qcom: use DEVICE_ATTR_RO macro
Date:   Tue,  1 Jun 2021 19:21:07 +0100
Message-Id: <162255378983.566770.16862230780435997005.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210528014749.24068-1-yuehaibing@huawei.com>
References: <20210528014749.24068-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 28 May 2021 09:47:49 +0800, YueHaibing wrote:
> Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.

Applied to will (for-next/perf), thanks!

[1/1] perf: qcom: use DEVICE_ATTR_RO macro
      https://git.kernel.org/will/c/ccbe14ce8828

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
