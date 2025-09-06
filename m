Return-Path: <linux-arm-msm+bounces-72392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CA7B46A45
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 10:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C86091B249A3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 08:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3033D281351;
	Sat,  6 Sep 2025 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b="PCg0Yy7a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE63F214A64;
	Sat,  6 Sep 2025 08:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.126.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757148660; cv=none; b=YvENRn1Jv3zE+fKb0wPPCL3BfwtMbF9vIISmr8lXZUABKMc3NWyyfFM7buP1A8j9e5E3co03/n/dC0HN5Lg4QHpPjoyhd9UHeFHnYE2I28VXtnFvY6wHrHu6+KY0WH/jUKrZ7te2VA4PJnEWbsRXtUHDyNaNAQo90kaAPuwfdjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757148660; c=relaxed/simple;
	bh=Qk0Ugz0RYhBkqBiOH6TLDHgmGaQbSmhEOLE0qSMFHWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYRldk0pVvGR6SbcU986AXQv2dNgS8Oc5fH+pI3gpUzV7z1TQs8EgBl/o8sOBVZkHa9Dc0uQG092X9Nq1ig7jPWn42F1SF2jglOy47xwx55kYIWIglTAFGBW9cclEAmxBoNyzh1qEAuAgyaibwRlUCbRrZSsr/izURz8pptXnYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz; spf=pass smtp.mailfrom=oldschoolsolutions.biz; dkim=pass (2048-bit key) header.d=oldschoolsolutions.biz header.i=jens.glathe@oldschoolsolutions.biz header.b=PCg0Yy7a; arc=none smtp.client-ip=212.227.126.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oldschoolsolutions.biz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oldschoolsolutions.biz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oldschoolsolutions.biz; s=s1-ionos; t=1757148649; x=1757753449;
	i=jens.glathe@oldschoolsolutions.biz;
	bh=Qk0Ugz0RYhBkqBiOH6TLDHgmGaQbSmhEOLE0qSMFHWU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=PCg0Yy7aEVQfqQ/C5WJvqNmI/tCo3jbVB2b1miz1NlCBRn6SG3kKjvTES6Zt3WM2
	 Apid8PQ4ZquLxTS2HfRBzimRH0eK7n9ciuKsV5kr4J07ah6tkQtPlm1Y0ab1f+SpV
	 lc+tu7WKVrXl4YAzhb8DMGxnWX2Ru2fUV4lOsZ1nXnajSXPc8uPYYnoBU2BuoU70r
	 3UaMATrOM3ZSBd9mOiarIAQ8WmYXSxKKJk3Ni7t51z0gY/kEb9eXb2mltyAgYYMq2
	 ISk8f50BihUJt9oFvV67XiO07/F3v22lZdsTKca6bdq651H+l8s5oI3P7CQSWJf7D
	 BM9VBY+6KBVlDq3MrQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.174] ([91.64.235.193]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MD9nd-1ulhrc1W2j-000Zxp; Sat, 06 Sep 2025 10:45:37 +0200
Message-ID: <fe92c4e7-6a1d-4cec-a3d1-c50adff9f7f5@oldschoolsolutions.biz>
Date: Sat, 6 Sep 2025 10:45:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH RFC 0/3] phy: qcom: qmp-combo: set default qmpphy_mode
 from DT for Thinkpad HDMI support
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
Content-Language: en-US
From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j0IpGjLN4L2a45GZ4Oi2D2xcseqh1/fdJ7qcBOxJv2vVMhM8MPI
 EpBO8SBj3tyAMK+Is+Pmtt8Wi5b4FUilaiJsANMJVvZuB57mS3JWHGFFRv5e70Uya3g37MS
 OA5C1q440a5BfTq60NUoE8HZ6yyV1nEYoU6REgra5z0kMyjyH6xm6+3uYuHX2kSpRhYEJjS
 S3Do19QuJsF+bEpCo05JA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fEuuSSqziCs=;3y1J0TtGNwZ1Dcc3aDAySTMYPWd
 B7DYzP4KtppxCUMS28q5++WFXjj47xSFXtjEpaaLDfjZ1CpP2Xjcf0H2dmmmXg5dYAyTmmCpN
 32RpXL7Znx2a8vFZmBFC/xSYK8UMfRyVB+VU0I0qRjpzg+XDJ3A8BjDqtUCS5wFuXnFR0MRlq
 ZL/gGPQG9E+KeBQdWEqKjqgkqtc8+xit8RNEoWhAjBDJzxt0kwuqOFv4yuYNkR1ZMOD5cNZRt
 ZaoK3ZWvtm2uebbApMX3XlN0vDAuHfGK/7Ia1gDdtC2izB8ieTrUG40V14leNBLwYqhsHNGH6
 T7BhZNTl/DeLf+bZVch88vASjBmOaiU4so7eB/MdS7eOpSE/QQIyrCVx+JPl2vQ4Voq1zyLZ6
 S9f1XsdFRaoKtMrXLUxBqgWbxbzGsP4A2PCPIYaSWi0jYNKoDsqDZpjdz6MJqhOBtuywlCKT5
 dYOh/YBe+kCdmEKf69B7t2lKz21hk/JYlwUeeR33s8GaYGGh8JMkv+EBzHRlcPEPpcXk7jAnA
 JhZUKdCDyhNp751F+RZkPHbXpzOL7cceuOoStvJRGELzB5rGvASOVjv8gS4UxpiDB44jbgthu
 VavZT52g+x3kj5r4GS/K/fm9gtyHu3XNwwlQZeVJirmq4h3bn6UKP2vah3Gc6zHz0NoVgxNLj
 QfCT7oCCzM04RwjpkFPwyi0e43rvcH9bD6Lzkml3KKNIZ1ftdJ4jZZRXYuEHudU5iPf/8HzBi
 87uaJg8BjxzWPNUMDAPdbsNjaJ0oVLuT0BHSYW2zgD1tCJ9QaPGymo7DW4eZRk6ydXlP1u2ps
 ssB3L2qZKPKnm/ZTrl1N8NrTXR82Vx9MrxxI+ACELwqnx5/ks4KT+Zbm8S392h8xaNQx1bfW9
 DU2jLo8qbu1PUBV5L31XFbL1vOU1XUI/sfp/JXgUCvsjC9My8O6MxUiNUStaJ/qLT5hypSX9/
 14cA9TerZZxMEawWrL9v/Ax5oYGL5ppJK8/Qgxx4oI3gC60URF+kE6G/Tjx9BVUSfhEt+FOdi
 dfVSlStO3X9uh49m2bxEVn0cXscm0nf2uIGoBvqT11ub1u5/+BejpaI6Jx6q6771TZcXV2Kr5
 G7ubeGXoIIe1rRLsa6WxCoDd//HS5HU9MbYTK5RPdwXXMQSlRA4y0/Uiaq+8i0HPRSZAVXrzh
 tUjw6pqEAILaUhOOR3ozdXjrTYnSYt/3Hq8eSZSRJmm69e/L7/oLQw1/JVeEcFCwP96avTxAM
 Wyih74u5IU/n7zZSFYMGqV0VnslCNoWkZ8I43uEC5fUTpMyNyzHULQE88FHzV2lYbpgQBQWd8
 sHCPzSQgOkLZmmVMbSHo+CzX+eGtlsxL2t8foSkpckIc5ODtvWbRHFHo3NS+j2VY0xxD8GkBR
 pF3C+FfrpS6nwxUa15tTXuvjeKaYw2iDHhlRScwm60pvuMVPll0Bt7PEXN7Il65TCLpk1zGSa
 kVLHHusHwfsZR8bW4MXbNjX2UevYoIpGm1+SxsvMCTFkXYjmVgCV5rsuXrfvZP50FVBBep854
 hlB904PCRqwKjNvvAmjllv+C4sy2XiVrLbA9plF7a+eaUFBY4D+M0lcuG7wH+Y0MSQmI12acg
 4wlpKFUmzPGzGxuRcwqvbvPL0gCRpcMtpT08lsjC5ADMiCFOzd+pTwJ/PN+LjJlpfvL7B/Sdk
 ge2eWSlP6ctPtQc5gN1FIiJGSXLdWi7/oDpAE9OCDwN2/BLcmRk/f1Ne75ud16AllXApUGewV
 o/fk08VTlXqrhR6DsqkO7y/mK5jFg7ts2nXapcEJc83EK/kTp/THMOe8=

On 21.08.25 15:53, Neil Armstrong wrote:
> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> connected to the third QMP Combo PHY 4 lanes.

Hi Neil,

thank you for the patch. Integrated it on my tree and tested on the=20
T14s, working very well. Also tested hotplug and suspend/resume.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

with best regards

Jens


