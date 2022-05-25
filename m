Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00D88533735
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 May 2022 09:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiEYHQQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 03:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244272AbiEYHQK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 03:16:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70ED413DC8;
        Wed, 25 May 2022 00:16:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 146F96175A;
        Wed, 25 May 2022 07:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EFBC385B8;
        Wed, 25 May 2022 07:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653462968;
        bh=ZYzGbnD2Pdi+3Gp3zDjxeWfWikvjB+6n/0bZBX9Uvtg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=CLpiPiU57+eA+nDFiMazITXSoeYopLs8boxbEhpmYoPKJYEuRt8US8Xp3gWfR3oN5
         7nhM47frfSrtAxkVWuzQq4piOTI8hbI8zJ9RnYUbDR3yMJmrpnW8WSEgGcNOZfzrbK
         u7NShn91uel4B6UU5KHfLemoFCGsA9n3cbgPpdUqG1mZznmnik9izqnjHK6msXIwBm
         /ONNlDZKwTXyiVttcTElpabCbIMfwzOe4dErH4BHXzXSaICBL9hOkpAbLRyxfPBlLk
         2rY3U2A4G0oWUo9LicPmJm8VkoHGxcTFA4Bs2O83ULGh4FzqYL5l6/I5AukXUvS2Mp
         kYf+8R2NOl6+g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523212255.64355-1-bjorn.andersson@linaro.org>
References: <20220523212255.64355-1-bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL] Qualcomm clock fixes for v5.19
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk@vger.kernel.org
Date:   Wed, 25 May 2022 00:16:06 -0700
User-Agent: alot/0.10
Message-Id: <20220525071608.69EFBC385B8@smtp.kernel.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2022-05-23 14:22:55)
> Stephen, I sent this as a follow up rather than creating a new tag. Let m=
e know
> if you prefer it in a different way.
>=20
> Regards,
> Bjorn
>=20
> The following changes since commit 703db1f5da1e3a62b84356a29c150efa24a237=
7d:
>=20
>   clk: qcom: rcg2: Cache CFG register updates for parked RCGs (2022-05-19=
 16:42:30 -0500)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-5.19-2
>=20
> for you to fetch changes up to 03e053b4f717c0d893881fe8e4ca8d9ae2f035f2:
>=20
>   Revert "clk: qcom: regmap-mux: add pipe clk implementation" (2022-05-23=
 12:26:13 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
