Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D692A315E44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 05:40:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhBJEkY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 23:40:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35418 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229690AbhBJEkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 23:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612931937;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/OTZsXH2tD0HeIgH/lI8h+bZrxEF7HhE4ZNU7vfxtAk=;
        b=DcVR+IJM6N1IotiMz+N8jMpfmSw+4QVX0CYgx+KLML51SGBHnRe7iw5SuczhOpE4b7gTQR
        5zMETSCuspQa9RFwj3TGkJjXldpCi2WuPV957a5qVwgvljhARPE1fIyOli9TTBjA3CtfE7
        QRbriyfCAU6e6dfc+tYWH+7O4AgpHC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-f0srScS3Nb6YY6KHfMJKew-1; Tue, 09 Feb 2021 23:38:50 -0500
X-MC-Unique: f0srScS3Nb6YY6KHfMJKew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B3C3100A8FC;
        Wed, 10 Feb 2021 04:38:48 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BA6B460C4D;
        Wed, 10 Feb 2021 04:38:35 +0000 (UTC)
Subject: Re: [PATCH V3 16/19] virtio-pci: introduce modern device module
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        virtualization@lists.linux-foundation.org,
        open list <linux-kernel@vger.kernel.org>, shahafs@mellanox.com,
        lulu@redhat.com, sgarzare@redhat.com,
        Randy Dunlap <rdunlap@infradead.org>,
        lkft-triage@lists.linaro.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20210104065503.199631-1-jasowang@redhat.com>
 <20210104065503.199631-17-jasowang@redhat.com>
 <CA+G9fYteUN=s5Mp+BhdMPZt96B3qDa+2HwudmWgEmmrDELLPdw@mail.gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <9cc9d649-e891-8bcc-e5f8-cec7c0d40077@redhat.com>
Date:   Wed, 10 Feb 2021 12:38:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYteUN=s5Mp+BhdMPZt96B3qDa+2HwudmWgEmmrDELLPdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2021/2/9 下午6:15, Naresh Kamboju wrote:
> Hi Jason,
>
> On Mon, 4 Jan 2021 at 12:28, Jason Wang <jasowang@redhat.com> wrote:
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   drivers/virtio/Kconfig                 |  10 +-
>>   drivers/virtio/Makefile                |   1 +
>>   drivers/virtio/virtio_pci_common.h     |  27 +-
>>   drivers/virtio/virtio_pci_modern.c     | 617 -------------------------
>>   drivers/virtio/virtio_pci_modern_dev.c | 599 ++++++++++++++++++++++++
>>   include/linux/virtio_pci_modern.h      | 111 +++++
>>   6 files changed, 721 insertions(+), 644 deletions(-)
>>   create mode 100644 drivers/virtio/virtio_pci_modern_dev.c
>>   create mode 100644 include/linux/virtio_pci_modern.h
>>
>> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
>> index 7b41130d3f35..6b9b81f4b8c2 100644
>> --- a/drivers/virtio/Kconfig
>> +++ b/drivers/virtio/Kconfig
>> @@ -12,6 +12,14 @@ config ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
>>            This option is selected if the architecture may need to enforce
>>            VIRTIO_F_ACCESS_PLATFORM
>>
>> +config VIRTIO_PCI_MODERN
>> +       tristate "Modern Virtio PCI Device"
>> +       depends on PCI
>> +       help
>> +         Modern PCI device implementation. This module implements the
>> +         basic probe and control for devices which are based on modern
>> +         PCI device with possible vendor specific extensions.
>> +
>>   menuconfig VIRTIO_MENU
>>          bool "Virtio drivers"
>>          default y
>> @@ -20,7 +28,7 @@ if VIRTIO_MENU
>>
>>   config VIRTIO_PCI
>>          tristate "PCI driver for virtio devices"
>> -       depends on PCI
>> +       depends on VIRTIO_PCI_MODERN
> While booting Linux next tag 20210208 kernel on qemu_arm64 and qemu_arm
> mount rootfs failed.  The root cause seems to be due to missing configs
> CONFIG_VIRTIO_PCI=y
> CONFIG_VIRTIO_PCI_LEGACY=y
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> Then I have to force to enable this MODERN config
> CONFIG_VIRTIO_PCI_MODERN=y
> and which enabled
> CONFIG_VIRTIO_PCI=y
> CONFIG_VIRTIO_PCI_LEGACY=y
>
> and the qemu_arm64 and qemu_arm boot pass.
>
>
> New build link,
> https://builds.tuxbuild.com/1oEse4EFsoQr1FkKBfiLmhMCe7j/


Thanks for the reporting.

I will post a patch to fix the def config to enable VIRTIO_PCI_MODERN.

Thanks


>
>

