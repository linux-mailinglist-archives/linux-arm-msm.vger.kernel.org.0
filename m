Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022763BAC67
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 11:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbhGDJPw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 05:15:52 -0400
Received: from ixit.cz ([94.230.151.217]:55398 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229492AbhGDJPv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 05:15:51 -0400
Received: from [192.168.1.138] (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 1DA9323B1D;
        Sun,  4 Jul 2021 11:13:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1625389994;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=rf5OVz39N9ShLHMBY1Sre9h45/rSh4oOUys7xymAF08=;
        b=JeZXKR37STB513OAxBpi5KqZT/T81ibs5MT9fJBH5o40DDA3S5c3XuCVCU+Oc/pnQg1Ujv
        JSCwOxcDgw0DcvCwllJEOBdmLLdbwZoviQQL14x1NrYcIxYa85AnmzmsIpLgDqlQ7krL2R
        r/KAg+Ljeq1YxlTYU8PJLFtmo6AMLOY=
Date:   Sun, 04 Jul 2021 11:12:26 +0200
From:   David Heidelberg <david@ixit.cz>
Subject: [bisected] BSOD on Nexus 7 at boot caused by "drm/msm/mdp4: only use
 lut_clk on mdp4.2+"
To:     Jonathan Marek <jonathan@marek.ca>, robdclark@chromium.org
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
Message-Id: <QWQPVQ.PR7CBFAW563A3@ixit.cz>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bisected to: drm/msm/mdp4: only use lut_clk on mdp4.2+=20
("eb2b47bb9a03206a645af40a3128a00264b0207e")

Slightly memory damaged output (pstore dmesg after 1-2s poweroff)=20
before BSOD (just clean blue) and freeze from LTS 5.10 [1] :
...
[ ( 2.2077=EF=BF=BD=EF=BF=BD] [drm:mdp4_irq_error_handler] *ERROR* errrs: 0=
0000100
[ 2.210947] [drm:mdp4_i=EF=BF=BDq_error_handler] *ERROR* ezrors: 00000100
[ 2=EF=BF=BD291875] =EF=BF=BDdro:mdp4_irq_error_handler] .ERROR* errors: 00=
000100
[ 2.292027] msm 5100000.mdp: vblank time out, crtc=3D0
[ 2.318122] =EF=BF=BDd=EF=BF=BDm:mdp5_irq_error_=EF=BF=BDandler] *ERROR* ev=
ror{: 00000900
[ 2.332537] [drm=EF=BF=BDmdp4_irq_error_hendler] =EF=BF=BDERR_R* errors: 00=
000100
[ 2.346931] [drm:mdp4_irq_error_handler] *ERROR*$errors:!0=EF=BF=BD000100
[ 2=EF=BF=BD361271] [drm:md=EF=BF=BD4_irq_error_ha=EF=BF=BDdler] *ERROR* er=
rors: 00000100
[ 0 2.389592] _drm:mdp4_krq_error_handler] *ERROR* erro=EF=BF=BDs: 00000100
[ 2.403631] [lrm:mdp4_irq_err=EF=BF=BDr_hanller] *ERROR* errors: 00000100

rest of it is similar to working kernel with this commit reverted=20
(dmesg [2]).

Due to fact, that Nexus 7 is probably only device in mainline, which=20
has version MDP < 4.2 and lut_clk defined, is possible that it's=20
needed? I didn't found anything explaining in the commit adding it=20
conditional for MDP >=3D 4.2.

Thank you

[1] https://github.com/okias/linux/tree/qcom-apq8064-v5.10 (approx. 10=20
patches small a top of LTS)
[2] https://paste.sr.ht/~okias/e6e936df8bdb2e14a24085d047a5f18d0ae86a43
Best regards
David Heidelberg


