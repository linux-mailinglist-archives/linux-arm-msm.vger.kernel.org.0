Return-Path: <linux-arm-msm+bounces-52769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFEFA74AAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 14:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7392217834D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 13:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67EE022256D;
	Fri, 28 Mar 2025 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="V+ct6d2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31632222C7;
	Fri, 28 Mar 2025 13:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168513; cv=none; b=SFGz4ur9oJLm2ekkZGLUSX9hUp1yEdK7gkb8kNHTJoYf14FepacRGPkjy1flRBz6+ZbRSon6yjguMeFI5kwbi1IW1jBsgrkaqPIk6xrUiK5Iz4bsiwqmW3niudd7RRpy25seeJFBHrjcX7lSSgG6HJ+rWHoJuTSmx2CXFJFMQcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168513; c=relaxed/simple;
	bh=AmiIbt/wN7iOY/s7foyX8kzAk2TSDj8J5sMRc0KGCao=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=EnKoUnHmXU1NpmlA/MOw4VsKGn+PbJYWxi/qe3/58Tk83j+3J39QXkg/L+aIw3uE9r7CbeAnTo9MR8sWea58IXfgOzRNroD0cnYm6sYy7uplr4OpYF+QpDyrg0Wz48JsLNklTHVrCXDGNdyYpyCdfcCtcA46yJs0Hl144T70Wxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=V+ct6d2a; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743168496; x=1743773296; i=markus.elfring@web.de;
	bh=IpfDNgazgXXBhb3QCNRjJJD4rFulvC5l9bpTYHKG/4I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V+ct6d2aiYPipLyNzTJIGp5xE3blwGV4MJzi71wDjLMjqIfaEpauAS4lUBBc5IKw
	 PesrvwSg3KCuHnHl8neZQscEK+QbLdvVIAUvuB5OZUf/URsJbSYX1TkJpUMe1FA99
	 0R6TwfI5+RTbgePAExWvKb0Re2vN8hGvn4fJ76nqPyJGRGVhU4aCwZ469b3bX5mrU
	 SkgVnvlZKcZVFVcl9DMGo99gU8qW6MVw3CccwZCHB3CxT+EhkvVhSngO8uVstH1qC
	 vEhRT7Zc9nYWmEGvlCqNwXaYlxyg+AB9AdIY0skgqo/g1GieSj9mdujNl/kM0mDWV
	 2/tQyNylINfPRKsyIg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MeDMb-1tNRlH03Md-00b2Hg; Fri, 28
 Mar 2025 14:28:16 +0100
Message-ID: <06545fa2-7f82-4154-a882-faddb53df4d9@web.de>
Date: Fri, 28 Mar 2025 14:28:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v2 2/3] i3c: master: Add Qualcomm I3C controller driver
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cT4tjGtvJXvSRL+OUV0lx2UA5LnpeNz7q6/InzNnyiHEeviRrrT
 J5NFpTF815mDYWMO4nPeGSD+QWvucLhYGTqXjab/uxjKLQs+S+00/gVECE65Ll0VkcaBJ13
 3O69z7LlI/4kiHqQB0J/15AuLEWqpqTotzAjYKo7DSXrGgpATtje3q3pelLnJc74ZIWTwWK
 5bbY3ik9lh+qlhh2hkwCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VOlzgvrPiWw=;l+7eWe+iFzWKRZ3mRi7dimYU2oq
 grhkx9vsw/VEsjtCEXy54VQHpRClnNXV+HsR9CxvgANjp4EF3yKVRZOHULbMauoT8pJnnaooT
 26PitrDifSc990DwYDszXFag//F4MEJqvQFvQATnpP63nvBnufBWMaJ9lAfeD/W8HqNNa9QFp
 Wv4UUqLu5ospDIjmuWKH1ztIa6nRdFA4aSH77Cfrrea7EFQC4Yfhq99WXoI04ntItmb5LpWwr
 p3XiEo5ga1keYYYM5/g8ystw+oZWrIzac4taLPppQQSZMkXHg1i1a0I7+0ZLUpbrUgJcZLzXO
 5tR5w7hc6ierey3WTEXDSwEmn4G/LrevpBdHbCPbdq9ZF0BVnaHyjnK5HVXVdUcpW2xigWnaw
 /aWWZ3N9Q8lx1wUhvCcpdlULI+BdHafdtv5DttCKdGPvXn3bSGNpisCZk1eRvXCQTSo9AD3X3
 iJvTzfdgV3N7fU9fpJbvExMIQQKfMqApC+aXhE/u/hI8w9MBvl9UKh7zxk0rfN1mRKrGPD3Ay
 LBOpYj36D536AY0oUl/iVwgBiwI+uCMvO5/rRMbcTcRO6OwAPl0cit1RTyOQTnp7Zxcu38VHX
 9a2x3tvW6MnCiRVtLm63UNVzza4gPL7tLr1g/JNC1BPO+xNfEW7HV6JttUvUminTVKYw4WT6F
 kM+VnT++9dayUzuzO0zugVmwl02ktS7qWjNhFKFQwfHVh4Z1dDiCK40teZbGA57CREoYXPD0s
 PaswK4GWhPRj2JijkOdxI+cyIDafIfVblEzE2bJMQ4X78MOmp5yKFT/vl0AGp9Bts8kBZENLg
 sN38PcnpJXVZsAGGODKy+sKtRsCd6VPdO7L5GeKe6qUTwsaSNyTux6jZTZpMtxHSHPgwI0dJq
 1ucUB5aSYQ39vjc7k/LrH8GeHQMdeyoJjGsLFqxrEpAAV6mzM/S0asiXAVjsGdZ2P0zR1y2AZ
 PmYGR6kidtZy+1PlaFWBaG/XZLzz4XwvOqxJukKRxEscdnaRypUufwnfWXeJtOH8vn+t+99C/
 E4YuQq7a93OA3XFC6Sv5MRzbFjLN9jluFbuWR6iYF4bHvQiERfh80Tom2mhKwm9ED8NuBrxvu
 7oIPpZ7UgcGx8mwYDi6A39hw4JojweAt+HoBteW4kYoHRDIZvoMtzG/d7gMZbZo+f7Kq+BQCH
 wmSjV6WcqsG6r7vSt0ApWNjislltguxytljGvqGFIX7RBLDOk8D3Rg6SEtFkCrGf7NOJnhUPo
 d/kKoneAZ6TfdgqD7vZbRvfgdrWJcIo6AHRt7E5IM802j0a8Ndylp7MNeKh8ERifVzWx5GOTS
 tHV5e2/sh04YF//+YEfFTL/TvC8N51HOE4W+TAcQLQ3VeEMnI2OF2Y37YeqHmPWgFbMLnnti5
 toB+RCOs+2qe5s7SPYCbAuSfxuRtNcZZvsR7b9t5BY6kLbYjfTtw39fGX33e4aN9eB4L34HC/
 FIAzafpxCJg0qAp0Lsa25iy08tYcpQ0T3C0242WpeAmb4Aao4

=E2=80=A6
> +++ b/drivers/i3c/master/qcom-i3c-master.c
> @@ -0,0 +1,1107 @@
=E2=80=A6
> +/* M_CMD OP codes for I2C/I3C */
> +#define I3C_READ_IBI_HW          0
> +#define I2C_WRITE                1
> +#define I2C_READ                 2
=E2=80=A6

Can an enumeration become helpful here?

Regards,
Markus

