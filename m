Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13BA77AF1DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 19:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbjIZRm6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Sep 2023 13:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232053AbjIZRm6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Sep 2023 13:42:58 -0400
Received: from smtp29.i.mail.ru (smtp29.i.mail.ru [95.163.41.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D50F116;
        Tue, 26 Sep 2023 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=jiaxyga.com
        ; s=mailru; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:From:Sender:Reply-To:To:Cc:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive:
        X-Cloud-Ids:Disposition-Notification-To;
        bh=kZRL+Y4MjwkbRg11XYLjP8jww2HjKfXpxdnb8WERheY=; t=1695750170; x=1695840170; 
        b=q8sqbs5p0ylpYB61dVgV137LZaAfOuBH3owNw95thpTlHkHd9yNSmdqhzbzLvkCgWhuP17lt3px
        a+XtiRTDuvNQcnCi2TQ0D/eeRghpeOWX2ORANDC4Mv3FsCsDnMw072UH8qYY0W4ZiJC681FCwLDam
        5K5V10jeJTGZb8MLSMQ=;
Received: by smtp29.i.mail.ru with esmtpa (envelope-from <danila@jiaxyga.com>)
        id 1qlC57-00EHSD-2I; Tue, 26 Sep 2023 20:42:46 +0300
From:   Danila Tikhonov <danila@jiaxyga.com>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
        konrad.dybcio@linaro.org, johan+linaro@kernel.org,
        andersson@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        danila@jiaxyga.com
Subject: [PATCH v2 0/1] drm/msm/adreno: Add support for SM7150
Date:   Tue, 26 Sep 2023 20:42:42 +0300
Message-Id: <20230926174243.161422-1-danila@jiaxyga.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp29.i.mail.ru; auth=pass smtp.auth=danila@jiaxyga.com smtp.mailfrom=danila@jiaxyga.com
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD9724621A6593A829D3988570A8930496FDFDA338775C7A6AF182A05F538085040EA618371E3D0BBB0983094E8AC5AFDC532835674666856AD7149A0FB41FE4BB1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DD4CC05688AD5D0CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637889C00975665ABF68638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D878FA909FCFF8F9A74E377AD6966A402C117882F4460429724CE54428C33FAD305F5C1EE8F4F765FC05EF1B56D39DD5F7389733CBF5DBD5E9C8A9BA7A39EFB766F5D81C698A659EA7CC7F00164DA146DA9985D098DBDEAEC85DBE5CE84B47B0E4117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFA4DC95554899BC9EBA3038C0950A5D36C8A9BA7A39EFB766D91E3A1F190DE8FDBA3038C0950A5D36D5E8D9A59859A8B6D4C4ECAC619A54F376E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7C58E6ABEB090DA66043847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A5F8FDF476235380094FDDCF9F63C055A59CA7FDC079330CF9F87CCE6106E1FC07E67D4AC08A07B9B0A7DFDF579AB090EF9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB7742DC8270968E61249B1004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D3467D08F30473A58424A33E0C2D865C3F9F54813C62FF54451A8719F3FB0985FCE8B354AEB8D59E5391D7E09C32AA3244C6C8779C59F14DFCA61092F61DD17C82D81560E2432555DBB22D8497622A0BBEDB6C6411D86935C89F1B989832B1231FADA9B151D4D6D28F5093753811196C242
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojArMfh9+zH8kos5wsT83M8Q==
X-Mailru-Sender: 9EB879F2C80682A09F26F806C73949814CD12929D710BEA15B293A5AAFEFBACADF76B9B9158B2F3E643683D8C0F3ED1CA3C71A376745D86BBE86167304C7680C3980CE5AAA35C7CD60F22E8815EDE5EAEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for SM7150 SoC machine.

Changes in v2:
- Use a630_gmu.bin instead of a618_gmu.bin.
- Use squashed version of a615_zap (.mbn).
- Drop .revn.
- Link to v1:
https://lore.kernel.org/all/20230913191957.26537-1-danila@jiaxyga.com/

Danila Tikhonov (1):
  drm/msm/adreno: Add support for SM7150 SoC machine

 drivers/gpu/drm/msm/adreno/adreno_device.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.34.1

