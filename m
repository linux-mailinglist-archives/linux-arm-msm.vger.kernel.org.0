Return-Path: <linux-arm-msm+bounces-74653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F7B9B907
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 20:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0C5242002B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 18:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C02323957D;
	Wed, 24 Sep 2025 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="WzJNj/VH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m19731102.qiye.163.com (mail-m19731102.qiye.163.com [220.197.31.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE581ADFFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 18:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758739869; cv=none; b=fuIZB7JjbpFRiGEOiEJdtLgX2mOdXgcwoV0W7zzhxp3YT22AKb1/P+VffsRbxrd3LMvbpjPP6IFRb/KLWsj9qEebUSb8qdpctA+X4BhqXQXcfGypc7F4Wlwz5XrtPZmXrCbgv3Dlu9tiiBcJsw41tbrKFxCdrMvvQsCJj1nryuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758739869; c=relaxed/simple;
	bh=KzBCymneI06kfN0eyh9pd31rK+EnqrS0C/wKJT9OwqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txFskr56D1svsT4p39bxF4y0NJ5DYF/oGSHBmzQyJisHYkhDkzqVLh0kBOoduyBek8mJPvQC270Aib63fsW4aKF9yYQN1tYFG1gD2BR9FPlUg4peUY8W9XgmDRMvkJWSl9Qb3kKiwhQdGxSiohX9MQ8wXIYOhxZkPvpmKN6NVFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=WzJNj/VH; arc=none smtp.client-ip=220.197.31.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Received: from ROG.lan (unknown [113.235.126.201])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23ef76e9c;
	Thu, 25 Sep 2025 00:28:41 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	casey.connolly@linaro.org,
	christopher.obbard@linaro.org,
	hongyang.zhao@thundersoft.com,
	linux-arm-msm@vger.kernel.org,
	loic.minier@oss.qualcomm.com,
	robh@kernel.org,
	rosh@debian.org
Subject: Re: [PATCH v2] arm64: dts: qcom: rubikpi3: Add qcs6490-rubikpi3 board dts
Date: Thu, 25 Sep 2025 00:28:25 +0800
Message-ID: <20250924162825.43879-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <660759fa-5a8d-4243-8bf9-49abb35d337a@oss.qualcomm.com>
References: <660759fa-5a8d-4243-8bf9-49abb35d337a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a997c8e3e6109d5kunm5695ad9b39ee0f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQkNOVkwaTx9IGU5DSB1LSlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTVVJS0pZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=WzJNj/VHAULQph1pGj6fXRguDndqpqxS939dy50h9OZQht9kMRGm0B28ERVK7Mvw1A80sWJDjIS5SZd9E4scV2UW7gqKUfGd4k1E070bKq/qUogUIWvoJOPQUCN3iSmiz143GNTZkYFmeZ2dgXb3mNzJwHU/PBhJ1/ijhjf/1I4=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=wrrnsXNT9S3jTkwbgEEOEUmxx17Rj15MSUGZ4bGLbHU=;
	h=date:mime-version:subject:message-id:from;

>On 9/24/25 4:51 PM, Rob Herring (Arm) wrote:
>> 
>> On Wed, 24 Sep 2025 20:15:41 +0800, Hongyang Zhao wrote:
>>> From: hongyang-rp <hongyang.zhao@thundersoft.com>
>>>
>>> Add DTS for Thundercomm qcs6490-rubikpi3 board which uses
>>> QCS6490 SoC.
>>> This will add support for debug uart, usb-typec, wifi,
>>> bluetooth, fan, m.2, i2c and uart on the 40-pin connector,
>>> usb2.0, and some voltage regulators to the board.
>>>
>>> Signed-off-by: hongyang-rp <hongyang.zhao@thundersoft.com>
>>> Reviewed-by: Roger Shimizu <rosh@debian.org>
>>> Cc: Casey Connolly <casey.connolly@linaro.org>
>>> Cc: Christopher Obbard <christopher.obbard@linaro.org>
>>> Cc: Loic Minier V1<loic.minier@oss.qualcomm.com>
>>> ---
>>> Changes in v2:
>>> - Fix problems found when running device tree check.
>>> - Enable USB2.0 interface.
>>>
>>> v1 Link: https://lore.kernel.org/linux-arm-msm/20250923064330.518784-1-hongyang.zhao@thundersoft.com/
>>> ---
>>> ---
>>>  arch/arm64/boot/dts/qcom/Makefile             |    1 +
>>>  .../dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1348 +++++++++++++++++
>>>  2 files changed, 1349 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
>>>
>> 
>> 
>> My bot found new DTB warnings on the .dts files added or changed in this
>> series.
>> 
>> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
>> are fixed by another series. Ultimately, it is up to the platform
>> maintainer whether these warnings are acceptable or not. No need to reply
>> unless the platform maintainer has comments.
>> 
>> If you already ran DT checks and didn't see these error(s), then
>> make sure dt-schema is up to date:
>> 
>>   pip3 install dtschema --upgrade
>> 
>> 
>> This patch series was applied (using b4) to base:
>>  Base: attempting to guess base-commit...
>>  Base: tags/next-20250923 (exact match)
>> 
>> If this is not the correct base, please add 'base-commit' tag
>> (or use b4 which does this automatically)
>> 
>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250924121541.128582-1-hongyang.zhao@thundersoft.com:
>> 
>> Error: arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts:1026.1-12 Label or path usb_1_dwc3 not found
>> Error: arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts:1059.1-12 Label or path usb_2_dwc3 not found
>
>Hongyang, you must rebase on linux-next/master

Sorry, I don't know much about this; I've resubmitted a patch
based on linux-next/master.

Hongyang


