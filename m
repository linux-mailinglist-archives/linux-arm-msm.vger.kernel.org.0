Return-Path: <linux-arm-msm+bounces-85542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8645CC899E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8F513248798
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92173446A5;
	Wed, 17 Dec 2025 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="He57iCWM";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="idIHGn7n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E400336EF0;
	Wed, 17 Dec 2025 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765986338; cv=none; b=YDddmVrXa08xfvs6tGU59K8jNXPEAP21oo1cVs2p57UNOmLrDlL3g1pcke/l2JI6BJwZvnIpDDLSXl44WC9onO7pRVSgdgcRyyrE2Ox7oGGyOXAi5X9QeeIDilcppLM8EYXhhsluyfTfK8RwNl0te7+obvv8trpf2vWh/crNdYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765986338; c=relaxed/simple;
	bh=bxJLoXjCxJBv4W5NHES4KmUnknnLcN5g6nqndZ9Yrgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cuu97rJbPEcMNg2ITpvxkvfwXZozcXpImpMwCTseHPkjcudbZxwJ2D1aGOsfbM9Ags0hWI1X4HRPYPR0vhltvG34W5rEJSGxTYgvyJdDBdmMHHhGLxmr7lYrOBAeZ6Jz9wSswYp3Y2uo4FdzLWEojAci7SQCpvAFCejiB1X1WLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=He57iCWM; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=idIHGn7n; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1765986177; bh=RSCtRs8TgOjsT3K2Y/WVmjl
	4TbTNW8R8apJYstd8PJI=; b=He57iCWMbAQdEjbjFwkhIWlYAk3+q++W3Mkq/GnHYbgq3roNGS
	w5puFAAh67ybzpiIP2T7Y9uQOwcywBW+sJL2yjo1g+Q56bdKptOcxR4zTUTk2Jt4mYGw35yGu2v
	jtzBFYIq9IuPb1ns5Rj2yqmQE+dhBWDlZVPKg2iWCHlKV5PPfayk2KzDRTmhTw0gu1GA+0QA1Fw
	KIyQ5JfiGYCiM1bLL2AHQjl8ckb6sVPRAMK9SYLbGgrA1/rggLrpSIZydmtHmIYpe2BX1f0oSSL
	01IGEA+oSC9J01K7xW3Sou5kjE4twC0L56UYKj68FuTWbF+Cknn3+NbAB+t7qZEAIRQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1765986177; bh=RSCtRs8TgOjsT3K2Y/WVmjl
	4TbTNW8R8apJYstd8PJI=; b=idIHGn7ndPXdHQxbdaycgBF1uwOL+9O0+Bi5zcFiqr/zUP/FU2
	KJedvunVB2cjZlW4/+n/2dERbyETihA7rSBQ==;
Message-ID: <8d98fe34-74fc-4332-bcb7-6c344064dbdb@mainlining.org>
Date: Wed, 17 Dec 2025 18:42:56 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Chenna Kesava Raju <chennak@qti.qualcomm.com>,
 Bharath Kumar <bkumar@qti.qualcomm.com>
References: <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
 <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
 <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
 <eddc16cb-d951-401c-8fb8-fccfcf600143@mainlining.org>
 <0b06f744-b695-43d9-8da3-4424e2b53a5e@oss.qualcomm.com>
 <24221ce7-24e4-4eaa-8681-ed9b4b9f2d6e@oss.qualcomm.com>
 <be4e2715-882d-4358-8575-374187f7ee2f@oss.qualcomm.com>
 <2h222ejvc37cldeno7e4qom5tnvdblqn2zypuquvadbcu7d3pr@765qomrwfvwl>
 <f0c41563-dcd1-4cf9-8b73-fb9fedd52710@mainlining.org>
 <bacb6293-a4e3-4d23-8a1f-cf42f221ba4b@mainlining.org>
 <8080bcb5-280d-459c-8877-5086129c87a6@mainlining.org>
 <eca6cead-111f-436f-8507-826ce48863c1@mainlining.org>
 <f6f788fe-af56-43f1-9810-e5f3327ff92f@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <f6f788fe-af56-43f1-9810-e5f3327ff92f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


17.12.2025 16:37, Konrad Dybcio пишет:
> sudo -u fastrpc hexagonrpcd -f /dev/fastrpc-cdsp -R 
> /usr/share/qcom/sdm660/Xiaomi/clover/ -d cdsp -c 
> /usr/share/qcom/sdm660/Xiaomi/clover/dsp/cdsp/fastrpc_shell_3
done https://github.com/qualcomm/fastrpc/issues/269

-- 
Best regards,
Nickolay


