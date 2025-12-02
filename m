Return-Path: <linux-arm-msm+bounces-84119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A20B8C9C98F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 19:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BC3C4E34F6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 18:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D9229BDBC;
	Tue,  2 Dec 2025 18:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="O2yvXUuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604DD1DB356;
	Tue,  2 Dec 2025 18:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764699597; cv=none; b=LaaPsp+viiPNuLGcS0lSpngZ7Cl5161nZbiFb9zxsB2KycUPcSFhis9mQT/WRBWfddiUeBw6CZZzEWqiim1xUbHZsHHVKfYtv/zsB0fCmt/rueQABZY7T+GWnvmRIlhBd8UKZ5L7k9G/RH28mXZuAmrQx2Dz7tFWZNJ08xTxRoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764699597; c=relaxed/simple;
	bh=u+3XCDIXK0lDNht90YJ7AbRg9NnrHYFXthdbyWbjqNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cs9CGGeMcXe5WFgc8uZqkL7LXBMC2zUEni0CBfm7TDlpq9qzKt58fKupKeHwXI+dtxyC2QKBNr/1E2/1ocHGgm/VMxA3TJ0DZZa/sa0XEUxewRv+5C640XtnWVIi4TSKd4J1gw3+FR6noUiuy3uZNmRndDKQQkm0gB26UwwnN3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=O2yvXUuN; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 822942FC0061;
	Tue,  2 Dec 2025 19:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764699592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gbRu+GlX0px21xJv1xLY/Gx9mv3Wjfi8h3wuYaGAEKU=;
	b=O2yvXUuNh+fi3fgqXCdOrJWn/3c1g44tCcEJowd2HwOQiKPvky2zk/2xuGq+fq1/XBTxMl
	vZvjTxkzUZAYvmuEmlw2Nz+UoAMY7v21vonc74K791Pe0QpxOEikINxT2Jzx4xPqeAH0KT
	JecyUoInmGh3mvDRvjNQ1LjybvWLU4M=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
Message-ID: <02e37578-e8e3-4d12-a553-0d7a594f6c80@tuxedocomputers.com>
Date: Tue, 2 Dec 2025 19:19:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Medion device
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Georg Gottleuber <ggo@tuxedocomputers.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
 stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de
References: <20251202143757.69817-1-ggo@tuxedocomputers.com>
 <20251202143757.69817-3-ggo@tuxedocomputers.com>
 <e1cee0a8-6d13-4cb1-a422-b95ba558f4f0@kernel.org>
Content-Language: en-US
From: Georg Gottleuber <ggo@tuxedocomputers.com>
In-Reply-To: <e1cee0a8-6d13-4cb1-a422-b95ba558f4f0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Am 02.12.25 um 17:09 schrieb Krzysztof Kozlowski:
> On 02/12/2025 15:37, Georg Gottleuber wrote:
>> Introduce new binding for the Medion SPRCHRGD 14 S1 notebook with
>> X1E78100 SoC.
>>
>> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index d84bd3bca201..95cc1d00fb1f 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1067,6 +1067,12 @@ properties:
>>            - const: qcom,x1e78100
>>            - const: qcom,x1e80100
>>  
>> +      - items:
>> +          - enum:
>> +              - medion,sprchrgd14s1
> 
> 
> Your cover letter says this is based on Tuxedo laptop patches, thus just
> squash it into that enum.

Yes, will add it in v2. But without the tuxedo vendor prefix, that
probably doesn't make much sense. So I'll add it back in again.

> Best regards,
> Krzysztof

Regards,
Georg


