Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BCE1E7283
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 04:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390933AbgE2CS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 22:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390781AbgE2CS5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 22:18:57 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E57B8C08C5C8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:18:56 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id q8so889556qkm.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5/ulWTNxKu3yWZsKCdG+n1pLZYJLUzJucMwpnx/Tjv0=;
        b=C34ixtjbwhTJs+0mxiEv38hlgyVg5oZ4ZUEdBIFFx0McbkQZ7C4Ar8UPmumPbeJbU8
         J93hIKwAr/NdF7UVmk2a4FtGTnVo4oF5mTJtvb3PwzSOtysVYzY9eDr2mtXOLfjSMpgC
         Ich8bcjQLU+idCXfS5jqj0Bt6uhG2FQcdAjwo1o1BOocDff47TQEwhvA+g7pxC0Fffjy
         WRV3DFr43pQFK7ONkrYVtMiIs2MSDj0XutRLhJZdT3oo1NvVrUGVnpecI4tN217ZI3dH
         LFsl7xe99Mr3I9xzSAzGKa345ob47xLdpkV2xSNu11e0SfuJS01AK7udqV0EhCw7YOuF
         91Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5/ulWTNxKu3yWZsKCdG+n1pLZYJLUzJucMwpnx/Tjv0=;
        b=O9wTnYOrYFZDjqqHBTw/paLpVPq/er/DiLzZOj1WWIlJ/OxcQJMLImMhjaKd2FmTyD
         OMFdSoO/pDG7puYqiAACogJ9BizSmfSlvc2gQ5SGy+T81zat6M3ZAfDfi8X1JkKvNVvQ
         aPoiKWloiLf4DH5Il2UXvzrFqckytRA9ULfgPD0iRzp2FYdg39tw+mILMuJYStuzlR/s
         fEybJBQSc4b34UhTPtzWZUEGB5SbmIPVNqBwI1llDfEKzLsQQcXX9WAya/15Lbx+KYjb
         QR+r0oMl8kmxtZNN47W3a2hPjE+UJGA3GpI7Pq4YdZenzahx7J/AUVcwYGsFVKmHI3qM
         sV5w==
X-Gm-Message-State: AOAM533Vm8hXQwNaGq4d5RpFv7aOaDLdET5WtIuL0QbpdImEri3I8uWX
        wpXJ79XWtzgMzPk4jco4/uPX4Q==
X-Google-Smtp-Source: ABdhPJxaNAoEyQgOULt+Nf/hsDjmGyVnd7Bl1/xKq6ZTrX+c1gyKj6S7vvEfHFFjA/uUfNoODWAOLA==
X-Received: by 2002:a37:51d7:: with SMTP id f206mr5654716qkb.91.1590718736074;
        Thu, 28 May 2020 19:18:56 -0700 (PDT)
Received: from nicolas-tpx395 ([192.222.193.21])
        by smtp.gmail.com with ESMTPSA id b74sm6165768qkc.17.2020.05.28.19.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:18:55 -0700 (PDT)
Message-ID: <7be1070ee7aad1f48fc6de63523da8e1bc952dc8.camel@ndufresne.ca>
Subject: Re: [RFC] METADATA design using V4l2 Request API
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     dikshita@codeaurora.org, Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org
Date:   Thu, 28 May 2020 22:18:54 -0400
In-Reply-To: <fb96e2c09346e7831a0af99c0fe9f94c@codeaurora.org>
References: <1588918890-673-1-git-send-email-dikshita@codeaurora.org>
         <d1179bc1-662b-615f-0f9b-67693fe8c906@xs4all.nl>
         <fb96e2c09346e7831a0af99c0fe9f94c@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le jeudi 28 mai 2020 à 16:18 +0530, dikshita@codeaurora.org a écrit :
> > not allowed. So I need to know more about this.
> > Regards,
> >        Hans
> 
> we need this for use cases like HDR10+ where metadata info is part of
> the bitstream.
> 
> To handle such frame specific data, support for request api on capture 
> plane would be needed.

I have a bit of a mixed impression here. Considering how large the ioctl
interface overhead is, relying on HW parser to extract this medata woud be the
last thing I would consider.

Instead, I'm quite convince we can achieve greater and likely zero-copy
perfromance by locating this header in userspace. So everytime I see this kind
of API, were the HW is *needed* to parse a trivial bit of bistream, I ended
thinking that we simply craft this API to expose this because the HW can do it,
but no further logical thinking or higher level design seems to have been
applied.

I'm sorry for this open critic, but are we designing this because the HW
designer exposed that feature? This is so low complexity to extract in
userspace, with the bonus that we are not forced into expanding the
representation to another form immediatly, as maybe the display will be able to
handle that form directly (where converting to a C structure and then back to
some binary format to satisfy DRM property seems very sub-optimal).

Nicolas

