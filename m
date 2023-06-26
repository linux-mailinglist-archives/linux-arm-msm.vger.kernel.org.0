Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DABF73EE8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 00:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjFZWQp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 18:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjFZWQa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 18:16:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 646CCE5A;
        Mon, 26 Jun 2023 15:16:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E9CFF60EF2;
        Mon, 26 Jun 2023 22:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C4BC433C8;
        Mon, 26 Jun 2023 22:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687817784;
        bh=1fb5kx18XxdnYgvO4fpROF+3cipTjE+jCQd55iaN6K8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BBmK6ynqWp3FK3VFYG6IX2mmmeICTKJYwBlm73h5iW4aagvIB5Tt5ymvzkulw62UI
         9fdd/88fpqkB4/y221op6Sgaf8KqneQZfkMNC5vb7LcCK0q6//GQzHhWR7dACtjy4S
         c8GftRfli4iUmlqndpd1uGFlRU7omssS5Tk+hTeWBCOzlmHb5mE26VClVj9rjbN0VW
         91yxTEyeBNY96LBJ7ls1P4vOJcET6dByB4jZhD3EQGP/z2POgYLdsk3OlMDkCus3U2
         1yPBnQI9neApqShgJ46zV9embTSepOGMoArEZMZQPU3Ok+IWshIx3zkFLndI4pn0e8
         GEsH+ez2AXSiQ==
Message-ID: <12bc6772862528dce110b50043b58dd3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230626171736.2494708-1-andersson@kernel.org>
References: <20230626171736.2494708-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v6.5, second attempt
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Robert Marko <robimarko@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Mantas Pucka <mantas@8devices.com>
To:     Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date:   Mon, 26 Jun 2023 15:16:21 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2023-06-26 10:17:36)
> As reported by Stephen, the first v6.5 pull request was missing the SC828=
0XP
> LPASS DeviceTree binding include, which was supposed to be brought in thr=
ough a
> topic branch. Merged this branch top of the previous pull request to avoid
> rebasing the branch at this time.
>=20
> Regards,
> Bjorn
>=20
> The following changes since commit ac9a78681b921877518763ba0e89202254349d=
1b:
>=20
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-6.5-2
>=20
> for you to fetch changes up to e5d10d1d1aa4c7274bf7ff54660832004800655a:
>=20
>   Merge branch '20230608125315.11454-2-srinivas.kandagatla@linaro.org' in=
to clk-for-6.5 (2023-06-26 09:26:48 -0700)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
