Return-Path: <linux-arm-msm+bounces-82984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CF377C7D81E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 22:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5A93F3500F3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 21:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F76026F2BD;
	Sat, 22 Nov 2025 21:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8qre7YW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B6523D7C8
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 21:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763848291; cv=none; b=edPE9HEn1OIOVSmki4UW4wUo3usq4Fp9/0+ZBdfXZVKdK5+53/b/cTZLFVR7NyuEBs+EcsDDh8uMhD90XTOOUwFsiaVulz4Mq1bH3eRylrjRNvQ+pocGnEKHt6e5qj4fc9YaOO6SYspdvAsACTfe37SncpIdRk78peI/eVNCoqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763848291; c=relaxed/simple;
	bh=sgIGC0pQx5M2+++y/D5666fONd9fLNscGXvum9j6Anc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLYmKuVTKnofaLUz+vpW17BJ+m9bD25cbiN8Qu8Ekq6u019LX24MUxsDCZZHKAEAZTAlLHaGvdrxftRHRHvlO/OPzOt/PVbg2cTiQFIEtAFq+Lk3fk0gIsb7HCsP87ELa7+u6srmrgUllsSYeLbH1wwsiLvZz0nuRo3aO+KbO/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8qre7YW; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2a45877bd5eso4341931eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 13:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763848289; x=1764453089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sgIGC0pQx5M2+++y/D5666fONd9fLNscGXvum9j6Anc=;
        b=H8qre7YWXECjV2XKmM/zMdc66gtRk5hsMoFPocdXklN2bUu3ZFfrMFiZgIN5yMzSp+
         TWF2OcqqjBhVDO5o1098hpfH3l3TlCxKf61QLS6Mm8GPou86dGBYJ21sQjAuAPALuVzC
         TJavc9LocRQQoj6apmd4awXhUyt2e1eCykBJ+df+5OZk7i8xN/ss6X0pi2t8UM/GFRZC
         esZPGP+pcCePgVxjiylCf5HW5vED2FUCjthOyAcPC6ICGy860qKbzLFt4BJtXbI4V3dM
         IoGH3XNCvElAX27GZFxmRTt9gxeih7Kh07vQHol7mRK6W4+ZQSUmTz+euP6rtSDEDx4q
         4QiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763848289; x=1764453089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgIGC0pQx5M2+++y/D5666fONd9fLNscGXvum9j6Anc=;
        b=C4OQm9yTv4Z7sgmJ/NZwbnhACIz/0oY2h4nW+QyVyTpRZ6dN6PmhZsAfegYuYxxydW
         hSywsTp/9xJa03Fs5A6vqsrJ206gJFGZCQS8dQVbAeoYWSWYPj1+H3FbqyFsqe+Er4xb
         kkbk425b6t2mStQSD0lbOtGhi0RQ84vVhd3r14Jvca8/tcjix35dNlGdPFpSTkM+DhnU
         Q8qHtYuCXcGlXIg8vATbuWxU6TYQEHrWcuA6G4+5i6vJIfEz49z9oDedmXKCkX0jDuUM
         MrSyztdt7pUBDmsdihWx+OSHgankn9RGdcisvqhZ58UZ9RudfgdGydZxDfFcZyrLydt+
         a0cQ==
X-Gm-Message-State: AOJu0YzWWMXIkOM6RVwCYXtQM1f4uEB5FjaOC78rHQhf+eYjwBszoOZl
	HVHZs93Ksht6RHmc4z/wlrd55P7p/G+q1TUqmkZeZPUjmypTA3jAAKgE
X-Gm-Gg: ASbGncu2G5gYJahNmVMzLfwz9QYSTm93UUzngdd7ul9B2O71qOmRxCLfhmT4JT6sp9z
	GOSmEYPt4anu1gSPRQ4VXrh3FzZG+1fh4NGhASgw7IQvU0e7MkVISZMzrdK9PetrlNk3iUuUPr9
	W1snS6AySkooOy7PVbHTk8VTx50JRsnUkrJg5YN7BThWovlpDaQXe7ryxWi8yTpP78S9mkzHHZw
	qrlnoDLDOsLY3J0h8gcI3jBDJjK8ZEkhL9HfKZps1bVlWVjlK5fKZLIcl2v+Z22kndh4LCYiYNS
	CekCceR4C8LXyU9K3KyC9YzEdIsDheq2gdQgAQpXEQ3JH6MycQqV4FWx6K0E2Gkb6M3YsQ74Ef1
	tfhSPYaeM4RvYRzef0L8OZ+5BxWxxsowJlNcgkIrMT0iOMbBQP80IhBzjnSTWRp6OGKlz28V3vv
	Cpe6Z7ZCUkwOfWEsMmiHGoIkQBl4TKVSLdH1G84l0R3OFBTgDyVeVz4f93FRIG86XTYSwZ+DbZp
	Lc=
X-Google-Smtp-Source: AGHT+IFNDEEwf7OottYcIuM1xeiwS9j2lNcjBQFtNr/OAXdk+p4eWElY7PjIFeGssqAr89WCo0/fsQ==
X-Received: by 2002:a05:7300:a2ca:b0:2a6:a306:efdb with SMTP id 5a478bee46e88-2a718576e14mr3775499eec.3.1763848288539;
        Sat, 22 Nov 2025 13:51:28 -0800 (PST)
Received: from [192.168.68.63] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc4f6671sm45238184eec.3.2025.11.22.13.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 13:51:28 -0800 (PST)
Message-ID: <836fac14-f396-408a-b7b5-7581e2e7244e@gmail.com>
Date: Sat, 22 Nov 2025 13:51:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ARM: dts: qcom: msm8960: expressatt: Add more
 peripherals
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251121-expressatt_nfc_accel_magn_light-v2-0-54ce493cc6cf@gmail.com>
 <b67e579f-1bf6-43d3-bddb-caf2989086cf@oss.qualcomm.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <b67e579f-1bf6-43d3-bddb-caf2989086cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> ---
>> Changes in v2:
>> - Fixed formatting issues
>> - Use GSBI instead of i2c-gpio
> I'm assuming this worked out fine for you and the devices are still
> fully responsive?

Yep! Working splendidly, thanks again for the review :)


