Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59622E77D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2019 18:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389915AbfJ1RtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Oct 2019 13:49:07 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47030 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730981AbfJ1RtH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Oct 2019 13:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IvnQE28PEz0WhKPPPkZtNo1xd2JbILdKngliUxUY+Uw=; b=XhwCTwng0qurXRlIYaPj14eS/
        B85qbwKyzTTu1CYxxaMYihzzphOZbFG/IJhJD+Zg1Bqw+/TQpn+VCPJlobXz8j8q8OGOgn6k+2T+A
        KAEjghu+StMg9xJh08Lqq/3rmyvn2iWr6uv9VEmRlGgD6iPGryjhGE3tonOi12yKhs2S8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iP98W-0000J8-AE; Mon, 28 Oct 2019 17:49:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 415EE27403EE; Mon, 28 Oct 2019 17:48:57 +0000 (GMT)
Date:   Mon, 28 Oct 2019 17:48:57 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: next/master boot: 257 boots: 8 failed, 237 passed with 8
 offline, 2 untried/unknown, 2 conflicts (next-20191028)
Message-ID: <20191028174857.GG5015@sirena.co.uk>
References: <5db7032c.1c69fb81.888b0.b521@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Fnm8lRGFTVS/3GuM"
Content-Disposition: inline
In-Reply-To: <5db7032c.1c69fb81.888b0.b521@mx.google.com>
X-Cookie: The Moral Majority is neither.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Fnm8lRGFTVS/3GuM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 28, 2019 at 08:03:08AM -0700, kernelci.org bot wrote:

Today's -next (anf Friday's) fails to boot on db820c:

>     defconfig:
>         gcc-8:
>             apq8096-db820c: 1 failed lab

It looks like it deadlocks somewhere, the last things in the log are a
failure to start ufshcd-qcom and then an RCU stall some time later:

03:03:27.191914  [   21.156672] ufshcd-qcom 624000.ufshc: ufshcd_populate_vreg: Unable to find vdd-hba-supply regulator, assuming enabled
03:03:27.198061  <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=qup-i2c-driver-present RESULT=pass>
03:03:27.208499  [   21.175985] ufshcd-qcom 624000.ufshc: ufs_qcom_init: required phy device. hasn't probed yet. err = -517
03:03:27.216720  [   21.176014] ufshcd-qcom 624000.ufshc: ufshcd_variant_hba_init: variant qcom init failed err -517
03:03:27.226220  <LAVA_SIGNAL_TESTCASE TEST_CASE_ID=qup-i2c-blsp-i2c2-probed RESULT=pass>
03:03:27.239850  [   21.211424] ufshcd-qcom 624000.ufshc: Initialization failed
03:03:48.157338  [   42.128777] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
03:03:48.167648  [   42.128802] rcu: 	3-...!: (0 ticks this GP) idle=dde/1/0x4000000000000000 softirq=1715/1715 fqs=60
03:03:48.171895  [   42.133839] 	(detected by 0, t=5252 jiffies, g=2301, q=787)

Full details, including the whole log, at:

	https://kernelci.org/boot/id/5db6bf0d59b514a35660ee72/

--Fnm8lRGFTVS/3GuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl23KggACgkQJNaLcl1U
h9B2pgf7BTQuuysEgYX6i3Hx0AOJzKJ/T+uFvr9uRsXSnm3+6l4kSEkng8UPZq+v
yjx9dMbavxRyddWVpLbwBBOhrG/AyOLdHLw/jxSaq61ZZYC7KcMP7W91JW37/sRf
dvu4NX6fm+U1OqmoEoSbVKlzbxETRqnexSBw5jeqLWKgjAW0Ll3mKKUQaun62RlV
EsrpsfNEYCUPs2ia6+pTJNxHMzFBQSZfTylzP9OTPD+5D4O91akRDlz9dNAVK+Tz
Tcxc4QinBPWhKQQeSuV3q4Zg7beSUqqa7Iq14yRNDdpXQDZCT/VC/OSxDjZTnGBn
Hc2bNobVIYBmojLx0ZsJEktimpxIAw==
=abbW
-----END PGP SIGNATURE-----

--Fnm8lRGFTVS/3GuM--
