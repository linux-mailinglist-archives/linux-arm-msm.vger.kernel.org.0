Return-Path: <linux-arm-msm+bounces-75205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9715BBA1A59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 23:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B6397431B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC493277B1;
	Thu, 25 Sep 2025 21:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j68Vua4S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0204326D74
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758836250; cv=none; b=ICzInHECwhKdNqaoUk6nt8+ONp25Q+VbgntUDbkwj22BSP+C0saTfw/8NCs/s0GT9MrMHhiaKtvD3MOYCyYLBLq6Uf0W37ZjLem9rOW57rhtRnuiyaT9IZTnvKNXWnHCl0sYzxHwQNIbs988DiFJ5CSp7rODce8j+8EvihRZZgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758836250; c=relaxed/simple;
	bh=KWj5SMGs9GL6SGPtfMBXs29Ozf1AF6eboLKHNyGz8DA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JQiDURymugCor7ZaJayx1RBqITMOpE+YtHi6xcvdtIOWBKyS8/T0hBKR/ToowxPglvVJuZv8+wYnPYb9ovQZ8QB752UIKXn1UqHziE6L3J495JV0I1SwEVNcNC9dd4MOBYg7ggTbSJCPR+oEbBRN+2/hT4w8vy+7cuMOH8VgC54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j68Vua4S; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27ee41e074dso8213375ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758836247; x=1759441047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZYcUucsu2Uq27Rmf/o+v2BRybHVFSFbw/IMvqqBLJ38=;
        b=j68Vua4S6pwna6zSAjkq38J6bJvaWkPrC+dqRLmlW1aTi8XQ3zW/v3KLtKrUYbYYhN
         VAlThZJ0Lyu93dgvGX3M8bKgujNl06GqirjstC2MRo3YBFiq7dWGzlNFmqPvahpJHm0R
         HMiLST4P+B6nJARQ4iGvAb0eZa6SM9oPPVu9PqttYX7vyFkYSRb01caCp4f2A6R1vkTs
         yAHSYe6hqjgNMmcS+e73XiyCyYGJisTRlp7y6bqCXFFNmhk805Imd7V5vBFm1yjV0V6s
         b5RwAjXoFS3RU+uDQo939HBuz4IeDLJMmSQxrwrJlaW0cjUAQt+jrwNwkgkmZFmqSV9l
         qXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758836247; x=1759441047;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYcUucsu2Uq27Rmf/o+v2BRybHVFSFbw/IMvqqBLJ38=;
        b=lz9GujDZEr8eKsrUTe+6JVSdAYjlObHiSUSqo9VAuC9Kndk2JChcGME+q6P94bV08k
         AdnPKPFEwdHqePQWYx/1COVbUY/wEL2Qacjhlm2vm23nf3/aZNhe8rtjpCeNrlFWKDRB
         83vYbPt3qkqTRZNtWEi6qdgvQGzYr88VsO5b69XfXDwnQH+VSlYX8pzlIsD5CEl50MY5
         zDuoRGYN5k318zy9km8IlkztaETbwAIM/vQvij+AE7A4ktPFn1RRKh9irW7pRqDqnCkQ
         rcqpabFpq+1/vKMVElhS5pIKk8vsG/ndidqOvaU8hti4c2VLr+Kz2X4Rm+oZ5yZ1cJCb
         RzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVw3k1qBtkmkzRrUqFuHrLw1TIRXEs+4lQ59eXU0sfxfAZcUvM5m2eqkLeVi4uswOGwhLCMhjiky/0r0Nz@vger.kernel.org
X-Gm-Message-State: AOJu0YzjJz5Wyl8oSbM3CSV71Yec48MsWFo41mxe7W2gSjSY2+4xW5C2
	MvpZUXvemBj6+iyId8RYOVesAv0dhZ8IXn63uf2nYTKy11n2xBbQrr/n
X-Gm-Gg: ASbGncsooGHhVQu32XsC6J2PVPgc7ogTFMBn3a73RbraMliAi4XPKWDVXdyYhSq9F25
	8218S46eFSoQE+FSp1xKJ9I19lobxIcJ1oWL/gGmNxpXpt3wy/WT4zv2fuT8G2dHeH14hCJxZVl
	HXNEDtY1N0pkoe3fiuDuh3etA1PLbUFsezGsHfQWvjiNAv0Yyg7tL1y8jWk1nwdvSzZFMbHZLqt
	hn0U32+Vi68J1djI3EVbbbR6nAqOfgsWjeOKRu+CMjJ6fCRMvCmEgCBJKxD+L8XnWfixb5yPbqL
	jqfyMJjfEuy50vuNKiwTxbovAd6cUEIiETylVBtcuRaBG79s1sMFYspAL7p3zYAfUH3VXcTTasW
	wk02gd9a5Tr7tKwGf39Bm2gqRiaUe5V1wlw==
X-Google-Smtp-Source: AGHT+IG+2KEihIk2iYcF1rjTLu4O96y/VVkFEcf/JLe3idjXIjtbiAgmixKfzknuBISuyb0xDfvIpA==
X-Received: by 2002:a17:903:1a2d:b0:25a:24f2:af00 with SMTP id d9443c01a7336-27ed4a06c8fmr52614235ad.12.1758836247107;
        Thu, 25 Sep 2025 14:37:27 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:18:161:d250:a5b8:b662:f3c3:afe5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6725bbesm35180615ad.60.2025.09.25.14.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 14:37:26 -0700 (PDT)
Date: Thu, 25 Sep 2025 18:37:23 -0300
From: =?ISO-8859-1?Q?Eric_Gon=E7alves?= <ghatto404@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] arm64: dts: qcom: r0q: add touchscreen support
User-Agent: Thunderbird for Android
In-Reply-To: <b3151086-206e-4520-9a52-04591478de0a@oss.qualcomm.com>
References: <20250920014637.38175-1-ghatto404@gmail.com> <20250920014637.38175-3-ghatto404@gmail.com> <b3151086-206e-4520-9a52-04591478de0a@oss.qualcomm.com>
Message-ID: <FFAB92D3-5808-4683-A095-00D1EEFEE962@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On September 25, 2025 10:08:37 AM GMT-03:00, Konrad Dybcio <konrad=2Edybci=
o@oss=2Equalcomm=2Ecom> wrote:
>On 9/20/25 3:46 AM, Eric Gon=C3=A7alves wrote:
>> Enable the ST-Microelectronics FTS2BA61Y touchscreen=2E This patch
>> depends on "Input: add support for the STM FTS2BA61Y touchscreen"=2E
>>=20
>> The device has an issue where SPI 8 (the bus which the touchscreen is
>> connected to) is not working properly right now, so
>> spi-gpio is used instead=2E
>>=20
>> Signed-off-by: Eric Gon=C3=A7alves <ghatto404@gmail=2Ecom>
>> ---
>
>[=2E=2E=2E]
>
>>  &tlmm {
>>  	gpio-reserved-ranges =3D <36 4>; /* SPI (Unused) */
>> +
>> +	spi_clk_tsp_active: spi_clk_tsp_active {
>> +		mux {
>> +			pins =3D "gpio30";
>> +			function =3D "gpio";
>> +		};
>> +		config {
>> +			pins =3D "gpio30";
>> +			drive-strength =3D <6>;
>> +			bias-disable;
>> +		};
>> +	};
>
>Drop mux/config, put all the properties right under the pin definition
>
>> +
>> +	spi_clk_tsp_sleep: spi_clk_tsp_sleep {
>
>Underscores are forbidden in node names, use dashes instead
>
>Konrad
Will do, thanks

