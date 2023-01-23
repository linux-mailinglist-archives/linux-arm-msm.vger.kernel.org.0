Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12B6E678988
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 22:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232786AbjAWV1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 16:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232926AbjAWV1W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 16:27:22 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1FC3928A
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 13:27:13 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id p189so6256895iod.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 13:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDdvKKY6vXKD/b+VRce+QXw9nBIr50kKl6fkjfVvZeQ=;
        b=iGe2Fv/+NXwoftR7t8rC953/eZ013rEQ4mBrdt8X9MzNkxMlldK1FT1JvwVd1t2oTa
         wzt3oK7AQ4pAuDF97gMa3ELDfzuiAPv2Sj6Se4Q8V/18I8Smqebnz75/5jqt/OqIVno1
         WGAz4o5YbBc6PhfxTSoN3tEK/3lw4PEwRg2QcPp3M9UNmGaGIPjKAmHJ71g/sWvKwVpV
         uS+jSM/nCuWJJMaknBdzwZaj7BZzgYtRH3I96fVSl4km4WJG+B2zY/RW6id3JJhxFf0B
         QKznnqt8fScD5DU8shOa7RZGkcigl4jxEbuD3jZT+W9E32zLgkcS9gKPeuGDZl14/ySp
         Wumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDdvKKY6vXKD/b+VRce+QXw9nBIr50kKl6fkjfVvZeQ=;
        b=kWTUBPJd2VidsLNf32W4/TRXF+SiiQY0jU5HWW3Yu44u2erVH4cn+9Im2ZKn3L8aYP
         kCJ+1RFOkeTnixUJlINVdMteG0i7unwbsbAoIZQsUy9jvu1ohdwf8Xi1HxC4UqqBoPaS
         IGxxCKn5KJ84t+vDaLPR5mReMiOxTaT7qNwBw9EtIonRUpJ8oefhUJ3y2kKVhNjHXzWb
         mPBprM+NooeARDnz4imnFcQcY1Wq20Jf/Hotr3GfXxgjhWrFIjFGcRvj/6WqE9LEhM/Z
         LcxHqvyw+M9Ytsm/ET5tX38JrMazToFMhESst5US/Y2ysi6jd1Abc5Eev8e4VqIamjOy
         iMrw==
X-Gm-Message-State: AFqh2ko7kNrhH25a55v/VC07mNQpklpWWrp74ePOUauKc5IpoK9Wpa79
        9EGPSJ+Hrp9mqObyOpNnyPJFGEOXYTxuDMNLSGhccg==
X-Google-Smtp-Source: AMrXdXvugBkUlkAE0J84vm8n8+OXi1gfzdkJrM86OXIf0grqvMPwRN3cym8TAc6y9qi0UP+ChtOcMLoFU3K2eooeb88=
X-Received: by 2002:a6b:4108:0:b0:704:8263:b926 with SMTP id
 n8-20020a6b4108000000b007048263b926mr1952152ioa.53.1674509232247; Mon, 23 Jan
 2023 13:27:12 -0800 (PST)
MIME-Version: 1.0
References: <DS0PR02MB90787835F5B9CB9771A20329C4C09@DS0PR02MB9078.namprd02.prod.outlook.com>
In-Reply-To: <DS0PR02MB90787835F5B9CB9771A20329C4C09@DS0PR02MB9078.namprd02.prod.outlook.com>
From:   "T.J. Alumbaugh" <talumbau@google.com>
Date:   Mon, 23 Jan 2023 13:26:36 -0800
Message-ID: <CABmGT5HiH8OM_F6K7VQj9vj1ZnSvVowwJ_d4EVox5-JDL3Eh5w@mail.gmail.com>
Subject: Re: [RFC] memory pressure detection in VMs using PSI mechanism for
 dynamically inflating/deflating VM memory
To:     "Sudarshan Rajagopalan (QUIC)" <quic_sudaraja@quicinc.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Oscar Salvador <osalvador@suse.de>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Trilok Soni (QUIC)" <quic_tsoni@quicinc.com>,
        "Sukadev Bhattiprolu (QUIC)" <quic_sukadev@quicinc.com>,
        "Srivatsa Vaddagiri (QUIC)" <quic_svaddagi@quicinc.com>,
        "Patrick Daly (QUIC)" <quic_pdaly@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sudarshan,

I had questions about the setup and another about the use of PSI.

>
> 1. This will be a native userspace daemon that will be running only in th=
e Linux VM which will use virtio-mem driver that uses memory hotplug to add=
/remove memory. The VM (aka Secondary VM, SVM) will request for memory from=
 the host which is Primary VM, PVM via the backend hypervisor which takes c=
are of cross-VM communication.
>

In regards to the "PVM/SVM" nomenclature, is the implied setup one of
fault tolerance (i.e. the secondary is there to take over in case of
failure of the primary VM)? Generally speaking, are the PVM and SVM
part of a defined system running some workload? The context seems to
be that the situation is more intricate than "two virtual machines
running on a host", but I'm not clear how it is different from that
general notion.

>
> 5. Detecting decrease in memory pressure =E2=80=93 the reverse part where=
 we give back memory to PVM when memory is no longer needed is bit tricky. =
We look for pressure decay and see if PSI averages (avg10, avg60, avg300) g=
o down, and along with other memory stats (such as free memory etc) we make=
 an educated guess that usecase has ended and memory has been free=E2=80=99=
ed by the usecase, and this memory can be given back to PVM when its no lon=
ger needed.
>

This is also very interesting to me. Detecting a decrease in pressure
using PSI seems difficult. IIUC correctly, the approach taken in
OOMD/senpai from Meta seems to be continually applying
pressure/backing off, and then seeing the outcome of that decision on
the pressure metric to feedback to the next decision (see links
below). Is your approach similar? Do you check the metric periodically
or only when receiving PSI memory events in userspace?

https://github.com/facebookincubator/senpai/blob/main/senpai.py#L117-L148
https://github.com/facebookincubator/oomd/blob/main/src/oomd/plugins/Senpai=
.cpp#L529-L538

Very interesting proposal. Thanks for sending,

-T.J.
