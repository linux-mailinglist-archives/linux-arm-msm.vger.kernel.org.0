Return-Path: <linux-arm-msm+bounces-67705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129FAB1A455
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 16:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BD1C3B1C1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 14:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77DA8270575;
	Mon,  4 Aug 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="t8K/W7VX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C915271451
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754317011; cv=pass; b=SqDsurnh5UjQLaGTWBCx8zYD5YnWz+jvun7GeP7X6wnEVXFYvNX50+zXK8+shnMrtov/r8f5UvfRpxhkd+CO7WNicMj5eIfRzB0qQ3oiCOwJQ1m+EJYzHPfTfyBGxJRm3TiPDlCaSGZ6d6xnK4+05BCLWI6C/9LHXjSHGJglQ0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754317011; c=relaxed/simple;
	bh=3TCIc9/lmivf1rqMgGSS47C5JXtgRdq/XbmpWhjrN9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doXSXMNgb5fQ9lN/2oKik1+WxYAEO//yNkiONvBxjpQjjaRfli1xTjuXLMctqnnTyEQ5h1PeKRscf3soEPhfCWX+yF0PtHWba4k5gMeE9vKVvTB1z2EPtFW1spl2UWYpdrLitPSjl+FxNr2RC/YqNFktJJC+qKxilgQwzCLCLkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=t8K/W7VX; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from jyty (dsl-hkibng22-50ddbb-117.dhcp.inet.fi [80.221.187.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: msmakela)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4bwdhc13Yzz49Q76;
	Mon,  4 Aug 2025 17:09:04 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1754316544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLo+/tUddj4Qd3+YwzfJ10/R2wY6d0jdJ/yGBw8qDx8=;
	b=t8K/W7VXXMaor65m/qiUU/DMu3DHxKXXhwz9W8bX1XC9izRNLpT/qeptNdKXZvYDAmeqUq
	5N5n42ppvzaetT6tMvWjWmRb95js0aiuaLQsDGFdrS8hSvOyD0n6s2kQue7neaojQv+slp
	Jfpn804LV87F7g14bYBox3vOmyJT8gXrspBVNrPNQB7naaBYfAk6w+x5g8RU8rnhfN2vuz
	jzL2bSN+dXOLxO8ziTBKJ9LginDWTwp/+MN4q9Bpn4QgZV711WQmAJ0GOul2v7yQKw+MIz
	LRVuGQS6GFZsAUUOWOxU3o2XEyRE77dr/iWcKyL4rgo3CIVGpNheGZv9LPyzgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1754316544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLo+/tUddj4Qd3+YwzfJ10/R2wY6d0jdJ/yGBw8qDx8=;
	b=vpco5JZhG32gODsDJYPeYxcoPUmkmSwiK/3fNIZaBy2ApV9EMHcEkgahVe1VJvT9GKPB0m
	+PmW7bzw5WDGQjQLkOjg5+pU+NT0Hcr18xpCZFriGJdyhUnmF0QAd7NITHFqQtZc2usnd7
	V3+Lv2zEzszg7+tQaTtsqNGJx5d+8L5utiiTfhN0SbHEFjDUsbY85BJyg5AHRcv+w9ZG7/
	2vEu+4greGNtO1TQvAw0ypeLn9059jFCiAO3Qz8Op63RXuAH+GEIhenASGDtDUlcGkUCvS
	MlTX6mQHl6671tuKsnmpHIwL7WcLlYm2Xzz+SCrkJ5E6dnKjYwPLeKL5Rb8wUQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=msmakela smtp.mailfrom=marko.makela@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1754316544; a=rsa-sha256;
	cv=none;
	b=k4sWO63MCsyUtsuBSX+DYj44cQ275i5qYNy8mqqug9ZMoFEgyM65X07HMlacF2L2e3L3rF
	fm3CY4AAdknT/Y32QqA29PW+1MU6SQRwvgB/QoPARpqDaJi+XgY0KUnoCAwTi/95KhwWfh
	G8vTODEqTcaTPGtUNF0YH0nT+rS+ejhPGU1YG8kg5T8XR4Wpl2yTnNreL25Th00GVJ9huk
	dbtu72v+fF+Iu6wj0Lz4KfeKXy6/mzy2dKqKia339uOCx5eUPqVLpFXZm4pyd03TdmNOZF
	pu75owVkblFKgF0l0NsJ3mrP89DGj65R7KdCiVf9YOBRQgGzjdOttpc+MzLFWw==
Date: Mon, 4 Aug 2025 17:09:02 +0300
From: Marko =?iso-8859-1?B?TeRrZWzk?= <marko.makela@iki.fi>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: rework nss_port5 clock to
 multiple conf
Message-ID: <aJC-_jzdwP-1NnlD@jyty>
References: <20250802095546.295448-1-marko.makela@iki.fi>
 <61b1ac3d-8481-4731-b24d-2864e24625b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61b1ac3d-8481-4731-b24d-2864e24625b4@oss.qualcomm.com>

Sat, Aug 02, 2025 at 01:51:31PM +0200, Konrad Dybcio wrote:
>On 8/2/25 11:55 AM, Marko Mäkelä wrote:
>> Rework nss_port5 to use the new multiple configuration implementation
>> and correctly fix the clocks for this port under some corner case.
>>
>> In OpenWrt, this patch avoids intermittent dmesg errors of the form
>> nss_port5_rx_clk_src: rcg didn't update its configuration.
>>
>> This is a mechanical, straightforward port of
>> commit e88f03230dc07aa3293b6aeb078bd27370bb2594
>> ("clk: qcom: gcc-ipq8074: rework nss_port5/6 clock to multiple conf")
>> to gcc-ipq6018, with two conflicts resolved: different frequency of the
>> P_XO clock source, and only 5 Ethernet ports.
>>
>> This was originally developed by JiaY-shi <shi05275@163.com>.
>
>Hmm.. I'm not sure what to think about this, given that person seems
>not to be using their full name (or maybe it is the full name, I don't
>know) and hasn't provided a sign-off, but on the other hand this isn't
>a very inventive change, so I don't *really* mind - up to you, Bjorn

This basically is the result of executing the following and resolving 
the rather trivial conflicts:

git show e88f03230dc07aa3293b6aeb078bd27370bb2594|
patch drivers/clk/qcom/gcc-ipq6018.c

I actually did that and compared the result to the original patch.

I believe that my Signed-off-by is valid and sufficient due to 
Developer's Certificate of Origin 1.1 (b), "The contribution is based 
upon previous work."  That "previous work" would be the gcc-ipq8074 fix 
that this is a subset of.  This is what I tried to convey in my commit 
message.  In the name of openness, I wanted to credit the person who 
provided the patch to the OpenWrt community; see 
<https://github.com/openwrt/openwrt/pull/14950> and 
<https://forum.openwrt.org/t//232618/4>.

I did play with the thought of modifying the patch a little so that I 
could without hesitation submit it as my own work.  Namely, I could have 
replaced two ".num_parents = 7" with equivalent ARRAY_SIZE expressions, 
similar to gcc-ipq8074.c.  However, that would have violated the 
"Separate your changes" guideline.

>FWIW for the patch contents:
>
>Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thank you!

	Marko

