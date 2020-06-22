Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A500203AEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 17:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729337AbgFVPaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 11:30:11 -0400
Received: from sonic310-21.consmr.mail.gq1.yahoo.com ([98.137.69.147]:36595
        "EHLO sonic310-21.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729262AbgFVPaL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 11:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048; t=1592839811; bh=ZrqH4CkkktGM5U4f9eYdkRlGgwNo9TU/U6UyKhhS7Nk=; h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject; b=FMooE4Fd+vL4bOCsF19oFQ+8koe0SIaIvvnGdNGfg2bY9knR5NmK7OICT9TR/C4FomIL9cKp+4yWwn+F6H2vlvCQsslSqNrU3R5XJIZ+X3cjerWqjIpY8zb9ydg7gue/6Xc4vqKJOS1EsEMOrpmE2Nv5tvLGQneg7LWwmDotsRzxkX1Wih8HHzws+RGqUypcRFtQLFLn1F+oLy+uSiVoNGeOSvWvy4dlO53/Cs55fitsnVg2Cl8z3JSvTv8QAJz7Fv2TewSJX57O433tT8/QBqo7Xuvbg6idLtQHo9zE9a2gE+v5/0hP+Z6L/rHNzJlToMcYh2Jh4sas0IgFWTyXnQ==
X-YMail-OSG: Cr3SZHIVM1nhNBz0ZZsYMs_M_FiwKACLBt6kQJYR4K4mF8rlKRnT_f7fT.t2sCC
 DipgYeUhA4EqFw.SkQWXpFDSR9OEwLAwPhxJrNDrZntjEiUyBxrucSuQHm_QF14U8f.b2eKVT72N
 qLFP7qiHUNKXQ4SYEPcuZ_q_hvbnxXiCXViFhbZeefE03ucrFdRs4EM21.p1dmjv5xm1mLoCeWIN
 jkgvvhLmjrY8f5pm5D.I7cSGPM0XP4TaGG6w.i1Rm9gkDs8YL.9moWBhj1cX2qg6nJLn_YP9zuaP
 0j4YBbovs_HxALABkTP.KUcbU5likQB6ekjU..0CB5QQqi81Q0Hy7bFSr7FHxVMM12ot7uWaEinI
 JzMYBL7BgegWMHyrDLq0BukuCBzZhQ7HtVDiFAb6SLzynuhFE2s0oduA4_8TuEHwugSN8ABWWMon
 VPs76OFaHB4AiH8rlzDNUDvCs7hdVL4wp9PFB6nn9gIroi814lkRYshQ4SiMu8.x1LxzVQKuj_1K
 AuI6G4xS5qHgGm9tql95oMLMkoCQ_OChr1GN3vdf3AkF.9X9Wc6QF3ClqlTETxkAJr74XyNRNefG
 KKhCUU2Mb6kqNBNzFDJhl1nBfl4J3BT0UE0D3HzQ.zUoHGifRb9ATfXlzwDHyItKsky9dMsmfqtp
 i6TMZweDPyfDW5BjQ.MZTGyShESLRfuuUEljOv8zB54h_Fy7RVp.TsJfycEpERk0eoEc8YtNTOHf
 CcMXxFXSBJJWfuCSoiKgkmgJ.tWI9GYciX5ptLM5SO5ucVKruIh5YWFPlCwnk7h.bBmMVMK6JbYY
 FIzEK18BG84ne8qJn5HcUc4YGExVQ_0VdZ68jSrZOOgnALE7w0Yh7P.5FEyFgcDv5CQRtTlDa9XV
 332GOILLb4zJJheQ0JFSPElT9FH3CBrDs5LCQxJomwN4y7xwltOYhRMK83otrU_Fj_y_eHeotXp5
 XEoZNPauow06YAJ6iF5IF8YixALM0Q7iN05wMbk0d_uc0b55OOLVDb3x3VUYpis0YS82.POsP32I
 ulBQXux3NQlclxawhgWzTJz.jykMGFqABOqUbZETOIhVNH9HkQalW_F5SQXc82W2mLThpOJ_x082
 G.nYAFFP6Iozy3gvrmlA27ubLrteMzz7DLQIULn80k0_6JJr84FSeEkkQDHO2PSnfc8bmvPlGVvp
 18BXWE0ViDKr5zEztaQIMuEjnaJYCCDIS0FBU4hrX67yVYFDBT0y6ZYXCS4tbw1UClE62qzLiBIP
 UN3eLZ.VIszJNb86Rf9A8WrGMP2tM7.UAiknCB.VtjckyXwujOVTk01wBBbAFbL0YYDxIOdYmGmw
 oInI7KsCeCE6pCvJGjT60utyj2RwD2L_Yt9unDDKpSoj3x.XhDmB.
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.gq1.yahoo.com with HTTP; Mon, 22 Jun 2020 15:30:11 +0000
Received: by smtp418.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID 402ae077068331dedde2e55d9ced12f3;
          Mon, 22 Jun 2020 15:30:08 +0000 (UTC)
Date:   Mon, 22 Jun 2020 11:30:04 -0400
From:   "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: AMD IOMMU + SME + amdgpu regression
To:     Joerg Roedel <jroedel@suse.de>
Cc:     Andy Gross <agross@kernel.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Drake <drake@endlessm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Christoph Hellwig <hch@lst.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        jonathan.derrick@intel.com, Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        David Rientjes <rientjes@google.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        virtualization@lists.linux-foundation.org,
        Will Deacon <will@kernel.org>
References: <1591915710.rakbpzst8h.none.ref@localhost>
        <1591915710.rakbpzst8h.none@localhost> <20200622100257.GD31822@suse.de>
In-Reply-To: <20200622100257.GD31822@suse.de>
MIME-Version: 1.0
Message-Id: <1592839701.mxvvths2x9.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.16138 hermes_yahoo Apache-HttpAsyncClient/4.1.4 (Java/11.0.7)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Excerpts from Joerg Roedel's message of June 22, 2020 6:02 am:
> Hi Alex,
>=20
> On Thu, Jun 11, 2020 at 07:05:21PM -0400, Alex Xu (Hello71) wrote:
>> I am using an ASRock B450 Pro4 with Ryzen 1600 and ASUS RX 480. I don't=20
>> understand this code at all, but let me know what I can do to=20
>> troubleshoot.
>=20
> Does it boot without SME enabled?
>=20
>=20
> Regards,
>=20
> 	Joerg
>=20

Yes, it works with SME off with dbed452a078 ("dma-pool: decouple=20
DMA_REMAP from DMA_COHERENT_POOL") applied.
