Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37441A8C80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 22:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633167AbgDNUbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 16:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633164AbgDNUbp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 16:31:45 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3EAEC061A10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:31:43 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u65so472195pfb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 13:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=KvEg77doNLDzNxGfMI9Rhj8uKkWfoxdVPh7FOq7KA9M=;
        b=dw8jLdsbWZ6CDS0pB0qnJU6MRd4mZxnk1zNvrKzhqaB11JoxWnZpGsRSVr2kJPPScC
         arQcdoCVyvvxJxWV0uoessbrRiJfQzkEooIeCiKz8iRFD2IDarymsBzgPX+GZLQde0KB
         y6Rr/DECD+Nav1GKv2jK6kvc+gdVYf+2txjHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=KvEg77doNLDzNxGfMI9Rhj8uKkWfoxdVPh7FOq7KA9M=;
        b=VghW0XQCaHlFtq45sI7OeLkZritZDGCGpzgzN+vxkiuM3kdijmr8FWkdD4DPXOINO/
         OQGllmD3yAkPyVx6x2k8f+3E9kxojOQlmkRGzTH6VF6N17ceSYIn38NVK3movX78L7CD
         o2P7c5joKF6ZKjCZkyU27rex5EHiNpTX6pmRIBkAweYmIAFif7MsX+SW17KwumjvK26p
         ACwVlXyy/FDqUayVEMH12VcI5NvbySVz2KDholxbsnIBI57YlAMmFDg0SVUHAxfrzdL/
         rGyer5P/9xGUfnS0wDCViw+CGLE8x4i42ntgWZKHaalKUPkwLTW3Bwn7dHh51TCsmRCi
         5RMQ==
X-Gm-Message-State: AGi0PuYHCpr472kUWi+FsSi/b/LouvF+7LUDfiopHzR2aD1VWpuBO4IU
        O/sCbtl+41jIstpkGq3i6PnVCZfsNyQ=
X-Google-Smtp-Source: APiQypINr7mOtduZ95fKBHP8P8/xhtFbUcbxNm92yMg8RWHL43ZBo6qn6/7qsqN6lHTlsu3cTO+mmg==
X-Received: by 2002:aa7:9471:: with SMTP id t17mr24339663pfq.272.1586896302796;
        Tue, 14 Apr 2020 13:31:42 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id t126sm10887477pfb.29.2020.04.14.13.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:31:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585718145-29537-4-git-send-email-sanm@codeaurora.org>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org> <1585718145-29537-4-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v7 3/4] arm64: dts: qcom: sdm845: Add interconnect properties for USB
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 14 Apr 2020 13:31:41 -0700
Message-ID: <158689630151.105027.14207551281305119256@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-03-31 22:15:44)
> Populate USB DT nodes with interconnect properties.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
