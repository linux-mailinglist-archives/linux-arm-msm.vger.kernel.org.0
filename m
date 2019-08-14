Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4D6A8DA2F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbfHNRQF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:16:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:40438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729361AbfHNRQF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:16:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E786B20665;
        Wed, 14 Aug 2019 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565802964;
        bh=Ol16FFrAWLJ7frCliGW7iHrw/X+VxEhEbO0JZ4oJiwI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SMTPcj97V6oAV9qySU7yvr7HwTHfdWukWU1jNgmtLhtBOV/DL07EPc8XjkLmbyED7
         nBSW9GchMNdSxdCYG4oy5hgmPqTvyYUtmQugmyESHvqp28W4Pldub2HoPpVcUPKhzE
         8Buf529KpcsmZLcSVaUAvaprl6Bpgs46LJ4v5rzE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814125012.8700-22-vkoul@kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-22-vkoul@kernel.org>
Subject: Re: [PATCH 21/22] arm64: dts: qcom: sm8150: Add SMEM nodes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>, Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:16:03 -0700
Message-Id: <20190814171603.E786B20665@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:50:11)
> From: Sibi Sankar <sibis@codeaurora.org>
>=20
> Add the necessary dt nodes to support SMEM on SM8150 SoC.
>=20
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---

Squash it?

