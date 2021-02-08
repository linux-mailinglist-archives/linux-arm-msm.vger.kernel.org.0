Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD93C313CB6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 19:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbhBHSIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 13:08:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:49430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235434AbhBHSGU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 13:06:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1864764D92;
        Mon,  8 Feb 2021 18:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807427;
        bh=5t8LE5B5cl9x35acYxIG26h7fCdi/mBXYgEGAmf26/c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VpgU+z1YUVoCtHSeNAi/lp9I0iO360kDYfJup87+3GNujuosIBIFtwTBTpO6WPYVd
         BprJMfhjLVyqmpCOakqDEap1gW0tPFK3qkFcuC49tCIQ7aSx5iKBmdObE5XeZctzxn
         Js5xEQi929DPHMPiivUnIdzRUPl9l/MPardqPKFbLFyjpbsU01x5LufdX4MFFbfV+q
         Qyp3nb62DvO5QY6DBavtV0aYYmK/PHreyAU1pirLXDc3UJI8qNyAmeu3ZwTF6jL0V+
         3KZsKNHB6hfnW35JI+oqCZFT9Ck4Y6jBDW7CH2w/CQJ0WLLVzdlM8nkm3lOjBhSTjw
         y/sNDzKn2NmHw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210126043155.1847823-2-bjorn.andersson@linaro.org>
References: <20210126043155.1847823-1-bjorn.andersson@linaro.org> <20210126043155.1847823-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc: Add global clock controller driver for SC8180x
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Mon, 08 Feb 2021 10:03:45 -0800
Message-ID: <161280742583.76967.8198565022240408313@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-01-25 20:31:55)
> Add clocks, resets and some of the GDSC provided by the global clock
> controller found in the Qualcomm SC8180x platform.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Applied to clk-next
