Return-Path: <linux-arm-msm+bounces-54851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CABA95058
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 13:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C31D53A7D99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Apr 2025 11:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800DE264628;
	Mon, 21 Apr 2025 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Bh11iVxV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DF12641F4;
	Mon, 21 Apr 2025 11:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745235655; cv=none; b=u+htLhft8nOqCuS7I9HGFJvfAsfArDN8rDzJebS/WWWGcJRkJe7UKwct3GYUhhQ9VQs7g3oH2hQ5JK8GL6EVpsn7TjY9ewQ3jTHiuMRWV9YA5BcPRyUzr8+Fv/XINaYVwRtQp2BLR1a1+Os2pUaoXYHHbrgfx0nm6ZBeMSxIn+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745235655; c=relaxed/simple;
	bh=+G+QJR8daWICJSND6Y6z9zPJMawS12+eS2mqBW9L5cI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Ho3dPZzUWk5DTodifVWrDiF/aGoZPmZb/gPdjSBn2nEF2MF0WazA70V/lvZndJ5EL3hDSwqGIW8BRhZ7ofwXvVpfHGCBzGF8r9pakYavCV5eIzeR/8a+mfXXBp0WY/jBX7iG1zTr7RPspb8IqdpOUmqijQVtZ4PmZv00n0l1vVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Bh11iVxV; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
	by mail.mainlining.org (Postfix) with ESMTPSA id D24EBBBAD3;
	Mon, 21 Apr 2025 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1745235650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dzZQUtNftwdikjUTgmz8pxhPpBMvvcvZ+Al8SAKHIww=;
	b=Bh11iVxVrek3iHmj7JnmhVDudJBjbYPbDN3/q3LAjd+grbzf/l+yMiggD/ihDGJVJasJMM
	L2NrCYKzdVxrIdVNZgitTnvb/IS+sdBKdZe9G92zPOzdKF0b+iA86fX6psU97TDcHHOPBu
	PwrifjQTZT9yjEeWOH0D2aPuB2F2s+DLqBVFHghTEL6bd3m90mBOLsvjRecWTQfKDIS79F
	7WTf4Inc4aU7iGjURdf052g+ZfqGwzWUm3kGEMOa0zw5Pp3X2RrIb1h0n804IkN/inb6nn
	IxBCTN++oSiuKWM+rEkIi1VDQqcZPmCxsL+w5ABAUYwf5SJRSKEXh4ddRt9axw==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 13:40:50 +0200
From: barnabas.czeman@mainlining.org
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Luca Weiss
 <luca@lucaweiss.eu>
Subject: Re: [PATCH 1/2] rpmsg: qcom_smd: Fix fallback to qcom,ipc parse
In-Reply-To: <viki5krjvs3vs5jf2lrhah6v5rziqju7jv5kbwz7yyvdfjwhh5@6gieypw5owfp>
References: <20250421-fix-qcom-smd-v1-0-574d071d3f27@mainlining.org>
 <20250421-fix-qcom-smd-v1-1-574d071d3f27@mainlining.org>
 <viki5krjvs3vs5jf2lrhah6v5rziqju7jv5kbwz7yyvdfjwhh5@6gieypw5owfp>
Message-ID: <114814a2fc59b0fa3dd5a2863394c0f2@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-21 12:38, Dmitry Baryshkov wrote:
> On Mon, Apr 21, 2025 at 04:04:16AM +0200, Barnabás Czémán wrote:
>> mbox_request_channel() returning value was changed in case of error.
>> It uses returning value of of_parse_phandle_with_args().
>> It is returning with -ENOENT instead of -ENODEV when no mboxes 
>> property
>> exists.
> 
> Why? What is the rationale?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/of/base.c#n1390
mailbox: use error ret code of of_parse_phandle_with_args() this commit 
was changed the return value
from ENODEV to use retrun value of of_parse_phandle_with_args what is 
returnung with EINVAL or ENOENT.
It makes skipping fallback path to parse qcom,ipc if there is no mboxes 
property defined.
As far as I know qcom,ipc now only needed for rpm smd-edge on some SoCs 
like 8939, 8916, 8976, 8917.
arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM
> 
>> 
>> Fixes: 24fdd5074b20 ("mailbox: use error ret code of 
>> of_parse_phandle_with_args()")
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>> ---
>>  drivers/rpmsg/qcom_smd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
>> index 
>> 40d386809d6b78e209861c23d934e1b9fd743606..e552a9af578e48cfd854a228a4d91e4fa04bf29d 
>> 100644
>> --- a/drivers/rpmsg/qcom_smd.c
>> +++ b/drivers/rpmsg/qcom_smd.c
>> @@ -1368,7 +1368,7 @@ static int qcom_smd_parse_edge(struct device 
>> *dev,
>>  	edge->mbox_client.knows_txdone = true;
>>  	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
>>  	if (IS_ERR(edge->mbox_chan)) {
>> -		if (PTR_ERR(edge->mbox_chan) != -ENODEV) {
>> +		if (PTR_ERR(edge->mbox_chan) != -ENOENT) {
>>  			ret = PTR_ERR(edge->mbox_chan);
>>  			goto put_node;
>>  		}
>> 
>> --
>> 2.49.0
>> 

