Return-Path: <linux-arm-msm+bounces-27533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE72942F11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 14:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 459CB28BE62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 12:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6FE1AED3D;
	Wed, 31 Jul 2024 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vj/TuxwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8441AE85F
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430152; cv=none; b=eE0kT4+cfCGVCkb90y75zatNdPCdgBkQwEvpsz50bxDCRzXMJYQwgqENbC0zF663BSvZ/ujUvEePx+zSulP/yhBjXlWPosdo3DV+p2a0pmrH6S4EhnNsuc00Pp1ERNY1S6qaBBhgbgl30jFM838HLSvq/+qEaEMZvsTUIf7HCoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430152; c=relaxed/simple;
	bh=Ub7XQET/ZaZOsO+6E2FjhoWf/3Q9YRVW70nRZcFBXbY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uAL7MysMitvdSU2ye77lKf4TkIh9Sqhz/oo9plx3YedSLaq/vWcqd0heNQhC6f1eZZgNX3C57ejGU9l1UzEsSIpxSKC4JIRiKwd8kQ1HIxyAlqvEIXs7XgpItekKkDaAAW1XtM3rIXuCzCrSapwSHVW0505sq4A7aFfZeK/VFv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vj/TuxwO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722430149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfOezK4NgajJSnaHDL5lqgNB6v9S8prMoA4fLWqKK1A=;
	b=Vj/TuxwOGklv8hh/8b5TAJ2M0gznQcPQeN++IpTDt8u36sE9MzEHBJVP0E2Zohe/K3vkgW
	AAugSkYXB5sS7dqXEoyJg9lQqz2Aj1bcJRUuPM3a//nzaYTjgaZAf2GLvv9+B7jd79zfVH
	Lc/PKj43gbIuFkIR0Yl1kTL7/LHa6mk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-318--h9lzUaiO9-fcU-cgd55pQ-1; Wed,
 31 Jul 2024 08:49:06 -0400
X-MC-Unique: -h9lzUaiO9-fcU-cgd55pQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3813F1955D5A;
	Wed, 31 Jul 2024 12:49:02 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown [10.11.5.21])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F237119560AE;
	Wed, 31 Jul 2024 12:49:00 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix, from userid 12668)
	id DE5CF30C0519; Wed, 31 Jul 2024 12:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id D9B983CED5;
	Wed, 31 Jul 2024 14:48:59 +0200 (CEST)
Date: Wed, 31 Jul 2024 14:48:59 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
cc: axboe@kernel.dk, gmazyland@gmail.com, agk@redhat.com, snitzer@kernel.org, 
    adrian.hunter@intel.com, quic_asutoshd@quicinc.com, ritesh.list@gmail.com, 
    ulf.hansson@linaro.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
    linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
    dm-devel@lists.linux.dev, linux-mmc@vger.kernel.org, 
    linux-arm-msm@vger.kernel.org, quic_viswanat@quicinc.com, 
    quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 0/6] Add Additional algo mode for inline encryption
In-Reply-To: <20240730115838.3507302-1-quic_mdalam@quicinc.com>
Message-ID: <cbf18ce7-f9bd-c05d-d22-f56ca4ae3240@redhat.com>
References: <20240730115838.3507302-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12



On Tue, 30 Jul 2024, Md Sadre Alam wrote:

> This series of patches add additional modes for inline encryption
> 
> This series of patches depends on [1] Add inline encryption support for dm-crypt
> 
> [1]: https://lore.kernel.org/all/b45d3b40-2587-04dc-9601-a9251dacf806@opensource.wdc.com/T/#ma01f08a941107217c93680fa25e96e8d406df790
> 
> These patches tested on IPQ9574 with eMMC ICE for raw partition
> encryption/decryption.

Hi

I discussed it with Milan Broz <gmazyland@gmail.com> and we concluded that 
there is no need to bloat dm-crypt with this logic.

We believe that you should create your own target (like 
"dm-inline-crypt"), it would work like a linear target and it will attach 
encryption requests to the bios that it processes.

Mikulas


