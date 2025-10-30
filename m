Return-Path: <linux-arm-msm+bounces-79550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47096C1E1FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 03:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 107353A618B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 02:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD75F2E2659;
	Thu, 30 Oct 2025 02:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="hZl9vOPK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m15573.qiye.163.com (mail-m15573.qiye.163.com [101.71.155.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8E92FC02F
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761791237; cv=none; b=eHhc0a+mChCh923h0LbY0VrrHyJvbBDGU0I44+fh6llWY0OYLMC+/YcAf3egcRj3jBoDFr+SVoea9hDO/hbP4ZGyVzTiyUt5NaBANfZxayEguoiO/k1cfJzwdSLC3qJpjSwHlTI1VncpN0aDC4/hXxNeExC1rygFHCCHZbxhF+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761791237; c=relaxed/simple;
	bh=yQJrEM9ZRDN6YyFhFbJ6FpN13yMiFmzeikGhljpJ9cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SI3i1vTZY+99RqmPYbgU7u3/r5WKVDWTnHIdcQIvp4rG5TfFzum98FAm/TuPFiasmSQUFRZMtegg/ORf7ZL9P12MHaabdu3S1qSTM+fiODBZgZIB7boV67mhgnpVaShLVRVqyPkWLFOi84/aQvGS7KemoS+Aviv/hkZqNvDqKSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=hZl9vOPK; arc=none smtp.client-ip=101.71.155.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27b56a1b4;
	Thu, 30 Oct 2025 10:21:57 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com,
	rosh@debian.org
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Thu, 30 Oct 2025 10:21:36 +0800
Message-ID: <20251030022136.9494-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <dddbb37d-04a2-4f16-a9e8-cdad503c033c@oss.qualcomm.com>
References: <dddbb37d-04a2-4f16-a9e8-cdad503c033c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a32ebf96a09d5kunm18164638438358
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQkNMVk9OT0JCSkoaSEJDH1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=hZl9vOPKQvUSH5xxJu4cg+IrscUy42M+xPT5eGSKHzxW6dj5N2HXN3rtZ/tT1cvdW60kggAkhJq+tjXT778YNajIIFdNEK5ZZ6XYABo3KxknAW+L+wo1/9w2Gzj28vm0XdLHnlVjxvKdv331GnzceYXvSFIs6fBQ9Pg0wWpsEiQ=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=D4fJh/rpt/DbfqcVBEVF/6OlsHT/ooinJ7f/p7BZJa8=;
	h=date:mime-version:subject:message-id:from;

>>> On 9/30/25 6:32 AM, Hongyang Zhao wrote:
>>>> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
>>>> QCS6490 SoC.
>>>>
>>>> Works:
>>>> - Wi-Fi (AP6256)
>>>> - Bluetooth (AP6256)
>>>> - Ethernet (AX88179B connected to UPD720201)
>>>> - USB Type-C
>>>> - USB Type-A 2.0 port
>>>> - Two USB Type-A 3.0 ports (UPD720201 connected to PCIe0)
>>>> - M.2 M-Key 2280 PCIe 3.0
>>>> - RTC
>>>> - 40PIN: I2C x1, UART x1
>>>>
>>>> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
>>>> Reviewed-by: Roger Shimizu <rosh@debian.org>
>>>> Cc: Casey Connolly <casey.connolly@linaro.org>
>>>> Cc: Christopher Obbard <christopher.obbard@linaro.org>
>>>> Cc: Loic Minier V1<loic.minier@oss.qualcomm.com>
>
>[...]
>
>>>> +&thermal_zones {
>>>> +	cpu0-thermal {
>>>> +		trips {
>>>> +			cpu_tepid: cpu-tepid {
>>>> +				temperature = <65000>;
>>>> +				hysteresis = <5000>;
>>>> +				type = "active";
>>>> +			};
>>>
>>> these are not useful unless you wire up the fan here
>> 
>> I wrote a service program at the user levelthat listens for netlink messages
>> from here to control the fan.
>
>Creative!
>
>> Controlling the fan at the kernel level should be a better approach,
>> and I have verified this. I will make modifications similar to the following:
>> 
>> 	cpu0-thermal {
>> 		trips {
>> 			cpu_tepid: cpu-tepid {
>> 				temperature = <65000>;
>> 				hysteresis = <5000>;
>> 				type = "active";
>> 			};
>> 
>> 			cpu_warm: cpu-warm {
>> 				temperature = <80000>;
>> 				hysteresis = <5000>;
>> 				type = "active";
>> 			};
>> 
>> 			cpu_hot: cpu-hot {
>> 				temperature = <90000>;
>> 				hysteresis = <5000>;
>> 				type = "active";
>> 			};
>> 		};
>> 
>> 		cooling-maps {
>> 			map-cpu-tepid {
>> 				/* active: set fan to cooling level 1 */
>> 				cooling-device = <&fan0 1 1>;
>> 				trip = <&cpu_tepid>;
>> 			};
>> 
>> 			map-cpu-warm {
>> 				/* active: set fan to cooling level 2 */
>> 				cooling-device = <&fan0 2 2>;
>> 				trip = <&cpu_warm>;
>> 			};
>> 
>> 			map-cpu-hot {
>> 				/* active: set fan to cooling level 3 */
>
>You can drop these comments

Hi Konrad,

Sorry, in the v5 patch I sent, I missed your review,
I will remove this part in the v6 version.

Thank you!
Hongyang

