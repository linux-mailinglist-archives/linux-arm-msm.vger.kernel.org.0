Return-Path: <linux-arm-msm+bounces-92043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBqKJljwhWkPIgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:44:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C9FE5CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4FF68303DAC7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 13:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC57438F248;
	Fri,  6 Feb 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ck16nTLI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FD7367F56
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385197; cv=none; b=eXuMNo60C0Fy8abwCdoMG7YIcoYWvZPhSHmKv0wed9rQtdrzfpHWlm3xPTSF0wkZzqv6CVFD418UZ2/MrzgXjvORGijlX2FdTQrBOHwKHJAtrL3TZJ1Y5HmPZeMzzW5wDwGvTymEz+QxukINk3To9w3neMecXUIHsYvRMwAeqJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385197; c=relaxed/simple;
	bh=ui9sKOmtWTpThirBsaM2PaQ100m/96b72nH4caIV4lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cnIFpD2kMcQdmebfXjj3TFX6oW9U247PVyKzs1H4RxVr+1mY2DpxyGj3Tgqo3IFbpEh10QrX698xwvhzvCcHa3nEkOQGIeoxk6aZCAkGOfT+WVbOytbM5N0Mop1X0t7m46FEKPe6TeY4yJ6sh3d3OBHa2B2gKBlVABjXn15KWXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ck16nTLI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so20660575e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 05:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385196; x=1770989996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+DpawWM0L1bjHsi3UTj4Y3hlyX0qOr0v1C1K5DEznKQ=;
        b=ck16nTLIhwLgb1TejJUNXo2fCxd04cwkDU8JARz6rpTeJKRj5JqpedGki2Oty3Yd19
         69y/8WNn2kx2tONjqWCiPrhUitUsnklpUnnDd5lkF5uTYkT6pIBaqVCbDRubQVh4/hrd
         BoMU00I6DrRyTvjE7q8E5MSLUtInrRxXcsu00IPMbPayvjhSmMFFWvPTsktTEvC1yN9P
         hYF4nJWBmRnUwUK9w8KT8HodbL3RVmUEgtMpJDF1gKGvv1M5XehsgwMj5Hgy1L666tFV
         CP2YJ3rjMRNfH/nyPvr6AT+sgDiV+s5LkOEz9F7tJ2l4s76dfMyK7l+dc9JTnQPZUKBP
         B5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385196; x=1770989996;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DpawWM0L1bjHsi3UTj4Y3hlyX0qOr0v1C1K5DEznKQ=;
        b=CsVpl8oZ4P+5Y6IHHOmyhjzIuH010cJkpabshAEiuoIWPMZ/0llAxifRklXZIHHBHh
         B0C3PpND1VkRhBxocsUNTeYW6Yx8KFy0Jcm/Vim3Ppz9SR0tCns5mZItlVLHe8OX8+FB
         F46mAvHfQSiaInNl65J+YqDj87iXoFsK3qg1VWfSTmTAeaGqo0msFERwcaWEvTLH/L6+
         g8GMU2MsE1yUZpU4kjOWv71dfdE6Jpr0dpy4ymCpaT/ZivBnlDG9peuVqiSBGLsI4V0U
         cIhX/5imNorEoepAdLi02BzaaUuQsIVYDYfJpTmYkSstcJWKyvxvvo8LOA9papE146Oi
         VCPA==
X-Forwarded-Encrypted: i=1; AJvYcCVILFwcYiaLycBqSqTW1e3flEKaOLe1nn6h12vcFs0b1iJShE9wYKt1riYv5NJAjnRUwTtZSqR2kDI9p4R5@vger.kernel.org
X-Gm-Message-State: AOJu0YypPrgKcXj1cgOecM05mPYGGzMg+H09JQnl4zj04bVFRj5UCTAb
	Lg8fKoQe8CTai4sBYqKkz+F5mPnzzsT4ofKZNPILpoZO1K6ujq1FfhiQADNhEepPUJ0=
X-Gm-Gg: AZuq6aJMuV1kJKTiP/L6w3yS3xDQStmFH6w29dWbAQzEyUn1bLKylnLeqxPwF7LIGnB
	r5rdmgt8SN89d3Yi8A41e8D0K448dNJddEWclrLzzcZlXsiXzU3yhYoUNm21SDQSf9qrapL8x50
	BGrpTQmK92vztl314FayIXj73B+igr8sNkITXCn54X7ZnDQ+4hSx6Dxx+ZqUL33b2z0J3kVh2/o
	ttZOPlcq+8alDKEFmOHU/lcn89g1LigcXcuFFlatH8uLO611lMGPqQuRFqAy6BMw/eOYBAlVa/C
	5P3JpIBGUjeJcObbZE0VLVZlG/TeAPhmYGFNAcMeYeI8xPYTenEnzoFXheeQ7AHVSMBKfvsJddJ
	6uGmJDowl5CBQqwtcPjPu/9hU3omV+YoqHFexQcrnaCGth9PoIjOccb6gSTuoWzhcgAOwDpuUgw
	ZV81U4y/5fJs8MRJ3QZo8X3JxDC/g=
X-Received: by 2002:a05:600c:5619:b0:477:a71c:d200 with SMTP id 5b1f17b1804b1-4831791784bmr62231045e9.11.1770385195657;
        Fri, 06 Feb 2026 05:39:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d33f5fsm133089325e9.5.2026.02.06.05.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:39:55 -0800 (PST)
Date: Fri, 6 Feb 2026 16:39:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] media: iris: gen1: Destroy internal buffers after FW
 releases
Message-ID: <aYXvKAX3Pg3sL37P@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92043-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 165C9FE5CB
X-Rspamd-Action: no action

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Dikshita Agarwal,

Commit 1dabf00ee206 ("media: iris: gen1: Destroy internal buffers
after FW releases") from Dec 29, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/media/platform/qcom/iris/iris_buffer.c:588 iris_release_internal_buffers()
	error: dereferencing freed memory 'buffer' (line 585)

drivers/media/platform/qcom/iris/iris_buffer.c
    572 static int iris_release_internal_buffers(struct iris_inst *inst,
    573                                          enum iris_buffer_type buffer_type)
    574 {
    575         const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
    576         struct iris_buffers *buffers = &inst->buffers[buffer_type];
    577         struct iris_buffer *buffer, *next;
    578         int ret;
    579 
    580         list_for_each_entry_safe(buffer, next, &buffers->list, list) {
    581                 if (buffer->attr & BUF_ATTR_PENDING_RELEASE)
    582                         continue;
    583                 if (!(buffer->attr & BUF_ATTR_QUEUED))
    584                         continue;
    585                 ret = hfi_ops->session_release_buf(inst, buffer);

The commit adds a free of buffer to ->session_release_buf().

    586                 if (ret)
    587                         return ret;
--> 588                 buffer->attr |= BUF_ATTR_PENDING_RELEASE;
                        ^^^^^^^^^^^^
Use after free.

    589         }
    590 
    591         return 0;
    592 }

regards,
dan carpenter

