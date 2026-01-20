Return-Path: <linux-arm-msm+bounces-89753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E5D3BE06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 04:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 776A034C886
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 03:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D46633507B;
	Tue, 20 Jan 2026 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmqhouTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E27335070
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 03:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768881022; cv=none; b=nXbAPLGXlI/0A1QX+4vftuvf+4E4SgKhg48uffueTXlcqg62bga/HSrkvW+oyNLap6UCnk5kdW+4EawVzxdfih86S3s4qDutuHlolBN3/6jFbf8wr/vvJI9rDt1qMrsoqwXoa5TjFJ8kLThNGJ6wkmwKln6xb1F1AoX50r/1s1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768881022; c=relaxed/simple;
	bh=YouqfwVWzYXpcikOlfu9sTS3gDOn1ZFujhD3ULTm95g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cER+Zpa/5E9KCJ/qgwVhxpfMISOXFc02R+1i9K9pK+HORyCGo9vUQZggydmna4WW5PjATSQJbdEGzx3TXGGrjxAjEXus9stnaES9cLbjr+rOznIAWF9wt6ZNDnWMeJil3TVE0V6WoTPVWg7rCw4As9YrRS1vPbiz4Cm+GxlfKIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmqhouTb; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c59bce68a1so315915585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 19:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768881020; x=1769485820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J0ylyK0Iu22RJ/xkcdGlRObGYO0FeHTfl507VqBaAx4=;
        b=ZmqhouTbwST4ddALMVWqWYXrD6SOgQJIASZXcp1vBD6BF+Zo55rXjoSNVULPX/aRUW
         ur9RsyoFLFnJ6IMDWoqqNtsRoLyCqppfLbCN8/CR4nkAyXRqFlfP9OHMcxp9pm8FaKRI
         NYcwVFQ4jagrD5FgIYl/XzZKnbl3Wic0TpoI1ow0pjv9PA04fsQ8uuiePnWSlvfeGx+m
         r3apki+c9emFM70Q++iVoS2lyRHcMo4Wji42O7/5C3eyQ9mdC7TDLksftz4wFGgcqauk
         Ceczqnr/IlqyLmvKDN8Hj7H1NnXphNcPnq5zRf4rkbHVZOPqwDlgD7bhijGExMXJhnbd
         oqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768881020; x=1769485820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0ylyK0Iu22RJ/xkcdGlRObGYO0FeHTfl507VqBaAx4=;
        b=oUu+aT280IqQJL0FaJAN06mqBYAl4h8oxL/Lm2AjGMoYz2PQ0RNJW/GFoxZzBdv11v
         p6kkvQxy9hV6bUS055kA4m4ryqSMj9pHP0YBNyZYPbayX5WCC5VqMsI4+oxEOrnig2+0
         lzg1p0UkiR+Ackheg0NO4aOF4dkfNuvSzHtyCLYhlEVtxtv5A4jfzZinYDU7nlLRSkfe
         irKmalOzIs8CA1gfG7hHR3A5kiyzZViIhS81N3CFFQo9Vicv2LbjeemZ+QOhLyBH1jEa
         2W2p4uu/gHxZl/yPXNx5ZQU8WHx0aaOzNx9AnfJ/wjUsFD5ZOu6NR8a6faDJsCqVY8FY
         br2A==
X-Forwarded-Encrypted: i=1; AJvYcCX4R3pM6HpYODVzDfJ2Hd/T1iUX4rv1r+Kds0muV+Efx5T9d+sWVZ93gK0KjapccsUrwp9PvKqSf1w9q0qz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/iQKqrD8r69lfF0mxxE63lBMsSJZhhJfBdeejX4ccoJiIE4ez
	HAlLTlATul0YLgq2iIxi8w1qzs7CqCK2gbF1dKtDlPyFrjmoF7R8sBlh
X-Gm-Gg: AY/fxX7QL97hAbTOsn1HklUvLJvPsKgFIK7Br2zPyaOxqHdkDSSFQtU7o8VfUZCF9Or
	ABNFG1IXLrkvVWTR5nW0XYhZtpxmExeZuPjQf6KsjRpGjcpp9iVSXm1gw3tCrH5/ZJuj260uaFl
	jdkBgBCuCmXn5sCH+CpPkZHUV6V+YAS2PqF23UkZZg4jh+LAHySZ2dVE1NveSit4+sWY4490bK7
	XPCkbzy2TXMehwVhEVrx+MNjZ9XXUH7b8iqy2xC6Nhznf1057O3sQqa1Gi8CkfSuuM0qx31XgsY
	VtLzeTdd2yeo1QF8he0OIOlxkFTdxTNpqkQT0Xju1hz3NOoydr2xv0fXOWYZ7pBtjL+s1CVvi6+
	aA8DtCspDdOruJ5c8JeAA5YyrkJqLBaLNB3pm7BU6N4V+5/BPL6MAltBHFYXl2UIZCS+kKaIw7r
	bkMh+Gwd+KAoL7lE8xfguTb+Mq
X-Received: by 2002:a05:620a:3f97:b0:8b2:2607:83d5 with SMTP id af79cd13be357-8c6ccf2381fmr56720685a.75.1768881019642;
        Mon, 19 Jan 2026 19:50:19 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a7250a60sm936184085a.31.2026.01.19.19.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 19:50:19 -0800 (PST)
Date: Mon, 19 Jan 2026 22:50:41 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aW77kXzBjAlIMG1C@rdacayan>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <a29ff1e4-117c-4703-b0c7-73ad4e369201@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a29ff1e4-117c-4703-b0c7-73ad4e369201@linaro.org>

On Sat, Jan 17, 2026 at 02:03:02PM +0200, Vladimir Zapolskiy wrote:
> On 1/17/26 06:06, Richard Acayan wrote:
(snip)
> > +static int imx355_power_on(struct device *dev)
> > +{
> > +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct imx355 *imx355 = to_imx355(sd);
> > +	int ret;
> > +
> > +	ret = clk_prepare_enable(imx355->clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
> > +				    imx355->supplies);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> > +		goto error_disable_clocks;
> > +	}
> > +
> > +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> > +	usleep_range(1000, 2000);
> 
> The deassert above is not needed IMO, anyway.

This assert is for clarity, otherwise it isn't obvious that the GPIO is
asserted low when the function is called. It should stay.

