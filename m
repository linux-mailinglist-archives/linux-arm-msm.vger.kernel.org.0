Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A17229748C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750161AbgJWQhi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:37:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:37476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751236AbgJWQhg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:37:36 -0400
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown [163.114.132.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA97F206B5;
        Fri, 23 Oct 2020 16:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603471056;
        bh=pakbrjuqJm1C+JONrWcP/W6WZYcilIeIuIdbYcqb0zk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CFm1oryIQLo8UKL1lcUQr4aObJUoQWc+HglRWeGO1x9f6VL7+czRkWRmx8Od25AD8
         FBBeY4MLV77jEroRkJDU2PNsCty+hdKntc+RGnPJpdyv7aSqFfyzsuRey58y3d0rpo
         E8dEJmGckqGn26lpUwkOEpbj7BUQU+P5vaseYOVs=
Date:   Fri, 23 Oct 2020 09:37:34 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v8 0/4] userspace MHI client interface driver
Message-ID: <20201023093734.7b06694e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <1603354958-24025-1-git-send-email-hemantk@codeaurora.org>
References: <1603354958-24025-1-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 22 Oct 2020 01:22:34 -0700 Hemant Kumar wrote:
> This patch series adds support for UCI driver. UCI driver enables userspace
> clients to communicate to external MHI devices like modem and WLAN. UCI driver
> probe creates standard character device file nodes for userspace clients to
> perform open, read, write, poll and release file operations. These file
> operations call MHI core layer APIs to perform data transfer using MHI bus
> to communicate with MHI device. Patch is tested using arm64 based platform.

Until you CC netdev on this (as suggested [1]), here's my:

Nacked-by: Jakub Kicinski <kuba@kernel.org>

[1]
https://lore.kernel.org/netdev/20201016183759.7fa7c0ef@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com/
