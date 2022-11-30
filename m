Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5E3B63E30C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 23:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbiK3WEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 17:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiK3WEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 17:04:50 -0500
Received: from sp13.canonet.ne.jp (sp13.canonet.ne.jp [210.134.168.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 970907BF89;
        Wed, 30 Nov 2022 14:04:49 -0800 (PST)
Received: from csp13.canonet.ne.jp (unknown [172.21.160.133])
        by sp13.canonet.ne.jp (Postfix) with ESMTP id 86E891E06A4;
        Thu,  1 Dec 2022 07:04:41 +0900 (JST)
Received: from echeck13.canonet.ne.jp ([172.21.160.123])
        by csp3 with ESMTP
        id 0VC5pCfBAxJr50VC5plUwn; Thu, 01 Dec 2022 07:04:41 +0900
X-CNT-CMCheck-Reason: "undefined", "v=2.4 cv=S49nfKgP c=1 sm=1 tr=0
 ts=6387d379 cx=g_jp:t_eml p=ZMph9Jy3UboA:10 p=et4T4aBE6iSmLst72HwA:9
 p=pOQp6VyLxH7D_L77S6qH:22 a=c8wCX2VJ6RehaN9m5YqYzw==:117
 a=yr9NA9NbXb0B05yJHQEWeQ==:17 a=PlGk70OYzacA:10 a=kj9zAlcOel0A:10
 a=sHyYjHe8cH0A:10 a=x7bEGLp0ZPQA:10 a=CjuIK1q_8ugA:10 a=0iaRBTTaEecA:10
 a=xo5jKAKm-U-Zyk2_beg_:22"
X-CNT-CMCheck-Score: 100.00
Received: from echeck13.canonet.ne.jp (localhost [127.0.0.1])
        by esets.canonet.ne.jp (Postfix) with ESMTP id 3B61E1C026D;
        Thu,  1 Dec 2022 07:04:41 +0900 (JST)
X-Virus-Scanner: This message was checked by ESET Mail Security
        for Linux/BSD. For more information on ESET Mail Security,
        please, visit our website: http://www.eset.com/.
Received: from smtp13.canonet.ne.jp (unknown [172.21.160.103])
        by echeck13.canonet.ne.jp (Postfix) with ESMTP id 12A6E1C0262;
        Thu,  1 Dec 2022 07:04:41 +0900 (JST)
Received: from kanesaki-kawara.co.jp (webmail.canonet.ne.jp [210.134.169.250])
        by smtp13.canonet.ne.jp (Postfix) with ESMTPA id 41D0815F962;
        Thu,  1 Dec 2022 07:04:40 +0900 (JST)
MIME-Version: 1.0
Message-ID: <20221130220440.00000941.0556@kanesaki-kawara.co.jp>
Date:   Thu, 01 Dec 2022 07:04:40 +0900
From:   "Richard Lee" <junko@kanesaki-kawara.co.jp>
To:     <INBOX@kanesaki-kawara.co.jp>
Reply-To: <richardeeoo@gmail.com>
Subject: INQUIRY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Priority: 3
ORGANIZATION: Richard Lee
X-MAILER: Active! mail
X-EsetResult: clean, %VIRUSNAME%
X-ESET-AS: R=SPAM;S=100;OP=CALC;TIME=1669845881;VERSION=7941;MC=4067780606;TRN=15;CRV=0;IPC=210.134.169.250;SP=4;SIPS=1;PI=5;F=0
X-I-ESET-AS: RN=442,624:0;RNP=richardeeoo@gmail.com
X-ESET-Antispam: SPAM
X-Spam-Status: Yes, score=7.5 required=5.0 tests=BAYES_50,
        FREEMAIL_FORGED_REPLYTO,RCVD_IN_VALIDITY_RPBL,SPF_HELO_NONE,SPF_PASS,
        UNRESOLVED_TEMPLATE,XPRIO_SHORT_SUBJ autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5229]
        *  1.3 RCVD_IN_VALIDITY_RPBL RBL: Relay in Validity RPBL,
        *      https://senderscore.org/blocklistlookup/
        *      [210.134.168.90 listed in bl.score.senderscore.com]
        *  1.3 UNRESOLVED_TEMPLATE Headers contain an unresolved template
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
        *  2.0 XPRIO_SHORT_SUBJ Has X Priority header + short subject
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Greetings,

I trust you are well. I sent you an email yesterday,
I just want to confirm if you received it.
Please let me know as soon as possible,

Thank you.


