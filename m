Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C34B87D22DF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Oct 2023 13:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbjJVLUM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Oct 2023 07:20:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbjJVLUG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Oct 2023 07:20:06 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E6DE9
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Oct 2023 04:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697973605; x=1729509605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZV5m5CS5hxdG/7f2asALECDbdAeb7WxlldaO5lAsY3c=;
  b=eAvA6No1x4riq7MmYQbOoznUye0ph8LHggFNPvZdJlGUwyEwapZyHV60
   mA5GJqVIbWHszb+5rU3lvDNRrU+WS7Da79/XZr4iGv3F/6cJ/436V/+De
   hlFVKvzH+JStEn67204C4cfgC3gdzZGBhZFr5BhMS+GfnIPBypaK/RVfT
   ehQYqowF3wXKejFz2G5ic77ranKgisMNnNZU6BzqeOJdYhY4/mQ0nL64d
   4VW5cC2zzxqpqLz0CZ5tq/81nPuKavbi79usJoys+O+LCLeJ1Sscpnlpv
   N5yYRWDOTlIcP47d8tCsTvqatUcJFbWDs2KStoBAt8gjVKQg3P3HsK+m5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="8256677"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="8256677"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 04:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="1089193319"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="1089193319"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 04:20:02 -0700
Date:   Sun, 22 Oct 2023 13:20:00 +0200
From:   Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     quic_ajitpals@quicinc.com, quic_carlv@quicinc.com,
        quic_pkanojiy@quicinc.com, ogabbay@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/2] accel/qaic: Support MHI QAIC_TIMESYNC channel
Message-ID: <20231022112000.GC704032@linux.intel.com>
References: <20231016170114.5446-1-quic_jhugo@quicinc.com>
 <20231016170114.5446-3-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016170114.5446-3-quic_jhugo@quicinc.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 16, 2023 at 11:01:14AM -0600, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Use QAIC_TIMESYNC MHI channel to send UTC time to device in SBL
> environment. Remove support for QAIC_TIMESYNC MHI channel in AMSS
> environment as it is not used in that environment.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
